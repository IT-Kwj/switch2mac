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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2212 = false;
    bool _1233 = false;
    bool _317 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2517 = as_type<float>(_125);
        out.gl_Position.z = _2517;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2587 = as_type<float>(_163);
        out.gl_Position.z = _2587;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_171;
    float _193 = _189;
    float _195 = _187;
    float _213;
    if (!_191)
    {
        float _197 = in.m_57.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_109);
        float _219 = 1.0 / _217;
        float _221 = _143 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_57.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_109);
        float _321 = 1.0 / _319;
        float _323 = _143 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = in.m_57.x;
    float _329 = in.m_57.y;
    float _331 = in.m_57.z;
    float _333 = in.m_57.w;
    float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _337 = log2(_335);
    float _339 = as_type<float>(int(gl_VertexIndex));
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _343 = 1.0 + _341;
    bool _345 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _347 = isnan(_325);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = 1.0 / _343;
    float _359 = _337 * _143;
    float _361 = exp2(_359);
    float _363 = _331 * 2.0;
    float _365 = _327 * 2.0;
    int _367 = as_type<int>(_339) & 1;
    bool _369 = _367 != 0;
    int _371 = as_type<int>(_339) & 2;
    bool _373 = _371 != 0;
    bool _375 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _377 = isnan(1.0);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _383 = _379 || _381;
    float _385 = floor(_363);
    float _387 = _329 * 2.0;
    bool _389 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _391 = isnan(0.0);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _397 = _393 || _395;
    bool _399 = _333 > 0.5;
    float _401 = _329 + _331;
    float _403 = floor(_365);
    float _405 = -_361;
    float _407 = _405 + 1.0;
    float _409 = _401 + (-1.0);
    float _411 = _397 ? _407 : 0.0;
    bool _413 = _385 > 0.0;
    float _415 = floor(_387);
    bool _417 = _385 >= 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    if (_383)
    {
        float _427 = _411 * _357;
        _145 = _427;
    }
    float _429 = _145;
    float _431 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = _331 + _327;
    int _435 = _425 ? 0 : 1;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _447 = _445 != 0;
    float _449 = _433 + (-1.0);
    int _451 = ~_435;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    int _457 = _455;
    if (!_413)
    {
        int _459 = ~_435;
        int _461 = _459 + 1;
        _457 = _461;
    }
    int _463 = _457;
    bool _465 = _403 >= 0.0;
    bool _467 = isnan(_403);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _477 = !_439;
    int _479 = _477 ? 0 : 1;
    float _481 = _329 + _327;
    int _483 = _473 ? 0 : 1;
    bool _485 = _415 >= 0.0;
    bool _487 = isnan(_415);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _481 + (-1.0);
    bool _497 = _403 > 0.0;
    int _499 = _493 ? 0 : 1;
    bool _501 = _415 > 0.0;
    int _503 = abs(_479);
    float _505 = in.m_62.x;
    float _507 = in.m_62.y;
    float _509 = in.m_62.z;
    float _511 = float(_463);
    float _513 = float(_503);
    int _515 = ~_483;
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    int _521 = _519;
    if (!_497)
    {
        int _523 = ~_483;
        int _525 = _523 + 1;
        _521 = _525;
    }
    int _527 = _521;
    float _529 = _513 * _511;
    bool _531 = !_443;
    int _533 = _531 ? 0 : 1;
    bool _535 = !_447;
    int _537 = _535 ? 0 : 1;
    float _539 = _529 * (-2.0);
    int _541 = abs(_533);
    int _543 = ~_499;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    float _549 = float(_541);
    float _551 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _553 = float(_527);
    int _555 = _547;
    if (!_501)
    {
        int _557 = ~_499;
        int _559 = _557 + 1;
        _555 = _559;
    }
    int _561 = _555;
    float _563 = fma(_539, _505, _505);
    int _565 = abs(_537);
    float _567 = _549 * _553;
    bool _569 = _327 > 0.5;
    float _571 = _327 + (-0.5);
    float _573 = float(_565);
    float _575 = fma(_551, _539, _551);
    float _577 = float(_561);
    float _579 = _567 * (-2.0);
    float _581 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[196].x, _563);
    bool _583 = _329 > 0.5;
    float _585 = _573 * _577;
    float _587 = _329 + (-0.5);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = fma(_579, _507, _507);
    float _595 = fma(_575, _429, _581);
    float _597 = in.m_64.x;
    float _599 = in.m_64.y;
    float _601 = _585 * (-2.0);
    float _603 = fma(_431, _579, _431);
    float _605 = in.m_48.x;
    float _607 = in.m_48.y;
    float _609 = in.m_48.z;
    float _611 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[196].y, _593);
    float _613 = fma(_601, _509, _509);
    float _615 = _331 + (-0.5);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = fma(_475, _601, _475);
    float _623 = fma(_603, _429, _611);
    float _625 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _627 = 1.0 / _591;
    float _629 = _595 * 0.15915493667125701904296875;
    float _631 = _623 * 0.15915493667125701904296875;
    float _633 = fma(_621, _429, _625);
    float _635 = _633 * 0.15915493667125701904296875;
    float _637 = 1.0 / _619;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _639;
    bool _643 = !_369;
    float _645 = _643 ? (-0.5) : 0.5;
    float _647 = _293 * _597;
    float _649 = _295 * _599;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _653 = _651 != 0;
    float _655 = _629 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _607 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _661 = !_373;
    float _663 = _661 ? (-0.5) : 0.5;
    float _665 = _607 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _669 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _645);
    float _673 = _631 * 6.283185482025146484375;
    float _675 = sin(_673);
    float _677 = _641 * _637;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _325 + _679;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _663);
    float _685 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    float _687 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _689 = _669 * _671;
    float _691 = _667 * _683;
    float _693 = _631 * 6.283185482025146484375;
    float _695 = cos(_693);
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _703 = _701 != 0;
    float _705 = _629 * 6.283185482025146484375;
    float _707 = sin(_705);
    float _709 = _657 * _675;
    float _711 = _635 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _607 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _721 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].x, _715);
    float _723 = _719 * _627;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _325 + _725;
    float _729 = _635 * 6.283185482025146484375;
    float _731 = sin(_729);
    float _733 = _707 * _695;
    float _735 = fma(_723, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = _657 * _695;
    float _739 = _707 * _675;
    float _741 = fma(_677, _727, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _743 = _657 * _713;
    float _745 = _707 * _713;
    float _747 = _695 * _713;
    float _749 = _675 * _713;
    bool _751 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _753 = isnan(_325);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -_355;
    float _765 = _763 + 1.0;
    float _767 = _743 * _691;
    bool _769 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _771 = isnan(_325);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_731, _737, _739);
    float _783 = -_709;
    float _785 = fma(_731, _733, _783);
    float _787 = -_733;
    float _789 = fma(_731, _709, _787);
    float _791 = _761 * _765;
    float _793 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _795 = -_691;
    float _797 = _731 * _795;
    float _799 = fma(_781, _689, _767);
    float _801 = _745 * _691;
    float _803 = -_761;
    float _805 = _803 + 1.0;
    float _807 = fma(_747, _689, _797);
    float _809 = fma(_789, _793, _799);
    float _811 = fma(_731, _739, _737);
    float _813 = fma(_785, _689, _801);
    float _815 = fma(_749, _793, _807);
    float _817 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = _779 * _805;
    float _823 = fma(_811, _793, _813);
    float _825 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _829 = _741 * _821;
    float _831 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    float _833 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[6].z, _721);
    float _835 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _837 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _827);
    float _839 = -_779;
    float _841 = _839 + 1.0;
    float _843 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _845 = _833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _847 = _835 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _849 = _837 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _829);
    float _853 = _843 + _847;
    float _855 = _845 + _849;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _863 = fma(_735, _791, _851);
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _867 = _853 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _855 + _869;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _875 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _867 * _867;
    float _883 = _871 * _871;
    float _885 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[117].x, _863);
    float _887 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _875;
    out.m_66.y = _877;
    out.m_66.z = _879;
    out.m_66.w = _873;
    float _889 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[5].z, _687);
    float _891 = _743 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _893 = _743 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _895 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _897 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _903 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _905 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _901);
    float _907 = _881 + _883;
    float _909 = _743 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _911 = -_731;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _891);
    float _915 = sqrt(_907);
    float _917 = -_731;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _909);
    float _921 = -_731;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].x, _893);
    float _925 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _887);
    float _927 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].z, _913);
    float _929 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].z, _919);
    float _931 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _925);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _939 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _943 = _889 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = _935 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _947 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _895);
    float _949 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    bool _951 = _915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _955 = _943 + _945;
    float _957 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _959 = -_663;
    int _961 = _399 ? as_type<int>(_959) : as_type<int>(_663);
    float _963 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].z, _941);
    float _965 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _967 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].z, _949);
    bool _969 = _331 > 0.5;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _973 = _743;
    float _975 = _881;
    float _977 = _883;
    float _979 = _853;
    float _981 = _855;
    float _983 = _965;
    if (!_951)
    {
        _973 = _955;
    }
    float _985 = _973;
    bool _987 = !_951;
    float _989 = _985;
    if (!_987)
    {
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _993 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _995 = _915 + _993;
        float _997 = rsqrt(_907);
        float _999 = _995 * _991;
        float _1001 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = _999 * 0.15915493667125701904296875;
        float _1005 = _1003 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1003 * 6.283185482025146484375;
        float _1011 = cos(_1009);
        float _1013 = fma(_1007, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = _997 * _1013;
        float _1017 = fma(_867, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = _1011 + (-1.0);
        float _1021 = fma(_871, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1025 = _1017 + _1023;
        float _1027 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1031 = _1021 + _1029;
        float _1033 = _1025 * _1025;
        float _1035 = fma(_955, _1011, _1027);
        float _1037 = _1031 * _1031;
        _989 = _1035;
        _975 = _1033;
        _977 = _1037;
        _979 = _1017;
        _981 = _1021;
    }
    float _1039 = _989;
    float _1041 = _975;
    float _1043 = _977;
    float _1045 = _979;
    float _1047 = _981;
    float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1051 = _1039 + _1049;
    float _1053 = _663 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1055 = -_645;
    int _1057 = _569 ? as_type<int>(_1055) : as_type<int>(_645);
    float _1059 = _645 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1061 = fma(_1051, _1051, _1041);
    float _1063 = fma(_1053, _1053, 1.0);
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _903);
    float _1071 = -_663;
    int _1073 = _583 ? as_type<int>(_1071) : as_type<int>(_663);
    float _1075 = _1053 * _929;
    bool _1077 = !_1067;
    float _1079 = _1077 ? _645 : as_type<float>(_1057);
    float _1081 = rsqrt(_1063);
    bool _1083 = !_703;
    float _1085 = _1083 ? _663 : as_type<float>(_961);
    float _1087 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _905);
    float _1089 = -_645;
    int _1091 = _969 ? as_type<int>(_1089) : as_type<int>(_645);
    float _1093 = _1079 + 0.5;
    bool _1095 = !_653;
    float _1097 = _1095 ? _663 : as_type<float>(_1073);
    float _1099 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    bool _1101 = !_699;
    float _1103 = _1101 ? _645 : as_type<float>(_1091);
    float _1105 = _1053 * _927;
    float _1107 = _1053 * _931;
    float _1109 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1111 = fma(_1059, _1099, _1075);
    float _1113 = fma(_1059, _1069, _1105);
    float _1115 = fma(_1059, _1087, _1107);
    float _1117 = -_1097;
    float _1119 = _1117 + 0.5;
    float _1121 = _1103 + 0.5;
    float _1123 = _1053 * _1081;
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1127 = _1109 * _937;
    float _1129 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1133 = -_963;
    float _1135 = _1123 * _1133;
    float _1137 = _1061 + _1043;
    float _1139 = _1129 * _953;
    float _1141 = _1131 * _971;
    float _1143 = fma(_1081, _927, _1135);
    float _1145 = -_965;
    float _1147 = _1123 * _1145;
    float _1149 = -_967;
    float _1151 = _1123 * _1149;
    float _1153 = -_1085;
    float _1155 = _1153 + 0.5;
    float _1157 = fma(_1081, _929, _1147);
    float _1159 = sqrt(_1137);
    float _1161 = fma(_1081, _931, _1151);
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1171 = _1163 * _1125;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _885 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1181 = _963 + _1113;
    float _1183 = _965 + _1111;
    float _1185 = _967 + _1115;
    out.m_68.x = _1127;
    out.m_68.y = _1139;
    out.m_68.z = _1141;
    out.m_68.w = _1171;
    bool _1187 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1189 = isnan(_1159);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1195 = _1191 || _1193;
    out.m_70.x = _1173;
    out.m_70.y = _1175;
    out.m_70.z = _1177;
    out.m_70.w = _1179;
    out.m_72.x = _1069;
    out.m_72.y = _1099;
    out.m_72.z = _1087;
    out.m_74.x = _1143;
    out.m_74.y = _1157;
    out.m_74.z = _1161;
    float _1197 = _1039;
    if (!_1195)
    {
        _983 = 1.0;
    }
    float _1199 = _983;
    out.m_76.x = _1181;
    out.m_76.y = _1183;
    out.m_76.z = _1185;
    bool _1201 = !_1195;
    float _1203 = _1199;
    if (!_1201)
    {
        bool _1205 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1207 = isnan(_1159);
        bool _1209 = _1205 || _1207;
        bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1213 = _1209 || _1211;
        if (!_1213)
        {
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1217 = _1159 + _1215;
            float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1221 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1219;
            float _1223 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1225 = _1223 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1227 = 1.0 / _1221;
            float _1229 = _1217 * _1227;
            float _1231 = fma(_1229, _1225, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1203 = _1231;
            _1233 = true;
        }
        else
        {
            bool _1235 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1237 = isnan(_1159);
            bool _1239 = _1235 || _1237;
            bool _1241 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1243 = _1239 || _1241;
            if (!_1243)
            {
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1247 = _1159 + _1245;
                float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1251 = _1249 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1253 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1255 = _1253 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1257 = 1.0 / _1251;
                float _1259 = _1247 * _1257;
                float _1261 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1203 = _1261;
                _1233 = true;
            }
            else
            {
                _1203 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1233 = false;
    float _1263 = _1203;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1267 = _1039 + _1265;
    float _1269 = _943 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1273 = _1045 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1047 + _1275;
    float _1279 = fma(_1267, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1269);
    float _1283 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1285 = fma(_1277, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1287 = -_943;
    float _1289 = _1287 + _1279;
    float _1291 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1281);
    float _1293 = -_843;
    float _1295 = _1293 + _1283;
    float _1297 = _943 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1299 = _1289 * _1289;
    float _1301 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = -_845;
    float _1305 = _1303 + _1285;
    float _1307 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1297);
    float _1309 = fma(_1295, _1295, _1299);
    float _1311 = 1.0 / _1301;
    float _1313 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1307);
    float _1315 = fma(_1305, _1305, _1309);
    float _1317 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1319 = sqrt(_1315);
    float _1321 = _1317 + _1301;
    float _1323 = _1321 * _1311;
    float _1325 = _1323 * 0.5;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1329 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1327);
    bool _1331 = _1319 > 0.0;
    float _1333 = 1.0 / _1329;
    bool _1335 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan(0.5);
    bool _1343 = _1339 || _1341;
    bool _1345 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan(0.5);
    bool _1353 = _1349 || _1351;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1359 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1361 = _1305;
    float _1363 = _1283;
    float _1365 = _1315;
    if (!_1331)
    {
        _1355 = _1283;
    }
    float _1367 = _1355;
    float _1369 = _1367;
    if (!_1331)
    {
        _1357 = _1279;
    }
    float _1371 = _1357;
    float _1373 = _1371;
    if (!_1331)
    {
        _1359 = _1285;
    }
    float _1375 = _1359;
    bool _1377 = !_1331;
    float _1379 = _1375;
    float _1381 = _1375;
    if (!_1377)
    {
        float _1383 = _187 * _187;
        float _1385 = fma(_185, _185, _1383);
        float _1387 = fma(_189, _189, _1385);
        float _1389 = rsqrt(_1315);
        float _1391 = sqrt(_1387);
        float _1393 = _1295 * _1389;
        float _1395 = _1289 * _1389;
        float _1397 = _1305 * _1389;
        bool _1399 = _1391 > 0.0;
        float _1401 = _1389;
        float _1403 = _1391;
        _1361 = _1397;
        if (!_1399)
        {
            _1401 = _1283;
        }
        float _1405 = _1401;
        _1369 = _1405;
        if (!_1399)
        {
            _1403 = _1279;
        }
        float _1407 = _1403;
        _1373 = _1407;
        if (!_1399)
        {
            _1379 = _1285;
        }
        float _1409 = _1379;
        bool _1411 = !_1399;
        _1381 = _1409;
        if (!_1411)
        {
            float _1413 = rsqrt(_1387);
            float _1415 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1417 = _187 * _1413;
            float _1419 = _185 * _1413;
            float _1421 = _1395 * _1417;
            float _1423 = _189 * _1413;
            float _1425 = fma(_1393, _1419, _1421);
            float _1427 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1429 = fma(_1397, _1423, _1425);
            float _1431 = _1429 * _1427;
            float _1433 = fma(_185, _1431, _1283);
            float _1435 = fma(_187, _1431, _1279);
            float _1437 = fma(_189, _1431, _1285);
            _1369 = _1433;
            _1373 = _1435;
            _1381 = _1437;
        }
    }
    float _1439 = _1369;
    float _1441 = _1373;
    float _1443 = _1381;
    float _1445 = _1361;
    float _1447 = _1441;
    float _1449 = _1439;
    float _1451 = _1443;
    float _1453 = _1445;
    if (_1343)
    {
        _193 = 1.0;
    }
    float _1455 = _193;
    float _1457 = _1455;
    if (!_1353)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1461 = _943 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1465 = _843 + _1463;
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1469 = -_843;
        float _1471 = _1469 + _1439;
        float _1473 = _1461 * _1461;
        float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1477 = _845 + _1475;
        float _1479 = fma(_1465, _1465, _1473);
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = fma(_1477, _1477, _1479);
        float _1485 = sqrt(_1483);
        float _1487 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1489 = precise::min(_1485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1491 = _1489 * _1481;
        float _1493 = -_943;
        float _1495 = _1493 + _1441;
        float _1497 = _1487 * _1491;
        float _1499 = -_845;
        float _1501 = _1499 + _1443;
        float _1503 = fma(_1495, _1497, _943);
        float _1505 = fma(_1471, _1497, _843);
        float _1507 = fma(_1501, _1497, _845);
        _1447 = _1503;
        _1449 = _1505;
        _1451 = _1507;
        _1363 = _1497;
    }
    float _1509 = _1447;
    float _1511 = _1449;
    float _1513 = _1451;
    float _1515 = _1363;
    float _1517 = _1515;
    if (_1343)
    {
        _1517 = 1.0;
    }
    float _1519 = _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1523 = _1333 * _1521;
    float _1525 = _1519;
    if (!_1343)
    {
        float _1527 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1529 = _1527 * 0.15915493667125701904296875;
        float _1531 = _1529 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1537 = _1535 * 0.15915493667125701904296875;
        float _1539 = _1529 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        float _1543 = 1.0 / _1533;
        float _1545 = _1537 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        float _1549 = _1541 * _1543;
        float _1551 = _1537 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1547 * _1549;
        float _1557 = 1.0 / _1555;
        float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1559;
        float _1563 = 1.0 / _1561;
        float _1565 = _1553 * _1557;
        float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1569 = fma(_1523, _1565, _1567);
        float _1571 = _1569 * _1563;
        float _1573 = precise::clamp(_1571, 0.0, 1.0);
        _195 = _1529;
        _1457 = _1573;
    }
    float _1575 = _195;
    float _1577 = _1457;
    float _1579 = _1575;
    if (!_1343)
    {
        float _1581 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1583 = _1581 * 0.15915493667125701904296875;
        float _1585 = _1583 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1591 = _1589 * 0.15915493667125701904296875;
        float _1593 = _1583 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = 1.0 / _1587;
        float _1599 = _1591 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = _1591 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = _1601 * _1603;
        float _1611 = 1.0 / _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1615 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1613;
        float _1617 = 1.0 / _1615;
        float _1619 = _1607 * _1611;
        float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1623 = fma(_1523, _1619, _1621);
        float _1625 = _1623 * _1617;
        float _1627 = precise::clamp(_1625, 0.0, 1.0);
        float _1629 = -_1627;
        float _1631 = _1629 + 1.0;
        _1365 = _1611;
        _1525 = _1631;
    }
    float _1633 = _1365;
    float _1635 = _1525;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1639 = _1509 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1643 = _1511 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1647 = _1513 + _1645;
    float _1649 = _1639 * _1639;
    float _1651 = fma(_1643, _1643, _1649);
    float _1653 = fma(_1647, _1647, _1651);
    float _1655 = rsqrt(_1653);
    float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1659 = _1643 * _1657;
    float _1661 = _1647 * _1657;
    float _1663 = _1659 * _1659;
    float _1665 = _1661 * _1661;
    float _1667 = _1663 + _1665;
    float _1669 = sqrt(_1667);
    bool _1671 = _1669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1675 = _1669 + _1673;
    float _1677 = _1633;
    float _1679 = _1675;
    float _1681 = _1639;
    if (_1671)
    {
        float _1683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1683;
    }
    float _1685 = _1677;
    if (_1671)
    {
        float _1687 = rsqrt(_1667);
        _1579 = _1687;
    }
    float _1689 = _1579;
    float _1691 = _1685;
    float _1693 = _1689;
    if (_1671)
    {
        float _1695 = _1675 * _1685;
        _1679 = _1695;
    }
    float _1697 = _1679;
    if (_1671)
    {
        float _1699 = _1697 * 0.15915493667125701904296875;
        _1453 = _1699;
    }
    float _1701 = _1453;
    float _1703 = _1647;
    if (_1671)
    {
        float _1705 = _1701 * 6.283185482025146484375;
        float _1707 = sin(_1705);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1713 = precise::max(0.0, _1711);
    float _1715 = _1655;
    if (_1671)
    {
        float _1717 = _1701 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        _1715 = _1719;
    }
    float _1721 = _1715;
    float _1723 = -_1657;
    float _1725 = -_1713;
    float _1727 = fma(_1639, _1723, _1725);
    float _1729 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1671)
    {
        float _1731 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1681 = _1731;
    }
    float _1733 = _1681;
    float _1735 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = fma(_843, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1739 = _1709;
    float _1741 = _1733;
    if (_1671)
    {
        float _1743 = fma(_1709, _1733, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1691 = _1743;
    }
    float _1745 = _1691;
    float _1747 = _1745;
    if (!_1671)
    {
        _1739 = _1661;
    }
    float _1749 = _1739;
    float _1751 = sqrt(_1653);
    float _1753 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1755 = _1749;
    float _1757 = _1721;
    if (_1671)
    {
        float _1759 = _1721 + (-1.0);
        _1741 = _1759;
    }
    float _1761 = _1741;
    float _1763 = _1761;
    if (_1671)
    {
        float _1765 = _1689 * _1745;
        _1197 = _1765;
    }
    float _1767 = _1197;
    if (!_1671)
    {
        _1747 = _1659;
    }
    float _1769 = _1747;
    float _1771 = _1769;
    if (_1671)
    {
        float _1773 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1773;
    }
    float _1775 = _1729;
    if (_1671)
    {
        float _1777 = _1659 * _1767;
        _1771 = _1777;
    }
    float _1779 = _1771;
    if (!_1671)
    {
        _1693 = _1727;
    }
    float _1781 = _1693;
    float _1783 = _1781;
    if (_1671)
    {
        float _1785 = _1661 * _1767;
        _1755 = _1785;
    }
    float _1787 = _1755;
    if (!_1671)
    {
        _1763 = _1663;
    }
    float _1789 = _1763;
    float _1791 = _1789;
    if (_1671)
    {
        float _1793 = fma(_1727, _1721, _1775);
        _1783 = _1793;
    }
    float _1795 = _1783;
    if (_1671)
    {
        float _1797 = _1779 * _1779;
        _1791 = _1797;
    }
    float _1799 = _1791;
    if (!_1671)
    {
        _1757 = _1665;
    }
    float _1801 = _1757;
    float _1803 = _1801;
    if (_1671)
    {
        float _1805 = _1787 * _1787;
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = fma(_1795, _1795, _1799);
    float _1811 = floor(_1737);
    float _1813 = _1809 + _1807;
    float _1815 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1821 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1819);
    float _1823 = precise::clamp(_1821, 0.0, 1.0);
    float _1825 = fma(_845, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1827 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1829 = rsqrt(_1813);
    float _1831 = -_1823;
    float _1833 = _1831 + 1.0;
    float _1835 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1839 = -_1837;
    float _1841 = fma(_1839, _1817, 1.0);
    float _1843 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1845 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1847 = abs(_1833);
    float _1849 = log2(_1847);
    float _1851 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1843);
    float _1853 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1855 = _1829 * _1779;
    float _1857 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1853);
    float _1859 = _1829 * _1795;
    float _1861 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1851);
    float _1863 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1865 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1867 = _1829 * _1787;
    float _1869 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1835);
    float _1871 = -_1863;
    float _1873 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1871);
    float _1875 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1877 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1879 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1869);
    float _1881 = -_1867;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1873);
    float _1885 = floor(_1825);
    float _1887 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1877);
    float _1889 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1891 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1893 = -_1811;
    float _1895 = _1737 + _1893;
    float _1897 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1887);
    float _1899 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = log2(_1841);
    float _1903 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1897);
    float _1905 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1907 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1909 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1911 = _1859 + 1.0;
    float _1913 = exp2(_1891);
    float _1915 = fma(_1883, -0.5, 0.5);
    float _1917 = fma(_1883, 0.5, 0.5);
    float _1919 = -_1885;
    float _1921 = _1825 + _1919;
    float _1923 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1909);
    float _1925 = fma(_1917, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = sqrt(_1915);
    float _1929 = _1901 * 0.693147182464599609375;
    float _1931 = fma(_1917, _1925, -0.212114393711090087890625);
    float _1933 = 1.0 / _1903;
    float _1935 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1907);
    float _1937 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1923);
    float _1939 = fma(_1917, _1931, 1.570728778839111328125);
    float _1941 = -_1859;
    float _1943 = fma(_1913, _1911, _1941);
    float _1945 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1935);
    float2 _5456 = float2(_1895, _1921);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5456, float2(0.0), isnan(_5456)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5456, float2(0.0), isnan(_5456)), level(0.0)).x;
    float _1949 = _1927 * 0.636619746685028076171875;
    float _1951 = _1945 * _1933;
    float _1953 = _1937 * _1933;
    float _1955 = -_1939;
    float _1957 = fma(_1949, _1955, 1.0);
    float _1959 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1961 = fma(_1951, 0.5, 0.5);
    float _1963 = fma(_1953, -0.5, 0.5);
    float _1965 = fma(_1943, 0.5, 0.5);
    float3 _5491 = float3(_1961, _1963, _1959);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5491, float3(0.0), isnan(_5491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5491, float3(0.0), isnan(_5491)), level(0.0)).x;
    float3 _5502 = float3(_1961, _1963, _1959);
    float4 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5502, float3(0.0), isnan(_5502)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5502, float3(0.0), isnan(_5502)), level(0.0)).xyzw;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = _1970.w;
    float2 _5518 = float2(_1957, _1965);
    float3 _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5518, float2(0.0), isnan(_5518)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5518, float2(0.0), isnan(_5518)), level(0.0)).xyz;
    float _1984 = _1982.x;
    float _1986 = _1982.y;
    float _1988 = _1982.z;
    float _1990 = abs(_1523);
    float _1992 = log2(_1990);
    float _1994 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1511;
    out.m_78.y = _1509;
    out.m_78.z = _1513;
    bool _1996 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1998 = isnan(_1751);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2004 = _2000 || _2002;
    float _2006 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2008 = in.m_80.x;
    float _2010 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2006);
    bool _2012 = _1523 <= 8000.0;
    bool _2014 = isnan(_1523);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(8000.0);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2010);
    float _2026 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1945;
    out.gl_Position.y = _1937;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _1903;
    float _2028 = exp2(_2026);
    float _2030 = _1577 * _1635;
    float _2032 = _1937;
    float _2034 = _1903;
    float _2036 = _2024;
    float _2038 = _2030;
    if (!_2004)
    {
        _2032 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2040 = _2032;
    float _2042 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = fma(_2044, -2.0, 3.0);
    float _2048 = _2044 * _2044;
    float _2050 = _2048 * _2046;
    float _2052 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = -_2050;
    float _2056 = _2054 + 1.0;
    float _2058 = exp2(_2052);
    float _2060 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2050);
    float _2062 = _2024 + _1903;
    float _2064 = _2040;
    float _2066 = _2040;
    if (!_2004)
    {
        _2034 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2068 = _2034;
    float _2070 = _2022 * _2060;
    float _2072 = _2062 * 0.5;
    float _2074 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2076 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2078 = _2068;
    float _2080 = _2068;
    if (!_2004)
    {
        _2036 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2082 = _2036;
    out.m_82.z = _2072;
    out.m_82.w = _1903;
    float _2084 = -_2058;
    float _2086 = _2084 + 1.0;
    float _2088 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2090 = -_1947;
    float _2092 = _2090 + 1.0;
    float _2094 = _2092 * _2074;
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = -_2096;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2102 = _1972;
    float _2104 = _2082;
    float _2106 = _2082;
    if (!_2004)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2108 = _2076;
    float _2110 = _2100 * _2008;
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2114 = _2088 * _1967;
    float _2116 = -_2088;
    float _2118 = _2116 + 1.0;
    out.m_84.x = _2112;
    float _2120 = _1978 * _2114;
    float _2122 = _1988 * _2114;
    float _2124 = _1978 * _2118;
    float _2126 = fma(_1984, _2120, _1972);
    float _2128 = fma(_1986, _2120, _1974);
    float _2130 = fma(_1978, _2122, _1976);
    float _2132 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2134 = _2108;
    float _2136 = _2108;
    if (!_2004)
    {
        _2102 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2138 = _2102;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2004)
    {
        _2038 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2144 = _2038;
    out.m_86.x = _2126;
    out.m_86.y = _2128;
    out.m_86.z = _2130;
    out.m_86.w = _2124;
    bool _2146 = !_2004;
    float _2148 = _2144;
    float _2150 = _2144;
    if (!_2146)
    {
        bool _2152 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2154 = isnan(_1751);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2160 = _2156 || _2158;
        if (!_2160)
        {
            float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2164 = _1751 + _2162;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2166;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2174 = 1.0 / _2168;
            float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2192 = _2164 * _2174;
            float _2194 = precise::clamp(_2192, 0.0, 1.0);
            float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2200 = fma(_2194, _2172, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2142 = _2204;
            _2066 = _2208;
            _2136 = _2200;
            _2106 = _2206;
            _2080 = _2202;
            _2150 = _2210;
            _2212 = true;
        }
        else
        {
            bool _2214 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2216 = isnan(_1751);
            bool _2218 = _2214 || _2216;
            bool _2220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2222 = _2218 || _2220;
            if (!_2222)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2224 = _2134;
            _2136 = _2224;
            if (!_2222)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2226 = _2140;
            _2142 = _2226;
            if (!_2222)
            {
                _2078 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2228 = _2078;
            _2080 = _2228;
            if (!_2222)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2230 = _2104;
            _2106 = _2230;
            if (!_2222)
            {
                _2064 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2232 = _2064;
            _2066 = _2232;
            if (!_2222)
            {
                _2148 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2234 = _2148;
            bool _2236 = !_2222;
            _2150 = _2234;
            if (!_2236)
            {
                bool _2238 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2240 = isnan(_1751);
                bool _2242 = _2238 || _2240;
                bool _2244 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2246 = _2242 || _2244;
                if (!_2246)
                {
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2250 = _1751 + _2248;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2254 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2252;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2260 = 1.0 / _2254;
                    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2268 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2272 = _2270 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2278 = _2250 * _2260;
                    float _2280 = precise::clamp(_2278, 0.0, 1.0);
                    float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2286 = fma(_2280, _2258, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2288 = fma(_2280, _2284, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2290 = fma(_2280, _2264, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2292 = fma(_2280, _2268, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2294 = fma(_2280, _2272, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2296 = fma(_2280, _2276, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2142 = _2290;
                    _2066 = _2294;
                    _2136 = _2286;
                    _2106 = _2292;
                    _2080 = _2288;
                    _2150 = _2296;
                    _2212 = true;
                }
                else
                {
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2066 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2080 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2150 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2212 = false;
    float _2298 = _2142;
    float _2300 = _2066;
    float _2302 = _2136;
    float _2304 = _2106;
    float _2306 = _2080;
    float _2308 = _2150;
    float _2310 = fma(_1183, -0.5, 0.5);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -_2298;
    float _2316 = _2314 + _2300;
    float _2318 = _2132 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2320 = -_2302;
    float _2322 = _2320 + _2304;
    float _2324 = fma(_2312, _2316, _2298);
    out.m_88.x = 0.0;
    float _2326 = -_2306;
    float _2328 = _2326 + _2308;
    float _2330 = fma(_2312, _2322, _2302);
    float _2332 = _2324 * 0.586610972881317138671875;
    out.m_51.x = _2318;
    bool _2334 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2336 = fma(_2312, _2328, _2306);
    float _2338 = fma(_2330, 0.298911988735198974609375, _2332);
    bool _2340 = _1577 > 0.0;
    bool _2342 = isnan(_1577);
    bool _2344 = _2340 || _2342;
    bool _2346 = isnan(0.0);
    bool _2348 = _2344 || _2346;
    float _2350 = fma(_2336, 0.114477999508380889892578125, _2338);
    bool _2352 = _1635 <= 0.0;
    bool _2354 = !_2348;
    bool _2356 = _2352 || _2354;
    float _2358 = -_2350;
    float _2360 = _2330 + _2358;
    float _2362 = -_2350;
    float _2364 = _2324 + _2362;
    float _2366 = -_2350;
    float _2368 = _2336 + _2366;
    float _2370 = fma(_2360, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    float _2372 = fma(_2364, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    float _2374 = fma(_2368, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    bool _2376 = !_2334;
    if (!_2376)
    {
        float _2378 = -_1509;
        float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2382 = -_1511;
        float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2386 = -_1513;
        float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2390 = _2380 * _2380;
        float _2392 = fma(_2384, _2384, _2390);
        float _2394 = fma(_2388, _2388, _2392);
        float _2396 = sqrt(_2394);
        float _2398 = rsqrt(_2394);
        float _2400 = -_2396;
        float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2404 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2406 = precise::clamp(_2404, 0.0, 1.0);
        float _2408 = _2384 * _2398;
        float _2410 = _2380 * _2398;
        float _2412 = abs(_2406);
        float _2414 = log2(_2412);
        float _2416 = _2388 * _2398;
        float _2418 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2420 = _1183 * _2410;
        float _2422 = -_2410;
        float _2424 = -_2418;
        float _2426 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2424);
        float _2428 = fma(_1181, _2408, _2420);
        float _2430 = -_2416;
        float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2426);
        float _2434 = fma(_1185, _2416, _2428);
        float _2436 = precise::clamp(_2434, 0.0, 1.0);
        float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2440 = _2432 + _2438;
        float _2442 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2444 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2446 = precise::clamp(_2444, 0.0, 1.0);
        float _2448 = exp2(_2442);
        float _2450 = _2448 * _2446;
        float _2452 = _2436 * _2450;
        float _2454 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2456 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2458 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2454;
        out.m_88.y = _2456;
        out.m_88.z = _2458;
    }
    out.m_90.x = _2370;
    out.m_90.y = _2372;
    out.m_90.z = _2374;
    if (!_2356)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2460 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2460;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2212 = false;
    bool _1233 = false;
    bool _317 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2517 = as_type<float>(_125);
        out.gl_Position.z = _2517;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2587 = as_type<float>(_163);
        out.gl_Position.z = _2587;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_171;
    float _193 = _189;
    float _195 = _187;
    float _213;
    if (!_191)
    {
        float _197 = in.m_57.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_109);
        float _219 = 1.0 / _217;
        float _221 = _143 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_57.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_109);
        float _321 = 1.0 / _319;
        float _323 = _143 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = in.m_57.x;
    float _329 = in.m_57.y;
    float _331 = in.m_57.z;
    float _333 = in.m_57.w;
    float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _337 = log2(_335);
    float _339 = as_type<float>(int(gl_VertexIndex));
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _343 = 1.0 + _341;
    bool _345 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _347 = isnan(_325);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = 1.0 / _343;
    float _359 = _337 * _143;
    float _361 = exp2(_359);
    float _363 = _331 * 2.0;
    float _365 = _327 * 2.0;
    int _367 = as_type<int>(_339) & 1;
    bool _369 = _367 != 0;
    int _371 = as_type<int>(_339) & 2;
    bool _373 = _371 != 0;
    bool _375 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _377 = isnan(1.0);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _383 = _379 || _381;
    float _385 = floor(_363);
    float _387 = _329 * 2.0;
    bool _389 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _391 = isnan(0.0);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _397 = _393 || _395;
    bool _399 = _333 > 0.5;
    float _401 = _329 + _331;
    float _403 = floor(_365);
    float _405 = -_361;
    float _407 = _405 + 1.0;
    float _409 = _401 + (-1.0);
    float _411 = _397 ? _407 : 0.0;
    bool _413 = _385 > 0.0;
    float _415 = floor(_387);
    bool _417 = _385 >= 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    if (_383)
    {
        float _427 = _411 * _357;
        _145 = _427;
    }
    float _429 = _145;
    float _431 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = _331 + _327;
    int _435 = _425 ? 0 : 1;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _447 = _445 != 0;
    float _449 = _433 + (-1.0);
    int _451 = ~_435;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    int _457 = _455;
    if (!_413)
    {
        int _459 = ~_435;
        int _461 = _459 + 1;
        _457 = _461;
    }
    int _463 = _457;
    bool _465 = _403 >= 0.0;
    bool _467 = isnan(_403);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _477 = !_439;
    int _479 = _477 ? 0 : 1;
    float _481 = _329 + _327;
    int _483 = _473 ? 0 : 1;
    bool _485 = _415 >= 0.0;
    bool _487 = isnan(_415);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _481 + (-1.0);
    bool _497 = _403 > 0.0;
    int _499 = _493 ? 0 : 1;
    bool _501 = _415 > 0.0;
    int _503 = abs(_479);
    float _505 = in.m_62.x;
    float _507 = in.m_62.y;
    float _509 = in.m_62.z;
    float _511 = float(_463);
    float _513 = float(_503);
    int _515 = ~_483;
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    int _521 = _519;
    if (!_497)
    {
        int _523 = ~_483;
        int _525 = _523 + 1;
        _521 = _525;
    }
    int _527 = _521;
    float _529 = _513 * _511;
    bool _531 = !_443;
    int _533 = _531 ? 0 : 1;
    bool _535 = !_447;
    int _537 = _535 ? 0 : 1;
    float _539 = _529 * (-2.0);
    int _541 = abs(_533);
    int _543 = ~_499;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    float _549 = float(_541);
    float _551 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _553 = float(_527);
    int _555 = _547;
    if (!_501)
    {
        int _557 = ~_499;
        int _559 = _557 + 1;
        _555 = _559;
    }
    int _561 = _555;
    float _563 = fma(_539, _505, _505);
    int _565 = abs(_537);
    float _567 = _549 * _553;
    bool _569 = _327 > 0.5;
    float _571 = _327 + (-0.5);
    float _573 = float(_565);
    float _575 = fma(_551, _539, _551);
    float _577 = float(_561);
    float _579 = _567 * (-2.0);
    float _581 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[196].x, _563);
    bool _583 = _329 > 0.5;
    float _585 = _573 * _577;
    float _587 = _329 + (-0.5);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = fma(_579, _507, _507);
    float _595 = fma(_575, _429, _581);
    float _597 = in.m_64.x;
    float _599 = in.m_64.y;
    float _601 = _585 * (-2.0);
    float _603 = fma(_431, _579, _431);
    float _605 = in.m_48.x;
    float _607 = in.m_48.y;
    float _609 = in.m_48.z;
    float _611 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[196].y, _593);
    float _613 = fma(_601, _509, _509);
    float _615 = _331 + (-0.5);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = fma(_475, _601, _475);
    float _623 = fma(_603, _429, _611);
    float _625 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _627 = 1.0 / _591;
    float _629 = _595 * 0.15915493667125701904296875;
    float _631 = _623 * 0.15915493667125701904296875;
    float _633 = fma(_621, _429, _625);
    float _635 = _633 * 0.15915493667125701904296875;
    float _637 = 1.0 / _619;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _639;
    bool _643 = !_369;
    float _645 = _643 ? (-0.5) : 0.5;
    float _647 = _293 * _597;
    float _649 = _295 * _599;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _653 = _651 != 0;
    float _655 = _629 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _607 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _661 = !_373;
    float _663 = _661 ? (-0.5) : 0.5;
    float _665 = _607 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _669 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _645);
    float _673 = _631 * 6.283185482025146484375;
    float _675 = sin(_673);
    float _677 = _641 * _637;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _325 + _679;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _663);
    float _685 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    float _687 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _689 = _669 * _671;
    float _691 = _667 * _683;
    float _693 = _631 * 6.283185482025146484375;
    float _695 = cos(_693);
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _703 = _701 != 0;
    float _705 = _629 * 6.283185482025146484375;
    float _707 = sin(_705);
    float _709 = _657 * _675;
    float _711 = _635 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _607 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _721 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].x, _715);
    float _723 = _719 * _627;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _325 + _725;
    float _729 = _635 * 6.283185482025146484375;
    float _731 = sin(_729);
    float _733 = _707 * _695;
    float _735 = fma(_723, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = _657 * _695;
    float _739 = _707 * _675;
    float _741 = fma(_677, _727, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _743 = _657 * _713;
    float _745 = _707 * _713;
    float _747 = _695 * _713;
    float _749 = _675 * _713;
    bool _751 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _753 = isnan(_325);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -_355;
    float _765 = _763 + 1.0;
    float _767 = _743 * _691;
    bool _769 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _771 = isnan(_325);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_731, _737, _739);
    float _783 = -_709;
    float _785 = fma(_731, _733, _783);
    float _787 = -_733;
    float _789 = fma(_731, _709, _787);
    float _791 = _761 * _765;
    float _793 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _795 = -_691;
    float _797 = _731 * _795;
    float _799 = fma(_781, _689, _767);
    float _801 = _745 * _691;
    float _803 = -_761;
    float _805 = _803 + 1.0;
    float _807 = fma(_747, _689, _797);
    float _809 = fma(_789, _793, _799);
    float _811 = fma(_731, _739, _737);
    float _813 = fma(_785, _689, _801);
    float _815 = fma(_749, _793, _807);
    float _817 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = _779 * _805;
    float _823 = fma(_811, _793, _813);
    float _825 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _829 = _741 * _821;
    float _831 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    float _833 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[6].z, _721);
    float _835 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _837 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _827);
    float _839 = -_779;
    float _841 = _839 + 1.0;
    float _843 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _845 = _833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _847 = _835 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _849 = _837 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _829);
    float _853 = _843 + _847;
    float _855 = _845 + _849;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _863 = fma(_735, _791, _851);
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _867 = _853 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _855 + _869;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _875 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _867 * _867;
    float _883 = _871 * _871;
    float _885 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[117].x, _863);
    float _887 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _875;
    out.m_66.y = _877;
    out.m_66.z = _879;
    out.m_66.w = _873;
    float _889 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[5].z, _687);
    float _891 = _743 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _893 = _743 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _895 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _897 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _903 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _905 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _901);
    float _907 = _881 + _883;
    float _909 = _743 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _911 = -_731;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _891);
    float _915 = sqrt(_907);
    float _917 = -_731;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _909);
    float _921 = -_731;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].x, _893);
    float _925 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _887);
    float _927 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].z, _913);
    float _929 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].z, _919);
    float _931 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _925);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _939 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _943 = _889 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = _935 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _947 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _895);
    float _949 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    bool _951 = _915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _955 = _943 + _945;
    float _957 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _959 = -_663;
    int _961 = _399 ? as_type<int>(_959) : as_type<int>(_663);
    float _963 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].z, _941);
    float _965 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _967 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].z, _949);
    bool _969 = _331 > 0.5;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _973 = _743;
    float _975 = _881;
    float _977 = _883;
    float _979 = _853;
    float _981 = _855;
    float _983 = _965;
    if (!_951)
    {
        _973 = _955;
    }
    float _985 = _973;
    bool _987 = !_951;
    float _989 = _985;
    if (!_987)
    {
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _993 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _995 = _915 + _993;
        float _997 = rsqrt(_907);
        float _999 = _995 * _991;
        float _1001 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = _999 * 0.15915493667125701904296875;
        float _1005 = _1003 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1003 * 6.283185482025146484375;
        float _1011 = cos(_1009);
        float _1013 = fma(_1007, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = _997 * _1013;
        float _1017 = fma(_867, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = _1011 + (-1.0);
        float _1021 = fma(_871, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1025 = _1017 + _1023;
        float _1027 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1031 = _1021 + _1029;
        float _1033 = _1025 * _1025;
        float _1035 = fma(_955, _1011, _1027);
        float _1037 = _1031 * _1031;
        _989 = _1035;
        _975 = _1033;
        _977 = _1037;
        _979 = _1017;
        _981 = _1021;
    }
    float _1039 = _989;
    float _1041 = _975;
    float _1043 = _977;
    float _1045 = _979;
    float _1047 = _981;
    float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1051 = _1039 + _1049;
    float _1053 = _663 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1055 = -_645;
    int _1057 = _569 ? as_type<int>(_1055) : as_type<int>(_645);
    float _1059 = _645 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1061 = fma(_1051, _1051, _1041);
    float _1063 = fma(_1053, _1053, 1.0);
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _903);
    float _1071 = -_663;
    int _1073 = _583 ? as_type<int>(_1071) : as_type<int>(_663);
    float _1075 = _1053 * _929;
    bool _1077 = !_1067;
    float _1079 = _1077 ? _645 : as_type<float>(_1057);
    float _1081 = rsqrt(_1063);
    bool _1083 = !_703;
    float _1085 = _1083 ? _663 : as_type<float>(_961);
    float _1087 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _905);
    float _1089 = -_645;
    int _1091 = _969 ? as_type<int>(_1089) : as_type<int>(_645);
    float _1093 = _1079 + 0.5;
    bool _1095 = !_653;
    float _1097 = _1095 ? _663 : as_type<float>(_1073);
    float _1099 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    bool _1101 = !_699;
    float _1103 = _1101 ? _645 : as_type<float>(_1091);
    float _1105 = _1053 * _927;
    float _1107 = _1053 * _931;
    float _1109 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1111 = fma(_1059, _1099, _1075);
    float _1113 = fma(_1059, _1069, _1105);
    float _1115 = fma(_1059, _1087, _1107);
    float _1117 = -_1097;
    float _1119 = _1117 + 0.5;
    float _1121 = _1103 + 0.5;
    float _1123 = _1053 * _1081;
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1127 = _1109 * _937;
    float _1129 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1133 = -_963;
    float _1135 = _1123 * _1133;
    float _1137 = _1061 + _1043;
    float _1139 = _1129 * _953;
    float _1141 = _1131 * _971;
    float _1143 = fma(_1081, _927, _1135);
    float _1145 = -_965;
    float _1147 = _1123 * _1145;
    float _1149 = -_967;
    float _1151 = _1123 * _1149;
    float _1153 = -_1085;
    float _1155 = _1153 + 0.5;
    float _1157 = fma(_1081, _929, _1147);
    float _1159 = sqrt(_1137);
    float _1161 = fma(_1081, _931, _1151);
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1171 = _1163 * _1125;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _885 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1181 = _963 + _1113;
    float _1183 = _965 + _1111;
    float _1185 = _967 + _1115;
    out.m_68.x = _1127;
    out.m_68.y = _1139;
    out.m_68.z = _1141;
    out.m_68.w = _1171;
    bool _1187 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1189 = isnan(_1159);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1195 = _1191 || _1193;
    out.m_70.x = _1173;
    out.m_70.y = _1175;
    out.m_70.z = _1177;
    out.m_70.w = _1179;
    out.m_72.x = _1069;
    out.m_72.y = _1099;
    out.m_72.z = _1087;
    out.m_74.x = _1143;
    out.m_74.y = _1157;
    out.m_74.z = _1161;
    float _1197 = _1039;
    if (!_1195)
    {
        _983 = 1.0;
    }
    float _1199 = _983;
    out.m_76.x = _1181;
    out.m_76.y = _1183;
    out.m_76.z = _1185;
    bool _1201 = !_1195;
    float _1203 = _1199;
    if (!_1201)
    {
        bool _1205 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1207 = isnan(_1159);
        bool _1209 = _1205 || _1207;
        bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1213 = _1209 || _1211;
        if (!_1213)
        {
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1217 = _1159 + _1215;
            float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1221 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1219;
            float _1223 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1225 = _1223 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1227 = 1.0 / _1221;
            float _1229 = _1217 * _1227;
            float _1231 = fma(_1229, _1225, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1203 = _1231;
            _1233 = true;
        }
        else
        {
            bool _1235 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1237 = isnan(_1159);
            bool _1239 = _1235 || _1237;
            bool _1241 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1243 = _1239 || _1241;
            if (!_1243)
            {
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1247 = _1159 + _1245;
                float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1251 = _1249 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1253 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1255 = _1253 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1257 = 1.0 / _1251;
                float _1259 = _1247 * _1257;
                float _1261 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1203 = _1261;
                _1233 = true;
            }
            else
            {
                _1203 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1233 = false;
    float _1263 = _1203;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1267 = _1039 + _1265;
    float _1269 = _943 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1273 = _1045 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1047 + _1275;
    float _1279 = fma(_1267, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1269);
    float _1283 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1285 = fma(_1277, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1287 = -_943;
    float _1289 = _1287 + _1279;
    float _1291 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1281);
    float _1293 = -_843;
    float _1295 = _1293 + _1283;
    float _1297 = _943 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1299 = _1289 * _1289;
    float _1301 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = -_845;
    float _1305 = _1303 + _1285;
    float _1307 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1297);
    float _1309 = fma(_1295, _1295, _1299);
    float _1311 = 1.0 / _1301;
    float _1313 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1307);
    float _1315 = fma(_1305, _1305, _1309);
    float _1317 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1319 = sqrt(_1315);
    float _1321 = _1317 + _1301;
    float _1323 = _1321 * _1311;
    float _1325 = _1323 * 0.5;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1329 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1327);
    bool _1331 = _1319 > 0.0;
    float _1333 = 1.0 / _1329;
    bool _1335 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan(0.5);
    bool _1343 = _1339 || _1341;
    bool _1345 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan(0.5);
    bool _1353 = _1349 || _1351;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1359 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1361 = _1305;
    float _1363 = _1283;
    float _1365 = _1315;
    if (!_1331)
    {
        _1355 = _1283;
    }
    float _1367 = _1355;
    float _1369 = _1367;
    if (!_1331)
    {
        _1357 = _1279;
    }
    float _1371 = _1357;
    float _1373 = _1371;
    if (!_1331)
    {
        _1359 = _1285;
    }
    float _1375 = _1359;
    bool _1377 = !_1331;
    float _1379 = _1375;
    float _1381 = _1375;
    if (!_1377)
    {
        float _1383 = _187 * _187;
        float _1385 = fma(_185, _185, _1383);
        float _1387 = fma(_189, _189, _1385);
        float _1389 = rsqrt(_1315);
        float _1391 = sqrt(_1387);
        float _1393 = _1295 * _1389;
        float _1395 = _1289 * _1389;
        float _1397 = _1305 * _1389;
        bool _1399 = _1391 > 0.0;
        float _1401 = _1389;
        float _1403 = _1391;
        _1361 = _1397;
        if (!_1399)
        {
            _1401 = _1283;
        }
        float _1405 = _1401;
        _1369 = _1405;
        if (!_1399)
        {
            _1403 = _1279;
        }
        float _1407 = _1403;
        _1373 = _1407;
        if (!_1399)
        {
            _1379 = _1285;
        }
        float _1409 = _1379;
        bool _1411 = !_1399;
        _1381 = _1409;
        if (!_1411)
        {
            float _1413 = rsqrt(_1387);
            float _1415 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1417 = _187 * _1413;
            float _1419 = _185 * _1413;
            float _1421 = _1395 * _1417;
            float _1423 = _189 * _1413;
            float _1425 = fma(_1393, _1419, _1421);
            float _1427 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1429 = fma(_1397, _1423, _1425);
            float _1431 = _1429 * _1427;
            float _1433 = fma(_185, _1431, _1283);
            float _1435 = fma(_187, _1431, _1279);
            float _1437 = fma(_189, _1431, _1285);
            _1369 = _1433;
            _1373 = _1435;
            _1381 = _1437;
        }
    }
    float _1439 = _1369;
    float _1441 = _1373;
    float _1443 = _1381;
    float _1445 = _1361;
    float _1447 = _1441;
    float _1449 = _1439;
    float _1451 = _1443;
    float _1453 = _1445;
    if (_1343)
    {
        _193 = 1.0;
    }
    float _1455 = _193;
    float _1457 = _1455;
    if (!_1353)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1461 = _943 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1465 = _843 + _1463;
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1469 = -_843;
        float _1471 = _1469 + _1439;
        float _1473 = _1461 * _1461;
        float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1477 = _845 + _1475;
        float _1479 = fma(_1465, _1465, _1473);
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = fma(_1477, _1477, _1479);
        float _1485 = sqrt(_1483);
        float _1487 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1489 = precise::min(_1485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1491 = _1489 * _1481;
        float _1493 = -_943;
        float _1495 = _1493 + _1441;
        float _1497 = _1487 * _1491;
        float _1499 = -_845;
        float _1501 = _1499 + _1443;
        float _1503 = fma(_1495, _1497, _943);
        float _1505 = fma(_1471, _1497, _843);
        float _1507 = fma(_1501, _1497, _845);
        _1447 = _1503;
        _1449 = _1505;
        _1451 = _1507;
        _1363 = _1497;
    }
    float _1509 = _1447;
    float _1511 = _1449;
    float _1513 = _1451;
    float _1515 = _1363;
    float _1517 = _1515;
    if (_1343)
    {
        _1517 = 1.0;
    }
    float _1519 = _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1523 = _1333 * _1521;
    float _1525 = _1519;
    if (!_1343)
    {
        float _1527 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1529 = _1527 * 0.15915493667125701904296875;
        float _1531 = _1529 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1537 = _1535 * 0.15915493667125701904296875;
        float _1539 = _1529 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        float _1543 = 1.0 / _1533;
        float _1545 = _1537 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        float _1549 = _1541 * _1543;
        float _1551 = _1537 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1547 * _1549;
        float _1557 = 1.0 / _1555;
        float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1559;
        float _1563 = 1.0 / _1561;
        float _1565 = _1553 * _1557;
        float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1569 = fma(_1523, _1565, _1567);
        float _1571 = _1569 * _1563;
        float _1573 = precise::clamp(_1571, 0.0, 1.0);
        _195 = _1529;
        _1457 = _1573;
    }
    float _1575 = _195;
    float _1577 = _1457;
    float _1579 = _1575;
    if (!_1343)
    {
        float _1581 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1583 = _1581 * 0.15915493667125701904296875;
        float _1585 = _1583 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1591 = _1589 * 0.15915493667125701904296875;
        float _1593 = _1583 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = 1.0 / _1587;
        float _1599 = _1591 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = _1591 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = _1601 * _1603;
        float _1611 = 1.0 / _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1615 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1613;
        float _1617 = 1.0 / _1615;
        float _1619 = _1607 * _1611;
        float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1623 = fma(_1523, _1619, _1621);
        float _1625 = _1623 * _1617;
        float _1627 = precise::clamp(_1625, 0.0, 1.0);
        float _1629 = -_1627;
        float _1631 = _1629 + 1.0;
        _1365 = _1611;
        _1525 = _1631;
    }
    float _1633 = _1365;
    float _1635 = _1525;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1639 = _1509 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1643 = _1511 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1647 = _1513 + _1645;
    float _1649 = _1639 * _1639;
    float _1651 = fma(_1643, _1643, _1649);
    float _1653 = fma(_1647, _1647, _1651);
    float _1655 = rsqrt(_1653);
    float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1659 = _1643 * _1657;
    float _1661 = _1647 * _1657;
    float _1663 = _1659 * _1659;
    float _1665 = _1661 * _1661;
    float _1667 = _1663 + _1665;
    float _1669 = sqrt(_1667);
    bool _1671 = _1669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1675 = _1669 + _1673;
    float _1677 = _1633;
    float _1679 = _1675;
    float _1681 = _1639;
    if (_1671)
    {
        float _1683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1683;
    }
    float _1685 = _1677;
    if (_1671)
    {
        float _1687 = rsqrt(_1667);
        _1579 = _1687;
    }
    float _1689 = _1579;
    float _1691 = _1685;
    float _1693 = _1689;
    if (_1671)
    {
        float _1695 = _1675 * _1685;
        _1679 = _1695;
    }
    float _1697 = _1679;
    if (_1671)
    {
        float _1699 = _1697 * 0.15915493667125701904296875;
        _1453 = _1699;
    }
    float _1701 = _1453;
    float _1703 = _1647;
    if (_1671)
    {
        float _1705 = _1701 * 6.283185482025146484375;
        float _1707 = sin(_1705);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1713 = precise::max(0.0, _1711);
    float _1715 = _1655;
    if (_1671)
    {
        float _1717 = _1701 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        _1715 = _1719;
    }
    float _1721 = _1715;
    float _1723 = -_1657;
    float _1725 = -_1713;
    float _1727 = fma(_1639, _1723, _1725);
    float _1729 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1671)
    {
        float _1731 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1681 = _1731;
    }
    float _1733 = _1681;
    float _1735 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = fma(_843, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1739 = _1709;
    float _1741 = _1733;
    if (_1671)
    {
        float _1743 = fma(_1709, _1733, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1691 = _1743;
    }
    float _1745 = _1691;
    float _1747 = _1745;
    if (!_1671)
    {
        _1739 = _1661;
    }
    float _1749 = _1739;
    float _1751 = sqrt(_1653);
    float _1753 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1755 = _1749;
    float _1757 = _1721;
    if (_1671)
    {
        float _1759 = _1721 + (-1.0);
        _1741 = _1759;
    }
    float _1761 = _1741;
    float _1763 = _1761;
    if (_1671)
    {
        float _1765 = _1689 * _1745;
        _1197 = _1765;
    }
    float _1767 = _1197;
    if (!_1671)
    {
        _1747 = _1659;
    }
    float _1769 = _1747;
    float _1771 = _1769;
    if (_1671)
    {
        float _1773 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1773;
    }
    float _1775 = _1729;
    if (_1671)
    {
        float _1777 = _1659 * _1767;
        _1771 = _1777;
    }
    float _1779 = _1771;
    if (!_1671)
    {
        _1693 = _1727;
    }
    float _1781 = _1693;
    float _1783 = _1781;
    if (_1671)
    {
        float _1785 = _1661 * _1767;
        _1755 = _1785;
    }
    float _1787 = _1755;
    if (!_1671)
    {
        _1763 = _1663;
    }
    float _1789 = _1763;
    float _1791 = _1789;
    if (_1671)
    {
        float _1793 = fma(_1727, _1721, _1775);
        _1783 = _1793;
    }
    float _1795 = _1783;
    if (_1671)
    {
        float _1797 = _1779 * _1779;
        _1791 = _1797;
    }
    float _1799 = _1791;
    if (!_1671)
    {
        _1757 = _1665;
    }
    float _1801 = _1757;
    float _1803 = _1801;
    if (_1671)
    {
        float _1805 = _1787 * _1787;
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = fma(_1795, _1795, _1799);
    float _1811 = floor(_1737);
    float _1813 = _1809 + _1807;
    float _1815 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1821 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1819);
    float _1823 = precise::clamp(_1821, 0.0, 1.0);
    float _1825 = fma(_845, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1827 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1829 = rsqrt(_1813);
    float _1831 = -_1823;
    float _1833 = _1831 + 1.0;
    float _1835 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1839 = -_1837;
    float _1841 = fma(_1839, _1817, 1.0);
    float _1843 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1845 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1847 = abs(_1833);
    float _1849 = log2(_1847);
    float _1851 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1843);
    float _1853 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1855 = _1829 * _1779;
    float _1857 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1853);
    float _1859 = _1829 * _1795;
    float _1861 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1851);
    float _1863 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1865 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1867 = _1829 * _1787;
    float _1869 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1835);
    float _1871 = -_1863;
    float _1873 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1871);
    float _1875 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1877 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1879 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1869);
    float _1881 = -_1867;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1873);
    float _1885 = floor(_1825);
    float _1887 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1877);
    float _1889 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1891 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1893 = -_1811;
    float _1895 = _1737 + _1893;
    float _1897 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1887);
    float _1899 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = log2(_1841);
    float _1903 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1897);
    float _1905 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1907 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1909 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1911 = _1859 + 1.0;
    float _1913 = exp2(_1891);
    float _1915 = fma(_1883, -0.5, 0.5);
    float _1917 = fma(_1883, 0.5, 0.5);
    float _1919 = -_1885;
    float _1921 = _1825 + _1919;
    float _1923 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1909);
    float _1925 = fma(_1917, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = sqrt(_1915);
    float _1929 = _1901 * 0.693147182464599609375;
    float _1931 = fma(_1917, _1925, -0.212114393711090087890625);
    float _1933 = 1.0 / _1903;
    float _1935 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1907);
    float _1937 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1923);
    float _1939 = fma(_1917, _1931, 1.570728778839111328125);
    float _1941 = -_1859;
    float _1943 = fma(_1913, _1911, _1941);
    float _1945 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1935);
    float2 _5456 = float2(_1895, _1921);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5456, float2(0.0), isnan(_5456)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5456, float2(0.0), isnan(_5456)), level(0.0)).x;
    float _1949 = _1927 * 0.636619746685028076171875;
    float _1951 = _1945 * _1933;
    float _1953 = _1937 * _1933;
    float _1955 = -_1939;
    float _1957 = fma(_1949, _1955, 1.0);
    float _1959 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1961 = fma(_1951, 0.5, 0.5);
    float _1963 = fma(_1953, -0.5, 0.5);
    float _1965 = fma(_1943, 0.5, 0.5);
    float3 _5491 = float3(_1961, _1963, _1959);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5491, float3(0.0), isnan(_5491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5491, float3(0.0), isnan(_5491)), level(0.0)).x;
    float3 _5502 = float3(_1961, _1963, _1959);
    float4 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5502, float3(0.0), isnan(_5502)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5502, float3(0.0), isnan(_5502)), level(0.0)).xyzw;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = _1970.w;
    float2 _5518 = float2(_1957, _1965);
    float3 _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5518, float2(0.0), isnan(_5518)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5518, float2(0.0), isnan(_5518)), level(0.0)).xyz;
    float _1984 = _1982.x;
    float _1986 = _1982.y;
    float _1988 = _1982.z;
    float _1990 = abs(_1523);
    float _1992 = log2(_1990);
    float _1994 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1511;
    out.m_78.y = _1509;
    out.m_78.z = _1513;
    bool _1996 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1998 = isnan(_1751);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2004 = _2000 || _2002;
    float _2006 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2008 = in.m_80.x;
    float _2010 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2006);
    bool _2012 = _1523 <= 8000.0;
    bool _2014 = isnan(_1523);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(8000.0);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2010);
    float _2026 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1945;
    out.gl_Position.y = _1937;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _1903;
    float _2028 = exp2(_2026);
    float _2030 = _1577 * _1635;
    float _2032 = _1937;
    float _2034 = _1903;
    float _2036 = _2024;
    float _2038 = _2030;
    if (!_2004)
    {
        _2032 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2040 = _2032;
    float _2042 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = fma(_2044, -2.0, 3.0);
    float _2048 = _2044 * _2044;
    float _2050 = _2048 * _2046;
    float _2052 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = -_2050;
    float _2056 = _2054 + 1.0;
    float _2058 = exp2(_2052);
    float _2060 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2050);
    float _2062 = _2024 + _1903;
    float _2064 = _2040;
    float _2066 = _2040;
    if (!_2004)
    {
        _2034 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2068 = _2034;
    float _2070 = _2022 * _2060;
    float _2072 = _2062 * 0.5;
    float _2074 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2076 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2078 = _2068;
    float _2080 = _2068;
    if (!_2004)
    {
        _2036 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2082 = _2036;
    out.m_82.z = _2072;
    out.m_82.w = _1903;
    float _2084 = -_2058;
    float _2086 = _2084 + 1.0;
    float _2088 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2090 = -_1947;
    float _2092 = _2090 + 1.0;
    float _2094 = _2092 * _2074;
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = -_2096;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2102 = _1972;
    float _2104 = _2082;
    float _2106 = _2082;
    if (!_2004)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2108 = _2076;
    float _2110 = _2100 * _2008;
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2114 = _2088 * _1967;
    float _2116 = -_2088;
    float _2118 = _2116 + 1.0;
    out.m_84.x = _2112;
    float _2120 = _1978 * _2114;
    float _2122 = _1988 * _2114;
    float _2124 = _1978 * _2118;
    float _2126 = fma(_1984, _2120, _1972);
    float _2128 = fma(_1986, _2120, _1974);
    float _2130 = fma(_1978, _2122, _1976);
    float _2132 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2134 = _2108;
    float _2136 = _2108;
    if (!_2004)
    {
        _2102 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2138 = _2102;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2004)
    {
        _2038 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2144 = _2038;
    out.m_86.x = _2126;
    out.m_86.y = _2128;
    out.m_86.z = _2130;
    out.m_86.w = _2124;
    bool _2146 = !_2004;
    float _2148 = _2144;
    float _2150 = _2144;
    if (!_2146)
    {
        bool _2152 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2154 = isnan(_1751);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2160 = _2156 || _2158;
        if (!_2160)
        {
            float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2164 = _1751 + _2162;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2166;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2174 = 1.0 / _2168;
            float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2192 = _2164 * _2174;
            float _2194 = precise::clamp(_2192, 0.0, 1.0);
            float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2200 = fma(_2194, _2172, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2142 = _2204;
            _2066 = _2208;
            _2136 = _2200;
            _2106 = _2206;
            _2080 = _2202;
            _2150 = _2210;
            _2212 = true;
        }
        else
        {
            bool _2214 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2216 = isnan(_1751);
            bool _2218 = _2214 || _2216;
            bool _2220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2222 = _2218 || _2220;
            if (!_2222)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2224 = _2134;
            _2136 = _2224;
            if (!_2222)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2226 = _2140;
            _2142 = _2226;
            if (!_2222)
            {
                _2078 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2228 = _2078;
            _2080 = _2228;
            if (!_2222)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2230 = _2104;
            _2106 = _2230;
            if (!_2222)
            {
                _2064 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2232 = _2064;
            _2066 = _2232;
            if (!_2222)
            {
                _2148 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2234 = _2148;
            bool _2236 = !_2222;
            _2150 = _2234;
            if (!_2236)
            {
                bool _2238 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2240 = isnan(_1751);
                bool _2242 = _2238 || _2240;
                bool _2244 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2246 = _2242 || _2244;
                if (!_2246)
                {
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2250 = _1751 + _2248;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2254 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2252;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2260 = 1.0 / _2254;
                    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2268 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2272 = _2270 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2278 = _2250 * _2260;
                    float _2280 = precise::clamp(_2278, 0.0, 1.0);
                    float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2286 = fma(_2280, _2258, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2288 = fma(_2280, _2284, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2290 = fma(_2280, _2264, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2292 = fma(_2280, _2268, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2294 = fma(_2280, _2272, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2296 = fma(_2280, _2276, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2142 = _2290;
                    _2066 = _2294;
                    _2136 = _2286;
                    _2106 = _2292;
                    _2080 = _2288;
                    _2150 = _2296;
                    _2212 = true;
                }
                else
                {
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2066 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2080 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2150 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2212 = false;
    float _2298 = _2142;
    float _2300 = _2066;
    float _2302 = _2136;
    float _2304 = _2106;
    float _2306 = _2080;
    float _2308 = _2150;
    float _2310 = fma(_1183, -0.5, 0.5);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -_2298;
    float _2316 = _2314 + _2300;
    float _2318 = _2132 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2320 = -_2302;
    float _2322 = _2320 + _2304;
    float _2324 = fma(_2312, _2316, _2298);
    out.m_88.x = 0.0;
    float _2326 = -_2306;
    float _2328 = _2326 + _2308;
    float _2330 = fma(_2312, _2322, _2302);
    float _2332 = _2324 * 0.586610972881317138671875;
    out.m_51.x = _2318;
    bool _2334 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2336 = fma(_2312, _2328, _2306);
    float _2338 = fma(_2330, 0.298911988735198974609375, _2332);
    bool _2340 = _1577 > 0.0;
    bool _2342 = isnan(_1577);
    bool _2344 = _2340 || _2342;
    bool _2346 = isnan(0.0);
    bool _2348 = _2344 || _2346;
    float _2350 = fma(_2336, 0.114477999508380889892578125, _2338);
    bool _2352 = _1635 <= 0.0;
    bool _2354 = !_2348;
    bool _2356 = _2352 || _2354;
    float _2358 = -_2350;
    float _2360 = _2330 + _2358;
    float _2362 = -_2350;
    float _2364 = _2324 + _2362;
    float _2366 = -_2350;
    float _2368 = _2336 + _2366;
    float _2370 = fma(_2360, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    float _2372 = fma(_2364, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    float _2374 = fma(_2368, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    bool _2376 = !_2334;
    if (!_2376)
    {
        float _2378 = -_1509;
        float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2382 = -_1511;
        float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2386 = -_1513;
        float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2390 = _2380 * _2380;
        float _2392 = fma(_2384, _2384, _2390);
        float _2394 = fma(_2388, _2388, _2392);
        float _2396 = sqrt(_2394);
        float _2398 = rsqrt(_2394);
        float _2400 = -_2396;
        float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2404 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2406 = precise::clamp(_2404, 0.0, 1.0);
        float _2408 = _2384 * _2398;
        float _2410 = _2380 * _2398;
        float _2412 = abs(_2406);
        float _2414 = log2(_2412);
        float _2416 = _2388 * _2398;
        float _2418 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2420 = _1183 * _2410;
        float _2422 = -_2410;
        float _2424 = -_2418;
        float _2426 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2424);
        float _2428 = fma(_1181, _2408, _2420);
        float _2430 = -_2416;
        float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2426);
        float _2434 = fma(_1185, _2416, _2428);
        float _2436 = precise::clamp(_2434, 0.0, 1.0);
        float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2440 = _2432 + _2438;
        float _2442 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2444 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2446 = precise::clamp(_2444, 0.0, 1.0);
        float _2448 = exp2(_2442);
        float _2450 = _2448 * _2446;
        float _2452 = _2436 * _2450;
        float _2454 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2456 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2458 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2454;
        out.m_88.y = _2456;
        out.m_88.z = _2458;
    }
    out.m_90.x = _2370;
    out.m_90.y = _2372;
    out.m_90.z = _2374;
    if (!_2356)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2460 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2460;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2212 = false;
    bool _1233 = false;
    bool _317 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2517 = as_type<float>(_125);
        out.gl_Position.z = _2517;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2587 = as_type<float>(_163);
        out.gl_Position.z = _2587;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_171;
    float _193 = _189;
    float _195 = _187;
    float _213;
    if (!_191)
    {
        float _197 = in.m_57.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_109);
        float _219 = 1.0 / _217;
        float _221 = _143 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_57.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_109);
        float _321 = 1.0 / _319;
        float _323 = _143 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = in.m_57.x;
    float _329 = in.m_57.y;
    float _331 = in.m_57.z;
    float _333 = in.m_57.w;
    float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _337 = log2(_335);
    float _339 = as_type<float>(int(gl_VertexIndex));
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _343 = 1.0 + _341;
    bool _345 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _347 = isnan(_325);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = 1.0 / _343;
    float _359 = _337 * _143;
    float _361 = exp2(_359);
    float _363 = _331 * 2.0;
    float _365 = _327 * 2.0;
    int _367 = as_type<int>(_339) & 1;
    bool _369 = _367 != 0;
    int _371 = as_type<int>(_339) & 2;
    bool _373 = _371 != 0;
    bool _375 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _377 = isnan(1.0);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _383 = _379 || _381;
    float _385 = floor(_363);
    float _387 = _329 * 2.0;
    bool _389 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _391 = isnan(0.0);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _397 = _393 || _395;
    bool _399 = _333 > 0.5;
    float _401 = _329 + _331;
    float _403 = floor(_365);
    float _405 = -_361;
    float _407 = _405 + 1.0;
    float _409 = _401 + (-1.0);
    float _411 = _397 ? _407 : 0.0;
    bool _413 = _385 > 0.0;
    float _415 = floor(_387);
    bool _417 = _385 >= 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    if (_383)
    {
        float _427 = _411 * _357;
        _145 = _427;
    }
    float _429 = _145;
    float _431 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = _331 + _327;
    int _435 = _425 ? 0 : 1;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _447 = _445 != 0;
    float _449 = _433 + (-1.0);
    int _451 = ~_435;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    int _457 = _455;
    if (!_413)
    {
        int _459 = ~_435;
        int _461 = _459 + 1;
        _457 = _461;
    }
    int _463 = _457;
    bool _465 = _403 >= 0.0;
    bool _467 = isnan(_403);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _477 = !_439;
    int _479 = _477 ? 0 : 1;
    float _481 = _329 + _327;
    int _483 = _473 ? 0 : 1;
    bool _485 = _415 >= 0.0;
    bool _487 = isnan(_415);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _481 + (-1.0);
    bool _497 = _403 > 0.0;
    int _499 = _493 ? 0 : 1;
    bool _501 = _415 > 0.0;
    int _503 = abs(_479);
    float _505 = in.m_62.x;
    float _507 = in.m_62.y;
    float _509 = in.m_62.z;
    float _511 = float(_463);
    float _513 = float(_503);
    int _515 = ~_483;
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    int _521 = _519;
    if (!_497)
    {
        int _523 = ~_483;
        int _525 = _523 + 1;
        _521 = _525;
    }
    int _527 = _521;
    float _529 = _513 * _511;
    bool _531 = !_443;
    int _533 = _531 ? 0 : 1;
    bool _535 = !_447;
    int _537 = _535 ? 0 : 1;
    float _539 = _529 * (-2.0);
    int _541 = abs(_533);
    int _543 = ~_499;
    int _545 = _543 + 1;
    int _547 = _545 + 1;
    float _549 = float(_541);
    float _551 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _553 = float(_527);
    int _555 = _547;
    if (!_501)
    {
        int _557 = ~_499;
        int _559 = _557 + 1;
        _555 = _559;
    }
    int _561 = _555;
    float _563 = fma(_539, _505, _505);
    int _565 = abs(_537);
    float _567 = _549 * _553;
    bool _569 = _327 > 0.5;
    float _571 = _327 + (-0.5);
    float _573 = float(_565);
    float _575 = fma(_551, _539, _551);
    float _577 = float(_561);
    float _579 = _567 * (-2.0);
    float _581 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[196].x, _563);
    bool _583 = _329 > 0.5;
    float _585 = _573 * _577;
    float _587 = _329 + (-0.5);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = fma(_579, _507, _507);
    float _595 = fma(_575, _429, _581);
    float _597 = in.m_64.x;
    float _599 = in.m_64.y;
    float _601 = _585 * (-2.0);
    float _603 = fma(_431, _579, _431);
    float _605 = in.m_48.x;
    float _607 = in.m_48.y;
    float _609 = in.m_48.z;
    float _611 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[196].y, _593);
    float _613 = fma(_601, _509, _509);
    float _615 = _331 + (-0.5);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = fma(_475, _601, _475);
    float _623 = fma(_603, _429, _611);
    float _625 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _627 = 1.0 / _591;
    float _629 = _595 * 0.15915493667125701904296875;
    float _631 = _623 * 0.15915493667125701904296875;
    float _633 = fma(_621, _429, _625);
    float _635 = _633 * 0.15915493667125701904296875;
    float _637 = 1.0 / _619;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _639;
    bool _643 = !_369;
    float _645 = _643 ? (-0.5) : 0.5;
    float _647 = _293 * _597;
    float _649 = _295 * _599;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _653 = _651 != 0;
    float _655 = _629 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _607 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _661 = !_373;
    float _663 = _661 ? (-0.5) : 0.5;
    float _665 = _607 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _669 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _645);
    float _673 = _631 * 6.283185482025146484375;
    float _675 = sin(_673);
    float _677 = _641 * _637;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _325 + _679;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _663);
    float _685 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    float _687 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _689 = _669 * _671;
    float _691 = _667 * _683;
    float _693 = _631 * 6.283185482025146484375;
    float _695 = cos(_693);
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _703 = _701 != 0;
    float _705 = _629 * 6.283185482025146484375;
    float _707 = sin(_705);
    float _709 = _657 * _675;
    float _711 = _635 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _607 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _721 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].x, _715);
    float _723 = _719 * _627;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _325 + _725;
    float _729 = _635 * 6.283185482025146484375;
    float _731 = sin(_729);
    float _733 = _707 * _695;
    float _735 = fma(_723, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = _657 * _695;
    float _739 = _707 * _675;
    float _741 = fma(_677, _727, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _743 = _657 * _713;
    float _745 = _707 * _713;
    float _747 = _695 * _713;
    float _749 = _675 * _713;
    bool _751 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _753 = isnan(_325);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -_355;
    float _765 = _763 + 1.0;
    float _767 = _743 * _691;
    bool _769 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _771 = isnan(_325);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_731, _737, _739);
    float _783 = -_709;
    float _785 = fma(_731, _733, _783);
    float _787 = -_733;
    float _789 = fma(_731, _709, _787);
    float _791 = _761 * _765;
    float _793 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _795 = -_691;
    float _797 = _731 * _795;
    float _799 = fma(_781, _689, _767);
    float _801 = _745 * _691;
    float _803 = -_761;
    float _805 = _803 + 1.0;
    float _807 = fma(_747, _689, _797);
    float _809 = fma(_789, _793, _799);
    float _811 = fma(_731, _739, _737);
    float _813 = fma(_785, _689, _801);
    float _815 = fma(_749, _793, _807);
    float _817 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = _779 * _805;
    float _823 = fma(_811, _793, _813);
    float _825 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _829 = _741 * _821;
    float _831 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    float _833 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[6].z, _721);
    float _835 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _837 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _827);
    float _839 = -_779;
    float _841 = _839 + 1.0;
    float _843 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _845 = _833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _847 = _835 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _849 = _837 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _829);
    float _853 = _843 + _847;
    float _855 = _845 + _849;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _863 = fma(_735, _791, _851);
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _867 = _853 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _855 + _869;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _875 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _867 * _867;
    float _883 = _871 * _871;
    float _885 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[117].x, _863);
    float _887 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _875;
    out.m_66.y = _877;
    out.m_66.z = _879;
    out.m_66.w = _873;
    float _889 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[5].z, _687);
    float _891 = _743 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _893 = _743 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _895 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _897 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _903 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _905 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _901);
    float _907 = _881 + _883;
    float _909 = _743 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _911 = -_731;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _891);
    float _915 = sqrt(_907);
    float _917 = -_731;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _909);
    float _921 = -_731;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].x, _893);
    float _925 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _887);
    float _927 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].z, _913);
    float _929 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].z, _919);
    float _931 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _925);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _939 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _941 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _943 = _889 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = _935 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _947 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _895);
    float _949 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    bool _951 = _915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _955 = _943 + _945;
    float _957 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _939);
    float _959 = -_663;
    int _961 = _399 ? as_type<int>(_959) : as_type<int>(_663);
    float _963 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].z, _941);
    float _965 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _967 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].z, _949);
    bool _969 = _331 > 0.5;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _973 = _743;
    float _975 = _881;
    float _977 = _883;
    float _979 = _853;
    float _981 = _855;
    float _983 = _965;
    if (!_951)
    {
        _973 = _955;
    }
    float _985 = _973;
    bool _987 = !_951;
    float _989 = _985;
    if (!_987)
    {
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _993 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _995 = _915 + _993;
        float _997 = rsqrt(_907);
        float _999 = _995 * _991;
        float _1001 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = _999 * 0.15915493667125701904296875;
        float _1005 = _1003 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1003 * 6.283185482025146484375;
        float _1011 = cos(_1009);
        float _1013 = fma(_1007, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = _997 * _1013;
        float _1017 = fma(_867, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = _1011 + (-1.0);
        float _1021 = fma(_871, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1025 = _1017 + _1023;
        float _1027 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1031 = _1021 + _1029;
        float _1033 = _1025 * _1025;
        float _1035 = fma(_955, _1011, _1027);
        float _1037 = _1031 * _1031;
        _989 = _1035;
        _975 = _1033;
        _977 = _1037;
        _979 = _1017;
        _981 = _1021;
    }
    float _1039 = _989;
    float _1041 = _975;
    float _1043 = _977;
    float _1045 = _979;
    float _1047 = _981;
    float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1051 = _1039 + _1049;
    float _1053 = _663 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1055 = -_645;
    int _1057 = _569 ? as_type<int>(_1055) : as_type<int>(_645);
    float _1059 = _645 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1061 = fma(_1051, _1051, _1041);
    float _1063 = fma(_1053, _1053, 1.0);
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _903);
    float _1071 = -_663;
    int _1073 = _583 ? as_type<int>(_1071) : as_type<int>(_663);
    float _1075 = _1053 * _929;
    bool _1077 = !_1067;
    float _1079 = _1077 ? _645 : as_type<float>(_1057);
    float _1081 = rsqrt(_1063);
    bool _1083 = !_703;
    float _1085 = _1083 ? _663 : as_type<float>(_961);
    float _1087 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _905);
    float _1089 = -_645;
    int _1091 = _969 ? as_type<int>(_1089) : as_type<int>(_645);
    float _1093 = _1079 + 0.5;
    bool _1095 = !_653;
    float _1097 = _1095 ? _663 : as_type<float>(_1073);
    float _1099 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    bool _1101 = !_699;
    float _1103 = _1101 ? _645 : as_type<float>(_1091);
    float _1105 = _1053 * _927;
    float _1107 = _1053 * _931;
    float _1109 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1111 = fma(_1059, _1099, _1075);
    float _1113 = fma(_1059, _1069, _1105);
    float _1115 = fma(_1059, _1087, _1107);
    float _1117 = -_1097;
    float _1119 = _1117 + 0.5;
    float _1121 = _1103 + 0.5;
    float _1123 = _1053 * _1081;
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1127 = _1109 * _937;
    float _1129 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1133 = -_963;
    float _1135 = _1123 * _1133;
    float _1137 = _1061 + _1043;
    float _1139 = _1129 * _953;
    float _1141 = _1131 * _971;
    float _1143 = fma(_1081, _927, _1135);
    float _1145 = -_965;
    float _1147 = _1123 * _1145;
    float _1149 = -_967;
    float _1151 = _1123 * _1149;
    float _1153 = -_1085;
    float _1155 = _1153 + 0.5;
    float _1157 = fma(_1081, _929, _1147);
    float _1159 = sqrt(_1137);
    float _1161 = fma(_1081, _931, _1151);
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1171 = _1163 * _1125;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _885 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1181 = _963 + _1113;
    float _1183 = _965 + _1111;
    float _1185 = _967 + _1115;
    out.m_68.x = _1127;
    out.m_68.y = _1139;
    out.m_68.z = _1141;
    out.m_68.w = _1171;
    bool _1187 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1189 = isnan(_1159);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1195 = _1191 || _1193;
    out.m_70.x = _1173;
    out.m_70.y = _1175;
    out.m_70.z = _1177;
    out.m_70.w = _1179;
    out.m_72.x = _1069;
    out.m_72.y = _1099;
    out.m_72.z = _1087;
    out.m_74.x = _1143;
    out.m_74.y = _1157;
    out.m_74.z = _1161;
    float _1197 = _1039;
    if (!_1195)
    {
        _983 = 1.0;
    }
    float _1199 = _983;
    out.m_76.x = _1181;
    out.m_76.y = _1183;
    out.m_76.z = _1185;
    bool _1201 = !_1195;
    float _1203 = _1199;
    if (!_1201)
    {
        bool _1205 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1207 = isnan(_1159);
        bool _1209 = _1205 || _1207;
        bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1213 = _1209 || _1211;
        if (!_1213)
        {
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1217 = _1159 + _1215;
            float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1221 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1219;
            float _1223 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1225 = _1223 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1227 = 1.0 / _1221;
            float _1229 = _1217 * _1227;
            float _1231 = fma(_1229, _1225, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1203 = _1231;
            _1233 = true;
        }
        else
        {
            bool _1235 = _1159 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1237 = isnan(_1159);
            bool _1239 = _1235 || _1237;
            bool _1241 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1243 = _1239 || _1241;
            if (!_1243)
            {
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1247 = _1159 + _1245;
                float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1251 = _1249 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1253 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1255 = _1253 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1257 = 1.0 / _1251;
                float _1259 = _1247 * _1257;
                float _1261 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1203 = _1261;
                _1233 = true;
            }
            else
            {
                _1203 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1233 = false;
    float _1263 = _1203;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1267 = _1039 + _1265;
    float _1269 = _943 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1273 = _1045 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1047 + _1275;
    float _1279 = fma(_1267, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1269);
    float _1283 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1285 = fma(_1277, _1263, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1287 = -_943;
    float _1289 = _1287 + _1279;
    float _1291 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1281);
    float _1293 = -_843;
    float _1295 = _1293 + _1283;
    float _1297 = _943 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1299 = _1289 * _1289;
    float _1301 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = -_845;
    float _1305 = _1303 + _1285;
    float _1307 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1297);
    float _1309 = fma(_1295, _1295, _1299);
    float _1311 = 1.0 / _1301;
    float _1313 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1307);
    float _1315 = fma(_1305, _1305, _1309);
    float _1317 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1319 = sqrt(_1315);
    float _1321 = _1317 + _1301;
    float _1323 = _1321 * _1311;
    float _1325 = _1323 * 0.5;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1329 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1327);
    bool _1331 = _1319 > 0.0;
    float _1333 = 1.0 / _1329;
    bool _1335 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan(0.5);
    bool _1343 = _1339 || _1341;
    bool _1345 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan(0.5);
    bool _1353 = _1349 || _1351;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1359 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1361 = _1305;
    float _1363 = _1283;
    float _1365 = _1315;
    if (!_1331)
    {
        _1355 = _1283;
    }
    float _1367 = _1355;
    float _1369 = _1367;
    if (!_1331)
    {
        _1357 = _1279;
    }
    float _1371 = _1357;
    float _1373 = _1371;
    if (!_1331)
    {
        _1359 = _1285;
    }
    float _1375 = _1359;
    bool _1377 = !_1331;
    float _1379 = _1375;
    float _1381 = _1375;
    if (!_1377)
    {
        float _1383 = _187 * _187;
        float _1385 = fma(_185, _185, _1383);
        float _1387 = fma(_189, _189, _1385);
        float _1389 = rsqrt(_1315);
        float _1391 = sqrt(_1387);
        float _1393 = _1295 * _1389;
        float _1395 = _1289 * _1389;
        float _1397 = _1305 * _1389;
        bool _1399 = _1391 > 0.0;
        float _1401 = _1389;
        float _1403 = _1391;
        _1361 = _1397;
        if (!_1399)
        {
            _1401 = _1283;
        }
        float _1405 = _1401;
        _1369 = _1405;
        if (!_1399)
        {
            _1403 = _1279;
        }
        float _1407 = _1403;
        _1373 = _1407;
        if (!_1399)
        {
            _1379 = _1285;
        }
        float _1409 = _1379;
        bool _1411 = !_1399;
        _1381 = _1409;
        if (!_1411)
        {
            float _1413 = rsqrt(_1387);
            float _1415 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1417 = _187 * _1413;
            float _1419 = _185 * _1413;
            float _1421 = _1395 * _1417;
            float _1423 = _189 * _1413;
            float _1425 = fma(_1393, _1419, _1421);
            float _1427 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1429 = fma(_1397, _1423, _1425);
            float _1431 = _1429 * _1427;
            float _1433 = fma(_185, _1431, _1283);
            float _1435 = fma(_187, _1431, _1279);
            float _1437 = fma(_189, _1431, _1285);
            _1369 = _1433;
            _1373 = _1435;
            _1381 = _1437;
        }
    }
    float _1439 = _1369;
    float _1441 = _1373;
    float _1443 = _1381;
    float _1445 = _1361;
    float _1447 = _1441;
    float _1449 = _1439;
    float _1451 = _1443;
    float _1453 = _1445;
    if (_1343)
    {
        _193 = 1.0;
    }
    float _1455 = _193;
    float _1457 = _1455;
    if (!_1353)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1461 = _943 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1465 = _843 + _1463;
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1469 = -_843;
        float _1471 = _1469 + _1439;
        float _1473 = _1461 * _1461;
        float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1477 = _845 + _1475;
        float _1479 = fma(_1465, _1465, _1473);
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = fma(_1477, _1477, _1479);
        float _1485 = sqrt(_1483);
        float _1487 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1489 = precise::min(_1485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1491 = _1489 * _1481;
        float _1493 = -_943;
        float _1495 = _1493 + _1441;
        float _1497 = _1487 * _1491;
        float _1499 = -_845;
        float _1501 = _1499 + _1443;
        float _1503 = fma(_1495, _1497, _943);
        float _1505 = fma(_1471, _1497, _843);
        float _1507 = fma(_1501, _1497, _845);
        _1447 = _1503;
        _1449 = _1505;
        _1451 = _1507;
        _1363 = _1497;
    }
    float _1509 = _1447;
    float _1511 = _1449;
    float _1513 = _1451;
    float _1515 = _1363;
    float _1517 = _1515;
    if (_1343)
    {
        _1517 = 1.0;
    }
    float _1519 = _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1523 = _1333 * _1521;
    float _1525 = _1519;
    if (!_1343)
    {
        float _1527 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1529 = _1527 * 0.15915493667125701904296875;
        float _1531 = _1529 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1537 = _1535 * 0.15915493667125701904296875;
        float _1539 = _1529 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        float _1543 = 1.0 / _1533;
        float _1545 = _1537 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        float _1549 = _1541 * _1543;
        float _1551 = _1537 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1547 * _1549;
        float _1557 = 1.0 / _1555;
        float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1559;
        float _1563 = 1.0 / _1561;
        float _1565 = _1553 * _1557;
        float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1569 = fma(_1523, _1565, _1567);
        float _1571 = _1569 * _1563;
        float _1573 = precise::clamp(_1571, 0.0, 1.0);
        _195 = _1529;
        _1457 = _1573;
    }
    float _1575 = _195;
    float _1577 = _1457;
    float _1579 = _1575;
    if (!_1343)
    {
        float _1581 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1583 = _1581 * 0.15915493667125701904296875;
        float _1585 = _1583 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1591 = _1589 * 0.15915493667125701904296875;
        float _1593 = _1583 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = 1.0 / _1587;
        float _1599 = _1591 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = _1591 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = _1601 * _1603;
        float _1611 = 1.0 / _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1615 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1613;
        float _1617 = 1.0 / _1615;
        float _1619 = _1607 * _1611;
        float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1623 = fma(_1523, _1619, _1621);
        float _1625 = _1623 * _1617;
        float _1627 = precise::clamp(_1625, 0.0, 1.0);
        float _1629 = -_1627;
        float _1631 = _1629 + 1.0;
        _1365 = _1611;
        _1525 = _1631;
    }
    float _1633 = _1365;
    float _1635 = _1525;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1639 = _1509 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1643 = _1511 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1647 = _1513 + _1645;
    float _1649 = _1639 * _1639;
    float _1651 = fma(_1643, _1643, _1649);
    float _1653 = fma(_1647, _1647, _1651);
    float _1655 = rsqrt(_1653);
    float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1659 = _1643 * _1657;
    float _1661 = _1647 * _1657;
    float _1663 = _1659 * _1659;
    float _1665 = _1661 * _1661;
    float _1667 = _1663 + _1665;
    float _1669 = sqrt(_1667);
    bool _1671 = _1669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1675 = _1669 + _1673;
    float _1677 = _1633;
    float _1679 = _1675;
    float _1681 = _1639;
    if (_1671)
    {
        float _1683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1683;
    }
    float _1685 = _1677;
    if (_1671)
    {
        float _1687 = rsqrt(_1667);
        _1579 = _1687;
    }
    float _1689 = _1579;
    float _1691 = _1685;
    float _1693 = _1689;
    if (_1671)
    {
        float _1695 = _1675 * _1685;
        _1679 = _1695;
    }
    float _1697 = _1679;
    if (_1671)
    {
        float _1699 = _1697 * 0.15915493667125701904296875;
        _1453 = _1699;
    }
    float _1701 = _1453;
    float _1703 = _1647;
    if (_1671)
    {
        float _1705 = _1701 * 6.283185482025146484375;
        float _1707 = sin(_1705);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1713 = precise::max(0.0, _1711);
    float _1715 = _1655;
    if (_1671)
    {
        float _1717 = _1701 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        _1715 = _1719;
    }
    float _1721 = _1715;
    float _1723 = -_1657;
    float _1725 = -_1713;
    float _1727 = fma(_1639, _1723, _1725);
    float _1729 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1671)
    {
        float _1731 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1681 = _1731;
    }
    float _1733 = _1681;
    float _1735 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = fma(_843, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1739 = _1709;
    float _1741 = _1733;
    if (_1671)
    {
        float _1743 = fma(_1709, _1733, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1691 = _1743;
    }
    float _1745 = _1691;
    float _1747 = _1745;
    if (!_1671)
    {
        _1739 = _1661;
    }
    float _1749 = _1739;
    float _1751 = sqrt(_1653);
    float _1753 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1755 = _1749;
    float _1757 = _1721;
    if (_1671)
    {
        float _1759 = _1721 + (-1.0);
        _1741 = _1759;
    }
    float _1761 = _1741;
    float _1763 = _1761;
    if (_1671)
    {
        float _1765 = _1689 * _1745;
        _1197 = _1765;
    }
    float _1767 = _1197;
    if (!_1671)
    {
        _1747 = _1659;
    }
    float _1769 = _1747;
    float _1771 = _1769;
    if (_1671)
    {
        float _1773 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1773;
    }
    float _1775 = _1729;
    if (_1671)
    {
        float _1777 = _1659 * _1767;
        _1771 = _1777;
    }
    float _1779 = _1771;
    if (!_1671)
    {
        _1693 = _1727;
    }
    float _1781 = _1693;
    float _1783 = _1781;
    if (_1671)
    {
        float _1785 = _1661 * _1767;
        _1755 = _1785;
    }
    float _1787 = _1755;
    if (!_1671)
    {
        _1763 = _1663;
    }
    float _1789 = _1763;
    float _1791 = _1789;
    if (_1671)
    {
        float _1793 = fma(_1727, _1721, _1775);
        _1783 = _1793;
    }
    float _1795 = _1783;
    if (_1671)
    {
        float _1797 = _1779 * _1779;
        _1791 = _1797;
    }
    float _1799 = _1791;
    if (!_1671)
    {
        _1757 = _1665;
    }
    float _1801 = _1757;
    float _1803 = _1801;
    if (_1671)
    {
        float _1805 = _1787 * _1787;
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = fma(_1795, _1795, _1799);
    float _1811 = floor(_1737);
    float _1813 = _1809 + _1807;
    float _1815 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1821 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1819);
    float _1823 = precise::clamp(_1821, 0.0, 1.0);
    float _1825 = fma(_845, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1827 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1829 = rsqrt(_1813);
    float _1831 = -_1823;
    float _1833 = _1831 + 1.0;
    float _1835 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1839 = -_1837;
    float _1841 = fma(_1839, _1817, 1.0);
    float _1843 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1845 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1847 = abs(_1833);
    float _1849 = log2(_1847);
    float _1851 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1843);
    float _1853 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1855 = _1829 * _1779;
    float _1857 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1853);
    float _1859 = _1829 * _1795;
    float _1861 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1851);
    float _1863 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1865 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1867 = _1829 * _1787;
    float _1869 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1835);
    float _1871 = -_1863;
    float _1873 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1871);
    float _1875 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1877 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1879 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1869);
    float _1881 = -_1867;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1873);
    float _1885 = floor(_1825);
    float _1887 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1877);
    float _1889 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1891 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1893 = -_1811;
    float _1895 = _1737 + _1893;
    float _1897 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1887);
    float _1899 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = log2(_1841);
    float _1903 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1897);
    float _1905 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1907 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1909 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1911 = _1859 + 1.0;
    float _1913 = exp2(_1891);
    float _1915 = fma(_1883, -0.5, 0.5);
    float _1917 = fma(_1883, 0.5, 0.5);
    float _1919 = -_1885;
    float _1921 = _1825 + _1919;
    float _1923 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1909);
    float _1925 = fma(_1917, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = sqrt(_1915);
    float _1929 = _1901 * 0.693147182464599609375;
    float _1931 = fma(_1917, _1925, -0.212114393711090087890625);
    float _1933 = 1.0 / _1903;
    float _1935 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1907);
    float _1937 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1923);
    float _1939 = fma(_1917, _1931, 1.570728778839111328125);
    float _1941 = -_1859;
    float _1943 = fma(_1913, _1911, _1941);
    float _1945 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1935);
    float2 _5456 = float2(_1895, _1921);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5456, float2(0.0), isnan(_5456)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5456, float2(0.0), isnan(_5456)), level(0.0)).x;
    float _1949 = _1927 * 0.636619746685028076171875;
    float _1951 = _1945 * _1933;
    float _1953 = _1937 * _1933;
    float _1955 = -_1939;
    float _1957 = fma(_1949, _1955, 1.0);
    float _1959 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1961 = fma(_1951, 0.5, 0.5);
    float _1963 = fma(_1953, -0.5, 0.5);
    float _1965 = fma(_1943, 0.5, 0.5);
    float3 _5491 = float3(_1961, _1963, _1959);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5491, float3(0.0), isnan(_5491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5491, float3(0.0), isnan(_5491)), level(0.0)).x;
    float3 _5502 = float3(_1961, _1963, _1959);
    float4 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5502, float3(0.0), isnan(_5502)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5502, float3(0.0), isnan(_5502)), level(0.0)).xyzw;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = _1970.w;
    float2 _5518 = float2(_1957, _1965);
    float3 _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5518, float2(0.0), isnan(_5518)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5518, float2(0.0), isnan(_5518)), level(0.0)).xyz;
    float _1984 = _1982.x;
    float _1986 = _1982.y;
    float _1988 = _1982.z;
    float _1990 = abs(_1523);
    float _1992 = log2(_1990);
    float _1994 = _1865 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1511;
    out.m_78.y = _1509;
    out.m_78.z = _1513;
    bool _1996 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1998 = isnan(_1751);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2004 = _2000 || _2002;
    float _2006 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2008 = in.m_80.x;
    float _2010 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2006);
    bool _2012 = _1523 <= 8000.0;
    bool _2014 = isnan(_1523);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(8000.0);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2010);
    float _2026 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1945;
    out.gl_Position.y = _1937;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _1903;
    float _2028 = exp2(_2026);
    float _2030 = _1577 * _1635;
    float _2032 = _1937;
    float _2034 = _1903;
    float _2036 = _2024;
    float _2038 = _2030;
    if (!_2004)
    {
        _2032 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2040 = _2032;
    float _2042 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = fma(_2044, -2.0, 3.0);
    float _2048 = _2044 * _2044;
    float _2050 = _2048 * _2046;
    float _2052 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = -_2050;
    float _2056 = _2054 + 1.0;
    float _2058 = exp2(_2052);
    float _2060 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2050);
    float _2062 = _2024 + _1903;
    float _2064 = _2040;
    float _2066 = _2040;
    if (!_2004)
    {
        _2034 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2068 = _2034;
    float _2070 = _2022 * _2060;
    float _2072 = _2062 * 0.5;
    float _2074 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2076 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2078 = _2068;
    float _2080 = _2068;
    if (!_2004)
    {
        _2036 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2082 = _2036;
    out.m_82.z = _2072;
    out.m_82.w = _1903;
    float _2084 = -_2058;
    float _2086 = _2084 + 1.0;
    float _2088 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2090 = -_1947;
    float _2092 = _2090 + 1.0;
    float _2094 = _2092 * _2074;
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = -_2096;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2102 = _1972;
    float _2104 = _2082;
    float _2106 = _2082;
    if (!_2004)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2108 = _2076;
    float _2110 = _2100 * _2008;
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2114 = _2088 * _1967;
    float _2116 = -_2088;
    float _2118 = _2116 + 1.0;
    out.m_84.x = _2112;
    float _2120 = _1978 * _2114;
    float _2122 = _1988 * _2114;
    float _2124 = _1978 * _2118;
    float _2126 = fma(_1984, _2120, _1972);
    float _2128 = fma(_1986, _2120, _1974);
    float _2130 = fma(_1978, _2122, _1976);
    float _2132 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2134 = _2108;
    float _2136 = _2108;
    if (!_2004)
    {
        _2102 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2138 = _2102;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2004)
    {
        _2038 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2144 = _2038;
    out.m_86.x = _2126;
    out.m_86.y = _2128;
    out.m_86.z = _2130;
    out.m_86.w = _2124;
    bool _2146 = !_2004;
    float _2148 = _2144;
    float _2150 = _2144;
    if (!_2146)
    {
        bool _2152 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2154 = isnan(_1751);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2160 = _2156 || _2158;
        if (!_2160)
        {
            float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2164 = _1751 + _2162;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2166;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2174 = 1.0 / _2168;
            float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2192 = _2164 * _2174;
            float _2194 = precise::clamp(_2192, 0.0, 1.0);
            float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2200 = fma(_2194, _2172, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2142 = _2204;
            _2066 = _2208;
            _2136 = _2200;
            _2106 = _2206;
            _2080 = _2202;
            _2150 = _2210;
            _2212 = true;
        }
        else
        {
            bool _2214 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2216 = isnan(_1751);
            bool _2218 = _2214 || _2216;
            bool _2220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2222 = _2218 || _2220;
            if (!_2222)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2224 = _2134;
            _2136 = _2224;
            if (!_2222)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2226 = _2140;
            _2142 = _2226;
            if (!_2222)
            {
                _2078 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2228 = _2078;
            _2080 = _2228;
            if (!_2222)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2230 = _2104;
            _2106 = _2230;
            if (!_2222)
            {
                _2064 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2232 = _2064;
            _2066 = _2232;
            if (!_2222)
            {
                _2148 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2234 = _2148;
            bool _2236 = !_2222;
            _2150 = _2234;
            if (!_2236)
            {
                bool _2238 = _1751 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2240 = isnan(_1751);
                bool _2242 = _2238 || _2240;
                bool _2244 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2246 = _2242 || _2244;
                if (!_2246)
                {
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2250 = _1751 + _2248;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2254 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2252;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2260 = 1.0 / _2254;
                    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2268 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2272 = _2270 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2278 = _2250 * _2260;
                    float _2280 = precise::clamp(_2278, 0.0, 1.0);
                    float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2286 = fma(_2280, _2258, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2288 = fma(_2280, _2284, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2290 = fma(_2280, _2264, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2292 = fma(_2280, _2268, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2294 = fma(_2280, _2272, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2296 = fma(_2280, _2276, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2142 = _2290;
                    _2066 = _2294;
                    _2136 = _2286;
                    _2106 = _2292;
                    _2080 = _2288;
                    _2150 = _2296;
                    _2212 = true;
                }
                else
                {
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2066 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2080 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2150 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2212 = false;
    float _2298 = _2142;
    float _2300 = _2066;
    float _2302 = _2136;
    float _2304 = _2106;
    float _2306 = _2080;
    float _2308 = _2150;
    float _2310 = fma(_1183, -0.5, 0.5);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -_2298;
    float _2316 = _2314 + _2300;
    float _2318 = _2132 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2320 = -_2302;
    float _2322 = _2320 + _2304;
    float _2324 = fma(_2312, _2316, _2298);
    out.m_88.x = 0.0;
    float _2326 = -_2306;
    float _2328 = _2326 + _2308;
    float _2330 = fma(_2312, _2322, _2302);
    float _2332 = _2324 * 0.586610972881317138671875;
    out.m_51.x = _2318;
    bool _2334 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2336 = fma(_2312, _2328, _2306);
    float _2338 = fma(_2330, 0.298911988735198974609375, _2332);
    bool _2340 = _1577 > 0.0;
    bool _2342 = isnan(_1577);
    bool _2344 = _2340 || _2342;
    bool _2346 = isnan(0.0);
    bool _2348 = _2344 || _2346;
    float _2350 = fma(_2336, 0.114477999508380889892578125, _2338);
    bool _2352 = _1635 <= 0.0;
    bool _2354 = !_2348;
    bool _2356 = _2352 || _2354;
    float _2358 = -_2350;
    float _2360 = _2330 + _2358;
    float _2362 = -_2350;
    float _2364 = _2324 + _2362;
    float _2366 = -_2350;
    float _2368 = _2336 + _2366;
    float _2370 = fma(_2360, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    float _2372 = fma(_2364, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    float _2374 = fma(_2368, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2350);
    bool _2376 = !_2334;
    if (!_2376)
    {
        float _2378 = -_1509;
        float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2382 = -_1511;
        float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2386 = -_1513;
        float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2390 = _2380 * _2380;
        float _2392 = fma(_2384, _2384, _2390);
        float _2394 = fma(_2388, _2388, _2392);
        float _2396 = sqrt(_2394);
        float _2398 = rsqrt(_2394);
        float _2400 = -_2396;
        float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2404 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2406 = precise::clamp(_2404, 0.0, 1.0);
        float _2408 = _2384 * _2398;
        float _2410 = _2380 * _2398;
        float _2412 = abs(_2406);
        float _2414 = log2(_2412);
        float _2416 = _2388 * _2398;
        float _2418 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2420 = _1183 * _2410;
        float _2422 = -_2410;
        float _2424 = -_2418;
        float _2426 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2424);
        float _2428 = fma(_1181, _2408, _2420);
        float _2430 = -_2416;
        float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2426);
        float _2434 = fma(_1185, _2416, _2428);
        float _2436 = precise::clamp(_2434, 0.0, 1.0);
        float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2440 = _2432 + _2438;
        float _2442 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2444 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2446 = precise::clamp(_2444, 0.0, 1.0);
        float _2448 = exp2(_2442);
        float _2450 = _2448 * _2446;
        float _2452 = _2436 * _2450;
        float _2454 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2456 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2458 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2454;
        out.m_88.y = _2456;
        out.m_88.z = _2458;
    }
    out.m_90.x = _2370;
    out.m_90.y = _2372;
    out.m_90.z = _2374;
    if (!_2356)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2460 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2460;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

