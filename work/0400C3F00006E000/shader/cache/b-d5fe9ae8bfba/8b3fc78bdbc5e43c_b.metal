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
    bool _973 = false;
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
        float _1577 = as_type<float>(_101);
        out.gl_Position.z = _1577;
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
        float _1646 = as_type<float>(_137);
        out.gl_Position.z = _1646;
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
    float _401 = _373;
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
    float _683 = _677 * _675;
    float _685 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _691 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _693 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _681);
    float _695 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _685);
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
    float _701 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _703 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _707 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
    float _709 = _701 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _717 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _719 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _721 = _709 + _713;
    float _723 = _711 + _715;
    float _725 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _717);
    float _727 = in.m_51.y;
    float _729 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _731 = _721 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _735 = _723 + _733;
    float _737 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].x, _719);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _725);
    float _741 = _731 * _731;
    float _743 = _735 * _735;
    float _745 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _749 = _741 + _743;
    float _751 = _745 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _753 = -_669;
    float _755 = _487 ? _753 : _669;
    float _757 = sqrt(_749);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _761 = _759 != 0;
    bool _763 = !_761;
    float _765 = _763 ? _669 : _755;
    bool _767 = _727 > 0.5;
    float _769 = _747 + _751;
    bool _771 = _757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _773 = _755;
    float _775 = _691;
    float _777 = _725;
    float _779 = _719;
    if (!_771)
    {
        _773 = _743;
    }
    float _781 = _773;
    float _783 = _781;
    if (!_771)
    {
        _775 = _741;
    }
    float _785 = _775;
    float _787 = _785;
    if (!_771)
    {
        _401 = _721;
    }
    float _789 = _401;
    float _791 = _789;
    if (!_771)
    {
        _777 = _723;
    }
    float _793 = _777;
    float _795 = _793;
    if (!_771)
    {
        _779 = _769;
    }
    float _797 = _779;
    bool _799 = !_771;
    float _801 = _797;
    if (!_799)
    {
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _807 = _757 + _805;
        float _809 = _769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = rsqrt(_749);
        float _813 = _807 * _803;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = _815 * 6.283185482025146484375;
        float _819 = sin(_817);
        float _821 = _815 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = fma(_819, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _827 = _811 * _825;
        float _829 = _823 + (-1.0);
        float _831 = fma(_731, _827, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _833 = fma(_735, _827, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _835 = _829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _839 = _831 + _837;
        float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _843 = _833 + _841;
        float _845 = fma(_769, _823, _835);
        float _847 = _839 * _839;
        float _849 = _843 * _843;
        _801 = _845;
        _787 = _847;
        _783 = _849;
        _791 = _831;
        _795 = _833;
    }
    float _851 = _801;
    float _853 = _787;
    float _855 = _783;
    float _857 = _791;
    float _859 = _795;
    float _861 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _863 = _851 + _861;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _867 = _865 != 0;
    float _869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _871 = -_657;
    int _873 = _767 ? as_type<int>(_871) : as_type<int>(_657);
    float _875 = fma(_863, _863, _853);
    float _877 = _765 + 0.5;
    bool _879 = !_867;
    float _881 = _879 ? _657 : as_type<float>(_873);
    float _883 = _875 + _855;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _887 = -_881;
    float _889 = _887 + 0.5;
    float _891 = sqrt(_883);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _905 = _889 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _907 = _885 * _645;
    float _909 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _905 * _869;
    bool _925 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _927 = isnan(_891);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _933 = _929 || _931;
    out.m_58.x = _913;
    out.m_58.y = _915;
    out.m_58.z = _917;
    out.m_58.w = _911;
    out.m_60.x = _909;
    out.m_60.y = _919;
    out.m_60.z = _921;
    out.m_62.x = _907;
    out.m_62.y = _923;
    float _935 = _901;
    float _937 = _869;
    if (!_933)
    {
        _935 = 1.0;
    }
    float _939 = _935;
    bool _941 = !_933;
    float _943 = _939;
    if (!_941)
    {
        bool _945 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _947 = isnan(_891);
        bool _949 = _945 || _947;
        bool _951 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _953 = _949 || _951;
        if (!_953)
        {
            float _955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _957 = _891 + _955;
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _961 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _959;
            float _963 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _965 = _963 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _967 = 1.0 / _961;
            float _969 = _957 * _967;
            float _971 = fma(_969, _965, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _943 = _971;
            _973 = true;
        }
        else
        {
            bool _975 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _977 = isnan(_891);
            bool _979 = _975 || _977;
            bool _981 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _983 = _979 || _981;
            if (!_983)
            {
                float _985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _987 = _891 + _985;
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _991 = _989 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _993 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _995 = _993 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _997 = 1.0 / _991;
                float _999 = _987 * _997;
                float _1001 = fma(_999, _995, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _943 = _1001;
                _973 = true;
            }
            else
            {
                _943 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _973 = false;
    float _1003 = _943;
    float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1007 = _851 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1011 = _857 + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1015 = _859 + _1013;
    float _1017 = fma(_1007, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1019 = fma(_1011, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1021 = fma(_1015, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _1017 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1019 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = rsqrt(_1039);
    float _1043 = sqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1029 * _1045;
    float _1049 = _1033 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1003;
    float _1067 = _1041;
    float _1069 = _1063;
    float _1071 = _1025;
    float _1073 = _1047;
    if (_1059)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1075;
    }
    float _1077 = _1065;
    if (_1059)
    {
        float _1079 = rsqrt(_1055);
        _1067 = _1079;
    }
    float _1081 = _1067;
    float _1083 = _1077;
    float _1085 = _1081;
    if (_1059)
    {
        float _1087 = _1063 * _1077;
        _1069 = _1087;
    }
    float _1089 = _1069;
    if (_1059)
    {
        float _1091 = _1089 * 0.15915493667125701904296875;
        _1083 = _1091;
    }
    float _1093 = _1083;
    float _1095 = _1033;
    float _1097 = _1093;
    if (_1059)
    {
        float _1099 = _1093 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        _1095 = _1101;
    }
    float _1103 = _1095;
    float _1105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1107 = precise::max(0.0, _1105);
    float _1109 = _1007;
    float _1111 = _1107;
    if (_1059)
    {
        float _1113 = _1093 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = -_1045;
    float _1121 = -_1107;
    float _1123 = fma(_1025, _1119, _1121);
    if (_1059)
    {
        float _1125 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1125;
    }
    float _1127 = _1071;
    float _1129 = _1127;
    float _1131 = _1103;
    if (_1059)
    {
        float _1133 = fma(_1103, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = _1135;
    if (!_1059)
    {
        _1131 = _1049;
    }
    float _1139 = _1131;
    float _1141 = _1139;
    if (_1059)
    {
        float _1143 = _1117 + (-1.0);
        _1111 = _1143;
    }
    float _1145 = _1111;
    float _1147 = _1145;
    if (_1059)
    {
        float _1149 = _1081 * _1135;
        _937 = _1149;
    }
    float _1151 = _937;
    if (!_1059)
    {
        _1085 = _1123;
    }
    float _1153 = _1085;
    float _1155 = _1153;
    if (_1059)
    {
        float _1157 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1097 = _1157;
    }
    float _1159 = _1097;
    if (_1059)
    {
        float _1161 = _1047 * _1151;
        _1073 = _1161;
    }
    float _1163 = _1073;
    if (!_1059)
    {
        _1137 = _1051;
    }
    float _1165 = _1137;
    float _1167 = _1165;
    if (_1059)
    {
        float _1169 = _1049 * _1151;
        _1141 = _1169;
    }
    float _1171 = _1141;
    if (_1059)
    {
        float _1173 = fma(_1123, _1117, _1159);
        _1155 = _1173;
    }
    float _1175 = _1155;
    if (_1059)
    {
        float _1177 = _1163 * _1163;
        _1167 = _1177;
    }
    float _1179 = _1167;
    if (!_1059)
    {
        _1147 = _1053;
    }
    float _1181 = _1147;
    float _1183 = _1181;
    if (_1059)
    {
        float _1185 = _1171 * _1171;
        _1183 = _1185;
    }
    float _1187 = _1183;
    float _1189 = fma(_1175, _1175, _1179);
    float _1191 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1193 = _1189 + _1187;
    float _1195 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1199 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1197);
    float _1201 = precise::clamp(_1199, 0.0, 1.0);
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1205 = rsqrt(_1193);
    float _1207 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1195);
    float _1209 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1211 = -_1201;
    float _1213 = _1211 + 1.0;
    float _1215 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1207);
    float _1219 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1209);
    float _1221 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1191);
    float _1223 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1227 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1219);
    float _1229 = abs(_1213);
    float _1231 = log2(_1229);
    float _1233 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1221);
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1237 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1223);
    float _1241 = _1205 * _1163;
    float _1243 = _1205 * _1175;
    float _1245 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1251 = _1205 * _1171;
    float _1253 = -_1235;
    float _1255 = fma(_1253, _1203, 1.0);
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1247);
    float _1259 = -_1249;
    float _1261 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1259);
    float _1263 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1265 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1267 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1257);
    float _1269 = -_1251;
    float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1261);
    float _1273 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = log2(_1255);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1267);
    float _1279 = fma(_1271, -0.5, 0.5);
    float _1281 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1283 = fma(_1271, 0.5, 0.5);
    float _1285 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1265);
    float _1287 = _1243 + 1.0;
    float _1289 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1281);
    float _1291 = exp2(_1273);
    float _1293 = fma(_1283, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1295 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1285);
    float _1297 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1289);
    float _1299 = fma(_1283, _1293, -0.212114393711090087890625);
    float _1301 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1295);
    float _1303 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1297);
    float _1305 = 1.0 / _1277;
    float _1307 = _1275 * 0.693147182464599609375;
    float _1309 = fma(_1283, _1299, 1.570728778839111328125);
    float _1311 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1313 = sqrt(_1279);
    float _1315 = -_1243;
    float _1317 = fma(_1291, _1287, _1315);
    float _1319 = fma(_1317, 0.5, 0.5);
    float _1321 = _1301 * _1305;
    float _1323 = _1303 * _1305;
    float _1325 = fma(_1321, 0.5, 0.5);
    float _1327 = fma(_1323, -0.5, 0.5);
    float _1329 = _1313 * 0.636619746685028076171875;
    float _1331 = -_1309;
    float _1333 = fma(_1329, _1331, 1.0);
    float3 _3594 = float3(_1325, _1327, _1311);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3594, float3(0.0), isnan(_3594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3594, float3(0.0), isnan(_3594)), level(0.0)).x;
    float3 _3605 = float3(_1325, _1327, _1311);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3605, float3(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3605, float3(0.0), isnan(_3605)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float2 _3622 = float2(_1333, _1319);
    float3 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3622, float2(0.0), isnan(_3622)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3622, float2(0.0), isnan(_3622)), level(0.0)).xyz;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = _747 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1360 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1358);
    float _1362 = _747 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1364 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1366 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1362);
    bool _1368 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.5);
    bool _1376 = _1372 || _1374;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1380 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1366);
    float _1382 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1384 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1386 = 1.0 / _1378;
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1390 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1384);
    float _1392 = _1388 + _1378;
    float _1394 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1390);
    float _1396 = exp2(_1382);
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1376)
    {
        _1398 = 1.0;
    }
    float _1400 = _1398;
    float _1402 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1394);
    float _1404 = _1392 * _1386;
    float _1406 = _1404 * 0.5;
    float _1408 = _1400;
    if (!_1376)
    {
        float _1410 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1414 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1412);
        float _1416 = _1410 * 0.15915493667125701904296875;
        float _1418 = _1416 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1416 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = 1.0 / _1420;
        float _1432 = _1424 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = _1428 * _1430;
        float _1438 = 1.0 / _1414;
        float _1440 = _1434 * _1436;
        float _1442 = _1424 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1446;
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1452 = _1438 * _1450;
        float _1454 = 1.0 / _1440;
        float _1456 = 1.0 / _1448;
        float _1458 = _1444 * _1454;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1462 = fma(_1458, _1452, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        _1408 = _1466;
    }
    float _1468 = _1408;
    float _1470 = _1277 * 0.5;
    float _1472 = -_1396;
    float _1474 = _1472 + 1.0;
    bool _1476 = _1468 > 0.0;
    bool _1478 = isnan(_1468);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1488 = fma(_1303, -0.5, _1470);
    float _1490 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1492 = _1402 + _1277;
    float _1494 = _1301 + _1277;
    out.gl_Position.x = _1301;
    out.gl_Position.y = _1303;
    out.gl_Position.z = _1402;
    out.gl_Position.w = _1277;
    float _1496 = _1490 * _1335;
    float _1498 = -_1490;
    float _1500 = _1498 + 1.0;
    float _1502 = _1492 * 0.5;
    float _1504 = _1346 * _1496;
    float _1506 = _1356 * _1496;
    float _1508 = _1494 * 0.5;
    float _1510 = _1486 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1512 = fma(_1352, _1504, _1340);
    float _1514 = fma(_1354, _1504, _1342);
    float _1516 = _1346 * _1500;
    float _1518 = fma(_1346, _1506, _1344);
    out.m_64.x = _1508;
    out.m_64.y = _1488;
    out.m_64.z = _1502;
    out.m_64.w = _1277;
    out.m_47.x = _1510;
    out.m_66.x = _1512;
    out.m_66.y = _1514;
    out.m_66.z = _1518;
    out.m_66.w = _1516;
    if (_1484)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1520 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1520;
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
    bool _973 = false;
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
        float _1577 = as_type<float>(_101);
        out.gl_Position.z = _1577;
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
        float _1646 = as_type<float>(_137);
        out.gl_Position.z = _1646;
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
    float _401 = _373;
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
    float _683 = _677 * _675;
    float _685 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _691 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _693 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _681);
    float _695 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _685);
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
    float _701 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _703 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _707 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
    float _709 = _701 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _717 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _719 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _721 = _709 + _713;
    float _723 = _711 + _715;
    float _725 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _717);
    float _727 = in.m_51.y;
    float _729 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _731 = _721 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _735 = _723 + _733;
    float _737 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].x, _719);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _725);
    float _741 = _731 * _731;
    float _743 = _735 * _735;
    float _745 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _749 = _741 + _743;
    float _751 = _745 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _753 = -_669;
    float _755 = _487 ? _753 : _669;
    float _757 = sqrt(_749);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _761 = _759 != 0;
    bool _763 = !_761;
    float _765 = _763 ? _669 : _755;
    bool _767 = _727 > 0.5;
    float _769 = _747 + _751;
    bool _771 = _757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _773 = _755;
    float _775 = _691;
    float _777 = _725;
    float _779 = _719;
    if (!_771)
    {
        _773 = _743;
    }
    float _781 = _773;
    float _783 = _781;
    if (!_771)
    {
        _775 = _741;
    }
    float _785 = _775;
    float _787 = _785;
    if (!_771)
    {
        _401 = _721;
    }
    float _789 = _401;
    float _791 = _789;
    if (!_771)
    {
        _777 = _723;
    }
    float _793 = _777;
    float _795 = _793;
    if (!_771)
    {
        _779 = _769;
    }
    float _797 = _779;
    bool _799 = !_771;
    float _801 = _797;
    if (!_799)
    {
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _807 = _757 + _805;
        float _809 = _769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = rsqrt(_749);
        float _813 = _807 * _803;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = _815 * 6.283185482025146484375;
        float _819 = sin(_817);
        float _821 = _815 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = fma(_819, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _827 = _811 * _825;
        float _829 = _823 + (-1.0);
        float _831 = fma(_731, _827, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _833 = fma(_735, _827, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _835 = _829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _839 = _831 + _837;
        float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _843 = _833 + _841;
        float _845 = fma(_769, _823, _835);
        float _847 = _839 * _839;
        float _849 = _843 * _843;
        _801 = _845;
        _787 = _847;
        _783 = _849;
        _791 = _831;
        _795 = _833;
    }
    float _851 = _801;
    float _853 = _787;
    float _855 = _783;
    float _857 = _791;
    float _859 = _795;
    float _861 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _863 = _851 + _861;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _867 = _865 != 0;
    float _869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _871 = -_657;
    int _873 = _767 ? as_type<int>(_871) : as_type<int>(_657);
    float _875 = fma(_863, _863, _853);
    float _877 = _765 + 0.5;
    bool _879 = !_867;
    float _881 = _879 ? _657 : as_type<float>(_873);
    float _883 = _875 + _855;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _887 = -_881;
    float _889 = _887 + 0.5;
    float _891 = sqrt(_883);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _905 = _889 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _907 = _885 * _645;
    float _909 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _905 * _869;
    bool _925 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _927 = isnan(_891);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _933 = _929 || _931;
    out.m_58.x = _913;
    out.m_58.y = _915;
    out.m_58.z = _917;
    out.m_58.w = _911;
    out.m_60.x = _909;
    out.m_60.y = _919;
    out.m_60.z = _921;
    out.m_62.x = _907;
    out.m_62.y = _923;
    float _935 = _901;
    float _937 = _869;
    if (!_933)
    {
        _935 = 1.0;
    }
    float _939 = _935;
    bool _941 = !_933;
    float _943 = _939;
    if (!_941)
    {
        bool _945 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _947 = isnan(_891);
        bool _949 = _945 || _947;
        bool _951 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _953 = _949 || _951;
        if (!_953)
        {
            float _955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _957 = _891 + _955;
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _961 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _959;
            float _963 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _965 = _963 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _967 = 1.0 / _961;
            float _969 = _957 * _967;
            float _971 = fma(_969, _965, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _943 = _971;
            _973 = true;
        }
        else
        {
            bool _975 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _977 = isnan(_891);
            bool _979 = _975 || _977;
            bool _981 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _983 = _979 || _981;
            if (!_983)
            {
                float _985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _987 = _891 + _985;
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _991 = _989 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _993 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _995 = _993 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _997 = 1.0 / _991;
                float _999 = _987 * _997;
                float _1001 = fma(_999, _995, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _943 = _1001;
                _973 = true;
            }
            else
            {
                _943 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _973 = false;
    float _1003 = _943;
    float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1007 = _851 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1011 = _857 + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1015 = _859 + _1013;
    float _1017 = fma(_1007, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1019 = fma(_1011, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1021 = fma(_1015, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _1017 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1019 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = rsqrt(_1039);
    float _1043 = sqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1029 * _1045;
    float _1049 = _1033 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1003;
    float _1067 = _1041;
    float _1069 = _1063;
    float _1071 = _1025;
    float _1073 = _1047;
    if (_1059)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1075;
    }
    float _1077 = _1065;
    if (_1059)
    {
        float _1079 = rsqrt(_1055);
        _1067 = _1079;
    }
    float _1081 = _1067;
    float _1083 = _1077;
    float _1085 = _1081;
    if (_1059)
    {
        float _1087 = _1063 * _1077;
        _1069 = _1087;
    }
    float _1089 = _1069;
    if (_1059)
    {
        float _1091 = _1089 * 0.15915493667125701904296875;
        _1083 = _1091;
    }
    float _1093 = _1083;
    float _1095 = _1033;
    float _1097 = _1093;
    if (_1059)
    {
        float _1099 = _1093 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        _1095 = _1101;
    }
    float _1103 = _1095;
    float _1105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1107 = precise::max(0.0, _1105);
    float _1109 = _1007;
    float _1111 = _1107;
    if (_1059)
    {
        float _1113 = _1093 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = -_1045;
    float _1121 = -_1107;
    float _1123 = fma(_1025, _1119, _1121);
    if (_1059)
    {
        float _1125 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1125;
    }
    float _1127 = _1071;
    float _1129 = _1127;
    float _1131 = _1103;
    if (_1059)
    {
        float _1133 = fma(_1103, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = _1135;
    if (!_1059)
    {
        _1131 = _1049;
    }
    float _1139 = _1131;
    float _1141 = _1139;
    if (_1059)
    {
        float _1143 = _1117 + (-1.0);
        _1111 = _1143;
    }
    float _1145 = _1111;
    float _1147 = _1145;
    if (_1059)
    {
        float _1149 = _1081 * _1135;
        _937 = _1149;
    }
    float _1151 = _937;
    if (!_1059)
    {
        _1085 = _1123;
    }
    float _1153 = _1085;
    float _1155 = _1153;
    if (_1059)
    {
        float _1157 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1097 = _1157;
    }
    float _1159 = _1097;
    if (_1059)
    {
        float _1161 = _1047 * _1151;
        _1073 = _1161;
    }
    float _1163 = _1073;
    if (!_1059)
    {
        _1137 = _1051;
    }
    float _1165 = _1137;
    float _1167 = _1165;
    if (_1059)
    {
        float _1169 = _1049 * _1151;
        _1141 = _1169;
    }
    float _1171 = _1141;
    if (_1059)
    {
        float _1173 = fma(_1123, _1117, _1159);
        _1155 = _1173;
    }
    float _1175 = _1155;
    if (_1059)
    {
        float _1177 = _1163 * _1163;
        _1167 = _1177;
    }
    float _1179 = _1167;
    if (!_1059)
    {
        _1147 = _1053;
    }
    float _1181 = _1147;
    float _1183 = _1181;
    if (_1059)
    {
        float _1185 = _1171 * _1171;
        _1183 = _1185;
    }
    float _1187 = _1183;
    float _1189 = fma(_1175, _1175, _1179);
    float _1191 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1193 = _1189 + _1187;
    float _1195 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1199 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1197);
    float _1201 = precise::clamp(_1199, 0.0, 1.0);
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1205 = rsqrt(_1193);
    float _1207 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1195);
    float _1209 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1211 = -_1201;
    float _1213 = _1211 + 1.0;
    float _1215 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1207);
    float _1219 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1209);
    float _1221 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1191);
    float _1223 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1227 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1219);
    float _1229 = abs(_1213);
    float _1231 = log2(_1229);
    float _1233 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1221);
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1237 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1223);
    float _1241 = _1205 * _1163;
    float _1243 = _1205 * _1175;
    float _1245 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1251 = _1205 * _1171;
    float _1253 = -_1235;
    float _1255 = fma(_1253, _1203, 1.0);
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1247);
    float _1259 = -_1249;
    float _1261 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1259);
    float _1263 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1265 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1267 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1257);
    float _1269 = -_1251;
    float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1261);
    float _1273 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = log2(_1255);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1267);
    float _1279 = fma(_1271, -0.5, 0.5);
    float _1281 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1283 = fma(_1271, 0.5, 0.5);
    float _1285 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1265);
    float _1287 = _1243 + 1.0;
    float _1289 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1281);
    float _1291 = exp2(_1273);
    float _1293 = fma(_1283, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1295 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1285);
    float _1297 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1289);
    float _1299 = fma(_1283, _1293, -0.212114393711090087890625);
    float _1301 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1295);
    float _1303 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1297);
    float _1305 = 1.0 / _1277;
    float _1307 = _1275 * 0.693147182464599609375;
    float _1309 = fma(_1283, _1299, 1.570728778839111328125);
    float _1311 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1313 = sqrt(_1279);
    float _1315 = -_1243;
    float _1317 = fma(_1291, _1287, _1315);
    float _1319 = fma(_1317, 0.5, 0.5);
    float _1321 = _1301 * _1305;
    float _1323 = _1303 * _1305;
    float _1325 = fma(_1321, 0.5, 0.5);
    float _1327 = fma(_1323, -0.5, 0.5);
    float _1329 = _1313 * 0.636619746685028076171875;
    float _1331 = -_1309;
    float _1333 = fma(_1329, _1331, 1.0);
    float3 _3594 = float3(_1325, _1327, _1311);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3594, float3(0.0), isnan(_3594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3594, float3(0.0), isnan(_3594)), level(0.0)).x;
    float3 _3605 = float3(_1325, _1327, _1311);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3605, float3(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3605, float3(0.0), isnan(_3605)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float2 _3622 = float2(_1333, _1319);
    float3 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3622, float2(0.0), isnan(_3622)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3622, float2(0.0), isnan(_3622)), level(0.0)).xyz;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = _747 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1360 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1358);
    float _1362 = _747 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1364 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1366 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1362);
    bool _1368 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.5);
    bool _1376 = _1372 || _1374;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1380 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1366);
    float _1382 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1384 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1386 = 1.0 / _1378;
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1390 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1384);
    float _1392 = _1388 + _1378;
    float _1394 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1390);
    float _1396 = exp2(_1382);
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1376)
    {
        _1398 = 1.0;
    }
    float _1400 = _1398;
    float _1402 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1394);
    float _1404 = _1392 * _1386;
    float _1406 = _1404 * 0.5;
    float _1408 = _1400;
    if (!_1376)
    {
        float _1410 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1414 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1412);
        float _1416 = _1410 * 0.15915493667125701904296875;
        float _1418 = _1416 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1416 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = 1.0 / _1420;
        float _1432 = _1424 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = _1428 * _1430;
        float _1438 = 1.0 / _1414;
        float _1440 = _1434 * _1436;
        float _1442 = _1424 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1446;
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1452 = _1438 * _1450;
        float _1454 = 1.0 / _1440;
        float _1456 = 1.0 / _1448;
        float _1458 = _1444 * _1454;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1462 = fma(_1458, _1452, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        _1408 = _1466;
    }
    float _1468 = _1408;
    float _1470 = _1277 * 0.5;
    float _1472 = -_1396;
    float _1474 = _1472 + 1.0;
    bool _1476 = _1468 > 0.0;
    bool _1478 = isnan(_1468);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1488 = fma(_1303, -0.5, _1470);
    float _1490 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1492 = _1402 + _1277;
    float _1494 = _1301 + _1277;
    out.gl_Position.x = _1301;
    out.gl_Position.y = _1303;
    out.gl_Position.z = _1402;
    out.gl_Position.w = _1277;
    float _1496 = _1490 * _1335;
    float _1498 = -_1490;
    float _1500 = _1498 + 1.0;
    float _1502 = _1492 * 0.5;
    float _1504 = _1346 * _1496;
    float _1506 = _1356 * _1496;
    float _1508 = _1494 * 0.5;
    float _1510 = _1486 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1512 = fma(_1352, _1504, _1340);
    float _1514 = fma(_1354, _1504, _1342);
    float _1516 = _1346 * _1500;
    float _1518 = fma(_1346, _1506, _1344);
    out.m_64.x = _1508;
    out.m_64.y = _1488;
    out.m_64.z = _1502;
    out.m_64.w = _1277;
    out.m_47.x = _1510;
    out.m_66.x = _1512;
    out.m_66.y = _1514;
    out.m_66.z = _1518;
    out.m_66.w = _1516;
    if (_1484)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1520 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1520;
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
    bool _973 = false;
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
        float _1577 = as_type<float>(_101);
        out.gl_Position.z = _1577;
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
        float _1646 = as_type<float>(_137);
        out.gl_Position.z = _1646;
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
    float _401 = _373;
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
    float _683 = _677 * _675;
    float _685 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _691 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _693 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _681);
    float _695 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _685);
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
    float _701 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _693);
    float _703 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _707 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
    float _709 = _701 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _717 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _719 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _721 = _709 + _713;
    float _723 = _711 + _715;
    float _725 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _717);
    float _727 = in.m_51.y;
    float _729 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _731 = _721 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _735 = _723 + _733;
    float _737 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].x, _719);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _725);
    float _741 = _731 * _731;
    float _743 = _735 * _735;
    float _745 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _749 = _741 + _743;
    float _751 = _745 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _753 = -_669;
    float _755 = _487 ? _753 : _669;
    float _757 = sqrt(_749);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _761 = _759 != 0;
    bool _763 = !_761;
    float _765 = _763 ? _669 : _755;
    bool _767 = _727 > 0.5;
    float _769 = _747 + _751;
    bool _771 = _757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _773 = _755;
    float _775 = _691;
    float _777 = _725;
    float _779 = _719;
    if (!_771)
    {
        _773 = _743;
    }
    float _781 = _773;
    float _783 = _781;
    if (!_771)
    {
        _775 = _741;
    }
    float _785 = _775;
    float _787 = _785;
    if (!_771)
    {
        _401 = _721;
    }
    float _789 = _401;
    float _791 = _789;
    if (!_771)
    {
        _777 = _723;
    }
    float _793 = _777;
    float _795 = _793;
    if (!_771)
    {
        _779 = _769;
    }
    float _797 = _779;
    bool _799 = !_771;
    float _801 = _797;
    if (!_799)
    {
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _807 = _757 + _805;
        float _809 = _769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = rsqrt(_749);
        float _813 = _807 * _803;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = _815 * 6.283185482025146484375;
        float _819 = sin(_817);
        float _821 = _815 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = fma(_819, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _827 = _811 * _825;
        float _829 = _823 + (-1.0);
        float _831 = fma(_731, _827, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _833 = fma(_735, _827, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _835 = _829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _839 = _831 + _837;
        float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _843 = _833 + _841;
        float _845 = fma(_769, _823, _835);
        float _847 = _839 * _839;
        float _849 = _843 * _843;
        _801 = _845;
        _787 = _847;
        _783 = _849;
        _791 = _831;
        _795 = _833;
    }
    float _851 = _801;
    float _853 = _787;
    float _855 = _783;
    float _857 = _791;
    float _859 = _795;
    float _861 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _863 = _851 + _861;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _867 = _865 != 0;
    float _869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _871 = -_657;
    int _873 = _767 ? as_type<int>(_871) : as_type<int>(_657);
    float _875 = fma(_863, _863, _853);
    float _877 = _765 + 0.5;
    bool _879 = !_867;
    float _881 = _879 ? _657 : as_type<float>(_873);
    float _883 = _875 + _855;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _887 = -_881;
    float _889 = _887 + 0.5;
    float _891 = sqrt(_883);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _905 = _889 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _907 = _885 * _645;
    float _909 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _905 * _869;
    bool _925 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _927 = isnan(_891);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _933 = _929 || _931;
    out.m_58.x = _913;
    out.m_58.y = _915;
    out.m_58.z = _917;
    out.m_58.w = _911;
    out.m_60.x = _909;
    out.m_60.y = _919;
    out.m_60.z = _921;
    out.m_62.x = _907;
    out.m_62.y = _923;
    float _935 = _901;
    float _937 = _869;
    if (!_933)
    {
        _935 = 1.0;
    }
    float _939 = _935;
    bool _941 = !_933;
    float _943 = _939;
    if (!_941)
    {
        bool _945 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _947 = isnan(_891);
        bool _949 = _945 || _947;
        bool _951 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _953 = _949 || _951;
        if (!_953)
        {
            float _955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _957 = _891 + _955;
            float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _961 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _959;
            float _963 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _965 = _963 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _967 = 1.0 / _961;
            float _969 = _957 * _967;
            float _971 = fma(_969, _965, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _943 = _971;
            _973 = true;
        }
        else
        {
            bool _975 = _891 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _977 = isnan(_891);
            bool _979 = _975 || _977;
            bool _981 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _983 = _979 || _981;
            if (!_983)
            {
                float _985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _987 = _891 + _985;
                float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _991 = _989 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _993 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _995 = _993 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _997 = 1.0 / _991;
                float _999 = _987 * _997;
                float _1001 = fma(_999, _995, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _943 = _1001;
                _973 = true;
            }
            else
            {
                _943 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _973 = false;
    float _1003 = _943;
    float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1007 = _851 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1011 = _857 + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1015 = _859 + _1013;
    float _1017 = fma(_1007, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1019 = fma(_1011, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1021 = fma(_1015, _1003, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _1017 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1019 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1021 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = rsqrt(_1039);
    float _1043 = sqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1029 * _1045;
    float _1049 = _1033 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1003;
    float _1067 = _1041;
    float _1069 = _1063;
    float _1071 = _1025;
    float _1073 = _1047;
    if (_1059)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1075;
    }
    float _1077 = _1065;
    if (_1059)
    {
        float _1079 = rsqrt(_1055);
        _1067 = _1079;
    }
    float _1081 = _1067;
    float _1083 = _1077;
    float _1085 = _1081;
    if (_1059)
    {
        float _1087 = _1063 * _1077;
        _1069 = _1087;
    }
    float _1089 = _1069;
    if (_1059)
    {
        float _1091 = _1089 * 0.15915493667125701904296875;
        _1083 = _1091;
    }
    float _1093 = _1083;
    float _1095 = _1033;
    float _1097 = _1093;
    if (_1059)
    {
        float _1099 = _1093 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        _1095 = _1101;
    }
    float _1103 = _1095;
    float _1105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1107 = precise::max(0.0, _1105);
    float _1109 = _1007;
    float _1111 = _1107;
    if (_1059)
    {
        float _1113 = _1093 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = -_1045;
    float _1121 = -_1107;
    float _1123 = fma(_1025, _1119, _1121);
    if (_1059)
    {
        float _1125 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1125;
    }
    float _1127 = _1071;
    float _1129 = _1127;
    float _1131 = _1103;
    if (_1059)
    {
        float _1133 = fma(_1103, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = _1135;
    if (!_1059)
    {
        _1131 = _1049;
    }
    float _1139 = _1131;
    float _1141 = _1139;
    if (_1059)
    {
        float _1143 = _1117 + (-1.0);
        _1111 = _1143;
    }
    float _1145 = _1111;
    float _1147 = _1145;
    if (_1059)
    {
        float _1149 = _1081 * _1135;
        _937 = _1149;
    }
    float _1151 = _937;
    if (!_1059)
    {
        _1085 = _1123;
    }
    float _1153 = _1085;
    float _1155 = _1153;
    if (_1059)
    {
        float _1157 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1097 = _1157;
    }
    float _1159 = _1097;
    if (_1059)
    {
        float _1161 = _1047 * _1151;
        _1073 = _1161;
    }
    float _1163 = _1073;
    if (!_1059)
    {
        _1137 = _1051;
    }
    float _1165 = _1137;
    float _1167 = _1165;
    if (_1059)
    {
        float _1169 = _1049 * _1151;
        _1141 = _1169;
    }
    float _1171 = _1141;
    if (_1059)
    {
        float _1173 = fma(_1123, _1117, _1159);
        _1155 = _1173;
    }
    float _1175 = _1155;
    if (_1059)
    {
        float _1177 = _1163 * _1163;
        _1167 = _1177;
    }
    float _1179 = _1167;
    if (!_1059)
    {
        _1147 = _1053;
    }
    float _1181 = _1147;
    float _1183 = _1181;
    if (_1059)
    {
        float _1185 = _1171 * _1171;
        _1183 = _1185;
    }
    float _1187 = _1183;
    float _1189 = fma(_1175, _1175, _1179);
    float _1191 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1193 = _1189 + _1187;
    float _1195 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1199 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1197);
    float _1201 = precise::clamp(_1199, 0.0, 1.0);
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1205 = rsqrt(_1193);
    float _1207 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1195);
    float _1209 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1211 = -_1201;
    float _1213 = _1211 + 1.0;
    float _1215 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1207);
    float _1219 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1209);
    float _1221 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1191);
    float _1223 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1227 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1219);
    float _1229 = abs(_1213);
    float _1231 = log2(_1229);
    float _1233 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1221);
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1237 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1223);
    float _1241 = _1205 * _1163;
    float _1243 = _1205 * _1175;
    float _1245 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1251 = _1205 * _1171;
    float _1253 = -_1235;
    float _1255 = fma(_1253, _1203, 1.0);
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1247);
    float _1259 = -_1249;
    float _1261 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1259);
    float _1263 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1265 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1267 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1257);
    float _1269 = -_1251;
    float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1261);
    float _1273 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = log2(_1255);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1267);
    float _1279 = fma(_1271, -0.5, 0.5);
    float _1281 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1283 = fma(_1271, 0.5, 0.5);
    float _1285 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1265);
    float _1287 = _1243 + 1.0;
    float _1289 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1281);
    float _1291 = exp2(_1273);
    float _1293 = fma(_1283, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1295 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1285);
    float _1297 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1289);
    float _1299 = fma(_1283, _1293, -0.212114393711090087890625);
    float _1301 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1295);
    float _1303 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1297);
    float _1305 = 1.0 / _1277;
    float _1307 = _1275 * 0.693147182464599609375;
    float _1309 = fma(_1283, _1299, 1.570728778839111328125);
    float _1311 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1313 = sqrt(_1279);
    float _1315 = -_1243;
    float _1317 = fma(_1291, _1287, _1315);
    float _1319 = fma(_1317, 0.5, 0.5);
    float _1321 = _1301 * _1305;
    float _1323 = _1303 * _1305;
    float _1325 = fma(_1321, 0.5, 0.5);
    float _1327 = fma(_1323, -0.5, 0.5);
    float _1329 = _1313 * 0.636619746685028076171875;
    float _1331 = -_1309;
    float _1333 = fma(_1329, _1331, 1.0);
    float3 _3594 = float3(_1325, _1327, _1311);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3594, float3(0.0), isnan(_3594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3594, float3(0.0), isnan(_3594)), level(0.0)).x;
    float3 _3605 = float3(_1325, _1327, _1311);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3605, float3(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3605, float3(0.0), isnan(_3605)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float2 _3622 = float2(_1333, _1319);
    float3 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3622, float2(0.0), isnan(_3622)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3622, float2(0.0), isnan(_3622)), level(0.0)).xyz;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = _747 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1360 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1358);
    float _1362 = _747 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1364 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1366 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1362);
    bool _1368 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.5);
    bool _1376 = _1372 || _1374;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1380 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1366);
    float _1382 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1384 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1386 = 1.0 / _1378;
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1390 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1384);
    float _1392 = _1388 + _1378;
    float _1394 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1390);
    float _1396 = exp2(_1382);
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1376)
    {
        _1398 = 1.0;
    }
    float _1400 = _1398;
    float _1402 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1394);
    float _1404 = _1392 * _1386;
    float _1406 = _1404 * 0.5;
    float _1408 = _1400;
    if (!_1376)
    {
        float _1410 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1414 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1412);
        float _1416 = _1410 * 0.15915493667125701904296875;
        float _1418 = _1416 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1416 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = 1.0 / _1420;
        float _1432 = _1424 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = _1428 * _1430;
        float _1438 = 1.0 / _1414;
        float _1440 = _1434 * _1436;
        float _1442 = _1424 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1446;
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1452 = _1438 * _1450;
        float _1454 = 1.0 / _1440;
        float _1456 = 1.0 / _1448;
        float _1458 = _1444 * _1454;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1462 = fma(_1458, _1452, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        _1408 = _1466;
    }
    float _1468 = _1408;
    float _1470 = _1277 * 0.5;
    float _1472 = -_1396;
    float _1474 = _1472 + 1.0;
    bool _1476 = _1468 > 0.0;
    bool _1478 = isnan(_1468);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1488 = fma(_1303, -0.5, _1470);
    float _1490 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1492 = _1402 + _1277;
    float _1494 = _1301 + _1277;
    out.gl_Position.x = _1301;
    out.gl_Position.y = _1303;
    out.gl_Position.z = _1402;
    out.gl_Position.w = _1277;
    float _1496 = _1490 * _1335;
    float _1498 = -_1490;
    float _1500 = _1498 + 1.0;
    float _1502 = _1492 * 0.5;
    float _1504 = _1346 * _1496;
    float _1506 = _1356 * _1496;
    float _1508 = _1494 * 0.5;
    float _1510 = _1486 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1512 = fma(_1352, _1504, _1340);
    float _1514 = fma(_1354, _1504, _1342);
    float _1516 = _1346 * _1500;
    float _1518 = fma(_1346, _1506, _1344);
    out.m_64.x = _1508;
    out.m_64.y = _1488;
    out.m_64.z = _1502;
    out.m_64.w = _1277;
    out.m_47.x = _1510;
    out.m_66.x = _1512;
    out.m_66.y = _1514;
    out.m_66.z = _1518;
    out.m_66.w = _1516;
    if (_1484)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1520 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1520;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

