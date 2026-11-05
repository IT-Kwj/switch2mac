#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _5778, thread const int& _5779, constant _10& support_buffer)
{
    float _5782 = as_type<float>(support_buffer._m4);
    int _5784 = _5779 + as_type<int>(_5782);
    int _5786 = 1 + _5784;
    float _5788 = support_buffer._m5[_5786].x;
    float _5790 = abs(_5788);
    bool _5792 = _5790 == 1.0;
    if (_5792)
    {
        return _5778;
    }
    float _5794 = float(_5778);
    float _5796 = _5794 / _5790;
    int _5798 = int(_5796);
    return _5798;
}

static inline __attribute__((always_inline))
int _87(thread const int& _5828, thread const int& _5829, constant _10& support_buffer)
{
    float _5832 = as_type<float>(support_buffer._m4);
    int _5834 = _5829 + as_type<int>(_5832);
    int _5836 = 1 + _5834;
    float _5838 = support_buffer._m5[_5836].x;
    bool _5840 = _5838 == 1.0;
    if (_5840)
    {
        return _5828;
    }
    float _5842 = float(_5828);
    float _5844 = _5842 * _5838;
    int _5846 = int(_5844);
    return _5846;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1723 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2311 = as_type<float>(_111);
        out.gl_Position.z = _2311;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_149);
        out.gl_Position.z = _2381;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_53.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    int _303 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _305 = _303;
    int _307 = 0;
    int _309 = _86(_305, _307, (*spvDescriptorSet0.support_buffer));
    float _311 = in.m_55.x;
    float _313 = in.m_57.z;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _317 = _315 != 0;
    float _319 = in.m_57.x;
    float _321 = in.m_55.z;
    float _323 = _311 * 8.0;
    float _325 = rint(_323);
    float _327 = _325 * 0.125;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    int _331 = _309 + (-1);
    float _333 = trunc(_313);
    int _335 = int(_333);
    float _337 = float(_331);
    float _339 = _329 * _337;
    float _341 = in.m_55.w;
    float _343 = trunc(_339);
    int _345 = int(_343);
    int _347 = _345 + 1;
    int _349 = min(_331, _347);
    int _351 = _345;
    int _353 = 0;
    int _355 = _87(_351, _353, (*spvDescriptorSet0.support_buffer));
    int _357 = _335;
    int _359 = 0;
    int _361 = _87(_357, _359, (*spvDescriptorSet0.support_buffer));
    float3 _365 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_355, _361)), 0).xyz;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = _365.z;
    int _373 = _349;
    int _375 = 0;
    int _377 = _87(_373, _375, (*spvDescriptorSet0.support_buffer));
    int _379 = _335;
    int _381 = 0;
    int _383 = _87(_379, _381, (*spvDescriptorSet0.support_buffer));
    float3 _385 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_377, _383)), 0).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _395 = _393 != 0;
    int _397 = as_type<int>(_325);
    int _399 = _347;
    float _401 = _319;
    if (_317)
    {
        float _403 = -_319;
        float _405 = _403 + 1.0;
        _397 = as_type<int>(_405);
    }
    int _407 = _397;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _411 = _409 != 0;
    float _413 = in.m_57.y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _417 = _415 != 0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _301 + _419;
    bool _423 = false;
    float _425 = _413;
    if (_317)
    {
        bool _427 = _311 > 0.5;
        _423 = _427;
    }
    bool _429 = _423;
    float _431 = in.m_55.y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _435 = _301 + _433;
    float _437 = 0.0;
    bool _439 = _429;
    if (!_317)
    {
        _437 = _319;
    }
    float _441 = _437;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _445 = _301 + _443;
    float _447 = _441;
    if (_317)
    {
        float _449 = _429 ? as_type<float>(_407) : _319;
        _447 = _449;
    }
    float _451 = _447;
    if (_395)
    {
        float _453 = -_319;
        float _455 = _453 + 1.0;
        _399 = as_type<int>(_455);
    }
    int _457 = _399;
    if (_395)
    {
        bool _459 = _321 > 0.5;
        _439 = _459;
    }
    bool _461 = _439;
    float _463 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _465 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _469 = _467 != 0;
    float _471 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _473 = _341 > 0.5;
    float _475 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
    float _477 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    if (_395)
    {
        float _479 = _461 ? as_type<float>(_457) : _319;
        _401 = _479;
    }
    float _481 = _401;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _485 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _505 = _503 != 0;
    float _507 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _509 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _475);
    float _511 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    float _513 = fma(_507, -2.0, _483);
    float _515 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _517 = 1.0 / _493;
    float _519 = _311 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _513);
    float _523 = _511 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _525 = 1.0 / _489;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _539 = _321 * 2.0;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _543 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _545;
    float _549 = 0.0;
    if (!_469)
    {
        _549 = _431;
    }
    float _551 = _549;
    float _553 = -_541;
    float _555 = fma(_519, 2.0, _553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _557;
    float _561 = floor(_539);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _567 = _421 * _525;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _571 = _301 + _569;
    float _573 = 0.0;
    float _575 = _551;
    if (!_469)
    {
        _573 = _321;
    }
    float _577 = _573;
    float _579 = -_129;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[76].x, _555);
    float _583 = 0.0;
    float _585 = _577;
    if (!_469)
    {
        _583 = _321;
    }
    float _587 = _583;
    float _589 = _509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _591 = 1.0 / _547;
    float _593 = _587;
    if (_469)
    {
        _575 = _311;
    }
    float _595 = _575;
    if (_469)
    {
        _585 = _431;
    }
    float _597 = _585;
    if (_469)
    {
        _593 = _431;
    }
    float _599 = _593;
    float _601 = 1.0 / _559;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _607 = -_413;
    float _609 = _607 + 1.0;
    bool _611 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_301);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _631 = _473 ? as_type<int>(_609) : as_type<int>(_413);
    float _633 = 1.0 / _565;
    float _635 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _411 ? as_type<float>(_631) : _413;
    float _643 = _445 * _591;
    bool _645 = _561 > 0.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _647;
    float _651 = 1.0 / _605;
    float _653 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _657 = _561 >= 0.0;
    bool _659 = isnan(_561);
    bool _661 = _657 || _659;
    bool _663 = isnan(0.0);
    bool _665 = _661 || _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _669 = _301 + _667;
    out.m_59.x = _543;
    out.m_59.y = _635;
    out.m_59.z = _653;
    float _671 = _669 * _517;
    float _673 = _431 * 2.0;
    out.m_61.x = _637;
    out.m_61.y = _655;
    out.m_61.z = _639;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _677 = _301 + _675;
    float _679 = fma(_649, _643, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _681 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _683 = isnan(_301);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = _677 * _633;
    float _695 = _435 * _651;
    float _697 = _311 + _431;
    int _699 = _665 ? 0 : 1;
    float _701 = floor(_673);
    bool _703 = _431 > 0.5;
    float _705 = _311 * 2.0;
    float _707 = _697 + (-1.0);
    float _709 = _571 * _601;
    if (_417)
    {
        float _711 = _703 ? _609 : _413;
        _425 = _711;
    }
    float _713 = _425;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _715;
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _721 = floor(_705);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _731;
    float _735 = fma(_725, _695, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _737;
    int _741 = ~_699;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    float _747 = fma(_733, _567, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _749 = _745;
    if (!_645)
    {
        int _751 = ~_699;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    float _757 = fma(_739, _567, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _763 = _701 > 0.0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _769 = _701 >= 0.0;
    bool _771 = isnan(_701);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _787;
    float _791 = fma(_761, _671, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _793 = fma(_781, _567, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _799;
    bool _803 = _721 > 0.0;
    float _805 = fma(_767, _671, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _807 = _721 >= 0.0;
    bool _809 = isnan(_721);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    float _817 = fma(_801, _709, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _819 = fma(_785, _709, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _821 = fma(_797, _671, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _823 = fma(_789, _709, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _833 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _835 = isnan(_301);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _849 = fma(_827, _693, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _851 = fma(_831, _693, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _853 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _855 = isnan(_301);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = fma(_847, _693, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _867 = -_843;
    float _869 = _867 + 1.0;
    bool _871 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _873 = isnan(_301);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _885 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _887 = isnan(_301);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _863 * _869;
    float _899 = -_863;
    float _901 = _899 + 1.0;
    float _903 = -_881;
    float _905 = _903 + 1.0;
    bool _907 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _909 = isnan(_301);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = -_895;
    float _921 = _919 + 1.0;
    float _923 = _881 * _901;
    float _925 = _895 * _905;
    float _927 = fma(_625, _643, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _929 = _621 * _921;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _933 = -_621;
    float _935 = _933 + 1.0;
    float _937 = fma(_717, _643, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _939 = _597 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _941 = _691 * _935;
    float _943 = -_691;
    float _945 = _943 + 1.0;
    float _947 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _949 = log2(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _953 = _917 * _945;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _957 = _883 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _959 = _747 * _953;
    float _961 = _757 * _953;
    float _963 = _793 * _953;
    float _965 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _967 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[83].z, _951);
    float _969 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _973 = fma(_965, _713, -0.5);
    float _975 = -_955;
    float _977 = fma(_969, 2.0, _975);
    float _979 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].w, _971);
    float _981 = fma(_629, _695, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _983 = _949 * _129;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _987 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _979);
    float _989 = -_917;
    float _991 = _989 + 1.0;
    float _993 = fma(_939, -2.0, _985);
    float _995 = -_521;
    float _997 = fma(_987, _973, _995);
    float _999 = exp2(_983);
    int _1001 = _815 ? 0 : 1;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].x, _959);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].y, _961);
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].z, _963);
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1011 = _777 ? 0 : 1;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1015 = ~_1001;
    int _1017 = _1015 + 1;
    int _1019 = _1017 + 1;
    float _1021 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1009);
    int _1023 = _1019;
    if (!_803)
    {
        int _1025 = ~_1001;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1033 = 1.0 + _1031;
    int _1035 = ~_1011;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    float _1041 = fma(_641, _957, -0.5);
    int _1043 = _1039;
    if (!_763)
    {
        int _1045 = ~_1011;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1053 = fma(_805, _941, _1003);
    bool _1055 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1057 = isnan(1.0);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1063 = _1059 || _1061;
    float _1065 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1021);
    float _1067 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _993);
    float _1069 = fma(_791, _941, _1005);
    float _1071 = fma(_821, _941, _1007);
    float _1073 = 1.0 / _1033;
    float _1075 = -_1067;
    float _1077 = fma(_1065, _1041, _1075);
    float _1079 = -_999;
    float _1081 = _1079 + 1.0;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1085 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1097 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _967);
    float _1099 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1083);
    float _1101 = _1093 ? _1081 : 0.0;
    float _1103 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1105 = -_129;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[81].x, _977);
    float _1109 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1099);
    float _1111 = fma(_1095, _451, -0.5);
    float _1113 = fma(_817, _929, _1053);
    float _1115 = fma(_819, _929, _1069);
    float _1117 = fma(_823, _929, _1071);
    if (_1063)
    {
        float _1119 = _1101 * _1073;
        _131 = _1119;
    }
    float _1121 = _131;
    float _1123 = fma(_1103, _481, -0.5);
    bool _1125 = !_497;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = in.m_63.x;
    float _1131 = in.m_63.y;
    float _1133 = in.m_63.z;
    float _1135 = fma(_1109, _1111, _581);
    float _1137 = float(_755);
    float _1139 = fma(_849, _925, _1113);
    int _1141 = abs(_1127);
    float _1143 = _515 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1145 = !_505;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = _523 + _1149;
    float _1153 = fma(_927, _923, _1139);
    int _1155 = abs(_1147);
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1159 = _589 + _1157;
    float _1161 = float(_1141);
    float _1163 = _1151 * _1151;
    float _1165 = fma(_851, _925, _1115);
    float _1167 = fma(_865, _925, _1117);
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1171 = _1143 + _1169;
    float _1173 = _1161 * _1137;
    float _1175 = fma(_1159, _1159, _1163);
    float _1177 = fma(_729, _695, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _1179 = fma(_679, _923, _1165);
    float _1181 = _1173 * (-2.0);
    float _1183 = fma(_937, _923, _1167);
    float _1185 = float(_1155);
    float _1187 = fma(_1171, _1171, _1175);
    float _1189 = fma(_719, _1181, _719);
    float _1191 = fma(_1181, _1129, _1129);
    float _1193 = _311 + (-0.5);
    float _1195 = float(_1049);
    float _1197 = _311 + _321;
    float _1199 = fma(_981, _897, _1153);
    float _1201 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1191);
    bool _1203 = !_501;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_735, _897, _1179);
    float _1209 = fma(_1177, _897, _1183);
    float _1211 = fma(_1097, _1123, _1107);
    int _1213 = abs(_1205);
    float _1215 = _997 + 0.5;
    float _1217 = _1197 + (-1.0);
    float _1219 = _1185 * _1195;
    float _1221 = rsqrt(_1187);
    float _1223 = float(_1213);
    float _1225 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = float(_1029);
    float _1229 = _1219 * (-2.0);
    float _1231 = _1077 + 0.5;
    float _1233 = _1135 + 0.5;
    float _1235 = _1211 + 0.5;
    float _1237 = _1223 * _1227;
    float _1239 = _321 + (-0.5);
    float _1241 = fma(_1229, _1133, _1133);
    float _1243 = _431 + _321;
    float _1245 = fma(_1225, _1229, _1225);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1241);
    float _1249 = _1243 + (-1.0);
    float _1251 = _1237 * (-2.0);
    float _1253 = _431 + (-0.5);
    float _1255 = fma(_1245, _1121, _1247);
    float _1257 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1259 = fma(_1251, _1131, _1131);
    float _1261 = _1151 * _1221;
    float _1263 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1199);
    float _1265 = _1255 * 0.15915493667125701904296875;
    out.m_65.x = _1233;
    out.m_65.y = _1215;
    out.m_65.z = _1235;
    out.m_65.w = _1231;
    float _1267 = fma(_1257, _1251, _1257);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1259);
    float _1271 = -_1261;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    float _1275 = in.m_53.x;
    float _1277 = in.m_53.y;
    float _1279 = in.m_53.z;
    float _1281 = fma(_1189, _1121, _1201);
    float _1283 = fma(_1267, _1121, _1269);
    float _1285 = _1273 * _1273;
    float _1287 = _1265 * 6.283185482025146484375;
    float _1289 = sin(_1287);
    float _1291 = _1281 * 0.15915493667125701904296875;
    float _1293 = _1283 * 0.15915493667125701904296875;
    float _1295 = -_371;
    float _1297 = _1295 + _391;
    float _1299 = _1159 * _1221;
    float _1301 = _1171 * _1221;
    float _1303 = _1291 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1207);
    float _1309 = -_1299;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1159);
    float _1313 = -_1301;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1171);
    float _1317 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1209);
    float _1319 = fma(_1311, _1311, _1285);
    float _1321 = _1291 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = fma(_1315, _1315, _1319);
    float _1327 = _1317 * _1279;
    float _1329 = _1263 * _1275;
    float _1331 = _1307 * _1277;
    float _1333 = _1293 * 6.283185482025146484375;
    float _1335 = cos(_1333);
    float _1337 = _1305 * _1289;
    float _1339 = floor(_339);
    float _1341 = _1323 * _1289;
    float _1343 = _1265 * 6.283185482025146484375;
    float _1345 = cos(_1343);
    float _1347 = _1335 * _1289;
    float _1349 = -_367;
    float _1351 = _1349 + _387;
    float _1353 = _1305 * _1335;
    float _1355 = _1293 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = -_1339;
    float _1361 = _339 + _1359;
    float _1363 = fma(_1361, _1351, _367);
    float _1365 = -_369;
    float _1367 = _1365 + _389;
    float _1369 = fma(_1361, _1297, _371);
    float _1371 = sqrt(_1325);
    float _1373 = _1323 * _1345;
    float _1375 = _1305 * _1345;
    float _1377 = _1335 * _1345;
    float _1379 = _1323 * _1335;
    float _1381 = fma(_1361, _1367, _369);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1369);
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1363);
    float _1387 = fma(_1357, _1337, _1373);
    float _1389 = fma(_1357, _1373, _1337);
    float _1391 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1393 = -_1341;
    float _1395 = fma(_1357, _1375, _1393);
    float _1397 = -_1375;
    float _1399 = fma(_1357, _1341, _1397);
    float _1401 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1403 = _1381 != 0.0;
    bool _1405 = isnan(_1381);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.0);
    bool _1411 = _1407 || _1409;
    float _1413 = _1221 * _1371;
    bool _1415 = _1363 == 0.0;
    bool _1417 = !_1411;
    bool _1419 = _1415 && _1417;
    float _1421 = _1391 * _1413;
    float _1423 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1425 = _1401 * _1413;
    bool _1427 = _1369 == 0.0;
    bool _1429 = _1427 && _1419;
    float _1431 = _1421 * _1383;
    float _1433 = _1423 * _1413;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1381);
    float _1437 = _1425 * _1385;
    float _1439 = _1387 * _1431;
    float _1441 = _1395 * _1431;
    float _1443 = _1433 * _1435;
    float _1445 = _1353 * _1431;
    float _1447 = fma(_1347, _1437, _1439);
    float _1449 = fma(_1377, _1437, _1441);
    float _1451 = -_1357;
    float _1453 = fma(_1451, _1437, _1445);
    float _1455 = -_1443;
    float _1457 = fma(_1399, _1455, _1447);
    float _1459 = -_1443;
    float _1461 = fma(_1389, _1459, _1449);
    float _1463 = -_1443;
    float _1465 = fma(_1379, _1463, _1453);
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1471 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1467);
    float _1475 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1469);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1471);
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1473);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1483 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1485 = _589 + _1479;
    float _1487 = _1143 + _1481;
    float _1489 = in.m_67.x;
    float _1491 = in.m_67.y;
    float _1493 = in.m_67.z;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1497 = _1485 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1501 = _1487 + _1499;
    float _1503 = _1497 * _1497;
    float _1505 = _1501 * _1501;
    float _1507 = _1503 + _1505;
    float _1509 = sqrt(_1507);
    float _1511 = _1493;
    float _1513 = _1489;
    float _1515 = _1395;
    float _1517 = _1369;
    float _1519 = _1461;
    float _1521 = _1491;
    if (!_1429)
    {
        float _1523 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1493);
        _1511 = _1523;
    }
    float _1525 = _1511;
    float _1527 = _1525;
    if (!_1429)
    {
        float _1529 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1513 = _1529;
    }
    float _1531 = _1513;
    float _1533 = _1387 * _1525;
    float _1535 = _523 + _1483;
    float _1537 = _1353 * _1525;
    bool _1539 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1395 * _1525;
    float _1543 = fma(_1347, _1531, _1533);
    float _1545 = _1533;
    if (!_1539)
    {
        _1515 = _1505;
    }
    float _1547 = _1515;
    float _1549 = _1547;
    if (!_1539)
    {
        _1545 = _1503;
    }
    float _1551 = _1545;
    float _1553 = _1551;
    if (!_1539)
    {
        _1517 = _1485;
    }
    float _1555 = _1517;
    float _1557 = _1555;
    if (!_1539)
    {
        _1527 = _1487;
    }
    float _1559 = _1527;
    float _1561 = _1559;
    if (!_1539)
    {
        _1519 = _1535;
    }
    float _1563 = _1519;
    bool _1565 = !_1539;
    float _1567 = _1563;
    if (!_1565)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1573 = _1509 + _1571;
        float _1575 = rsqrt(_1507);
        float _1577 = _1573 * _1569;
        float _1579 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = _1577 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        float _1587 = _1581 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = fma(_1585, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1593 = _1575 * _1591;
        float _1595 = _1589 + (-1.0);
        float _1597 = fma(_1497, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = fma(_1501, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1605 = _1597 + _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1609 = _1599 + _1607;
        float _1611 = fma(_1535, _1589, _1601);
        float _1613 = _1605 * _1605;
        float _1615 = _1609 * _1609;
        _1567 = _1611;
        _1553 = _1613;
        _1549 = _1615;
        _1557 = _1597;
        _1561 = _1599;
    }
    float _1617 = _1567;
    float _1619 = _1553;
    float _1621 = _1549;
    float _1623 = _1557;
    float _1625 = _1561;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1629 = _1617 + _1627;
    if (!_1429)
    {
        float _1631 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1521 = _1631;
    }
    float _1633 = _1521;
    float _1635 = fma(_1377, _1531, _1541);
    float _1637 = -_1357;
    float _1639 = fma(_1637, _1531, _1537);
    float _1641 = fma(_1629, _1629, _1619);
    float _1643 = -_1633;
    float _1645 = fma(_1399, _1643, _1543);
    float _1647 = -_1633;
    float _1649 = fma(_1389, _1647, _1635);
    float _1651 = -_1633;
    float _1653 = fma(_1379, _1651, _1639);
    float _1655 = _1641 + _1621;
    float _1657 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1661 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1663 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1657);
    float _1665 = sqrt(_1655);
    float _1667 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1659);
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1661);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1663);
    float _1673 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1667);
    float _1675 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1669);
    out.m_69.x = _1671;
    out.m_69.y = _1673;
    out.m_69.z = _1675;
    bool _1677 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1679 = isnan(_1665);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1685 = _1681 || _1683;
    float _1687 = _1663;
    if (!_1685)
    {
        _1687 = 1.0;
    }
    float _1689 = _1687;
    bool _1691 = !_1685;
    float _1693 = _1689;
    if (!_1691)
    {
        bool _1695 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1697 = isnan(_1665);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1703 = _1699 || _1701;
        if (!_1703)
        {
            float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1707 = _1665 + _1705;
            float _1709 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1711 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1709;
            float _1713 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1717 = 1.0 / _1711;
            float _1719 = _1707 * _1717;
            float _1721 = fma(_1719, _1715, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1693 = _1721;
            _1723 = true;
        }
        else
        {
            bool _1725 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1727 = isnan(_1665);
            bool _1729 = _1725 || _1727;
            bool _1731 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1733 = _1729 || _1731;
            if (!_1733)
            {
                float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1737 = _1665 + _1735;
                float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1741 = _1739 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1745 = _1743 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1747 = 1.0 / _1741;
                float _1749 = _1737 * _1747;
                float _1751 = fma(_1749, _1745, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1693 = _1751;
                _1723 = true;
            }
            else
            {
                _1693 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1723 = false;
    float _1753 = _1693;
    float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1757 = _1623 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1761 = _1617 + _1759;
    bool _1763 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan(0.5);
    bool _1771 = _1767 || _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1775 = _1625 + _1773;
    float _1777 = fma(_1757, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1779 = fma(_1761, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1781 = fma(_1775, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1783 = -_1299;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1777);
    float _1787 = -_1261;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1779);
    float _1791 = -_1301;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1781);
    float _1795 = _1789;
    float _1797 = _1785;
    float _1799 = _1793;
    float _1801 = _1757;
    float _1803 = _1779;
    if (!_1771)
    {
        float _1805 = -_1261;
        float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
        float _1809 = -_1299;
        float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
        float _1813 = -_1301;
        float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1143);
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1821 = _1807 + _1819;
        float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1825 = _1811 + _1823;
        float _1827 = -_1143;
        float _1829 = _1827 + _1781;
        float _1831 = -_589;
        float _1833 = _1831 + _1777;
        float _1835 = _1821 * _1821;
        float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1839 = _1815 + _1837;
        float _1841 = -_523;
        float _1843 = _1841 + _1779;
        float _1845 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1847 = fma(_1825, _1825, _1835);
        float _1849 = fma(_1839, _1839, _1847);
        float _1851 = 1.0 / _1413;
        float _1853 = sqrt(_1849);
        float _1855 = precise::min(_1853, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1857 = _1855 * _1817;
        float _1859 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1861 = _1857 * _1851;
        float _1863 = _1859 * _1861;
        float _1865 = _1829 * _1861;
        float _1867 = fma(_1833, _1863, _1811);
        float _1869 = fma(_1843, _1863, _1807);
        float _1871 = fma(_1859, _1865, _1815);
        _1795 = _1869;
        _1797 = _1867;
        _1799 = _1871;
        _1801 = _1817;
    }
    float _1873 = _1795;
    float _1875 = _1797;
    float _1877 = _1799;
    float _1879 = _1801;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1883 = _1873 + _1881;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1887 = _1875 + _1885;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1891 = _1877 + _1889;
    float _1893 = _1883 * _1883;
    float _1895 = fma(_1887, _1887, _1893);
    float _1897 = fma(_1891, _1891, _1895);
    float _1899 = rsqrt(_1897);
    float _1901 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1903 = _1887 * _1901;
    float _1905 = _1891 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 + _1909;
    float _1913 = sqrt(_1911);
    bool _1915 = _1913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = _1913 + _1917;
    float _1921 = _1891;
    float _1923 = _1879;
    float _1925 = _1919;
    float _1927 = _1883;
    float _1929 = _1903;
    if (_1915)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1921 = _1931;
    }
    float _1933 = _1921;
    if (_1915)
    {
        float _1935 = rsqrt(_1911);
        _1923 = _1935;
    }
    float _1937 = _1923;
    float _1939 = _1937;
    if (_1915)
    {
        float _1941 = _1919 * _1933;
        _1925 = _1941;
    }
    float _1943 = _1925;
    if (_1915)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1803 = _1945;
    }
    float _1947 = _1803;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1951 = _1895;
    if (_1915)
    {
        float _1953 = _1947 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1961 = precise::max(0.0, _1959);
    float _1963 = _1899;
    float _1965 = _1961;
    float _1967 = _1959;
    if (_1915)
    {
        float _1969 = _1947 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        _1963 = _1971;
    }
    float _1973 = _1963;
    float _1975 = -_1901;
    float _1977 = -_1961;
    float _1979 = fma(_1883, _1975, _1977);
    if (_1915)
    {
        float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _1981;
    }
    float _1983 = _1965;
    float _1985 = sqrt(_1897);
    float _1987 = _1957;
    float _1989 = _1983;
    if (_1915)
    {
        float _1991 = fma(_1957, _1983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1987 = _1991;
    }
    float _1993 = _1987;
    float _1995 = _1993;
    if (_1915)
    {
        float _1997 = _1973 + (-1.0);
        _1967 = _1997;
    }
    float _1999 = _1967;
    float _2001 = _1999;
    if (_1915)
    {
        float _2003 = _1937 * _1993;
        _1989 = _2003;
    }
    float _2005 = _1989;
    if (!_1915)
    {
        _1939 = _1979;
    }
    float _2007 = _1939;
    float _2009 = _2007;
    if (_1915)
    {
        float _2011 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _2011;
    }
    float _2013 = _1927;
    float _2015 = _2013;
    if (_1915)
    {
        float _2017 = _1903 * _2005;
        _1929 = _2017;
    }
    float _2019 = _1929;
    if (!_1915)
    {
        _1995 = _1905;
    }
    float _2021 = _1995;
    float _2023 = _2021;
    if (_1915)
    {
        float _2025 = _1905 * _2005;
        _2023 = _2025;
    }
    float _2027 = _2023;
    if (!_1915)
    {
        _2001 = _1907;
    }
    float _2029 = _2001;
    float _2031 = _2029;
    if (_1915)
    {
        float _2033 = fma(_1979, _1973, _2013);
        _2009 = _2033;
    }
    float _2035 = _2009;
    if (_1915)
    {
        float _2037 = _2019 * _2019;
        _2031 = _2037;
    }
    float _2039 = _2031;
    if (!_1915)
    {
        _2015 = _1909;
    }
    float _2041 = _2015;
    float _2043 = _2041;
    if (_1915)
    {
        float _2045 = _2027 * _2027;
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = fma(_2035, _2035, _2039);
    float _2051 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2053 = _2049 + _2047;
    float _2055 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2051);
    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2059 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2057);
    float _2061 = precise::clamp(_2059, 0.0, 1.0);
    float _2063 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2065 = rsqrt(_2053);
    float _2067 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2069 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2063);
    float _2073 = -_2061;
    float _2075 = _2073 + 1.0;
    float _2077 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2079 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2081 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2083 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2071);
    float _2085 = abs(_2075);
    float _2087 = log2(_2085);
    float _2089 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2077);
    float _2091 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2079);
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2095 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2097 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2099 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2101 = _2065 * _2019;
    float _2103 = _2065 * _2035;
    float _2105 = -_2095;
    float _2107 = fma(_2105, _1949, 1.0);
    float _2109 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2099);
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2113 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2089);
    float _2115 = _2065 * _2027;
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2109);
    float _2119 = -_2111;
    float _2121 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2119);
    float _2123 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2127 = log2(_2107);
    float _2129 = -_2115;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2121);
    float _2133 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2135 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    float _2137 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2139 = fma(_2131, -0.5, 0.5);
    float _2141 = fma(_2131, 0.5, 0.5);
    float _2143 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2133);
    float _2145 = exp2(_2123);
    float _2147 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2137);
    float _2149 = _2103 + 1.0;
    float _2151 = fma(_2141, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2153 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2143);
    float _2155 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2147);
    float _2157 = fma(_2141, _2151, -0.212114393711090087890625);
    float _2159 = 1.0 / _2135;
    float _2161 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2155);
    float _2163 = _2127 * 0.693147182464599609375;
    float _2165 = fma(_2141, _2157, 1.570728778839111328125);
    float _2167 = sqrt(_2139);
    float _2169 = -_2103;
    float _2171 = fma(_2145, _2149, _2169);
    float _2173 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2153);
    float _2175 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2177 = fma(_2171, 0.5, 0.5);
    float _2179 = _2173 * _2159;
    float _2181 = _2161 * _2159;
    float _2183 = fma(_2179, 0.5, 0.5);
    float _2185 = fma(_2181, -0.5, 0.5);
    float _2187 = _2167 * 0.636619746685028076171875;
    float _2189 = -_2165;
    float _2191 = fma(_2187, _2189, 1.0);
    float3 _5644 = float3(_2183, _2185, _2175);
    float _2193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5644, float3(0.0), isnan(_5644)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5644, float3(0.0), isnan(_5644)), level(0.0)).x;
    float3 _5655 = float3(_2183, _2185, _2175);
    float4 _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5655, float3(0.0), isnan(_5655)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5655, float3(0.0), isnan(_5655)), level(0.0)).xyzw;
    float _2198 = _2196.x;
    float _2200 = _2196.y;
    float _2202 = _2196.z;
    float _2204 = _2196.w;
    float2 _5672 = float2(_2191, _2177);
    float3 _2206 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(0.0)).xyz;
    float _2208 = _2206.x;
    float _2210 = _2206.y;
    float _2212 = _2206.z;
    float _2214 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2216 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2218 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2216);
    float _2220 = exp2(_2214);
    float _2222 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2224 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2222);
    float _2226 = _2224 + _2135;
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2161;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2135;
    float _2228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = _2226 * 0.5;
    float _2232 = -_2220;
    float _2234 = _2232 + 1.0;
    out.m_49.x = _2228;
    float _2236 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2230;
    out.m_71.w = _2135;
    float _2238 = _2236 * _2193;
    float _2240 = -_2236;
    float _2242 = _2240 + 1.0;
    float _2244 = _2204 * _2238;
    float _2246 = _2212 * _2238;
    float _2248 = _2204 * _2242;
    float _2250 = fma(_2208, _2244, _2198);
    float _2252 = fma(_2210, _2244, _2200);
    float _2254 = fma(_2204, _2246, _2202);
    out.m_73.x = _2250;
    out.m_73.y = _2252;
    out.m_73.z = _2254;
    out.m_73.w = _2248;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1723 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2311 = as_type<float>(_111);
        out.gl_Position.z = _2311;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_149);
        out.gl_Position.z = _2381;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_53.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    int _303 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _305 = _303;
    int _307 = 0;
    int _309 = _86(_305, _307, (*spvDescriptorSet0.support_buffer));
    float _311 = in.m_55.x;
    float _313 = in.m_57.z;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _317 = _315 != 0;
    float _319 = in.m_57.x;
    float _321 = in.m_55.z;
    float _323 = _311 * 8.0;
    float _325 = rint(_323);
    float _327 = _325 * 0.125;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    int _331 = _309 + (-1);
    float _333 = trunc(_313);
    int _335 = int(_333);
    float _337 = float(_331);
    float _339 = _329 * _337;
    float _341 = in.m_55.w;
    float _343 = trunc(_339);
    int _345 = int(_343);
    int _347 = _345 + 1;
    int _349 = min(_331, _347);
    int _351 = _345;
    int _353 = 0;
    int _355 = _87(_351, _353, (*spvDescriptorSet0.support_buffer));
    int _357 = _335;
    int _359 = 0;
    int _361 = _87(_357, _359, (*spvDescriptorSet0.support_buffer));
    float3 _365 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_355, _361)), 0).xyz;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = _365.z;
    int _373 = _349;
    int _375 = 0;
    int _377 = _87(_373, _375, (*spvDescriptorSet0.support_buffer));
    int _379 = _335;
    int _381 = 0;
    int _383 = _87(_379, _381, (*spvDescriptorSet0.support_buffer));
    float3 _385 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_377, _383)), 0).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _395 = _393 != 0;
    int _397 = as_type<int>(_325);
    int _399 = _347;
    float _401 = _319;
    if (_317)
    {
        float _403 = -_319;
        float _405 = _403 + 1.0;
        _397 = as_type<int>(_405);
    }
    int _407 = _397;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _411 = _409 != 0;
    float _413 = in.m_57.y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _417 = _415 != 0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _301 + _419;
    bool _423 = false;
    float _425 = _413;
    if (_317)
    {
        bool _427 = _311 > 0.5;
        _423 = _427;
    }
    bool _429 = _423;
    float _431 = in.m_55.y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _435 = _301 + _433;
    float _437 = 0.0;
    bool _439 = _429;
    if (!_317)
    {
        _437 = _319;
    }
    float _441 = _437;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _445 = _301 + _443;
    float _447 = _441;
    if (_317)
    {
        float _449 = _429 ? as_type<float>(_407) : _319;
        _447 = _449;
    }
    float _451 = _447;
    if (_395)
    {
        float _453 = -_319;
        float _455 = _453 + 1.0;
        _399 = as_type<int>(_455);
    }
    int _457 = _399;
    if (_395)
    {
        bool _459 = _321 > 0.5;
        _439 = _459;
    }
    bool _461 = _439;
    float _463 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _465 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _469 = _467 != 0;
    float _471 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _473 = _341 > 0.5;
    float _475 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
    float _477 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    if (_395)
    {
        float _479 = _461 ? as_type<float>(_457) : _319;
        _401 = _479;
    }
    float _481 = _401;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _485 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _505 = _503 != 0;
    float _507 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _509 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _475);
    float _511 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    float _513 = fma(_507, -2.0, _483);
    float _515 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _517 = 1.0 / _493;
    float _519 = _311 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _513);
    float _523 = _511 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _525 = 1.0 / _489;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _539 = _321 * 2.0;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _543 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _545;
    float _549 = 0.0;
    if (!_469)
    {
        _549 = _431;
    }
    float _551 = _549;
    float _553 = -_541;
    float _555 = fma(_519, 2.0, _553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _557;
    float _561 = floor(_539);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _567 = _421 * _525;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _571 = _301 + _569;
    float _573 = 0.0;
    float _575 = _551;
    if (!_469)
    {
        _573 = _321;
    }
    float _577 = _573;
    float _579 = -_129;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[76].x, _555);
    float _583 = 0.0;
    float _585 = _577;
    if (!_469)
    {
        _583 = _321;
    }
    float _587 = _583;
    float _589 = _509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _591 = 1.0 / _547;
    float _593 = _587;
    if (_469)
    {
        _575 = _311;
    }
    float _595 = _575;
    if (_469)
    {
        _585 = _431;
    }
    float _597 = _585;
    if (_469)
    {
        _593 = _431;
    }
    float _599 = _593;
    float _601 = 1.0 / _559;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _607 = -_413;
    float _609 = _607 + 1.0;
    bool _611 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_301);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _631 = _473 ? as_type<int>(_609) : as_type<int>(_413);
    float _633 = 1.0 / _565;
    float _635 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _411 ? as_type<float>(_631) : _413;
    float _643 = _445 * _591;
    bool _645 = _561 > 0.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _647;
    float _651 = 1.0 / _605;
    float _653 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _657 = _561 >= 0.0;
    bool _659 = isnan(_561);
    bool _661 = _657 || _659;
    bool _663 = isnan(0.0);
    bool _665 = _661 || _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _669 = _301 + _667;
    out.m_59.x = _543;
    out.m_59.y = _635;
    out.m_59.z = _653;
    float _671 = _669 * _517;
    float _673 = _431 * 2.0;
    out.m_61.x = _637;
    out.m_61.y = _655;
    out.m_61.z = _639;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _677 = _301 + _675;
    float _679 = fma(_649, _643, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _681 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _683 = isnan(_301);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = _677 * _633;
    float _695 = _435 * _651;
    float _697 = _311 + _431;
    int _699 = _665 ? 0 : 1;
    float _701 = floor(_673);
    bool _703 = _431 > 0.5;
    float _705 = _311 * 2.0;
    float _707 = _697 + (-1.0);
    float _709 = _571 * _601;
    if (_417)
    {
        float _711 = _703 ? _609 : _413;
        _425 = _711;
    }
    float _713 = _425;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _715;
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _721 = floor(_705);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _731;
    float _735 = fma(_725, _695, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _737;
    int _741 = ~_699;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    float _747 = fma(_733, _567, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _749 = _745;
    if (!_645)
    {
        int _751 = ~_699;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    float _757 = fma(_739, _567, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _763 = _701 > 0.0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _769 = _701 >= 0.0;
    bool _771 = isnan(_701);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _787;
    float _791 = fma(_761, _671, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _793 = fma(_781, _567, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _799;
    bool _803 = _721 > 0.0;
    float _805 = fma(_767, _671, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _807 = _721 >= 0.0;
    bool _809 = isnan(_721);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    float _817 = fma(_801, _709, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _819 = fma(_785, _709, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _821 = fma(_797, _671, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _823 = fma(_789, _709, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _833 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _835 = isnan(_301);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _849 = fma(_827, _693, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _851 = fma(_831, _693, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _853 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _855 = isnan(_301);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = fma(_847, _693, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _867 = -_843;
    float _869 = _867 + 1.0;
    bool _871 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _873 = isnan(_301);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _885 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _887 = isnan(_301);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _863 * _869;
    float _899 = -_863;
    float _901 = _899 + 1.0;
    float _903 = -_881;
    float _905 = _903 + 1.0;
    bool _907 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _909 = isnan(_301);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = -_895;
    float _921 = _919 + 1.0;
    float _923 = _881 * _901;
    float _925 = _895 * _905;
    float _927 = fma(_625, _643, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _929 = _621 * _921;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _933 = -_621;
    float _935 = _933 + 1.0;
    float _937 = fma(_717, _643, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _939 = _597 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _941 = _691 * _935;
    float _943 = -_691;
    float _945 = _943 + 1.0;
    float _947 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _949 = log2(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _953 = _917 * _945;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _957 = _883 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _959 = _747 * _953;
    float _961 = _757 * _953;
    float _963 = _793 * _953;
    float _965 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _967 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[83].z, _951);
    float _969 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _973 = fma(_965, _713, -0.5);
    float _975 = -_955;
    float _977 = fma(_969, 2.0, _975);
    float _979 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].w, _971);
    float _981 = fma(_629, _695, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _983 = _949 * _129;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _987 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _979);
    float _989 = -_917;
    float _991 = _989 + 1.0;
    float _993 = fma(_939, -2.0, _985);
    float _995 = -_521;
    float _997 = fma(_987, _973, _995);
    float _999 = exp2(_983);
    int _1001 = _815 ? 0 : 1;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].x, _959);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].y, _961);
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].z, _963);
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1011 = _777 ? 0 : 1;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1015 = ~_1001;
    int _1017 = _1015 + 1;
    int _1019 = _1017 + 1;
    float _1021 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1009);
    int _1023 = _1019;
    if (!_803)
    {
        int _1025 = ~_1001;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1033 = 1.0 + _1031;
    int _1035 = ~_1011;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    float _1041 = fma(_641, _957, -0.5);
    int _1043 = _1039;
    if (!_763)
    {
        int _1045 = ~_1011;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1053 = fma(_805, _941, _1003);
    bool _1055 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1057 = isnan(1.0);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1063 = _1059 || _1061;
    float _1065 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1021);
    float _1067 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _993);
    float _1069 = fma(_791, _941, _1005);
    float _1071 = fma(_821, _941, _1007);
    float _1073 = 1.0 / _1033;
    float _1075 = -_1067;
    float _1077 = fma(_1065, _1041, _1075);
    float _1079 = -_999;
    float _1081 = _1079 + 1.0;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1085 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1097 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _967);
    float _1099 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1083);
    float _1101 = _1093 ? _1081 : 0.0;
    float _1103 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1105 = -_129;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[81].x, _977);
    float _1109 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1099);
    float _1111 = fma(_1095, _451, -0.5);
    float _1113 = fma(_817, _929, _1053);
    float _1115 = fma(_819, _929, _1069);
    float _1117 = fma(_823, _929, _1071);
    if (_1063)
    {
        float _1119 = _1101 * _1073;
        _131 = _1119;
    }
    float _1121 = _131;
    float _1123 = fma(_1103, _481, -0.5);
    bool _1125 = !_497;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = in.m_63.x;
    float _1131 = in.m_63.y;
    float _1133 = in.m_63.z;
    float _1135 = fma(_1109, _1111, _581);
    float _1137 = float(_755);
    float _1139 = fma(_849, _925, _1113);
    int _1141 = abs(_1127);
    float _1143 = _515 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1145 = !_505;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = _523 + _1149;
    float _1153 = fma(_927, _923, _1139);
    int _1155 = abs(_1147);
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1159 = _589 + _1157;
    float _1161 = float(_1141);
    float _1163 = _1151 * _1151;
    float _1165 = fma(_851, _925, _1115);
    float _1167 = fma(_865, _925, _1117);
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1171 = _1143 + _1169;
    float _1173 = _1161 * _1137;
    float _1175 = fma(_1159, _1159, _1163);
    float _1177 = fma(_729, _695, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _1179 = fma(_679, _923, _1165);
    float _1181 = _1173 * (-2.0);
    float _1183 = fma(_937, _923, _1167);
    float _1185 = float(_1155);
    float _1187 = fma(_1171, _1171, _1175);
    float _1189 = fma(_719, _1181, _719);
    float _1191 = fma(_1181, _1129, _1129);
    float _1193 = _311 + (-0.5);
    float _1195 = float(_1049);
    float _1197 = _311 + _321;
    float _1199 = fma(_981, _897, _1153);
    float _1201 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1191);
    bool _1203 = !_501;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_735, _897, _1179);
    float _1209 = fma(_1177, _897, _1183);
    float _1211 = fma(_1097, _1123, _1107);
    int _1213 = abs(_1205);
    float _1215 = _997 + 0.5;
    float _1217 = _1197 + (-1.0);
    float _1219 = _1185 * _1195;
    float _1221 = rsqrt(_1187);
    float _1223 = float(_1213);
    float _1225 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = float(_1029);
    float _1229 = _1219 * (-2.0);
    float _1231 = _1077 + 0.5;
    float _1233 = _1135 + 0.5;
    float _1235 = _1211 + 0.5;
    float _1237 = _1223 * _1227;
    float _1239 = _321 + (-0.5);
    float _1241 = fma(_1229, _1133, _1133);
    float _1243 = _431 + _321;
    float _1245 = fma(_1225, _1229, _1225);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1241);
    float _1249 = _1243 + (-1.0);
    float _1251 = _1237 * (-2.0);
    float _1253 = _431 + (-0.5);
    float _1255 = fma(_1245, _1121, _1247);
    float _1257 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1259 = fma(_1251, _1131, _1131);
    float _1261 = _1151 * _1221;
    float _1263 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1199);
    float _1265 = _1255 * 0.15915493667125701904296875;
    out.m_65.x = _1233;
    out.m_65.y = _1215;
    out.m_65.z = _1235;
    out.m_65.w = _1231;
    float _1267 = fma(_1257, _1251, _1257);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1259);
    float _1271 = -_1261;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    float _1275 = in.m_53.x;
    float _1277 = in.m_53.y;
    float _1279 = in.m_53.z;
    float _1281 = fma(_1189, _1121, _1201);
    float _1283 = fma(_1267, _1121, _1269);
    float _1285 = _1273 * _1273;
    float _1287 = _1265 * 6.283185482025146484375;
    float _1289 = sin(_1287);
    float _1291 = _1281 * 0.15915493667125701904296875;
    float _1293 = _1283 * 0.15915493667125701904296875;
    float _1295 = -_371;
    float _1297 = _1295 + _391;
    float _1299 = _1159 * _1221;
    float _1301 = _1171 * _1221;
    float _1303 = _1291 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1207);
    float _1309 = -_1299;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1159);
    float _1313 = -_1301;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1171);
    float _1317 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1209);
    float _1319 = fma(_1311, _1311, _1285);
    float _1321 = _1291 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = fma(_1315, _1315, _1319);
    float _1327 = _1317 * _1279;
    float _1329 = _1263 * _1275;
    float _1331 = _1307 * _1277;
    float _1333 = _1293 * 6.283185482025146484375;
    float _1335 = cos(_1333);
    float _1337 = _1305 * _1289;
    float _1339 = floor(_339);
    float _1341 = _1323 * _1289;
    float _1343 = _1265 * 6.283185482025146484375;
    float _1345 = cos(_1343);
    float _1347 = _1335 * _1289;
    float _1349 = -_367;
    float _1351 = _1349 + _387;
    float _1353 = _1305 * _1335;
    float _1355 = _1293 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = -_1339;
    float _1361 = _339 + _1359;
    float _1363 = fma(_1361, _1351, _367);
    float _1365 = -_369;
    float _1367 = _1365 + _389;
    float _1369 = fma(_1361, _1297, _371);
    float _1371 = sqrt(_1325);
    float _1373 = _1323 * _1345;
    float _1375 = _1305 * _1345;
    float _1377 = _1335 * _1345;
    float _1379 = _1323 * _1335;
    float _1381 = fma(_1361, _1367, _369);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1369);
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1363);
    float _1387 = fma(_1357, _1337, _1373);
    float _1389 = fma(_1357, _1373, _1337);
    float _1391 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1393 = -_1341;
    float _1395 = fma(_1357, _1375, _1393);
    float _1397 = -_1375;
    float _1399 = fma(_1357, _1341, _1397);
    float _1401 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1403 = _1381 != 0.0;
    bool _1405 = isnan(_1381);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.0);
    bool _1411 = _1407 || _1409;
    float _1413 = _1221 * _1371;
    bool _1415 = _1363 == 0.0;
    bool _1417 = !_1411;
    bool _1419 = _1415 && _1417;
    float _1421 = _1391 * _1413;
    float _1423 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1425 = _1401 * _1413;
    bool _1427 = _1369 == 0.0;
    bool _1429 = _1427 && _1419;
    float _1431 = _1421 * _1383;
    float _1433 = _1423 * _1413;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1381);
    float _1437 = _1425 * _1385;
    float _1439 = _1387 * _1431;
    float _1441 = _1395 * _1431;
    float _1443 = _1433 * _1435;
    float _1445 = _1353 * _1431;
    float _1447 = fma(_1347, _1437, _1439);
    float _1449 = fma(_1377, _1437, _1441);
    float _1451 = -_1357;
    float _1453 = fma(_1451, _1437, _1445);
    float _1455 = -_1443;
    float _1457 = fma(_1399, _1455, _1447);
    float _1459 = -_1443;
    float _1461 = fma(_1389, _1459, _1449);
    float _1463 = -_1443;
    float _1465 = fma(_1379, _1463, _1453);
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1471 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1467);
    float _1475 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1469);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1471);
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1473);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1483 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1485 = _589 + _1479;
    float _1487 = _1143 + _1481;
    float _1489 = in.m_67.x;
    float _1491 = in.m_67.y;
    float _1493 = in.m_67.z;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1497 = _1485 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1501 = _1487 + _1499;
    float _1503 = _1497 * _1497;
    float _1505 = _1501 * _1501;
    float _1507 = _1503 + _1505;
    float _1509 = sqrt(_1507);
    float _1511 = _1493;
    float _1513 = _1489;
    float _1515 = _1395;
    float _1517 = _1369;
    float _1519 = _1461;
    float _1521 = _1491;
    if (!_1429)
    {
        float _1523 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1493);
        _1511 = _1523;
    }
    float _1525 = _1511;
    float _1527 = _1525;
    if (!_1429)
    {
        float _1529 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1513 = _1529;
    }
    float _1531 = _1513;
    float _1533 = _1387 * _1525;
    float _1535 = _523 + _1483;
    float _1537 = _1353 * _1525;
    bool _1539 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1395 * _1525;
    float _1543 = fma(_1347, _1531, _1533);
    float _1545 = _1533;
    if (!_1539)
    {
        _1515 = _1505;
    }
    float _1547 = _1515;
    float _1549 = _1547;
    if (!_1539)
    {
        _1545 = _1503;
    }
    float _1551 = _1545;
    float _1553 = _1551;
    if (!_1539)
    {
        _1517 = _1485;
    }
    float _1555 = _1517;
    float _1557 = _1555;
    if (!_1539)
    {
        _1527 = _1487;
    }
    float _1559 = _1527;
    float _1561 = _1559;
    if (!_1539)
    {
        _1519 = _1535;
    }
    float _1563 = _1519;
    bool _1565 = !_1539;
    float _1567 = _1563;
    if (!_1565)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1573 = _1509 + _1571;
        float _1575 = rsqrt(_1507);
        float _1577 = _1573 * _1569;
        float _1579 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = _1577 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        float _1587 = _1581 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = fma(_1585, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1593 = _1575 * _1591;
        float _1595 = _1589 + (-1.0);
        float _1597 = fma(_1497, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = fma(_1501, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1605 = _1597 + _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1609 = _1599 + _1607;
        float _1611 = fma(_1535, _1589, _1601);
        float _1613 = _1605 * _1605;
        float _1615 = _1609 * _1609;
        _1567 = _1611;
        _1553 = _1613;
        _1549 = _1615;
        _1557 = _1597;
        _1561 = _1599;
    }
    float _1617 = _1567;
    float _1619 = _1553;
    float _1621 = _1549;
    float _1623 = _1557;
    float _1625 = _1561;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1629 = _1617 + _1627;
    if (!_1429)
    {
        float _1631 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1521 = _1631;
    }
    float _1633 = _1521;
    float _1635 = fma(_1377, _1531, _1541);
    float _1637 = -_1357;
    float _1639 = fma(_1637, _1531, _1537);
    float _1641 = fma(_1629, _1629, _1619);
    float _1643 = -_1633;
    float _1645 = fma(_1399, _1643, _1543);
    float _1647 = -_1633;
    float _1649 = fma(_1389, _1647, _1635);
    float _1651 = -_1633;
    float _1653 = fma(_1379, _1651, _1639);
    float _1655 = _1641 + _1621;
    float _1657 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1661 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1663 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1657);
    float _1665 = sqrt(_1655);
    float _1667 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1659);
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1661);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1663);
    float _1673 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1667);
    float _1675 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1669);
    out.m_69.x = _1671;
    out.m_69.y = _1673;
    out.m_69.z = _1675;
    bool _1677 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1679 = isnan(_1665);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1685 = _1681 || _1683;
    float _1687 = _1663;
    if (!_1685)
    {
        _1687 = 1.0;
    }
    float _1689 = _1687;
    bool _1691 = !_1685;
    float _1693 = _1689;
    if (!_1691)
    {
        bool _1695 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1697 = isnan(_1665);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1703 = _1699 || _1701;
        if (!_1703)
        {
            float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1707 = _1665 + _1705;
            float _1709 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1711 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1709;
            float _1713 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1717 = 1.0 / _1711;
            float _1719 = _1707 * _1717;
            float _1721 = fma(_1719, _1715, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1693 = _1721;
            _1723 = true;
        }
        else
        {
            bool _1725 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1727 = isnan(_1665);
            bool _1729 = _1725 || _1727;
            bool _1731 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1733 = _1729 || _1731;
            if (!_1733)
            {
                float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1737 = _1665 + _1735;
                float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1741 = _1739 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1745 = _1743 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1747 = 1.0 / _1741;
                float _1749 = _1737 * _1747;
                float _1751 = fma(_1749, _1745, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1693 = _1751;
                _1723 = true;
            }
            else
            {
                _1693 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1723 = false;
    float _1753 = _1693;
    float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1757 = _1623 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1761 = _1617 + _1759;
    bool _1763 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan(0.5);
    bool _1771 = _1767 || _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1775 = _1625 + _1773;
    float _1777 = fma(_1757, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1779 = fma(_1761, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1781 = fma(_1775, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1783 = -_1299;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1777);
    float _1787 = -_1261;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1779);
    float _1791 = -_1301;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1781);
    float _1795 = _1789;
    float _1797 = _1785;
    float _1799 = _1793;
    float _1801 = _1757;
    float _1803 = _1779;
    if (!_1771)
    {
        float _1805 = -_1261;
        float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
        float _1809 = -_1299;
        float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
        float _1813 = -_1301;
        float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1143);
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1821 = _1807 + _1819;
        float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1825 = _1811 + _1823;
        float _1827 = -_1143;
        float _1829 = _1827 + _1781;
        float _1831 = -_589;
        float _1833 = _1831 + _1777;
        float _1835 = _1821 * _1821;
        float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1839 = _1815 + _1837;
        float _1841 = -_523;
        float _1843 = _1841 + _1779;
        float _1845 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1847 = fma(_1825, _1825, _1835);
        float _1849 = fma(_1839, _1839, _1847);
        float _1851 = 1.0 / _1413;
        float _1853 = sqrt(_1849);
        float _1855 = precise::min(_1853, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1857 = _1855 * _1817;
        float _1859 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1861 = _1857 * _1851;
        float _1863 = _1859 * _1861;
        float _1865 = _1829 * _1861;
        float _1867 = fma(_1833, _1863, _1811);
        float _1869 = fma(_1843, _1863, _1807);
        float _1871 = fma(_1859, _1865, _1815);
        _1795 = _1869;
        _1797 = _1867;
        _1799 = _1871;
        _1801 = _1817;
    }
    float _1873 = _1795;
    float _1875 = _1797;
    float _1877 = _1799;
    float _1879 = _1801;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1883 = _1873 + _1881;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1887 = _1875 + _1885;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1891 = _1877 + _1889;
    float _1893 = _1883 * _1883;
    float _1895 = fma(_1887, _1887, _1893);
    float _1897 = fma(_1891, _1891, _1895);
    float _1899 = rsqrt(_1897);
    float _1901 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1903 = _1887 * _1901;
    float _1905 = _1891 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 + _1909;
    float _1913 = sqrt(_1911);
    bool _1915 = _1913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = _1913 + _1917;
    float _1921 = _1891;
    float _1923 = _1879;
    float _1925 = _1919;
    float _1927 = _1883;
    float _1929 = _1903;
    if (_1915)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1921 = _1931;
    }
    float _1933 = _1921;
    if (_1915)
    {
        float _1935 = rsqrt(_1911);
        _1923 = _1935;
    }
    float _1937 = _1923;
    float _1939 = _1937;
    if (_1915)
    {
        float _1941 = _1919 * _1933;
        _1925 = _1941;
    }
    float _1943 = _1925;
    if (_1915)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1803 = _1945;
    }
    float _1947 = _1803;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1951 = _1895;
    if (_1915)
    {
        float _1953 = _1947 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1961 = precise::max(0.0, _1959);
    float _1963 = _1899;
    float _1965 = _1961;
    float _1967 = _1959;
    if (_1915)
    {
        float _1969 = _1947 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        _1963 = _1971;
    }
    float _1973 = _1963;
    float _1975 = -_1901;
    float _1977 = -_1961;
    float _1979 = fma(_1883, _1975, _1977);
    if (_1915)
    {
        float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _1981;
    }
    float _1983 = _1965;
    float _1985 = sqrt(_1897);
    float _1987 = _1957;
    float _1989 = _1983;
    if (_1915)
    {
        float _1991 = fma(_1957, _1983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1987 = _1991;
    }
    float _1993 = _1987;
    float _1995 = _1993;
    if (_1915)
    {
        float _1997 = _1973 + (-1.0);
        _1967 = _1997;
    }
    float _1999 = _1967;
    float _2001 = _1999;
    if (_1915)
    {
        float _2003 = _1937 * _1993;
        _1989 = _2003;
    }
    float _2005 = _1989;
    if (!_1915)
    {
        _1939 = _1979;
    }
    float _2007 = _1939;
    float _2009 = _2007;
    if (_1915)
    {
        float _2011 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _2011;
    }
    float _2013 = _1927;
    float _2015 = _2013;
    if (_1915)
    {
        float _2017 = _1903 * _2005;
        _1929 = _2017;
    }
    float _2019 = _1929;
    if (!_1915)
    {
        _1995 = _1905;
    }
    float _2021 = _1995;
    float _2023 = _2021;
    if (_1915)
    {
        float _2025 = _1905 * _2005;
        _2023 = _2025;
    }
    float _2027 = _2023;
    if (!_1915)
    {
        _2001 = _1907;
    }
    float _2029 = _2001;
    float _2031 = _2029;
    if (_1915)
    {
        float _2033 = fma(_1979, _1973, _2013);
        _2009 = _2033;
    }
    float _2035 = _2009;
    if (_1915)
    {
        float _2037 = _2019 * _2019;
        _2031 = _2037;
    }
    float _2039 = _2031;
    if (!_1915)
    {
        _2015 = _1909;
    }
    float _2041 = _2015;
    float _2043 = _2041;
    if (_1915)
    {
        float _2045 = _2027 * _2027;
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = fma(_2035, _2035, _2039);
    float _2051 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2053 = _2049 + _2047;
    float _2055 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2051);
    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2059 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2057);
    float _2061 = precise::clamp(_2059, 0.0, 1.0);
    float _2063 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2065 = rsqrt(_2053);
    float _2067 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2069 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2063);
    float _2073 = -_2061;
    float _2075 = _2073 + 1.0;
    float _2077 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2079 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2081 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2083 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2071);
    float _2085 = abs(_2075);
    float _2087 = log2(_2085);
    float _2089 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2077);
    float _2091 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2079);
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2095 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2097 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2099 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2101 = _2065 * _2019;
    float _2103 = _2065 * _2035;
    float _2105 = -_2095;
    float _2107 = fma(_2105, _1949, 1.0);
    float _2109 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2099);
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2113 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2089);
    float _2115 = _2065 * _2027;
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2109);
    float _2119 = -_2111;
    float _2121 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2119);
    float _2123 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2127 = log2(_2107);
    float _2129 = -_2115;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2121);
    float _2133 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2135 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    float _2137 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2139 = fma(_2131, -0.5, 0.5);
    float _2141 = fma(_2131, 0.5, 0.5);
    float _2143 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2133);
    float _2145 = exp2(_2123);
    float _2147 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2137);
    float _2149 = _2103 + 1.0;
    float _2151 = fma(_2141, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2153 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2143);
    float _2155 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2147);
    float _2157 = fma(_2141, _2151, -0.212114393711090087890625);
    float _2159 = 1.0 / _2135;
    float _2161 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2155);
    float _2163 = _2127 * 0.693147182464599609375;
    float _2165 = fma(_2141, _2157, 1.570728778839111328125);
    float _2167 = sqrt(_2139);
    float _2169 = -_2103;
    float _2171 = fma(_2145, _2149, _2169);
    float _2173 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2153);
    float _2175 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2177 = fma(_2171, 0.5, 0.5);
    float _2179 = _2173 * _2159;
    float _2181 = _2161 * _2159;
    float _2183 = fma(_2179, 0.5, 0.5);
    float _2185 = fma(_2181, -0.5, 0.5);
    float _2187 = _2167 * 0.636619746685028076171875;
    float _2189 = -_2165;
    float _2191 = fma(_2187, _2189, 1.0);
    float3 _5644 = float3(_2183, _2185, _2175);
    float _2193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5644, float3(0.0), isnan(_5644)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5644, float3(0.0), isnan(_5644)), level(0.0)).x;
    float3 _5655 = float3(_2183, _2185, _2175);
    float4 _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5655, float3(0.0), isnan(_5655)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5655, float3(0.0), isnan(_5655)), level(0.0)).xyzw;
    float _2198 = _2196.x;
    float _2200 = _2196.y;
    float _2202 = _2196.z;
    float _2204 = _2196.w;
    float2 _5672 = float2(_2191, _2177);
    float3 _2206 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(0.0)).xyz;
    float _2208 = _2206.x;
    float _2210 = _2206.y;
    float _2212 = _2206.z;
    float _2214 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2216 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2218 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2216);
    float _2220 = exp2(_2214);
    float _2222 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2224 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2222);
    float _2226 = _2224 + _2135;
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2161;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2135;
    float _2228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = _2226 * 0.5;
    float _2232 = -_2220;
    float _2234 = _2232 + 1.0;
    out.m_49.x = _2228;
    float _2236 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2230;
    out.m_71.w = _2135;
    float _2238 = _2236 * _2193;
    float _2240 = -_2236;
    float _2242 = _2240 + 1.0;
    float _2244 = _2204 * _2238;
    float _2246 = _2212 * _2238;
    float _2248 = _2204 * _2242;
    float _2250 = fma(_2208, _2244, _2198);
    float _2252 = fma(_2210, _2244, _2200);
    float _2254 = fma(_2204, _2246, _2202);
    out.m_73.x = _2250;
    out.m_73.y = _2252;
    out.m_73.z = _2254;
    out.m_73.w = _2248;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1723 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2311 = as_type<float>(_111);
        out.gl_Position.z = _2311;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_149);
        out.gl_Position.z = _2381;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_53.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    int _303 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _305 = _303;
    int _307 = 0;
    int _309 = _86(_305, _307, (*spvDescriptorSet0.support_buffer));
    float _311 = in.m_55.x;
    float _313 = in.m_57.z;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _317 = _315 != 0;
    float _319 = in.m_57.x;
    float _321 = in.m_55.z;
    float _323 = _311 * 8.0;
    float _325 = rint(_323);
    float _327 = _325 * 0.125;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    int _331 = _309 + (-1);
    float _333 = trunc(_313);
    int _335 = int(_333);
    float _337 = float(_331);
    float _339 = _329 * _337;
    float _341 = in.m_55.w;
    float _343 = trunc(_339);
    int _345 = int(_343);
    int _347 = _345 + 1;
    int _349 = min(_331, _347);
    int _351 = _345;
    int _353 = 0;
    int _355 = _87(_351, _353, (*spvDescriptorSet0.support_buffer));
    int _357 = _335;
    int _359 = 0;
    int _361 = _87(_357, _359, (*spvDescriptorSet0.support_buffer));
    float3 _365 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_355, _361)), 0).xyz;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = _365.z;
    int _373 = _349;
    int _375 = 0;
    int _377 = _87(_373, _375, (*spvDescriptorSet0.support_buffer));
    int _379 = _335;
    int _381 = 0;
    int _383 = _87(_379, _381, (*spvDescriptorSet0.support_buffer));
    float3 _385 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_377, _383)), 0).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _395 = _393 != 0;
    int _397 = as_type<int>(_325);
    int _399 = _347;
    float _401 = _319;
    if (_317)
    {
        float _403 = -_319;
        float _405 = _403 + 1.0;
        _397 = as_type<int>(_405);
    }
    int _407 = _397;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _411 = _409 != 0;
    float _413 = in.m_57.y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _417 = _415 != 0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _301 + _419;
    bool _423 = false;
    float _425 = _413;
    if (_317)
    {
        bool _427 = _311 > 0.5;
        _423 = _427;
    }
    bool _429 = _423;
    float _431 = in.m_55.y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _435 = _301 + _433;
    float _437 = 0.0;
    bool _439 = _429;
    if (!_317)
    {
        _437 = _319;
    }
    float _441 = _437;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _445 = _301 + _443;
    float _447 = _441;
    if (_317)
    {
        float _449 = _429 ? as_type<float>(_407) : _319;
        _447 = _449;
    }
    float _451 = _447;
    if (_395)
    {
        float _453 = -_319;
        float _455 = _453 + 1.0;
        _399 = as_type<int>(_455);
    }
    int _457 = _399;
    if (_395)
    {
        bool _459 = _321 > 0.5;
        _439 = _459;
    }
    bool _461 = _439;
    float _463 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _465 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _469 = _467 != 0;
    float _471 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _473 = _341 > 0.5;
    float _475 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
    float _477 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    if (_395)
    {
        float _479 = _461 ? as_type<float>(_457) : _319;
        _401 = _479;
    }
    float _481 = _401;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _485 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _505 = _503 != 0;
    float _507 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _509 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _475);
    float _511 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    float _513 = fma(_507, -2.0, _483);
    float _515 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _517 = 1.0 / _493;
    float _519 = _311 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _513);
    float _523 = _511 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _525 = 1.0 / _489;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _539 = _321 * 2.0;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _543 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _545;
    float _549 = 0.0;
    if (!_469)
    {
        _549 = _431;
    }
    float _551 = _549;
    float _553 = -_541;
    float _555 = fma(_519, 2.0, _553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _557;
    float _561 = floor(_539);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _567 = _421 * _525;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _571 = _301 + _569;
    float _573 = 0.0;
    float _575 = _551;
    if (!_469)
    {
        _573 = _321;
    }
    float _577 = _573;
    float _579 = -_129;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[76].x, _555);
    float _583 = 0.0;
    float _585 = _577;
    if (!_469)
    {
        _583 = _321;
    }
    float _587 = _583;
    float _589 = _509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _591 = 1.0 / _547;
    float _593 = _587;
    if (_469)
    {
        _575 = _311;
    }
    float _595 = _575;
    if (_469)
    {
        _585 = _431;
    }
    float _597 = _585;
    if (_469)
    {
        _593 = _431;
    }
    float _599 = _593;
    float _601 = 1.0 / _559;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _607 = -_413;
    float _609 = _607 + 1.0;
    bool _611 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_301);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _631 = _473 ? as_type<int>(_609) : as_type<int>(_413);
    float _633 = 1.0 / _565;
    float _635 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _411 ? as_type<float>(_631) : _413;
    float _643 = _445 * _591;
    bool _645 = _561 > 0.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _647;
    float _651 = 1.0 / _605;
    float _653 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _657 = _561 >= 0.0;
    bool _659 = isnan(_561);
    bool _661 = _657 || _659;
    bool _663 = isnan(0.0);
    bool _665 = _661 || _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _669 = _301 + _667;
    out.m_59.x = _543;
    out.m_59.y = _635;
    out.m_59.z = _653;
    float _671 = _669 * _517;
    float _673 = _431 * 2.0;
    out.m_61.x = _637;
    out.m_61.y = _655;
    out.m_61.z = _639;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _677 = _301 + _675;
    float _679 = fma(_649, _643, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _681 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _683 = isnan(_301);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = _677 * _633;
    float _695 = _435 * _651;
    float _697 = _311 + _431;
    int _699 = _665 ? 0 : 1;
    float _701 = floor(_673);
    bool _703 = _431 > 0.5;
    float _705 = _311 * 2.0;
    float _707 = _697 + (-1.0);
    float _709 = _571 * _601;
    if (_417)
    {
        float _711 = _703 ? _609 : _413;
        _425 = _711;
    }
    float _713 = _425;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _715;
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _721 = floor(_705);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _731;
    float _735 = fma(_725, _695, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _737;
    int _741 = ~_699;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    float _747 = fma(_733, _567, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _749 = _745;
    if (!_645)
    {
        int _751 = ~_699;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    float _757 = fma(_739, _567, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _763 = _701 > 0.0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _769 = _701 >= 0.0;
    bool _771 = isnan(_701);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _787;
    float _791 = fma(_761, _671, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _793 = fma(_781, _567, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _799;
    bool _803 = _721 > 0.0;
    float _805 = fma(_767, _671, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _807 = _721 >= 0.0;
    bool _809 = isnan(_721);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    float _817 = fma(_801, _709, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _819 = fma(_785, _709, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _821 = fma(_797, _671, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _823 = fma(_789, _709, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _833 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _835 = isnan(_301);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _849 = fma(_827, _693, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _851 = fma(_831, _693, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _853 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _855 = isnan(_301);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = fma(_847, _693, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _867 = -_843;
    float _869 = _867 + 1.0;
    bool _871 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _873 = isnan(_301);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _885 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _887 = isnan(_301);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _863 * _869;
    float _899 = -_863;
    float _901 = _899 + 1.0;
    float _903 = -_881;
    float _905 = _903 + 1.0;
    bool _907 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _909 = isnan(_301);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = -_895;
    float _921 = _919 + 1.0;
    float _923 = _881 * _901;
    float _925 = _895 * _905;
    float _927 = fma(_625, _643, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _929 = _621 * _921;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _933 = -_621;
    float _935 = _933 + 1.0;
    float _937 = fma(_717, _643, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _939 = _597 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _941 = _691 * _935;
    float _943 = -_691;
    float _945 = _943 + 1.0;
    float _947 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _949 = log2(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _953 = _917 * _945;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _957 = _883 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _959 = _747 * _953;
    float _961 = _757 * _953;
    float _963 = _793 * _953;
    float _965 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _967 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[83].z, _951);
    float _969 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _973 = fma(_965, _713, -0.5);
    float _975 = -_955;
    float _977 = fma(_969, 2.0, _975);
    float _979 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].w, _971);
    float _981 = fma(_629, _695, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _983 = _949 * _129;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _987 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _979);
    float _989 = -_917;
    float _991 = _989 + 1.0;
    float _993 = fma(_939, -2.0, _985);
    float _995 = -_521;
    float _997 = fma(_987, _973, _995);
    float _999 = exp2(_983);
    int _1001 = _815 ? 0 : 1;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].x, _959);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].y, _961);
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].z, _963);
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1011 = _777 ? 0 : 1;
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1015 = ~_1001;
    int _1017 = _1015 + 1;
    int _1019 = _1017 + 1;
    float _1021 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1009);
    int _1023 = _1019;
    if (!_803)
    {
        int _1025 = ~_1001;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1033 = 1.0 + _1031;
    int _1035 = ~_1011;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    float _1041 = fma(_641, _957, -0.5);
    int _1043 = _1039;
    if (!_763)
    {
        int _1045 = ~_1011;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1053 = fma(_805, _941, _1003);
    bool _1055 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1057 = isnan(1.0);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1063 = _1059 || _1061;
    float _1065 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1021);
    float _1067 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _993);
    float _1069 = fma(_791, _941, _1005);
    float _1071 = fma(_821, _941, _1007);
    float _1073 = 1.0 / _1033;
    float _1075 = -_1067;
    float _1077 = fma(_1065, _1041, _1075);
    float _1079 = -_999;
    float _1081 = _1079 + 1.0;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1085 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1097 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _967);
    float _1099 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1083);
    float _1101 = _1093 ? _1081 : 0.0;
    float _1103 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1105 = -_129;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[81].x, _977);
    float _1109 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1099);
    float _1111 = fma(_1095, _451, -0.5);
    float _1113 = fma(_817, _929, _1053);
    float _1115 = fma(_819, _929, _1069);
    float _1117 = fma(_823, _929, _1071);
    if (_1063)
    {
        float _1119 = _1101 * _1073;
        _131 = _1119;
    }
    float _1121 = _131;
    float _1123 = fma(_1103, _481, -0.5);
    bool _1125 = !_497;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = in.m_63.x;
    float _1131 = in.m_63.y;
    float _1133 = in.m_63.z;
    float _1135 = fma(_1109, _1111, _581);
    float _1137 = float(_755);
    float _1139 = fma(_849, _925, _1113);
    int _1141 = abs(_1127);
    float _1143 = _515 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1145 = !_505;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = _523 + _1149;
    float _1153 = fma(_927, _923, _1139);
    int _1155 = abs(_1147);
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1159 = _589 + _1157;
    float _1161 = float(_1141);
    float _1163 = _1151 * _1151;
    float _1165 = fma(_851, _925, _1115);
    float _1167 = fma(_865, _925, _1117);
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1171 = _1143 + _1169;
    float _1173 = _1161 * _1137;
    float _1175 = fma(_1159, _1159, _1163);
    float _1177 = fma(_729, _695, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _1179 = fma(_679, _923, _1165);
    float _1181 = _1173 * (-2.0);
    float _1183 = fma(_937, _923, _1167);
    float _1185 = float(_1155);
    float _1187 = fma(_1171, _1171, _1175);
    float _1189 = fma(_719, _1181, _719);
    float _1191 = fma(_1181, _1129, _1129);
    float _1193 = _311 + (-0.5);
    float _1195 = float(_1049);
    float _1197 = _311 + _321;
    float _1199 = fma(_981, _897, _1153);
    float _1201 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1191);
    bool _1203 = !_501;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_735, _897, _1179);
    float _1209 = fma(_1177, _897, _1183);
    float _1211 = fma(_1097, _1123, _1107);
    int _1213 = abs(_1205);
    float _1215 = _997 + 0.5;
    float _1217 = _1197 + (-1.0);
    float _1219 = _1185 * _1195;
    float _1221 = rsqrt(_1187);
    float _1223 = float(_1213);
    float _1225 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = float(_1029);
    float _1229 = _1219 * (-2.0);
    float _1231 = _1077 + 0.5;
    float _1233 = _1135 + 0.5;
    float _1235 = _1211 + 0.5;
    float _1237 = _1223 * _1227;
    float _1239 = _321 + (-0.5);
    float _1241 = fma(_1229, _1133, _1133);
    float _1243 = _431 + _321;
    float _1245 = fma(_1225, _1229, _1225);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1241);
    float _1249 = _1243 + (-1.0);
    float _1251 = _1237 * (-2.0);
    float _1253 = _431 + (-0.5);
    float _1255 = fma(_1245, _1121, _1247);
    float _1257 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1259 = fma(_1251, _1131, _1131);
    float _1261 = _1151 * _1221;
    float _1263 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1199);
    float _1265 = _1255 * 0.15915493667125701904296875;
    out.m_65.x = _1233;
    out.m_65.y = _1215;
    out.m_65.z = _1235;
    out.m_65.w = _1231;
    float _1267 = fma(_1257, _1251, _1257);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1259);
    float _1271 = -_1261;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1151);
    float _1275 = in.m_53.x;
    float _1277 = in.m_53.y;
    float _1279 = in.m_53.z;
    float _1281 = fma(_1189, _1121, _1201);
    float _1283 = fma(_1267, _1121, _1269);
    float _1285 = _1273 * _1273;
    float _1287 = _1265 * 6.283185482025146484375;
    float _1289 = sin(_1287);
    float _1291 = _1281 * 0.15915493667125701904296875;
    float _1293 = _1283 * 0.15915493667125701904296875;
    float _1295 = -_371;
    float _1297 = _1295 + _391;
    float _1299 = _1159 * _1221;
    float _1301 = _1171 * _1221;
    float _1303 = _1291 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1207);
    float _1309 = -_1299;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1159);
    float _1313 = -_1301;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1171);
    float _1317 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1209);
    float _1319 = fma(_1311, _1311, _1285);
    float _1321 = _1291 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = fma(_1315, _1315, _1319);
    float _1327 = _1317 * _1279;
    float _1329 = _1263 * _1275;
    float _1331 = _1307 * _1277;
    float _1333 = _1293 * 6.283185482025146484375;
    float _1335 = cos(_1333);
    float _1337 = _1305 * _1289;
    float _1339 = floor(_339);
    float _1341 = _1323 * _1289;
    float _1343 = _1265 * 6.283185482025146484375;
    float _1345 = cos(_1343);
    float _1347 = _1335 * _1289;
    float _1349 = -_367;
    float _1351 = _1349 + _387;
    float _1353 = _1305 * _1335;
    float _1355 = _1293 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = -_1339;
    float _1361 = _339 + _1359;
    float _1363 = fma(_1361, _1351, _367);
    float _1365 = -_369;
    float _1367 = _1365 + _389;
    float _1369 = fma(_1361, _1297, _371);
    float _1371 = sqrt(_1325);
    float _1373 = _1323 * _1345;
    float _1375 = _1305 * _1345;
    float _1377 = _1335 * _1345;
    float _1379 = _1323 * _1335;
    float _1381 = fma(_1361, _1367, _369);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1369);
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1363);
    float _1387 = fma(_1357, _1337, _1373);
    float _1389 = fma(_1357, _1373, _1337);
    float _1391 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1393 = -_1341;
    float _1395 = fma(_1357, _1375, _1393);
    float _1397 = -_1375;
    float _1399 = fma(_1357, _1341, _1397);
    float _1401 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1403 = _1381 != 0.0;
    bool _1405 = isnan(_1381);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.0);
    bool _1411 = _1407 || _1409;
    float _1413 = _1221 * _1371;
    bool _1415 = _1363 == 0.0;
    bool _1417 = !_1411;
    bool _1419 = _1415 && _1417;
    float _1421 = _1391 * _1413;
    float _1423 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1425 = _1401 * _1413;
    bool _1427 = _1369 == 0.0;
    bool _1429 = _1427 && _1419;
    float _1431 = _1421 * _1383;
    float _1433 = _1423 * _1413;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1381);
    float _1437 = _1425 * _1385;
    float _1439 = _1387 * _1431;
    float _1441 = _1395 * _1431;
    float _1443 = _1433 * _1435;
    float _1445 = _1353 * _1431;
    float _1447 = fma(_1347, _1437, _1439);
    float _1449 = fma(_1377, _1437, _1441);
    float _1451 = -_1357;
    float _1453 = fma(_1451, _1437, _1445);
    float _1455 = -_1443;
    float _1457 = fma(_1399, _1455, _1447);
    float _1459 = -_1443;
    float _1461 = fma(_1389, _1459, _1449);
    float _1463 = -_1443;
    float _1465 = fma(_1379, _1463, _1453);
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1471 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1467);
    float _1475 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1469);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1471);
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1473);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1483 = fma(_1465, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1477);
    float _1485 = _589 + _1479;
    float _1487 = _1143 + _1481;
    float _1489 = in.m_67.x;
    float _1491 = in.m_67.y;
    float _1493 = in.m_67.z;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1497 = _1485 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1501 = _1487 + _1499;
    float _1503 = _1497 * _1497;
    float _1505 = _1501 * _1501;
    float _1507 = _1503 + _1505;
    float _1509 = sqrt(_1507);
    float _1511 = _1493;
    float _1513 = _1489;
    float _1515 = _1395;
    float _1517 = _1369;
    float _1519 = _1461;
    float _1521 = _1491;
    if (!_1429)
    {
        float _1523 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1493);
        _1511 = _1523;
    }
    float _1525 = _1511;
    float _1527 = _1525;
    if (!_1429)
    {
        float _1529 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1513 = _1529;
    }
    float _1531 = _1513;
    float _1533 = _1387 * _1525;
    float _1535 = _523 + _1483;
    float _1537 = _1353 * _1525;
    bool _1539 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1395 * _1525;
    float _1543 = fma(_1347, _1531, _1533);
    float _1545 = _1533;
    if (!_1539)
    {
        _1515 = _1505;
    }
    float _1547 = _1515;
    float _1549 = _1547;
    if (!_1539)
    {
        _1545 = _1503;
    }
    float _1551 = _1545;
    float _1553 = _1551;
    if (!_1539)
    {
        _1517 = _1485;
    }
    float _1555 = _1517;
    float _1557 = _1555;
    if (!_1539)
    {
        _1527 = _1487;
    }
    float _1559 = _1527;
    float _1561 = _1559;
    if (!_1539)
    {
        _1519 = _1535;
    }
    float _1563 = _1519;
    bool _1565 = !_1539;
    float _1567 = _1563;
    if (!_1565)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1573 = _1509 + _1571;
        float _1575 = rsqrt(_1507);
        float _1577 = _1573 * _1569;
        float _1579 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = _1577 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        float _1587 = _1581 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = fma(_1585, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1593 = _1575 * _1591;
        float _1595 = _1589 + (-1.0);
        float _1597 = fma(_1497, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = fma(_1501, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1605 = _1597 + _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1609 = _1599 + _1607;
        float _1611 = fma(_1535, _1589, _1601);
        float _1613 = _1605 * _1605;
        float _1615 = _1609 * _1609;
        _1567 = _1611;
        _1553 = _1613;
        _1549 = _1615;
        _1557 = _1597;
        _1561 = _1599;
    }
    float _1617 = _1567;
    float _1619 = _1553;
    float _1621 = _1549;
    float _1623 = _1557;
    float _1625 = _1561;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1629 = _1617 + _1627;
    if (!_1429)
    {
        float _1631 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1521 = _1631;
    }
    float _1633 = _1521;
    float _1635 = fma(_1377, _1531, _1541);
    float _1637 = -_1357;
    float _1639 = fma(_1637, _1531, _1537);
    float _1641 = fma(_1629, _1629, _1619);
    float _1643 = -_1633;
    float _1645 = fma(_1399, _1643, _1543);
    float _1647 = -_1633;
    float _1649 = fma(_1389, _1647, _1635);
    float _1651 = -_1633;
    float _1653 = fma(_1379, _1651, _1639);
    float _1655 = _1641 + _1621;
    float _1657 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1661 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1663 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1657);
    float _1665 = sqrt(_1655);
    float _1667 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1659);
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1661);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1663);
    float _1673 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1667);
    float _1675 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1669);
    out.m_69.x = _1671;
    out.m_69.y = _1673;
    out.m_69.z = _1675;
    bool _1677 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1679 = isnan(_1665);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1685 = _1681 || _1683;
    float _1687 = _1663;
    if (!_1685)
    {
        _1687 = 1.0;
    }
    float _1689 = _1687;
    bool _1691 = !_1685;
    float _1693 = _1689;
    if (!_1691)
    {
        bool _1695 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1697 = isnan(_1665);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1703 = _1699 || _1701;
        if (!_1703)
        {
            float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1707 = _1665 + _1705;
            float _1709 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1711 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1709;
            float _1713 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1717 = 1.0 / _1711;
            float _1719 = _1707 * _1717;
            float _1721 = fma(_1719, _1715, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1693 = _1721;
            _1723 = true;
        }
        else
        {
            bool _1725 = _1665 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1727 = isnan(_1665);
            bool _1729 = _1725 || _1727;
            bool _1731 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1733 = _1729 || _1731;
            if (!_1733)
            {
                float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1737 = _1665 + _1735;
                float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1741 = _1739 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1745 = _1743 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1747 = 1.0 / _1741;
                float _1749 = _1737 * _1747;
                float _1751 = fma(_1749, _1745, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1693 = _1751;
                _1723 = true;
            }
            else
            {
                _1693 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1723 = false;
    float _1753 = _1693;
    float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1757 = _1623 + _1755;
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1761 = _1617 + _1759;
    bool _1763 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan(0.5);
    bool _1771 = _1767 || _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1775 = _1625 + _1773;
    float _1777 = fma(_1757, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1779 = fma(_1761, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1781 = fma(_1775, _1753, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1783 = -_1299;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1777);
    float _1787 = -_1261;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1779);
    float _1791 = -_1301;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1781);
    float _1795 = _1789;
    float _1797 = _1785;
    float _1799 = _1793;
    float _1801 = _1757;
    float _1803 = _1779;
    if (!_1771)
    {
        float _1805 = -_1261;
        float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
        float _1809 = -_1299;
        float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
        float _1813 = -_1301;
        float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1143);
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1821 = _1807 + _1819;
        float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1825 = _1811 + _1823;
        float _1827 = -_1143;
        float _1829 = _1827 + _1781;
        float _1831 = -_589;
        float _1833 = _1831 + _1777;
        float _1835 = _1821 * _1821;
        float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1839 = _1815 + _1837;
        float _1841 = -_523;
        float _1843 = _1841 + _1779;
        float _1845 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1847 = fma(_1825, _1825, _1835);
        float _1849 = fma(_1839, _1839, _1847);
        float _1851 = 1.0 / _1413;
        float _1853 = sqrt(_1849);
        float _1855 = precise::min(_1853, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1857 = _1855 * _1817;
        float _1859 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1861 = _1857 * _1851;
        float _1863 = _1859 * _1861;
        float _1865 = _1829 * _1861;
        float _1867 = fma(_1833, _1863, _1811);
        float _1869 = fma(_1843, _1863, _1807);
        float _1871 = fma(_1859, _1865, _1815);
        _1795 = _1869;
        _1797 = _1867;
        _1799 = _1871;
        _1801 = _1817;
    }
    float _1873 = _1795;
    float _1875 = _1797;
    float _1877 = _1799;
    float _1879 = _1801;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1883 = _1873 + _1881;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1887 = _1875 + _1885;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1891 = _1877 + _1889;
    float _1893 = _1883 * _1883;
    float _1895 = fma(_1887, _1887, _1893);
    float _1897 = fma(_1891, _1891, _1895);
    float _1899 = rsqrt(_1897);
    float _1901 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1903 = _1887 * _1901;
    float _1905 = _1891 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 + _1909;
    float _1913 = sqrt(_1911);
    bool _1915 = _1913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = _1913 + _1917;
    float _1921 = _1891;
    float _1923 = _1879;
    float _1925 = _1919;
    float _1927 = _1883;
    float _1929 = _1903;
    if (_1915)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1921 = _1931;
    }
    float _1933 = _1921;
    if (_1915)
    {
        float _1935 = rsqrt(_1911);
        _1923 = _1935;
    }
    float _1937 = _1923;
    float _1939 = _1937;
    if (_1915)
    {
        float _1941 = _1919 * _1933;
        _1925 = _1941;
    }
    float _1943 = _1925;
    if (_1915)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1803 = _1945;
    }
    float _1947 = _1803;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1951 = _1895;
    if (_1915)
    {
        float _1953 = _1947 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1961 = precise::max(0.0, _1959);
    float _1963 = _1899;
    float _1965 = _1961;
    float _1967 = _1959;
    if (_1915)
    {
        float _1969 = _1947 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        _1963 = _1971;
    }
    float _1973 = _1963;
    float _1975 = -_1901;
    float _1977 = -_1961;
    float _1979 = fma(_1883, _1975, _1977);
    if (_1915)
    {
        float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _1981;
    }
    float _1983 = _1965;
    float _1985 = sqrt(_1897);
    float _1987 = _1957;
    float _1989 = _1983;
    if (_1915)
    {
        float _1991 = fma(_1957, _1983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1987 = _1991;
    }
    float _1993 = _1987;
    float _1995 = _1993;
    if (_1915)
    {
        float _1997 = _1973 + (-1.0);
        _1967 = _1997;
    }
    float _1999 = _1967;
    float _2001 = _1999;
    if (_1915)
    {
        float _2003 = _1937 * _1993;
        _1989 = _2003;
    }
    float _2005 = _1989;
    if (!_1915)
    {
        _1939 = _1979;
    }
    float _2007 = _1939;
    float _2009 = _2007;
    if (_1915)
    {
        float _2011 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _2011;
    }
    float _2013 = _1927;
    float _2015 = _2013;
    if (_1915)
    {
        float _2017 = _1903 * _2005;
        _1929 = _2017;
    }
    float _2019 = _1929;
    if (!_1915)
    {
        _1995 = _1905;
    }
    float _2021 = _1995;
    float _2023 = _2021;
    if (_1915)
    {
        float _2025 = _1905 * _2005;
        _2023 = _2025;
    }
    float _2027 = _2023;
    if (!_1915)
    {
        _2001 = _1907;
    }
    float _2029 = _2001;
    float _2031 = _2029;
    if (_1915)
    {
        float _2033 = fma(_1979, _1973, _2013);
        _2009 = _2033;
    }
    float _2035 = _2009;
    if (_1915)
    {
        float _2037 = _2019 * _2019;
        _2031 = _2037;
    }
    float _2039 = _2031;
    if (!_1915)
    {
        _2015 = _1909;
    }
    float _2041 = _2015;
    float _2043 = _2041;
    if (_1915)
    {
        float _2045 = _2027 * _2027;
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = fma(_2035, _2035, _2039);
    float _2051 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2053 = _2049 + _2047;
    float _2055 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2051);
    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2059 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2057);
    float _2061 = precise::clamp(_2059, 0.0, 1.0);
    float _2063 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2065 = rsqrt(_2053);
    float _2067 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2069 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2063);
    float _2073 = -_2061;
    float _2075 = _2073 + 1.0;
    float _2077 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2079 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2081 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2083 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2071);
    float _2085 = abs(_2075);
    float _2087 = log2(_2085);
    float _2089 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2077);
    float _2091 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2079);
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2095 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2097 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2099 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2101 = _2065 * _2019;
    float _2103 = _2065 * _2035;
    float _2105 = -_2095;
    float _2107 = fma(_2105, _1949, 1.0);
    float _2109 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2099);
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2113 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2089);
    float _2115 = _2065 * _2027;
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2109);
    float _2119 = -_2111;
    float _2121 = fma(_2103, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2119);
    float _2123 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2127 = log2(_2107);
    float _2129 = -_2115;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2121);
    float _2133 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2135 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    float _2137 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2139 = fma(_2131, -0.5, 0.5);
    float _2141 = fma(_2131, 0.5, 0.5);
    float _2143 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2133);
    float _2145 = exp2(_2123);
    float _2147 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2137);
    float _2149 = _2103 + 1.0;
    float _2151 = fma(_2141, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2153 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2143);
    float _2155 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2147);
    float _2157 = fma(_2141, _2151, -0.212114393711090087890625);
    float _2159 = 1.0 / _2135;
    float _2161 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2155);
    float _2163 = _2127 * 0.693147182464599609375;
    float _2165 = fma(_2141, _2157, 1.570728778839111328125);
    float _2167 = sqrt(_2139);
    float _2169 = -_2103;
    float _2171 = fma(_2145, _2149, _2169);
    float _2173 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2153);
    float _2175 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2177 = fma(_2171, 0.5, 0.5);
    float _2179 = _2173 * _2159;
    float _2181 = _2161 * _2159;
    float _2183 = fma(_2179, 0.5, 0.5);
    float _2185 = fma(_2181, -0.5, 0.5);
    float _2187 = _2167 * 0.636619746685028076171875;
    float _2189 = -_2165;
    float _2191 = fma(_2187, _2189, 1.0);
    float3 _5644 = float3(_2183, _2185, _2175);
    float _2193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5644, float3(0.0), isnan(_5644)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5644, float3(0.0), isnan(_5644)), level(0.0)).x;
    float3 _5655 = float3(_2183, _2185, _2175);
    float4 _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5655, float3(0.0), isnan(_5655)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5655, float3(0.0), isnan(_5655)), level(0.0)).xyzw;
    float _2198 = _2196.x;
    float _2200 = _2196.y;
    float _2202 = _2196.z;
    float _2204 = _2196.w;
    float2 _5672 = float2(_2191, _2177);
    float3 _2206 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(0.0)).xyz;
    float _2208 = _2206.x;
    float _2210 = _2206.y;
    float _2212 = _2206.z;
    float _2214 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2216 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2218 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2216);
    float _2220 = exp2(_2214);
    float _2222 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2224 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2222);
    float _2226 = _2224 + _2135;
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2161;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2135;
    float _2228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = _2226 * 0.5;
    float _2232 = -_2220;
    float _2234 = _2232 + 1.0;
    out.m_49.x = _2228;
    float _2236 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2230;
    out.m_71.w = _2135;
    float _2238 = _2236 * _2193;
    float _2240 = -_2236;
    float _2242 = _2240 + 1.0;
    float _2244 = _2204 * _2238;
    float _2246 = _2212 * _2238;
    float _2248 = _2204 * _2242;
    float _2250 = fma(_2208, _2244, _2198);
    float _2252 = fma(_2210, _2244, _2200);
    float _2254 = fma(_2204, _2246, _2202);
    out.m_73.x = _2250;
    out.m_73.y = _2252;
    out.m_73.z = _2254;
    out.m_73.w = _2248;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

