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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2941 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3228 = as_type<float>(_127);
        out.gl_Position.z = _3228;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_49.w;
    float _133 = in.m_51.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_109);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _121;
    if (_161)
    {
        out.m_47.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3301 = as_type<float>(_167);
        out.gl_Position.z = _3301;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_175, _181, _217);
    float _225 = fma(_171, _189, _219);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _225);
    bool _231 = !_203;
    float _233 = _187;
    float _249;
    if (!_231)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_109);
        float _255 = 1.0 / _253;
        float _257 = _147 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = in.m_51.y;
    float _263 = _133 * 2.0;
    float _265 = in.m_51.z;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = floor(_263);
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _283 = _281 != 0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _259 + _285;
    float _289 = 1.0 / _269;
    float _291 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    float _297 = -_279;
    float _299 = fma(_291, 2.0, _297);
    float _301 = 1.0 / _273;
    float _303 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _305 = _261 * 2.0;
    bool _307 = _275 > 0.0;
    float _309 = _265 * 2.0;
    float _311 = fma(_303, -2.0, _277);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _259 + _313;
    float _317 = 1.0 / _295;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _259 + _319;
    bool _323 = _275 >= 0.0;
    bool _325 = isnan(_275);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = _315 * _289;
    float _335 = _133 + _261;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _339 = floor(_305);
    float _341 = _321 * _301;
    float _343 = _265 + _261;
    float _345 = _335 + (-1.0);
    float _347 = _133 + _265;
    float _349 = _343 + (-1.0);
    float _351 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _353 = floor(_309);
    int _355 = as_type<int>(_345);
    float _357 = _341;
    if (_283)
    {
        _355 = 0;
    }
    int _359 = _355;
    float _361 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _363 = _359;
    if (!_283)
    {
        _363 = 1;
    }
    int _365 = _363;
    float _367 = _287 * _317;
    int _369 = _331 ? 0 : 1;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    bool _375 = _365 != 1;
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _379 = int(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _385 = _339 > 0.0;
    float _387 = fma(_373, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _389 = _339 >= 0.0;
    bool _391 = isnan(_339);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _407 = _353 > 0.0;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    bool _413 = _353 >= 0.0;
    bool _415 = isnan(_353);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = fma(_401, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _425 = fma(_383, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _427 = fma(_405, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _429 = _421 ? 0 : 1;
    float _431 = _347 + (-1.0);
    if (!_375)
    {
        _357 = _261;
    }
    float _433 = _357;
    float _435 = -_147;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[76].x, _299);
    float _439 = _433;
    if (_375)
    {
        _439 = _133;
    }
    float _441 = _439;
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _445 = _397 ? 0 : 1;
    float _447 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _311);
    int _449 = ~_429;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    int _455 = _453;
    if (!_407)
    {
        int _457 = ~_429;
        int _459 = _457 + 1;
        _455 = _459;
    }
    int _461 = _455;
    float _463 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[83].z, _337);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    int _477 = ~_445;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    int _485 = ~_369;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    int _491 = _481;
    int _493 = _489;
    if (!_385)
    {
        int _495 = ~_445;
        int _497 = _495 + 1;
        _491 = _497;
    }
    int _499 = _491;
    if (!_307)
    {
        int _501 = ~_369;
        int _503 = _501 + 1;
        _493 = _503;
    }
    int _505 = _493;
    float _507 = float(_411);
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = float(_109);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _517 = float(_379);
    float _519 = as_type<float>(_411);
    if (!_375)
    {
        _519 = _261;
    }
    float _521 = _519;
    float _523 = 1.0 / _513;
    float _525 = _521;
    if (!_375)
    {
        _117 = _265;
    }
    float _527 = _117;
    float _529 = _527;
    if (_375)
    {
        _525 = _133;
    }
    float _531 = _525;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _535 = !_471;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_467;
    int _541 = _539 ? 0 : 1;
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _545 = !_475;
    int _547 = _545 ? 0 : 1;
    float _549 = 1.0 / _507;
    if (_375)
    {
        _529 = _261;
    }
    float _551 = _529;
    float _553 = -_533;
    float _555 = fma(_543, 2.0, _553);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    float _569 = float(_505);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[83].w, _515);
    float _573 = _551;
    if (!_375)
    {
        _573 = _265;
    }
    float _575 = _573;
    float _577 = 1.0 / _517;
    bool _579 = !_567;
    int _581 = _579 ? 0 : 1;
    float _583 = _575;
    if (_375)
    {
        _583 = _261;
    }
    float _585 = _583;
    bool _587 = !_563;
    int _589 = _587 ? 0 : 1;
    bool _591 = !_559;
    int _593 = _591 ? 0 : 1;
    float _595 = _585 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _597 = abs(_581);
    float _599 = _549 * _147;
    int _601 = abs(_589);
    float _603 = _511 * _147;
    int _605 = abs(_593);
    float _607 = float(_499);
    float _609 = _577 * _147;
    float _611 = float(_597);
    float _613 = exp2(_603);
    float _615 = float(_605);
    float _617 = float(_461);
    float _619 = _611 * _607;
    float _621 = float(_601);
    float _623 = _615 * _617;
    float _625 = in.m_66.x;
    float _627 = in.m_66.y;
    float _629 = in.m_66.z;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _633 = 1.0 + _631;
    float _635 = _621 * _569;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _639 = -_613;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _633;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _647 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _649 = isnan(1.0);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _655 = _651 || _653;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _659 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _667 = _663 || _665;
    float _669 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _645);
    float _671 = _635 * (-2.0);
    float _673 = fma(_595, -2.0, _637);
    float _675 = _523 * _147;
    float _677 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _657);
    float _679 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _669);
    float _681 = _667 ? _641 : 0.0;
    float _683 = fma(_361, _671, _361);
    bool _685 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _687 = isnan(_259);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _571);
    float _699 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _677);
    float _701 = -_147;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[81].x, _555);
    float _705 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _673);
    if (_655)
    {
        float _707 = _681 * _643;
        _151 = _707;
    }
    float _709 = _151;
    float _711 = _623 * (-2.0);
    float _713 = fma(_671, _627, _627);
    float _715 = _261 + (-0.5);
    bool _717 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_259);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_695;
    float _731 = _729 + 1.0;
    float _733 = fma(_351, _711, _351);
    float _735 = fma(_711, _625, _625);
    float _737 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _739 = _619 * (-2.0);
    bool _741 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _743 = isnan(_259);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _727 * _731;
    float _755 = -_727;
    float _757 = _755 + 1.0;
    float _759 = fma(_443, _739, _443);
    bool _761 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_259);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = fma(_739, _629, _629);
    float _775 = _751 * _757;
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = _133 + (-0.5);
    float _783 = _265 + (-0.5);
    float _785 = fma(_683, _709, _737);
    float _787 = _771 * _779;
    float _789 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[196].x, _735);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _773);
    float _793 = _785 * 0.15915493667125701904296875;
    float _795 = _423 * _787;
    float _797 = _387 * _787;
    float _799 = fma(_733, _709, _789);
    float _801 = fma(_759, _709, _791);
    float _803 = in.m_68.x;
    float _805 = in.m_68.y;
    float _807 = -_771;
    float _809 = _807 + 1.0;
    float _811 = _799 * 0.15915493667125701904296875;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = in.m_44.x;
    float _819 = in.m_44.y;
    float _821 = in.m_44.z;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _823;
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[143].x, _797);
    float _829 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[143].y, _795);
    float _831 = fma(_815, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _833 = fma(_825, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _835 = fma(_425, _775, _827);
    float _837 = fma(_427, _775, _829);
    float _839 = _801 * 0.15915493667125701904296875;
    float _841 = _793 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_831, _753, _835);
    float _847 = fma(_833, _753, _837);
    float _849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _851 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[146].x, _845);
    float _853 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[146].y, _847);
    float _855 = _793 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _853 * _805;
    float _861 = _851 * _803;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _865 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _869 = _811 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _191 * _819;
    float _875 = _865 * _849;
    float _877 = _867 * _863;
    float _879 = _179 * _819;
    float _881 = fma(_189, _817, _873);
    float _883 = _185 * _819;
    float _885 = in.m_60.w;
    float _887 = _839 * 6.283185482025146484375;
    float _889 = cos(_887);
    float _891 = fma(_177, _817, _879);
    float _893 = fma(_193, _821, _881);
    float _895 = fma(_183, _817, _883);
    float _897 = fma(_181, _821, _891);
    float _899 = fma(_187, _821, _895);
    float _901 = _811 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _871 * _843;
    float _907 = _871 * _857;
    float _909 = _839 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _871 * _889;
    float _915 = _843 * _889;
    float _917 = _913 * _875;
    float _919 = _897 + _885;
    float _921 = _903 * _857;
    float _923 = _903 * _889;
    float _925 = _903 * _843;
    float _927 = _857 * _889;
    float _929 = in.m_64.w;
    float _931 = _923 * _875;
    float _933 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = fma(_911, _921, _905);
    float _937 = -_875;
    float _939 = _911 * _937;
    float _941 = -_907;
    float _943 = fma(_911, _925, _941);
    float _945 = -_925;
    float _947 = fma(_911, _907, _945);
    float _949 = fma(_935, _877, _931);
    float _951 = fma(_927, _877, _939);
    float _953 = fma(_911, _905, _921);
    float _955 = fma(_947, _877, _917);
    float _957 = fma(_943, _933, _949);
    float _959 = fma(_915, _933, _951);
    float _961 = fma(_953, _933, _955);
    float _963 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _963);
    float _971 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _973 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _975 = in.m_62.w;
    float _977 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    float _979 = _893 + _929;
    float _981 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _971);
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _973);
    float _985 = _977 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _991 = _979 + _985;
    float _993 = _919 + _987;
    float _995 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _997 = _991 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1001 = _993 + _999;
    float _1003 = _997 * _997;
    float _1005 = fma(_1001, _1001, _1003);
    float _1007 = _899 + _975;
    float _1009 = sqrt(_1005);
    float _1011 = _1007 + _989;
    bool _1013 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1029 = _1027 != 0;
    bool _1031 = !_1021;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_1017;
    int _1037 = _1035 ? 0 : 1;
    float _1039 = _993;
    float _1041 = _817;
    float _1043 = _997;
    float _1045 = _983;
    if (!_1013)
    {
        _233 = _993;
    }
    float _1047 = _233;
    bool _1049 = !_1025;
    int _1051 = _1049 ? 0 : 1;
    bool _1053 = !_1029;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = _1047;
    if (!_1013)
    {
        _1039 = _991;
    }
    float _1059 = _1039;
    float _1061 = _1059;
    if (!_1013)
    {
        _1041 = _1011;
    }
    float _1063 = _1041;
    bool _1065 = !_1013;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1073 = _1009 + _1071;
        float _1075 = rsqrt(_1005);
        float _1077 = _1073 * _1069;
        float _1079 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = _1077 * 0.15915493667125701904296875;
        float _1083 = _1081 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 + (-1.0);
        float _1093 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = _1075 * _1093;
        float _1099 = fma(_1011, _1085, _1095);
        float _1101 = fma(_1001, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_997, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1099;
        _1057 = _1101;
        _1061 = _1103;
    }
    float _1105 = _1067;
    float _1107 = _1057;
    float _1109 = _1061;
    float _1111 = -_1007;
    float _1113 = _1111 + _1105;
    float _1115 = -_919;
    float _1117 = _1115 + _1107;
    float _1119 = -_979;
    float _1121 = _1119 + _1109;
    float _1123 = _1113 * _1113;
    bool _1125 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1127 = isnan(0.5);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1133 = _1129 || _1131;
    float _1135 = fma(_1117, _1117, _1123);
    float _1137 = fma(_1121, _1121, _1135);
    float _1139 = sqrt(_1137);
    bool _1141 = _1139 > 0.0;
    bool _1143 = !_1141;
    float _1145 = _1107;
    float _1147 = _1105;
    float _1149 = _1109;
    float _1151 = _1139;
    float _1153 = _1137;
    if (!_1143)
    {
        float _1155 = _227 * _227;
        float _1157 = fma(_223, _223, _1155);
        float _1159 = fma(_229, _229, _1157);
        float _1161 = rsqrt(_1137);
        float _1163 = sqrt(_1159);
        float _1165 = _1113 * _1161;
        float _1167 = _1121 * _1161;
        bool _1169 = _1163 > 0.0;
        float _1171 = _1117 * _1161;
        bool _1173 = !_1169;
        _1043 = _1159;
        _1151 = _1161;
        _1045 = _1167;
        if (!_1173)
        {
            float _1175 = rsqrt(_1159);
            float _1177 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1179 = _227 * _1175;
            float _1181 = _223 * _1175;
            float _1183 = _229 * _1175;
            float _1185 = _1165 * _1179;
            float _1187 = fma(_1171, _1181, _1185);
            float _1189 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1191 = fma(_1167, _1183, _1187);
            float _1193 = _1191 * _1189;
            float _1195 = fma(_223, _1193, _1107);
            float _1197 = fma(_227, _1193, _1105);
            float _1199 = fma(_229, _1193, _1109);
            _1145 = _1195;
            _1147 = _1197;
            _1149 = _1199;
            _1151 = _1193;
            _1153 = _1181;
        }
    }
    float _1201 = _1145;
    float _1203 = _1147;
    float _1205 = _1149;
    float _1207 = _1043;
    float _1209 = _1151;
    float _1211 = _1153;
    float _1213 = _1045;
    float _1215 = _1209;
    float _1217 = _1207;
    float _1219 = _1211;
    float _1221 = _1205;
    float _1223 = _1213;
    if (_1133)
    {
        _1215 = _1201;
    }
    float _1225 = _1215;
    float _1227 = _1225;
    if (_1133)
    {
        _1217 = _1203;
    }
    float _1229 = _1217;
    float _1231 = _1229;
    if (_1133)
    {
        _1219 = _1205;
    }
    float _1233 = _1219;
    float _1235 = _1233;
    if (!_1133)
    {
        float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1239 = _1007 + _1237;
        float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1243 = _919 + _1241;
        float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1247 = -_979;
        float _1249 = _1247 + _1205;
        float _1251 = _1239 * _1239;
        float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1255 = _979 + _1253;
        float _1257 = fma(_1243, _1243, _1251);
        float _1259 = fma(_1255, _1255, _1257);
        float _1261 = -_919;
        float _1263 = _1261 + _1201;
        float _1265 = sqrt(_1259);
        float _1267 = precise::min(_1265, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1269 = _1267 * _1245;
        float _1271 = -_1007;
        float _1273 = _1271 + _1203;
        float _1275 = fma(_1263, _1269, _919);
        float _1277 = fma(_1273, _1269, _1007);
        float _1279 = fma(_1249, _1269, _979);
        _1231 = _1277;
        _1227 = _1275;
        _1235 = _1279;
    }
    float _1281 = _1231;
    float _1283 = _1227;
    float _1285 = _1235;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1281 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1283 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1297 = _1285 + _1295;
    float _1299 = _1289 * _1289;
    float _1301 = fma(_1293, _1293, _1299);
    float _1303 = fma(_1297, _1297, _1301);
    float _1305 = rsqrt(_1303);
    float _1307 = sqrt(_1303);
    float _1309 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1311 = _1293 * _1309;
    float _1313 = _1297 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 * _1313;
    float _1319 = _1315 + _1317;
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1321 + _1325;
    float _1329 = _919;
    float _1331 = _1327;
    float _1333 = _1289;
    float _1335 = _1311;
    if (_1323)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1337;
    }
    float _1339 = _1329;
    float _1341 = _1339;
    if (_1323)
    {
        float _1343 = _1327 * _1339;
        _1331 = _1343;
    }
    float _1345 = _1331;
    if (_1323)
    {
        float _1347 = rsqrt(_1319);
        _1341 = _1347;
    }
    float _1349 = _1341;
    float _1351 = _1349;
    if (_1323)
    {
        float _1353 = _1345 * 0.15915493667125701904296875;
        _1221 = _1353;
    }
    float _1355 = _1221;
    float _1357 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1359 = _1297;
    if (_1323)
    {
        float _1361 = _1355 * 6.283185482025146484375;
        float _1363 = sin(_1361);
        _1359 = _1363;
    }
    float _1365 = _1359;
    float _1367 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1369 = precise::max(0.0, _1357);
    float _1371 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1367);
    float _1373 = _979;
    float _1375 = _1369;
    if (_1323)
    {
        float _1377 = _1355 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = -_1309;
    float _1385 = -_1369;
    float _1387 = fma(_1289, _1383, _1385);
    float _1389 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1371);
    if (_1323)
    {
        float _1391 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1391;
    }
    float _1393 = _1333;
    float _1395 = _1365;
    float _1397 = _1393;
    if (_1323)
    {
        float _1399 = fma(_1365, _1393, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1395 = _1399;
    }
    float _1401 = _1395;
    float _1403 = _1401;
    if (!_1323)
    {
        _1397 = _1387;
    }
    float _1405 = _1397;
    float _1407 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1409 = _1405;
    if (_1323)
    {
        float _1411 = _1349 * _1401;
        _1223 = _1411;
    }
    float _1413 = _1223;
    if (!_1323)
    {
        _1403 = _1315;
    }
    float _1415 = _1403;
    float _1417 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1419 = _1415;
    float _1421 = _1381;
    if (_1323)
    {
        float _1423 = _1381 + (-1.0);
        _1375 = _1423;
    }
    float _1425 = _1375;
    float _1427 = _1425;
    if (_1323)
    {
        float _1429 = _1311 * _1413;
        _1335 = _1429;
    }
    float _1431 = _1335;
    float _1433 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1417);
    if (_1323)
    {
        float _1435 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1435;
    }
    float _1437 = _1351;
    if (!_1323)
    {
        _1427 = _1313;
    }
    float _1439 = _1427;
    float _1441 = _1439;
    if (_1323)
    {
        float _1443 = _1313 * _1413;
        _1441 = _1443;
    }
    float _1445 = _1441;
    if (_1323)
    {
        float _1447 = _1431 * _1431;
        _1419 = _1447;
    }
    float _1449 = _1419;
    if (_1323)
    {
        float _1451 = fma(_1387, _1381, _1437);
        _1409 = _1451;
    }
    float _1453 = _1409;
    if (!_1323)
    {
        _1421 = _1317;
    }
    float _1455 = _1421;
    float _1457 = _1455;
    if (_1323)
    {
        float _1459 = _1445 * _1445;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = fma(_1453, _1453, _1449);
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1469 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1467);
    float _1471 = precise::clamp(_1469, 0.0, 1.0);
    float _1473 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1433);
    float _1475 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1477 = _1465 + _1461;
    float _1479 = -_1471;
    float _1481 = _1479 + 1.0;
    float _1483 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1485 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1475);
    float _1487 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1489 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1491 = rsqrt(_1477);
    float _1493 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1483);
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1499 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = abs(_1481);
    float _1503 = log2(_1501);
    float _1505 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1507 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1509 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1511 = -_1507;
    float _1513 = fma(_1511, _1407, 1.0);
    float _1515 = _1491 * _1431;
    float _1517 = _1491 * _1453;
    float _1519 = _1491 * _1445;
    float _1521 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1509);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = log2(_1513);
    float _1527 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1521);
    float _1529 = -_1523;
    float _1531 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1529);
    float _1533 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1535 = _1517 + 1.0;
    float _1537 = -_1519;
    float _1539 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1531);
    float _1541 = 1.0 / _1527;
    float _1543 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1545 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1547 = fma(_1539, -0.5, 0.5);
    float _1549 = fma(_1539, 0.5, 0.5);
    float _1551 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1543);
    float _1553 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1545);
    float _1555 = exp2(_1533);
    float _1557 = fma(_1549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1559 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1551);
    float _1561 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1553);
    float _1563 = _1525 * 0.693147182464599609375;
    float _1565 = fma(_1549, _1557, -0.212114393711090087890625);
    float _1567 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1559);
    float _1569 = sqrt(_1547);
    float _1571 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = _1567 * _1541;
    float _1575 = -_1517;
    float _1577 = fma(_1555, _1535, _1575);
    float _1579 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1561);
    float _1581 = fma(_1549, _1565, 1.570728778839111328125);
    float _1583 = fma(_1573, 0.5, 0.5);
    float _1585 = fma(_1577, 0.5, 0.5);
    float _1587 = _1579 * _1541;
    float _1589 = _1569 * 0.636619746685028076171875;
    float _1591 = fma(_1587, -0.5, 0.5);
    float _1593 = -_1581;
    float _1595 = fma(_1589, _1593, 1.0);
    float3 _5514 = float3(_1583, _1591, _1571);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5514, float3(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5514, float3(0.0), isnan(_5514)), level(0.0)).x;
    float3 _5525 = float3(_1583, _1591, _1571);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _5542 = float2(_1595, _1585);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5542, float2(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5542, float2(0.0), isnan(_5542)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1622 = int(_1620);
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1626 = _1624 != 0;
    float _1628 = -_699;
    float _1630 = _1628 + 1.0;
    bool _1632 = _133 > 0.5;
    float _1634 = -_483;
    float _1636 = _1634 + 1.0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1640 = _1638 != 0;
    float _1642 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1644 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1646 = int(_1644);
    bool _1648 = _265 > 0.5;
    float _1650 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1642);
    int _1652 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1654 = _1652 != 0;
    out.m_70.x = _1283;
    out.m_70.y = _1281;
    out.m_70.z = _1285;
    bool _1656 = _261 > 0.5;
    float _1658 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1650);
    float _1660 = 0.0;
    float _1662 = _1527;
    float _1664 = _1579;
    float _1666 = _1567;
    if (_1626)
    {
        _1660 = 1.0;
    }
    float _1668 = _1660;
    float _1670 = trunc(_599);
    int _1672 = int(_1670);
    float _1674 = float(uint(_1622));
    float _1676 = _1668;
    if (!_1626)
    {
        _1676 = 1.2345600128173828125;
    }
    float _1678 = _1676;
    int _1680 = ~_1622;
    int _1682 = _1680 + 1;
    int _1684 = abs(_537);
    float _1686 = 1.0 / _1674;
    float _1688 = float(uint(_1646));
    int _1690 = ~_1646;
    int _1692 = _1690 + 1;
    int _1694 = abs(_541);
    int _1696 = abs(_1033);
    float _1698 = 1.0 / _1688;
    float _1700 = trunc(_609);
    int _1702 = int(_1700);
    int _1704 = as_type<int>(_1686) + (-2);
    float _1706 = float(uint(_1672));
    int _1708 = abs(_1055);
    int _1710 = as_type<int>(_1698) + (-2);
    float _1712 = as_type<float>(_1704) * _1706;
    int _1714 = ~_1622;
    int _1716 = _1714 + 1;
    float _1718 = trunc(_1712);
    float _1720 = precise::max(_1718, 0.0);
    uint _1723 = uint(_1720);
    float _1725 = float(uint(_1702));
    float _1727 = float(_1702);
    float _1729 = as_type<float>(_1710) * _1725;
    int _1731 = ~_1646;
    int _1733 = _1731 + 1;
    float _1735 = _1712;
    if (_1626)
    {
        _1735 = 1.0;
    }
    float _1737 = _1735;
    float _1739 = _1737;
    if (!_1626)
    {
        _1739 = 7.345489978790283203125;
    }
    float _1741 = _1739;
    float _1743 = trunc(_1729);
    float _1745 = precise::max(_1743, 0.0);
    uint _1747 = uint(_1745);
    int _1749 = _1716 * int(_1723);
    int _1751 = _1749 + _1672;
    float _1753 = _1741 * _133;
    float _1755 = float(_1646);
    float _1757 = float(uint(_1751));
    float _1759 = floor(_1753);
    int _1761 = _1733 * int(_1747);
    int _1763 = _1761 + _1702;
    float _1765 = as_type<float>(_1704) * _1757;
    float _1767 = float(uint(_1763));
    float _1769 = trunc(_1765);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    float _1775 = -_1759;
    float _1777 = _1753 + _1775;
    float _1779 = as_type<float>(_1710) * _1767;
    float _1781 = _1767;
    if (_1626)
    {
        _1781 = _133;
    }
    float _1783 = _1781;
    float _1785 = in.m_51.w;
    float _1787 = _1783;
    if (!_1626)
    {
        _1787 = _261;
    }
    float _1789 = _1787;
    float _1791 = trunc(_1779);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = _1678 * _1789;
    int _1799 = int(_1723) + int(_1773);
    float _1801 = floor(_1797);
    float _1803 = float(_1622);
    float _1805 = float(_1672);
    int _1807 = _1682 * _1799;
    int _1809 = _1807 + _1672;
    int _1811 = int(_1747) + int(_1795);
    bool _1813 = uint(_1809) >= uint(_1622);
    bool _1815 = _1805 >= _1803;
    bool _1817 = isnan(_1805);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(_1803);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    int _1827 = _1692 * _1811;
    int _1829 = _1827 + _1702;
    bool _1831 = _1785 > 0.5;
    bool _1833 = _1727 >= _1755;
    bool _1835 = isnan(_1727);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan(_1755);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    float _1845 = -_1801;
    float _1847 = _1797 + _1845;
    bool _1849 = !_1813;
    int _1851 = _1849 ? 0 : (-1);
    float _1853 = trunc(_1825);
    int _1855 = int(_1853);
    bool _1857 = uint(_1829) >= uint(_1646);
    float _1859 = _1847 * _1755;
    int _1861 = ~_1799;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = _1777 * _1803;
    bool _1869 = !_1857;
    int _1871 = _1869 ? 0 : (-1);
    float _1873 = _1803 * _675;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1877 = _1875 != 0;
    float _1879 = trunc(_1843);
    int _1881 = int(_1879);
    int _1883 = ~_1811;
    int _1885 = _1883 + _1871;
    int _1887 = _1885 + 1;
    int _1889 = _1622 * _1865;
    int _1891 = _1889 + _1672;
    bool _1893 = !_1877;
    int _1895 = _1893 ? 0 : 1;
    float _1897 = _1755 * _675;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1901 = _1899 != 0;
    int _1903 = _1646 * _1887;
    int _1905 = _1903 + _1702;
    bool _1907 = !_1640;
    int _1909 = _1907 ? 0 : 1;
    float _1911 = trunc(_1867);
    int _1913 = int(_1911);
    bool _1915 = _1622 == 0;
    bool _1917 = !_1901;
    int _1919 = _1917 ? 0 : 1;
    bool _1921 = _1646 == 0;
    bool _1923 = !_1915;
    int _1925 = _1923 ? _1891 : (-1);
    float _1927 = trunc(_1873);
    int _1929 = int(_1927);
    int _1931 = abs(_1895);
    int _1933 = ~_1881;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    bool _1939 = !_1921;
    int _1941 = _1939 ? _1905 : (-1);
    int _1943 = ~_1855;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    float _1949 = trunc(_1897);
    int _1951 = int(_1949);
    int _1953 = _1913 * _1931;
    int _1955 = _1953 + _1672;
    int _1957 = _1941 * _1937;
    int _1959 = _1646 + (-1);
    int _1961 = _1925 * _1947;
    int _1963 = _1622 + (-1);
    float _1965 = trunc(_1859);
    int _1967 = int(_1965);
    int _1969 = _1881 * _1959;
    int _1971 = _1969 + _1957;
    float _1973 = -_207;
    int _1975 = _1632 ? as_type<int>(_1973) : as_type<int>(_207);
    int _1977 = _1855 * _1963;
    int _1979 = _1977 + _1961;
    int _1981 = abs(_547);
    bool _1983 = !_1654;
    float _1985 = _1983 ? _207 : as_type<float>(_1975);
    int _1987 = _1979 * _1684;
    int _1989 = abs(_1919);
    int _1991 = _1971 * _1696;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1995 = _1993 != 0;
    int _1997 = _1929 * _1694;
    int _1999 = _1997 + _1987;
    int _2001 = abs(_1909);
    float _2003 = _1985 + 0.5;
    int _2005 = abs(_1037);
    int _2007 = _1955 * _1981;
    int _2009 = _2007 + _1999;
    int _2011 = ~_1622;
    int _2013 = _2011 + 1;
    int _2015 = _1967 * _1989;
    int _2017 = _2015 + _1702;
    float _2019 = -_211;
    int _2021 = _1656 ? as_type<int>(_2019) : as_type<int>(_211);
    int _2023 = _1951 * _2005;
    int _2025 = _2023 + _1991;
    float _2027 = fma(_2003, (*spvDescriptorSet0.vp_c9)._m0[80].x, _437);
    int _2029 = _1913 * _2001;
    int _2031 = _2029 + _2009;
    bool _2033 = !_1995;
    float _2035 = _2033 ? _211 : as_type<float>(_2021);
    float _2037 = float(uint(_1955));
    int _2039 = abs(_1051);
    float _2041 = _2035 + (-0.5);
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2045 = _2043 != 0;
    float _2047 = as_type<float>(_1704) * _2037;
    float _2049 = float(uint(_2031));
    float _2051 = -_2041;
    float _2053 = -_447;
    float _2055 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2053);
    int _2057 = _2017 * _2039;
    int _2059 = _2057 + _2025;
    float _2061 = -_207;
    int _2063 = _1648 ? as_type<int>(_2061) : as_type<int>(_207);
    float _2065 = as_type<float>(_1704) * _2049;
    float _2067 = trunc(_2047);
    float _2069 = precise::max(_2067, 0.0);
    uint _2071 = uint(_2069);
    int _2073 = _1967 * _1708;
    int _2075 = _2073 + _2059;
    bool _2077 = !_2045;
    float _2079 = _2077 ? _207 : as_type<float>(_2063);
    float _2081 = fma(_2035, _1630, _2055);
    float _2083 = float(uint(_2017));
    float _2085 = float(uint(_2075));
    float _2087 = _2079 + 0.5;
    float _2089 = trunc(_2065);
    float _2091 = precise::max(_2089, 0.0);
    uint _2093 = uint(_2091);
    float _2095 = as_type<float>(_1710) * _2083;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2099 = _2097 != 0;
    float _2101 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[85].x, _703);
    float _2103 = -_211;
    int _2105 = _1831 ? as_type<int>(_2103) : as_type<int>(_211);
    float _2107 = trunc(_2095);
    float _2109 = precise::max(_2107, 0.0);
    uint _2111 = uint(_2109);
    float _2113 = as_type<float>(_1710) * _2085;
    bool _2115 = !_2099;
    float _2117 = _2115 ? _211 : as_type<float>(_2105);
    int _2119 = _2013 * int(_2071);
    int _2121 = _2119 + _1955;
    int _2123 = ~_1646;
    int _2125 = _2123 + 1;
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2129 = _2127 != 0;
    float _2131 = _2117 + (-0.5);
    float _2133 = trunc(_2113);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = _2013 * int(_2093);
    int _2141 = _2139 + _2031;
    float _2143 = float(uint(_2121));
    float _2145 = -_679;
    float _2147 = _2145 + 1.0;
    float _2149 = -_2131;
    float _2151 = -_705;
    float _2153 = fma(_2149, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2151);
    int _2155 = ~_1646;
    int _2157 = _2155 + 1;
    float _2159 = float(uint(_2141));
    int _2161 = _2125 * int(_2111);
    int _2163 = _2161 + _2017;
    float _2165 = -_2147;
    float _2167 = fma(_1985, _2165, _2027);
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2171 = _2169 != 0;
    float _2173 = as_type<float>(_1704) * _2143;
    float _2175 = as_type<float>(_1704) * _2159;
    float _2177 = float(uint(_2163));
    int _2179 = ~_1622;
    int _2181 = _2179 + 1;
    int _2183 = _2157 * int(_2137);
    int _2185 = _2183 + _2075;
    float _2187 = trunc(_2175);
    float _2189 = precise::max(_2187, 0.0);
    uint _2191 = uint(_2189);
    float _2193 = as_type<float>(_1710) * _2177;
    float _2195 = -_697;
    float _2197 = _2195 + 1.0;
    float _2199 = -_1636;
    float _2201 = fma(_2079, _2199, _2101);
    float _2203 = float(uint(_2185));
    float _2205 = fma(_2117, _2197, _2153);
    float _2207 = _923 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2209 = trunc(_2173);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = as_type<float>(_1710) * _2203;
    out.m_72.x = _2167;
    out.m_72.y = _2081;
    out.m_72.z = _2201;
    out.m_72.w = _2205;
    float _2217 = trunc(_2215);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    int _2223 = int(_2093) + int(_2191);
    float _2225 = _923 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2227 = _923 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2229 = _2181 * _2223;
    int _2231 = _2229 + _2031;
    float _2233 = -_911;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2225);
    float _2237 = -_911;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2207);
    int _2241 = ~_1646;
    int _2243 = _2241 + 1;
    float _2245 = -_911;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2227);
    bool _2249 = uint(_2231) >= uint(_1622);
    float _2251 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2239);
    float _2253 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2235);
    int _2255 = int(_2137) + int(_2221);
    float _2257 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2259 = !_2249;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2265 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2267 = _2243 * _2255;
    int _2269 = _2267 + _2075;
    int _2271 = ~_2223;
    int _2273 = _2271 + _2261;
    int _2275 = _2273 + 1;
    float _2277 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2257);
    float _2279 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2281 = trunc(_2193);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    bool _2287 = uint(_2269) >= uint(_1646);
    int _2289 = _1622 * _2275;
    int _2291 = _2289 + _2031;
    int _2293 = int(_2071) + int(_2213);
    float _2295 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2297 = !_2287;
    int _2299 = _2297 ? 0 : (-1);
    float _2301 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2303 = !_1915;
    int _2305 = _2303 ? _2291 : (-1);
    float _2307 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2247);
    int _2309 = ~_2255;
    int _2311 = _2309 + _2299;
    int _2313 = _2311 + 1;
    float _2315 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2295);
    int _2317 = _2305 >> 31;
    float _2319 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2301);
    int _2321 = _2305 & 3;
    bool _2323 = _2321 != 0;
    int _2325 = _1646 * _2313;
    int _2327 = _2325 + _2075;
    int _2329 = _2317 & 3;
    float _2331 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2333 = _2305 & 3;
    bool _2335 = _2333 != 0;
    float _2337 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2263);
    bool _2339 = !_1921;
    int _2341 = _2339 ? _2327 : (-1);
    float _2343 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2265);
    int _2345 = ~_1622;
    int _2347 = _2345 + 1;
    float _2349 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2277);
    int _2351 = _2305 + _2329;
    float _2353 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2315);
    int _2355 = _2341 >> 31;
    int _2357 = _2347 * _2293;
    int _2359 = _2357 + _1955;
    int _2361 = _2351 >> 2;
    float _2363 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2279);
    int _2365 = _2355 & 3;
    float _2367 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2319);
    bool _2369 = uint(_2321) > 1u;
    float _2371 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2373 = _2361 << 4;
    int _2375 = _2373 + 368;
    int _2377 = _2335 ? 0 : 1;
    bool _2379 = uint(_2359) >= uint(_1622);
    int _2381 = _2341 + _2365;
    uint _2383 = uint(int(uint(_2375) >> uint(2)));
    uint _2385 = uint(int(uint(int(_2383)) >> uint(2)));
    int _2387 = int(_2383) & 3;
    float _2389 = (*spvDescriptorSet0.vp_c9)._m0[int(_2385)][_2387];
    int _2391 = int(_2383) + 1;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    int _2395 = _2391 & 3;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[int(_2393)][_2395];
    int _2399 = int(_2111) + int(_2285);
    int _2401 = ~_1646;
    int _2403 = _2401 + 1;
    int _2405 = ~_2377;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    int _2411 = _2409;
    if (!_2369)
    {
        int _2413 = ~_2377;
        int _2415 = _2413 + 1;
        _2411 = _2415;
    }
    int _2417 = _2411;
    int _2419 = _2403 * _2399;
    int _2421 = _2419 + _2017;
    int _2423 = _2381 >> 2;
    float _2425 = _2331 * _2253;
    bool _2427 = uint(_2321) >= 2u;
    float _2429 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2337);
    int _2431 = _2423 << 4;
    int _2433 = _2431 + 512;
    float _2435 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2343);
    int _2437 = _2427 ? 0 : 1;
    float _2439 = fma(_2371, _2429, _2425);
    bool _2441 = uint(_2421) >= uint(_1646);
    float _2443 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2363);
    bool _2445 = !_2379;
    int _2447 = _2445 ? 0 : (-1);
    uint _2449 = uint(int(uint(_2433) >> uint(2)));
    uint _2451 = uint(int(uint(int(_2449)) >> uint(2)));
    int _2453 = int(_2449) & 3;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[int(_2451)][_2453];
    int _2457 = int(_2449) + 1;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    int _2461 = _2457 & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    bool _2465 = _2321 != 3;
    float _2467 = _2331 * _2251;
    bool _2469 = !_2441;
    int _2471 = _2469 ? 0 : (-1);
    out.m_74.x = _2429;
    out.m_74.y = _2435;
    out.m_74.z = _2443;
    int _2473 = ~_2293;
    int _2475 = _2473 + _2447;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2371, _2435, _2467);
    bool _2481 = !_2323;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2375 + 8;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    uint _2489 = uint(int(uint(int(_2487)) >> uint(2)));
    int _2491 = int(_2487) & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    int _2495 = int(_2487) + 1;
    uint _2497 = uint(int(uint(_2495) >> uint(2)));
    int _2499 = _2495 & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = _2341 & 3;
    bool _2505 = _2503 != 0;
    int _2507 = _1622 * _2477;
    int _2509 = _2507 + _1955;
    int _2511 = ~_2399;
    int _2513 = _2511 + _2471;
    int _2515 = _2513 + 1;
    float _2517 = _2353 + _2479;
    int _2519 = ~_2437;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    int _2525 = _2523;
    if (_2465)
    {
        int _2527 = ~_2437;
        int _2529 = _2527 + 1;
        _2525 = _2529;
    }
    int _2531 = _2525;
    int _2533 = _2433 + 8;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    uint _2537 = uint(int(uint(int(_2535)) >> uint(2)));
    int _2539 = int(_2535) & 3;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[int(_2537)][_2539];
    int _2543 = int(_2535) + 1;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    int _2547 = _2543 & 3;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[int(_2545)][_2547];
    bool _2551 = uint(_2503) > 1u;
    int _2553 = _1646 * _2515;
    int _2555 = _2553 + _2017;
    int _2557 = _2341 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = _2331 * _2307;
    bool _2563 = !_2505;
    int _2565 = _2563 ? 0 : 1;
    int _2567 = _2559 ? 0 : 1;
    float _2569 = fma(_2371, _2443, _2561);
    int _2571 = abs(_2417);
    int _2573 = ~_2567;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    float _2579 = _2367 + _2569;
    int _2581 = abs(_2483);
    int _2583 = _2577;
    if (!_2551)
    {
        int _2585 = ~_2567;
        int _2587 = _2585 + 1;
        _2583 = _2587;
    }
    int _2589 = _2583;
    int _2591 = ~_2571;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    bool _2597 = _2503 != 3;
    bool _2599 = uint(_2503) >= 2u;
    int _2601 = _2595 * as_type<int>(_2397);
    int _2603 = _2599 ? 0 : 1;
    int _2605 = ~_2581;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2589);
    int _2613 = abs(_2531);
    int _2615 = _2609 * as_type<int>(_2389);
    int _2617 = _2615 + _2601;
    int _2619 = ~_2603;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    int _2625 = _2623;
    if (_2597)
    {
        int _2627 = ~_2603;
        int _2629 = _2627 + 1;
        _2625 = _2629;
    }
    int _2631 = _2625;
    int _2633 = abs(_2565);
    int _2635 = ~_2611;
    int _2637 = _2635 + 1;
    int _2639 = _2637 + 1;
    int _2641 = ~_2613;
    int _2643 = _2641 + 1;
    int _2645 = _2643 + 1;
    bool _2647 = _2321 != 3;
    int _2649 = _2639 * as_type<int>(_2463);
    bool _2651 = _2503 != 3;
    int _2653 = _2645 * as_type<int>(_2493);
    int _2655 = _2653 + _2617;
    int _2657 = abs(_2631);
    int _2659 = ~_2633;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    bool _2665 = !_2647;
    int _2667 = _2665 ? 0 : (-1);
    bool _2669 = !_2651;
    int _2671 = _2669 ? 0 : (-1);
    int _2673 = _2663 * as_type<int>(_2455);
    int _2675 = _2673 + _2649;
    int _2677 = ~_2657;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    float _2683 = fma(_2331, _2331, 1.0);
    bool _2685 = !_2129;
    int _2687 = _2685 ? 0 : 1;
    int _2689 = abs(_2667);
    int _2691 = _2681 * as_type<int>(_2541);
    int _2693 = _2691 + _2675;
    bool _2695 = !_2171;
    int _2697 = _2695 ? 0 : 1;
    float _2699 = rsqrt(_2683);
    int _2701 = abs(_2671);
    int _2703 = abs(_2687);
    int _2705 = abs(_2697);
    int _2707 = ~_2701;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = _2711 * as_type<int>(_2549);
    int _2715 = _2713 + _2693;
    int _2717 = ~_2705;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    int _2723 = ~_2689;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    float _2729 = _2331 * _2699;
    int _2731 = ~_2703;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = _2715 * _2721;
    float _2739 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2741 = _2727 * as_type<int>(_2501);
    int _2743 = _2741 + _2655;
    bool _2745 = !_1915;
    int _2747 = _2745 ? _2509 : (-1);
    float _2749 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1658);
    bool _2751 = !_1921;
    int _2753 = _2751 ? _2555 : (-1);
    int _2755 = _2743 * _2735;
    float _2757 = exp2(_2739);
    float _2759 = -_2353;
    float _2761 = _2729 * _2759;
    float _2763 = _1567 + _1527;
    int _2765 = _2747 * _2703;
    int _2767 = _2765 + _2755;
    float _2769 = -_2349;
    float _2771 = _2729 * _2769;
    float _2773 = -_2367;
    float _2775 = _2729 * _2773;
    int _2777 = _2753 * _2705;
    int _2779 = _2777 + _2737;
    float _2781 = fma(_2699, _2251, _2761);
    float _2783 = fma(_2699, _2253, _2771);
    float _2785 = fma(_2699, _2307, _2775);
    float _2787 = _1527 * 0.5;
    float _2789 = float(_2767);
    float _2791 = _2749 + _1527;
    float _2793 = float(_2779);
    float _2795 = fma(_1579, -0.5, _2787);
    float _2797 = -_2757;
    float _2799 = _2797 + 1.0;
    float _2801 = _2791 * 0.5;
    out.m_76.x = _2789;
    out.m_76.y = _2793;
    float _2803 = _2763 * 0.5;
    float _2805 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2807 = _2349 + _2439;
    out.m_78.x = _2783;
    out.m_78.y = _2781;
    out.m_78.z = _2785;
    bool _2809 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2811 = isnan(_1307);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2817 = _2813 || _2815;
    float _2819 = _2805 * _1597;
    float _2821 = -_2805;
    float _2823 = _2821 + 1.0;
    out.m_80.x = _2803;
    out.m_80.y = _2795;
    out.m_80.z = _2801;
    out.m_80.w = _1527;
    float _2825 = _1608 * _2819;
    float _2827 = _1618 * _2819;
    float _2829 = _1608 * _2823;
    out.m_82.x = _2807;
    out.m_82.y = _2517;
    out.m_82.z = _2579;
    float _2831 = fma(_1614, _2825, _1602);
    float _2833 = fma(_1616, _2825, _1604);
    float _2835 = fma(_1608, _2827, _1606);
    out.gl_Position.x = _1567;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _2749;
    out.gl_Position.w = _1527;
    float _2837 = _1604;
    float _2839 = _1602;
    float _2841 = _2749;
    if (!_2817)
    {
        _2837 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2843 = _2837;
    float _2845 = _2843;
    float _2847 = _2843;
    if (!_2817)
    {
        _2839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2849 = _2839;
    out.m_84.x = _2831;
    out.m_84.y = _2833;
    out.m_84.z = _2835;
    out.m_84.w = _2829;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2817)
    {
        _1662 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2855 = _1662;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2817)
    {
        _2841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2861 = _2841;
    float _2863 = _2861;
    float _2865 = _2861;
    if (!_2817)
    {
        _1664 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2867 = _1664;
    float _2869 = _2867;
    float _2871 = _2867;
    if (!_2817)
    {
        _1666 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2873 = _1666;
    bool _2875 = !_2817;
    float _2877 = _2873;
    float _2879 = _2873;
    if (!_2875)
    {
        bool _2881 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2883 = isnan(_1307);
        bool _2885 = _2881 || _2883;
        bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2889 = _2885 || _2887;
        if (!_2889)
        {
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2893 = _1307 + _2891;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2897 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2895;
            float _2899 = 1.0 / _2897;
            float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2909 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2911 = _2909 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2921 = _2893 * _2899;
            float _2923 = precise::clamp(_2921, 0.0, 1.0);
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2929 = fma(_2923, _2903, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2931 = fma(_2923, _2927, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2933 = fma(_2923, _2907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2935 = fma(_2923, _2911, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2937 = fma(_2923, _2915, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2939 = fma(_2923, _2919, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2853 = _2931;
            _2871 = _2937;
            _2847 = _2929;
            _2865 = _2935;
            _2859 = _2933;
            _2879 = _2939;
            _2941 = true;
        }
        else
        {
            bool _2943 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2945 = isnan(_1307);
            bool _2947 = _2943 || _2945;
            bool _2949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2951 = _2947 || _2949;
            if (!_2951)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2953 = _2845;
            _2847 = _2953;
            if (!_2951)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2955 = _2851;
            _2853 = _2955;
            if (!_2951)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2957 = _2857;
            _2859 = _2957;
            if (!_2951)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2959 = _2863;
            _2865 = _2959;
            if (!_2951)
            {
                _2869 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2961 = _2869;
            _2871 = _2961;
            if (!_2951)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2963 = _2877;
            bool _2965 = !_2951;
            _2879 = _2963;
            if (!_2965)
            {
                bool _2967 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2969 = isnan(_1307);
                bool _2971 = _2967 || _2969;
                bool _2973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2975 = _2971 || _2973;
                if (!_2975)
                {
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2979 = _1307 + _2977;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2983 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2981;
                    float _2985 = 1.0 / _2983;
                    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3007 = _2979 * _2985;
                    float _3009 = precise::clamp(_3007, 0.0, 1.0);
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3015 = fma(_3009, _2989, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3017 = fma(_3009, _3013, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3019 = fma(_3009, _2993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3021 = fma(_3009, _2997, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3023 = fma(_3009, _3001, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3025 = fma(_3009, _3005, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2853 = _3017;
                    _2871 = _3023;
                    _2847 = _3015;
                    _2865 = _3021;
                    _2859 = _3019;
                    _2879 = _3025;
                    _2941 = true;
                }
                else
                {
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2871 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2941 = false;
    float _3027 = _2853;
    float _3029 = _2871;
    float _3031 = _2847;
    float _3033 = _2865;
    float _3035 = _2859;
    float _3037 = _2879;
    float _3039 = fma(_2517, -0.5, 0.5);
    float _3041 = precise::clamp(_3039, 0.0, 1.0);
    float _3043 = -_3027;
    float _3045 = _3043 + _3029;
    float _3047 = -_3031;
    float _3049 = _3047 + _3033;
    float _3051 = -_3035;
    float _3053 = _3051 + _3037;
    bool _3055 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3057 = fma(_3041, _3045, _3027);
    float _3059 = fma(_3041, _3049, _3031);
    float _3061 = fma(_3041, _3053, _3035);
    float _3063 = _3057 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3065 = fma(_3059, 0.298911988735198974609375, _3063);
    float _3067 = fma(_3061, 0.114477999508380889892578125, _3065);
    out.m_86.x = 0.0;
    float _3069 = -_3067;
    float _3071 = _3059 + _3069;
    float _3073 = -_3067;
    float _3075 = _3057 + _3073;
    float _3077 = -_3067;
    float _3079 = _3061 + _3077;
    float _3081 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3083 = fma(_3071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    float _3085 = fma(_3075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    float _3087 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    out.m_88.w = _3081;
    out.m_90.x = _3083;
    out.m_90.y = _3085;
    out.m_90.z = _3087;
    if (!_3055)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3089 = -_1281;
    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3093 = -_1283;
    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3097 = -_1285;
    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3101 = _3091 * _3091;
    float _3103 = fma(_3095, _3095, _3101);
    float _3105 = fma(_3099, _3099, _3103);
    float _3107 = sqrt(_3105);
    float _3109 = rsqrt(_3105);
    float _3111 = -_3107;
    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = _3095 * _3109;
    float _3121 = _3091 * _3109;
    float _3123 = abs(_3117);
    float _3125 = log2(_3123);
    float _3127 = _3099 * _3109;
    float _3129 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3131 = _2517 * _3121;
    float _3133 = -_3121;
    float _3135 = -_3129;
    float _3137 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3135);
    float _3139 = fma(_2807, _3119, _3131);
    float _3141 = -_3127;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3137);
    float _3145 = fma(_2579, _3127, _3139);
    float _3147 = precise::clamp(_3145, 0.0, 1.0);
    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3151 = _3143 + _3149;
    float _3153 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3157 = precise::clamp(_3155, 0.0, 1.0);
    float _3159 = exp2(_3153);
    float _3161 = _3159 * _3157;
    float _3163 = _3147 * _3161;
    float _3165 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3169 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3165;
    out.m_86.y = _3167;
    out.m_86.z = _3169;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2941 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3228 = as_type<float>(_127);
        out.gl_Position.z = _3228;
    }
    if (!_113)
    {
        return out;
    }
    float _131 = in.m_49.w;
    float _133 = in.m_51.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_109);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _121;
    if (_161)
    {
        out.m_47.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3301 = as_type<float>(_167);
        out.gl_Position.z = _3301;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_175, _181, _217);
    float _225 = fma(_171, _189, _219);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _225);
    bool _231 = !_203;
    float _233 = _187;
    float _249;
    if (!_231)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_109);
        float _255 = 1.0 / _253;
        float _257 = _147 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = in.m_51.y;
    float _263 = _133 * 2.0;
    float _265 = in.m_51.z;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = floor(_263);
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _283 = _281 != 0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _259 + _285;
    float _289 = 1.0 / _269;
    float _291 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    float _297 = -_279;
    float _299 = fma(_291, 2.0, _297);
    float _301 = 1.0 / _273;
    float _303 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _305 = _261 * 2.0;
    bool _307 = _275 > 0.0;
    float _309 = _265 * 2.0;
    float _311 = fma(_303, -2.0, _277);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _259 + _313;
    float _317 = 1.0 / _295;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _259 + _319;
    bool _323 = _275 >= 0.0;
    bool _325 = isnan(_275);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = _315 * _289;
    float _335 = _133 + _261;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _339 = floor(_305);
    float _341 = _321 * _301;
    float _343 = _265 + _261;
    float _345 = _335 + (-1.0);
    float _347 = _133 + _265;
    float _349 = _343 + (-1.0);
    float _351 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _353 = floor(_309);
    int _355 = as_type<int>(_345);
    float _357 = _341;
    if (_283)
    {
        _355 = 0;
    }
    int _359 = _355;
    float _361 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _363 = _359;
    if (!_283)
    {
        _363 = 1;
    }
    int _365 = _363;
    float _367 = _287 * _317;
    int _369 = _331 ? 0 : 1;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    bool _375 = _365 != 1;
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _379 = int(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _385 = _339 > 0.0;
    float _387 = fma(_373, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _389 = _339 >= 0.0;
    bool _391 = isnan(_339);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _407 = _353 > 0.0;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    bool _413 = _353 >= 0.0;
    bool _415 = isnan(_353);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = fma(_401, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _425 = fma(_383, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _427 = fma(_405, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _429 = _421 ? 0 : 1;
    float _431 = _347 + (-1.0);
    if (!_375)
    {
        _357 = _261;
    }
    float _433 = _357;
    float _435 = -_147;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[76].x, _299);
    float _439 = _433;
    if (_375)
    {
        _439 = _133;
    }
    float _441 = _439;
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _445 = _397 ? 0 : 1;
    float _447 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _311);
    int _449 = ~_429;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    int _455 = _453;
    if (!_407)
    {
        int _457 = ~_429;
        int _459 = _457 + 1;
        _455 = _459;
    }
    int _461 = _455;
    float _463 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[83].z, _337);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    int _477 = ~_445;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    int _485 = ~_369;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    int _491 = _481;
    int _493 = _489;
    if (!_385)
    {
        int _495 = ~_445;
        int _497 = _495 + 1;
        _491 = _497;
    }
    int _499 = _491;
    if (!_307)
    {
        int _501 = ~_369;
        int _503 = _501 + 1;
        _493 = _503;
    }
    int _505 = _493;
    float _507 = float(_411);
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = float(_109);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _517 = float(_379);
    float _519 = as_type<float>(_411);
    if (!_375)
    {
        _519 = _261;
    }
    float _521 = _519;
    float _523 = 1.0 / _513;
    float _525 = _521;
    if (!_375)
    {
        _117 = _265;
    }
    float _527 = _117;
    float _529 = _527;
    if (_375)
    {
        _525 = _133;
    }
    float _531 = _525;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _535 = !_471;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_467;
    int _541 = _539 ? 0 : 1;
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _545 = !_475;
    int _547 = _545 ? 0 : 1;
    float _549 = 1.0 / _507;
    if (_375)
    {
        _529 = _261;
    }
    float _551 = _529;
    float _553 = -_533;
    float _555 = fma(_543, 2.0, _553);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    float _569 = float(_505);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[83].w, _515);
    float _573 = _551;
    if (!_375)
    {
        _573 = _265;
    }
    float _575 = _573;
    float _577 = 1.0 / _517;
    bool _579 = !_567;
    int _581 = _579 ? 0 : 1;
    float _583 = _575;
    if (_375)
    {
        _583 = _261;
    }
    float _585 = _583;
    bool _587 = !_563;
    int _589 = _587 ? 0 : 1;
    bool _591 = !_559;
    int _593 = _591 ? 0 : 1;
    float _595 = _585 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _597 = abs(_581);
    float _599 = _549 * _147;
    int _601 = abs(_589);
    float _603 = _511 * _147;
    int _605 = abs(_593);
    float _607 = float(_499);
    float _609 = _577 * _147;
    float _611 = float(_597);
    float _613 = exp2(_603);
    float _615 = float(_605);
    float _617 = float(_461);
    float _619 = _611 * _607;
    float _621 = float(_601);
    float _623 = _615 * _617;
    float _625 = in.m_66.x;
    float _627 = in.m_66.y;
    float _629 = in.m_66.z;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _633 = 1.0 + _631;
    float _635 = _621 * _569;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _639 = -_613;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _633;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _647 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _649 = isnan(1.0);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _655 = _651 || _653;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _659 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _667 = _663 || _665;
    float _669 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _645);
    float _671 = _635 * (-2.0);
    float _673 = fma(_595, -2.0, _637);
    float _675 = _523 * _147;
    float _677 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _657);
    float _679 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _669);
    float _681 = _667 ? _641 : 0.0;
    float _683 = fma(_361, _671, _361);
    bool _685 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _687 = isnan(_259);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _571);
    float _699 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _677);
    float _701 = -_147;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[81].x, _555);
    float _705 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _673);
    if (_655)
    {
        float _707 = _681 * _643;
        _151 = _707;
    }
    float _709 = _151;
    float _711 = _623 * (-2.0);
    float _713 = fma(_671, _627, _627);
    float _715 = _261 + (-0.5);
    bool _717 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_259);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_695;
    float _731 = _729 + 1.0;
    float _733 = fma(_351, _711, _351);
    float _735 = fma(_711, _625, _625);
    float _737 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _739 = _619 * (-2.0);
    bool _741 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _743 = isnan(_259);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _727 * _731;
    float _755 = -_727;
    float _757 = _755 + 1.0;
    float _759 = fma(_443, _739, _443);
    bool _761 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_259);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = fma(_739, _629, _629);
    float _775 = _751 * _757;
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = _133 + (-0.5);
    float _783 = _265 + (-0.5);
    float _785 = fma(_683, _709, _737);
    float _787 = _771 * _779;
    float _789 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[196].x, _735);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _773);
    float _793 = _785 * 0.15915493667125701904296875;
    float _795 = _423 * _787;
    float _797 = _387 * _787;
    float _799 = fma(_733, _709, _789);
    float _801 = fma(_759, _709, _791);
    float _803 = in.m_68.x;
    float _805 = in.m_68.y;
    float _807 = -_771;
    float _809 = _807 + 1.0;
    float _811 = _799 * 0.15915493667125701904296875;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = in.m_44.x;
    float _819 = in.m_44.y;
    float _821 = in.m_44.z;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _823;
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[143].x, _797);
    float _829 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[143].y, _795);
    float _831 = fma(_815, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _833 = fma(_825, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _835 = fma(_425, _775, _827);
    float _837 = fma(_427, _775, _829);
    float _839 = _801 * 0.15915493667125701904296875;
    float _841 = _793 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_831, _753, _835);
    float _847 = fma(_833, _753, _837);
    float _849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _851 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[146].x, _845);
    float _853 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[146].y, _847);
    float _855 = _793 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _853 * _805;
    float _861 = _851 * _803;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _865 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _869 = _811 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _191 * _819;
    float _875 = _865 * _849;
    float _877 = _867 * _863;
    float _879 = _179 * _819;
    float _881 = fma(_189, _817, _873);
    float _883 = _185 * _819;
    float _885 = in.m_60.w;
    float _887 = _839 * 6.283185482025146484375;
    float _889 = cos(_887);
    float _891 = fma(_177, _817, _879);
    float _893 = fma(_193, _821, _881);
    float _895 = fma(_183, _817, _883);
    float _897 = fma(_181, _821, _891);
    float _899 = fma(_187, _821, _895);
    float _901 = _811 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _871 * _843;
    float _907 = _871 * _857;
    float _909 = _839 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _871 * _889;
    float _915 = _843 * _889;
    float _917 = _913 * _875;
    float _919 = _897 + _885;
    float _921 = _903 * _857;
    float _923 = _903 * _889;
    float _925 = _903 * _843;
    float _927 = _857 * _889;
    float _929 = in.m_64.w;
    float _931 = _923 * _875;
    float _933 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = fma(_911, _921, _905);
    float _937 = -_875;
    float _939 = _911 * _937;
    float _941 = -_907;
    float _943 = fma(_911, _925, _941);
    float _945 = -_925;
    float _947 = fma(_911, _907, _945);
    float _949 = fma(_935, _877, _931);
    float _951 = fma(_927, _877, _939);
    float _953 = fma(_911, _905, _921);
    float _955 = fma(_947, _877, _917);
    float _957 = fma(_943, _933, _949);
    float _959 = fma(_915, _933, _951);
    float _961 = fma(_953, _933, _955);
    float _963 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _963);
    float _971 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _973 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _975 = in.m_62.w;
    float _977 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    float _979 = _893 + _929;
    float _981 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _971);
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _973);
    float _985 = _977 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _991 = _979 + _985;
    float _993 = _919 + _987;
    float _995 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _997 = _991 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1001 = _993 + _999;
    float _1003 = _997 * _997;
    float _1005 = fma(_1001, _1001, _1003);
    float _1007 = _899 + _975;
    float _1009 = sqrt(_1005);
    float _1011 = _1007 + _989;
    bool _1013 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1029 = _1027 != 0;
    bool _1031 = !_1021;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_1017;
    int _1037 = _1035 ? 0 : 1;
    float _1039 = _993;
    float _1041 = _817;
    float _1043 = _997;
    float _1045 = _983;
    if (!_1013)
    {
        _233 = _993;
    }
    float _1047 = _233;
    bool _1049 = !_1025;
    int _1051 = _1049 ? 0 : 1;
    bool _1053 = !_1029;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = _1047;
    if (!_1013)
    {
        _1039 = _991;
    }
    float _1059 = _1039;
    float _1061 = _1059;
    if (!_1013)
    {
        _1041 = _1011;
    }
    float _1063 = _1041;
    bool _1065 = !_1013;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1073 = _1009 + _1071;
        float _1075 = rsqrt(_1005);
        float _1077 = _1073 * _1069;
        float _1079 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = _1077 * 0.15915493667125701904296875;
        float _1083 = _1081 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 + (-1.0);
        float _1093 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = _1075 * _1093;
        float _1099 = fma(_1011, _1085, _1095);
        float _1101 = fma(_1001, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_997, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1099;
        _1057 = _1101;
        _1061 = _1103;
    }
    float _1105 = _1067;
    float _1107 = _1057;
    float _1109 = _1061;
    float _1111 = -_1007;
    float _1113 = _1111 + _1105;
    float _1115 = -_919;
    float _1117 = _1115 + _1107;
    float _1119 = -_979;
    float _1121 = _1119 + _1109;
    float _1123 = _1113 * _1113;
    bool _1125 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1127 = isnan(0.5);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1133 = _1129 || _1131;
    float _1135 = fma(_1117, _1117, _1123);
    float _1137 = fma(_1121, _1121, _1135);
    float _1139 = sqrt(_1137);
    bool _1141 = _1139 > 0.0;
    bool _1143 = !_1141;
    float _1145 = _1107;
    float _1147 = _1105;
    float _1149 = _1109;
    float _1151 = _1139;
    float _1153 = _1137;
    if (!_1143)
    {
        float _1155 = _227 * _227;
        float _1157 = fma(_223, _223, _1155);
        float _1159 = fma(_229, _229, _1157);
        float _1161 = rsqrt(_1137);
        float _1163 = sqrt(_1159);
        float _1165 = _1113 * _1161;
        float _1167 = _1121 * _1161;
        bool _1169 = _1163 > 0.0;
        float _1171 = _1117 * _1161;
        bool _1173 = !_1169;
        _1043 = _1159;
        _1151 = _1161;
        _1045 = _1167;
        if (!_1173)
        {
            float _1175 = rsqrt(_1159);
            float _1177 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1179 = _227 * _1175;
            float _1181 = _223 * _1175;
            float _1183 = _229 * _1175;
            float _1185 = _1165 * _1179;
            float _1187 = fma(_1171, _1181, _1185);
            float _1189 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1191 = fma(_1167, _1183, _1187);
            float _1193 = _1191 * _1189;
            float _1195 = fma(_223, _1193, _1107);
            float _1197 = fma(_227, _1193, _1105);
            float _1199 = fma(_229, _1193, _1109);
            _1145 = _1195;
            _1147 = _1197;
            _1149 = _1199;
            _1151 = _1193;
            _1153 = _1181;
        }
    }
    float _1201 = _1145;
    float _1203 = _1147;
    float _1205 = _1149;
    float _1207 = _1043;
    float _1209 = _1151;
    float _1211 = _1153;
    float _1213 = _1045;
    float _1215 = _1209;
    float _1217 = _1207;
    float _1219 = _1211;
    float _1221 = _1205;
    float _1223 = _1213;
    if (_1133)
    {
        _1215 = _1201;
    }
    float _1225 = _1215;
    float _1227 = _1225;
    if (_1133)
    {
        _1217 = _1203;
    }
    float _1229 = _1217;
    float _1231 = _1229;
    if (_1133)
    {
        _1219 = _1205;
    }
    float _1233 = _1219;
    float _1235 = _1233;
    if (!_1133)
    {
        float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1239 = _1007 + _1237;
        float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1243 = _919 + _1241;
        float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1247 = -_979;
        float _1249 = _1247 + _1205;
        float _1251 = _1239 * _1239;
        float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1255 = _979 + _1253;
        float _1257 = fma(_1243, _1243, _1251);
        float _1259 = fma(_1255, _1255, _1257);
        float _1261 = -_919;
        float _1263 = _1261 + _1201;
        float _1265 = sqrt(_1259);
        float _1267 = precise::min(_1265, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1269 = _1267 * _1245;
        float _1271 = -_1007;
        float _1273 = _1271 + _1203;
        float _1275 = fma(_1263, _1269, _919);
        float _1277 = fma(_1273, _1269, _1007);
        float _1279 = fma(_1249, _1269, _979);
        _1231 = _1277;
        _1227 = _1275;
        _1235 = _1279;
    }
    float _1281 = _1231;
    float _1283 = _1227;
    float _1285 = _1235;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1281 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1283 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1297 = _1285 + _1295;
    float _1299 = _1289 * _1289;
    float _1301 = fma(_1293, _1293, _1299);
    float _1303 = fma(_1297, _1297, _1301);
    float _1305 = rsqrt(_1303);
    float _1307 = sqrt(_1303);
    float _1309 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1311 = _1293 * _1309;
    float _1313 = _1297 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 * _1313;
    float _1319 = _1315 + _1317;
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1321 + _1325;
    float _1329 = _919;
    float _1331 = _1327;
    float _1333 = _1289;
    float _1335 = _1311;
    if (_1323)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1337;
    }
    float _1339 = _1329;
    float _1341 = _1339;
    if (_1323)
    {
        float _1343 = _1327 * _1339;
        _1331 = _1343;
    }
    float _1345 = _1331;
    if (_1323)
    {
        float _1347 = rsqrt(_1319);
        _1341 = _1347;
    }
    float _1349 = _1341;
    float _1351 = _1349;
    if (_1323)
    {
        float _1353 = _1345 * 0.15915493667125701904296875;
        _1221 = _1353;
    }
    float _1355 = _1221;
    float _1357 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1359 = _1297;
    if (_1323)
    {
        float _1361 = _1355 * 6.283185482025146484375;
        float _1363 = sin(_1361);
        _1359 = _1363;
    }
    float _1365 = _1359;
    float _1367 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1369 = precise::max(0.0, _1357);
    float _1371 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1367);
    float _1373 = _979;
    float _1375 = _1369;
    if (_1323)
    {
        float _1377 = _1355 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = -_1309;
    float _1385 = -_1369;
    float _1387 = fma(_1289, _1383, _1385);
    float _1389 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1371);
    if (_1323)
    {
        float _1391 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1391;
    }
    float _1393 = _1333;
    float _1395 = _1365;
    float _1397 = _1393;
    if (_1323)
    {
        float _1399 = fma(_1365, _1393, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1395 = _1399;
    }
    float _1401 = _1395;
    float _1403 = _1401;
    if (!_1323)
    {
        _1397 = _1387;
    }
    float _1405 = _1397;
    float _1407 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1409 = _1405;
    if (_1323)
    {
        float _1411 = _1349 * _1401;
        _1223 = _1411;
    }
    float _1413 = _1223;
    if (!_1323)
    {
        _1403 = _1315;
    }
    float _1415 = _1403;
    float _1417 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1419 = _1415;
    float _1421 = _1381;
    if (_1323)
    {
        float _1423 = _1381 + (-1.0);
        _1375 = _1423;
    }
    float _1425 = _1375;
    float _1427 = _1425;
    if (_1323)
    {
        float _1429 = _1311 * _1413;
        _1335 = _1429;
    }
    float _1431 = _1335;
    float _1433 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1417);
    if (_1323)
    {
        float _1435 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1435;
    }
    float _1437 = _1351;
    if (!_1323)
    {
        _1427 = _1313;
    }
    float _1439 = _1427;
    float _1441 = _1439;
    if (_1323)
    {
        float _1443 = _1313 * _1413;
        _1441 = _1443;
    }
    float _1445 = _1441;
    if (_1323)
    {
        float _1447 = _1431 * _1431;
        _1419 = _1447;
    }
    float _1449 = _1419;
    if (_1323)
    {
        float _1451 = fma(_1387, _1381, _1437);
        _1409 = _1451;
    }
    float _1453 = _1409;
    if (!_1323)
    {
        _1421 = _1317;
    }
    float _1455 = _1421;
    float _1457 = _1455;
    if (_1323)
    {
        float _1459 = _1445 * _1445;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = fma(_1453, _1453, _1449);
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1469 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1467);
    float _1471 = precise::clamp(_1469, 0.0, 1.0);
    float _1473 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1433);
    float _1475 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1477 = _1465 + _1461;
    float _1479 = -_1471;
    float _1481 = _1479 + 1.0;
    float _1483 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1485 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1475);
    float _1487 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1489 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1491 = rsqrt(_1477);
    float _1493 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1483);
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1499 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = abs(_1481);
    float _1503 = log2(_1501);
    float _1505 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1507 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1509 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1511 = -_1507;
    float _1513 = fma(_1511, _1407, 1.0);
    float _1515 = _1491 * _1431;
    float _1517 = _1491 * _1453;
    float _1519 = _1491 * _1445;
    float _1521 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1509);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = log2(_1513);
    float _1527 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1521);
    float _1529 = -_1523;
    float _1531 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1529);
    float _1533 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1535 = _1517 + 1.0;
    float _1537 = -_1519;
    float _1539 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1531);
    float _1541 = 1.0 / _1527;
    float _1543 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1545 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1547 = fma(_1539, -0.5, 0.5);
    float _1549 = fma(_1539, 0.5, 0.5);
    float _1551 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1543);
    float _1553 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1545);
    float _1555 = exp2(_1533);
    float _1557 = fma(_1549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1559 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1551);
    float _1561 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1553);
    float _1563 = _1525 * 0.693147182464599609375;
    float _1565 = fma(_1549, _1557, -0.212114393711090087890625);
    float _1567 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1559);
    float _1569 = sqrt(_1547);
    float _1571 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = _1567 * _1541;
    float _1575 = -_1517;
    float _1577 = fma(_1555, _1535, _1575);
    float _1579 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1561);
    float _1581 = fma(_1549, _1565, 1.570728778839111328125);
    float _1583 = fma(_1573, 0.5, 0.5);
    float _1585 = fma(_1577, 0.5, 0.5);
    float _1587 = _1579 * _1541;
    float _1589 = _1569 * 0.636619746685028076171875;
    float _1591 = fma(_1587, -0.5, 0.5);
    float _1593 = -_1581;
    float _1595 = fma(_1589, _1593, 1.0);
    float3 _5514 = float3(_1583, _1591, _1571);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5514, float3(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5514, float3(0.0), isnan(_5514)), level(0.0)).x;
    float3 _5525 = float3(_1583, _1591, _1571);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _5542 = float2(_1595, _1585);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5542, float2(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5542, float2(0.0), isnan(_5542)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1622 = int(_1620);
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1626 = _1624 != 0;
    float _1628 = -_699;
    float _1630 = _1628 + 1.0;
    bool _1632 = _133 > 0.5;
    float _1634 = -_483;
    float _1636 = _1634 + 1.0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1640 = _1638 != 0;
    float _1642 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1644 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1646 = int(_1644);
    bool _1648 = _265 > 0.5;
    float _1650 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1642);
    int _1652 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1654 = _1652 != 0;
    out.m_70.x = _1283;
    out.m_70.y = _1281;
    out.m_70.z = _1285;
    bool _1656 = _261 > 0.5;
    float _1658 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1650);
    float _1660 = 0.0;
    float _1662 = _1527;
    float _1664 = _1579;
    float _1666 = _1567;
    if (_1626)
    {
        _1660 = 1.0;
    }
    float _1668 = _1660;
    float _1670 = trunc(_599);
    int _1672 = int(_1670);
    float _1674 = float(uint(_1622));
    float _1676 = _1668;
    if (!_1626)
    {
        _1676 = 1.2345600128173828125;
    }
    float _1678 = _1676;
    int _1680 = ~_1622;
    int _1682 = _1680 + 1;
    int _1684 = abs(_537);
    float _1686 = 1.0 / _1674;
    float _1688 = float(uint(_1646));
    int _1690 = ~_1646;
    int _1692 = _1690 + 1;
    int _1694 = abs(_541);
    int _1696 = abs(_1033);
    float _1698 = 1.0 / _1688;
    float _1700 = trunc(_609);
    int _1702 = int(_1700);
    int _1704 = as_type<int>(_1686) + (-2);
    float _1706 = float(uint(_1672));
    int _1708 = abs(_1055);
    int _1710 = as_type<int>(_1698) + (-2);
    float _1712 = as_type<float>(_1704) * _1706;
    int _1714 = ~_1622;
    int _1716 = _1714 + 1;
    float _1718 = trunc(_1712);
    float _1720 = precise::max(_1718, 0.0);
    uint _1723 = uint(_1720);
    float _1725 = float(uint(_1702));
    float _1727 = float(_1702);
    float _1729 = as_type<float>(_1710) * _1725;
    int _1731 = ~_1646;
    int _1733 = _1731 + 1;
    float _1735 = _1712;
    if (_1626)
    {
        _1735 = 1.0;
    }
    float _1737 = _1735;
    float _1739 = _1737;
    if (!_1626)
    {
        _1739 = 7.345489978790283203125;
    }
    float _1741 = _1739;
    float _1743 = trunc(_1729);
    float _1745 = precise::max(_1743, 0.0);
    uint _1747 = uint(_1745);
    int _1749 = _1716 * int(_1723);
    int _1751 = _1749 + _1672;
    float _1753 = _1741 * _133;
    float _1755 = float(_1646);
    float _1757 = float(uint(_1751));
    float _1759 = floor(_1753);
    int _1761 = _1733 * int(_1747);
    int _1763 = _1761 + _1702;
    float _1765 = as_type<float>(_1704) * _1757;
    float _1767 = float(uint(_1763));
    float _1769 = trunc(_1765);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    float _1775 = -_1759;
    float _1777 = _1753 + _1775;
    float _1779 = as_type<float>(_1710) * _1767;
    float _1781 = _1767;
    if (_1626)
    {
        _1781 = _133;
    }
    float _1783 = _1781;
    float _1785 = in.m_51.w;
    float _1787 = _1783;
    if (!_1626)
    {
        _1787 = _261;
    }
    float _1789 = _1787;
    float _1791 = trunc(_1779);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = _1678 * _1789;
    int _1799 = int(_1723) + int(_1773);
    float _1801 = floor(_1797);
    float _1803 = float(_1622);
    float _1805 = float(_1672);
    int _1807 = _1682 * _1799;
    int _1809 = _1807 + _1672;
    int _1811 = int(_1747) + int(_1795);
    bool _1813 = uint(_1809) >= uint(_1622);
    bool _1815 = _1805 >= _1803;
    bool _1817 = isnan(_1805);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(_1803);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    int _1827 = _1692 * _1811;
    int _1829 = _1827 + _1702;
    bool _1831 = _1785 > 0.5;
    bool _1833 = _1727 >= _1755;
    bool _1835 = isnan(_1727);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan(_1755);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    float _1845 = -_1801;
    float _1847 = _1797 + _1845;
    bool _1849 = !_1813;
    int _1851 = _1849 ? 0 : (-1);
    float _1853 = trunc(_1825);
    int _1855 = int(_1853);
    bool _1857 = uint(_1829) >= uint(_1646);
    float _1859 = _1847 * _1755;
    int _1861 = ~_1799;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = _1777 * _1803;
    bool _1869 = !_1857;
    int _1871 = _1869 ? 0 : (-1);
    float _1873 = _1803 * _675;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1877 = _1875 != 0;
    float _1879 = trunc(_1843);
    int _1881 = int(_1879);
    int _1883 = ~_1811;
    int _1885 = _1883 + _1871;
    int _1887 = _1885 + 1;
    int _1889 = _1622 * _1865;
    int _1891 = _1889 + _1672;
    bool _1893 = !_1877;
    int _1895 = _1893 ? 0 : 1;
    float _1897 = _1755 * _675;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1901 = _1899 != 0;
    int _1903 = _1646 * _1887;
    int _1905 = _1903 + _1702;
    bool _1907 = !_1640;
    int _1909 = _1907 ? 0 : 1;
    float _1911 = trunc(_1867);
    int _1913 = int(_1911);
    bool _1915 = _1622 == 0;
    bool _1917 = !_1901;
    int _1919 = _1917 ? 0 : 1;
    bool _1921 = _1646 == 0;
    bool _1923 = !_1915;
    int _1925 = _1923 ? _1891 : (-1);
    float _1927 = trunc(_1873);
    int _1929 = int(_1927);
    int _1931 = abs(_1895);
    int _1933 = ~_1881;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    bool _1939 = !_1921;
    int _1941 = _1939 ? _1905 : (-1);
    int _1943 = ~_1855;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    float _1949 = trunc(_1897);
    int _1951 = int(_1949);
    int _1953 = _1913 * _1931;
    int _1955 = _1953 + _1672;
    int _1957 = _1941 * _1937;
    int _1959 = _1646 + (-1);
    int _1961 = _1925 * _1947;
    int _1963 = _1622 + (-1);
    float _1965 = trunc(_1859);
    int _1967 = int(_1965);
    int _1969 = _1881 * _1959;
    int _1971 = _1969 + _1957;
    float _1973 = -_207;
    int _1975 = _1632 ? as_type<int>(_1973) : as_type<int>(_207);
    int _1977 = _1855 * _1963;
    int _1979 = _1977 + _1961;
    int _1981 = abs(_547);
    bool _1983 = !_1654;
    float _1985 = _1983 ? _207 : as_type<float>(_1975);
    int _1987 = _1979 * _1684;
    int _1989 = abs(_1919);
    int _1991 = _1971 * _1696;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1995 = _1993 != 0;
    int _1997 = _1929 * _1694;
    int _1999 = _1997 + _1987;
    int _2001 = abs(_1909);
    float _2003 = _1985 + 0.5;
    int _2005 = abs(_1037);
    int _2007 = _1955 * _1981;
    int _2009 = _2007 + _1999;
    int _2011 = ~_1622;
    int _2013 = _2011 + 1;
    int _2015 = _1967 * _1989;
    int _2017 = _2015 + _1702;
    float _2019 = -_211;
    int _2021 = _1656 ? as_type<int>(_2019) : as_type<int>(_211);
    int _2023 = _1951 * _2005;
    int _2025 = _2023 + _1991;
    float _2027 = fma(_2003, (*spvDescriptorSet0.vp_c9)._m0[80].x, _437);
    int _2029 = _1913 * _2001;
    int _2031 = _2029 + _2009;
    bool _2033 = !_1995;
    float _2035 = _2033 ? _211 : as_type<float>(_2021);
    float _2037 = float(uint(_1955));
    int _2039 = abs(_1051);
    float _2041 = _2035 + (-0.5);
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2045 = _2043 != 0;
    float _2047 = as_type<float>(_1704) * _2037;
    float _2049 = float(uint(_2031));
    float _2051 = -_2041;
    float _2053 = -_447;
    float _2055 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2053);
    int _2057 = _2017 * _2039;
    int _2059 = _2057 + _2025;
    float _2061 = -_207;
    int _2063 = _1648 ? as_type<int>(_2061) : as_type<int>(_207);
    float _2065 = as_type<float>(_1704) * _2049;
    float _2067 = trunc(_2047);
    float _2069 = precise::max(_2067, 0.0);
    uint _2071 = uint(_2069);
    int _2073 = _1967 * _1708;
    int _2075 = _2073 + _2059;
    bool _2077 = !_2045;
    float _2079 = _2077 ? _207 : as_type<float>(_2063);
    float _2081 = fma(_2035, _1630, _2055);
    float _2083 = float(uint(_2017));
    float _2085 = float(uint(_2075));
    float _2087 = _2079 + 0.5;
    float _2089 = trunc(_2065);
    float _2091 = precise::max(_2089, 0.0);
    uint _2093 = uint(_2091);
    float _2095 = as_type<float>(_1710) * _2083;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2099 = _2097 != 0;
    float _2101 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[85].x, _703);
    float _2103 = -_211;
    int _2105 = _1831 ? as_type<int>(_2103) : as_type<int>(_211);
    float _2107 = trunc(_2095);
    float _2109 = precise::max(_2107, 0.0);
    uint _2111 = uint(_2109);
    float _2113 = as_type<float>(_1710) * _2085;
    bool _2115 = !_2099;
    float _2117 = _2115 ? _211 : as_type<float>(_2105);
    int _2119 = _2013 * int(_2071);
    int _2121 = _2119 + _1955;
    int _2123 = ~_1646;
    int _2125 = _2123 + 1;
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2129 = _2127 != 0;
    float _2131 = _2117 + (-0.5);
    float _2133 = trunc(_2113);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = _2013 * int(_2093);
    int _2141 = _2139 + _2031;
    float _2143 = float(uint(_2121));
    float _2145 = -_679;
    float _2147 = _2145 + 1.0;
    float _2149 = -_2131;
    float _2151 = -_705;
    float _2153 = fma(_2149, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2151);
    int _2155 = ~_1646;
    int _2157 = _2155 + 1;
    float _2159 = float(uint(_2141));
    int _2161 = _2125 * int(_2111);
    int _2163 = _2161 + _2017;
    float _2165 = -_2147;
    float _2167 = fma(_1985, _2165, _2027);
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2171 = _2169 != 0;
    float _2173 = as_type<float>(_1704) * _2143;
    float _2175 = as_type<float>(_1704) * _2159;
    float _2177 = float(uint(_2163));
    int _2179 = ~_1622;
    int _2181 = _2179 + 1;
    int _2183 = _2157 * int(_2137);
    int _2185 = _2183 + _2075;
    float _2187 = trunc(_2175);
    float _2189 = precise::max(_2187, 0.0);
    uint _2191 = uint(_2189);
    float _2193 = as_type<float>(_1710) * _2177;
    float _2195 = -_697;
    float _2197 = _2195 + 1.0;
    float _2199 = -_1636;
    float _2201 = fma(_2079, _2199, _2101);
    float _2203 = float(uint(_2185));
    float _2205 = fma(_2117, _2197, _2153);
    float _2207 = _923 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2209 = trunc(_2173);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = as_type<float>(_1710) * _2203;
    out.m_72.x = _2167;
    out.m_72.y = _2081;
    out.m_72.z = _2201;
    out.m_72.w = _2205;
    float _2217 = trunc(_2215);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    int _2223 = int(_2093) + int(_2191);
    float _2225 = _923 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2227 = _923 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2229 = _2181 * _2223;
    int _2231 = _2229 + _2031;
    float _2233 = -_911;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2225);
    float _2237 = -_911;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2207);
    int _2241 = ~_1646;
    int _2243 = _2241 + 1;
    float _2245 = -_911;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2227);
    bool _2249 = uint(_2231) >= uint(_1622);
    float _2251 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2239);
    float _2253 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2235);
    int _2255 = int(_2137) + int(_2221);
    float _2257 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2259 = !_2249;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2265 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2267 = _2243 * _2255;
    int _2269 = _2267 + _2075;
    int _2271 = ~_2223;
    int _2273 = _2271 + _2261;
    int _2275 = _2273 + 1;
    float _2277 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2257);
    float _2279 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2281 = trunc(_2193);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    bool _2287 = uint(_2269) >= uint(_1646);
    int _2289 = _1622 * _2275;
    int _2291 = _2289 + _2031;
    int _2293 = int(_2071) + int(_2213);
    float _2295 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2297 = !_2287;
    int _2299 = _2297 ? 0 : (-1);
    float _2301 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2303 = !_1915;
    int _2305 = _2303 ? _2291 : (-1);
    float _2307 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2247);
    int _2309 = ~_2255;
    int _2311 = _2309 + _2299;
    int _2313 = _2311 + 1;
    float _2315 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2295);
    int _2317 = _2305 >> 31;
    float _2319 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2301);
    int _2321 = _2305 & 3;
    bool _2323 = _2321 != 0;
    int _2325 = _1646 * _2313;
    int _2327 = _2325 + _2075;
    int _2329 = _2317 & 3;
    float _2331 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2333 = _2305 & 3;
    bool _2335 = _2333 != 0;
    float _2337 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2263);
    bool _2339 = !_1921;
    int _2341 = _2339 ? _2327 : (-1);
    float _2343 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2265);
    int _2345 = ~_1622;
    int _2347 = _2345 + 1;
    float _2349 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2277);
    int _2351 = _2305 + _2329;
    float _2353 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2315);
    int _2355 = _2341 >> 31;
    int _2357 = _2347 * _2293;
    int _2359 = _2357 + _1955;
    int _2361 = _2351 >> 2;
    float _2363 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2279);
    int _2365 = _2355 & 3;
    float _2367 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2319);
    bool _2369 = uint(_2321) > 1u;
    float _2371 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2373 = _2361 << 4;
    int _2375 = _2373 + 368;
    int _2377 = _2335 ? 0 : 1;
    bool _2379 = uint(_2359) >= uint(_1622);
    int _2381 = _2341 + _2365;
    uint _2383 = uint(int(uint(_2375) >> uint(2)));
    uint _2385 = uint(int(uint(int(_2383)) >> uint(2)));
    int _2387 = int(_2383) & 3;
    float _2389 = (*spvDescriptorSet0.vp_c9)._m0[int(_2385)][_2387];
    int _2391 = int(_2383) + 1;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    int _2395 = _2391 & 3;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[int(_2393)][_2395];
    int _2399 = int(_2111) + int(_2285);
    int _2401 = ~_1646;
    int _2403 = _2401 + 1;
    int _2405 = ~_2377;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    int _2411 = _2409;
    if (!_2369)
    {
        int _2413 = ~_2377;
        int _2415 = _2413 + 1;
        _2411 = _2415;
    }
    int _2417 = _2411;
    int _2419 = _2403 * _2399;
    int _2421 = _2419 + _2017;
    int _2423 = _2381 >> 2;
    float _2425 = _2331 * _2253;
    bool _2427 = uint(_2321) >= 2u;
    float _2429 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2337);
    int _2431 = _2423 << 4;
    int _2433 = _2431 + 512;
    float _2435 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2343);
    int _2437 = _2427 ? 0 : 1;
    float _2439 = fma(_2371, _2429, _2425);
    bool _2441 = uint(_2421) >= uint(_1646);
    float _2443 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2363);
    bool _2445 = !_2379;
    int _2447 = _2445 ? 0 : (-1);
    uint _2449 = uint(int(uint(_2433) >> uint(2)));
    uint _2451 = uint(int(uint(int(_2449)) >> uint(2)));
    int _2453 = int(_2449) & 3;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[int(_2451)][_2453];
    int _2457 = int(_2449) + 1;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    int _2461 = _2457 & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    bool _2465 = _2321 != 3;
    float _2467 = _2331 * _2251;
    bool _2469 = !_2441;
    int _2471 = _2469 ? 0 : (-1);
    out.m_74.x = _2429;
    out.m_74.y = _2435;
    out.m_74.z = _2443;
    int _2473 = ~_2293;
    int _2475 = _2473 + _2447;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2371, _2435, _2467);
    bool _2481 = !_2323;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2375 + 8;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    uint _2489 = uint(int(uint(int(_2487)) >> uint(2)));
    int _2491 = int(_2487) & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    int _2495 = int(_2487) + 1;
    uint _2497 = uint(int(uint(_2495) >> uint(2)));
    int _2499 = _2495 & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = _2341 & 3;
    bool _2505 = _2503 != 0;
    int _2507 = _1622 * _2477;
    int _2509 = _2507 + _1955;
    int _2511 = ~_2399;
    int _2513 = _2511 + _2471;
    int _2515 = _2513 + 1;
    float _2517 = _2353 + _2479;
    int _2519 = ~_2437;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    int _2525 = _2523;
    if (_2465)
    {
        int _2527 = ~_2437;
        int _2529 = _2527 + 1;
        _2525 = _2529;
    }
    int _2531 = _2525;
    int _2533 = _2433 + 8;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    uint _2537 = uint(int(uint(int(_2535)) >> uint(2)));
    int _2539 = int(_2535) & 3;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[int(_2537)][_2539];
    int _2543 = int(_2535) + 1;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    int _2547 = _2543 & 3;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[int(_2545)][_2547];
    bool _2551 = uint(_2503) > 1u;
    int _2553 = _1646 * _2515;
    int _2555 = _2553 + _2017;
    int _2557 = _2341 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = _2331 * _2307;
    bool _2563 = !_2505;
    int _2565 = _2563 ? 0 : 1;
    int _2567 = _2559 ? 0 : 1;
    float _2569 = fma(_2371, _2443, _2561);
    int _2571 = abs(_2417);
    int _2573 = ~_2567;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    float _2579 = _2367 + _2569;
    int _2581 = abs(_2483);
    int _2583 = _2577;
    if (!_2551)
    {
        int _2585 = ~_2567;
        int _2587 = _2585 + 1;
        _2583 = _2587;
    }
    int _2589 = _2583;
    int _2591 = ~_2571;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    bool _2597 = _2503 != 3;
    bool _2599 = uint(_2503) >= 2u;
    int _2601 = _2595 * as_type<int>(_2397);
    int _2603 = _2599 ? 0 : 1;
    int _2605 = ~_2581;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2589);
    int _2613 = abs(_2531);
    int _2615 = _2609 * as_type<int>(_2389);
    int _2617 = _2615 + _2601;
    int _2619 = ~_2603;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    int _2625 = _2623;
    if (_2597)
    {
        int _2627 = ~_2603;
        int _2629 = _2627 + 1;
        _2625 = _2629;
    }
    int _2631 = _2625;
    int _2633 = abs(_2565);
    int _2635 = ~_2611;
    int _2637 = _2635 + 1;
    int _2639 = _2637 + 1;
    int _2641 = ~_2613;
    int _2643 = _2641 + 1;
    int _2645 = _2643 + 1;
    bool _2647 = _2321 != 3;
    int _2649 = _2639 * as_type<int>(_2463);
    bool _2651 = _2503 != 3;
    int _2653 = _2645 * as_type<int>(_2493);
    int _2655 = _2653 + _2617;
    int _2657 = abs(_2631);
    int _2659 = ~_2633;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    bool _2665 = !_2647;
    int _2667 = _2665 ? 0 : (-1);
    bool _2669 = !_2651;
    int _2671 = _2669 ? 0 : (-1);
    int _2673 = _2663 * as_type<int>(_2455);
    int _2675 = _2673 + _2649;
    int _2677 = ~_2657;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    float _2683 = fma(_2331, _2331, 1.0);
    bool _2685 = !_2129;
    int _2687 = _2685 ? 0 : 1;
    int _2689 = abs(_2667);
    int _2691 = _2681 * as_type<int>(_2541);
    int _2693 = _2691 + _2675;
    bool _2695 = !_2171;
    int _2697 = _2695 ? 0 : 1;
    float _2699 = rsqrt(_2683);
    int _2701 = abs(_2671);
    int _2703 = abs(_2687);
    int _2705 = abs(_2697);
    int _2707 = ~_2701;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = _2711 * as_type<int>(_2549);
    int _2715 = _2713 + _2693;
    int _2717 = ~_2705;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    int _2723 = ~_2689;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    float _2729 = _2331 * _2699;
    int _2731 = ~_2703;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = _2715 * _2721;
    float _2739 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2741 = _2727 * as_type<int>(_2501);
    int _2743 = _2741 + _2655;
    bool _2745 = !_1915;
    int _2747 = _2745 ? _2509 : (-1);
    float _2749 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1658);
    bool _2751 = !_1921;
    int _2753 = _2751 ? _2555 : (-1);
    int _2755 = _2743 * _2735;
    float _2757 = exp2(_2739);
    float _2759 = -_2353;
    float _2761 = _2729 * _2759;
    float _2763 = _1567 + _1527;
    int _2765 = _2747 * _2703;
    int _2767 = _2765 + _2755;
    float _2769 = -_2349;
    float _2771 = _2729 * _2769;
    float _2773 = -_2367;
    float _2775 = _2729 * _2773;
    int _2777 = _2753 * _2705;
    int _2779 = _2777 + _2737;
    float _2781 = fma(_2699, _2251, _2761);
    float _2783 = fma(_2699, _2253, _2771);
    float _2785 = fma(_2699, _2307, _2775);
    float _2787 = _1527 * 0.5;
    float _2789 = float(_2767);
    float _2791 = _2749 + _1527;
    float _2793 = float(_2779);
    float _2795 = fma(_1579, -0.5, _2787);
    float _2797 = -_2757;
    float _2799 = _2797 + 1.0;
    float _2801 = _2791 * 0.5;
    out.m_76.x = _2789;
    out.m_76.y = _2793;
    float _2803 = _2763 * 0.5;
    float _2805 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2807 = _2349 + _2439;
    out.m_78.x = _2783;
    out.m_78.y = _2781;
    out.m_78.z = _2785;
    bool _2809 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2811 = isnan(_1307);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2817 = _2813 || _2815;
    float _2819 = _2805 * _1597;
    float _2821 = -_2805;
    float _2823 = _2821 + 1.0;
    out.m_80.x = _2803;
    out.m_80.y = _2795;
    out.m_80.z = _2801;
    out.m_80.w = _1527;
    float _2825 = _1608 * _2819;
    float _2827 = _1618 * _2819;
    float _2829 = _1608 * _2823;
    out.m_82.x = _2807;
    out.m_82.y = _2517;
    out.m_82.z = _2579;
    float _2831 = fma(_1614, _2825, _1602);
    float _2833 = fma(_1616, _2825, _1604);
    float _2835 = fma(_1608, _2827, _1606);
    out.gl_Position.x = _1567;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _2749;
    out.gl_Position.w = _1527;
    float _2837 = _1604;
    float _2839 = _1602;
    float _2841 = _2749;
    if (!_2817)
    {
        _2837 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2843 = _2837;
    float _2845 = _2843;
    float _2847 = _2843;
    if (!_2817)
    {
        _2839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2849 = _2839;
    out.m_84.x = _2831;
    out.m_84.y = _2833;
    out.m_84.z = _2835;
    out.m_84.w = _2829;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2817)
    {
        _1662 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2855 = _1662;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2817)
    {
        _2841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2861 = _2841;
    float _2863 = _2861;
    float _2865 = _2861;
    if (!_2817)
    {
        _1664 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2867 = _1664;
    float _2869 = _2867;
    float _2871 = _2867;
    if (!_2817)
    {
        _1666 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2873 = _1666;
    bool _2875 = !_2817;
    float _2877 = _2873;
    float _2879 = _2873;
    if (!_2875)
    {
        bool _2881 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2883 = isnan(_1307);
        bool _2885 = _2881 || _2883;
        bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2889 = _2885 || _2887;
        if (!_2889)
        {
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2893 = _1307 + _2891;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2897 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2895;
            float _2899 = 1.0 / _2897;
            float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2909 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2911 = _2909 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2921 = _2893 * _2899;
            float _2923 = precise::clamp(_2921, 0.0, 1.0);
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2929 = fma(_2923, _2903, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2931 = fma(_2923, _2927, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2933 = fma(_2923, _2907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2935 = fma(_2923, _2911, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2937 = fma(_2923, _2915, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2939 = fma(_2923, _2919, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2853 = _2931;
            _2871 = _2937;
            _2847 = _2929;
            _2865 = _2935;
            _2859 = _2933;
            _2879 = _2939;
            _2941 = true;
        }
        else
        {
            bool _2943 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2945 = isnan(_1307);
            bool _2947 = _2943 || _2945;
            bool _2949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2951 = _2947 || _2949;
            if (!_2951)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2953 = _2845;
            _2847 = _2953;
            if (!_2951)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2955 = _2851;
            _2853 = _2955;
            if (!_2951)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2957 = _2857;
            _2859 = _2957;
            if (!_2951)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2959 = _2863;
            _2865 = _2959;
            if (!_2951)
            {
                _2869 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2961 = _2869;
            _2871 = _2961;
            if (!_2951)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2963 = _2877;
            bool _2965 = !_2951;
            _2879 = _2963;
            if (!_2965)
            {
                bool _2967 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2969 = isnan(_1307);
                bool _2971 = _2967 || _2969;
                bool _2973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2975 = _2971 || _2973;
                if (!_2975)
                {
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2979 = _1307 + _2977;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2983 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2981;
                    float _2985 = 1.0 / _2983;
                    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3007 = _2979 * _2985;
                    float _3009 = precise::clamp(_3007, 0.0, 1.0);
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3015 = fma(_3009, _2989, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3017 = fma(_3009, _3013, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3019 = fma(_3009, _2993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3021 = fma(_3009, _2997, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3023 = fma(_3009, _3001, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3025 = fma(_3009, _3005, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2853 = _3017;
                    _2871 = _3023;
                    _2847 = _3015;
                    _2865 = _3021;
                    _2859 = _3019;
                    _2879 = _3025;
                    _2941 = true;
                }
                else
                {
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2871 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2941 = false;
    float _3027 = _2853;
    float _3029 = _2871;
    float _3031 = _2847;
    float _3033 = _2865;
    float _3035 = _2859;
    float _3037 = _2879;
    float _3039 = fma(_2517, -0.5, 0.5);
    float _3041 = precise::clamp(_3039, 0.0, 1.0);
    float _3043 = -_3027;
    float _3045 = _3043 + _3029;
    float _3047 = -_3031;
    float _3049 = _3047 + _3033;
    float _3051 = -_3035;
    float _3053 = _3051 + _3037;
    bool _3055 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3057 = fma(_3041, _3045, _3027);
    float _3059 = fma(_3041, _3049, _3031);
    float _3061 = fma(_3041, _3053, _3035);
    float _3063 = _3057 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3065 = fma(_3059, 0.298911988735198974609375, _3063);
    float _3067 = fma(_3061, 0.114477999508380889892578125, _3065);
    out.m_86.x = 0.0;
    float _3069 = -_3067;
    float _3071 = _3059 + _3069;
    float _3073 = -_3067;
    float _3075 = _3057 + _3073;
    float _3077 = -_3067;
    float _3079 = _3061 + _3077;
    float _3081 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3083 = fma(_3071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    float _3085 = fma(_3075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    float _3087 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    out.m_88.w = _3081;
    out.m_90.x = _3083;
    out.m_90.y = _3085;
    out.m_90.z = _3087;
    if (!_3055)
    {
        return out;
    }
    float _3089 = -_1281;
    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3093 = -_1283;
    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3097 = -_1285;
    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3101 = _3091 * _3091;
    float _3103 = fma(_3095, _3095, _3101);
    float _3105 = fma(_3099, _3099, _3103);
    float _3107 = sqrt(_3105);
    float _3109 = rsqrt(_3105);
    float _3111 = -_3107;
    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = _3095 * _3109;
    float _3121 = _3091 * _3109;
    float _3123 = abs(_3117);
    float _3125 = log2(_3123);
    float _3127 = _3099 * _3109;
    float _3129 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3131 = _2517 * _3121;
    float _3133 = -_3121;
    float _3135 = -_3129;
    float _3137 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3135);
    float _3139 = fma(_2807, _3119, _3131);
    float _3141 = -_3127;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3137);
    float _3145 = fma(_2579, _3127, _3139);
    float _3147 = precise::clamp(_3145, 0.0, 1.0);
    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3151 = _3143 + _3149;
    float _3153 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3157 = precise::clamp(_3155, 0.0, 1.0);
    float _3159 = exp2(_3153);
    float _3161 = _3159 * _3157;
    float _3163 = _3147 * _3161;
    float _3165 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3169 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3165;
    out.m_86.y = _3167;
    out.m_86.z = _3169;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2941 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3228 = as_type<float>(_127);
        out.gl_Position.z = _3228;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_49.w;
    float _133 = in.m_51.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_109);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _121;
    if (_161)
    {
        out.m_47.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3301 = as_type<float>(_167);
        out.gl_Position.z = _3301;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_175, _181, _217);
    float _225 = fma(_171, _189, _219);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _225);
    bool _231 = !_203;
    float _233 = _187;
    float _249;
    if (!_231)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_109);
        float _255 = 1.0 / _253;
        float _257 = _147 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = in.m_51.y;
    float _263 = _133 * 2.0;
    float _265 = in.m_51.z;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = floor(_263);
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _283 = _281 != 0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _259 + _285;
    float _289 = 1.0 / _269;
    float _291 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    float _297 = -_279;
    float _299 = fma(_291, 2.0, _297);
    float _301 = 1.0 / _273;
    float _303 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _305 = _261 * 2.0;
    bool _307 = _275 > 0.0;
    float _309 = _265 * 2.0;
    float _311 = fma(_303, -2.0, _277);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _259 + _313;
    float _317 = 1.0 / _295;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _259 + _319;
    bool _323 = _275 >= 0.0;
    bool _325 = isnan(_275);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = _315 * _289;
    float _335 = _133 + _261;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _339 = floor(_305);
    float _341 = _321 * _301;
    float _343 = _265 + _261;
    float _345 = _335 + (-1.0);
    float _347 = _133 + _265;
    float _349 = _343 + (-1.0);
    float _351 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _353 = floor(_309);
    int _355 = as_type<int>(_345);
    float _357 = _341;
    if (_283)
    {
        _355 = 0;
    }
    int _359 = _355;
    float _361 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _363 = _359;
    if (!_283)
    {
        _363 = 1;
    }
    int _365 = _363;
    float _367 = _287 * _317;
    int _369 = _331 ? 0 : 1;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    bool _375 = _365 != 1;
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _379 = int(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _385 = _339 > 0.0;
    float _387 = fma(_373, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _389 = _339 >= 0.0;
    bool _391 = isnan(_339);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _407 = _353 > 0.0;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    bool _413 = _353 >= 0.0;
    bool _415 = isnan(_353);
    bool _417 = _413 || _415;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    float _423 = fma(_401, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _425 = fma(_383, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _427 = fma(_405, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _429 = _421 ? 0 : 1;
    float _431 = _347 + (-1.0);
    if (!_375)
    {
        _357 = _261;
    }
    float _433 = _357;
    float _435 = -_147;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[76].x, _299);
    float _439 = _433;
    if (_375)
    {
        _439 = _133;
    }
    float _441 = _439;
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _445 = _397 ? 0 : 1;
    float _447 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _311);
    int _449 = ~_429;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    int _455 = _453;
    if (!_407)
    {
        int _457 = ~_429;
        int _459 = _457 + 1;
        _455 = _459;
    }
    int _461 = _455;
    float _463 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[83].z, _337);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    int _477 = ~_445;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    int _485 = ~_369;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    int _491 = _481;
    int _493 = _489;
    if (!_385)
    {
        int _495 = ~_445;
        int _497 = _495 + 1;
        _491 = _497;
    }
    int _499 = _491;
    if (!_307)
    {
        int _501 = ~_369;
        int _503 = _501 + 1;
        _493 = _503;
    }
    int _505 = _493;
    float _507 = float(_411);
    float _509 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _511 = log2(_509);
    float _513 = float(_109);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _517 = float(_379);
    float _519 = as_type<float>(_411);
    if (!_375)
    {
        _519 = _261;
    }
    float _521 = _519;
    float _523 = 1.0 / _513;
    float _525 = _521;
    if (!_375)
    {
        _117 = _265;
    }
    float _527 = _117;
    float _529 = _527;
    if (_375)
    {
        _525 = _133;
    }
    float _531 = _525;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _535 = !_471;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_467;
    int _541 = _539 ? 0 : 1;
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _545 = !_475;
    int _547 = _545 ? 0 : 1;
    float _549 = 1.0 / _507;
    if (_375)
    {
        _529 = _261;
    }
    float _551 = _529;
    float _553 = -_533;
    float _555 = fma(_543, 2.0, _553);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    float _569 = float(_505);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[83].w, _515);
    float _573 = _551;
    if (!_375)
    {
        _573 = _265;
    }
    float _575 = _573;
    float _577 = 1.0 / _517;
    bool _579 = !_567;
    int _581 = _579 ? 0 : 1;
    float _583 = _575;
    if (_375)
    {
        _583 = _261;
    }
    float _585 = _583;
    bool _587 = !_563;
    int _589 = _587 ? 0 : 1;
    bool _591 = !_559;
    int _593 = _591 ? 0 : 1;
    float _595 = _585 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _597 = abs(_581);
    float _599 = _549 * _147;
    int _601 = abs(_589);
    float _603 = _511 * _147;
    int _605 = abs(_593);
    float _607 = float(_499);
    float _609 = _577 * _147;
    float _611 = float(_597);
    float _613 = exp2(_603);
    float _615 = float(_605);
    float _617 = float(_461);
    float _619 = _611 * _607;
    float _621 = float(_601);
    float _623 = _615 * _617;
    float _625 = in.m_66.x;
    float _627 = in.m_66.y;
    float _629 = in.m_66.z;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _633 = 1.0 + _631;
    float _635 = _621 * _569;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _639 = -_613;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _633;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _647 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _649 = isnan(1.0);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _655 = _651 || _653;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _659 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _661 = isnan(0.0);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _667 = _663 || _665;
    float _669 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _645);
    float _671 = _635 * (-2.0);
    float _673 = fma(_595, -2.0, _637);
    float _675 = _523 * _147;
    float _677 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _657);
    float _679 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _669);
    float _681 = _667 ? _641 : 0.0;
    float _683 = fma(_361, _671, _361);
    bool _685 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _687 = isnan(_259);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _571);
    float _699 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _677);
    float _701 = -_147;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[81].x, _555);
    float _705 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _673);
    if (_655)
    {
        float _707 = _681 * _643;
        _151 = _707;
    }
    float _709 = _151;
    float _711 = _623 * (-2.0);
    float _713 = fma(_671, _627, _627);
    float _715 = _261 + (-0.5);
    bool _717 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_259);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_695;
    float _731 = _729 + 1.0;
    float _733 = fma(_351, _711, _351);
    float _735 = fma(_711, _625, _625);
    float _737 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _739 = _619 * (-2.0);
    bool _741 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _743 = isnan(_259);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _727 * _731;
    float _755 = -_727;
    float _757 = _755 + 1.0;
    float _759 = fma(_443, _739, _443);
    bool _761 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_259);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = fma(_739, _629, _629);
    float _775 = _751 * _757;
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = _133 + (-0.5);
    float _783 = _265 + (-0.5);
    float _785 = fma(_683, _709, _737);
    float _787 = _771 * _779;
    float _789 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[196].x, _735);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _773);
    float _793 = _785 * 0.15915493667125701904296875;
    float _795 = _423 * _787;
    float _797 = _387 * _787;
    float _799 = fma(_733, _709, _789);
    float _801 = fma(_759, _709, _791);
    float _803 = in.m_68.x;
    float _805 = in.m_68.y;
    float _807 = -_771;
    float _809 = _807 + 1.0;
    float _811 = _799 * 0.15915493667125701904296875;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = in.m_44.x;
    float _819 = in.m_44.y;
    float _821 = in.m_44.z;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _823;
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[143].x, _797);
    float _829 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[143].y, _795);
    float _831 = fma(_815, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _833 = fma(_825, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _835 = fma(_425, _775, _827);
    float _837 = fma(_427, _775, _829);
    float _839 = _801 * 0.15915493667125701904296875;
    float _841 = _793 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_831, _753, _835);
    float _847 = fma(_833, _753, _837);
    float _849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _851 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[146].x, _845);
    float _853 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[146].y, _847);
    float _855 = _793 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _853 * _805;
    float _861 = _851 * _803;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _865 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _869 = _811 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _191 * _819;
    float _875 = _865 * _849;
    float _877 = _867 * _863;
    float _879 = _179 * _819;
    float _881 = fma(_189, _817, _873);
    float _883 = _185 * _819;
    float _885 = in.m_60.w;
    float _887 = _839 * 6.283185482025146484375;
    float _889 = cos(_887);
    float _891 = fma(_177, _817, _879);
    float _893 = fma(_193, _821, _881);
    float _895 = fma(_183, _817, _883);
    float _897 = fma(_181, _821, _891);
    float _899 = fma(_187, _821, _895);
    float _901 = _811 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _871 * _843;
    float _907 = _871 * _857;
    float _909 = _839 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _871 * _889;
    float _915 = _843 * _889;
    float _917 = _913 * _875;
    float _919 = _897 + _885;
    float _921 = _903 * _857;
    float _923 = _903 * _889;
    float _925 = _903 * _843;
    float _927 = _857 * _889;
    float _929 = in.m_64.w;
    float _931 = _923 * _875;
    float _933 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = fma(_911, _921, _905);
    float _937 = -_875;
    float _939 = _911 * _937;
    float _941 = -_907;
    float _943 = fma(_911, _925, _941);
    float _945 = -_925;
    float _947 = fma(_911, _907, _945);
    float _949 = fma(_935, _877, _931);
    float _951 = fma(_927, _877, _939);
    float _953 = fma(_911, _905, _921);
    float _955 = fma(_947, _877, _917);
    float _957 = fma(_943, _933, _949);
    float _959 = fma(_915, _933, _951);
    float _961 = fma(_953, _933, _955);
    float _963 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _963);
    float _971 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _973 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _975 = in.m_62.w;
    float _977 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    float _979 = _893 + _929;
    float _981 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _971);
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _973);
    float _985 = _977 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _991 = _979 + _985;
    float _993 = _919 + _987;
    float _995 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _997 = _991 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1001 = _993 + _999;
    float _1003 = _997 * _997;
    float _1005 = fma(_1001, _1001, _1003);
    float _1007 = _899 + _975;
    float _1009 = sqrt(_1005);
    float _1011 = _1007 + _989;
    bool _1013 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1029 = _1027 != 0;
    bool _1031 = !_1021;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_1017;
    int _1037 = _1035 ? 0 : 1;
    float _1039 = _993;
    float _1041 = _817;
    float _1043 = _997;
    float _1045 = _983;
    if (!_1013)
    {
        _233 = _993;
    }
    float _1047 = _233;
    bool _1049 = !_1025;
    int _1051 = _1049 ? 0 : 1;
    bool _1053 = !_1029;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = _1047;
    if (!_1013)
    {
        _1039 = _991;
    }
    float _1059 = _1039;
    float _1061 = _1059;
    if (!_1013)
    {
        _1041 = _1011;
    }
    float _1063 = _1041;
    bool _1065 = !_1013;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1073 = _1009 + _1071;
        float _1075 = rsqrt(_1005);
        float _1077 = _1073 * _1069;
        float _1079 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = _1077 * 0.15915493667125701904296875;
        float _1083 = _1081 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 + (-1.0);
        float _1093 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = _1075 * _1093;
        float _1099 = fma(_1011, _1085, _1095);
        float _1101 = fma(_1001, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_997, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1099;
        _1057 = _1101;
        _1061 = _1103;
    }
    float _1105 = _1067;
    float _1107 = _1057;
    float _1109 = _1061;
    float _1111 = -_1007;
    float _1113 = _1111 + _1105;
    float _1115 = -_919;
    float _1117 = _1115 + _1107;
    float _1119 = -_979;
    float _1121 = _1119 + _1109;
    float _1123 = _1113 * _1113;
    bool _1125 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1127 = isnan(0.5);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1133 = _1129 || _1131;
    float _1135 = fma(_1117, _1117, _1123);
    float _1137 = fma(_1121, _1121, _1135);
    float _1139 = sqrt(_1137);
    bool _1141 = _1139 > 0.0;
    bool _1143 = !_1141;
    float _1145 = _1107;
    float _1147 = _1105;
    float _1149 = _1109;
    float _1151 = _1139;
    float _1153 = _1137;
    if (!_1143)
    {
        float _1155 = _227 * _227;
        float _1157 = fma(_223, _223, _1155);
        float _1159 = fma(_229, _229, _1157);
        float _1161 = rsqrt(_1137);
        float _1163 = sqrt(_1159);
        float _1165 = _1113 * _1161;
        float _1167 = _1121 * _1161;
        bool _1169 = _1163 > 0.0;
        float _1171 = _1117 * _1161;
        bool _1173 = !_1169;
        _1043 = _1159;
        _1151 = _1161;
        _1045 = _1167;
        if (!_1173)
        {
            float _1175 = rsqrt(_1159);
            float _1177 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1179 = _227 * _1175;
            float _1181 = _223 * _1175;
            float _1183 = _229 * _1175;
            float _1185 = _1165 * _1179;
            float _1187 = fma(_1171, _1181, _1185);
            float _1189 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1191 = fma(_1167, _1183, _1187);
            float _1193 = _1191 * _1189;
            float _1195 = fma(_223, _1193, _1107);
            float _1197 = fma(_227, _1193, _1105);
            float _1199 = fma(_229, _1193, _1109);
            _1145 = _1195;
            _1147 = _1197;
            _1149 = _1199;
            _1151 = _1193;
            _1153 = _1181;
        }
    }
    float _1201 = _1145;
    float _1203 = _1147;
    float _1205 = _1149;
    float _1207 = _1043;
    float _1209 = _1151;
    float _1211 = _1153;
    float _1213 = _1045;
    float _1215 = _1209;
    float _1217 = _1207;
    float _1219 = _1211;
    float _1221 = _1205;
    float _1223 = _1213;
    if (_1133)
    {
        _1215 = _1201;
    }
    float _1225 = _1215;
    float _1227 = _1225;
    if (_1133)
    {
        _1217 = _1203;
    }
    float _1229 = _1217;
    float _1231 = _1229;
    if (_1133)
    {
        _1219 = _1205;
    }
    float _1233 = _1219;
    float _1235 = _1233;
    if (!_1133)
    {
        float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1239 = _1007 + _1237;
        float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1243 = _919 + _1241;
        float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1247 = -_979;
        float _1249 = _1247 + _1205;
        float _1251 = _1239 * _1239;
        float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1255 = _979 + _1253;
        float _1257 = fma(_1243, _1243, _1251);
        float _1259 = fma(_1255, _1255, _1257);
        float _1261 = -_919;
        float _1263 = _1261 + _1201;
        float _1265 = sqrt(_1259);
        float _1267 = precise::min(_1265, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1269 = _1267 * _1245;
        float _1271 = -_1007;
        float _1273 = _1271 + _1203;
        float _1275 = fma(_1263, _1269, _919);
        float _1277 = fma(_1273, _1269, _1007);
        float _1279 = fma(_1249, _1269, _979);
        _1231 = _1277;
        _1227 = _1275;
        _1235 = _1279;
    }
    float _1281 = _1231;
    float _1283 = _1227;
    float _1285 = _1235;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1281 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1283 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1297 = _1285 + _1295;
    float _1299 = _1289 * _1289;
    float _1301 = fma(_1293, _1293, _1299);
    float _1303 = fma(_1297, _1297, _1301);
    float _1305 = rsqrt(_1303);
    float _1307 = sqrt(_1303);
    float _1309 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1311 = _1293 * _1309;
    float _1313 = _1297 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 * _1313;
    float _1319 = _1315 + _1317;
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1321 + _1325;
    float _1329 = _919;
    float _1331 = _1327;
    float _1333 = _1289;
    float _1335 = _1311;
    if (_1323)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1337;
    }
    float _1339 = _1329;
    float _1341 = _1339;
    if (_1323)
    {
        float _1343 = _1327 * _1339;
        _1331 = _1343;
    }
    float _1345 = _1331;
    if (_1323)
    {
        float _1347 = rsqrt(_1319);
        _1341 = _1347;
    }
    float _1349 = _1341;
    float _1351 = _1349;
    if (_1323)
    {
        float _1353 = _1345 * 0.15915493667125701904296875;
        _1221 = _1353;
    }
    float _1355 = _1221;
    float _1357 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1359 = _1297;
    if (_1323)
    {
        float _1361 = _1355 * 6.283185482025146484375;
        float _1363 = sin(_1361);
        _1359 = _1363;
    }
    float _1365 = _1359;
    float _1367 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1369 = precise::max(0.0, _1357);
    float _1371 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1367);
    float _1373 = _979;
    float _1375 = _1369;
    if (_1323)
    {
        float _1377 = _1355 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = -_1309;
    float _1385 = -_1369;
    float _1387 = fma(_1289, _1383, _1385);
    float _1389 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1371);
    if (_1323)
    {
        float _1391 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1391;
    }
    float _1393 = _1333;
    float _1395 = _1365;
    float _1397 = _1393;
    if (_1323)
    {
        float _1399 = fma(_1365, _1393, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1395 = _1399;
    }
    float _1401 = _1395;
    float _1403 = _1401;
    if (!_1323)
    {
        _1397 = _1387;
    }
    float _1405 = _1397;
    float _1407 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1409 = _1405;
    if (_1323)
    {
        float _1411 = _1349 * _1401;
        _1223 = _1411;
    }
    float _1413 = _1223;
    if (!_1323)
    {
        _1403 = _1315;
    }
    float _1415 = _1403;
    float _1417 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1419 = _1415;
    float _1421 = _1381;
    if (_1323)
    {
        float _1423 = _1381 + (-1.0);
        _1375 = _1423;
    }
    float _1425 = _1375;
    float _1427 = _1425;
    if (_1323)
    {
        float _1429 = _1311 * _1413;
        _1335 = _1429;
    }
    float _1431 = _1335;
    float _1433 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1417);
    if (_1323)
    {
        float _1435 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1435;
    }
    float _1437 = _1351;
    if (!_1323)
    {
        _1427 = _1313;
    }
    float _1439 = _1427;
    float _1441 = _1439;
    if (_1323)
    {
        float _1443 = _1313 * _1413;
        _1441 = _1443;
    }
    float _1445 = _1441;
    if (_1323)
    {
        float _1447 = _1431 * _1431;
        _1419 = _1447;
    }
    float _1449 = _1419;
    if (_1323)
    {
        float _1451 = fma(_1387, _1381, _1437);
        _1409 = _1451;
    }
    float _1453 = _1409;
    if (!_1323)
    {
        _1421 = _1317;
    }
    float _1455 = _1421;
    float _1457 = _1455;
    if (_1323)
    {
        float _1459 = _1445 * _1445;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = fma(_1453, _1453, _1449);
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1469 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1467);
    float _1471 = precise::clamp(_1469, 0.0, 1.0);
    float _1473 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1433);
    float _1475 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1477 = _1465 + _1461;
    float _1479 = -_1471;
    float _1481 = _1479 + 1.0;
    float _1483 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1485 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1475);
    float _1487 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1489 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1491 = rsqrt(_1477);
    float _1493 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1483);
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1499 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = abs(_1481);
    float _1503 = log2(_1501);
    float _1505 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1507 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1509 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1511 = -_1507;
    float _1513 = fma(_1511, _1407, 1.0);
    float _1515 = _1491 * _1431;
    float _1517 = _1491 * _1453;
    float _1519 = _1491 * _1445;
    float _1521 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1509);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = log2(_1513);
    float _1527 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1521);
    float _1529 = -_1523;
    float _1531 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1529);
    float _1533 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1535 = _1517 + 1.0;
    float _1537 = -_1519;
    float _1539 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1531);
    float _1541 = 1.0 / _1527;
    float _1543 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1545 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1547 = fma(_1539, -0.5, 0.5);
    float _1549 = fma(_1539, 0.5, 0.5);
    float _1551 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1543);
    float _1553 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1545);
    float _1555 = exp2(_1533);
    float _1557 = fma(_1549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1559 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1551);
    float _1561 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1553);
    float _1563 = _1525 * 0.693147182464599609375;
    float _1565 = fma(_1549, _1557, -0.212114393711090087890625);
    float _1567 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1559);
    float _1569 = sqrt(_1547);
    float _1571 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = _1567 * _1541;
    float _1575 = -_1517;
    float _1577 = fma(_1555, _1535, _1575);
    float _1579 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1561);
    float _1581 = fma(_1549, _1565, 1.570728778839111328125);
    float _1583 = fma(_1573, 0.5, 0.5);
    float _1585 = fma(_1577, 0.5, 0.5);
    float _1587 = _1579 * _1541;
    float _1589 = _1569 * 0.636619746685028076171875;
    float _1591 = fma(_1587, -0.5, 0.5);
    float _1593 = -_1581;
    float _1595 = fma(_1589, _1593, 1.0);
    float3 _5514 = float3(_1583, _1591, _1571);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5514, float3(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5514, float3(0.0), isnan(_5514)), level(0.0)).x;
    float3 _5525 = float3(_1583, _1591, _1571);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _5542 = float2(_1595, _1585);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5542, float2(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5542, float2(0.0), isnan(_5542)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1622 = int(_1620);
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1626 = _1624 != 0;
    float _1628 = -_699;
    float _1630 = _1628 + 1.0;
    bool _1632 = _133 > 0.5;
    float _1634 = -_483;
    float _1636 = _1634 + 1.0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1640 = _1638 != 0;
    float _1642 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1644 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1646 = int(_1644);
    bool _1648 = _265 > 0.5;
    float _1650 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1642);
    int _1652 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1654 = _1652 != 0;
    out.m_70.x = _1283;
    out.m_70.y = _1281;
    out.m_70.z = _1285;
    bool _1656 = _261 > 0.5;
    float _1658 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1650);
    float _1660 = 0.0;
    float _1662 = _1527;
    float _1664 = _1579;
    float _1666 = _1567;
    if (_1626)
    {
        _1660 = 1.0;
    }
    float _1668 = _1660;
    float _1670 = trunc(_599);
    int _1672 = int(_1670);
    float _1674 = float(uint(_1622));
    float _1676 = _1668;
    if (!_1626)
    {
        _1676 = 1.2345600128173828125;
    }
    float _1678 = _1676;
    int _1680 = ~_1622;
    int _1682 = _1680 + 1;
    int _1684 = abs(_537);
    float _1686 = 1.0 / _1674;
    float _1688 = float(uint(_1646));
    int _1690 = ~_1646;
    int _1692 = _1690 + 1;
    int _1694 = abs(_541);
    int _1696 = abs(_1033);
    float _1698 = 1.0 / _1688;
    float _1700 = trunc(_609);
    int _1702 = int(_1700);
    int _1704 = as_type<int>(_1686) + (-2);
    float _1706 = float(uint(_1672));
    int _1708 = abs(_1055);
    int _1710 = as_type<int>(_1698) + (-2);
    float _1712 = as_type<float>(_1704) * _1706;
    int _1714 = ~_1622;
    int _1716 = _1714 + 1;
    float _1718 = trunc(_1712);
    float _1720 = precise::max(_1718, 0.0);
    uint _1723 = uint(_1720);
    float _1725 = float(uint(_1702));
    float _1727 = float(_1702);
    float _1729 = as_type<float>(_1710) * _1725;
    int _1731 = ~_1646;
    int _1733 = _1731 + 1;
    float _1735 = _1712;
    if (_1626)
    {
        _1735 = 1.0;
    }
    float _1737 = _1735;
    float _1739 = _1737;
    if (!_1626)
    {
        _1739 = 7.345489978790283203125;
    }
    float _1741 = _1739;
    float _1743 = trunc(_1729);
    float _1745 = precise::max(_1743, 0.0);
    uint _1747 = uint(_1745);
    int _1749 = _1716 * int(_1723);
    int _1751 = _1749 + _1672;
    float _1753 = _1741 * _133;
    float _1755 = float(_1646);
    float _1757 = float(uint(_1751));
    float _1759 = floor(_1753);
    int _1761 = _1733 * int(_1747);
    int _1763 = _1761 + _1702;
    float _1765 = as_type<float>(_1704) * _1757;
    float _1767 = float(uint(_1763));
    float _1769 = trunc(_1765);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    float _1775 = -_1759;
    float _1777 = _1753 + _1775;
    float _1779 = as_type<float>(_1710) * _1767;
    float _1781 = _1767;
    if (_1626)
    {
        _1781 = _133;
    }
    float _1783 = _1781;
    float _1785 = in.m_51.w;
    float _1787 = _1783;
    if (!_1626)
    {
        _1787 = _261;
    }
    float _1789 = _1787;
    float _1791 = trunc(_1779);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = _1678 * _1789;
    int _1799 = int(_1723) + int(_1773);
    float _1801 = floor(_1797);
    float _1803 = float(_1622);
    float _1805 = float(_1672);
    int _1807 = _1682 * _1799;
    int _1809 = _1807 + _1672;
    int _1811 = int(_1747) + int(_1795);
    bool _1813 = uint(_1809) >= uint(_1622);
    bool _1815 = _1805 >= _1803;
    bool _1817 = isnan(_1805);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(_1803);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    int _1827 = _1692 * _1811;
    int _1829 = _1827 + _1702;
    bool _1831 = _1785 > 0.5;
    bool _1833 = _1727 >= _1755;
    bool _1835 = isnan(_1727);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan(_1755);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    float _1845 = -_1801;
    float _1847 = _1797 + _1845;
    bool _1849 = !_1813;
    int _1851 = _1849 ? 0 : (-1);
    float _1853 = trunc(_1825);
    int _1855 = int(_1853);
    bool _1857 = uint(_1829) >= uint(_1646);
    float _1859 = _1847 * _1755;
    int _1861 = ~_1799;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = _1777 * _1803;
    bool _1869 = !_1857;
    int _1871 = _1869 ? 0 : (-1);
    float _1873 = _1803 * _675;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1877 = _1875 != 0;
    float _1879 = trunc(_1843);
    int _1881 = int(_1879);
    int _1883 = ~_1811;
    int _1885 = _1883 + _1871;
    int _1887 = _1885 + 1;
    int _1889 = _1622 * _1865;
    int _1891 = _1889 + _1672;
    bool _1893 = !_1877;
    int _1895 = _1893 ? 0 : 1;
    float _1897 = _1755 * _675;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1901 = _1899 != 0;
    int _1903 = _1646 * _1887;
    int _1905 = _1903 + _1702;
    bool _1907 = !_1640;
    int _1909 = _1907 ? 0 : 1;
    float _1911 = trunc(_1867);
    int _1913 = int(_1911);
    bool _1915 = _1622 == 0;
    bool _1917 = !_1901;
    int _1919 = _1917 ? 0 : 1;
    bool _1921 = _1646 == 0;
    bool _1923 = !_1915;
    int _1925 = _1923 ? _1891 : (-1);
    float _1927 = trunc(_1873);
    int _1929 = int(_1927);
    int _1931 = abs(_1895);
    int _1933 = ~_1881;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    bool _1939 = !_1921;
    int _1941 = _1939 ? _1905 : (-1);
    int _1943 = ~_1855;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    float _1949 = trunc(_1897);
    int _1951 = int(_1949);
    int _1953 = _1913 * _1931;
    int _1955 = _1953 + _1672;
    int _1957 = _1941 * _1937;
    int _1959 = _1646 + (-1);
    int _1961 = _1925 * _1947;
    int _1963 = _1622 + (-1);
    float _1965 = trunc(_1859);
    int _1967 = int(_1965);
    int _1969 = _1881 * _1959;
    int _1971 = _1969 + _1957;
    float _1973 = -_207;
    int _1975 = _1632 ? as_type<int>(_1973) : as_type<int>(_207);
    int _1977 = _1855 * _1963;
    int _1979 = _1977 + _1961;
    int _1981 = abs(_547);
    bool _1983 = !_1654;
    float _1985 = _1983 ? _207 : as_type<float>(_1975);
    int _1987 = _1979 * _1684;
    int _1989 = abs(_1919);
    int _1991 = _1971 * _1696;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1995 = _1993 != 0;
    int _1997 = _1929 * _1694;
    int _1999 = _1997 + _1987;
    int _2001 = abs(_1909);
    float _2003 = _1985 + 0.5;
    int _2005 = abs(_1037);
    int _2007 = _1955 * _1981;
    int _2009 = _2007 + _1999;
    int _2011 = ~_1622;
    int _2013 = _2011 + 1;
    int _2015 = _1967 * _1989;
    int _2017 = _2015 + _1702;
    float _2019 = -_211;
    int _2021 = _1656 ? as_type<int>(_2019) : as_type<int>(_211);
    int _2023 = _1951 * _2005;
    int _2025 = _2023 + _1991;
    float _2027 = fma(_2003, (*spvDescriptorSet0.vp_c9)._m0[80].x, _437);
    int _2029 = _1913 * _2001;
    int _2031 = _2029 + _2009;
    bool _2033 = !_1995;
    float _2035 = _2033 ? _211 : as_type<float>(_2021);
    float _2037 = float(uint(_1955));
    int _2039 = abs(_1051);
    float _2041 = _2035 + (-0.5);
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2045 = _2043 != 0;
    float _2047 = as_type<float>(_1704) * _2037;
    float _2049 = float(uint(_2031));
    float _2051 = -_2041;
    float _2053 = -_447;
    float _2055 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2053);
    int _2057 = _2017 * _2039;
    int _2059 = _2057 + _2025;
    float _2061 = -_207;
    int _2063 = _1648 ? as_type<int>(_2061) : as_type<int>(_207);
    float _2065 = as_type<float>(_1704) * _2049;
    float _2067 = trunc(_2047);
    float _2069 = precise::max(_2067, 0.0);
    uint _2071 = uint(_2069);
    int _2073 = _1967 * _1708;
    int _2075 = _2073 + _2059;
    bool _2077 = !_2045;
    float _2079 = _2077 ? _207 : as_type<float>(_2063);
    float _2081 = fma(_2035, _1630, _2055);
    float _2083 = float(uint(_2017));
    float _2085 = float(uint(_2075));
    float _2087 = _2079 + 0.5;
    float _2089 = trunc(_2065);
    float _2091 = precise::max(_2089, 0.0);
    uint _2093 = uint(_2091);
    float _2095 = as_type<float>(_1710) * _2083;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2099 = _2097 != 0;
    float _2101 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[85].x, _703);
    float _2103 = -_211;
    int _2105 = _1831 ? as_type<int>(_2103) : as_type<int>(_211);
    float _2107 = trunc(_2095);
    float _2109 = precise::max(_2107, 0.0);
    uint _2111 = uint(_2109);
    float _2113 = as_type<float>(_1710) * _2085;
    bool _2115 = !_2099;
    float _2117 = _2115 ? _211 : as_type<float>(_2105);
    int _2119 = _2013 * int(_2071);
    int _2121 = _2119 + _1955;
    int _2123 = ~_1646;
    int _2125 = _2123 + 1;
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2129 = _2127 != 0;
    float _2131 = _2117 + (-0.5);
    float _2133 = trunc(_2113);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = _2013 * int(_2093);
    int _2141 = _2139 + _2031;
    float _2143 = float(uint(_2121));
    float _2145 = -_679;
    float _2147 = _2145 + 1.0;
    float _2149 = -_2131;
    float _2151 = -_705;
    float _2153 = fma(_2149, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2151);
    int _2155 = ~_1646;
    int _2157 = _2155 + 1;
    float _2159 = float(uint(_2141));
    int _2161 = _2125 * int(_2111);
    int _2163 = _2161 + _2017;
    float _2165 = -_2147;
    float _2167 = fma(_1985, _2165, _2027);
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2171 = _2169 != 0;
    float _2173 = as_type<float>(_1704) * _2143;
    float _2175 = as_type<float>(_1704) * _2159;
    float _2177 = float(uint(_2163));
    int _2179 = ~_1622;
    int _2181 = _2179 + 1;
    int _2183 = _2157 * int(_2137);
    int _2185 = _2183 + _2075;
    float _2187 = trunc(_2175);
    float _2189 = precise::max(_2187, 0.0);
    uint _2191 = uint(_2189);
    float _2193 = as_type<float>(_1710) * _2177;
    float _2195 = -_697;
    float _2197 = _2195 + 1.0;
    float _2199 = -_1636;
    float _2201 = fma(_2079, _2199, _2101);
    float _2203 = float(uint(_2185));
    float _2205 = fma(_2117, _2197, _2153);
    float _2207 = _923 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2209 = trunc(_2173);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = as_type<float>(_1710) * _2203;
    out.m_72.x = _2167;
    out.m_72.y = _2081;
    out.m_72.z = _2201;
    out.m_72.w = _2205;
    float _2217 = trunc(_2215);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    int _2223 = int(_2093) + int(_2191);
    float _2225 = _923 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2227 = _923 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2229 = _2181 * _2223;
    int _2231 = _2229 + _2031;
    float _2233 = -_911;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2225);
    float _2237 = -_911;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2207);
    int _2241 = ~_1646;
    int _2243 = _2241 + 1;
    float _2245 = -_911;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2227);
    bool _2249 = uint(_2231) >= uint(_1622);
    float _2251 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2239);
    float _2253 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2235);
    int _2255 = int(_2137) + int(_2221);
    float _2257 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2259 = !_2249;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2265 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2267 = _2243 * _2255;
    int _2269 = _2267 + _2075;
    int _2271 = ~_2223;
    int _2273 = _2271 + _2261;
    int _2275 = _2273 + 1;
    float _2277 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2257);
    float _2279 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2281 = trunc(_2193);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    bool _2287 = uint(_2269) >= uint(_1646);
    int _2289 = _1622 * _2275;
    int _2291 = _2289 + _2031;
    int _2293 = int(_2071) + int(_2213);
    float _2295 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2297 = !_2287;
    int _2299 = _2297 ? 0 : (-1);
    float _2301 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2303 = !_1915;
    int _2305 = _2303 ? _2291 : (-1);
    float _2307 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2247);
    int _2309 = ~_2255;
    int _2311 = _2309 + _2299;
    int _2313 = _2311 + 1;
    float _2315 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2295);
    int _2317 = _2305 >> 31;
    float _2319 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2301);
    int _2321 = _2305 & 3;
    bool _2323 = _2321 != 0;
    int _2325 = _1646 * _2313;
    int _2327 = _2325 + _2075;
    int _2329 = _2317 & 3;
    float _2331 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2333 = _2305 & 3;
    bool _2335 = _2333 != 0;
    float _2337 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2263);
    bool _2339 = !_1921;
    int _2341 = _2339 ? _2327 : (-1);
    float _2343 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2265);
    int _2345 = ~_1622;
    int _2347 = _2345 + 1;
    float _2349 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2277);
    int _2351 = _2305 + _2329;
    float _2353 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2315);
    int _2355 = _2341 >> 31;
    int _2357 = _2347 * _2293;
    int _2359 = _2357 + _1955;
    int _2361 = _2351 >> 2;
    float _2363 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2279);
    int _2365 = _2355 & 3;
    float _2367 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2319);
    bool _2369 = uint(_2321) > 1u;
    float _2371 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2373 = _2361 << 4;
    int _2375 = _2373 + 368;
    int _2377 = _2335 ? 0 : 1;
    bool _2379 = uint(_2359) >= uint(_1622);
    int _2381 = _2341 + _2365;
    uint _2383 = uint(int(uint(_2375) >> uint(2)));
    uint _2385 = uint(int(uint(int(_2383)) >> uint(2)));
    int _2387 = int(_2383) & 3;
    float _2389 = (*spvDescriptorSet0.vp_c9)._m0[int(_2385)][_2387];
    int _2391 = int(_2383) + 1;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    int _2395 = _2391 & 3;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[int(_2393)][_2395];
    int _2399 = int(_2111) + int(_2285);
    int _2401 = ~_1646;
    int _2403 = _2401 + 1;
    int _2405 = ~_2377;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    int _2411 = _2409;
    if (!_2369)
    {
        int _2413 = ~_2377;
        int _2415 = _2413 + 1;
        _2411 = _2415;
    }
    int _2417 = _2411;
    int _2419 = _2403 * _2399;
    int _2421 = _2419 + _2017;
    int _2423 = _2381 >> 2;
    float _2425 = _2331 * _2253;
    bool _2427 = uint(_2321) >= 2u;
    float _2429 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2337);
    int _2431 = _2423 << 4;
    int _2433 = _2431 + 512;
    float _2435 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2343);
    int _2437 = _2427 ? 0 : 1;
    float _2439 = fma(_2371, _2429, _2425);
    bool _2441 = uint(_2421) >= uint(_1646);
    float _2443 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2363);
    bool _2445 = !_2379;
    int _2447 = _2445 ? 0 : (-1);
    uint _2449 = uint(int(uint(_2433) >> uint(2)));
    uint _2451 = uint(int(uint(int(_2449)) >> uint(2)));
    int _2453 = int(_2449) & 3;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[int(_2451)][_2453];
    int _2457 = int(_2449) + 1;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    int _2461 = _2457 & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    bool _2465 = _2321 != 3;
    float _2467 = _2331 * _2251;
    bool _2469 = !_2441;
    int _2471 = _2469 ? 0 : (-1);
    out.m_74.x = _2429;
    out.m_74.y = _2435;
    out.m_74.z = _2443;
    int _2473 = ~_2293;
    int _2475 = _2473 + _2447;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2371, _2435, _2467);
    bool _2481 = !_2323;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2375 + 8;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    uint _2489 = uint(int(uint(int(_2487)) >> uint(2)));
    int _2491 = int(_2487) & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    int _2495 = int(_2487) + 1;
    uint _2497 = uint(int(uint(_2495) >> uint(2)));
    int _2499 = _2495 & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = _2341 & 3;
    bool _2505 = _2503 != 0;
    int _2507 = _1622 * _2477;
    int _2509 = _2507 + _1955;
    int _2511 = ~_2399;
    int _2513 = _2511 + _2471;
    int _2515 = _2513 + 1;
    float _2517 = _2353 + _2479;
    int _2519 = ~_2437;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    int _2525 = _2523;
    if (_2465)
    {
        int _2527 = ~_2437;
        int _2529 = _2527 + 1;
        _2525 = _2529;
    }
    int _2531 = _2525;
    int _2533 = _2433 + 8;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    uint _2537 = uint(int(uint(int(_2535)) >> uint(2)));
    int _2539 = int(_2535) & 3;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[int(_2537)][_2539];
    int _2543 = int(_2535) + 1;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    int _2547 = _2543 & 3;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[int(_2545)][_2547];
    bool _2551 = uint(_2503) > 1u;
    int _2553 = _1646 * _2515;
    int _2555 = _2553 + _2017;
    int _2557 = _2341 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = _2331 * _2307;
    bool _2563 = !_2505;
    int _2565 = _2563 ? 0 : 1;
    int _2567 = _2559 ? 0 : 1;
    float _2569 = fma(_2371, _2443, _2561);
    int _2571 = abs(_2417);
    int _2573 = ~_2567;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    float _2579 = _2367 + _2569;
    int _2581 = abs(_2483);
    int _2583 = _2577;
    if (!_2551)
    {
        int _2585 = ~_2567;
        int _2587 = _2585 + 1;
        _2583 = _2587;
    }
    int _2589 = _2583;
    int _2591 = ~_2571;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    bool _2597 = _2503 != 3;
    bool _2599 = uint(_2503) >= 2u;
    int _2601 = _2595 * as_type<int>(_2397);
    int _2603 = _2599 ? 0 : 1;
    int _2605 = ~_2581;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2589);
    int _2613 = abs(_2531);
    int _2615 = _2609 * as_type<int>(_2389);
    int _2617 = _2615 + _2601;
    int _2619 = ~_2603;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    int _2625 = _2623;
    if (_2597)
    {
        int _2627 = ~_2603;
        int _2629 = _2627 + 1;
        _2625 = _2629;
    }
    int _2631 = _2625;
    int _2633 = abs(_2565);
    int _2635 = ~_2611;
    int _2637 = _2635 + 1;
    int _2639 = _2637 + 1;
    int _2641 = ~_2613;
    int _2643 = _2641 + 1;
    int _2645 = _2643 + 1;
    bool _2647 = _2321 != 3;
    int _2649 = _2639 * as_type<int>(_2463);
    bool _2651 = _2503 != 3;
    int _2653 = _2645 * as_type<int>(_2493);
    int _2655 = _2653 + _2617;
    int _2657 = abs(_2631);
    int _2659 = ~_2633;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    bool _2665 = !_2647;
    int _2667 = _2665 ? 0 : (-1);
    bool _2669 = !_2651;
    int _2671 = _2669 ? 0 : (-1);
    int _2673 = _2663 * as_type<int>(_2455);
    int _2675 = _2673 + _2649;
    int _2677 = ~_2657;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    float _2683 = fma(_2331, _2331, 1.0);
    bool _2685 = !_2129;
    int _2687 = _2685 ? 0 : 1;
    int _2689 = abs(_2667);
    int _2691 = _2681 * as_type<int>(_2541);
    int _2693 = _2691 + _2675;
    bool _2695 = !_2171;
    int _2697 = _2695 ? 0 : 1;
    float _2699 = rsqrt(_2683);
    int _2701 = abs(_2671);
    int _2703 = abs(_2687);
    int _2705 = abs(_2697);
    int _2707 = ~_2701;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = _2711 * as_type<int>(_2549);
    int _2715 = _2713 + _2693;
    int _2717 = ~_2705;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    int _2723 = ~_2689;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    float _2729 = _2331 * _2699;
    int _2731 = ~_2703;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = _2715 * _2721;
    float _2739 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2741 = _2727 * as_type<int>(_2501);
    int _2743 = _2741 + _2655;
    bool _2745 = !_1915;
    int _2747 = _2745 ? _2509 : (-1);
    float _2749 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1658);
    bool _2751 = !_1921;
    int _2753 = _2751 ? _2555 : (-1);
    int _2755 = _2743 * _2735;
    float _2757 = exp2(_2739);
    float _2759 = -_2353;
    float _2761 = _2729 * _2759;
    float _2763 = _1567 + _1527;
    int _2765 = _2747 * _2703;
    int _2767 = _2765 + _2755;
    float _2769 = -_2349;
    float _2771 = _2729 * _2769;
    float _2773 = -_2367;
    float _2775 = _2729 * _2773;
    int _2777 = _2753 * _2705;
    int _2779 = _2777 + _2737;
    float _2781 = fma(_2699, _2251, _2761);
    float _2783 = fma(_2699, _2253, _2771);
    float _2785 = fma(_2699, _2307, _2775);
    float _2787 = _1527 * 0.5;
    float _2789 = float(_2767);
    float _2791 = _2749 + _1527;
    float _2793 = float(_2779);
    float _2795 = fma(_1579, -0.5, _2787);
    float _2797 = -_2757;
    float _2799 = _2797 + 1.0;
    float _2801 = _2791 * 0.5;
    out.m_76.x = _2789;
    out.m_76.y = _2793;
    float _2803 = _2763 * 0.5;
    float _2805 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2807 = _2349 + _2439;
    out.m_78.x = _2783;
    out.m_78.y = _2781;
    out.m_78.z = _2785;
    bool _2809 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2811 = isnan(_1307);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2817 = _2813 || _2815;
    float _2819 = _2805 * _1597;
    float _2821 = -_2805;
    float _2823 = _2821 + 1.0;
    out.m_80.x = _2803;
    out.m_80.y = _2795;
    out.m_80.z = _2801;
    out.m_80.w = _1527;
    float _2825 = _1608 * _2819;
    float _2827 = _1618 * _2819;
    float _2829 = _1608 * _2823;
    out.m_82.x = _2807;
    out.m_82.y = _2517;
    out.m_82.z = _2579;
    float _2831 = fma(_1614, _2825, _1602);
    float _2833 = fma(_1616, _2825, _1604);
    float _2835 = fma(_1608, _2827, _1606);
    out.gl_Position.x = _1567;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _2749;
    out.gl_Position.w = _1527;
    float _2837 = _1604;
    float _2839 = _1602;
    float _2841 = _2749;
    if (!_2817)
    {
        _2837 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2843 = _2837;
    float _2845 = _2843;
    float _2847 = _2843;
    if (!_2817)
    {
        _2839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2849 = _2839;
    out.m_84.x = _2831;
    out.m_84.y = _2833;
    out.m_84.z = _2835;
    out.m_84.w = _2829;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2817)
    {
        _1662 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2855 = _1662;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2817)
    {
        _2841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2861 = _2841;
    float _2863 = _2861;
    float _2865 = _2861;
    if (!_2817)
    {
        _1664 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2867 = _1664;
    float _2869 = _2867;
    float _2871 = _2867;
    if (!_2817)
    {
        _1666 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2873 = _1666;
    bool _2875 = !_2817;
    float _2877 = _2873;
    float _2879 = _2873;
    if (!_2875)
    {
        bool _2881 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2883 = isnan(_1307);
        bool _2885 = _2881 || _2883;
        bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2889 = _2885 || _2887;
        if (!_2889)
        {
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2893 = _1307 + _2891;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2897 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2895;
            float _2899 = 1.0 / _2897;
            float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2909 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2911 = _2909 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2921 = _2893 * _2899;
            float _2923 = precise::clamp(_2921, 0.0, 1.0);
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2929 = fma(_2923, _2903, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2931 = fma(_2923, _2927, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2933 = fma(_2923, _2907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2935 = fma(_2923, _2911, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2937 = fma(_2923, _2915, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2939 = fma(_2923, _2919, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2853 = _2931;
            _2871 = _2937;
            _2847 = _2929;
            _2865 = _2935;
            _2859 = _2933;
            _2879 = _2939;
            _2941 = true;
        }
        else
        {
            bool _2943 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2945 = isnan(_1307);
            bool _2947 = _2943 || _2945;
            bool _2949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2951 = _2947 || _2949;
            if (!_2951)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2953 = _2845;
            _2847 = _2953;
            if (!_2951)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2955 = _2851;
            _2853 = _2955;
            if (!_2951)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2957 = _2857;
            _2859 = _2957;
            if (!_2951)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2959 = _2863;
            _2865 = _2959;
            if (!_2951)
            {
                _2869 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2961 = _2869;
            _2871 = _2961;
            if (!_2951)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2963 = _2877;
            bool _2965 = !_2951;
            _2879 = _2963;
            if (!_2965)
            {
                bool _2967 = _1307 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2969 = isnan(_1307);
                bool _2971 = _2967 || _2969;
                bool _2973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2975 = _2971 || _2973;
                if (!_2975)
                {
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2979 = _1307 + _2977;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2983 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2981;
                    float _2985 = 1.0 / _2983;
                    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3007 = _2979 * _2985;
                    float _3009 = precise::clamp(_3007, 0.0, 1.0);
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3015 = fma(_3009, _2989, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3017 = fma(_3009, _3013, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3019 = fma(_3009, _2993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3021 = fma(_3009, _2997, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3023 = fma(_3009, _3001, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3025 = fma(_3009, _3005, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2853 = _3017;
                    _2871 = _3023;
                    _2847 = _3015;
                    _2865 = _3021;
                    _2859 = _3019;
                    _2879 = _3025;
                    _2941 = true;
                }
                else
                {
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2871 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2941 = false;
    float _3027 = _2853;
    float _3029 = _2871;
    float _3031 = _2847;
    float _3033 = _2865;
    float _3035 = _2859;
    float _3037 = _2879;
    float _3039 = fma(_2517, -0.5, 0.5);
    float _3041 = precise::clamp(_3039, 0.0, 1.0);
    float _3043 = -_3027;
    float _3045 = _3043 + _3029;
    float _3047 = -_3031;
    float _3049 = _3047 + _3033;
    float _3051 = -_3035;
    float _3053 = _3051 + _3037;
    bool _3055 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3057 = fma(_3041, _3045, _3027);
    float _3059 = fma(_3041, _3049, _3031);
    float _3061 = fma(_3041, _3053, _3035);
    float _3063 = _3057 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3065 = fma(_3059, 0.298911988735198974609375, _3063);
    float _3067 = fma(_3061, 0.114477999508380889892578125, _3065);
    out.m_86.x = 0.0;
    float _3069 = -_3067;
    float _3071 = _3059 + _3069;
    float _3073 = -_3067;
    float _3075 = _3057 + _3073;
    float _3077 = -_3067;
    float _3079 = _3061 + _3077;
    float _3081 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3083 = fma(_3071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    float _3085 = fma(_3075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    float _3087 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3067);
    out.m_88.w = _3081;
    out.m_90.x = _3083;
    out.m_90.y = _3085;
    out.m_90.z = _3087;
    if (!_3055)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3089 = -_1281;
    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3093 = -_1283;
    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3097 = -_1285;
    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3101 = _3091 * _3091;
    float _3103 = fma(_3095, _3095, _3101);
    float _3105 = fma(_3099, _3099, _3103);
    float _3107 = sqrt(_3105);
    float _3109 = rsqrt(_3105);
    float _3111 = -_3107;
    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = _3095 * _3109;
    float _3121 = _3091 * _3109;
    float _3123 = abs(_3117);
    float _3125 = log2(_3123);
    float _3127 = _3099 * _3109;
    float _3129 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3131 = _2517 * _3121;
    float _3133 = -_3121;
    float _3135 = -_3129;
    float _3137 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3135);
    float _3139 = fma(_2807, _3119, _3131);
    float _3141 = -_3127;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3137);
    float _3145 = fma(_2579, _3127, _3139);
    float _3147 = precise::clamp(_3145, 0.0, 1.0);
    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3151 = _3143 + _3149;
    float _3153 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3157 = precise::clamp(_3155, 0.0, 1.0);
    float _3159 = exp2(_3153);
    float _3161 = _3159 * _3157;
    float _3163 = _3147 * _3161;
    float _3165 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3169 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3165;
    out.m_86.y = _3167;
    out.m_86.z = _3169;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

