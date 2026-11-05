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
    bool _1019 = false;
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
        float _1623 = as_type<float>(_101);
        out.gl_Position.z = _1623;
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
        float _1692 = as_type<float>(_137);
        out.gl_Position.z = _1692;
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
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _453 = 1.0 / _439;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _455;
    bool _459 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _461 = isnan(_427);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = as_type<float>(int(gl_VertexIndex));
    float _473 = 1.0 / _443;
    bool _475 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _477 = isnan(_427);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _447;
    float _489 = _431 * _453;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _493 = _427 + _491;
    float _495 = -_485;
    float _497 = _495 + 1.0;
    float _499 = 1.0 / _451;
    float _501 = _435 * _473;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _505 = _427 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _509 = _427 + _507;
    int _511 = as_type<int>(_471) & 1;
    bool _513 = _511 != 0;
    int _515 = as_type<int>(_471) & 2;
    bool _517 = _515 != 0;
    bool _519 = _139 > 0.5;
    float _521 = 1.0 / _457;
    float _523 = _493 * _487;
    bool _525 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _527 = isnan(_427);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -_535;
    float _539 = _537 + 1.0;
    float _541 = _505 * _499;
    bool _543 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _545 = isnan(_427);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _535 * _497;
    bool _557 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _559 = isnan(_427);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _571 = isnan(_427);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _553 * _539;
    float _583 = -_553;
    float _585 = _583 + 1.0;
    float _587 = _509 * _521;
    float _589 = -_567;
    float _591 = _589 + 1.0;
    float _593 = _567 * _585;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = _469 * _591;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = -_469;
    float _615 = _613 + 1.0;
    float _617 = fma(_601, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _619 = fma(_597, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _621 = fma(_605, _501, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _623 = fma(_611, _501, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _625 = _579 * _615;
    float _627 = -_579;
    float _629 = _627 + 1.0;
    float _631 = _617 * _625;
    float _633 = _619 * _625;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _639;
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].x, _631);
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].y, _633);
    float _647 = fma(_637, _523, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _649 = fma(_641, _523, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _651 = fma(_621, _607, _643);
    float _653 = in.m_53.x;
    float _655 = in.m_53.y;
    float _657 = fma(_623, _607, _645);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = fma(_649, _593, _657);
    float _669 = fma(_661, _541, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _671;
    float _675 = fma(_665, _541, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _677 = fma(_647, _593, _651);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _679;
    float _683 = fma(_669, _581, _667);
    float _685 = fma(_673, _587, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _687 = fma(_675, _581, _677);
    float _689 = fma(_681, _587, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _693 = fma(_685, _555, _683);
    float _695 = fma(_689, _555, _687);
    float _697 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[148].y, _693);
    float _699 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[148].x, _695);
    bool _701 = !_517;
    float _703 = _701 ? (-0.5) : 0.5;
    float _705 = _697 * _655;
    float _707 = _699 * _653;
    float _709 = _397 * _705;
    bool _711 = !_513;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = _393 * _707;
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _703);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _713);
    float _723 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = _719 * _717;
    float _727 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _729 = _723 * _721;
    float _731 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _733 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _737 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _739 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _727);
    float _741 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _731);
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _735);
    float _747 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _749 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _741);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _743);
    float _753 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _745);
    float _755 = _747 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _757 = _749 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _761 = _753 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _763 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _765 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = _755 + _759;
    float _769 = _757 + _761;
    float _771 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _763);
    float _773 = in.m_51.y;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _777 = _767 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _781 = _769 + _779;
    float _783 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _785 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    float _787 = _777 * _777;
    float _789 = _781 * _781;
    float _791 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _783);
    float _793 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _795 = _787 + _789;
    float _797 = _791 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = -_713;
    float _801 = _519 ? _799 : _713;
    float _803 = sqrt(_795);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    bool _809 = !_807;
    float _811 = _809 ? _713 : _801;
    bool _813 = _773 > 0.5;
    float _815 = _793 + _797;
    bool _817 = _803 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _801;
    float _821 = _737;
    float _823 = _771;
    float _825 = _765;
    if (!_817)
    {
        _819 = _789;
    }
    float _827 = _819;
    float _829 = _827;
    if (!_817)
    {
        _821 = _787;
    }
    float _831 = _821;
    float _833 = _831;
    if (!_817)
    {
        _401 = _767;
    }
    float _835 = _401;
    float _837 = _835;
    if (!_817)
    {
        _823 = _769;
    }
    float _839 = _823;
    float _841 = _839;
    if (!_817)
    {
        _825 = _815;
    }
    float _843 = _825;
    bool _845 = !_817;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _853 = _803 + _851;
        float _855 = _815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = rsqrt(_795);
        float _859 = _853 * _849;
        float _861 = _859 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = sin(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = cos(_867);
        float _871 = fma(_865, _855, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _873 = _857 * _871;
        float _875 = _869 + (-1.0);
        float _877 = fma(_777, _873, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _879 = fma(_781, _873, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _881 = _875 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _885 = _877 + _883;
        float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _889 = _879 + _887;
        float _891 = fma(_815, _869, _881);
        float _893 = _885 * _885;
        float _895 = _889 * _889;
        _847 = _891;
        _833 = _893;
        _829 = _895;
        _837 = _877;
        _841 = _879;
    }
    float _897 = _847;
    float _899 = _833;
    float _901 = _829;
    float _903 = _837;
    float _905 = _841;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _909 = _897 + _907;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _913 = _911 != 0;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _917 = -_703;
    int _919 = _813 ? as_type<int>(_917) : as_type<int>(_703);
    float _921 = fma(_909, _909, _899);
    float _923 = _811 + 0.5;
    bool _925 = !_913;
    float _927 = _925 ? _703 : as_type<float>(_919);
    float _929 = _921 + _901;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _933 = -_927;
    float _935 = _933 + 0.5;
    float _937 = sqrt(_929);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _951 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _953 = _931 * _691;
    float _955 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _959 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _961 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _951 * _915;
    bool _971 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _973 = isnan(_937);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _979 = _975 || _977;
    out.m_58.x = _959;
    out.m_58.y = _961;
    out.m_58.z = _963;
    out.m_58.w = _957;
    out.m_60.x = _955;
    out.m_60.y = _965;
    out.m_60.z = _967;
    out.m_62.x = _953;
    out.m_62.y = _969;
    float _981 = _947;
    float _983 = _915;
    if (!_979)
    {
        _981 = 1.0;
    }
    float _985 = _981;
    bool _987 = !_979;
    float _989 = _985;
    if (!_987)
    {
        bool _991 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _993 = isnan(_937);
        bool _995 = _991 || _993;
        bool _997 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _999 = _995 || _997;
        if (!_999)
        {
            float _1001 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1003 = _937 + _1001;
            float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1007 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1005;
            float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1011 = _1009 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1013 = 1.0 / _1007;
            float _1015 = _1003 * _1013;
            float _1017 = fma(_1015, _1011, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _989 = _1017;
            _1019 = true;
        }
        else
        {
            bool _1021 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1023 = isnan(_937);
            bool _1025 = _1021 || _1023;
            bool _1027 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1029 = _1025 || _1027;
            if (!_1029)
            {
                float _1031 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1033 = _937 + _1031;
                float _1035 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1037 = _1035 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1039 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1041 = _1039 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1043 = 1.0 / _1037;
                float _1045 = _1033 * _1043;
                float _1047 = fma(_1045, _1041, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _989 = _1047;
                _1019 = true;
            }
            else
            {
                _989 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1019 = false;
    float _1049 = _989;
    float _1051 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1053 = _897 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1057 = _903 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1061 = _905 + _1059;
    float _1063 = fma(_1053, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1065 = fma(_1057, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1067 = fma(_1061, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1075 = _1065 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1079 = _1067 + _1077;
    float _1081 = _1071 * _1071;
    float _1083 = fma(_1075, _1075, _1081);
    float _1085 = fma(_1079, _1079, _1083);
    float _1087 = rsqrt(_1085);
    float _1089 = sqrt(_1085);
    float _1091 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1093 = _1075 * _1091;
    float _1095 = _1079 * _1091;
    float _1097 = _1093 * _1093;
    float _1099 = _1095 * _1095;
    float _1101 = _1097 + _1099;
    float _1103 = sqrt(_1101);
    bool _1105 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1103 + _1107;
    float _1111 = _1049;
    float _1113 = _1087;
    float _1115 = _1109;
    float _1117 = _1071;
    float _1119 = _1093;
    if (_1105)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1111 = _1121;
    }
    float _1123 = _1111;
    if (_1105)
    {
        float _1125 = rsqrt(_1101);
        _1113 = _1125;
    }
    float _1127 = _1113;
    float _1129 = _1123;
    float _1131 = _1127;
    if (_1105)
    {
        float _1133 = _1109 * _1123;
        _1115 = _1133;
    }
    float _1135 = _1115;
    if (_1105)
    {
        float _1137 = _1135 * 0.15915493667125701904296875;
        _1129 = _1137;
    }
    float _1139 = _1129;
    float _1141 = _1079;
    float _1143 = _1139;
    if (_1105)
    {
        float _1145 = _1139 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        _1141 = _1147;
    }
    float _1149 = _1141;
    float _1151 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1153 = precise::max(0.0, _1151);
    float _1155 = _1053;
    float _1157 = _1153;
    if (_1105)
    {
        float _1159 = _1139 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        _1155 = _1161;
    }
    float _1163 = _1155;
    float _1165 = -_1091;
    float _1167 = -_1153;
    float _1169 = fma(_1071, _1165, _1167);
    if (_1105)
    {
        float _1171 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1117 = _1171;
    }
    float _1173 = _1117;
    float _1175 = _1173;
    float _1177 = _1149;
    if (_1105)
    {
        float _1179 = fma(_1149, _1173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1175 = _1179;
    }
    float _1181 = _1175;
    float _1183 = _1181;
    if (!_1105)
    {
        _1177 = _1095;
    }
    float _1185 = _1177;
    float _1187 = _1185;
    if (_1105)
    {
        float _1189 = _1163 + (-1.0);
        _1157 = _1189;
    }
    float _1191 = _1157;
    float _1193 = _1191;
    if (_1105)
    {
        float _1195 = _1127 * _1181;
        _983 = _1195;
    }
    float _1197 = _983;
    if (!_1105)
    {
        _1131 = _1169;
    }
    float _1199 = _1131;
    float _1201 = _1199;
    if (_1105)
    {
        float _1203 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1203;
    }
    float _1205 = _1143;
    if (_1105)
    {
        float _1207 = _1093 * _1197;
        _1119 = _1207;
    }
    float _1209 = _1119;
    if (!_1105)
    {
        _1183 = _1097;
    }
    float _1211 = _1183;
    float _1213 = _1211;
    if (_1105)
    {
        float _1215 = _1095 * _1197;
        _1187 = _1215;
    }
    float _1217 = _1187;
    if (_1105)
    {
        float _1219 = fma(_1169, _1163, _1205);
        _1201 = _1219;
    }
    float _1221 = _1201;
    if (_1105)
    {
        float _1223 = _1209 * _1209;
        _1213 = _1223;
    }
    float _1225 = _1213;
    if (!_1105)
    {
        _1193 = _1099;
    }
    float _1227 = _1193;
    float _1229 = _1227;
    if (_1105)
    {
        float _1231 = _1217 * _1217;
        _1229 = _1231;
    }
    float _1233 = _1229;
    float _1235 = fma(_1221, _1221, _1225);
    float _1237 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1239 = _1235 + _1233;
    float _1241 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1245 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1243);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1251 = rsqrt(_1239);
    float _1253 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1241);
    float _1255 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1257 = -_1247;
    float _1259 = _1257 + 1.0;
    float _1261 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1263 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1253);
    float _1265 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1255);
    float _1267 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1237);
    float _1269 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1261);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1273 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1265);
    float _1275 = abs(_1259);
    float _1277 = log2(_1275);
    float _1279 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1267);
    float _1281 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1285 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1269);
    float _1287 = _1251 * _1209;
    float _1289 = _1251 * _1221;
    float _1291 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1297 = _1251 * _1217;
    float _1299 = -_1281;
    float _1301 = fma(_1299, _1249, 1.0);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1293);
    float _1305 = -_1295;
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1305);
    float _1309 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1313 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1303);
    float _1315 = -_1297;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1307);
    float _1319 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = log2(_1301);
    float _1323 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1313);
    float _1325 = fma(_1317, -0.5, 0.5);
    float _1327 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1329 = fma(_1317, 0.5, 0.5);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1311);
    float _1333 = _1289 + 1.0;
    float _1335 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1327);
    float _1337 = exp2(_1319);
    float _1339 = fma(_1329, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1341 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1331);
    float _1343 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1335);
    float _1345 = fma(_1329, _1339, -0.212114393711090087890625);
    float _1347 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1341);
    float _1349 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1351 = 1.0 / _1323;
    float _1353 = _1321 * 0.693147182464599609375;
    float _1355 = fma(_1329, _1345, 1.570728778839111328125);
    float _1357 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1359 = sqrt(_1325);
    float _1361 = -_1289;
    float _1363 = fma(_1337, _1333, _1361);
    float _1365 = fma(_1363, 0.5, 0.5);
    float _1367 = _1347 * _1351;
    float _1369 = _1349 * _1351;
    float _1371 = fma(_1367, 0.5, 0.5);
    float _1373 = fma(_1369, -0.5, 0.5);
    float _1375 = _1359 * 0.636619746685028076171875;
    float _1377 = -_1355;
    float _1379 = fma(_1375, _1377, 1.0);
    float3 _3715 = float3(_1371, _1373, _1357);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3715, float3(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3715, float3(0.0), isnan(_3715)), level(0.0)).x;
    float3 _3726 = float3(_1371, _1373, _1357);
    float4 _1384 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3726, float3(0.0), isnan(_3726)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3726, float3(0.0), isnan(_3726)), level(0.0)).xyzw;
    float _1386 = _1384.x;
    float _1388 = _1384.y;
    float _1390 = _1384.z;
    float _1392 = _1384.w;
    float2 _3743 = float2(_1379, _1365);
    float3 _1396 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3743, float2(0.0), isnan(_3743)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3743, float2(0.0), isnan(_3743)), level(0.0)).xyz;
    float _1398 = _1396.x;
    float _1400 = _1396.y;
    float _1402 = _1396.z;
    float _1404 = _793 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1406 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1404);
    float _1408 = _793 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1410 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1406);
    float _1412 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1408);
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1426 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1412);
    float _1428 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1430 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1432 = 1.0 / _1424;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1436 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1430);
    float _1438 = _1434 + _1424;
    float _1440 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1436);
    float _1442 = exp2(_1428);
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1422)
    {
        _1444 = 1.0;
    }
    float _1446 = _1444;
    float _1448 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1440);
    float _1450 = _1438 * _1432;
    float _1452 = _1450 * 0.5;
    float _1454 = _1446;
    if (!_1422)
    {
        float _1456 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
        float _1462 = _1456 * 0.15915493667125701904296875;
        float _1464 = _1462 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1470 = _1468 * 0.15915493667125701904296875;
        float _1472 = _1462 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1466;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = 1.0 / _1460;
        float _1486 = _1480 * _1482;
        float _1488 = _1470 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1492;
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1498 = _1484 * _1496;
        float _1500 = 1.0 / _1486;
        float _1502 = 1.0 / _1494;
        float _1504 = _1490 * _1500;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1504, _1498, _1506);
        float _1510 = _1508 * _1502;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1454 = _1512;
    }
    float _1514 = _1454;
    float _1516 = _1323 * 0.5;
    float _1518 = -_1442;
    float _1520 = _1518 + 1.0;
    bool _1522 = _1514 > 0.0;
    bool _1524 = isnan(_1514);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan(0.0);
    bool _1530 = _1526 || _1528;
    float _1532 = _1514 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1534 = fma(_1349, -0.5, _1516);
    float _1536 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1538 = _1448 + _1323;
    float _1540 = _1347 + _1323;
    out.gl_Position.x = _1347;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1448;
    out.gl_Position.w = _1323;
    float _1542 = _1536 * _1381;
    float _1544 = -_1536;
    float _1546 = _1544 + 1.0;
    float _1548 = _1538 * 0.5;
    float _1550 = _1392 * _1542;
    float _1552 = _1402 * _1542;
    float _1554 = _1540 * 0.5;
    float _1556 = _1532 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1558 = fma(_1398, _1550, _1386);
    float _1560 = fma(_1400, _1550, _1388);
    float _1562 = _1392 * _1546;
    float _1564 = fma(_1392, _1552, _1390);
    out.m_64.x = _1554;
    out.m_64.y = _1534;
    out.m_64.z = _1548;
    out.m_64.w = _1323;
    out.m_47.x = _1556;
    out.m_66.x = _1558;
    out.m_66.y = _1560;
    out.m_66.z = _1564;
    out.m_66.w = _1562;
    if (_1530)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1566 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1566;
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
    bool _1019 = false;
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
        float _1623 = as_type<float>(_101);
        out.gl_Position.z = _1623;
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
        float _1692 = as_type<float>(_137);
        out.gl_Position.z = _1692;
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
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _453 = 1.0 / _439;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _455;
    bool _459 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _461 = isnan(_427);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = as_type<float>(int(gl_VertexIndex));
    float _473 = 1.0 / _443;
    bool _475 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _477 = isnan(_427);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _447;
    float _489 = _431 * _453;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _493 = _427 + _491;
    float _495 = -_485;
    float _497 = _495 + 1.0;
    float _499 = 1.0 / _451;
    float _501 = _435 * _473;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _505 = _427 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _509 = _427 + _507;
    int _511 = as_type<int>(_471) & 1;
    bool _513 = _511 != 0;
    int _515 = as_type<int>(_471) & 2;
    bool _517 = _515 != 0;
    bool _519 = _139 > 0.5;
    float _521 = 1.0 / _457;
    float _523 = _493 * _487;
    bool _525 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _527 = isnan(_427);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -_535;
    float _539 = _537 + 1.0;
    float _541 = _505 * _499;
    bool _543 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _545 = isnan(_427);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _535 * _497;
    bool _557 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _559 = isnan(_427);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _571 = isnan(_427);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _553 * _539;
    float _583 = -_553;
    float _585 = _583 + 1.0;
    float _587 = _509 * _521;
    float _589 = -_567;
    float _591 = _589 + 1.0;
    float _593 = _567 * _585;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = _469 * _591;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = -_469;
    float _615 = _613 + 1.0;
    float _617 = fma(_601, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _619 = fma(_597, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _621 = fma(_605, _501, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _623 = fma(_611, _501, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _625 = _579 * _615;
    float _627 = -_579;
    float _629 = _627 + 1.0;
    float _631 = _617 * _625;
    float _633 = _619 * _625;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _639;
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].x, _631);
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].y, _633);
    float _647 = fma(_637, _523, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _649 = fma(_641, _523, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _651 = fma(_621, _607, _643);
    float _653 = in.m_53.x;
    float _655 = in.m_53.y;
    float _657 = fma(_623, _607, _645);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = fma(_649, _593, _657);
    float _669 = fma(_661, _541, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _671;
    float _675 = fma(_665, _541, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _677 = fma(_647, _593, _651);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _679;
    float _683 = fma(_669, _581, _667);
    float _685 = fma(_673, _587, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _687 = fma(_675, _581, _677);
    float _689 = fma(_681, _587, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _693 = fma(_685, _555, _683);
    float _695 = fma(_689, _555, _687);
    float _697 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[148].y, _693);
    float _699 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[148].x, _695);
    bool _701 = !_517;
    float _703 = _701 ? (-0.5) : 0.5;
    float _705 = _697 * _655;
    float _707 = _699 * _653;
    float _709 = _397 * _705;
    bool _711 = !_513;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = _393 * _707;
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _703);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _713);
    float _723 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = _719 * _717;
    float _727 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _729 = _723 * _721;
    float _731 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _733 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _737 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _739 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _727);
    float _741 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _731);
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _735);
    float _747 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _749 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _741);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _743);
    float _753 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _745);
    float _755 = _747 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _757 = _749 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _761 = _753 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _763 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _765 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = _755 + _759;
    float _769 = _757 + _761;
    float _771 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _763);
    float _773 = in.m_51.y;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _777 = _767 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _781 = _769 + _779;
    float _783 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _785 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    float _787 = _777 * _777;
    float _789 = _781 * _781;
    float _791 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _783);
    float _793 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _795 = _787 + _789;
    float _797 = _791 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = -_713;
    float _801 = _519 ? _799 : _713;
    float _803 = sqrt(_795);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    bool _809 = !_807;
    float _811 = _809 ? _713 : _801;
    bool _813 = _773 > 0.5;
    float _815 = _793 + _797;
    bool _817 = _803 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _801;
    float _821 = _737;
    float _823 = _771;
    float _825 = _765;
    if (!_817)
    {
        _819 = _789;
    }
    float _827 = _819;
    float _829 = _827;
    if (!_817)
    {
        _821 = _787;
    }
    float _831 = _821;
    float _833 = _831;
    if (!_817)
    {
        _401 = _767;
    }
    float _835 = _401;
    float _837 = _835;
    if (!_817)
    {
        _823 = _769;
    }
    float _839 = _823;
    float _841 = _839;
    if (!_817)
    {
        _825 = _815;
    }
    float _843 = _825;
    bool _845 = !_817;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _853 = _803 + _851;
        float _855 = _815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = rsqrt(_795);
        float _859 = _853 * _849;
        float _861 = _859 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = sin(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = cos(_867);
        float _871 = fma(_865, _855, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _873 = _857 * _871;
        float _875 = _869 + (-1.0);
        float _877 = fma(_777, _873, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _879 = fma(_781, _873, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _881 = _875 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _885 = _877 + _883;
        float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _889 = _879 + _887;
        float _891 = fma(_815, _869, _881);
        float _893 = _885 * _885;
        float _895 = _889 * _889;
        _847 = _891;
        _833 = _893;
        _829 = _895;
        _837 = _877;
        _841 = _879;
    }
    float _897 = _847;
    float _899 = _833;
    float _901 = _829;
    float _903 = _837;
    float _905 = _841;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _909 = _897 + _907;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _913 = _911 != 0;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _917 = -_703;
    int _919 = _813 ? as_type<int>(_917) : as_type<int>(_703);
    float _921 = fma(_909, _909, _899);
    float _923 = _811 + 0.5;
    bool _925 = !_913;
    float _927 = _925 ? _703 : as_type<float>(_919);
    float _929 = _921 + _901;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _933 = -_927;
    float _935 = _933 + 0.5;
    float _937 = sqrt(_929);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _951 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _953 = _931 * _691;
    float _955 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _959 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _961 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _951 * _915;
    bool _971 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _973 = isnan(_937);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _979 = _975 || _977;
    out.m_58.x = _959;
    out.m_58.y = _961;
    out.m_58.z = _963;
    out.m_58.w = _957;
    out.m_60.x = _955;
    out.m_60.y = _965;
    out.m_60.z = _967;
    out.m_62.x = _953;
    out.m_62.y = _969;
    float _981 = _947;
    float _983 = _915;
    if (!_979)
    {
        _981 = 1.0;
    }
    float _985 = _981;
    bool _987 = !_979;
    float _989 = _985;
    if (!_987)
    {
        bool _991 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _993 = isnan(_937);
        bool _995 = _991 || _993;
        bool _997 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _999 = _995 || _997;
        if (!_999)
        {
            float _1001 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1003 = _937 + _1001;
            float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1007 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1005;
            float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1011 = _1009 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1013 = 1.0 / _1007;
            float _1015 = _1003 * _1013;
            float _1017 = fma(_1015, _1011, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _989 = _1017;
            _1019 = true;
        }
        else
        {
            bool _1021 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1023 = isnan(_937);
            bool _1025 = _1021 || _1023;
            bool _1027 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1029 = _1025 || _1027;
            if (!_1029)
            {
                float _1031 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1033 = _937 + _1031;
                float _1035 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1037 = _1035 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1039 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1041 = _1039 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1043 = 1.0 / _1037;
                float _1045 = _1033 * _1043;
                float _1047 = fma(_1045, _1041, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _989 = _1047;
                _1019 = true;
            }
            else
            {
                _989 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1019 = false;
    float _1049 = _989;
    float _1051 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1053 = _897 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1057 = _903 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1061 = _905 + _1059;
    float _1063 = fma(_1053, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1065 = fma(_1057, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1067 = fma(_1061, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1075 = _1065 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1079 = _1067 + _1077;
    float _1081 = _1071 * _1071;
    float _1083 = fma(_1075, _1075, _1081);
    float _1085 = fma(_1079, _1079, _1083);
    float _1087 = rsqrt(_1085);
    float _1089 = sqrt(_1085);
    float _1091 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1093 = _1075 * _1091;
    float _1095 = _1079 * _1091;
    float _1097 = _1093 * _1093;
    float _1099 = _1095 * _1095;
    float _1101 = _1097 + _1099;
    float _1103 = sqrt(_1101);
    bool _1105 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1103 + _1107;
    float _1111 = _1049;
    float _1113 = _1087;
    float _1115 = _1109;
    float _1117 = _1071;
    float _1119 = _1093;
    if (_1105)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1111 = _1121;
    }
    float _1123 = _1111;
    if (_1105)
    {
        float _1125 = rsqrt(_1101);
        _1113 = _1125;
    }
    float _1127 = _1113;
    float _1129 = _1123;
    float _1131 = _1127;
    if (_1105)
    {
        float _1133 = _1109 * _1123;
        _1115 = _1133;
    }
    float _1135 = _1115;
    if (_1105)
    {
        float _1137 = _1135 * 0.15915493667125701904296875;
        _1129 = _1137;
    }
    float _1139 = _1129;
    float _1141 = _1079;
    float _1143 = _1139;
    if (_1105)
    {
        float _1145 = _1139 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        _1141 = _1147;
    }
    float _1149 = _1141;
    float _1151 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1153 = precise::max(0.0, _1151);
    float _1155 = _1053;
    float _1157 = _1153;
    if (_1105)
    {
        float _1159 = _1139 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        _1155 = _1161;
    }
    float _1163 = _1155;
    float _1165 = -_1091;
    float _1167 = -_1153;
    float _1169 = fma(_1071, _1165, _1167);
    if (_1105)
    {
        float _1171 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1117 = _1171;
    }
    float _1173 = _1117;
    float _1175 = _1173;
    float _1177 = _1149;
    if (_1105)
    {
        float _1179 = fma(_1149, _1173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1175 = _1179;
    }
    float _1181 = _1175;
    float _1183 = _1181;
    if (!_1105)
    {
        _1177 = _1095;
    }
    float _1185 = _1177;
    float _1187 = _1185;
    if (_1105)
    {
        float _1189 = _1163 + (-1.0);
        _1157 = _1189;
    }
    float _1191 = _1157;
    float _1193 = _1191;
    if (_1105)
    {
        float _1195 = _1127 * _1181;
        _983 = _1195;
    }
    float _1197 = _983;
    if (!_1105)
    {
        _1131 = _1169;
    }
    float _1199 = _1131;
    float _1201 = _1199;
    if (_1105)
    {
        float _1203 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1203;
    }
    float _1205 = _1143;
    if (_1105)
    {
        float _1207 = _1093 * _1197;
        _1119 = _1207;
    }
    float _1209 = _1119;
    if (!_1105)
    {
        _1183 = _1097;
    }
    float _1211 = _1183;
    float _1213 = _1211;
    if (_1105)
    {
        float _1215 = _1095 * _1197;
        _1187 = _1215;
    }
    float _1217 = _1187;
    if (_1105)
    {
        float _1219 = fma(_1169, _1163, _1205);
        _1201 = _1219;
    }
    float _1221 = _1201;
    if (_1105)
    {
        float _1223 = _1209 * _1209;
        _1213 = _1223;
    }
    float _1225 = _1213;
    if (!_1105)
    {
        _1193 = _1099;
    }
    float _1227 = _1193;
    float _1229 = _1227;
    if (_1105)
    {
        float _1231 = _1217 * _1217;
        _1229 = _1231;
    }
    float _1233 = _1229;
    float _1235 = fma(_1221, _1221, _1225);
    float _1237 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1239 = _1235 + _1233;
    float _1241 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1245 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1243);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1251 = rsqrt(_1239);
    float _1253 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1241);
    float _1255 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1257 = -_1247;
    float _1259 = _1257 + 1.0;
    float _1261 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1263 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1253);
    float _1265 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1255);
    float _1267 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1237);
    float _1269 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1261);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1273 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1265);
    float _1275 = abs(_1259);
    float _1277 = log2(_1275);
    float _1279 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1267);
    float _1281 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1285 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1269);
    float _1287 = _1251 * _1209;
    float _1289 = _1251 * _1221;
    float _1291 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1297 = _1251 * _1217;
    float _1299 = -_1281;
    float _1301 = fma(_1299, _1249, 1.0);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1293);
    float _1305 = -_1295;
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1305);
    float _1309 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1313 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1303);
    float _1315 = -_1297;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1307);
    float _1319 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = log2(_1301);
    float _1323 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1313);
    float _1325 = fma(_1317, -0.5, 0.5);
    float _1327 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1329 = fma(_1317, 0.5, 0.5);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1311);
    float _1333 = _1289 + 1.0;
    float _1335 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1327);
    float _1337 = exp2(_1319);
    float _1339 = fma(_1329, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1341 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1331);
    float _1343 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1335);
    float _1345 = fma(_1329, _1339, -0.212114393711090087890625);
    float _1347 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1341);
    float _1349 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1351 = 1.0 / _1323;
    float _1353 = _1321 * 0.693147182464599609375;
    float _1355 = fma(_1329, _1345, 1.570728778839111328125);
    float _1357 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1359 = sqrt(_1325);
    float _1361 = -_1289;
    float _1363 = fma(_1337, _1333, _1361);
    float _1365 = fma(_1363, 0.5, 0.5);
    float _1367 = _1347 * _1351;
    float _1369 = _1349 * _1351;
    float _1371 = fma(_1367, 0.5, 0.5);
    float _1373 = fma(_1369, -0.5, 0.5);
    float _1375 = _1359 * 0.636619746685028076171875;
    float _1377 = -_1355;
    float _1379 = fma(_1375, _1377, 1.0);
    float3 _3715 = float3(_1371, _1373, _1357);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3715, float3(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3715, float3(0.0), isnan(_3715)), level(0.0)).x;
    float3 _3726 = float3(_1371, _1373, _1357);
    float4 _1384 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3726, float3(0.0), isnan(_3726)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3726, float3(0.0), isnan(_3726)), level(0.0)).xyzw;
    float _1386 = _1384.x;
    float _1388 = _1384.y;
    float _1390 = _1384.z;
    float _1392 = _1384.w;
    float2 _3743 = float2(_1379, _1365);
    float3 _1396 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3743, float2(0.0), isnan(_3743)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3743, float2(0.0), isnan(_3743)), level(0.0)).xyz;
    float _1398 = _1396.x;
    float _1400 = _1396.y;
    float _1402 = _1396.z;
    float _1404 = _793 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1406 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1404);
    float _1408 = _793 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1410 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1406);
    float _1412 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1408);
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1426 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1412);
    float _1428 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1430 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1432 = 1.0 / _1424;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1436 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1430);
    float _1438 = _1434 + _1424;
    float _1440 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1436);
    float _1442 = exp2(_1428);
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1422)
    {
        _1444 = 1.0;
    }
    float _1446 = _1444;
    float _1448 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1440);
    float _1450 = _1438 * _1432;
    float _1452 = _1450 * 0.5;
    float _1454 = _1446;
    if (!_1422)
    {
        float _1456 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
        float _1462 = _1456 * 0.15915493667125701904296875;
        float _1464 = _1462 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1470 = _1468 * 0.15915493667125701904296875;
        float _1472 = _1462 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1466;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = 1.0 / _1460;
        float _1486 = _1480 * _1482;
        float _1488 = _1470 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1492;
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1498 = _1484 * _1496;
        float _1500 = 1.0 / _1486;
        float _1502 = 1.0 / _1494;
        float _1504 = _1490 * _1500;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1504, _1498, _1506);
        float _1510 = _1508 * _1502;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1454 = _1512;
    }
    float _1514 = _1454;
    float _1516 = _1323 * 0.5;
    float _1518 = -_1442;
    float _1520 = _1518 + 1.0;
    bool _1522 = _1514 > 0.0;
    bool _1524 = isnan(_1514);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan(0.0);
    bool _1530 = _1526 || _1528;
    float _1532 = _1514 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1534 = fma(_1349, -0.5, _1516);
    float _1536 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1538 = _1448 + _1323;
    float _1540 = _1347 + _1323;
    out.gl_Position.x = _1347;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1448;
    out.gl_Position.w = _1323;
    float _1542 = _1536 * _1381;
    float _1544 = -_1536;
    float _1546 = _1544 + 1.0;
    float _1548 = _1538 * 0.5;
    float _1550 = _1392 * _1542;
    float _1552 = _1402 * _1542;
    float _1554 = _1540 * 0.5;
    float _1556 = _1532 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1558 = fma(_1398, _1550, _1386);
    float _1560 = fma(_1400, _1550, _1388);
    float _1562 = _1392 * _1546;
    float _1564 = fma(_1392, _1552, _1390);
    out.m_64.x = _1554;
    out.m_64.y = _1534;
    out.m_64.z = _1548;
    out.m_64.w = _1323;
    out.m_47.x = _1556;
    out.m_66.x = _1558;
    out.m_66.y = _1560;
    out.m_66.z = _1564;
    out.m_66.w = _1562;
    if (_1530)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1566 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1566;
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
    bool _1019 = false;
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
        float _1623 = as_type<float>(_101);
        out.gl_Position.z = _1623;
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
        float _1692 = as_type<float>(_137);
        out.gl_Position.z = _1692;
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
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _453 = 1.0 / _439;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _455;
    bool _459 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _461 = isnan(_427);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = as_type<float>(int(gl_VertexIndex));
    float _473 = 1.0 / _443;
    bool _475 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _477 = isnan(_427);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _447;
    float _489 = _431 * _453;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _493 = _427 + _491;
    float _495 = -_485;
    float _497 = _495 + 1.0;
    float _499 = 1.0 / _451;
    float _501 = _435 * _473;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _505 = _427 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _509 = _427 + _507;
    int _511 = as_type<int>(_471) & 1;
    bool _513 = _511 != 0;
    int _515 = as_type<int>(_471) & 2;
    bool _517 = _515 != 0;
    bool _519 = _139 > 0.5;
    float _521 = 1.0 / _457;
    float _523 = _493 * _487;
    bool _525 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _527 = isnan(_427);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -_535;
    float _539 = _537 + 1.0;
    float _541 = _505 * _499;
    bool _543 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _545 = isnan(_427);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _535 * _497;
    bool _557 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _559 = isnan(_427);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _571 = isnan(_427);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _553 * _539;
    float _583 = -_553;
    float _585 = _583 + 1.0;
    float _587 = _509 * _521;
    float _589 = -_567;
    float _591 = _589 + 1.0;
    float _593 = _567 * _585;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = _469 * _591;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = -_469;
    float _615 = _613 + 1.0;
    float _617 = fma(_601, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _619 = fma(_597, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _621 = fma(_605, _501, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _623 = fma(_611, _501, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _625 = _579 * _615;
    float _627 = -_579;
    float _629 = _627 + 1.0;
    float _631 = _617 * _625;
    float _633 = _619 * _625;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _639;
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].x, _631);
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].y, _633);
    float _647 = fma(_637, _523, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _649 = fma(_641, _523, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _651 = fma(_621, _607, _643);
    float _653 = in.m_53.x;
    float _655 = in.m_53.y;
    float _657 = fma(_623, _607, _645);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = fma(_649, _593, _657);
    float _669 = fma(_661, _541, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _671;
    float _675 = fma(_665, _541, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _677 = fma(_647, _593, _651);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _679;
    float _683 = fma(_669, _581, _667);
    float _685 = fma(_673, _587, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _687 = fma(_675, _581, _677);
    float _689 = fma(_681, _587, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _693 = fma(_685, _555, _683);
    float _695 = fma(_689, _555, _687);
    float _697 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[148].y, _693);
    float _699 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[148].x, _695);
    bool _701 = !_517;
    float _703 = _701 ? (-0.5) : 0.5;
    float _705 = _697 * _655;
    float _707 = _699 * _653;
    float _709 = _397 * _705;
    bool _711 = !_513;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = _393 * _707;
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _703);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _713);
    float _723 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = _719 * _717;
    float _727 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _729 = _723 * _721;
    float _731 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _733 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _737 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _739 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _727);
    float _741 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _731);
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _735);
    float _747 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _749 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _741);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _743);
    float _753 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _745);
    float _755 = _747 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _757 = _749 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _761 = _753 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _763 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _765 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = _755 + _759;
    float _769 = _757 + _761;
    float _771 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _763);
    float _773 = in.m_51.y;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _777 = _767 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _781 = _769 + _779;
    float _783 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _785 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    float _787 = _777 * _777;
    float _789 = _781 * _781;
    float _791 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _783);
    float _793 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _795 = _787 + _789;
    float _797 = _791 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = -_713;
    float _801 = _519 ? _799 : _713;
    float _803 = sqrt(_795);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    bool _809 = !_807;
    float _811 = _809 ? _713 : _801;
    bool _813 = _773 > 0.5;
    float _815 = _793 + _797;
    bool _817 = _803 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _801;
    float _821 = _737;
    float _823 = _771;
    float _825 = _765;
    if (!_817)
    {
        _819 = _789;
    }
    float _827 = _819;
    float _829 = _827;
    if (!_817)
    {
        _821 = _787;
    }
    float _831 = _821;
    float _833 = _831;
    if (!_817)
    {
        _401 = _767;
    }
    float _835 = _401;
    float _837 = _835;
    if (!_817)
    {
        _823 = _769;
    }
    float _839 = _823;
    float _841 = _839;
    if (!_817)
    {
        _825 = _815;
    }
    float _843 = _825;
    bool _845 = !_817;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _853 = _803 + _851;
        float _855 = _815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = rsqrt(_795);
        float _859 = _853 * _849;
        float _861 = _859 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = sin(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = cos(_867);
        float _871 = fma(_865, _855, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _873 = _857 * _871;
        float _875 = _869 + (-1.0);
        float _877 = fma(_777, _873, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _879 = fma(_781, _873, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _881 = _875 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _885 = _877 + _883;
        float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _889 = _879 + _887;
        float _891 = fma(_815, _869, _881);
        float _893 = _885 * _885;
        float _895 = _889 * _889;
        _847 = _891;
        _833 = _893;
        _829 = _895;
        _837 = _877;
        _841 = _879;
    }
    float _897 = _847;
    float _899 = _833;
    float _901 = _829;
    float _903 = _837;
    float _905 = _841;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _909 = _897 + _907;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _913 = _911 != 0;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _917 = -_703;
    int _919 = _813 ? as_type<int>(_917) : as_type<int>(_703);
    float _921 = fma(_909, _909, _899);
    float _923 = _811 + 0.5;
    bool _925 = !_913;
    float _927 = _925 ? _703 : as_type<float>(_919);
    float _929 = _921 + _901;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _933 = -_927;
    float _935 = _933 + 0.5;
    float _937 = sqrt(_929);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _951 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _953 = _931 * _691;
    float _955 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _959 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _961 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _951 * _915;
    bool _971 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _973 = isnan(_937);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _979 = _975 || _977;
    out.m_58.x = _959;
    out.m_58.y = _961;
    out.m_58.z = _963;
    out.m_58.w = _957;
    out.m_60.x = _955;
    out.m_60.y = _965;
    out.m_60.z = _967;
    out.m_62.x = _953;
    out.m_62.y = _969;
    float _981 = _947;
    float _983 = _915;
    if (!_979)
    {
        _981 = 1.0;
    }
    float _985 = _981;
    bool _987 = !_979;
    float _989 = _985;
    if (!_987)
    {
        bool _991 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _993 = isnan(_937);
        bool _995 = _991 || _993;
        bool _997 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _999 = _995 || _997;
        if (!_999)
        {
            float _1001 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1003 = _937 + _1001;
            float _1005 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1007 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1005;
            float _1009 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1011 = _1009 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1013 = 1.0 / _1007;
            float _1015 = _1003 * _1013;
            float _1017 = fma(_1015, _1011, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _989 = _1017;
            _1019 = true;
        }
        else
        {
            bool _1021 = _937 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1023 = isnan(_937);
            bool _1025 = _1021 || _1023;
            bool _1027 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1029 = _1025 || _1027;
            if (!_1029)
            {
                float _1031 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1033 = _937 + _1031;
                float _1035 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1037 = _1035 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1039 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1041 = _1039 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1043 = 1.0 / _1037;
                float _1045 = _1033 * _1043;
                float _1047 = fma(_1045, _1041, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _989 = _1047;
                _1019 = true;
            }
            else
            {
                _989 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1019 = false;
    float _1049 = _989;
    float _1051 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1053 = _897 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1057 = _903 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1061 = _905 + _1059;
    float _1063 = fma(_1053, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1065 = fma(_1057, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1067 = fma(_1061, _1049, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1075 = _1065 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1079 = _1067 + _1077;
    float _1081 = _1071 * _1071;
    float _1083 = fma(_1075, _1075, _1081);
    float _1085 = fma(_1079, _1079, _1083);
    float _1087 = rsqrt(_1085);
    float _1089 = sqrt(_1085);
    float _1091 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1093 = _1075 * _1091;
    float _1095 = _1079 * _1091;
    float _1097 = _1093 * _1093;
    float _1099 = _1095 * _1095;
    float _1101 = _1097 + _1099;
    float _1103 = sqrt(_1101);
    bool _1105 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1103 + _1107;
    float _1111 = _1049;
    float _1113 = _1087;
    float _1115 = _1109;
    float _1117 = _1071;
    float _1119 = _1093;
    if (_1105)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1111 = _1121;
    }
    float _1123 = _1111;
    if (_1105)
    {
        float _1125 = rsqrt(_1101);
        _1113 = _1125;
    }
    float _1127 = _1113;
    float _1129 = _1123;
    float _1131 = _1127;
    if (_1105)
    {
        float _1133 = _1109 * _1123;
        _1115 = _1133;
    }
    float _1135 = _1115;
    if (_1105)
    {
        float _1137 = _1135 * 0.15915493667125701904296875;
        _1129 = _1137;
    }
    float _1139 = _1129;
    float _1141 = _1079;
    float _1143 = _1139;
    if (_1105)
    {
        float _1145 = _1139 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        _1141 = _1147;
    }
    float _1149 = _1141;
    float _1151 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1153 = precise::max(0.0, _1151);
    float _1155 = _1053;
    float _1157 = _1153;
    if (_1105)
    {
        float _1159 = _1139 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        _1155 = _1161;
    }
    float _1163 = _1155;
    float _1165 = -_1091;
    float _1167 = -_1153;
    float _1169 = fma(_1071, _1165, _1167);
    if (_1105)
    {
        float _1171 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1117 = _1171;
    }
    float _1173 = _1117;
    float _1175 = _1173;
    float _1177 = _1149;
    if (_1105)
    {
        float _1179 = fma(_1149, _1173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1175 = _1179;
    }
    float _1181 = _1175;
    float _1183 = _1181;
    if (!_1105)
    {
        _1177 = _1095;
    }
    float _1185 = _1177;
    float _1187 = _1185;
    if (_1105)
    {
        float _1189 = _1163 + (-1.0);
        _1157 = _1189;
    }
    float _1191 = _1157;
    float _1193 = _1191;
    if (_1105)
    {
        float _1195 = _1127 * _1181;
        _983 = _1195;
    }
    float _1197 = _983;
    if (!_1105)
    {
        _1131 = _1169;
    }
    float _1199 = _1131;
    float _1201 = _1199;
    if (_1105)
    {
        float _1203 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1203;
    }
    float _1205 = _1143;
    if (_1105)
    {
        float _1207 = _1093 * _1197;
        _1119 = _1207;
    }
    float _1209 = _1119;
    if (!_1105)
    {
        _1183 = _1097;
    }
    float _1211 = _1183;
    float _1213 = _1211;
    if (_1105)
    {
        float _1215 = _1095 * _1197;
        _1187 = _1215;
    }
    float _1217 = _1187;
    if (_1105)
    {
        float _1219 = fma(_1169, _1163, _1205);
        _1201 = _1219;
    }
    float _1221 = _1201;
    if (_1105)
    {
        float _1223 = _1209 * _1209;
        _1213 = _1223;
    }
    float _1225 = _1213;
    if (!_1105)
    {
        _1193 = _1099;
    }
    float _1227 = _1193;
    float _1229 = _1227;
    if (_1105)
    {
        float _1231 = _1217 * _1217;
        _1229 = _1231;
    }
    float _1233 = _1229;
    float _1235 = fma(_1221, _1221, _1225);
    float _1237 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1239 = _1235 + _1233;
    float _1241 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1245 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1243);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1251 = rsqrt(_1239);
    float _1253 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1241);
    float _1255 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1257 = -_1247;
    float _1259 = _1257 + 1.0;
    float _1261 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1263 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1253);
    float _1265 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1255);
    float _1267 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1237);
    float _1269 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1261);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1273 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1265);
    float _1275 = abs(_1259);
    float _1277 = log2(_1275);
    float _1279 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1267);
    float _1281 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1285 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1269);
    float _1287 = _1251 * _1209;
    float _1289 = _1251 * _1221;
    float _1291 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1297 = _1251 * _1217;
    float _1299 = -_1281;
    float _1301 = fma(_1299, _1249, 1.0);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1293);
    float _1305 = -_1295;
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1305);
    float _1309 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1313 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1303);
    float _1315 = -_1297;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1307);
    float _1319 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = log2(_1301);
    float _1323 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1313);
    float _1325 = fma(_1317, -0.5, 0.5);
    float _1327 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1329 = fma(_1317, 0.5, 0.5);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1311);
    float _1333 = _1289 + 1.0;
    float _1335 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1327);
    float _1337 = exp2(_1319);
    float _1339 = fma(_1329, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1341 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1331);
    float _1343 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1335);
    float _1345 = fma(_1329, _1339, -0.212114393711090087890625);
    float _1347 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1341);
    float _1349 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1351 = 1.0 / _1323;
    float _1353 = _1321 * 0.693147182464599609375;
    float _1355 = fma(_1329, _1345, 1.570728778839111328125);
    float _1357 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1359 = sqrt(_1325);
    float _1361 = -_1289;
    float _1363 = fma(_1337, _1333, _1361);
    float _1365 = fma(_1363, 0.5, 0.5);
    float _1367 = _1347 * _1351;
    float _1369 = _1349 * _1351;
    float _1371 = fma(_1367, 0.5, 0.5);
    float _1373 = fma(_1369, -0.5, 0.5);
    float _1375 = _1359 * 0.636619746685028076171875;
    float _1377 = -_1355;
    float _1379 = fma(_1375, _1377, 1.0);
    float3 _3715 = float3(_1371, _1373, _1357);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3715, float3(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3715, float3(0.0), isnan(_3715)), level(0.0)).x;
    float3 _3726 = float3(_1371, _1373, _1357);
    float4 _1384 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3726, float3(0.0), isnan(_3726)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3726, float3(0.0), isnan(_3726)), level(0.0)).xyzw;
    float _1386 = _1384.x;
    float _1388 = _1384.y;
    float _1390 = _1384.z;
    float _1392 = _1384.w;
    float2 _3743 = float2(_1379, _1365);
    float3 _1396 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3743, float2(0.0), isnan(_3743)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3743, float2(0.0), isnan(_3743)), level(0.0)).xyz;
    float _1398 = _1396.x;
    float _1400 = _1396.y;
    float _1402 = _1396.z;
    float _1404 = _793 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1406 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1404);
    float _1408 = _793 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1410 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1406);
    float _1412 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1408);
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1426 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1412);
    float _1428 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1430 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1432 = 1.0 / _1424;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1436 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1430);
    float _1438 = _1434 + _1424;
    float _1440 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1436);
    float _1442 = exp2(_1428);
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1422)
    {
        _1444 = 1.0;
    }
    float _1446 = _1444;
    float _1448 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1440);
    float _1450 = _1438 * _1432;
    float _1452 = _1450 * 0.5;
    float _1454 = _1446;
    if (!_1422)
    {
        float _1456 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
        float _1462 = _1456 * 0.15915493667125701904296875;
        float _1464 = _1462 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1470 = _1468 * 0.15915493667125701904296875;
        float _1472 = _1462 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1466;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = 1.0 / _1460;
        float _1486 = _1480 * _1482;
        float _1488 = _1470 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1492;
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1498 = _1484 * _1496;
        float _1500 = 1.0 / _1486;
        float _1502 = 1.0 / _1494;
        float _1504 = _1490 * _1500;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1504, _1498, _1506);
        float _1510 = _1508 * _1502;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1454 = _1512;
    }
    float _1514 = _1454;
    float _1516 = _1323 * 0.5;
    float _1518 = -_1442;
    float _1520 = _1518 + 1.0;
    bool _1522 = _1514 > 0.0;
    bool _1524 = isnan(_1514);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan(0.0);
    bool _1530 = _1526 || _1528;
    float _1532 = _1514 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1534 = fma(_1349, -0.5, _1516);
    float _1536 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1538 = _1448 + _1323;
    float _1540 = _1347 + _1323;
    out.gl_Position.x = _1347;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1448;
    out.gl_Position.w = _1323;
    float _1542 = _1536 * _1381;
    float _1544 = -_1536;
    float _1546 = _1544 + 1.0;
    float _1548 = _1538 * 0.5;
    float _1550 = _1392 * _1542;
    float _1552 = _1402 * _1542;
    float _1554 = _1540 * 0.5;
    float _1556 = _1532 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1558 = fma(_1398, _1550, _1386);
    float _1560 = fma(_1400, _1550, _1388);
    float _1562 = _1392 * _1546;
    float _1564 = fma(_1392, _1552, _1390);
    out.m_64.x = _1554;
    out.m_64.y = _1534;
    out.m_64.z = _1548;
    out.m_64.w = _1323;
    out.m_47.x = _1556;
    out.m_66.x = _1558;
    out.m_66.y = _1560;
    out.m_66.z = _1564;
    out.m_66.w = _1562;
    if (_1530)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1566 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1566;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

