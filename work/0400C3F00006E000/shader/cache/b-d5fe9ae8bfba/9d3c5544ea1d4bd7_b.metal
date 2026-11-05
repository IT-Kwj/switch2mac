#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _977 = false;
    bool _419 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1665 = as_type<float>(_101);
        out.gl_Position.z = _1665;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1734 = as_type<float>(_137);
        out.gl_Position.z = _1734;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _143 * _141;
    float _165 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _167 = 1.4012984643248170709237295832899e-45;
    float _169 = _145;
    if (!_155)
    {
        float _171 = _145 * _145;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _179 = _165 * _157;
    float _181 = _175;
    if (!_155)
    {
        float _183 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = floor(_177);
    float _189 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].y, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = _189 * 6.283185482025146484375;
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = in.m_49.x;
    float _199 = in.m_49.y;
    float _201 = in.m_49.z;
    float _203 = floor(_189);
    float _205 = _193 * 0.15915493667125701904296875;
    float _207 = -_187;
    float _209 = _177 + _207;
    float _211 = _195 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _205 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = -_203;
    float _221 = _189 + _219;
    bool _223 = !_155;
    float _225 = _185;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _145 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _145);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_155;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _145 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _169 = _279;
    }
    float _281 = _169;
    float _283 = in.m_53.w;
    float _285 = in.m_44.x;
    float _287 = in.m_44.y;
    float _289 = in.m_44.z;
    float _291 = fma(_217, 0.5, 0.5);
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _299 = _297 != 0;
    float _301 = fma(_213, 0.5, 0.5);
    bool _303 = _209 < 0.5;
    float _305 = float(_303);
    float _307 = -_291;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _311 = -_209;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_295;
    int _317 = _315 ? 0 : 1;
    float _319 = -_221;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _323 = _221 < 0.5;
    float _325 = float(_323);
    float _327 = -_305;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_301;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _339 = abs(_317);
    float _341 = -_325;
    float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _345 = !_161;
    int _347 = _345 ? 0 : 1;
    float _349 = fma(_281, _197, _335);
    float _351 = fma(_281, _199, _337);
    bool _353 = !_299;
    int _355 = _353 ? 0 : 1;
    float _357 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _359 = abs(_347);
    float _361 = fma(_281, _201, _357);
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _365 = fma(_349, _283, _285);
    int _367 = abs(_355);
    float _369 = fma(_351, _283, _287);
    float _371 = float(_339);
    float _373 = fma(_361, _283, _289);
    float _375 = float(_359);
    float _377 = abs(_313);
    float _379 = _371 * _377;
    float _381 = abs(_321);
    float _383 = _371 * _381;
    float _385 = float(_367);
    float _387 = fma(_375, _333, _379);
    float _389 = fma(_375, _309, _383);
    float _391 = abs(_329);
    float _393 = fma(_385, _391, _387);
    float _395 = abs(_343);
    float _397 = fma(_385, _395, _389);
    bool _399 = !_363;
    float _401 = _365;
    float _417;
    if (!_399)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _405 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_85);
        float _423 = 1.0 / _421;
        float _425 = _119 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _431 = _427 + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _435 = _427 + _433;
    float _437 = as_type<float>(int(gl_VertexIndex));
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _455 = 1.0 / _441;
    float _457 = 1.0 / _445;
    bool _459 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _461 = isnan(_427);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = 1.0 / _449;
    float _473 = _431 * _455;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _477 = _427 + _475;
    int _479 = as_type<int>(_437) & 1;
    bool _481 = _479 != 0;
    int _483 = as_type<int>(_437) & 2;
    bool _485 = _483 != 0;
    bool _487 = _139 > 0.5;
    float _489 = 1.0 / _453;
    float _491 = _435 * _457;
    bool _493 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_427);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _507 = _427 + _505;
    float _509 = -_469;
    float _511 = _509 + 1.0;
    float _513 = _477 * _471;
    bool _515 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _517 = isnan(_427);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _503 * _511;
    float _529 = -_503;
    float _531 = _529 + 1.0;
    bool _533 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _535 = isnan(_427);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_525;
    float _547 = _545 + 1.0;
    float _549 = _525 * _531;
    float _551 = _507 * _489;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _557 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_427);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = _567 * _547;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_575, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _589 = fma(_571, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _591 = -_543;
    float _593 = _591 + 1.0;
    float _595 = _543 * _585;
    float _597 = fma(_579, _491, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _599 = fma(_555, _491, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _601 = _587 * _595;
    float _603 = _589 * _595;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _605;
    float _609 = in.m_53.x;
    float _611 = in.m_53.y;
    float _613 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _615 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _617;
    float _621 = fma(_607, _513, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = fma(_597, _581, _613);
    float _625 = fma(_599, _581, _615);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _631 = fma(_619, _513, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _637 = fma(_621, _549, _625);
    float _639 = fma(_629, _551, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _641 = fma(_631, _549, _623);
    float _643 = fma(_635, _551, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _647 = fma(_639, _527, _637);
    float _649 = fma(_643, _527, _641);
    float _651 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[147].y, _647);
    float _653 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[147].x, _649);
    bool _655 = !_485;
    float _657 = _655 ? (-0.5) : 0.5;
    float _659 = _651 * _611;
    float _661 = _653 * _609;
    float _663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _657);
    float _665 = _397 * _659;
    bool _667 = !_481;
    float _669 = _667 ? (-0.5) : 0.5;
    float _671 = _393 * _661;
    float _673 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    float _677 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _679 = _673 * _663;
    float _681 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _683 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _685 = _677 * _675;
    float _687 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _691 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _693 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _681);
    float _695 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _687);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _689);
    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
    float _701 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _703 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    float _705 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _707 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
    float _709 = _701 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _717 = in.m_51.y;
    float _719 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = _709 + _713;
    float _723 = _711 + _715;
    float _725 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _727 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _729 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _731 = _721 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _735 = _723 + _733;
    float _737 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _725);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _727);
    float _741 = _731 * _731;
    float _743 = _735 * _735;
    float _745 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _749 = _741 + _743;
    float _751 = _745 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _755 = _753 != 0;
    float _757 = sqrt(_749);
    float _759 = -_669;
    float _761 = _487 ? _759 : _669;
    float _763 = _747 + _751;
    bool _765 = _717 > 0.5;
    bool _767 = !_755;
    float _769 = _767 ? _669 : _761;
    bool _771 = _757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _773 = _761;
    float _775 = _669;
    float _777 = _717;
    float _779 = _751;
    float _781 = _709;
    if (!_771)
    {
        _773 = _743;
    }
    float _783 = _773;
    float _785 = _783;
    if (!_771)
    {
        _401 = _741;
    }
    float _787 = _401;
    float _789 = _787;
    if (!_771)
    {
        _775 = _721;
    }
    float _791 = _775;
    float _793 = _791;
    if (!_771)
    {
        _777 = _723;
    }
    float _795 = _777;
    float _797 = _795;
    if (!_771)
    {
        _779 = _763;
    }
    float _799 = _779;
    bool _801 = !_771;
    float _803 = _799;
    if (!_801)
    {
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _809 = _757 + _807;
        float _811 = _763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = rsqrt(_749);
        float _815 = _809 * _805;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _817 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = _813 * _827;
        float _831 = _825 + (-1.0);
        float _833 = fma(_731, _829, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_735, _829, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _837 = _831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _841 = _833 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _845 = _835 + _843;
        float _847 = fma(_763, _825, _837);
        float _849 = _841 * _841;
        float _851 = _845 * _845;
        _803 = _847;
        _789 = _849;
        _785 = _851;
        _797 = _835;
        _793 = _833;
    }
    float _853 = _803;
    float _855 = _789;
    float _857 = _785;
    float _859 = _797;
    float _861 = _793;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _865 = _853 + _863;
    float _867 = _769 + 0.5;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _871 = _869 != 0;
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _875 = -_657;
    int _877 = _765 ? as_type<int>(_875) : as_type<int>(_657);
    float _879 = fma(_865, _865, _855);
    float _881 = _867 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _883 = !_871;
    float _885 = _883 ? _657 : as_type<float>(_877);
    float _887 = _879 + _857;
    float _889 = _881 * _645;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _893 = -_885;
    float _895 = _893 + 0.5;
    float _897 = sqrt(_887);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _909 = _895 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _911 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _915 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _909 * _873;
    bool _927 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _929 = isnan(_897);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _935 = _931 || _933;
    out.m_58.x = _915;
    out.m_58.y = _917;
    out.m_58.z = _919;
    out.m_58.w = _913;
    out.m_60.x = _921;
    out.m_60.y = _911;
    out.m_60.z = _923;
    out.m_62.x = _889;
    out.m_62.y = _925;
    float _937 = _905;
    float _939 = _861;
    float _941 = _911;
    if (!_935)
    {
        _937 = 1.0;
    }
    float _943 = _937;
    bool _945 = !_935;
    float _947 = _943;
    if (!_945)
    {
        bool _949 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _951 = isnan(_897);
        bool _953 = _949 || _951;
        bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _957 = _953 || _955;
        if (!_957)
        {
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _961 = _897 + _959;
            float _963 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _965 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _963;
            float _967 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _969 = _967 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _971 = 1.0 / _965;
            float _973 = _961 * _971;
            float _975 = fma(_973, _969, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _947 = _975;
            _977 = true;
        }
        else
        {
            bool _979 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _981 = isnan(_897);
            bool _983 = _979 || _981;
            bool _985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _987 = _983 || _985;
            if (!_987)
            {
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _991 = _897 + _989;
                float _993 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _995 = _993 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _997 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _999 = _997 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1001 = 1.0 / _995;
                float _1003 = _991 * _1001;
                float _1005 = fma(_1003, _999, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _947 = _1005;
                _977 = true;
            }
            else
            {
                _947 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _977 = false;
    float _1007 = _947;
    float _1009 = _747 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1013 = _853 + _1011;
    float _1015 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1009);
    float _1017 = _747 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1019 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.5);
    bool _1027 = _1023 || _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1031 = _859 + _1029;
    float _1033 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1015);
    bool _1035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    float _1045 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1017);
    float _1047 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1049 = _861 + _1047;
    float _1051 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1053 = fma(_1013, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1055 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1045);
    float _1057 = fma(_1049, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1059 = 1.0 / _1051;
    float _1061 = fma(_1031, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1063 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1065 = _1049;
    float _1067 = _1063;
    float _1069 = _1007;
    if (_1027)
    {
        _1065 = _1053;
    }
    float _1071 = _1065;
    float _1073 = _1063 + _1051;
    float _1075 = _1071;
    if (_1027)
    {
        _1067 = _1057;
    }
    float _1077 = _1067;
    float _1079 = _1077;
    if (_1027)
    {
        _1069 = _1061;
    }
    float _1081 = _1069;
    float _1083 = _1081;
    if (!_1027)
    {
        float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1087 = _747 + _1085;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1091 = _709 + _1089;
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1095 = _1087 * _1087;
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1099 = _711 + _1097;
        float _1101 = fma(_1091, _1091, _1095);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1099, _1099, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = -_711;
        float _1113 = _1111 + _1061;
        float _1115 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1117 = _1115 * _1103;
        float _1119 = -_709;
        float _1121 = _1119 + _1057;
        float _1123 = _1109 * _1117;
        float _1125 = -_747;
        float _1127 = _1125 + _1053;
        float _1129 = fma(_1121, _1123, _709);
        float _1131 = fma(_1127, _1123, _747);
        float _1133 = fma(_1113, _1123, _711);
        _1075 = _1131;
        _1079 = _1129;
        _1083 = _1133;
        _939 = _1123;
    }
    float _1135 = _1075;
    float _1137 = _1079;
    float _1139 = _1083;
    float _1141 = _939;
    float _1143 = _1141;
    if (_1043)
    {
        _781 = 1.0;
    }
    float _1145 = _781;
    float _1147 = _1073 * _1059;
    float _1149 = _1147 * 0.5;
    float _1151 = _1145;
    if (!_1043)
    {
        float _1153 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1155);
        float _1159 = _1153 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1167 = _1165 * 0.15915493667125701904296875;
        float _1169 = _1159 * 6.283185482025146484375;
        float _1171 = sin(_1169);
        float _1173 = 1.0 / _1163;
        float _1175 = _1167 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1171 * _1173;
        float _1181 = 1.0 / _1157;
        float _1183 = _1177 * _1179;
        float _1185 = _1167 * 6.283185482025146484375;
        float _1187 = sin(_1185);
        float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1191 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1189;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1195 = _1181 * _1193;
        float _1197 = 1.0 / _1183;
        float _1199 = 1.0 / _1191;
        float _1201 = _1187 * _1197;
        float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1205 = fma(_1201, _1195, _1203);
        float _1207 = _1205 * _1199;
        float _1209 = precise::clamp(_1207, 0.0, 1.0);
        _1143 = _1167;
        _1151 = _1209;
    }
    float _1211 = _1143;
    float _1213 = _1151;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1217 = _1135 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1221 = _1137 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1225 = _1139 + _1223;
    float _1227 = _1217 * _1217;
    float _1229 = fma(_1221, _1221, _1227);
    float _1231 = fma(_1225, _1225, _1229);
    float _1233 = rsqrt(_1231);
    float _1235 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1237 = _1221 * _1235;
    float _1239 = _1225 * _1235;
    float _1241 = _1237 * _1237;
    float _1243 = _1239 * _1239;
    float _1245 = _1241 + _1243;
    float _1247 = sqrt(_1245);
    bool _1249 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = _1247 + _1251;
    float _1255 = _1233;
    float _1257 = _1245;
    float _1259 = _1253;
    float _1261 = _1211;
    float _1263 = _1217;
    float _1265 = _1237;
    if (_1249)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1267;
    }
    float _1269 = _1255;
    if (_1249)
    {
        float _1271 = rsqrt(_1245);
        _1257 = _1271;
    }
    float _1273 = _1257;
    if (_1249)
    {
        float _1275 = _1253 * _1269;
        _1259 = _1275;
    }
    float _1277 = _1259;
    if (_1249)
    {
        float _1279 = _1277 * 0.15915493667125701904296875;
        _1261 = _1279;
    }
    float _1281 = _1261;
    float _1283 = _1225;
    if (_1249)
    {
        float _1285 = _1281 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        _1283 = _1287;
    }
    float _1289 = _1283;
    float _1291 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1293 = precise::max(0.0, _1291);
    float _1295 = _1269;
    float _1297 = _1293;
    if (_1249)
    {
        float _1299 = _1281 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        _1295 = _1301;
    }
    float _1303 = _1295;
    float _1305 = -_1235;
    float _1307 = -_1293;
    float _1309 = fma(_1217, _1305, _1307);
    float _1311 = _1309;
    if (_1249)
    {
        float _1313 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1313;
    }
    float _1315 = _1263;
    float _1317 = _1315;
    float _1319 = _1289;
    if (_1249)
    {
        float _1321 = fma(_1289, _1315, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = _1323;
    if (!_1249)
    {
        _1319 = _1239;
    }
    float _1327 = _1319;
    float _1329 = _1327;
    if (_1249)
    {
        float _1331 = _1303 + (-1.0);
        _1297 = _1331;
    }
    float _1333 = _1297;
    float _1335 = _1333;
    if (_1249)
    {
        float _1337 = _1273 * _1323;
        _941 = _1337;
    }
    float _1339 = _941;
    if (!_1249)
    {
        _1325 = _1241;
    }
    float _1341 = _1325;
    float _1343 = sqrt(_1231);
    float _1345 = _1341;
    if (_1249)
    {
        float _1347 = _1333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1347;
    }
    float _1349 = _1335;
    float _1351 = _1349;
    if (_1249)
    {
        float _1353 = _1237 * _1339;
        _1265 = _1353;
    }
    float _1355 = _1265;
    if (_1249)
    {
        float _1357 = _1239 * _1339;
        _1329 = _1357;
    }
    float _1359 = _1329;
    if (_1249)
    {
        float _1361 = fma(_1309, _1303, _1349);
        _1311 = _1361;
    }
    float _1363 = _1311;
    if (_1249)
    {
        float _1365 = _1355 * _1355;
        _1345 = _1365;
    }
    float _1367 = _1345;
    if (!_1249)
    {
        _1351 = _1243;
    }
    float _1369 = _1351;
    float _1371 = _1369;
    if (_1249)
    {
        float _1373 = _1359 * _1359;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1379 = fma(_1363, _1363, _1367);
    float _1381 = _1379 + _1375;
    float _1383 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1387 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1385);
    float _1389 = precise::clamp(_1387, 0.0, 1.0);
    float _1391 = rsqrt(_1381);
    float _1393 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1383);
    float _1395 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1397 = -_1389;
    float _1399 = _1397 + 1.0;
    float _1401 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1393);
    float _1403 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1405 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    float _1407 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1411 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1403);
    float _1413 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1405);
    float _1415 = abs(_1399);
    float _1417 = log2(_1415);
    float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1421 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1411);
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1425 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1407);
    float _1427 = -_1419;
    float _1429 = fma(_1427, _1377, 1.0);
    float _1431 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1435 = _1391 * _1355;
    float _1437 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1425);
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1433);
    float _1441 = _1391 * _1363;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1445 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1447 = _1391 * _1359;
    float _1449 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1451 = -_1443;
    float _1453 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1451);
    float _1455 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1439);
    float _1457 = log2(_1429);
    float _1459 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1461 = -_1447;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1453);
    float _1465 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1455);
    float _1467 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1469 = fma(_1463, -0.5, 0.5);
    float _1471 = fma(_1463, 0.5, 0.5);
    float _1473 = exp2(_1449);
    float _1475 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1467);
    float _1477 = _1441 + 1.0;
    float _1479 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1475);
    float _1481 = 1.0 / _1465;
    float _1483 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1459);
    float _1485 = fma(_1471, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1487 = _1457 * 0.693147182464599609375;
    float _1489 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1483);
    float _1491 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1479);
    float _1493 = fma(_1471, _1485, -0.212114393711090087890625);
    float _1495 = sqrt(_1469);
    float _1497 = -_1441;
    float _1499 = fma(_1473, _1477, _1497);
    float _1501 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1489);
    float _1503 = fma(_1471, _1493, 1.570728778839111328125);
    float _1505 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1507 = fma(_1499, 0.5, 0.5);
    float _1509 = _1491 * _1481;
    float _1511 = _1501 * _1481;
    float _1513 = fma(_1509, 0.5, 0.5);
    float _1515 = fma(_1511, -0.5, 0.5);
    float _1517 = _1495 * 0.636619746685028076171875;
    float3 _3952 = float3(_1513, _1515, _1505);
    float _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3952, float3(0.0), isnan(_3952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3952, float3(0.0), isnan(_3952)), level(0.0)).x;
    float3 _3963 = float3(_1513, _1515, _1505);
    float4 _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3963, float3(0.0), isnan(_3963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3963, float3(0.0), isnan(_3963)), level(0.0)).xyzw;
    float _1524 = _1522.x;
    float _1526 = _1522.y;
    float _1528 = _1522.z;
    float _1530 = _1522.w;
    float _1532 = -_1503;
    float _1534 = fma(_1517, _1532, 1.0);
    float2 _3985 = float2(_1534, _1507);
    float3 _1538 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3985, float2(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3985, float2(0.0), isnan(_3985)), level(0.0)).xyz;
    float _1540 = _1538.x;
    float _1542 = _1538.y;
    float _1544 = _1538.z;
    float _1546 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1548 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1550 = _1213 > 0.0;
    bool _1552 = isnan(_1213);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan(0.0);
    bool _1558 = _1554 || _1556;
    float _1560 = _1465 * 0.5;
    float _1562 = _1213 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1564 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1548);
    float _1566 = exp2(_1546);
    float _1568 = _1491 + _1465;
    float _1570 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1564);
    float _1572 = _1568 * 0.5;
    float _1574 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1570);
    float _1576 = fma(_1501, -0.5, _1560);
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1580 = _1574 + _1465;
    out.gl_Position.x = _1491;
    out.gl_Position.y = _1501;
    out.gl_Position.z = _1574;
    out.gl_Position.w = _1465;
    float _1582 = _1580 * 0.5;
    float _1584 = -_1566;
    float _1586 = _1584 + 1.0;
    out.m_47.x = _1578;
    float _1588 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1572;
    out.m_64.y = _1576;
    out.m_64.z = _1582;
    out.m_64.w = _1465;
    float _1590 = -_1588;
    float _1592 = _1590 + 1.0;
    float _1594 = _1588 * _1519;
    float _1596 = _1530 * _1594;
    float _1598 = _1530 * _1592;
    float _1600 = _1544 * _1594;
    float _1602 = fma(_1540, _1596, _1524);
    float _1604 = fma(_1542, _1596, _1526);
    float _1606 = fma(_1530, _1600, _1528);
    out.m_66.x = _1602;
    out.m_66.y = _1604;
    out.m_66.z = _1606;
    out.m_66.w = _1598;
    if (_1558)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1608 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1608;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _977 = false;
    bool _419 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1665 = as_type<float>(_101);
        out.gl_Position.z = _1665;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1734 = as_type<float>(_137);
        out.gl_Position.z = _1734;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _143 * _141;
    float _165 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _167 = 1.4012984643248170709237295832899e-45;
    float _169 = _145;
    if (!_155)
    {
        float _171 = _145 * _145;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _179 = _165 * _157;
    float _181 = _175;
    if (!_155)
    {
        float _183 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = floor(_177);
    float _189 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].y, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = _189 * 6.283185482025146484375;
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = in.m_49.x;
    float _199 = in.m_49.y;
    float _201 = in.m_49.z;
    float _203 = floor(_189);
    float _205 = _193 * 0.15915493667125701904296875;
    float _207 = -_187;
    float _209 = _177 + _207;
    float _211 = _195 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _205 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = -_203;
    float _221 = _189 + _219;
    bool _223 = !_155;
    float _225 = _185;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _145 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _145);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_155;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _145 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _169 = _279;
    }
    float _281 = _169;
    float _283 = in.m_53.w;
    float _285 = in.m_44.x;
    float _287 = in.m_44.y;
    float _289 = in.m_44.z;
    float _291 = fma(_217, 0.5, 0.5);
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _299 = _297 != 0;
    float _301 = fma(_213, 0.5, 0.5);
    bool _303 = _209 < 0.5;
    float _305 = float(_303);
    float _307 = -_291;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _311 = -_209;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_295;
    int _317 = _315 ? 0 : 1;
    float _319 = -_221;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _323 = _221 < 0.5;
    float _325 = float(_323);
    float _327 = -_305;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_301;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _339 = abs(_317);
    float _341 = -_325;
    float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _345 = !_161;
    int _347 = _345 ? 0 : 1;
    float _349 = fma(_281, _197, _335);
    float _351 = fma(_281, _199, _337);
    bool _353 = !_299;
    int _355 = _353 ? 0 : 1;
    float _357 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _359 = abs(_347);
    float _361 = fma(_281, _201, _357);
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _365 = fma(_349, _283, _285);
    int _367 = abs(_355);
    float _369 = fma(_351, _283, _287);
    float _371 = float(_339);
    float _373 = fma(_361, _283, _289);
    float _375 = float(_359);
    float _377 = abs(_313);
    float _379 = _371 * _377;
    float _381 = abs(_321);
    float _383 = _371 * _381;
    float _385 = float(_367);
    float _387 = fma(_375, _333, _379);
    float _389 = fma(_375, _309, _383);
    float _391 = abs(_329);
    float _393 = fma(_385, _391, _387);
    float _395 = abs(_343);
    float _397 = fma(_385, _395, _389);
    bool _399 = !_363;
    float _401 = _365;
    float _417;
    if (!_399)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _405 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_85);
        float _423 = 1.0 / _421;
        float _425 = _119 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _431 = _427 + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _435 = _427 + _433;
    float _437 = as_type<float>(int(gl_VertexIndex));
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _455 = 1.0 / _441;
    float _457 = 1.0 / _445;
    bool _459 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _461 = isnan(_427);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = 1.0 / _449;
    float _473 = _431 * _455;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _477 = _427 + _475;
    int _479 = as_type<int>(_437) & 1;
    bool _481 = _479 != 0;
    int _483 = as_type<int>(_437) & 2;
    bool _485 = _483 != 0;
    bool _487 = _139 > 0.5;
    float _489 = 1.0 / _453;
    float _491 = _435 * _457;
    bool _493 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_427);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _507 = _427 + _505;
    float _509 = -_469;
    float _511 = _509 + 1.0;
    float _513 = _477 * _471;
    bool _515 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _517 = isnan(_427);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _503 * _511;
    float _529 = -_503;
    float _531 = _529 + 1.0;
    bool _533 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _535 = isnan(_427);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_525;
    float _547 = _545 + 1.0;
    float _549 = _525 * _531;
    float _551 = _507 * _489;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _557 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_427);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = _567 * _547;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_575, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _589 = fma(_571, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _591 = -_543;
    float _593 = _591 + 1.0;
    float _595 = _543 * _585;
    float _597 = fma(_579, _491, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _599 = fma(_555, _491, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _601 = _587 * _595;
    float _603 = _589 * _595;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _605;
    float _609 = in.m_53.x;
    float _611 = in.m_53.y;
    float _613 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _615 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _617;
    float _621 = fma(_607, _513, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = fma(_597, _581, _613);
    float _625 = fma(_599, _581, _615);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _631 = fma(_619, _513, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _637 = fma(_621, _549, _625);
    float _639 = fma(_629, _551, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _641 = fma(_631, _549, _623);
    float _643 = fma(_635, _551, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _647 = fma(_639, _527, _637);
    float _649 = fma(_643, _527, _641);
    float _651 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[147].y, _647);
    float _653 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[147].x, _649);
    bool _655 = !_485;
    float _657 = _655 ? (-0.5) : 0.5;
    float _659 = _651 * _611;
    float _661 = _653 * _609;
    float _663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _657);
    float _665 = _397 * _659;
    bool _667 = !_481;
    float _669 = _667 ? (-0.5) : 0.5;
    float _671 = _393 * _661;
    float _673 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    float _677 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _679 = _673 * _663;
    float _681 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _683 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _685 = _677 * _675;
    float _687 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _691 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _693 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _681);
    float _695 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _687);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _689);
    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
    float _701 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _703 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    float _705 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _707 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
    float _709 = _701 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _717 = in.m_51.y;
    float _719 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = _709 + _713;
    float _723 = _711 + _715;
    float _725 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _727 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _729 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _731 = _721 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _735 = _723 + _733;
    float _737 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _725);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _727);
    float _741 = _731 * _731;
    float _743 = _735 * _735;
    float _745 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _749 = _741 + _743;
    float _751 = _745 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _755 = _753 != 0;
    float _757 = sqrt(_749);
    float _759 = -_669;
    float _761 = _487 ? _759 : _669;
    float _763 = _747 + _751;
    bool _765 = _717 > 0.5;
    bool _767 = !_755;
    float _769 = _767 ? _669 : _761;
    bool _771 = _757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _773 = _761;
    float _775 = _669;
    float _777 = _717;
    float _779 = _751;
    float _781 = _709;
    if (!_771)
    {
        _773 = _743;
    }
    float _783 = _773;
    float _785 = _783;
    if (!_771)
    {
        _401 = _741;
    }
    float _787 = _401;
    float _789 = _787;
    if (!_771)
    {
        _775 = _721;
    }
    float _791 = _775;
    float _793 = _791;
    if (!_771)
    {
        _777 = _723;
    }
    float _795 = _777;
    float _797 = _795;
    if (!_771)
    {
        _779 = _763;
    }
    float _799 = _779;
    bool _801 = !_771;
    float _803 = _799;
    if (!_801)
    {
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _809 = _757 + _807;
        float _811 = _763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = rsqrt(_749);
        float _815 = _809 * _805;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _817 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = _813 * _827;
        float _831 = _825 + (-1.0);
        float _833 = fma(_731, _829, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_735, _829, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _837 = _831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _841 = _833 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _845 = _835 + _843;
        float _847 = fma(_763, _825, _837);
        float _849 = _841 * _841;
        float _851 = _845 * _845;
        _803 = _847;
        _789 = _849;
        _785 = _851;
        _797 = _835;
        _793 = _833;
    }
    float _853 = _803;
    float _855 = _789;
    float _857 = _785;
    float _859 = _797;
    float _861 = _793;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _865 = _853 + _863;
    float _867 = _769 + 0.5;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _871 = _869 != 0;
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _875 = -_657;
    int _877 = _765 ? as_type<int>(_875) : as_type<int>(_657);
    float _879 = fma(_865, _865, _855);
    float _881 = _867 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _883 = !_871;
    float _885 = _883 ? _657 : as_type<float>(_877);
    float _887 = _879 + _857;
    float _889 = _881 * _645;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _893 = -_885;
    float _895 = _893 + 0.5;
    float _897 = sqrt(_887);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _909 = _895 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _911 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _915 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _909 * _873;
    bool _927 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _929 = isnan(_897);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _935 = _931 || _933;
    out.m_58.x = _915;
    out.m_58.y = _917;
    out.m_58.z = _919;
    out.m_58.w = _913;
    out.m_60.x = _921;
    out.m_60.y = _911;
    out.m_60.z = _923;
    out.m_62.x = _889;
    out.m_62.y = _925;
    float _937 = _905;
    float _939 = _861;
    float _941 = _911;
    if (!_935)
    {
        _937 = 1.0;
    }
    float _943 = _937;
    bool _945 = !_935;
    float _947 = _943;
    if (!_945)
    {
        bool _949 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _951 = isnan(_897);
        bool _953 = _949 || _951;
        bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _957 = _953 || _955;
        if (!_957)
        {
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _961 = _897 + _959;
            float _963 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _965 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _963;
            float _967 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _969 = _967 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _971 = 1.0 / _965;
            float _973 = _961 * _971;
            float _975 = fma(_973, _969, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _947 = _975;
            _977 = true;
        }
        else
        {
            bool _979 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _981 = isnan(_897);
            bool _983 = _979 || _981;
            bool _985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _987 = _983 || _985;
            if (!_987)
            {
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _991 = _897 + _989;
                float _993 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _995 = _993 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _997 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _999 = _997 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1001 = 1.0 / _995;
                float _1003 = _991 * _1001;
                float _1005 = fma(_1003, _999, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _947 = _1005;
                _977 = true;
            }
            else
            {
                _947 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _977 = false;
    float _1007 = _947;
    float _1009 = _747 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1013 = _853 + _1011;
    float _1015 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1009);
    float _1017 = _747 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1019 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.5);
    bool _1027 = _1023 || _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1031 = _859 + _1029;
    float _1033 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1015);
    bool _1035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    float _1045 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1017);
    float _1047 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1049 = _861 + _1047;
    float _1051 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1053 = fma(_1013, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1055 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1045);
    float _1057 = fma(_1049, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1059 = 1.0 / _1051;
    float _1061 = fma(_1031, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1063 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1065 = _1049;
    float _1067 = _1063;
    float _1069 = _1007;
    if (_1027)
    {
        _1065 = _1053;
    }
    float _1071 = _1065;
    float _1073 = _1063 + _1051;
    float _1075 = _1071;
    if (_1027)
    {
        _1067 = _1057;
    }
    float _1077 = _1067;
    float _1079 = _1077;
    if (_1027)
    {
        _1069 = _1061;
    }
    float _1081 = _1069;
    float _1083 = _1081;
    if (!_1027)
    {
        float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1087 = _747 + _1085;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1091 = _709 + _1089;
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1095 = _1087 * _1087;
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1099 = _711 + _1097;
        float _1101 = fma(_1091, _1091, _1095);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1099, _1099, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = -_711;
        float _1113 = _1111 + _1061;
        float _1115 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1117 = _1115 * _1103;
        float _1119 = -_709;
        float _1121 = _1119 + _1057;
        float _1123 = _1109 * _1117;
        float _1125 = -_747;
        float _1127 = _1125 + _1053;
        float _1129 = fma(_1121, _1123, _709);
        float _1131 = fma(_1127, _1123, _747);
        float _1133 = fma(_1113, _1123, _711);
        _1075 = _1131;
        _1079 = _1129;
        _1083 = _1133;
        _939 = _1123;
    }
    float _1135 = _1075;
    float _1137 = _1079;
    float _1139 = _1083;
    float _1141 = _939;
    float _1143 = _1141;
    if (_1043)
    {
        _781 = 1.0;
    }
    float _1145 = _781;
    float _1147 = _1073 * _1059;
    float _1149 = _1147 * 0.5;
    float _1151 = _1145;
    if (!_1043)
    {
        float _1153 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1155);
        float _1159 = _1153 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1167 = _1165 * 0.15915493667125701904296875;
        float _1169 = _1159 * 6.283185482025146484375;
        float _1171 = sin(_1169);
        float _1173 = 1.0 / _1163;
        float _1175 = _1167 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1171 * _1173;
        float _1181 = 1.0 / _1157;
        float _1183 = _1177 * _1179;
        float _1185 = _1167 * 6.283185482025146484375;
        float _1187 = sin(_1185);
        float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1191 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1189;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1195 = _1181 * _1193;
        float _1197 = 1.0 / _1183;
        float _1199 = 1.0 / _1191;
        float _1201 = _1187 * _1197;
        float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1205 = fma(_1201, _1195, _1203);
        float _1207 = _1205 * _1199;
        float _1209 = precise::clamp(_1207, 0.0, 1.0);
        _1143 = _1167;
        _1151 = _1209;
    }
    float _1211 = _1143;
    float _1213 = _1151;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1217 = _1135 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1221 = _1137 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1225 = _1139 + _1223;
    float _1227 = _1217 * _1217;
    float _1229 = fma(_1221, _1221, _1227);
    float _1231 = fma(_1225, _1225, _1229);
    float _1233 = rsqrt(_1231);
    float _1235 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1237 = _1221 * _1235;
    float _1239 = _1225 * _1235;
    float _1241 = _1237 * _1237;
    float _1243 = _1239 * _1239;
    float _1245 = _1241 + _1243;
    float _1247 = sqrt(_1245);
    bool _1249 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = _1247 + _1251;
    float _1255 = _1233;
    float _1257 = _1245;
    float _1259 = _1253;
    float _1261 = _1211;
    float _1263 = _1217;
    float _1265 = _1237;
    if (_1249)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1267;
    }
    float _1269 = _1255;
    if (_1249)
    {
        float _1271 = rsqrt(_1245);
        _1257 = _1271;
    }
    float _1273 = _1257;
    if (_1249)
    {
        float _1275 = _1253 * _1269;
        _1259 = _1275;
    }
    float _1277 = _1259;
    if (_1249)
    {
        float _1279 = _1277 * 0.15915493667125701904296875;
        _1261 = _1279;
    }
    float _1281 = _1261;
    float _1283 = _1225;
    if (_1249)
    {
        float _1285 = _1281 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        _1283 = _1287;
    }
    float _1289 = _1283;
    float _1291 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1293 = precise::max(0.0, _1291);
    float _1295 = _1269;
    float _1297 = _1293;
    if (_1249)
    {
        float _1299 = _1281 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        _1295 = _1301;
    }
    float _1303 = _1295;
    float _1305 = -_1235;
    float _1307 = -_1293;
    float _1309 = fma(_1217, _1305, _1307);
    float _1311 = _1309;
    if (_1249)
    {
        float _1313 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1313;
    }
    float _1315 = _1263;
    float _1317 = _1315;
    float _1319 = _1289;
    if (_1249)
    {
        float _1321 = fma(_1289, _1315, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = _1323;
    if (!_1249)
    {
        _1319 = _1239;
    }
    float _1327 = _1319;
    float _1329 = _1327;
    if (_1249)
    {
        float _1331 = _1303 + (-1.0);
        _1297 = _1331;
    }
    float _1333 = _1297;
    float _1335 = _1333;
    if (_1249)
    {
        float _1337 = _1273 * _1323;
        _941 = _1337;
    }
    float _1339 = _941;
    if (!_1249)
    {
        _1325 = _1241;
    }
    float _1341 = _1325;
    float _1343 = sqrt(_1231);
    float _1345 = _1341;
    if (_1249)
    {
        float _1347 = _1333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1347;
    }
    float _1349 = _1335;
    float _1351 = _1349;
    if (_1249)
    {
        float _1353 = _1237 * _1339;
        _1265 = _1353;
    }
    float _1355 = _1265;
    if (_1249)
    {
        float _1357 = _1239 * _1339;
        _1329 = _1357;
    }
    float _1359 = _1329;
    if (_1249)
    {
        float _1361 = fma(_1309, _1303, _1349);
        _1311 = _1361;
    }
    float _1363 = _1311;
    if (_1249)
    {
        float _1365 = _1355 * _1355;
        _1345 = _1365;
    }
    float _1367 = _1345;
    if (!_1249)
    {
        _1351 = _1243;
    }
    float _1369 = _1351;
    float _1371 = _1369;
    if (_1249)
    {
        float _1373 = _1359 * _1359;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1379 = fma(_1363, _1363, _1367);
    float _1381 = _1379 + _1375;
    float _1383 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1387 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1385);
    float _1389 = precise::clamp(_1387, 0.0, 1.0);
    float _1391 = rsqrt(_1381);
    float _1393 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1383);
    float _1395 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1397 = -_1389;
    float _1399 = _1397 + 1.0;
    float _1401 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1393);
    float _1403 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1405 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    float _1407 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1411 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1403);
    float _1413 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1405);
    float _1415 = abs(_1399);
    float _1417 = log2(_1415);
    float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1421 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1411);
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1425 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1407);
    float _1427 = -_1419;
    float _1429 = fma(_1427, _1377, 1.0);
    float _1431 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1435 = _1391 * _1355;
    float _1437 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1425);
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1433);
    float _1441 = _1391 * _1363;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1445 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1447 = _1391 * _1359;
    float _1449 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1451 = -_1443;
    float _1453 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1451);
    float _1455 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1439);
    float _1457 = log2(_1429);
    float _1459 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1461 = -_1447;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1453);
    float _1465 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1455);
    float _1467 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1469 = fma(_1463, -0.5, 0.5);
    float _1471 = fma(_1463, 0.5, 0.5);
    float _1473 = exp2(_1449);
    float _1475 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1467);
    float _1477 = _1441 + 1.0;
    float _1479 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1475);
    float _1481 = 1.0 / _1465;
    float _1483 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1459);
    float _1485 = fma(_1471, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1487 = _1457 * 0.693147182464599609375;
    float _1489 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1483);
    float _1491 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1479);
    float _1493 = fma(_1471, _1485, -0.212114393711090087890625);
    float _1495 = sqrt(_1469);
    float _1497 = -_1441;
    float _1499 = fma(_1473, _1477, _1497);
    float _1501 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1489);
    float _1503 = fma(_1471, _1493, 1.570728778839111328125);
    float _1505 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1507 = fma(_1499, 0.5, 0.5);
    float _1509 = _1491 * _1481;
    float _1511 = _1501 * _1481;
    float _1513 = fma(_1509, 0.5, 0.5);
    float _1515 = fma(_1511, -0.5, 0.5);
    float _1517 = _1495 * 0.636619746685028076171875;
    float3 _3952 = float3(_1513, _1515, _1505);
    float _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3952, float3(0.0), isnan(_3952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3952, float3(0.0), isnan(_3952)), level(0.0)).x;
    float3 _3963 = float3(_1513, _1515, _1505);
    float4 _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3963, float3(0.0), isnan(_3963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3963, float3(0.0), isnan(_3963)), level(0.0)).xyzw;
    float _1524 = _1522.x;
    float _1526 = _1522.y;
    float _1528 = _1522.z;
    float _1530 = _1522.w;
    float _1532 = -_1503;
    float _1534 = fma(_1517, _1532, 1.0);
    float2 _3985 = float2(_1534, _1507);
    float3 _1538 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3985, float2(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3985, float2(0.0), isnan(_3985)), level(0.0)).xyz;
    float _1540 = _1538.x;
    float _1542 = _1538.y;
    float _1544 = _1538.z;
    float _1546 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1548 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1550 = _1213 > 0.0;
    bool _1552 = isnan(_1213);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan(0.0);
    bool _1558 = _1554 || _1556;
    float _1560 = _1465 * 0.5;
    float _1562 = _1213 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1564 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1548);
    float _1566 = exp2(_1546);
    float _1568 = _1491 + _1465;
    float _1570 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1564);
    float _1572 = _1568 * 0.5;
    float _1574 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1570);
    float _1576 = fma(_1501, -0.5, _1560);
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1580 = _1574 + _1465;
    out.gl_Position.x = _1491;
    out.gl_Position.y = _1501;
    out.gl_Position.z = _1574;
    out.gl_Position.w = _1465;
    float _1582 = _1580 * 0.5;
    float _1584 = -_1566;
    float _1586 = _1584 + 1.0;
    out.m_47.x = _1578;
    float _1588 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1572;
    out.m_64.y = _1576;
    out.m_64.z = _1582;
    out.m_64.w = _1465;
    float _1590 = -_1588;
    float _1592 = _1590 + 1.0;
    float _1594 = _1588 * _1519;
    float _1596 = _1530 * _1594;
    float _1598 = _1530 * _1592;
    float _1600 = _1544 * _1594;
    float _1602 = fma(_1540, _1596, _1524);
    float _1604 = fma(_1542, _1596, _1526);
    float _1606 = fma(_1530, _1600, _1528);
    out.m_66.x = _1602;
    out.m_66.y = _1604;
    out.m_66.z = _1606;
    out.m_66.w = _1598;
    if (_1558)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1608 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1608;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _977 = false;
    bool _419 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1665 = as_type<float>(_101);
        out.gl_Position.z = _1665;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1734 = as_type<float>(_137);
        out.gl_Position.z = _1734;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _143 * _141;
    float _165 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _167 = 1.4012984643248170709237295832899e-45;
    float _169 = _145;
    if (!_155)
    {
        float _171 = _145 * _145;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _179 = _165 * _157;
    float _181 = _175;
    if (!_155)
    {
        float _183 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = floor(_177);
    float _189 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].y, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = _189 * 6.283185482025146484375;
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = in.m_49.x;
    float _199 = in.m_49.y;
    float _201 = in.m_49.z;
    float _203 = floor(_189);
    float _205 = _193 * 0.15915493667125701904296875;
    float _207 = -_187;
    float _209 = _177 + _207;
    float _211 = _195 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _205 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = -_203;
    float _221 = _189 + _219;
    bool _223 = !_155;
    float _225 = _185;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _145 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _145);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_155;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _145 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _169 = _279;
    }
    float _281 = _169;
    float _283 = in.m_53.w;
    float _285 = in.m_44.x;
    float _287 = in.m_44.y;
    float _289 = in.m_44.z;
    float _291 = fma(_217, 0.5, 0.5);
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _299 = _297 != 0;
    float _301 = fma(_213, 0.5, 0.5);
    bool _303 = _209 < 0.5;
    float _305 = float(_303);
    float _307 = -_291;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _311 = -_209;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_295;
    int _317 = _315 ? 0 : 1;
    float _319 = -_221;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _323 = _221 < 0.5;
    float _325 = float(_323);
    float _327 = -_305;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_301;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _339 = abs(_317);
    float _341 = -_325;
    float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _345 = !_161;
    int _347 = _345 ? 0 : 1;
    float _349 = fma(_281, _197, _335);
    float _351 = fma(_281, _199, _337);
    bool _353 = !_299;
    int _355 = _353 ? 0 : 1;
    float _357 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _359 = abs(_347);
    float _361 = fma(_281, _201, _357);
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _365 = fma(_349, _283, _285);
    int _367 = abs(_355);
    float _369 = fma(_351, _283, _287);
    float _371 = float(_339);
    float _373 = fma(_361, _283, _289);
    float _375 = float(_359);
    float _377 = abs(_313);
    float _379 = _371 * _377;
    float _381 = abs(_321);
    float _383 = _371 * _381;
    float _385 = float(_367);
    float _387 = fma(_375, _333, _379);
    float _389 = fma(_375, _309, _383);
    float _391 = abs(_329);
    float _393 = fma(_385, _391, _387);
    float _395 = abs(_343);
    float _397 = fma(_385, _395, _389);
    bool _399 = !_363;
    float _401 = _365;
    float _417;
    if (!_399)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _405 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_85);
        float _423 = 1.0 / _421;
        float _425 = _119 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _431 = _427 + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _435 = _427 + _433;
    float _437 = as_type<float>(int(gl_VertexIndex));
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _455 = 1.0 / _441;
    float _457 = 1.0 / _445;
    bool _459 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _461 = isnan(_427);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = 1.0 / _449;
    float _473 = _431 * _455;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _477 = _427 + _475;
    int _479 = as_type<int>(_437) & 1;
    bool _481 = _479 != 0;
    int _483 = as_type<int>(_437) & 2;
    bool _485 = _483 != 0;
    bool _487 = _139 > 0.5;
    float _489 = 1.0 / _453;
    float _491 = _435 * _457;
    bool _493 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_427);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _507 = _427 + _505;
    float _509 = -_469;
    float _511 = _509 + 1.0;
    float _513 = _477 * _471;
    bool _515 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _517 = isnan(_427);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _503 * _511;
    float _529 = -_503;
    float _531 = _529 + 1.0;
    bool _533 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _535 = isnan(_427);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_525;
    float _547 = _545 + 1.0;
    float _549 = _525 * _531;
    float _551 = _507 * _489;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _557 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_427);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = _567 * _547;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_575, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _589 = fma(_571, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _591 = -_543;
    float _593 = _591 + 1.0;
    float _595 = _543 * _585;
    float _597 = fma(_579, _491, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _599 = fma(_555, _491, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _601 = _587 * _595;
    float _603 = _589 * _595;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _605;
    float _609 = in.m_53.x;
    float _611 = in.m_53.y;
    float _613 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _615 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _617;
    float _621 = fma(_607, _513, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _623 = fma(_597, _581, _613);
    float _625 = fma(_599, _581, _615);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _631 = fma(_619, _513, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _637 = fma(_621, _549, _625);
    float _639 = fma(_629, _551, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _641 = fma(_631, _549, _623);
    float _643 = fma(_635, _551, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _647 = fma(_639, _527, _637);
    float _649 = fma(_643, _527, _641);
    float _651 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[147].y, _647);
    float _653 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[147].x, _649);
    bool _655 = !_485;
    float _657 = _655 ? (-0.5) : 0.5;
    float _659 = _651 * _611;
    float _661 = _653 * _609;
    float _663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _657);
    float _665 = _397 * _659;
    bool _667 = !_481;
    float _669 = _667 ? (-0.5) : 0.5;
    float _671 = _393 * _661;
    float _673 = _665 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _669);
    float _677 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _679 = _673 * _663;
    float _681 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _683 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _685 = _677 * _675;
    float _687 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _691 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _693 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _681);
    float _695 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _687);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _689);
    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
    float _701 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _703 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    float _705 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _707 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
    float _709 = _701 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _717 = in.m_51.y;
    float _719 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = _709 + _713;
    float _723 = _711 + _715;
    float _725 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _727 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _729 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _731 = _721 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _735 = _723 + _733;
    float _737 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _725);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _727);
    float _741 = _731 * _731;
    float _743 = _735 * _735;
    float _745 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _749 = _741 + _743;
    float _751 = _745 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _755 = _753 != 0;
    float _757 = sqrt(_749);
    float _759 = -_669;
    float _761 = _487 ? _759 : _669;
    float _763 = _747 + _751;
    bool _765 = _717 > 0.5;
    bool _767 = !_755;
    float _769 = _767 ? _669 : _761;
    bool _771 = _757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _773 = _761;
    float _775 = _669;
    float _777 = _717;
    float _779 = _751;
    float _781 = _709;
    if (!_771)
    {
        _773 = _743;
    }
    float _783 = _773;
    float _785 = _783;
    if (!_771)
    {
        _401 = _741;
    }
    float _787 = _401;
    float _789 = _787;
    if (!_771)
    {
        _775 = _721;
    }
    float _791 = _775;
    float _793 = _791;
    if (!_771)
    {
        _777 = _723;
    }
    float _795 = _777;
    float _797 = _795;
    if (!_771)
    {
        _779 = _763;
    }
    float _799 = _779;
    bool _801 = !_771;
    float _803 = _799;
    if (!_801)
    {
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _809 = _757 + _807;
        float _811 = _763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = rsqrt(_749);
        float _815 = _809 * _805;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _817 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = _813 * _827;
        float _831 = _825 + (-1.0);
        float _833 = fma(_731, _829, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_735, _829, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _837 = _831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _841 = _833 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _845 = _835 + _843;
        float _847 = fma(_763, _825, _837);
        float _849 = _841 * _841;
        float _851 = _845 * _845;
        _803 = _847;
        _789 = _849;
        _785 = _851;
        _797 = _835;
        _793 = _833;
    }
    float _853 = _803;
    float _855 = _789;
    float _857 = _785;
    float _859 = _797;
    float _861 = _793;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _865 = _853 + _863;
    float _867 = _769 + 0.5;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _871 = _869 != 0;
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _875 = -_657;
    int _877 = _765 ? as_type<int>(_875) : as_type<int>(_657);
    float _879 = fma(_865, _865, _855);
    float _881 = _867 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _883 = !_871;
    float _885 = _883 ? _657 : as_type<float>(_877);
    float _887 = _879 + _857;
    float _889 = _881 * _645;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _893 = -_885;
    float _895 = _893 + 0.5;
    float _897 = sqrt(_887);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _909 = _895 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _911 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _915 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _909 * _873;
    bool _927 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _929 = isnan(_897);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _935 = _931 || _933;
    out.m_58.x = _915;
    out.m_58.y = _917;
    out.m_58.z = _919;
    out.m_58.w = _913;
    out.m_60.x = _921;
    out.m_60.y = _911;
    out.m_60.z = _923;
    out.m_62.x = _889;
    out.m_62.y = _925;
    float _937 = _905;
    float _939 = _861;
    float _941 = _911;
    if (!_935)
    {
        _937 = 1.0;
    }
    float _943 = _937;
    bool _945 = !_935;
    float _947 = _943;
    if (!_945)
    {
        bool _949 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _951 = isnan(_897);
        bool _953 = _949 || _951;
        bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _957 = _953 || _955;
        if (!_957)
        {
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _961 = _897 + _959;
            float _963 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _965 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _963;
            float _967 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _969 = _967 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _971 = 1.0 / _965;
            float _973 = _961 * _971;
            float _975 = fma(_973, _969, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _947 = _975;
            _977 = true;
        }
        else
        {
            bool _979 = _897 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _981 = isnan(_897);
            bool _983 = _979 || _981;
            bool _985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _987 = _983 || _985;
            if (!_987)
            {
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _991 = _897 + _989;
                float _993 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _995 = _993 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _997 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _999 = _997 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1001 = 1.0 / _995;
                float _1003 = _991 * _1001;
                float _1005 = fma(_1003, _999, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _947 = _1005;
                _977 = true;
            }
            else
            {
                _947 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _977 = false;
    float _1007 = _947;
    float _1009 = _747 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1013 = _853 + _1011;
    float _1015 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1009);
    float _1017 = _747 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1019 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.5);
    bool _1027 = _1023 || _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1031 = _859 + _1029;
    float _1033 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1015);
    bool _1035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    float _1045 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1017);
    float _1047 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1049 = _861 + _1047;
    float _1051 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1053 = fma(_1013, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1055 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1045);
    float _1057 = fma(_1049, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1059 = 1.0 / _1051;
    float _1061 = fma(_1031, _1007, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1063 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1065 = _1049;
    float _1067 = _1063;
    float _1069 = _1007;
    if (_1027)
    {
        _1065 = _1053;
    }
    float _1071 = _1065;
    float _1073 = _1063 + _1051;
    float _1075 = _1071;
    if (_1027)
    {
        _1067 = _1057;
    }
    float _1077 = _1067;
    float _1079 = _1077;
    if (_1027)
    {
        _1069 = _1061;
    }
    float _1081 = _1069;
    float _1083 = _1081;
    if (!_1027)
    {
        float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1087 = _747 + _1085;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1091 = _709 + _1089;
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1095 = _1087 * _1087;
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1099 = _711 + _1097;
        float _1101 = fma(_1091, _1091, _1095);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1099, _1099, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = -_711;
        float _1113 = _1111 + _1061;
        float _1115 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1117 = _1115 * _1103;
        float _1119 = -_709;
        float _1121 = _1119 + _1057;
        float _1123 = _1109 * _1117;
        float _1125 = -_747;
        float _1127 = _1125 + _1053;
        float _1129 = fma(_1121, _1123, _709);
        float _1131 = fma(_1127, _1123, _747);
        float _1133 = fma(_1113, _1123, _711);
        _1075 = _1131;
        _1079 = _1129;
        _1083 = _1133;
        _939 = _1123;
    }
    float _1135 = _1075;
    float _1137 = _1079;
    float _1139 = _1083;
    float _1141 = _939;
    float _1143 = _1141;
    if (_1043)
    {
        _781 = 1.0;
    }
    float _1145 = _781;
    float _1147 = _1073 * _1059;
    float _1149 = _1147 * 0.5;
    float _1151 = _1145;
    if (!_1043)
    {
        float _1153 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1155);
        float _1159 = _1153 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1167 = _1165 * 0.15915493667125701904296875;
        float _1169 = _1159 * 6.283185482025146484375;
        float _1171 = sin(_1169);
        float _1173 = 1.0 / _1163;
        float _1175 = _1167 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1171 * _1173;
        float _1181 = 1.0 / _1157;
        float _1183 = _1177 * _1179;
        float _1185 = _1167 * 6.283185482025146484375;
        float _1187 = sin(_1185);
        float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1191 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1189;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1195 = _1181 * _1193;
        float _1197 = 1.0 / _1183;
        float _1199 = 1.0 / _1191;
        float _1201 = _1187 * _1197;
        float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1205 = fma(_1201, _1195, _1203);
        float _1207 = _1205 * _1199;
        float _1209 = precise::clamp(_1207, 0.0, 1.0);
        _1143 = _1167;
        _1151 = _1209;
    }
    float _1211 = _1143;
    float _1213 = _1151;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1217 = _1135 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1221 = _1137 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1225 = _1139 + _1223;
    float _1227 = _1217 * _1217;
    float _1229 = fma(_1221, _1221, _1227);
    float _1231 = fma(_1225, _1225, _1229);
    float _1233 = rsqrt(_1231);
    float _1235 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1237 = _1221 * _1235;
    float _1239 = _1225 * _1235;
    float _1241 = _1237 * _1237;
    float _1243 = _1239 * _1239;
    float _1245 = _1241 + _1243;
    float _1247 = sqrt(_1245);
    bool _1249 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = _1247 + _1251;
    float _1255 = _1233;
    float _1257 = _1245;
    float _1259 = _1253;
    float _1261 = _1211;
    float _1263 = _1217;
    float _1265 = _1237;
    if (_1249)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1267;
    }
    float _1269 = _1255;
    if (_1249)
    {
        float _1271 = rsqrt(_1245);
        _1257 = _1271;
    }
    float _1273 = _1257;
    if (_1249)
    {
        float _1275 = _1253 * _1269;
        _1259 = _1275;
    }
    float _1277 = _1259;
    if (_1249)
    {
        float _1279 = _1277 * 0.15915493667125701904296875;
        _1261 = _1279;
    }
    float _1281 = _1261;
    float _1283 = _1225;
    if (_1249)
    {
        float _1285 = _1281 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        _1283 = _1287;
    }
    float _1289 = _1283;
    float _1291 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1293 = precise::max(0.0, _1291);
    float _1295 = _1269;
    float _1297 = _1293;
    if (_1249)
    {
        float _1299 = _1281 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        _1295 = _1301;
    }
    float _1303 = _1295;
    float _1305 = -_1235;
    float _1307 = -_1293;
    float _1309 = fma(_1217, _1305, _1307);
    float _1311 = _1309;
    if (_1249)
    {
        float _1313 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1313;
    }
    float _1315 = _1263;
    float _1317 = _1315;
    float _1319 = _1289;
    if (_1249)
    {
        float _1321 = fma(_1289, _1315, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = _1323;
    if (!_1249)
    {
        _1319 = _1239;
    }
    float _1327 = _1319;
    float _1329 = _1327;
    if (_1249)
    {
        float _1331 = _1303 + (-1.0);
        _1297 = _1331;
    }
    float _1333 = _1297;
    float _1335 = _1333;
    if (_1249)
    {
        float _1337 = _1273 * _1323;
        _941 = _1337;
    }
    float _1339 = _941;
    if (!_1249)
    {
        _1325 = _1241;
    }
    float _1341 = _1325;
    float _1343 = sqrt(_1231);
    float _1345 = _1341;
    if (_1249)
    {
        float _1347 = _1333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1347;
    }
    float _1349 = _1335;
    float _1351 = _1349;
    if (_1249)
    {
        float _1353 = _1237 * _1339;
        _1265 = _1353;
    }
    float _1355 = _1265;
    if (_1249)
    {
        float _1357 = _1239 * _1339;
        _1329 = _1357;
    }
    float _1359 = _1329;
    if (_1249)
    {
        float _1361 = fma(_1309, _1303, _1349);
        _1311 = _1361;
    }
    float _1363 = _1311;
    if (_1249)
    {
        float _1365 = _1355 * _1355;
        _1345 = _1365;
    }
    float _1367 = _1345;
    if (!_1249)
    {
        _1351 = _1243;
    }
    float _1369 = _1351;
    float _1371 = _1369;
    if (_1249)
    {
        float _1373 = _1359 * _1359;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1379 = fma(_1363, _1363, _1367);
    float _1381 = _1379 + _1375;
    float _1383 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1387 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1385);
    float _1389 = precise::clamp(_1387, 0.0, 1.0);
    float _1391 = rsqrt(_1381);
    float _1393 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1383);
    float _1395 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1397 = -_1389;
    float _1399 = _1397 + 1.0;
    float _1401 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1393);
    float _1403 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1405 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    float _1407 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1411 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1403);
    float _1413 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1405);
    float _1415 = abs(_1399);
    float _1417 = log2(_1415);
    float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1421 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1411);
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1425 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1407);
    float _1427 = -_1419;
    float _1429 = fma(_1427, _1377, 1.0);
    float _1431 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1435 = _1391 * _1355;
    float _1437 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1425);
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1433);
    float _1441 = _1391 * _1363;
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1445 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1447 = _1391 * _1359;
    float _1449 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1451 = -_1443;
    float _1453 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1451);
    float _1455 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1439);
    float _1457 = log2(_1429);
    float _1459 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1461 = -_1447;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1453);
    float _1465 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1455);
    float _1467 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1469 = fma(_1463, -0.5, 0.5);
    float _1471 = fma(_1463, 0.5, 0.5);
    float _1473 = exp2(_1449);
    float _1475 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1467);
    float _1477 = _1441 + 1.0;
    float _1479 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1475);
    float _1481 = 1.0 / _1465;
    float _1483 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1459);
    float _1485 = fma(_1471, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1487 = _1457 * 0.693147182464599609375;
    float _1489 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1483);
    float _1491 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1479);
    float _1493 = fma(_1471, _1485, -0.212114393711090087890625);
    float _1495 = sqrt(_1469);
    float _1497 = -_1441;
    float _1499 = fma(_1473, _1477, _1497);
    float _1501 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1489);
    float _1503 = fma(_1471, _1493, 1.570728778839111328125);
    float _1505 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1507 = fma(_1499, 0.5, 0.5);
    float _1509 = _1491 * _1481;
    float _1511 = _1501 * _1481;
    float _1513 = fma(_1509, 0.5, 0.5);
    float _1515 = fma(_1511, -0.5, 0.5);
    float _1517 = _1495 * 0.636619746685028076171875;
    float3 _3952 = float3(_1513, _1515, _1505);
    float _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3952, float3(0.0), isnan(_3952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3952, float3(0.0), isnan(_3952)), level(0.0)).x;
    float3 _3963 = float3(_1513, _1515, _1505);
    float4 _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3963, float3(0.0), isnan(_3963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3963, float3(0.0), isnan(_3963)), level(0.0)).xyzw;
    float _1524 = _1522.x;
    float _1526 = _1522.y;
    float _1528 = _1522.z;
    float _1530 = _1522.w;
    float _1532 = -_1503;
    float _1534 = fma(_1517, _1532, 1.0);
    float2 _3985 = float2(_1534, _1507);
    float3 _1538 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3985, float2(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3985, float2(0.0), isnan(_3985)), level(0.0)).xyz;
    float _1540 = _1538.x;
    float _1542 = _1538.y;
    float _1544 = _1538.z;
    float _1546 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1548 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1550 = _1213 > 0.0;
    bool _1552 = isnan(_1213);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan(0.0);
    bool _1558 = _1554 || _1556;
    float _1560 = _1465 * 0.5;
    float _1562 = _1213 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1564 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1548);
    float _1566 = exp2(_1546);
    float _1568 = _1491 + _1465;
    float _1570 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1564);
    float _1572 = _1568 * 0.5;
    float _1574 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1570);
    float _1576 = fma(_1501, -0.5, _1560);
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1580 = _1574 + _1465;
    out.gl_Position.x = _1491;
    out.gl_Position.y = _1501;
    out.gl_Position.z = _1574;
    out.gl_Position.w = _1465;
    float _1582 = _1580 * 0.5;
    float _1584 = -_1566;
    float _1586 = _1584 + 1.0;
    out.m_47.x = _1578;
    float _1588 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1572;
    out.m_64.y = _1576;
    out.m_64.z = _1582;
    out.m_64.w = _1465;
    float _1590 = -_1588;
    float _1592 = _1590 + 1.0;
    float _1594 = _1588 * _1519;
    float _1596 = _1530 * _1594;
    float _1598 = _1530 * _1592;
    float _1600 = _1544 * _1594;
    float _1602 = fma(_1540, _1596, _1524);
    float _1604 = fma(_1542, _1596, _1526);
    float _1606 = fma(_1530, _1600, _1528);
    out.m_66.x = _1602;
    out.m_66.y = _1604;
    out.m_66.z = _1606;
    out.m_66.w = _1598;
    if (_1558)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1608 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1608;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

