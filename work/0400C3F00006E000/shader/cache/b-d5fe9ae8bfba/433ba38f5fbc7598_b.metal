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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d_array<float> vp_t_tcb_14 [[id(18)]];
    sampler vp_t_tcb_14Smplr [[id(19)]];
    texture2d<float> vp_t_tcb_1C [[id(20)]];
    sampler vp_t_tcb_1CSmplr [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_69 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _112(thread const int& _7528, thread const int& _7529, constant _10& support_buffer)
{
    float _7532 = as_type<float>(support_buffer._m4);
    int _7534 = _7529 + as_type<int>(_7532);
    int _7536 = 1 + _7534;
    float _7538 = support_buffer._m5[_7536].x;
    float _7540 = abs(_7538);
    bool _7542 = _7540 == 1.0;
    if (_7542)
    {
        return _7528;
    }
    float _7544 = float(_7528);
    float _7546 = _7544 / _7540;
    int _7548 = int(_7546);
    return _7548;
}

static inline __attribute__((always_inline))
int _113(thread const int& _7578, thread const int& _7579, constant _10& support_buffer)
{
    float _7582 = as_type<float>(support_buffer._m4);
    int _7584 = _7579 + as_type<int>(_7582);
    int _7586 = 1 + _7584;
    float _7588 = support_buffer._m5[_7586].x;
    bool _7590 = _7588 == 1.0;
    if (_7590)
    {
        return _7578;
    }
    float _7592 = float(_7578);
    float _7594 = _7592 * _7588;
    int _7596 = int(_7594);
    return _7596;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2679 = false;
    bool _1465 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_139);
        out.gl_Position.z = _2966;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_177);
        out.gl_Position.z = _3036;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = in.m_67.w;
    float _181 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _183 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = in.m_65.x;
    float _195 = in.m_65.y;
    float _197 = in.m_65.z;
    float _199 = in.m_60.x;
    float _201 = in.m_60.y;
    float _203 = in.m_60.z;
    float _205 = 0.0;
    float _207 = _181;
    if (!_191)
    {
        float _209 = _181 * _181;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    float _215 = _213;
    if (!_191)
    {
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_191;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _181 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _181);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_191;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _181 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _207 = _277;
    }
    float _279 = _207;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _193, _283);
    float _291 = fma(_279, _195, _285);
    float _293 = fma(_279, _197, _287);
    float _295 = fma(_289, _179, _199);
    float _297 = fma(_291, _179, _201);
    float _299 = fma(_293, _179, _203);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_69.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_121);
        float _325 = 1.0 / _323;
        float _327 = _157 * _325;
        _319 = _327;
        _129 = _323;
    }
    _321 = false;
    float _329 = _319;
    float _331 = _129;
    int _333 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _335 = _333;
    int _337 = 0;
    int _339 = _112(_335, _337, (*spvDescriptorSet0.support_buffer));
    float _341 = in.m_69.x;
    float _343 = in.m_71.z;
    float _345 = _341 * 8.0;
    float _347 = trunc(_343);
    int _349 = int(_347);
    float _351 = rint(_345);
    float _353 = _351 * 0.125;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    int _357 = _339 + (-1);
    float _359 = float(_357);
    float _361 = _355 * _359;
    float _363 = trunc(_361);
    int _365 = int(_363);
    int _367 = _365 + 1;
    int _369 = min(_357, _367);
    int _371 = _365;
    int _373 = 0;
    int _375 = _113(_371, _373, (*spvDescriptorSet0.support_buffer));
    int _377 = _349;
    int _379 = 0;
    int _381 = _113(_377, _379, (*spvDescriptorSet0.support_buffer));
    float3 _385 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_375, _381)), 0).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    int _393 = _369;
    int _395 = 0;
    int _397 = _113(_393, _395, (*spvDescriptorSet0.support_buffer));
    int _399 = _349;
    int _401 = 0;
    int _403 = _113(_399, _401, (*spvDescriptorSet0.support_buffer));
    float3 _405 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_397, _403)), 0).xyz;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = in.m_69.z;
    float _415 = _297 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = in.m_69.w;
    float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _425 = in.m_71.y;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = _329 + _427;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _437 = _435 != 0;
    float _439 = _297 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _443 = log2(_441);
    float _445 = _331;
    if (!_419)
    {
        float _447 = in.m_69.y;
        _445 = _447;
    }
    float _449 = _445;
    float _451 = _297 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _457 = _423 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _459 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _463 = _413 * 2.0;
    bool _465 = _421 > 0.5;
    float _467 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _469 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _471 = -_425;
    float _473 = _471 + 1.0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _485 = _483 != 0;
    float _487 = floor(_463);
    float _489 = _341 * 2.0;
    float _491 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _493 = _425;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_437)
    {
        float _497 = _465 ? _473 : _425;
        _493 = _497;
    }
    float _499 = _493;
    float _501 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _503 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    float _505 = _443 * _157;
    float _507 = floor(_489);
    if (!_419)
    {
        _495 = _449;
    }
    float _509 = _495;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = fma(_457, _499, -0.5);
    float _517 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _509;
    float _521 = _449;
    if (_419)
    {
        float _523 = in.m_69.x;
        float _525 = in.m_69.y;
        _519 = _523;
        _521 = _525;
    }
    float _527 = _519;
    float _529 = _521;
    bool _531 = _487 > 0.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    bool _537 = _487 >= 0.0;
    bool _539 = isnan(_487);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    float _547 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = exp2(_505);
    float _551 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _553 = _545 ? 0 : 1;
    out.m_75.x = _517;
    out.m_75.y = _547;
    out.m_75.z = _459;
    out.m_75.w = _455;
    bool _555 = _507 >= 0.0;
    bool _557 = isnan(_507);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    int _565 = ~_553;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = 1.0 / _535;
    int _573 = _569;
    if (!_531)
    {
        int _575 = ~_553;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    bool _581 = _507 > 0.0;
    float _583 = float(_579);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _587 = _341 + _413;
    float _589 = _527 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _591 = _587 + (-1.0);
    float _593 = _529 * 2.0;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _597 = _429 * _571;
    float _599 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _601 = _591;
    float _603 = _585;
    if (!_419)
    {
        _601 = _413;
    }
    float _605 = _601;
    float _607 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[83].z, _595);
    float _609 = _605;
    if (_419)
    {
        _609 = _529;
    }
    float _611 = _609;
    float _613 = -_585;
    float _615 = fma(_589, 2.0, _613);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _619 = floor(_593);
    if (!_419)
    {
        _603 = _413;
    }
    float _621 = _603;
    float _623 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[83].w, _617);
    float _625 = _621;
    if (_419)
    {
        _625 = _529;
    }
    float _627 = _625;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _631 = _563 ? 0 : 1;
    float _633 = _413 + _529;
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _637 = ~_631;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    float _643 = _633 + (-1.0);
    int _645 = _641;
    if (!_581)
    {
        int _647 = ~_631;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = fma(_635, -2.0, _629);
    float _655 = _341 + _529;
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _659 = -_549;
    float _661 = _659 + 1.0;
    float _663 = _655 + (-1.0);
    bool _665 = !_477;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _653);
    bool _671 = !_481;
    int _673 = _671 ? 0 : 1;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _677 = abs(_667);
    float _679 = _341 + (-0.5);
    int _681 = abs(_673);
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _607);
    float _685 = in.m_77.x;
    float _687 = in.m_77.y;
    float _689 = in.m_77.z;
    bool _691 = _619 > 0.0;
    float _693 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _623);
    bool _695 = _619 >= 0.0;
    bool _697 = isnan(_619);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _707 = 1.0 + _705;
    float _709 = float(_677);
    float _711 = _529 + (-0.5);
    float _713 = float(_681);
    float _715 = 1.0 / _707;
    float _717 = float(_651);
    float _719 = _709 * _583;
    bool _721 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _723 = isnan(1.0);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _729 = _725 || _727;
    float _731 = -_669;
    float _733 = fma(_693, _515, _731);
    bool _735 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _743 = _739 || _741;
    float _745 = _713 * _717;
    float _747 = _719 * (-2.0);
    bool _749 = !_485;
    int _751 = _749 ? 0 : 1;
    float _753 = -_157;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _615);
    float _757 = _743 ? _661 : 0.0;
    float _759 = fma(_675, _747, _675);
    int _761 = _703 ? 0 : 1;
    float _763 = _745 * (-2.0);
    int _765 = abs(_751);
    float _767 = fma(_747, _685, _685);
    float _769 = _715;
    if (_729)
    {
        float _771 = _757 * _715;
        _159 = _771;
    }
    float _773 = _159;
    int _775 = ~_761;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = fma(_657, _763, _657);
    float _783 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].x, _767);
    int _785 = _779;
    if (!_691)
    {
        int _787 = ~_761;
        int _789 = _787 + 1;
        _785 = _789;
    }
    int _791 = _785;
    float _793 = fma(_763, _687, _687);
    float _795 = fma(_759, _773, _783);
    float _797 = float(_791);
    float _799 = in.m_71.x;
    float _801 = float(_765);
    float _803 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _793);
    bool _805 = _413 > 0.5;
    bool _807 = _805 && _433;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _811 = _795 * 0.15915493667125701904296875;
    float _813 = _801 * _797;
    float _815 = fma(_781, _773, _803);
    float _817 = _813 * (-2.0);
    float _819 = _413 + (-0.5);
    float _821 = _815 * 0.15915493667125701904296875;
    float _823 = fma(_817, _689, _689);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _833;
    float _837 = fma(_599, _817, _599);
    bool _839 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _841 = isnan(_329);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_827, _597, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _853 = fma(_831, _597, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _855 = fma(_835, _597, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _857 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _823);
    float _859 = _817;
    if (_433)
    {
        _769 = _799;
    }
    float _861 = _769;
    float _863 = -_849;
    float _865 = _863 + 1.0;
    bool _867 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _869 = isnan(_329);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_837, _773, _857);
    float _881 = _861;
    if (!_433)
    {
        _859 = _799;
    }
    float _883 = _859;
    float _885 = _883;
    if (_807)
    {
        float _887 = -_861;
        float _889 = _887 + 1.0;
        _881 = _889;
    }
    float _891 = _881;
    float _893 = in.m_67.x;
    float _895 = in.m_67.y;
    float _897 = in.m_67.z;
    float _899 = _877 * _865;
    float _901 = _809 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _903 = _811 * 6.283185482025146484375;
    float _905 = sin(_903);
    if (_433)
    {
        _885 = _891;
    }
    float _907 = _885;
    float _909 = _879 * 0.15915493667125701904296875;
    float _911 = -_877;
    float _913 = _911 + 1.0;
    float _915 = _851 * _899;
    float _917 = _855 * _899;
    float _919 = fma(_901, _907, -0.5);
    float _921 = _811 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].z, _917);
    float _927 = fma(_683, _919, _755);
    float _929 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].z, _925);
    float _931 = _821 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = _853 * _899;
    float _937 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].x, _915);
    float _939 = in.m_79.x;
    float _941 = in.m_79.y;
    float _943 = in.m_79.z;
    float _945 = in.m_79.w;
    float _947 = _927 + 0.5;
    float _949 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].y, _935);
    float _951 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].x, _937);
    float _953 = _929 * _897;
    float _955 = _821 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].y, _949);
    float _961 = _951 * _893;
    float _963 = _733 + 0.5;
    float _965 = _959 * _895;
    float _967 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = _909 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _905 * _933;
    float _975 = _923 * _933;
    out.m_81.z = _947;
    out.m_81.w = _963;
    float _977 = _909 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _923 * _957;
    float _983 = _905 * _957;
    float _985 = floor(_361);
    float _987 = _923 * _971;
    float _989 = _905 * _971;
    float _991 = _957 * _971;
    float _993 = _933 * _971;
    float _995 = _987 * _941;
    float _997 = fma(_979, _981, _973);
    float _999 = fma(_979, _973, _981);
    float _1001 = -_983;
    float _1003 = fma(_979, _975, _1001);
    float _1005 = -_941;
    float _1007 = _979 * _1005;
    float _1009 = fma(_997, _939, _995);
    float _1011 = -_975;
    float _1013 = fma(_979, _983, _1011);
    float _1015 = fma(_991, _939, _1007);
    float _1017 = fma(_1003, _943, _1009);
    float _1019 = -_985;
    float _1021 = _361 + _1019;
    float _1023 = _989 * _941;
    float _1025 = fma(_993, _943, _1015);
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1033 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1027);
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1029);
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1031);
    float _1039 = -_389;
    float _1041 = _1039 + _409;
    float _1043 = -_387;
    float _1045 = _1043 + _407;
    float _1047 = fma(_1013, _939, _1023);
    float _1049 = -_391;
    float _1051 = _1049 + _411;
    float _1053 = fma(_1021, _1041, _389);
    float _1055 = in.m_83.x;
    float _1057 = in.m_83.y;
    float _1059 = in.m_83.z;
    float _1061 = fma(_1021, _1045, _387);
    float _1063 = fma(_1021, _1051, _391);
    float _1065 = fma(_999, _943, _1047);
    bool _1067 = _1053 != 0.0;
    bool _1069 = isnan(_1053);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1037);
    bool _1079 = _1061 == 0.0;
    bool _1081 = !_1075;
    bool _1083 = _1079 && _1081;
    float _1085 = _965 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1033);
    float _1089 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1053);
    bool _1091 = _1063 == 0.0;
    bool _1093 = _1091 && _1083;
    float _1095 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1061);
    float _1097 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1099 = _1089 * _1085;
    float _1101 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1063);
    float _1103 = _1095 * _967;
    float _1105 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1035);
    float _1107 = _987 * _1099;
    float _1109 = -_1099;
    float _1111 = _979 * _1109;
    float _1113 = _989 * _1099;
    float _1115 = _1101 * _1097;
    float _1117 = fma(_997, _1103, _1107);
    out.m_85.x = _1077;
    out.m_85.y = _1087;
    out.m_85.z = _1105;
    float _1119 = _1017;
    float _1121 = _1111;
    float _1123 = _1103;
    float _1125 = _1035;
    if (_1093)
    {
        _1119 = _1055;
    }
    float _1127 = _1119;
    float _1129 = fma(_991, _1103, _1111);
    float _1131 = fma(_1013, _1103, _1113);
    float _1133 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1127;
    float _1137 = _1131;
    if (_1093)
    {
        _1121 = _1127;
    }
    float _1139 = _1121;
    float _1141 = _1139;
    if (!_1093)
    {
        _1135 = _1055;
    }
    float _1143 = _1135;
    float _1145 = fma(_999, _1115, _1131);
    if (_1093)
    {
        _1137 = _1057;
    }
    float _1147 = _1137;
    float _1149 = 0.0;
    float _1151 = _1147;
    if (_1093)
    {
        _1149 = _1059;
    }
    float _1153 = _1149;
    float _1155 = fma(_1003, _1115, _1117);
    float _1157 = fma(_993, _1115, _1129);
    float _1159 = _1153;
    if (!_1093)
    {
        float _1161 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1143);
        _1141 = _1161;
    }
    float _1163 = _1141;
    if (_1093)
    {
        _1123 = _1153;
    }
    float _1165 = _1123;
    float _1167 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1171 = _1165;
    if (!_1093)
    {
        _1159 = _1059;
    }
    float _1173 = _1159;
    float _1175 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1177 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1179 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1169);
    float _1181 = _941 * _1173;
    float _1183 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1177);
    float _1185 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = _1177;
    if (_1093)
    {
        _1187 = _1147;
    }
    float _1189 = _1187;
    float _1191 = _943 * _1143;
    float _1193 = _551 + _1183;
    float _1195 = _1133 + _1185;
    float _1197 = _1189;
    float _1199 = _1193;
    float _1201 = _1195;
    if (!_1093)
    {
        _1151 = _1057;
    }
    float _1203 = _1151;
    if (!_1093)
    {
        float _1205 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1173);
        _1171 = _1205;
    }
    float _1207 = _1171;
    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1211 = _1193 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1215 = _1195 + _1213;
    float _1217 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1175);
    if (!_1093)
    {
        float _1219 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1203);
        _1197 = _1219;
    }
    float _1221 = _1197;
    float _1223 = _1211 * _1211;
    float _1225 = _1215 * _1215;
    float _1227 = _939 * _1203;
    float _1229 = -_1181;
    float _1231 = fma(_943, _1203, _1229);
    float _1233 = -_1191;
    float _1235 = fma(_939, _1173, _1233);
    float _1237 = _1223 + _1225;
    float _1239 = -_1227;
    float _1241 = fma(_941, _1143, _1239);
    float _1243 = _1231 * _945;
    float _1245 = _1235 * _945;
    float _1247 = sqrt(_1237);
    float _1249 = _1241 * _945;
    float _1251 = _987 * _1221;
    float _1253 = _989 * _1221;
    float _1255 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1217);
    float _1257 = _491 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1259 = -_1221;
    float _1261 = _979 * _1259;
    float _1263 = -_1245;
    float _1265 = _979 * _1263;
    float _1267 = _987 * _1245;
    float _1269 = _989 * _1245;
    float _1271 = _1257 + _1255;
    float _1273 = fma(_991, _1163, _1261);
    float _1275 = fma(_997, _1163, _1251);
    float _1277 = fma(_1013, _1163, _1253);
    float _1279 = fma(_991, _1243, _1265);
    float _1281 = fma(_997, _1243, _1267);
    bool _1283 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1285 = fma(_1013, _1243, _1269);
    float _1287 = fma(_993, _1207, _1273);
    float _1289 = fma(_1003, _1207, _1275);
    float _1291 = fma(_999, _1207, _1277);
    float _1293 = fma(_993, _1249, _1279);
    float _1295 = fma(_1003, _1249, _1281);
    float _1297 = fma(_999, _1249, _1285);
    float _1299 = _1265;
    float _1301 = _1223;
    float _1303 = _1225;
    int _1305 = as_type<int>(_1257);
    if (!_1283)
    {
        _1299 = _1271;
    }
    float _1307 = _1299;
    bool _1309 = !_1283;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1247 + _1315;
        float _1319 = rsqrt(_1237);
        float _1321 = _1317 * _1313;
        float _1323 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = _1321 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = cos(_1331);
        float _1335 = fma(_1329, _1323, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1337 = _1319 * _1335;
        float _1339 = fma(_1211, _1337, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1341 = _1333 + (-1.0);
        float _1343 = fma(_1215, _1337, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1347 = _1339 + _1345;
        float _1349 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1353 = _1343 + _1351;
        float _1355 = _1347 * _1347;
        float _1357 = fma(_1271, _1333, _1349);
        float _1359 = _1353 * _1353;
        _1311 = _1357;
        _1301 = _1355;
        _1303 = _1359;
        _1199 = _1339;
        _1201 = _1343;
    }
    float _1361 = _1311;
    float _1363 = _1301;
    float _1365 = _1303;
    float _1367 = _1199;
    float _1369 = _1201;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1373 = _1361 + _1371;
    float _1375 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1377 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1379 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1381 = fma(_1373, _1373, _1363);
    float _1383 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1385 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1387 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1389 = _1381 + _1365;
    float _1391 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1375);
    float _1393 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1377);
    float _1395 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1383);
    float _1397 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1379);
    float _1399 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1385);
    float _1401 = sqrt(_1389);
    float _1403 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1387);
    float _1405 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1391);
    float _1407 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1395);
    float _1409 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1397);
    float _1411 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1393);
    float _1413 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1399);
    float _1415 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    out.m_87.x = _1405;
    out.m_87.y = _1411;
    out.m_87.z = _1413;
    out.m_89.x = _1407;
    out.m_89.y = _1409;
    out.m_89.z = _1415;
    bool _1417 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1419 = isnan(_1401);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1425 = _1421 || _1423;
    float _1427 = _1403;
    float _1429 = _1361;
    if (!_1425)
    {
        _1427 = 1.0;
    }
    float _1431 = _1427;
    bool _1433 = !_1425;
    float _1435 = _1431;
    if (!_1433)
    {
        bool _1437 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1439 = isnan(_1401);
        bool _1441 = _1437 || _1439;
        bool _1443 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1445 = _1441 || _1443;
        if (!_1445)
        {
            float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1449 = _1401 + _1447;
            float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1453 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1451;
            float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1459 = 1.0 / _1453;
            float _1461 = _1449 * _1459;
            float _1463 = fma(_1461, _1457, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1435 = _1463;
            _1465 = true;
        }
        else
        {
            bool _1467 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1469 = isnan(_1401);
            bool _1471 = _1467 || _1469;
            bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1475 = _1471 || _1473;
            if (!_1475)
            {
                float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1479 = _1401 + _1477;
                float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1483 = _1481 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1489 = 1.0 / _1483;
                float _1491 = _1479 * _1489;
                float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1435 = _1493;
                _1465 = true;
            }
            else
            {
                _1435 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1465 = false;
    float _1495 = _1435;
    float _1497 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1499 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1501 = floor(_1497);
    float _1503 = floor(_1499);
    float _1505 = -_1501;
    float _1507 = _1497 + _1505;
    float _1509 = -_1503;
    float _1511 = _1499 + _1509;
    float2 _5135 = float2(_1507, _1511);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5135, float2(0.0), isnan(_5135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5135, float2(0.0), isnan(_5135)), level(0.0)).x;
    float _1515 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1519 = _1367 + _1517;
    float _1521 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1525 = _1369 + _1523;
    float _1527 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1521);
    float _1529 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1531 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _1533 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(0.5);
    bool _1541 = _1537 || _1539;
    float _1543 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1545 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1529);
    float _1547 = _1257 + _1531;
    float _1549 = fma(_1519, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1551 = 1.0 / _1543;
    float _1553 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1545);
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1557 = fma(_1525, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1559 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1561 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1555);
    float _1563 = _1559 + _1543;
    float _1565 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1561);
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1569 = _1563 * _1551;
    float _1571 = _1569 * 0.5;
    float _1573 = trunc(_1567);
    int _1575 = int(_1573);
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1579 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
    float _1581 = 1.0 / _1579;
    int _1583 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1585 = _1575 + _1583;
    int _1587 = _1585 + 1;
    float _1589 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1591 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1589);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1595 = _1581 * _1593;
    float _1597 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1591);
    bool _1599 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1601 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1603 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1605 = !_1599;
    int _1607 = _1605 ? 0 : 1;
    float _1609 = trunc(_1601);
    int _1611 = int(_1609);
    int _1613 = 2;
    float _1615 = _1495;
    uint _1618 = as_type<uint>(_1525);
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1622 = _1567;
    if (!_1599)
    {
        _1613 = 1;
    }
    int _1624 = _1613;
    int _1626 = _1624;
    if (!_1603)
    {
        _1626 = _1607;
    }
    int _1628 = _1626;
    bool _1630 = _1587 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1632 = _1628 << 6;
    int _1634 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1636 = _1611 + _1634;
    int _1638 = _1636 + 1;
    int _1640 = _1632 + 48;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    uint _1644 = uint(int(uint(int(_1642)) >> uint(2)));
    int _1646 = int(_1642) & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    int _1650 = int(_1642) + 1;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    int _1654 = _1650 & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    int _1658 = _1587 | _1638;
    bool _1660 = _1658 < 0;
    bool _1662 = _1660 || _1630;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1666 = _1361 + _1664;
    int _1668 = _1632 + 56;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
    float _1686 = _1666;
    if (_1541)
    {
        _1429 = _1549;
    }
    float _1688 = _1429;
    float _1690 = fma(_1666, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1692 = _1638 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1694 = _1692 || _1662;
    float _1696 = _1688;
    if (_1541)
    {
        _1615 = _1557;
    }
    float _1698 = _1615;
    int _1700 = _1632 + 64;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    float _1718 = _1698;
    if (_1541)
    {
        _1686 = _1690;
    }
    float _1720 = _1686;
    int _1722 = _1632 + 72;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    int _1740 = _1632 + 96;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    int _1758 = _1632 + 104;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _1720;
    if (!_1541)
    {
        float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1780 = _1257 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1784 = _551 + _1782;
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1788 = _1780 * _1780;
        float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1792 = _1133 + _1790;
        float _1794 = fma(_1784, _1784, _1788);
        float _1796 = fma(_1792, _1792, _1794);
        float _1798 = -_1257;
        float _1800 = _1798 + _1690;
        float _1802 = sqrt(_1796);
        float _1804 = precise::min(_1802, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1806 = _1804 * _1786;
        float _1808 = -_551;
        float _1810 = _1808 + _1549;
        float _1812 = -_1133;
        float _1814 = _1812 + _1557;
        float _1816 = fma(_1800, _1806, _1257);
        float _1818 = fma(_1810, _1806, _551);
        float _1820 = fma(_1814, _1806, _1133);
        _1776 = _1816;
        _1696 = _1818;
        _1618 = as_type<uint>(_1810);
        _1718 = _1820;
    }
    float _1822 = _1776;
    float _1824 = _1696;
    uint _1826 = _1618;
    float _1828 = _1718;
    float _1830 = _1547 * _1756;
    uint _1832 = _1826;
    if (!_1694)
    {
        int _1834 = _1638 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1836 = _1834 + _1587;
        _1832 = uint(_1836);
    }
    uint _1838 = _1832;
    float _1840 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1842 = _1547 * _1716;
    float _1844 = fma(_551, _1748, _1830);
    float _1846 = _1547 * _1656;
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1840);
    if (!_1694)
    {
        uint _1850 = uint(int(uint(int(_1838)) >> uint(2)));
        _1305 = int(_1850);
    }
    int _1852 = _1305;
    float _1854 = fma(_1133, _1766, _1844);
    float _1856 = fma(_551, _1648, _1846);
    float _1858 = fma(_551, _1708, _1842);
    float _1860 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1848);
    float _1862 = _1854 + _1774;
    int _1864 = as_type<int>(_1854);
    if (!_1694)
    {
        int _1866 = int(_1838) << 2;
        _1864 = _1866;
    }
    int _1868 = _1864;
    int _1870 = _1632 + 80;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    float _1888 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1890 = 1.0 / _1862;
    int _1892 = _1868;
    if (!_1694)
    {
        int _1894 = 12 & _1868;
        _1892 = _1894;
    }
    int _1896 = _1892;
    float _1898 = fma(_1133, _1676, _1856);
    float _1900 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_1694)
    {
        int _1904 = _1852 << 4;
        int _1906 = _1904 + _1896;
        _1620 = as_type<float>(_1906);
    }
    float _1908 = _1620;
    int _1910 = _1632 + 88;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
    int _1916 = int(_1912) & 3;
    float _1918 = (*spvDescriptorSet0.vp_c15)._m0[int(_1914)][_1916];
    int _1920 = int(_1912) + 1;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    int _1924 = _1920 & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    float _1928 = _1898 + _1684;
    float _1930 = -_1902;
    float _1932 = fma(_1930, _1900, 1.0);
    float _1934 = fma(_1133, _1730, _1858);
    float _1936 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1938 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1940 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1942 = _1934 + _1738;
    float _1944 = _1908;
    if (!_1694)
    {
        int _1946 = as_type<int>(_1908) + 400;
        uint _1948 = uint(int(uint(_1946) >> uint(2)));
        uint _1950 = uint(int(uint(int(_1948)) >> uint(2)));
        int _1952 = int(_1948) & 3;
        float _1954 = (*spvDescriptorSet0.vp_c15)._m0[int(_1950)][_1952];
        _1944 = _1954;
    }
    float _1956 = _1944;
    float _1958 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1936);
    float _1960 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1938);
    float _1962 = _1928 * _1890;
    float _1964 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1940);
    float _1966 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1960);
    float _1970 = _1690;
    float _1972 = _1890;
    if (!_1694)
    {
        float _1974 = floor(_1567);
        _1970 = _1974;
    }
    float _1976 = _1970;
    bool _1978 = _1962 >= 0.0;
    float _1980 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = _1942 * _1890;
    bool _1986 = _1962 <= 1.0;
    bool _1988 = _1986 && _1978;
    float _1990 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1964);
    float _1992 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1994 = _1942;
    if (!_1694)
    {
        float _1996 = floor(_1601);
        _1994 = _1996;
    }
    float _1998 = _1994;
    bool _2000 = _1984 >= 0.0;
    bool _2002 = _2000 && _1988;
    float _2004 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2006 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1992);
    float _2008 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2010 = _1984 <= 1.0;
    bool _2012 = _2010 && _2002;
    float _2014 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2006);
    float _2016 = log2(_1932);
    float _2018 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2020 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2008);
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    if (!_1694)
    {
        float _2024 = -_1976;
        float _2026 = _1567 + _2024;
        _1125 = _2026;
    }
    float _2028 = _1125;
    float _2030 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2018);
    float _2032 = 1.0 / _2022;
    float _2034 = _1547 * _1886;
    float _2036 = _1886;
    if (_2012)
    {
        float _2038 = float(_1628);
        _2036 = _2038;
    }
    float _2040 = _2036;
    float _2042 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2044 = fma(_551, _1878, _2034);
    float _2046 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2030);
    float _2048 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2042);
    float _2050 = _2034;
    float _2052 = _2044;
    if (_2012)
    {
        float _2054 = rint(_2040);
        float _2056 = precise::max(_2054, 0.0);
        uint _2058 = uint(_2056);
        uint _2060 = clamp(_2058, 0u, 65535u);
        _2050 = as_type<float>(_2060);
    }
    float _2062 = _2050;
    float _2064 = fma(_1133, _1918, _2044);
    if (!_1694)
    {
        float _2066 = -_1998;
        float _2068 = _1601 + _2066;
        _2052 = _2068;
    }
    float _2070 = _2052;
    float _2072 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2046);
    float _2074 = _2016 * 0.693147182464599609375;
    float _2076 = _2064 + _1926;
    float _2078 = _2072 * _2032;
    float _2080 = _1976;
    if (!_1694)
    {
        float _2082 = rint(_1956);
        float _2084 = precise::max(_2082, 0.0);
        uint _2086 = uint(_2084);
        uint _2088 = clamp(_2086, 0u, 65535u);
        _2080 = as_type<float>(_2088);
    }
    float _2090 = _2080;
    float _2092 = _2048 * _2032;
    float _2094 = _2076 * _1890;
    float _2096 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2098 = fma(_2078, 0.5, 0.5);
    float _2100 = fma(_2092, -0.5, 0.5);
    float _2102 = _2062;
    if (_2012)
    {
        float3 _6151 = float3(_1962, _1984, float(as_type<int>(_2062)));
        float3 _6155 = select(_6151, float3(0.0), isnan(_6151));
        float _2104 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6155.xy, uint(rint(_6155.z)), _2094, level(0.0));
        _2102 = _2104;
    }
    float _2106 = _2102;
    float3 _6165 = float3(_2098, _2100, _2096);
    float _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6165, float3(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6165, float3(0.0), isnan(_6165)), level(0.0)).x;
    float3 _6174 = float3(_2098, _2100, _2096);
    float4 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = _2111.w;
    float _2121 = _2028;
    if (!_1694)
    {
        float3 _6197 = float3(_2028, _2070, float(as_type<int>(_2090)));
        float3 _6199 = select(_6197, float3(0.0), isnan(_6197));
        float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6199.xy, uint(rint(_6199.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6199.xy, uint(rint(_6199.z)), level(0.0)).x;
        _2121 = _2123;
    }
    float _2125 = _2121;
    if (_1694)
    {
        _1972 = 1.0;
    }
    float _2127 = _1972;
    float _2129 = _2127;
    if (!_1694)
    {
        int _2131 = int(_1838) << 4;
        int _2133 = _2131 + 2048;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        uint _2137 = uint(int(uint(int(_2135)) >> uint(2)));
        int _2139 = int(_2135) & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = int(_2135) + 1;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        int _2147 = _2143 & 3;
        float _2149 = (*spvDescriptorSet0.vp_c15)._m0[int(_2145)][_2147];
        int _2151 = _2133 + 8;
        uint _2153 = uint(int(uint(_2151) >> uint(2)));
        uint _2155 = uint(int(uint(int(_2153)) >> uint(2)));
        int _2157 = int(_2153) & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        int _2161 = int(_2153) + 1;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        int _2165 = _2161 & 3;
        float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
        float _2169 = _1547 * _2149;
        float _2171 = fma(_551, _2141, _2169);
        float _2173 = fma(_1133, _2159, _2171);
        float _2175 = _2173 + _2167;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = -_2177;
        float _2181 = _2179 + _2125;
        float _2183 = fma(_2181, 500.0, 1.5);
        float _2185 = exp2(_2183);
        float _2187 = 0.0 + _2185;
        float _2189 = precise::clamp(_2187, 0.0, 1.0);
        _2129 = _2189;
    }
    float _2191 = _2129;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2195 = _1822 + _2193;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2199 = _1824 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2203 = _1828 + _2201;
    float _2205 = _2195 * _2195;
    float _2207 = fma(_2199, _2199, _2205);
    float _2209 = fma(_2203, _2203, _2207);
    float _2211 = rsqrt(_2209);
    float _2213 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2215 = _2199 * _2213;
    float _2217 = _2203 * _2213;
    float _2219 = _2215 * _2215;
    float _2221 = _2217 * _2217;
    float _2223 = _2219 + _2221;
    float _2225 = sqrt(_2223);
    bool _2227 = _2225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2231 = _2225 + _2229;
    float _2233 = _2211;
    float _2235 = _2231;
    float _2237 = _2195;
    float _2239 = _2213;
    if (_2227)
    {
        float _2241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2233 = _2241;
    }
    float _2243 = _2233;
    float _2245 = _2243;
    if (_2227)
    {
        float _2247 = _2231 * _2243;
        _2235 = _2247;
    }
    float _2249 = _2235;
    if (_2227)
    {
        float _2251 = rsqrt(_2223);
        _2245 = _2251;
    }
    float _2253 = _2245;
    float _2255 = _2253;
    if (_2227)
    {
        float _2257 = _2249 * 0.15915493667125701904296875;
        _1622 = _2257;
    }
    float _2259 = _1622;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2263 = _2203;
    float _2265 = _2259;
    if (_2227)
    {
        float _2267 = _2259 * 6.283185482025146484375;
        float _2269 = sin(_2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = precise::max(0.0, _2261);
    float _2275 = _1962;
    float _2277 = _2273;
    if (_2227)
    {
        float _2279 = _2259 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        _2275 = _2281;
    }
    float _2283 = _2275;
    float _2285 = -_2213;
    float _2287 = -_2273;
    float _2289 = fma(_2195, _2285, _2287);
    if (_2227)
    {
        float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2291;
    }
    float _2293 = _2237;
    float _2295 = _2271;
    float _2297 = _2293;
    if (_2227)
    {
        float _2299 = fma(_2271, _2293, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2295 = _2299;
    }
    float _2301 = _2295;
    float _2303 = _2301;
    if (!_2227)
    {
        _2297 = _2289;
    }
    float _2305 = _2297;
    float _2307 = _2305;
    if (!_2227)
    {
        _2265 = _2219;
    }
    float _2309 = _2265;
    float _2311 = 0.0;
    float _2313 = _2309;
    if (_2227)
    {
        float _2315 = _2253 * _2301;
        _2311 = _2315;
    }
    float _2317 = _2311;
    if (!_2227)
    {
        _2255 = _2215;
    }
    float _2319 = _2255;
    float _2321 = _2319;
    float _2323 = _2283;
    if (_2227)
    {
        float _2325 = _2283 + (-1.0);
        _2277 = _2325;
    }
    float _2327 = _2277;
    if (_2227)
    {
        float _2329 = _2215 * _2317;
        _2321 = _2329;
    }
    float _2331 = _2321;
    if (!_2227)
    {
        _2303 = _2217;
    }
    float _2333 = _2303;
    float _2335 = _2333;
    if (_2227)
    {
        float _2337 = _2217 * _2317;
        _2335 = _2337;
    }
    float _2339 = _2335;
    if (_2227)
    {
        float _2341 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2341;
    }
    float _2343 = _2239;
    if (_2227)
    {
        float _2345 = _2331 * _2331;
        _2313 = _2345;
    }
    float _2347 = _2313;
    float _2349 = sqrt(_2209);
    if (_2227)
    {
        float _2351 = fma(_2289, _2283, _2343);
        _2307 = _2351;
    }
    float _2353 = _2307;
    if (!_2227)
    {
        _2323 = _2221;
    }
    float _2355 = _2323;
    float _2357 = _2355;
    if (_2227)
    {
        float _2359 = _2339 * _2339;
        _2357 = _2359;
    }
    float _2361 = _2357;
    float _2363 = fma(_2353, _2353, _2347);
    float _2365 = _2363 + _2361;
    float _2367 = rsqrt(_2365);
    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2371 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2369);
    float _2373 = precise::clamp(_2371, 0.0, 1.0);
    float _2375 = -_2373;
    float _2377 = _2375 + 1.0;
    float _2379 = _2367 * _2353;
    float _2381 = _2367 * _2331;
    float _2383 = abs(_2377);
    float _2385 = log2(_2383);
    float _2387 = _2367 * _2339;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2391 = -_2389;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2391);
    float _2395 = -_2387;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2393);
    float _2399 = fma(_2397, -0.5, 0.5);
    float _2401 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2403 = fma(_2397, 0.5, 0.5);
    float _2405 = _2379 + 1.0;
    float _2407 = sqrt(_2399);
    float _2409 = fma(_2403, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2411 = fma(_2403, _2409, -0.212114393711090087890625);
    float _2413 = exp2(_2401);
    float _2415 = fma(_2403, _2411, 1.570728778839111328125);
    float _2417 = _2407 * 0.636619746685028076171875;
    float _2419 = -_2415;
    float _2421 = fma(_2417, _2419, 1.0);
    float _2423 = -_2379;
    float _2425 = fma(_2413, _2405, _2423);
    float _2427 = fma(_2425, 0.5, 0.5);
    float2 _6672 = float2(_2421, _2427);
    float3 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6672, float2(0.0), isnan(_6672)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6672, float2(0.0), isnan(_6672)), level(0.0)).xyz;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = abs(_1595);
    float _2439 = log2(_2437);
    float _2441 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2443 = -_1513;
    float _2445 = _2443 + 1.0;
    float _2447 = exp2(_2441);
    bool _2449 = _1595 <= 8000.0;
    bool _2451 = isnan(_1595);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(8000.0);
    bool _2457 = _2453 || _2455;
    float _2459 = float(_2457);
    float _2461 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2463 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2465 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2463);
    float _2467 = exp2(_2461);
    float _2469 = -_2447;
    float _2471 = _2469 + 1.0;
    float _2473 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2465);
    float _2475 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2473);
    float _2477 = _2475 + _2022;
    float _2479 = _2477 * 0.5;
    float _2481 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2483 = precise::clamp(_2481, 0.0, 1.0);
    float _2485 = fma(_2483, -2.0, 3.0);
    float _2487 = _2483 * _2483;
    out.m_91.z = _2479;
    out.m_91.w = _2022;
    float _2489 = _2487 * _2485;
    float _2491 = -_2489;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2489);
    float _2497 = _2459 * _2495;
    float _2499 = _2459;
    float _2501 = _2072;
    if (!_2012)
    {
        _2499 = 1.0;
    }
    float _2503 = _2499;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2048;
    out.gl_Position.z = _2475;
    out.gl_Position.w = _2022;
    float _2505 = _2503;
    if (_2012)
    {
        bool _2507 = _2106 >= _2094;
        bool _2509 = isnan(_2106);
        bool _2511 = _2507 || _2509;
        bool _2513 = isnan(_2094);
        bool _2515 = _2511 || _2513;
        float _2517 = float(_2515);
        _2505 = _2517;
    }
    float _2519 = _2505;
    float _2521 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2523 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2525 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2527 = isnan(_2349);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2533 = _2529 || _2531;
    float _2535 = _2445 * _2521;
    float _2537 = precise::clamp(_2535, 0.0, 1.0);
    float _2539 = _2519 * _2191;
    float _2541 = _2523 * _2108;
    float _2543 = -_2537;
    float _2545 = fma(_2543, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2547 = _2119 * _2541;
    float _2549 = -_2539;
    float _2551 = fma(_2549, _2545, 1.0);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = -_2523;
    float _2557 = _2555 + 1.0;
    float _2559 = _2523;
    float _2561 = _2521;
    float _2563 = _2557;
    float _2565 = _2553;
    if (!_2533)
    {
        _2559 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2567 = _2559;
    float _2569 = _2553 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2571 = _2119 * _2557;
    float _2573 = _2567;
    float _2575 = _2567;
    if (!_2533)
    {
        _2501 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2577 = _2501;
    float _2579 = _2577;
    float _2581 = _2577;
    if (!_2533)
    {
        _2561 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2583 = _2561;
    out.m_93.x = _2569;
    float _2585 = _2583;
    float _2587 = _2583;
    if (!_2533)
    {
        _2563 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2589 = _2563;
    float _2591 = _2589;
    float _2593 = _2589;
    if (!_2533)
    {
        _2565 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2595 = _2565;
    float _2597 = _2435 * _2541;
    float _2599 = fma(_2431, _2547, _2113);
    float _2601 = fma(_2433, _2547, _2115);
    float _2603 = fma(_2119, _2597, _2117);
    float _2605 = _2597;
    float _2607 = _2595;
    float _2609 = _2595;
    if (!_2533)
    {
        _2605 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2611 = _2605;
    out.m_95.x = _2599;
    out.m_95.y = _2601;
    out.m_95.z = _2603;
    out.m_95.w = _2571;
    bool _2613 = !_2533;
    float _2615 = _2611;
    float _2617 = _2611;
    if (!_2613)
    {
        bool _2619 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2621 = isnan(_2349);
        bool _2623 = _2619 || _2621;
        bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2627 = _2623 || _2625;
        if (!_2627)
        {
            float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2631 = _2349 + _2629;
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2633;
            float _2637 = 1.0 / _2635;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2655 = _2631 * _2637;
            float _2657 = precise::clamp(_2655, 0.0, 1.0);
            float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2667 = fma(_2657, _2641, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2669 = fma(_2657, _2661, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2671 = fma(_2657, _2665, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2673 = fma(_2657, _2645, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2675 = fma(_2657, _2649, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2677 = fma(_2657, _2653, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2575 = _2671;
            _2593 = _2675;
            _2617 = _2669;
            _2587 = _2673;
            _2581 = _2667;
            _2609 = _2677;
            _2679 = true;
        }
        else
        {
            bool _2681 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2683 = isnan(_2349);
            bool _2685 = _2681 || _2683;
            bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2689 = _2685 || _2687;
            if (!_2689)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2691 = _2615;
            _2617 = _2691;
            if (!_2689)
            {
                _2573 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2693 = _2573;
            _2575 = _2693;
            if (!_2689)
            {
                _2579 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2695 = _2579;
            _2581 = _2695;
            if (!_2689)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2697 = _2585;
            _2587 = _2697;
            if (!_2689)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2699 = _2591;
            _2593 = _2699;
            if (!_2689)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2701 = _2607;
            bool _2703 = !_2689;
            _2609 = _2701;
            if (!_2703)
            {
                bool _2705 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2707 = isnan(_2349);
                bool _2709 = _2705 || _2707;
                bool _2711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2713 = _2709 || _2711;
                if (!_2713)
                {
                    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2717 = _2349 + _2715;
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2719;
                    float _2723 = 1.0 / _2721;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2741 = _2717 * _2723;
                    float _2743 = precise::clamp(_2741, 0.0, 1.0);
                    float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2751 = _2749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2753 = fma(_2743, _2727, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2755 = fma(_2743, _2747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2757 = fma(_2743, _2751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2759 = fma(_2743, _2731, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2761 = fma(_2743, _2735, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2763 = fma(_2743, _2739, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2575 = _2757;
                    _2593 = _2761;
                    _2617 = _2755;
                    _2587 = _2759;
                    _2581 = _2753;
                    _2609 = _2763;
                    _2679 = true;
                }
                else
                {
                    _2575 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2581 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2679 = false;
    float _2765 = _2575;
    float _2767 = _2593;
    float _2769 = _2617;
    float _2771 = _2587;
    float _2773 = _2581;
    float _2775 = _2609;
    float _2777 = fma(_1409, -0.5, 0.5);
    float _2779 = precise::clamp(_2777, 0.0, 1.0);
    float _2781 = -_2765;
    float _2783 = _2781 + _2767;
    float _2785 = -_2769;
    float _2787 = _2785 + _2771;
    float _2789 = -_2773;
    float _2791 = _2789 + _2775;
    bool _2793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2795 = fma(_2779, _2783, _2765);
    float _2797 = fma(_2779, _2787, _2769);
    float _2799 = fma(_2779, _2791, _2773);
    float _2801 = _2795 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2803 = fma(_2797, 0.298911988735198974609375, _2801);
    float _2805 = fma(_2799, 0.114477999508380889892578125, _2803);
    out.m_97.x = 0.0;
    float _2807 = -_2805;
    float _2809 = _2797 + _2807;
    float _2811 = -_2805;
    float _2813 = _2795 + _2811;
    float _2815 = -_2805;
    float _2817 = _2799 + _2815;
    float _2819 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2821 = fma(_2809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    float _2823 = fma(_2813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    float _2825 = fma(_2817, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    out.m_93.w = _2819;
    out.m_99.x = _2821;
    out.m_99.y = _2823;
    out.m_99.z = _2825;
    if (!_2793)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2827 = -_1822;
    float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2831 = -_1824;
    float _2833 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2835 = -_1828;
    float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2839 = _2829 * _2829;
    float _2841 = fma(_2833, _2833, _2839);
    float _2843 = fma(_2837, _2837, _2841);
    float _2845 = sqrt(_2843);
    float _2847 = rsqrt(_2843);
    float _2849 = -_2845;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2853 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = _2833 * _2847;
    float _2859 = _2829 * _2847;
    float _2861 = abs(_2855);
    float _2863 = log2(_2861);
    float _2865 = _2837 * _2847;
    float _2867 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2869 = _1409 * _2859;
    float _2871 = -_2859;
    float _2873 = -_2867;
    float _2875 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2873);
    float _2877 = fma(_1407, _2857, _2869);
    float _2879 = -_2865;
    float _2881 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2875);
    float _2883 = fma(_1415, _2865, _2877);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2889 = _2881 + _2887;
    float _2891 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = exp2(_2891);
    float _2899 = _2897 * _2895;
    float _2901 = _2885 * _2899;
    float _2903 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2905 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2903;
    out.m_97.y = _2905;
    out.m_97.z = _2907;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2679 = false;
    bool _1465 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_139);
        out.gl_Position.z = _2966;
    }
    if (!_125)
    {
        return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_177);
        out.gl_Position.z = _3036;
    }
    if (_169)
    {
        return out;
    }
    float _179 = in.m_67.w;
    float _181 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _183 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = in.m_65.x;
    float _195 = in.m_65.y;
    float _197 = in.m_65.z;
    float _199 = in.m_60.x;
    float _201 = in.m_60.y;
    float _203 = in.m_60.z;
    float _205 = 0.0;
    float _207 = _181;
    if (!_191)
    {
        float _209 = _181 * _181;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    float _215 = _213;
    if (!_191)
    {
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_191;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _181 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _181);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_191;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _181 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _207 = _277;
    }
    float _279 = _207;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _193, _283);
    float _291 = fma(_279, _195, _285);
    float _293 = fma(_279, _197, _287);
    float _295 = fma(_289, _179, _199);
    float _297 = fma(_291, _179, _201);
    float _299 = fma(_293, _179, _203);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_69.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_121);
        float _325 = 1.0 / _323;
        float _327 = _157 * _325;
        _319 = _327;
        _129 = _323;
    }
    _321 = false;
    float _329 = _319;
    float _331 = _129;
    int _333 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _335 = _333;
    int _337 = 0;
    int _339 = _112(_335, _337, (*spvDescriptorSet0.support_buffer));
    float _341 = in.m_69.x;
    float _343 = in.m_71.z;
    float _345 = _341 * 8.0;
    float _347 = trunc(_343);
    int _349 = int(_347);
    float _351 = rint(_345);
    float _353 = _351 * 0.125;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    int _357 = _339 + (-1);
    float _359 = float(_357);
    float _361 = _355 * _359;
    float _363 = trunc(_361);
    int _365 = int(_363);
    int _367 = _365 + 1;
    int _369 = min(_357, _367);
    int _371 = _365;
    int _373 = 0;
    int _375 = _113(_371, _373, (*spvDescriptorSet0.support_buffer));
    int _377 = _349;
    int _379 = 0;
    int _381 = _113(_377, _379, (*spvDescriptorSet0.support_buffer));
    float3 _385 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_375, _381)), 0).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    int _393 = _369;
    int _395 = 0;
    int _397 = _113(_393, _395, (*spvDescriptorSet0.support_buffer));
    int _399 = _349;
    int _401 = 0;
    int _403 = _113(_399, _401, (*spvDescriptorSet0.support_buffer));
    float3 _405 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_397, _403)), 0).xyz;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = in.m_69.z;
    float _415 = _297 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = in.m_69.w;
    float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _425 = in.m_71.y;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = _329 + _427;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _437 = _435 != 0;
    float _439 = _297 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _443 = log2(_441);
    float _445 = _331;
    if (!_419)
    {
        float _447 = in.m_69.y;
        _445 = _447;
    }
    float _449 = _445;
    float _451 = _297 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _457 = _423 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _459 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _463 = _413 * 2.0;
    bool _465 = _421 > 0.5;
    float _467 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _469 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _471 = -_425;
    float _473 = _471 + 1.0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _485 = _483 != 0;
    float _487 = floor(_463);
    float _489 = _341 * 2.0;
    float _491 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _493 = _425;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_437)
    {
        float _497 = _465 ? _473 : _425;
        _493 = _497;
    }
    float _499 = _493;
    float _501 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _503 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    float _505 = _443 * _157;
    float _507 = floor(_489);
    if (!_419)
    {
        _495 = _449;
    }
    float _509 = _495;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = fma(_457, _499, -0.5);
    float _517 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _509;
    float _521 = _449;
    if (_419)
    {
        float _523 = in.m_69.x;
        float _525 = in.m_69.y;
        _519 = _523;
        _521 = _525;
    }
    float _527 = _519;
    float _529 = _521;
    bool _531 = _487 > 0.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    bool _537 = _487 >= 0.0;
    bool _539 = isnan(_487);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    float _547 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = exp2(_505);
    float _551 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _553 = _545 ? 0 : 1;
    out.m_75.x = _517;
    out.m_75.y = _547;
    out.m_75.z = _459;
    out.m_75.w = _455;
    bool _555 = _507 >= 0.0;
    bool _557 = isnan(_507);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    int _565 = ~_553;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = 1.0 / _535;
    int _573 = _569;
    if (!_531)
    {
        int _575 = ~_553;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    bool _581 = _507 > 0.0;
    float _583 = float(_579);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _587 = _341 + _413;
    float _589 = _527 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _591 = _587 + (-1.0);
    float _593 = _529 * 2.0;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _597 = _429 * _571;
    float _599 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _601 = _591;
    float _603 = _585;
    if (!_419)
    {
        _601 = _413;
    }
    float _605 = _601;
    float _607 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[83].z, _595);
    float _609 = _605;
    if (_419)
    {
        _609 = _529;
    }
    float _611 = _609;
    float _613 = -_585;
    float _615 = fma(_589, 2.0, _613);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _619 = floor(_593);
    if (!_419)
    {
        _603 = _413;
    }
    float _621 = _603;
    float _623 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[83].w, _617);
    float _625 = _621;
    if (_419)
    {
        _625 = _529;
    }
    float _627 = _625;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _631 = _563 ? 0 : 1;
    float _633 = _413 + _529;
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _637 = ~_631;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    float _643 = _633 + (-1.0);
    int _645 = _641;
    if (!_581)
    {
        int _647 = ~_631;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = fma(_635, -2.0, _629);
    float _655 = _341 + _529;
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _659 = -_549;
    float _661 = _659 + 1.0;
    float _663 = _655 + (-1.0);
    bool _665 = !_477;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _653);
    bool _671 = !_481;
    int _673 = _671 ? 0 : 1;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _677 = abs(_667);
    float _679 = _341 + (-0.5);
    int _681 = abs(_673);
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _607);
    float _685 = in.m_77.x;
    float _687 = in.m_77.y;
    float _689 = in.m_77.z;
    bool _691 = _619 > 0.0;
    float _693 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _623);
    bool _695 = _619 >= 0.0;
    bool _697 = isnan(_619);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _707 = 1.0 + _705;
    float _709 = float(_677);
    float _711 = _529 + (-0.5);
    float _713 = float(_681);
    float _715 = 1.0 / _707;
    float _717 = float(_651);
    float _719 = _709 * _583;
    bool _721 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _723 = isnan(1.0);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _729 = _725 || _727;
    float _731 = -_669;
    float _733 = fma(_693, _515, _731);
    bool _735 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _743 = _739 || _741;
    float _745 = _713 * _717;
    float _747 = _719 * (-2.0);
    bool _749 = !_485;
    int _751 = _749 ? 0 : 1;
    float _753 = -_157;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _615);
    float _757 = _743 ? _661 : 0.0;
    float _759 = fma(_675, _747, _675);
    int _761 = _703 ? 0 : 1;
    float _763 = _745 * (-2.0);
    int _765 = abs(_751);
    float _767 = fma(_747, _685, _685);
    float _769 = _715;
    if (_729)
    {
        float _771 = _757 * _715;
        _159 = _771;
    }
    float _773 = _159;
    int _775 = ~_761;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = fma(_657, _763, _657);
    float _783 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].x, _767);
    int _785 = _779;
    if (!_691)
    {
        int _787 = ~_761;
        int _789 = _787 + 1;
        _785 = _789;
    }
    int _791 = _785;
    float _793 = fma(_763, _687, _687);
    float _795 = fma(_759, _773, _783);
    float _797 = float(_791);
    float _799 = in.m_71.x;
    float _801 = float(_765);
    float _803 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _793);
    bool _805 = _413 > 0.5;
    bool _807 = _805 && _433;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _811 = _795 * 0.15915493667125701904296875;
    float _813 = _801 * _797;
    float _815 = fma(_781, _773, _803);
    float _817 = _813 * (-2.0);
    float _819 = _413 + (-0.5);
    float _821 = _815 * 0.15915493667125701904296875;
    float _823 = fma(_817, _689, _689);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _833;
    float _837 = fma(_599, _817, _599);
    bool _839 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _841 = isnan(_329);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_827, _597, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _853 = fma(_831, _597, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _855 = fma(_835, _597, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _857 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _823);
    float _859 = _817;
    if (_433)
    {
        _769 = _799;
    }
    float _861 = _769;
    float _863 = -_849;
    float _865 = _863 + 1.0;
    bool _867 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _869 = isnan(_329);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_837, _773, _857);
    float _881 = _861;
    if (!_433)
    {
        _859 = _799;
    }
    float _883 = _859;
    float _885 = _883;
    if (_807)
    {
        float _887 = -_861;
        float _889 = _887 + 1.0;
        _881 = _889;
    }
    float _891 = _881;
    float _893 = in.m_67.x;
    float _895 = in.m_67.y;
    float _897 = in.m_67.z;
    float _899 = _877 * _865;
    float _901 = _809 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _903 = _811 * 6.283185482025146484375;
    float _905 = sin(_903);
    if (_433)
    {
        _885 = _891;
    }
    float _907 = _885;
    float _909 = _879 * 0.15915493667125701904296875;
    float _911 = -_877;
    float _913 = _911 + 1.0;
    float _915 = _851 * _899;
    float _917 = _855 * _899;
    float _919 = fma(_901, _907, -0.5);
    float _921 = _811 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].z, _917);
    float _927 = fma(_683, _919, _755);
    float _929 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].z, _925);
    float _931 = _821 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = _853 * _899;
    float _937 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].x, _915);
    float _939 = in.m_79.x;
    float _941 = in.m_79.y;
    float _943 = in.m_79.z;
    float _945 = in.m_79.w;
    float _947 = _927 + 0.5;
    float _949 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].y, _935);
    float _951 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].x, _937);
    float _953 = _929 * _897;
    float _955 = _821 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].y, _949);
    float _961 = _951 * _893;
    float _963 = _733 + 0.5;
    float _965 = _959 * _895;
    float _967 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = _909 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _905 * _933;
    float _975 = _923 * _933;
    out.m_81.z = _947;
    out.m_81.w = _963;
    float _977 = _909 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _923 * _957;
    float _983 = _905 * _957;
    float _985 = floor(_361);
    float _987 = _923 * _971;
    float _989 = _905 * _971;
    float _991 = _957 * _971;
    float _993 = _933 * _971;
    float _995 = _987 * _941;
    float _997 = fma(_979, _981, _973);
    float _999 = fma(_979, _973, _981);
    float _1001 = -_983;
    float _1003 = fma(_979, _975, _1001);
    float _1005 = -_941;
    float _1007 = _979 * _1005;
    float _1009 = fma(_997, _939, _995);
    float _1011 = -_975;
    float _1013 = fma(_979, _983, _1011);
    float _1015 = fma(_991, _939, _1007);
    float _1017 = fma(_1003, _943, _1009);
    float _1019 = -_985;
    float _1021 = _361 + _1019;
    float _1023 = _989 * _941;
    float _1025 = fma(_993, _943, _1015);
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1033 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1027);
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1029);
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1031);
    float _1039 = -_389;
    float _1041 = _1039 + _409;
    float _1043 = -_387;
    float _1045 = _1043 + _407;
    float _1047 = fma(_1013, _939, _1023);
    float _1049 = -_391;
    float _1051 = _1049 + _411;
    float _1053 = fma(_1021, _1041, _389);
    float _1055 = in.m_83.x;
    float _1057 = in.m_83.y;
    float _1059 = in.m_83.z;
    float _1061 = fma(_1021, _1045, _387);
    float _1063 = fma(_1021, _1051, _391);
    float _1065 = fma(_999, _943, _1047);
    bool _1067 = _1053 != 0.0;
    bool _1069 = isnan(_1053);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1037);
    bool _1079 = _1061 == 0.0;
    bool _1081 = !_1075;
    bool _1083 = _1079 && _1081;
    float _1085 = _965 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1033);
    float _1089 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1053);
    bool _1091 = _1063 == 0.0;
    bool _1093 = _1091 && _1083;
    float _1095 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1061);
    float _1097 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1099 = _1089 * _1085;
    float _1101 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1063);
    float _1103 = _1095 * _967;
    float _1105 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1035);
    float _1107 = _987 * _1099;
    float _1109 = -_1099;
    float _1111 = _979 * _1109;
    float _1113 = _989 * _1099;
    float _1115 = _1101 * _1097;
    float _1117 = fma(_997, _1103, _1107);
    out.m_85.x = _1077;
    out.m_85.y = _1087;
    out.m_85.z = _1105;
    float _1119 = _1017;
    float _1121 = _1111;
    float _1123 = _1103;
    float _1125 = _1035;
    if (_1093)
    {
        _1119 = _1055;
    }
    float _1127 = _1119;
    float _1129 = fma(_991, _1103, _1111);
    float _1131 = fma(_1013, _1103, _1113);
    float _1133 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1127;
    float _1137 = _1131;
    if (_1093)
    {
        _1121 = _1127;
    }
    float _1139 = _1121;
    float _1141 = _1139;
    if (!_1093)
    {
        _1135 = _1055;
    }
    float _1143 = _1135;
    float _1145 = fma(_999, _1115, _1131);
    if (_1093)
    {
        _1137 = _1057;
    }
    float _1147 = _1137;
    float _1149 = 0.0;
    float _1151 = _1147;
    if (_1093)
    {
        _1149 = _1059;
    }
    float _1153 = _1149;
    float _1155 = fma(_1003, _1115, _1117);
    float _1157 = fma(_993, _1115, _1129);
    float _1159 = _1153;
    if (!_1093)
    {
        float _1161 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1143);
        _1141 = _1161;
    }
    float _1163 = _1141;
    if (_1093)
    {
        _1123 = _1153;
    }
    float _1165 = _1123;
    float _1167 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1171 = _1165;
    if (!_1093)
    {
        _1159 = _1059;
    }
    float _1173 = _1159;
    float _1175 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1177 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1179 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1169);
    float _1181 = _941 * _1173;
    float _1183 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1177);
    float _1185 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = _1177;
    if (_1093)
    {
        _1187 = _1147;
    }
    float _1189 = _1187;
    float _1191 = _943 * _1143;
    float _1193 = _551 + _1183;
    float _1195 = _1133 + _1185;
    float _1197 = _1189;
    float _1199 = _1193;
    float _1201 = _1195;
    if (!_1093)
    {
        _1151 = _1057;
    }
    float _1203 = _1151;
    if (!_1093)
    {
        float _1205 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1173);
        _1171 = _1205;
    }
    float _1207 = _1171;
    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1211 = _1193 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1215 = _1195 + _1213;
    float _1217 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1175);
    if (!_1093)
    {
        float _1219 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1203);
        _1197 = _1219;
    }
    float _1221 = _1197;
    float _1223 = _1211 * _1211;
    float _1225 = _1215 * _1215;
    float _1227 = _939 * _1203;
    float _1229 = -_1181;
    float _1231 = fma(_943, _1203, _1229);
    float _1233 = -_1191;
    float _1235 = fma(_939, _1173, _1233);
    float _1237 = _1223 + _1225;
    float _1239 = -_1227;
    float _1241 = fma(_941, _1143, _1239);
    float _1243 = _1231 * _945;
    float _1245 = _1235 * _945;
    float _1247 = sqrt(_1237);
    float _1249 = _1241 * _945;
    float _1251 = _987 * _1221;
    float _1253 = _989 * _1221;
    float _1255 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1217);
    float _1257 = _491 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1259 = -_1221;
    float _1261 = _979 * _1259;
    float _1263 = -_1245;
    float _1265 = _979 * _1263;
    float _1267 = _987 * _1245;
    float _1269 = _989 * _1245;
    float _1271 = _1257 + _1255;
    float _1273 = fma(_991, _1163, _1261);
    float _1275 = fma(_997, _1163, _1251);
    float _1277 = fma(_1013, _1163, _1253);
    float _1279 = fma(_991, _1243, _1265);
    float _1281 = fma(_997, _1243, _1267);
    bool _1283 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1285 = fma(_1013, _1243, _1269);
    float _1287 = fma(_993, _1207, _1273);
    float _1289 = fma(_1003, _1207, _1275);
    float _1291 = fma(_999, _1207, _1277);
    float _1293 = fma(_993, _1249, _1279);
    float _1295 = fma(_1003, _1249, _1281);
    float _1297 = fma(_999, _1249, _1285);
    float _1299 = _1265;
    float _1301 = _1223;
    float _1303 = _1225;
    int _1305 = as_type<int>(_1257);
    if (!_1283)
    {
        _1299 = _1271;
    }
    float _1307 = _1299;
    bool _1309 = !_1283;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1247 + _1315;
        float _1319 = rsqrt(_1237);
        float _1321 = _1317 * _1313;
        float _1323 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = _1321 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = cos(_1331);
        float _1335 = fma(_1329, _1323, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1337 = _1319 * _1335;
        float _1339 = fma(_1211, _1337, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1341 = _1333 + (-1.0);
        float _1343 = fma(_1215, _1337, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1347 = _1339 + _1345;
        float _1349 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1353 = _1343 + _1351;
        float _1355 = _1347 * _1347;
        float _1357 = fma(_1271, _1333, _1349);
        float _1359 = _1353 * _1353;
        _1311 = _1357;
        _1301 = _1355;
        _1303 = _1359;
        _1199 = _1339;
        _1201 = _1343;
    }
    float _1361 = _1311;
    float _1363 = _1301;
    float _1365 = _1303;
    float _1367 = _1199;
    float _1369 = _1201;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1373 = _1361 + _1371;
    float _1375 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1377 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1379 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1381 = fma(_1373, _1373, _1363);
    float _1383 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1385 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1387 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1389 = _1381 + _1365;
    float _1391 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1375);
    float _1393 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1377);
    float _1395 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1383);
    float _1397 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1379);
    float _1399 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1385);
    float _1401 = sqrt(_1389);
    float _1403 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1387);
    float _1405 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1391);
    float _1407 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1395);
    float _1409 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1397);
    float _1411 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1393);
    float _1413 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1399);
    float _1415 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    out.m_87.x = _1405;
    out.m_87.y = _1411;
    out.m_87.z = _1413;
    out.m_89.x = _1407;
    out.m_89.y = _1409;
    out.m_89.z = _1415;
    bool _1417 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1419 = isnan(_1401);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1425 = _1421 || _1423;
    float _1427 = _1403;
    float _1429 = _1361;
    if (!_1425)
    {
        _1427 = 1.0;
    }
    float _1431 = _1427;
    bool _1433 = !_1425;
    float _1435 = _1431;
    if (!_1433)
    {
        bool _1437 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1439 = isnan(_1401);
        bool _1441 = _1437 || _1439;
        bool _1443 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1445 = _1441 || _1443;
        if (!_1445)
        {
            float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1449 = _1401 + _1447;
            float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1453 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1451;
            float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1459 = 1.0 / _1453;
            float _1461 = _1449 * _1459;
            float _1463 = fma(_1461, _1457, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1435 = _1463;
            _1465 = true;
        }
        else
        {
            bool _1467 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1469 = isnan(_1401);
            bool _1471 = _1467 || _1469;
            bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1475 = _1471 || _1473;
            if (!_1475)
            {
                float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1479 = _1401 + _1477;
                float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1483 = _1481 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1489 = 1.0 / _1483;
                float _1491 = _1479 * _1489;
                float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1435 = _1493;
                _1465 = true;
            }
            else
            {
                _1435 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1465 = false;
    float _1495 = _1435;
    float _1497 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1499 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1501 = floor(_1497);
    float _1503 = floor(_1499);
    float _1505 = -_1501;
    float _1507 = _1497 + _1505;
    float _1509 = -_1503;
    float _1511 = _1499 + _1509;
    float2 _5135 = float2(_1507, _1511);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5135, float2(0.0), isnan(_5135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5135, float2(0.0), isnan(_5135)), level(0.0)).x;
    float _1515 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1519 = _1367 + _1517;
    float _1521 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1525 = _1369 + _1523;
    float _1527 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1521);
    float _1529 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1531 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _1533 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(0.5);
    bool _1541 = _1537 || _1539;
    float _1543 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1545 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1529);
    float _1547 = _1257 + _1531;
    float _1549 = fma(_1519, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1551 = 1.0 / _1543;
    float _1553 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1545);
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1557 = fma(_1525, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1559 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1561 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1555);
    float _1563 = _1559 + _1543;
    float _1565 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1561);
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1569 = _1563 * _1551;
    float _1571 = _1569 * 0.5;
    float _1573 = trunc(_1567);
    int _1575 = int(_1573);
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1579 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
    float _1581 = 1.0 / _1579;
    int _1583 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1585 = _1575 + _1583;
    int _1587 = _1585 + 1;
    float _1589 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1591 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1589);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1595 = _1581 * _1593;
    float _1597 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1591);
    bool _1599 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1601 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1603 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1605 = !_1599;
    int _1607 = _1605 ? 0 : 1;
    float _1609 = trunc(_1601);
    int _1611 = int(_1609);
    int _1613 = 2;
    float _1615 = _1495;
    uint _1618 = as_type<uint>(_1525);
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1622 = _1567;
    if (!_1599)
    {
        _1613 = 1;
    }
    int _1624 = _1613;
    int _1626 = _1624;
    if (!_1603)
    {
        _1626 = _1607;
    }
    int _1628 = _1626;
    bool _1630 = _1587 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1632 = _1628 << 6;
    int _1634 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1636 = _1611 + _1634;
    int _1638 = _1636 + 1;
    int _1640 = _1632 + 48;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    uint _1644 = uint(int(uint(int(_1642)) >> uint(2)));
    int _1646 = int(_1642) & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    int _1650 = int(_1642) + 1;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    int _1654 = _1650 & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    int _1658 = _1587 | _1638;
    bool _1660 = _1658 < 0;
    bool _1662 = _1660 || _1630;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1666 = _1361 + _1664;
    int _1668 = _1632 + 56;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
    float _1686 = _1666;
    if (_1541)
    {
        _1429 = _1549;
    }
    float _1688 = _1429;
    float _1690 = fma(_1666, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1692 = _1638 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1694 = _1692 || _1662;
    float _1696 = _1688;
    if (_1541)
    {
        _1615 = _1557;
    }
    float _1698 = _1615;
    int _1700 = _1632 + 64;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    float _1718 = _1698;
    if (_1541)
    {
        _1686 = _1690;
    }
    float _1720 = _1686;
    int _1722 = _1632 + 72;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    int _1740 = _1632 + 96;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    int _1758 = _1632 + 104;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _1720;
    if (!_1541)
    {
        float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1780 = _1257 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1784 = _551 + _1782;
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1788 = _1780 * _1780;
        float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1792 = _1133 + _1790;
        float _1794 = fma(_1784, _1784, _1788);
        float _1796 = fma(_1792, _1792, _1794);
        float _1798 = -_1257;
        float _1800 = _1798 + _1690;
        float _1802 = sqrt(_1796);
        float _1804 = precise::min(_1802, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1806 = _1804 * _1786;
        float _1808 = -_551;
        float _1810 = _1808 + _1549;
        float _1812 = -_1133;
        float _1814 = _1812 + _1557;
        float _1816 = fma(_1800, _1806, _1257);
        float _1818 = fma(_1810, _1806, _551);
        float _1820 = fma(_1814, _1806, _1133);
        _1776 = _1816;
        _1696 = _1818;
        _1618 = as_type<uint>(_1810);
        _1718 = _1820;
    }
    float _1822 = _1776;
    float _1824 = _1696;
    uint _1826 = _1618;
    float _1828 = _1718;
    float _1830 = _1547 * _1756;
    uint _1832 = _1826;
    if (!_1694)
    {
        int _1834 = _1638 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1836 = _1834 + _1587;
        _1832 = uint(_1836);
    }
    uint _1838 = _1832;
    float _1840 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1842 = _1547 * _1716;
    float _1844 = fma(_551, _1748, _1830);
    float _1846 = _1547 * _1656;
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1840);
    if (!_1694)
    {
        uint _1850 = uint(int(uint(int(_1838)) >> uint(2)));
        _1305 = int(_1850);
    }
    int _1852 = _1305;
    float _1854 = fma(_1133, _1766, _1844);
    float _1856 = fma(_551, _1648, _1846);
    float _1858 = fma(_551, _1708, _1842);
    float _1860 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1848);
    float _1862 = _1854 + _1774;
    int _1864 = as_type<int>(_1854);
    if (!_1694)
    {
        int _1866 = int(_1838) << 2;
        _1864 = _1866;
    }
    int _1868 = _1864;
    int _1870 = _1632 + 80;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    float _1888 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1890 = 1.0 / _1862;
    int _1892 = _1868;
    if (!_1694)
    {
        int _1894 = 12 & _1868;
        _1892 = _1894;
    }
    int _1896 = _1892;
    float _1898 = fma(_1133, _1676, _1856);
    float _1900 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_1694)
    {
        int _1904 = _1852 << 4;
        int _1906 = _1904 + _1896;
        _1620 = as_type<float>(_1906);
    }
    float _1908 = _1620;
    int _1910 = _1632 + 88;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
    int _1916 = int(_1912) & 3;
    float _1918 = (*spvDescriptorSet0.vp_c15)._m0[int(_1914)][_1916];
    int _1920 = int(_1912) + 1;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    int _1924 = _1920 & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    float _1928 = _1898 + _1684;
    float _1930 = -_1902;
    float _1932 = fma(_1930, _1900, 1.0);
    float _1934 = fma(_1133, _1730, _1858);
    float _1936 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1938 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1940 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1942 = _1934 + _1738;
    float _1944 = _1908;
    if (!_1694)
    {
        int _1946 = as_type<int>(_1908) + 400;
        uint _1948 = uint(int(uint(_1946) >> uint(2)));
        uint _1950 = uint(int(uint(int(_1948)) >> uint(2)));
        int _1952 = int(_1948) & 3;
        float _1954 = (*spvDescriptorSet0.vp_c15)._m0[int(_1950)][_1952];
        _1944 = _1954;
    }
    float _1956 = _1944;
    float _1958 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1936);
    float _1960 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1938);
    float _1962 = _1928 * _1890;
    float _1964 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1940);
    float _1966 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1960);
    float _1970 = _1690;
    float _1972 = _1890;
    if (!_1694)
    {
        float _1974 = floor(_1567);
        _1970 = _1974;
    }
    float _1976 = _1970;
    bool _1978 = _1962 >= 0.0;
    float _1980 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = _1942 * _1890;
    bool _1986 = _1962 <= 1.0;
    bool _1988 = _1986 && _1978;
    float _1990 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1964);
    float _1992 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1994 = _1942;
    if (!_1694)
    {
        float _1996 = floor(_1601);
        _1994 = _1996;
    }
    float _1998 = _1994;
    bool _2000 = _1984 >= 0.0;
    bool _2002 = _2000 && _1988;
    float _2004 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2006 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1992);
    float _2008 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2010 = _1984 <= 1.0;
    bool _2012 = _2010 && _2002;
    float _2014 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2006);
    float _2016 = log2(_1932);
    float _2018 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2020 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2008);
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    if (!_1694)
    {
        float _2024 = -_1976;
        float _2026 = _1567 + _2024;
        _1125 = _2026;
    }
    float _2028 = _1125;
    float _2030 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2018);
    float _2032 = 1.0 / _2022;
    float _2034 = _1547 * _1886;
    float _2036 = _1886;
    if (_2012)
    {
        float _2038 = float(_1628);
        _2036 = _2038;
    }
    float _2040 = _2036;
    float _2042 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2044 = fma(_551, _1878, _2034);
    float _2046 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2030);
    float _2048 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2042);
    float _2050 = _2034;
    float _2052 = _2044;
    if (_2012)
    {
        float _2054 = rint(_2040);
        float _2056 = precise::max(_2054, 0.0);
        uint _2058 = uint(_2056);
        uint _2060 = clamp(_2058, 0u, 65535u);
        _2050 = as_type<float>(_2060);
    }
    float _2062 = _2050;
    float _2064 = fma(_1133, _1918, _2044);
    if (!_1694)
    {
        float _2066 = -_1998;
        float _2068 = _1601 + _2066;
        _2052 = _2068;
    }
    float _2070 = _2052;
    float _2072 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2046);
    float _2074 = _2016 * 0.693147182464599609375;
    float _2076 = _2064 + _1926;
    float _2078 = _2072 * _2032;
    float _2080 = _1976;
    if (!_1694)
    {
        float _2082 = rint(_1956);
        float _2084 = precise::max(_2082, 0.0);
        uint _2086 = uint(_2084);
        uint _2088 = clamp(_2086, 0u, 65535u);
        _2080 = as_type<float>(_2088);
    }
    float _2090 = _2080;
    float _2092 = _2048 * _2032;
    float _2094 = _2076 * _1890;
    float _2096 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2098 = fma(_2078, 0.5, 0.5);
    float _2100 = fma(_2092, -0.5, 0.5);
    float _2102 = _2062;
    if (_2012)
    {
        float3 _6151 = float3(_1962, _1984, float(as_type<int>(_2062)));
        float3 _6155 = select(_6151, float3(0.0), isnan(_6151));
        float _2104 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6155.xy, uint(rint(_6155.z)), _2094, level(0.0));
        _2102 = _2104;
    }
    float _2106 = _2102;
    float3 _6165 = float3(_2098, _2100, _2096);
    float _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6165, float3(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6165, float3(0.0), isnan(_6165)), level(0.0)).x;
    float3 _6174 = float3(_2098, _2100, _2096);
    float4 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = _2111.w;
    float _2121 = _2028;
    if (!_1694)
    {
        float3 _6197 = float3(_2028, _2070, float(as_type<int>(_2090)));
        float3 _6199 = select(_6197, float3(0.0), isnan(_6197));
        float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6199.xy, uint(rint(_6199.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6199.xy, uint(rint(_6199.z)), level(0.0)).x;
        _2121 = _2123;
    }
    float _2125 = _2121;
    if (_1694)
    {
        _1972 = 1.0;
    }
    float _2127 = _1972;
    float _2129 = _2127;
    if (!_1694)
    {
        int _2131 = int(_1838) << 4;
        int _2133 = _2131 + 2048;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        uint _2137 = uint(int(uint(int(_2135)) >> uint(2)));
        int _2139 = int(_2135) & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = int(_2135) + 1;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        int _2147 = _2143 & 3;
        float _2149 = (*spvDescriptorSet0.vp_c15)._m0[int(_2145)][_2147];
        int _2151 = _2133 + 8;
        uint _2153 = uint(int(uint(_2151) >> uint(2)));
        uint _2155 = uint(int(uint(int(_2153)) >> uint(2)));
        int _2157 = int(_2153) & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        int _2161 = int(_2153) + 1;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        int _2165 = _2161 & 3;
        float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
        float _2169 = _1547 * _2149;
        float _2171 = fma(_551, _2141, _2169);
        float _2173 = fma(_1133, _2159, _2171);
        float _2175 = _2173 + _2167;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = -_2177;
        float _2181 = _2179 + _2125;
        float _2183 = fma(_2181, 500.0, 1.5);
        float _2185 = exp2(_2183);
        float _2187 = 0.0 + _2185;
        float _2189 = precise::clamp(_2187, 0.0, 1.0);
        _2129 = _2189;
    }
    float _2191 = _2129;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2195 = _1822 + _2193;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2199 = _1824 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2203 = _1828 + _2201;
    float _2205 = _2195 * _2195;
    float _2207 = fma(_2199, _2199, _2205);
    float _2209 = fma(_2203, _2203, _2207);
    float _2211 = rsqrt(_2209);
    float _2213 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2215 = _2199 * _2213;
    float _2217 = _2203 * _2213;
    float _2219 = _2215 * _2215;
    float _2221 = _2217 * _2217;
    float _2223 = _2219 + _2221;
    float _2225 = sqrt(_2223);
    bool _2227 = _2225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2231 = _2225 + _2229;
    float _2233 = _2211;
    float _2235 = _2231;
    float _2237 = _2195;
    float _2239 = _2213;
    if (_2227)
    {
        float _2241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2233 = _2241;
    }
    float _2243 = _2233;
    float _2245 = _2243;
    if (_2227)
    {
        float _2247 = _2231 * _2243;
        _2235 = _2247;
    }
    float _2249 = _2235;
    if (_2227)
    {
        float _2251 = rsqrt(_2223);
        _2245 = _2251;
    }
    float _2253 = _2245;
    float _2255 = _2253;
    if (_2227)
    {
        float _2257 = _2249 * 0.15915493667125701904296875;
        _1622 = _2257;
    }
    float _2259 = _1622;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2263 = _2203;
    float _2265 = _2259;
    if (_2227)
    {
        float _2267 = _2259 * 6.283185482025146484375;
        float _2269 = sin(_2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = precise::max(0.0, _2261);
    float _2275 = _1962;
    float _2277 = _2273;
    if (_2227)
    {
        float _2279 = _2259 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        _2275 = _2281;
    }
    float _2283 = _2275;
    float _2285 = -_2213;
    float _2287 = -_2273;
    float _2289 = fma(_2195, _2285, _2287);
    if (_2227)
    {
        float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2291;
    }
    float _2293 = _2237;
    float _2295 = _2271;
    float _2297 = _2293;
    if (_2227)
    {
        float _2299 = fma(_2271, _2293, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2295 = _2299;
    }
    float _2301 = _2295;
    float _2303 = _2301;
    if (!_2227)
    {
        _2297 = _2289;
    }
    float _2305 = _2297;
    float _2307 = _2305;
    if (!_2227)
    {
        _2265 = _2219;
    }
    float _2309 = _2265;
    float _2311 = 0.0;
    float _2313 = _2309;
    if (_2227)
    {
        float _2315 = _2253 * _2301;
        _2311 = _2315;
    }
    float _2317 = _2311;
    if (!_2227)
    {
        _2255 = _2215;
    }
    float _2319 = _2255;
    float _2321 = _2319;
    float _2323 = _2283;
    if (_2227)
    {
        float _2325 = _2283 + (-1.0);
        _2277 = _2325;
    }
    float _2327 = _2277;
    if (_2227)
    {
        float _2329 = _2215 * _2317;
        _2321 = _2329;
    }
    float _2331 = _2321;
    if (!_2227)
    {
        _2303 = _2217;
    }
    float _2333 = _2303;
    float _2335 = _2333;
    if (_2227)
    {
        float _2337 = _2217 * _2317;
        _2335 = _2337;
    }
    float _2339 = _2335;
    if (_2227)
    {
        float _2341 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2341;
    }
    float _2343 = _2239;
    if (_2227)
    {
        float _2345 = _2331 * _2331;
        _2313 = _2345;
    }
    float _2347 = _2313;
    float _2349 = sqrt(_2209);
    if (_2227)
    {
        float _2351 = fma(_2289, _2283, _2343);
        _2307 = _2351;
    }
    float _2353 = _2307;
    if (!_2227)
    {
        _2323 = _2221;
    }
    float _2355 = _2323;
    float _2357 = _2355;
    if (_2227)
    {
        float _2359 = _2339 * _2339;
        _2357 = _2359;
    }
    float _2361 = _2357;
    float _2363 = fma(_2353, _2353, _2347);
    float _2365 = _2363 + _2361;
    float _2367 = rsqrt(_2365);
    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2371 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2369);
    float _2373 = precise::clamp(_2371, 0.0, 1.0);
    float _2375 = -_2373;
    float _2377 = _2375 + 1.0;
    float _2379 = _2367 * _2353;
    float _2381 = _2367 * _2331;
    float _2383 = abs(_2377);
    float _2385 = log2(_2383);
    float _2387 = _2367 * _2339;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2391 = -_2389;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2391);
    float _2395 = -_2387;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2393);
    float _2399 = fma(_2397, -0.5, 0.5);
    float _2401 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2403 = fma(_2397, 0.5, 0.5);
    float _2405 = _2379 + 1.0;
    float _2407 = sqrt(_2399);
    float _2409 = fma(_2403, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2411 = fma(_2403, _2409, -0.212114393711090087890625);
    float _2413 = exp2(_2401);
    float _2415 = fma(_2403, _2411, 1.570728778839111328125);
    float _2417 = _2407 * 0.636619746685028076171875;
    float _2419 = -_2415;
    float _2421 = fma(_2417, _2419, 1.0);
    float _2423 = -_2379;
    float _2425 = fma(_2413, _2405, _2423);
    float _2427 = fma(_2425, 0.5, 0.5);
    float2 _6672 = float2(_2421, _2427);
    float3 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6672, float2(0.0), isnan(_6672)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6672, float2(0.0), isnan(_6672)), level(0.0)).xyz;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = abs(_1595);
    float _2439 = log2(_2437);
    float _2441 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2443 = -_1513;
    float _2445 = _2443 + 1.0;
    float _2447 = exp2(_2441);
    bool _2449 = _1595 <= 8000.0;
    bool _2451 = isnan(_1595);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(8000.0);
    bool _2457 = _2453 || _2455;
    float _2459 = float(_2457);
    float _2461 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2463 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2465 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2463);
    float _2467 = exp2(_2461);
    float _2469 = -_2447;
    float _2471 = _2469 + 1.0;
    float _2473 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2465);
    float _2475 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2473);
    float _2477 = _2475 + _2022;
    float _2479 = _2477 * 0.5;
    float _2481 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2483 = precise::clamp(_2481, 0.0, 1.0);
    float _2485 = fma(_2483, -2.0, 3.0);
    float _2487 = _2483 * _2483;
    out.m_91.z = _2479;
    out.m_91.w = _2022;
    float _2489 = _2487 * _2485;
    float _2491 = -_2489;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2489);
    float _2497 = _2459 * _2495;
    float _2499 = _2459;
    float _2501 = _2072;
    if (!_2012)
    {
        _2499 = 1.0;
    }
    float _2503 = _2499;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2048;
    out.gl_Position.z = _2475;
    out.gl_Position.w = _2022;
    float _2505 = _2503;
    if (_2012)
    {
        bool _2507 = _2106 >= _2094;
        bool _2509 = isnan(_2106);
        bool _2511 = _2507 || _2509;
        bool _2513 = isnan(_2094);
        bool _2515 = _2511 || _2513;
        float _2517 = float(_2515);
        _2505 = _2517;
    }
    float _2519 = _2505;
    float _2521 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2523 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2525 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2527 = isnan(_2349);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2533 = _2529 || _2531;
    float _2535 = _2445 * _2521;
    float _2537 = precise::clamp(_2535, 0.0, 1.0);
    float _2539 = _2519 * _2191;
    float _2541 = _2523 * _2108;
    float _2543 = -_2537;
    float _2545 = fma(_2543, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2547 = _2119 * _2541;
    float _2549 = -_2539;
    float _2551 = fma(_2549, _2545, 1.0);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = -_2523;
    float _2557 = _2555 + 1.0;
    float _2559 = _2523;
    float _2561 = _2521;
    float _2563 = _2557;
    float _2565 = _2553;
    if (!_2533)
    {
        _2559 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2567 = _2559;
    float _2569 = _2553 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2571 = _2119 * _2557;
    float _2573 = _2567;
    float _2575 = _2567;
    if (!_2533)
    {
        _2501 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2577 = _2501;
    float _2579 = _2577;
    float _2581 = _2577;
    if (!_2533)
    {
        _2561 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2583 = _2561;
    out.m_93.x = _2569;
    float _2585 = _2583;
    float _2587 = _2583;
    if (!_2533)
    {
        _2563 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2589 = _2563;
    float _2591 = _2589;
    float _2593 = _2589;
    if (!_2533)
    {
        _2565 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2595 = _2565;
    float _2597 = _2435 * _2541;
    float _2599 = fma(_2431, _2547, _2113);
    float _2601 = fma(_2433, _2547, _2115);
    float _2603 = fma(_2119, _2597, _2117);
    float _2605 = _2597;
    float _2607 = _2595;
    float _2609 = _2595;
    if (!_2533)
    {
        _2605 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2611 = _2605;
    out.m_95.x = _2599;
    out.m_95.y = _2601;
    out.m_95.z = _2603;
    out.m_95.w = _2571;
    bool _2613 = !_2533;
    float _2615 = _2611;
    float _2617 = _2611;
    if (!_2613)
    {
        bool _2619 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2621 = isnan(_2349);
        bool _2623 = _2619 || _2621;
        bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2627 = _2623 || _2625;
        if (!_2627)
        {
            float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2631 = _2349 + _2629;
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2633;
            float _2637 = 1.0 / _2635;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2655 = _2631 * _2637;
            float _2657 = precise::clamp(_2655, 0.0, 1.0);
            float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2667 = fma(_2657, _2641, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2669 = fma(_2657, _2661, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2671 = fma(_2657, _2665, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2673 = fma(_2657, _2645, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2675 = fma(_2657, _2649, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2677 = fma(_2657, _2653, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2575 = _2671;
            _2593 = _2675;
            _2617 = _2669;
            _2587 = _2673;
            _2581 = _2667;
            _2609 = _2677;
            _2679 = true;
        }
        else
        {
            bool _2681 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2683 = isnan(_2349);
            bool _2685 = _2681 || _2683;
            bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2689 = _2685 || _2687;
            if (!_2689)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2691 = _2615;
            _2617 = _2691;
            if (!_2689)
            {
                _2573 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2693 = _2573;
            _2575 = _2693;
            if (!_2689)
            {
                _2579 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2695 = _2579;
            _2581 = _2695;
            if (!_2689)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2697 = _2585;
            _2587 = _2697;
            if (!_2689)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2699 = _2591;
            _2593 = _2699;
            if (!_2689)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2701 = _2607;
            bool _2703 = !_2689;
            _2609 = _2701;
            if (!_2703)
            {
                bool _2705 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2707 = isnan(_2349);
                bool _2709 = _2705 || _2707;
                bool _2711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2713 = _2709 || _2711;
                if (!_2713)
                {
                    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2717 = _2349 + _2715;
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2719;
                    float _2723 = 1.0 / _2721;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2741 = _2717 * _2723;
                    float _2743 = precise::clamp(_2741, 0.0, 1.0);
                    float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2751 = _2749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2753 = fma(_2743, _2727, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2755 = fma(_2743, _2747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2757 = fma(_2743, _2751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2759 = fma(_2743, _2731, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2761 = fma(_2743, _2735, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2763 = fma(_2743, _2739, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2575 = _2757;
                    _2593 = _2761;
                    _2617 = _2755;
                    _2587 = _2759;
                    _2581 = _2753;
                    _2609 = _2763;
                    _2679 = true;
                }
                else
                {
                    _2575 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2581 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2679 = false;
    float _2765 = _2575;
    float _2767 = _2593;
    float _2769 = _2617;
    float _2771 = _2587;
    float _2773 = _2581;
    float _2775 = _2609;
    float _2777 = fma(_1409, -0.5, 0.5);
    float _2779 = precise::clamp(_2777, 0.0, 1.0);
    float _2781 = -_2765;
    float _2783 = _2781 + _2767;
    float _2785 = -_2769;
    float _2787 = _2785 + _2771;
    float _2789 = -_2773;
    float _2791 = _2789 + _2775;
    bool _2793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2795 = fma(_2779, _2783, _2765);
    float _2797 = fma(_2779, _2787, _2769);
    float _2799 = fma(_2779, _2791, _2773);
    float _2801 = _2795 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2803 = fma(_2797, 0.298911988735198974609375, _2801);
    float _2805 = fma(_2799, 0.114477999508380889892578125, _2803);
    out.m_97.x = 0.0;
    float _2807 = -_2805;
    float _2809 = _2797 + _2807;
    float _2811 = -_2805;
    float _2813 = _2795 + _2811;
    float _2815 = -_2805;
    float _2817 = _2799 + _2815;
    float _2819 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2821 = fma(_2809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    float _2823 = fma(_2813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    float _2825 = fma(_2817, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    out.m_93.w = _2819;
    out.m_99.x = _2821;
    out.m_99.y = _2823;
    out.m_99.z = _2825;
    if (!_2793)
    {
        return out;
    }
    float _2827 = -_1822;
    float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2831 = -_1824;
    float _2833 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2835 = -_1828;
    float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2839 = _2829 * _2829;
    float _2841 = fma(_2833, _2833, _2839);
    float _2843 = fma(_2837, _2837, _2841);
    float _2845 = sqrt(_2843);
    float _2847 = rsqrt(_2843);
    float _2849 = -_2845;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2853 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = _2833 * _2847;
    float _2859 = _2829 * _2847;
    float _2861 = abs(_2855);
    float _2863 = log2(_2861);
    float _2865 = _2837 * _2847;
    float _2867 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2869 = _1409 * _2859;
    float _2871 = -_2859;
    float _2873 = -_2867;
    float _2875 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2873);
    float _2877 = fma(_1407, _2857, _2869);
    float _2879 = -_2865;
    float _2881 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2875);
    float _2883 = fma(_1415, _2865, _2877);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2889 = _2881 + _2887;
    float _2891 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = exp2(_2891);
    float _2899 = _2897 * _2895;
    float _2901 = _2885 * _2899;
    float _2903 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2905 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2903;
    out.m_97.y = _2905;
    out.m_97.z = _2907;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2679 = false;
    bool _1465 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_139);
        out.gl_Position.z = _2966;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_177);
        out.gl_Position.z = _3036;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = in.m_67.w;
    float _181 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _183 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = in.m_65.x;
    float _195 = in.m_65.y;
    float _197 = in.m_65.z;
    float _199 = in.m_60.x;
    float _201 = in.m_60.y;
    float _203 = in.m_60.z;
    float _205 = 0.0;
    float _207 = _181;
    if (!_191)
    {
        float _209 = _181 * _181;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    float _215 = _213;
    if (!_191)
    {
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_191;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _181 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _181);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_191;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _181 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _207 = _277;
    }
    float _279 = _207;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _193, _283);
    float _291 = fma(_279, _195, _285);
    float _293 = fma(_279, _197, _287);
    float _295 = fma(_289, _179, _199);
    float _297 = fma(_291, _179, _201);
    float _299 = fma(_293, _179, _203);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_69.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_121);
        float _325 = 1.0 / _323;
        float _327 = _157 * _325;
        _319 = _327;
        _129 = _323;
    }
    _321 = false;
    float _329 = _319;
    float _331 = _129;
    int _333 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _335 = _333;
    int _337 = 0;
    int _339 = _112(_335, _337, (*spvDescriptorSet0.support_buffer));
    float _341 = in.m_69.x;
    float _343 = in.m_71.z;
    float _345 = _341 * 8.0;
    float _347 = trunc(_343);
    int _349 = int(_347);
    float _351 = rint(_345);
    float _353 = _351 * 0.125;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    int _357 = _339 + (-1);
    float _359 = float(_357);
    float _361 = _355 * _359;
    float _363 = trunc(_361);
    int _365 = int(_363);
    int _367 = _365 + 1;
    int _369 = min(_357, _367);
    int _371 = _365;
    int _373 = 0;
    int _375 = _113(_371, _373, (*spvDescriptorSet0.support_buffer));
    int _377 = _349;
    int _379 = 0;
    int _381 = _113(_377, _379, (*spvDescriptorSet0.support_buffer));
    float3 _385 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_375, _381)), 0).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    int _393 = _369;
    int _395 = 0;
    int _397 = _113(_393, _395, (*spvDescriptorSet0.support_buffer));
    int _399 = _349;
    int _401 = 0;
    int _403 = _113(_399, _401, (*spvDescriptorSet0.support_buffer));
    float3 _405 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_397, _403)), 0).xyz;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = in.m_69.z;
    float _415 = _297 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = in.m_69.w;
    float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _425 = in.m_71.y;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = _329 + _427;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _437 = _435 != 0;
    float _439 = _297 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _443 = log2(_441);
    float _445 = _331;
    if (!_419)
    {
        float _447 = in.m_69.y;
        _445 = _447;
    }
    float _449 = _445;
    float _451 = _297 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _457 = _423 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _459 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _463 = _413 * 2.0;
    bool _465 = _421 > 0.5;
    float _467 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _469 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _471 = -_425;
    float _473 = _471 + 1.0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _485 = _483 != 0;
    float _487 = floor(_463);
    float _489 = _341 * 2.0;
    float _491 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _493 = _425;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_437)
    {
        float _497 = _465 ? _473 : _425;
        _493 = _497;
    }
    float _499 = _493;
    float _501 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _503 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    float _505 = _443 * _157;
    float _507 = floor(_489);
    if (!_419)
    {
        _495 = _449;
    }
    float _509 = _495;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = fma(_457, _499, -0.5);
    float _517 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _509;
    float _521 = _449;
    if (_419)
    {
        float _523 = in.m_69.x;
        float _525 = in.m_69.y;
        _519 = _523;
        _521 = _525;
    }
    float _527 = _519;
    float _529 = _521;
    bool _531 = _487 > 0.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    bool _537 = _487 >= 0.0;
    bool _539 = isnan(_487);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    float _547 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = exp2(_505);
    float _551 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _553 = _545 ? 0 : 1;
    out.m_75.x = _517;
    out.m_75.y = _547;
    out.m_75.z = _459;
    out.m_75.w = _455;
    bool _555 = _507 >= 0.0;
    bool _557 = isnan(_507);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    int _565 = ~_553;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = 1.0 / _535;
    int _573 = _569;
    if (!_531)
    {
        int _575 = ~_553;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    bool _581 = _507 > 0.0;
    float _583 = float(_579);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _587 = _341 + _413;
    float _589 = _527 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _591 = _587 + (-1.0);
    float _593 = _529 * 2.0;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _597 = _429 * _571;
    float _599 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _601 = _591;
    float _603 = _585;
    if (!_419)
    {
        _601 = _413;
    }
    float _605 = _601;
    float _607 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[83].z, _595);
    float _609 = _605;
    if (_419)
    {
        _609 = _529;
    }
    float _611 = _609;
    float _613 = -_585;
    float _615 = fma(_589, 2.0, _613);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _619 = floor(_593);
    if (!_419)
    {
        _603 = _413;
    }
    float _621 = _603;
    float _623 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[83].w, _617);
    float _625 = _621;
    if (_419)
    {
        _625 = _529;
    }
    float _627 = _625;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _631 = _563 ? 0 : 1;
    float _633 = _413 + _529;
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _637 = ~_631;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    float _643 = _633 + (-1.0);
    int _645 = _641;
    if (!_581)
    {
        int _647 = ~_631;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = fma(_635, -2.0, _629);
    float _655 = _341 + _529;
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _659 = -_549;
    float _661 = _659 + 1.0;
    float _663 = _655 + (-1.0);
    bool _665 = !_477;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _653);
    bool _671 = !_481;
    int _673 = _671 ? 0 : 1;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _677 = abs(_667);
    float _679 = _341 + (-0.5);
    int _681 = abs(_673);
    float _683 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _607);
    float _685 = in.m_77.x;
    float _687 = in.m_77.y;
    float _689 = in.m_77.z;
    bool _691 = _619 > 0.0;
    float _693 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _623);
    bool _695 = _619 >= 0.0;
    bool _697 = isnan(_619);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _707 = 1.0 + _705;
    float _709 = float(_677);
    float _711 = _529 + (-0.5);
    float _713 = float(_681);
    float _715 = 1.0 / _707;
    float _717 = float(_651);
    float _719 = _709 * _583;
    bool _721 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _723 = isnan(1.0);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _729 = _725 || _727;
    float _731 = -_669;
    float _733 = fma(_693, _515, _731);
    bool _735 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _743 = _739 || _741;
    float _745 = _713 * _717;
    float _747 = _719 * (-2.0);
    bool _749 = !_485;
    int _751 = _749 ? 0 : 1;
    float _753 = -_157;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _615);
    float _757 = _743 ? _661 : 0.0;
    float _759 = fma(_675, _747, _675);
    int _761 = _703 ? 0 : 1;
    float _763 = _745 * (-2.0);
    int _765 = abs(_751);
    float _767 = fma(_747, _685, _685);
    float _769 = _715;
    if (_729)
    {
        float _771 = _757 * _715;
        _159 = _771;
    }
    float _773 = _159;
    int _775 = ~_761;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = fma(_657, _763, _657);
    float _783 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].x, _767);
    int _785 = _779;
    if (!_691)
    {
        int _787 = ~_761;
        int _789 = _787 + 1;
        _785 = _789;
    }
    int _791 = _785;
    float _793 = fma(_763, _687, _687);
    float _795 = fma(_759, _773, _783);
    float _797 = float(_791);
    float _799 = in.m_71.x;
    float _801 = float(_765);
    float _803 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _793);
    bool _805 = _413 > 0.5;
    bool _807 = _805 && _433;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _811 = _795 * 0.15915493667125701904296875;
    float _813 = _801 * _797;
    float _815 = fma(_781, _773, _803);
    float _817 = _813 * (-2.0);
    float _819 = _413 + (-0.5);
    float _821 = _815 * 0.15915493667125701904296875;
    float _823 = fma(_817, _689, _689);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _833;
    float _837 = fma(_599, _817, _599);
    bool _839 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _841 = isnan(_329);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_827, _597, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _853 = fma(_831, _597, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _855 = fma(_835, _597, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _857 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _823);
    float _859 = _817;
    if (_433)
    {
        _769 = _799;
    }
    float _861 = _769;
    float _863 = -_849;
    float _865 = _863 + 1.0;
    bool _867 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _869 = isnan(_329);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_837, _773, _857);
    float _881 = _861;
    if (!_433)
    {
        _859 = _799;
    }
    float _883 = _859;
    float _885 = _883;
    if (_807)
    {
        float _887 = -_861;
        float _889 = _887 + 1.0;
        _881 = _889;
    }
    float _891 = _881;
    float _893 = in.m_67.x;
    float _895 = in.m_67.y;
    float _897 = in.m_67.z;
    float _899 = _877 * _865;
    float _901 = _809 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _903 = _811 * 6.283185482025146484375;
    float _905 = sin(_903);
    if (_433)
    {
        _885 = _891;
    }
    float _907 = _885;
    float _909 = _879 * 0.15915493667125701904296875;
    float _911 = -_877;
    float _913 = _911 + 1.0;
    float _915 = _851 * _899;
    float _917 = _855 * _899;
    float _919 = fma(_901, _907, -0.5);
    float _921 = _811 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].z, _917);
    float _927 = fma(_683, _919, _755);
    float _929 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].z, _925);
    float _931 = _821 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = _853 * _899;
    float _937 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].x, _915);
    float _939 = in.m_79.x;
    float _941 = in.m_79.y;
    float _943 = in.m_79.z;
    float _945 = in.m_79.w;
    float _947 = _927 + 0.5;
    float _949 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].y, _935);
    float _951 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].x, _937);
    float _953 = _929 * _897;
    float _955 = _821 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[144].y, _949);
    float _961 = _951 * _893;
    float _963 = _733 + 0.5;
    float _965 = _959 * _895;
    float _967 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = _909 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _905 * _933;
    float _975 = _923 * _933;
    out.m_81.z = _947;
    out.m_81.w = _963;
    float _977 = _909 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _923 * _957;
    float _983 = _905 * _957;
    float _985 = floor(_361);
    float _987 = _923 * _971;
    float _989 = _905 * _971;
    float _991 = _957 * _971;
    float _993 = _933 * _971;
    float _995 = _987 * _941;
    float _997 = fma(_979, _981, _973);
    float _999 = fma(_979, _973, _981);
    float _1001 = -_983;
    float _1003 = fma(_979, _975, _1001);
    float _1005 = -_941;
    float _1007 = _979 * _1005;
    float _1009 = fma(_997, _939, _995);
    float _1011 = -_975;
    float _1013 = fma(_979, _983, _1011);
    float _1015 = fma(_991, _939, _1007);
    float _1017 = fma(_1003, _943, _1009);
    float _1019 = -_985;
    float _1021 = _361 + _1019;
    float _1023 = _989 * _941;
    float _1025 = fma(_993, _943, _1015);
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1033 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1027);
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1029);
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1031);
    float _1039 = -_389;
    float _1041 = _1039 + _409;
    float _1043 = -_387;
    float _1045 = _1043 + _407;
    float _1047 = fma(_1013, _939, _1023);
    float _1049 = -_391;
    float _1051 = _1049 + _411;
    float _1053 = fma(_1021, _1041, _389);
    float _1055 = in.m_83.x;
    float _1057 = in.m_83.y;
    float _1059 = in.m_83.z;
    float _1061 = fma(_1021, _1045, _387);
    float _1063 = fma(_1021, _1051, _391);
    float _1065 = fma(_999, _943, _1047);
    bool _1067 = _1053 != 0.0;
    bool _1069 = isnan(_1053);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1037);
    bool _1079 = _1061 == 0.0;
    bool _1081 = !_1075;
    bool _1083 = _1079 && _1081;
    float _1085 = _965 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1033);
    float _1089 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1053);
    bool _1091 = _1063 == 0.0;
    bool _1093 = _1091 && _1083;
    float _1095 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1061);
    float _1097 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1099 = _1089 * _1085;
    float _1101 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1063);
    float _1103 = _1095 * _967;
    float _1105 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1035);
    float _1107 = _987 * _1099;
    float _1109 = -_1099;
    float _1111 = _979 * _1109;
    float _1113 = _989 * _1099;
    float _1115 = _1101 * _1097;
    float _1117 = fma(_997, _1103, _1107);
    out.m_85.x = _1077;
    out.m_85.y = _1087;
    out.m_85.z = _1105;
    float _1119 = _1017;
    float _1121 = _1111;
    float _1123 = _1103;
    float _1125 = _1035;
    if (_1093)
    {
        _1119 = _1055;
    }
    float _1127 = _1119;
    float _1129 = fma(_991, _1103, _1111);
    float _1131 = fma(_1013, _1103, _1113);
    float _1133 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1127;
    float _1137 = _1131;
    if (_1093)
    {
        _1121 = _1127;
    }
    float _1139 = _1121;
    float _1141 = _1139;
    if (!_1093)
    {
        _1135 = _1055;
    }
    float _1143 = _1135;
    float _1145 = fma(_999, _1115, _1131);
    if (_1093)
    {
        _1137 = _1057;
    }
    float _1147 = _1137;
    float _1149 = 0.0;
    float _1151 = _1147;
    if (_1093)
    {
        _1149 = _1059;
    }
    float _1153 = _1149;
    float _1155 = fma(_1003, _1115, _1117);
    float _1157 = fma(_993, _1115, _1129);
    float _1159 = _1153;
    if (!_1093)
    {
        float _1161 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1143);
        _1141 = _1161;
    }
    float _1163 = _1141;
    if (_1093)
    {
        _1123 = _1153;
    }
    float _1165 = _1123;
    float _1167 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1171 = _1165;
    if (!_1093)
    {
        _1159 = _1059;
    }
    float _1173 = _1159;
    float _1175 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1177 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1179 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1169);
    float _1181 = _941 * _1173;
    float _1183 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1177);
    float _1185 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = _1177;
    if (_1093)
    {
        _1187 = _1147;
    }
    float _1189 = _1187;
    float _1191 = _943 * _1143;
    float _1193 = _551 + _1183;
    float _1195 = _1133 + _1185;
    float _1197 = _1189;
    float _1199 = _1193;
    float _1201 = _1195;
    if (!_1093)
    {
        _1151 = _1057;
    }
    float _1203 = _1151;
    if (!_1093)
    {
        float _1205 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1173);
        _1171 = _1205;
    }
    float _1207 = _1171;
    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1211 = _1193 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1215 = _1195 + _1213;
    float _1217 = fma(_1157, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1175);
    if (!_1093)
    {
        float _1219 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1203);
        _1197 = _1219;
    }
    float _1221 = _1197;
    float _1223 = _1211 * _1211;
    float _1225 = _1215 * _1215;
    float _1227 = _939 * _1203;
    float _1229 = -_1181;
    float _1231 = fma(_943, _1203, _1229);
    float _1233 = -_1191;
    float _1235 = fma(_939, _1173, _1233);
    float _1237 = _1223 + _1225;
    float _1239 = -_1227;
    float _1241 = fma(_941, _1143, _1239);
    float _1243 = _1231 * _945;
    float _1245 = _1235 * _945;
    float _1247 = sqrt(_1237);
    float _1249 = _1241 * _945;
    float _1251 = _987 * _1221;
    float _1253 = _989 * _1221;
    float _1255 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1217);
    float _1257 = _491 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1259 = -_1221;
    float _1261 = _979 * _1259;
    float _1263 = -_1245;
    float _1265 = _979 * _1263;
    float _1267 = _987 * _1245;
    float _1269 = _989 * _1245;
    float _1271 = _1257 + _1255;
    float _1273 = fma(_991, _1163, _1261);
    float _1275 = fma(_997, _1163, _1251);
    float _1277 = fma(_1013, _1163, _1253);
    float _1279 = fma(_991, _1243, _1265);
    float _1281 = fma(_997, _1243, _1267);
    bool _1283 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1285 = fma(_1013, _1243, _1269);
    float _1287 = fma(_993, _1207, _1273);
    float _1289 = fma(_1003, _1207, _1275);
    float _1291 = fma(_999, _1207, _1277);
    float _1293 = fma(_993, _1249, _1279);
    float _1295 = fma(_1003, _1249, _1281);
    float _1297 = fma(_999, _1249, _1285);
    float _1299 = _1265;
    float _1301 = _1223;
    float _1303 = _1225;
    int _1305 = as_type<int>(_1257);
    if (!_1283)
    {
        _1299 = _1271;
    }
    float _1307 = _1299;
    bool _1309 = !_1283;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1247 + _1315;
        float _1319 = rsqrt(_1237);
        float _1321 = _1317 * _1313;
        float _1323 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = _1321 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = cos(_1331);
        float _1335 = fma(_1329, _1323, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1337 = _1319 * _1335;
        float _1339 = fma(_1211, _1337, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1341 = _1333 + (-1.0);
        float _1343 = fma(_1215, _1337, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1347 = _1339 + _1345;
        float _1349 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1353 = _1343 + _1351;
        float _1355 = _1347 * _1347;
        float _1357 = fma(_1271, _1333, _1349);
        float _1359 = _1353 * _1353;
        _1311 = _1357;
        _1301 = _1355;
        _1303 = _1359;
        _1199 = _1339;
        _1201 = _1343;
    }
    float _1361 = _1311;
    float _1363 = _1301;
    float _1365 = _1303;
    float _1367 = _1199;
    float _1369 = _1201;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1373 = _1361 + _1371;
    float _1375 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1377 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1379 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1381 = fma(_1373, _1373, _1363);
    float _1383 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1385 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1387 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1389 = _1381 + _1365;
    float _1391 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1375);
    float _1393 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1377);
    float _1395 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1383);
    float _1397 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1379);
    float _1399 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1385);
    float _1401 = sqrt(_1389);
    float _1403 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1387);
    float _1405 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1391);
    float _1407 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1395);
    float _1409 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1397);
    float _1411 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1393);
    float _1413 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1399);
    float _1415 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    out.m_87.x = _1405;
    out.m_87.y = _1411;
    out.m_87.z = _1413;
    out.m_89.x = _1407;
    out.m_89.y = _1409;
    out.m_89.z = _1415;
    bool _1417 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1419 = isnan(_1401);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1425 = _1421 || _1423;
    float _1427 = _1403;
    float _1429 = _1361;
    if (!_1425)
    {
        _1427 = 1.0;
    }
    float _1431 = _1427;
    bool _1433 = !_1425;
    float _1435 = _1431;
    if (!_1433)
    {
        bool _1437 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1439 = isnan(_1401);
        bool _1441 = _1437 || _1439;
        bool _1443 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1445 = _1441 || _1443;
        if (!_1445)
        {
            float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1449 = _1401 + _1447;
            float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1453 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1451;
            float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1459 = 1.0 / _1453;
            float _1461 = _1449 * _1459;
            float _1463 = fma(_1461, _1457, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1435 = _1463;
            _1465 = true;
        }
        else
        {
            bool _1467 = _1401 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1469 = isnan(_1401);
            bool _1471 = _1467 || _1469;
            bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1475 = _1471 || _1473;
            if (!_1475)
            {
                float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1479 = _1401 + _1477;
                float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1483 = _1481 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1489 = 1.0 / _1483;
                float _1491 = _1479 * _1489;
                float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1435 = _1493;
                _1465 = true;
            }
            else
            {
                _1435 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1465 = false;
    float _1495 = _1435;
    float _1497 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1499 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1501 = floor(_1497);
    float _1503 = floor(_1499);
    float _1505 = -_1501;
    float _1507 = _1497 + _1505;
    float _1509 = -_1503;
    float _1511 = _1499 + _1509;
    float2 _5135 = float2(_1507, _1511);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5135, float2(0.0), isnan(_5135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5135, float2(0.0), isnan(_5135)), level(0.0)).x;
    float _1515 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1519 = _1367 + _1517;
    float _1521 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1525 = _1369 + _1523;
    float _1527 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1521);
    float _1529 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1531 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _1533 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(0.5);
    bool _1541 = _1537 || _1539;
    float _1543 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1545 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1529);
    float _1547 = _1257 + _1531;
    float _1549 = fma(_1519, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1551 = 1.0 / _1543;
    float _1553 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1545);
    float _1555 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1557 = fma(_1525, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1559 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1561 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1555);
    float _1563 = _1559 + _1543;
    float _1565 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1561);
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1569 = _1563 * _1551;
    float _1571 = _1569 * 0.5;
    float _1573 = trunc(_1567);
    int _1575 = int(_1573);
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1579 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
    float _1581 = 1.0 / _1579;
    int _1583 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1585 = _1575 + _1583;
    int _1587 = _1585 + 1;
    float _1589 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1591 = fma(_551, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1589);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1595 = _1581 * _1593;
    float _1597 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1591);
    bool _1599 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1601 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1603 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1605 = !_1599;
    int _1607 = _1605 ? 0 : 1;
    float _1609 = trunc(_1601);
    int _1611 = int(_1609);
    int _1613 = 2;
    float _1615 = _1495;
    uint _1618 = as_type<uint>(_1525);
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1622 = _1567;
    if (!_1599)
    {
        _1613 = 1;
    }
    int _1624 = _1613;
    int _1626 = _1624;
    if (!_1603)
    {
        _1626 = _1607;
    }
    int _1628 = _1626;
    bool _1630 = _1587 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1632 = _1628 << 6;
    int _1634 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1636 = _1611 + _1634;
    int _1638 = _1636 + 1;
    int _1640 = _1632 + 48;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    uint _1644 = uint(int(uint(int(_1642)) >> uint(2)));
    int _1646 = int(_1642) & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    int _1650 = int(_1642) + 1;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    int _1654 = _1650 & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    int _1658 = _1587 | _1638;
    bool _1660 = _1658 < 0;
    bool _1662 = _1660 || _1630;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1666 = _1361 + _1664;
    int _1668 = _1632 + 56;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
    float _1686 = _1666;
    if (_1541)
    {
        _1429 = _1549;
    }
    float _1688 = _1429;
    float _1690 = fma(_1666, _1495, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1692 = _1638 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1694 = _1692 || _1662;
    float _1696 = _1688;
    if (_1541)
    {
        _1615 = _1557;
    }
    float _1698 = _1615;
    int _1700 = _1632 + 64;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    float _1718 = _1698;
    if (_1541)
    {
        _1686 = _1690;
    }
    float _1720 = _1686;
    int _1722 = _1632 + 72;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    int _1740 = _1632 + 96;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    int _1758 = _1632 + 104;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _1720;
    if (!_1541)
    {
        float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1780 = _1257 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1784 = _551 + _1782;
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1788 = _1780 * _1780;
        float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1792 = _1133 + _1790;
        float _1794 = fma(_1784, _1784, _1788);
        float _1796 = fma(_1792, _1792, _1794);
        float _1798 = -_1257;
        float _1800 = _1798 + _1690;
        float _1802 = sqrt(_1796);
        float _1804 = precise::min(_1802, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1806 = _1804 * _1786;
        float _1808 = -_551;
        float _1810 = _1808 + _1549;
        float _1812 = -_1133;
        float _1814 = _1812 + _1557;
        float _1816 = fma(_1800, _1806, _1257);
        float _1818 = fma(_1810, _1806, _551);
        float _1820 = fma(_1814, _1806, _1133);
        _1776 = _1816;
        _1696 = _1818;
        _1618 = as_type<uint>(_1810);
        _1718 = _1820;
    }
    float _1822 = _1776;
    float _1824 = _1696;
    uint _1826 = _1618;
    float _1828 = _1718;
    float _1830 = _1547 * _1756;
    uint _1832 = _1826;
    if (!_1694)
    {
        int _1834 = _1638 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1836 = _1834 + _1587;
        _1832 = uint(_1836);
    }
    uint _1838 = _1832;
    float _1840 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1842 = _1547 * _1716;
    float _1844 = fma(_551, _1748, _1830);
    float _1846 = _1547 * _1656;
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1840);
    if (!_1694)
    {
        uint _1850 = uint(int(uint(int(_1838)) >> uint(2)));
        _1305 = int(_1850);
    }
    int _1852 = _1305;
    float _1854 = fma(_1133, _1766, _1844);
    float _1856 = fma(_551, _1648, _1846);
    float _1858 = fma(_551, _1708, _1842);
    float _1860 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1848);
    float _1862 = _1854 + _1774;
    int _1864 = as_type<int>(_1854);
    if (!_1694)
    {
        int _1866 = int(_1838) << 2;
        _1864 = _1866;
    }
    int _1868 = _1864;
    int _1870 = _1632 + 80;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    float _1888 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1890 = 1.0 / _1862;
    int _1892 = _1868;
    if (!_1694)
    {
        int _1894 = 12 & _1868;
        _1892 = _1894;
    }
    int _1896 = _1892;
    float _1898 = fma(_1133, _1676, _1856);
    float _1900 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_1694)
    {
        int _1904 = _1852 << 4;
        int _1906 = _1904 + _1896;
        _1620 = as_type<float>(_1906);
    }
    float _1908 = _1620;
    int _1910 = _1632 + 88;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
    int _1916 = int(_1912) & 3;
    float _1918 = (*spvDescriptorSet0.vp_c15)._m0[int(_1914)][_1916];
    int _1920 = int(_1912) + 1;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    int _1924 = _1920 & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    float _1928 = _1898 + _1684;
    float _1930 = -_1902;
    float _1932 = fma(_1930, _1900, 1.0);
    float _1934 = fma(_1133, _1730, _1858);
    float _1936 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1938 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1940 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1942 = _1934 + _1738;
    float _1944 = _1908;
    if (!_1694)
    {
        int _1946 = as_type<int>(_1908) + 400;
        uint _1948 = uint(int(uint(_1946) >> uint(2)));
        uint _1950 = uint(int(uint(int(_1948)) >> uint(2)));
        int _1952 = int(_1948) & 3;
        float _1954 = (*spvDescriptorSet0.vp_c15)._m0[int(_1950)][_1952];
        _1944 = _1954;
    }
    float _1956 = _1944;
    float _1958 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1936);
    float _1960 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1938);
    float _1962 = _1928 * _1890;
    float _1964 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1940);
    float _1966 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1960);
    float _1970 = _1690;
    float _1972 = _1890;
    if (!_1694)
    {
        float _1974 = floor(_1567);
        _1970 = _1974;
    }
    float _1976 = _1970;
    bool _1978 = _1962 >= 0.0;
    float _1980 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = _1942 * _1890;
    bool _1986 = _1962 <= 1.0;
    bool _1988 = _1986 && _1978;
    float _1990 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1964);
    float _1992 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1994 = _1942;
    if (!_1694)
    {
        float _1996 = floor(_1601);
        _1994 = _1996;
    }
    float _1998 = _1994;
    bool _2000 = _1984 >= 0.0;
    bool _2002 = _2000 && _1988;
    float _2004 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2006 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1992);
    float _2008 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2010 = _1984 <= 1.0;
    bool _2012 = _2010 && _2002;
    float _2014 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2006);
    float _2016 = log2(_1932);
    float _2018 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2020 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2008);
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    if (!_1694)
    {
        float _2024 = -_1976;
        float _2026 = _1567 + _2024;
        _1125 = _2026;
    }
    float _2028 = _1125;
    float _2030 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2018);
    float _2032 = 1.0 / _2022;
    float _2034 = _1547 * _1886;
    float _2036 = _1886;
    if (_2012)
    {
        float _2038 = float(_1628);
        _2036 = _2038;
    }
    float _2040 = _2036;
    float _2042 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2044 = fma(_551, _1878, _2034);
    float _2046 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2030);
    float _2048 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2042);
    float _2050 = _2034;
    float _2052 = _2044;
    if (_2012)
    {
        float _2054 = rint(_2040);
        float _2056 = precise::max(_2054, 0.0);
        uint _2058 = uint(_2056);
        uint _2060 = clamp(_2058, 0u, 65535u);
        _2050 = as_type<float>(_2060);
    }
    float _2062 = _2050;
    float _2064 = fma(_1133, _1918, _2044);
    if (!_1694)
    {
        float _2066 = -_1998;
        float _2068 = _1601 + _2066;
        _2052 = _2068;
    }
    float _2070 = _2052;
    float _2072 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2046);
    float _2074 = _2016 * 0.693147182464599609375;
    float _2076 = _2064 + _1926;
    float _2078 = _2072 * _2032;
    float _2080 = _1976;
    if (!_1694)
    {
        float _2082 = rint(_1956);
        float _2084 = precise::max(_2082, 0.0);
        uint _2086 = uint(_2084);
        uint _2088 = clamp(_2086, 0u, 65535u);
        _2080 = as_type<float>(_2088);
    }
    float _2090 = _2080;
    float _2092 = _2048 * _2032;
    float _2094 = _2076 * _1890;
    float _2096 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2098 = fma(_2078, 0.5, 0.5);
    float _2100 = fma(_2092, -0.5, 0.5);
    float _2102 = _2062;
    if (_2012)
    {
        float3 _6151 = float3(_1962, _1984, float(as_type<int>(_2062)));
        float3 _6155 = select(_6151, float3(0.0), isnan(_6151));
        float _2104 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6155.xy, uint(rint(_6155.z)), _2094, level(0.0));
        _2102 = _2104;
    }
    float _2106 = _2102;
    float3 _6165 = float3(_2098, _2100, _2096);
    float _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6165, float3(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6165, float3(0.0), isnan(_6165)), level(0.0)).x;
    float3 _6174 = float3(_2098, _2100, _2096);
    float4 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = _2111.w;
    float _2121 = _2028;
    if (!_1694)
    {
        float3 _6197 = float3(_2028, _2070, float(as_type<int>(_2090)));
        float3 _6199 = select(_6197, float3(0.0), isnan(_6197));
        float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6199.xy, uint(rint(_6199.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6199.xy, uint(rint(_6199.z)), level(0.0)).x;
        _2121 = _2123;
    }
    float _2125 = _2121;
    if (_1694)
    {
        _1972 = 1.0;
    }
    float _2127 = _1972;
    float _2129 = _2127;
    if (!_1694)
    {
        int _2131 = int(_1838) << 4;
        int _2133 = _2131 + 2048;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        uint _2137 = uint(int(uint(int(_2135)) >> uint(2)));
        int _2139 = int(_2135) & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = int(_2135) + 1;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        int _2147 = _2143 & 3;
        float _2149 = (*spvDescriptorSet0.vp_c15)._m0[int(_2145)][_2147];
        int _2151 = _2133 + 8;
        uint _2153 = uint(int(uint(_2151) >> uint(2)));
        uint _2155 = uint(int(uint(int(_2153)) >> uint(2)));
        int _2157 = int(_2153) & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        int _2161 = int(_2153) + 1;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        int _2165 = _2161 & 3;
        float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
        float _2169 = _1547 * _2149;
        float _2171 = fma(_551, _2141, _2169);
        float _2173 = fma(_1133, _2159, _2171);
        float _2175 = _2173 + _2167;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = -_2177;
        float _2181 = _2179 + _2125;
        float _2183 = fma(_2181, 500.0, 1.5);
        float _2185 = exp2(_2183);
        float _2187 = 0.0 + _2185;
        float _2189 = precise::clamp(_2187, 0.0, 1.0);
        _2129 = _2189;
    }
    float _2191 = _2129;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2195 = _1822 + _2193;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2199 = _1824 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2203 = _1828 + _2201;
    float _2205 = _2195 * _2195;
    float _2207 = fma(_2199, _2199, _2205);
    float _2209 = fma(_2203, _2203, _2207);
    float _2211 = rsqrt(_2209);
    float _2213 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2215 = _2199 * _2213;
    float _2217 = _2203 * _2213;
    float _2219 = _2215 * _2215;
    float _2221 = _2217 * _2217;
    float _2223 = _2219 + _2221;
    float _2225 = sqrt(_2223);
    bool _2227 = _2225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2231 = _2225 + _2229;
    float _2233 = _2211;
    float _2235 = _2231;
    float _2237 = _2195;
    float _2239 = _2213;
    if (_2227)
    {
        float _2241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2233 = _2241;
    }
    float _2243 = _2233;
    float _2245 = _2243;
    if (_2227)
    {
        float _2247 = _2231 * _2243;
        _2235 = _2247;
    }
    float _2249 = _2235;
    if (_2227)
    {
        float _2251 = rsqrt(_2223);
        _2245 = _2251;
    }
    float _2253 = _2245;
    float _2255 = _2253;
    if (_2227)
    {
        float _2257 = _2249 * 0.15915493667125701904296875;
        _1622 = _2257;
    }
    float _2259 = _1622;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2263 = _2203;
    float _2265 = _2259;
    if (_2227)
    {
        float _2267 = _2259 * 6.283185482025146484375;
        float _2269 = sin(_2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = precise::max(0.0, _2261);
    float _2275 = _1962;
    float _2277 = _2273;
    if (_2227)
    {
        float _2279 = _2259 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        _2275 = _2281;
    }
    float _2283 = _2275;
    float _2285 = -_2213;
    float _2287 = -_2273;
    float _2289 = fma(_2195, _2285, _2287);
    if (_2227)
    {
        float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2291;
    }
    float _2293 = _2237;
    float _2295 = _2271;
    float _2297 = _2293;
    if (_2227)
    {
        float _2299 = fma(_2271, _2293, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2295 = _2299;
    }
    float _2301 = _2295;
    float _2303 = _2301;
    if (!_2227)
    {
        _2297 = _2289;
    }
    float _2305 = _2297;
    float _2307 = _2305;
    if (!_2227)
    {
        _2265 = _2219;
    }
    float _2309 = _2265;
    float _2311 = 0.0;
    float _2313 = _2309;
    if (_2227)
    {
        float _2315 = _2253 * _2301;
        _2311 = _2315;
    }
    float _2317 = _2311;
    if (!_2227)
    {
        _2255 = _2215;
    }
    float _2319 = _2255;
    float _2321 = _2319;
    float _2323 = _2283;
    if (_2227)
    {
        float _2325 = _2283 + (-1.0);
        _2277 = _2325;
    }
    float _2327 = _2277;
    if (_2227)
    {
        float _2329 = _2215 * _2317;
        _2321 = _2329;
    }
    float _2331 = _2321;
    if (!_2227)
    {
        _2303 = _2217;
    }
    float _2333 = _2303;
    float _2335 = _2333;
    if (_2227)
    {
        float _2337 = _2217 * _2317;
        _2335 = _2337;
    }
    float _2339 = _2335;
    if (_2227)
    {
        float _2341 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2341;
    }
    float _2343 = _2239;
    if (_2227)
    {
        float _2345 = _2331 * _2331;
        _2313 = _2345;
    }
    float _2347 = _2313;
    float _2349 = sqrt(_2209);
    if (_2227)
    {
        float _2351 = fma(_2289, _2283, _2343);
        _2307 = _2351;
    }
    float _2353 = _2307;
    if (!_2227)
    {
        _2323 = _2221;
    }
    float _2355 = _2323;
    float _2357 = _2355;
    if (_2227)
    {
        float _2359 = _2339 * _2339;
        _2357 = _2359;
    }
    float _2361 = _2357;
    float _2363 = fma(_2353, _2353, _2347);
    float _2365 = _2363 + _2361;
    float _2367 = rsqrt(_2365);
    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2371 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2369);
    float _2373 = precise::clamp(_2371, 0.0, 1.0);
    float _2375 = -_2373;
    float _2377 = _2375 + 1.0;
    float _2379 = _2367 * _2353;
    float _2381 = _2367 * _2331;
    float _2383 = abs(_2377);
    float _2385 = log2(_2383);
    float _2387 = _2367 * _2339;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2391 = -_2389;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2391);
    float _2395 = -_2387;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2393);
    float _2399 = fma(_2397, -0.5, 0.5);
    float _2401 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2403 = fma(_2397, 0.5, 0.5);
    float _2405 = _2379 + 1.0;
    float _2407 = sqrt(_2399);
    float _2409 = fma(_2403, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2411 = fma(_2403, _2409, -0.212114393711090087890625);
    float _2413 = exp2(_2401);
    float _2415 = fma(_2403, _2411, 1.570728778839111328125);
    float _2417 = _2407 * 0.636619746685028076171875;
    float _2419 = -_2415;
    float _2421 = fma(_2417, _2419, 1.0);
    float _2423 = -_2379;
    float _2425 = fma(_2413, _2405, _2423);
    float _2427 = fma(_2425, 0.5, 0.5);
    float2 _6672 = float2(_2421, _2427);
    float3 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6672, float2(0.0), isnan(_6672)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6672, float2(0.0), isnan(_6672)), level(0.0)).xyz;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = abs(_1595);
    float _2439 = log2(_2437);
    float _2441 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2443 = -_1513;
    float _2445 = _2443 + 1.0;
    float _2447 = exp2(_2441);
    bool _2449 = _1595 <= 8000.0;
    bool _2451 = isnan(_1595);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(8000.0);
    bool _2457 = _2453 || _2455;
    float _2459 = float(_2457);
    float _2461 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2463 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2465 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2463);
    float _2467 = exp2(_2461);
    float _2469 = -_2447;
    float _2471 = _2469 + 1.0;
    float _2473 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2465);
    float _2475 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2473);
    float _2477 = _2475 + _2022;
    float _2479 = _2477 * 0.5;
    float _2481 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2483 = precise::clamp(_2481, 0.0, 1.0);
    float _2485 = fma(_2483, -2.0, 3.0);
    float _2487 = _2483 * _2483;
    out.m_91.z = _2479;
    out.m_91.w = _2022;
    float _2489 = _2487 * _2485;
    float _2491 = -_2489;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2489);
    float _2497 = _2459 * _2495;
    float _2499 = _2459;
    float _2501 = _2072;
    if (!_2012)
    {
        _2499 = 1.0;
    }
    float _2503 = _2499;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2048;
    out.gl_Position.z = _2475;
    out.gl_Position.w = _2022;
    float _2505 = _2503;
    if (_2012)
    {
        bool _2507 = _2106 >= _2094;
        bool _2509 = isnan(_2106);
        bool _2511 = _2507 || _2509;
        bool _2513 = isnan(_2094);
        bool _2515 = _2511 || _2513;
        float _2517 = float(_2515);
        _2505 = _2517;
    }
    float _2519 = _2505;
    float _2521 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2523 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2525 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2527 = isnan(_2349);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2533 = _2529 || _2531;
    float _2535 = _2445 * _2521;
    float _2537 = precise::clamp(_2535, 0.0, 1.0);
    float _2539 = _2519 * _2191;
    float _2541 = _2523 * _2108;
    float _2543 = -_2537;
    float _2545 = fma(_2543, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2547 = _2119 * _2541;
    float _2549 = -_2539;
    float _2551 = fma(_2549, _2545, 1.0);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = -_2523;
    float _2557 = _2555 + 1.0;
    float _2559 = _2523;
    float _2561 = _2521;
    float _2563 = _2557;
    float _2565 = _2553;
    if (!_2533)
    {
        _2559 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2567 = _2559;
    float _2569 = _2553 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2571 = _2119 * _2557;
    float _2573 = _2567;
    float _2575 = _2567;
    if (!_2533)
    {
        _2501 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2577 = _2501;
    float _2579 = _2577;
    float _2581 = _2577;
    if (!_2533)
    {
        _2561 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2583 = _2561;
    out.m_93.x = _2569;
    float _2585 = _2583;
    float _2587 = _2583;
    if (!_2533)
    {
        _2563 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2589 = _2563;
    float _2591 = _2589;
    float _2593 = _2589;
    if (!_2533)
    {
        _2565 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2595 = _2565;
    float _2597 = _2435 * _2541;
    float _2599 = fma(_2431, _2547, _2113);
    float _2601 = fma(_2433, _2547, _2115);
    float _2603 = fma(_2119, _2597, _2117);
    float _2605 = _2597;
    float _2607 = _2595;
    float _2609 = _2595;
    if (!_2533)
    {
        _2605 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2611 = _2605;
    out.m_95.x = _2599;
    out.m_95.y = _2601;
    out.m_95.z = _2603;
    out.m_95.w = _2571;
    bool _2613 = !_2533;
    float _2615 = _2611;
    float _2617 = _2611;
    if (!_2613)
    {
        bool _2619 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2621 = isnan(_2349);
        bool _2623 = _2619 || _2621;
        bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2627 = _2623 || _2625;
        if (!_2627)
        {
            float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2631 = _2349 + _2629;
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2633;
            float _2637 = 1.0 / _2635;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2655 = _2631 * _2637;
            float _2657 = precise::clamp(_2655, 0.0, 1.0);
            float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2667 = fma(_2657, _2641, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2669 = fma(_2657, _2661, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2671 = fma(_2657, _2665, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2673 = fma(_2657, _2645, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2675 = fma(_2657, _2649, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2677 = fma(_2657, _2653, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2575 = _2671;
            _2593 = _2675;
            _2617 = _2669;
            _2587 = _2673;
            _2581 = _2667;
            _2609 = _2677;
            _2679 = true;
        }
        else
        {
            bool _2681 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2683 = isnan(_2349);
            bool _2685 = _2681 || _2683;
            bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2689 = _2685 || _2687;
            if (!_2689)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2691 = _2615;
            _2617 = _2691;
            if (!_2689)
            {
                _2573 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2693 = _2573;
            _2575 = _2693;
            if (!_2689)
            {
                _2579 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2695 = _2579;
            _2581 = _2695;
            if (!_2689)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2697 = _2585;
            _2587 = _2697;
            if (!_2689)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2699 = _2591;
            _2593 = _2699;
            if (!_2689)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2701 = _2607;
            bool _2703 = !_2689;
            _2609 = _2701;
            if (!_2703)
            {
                bool _2705 = _2349 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2707 = isnan(_2349);
                bool _2709 = _2705 || _2707;
                bool _2711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2713 = _2709 || _2711;
                if (!_2713)
                {
                    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2717 = _2349 + _2715;
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2719;
                    float _2723 = 1.0 / _2721;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2741 = _2717 * _2723;
                    float _2743 = precise::clamp(_2741, 0.0, 1.0);
                    float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2751 = _2749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2753 = fma(_2743, _2727, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2755 = fma(_2743, _2747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2757 = fma(_2743, _2751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2759 = fma(_2743, _2731, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2761 = fma(_2743, _2735, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2763 = fma(_2743, _2739, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2575 = _2757;
                    _2593 = _2761;
                    _2617 = _2755;
                    _2587 = _2759;
                    _2581 = _2753;
                    _2609 = _2763;
                    _2679 = true;
                }
                else
                {
                    _2575 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2581 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2679 = false;
    float _2765 = _2575;
    float _2767 = _2593;
    float _2769 = _2617;
    float _2771 = _2587;
    float _2773 = _2581;
    float _2775 = _2609;
    float _2777 = fma(_1409, -0.5, 0.5);
    float _2779 = precise::clamp(_2777, 0.0, 1.0);
    float _2781 = -_2765;
    float _2783 = _2781 + _2767;
    float _2785 = -_2769;
    float _2787 = _2785 + _2771;
    float _2789 = -_2773;
    float _2791 = _2789 + _2775;
    bool _2793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2795 = fma(_2779, _2783, _2765);
    float _2797 = fma(_2779, _2787, _2769);
    float _2799 = fma(_2779, _2791, _2773);
    float _2801 = _2795 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2803 = fma(_2797, 0.298911988735198974609375, _2801);
    float _2805 = fma(_2799, 0.114477999508380889892578125, _2803);
    out.m_97.x = 0.0;
    float _2807 = -_2805;
    float _2809 = _2797 + _2807;
    float _2811 = -_2805;
    float _2813 = _2795 + _2811;
    float _2815 = -_2805;
    float _2817 = _2799 + _2815;
    float _2819 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2821 = fma(_2809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    float _2823 = fma(_2813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    float _2825 = fma(_2817, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2805);
    out.m_93.w = _2819;
    out.m_99.x = _2821;
    out.m_99.y = _2823;
    out.m_99.z = _2825;
    if (!_2793)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2827 = -_1822;
    float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2831 = -_1824;
    float _2833 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2835 = -_1828;
    float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2839 = _2829 * _2829;
    float _2841 = fma(_2833, _2833, _2839);
    float _2843 = fma(_2837, _2837, _2841);
    float _2845 = sqrt(_2843);
    float _2847 = rsqrt(_2843);
    float _2849 = -_2845;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2853 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = _2833 * _2847;
    float _2859 = _2829 * _2847;
    float _2861 = abs(_2855);
    float _2863 = log2(_2861);
    float _2865 = _2837 * _2847;
    float _2867 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2869 = _1409 * _2859;
    float _2871 = -_2859;
    float _2873 = -_2867;
    float _2875 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2873);
    float _2877 = fma(_1407, _2857, _2869);
    float _2879 = -_2865;
    float _2881 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2875);
    float _2883 = fma(_1415, _2865, _2877);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2889 = _2881 + _2887;
    float _2891 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = exp2(_2891);
    float _2899 = _2897 * _2895;
    float _2901 = _2885 * _2899;
    float _2903 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2905 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2903;
    out.m_97.y = _2905;
    out.m_97.z = _2907;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

