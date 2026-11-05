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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_56.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_59.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_123);
        out.gl_Position.z = _2680;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_61.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_105);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _113;
    if (_153)
    {
        out.m_59.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2749 = as_type<float>(_159);
        out.gl_Position.z = _2749;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_63.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = in.m_63.z;
    float _185 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _187 = _185 * _163;
    float _189 = 0.0;
    float _191 = _165;
    if (!_177)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = 0.0;
    float _201 = _197;
    if (!_177)
    {
        float _203 = _141 * _141;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_177)
    {
        float _211 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _211;
    }
    float _213 = _201;
    bool _215 = !_177;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _165 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _165);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_177;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _165 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _191 = _271;
    }
    float _273 = _191;
    float _275 = 0.0;
    if (!_177)
    {
        _275 = _141;
    }
    float _277 = _275;
    float _279 = _277;
    if (!_177)
    {
        float _281 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _281;
    }
    float _283 = _209;
    bool _285 = !_177;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _141 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _141);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    bool _321 = !_177;
    if (!_321)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _141 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _279 = _341;
    }
    float _343 = _279;
    float _345 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _187);
    float _347 = in.m_63.y;
    int _349 = as_type<int>(_167) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>(_167) & 2;
    bool _355 = _353 != 0;
    float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _359 = _345 * 6.283185482025146484375;
    float _361 = in.m_63.w;
    float _363 = _359 * 0.15915493667125701904296875;
    float _365 = in.m_68.y;
    float _367 = floor(_345);
    bool _369 = !_355;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _381 = _379 != 0;
    float _383 = in.m_68.x;
    bool _385 = !_351;
    float _387 = _385 ? (-0.5) : 0.5;
    float _389 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _371);
    float _391 = _363 * 6.283185482025146484375;
    float _393 = cos(_391);
    bool _395 = _183 > 0.5;
    float _397 = in.m_68.w;
    float _399 = _357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _401 = !_381;
    int _403 = _401 ? 0 : 1;
    float _405 = _347 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _407 = _161 > 0.5;
    float _409 = -_367;
    float _411 = _345 + _409;
    bool _413 = !_181;
    int _415 = _413 ? 0 : 1;
    bool _417 = !_377;
    int _419 = _417 ? 0 : 1;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _427 = _425 != 0;
    float _429 = fma(_393, 0.5, 0.5);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _437 = _435 != 0;
    float _439 = -_411;
    float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _443 = -_387;
    int _445 = _407 ? as_type<int>(_443) : as_type<int>(_387);
    bool _447 = _411 < 0.5;
    float _449 = float(_447);
    int _451 = abs(_419);
    bool _453 = _347 > 0.5;
    float _455 = -_449;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = float(_451);
    float _461 = -_429;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _465 = -_371;
    int _467 = _453 ? as_type<int>(_465) : as_type<int>(_371);
    bool _469 = _361 > 0.5;
    float _471 = abs(_441);
    float _473 = _459 * _471;
    float _475 = in.m_61.x;
    float _477 = in.m_61.y;
    float _479 = in.m_61.z;
    int _481 = abs(_415);
    int _483 = abs(_403);
    float _485 = in.m_56.x;
    float _487 = in.m_56.y;
    float _489 = in.m_56.z;
    float _491 = float(_481);
    float _493 = _161 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _495 = fma(_491, _463, _473);
    float _497 = float(_483);
    float _499 = _365 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _505 = abs(_457);
    float _507 = fma(_497, _505, _495);
    float _509 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _511 = fma(_405, -2.0, _503);
    float _513 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _515 = _507 * _499;
    float _517 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _519 = _507 * _501;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _523 = fma(_273, _477, _513);
    float _525 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _527 = fma(_273, _475, _509);
    float _529 = fma(_273, _479, _517);
    float _531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _533 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _535 = fma(_523, _397, _487);
    float _537 = _525 * _389;
    float _539 = fma(_527, _397, _485);
    float _541 = _533 * _531;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _545 = _537 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _547 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[78].z, _521);
    float _549 = fma(_529, _397, _489);
    float _551 = _535 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _553 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
    float _555 = _537 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].x, _545);
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
    float _563 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].x, _555);
    float _565 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _557);
    float _567 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
    float _569 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _571 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _563);
    float _573 = _565 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _577 = _571 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _579 = _569 + _573;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _585 = _575 + _577;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _579 + _587;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _593 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _595 = _585 + _593;
    float _597 = _589 * _589;
    float _599 = _537 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _601 = fma(_595, _595, _597);
    float _603 = _535 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _605 = -_591;
    float _607 = fma(_493, 2.0, _605);
    float _609 = sqrt(_601);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _599);
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _621 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[5].x, _603);
    float _623 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = -_387;
    int _633 = _395 ? as_type<int>(_631) : as_type<int>(_387);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _641 = _609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _643 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[78].w, _619);
    float _645 = -_371;
    int _647 = _469 ? as_type<int>(_645) : as_type<int>(_371);
    float _649 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _653 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _625;
    out.m_70.y = _627;
    out.m_70.z = _629;
    out.m_70.w = _581;
    bool _659 = !_427;
    float _661 = _659 ? _371 : as_type<float>(_467);
    float _663 = _649 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _665 = _623 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_72.x = _653;
    out.m_72.y = _655;
    out.m_72.z = _657;
    out.m_72.w = _583;
    float _669 = -_141;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[76].x, _607);
    float _673 = _663 + _665;
    bool _675 = !_437;
    float _677 = _675 ? _371 : as_type<float>(_647);
    float _679 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _681 = !_423;
    float _683 = _681 ? _387 : as_type<float>(_445);
    bool _685 = !_433;
    float _687 = _685 ? _387 : as_type<float>(_633);
    float _689 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _691 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _693 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _695 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _697 = _683 + 0.5;
    float _699 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
    float _701 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _693);
    float _703 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
    float _705 = fma(_399, _697, _671);
    float _707 = _693;
    float _709 = _691;
    float _711 = _655;
    float _713 = _343;
    float _715 = _599;
    float _717 = _575;
    if (!_641)
    {
        _707 = _585;
    }
    float _719 = _707;
    float _721 = _719;
    if (!_641)
    {
        _709 = _579;
    }
    float _723 = _709;
    float _725 = _723;
    if (!_641)
    {
        _711 = _673;
    }
    float _727 = _711;
    bool _729 = !_641;
    float _731 = _727;
    if (!_729)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _737 = _609 + _735;
        float _739 = _673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = rsqrt(_601);
        float _743 = _737 * _733;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = cos(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = sin(_751);
        float _755 = _749 + (-1.0);
        float _757 = _755 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = fma(_753, _739, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _761 = fma(_673, _749, _757);
        float _763 = _741 * _759;
        float _765 = fma(_595, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _767 = fma(_589, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _731 = _761;
        _721 = _765;
        _725 = _767;
    }
    float _769 = _731;
    float _771 = _721;
    float _773 = _725;
    float _775 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _547);
    float _777 = -_663;
    float _779 = _777 + _769;
    float _781 = -_575;
    float _783 = _781 + _771;
    float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _787 = -_775;
    float _789 = _787 + 1.0;
    float _791 = _779 * _779;
    float _793 = _651 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _795 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _511);
    float _797 = _661 + (-0.5);
    float _799 = -_789;
    float _801 = fma(_683, _799, _705);
    float _803 = -_569;
    float _805 = _803 + _773;
    float _807 = fma(_783, _783, _791);
    float _809 = -_793;
    float _811 = -_795;
    float _813 = fma(_809, _797, _811);
    float _815 = _687 + 0.5;
    float _817 = -_677;
    float _819 = _817 + 0.5;
    float _821 = fma(_805, _805, _807);
    float _823 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _643);
    float _825 = _815 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _829 = sqrt(_821);
    float _831 = -_823;
    float _833 = _831 + 1.0;
    float _835 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _837 = _825 * _667;
    float _839 = _827 * _785;
    float _841 = fma(_661, _833, _813);
    float _843 = fma(_343, _477, _835);
    float _845 = _699 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _847 = _701 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _849 = _703 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _851 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _853 = -_843;
    float _855 = _523 + _853;
    float _857 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    out.m_74.x = _845;
    out.m_74.y = _847;
    out.m_74.z = _849;
    float _859 = fma(_343, _475, _851);
    bool _861 = _829 > 0.0;
    float _863 = _855 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _855 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _867 = fma(_343, _479, _857);
    float _869 = -_859;
    float _871 = _527 + _869;
    float _873 = _855 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_76.x = _801;
    out.m_76.y = _841;
    out.m_76.z = _837;
    out.m_76.w = _839;
    float _875 = -_867;
    float _877 = _529 + _875;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[5].x, _865);
    float _883 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[6].x, _873);
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[6].z, _883);
    float _887 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[4].z, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[5].z, _881);
    float _891 = _839;
    float _893 = _837;
    float _895 = _871;
    float _897 = _883;
    float _899 = _889;
    float _901 = _887;
    float _903 = _885;
    float _905 = _773;
    float _907 = _871;
    if (!_861)
    {
        _891 = _771;
    }
    float _909 = _891;
    float _911 = _909;
    float _913 = _909;
    float _915 = _909;
    if (!_861)
    {
        _893 = _769;
    }
    float _917 = _893;
    bool _919 = !_861;
    float _921 = _917;
    float _923 = _917;
    float _925 = _917;
    if (!_919)
    {
        bool _927 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _929 = _343;
        if (_927)
        {
            float _931 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _929 = _931;
        }
        float _933 = _929;
        float _935 = _933;
        if (_927)
        {
            float _937 = _887 * _933;
            _895 = _937;
        }
        float _939 = _895;
        float _941 = _939;
        if (_927)
        {
            float _943 = _889 * _933;
            _897 = _943;
        }
        float _945 = _897;
        float _947 = _945;
        if (_927)
        {
            float _949 = _885 * _933;
            _935 = _949;
        }
        float _951 = _935;
        float _953 = _951;
        if (!_927)
        {
            float _955 = _141 + 1.0;
            float _957 = _955;
            if (!_177)
            {
                float _959 = _955 * _955;
                float _961 = _959 * 0.5;
                _143 = _961;
            }
            float _963 = _143;
            float _965 = _963;
            if (!_177)
            {
                float _967 = _963 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _965 = _967;
            }
            float _969 = _965;
            bool _971 = !_177;
            float _973 = _969;
            if (!_971)
            {
                float _975 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _977 = log2(_975);
                float _979 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _981 = _979 + 1.0;
                float _983 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _985 = _977 * _955;
                float _987 = 1.0 / _981;
                float _989 = _983 * 0.693147182464599609375;
                float _991 = exp2(_985);
                float _993 = 1.0 / _989;
                float _995 = _991 + (-1.0);
                float _997 = -_995;
                float _999 = fma(_997, _993, _955);
                float _1001 = _999 * _987;
                float _1003 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _973 = _1003;
                _921 = _981;
                _911 = _987;
            }
            float _1005 = _973;
            float _1007 = _921;
            float _1009 = _911;
            float _1011 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1015 = !_177;
            float _1017 = _1007;
            _913 = _1009;
            if (!_1015)
            {
                float _1019 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1021 = log2(_1019);
                float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1025 = _1023 + 1.0;
                float _1027 = 1.0 / _1025;
                float _1029 = _1021 * _955;
                float _1031 = exp2(_1029);
                float _1033 = -_1031;
                float _1035 = _1033 + 1.0;
                float _1037 = _1035 * _1027;
                _957 = _1037;
                _1017 = _1029;
            }
            float _1039 = _957;
            float _1041 = _1017;
            float _1043 = fma(_1039, _477, _1013);
            float _1045 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1047 = fma(_1039, _475, _1011);
            float _1049 = -_843;
            float _1051 = _1049 + _1043;
            float _1053 = fma(_1039, _479, _1045);
            float _1055 = -_859;
            float _1057 = _1055 + _1047;
            float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1061 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1063 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1065 = -_867;
            float _1067 = _1065 + _1053;
            float _1069 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1059);
            float _1071 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1061);
            float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1063);
            float _1075 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1069);
            float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1071);
            float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
            _899 = _1077;
            _901 = _1075;
            _903 = _1079;
            _941 = _1075;
            _947 = _1077;
            _953 = _1079;
            _923 = _1041;
        }
        float _1081 = _899;
        float _1083 = _901;
        float _1085 = _903;
        float _1087 = _941;
        float _1089 = _947;
        float _1091 = _953;
        float _1093 = _923;
        float _1095 = _913;
        float _1097 = _1081 * _1081;
        float _1099 = rsqrt(_821);
        float _1101 = fma(_1083, _1083, _1097);
        float _1103 = fma(_1085, _1085, _1101);
        float _1105 = sqrt(_1103);
        float _1107 = _783 * _1099;
        float _1109 = _779 * _1099;
        float _1111 = _805 * _1099;
        bool _1113 = _1105 > 0.0;
        float _1115 = _1095;
        float _1117 = _1093;
        _713 = _1091;
        _907 = _1087;
        if (!_1113)
        {
            _1115 = _771;
        }
        float _1119 = _1115;
        _915 = _1119;
        if (!_1113)
        {
            _1117 = _769;
        }
        float _1121 = _1117;
        bool _1123 = !_1113;
        _925 = _1121;
        if (!_1123)
        {
            float _1125 = rsqrt(_1103);
            float _1127 = _1125 * _1081;
            float _1129 = _1125 * _1083;
            float _1131 = _1125 * _1085;
            float _1133 = _1109 * _1127;
            float _1135 = fma(_1107, _1129, _1133);
            float _1137 = fma(_1111, _1131, _1135);
            float _1139 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1141 = fma(_1087, _1139, _771);
            float _1143 = fma(_1089, _1139, _769);
            float _1145 = fma(_1091, _1139, _773);
            _925 = _1143;
            _915 = _1141;
            _905 = _1145;
        }
    }
    float _1147 = _925;
    float _1149 = _915;
    float _1151 = _905;
    float _1153 = _713;
    float _1155 = _907;
    float _1157 = _663 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1161 = _1147 + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1165 = _1149 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1169 = _1151 + _1167;
    float _1171 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1157);
    float _1173 = _1161 * _1161;
    float _1175 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1171);
    float _1177 = fma(_1165, _1165, _1173);
    float _1179 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1181 = _663 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1183 = fma(_1169, _1169, _1177);
    float _1185 = 1.0 / _1179;
    float _1187 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1181);
    float _1189 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1191 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1187);
    float _1193 = rsqrt(_1183);
    float _1195 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = _1195 + _1179;
    float _1199 = sqrt(_1183);
    float _1201 = _1197 * _1185;
    float _1203 = _1201 * 0.5;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1207 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1205);
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1211 = floor(_1189);
    float _1213 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1215 = _1165 * _1209;
    float _1217 = _1169 * _1209;
    float _1219 = _663 + _1213;
    float _1221 = _1215 * _1215;
    float _1223 = 1.0 / _1207;
    float _1225 = _1217 * _1217;
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1229 = _1221 + _1225;
    float _1231 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1227);
    float _1233 = -_1211;
    float _1235 = _1189 + _1233;
    float _1237 = sqrt(_1229);
    float _1239 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1231);
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1245 = _1223 * _1243;
    float _1247 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1249 = trunc(_1241);
    int _1251 = int(_1249);
    bool _1253 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1255 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1247);
    bool _1257 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1259 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1255);
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1237 + _1263;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1269 = !_1253;
    int _1271 = _1269 ? 0 : 1;
    int _1273 = 2;
    float _1275 = _1265;
    float _1277 = _1155;
    float _1279 = _1161;
    float _1281 = _1215;
    float _1283 = _1217;
    float _1285 = _1221;
    if (!_1253)
    {
        _1273 = 1;
    }
    int _1287 = _1273;
    float _1289 = trunc(_1267);
    int _1291 = int(_1289);
    int _1293 = _1287;
    if (!_1257)
    {
        _1293 = _1271;
    }
    int _1295 = _1293;
    int _1297 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1299 = _1251 + _1297;
    int _1301 = _1299 + 1;
    int _1303 = _1295 << 6;
    float _1305 = as_type<float>(_1295);
    if (!_1259)
    {
        _715 = _1225;
    }
    float _1307 = _715;
    float _1309 = _1153;
    float _1311 = _1307;
    if (_1259)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1313;
    }
    float _1315 = _1309;
    int _1317 = _1303 + 96;
    uint _1320 = uint(int(uint(_1317) >> uint(2)));
    uint _1322 = uint(int(uint(int(_1320)) >> uint(2)));
    int _1324 = int(_1320) & 3;
    float _1326 = (*spvDescriptorSet0.vp_c15)._m0[int(_1322)][_1324];
    int _1328 = int(_1320) + 1;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    int _1332 = _1328 & 3;
    float _1334 = (*spvDescriptorSet0.vp_c15)._m0[int(_1330)][_1332];
    int _1336 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1338 = _1291 + _1336;
    int _1340 = _1338 + 1;
    float _1342 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1344 = _1303 + 104;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[int(_1356)][_1358];
    bool _1362 = _1340 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1364 = _1340 | _1301;
    int _1366 = _1340;
    if (_1259)
    {
        float _1368 = _1265 * _1315;
        _1275 = _1368;
    }
    float _1370 = _1275;
    bool _1372 = _1364 < 0;
    bool _1374 = _1372 || _1362;
    float _1376 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1342);
    if (_1259)
    {
        float _1378 = _1370 * 0.15915493667125701904296875;
        _1277 = _1378;
    }
    float _1380 = _1277;
    float _1382 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1384 = _783;
    float _1386 = _1382;
    if (_1259)
    {
        float _1388 = _1380 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    bool _1394 = _1301 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1396 = _1394 || _1374;
    float _1398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1400 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1402 = precise::max(0.0, _1398);
    if (_1259)
    {
        float _1404 = rsqrt(_1229);
        _1386 = _1404;
    }
    float _1406 = _1386;
    float _1408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1412 = -_1209;
    float _1414 = -_1402;
    float _1416 = fma(_1161, _1412, _1414);
    float _1418 = -_1410;
    float _1420 = fma(_1418, _1408, 1.0);
    float _1422 = _1406;
    float _1424 = _1416;
    if (!_1396)
    {
        int _1426 = _1301 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1428 = _1426 + _1340;
        _1366 = _1428;
    }
    int _1430 = _1366;
    float _1432 = _1315;
    if (_1259)
    {
        float _1434 = _1380 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        _1432 = _1436;
    }
    float _1438 = _1432;
    int _1440 = 0;
    if (!_1396)
    {
        int _1442 = _1430 << 2;
        _1440 = _1442;
    }
    int _1444 = _1440;
    int _1446 = 0;
    int _1448 = _1444;
    if (!_1396)
    {
        uint _1450 = uint(int(uint(_1430) >> uint(2)));
        _1446 = int(_1450);
    }
    int _1452 = _1446;
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1456 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1454);
    float _1458 = precise::clamp(_1456, 0.0, 1.0);
    if (!_1396)
    {
        int _1460 = 12 & _1444;
        _1448 = _1460;
    }
    int _1462 = _1448;
    float _1464 = _1219 * _1334;
    float _1466 = _1334;
    float _1468 = _1464;
    if (_1259)
    {
        float _1470 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = -_1458;
    float _1476 = _1474 + 1.0;
    float _1478 = log2(_1420);
    float _1480 = fma(_575, _1326, _1464);
    float _1482 = _1392;
    if (_1259)
    {
        float _1484 = fma(_1392, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1259)
    {
        float _1488 = _1438 + (-1.0);
        _1279 = _1488;
    }
    float _1490 = _1279;
    if (_1259)
    {
        float _1492 = _1406 * _1486;
        _1422 = _1492;
    }
    float _1494 = _1422;
    float _1496 = fma(_569, _1352, _1480);
    if (_1259)
    {
        float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1498;
    }
    float _1500 = _1468;
    int _1502 = _1303 + 56;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.vp_c15)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    if (_1259)
    {
        float _1520 = _1215 * _1494;
        _1281 = _1520;
    }
    float _1522 = _1281;
    if (_1259)
    {
        float _1524 = _1217 * _1494;
        _1283 = _1524;
    }
    float _1526 = _1283;
    if (_1259)
    {
        float _1528 = fma(_1416, _1438, _1500);
        _1424 = _1528;
    }
    float _1530 = _1424;
    float _1532 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1259)
    {
        float _1534 = _1522 * _1522;
        _1285 = _1534;
    }
    float _1536 = _1285;
    if (_1259)
    {
        float _1538 = _1526 * _1526;
        _1311 = _1538;
    }
    float _1540 = _1311;
    int _1542 = _1303 + 48;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1562 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1532);
    float _1566 = fma(_1530, _1530, _1536);
    float _1568 = _1496 + _1360;
    float _1570 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1572 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1564);
    int _1574 = _1303 + 64;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
    float _1592 = _1566 + _1540;
    float _1594 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1596 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1570);
    float _1598 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1600 = 1.0 / _1568;
    float _1602 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1594);
    float _1604 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _1606 = _1303 + 72;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    int _1616 = int(_1608) + 1;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    int _1620 = _1616 & 3;
    float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
    float _1624 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1626 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1602);
    float _1628 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1624);
    float _1630 = rsqrt(_1592);
    float _1632 = _1624;
    float _1634 = _1560;
    if (!_1396)
    {
        int _1636 = _1452 << 4;
        int _1638 = _1636 + _1462;
        _1632 = as_type<float>(_1638);
    }
    float _1640 = _1632;
    int _1642 = _1303 + 80;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    float _1660 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1662 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1628);
    float _1664 = abs(_1476);
    float _1666 = log2(_1664);
    float _1668 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1662);
    int _1670 = _1303 + 88;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    float _1688 = _1630 * _1522;
    float _1690 = _1630 * _1530;
    float _1692 = _1640;
    float _1694 = _1668;
    if (!_1396)
    {
        int _1696 = as_type<int>(_1640) + 400;
        uint _1698 = uint(int(uint(_1696) >> uint(2)));
        uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
        int _1702 = int(_1698) & 3;
        float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
        _1692 = _1704;
    }
    float _1706 = _1692;
    float _1708 = _1630 * _1526;
    float _1710 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = floor(_1560);
    float _1714 = _1219 * _1558;
    float _1716 = 1.0 / _1668;
    float _1718 = fma(_575, _1550, _1714);
    float _1720 = _1219 * _1590;
    float _1722 = fma(_569, _1510, _1718);
    float _1724 = -_1712;
    float _1726 = _1560 + _1724;
    float _1728 = fma(_575, _1582, _1720);
    float _1730 = _1722 + _1518;
    float _1732 = -_1710;
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1732);
    float _1736 = _1518;
    if (!_1396)
    {
        float _1738 = floor(_1241);
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_569, _1614, _1728);
    float _1744 = _1730 * _1600;
    float _1746 = -_1708;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1734);
    float _1750 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1752 = _1742 + _1622;
    bool _1754 = _1744 >= 0.0;
    float _1756 = fma(_1748, -0.5, 0.5);
    float _1758 = _1752 * _1600;
    float _1760 = _1219 * _1658;
    bool _1762 = _1744 <= 1.0;
    bool _1764 = _1762 && _1754;
    float _1766 = exp2(_1750);
    float _1768 = fma(_575, _1650, _1760);
    bool _1770 = _1758 >= 0.0;
    bool _1772 = _1770 && _1764;
    float _1774 = fma(_1748, 0.5, 0.5);
    if (!_1396)
    {
        float _1776 = -_1740;
        float _1778 = _1241 + _1776;
        _1634 = _1778;
    }
    float _1780 = _1634;
    float _1782 = fma(_569, _1678, _1768);
    bool _1784 = _1758 <= 1.0;
    bool _1786 = _1784 && _1772;
    float _1788 = sqrt(_1756);
    float _1790 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = _1782 + _1686;
    float _1794 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1796 = fma(_1774, _1790, -0.212114393711090087890625);
    float _1798 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1800 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1794);
    float _1802 = _1748;
    float _1804 = _1796;
    if (!_1396)
    {
        float _1806 = floor(_1267);
        _1802 = _1806;
    }
    float _1808 = _1802;
    float _1810 = fma(_1774, _1796, 1.570728778839111328125);
    float _1812 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1798);
    float _1814 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1800);
    if (_1786)
    {
        float _1816 = float(_1295);
        _1305 = _1816;
    }
    float _1818 = _1305;
    float _1820 = _1690 + 1.0;
    float _1822 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1814);
    float _1824 = _1788 * 0.636619746685028076171875;
    float _1826 = _1678;
    float _1828 = _1822;
    if (!_1396)
    {
        float _1830 = rint(_1706);
        float _1832 = precise::max(_1830, 0.0);
        uint _1834 = uint(_1832);
        uint _1836 = clamp(_1834, 0u, 65535u);
        _1826 = as_type<float>(_1836);
    }
    float _1838 = _1826;
    float _1840 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1812);
    float _1842 = -_1690;
    float _1844 = fma(_1766, _1820, _1842);
    float _1846 = _1822 * _1716;
    float _1848 = -_1810;
    float _1850 = fma(_1824, _1848, 1.0);
    float _1852 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1840);
    float _1854 = _1478 * 0.693147182464599609375;
    float _1856 = _1792 * _1600;
    float _1858 = _1812;
    float _1860 = _1852;
    if (_1786)
    {
        float _1862 = rint(_1818);
        float _1864 = precise::max(_1862, 0.0);
        uint _1866 = uint(_1864);
        uint _1868 = clamp(_1866, 0u, 65535u);
        _1858 = as_type<float>(_1868);
    }
    float _1870 = _1858;
    float _1872 = _1852 * _1716;
    if (!_1396)
    {
        float _1874 = -_1808;
        float _1876 = _1267 + _1874;
        _1804 = _1876;
    }
    float _1878 = _1804;
    float _1880 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1882 = fma(_1846, 0.5, 0.5);
    float _1884 = fma(_1872, -0.5, 0.5);
    float _1886 = fma(_1844, 0.5, 0.5);
    float2 _5559 = float2(_1726, _1235);
    float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5559, float2(0.0), isnan(_5559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5559, float2(0.0), isnan(_5559)), level(0.0)).x;
    float _1890 = _1838;
    if (!_1396)
    {
        float3 _5576 = float3(_1878, _1780, float(as_type<int>(_1838)));
        float3 _5580 = select(_5576, float3(0.0), isnan(_5576));
        float _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5580.xy, uint(rint(_5580.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5580.xy, uint(rint(_5580.z)), level(0.0)).x;
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = _1870;
    if (_1786)
    {
        float3 _5595 = float3(_1744, _1758, float(as_type<int>(_1870)));
        float3 _5597 = select(_5595, float3(0.0), isnan(_5595));
        float _1898 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5597.xy, uint(rint(_5597.z)), _1856, level(0.0));
        _1896 = _1898;
    }
    float _1900 = _1896;
    float3 _5607 = float3(_1882, _1884, _1880);
    float _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5607, float3(0.0), isnan(_5607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5607, float3(0.0), isnan(_5607)), level(0.0)).x;
    float3 _5616 = float3(_1882, _1884, _1880);
    float4 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5616, float3(0.0), isnan(_5616)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5616, float3(0.0), isnan(_5616)), level(0.0)).xyzw;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = _1905.w;
    float2 _5632 = float2(_1850, _1886);
    float3 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5632, float2(0.0), isnan(_5632)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5632, float2(0.0), isnan(_5632)), level(0.0)).xyz;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = abs(_1245);
    float _1927 = log2(_1925);
    float _1929 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1939 = _1935 || _1937;
    float _1941 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _1943 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1941);
    float _1945 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _1947 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1949 = _1945 + _1668;
    bool _1951 = _1245 <= 8000.0;
    bool _1953 = isnan(_1245);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(8000.0);
    bool _1959 = _1955 || _1957;
    float _1961 = float(_1959);
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1852;
    out.gl_Position.z = _1945;
    out.gl_Position.w = _1668;
    float _1963 = exp2(_1947);
    float _1965 = _1949 * 0.5;
    out.m_78.z = _1965;
    out.m_78.w = _1668;
    if (_1939)
    {
        _1860 = 1.0;
    }
    float _1967 = _1860;
    float _1969 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = fma(_1971, -2.0, 3.0);
    float _1975 = _1971 * _1971;
    float _1977 = _1975 * _1973;
    float _1979 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1981 = -_1977;
    float _1983 = _1981 + 1.0;
    float _1985 = exp2(_1979);
    float _1987 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1977);
    float _1989 = _1961 * _1987;
    float _1991 = _1987;
    float _1993 = _1967;
    if (_1939)
    {
        _1991 = 1.0;
    }
    float _1995 = _1991;
    float _1997 = _1995;
    float _1999 = _1894;
    if (!_1939)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2007;
        float _2011 = _2003 * 6.283185482025146484375;
        float _2013 = cos(_2011);
        float _2015 = _2005 * 0.15915493667125701904296875;
        float _2017 = _2003 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        float _2021 = 1.0 / _2013;
        float _2023 = _2015 * 6.283185482025146484375;
        float _2025 = cos(_2023);
        float _2027 = _2019 * _2021;
        float _2029 = _2015 * 6.283185482025146484375;
        float _2031 = sin(_2029);
        float _2033 = _2025 * _2027;
        float _2035 = 1.0 / _2009;
        float _2037 = 1.0 / _2033;
        float _2039 = _2031 * _2037;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2043 = fma(_1245, _2039, _2041);
        float _2045 = _2043 * _2035;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        _1694 = _2021;
        _1828 = _2043;
        _1993 = _2047;
    }
    float _2049 = _1694;
    float _2051 = _1828;
    float _2053 = _1993;
    float _2055 = _2049;
    float _2057 = _2051;
    if (!_1939)
    {
        float _2059 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = _2061 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2063 * 0.15915493667125701904296875;
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = 1.0 / _2067;
        float _2077 = _2069 * 6.283185482025146484375;
        float _2079 = cos(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = _2069 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = 1.0 / _2087;
        float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2093 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2091;
        float _2095 = 1.0 / _2093;
        float _2097 = _2085 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_1245, _2097, _2099);
        float _2103 = _2101 * _2095;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2055 = _2085;
        _2057 = _2095;
        _1997 = _2109;
    }
    float _2111 = _2055;
    float _2113 = _2057;
    float _2115 = _1997;
    float _2117 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2119 = -_1888;
    float _2121 = _2119 + 1.0;
    float _2123 = -_1985;
    float _2125 = _2123 + 1.0;
    float _2127 = _2111;
    float _2129 = _2113;
    if (!_1786)
    {
        _2127 = 1.0;
    }
    float _2131 = _2127;
    float _2133 = _2121 * _2117;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = _2131;
    if (_1786)
    {
        bool _2139 = _1900 >= _1856;
        bool _2141 = isnan(_1900);
        bool _2143 = _2139 || _2141;
        bool _2145 = isnan(_1856);
        bool _2147 = _2143 || _2145;
        float _2149 = float(_2147);
        _2137 = _2149;
    }
    float _2151 = _2137;
    float _2153 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2155 = _2151;
    if (_1396)
    {
        _2129 = 1.0;
    }
    float _2157 = _2129;
    float _2159 = _2157;
    if (!_1396)
    {
        int _2161 = _1430 << 4;
        int _2163 = _2161 + 2048;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.vp_c15)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        float _2199 = _1219 * _2179;
        float _2201 = fma(_575, _2171, _2199);
        float _2203 = fma(_569, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1894;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2159 = _2219;
    }
    float _2221 = _2159;
    float _2223 = _2151 * _2221;
    float _2225 = _2153 * _1902;
    float _2227 = -_2135;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = -_2153;
    float _2233 = _2231 + 1.0;
    bool _2235 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2237 = isnan(_1199);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2243 = _2239 || _2241;
    float _2245 = _1913 * _2225;
    float _2247 = -_2223;
    float _2249 = fma(_2247, _2229, 1.0);
    float _2251 = precise::clamp(_2249, 0.0, 1.0);
    float _2253 = _1923 * _2225;
    float _2255 = _1913 * _2233;
    float _2257 = fma(_1919, _2245, _1907);
    float _2259 = fma(_1921, _2245, _1909);
    float _2261 = _2251 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2263 = fma(_1913, _2253, _1911);
    float _2265 = _2053 * _2115;
    out.m_80.x = _2261;
    float _2267 = _2233;
    float _2269 = _2251;
    float _2271 = _2245;
    if (!_2243)
    {
        _717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _717;
    float _2275 = _2265 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2243)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2281 = _2155;
    out.m_82.x = _2257;
    out.m_82.y = _2259;
    out.m_82.z = _2263;
    out.m_82.w = _2255;
    float _2283 = _2281;
    float _2285 = _2281;
    if (!_2243)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2287 = _1999;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2243)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2293 = _2267;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2243)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2299 = _2269;
    float _2301 = _2299;
    float _2303 = _2299;
    if (!_2243)
    {
        _2271 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2305 = _2271;
    bool _2307 = !_2243;
    float _2309 = _2305;
    float _2311 = _2305;
    if (!_2307)
    {
        bool _2313 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2315 = isnan(_1199);
        bool _2317 = _2313 || _2315;
        bool _2319 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2321 = _2317 || _2319;
        if (!_2321)
        {
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2325 = _1199 + _2323;
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2329 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2327;
            float _2331 = 1.0 / _2329;
            float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2349 = _2325 * _2331;
            float _2351 = precise::clamp(_2349, 0.0, 1.0);
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2361 = fma(_2351, _2335, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2363 = fma(_2351, _2355, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2365 = fma(_2351, _2359, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2367 = fma(_2351, _2339, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2369 = fma(_2351, _2343, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2371 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2285 = _2365;
            _2303 = _2369;
            _2279 = _2363;
            _2297 = _2367;
            _2291 = _2361;
            _2311 = _2371;
            _2373 = true;
        }
        else
        {
            bool _2375 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2377 = isnan(_1199);
            bool _2379 = _2375 || _2377;
            bool _2381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2383 = _2379 || _2381;
            if (!_2383)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2385 = _2277;
            _2279 = _2385;
            if (!_2383)
            {
                _2283 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2387 = _2283;
            _2285 = _2387;
            if (!_2383)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2389 = _2289;
            _2291 = _2389;
            if (!_2383)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2391 = _2295;
            _2297 = _2391;
            if (!_2383)
            {
                _2301 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2393 = _2301;
            _2303 = _2393;
            if (!_2383)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2395 = _2309;
            bool _2397 = !_2383;
            _2311 = _2395;
            if (!_2397)
            {
                bool _2399 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2401 = isnan(_1199);
                bool _2403 = _2399 || _2401;
                bool _2405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2407 = _2403 || _2405;
                if (!_2407)
                {
                    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2411 = _1199 + _2409;
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2415 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2413;
                    float _2417 = 1.0 / _2415;
                    float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2435 = _2411 * _2417;
                    float _2437 = precise::clamp(_2435, 0.0, 1.0);
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2447 = fma(_2437, _2421, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2449 = fma(_2437, _2441, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2451 = fma(_2437, _2445, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2453 = fma(_2437, _2425, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2455 = fma(_2437, _2429, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2457 = fma(_2437, _2433, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2285 = _2451;
                    _2303 = _2455;
                    _2279 = _2449;
                    _2297 = _2453;
                    _2291 = _2447;
                    _2311 = _2457;
                    _2373 = true;
                }
                else
                {
                    _2285 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2303 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2373 = false;
    float _2459 = _2285;
    float _2461 = _2303;
    float _2463 = _2279;
    float _2465 = _2297;
    float _2467 = _2291;
    float _2469 = _2311;
    float _2471 = fma(_847, -0.5, 0.5);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = -_2459;
    float _2477 = _2475 + _2461;
    float _2479 = _2275 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2481 = -_2463;
    float _2483 = _2481 + _2465;
    float _2485 = fma(_2473, _2477, _2459);
    out.m_84.x = 0.0;
    float _2487 = -_2467;
    float _2489 = _2487 + _2469;
    float _2491 = fma(_2473, _2483, _2463);
    float _2493 = _2485 * 0.586610972881317138671875;
    out.m_59.x = _2479;
    bool _2495 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2497 = fma(_2473, _2489, _2467);
    float _2499 = fma(_2491, 0.298911988735198974609375, _2493);
    bool _2501 = _2053 > 0.0;
    bool _2503 = isnan(_2053);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    float _2511 = fma(_2497, 0.114477999508380889892578125, _2499);
    bool _2513 = _2115 <= 0.0;
    bool _2515 = !_2509;
    bool _2517 = _2513 || _2515;
    float _2519 = -_2511;
    float _2521 = _2491 + _2519;
    float _2523 = -_2511;
    float _2525 = _2485 + _2523;
    float _2527 = -_2511;
    float _2529 = _2497 + _2527;
    float _2531 = fma(_2521, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    float _2533 = fma(_2525, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    float _2535 = fma(_2529, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    bool _2537 = !_2495;
    if (!_2537)
    {
        float _2539 = -_1147;
        float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2543 = -_1149;
        float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2547 = -_1151;
        float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2551 = _2541 * _2541;
        float _2553 = fma(_2545, _2545, _2551);
        float _2555 = fma(_2549, _2549, _2553);
        float _2557 = sqrt(_2555);
        float _2559 = rsqrt(_2555);
        float _2561 = -_2557;
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2567 = precise::clamp(_2565, 0.0, 1.0);
        float _2569 = _2545 * _2559;
        float _2571 = _2541 * _2559;
        float _2573 = abs(_2567);
        float _2575 = log2(_2573);
        float _2577 = _2549 * _2559;
        float _2579 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2581 = _847 * _2571;
        float _2583 = -_2571;
        float _2585 = -_2579;
        float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2585);
        float _2589 = fma(_845, _2569, _2581);
        float _2591 = -_2577;
        float _2593 = fma(_2591, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2587);
        float _2595 = fma(_849, _2577, _2589);
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2601 = _2593 + _2599;
        float _2603 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2605 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2607 = precise::clamp(_2605, 0.0, 1.0);
        float _2609 = exp2(_2603);
        float _2611 = _2609 * _2607;
        float _2613 = _2597 * _2611;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2617 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2619 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2615;
        out.m_84.y = _2617;
        out.m_84.z = _2619;
    }
    out.m_86.x = _2531;
    out.m_86.y = _2533;
    out.m_86.z = _2535;
    if (!_2517)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2621 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2621;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_56.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_59.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_123);
        out.gl_Position.z = _2680;
    }
    if (!_109)
    {
        return out;
    }
    float _127 = in.m_61.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_105);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _113;
    if (_153)
    {
        out.m_59.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2749 = as_type<float>(_159);
        out.gl_Position.z = _2749;
    }
    if (_153)
    {
        return out;
    }
    float _161 = in.m_63.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = in.m_63.z;
    float _185 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _187 = _185 * _163;
    float _189 = 0.0;
    float _191 = _165;
    if (!_177)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = 0.0;
    float _201 = _197;
    if (!_177)
    {
        float _203 = _141 * _141;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_177)
    {
        float _211 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _211;
    }
    float _213 = _201;
    bool _215 = !_177;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _165 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _165);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_177;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _165 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _191 = _271;
    }
    float _273 = _191;
    float _275 = 0.0;
    if (!_177)
    {
        _275 = _141;
    }
    float _277 = _275;
    float _279 = _277;
    if (!_177)
    {
        float _281 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _281;
    }
    float _283 = _209;
    bool _285 = !_177;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _141 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _141);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    bool _321 = !_177;
    if (!_321)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _141 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _279 = _341;
    }
    float _343 = _279;
    float _345 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _187);
    float _347 = in.m_63.y;
    int _349 = as_type<int>(_167) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>(_167) & 2;
    bool _355 = _353 != 0;
    float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _359 = _345 * 6.283185482025146484375;
    float _361 = in.m_63.w;
    float _363 = _359 * 0.15915493667125701904296875;
    float _365 = in.m_68.y;
    float _367 = floor(_345);
    bool _369 = !_355;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _381 = _379 != 0;
    float _383 = in.m_68.x;
    bool _385 = !_351;
    float _387 = _385 ? (-0.5) : 0.5;
    float _389 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _371);
    float _391 = _363 * 6.283185482025146484375;
    float _393 = cos(_391);
    bool _395 = _183 > 0.5;
    float _397 = in.m_68.w;
    float _399 = _357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _401 = !_381;
    int _403 = _401 ? 0 : 1;
    float _405 = _347 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _407 = _161 > 0.5;
    float _409 = -_367;
    float _411 = _345 + _409;
    bool _413 = !_181;
    int _415 = _413 ? 0 : 1;
    bool _417 = !_377;
    int _419 = _417 ? 0 : 1;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _427 = _425 != 0;
    float _429 = fma(_393, 0.5, 0.5);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _437 = _435 != 0;
    float _439 = -_411;
    float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _443 = -_387;
    int _445 = _407 ? as_type<int>(_443) : as_type<int>(_387);
    bool _447 = _411 < 0.5;
    float _449 = float(_447);
    int _451 = abs(_419);
    bool _453 = _347 > 0.5;
    float _455 = -_449;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = float(_451);
    float _461 = -_429;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _465 = -_371;
    int _467 = _453 ? as_type<int>(_465) : as_type<int>(_371);
    bool _469 = _361 > 0.5;
    float _471 = abs(_441);
    float _473 = _459 * _471;
    float _475 = in.m_61.x;
    float _477 = in.m_61.y;
    float _479 = in.m_61.z;
    int _481 = abs(_415);
    int _483 = abs(_403);
    float _485 = in.m_56.x;
    float _487 = in.m_56.y;
    float _489 = in.m_56.z;
    float _491 = float(_481);
    float _493 = _161 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _495 = fma(_491, _463, _473);
    float _497 = float(_483);
    float _499 = _365 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _505 = abs(_457);
    float _507 = fma(_497, _505, _495);
    float _509 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _511 = fma(_405, -2.0, _503);
    float _513 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _515 = _507 * _499;
    float _517 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _519 = _507 * _501;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _523 = fma(_273, _477, _513);
    float _525 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _527 = fma(_273, _475, _509);
    float _529 = fma(_273, _479, _517);
    float _531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _533 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _535 = fma(_523, _397, _487);
    float _537 = _525 * _389;
    float _539 = fma(_527, _397, _485);
    float _541 = _533 * _531;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _545 = _537 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _547 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[78].z, _521);
    float _549 = fma(_529, _397, _489);
    float _551 = _535 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _553 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
    float _555 = _537 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].x, _545);
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
    float _563 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].x, _555);
    float _565 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _557);
    float _567 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
    float _569 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _571 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _563);
    float _573 = _565 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _577 = _571 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _579 = _569 + _573;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _585 = _575 + _577;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _579 + _587;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _593 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _595 = _585 + _593;
    float _597 = _589 * _589;
    float _599 = _537 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _601 = fma(_595, _595, _597);
    float _603 = _535 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _605 = -_591;
    float _607 = fma(_493, 2.0, _605);
    float _609 = sqrt(_601);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _599);
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _621 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[5].x, _603);
    float _623 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = -_387;
    int _633 = _395 ? as_type<int>(_631) : as_type<int>(_387);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _641 = _609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _643 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[78].w, _619);
    float _645 = -_371;
    int _647 = _469 ? as_type<int>(_645) : as_type<int>(_371);
    float _649 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _653 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _625;
    out.m_70.y = _627;
    out.m_70.z = _629;
    out.m_70.w = _581;
    bool _659 = !_427;
    float _661 = _659 ? _371 : as_type<float>(_467);
    float _663 = _649 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _665 = _623 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_72.x = _653;
    out.m_72.y = _655;
    out.m_72.z = _657;
    out.m_72.w = _583;
    float _669 = -_141;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[76].x, _607);
    float _673 = _663 + _665;
    bool _675 = !_437;
    float _677 = _675 ? _371 : as_type<float>(_647);
    float _679 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _681 = !_423;
    float _683 = _681 ? _387 : as_type<float>(_445);
    bool _685 = !_433;
    float _687 = _685 ? _387 : as_type<float>(_633);
    float _689 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _691 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _693 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _695 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _697 = _683 + 0.5;
    float _699 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
    float _701 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _693);
    float _703 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
    float _705 = fma(_399, _697, _671);
    float _707 = _693;
    float _709 = _691;
    float _711 = _655;
    float _713 = _343;
    float _715 = _599;
    float _717 = _575;
    if (!_641)
    {
        _707 = _585;
    }
    float _719 = _707;
    float _721 = _719;
    if (!_641)
    {
        _709 = _579;
    }
    float _723 = _709;
    float _725 = _723;
    if (!_641)
    {
        _711 = _673;
    }
    float _727 = _711;
    bool _729 = !_641;
    float _731 = _727;
    if (!_729)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _737 = _609 + _735;
        float _739 = _673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = rsqrt(_601);
        float _743 = _737 * _733;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = cos(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = sin(_751);
        float _755 = _749 + (-1.0);
        float _757 = _755 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = fma(_753, _739, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _761 = fma(_673, _749, _757);
        float _763 = _741 * _759;
        float _765 = fma(_595, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _767 = fma(_589, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _731 = _761;
        _721 = _765;
        _725 = _767;
    }
    float _769 = _731;
    float _771 = _721;
    float _773 = _725;
    float _775 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _547);
    float _777 = -_663;
    float _779 = _777 + _769;
    float _781 = -_575;
    float _783 = _781 + _771;
    float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _787 = -_775;
    float _789 = _787 + 1.0;
    float _791 = _779 * _779;
    float _793 = _651 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _795 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _511);
    float _797 = _661 + (-0.5);
    float _799 = -_789;
    float _801 = fma(_683, _799, _705);
    float _803 = -_569;
    float _805 = _803 + _773;
    float _807 = fma(_783, _783, _791);
    float _809 = -_793;
    float _811 = -_795;
    float _813 = fma(_809, _797, _811);
    float _815 = _687 + 0.5;
    float _817 = -_677;
    float _819 = _817 + 0.5;
    float _821 = fma(_805, _805, _807);
    float _823 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _643);
    float _825 = _815 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _829 = sqrt(_821);
    float _831 = -_823;
    float _833 = _831 + 1.0;
    float _835 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _837 = _825 * _667;
    float _839 = _827 * _785;
    float _841 = fma(_661, _833, _813);
    float _843 = fma(_343, _477, _835);
    float _845 = _699 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _847 = _701 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _849 = _703 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _851 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _853 = -_843;
    float _855 = _523 + _853;
    float _857 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    out.m_74.x = _845;
    out.m_74.y = _847;
    out.m_74.z = _849;
    float _859 = fma(_343, _475, _851);
    bool _861 = _829 > 0.0;
    float _863 = _855 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _855 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _867 = fma(_343, _479, _857);
    float _869 = -_859;
    float _871 = _527 + _869;
    float _873 = _855 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_76.x = _801;
    out.m_76.y = _841;
    out.m_76.z = _837;
    out.m_76.w = _839;
    float _875 = -_867;
    float _877 = _529 + _875;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[5].x, _865);
    float _883 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[6].x, _873);
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[6].z, _883);
    float _887 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[4].z, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[5].z, _881);
    float _891 = _839;
    float _893 = _837;
    float _895 = _871;
    float _897 = _883;
    float _899 = _889;
    float _901 = _887;
    float _903 = _885;
    float _905 = _773;
    float _907 = _871;
    if (!_861)
    {
        _891 = _771;
    }
    float _909 = _891;
    float _911 = _909;
    float _913 = _909;
    float _915 = _909;
    if (!_861)
    {
        _893 = _769;
    }
    float _917 = _893;
    bool _919 = !_861;
    float _921 = _917;
    float _923 = _917;
    float _925 = _917;
    if (!_919)
    {
        bool _927 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _929 = _343;
        if (_927)
        {
            float _931 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _929 = _931;
        }
        float _933 = _929;
        float _935 = _933;
        if (_927)
        {
            float _937 = _887 * _933;
            _895 = _937;
        }
        float _939 = _895;
        float _941 = _939;
        if (_927)
        {
            float _943 = _889 * _933;
            _897 = _943;
        }
        float _945 = _897;
        float _947 = _945;
        if (_927)
        {
            float _949 = _885 * _933;
            _935 = _949;
        }
        float _951 = _935;
        float _953 = _951;
        if (!_927)
        {
            float _955 = _141 + 1.0;
            float _957 = _955;
            if (!_177)
            {
                float _959 = _955 * _955;
                float _961 = _959 * 0.5;
                _143 = _961;
            }
            float _963 = _143;
            float _965 = _963;
            if (!_177)
            {
                float _967 = _963 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _965 = _967;
            }
            float _969 = _965;
            bool _971 = !_177;
            float _973 = _969;
            if (!_971)
            {
                float _975 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _977 = log2(_975);
                float _979 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _981 = _979 + 1.0;
                float _983 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _985 = _977 * _955;
                float _987 = 1.0 / _981;
                float _989 = _983 * 0.693147182464599609375;
                float _991 = exp2(_985);
                float _993 = 1.0 / _989;
                float _995 = _991 + (-1.0);
                float _997 = -_995;
                float _999 = fma(_997, _993, _955);
                float _1001 = _999 * _987;
                float _1003 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _973 = _1003;
                _921 = _981;
                _911 = _987;
            }
            float _1005 = _973;
            float _1007 = _921;
            float _1009 = _911;
            float _1011 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1015 = !_177;
            float _1017 = _1007;
            _913 = _1009;
            if (!_1015)
            {
                float _1019 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1021 = log2(_1019);
                float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1025 = _1023 + 1.0;
                float _1027 = 1.0 / _1025;
                float _1029 = _1021 * _955;
                float _1031 = exp2(_1029);
                float _1033 = -_1031;
                float _1035 = _1033 + 1.0;
                float _1037 = _1035 * _1027;
                _957 = _1037;
                _1017 = _1029;
            }
            float _1039 = _957;
            float _1041 = _1017;
            float _1043 = fma(_1039, _477, _1013);
            float _1045 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1047 = fma(_1039, _475, _1011);
            float _1049 = -_843;
            float _1051 = _1049 + _1043;
            float _1053 = fma(_1039, _479, _1045);
            float _1055 = -_859;
            float _1057 = _1055 + _1047;
            float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1061 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1063 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1065 = -_867;
            float _1067 = _1065 + _1053;
            float _1069 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1059);
            float _1071 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1061);
            float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1063);
            float _1075 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1069);
            float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1071);
            float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
            _899 = _1077;
            _901 = _1075;
            _903 = _1079;
            _941 = _1075;
            _947 = _1077;
            _953 = _1079;
            _923 = _1041;
        }
        float _1081 = _899;
        float _1083 = _901;
        float _1085 = _903;
        float _1087 = _941;
        float _1089 = _947;
        float _1091 = _953;
        float _1093 = _923;
        float _1095 = _913;
        float _1097 = _1081 * _1081;
        float _1099 = rsqrt(_821);
        float _1101 = fma(_1083, _1083, _1097);
        float _1103 = fma(_1085, _1085, _1101);
        float _1105 = sqrt(_1103);
        float _1107 = _783 * _1099;
        float _1109 = _779 * _1099;
        float _1111 = _805 * _1099;
        bool _1113 = _1105 > 0.0;
        float _1115 = _1095;
        float _1117 = _1093;
        _713 = _1091;
        _907 = _1087;
        if (!_1113)
        {
            _1115 = _771;
        }
        float _1119 = _1115;
        _915 = _1119;
        if (!_1113)
        {
            _1117 = _769;
        }
        float _1121 = _1117;
        bool _1123 = !_1113;
        _925 = _1121;
        if (!_1123)
        {
            float _1125 = rsqrt(_1103);
            float _1127 = _1125 * _1081;
            float _1129 = _1125 * _1083;
            float _1131 = _1125 * _1085;
            float _1133 = _1109 * _1127;
            float _1135 = fma(_1107, _1129, _1133);
            float _1137 = fma(_1111, _1131, _1135);
            float _1139 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1141 = fma(_1087, _1139, _771);
            float _1143 = fma(_1089, _1139, _769);
            float _1145 = fma(_1091, _1139, _773);
            _925 = _1143;
            _915 = _1141;
            _905 = _1145;
        }
    }
    float _1147 = _925;
    float _1149 = _915;
    float _1151 = _905;
    float _1153 = _713;
    float _1155 = _907;
    float _1157 = _663 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1161 = _1147 + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1165 = _1149 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1169 = _1151 + _1167;
    float _1171 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1157);
    float _1173 = _1161 * _1161;
    float _1175 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1171);
    float _1177 = fma(_1165, _1165, _1173);
    float _1179 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1181 = _663 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1183 = fma(_1169, _1169, _1177);
    float _1185 = 1.0 / _1179;
    float _1187 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1181);
    float _1189 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1191 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1187);
    float _1193 = rsqrt(_1183);
    float _1195 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = _1195 + _1179;
    float _1199 = sqrt(_1183);
    float _1201 = _1197 * _1185;
    float _1203 = _1201 * 0.5;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1207 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1205);
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1211 = floor(_1189);
    float _1213 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1215 = _1165 * _1209;
    float _1217 = _1169 * _1209;
    float _1219 = _663 + _1213;
    float _1221 = _1215 * _1215;
    float _1223 = 1.0 / _1207;
    float _1225 = _1217 * _1217;
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1229 = _1221 + _1225;
    float _1231 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1227);
    float _1233 = -_1211;
    float _1235 = _1189 + _1233;
    float _1237 = sqrt(_1229);
    float _1239 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1231);
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1245 = _1223 * _1243;
    float _1247 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1249 = trunc(_1241);
    int _1251 = int(_1249);
    bool _1253 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1255 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1247);
    bool _1257 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1259 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1255);
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1237 + _1263;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1269 = !_1253;
    int _1271 = _1269 ? 0 : 1;
    int _1273 = 2;
    float _1275 = _1265;
    float _1277 = _1155;
    float _1279 = _1161;
    float _1281 = _1215;
    float _1283 = _1217;
    float _1285 = _1221;
    if (!_1253)
    {
        _1273 = 1;
    }
    int _1287 = _1273;
    float _1289 = trunc(_1267);
    int _1291 = int(_1289);
    int _1293 = _1287;
    if (!_1257)
    {
        _1293 = _1271;
    }
    int _1295 = _1293;
    int _1297 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1299 = _1251 + _1297;
    int _1301 = _1299 + 1;
    int _1303 = _1295 << 6;
    float _1305 = as_type<float>(_1295);
    if (!_1259)
    {
        _715 = _1225;
    }
    float _1307 = _715;
    float _1309 = _1153;
    float _1311 = _1307;
    if (_1259)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1313;
    }
    float _1315 = _1309;
    int _1317 = _1303 + 96;
    uint _1320 = uint(int(uint(_1317) >> uint(2)));
    uint _1322 = uint(int(uint(int(_1320)) >> uint(2)));
    int _1324 = int(_1320) & 3;
    float _1326 = (*spvDescriptorSet0.vp_c15)._m0[int(_1322)][_1324];
    int _1328 = int(_1320) + 1;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    int _1332 = _1328 & 3;
    float _1334 = (*spvDescriptorSet0.vp_c15)._m0[int(_1330)][_1332];
    int _1336 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1338 = _1291 + _1336;
    int _1340 = _1338 + 1;
    float _1342 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1344 = _1303 + 104;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[int(_1356)][_1358];
    bool _1362 = _1340 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1364 = _1340 | _1301;
    int _1366 = _1340;
    if (_1259)
    {
        float _1368 = _1265 * _1315;
        _1275 = _1368;
    }
    float _1370 = _1275;
    bool _1372 = _1364 < 0;
    bool _1374 = _1372 || _1362;
    float _1376 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1342);
    if (_1259)
    {
        float _1378 = _1370 * 0.15915493667125701904296875;
        _1277 = _1378;
    }
    float _1380 = _1277;
    float _1382 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1384 = _783;
    float _1386 = _1382;
    if (_1259)
    {
        float _1388 = _1380 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    bool _1394 = _1301 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1396 = _1394 || _1374;
    float _1398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1400 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1402 = precise::max(0.0, _1398);
    if (_1259)
    {
        float _1404 = rsqrt(_1229);
        _1386 = _1404;
    }
    float _1406 = _1386;
    float _1408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1412 = -_1209;
    float _1414 = -_1402;
    float _1416 = fma(_1161, _1412, _1414);
    float _1418 = -_1410;
    float _1420 = fma(_1418, _1408, 1.0);
    float _1422 = _1406;
    float _1424 = _1416;
    if (!_1396)
    {
        int _1426 = _1301 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1428 = _1426 + _1340;
        _1366 = _1428;
    }
    int _1430 = _1366;
    float _1432 = _1315;
    if (_1259)
    {
        float _1434 = _1380 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        _1432 = _1436;
    }
    float _1438 = _1432;
    int _1440 = 0;
    if (!_1396)
    {
        int _1442 = _1430 << 2;
        _1440 = _1442;
    }
    int _1444 = _1440;
    int _1446 = 0;
    int _1448 = _1444;
    if (!_1396)
    {
        uint _1450 = uint(int(uint(_1430) >> uint(2)));
        _1446 = int(_1450);
    }
    int _1452 = _1446;
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1456 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1454);
    float _1458 = precise::clamp(_1456, 0.0, 1.0);
    if (!_1396)
    {
        int _1460 = 12 & _1444;
        _1448 = _1460;
    }
    int _1462 = _1448;
    float _1464 = _1219 * _1334;
    float _1466 = _1334;
    float _1468 = _1464;
    if (_1259)
    {
        float _1470 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = -_1458;
    float _1476 = _1474 + 1.0;
    float _1478 = log2(_1420);
    float _1480 = fma(_575, _1326, _1464);
    float _1482 = _1392;
    if (_1259)
    {
        float _1484 = fma(_1392, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1259)
    {
        float _1488 = _1438 + (-1.0);
        _1279 = _1488;
    }
    float _1490 = _1279;
    if (_1259)
    {
        float _1492 = _1406 * _1486;
        _1422 = _1492;
    }
    float _1494 = _1422;
    float _1496 = fma(_569, _1352, _1480);
    if (_1259)
    {
        float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1498;
    }
    float _1500 = _1468;
    int _1502 = _1303 + 56;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.vp_c15)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    if (_1259)
    {
        float _1520 = _1215 * _1494;
        _1281 = _1520;
    }
    float _1522 = _1281;
    if (_1259)
    {
        float _1524 = _1217 * _1494;
        _1283 = _1524;
    }
    float _1526 = _1283;
    if (_1259)
    {
        float _1528 = fma(_1416, _1438, _1500);
        _1424 = _1528;
    }
    float _1530 = _1424;
    float _1532 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1259)
    {
        float _1534 = _1522 * _1522;
        _1285 = _1534;
    }
    float _1536 = _1285;
    if (_1259)
    {
        float _1538 = _1526 * _1526;
        _1311 = _1538;
    }
    float _1540 = _1311;
    int _1542 = _1303 + 48;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1562 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1532);
    float _1566 = fma(_1530, _1530, _1536);
    float _1568 = _1496 + _1360;
    float _1570 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1572 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1564);
    int _1574 = _1303 + 64;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
    float _1592 = _1566 + _1540;
    float _1594 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1596 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1570);
    float _1598 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1600 = 1.0 / _1568;
    float _1602 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1594);
    float _1604 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _1606 = _1303 + 72;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    int _1616 = int(_1608) + 1;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    int _1620 = _1616 & 3;
    float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
    float _1624 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1626 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1602);
    float _1628 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1624);
    float _1630 = rsqrt(_1592);
    float _1632 = _1624;
    float _1634 = _1560;
    if (!_1396)
    {
        int _1636 = _1452 << 4;
        int _1638 = _1636 + _1462;
        _1632 = as_type<float>(_1638);
    }
    float _1640 = _1632;
    int _1642 = _1303 + 80;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    float _1660 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1662 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1628);
    float _1664 = abs(_1476);
    float _1666 = log2(_1664);
    float _1668 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1662);
    int _1670 = _1303 + 88;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    float _1688 = _1630 * _1522;
    float _1690 = _1630 * _1530;
    float _1692 = _1640;
    float _1694 = _1668;
    if (!_1396)
    {
        int _1696 = as_type<int>(_1640) + 400;
        uint _1698 = uint(int(uint(_1696) >> uint(2)));
        uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
        int _1702 = int(_1698) & 3;
        float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
        _1692 = _1704;
    }
    float _1706 = _1692;
    float _1708 = _1630 * _1526;
    float _1710 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = floor(_1560);
    float _1714 = _1219 * _1558;
    float _1716 = 1.0 / _1668;
    float _1718 = fma(_575, _1550, _1714);
    float _1720 = _1219 * _1590;
    float _1722 = fma(_569, _1510, _1718);
    float _1724 = -_1712;
    float _1726 = _1560 + _1724;
    float _1728 = fma(_575, _1582, _1720);
    float _1730 = _1722 + _1518;
    float _1732 = -_1710;
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1732);
    float _1736 = _1518;
    if (!_1396)
    {
        float _1738 = floor(_1241);
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_569, _1614, _1728);
    float _1744 = _1730 * _1600;
    float _1746 = -_1708;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1734);
    float _1750 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1752 = _1742 + _1622;
    bool _1754 = _1744 >= 0.0;
    float _1756 = fma(_1748, -0.5, 0.5);
    float _1758 = _1752 * _1600;
    float _1760 = _1219 * _1658;
    bool _1762 = _1744 <= 1.0;
    bool _1764 = _1762 && _1754;
    float _1766 = exp2(_1750);
    float _1768 = fma(_575, _1650, _1760);
    bool _1770 = _1758 >= 0.0;
    bool _1772 = _1770 && _1764;
    float _1774 = fma(_1748, 0.5, 0.5);
    if (!_1396)
    {
        float _1776 = -_1740;
        float _1778 = _1241 + _1776;
        _1634 = _1778;
    }
    float _1780 = _1634;
    float _1782 = fma(_569, _1678, _1768);
    bool _1784 = _1758 <= 1.0;
    bool _1786 = _1784 && _1772;
    float _1788 = sqrt(_1756);
    float _1790 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = _1782 + _1686;
    float _1794 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1796 = fma(_1774, _1790, -0.212114393711090087890625);
    float _1798 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1800 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1794);
    float _1802 = _1748;
    float _1804 = _1796;
    if (!_1396)
    {
        float _1806 = floor(_1267);
        _1802 = _1806;
    }
    float _1808 = _1802;
    float _1810 = fma(_1774, _1796, 1.570728778839111328125);
    float _1812 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1798);
    float _1814 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1800);
    if (_1786)
    {
        float _1816 = float(_1295);
        _1305 = _1816;
    }
    float _1818 = _1305;
    float _1820 = _1690 + 1.0;
    float _1822 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1814);
    float _1824 = _1788 * 0.636619746685028076171875;
    float _1826 = _1678;
    float _1828 = _1822;
    if (!_1396)
    {
        float _1830 = rint(_1706);
        float _1832 = precise::max(_1830, 0.0);
        uint _1834 = uint(_1832);
        uint _1836 = clamp(_1834, 0u, 65535u);
        _1826 = as_type<float>(_1836);
    }
    float _1838 = _1826;
    float _1840 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1812);
    float _1842 = -_1690;
    float _1844 = fma(_1766, _1820, _1842);
    float _1846 = _1822 * _1716;
    float _1848 = -_1810;
    float _1850 = fma(_1824, _1848, 1.0);
    float _1852 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1840);
    float _1854 = _1478 * 0.693147182464599609375;
    float _1856 = _1792 * _1600;
    float _1858 = _1812;
    float _1860 = _1852;
    if (_1786)
    {
        float _1862 = rint(_1818);
        float _1864 = precise::max(_1862, 0.0);
        uint _1866 = uint(_1864);
        uint _1868 = clamp(_1866, 0u, 65535u);
        _1858 = as_type<float>(_1868);
    }
    float _1870 = _1858;
    float _1872 = _1852 * _1716;
    if (!_1396)
    {
        float _1874 = -_1808;
        float _1876 = _1267 + _1874;
        _1804 = _1876;
    }
    float _1878 = _1804;
    float _1880 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1882 = fma(_1846, 0.5, 0.5);
    float _1884 = fma(_1872, -0.5, 0.5);
    float _1886 = fma(_1844, 0.5, 0.5);
    float2 _5559 = float2(_1726, _1235);
    float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5559, float2(0.0), isnan(_5559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5559, float2(0.0), isnan(_5559)), level(0.0)).x;
    float _1890 = _1838;
    if (!_1396)
    {
        float3 _5576 = float3(_1878, _1780, float(as_type<int>(_1838)));
        float3 _5580 = select(_5576, float3(0.0), isnan(_5576));
        float _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5580.xy, uint(rint(_5580.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5580.xy, uint(rint(_5580.z)), level(0.0)).x;
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = _1870;
    if (_1786)
    {
        float3 _5595 = float3(_1744, _1758, float(as_type<int>(_1870)));
        float3 _5597 = select(_5595, float3(0.0), isnan(_5595));
        float _1898 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5597.xy, uint(rint(_5597.z)), _1856, level(0.0));
        _1896 = _1898;
    }
    float _1900 = _1896;
    float3 _5607 = float3(_1882, _1884, _1880);
    float _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5607, float3(0.0), isnan(_5607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5607, float3(0.0), isnan(_5607)), level(0.0)).x;
    float3 _5616 = float3(_1882, _1884, _1880);
    float4 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5616, float3(0.0), isnan(_5616)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5616, float3(0.0), isnan(_5616)), level(0.0)).xyzw;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = _1905.w;
    float2 _5632 = float2(_1850, _1886);
    float3 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5632, float2(0.0), isnan(_5632)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5632, float2(0.0), isnan(_5632)), level(0.0)).xyz;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = abs(_1245);
    float _1927 = log2(_1925);
    float _1929 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1939 = _1935 || _1937;
    float _1941 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _1943 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1941);
    float _1945 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _1947 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1949 = _1945 + _1668;
    bool _1951 = _1245 <= 8000.0;
    bool _1953 = isnan(_1245);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(8000.0);
    bool _1959 = _1955 || _1957;
    float _1961 = float(_1959);
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1852;
    out.gl_Position.z = _1945;
    out.gl_Position.w = _1668;
    float _1963 = exp2(_1947);
    float _1965 = _1949 * 0.5;
    out.m_78.z = _1965;
    out.m_78.w = _1668;
    if (_1939)
    {
        _1860 = 1.0;
    }
    float _1967 = _1860;
    float _1969 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = fma(_1971, -2.0, 3.0);
    float _1975 = _1971 * _1971;
    float _1977 = _1975 * _1973;
    float _1979 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1981 = -_1977;
    float _1983 = _1981 + 1.0;
    float _1985 = exp2(_1979);
    float _1987 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1977);
    float _1989 = _1961 * _1987;
    float _1991 = _1987;
    float _1993 = _1967;
    if (_1939)
    {
        _1991 = 1.0;
    }
    float _1995 = _1991;
    float _1997 = _1995;
    float _1999 = _1894;
    if (!_1939)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2007;
        float _2011 = _2003 * 6.283185482025146484375;
        float _2013 = cos(_2011);
        float _2015 = _2005 * 0.15915493667125701904296875;
        float _2017 = _2003 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        float _2021 = 1.0 / _2013;
        float _2023 = _2015 * 6.283185482025146484375;
        float _2025 = cos(_2023);
        float _2027 = _2019 * _2021;
        float _2029 = _2015 * 6.283185482025146484375;
        float _2031 = sin(_2029);
        float _2033 = _2025 * _2027;
        float _2035 = 1.0 / _2009;
        float _2037 = 1.0 / _2033;
        float _2039 = _2031 * _2037;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2043 = fma(_1245, _2039, _2041);
        float _2045 = _2043 * _2035;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        _1694 = _2021;
        _1828 = _2043;
        _1993 = _2047;
    }
    float _2049 = _1694;
    float _2051 = _1828;
    float _2053 = _1993;
    float _2055 = _2049;
    float _2057 = _2051;
    if (!_1939)
    {
        float _2059 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = _2061 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2063 * 0.15915493667125701904296875;
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = 1.0 / _2067;
        float _2077 = _2069 * 6.283185482025146484375;
        float _2079 = cos(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = _2069 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = 1.0 / _2087;
        float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2093 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2091;
        float _2095 = 1.0 / _2093;
        float _2097 = _2085 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_1245, _2097, _2099);
        float _2103 = _2101 * _2095;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2055 = _2085;
        _2057 = _2095;
        _1997 = _2109;
    }
    float _2111 = _2055;
    float _2113 = _2057;
    float _2115 = _1997;
    float _2117 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2119 = -_1888;
    float _2121 = _2119 + 1.0;
    float _2123 = -_1985;
    float _2125 = _2123 + 1.0;
    float _2127 = _2111;
    float _2129 = _2113;
    if (!_1786)
    {
        _2127 = 1.0;
    }
    float _2131 = _2127;
    float _2133 = _2121 * _2117;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = _2131;
    if (_1786)
    {
        bool _2139 = _1900 >= _1856;
        bool _2141 = isnan(_1900);
        bool _2143 = _2139 || _2141;
        bool _2145 = isnan(_1856);
        bool _2147 = _2143 || _2145;
        float _2149 = float(_2147);
        _2137 = _2149;
    }
    float _2151 = _2137;
    float _2153 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2155 = _2151;
    if (_1396)
    {
        _2129 = 1.0;
    }
    float _2157 = _2129;
    float _2159 = _2157;
    if (!_1396)
    {
        int _2161 = _1430 << 4;
        int _2163 = _2161 + 2048;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.vp_c15)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        float _2199 = _1219 * _2179;
        float _2201 = fma(_575, _2171, _2199);
        float _2203 = fma(_569, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1894;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2159 = _2219;
    }
    float _2221 = _2159;
    float _2223 = _2151 * _2221;
    float _2225 = _2153 * _1902;
    float _2227 = -_2135;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = -_2153;
    float _2233 = _2231 + 1.0;
    bool _2235 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2237 = isnan(_1199);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2243 = _2239 || _2241;
    float _2245 = _1913 * _2225;
    float _2247 = -_2223;
    float _2249 = fma(_2247, _2229, 1.0);
    float _2251 = precise::clamp(_2249, 0.0, 1.0);
    float _2253 = _1923 * _2225;
    float _2255 = _1913 * _2233;
    float _2257 = fma(_1919, _2245, _1907);
    float _2259 = fma(_1921, _2245, _1909);
    float _2261 = _2251 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2263 = fma(_1913, _2253, _1911);
    float _2265 = _2053 * _2115;
    out.m_80.x = _2261;
    float _2267 = _2233;
    float _2269 = _2251;
    float _2271 = _2245;
    if (!_2243)
    {
        _717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _717;
    float _2275 = _2265 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2243)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2281 = _2155;
    out.m_82.x = _2257;
    out.m_82.y = _2259;
    out.m_82.z = _2263;
    out.m_82.w = _2255;
    float _2283 = _2281;
    float _2285 = _2281;
    if (!_2243)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2287 = _1999;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2243)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2293 = _2267;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2243)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2299 = _2269;
    float _2301 = _2299;
    float _2303 = _2299;
    if (!_2243)
    {
        _2271 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2305 = _2271;
    bool _2307 = !_2243;
    float _2309 = _2305;
    float _2311 = _2305;
    if (!_2307)
    {
        bool _2313 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2315 = isnan(_1199);
        bool _2317 = _2313 || _2315;
        bool _2319 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2321 = _2317 || _2319;
        if (!_2321)
        {
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2325 = _1199 + _2323;
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2329 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2327;
            float _2331 = 1.0 / _2329;
            float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2349 = _2325 * _2331;
            float _2351 = precise::clamp(_2349, 0.0, 1.0);
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2361 = fma(_2351, _2335, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2363 = fma(_2351, _2355, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2365 = fma(_2351, _2359, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2367 = fma(_2351, _2339, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2369 = fma(_2351, _2343, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2371 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2285 = _2365;
            _2303 = _2369;
            _2279 = _2363;
            _2297 = _2367;
            _2291 = _2361;
            _2311 = _2371;
            _2373 = true;
        }
        else
        {
            bool _2375 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2377 = isnan(_1199);
            bool _2379 = _2375 || _2377;
            bool _2381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2383 = _2379 || _2381;
            if (!_2383)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2385 = _2277;
            _2279 = _2385;
            if (!_2383)
            {
                _2283 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2387 = _2283;
            _2285 = _2387;
            if (!_2383)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2389 = _2289;
            _2291 = _2389;
            if (!_2383)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2391 = _2295;
            _2297 = _2391;
            if (!_2383)
            {
                _2301 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2393 = _2301;
            _2303 = _2393;
            if (!_2383)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2395 = _2309;
            bool _2397 = !_2383;
            _2311 = _2395;
            if (!_2397)
            {
                bool _2399 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2401 = isnan(_1199);
                bool _2403 = _2399 || _2401;
                bool _2405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2407 = _2403 || _2405;
                if (!_2407)
                {
                    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2411 = _1199 + _2409;
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2415 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2413;
                    float _2417 = 1.0 / _2415;
                    float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2435 = _2411 * _2417;
                    float _2437 = precise::clamp(_2435, 0.0, 1.0);
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2447 = fma(_2437, _2421, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2449 = fma(_2437, _2441, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2451 = fma(_2437, _2445, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2453 = fma(_2437, _2425, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2455 = fma(_2437, _2429, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2457 = fma(_2437, _2433, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2285 = _2451;
                    _2303 = _2455;
                    _2279 = _2449;
                    _2297 = _2453;
                    _2291 = _2447;
                    _2311 = _2457;
                    _2373 = true;
                }
                else
                {
                    _2285 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2303 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2373 = false;
    float _2459 = _2285;
    float _2461 = _2303;
    float _2463 = _2279;
    float _2465 = _2297;
    float _2467 = _2291;
    float _2469 = _2311;
    float _2471 = fma(_847, -0.5, 0.5);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = -_2459;
    float _2477 = _2475 + _2461;
    float _2479 = _2275 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2481 = -_2463;
    float _2483 = _2481 + _2465;
    float _2485 = fma(_2473, _2477, _2459);
    out.m_84.x = 0.0;
    float _2487 = -_2467;
    float _2489 = _2487 + _2469;
    float _2491 = fma(_2473, _2483, _2463);
    float _2493 = _2485 * 0.586610972881317138671875;
    out.m_59.x = _2479;
    bool _2495 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2497 = fma(_2473, _2489, _2467);
    float _2499 = fma(_2491, 0.298911988735198974609375, _2493);
    bool _2501 = _2053 > 0.0;
    bool _2503 = isnan(_2053);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    float _2511 = fma(_2497, 0.114477999508380889892578125, _2499);
    bool _2513 = _2115 <= 0.0;
    bool _2515 = !_2509;
    bool _2517 = _2513 || _2515;
    float _2519 = -_2511;
    float _2521 = _2491 + _2519;
    float _2523 = -_2511;
    float _2525 = _2485 + _2523;
    float _2527 = -_2511;
    float _2529 = _2497 + _2527;
    float _2531 = fma(_2521, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    float _2533 = fma(_2525, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    float _2535 = fma(_2529, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    bool _2537 = !_2495;
    if (!_2537)
    {
        float _2539 = -_1147;
        float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2543 = -_1149;
        float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2547 = -_1151;
        float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2551 = _2541 * _2541;
        float _2553 = fma(_2545, _2545, _2551);
        float _2555 = fma(_2549, _2549, _2553);
        float _2557 = sqrt(_2555);
        float _2559 = rsqrt(_2555);
        float _2561 = -_2557;
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2567 = precise::clamp(_2565, 0.0, 1.0);
        float _2569 = _2545 * _2559;
        float _2571 = _2541 * _2559;
        float _2573 = abs(_2567);
        float _2575 = log2(_2573);
        float _2577 = _2549 * _2559;
        float _2579 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2581 = _847 * _2571;
        float _2583 = -_2571;
        float _2585 = -_2579;
        float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2585);
        float _2589 = fma(_845, _2569, _2581);
        float _2591 = -_2577;
        float _2593 = fma(_2591, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2587);
        float _2595 = fma(_849, _2577, _2589);
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2601 = _2593 + _2599;
        float _2603 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2605 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2607 = precise::clamp(_2605, 0.0, 1.0);
        float _2609 = exp2(_2603);
        float _2611 = _2609 * _2607;
        float _2613 = _2597 * _2611;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2617 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2619 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2615;
        out.m_84.y = _2617;
        out.m_84.z = _2619;
    }
    out.m_86.x = _2531;
    out.m_86.y = _2533;
    out.m_86.z = _2535;
    if (!_2517)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2621 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2621;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_56.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_59.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_123);
        out.gl_Position.z = _2680;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_61.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_105);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _113;
    if (_153)
    {
        out.m_59.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2749 = as_type<float>(_159);
        out.gl_Position.z = _2749;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_63.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = in.m_63.z;
    float _185 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _187 = _185 * _163;
    float _189 = 0.0;
    float _191 = _165;
    if (!_177)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = 0.0;
    float _201 = _197;
    if (!_177)
    {
        float _203 = _141 * _141;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_177)
    {
        float _211 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _211;
    }
    float _213 = _201;
    bool _215 = !_177;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _165 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _165);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_177;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _165 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _191 = _271;
    }
    float _273 = _191;
    float _275 = 0.0;
    if (!_177)
    {
        _275 = _141;
    }
    float _277 = _275;
    float _279 = _277;
    if (!_177)
    {
        float _281 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _281;
    }
    float _283 = _209;
    bool _285 = !_177;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _141 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _141);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    bool _321 = !_177;
    if (!_321)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _141 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _279 = _341;
    }
    float _343 = _279;
    float _345 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _187);
    float _347 = in.m_63.y;
    int _349 = as_type<int>(_167) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>(_167) & 2;
    bool _355 = _353 != 0;
    float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _359 = _345 * 6.283185482025146484375;
    float _361 = in.m_63.w;
    float _363 = _359 * 0.15915493667125701904296875;
    float _365 = in.m_68.y;
    float _367 = floor(_345);
    bool _369 = !_355;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _381 = _379 != 0;
    float _383 = in.m_68.x;
    bool _385 = !_351;
    float _387 = _385 ? (-0.5) : 0.5;
    float _389 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _371);
    float _391 = _363 * 6.283185482025146484375;
    float _393 = cos(_391);
    bool _395 = _183 > 0.5;
    float _397 = in.m_68.w;
    float _399 = _357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _401 = !_381;
    int _403 = _401 ? 0 : 1;
    float _405 = _347 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _407 = _161 > 0.5;
    float _409 = -_367;
    float _411 = _345 + _409;
    bool _413 = !_181;
    int _415 = _413 ? 0 : 1;
    bool _417 = !_377;
    int _419 = _417 ? 0 : 1;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _427 = _425 != 0;
    float _429 = fma(_393, 0.5, 0.5);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _437 = _435 != 0;
    float _439 = -_411;
    float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _443 = -_387;
    int _445 = _407 ? as_type<int>(_443) : as_type<int>(_387);
    bool _447 = _411 < 0.5;
    float _449 = float(_447);
    int _451 = abs(_419);
    bool _453 = _347 > 0.5;
    float _455 = -_449;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = float(_451);
    float _461 = -_429;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _465 = -_371;
    int _467 = _453 ? as_type<int>(_465) : as_type<int>(_371);
    bool _469 = _361 > 0.5;
    float _471 = abs(_441);
    float _473 = _459 * _471;
    float _475 = in.m_61.x;
    float _477 = in.m_61.y;
    float _479 = in.m_61.z;
    int _481 = abs(_415);
    int _483 = abs(_403);
    float _485 = in.m_56.x;
    float _487 = in.m_56.y;
    float _489 = in.m_56.z;
    float _491 = float(_481);
    float _493 = _161 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _495 = fma(_491, _463, _473);
    float _497 = float(_483);
    float _499 = _365 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _505 = abs(_457);
    float _507 = fma(_497, _505, _495);
    float _509 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _511 = fma(_405, -2.0, _503);
    float _513 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _515 = _507 * _499;
    float _517 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _519 = _507 * _501;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _523 = fma(_273, _477, _513);
    float _525 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _527 = fma(_273, _475, _509);
    float _529 = fma(_273, _479, _517);
    float _531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _533 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _535 = fma(_523, _397, _487);
    float _537 = _525 * _389;
    float _539 = fma(_527, _397, _485);
    float _541 = _533 * _531;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _545 = _537 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _547 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[78].z, _521);
    float _549 = fma(_529, _397, _489);
    float _551 = _535 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _553 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
    float _555 = _537 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].x, _545);
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
    float _563 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].x, _555);
    float _565 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _557);
    float _567 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
    float _569 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _571 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _563);
    float _573 = _565 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _577 = _571 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _579 = _569 + _573;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _585 = _575 + _577;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _579 + _587;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _593 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _595 = _585 + _593;
    float _597 = _589 * _589;
    float _599 = _537 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _601 = fma(_595, _595, _597);
    float _603 = _535 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _605 = -_591;
    float _607 = fma(_493, 2.0, _605);
    float _609 = sqrt(_601);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _599);
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _621 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[5].x, _603);
    float _623 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = -_387;
    int _633 = _395 ? as_type<int>(_631) : as_type<int>(_387);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _641 = _609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _643 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[78].w, _619);
    float _645 = -_371;
    int _647 = _469 ? as_type<int>(_645) : as_type<int>(_371);
    float _649 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _653 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _625;
    out.m_70.y = _627;
    out.m_70.z = _629;
    out.m_70.w = _581;
    bool _659 = !_427;
    float _661 = _659 ? _371 : as_type<float>(_467);
    float _663 = _649 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _665 = _623 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_72.x = _653;
    out.m_72.y = _655;
    out.m_72.z = _657;
    out.m_72.w = _583;
    float _669 = -_141;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[76].x, _607);
    float _673 = _663 + _665;
    bool _675 = !_437;
    float _677 = _675 ? _371 : as_type<float>(_647);
    float _679 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _681 = !_423;
    float _683 = _681 ? _387 : as_type<float>(_445);
    bool _685 = !_433;
    float _687 = _685 ? _387 : as_type<float>(_633);
    float _689 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _691 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _693 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _695 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _697 = _683 + 0.5;
    float _699 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
    float _701 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _693);
    float _703 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
    float _705 = fma(_399, _697, _671);
    float _707 = _693;
    float _709 = _691;
    float _711 = _655;
    float _713 = _343;
    float _715 = _599;
    float _717 = _575;
    if (!_641)
    {
        _707 = _585;
    }
    float _719 = _707;
    float _721 = _719;
    if (!_641)
    {
        _709 = _579;
    }
    float _723 = _709;
    float _725 = _723;
    if (!_641)
    {
        _711 = _673;
    }
    float _727 = _711;
    bool _729 = !_641;
    float _731 = _727;
    if (!_729)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _735 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _737 = _609 + _735;
        float _739 = _673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = rsqrt(_601);
        float _743 = _737 * _733;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = cos(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = sin(_751);
        float _755 = _749 + (-1.0);
        float _757 = _755 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = fma(_753, _739, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _761 = fma(_673, _749, _757);
        float _763 = _741 * _759;
        float _765 = fma(_595, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _767 = fma(_589, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _731 = _761;
        _721 = _765;
        _725 = _767;
    }
    float _769 = _731;
    float _771 = _721;
    float _773 = _725;
    float _775 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _547);
    float _777 = -_663;
    float _779 = _777 + _769;
    float _781 = -_575;
    float _783 = _781 + _771;
    float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _787 = -_775;
    float _789 = _787 + 1.0;
    float _791 = _779 * _779;
    float _793 = _651 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _795 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _511);
    float _797 = _661 + (-0.5);
    float _799 = -_789;
    float _801 = fma(_683, _799, _705);
    float _803 = -_569;
    float _805 = _803 + _773;
    float _807 = fma(_783, _783, _791);
    float _809 = -_793;
    float _811 = -_795;
    float _813 = fma(_809, _797, _811);
    float _815 = _687 + 0.5;
    float _817 = -_677;
    float _819 = _817 + 0.5;
    float _821 = fma(_805, _805, _807);
    float _823 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _643);
    float _825 = _815 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _829 = sqrt(_821);
    float _831 = -_823;
    float _833 = _831 + 1.0;
    float _835 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _837 = _825 * _667;
    float _839 = _827 * _785;
    float _841 = fma(_661, _833, _813);
    float _843 = fma(_343, _477, _835);
    float _845 = _699 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _847 = _701 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _849 = _703 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _851 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _853 = -_843;
    float _855 = _523 + _853;
    float _857 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    out.m_74.x = _845;
    out.m_74.y = _847;
    out.m_74.z = _849;
    float _859 = fma(_343, _475, _851);
    bool _861 = _829 > 0.0;
    float _863 = _855 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _855 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _867 = fma(_343, _479, _857);
    float _869 = -_859;
    float _871 = _527 + _869;
    float _873 = _855 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_76.x = _801;
    out.m_76.y = _841;
    out.m_76.z = _837;
    out.m_76.w = _839;
    float _875 = -_867;
    float _877 = _529 + _875;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[5].x, _865);
    float _883 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[6].x, _873);
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[6].z, _883);
    float _887 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[4].z, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c10)._m0[5].z, _881);
    float _891 = _839;
    float _893 = _837;
    float _895 = _871;
    float _897 = _883;
    float _899 = _889;
    float _901 = _887;
    float _903 = _885;
    float _905 = _773;
    float _907 = _871;
    if (!_861)
    {
        _891 = _771;
    }
    float _909 = _891;
    float _911 = _909;
    float _913 = _909;
    float _915 = _909;
    if (!_861)
    {
        _893 = _769;
    }
    float _917 = _893;
    bool _919 = !_861;
    float _921 = _917;
    float _923 = _917;
    float _925 = _917;
    if (!_919)
    {
        bool _927 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _929 = _343;
        if (_927)
        {
            float _931 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _929 = _931;
        }
        float _933 = _929;
        float _935 = _933;
        if (_927)
        {
            float _937 = _887 * _933;
            _895 = _937;
        }
        float _939 = _895;
        float _941 = _939;
        if (_927)
        {
            float _943 = _889 * _933;
            _897 = _943;
        }
        float _945 = _897;
        float _947 = _945;
        if (_927)
        {
            float _949 = _885 * _933;
            _935 = _949;
        }
        float _951 = _935;
        float _953 = _951;
        if (!_927)
        {
            float _955 = _141 + 1.0;
            float _957 = _955;
            if (!_177)
            {
                float _959 = _955 * _955;
                float _961 = _959 * 0.5;
                _143 = _961;
            }
            float _963 = _143;
            float _965 = _963;
            if (!_177)
            {
                float _967 = _963 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _965 = _967;
            }
            float _969 = _965;
            bool _971 = !_177;
            float _973 = _969;
            if (!_971)
            {
                float _975 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _977 = log2(_975);
                float _979 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _981 = _979 + 1.0;
                float _983 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _985 = _977 * _955;
                float _987 = 1.0 / _981;
                float _989 = _983 * 0.693147182464599609375;
                float _991 = exp2(_985);
                float _993 = 1.0 / _989;
                float _995 = _991 + (-1.0);
                float _997 = -_995;
                float _999 = fma(_997, _993, _955);
                float _1001 = _999 * _987;
                float _1003 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _973 = _1003;
                _921 = _981;
                _911 = _987;
            }
            float _1005 = _973;
            float _1007 = _921;
            float _1009 = _911;
            float _1011 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1015 = !_177;
            float _1017 = _1007;
            _913 = _1009;
            if (!_1015)
            {
                float _1019 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1021 = log2(_1019);
                float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1025 = _1023 + 1.0;
                float _1027 = 1.0 / _1025;
                float _1029 = _1021 * _955;
                float _1031 = exp2(_1029);
                float _1033 = -_1031;
                float _1035 = _1033 + 1.0;
                float _1037 = _1035 * _1027;
                _957 = _1037;
                _1017 = _1029;
            }
            float _1039 = _957;
            float _1041 = _1017;
            float _1043 = fma(_1039, _477, _1013);
            float _1045 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1047 = fma(_1039, _475, _1011);
            float _1049 = -_843;
            float _1051 = _1049 + _1043;
            float _1053 = fma(_1039, _479, _1045);
            float _1055 = -_859;
            float _1057 = _1055 + _1047;
            float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1061 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1063 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1065 = -_867;
            float _1067 = _1065 + _1053;
            float _1069 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1059);
            float _1071 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1061);
            float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1063);
            float _1075 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1069);
            float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1071);
            float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
            _899 = _1077;
            _901 = _1075;
            _903 = _1079;
            _941 = _1075;
            _947 = _1077;
            _953 = _1079;
            _923 = _1041;
        }
        float _1081 = _899;
        float _1083 = _901;
        float _1085 = _903;
        float _1087 = _941;
        float _1089 = _947;
        float _1091 = _953;
        float _1093 = _923;
        float _1095 = _913;
        float _1097 = _1081 * _1081;
        float _1099 = rsqrt(_821);
        float _1101 = fma(_1083, _1083, _1097);
        float _1103 = fma(_1085, _1085, _1101);
        float _1105 = sqrt(_1103);
        float _1107 = _783 * _1099;
        float _1109 = _779 * _1099;
        float _1111 = _805 * _1099;
        bool _1113 = _1105 > 0.0;
        float _1115 = _1095;
        float _1117 = _1093;
        _713 = _1091;
        _907 = _1087;
        if (!_1113)
        {
            _1115 = _771;
        }
        float _1119 = _1115;
        _915 = _1119;
        if (!_1113)
        {
            _1117 = _769;
        }
        float _1121 = _1117;
        bool _1123 = !_1113;
        _925 = _1121;
        if (!_1123)
        {
            float _1125 = rsqrt(_1103);
            float _1127 = _1125 * _1081;
            float _1129 = _1125 * _1083;
            float _1131 = _1125 * _1085;
            float _1133 = _1109 * _1127;
            float _1135 = fma(_1107, _1129, _1133);
            float _1137 = fma(_1111, _1131, _1135);
            float _1139 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1141 = fma(_1087, _1139, _771);
            float _1143 = fma(_1089, _1139, _769);
            float _1145 = fma(_1091, _1139, _773);
            _925 = _1143;
            _915 = _1141;
            _905 = _1145;
        }
    }
    float _1147 = _925;
    float _1149 = _915;
    float _1151 = _905;
    float _1153 = _713;
    float _1155 = _907;
    float _1157 = _663 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1161 = _1147 + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1165 = _1149 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1169 = _1151 + _1167;
    float _1171 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1157);
    float _1173 = _1161 * _1161;
    float _1175 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1171);
    float _1177 = fma(_1165, _1165, _1173);
    float _1179 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1181 = _663 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1183 = fma(_1169, _1169, _1177);
    float _1185 = 1.0 / _1179;
    float _1187 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1181);
    float _1189 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1191 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1187);
    float _1193 = rsqrt(_1183);
    float _1195 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = _1195 + _1179;
    float _1199 = sqrt(_1183);
    float _1201 = _1197 * _1185;
    float _1203 = _1201 * 0.5;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1207 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1205);
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1211 = floor(_1189);
    float _1213 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1215 = _1165 * _1209;
    float _1217 = _1169 * _1209;
    float _1219 = _663 + _1213;
    float _1221 = _1215 * _1215;
    float _1223 = 1.0 / _1207;
    float _1225 = _1217 * _1217;
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1229 = _1221 + _1225;
    float _1231 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1227);
    float _1233 = -_1211;
    float _1235 = _1189 + _1233;
    float _1237 = sqrt(_1229);
    float _1239 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1231);
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1245 = _1223 * _1243;
    float _1247 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1249 = trunc(_1241);
    int _1251 = int(_1249);
    bool _1253 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1255 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1247);
    bool _1257 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1259 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = fma(_569, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1255);
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1237 + _1263;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1269 = !_1253;
    int _1271 = _1269 ? 0 : 1;
    int _1273 = 2;
    float _1275 = _1265;
    float _1277 = _1155;
    float _1279 = _1161;
    float _1281 = _1215;
    float _1283 = _1217;
    float _1285 = _1221;
    if (!_1253)
    {
        _1273 = 1;
    }
    int _1287 = _1273;
    float _1289 = trunc(_1267);
    int _1291 = int(_1289);
    int _1293 = _1287;
    if (!_1257)
    {
        _1293 = _1271;
    }
    int _1295 = _1293;
    int _1297 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1299 = _1251 + _1297;
    int _1301 = _1299 + 1;
    int _1303 = _1295 << 6;
    float _1305 = as_type<float>(_1295);
    if (!_1259)
    {
        _715 = _1225;
    }
    float _1307 = _715;
    float _1309 = _1153;
    float _1311 = _1307;
    if (_1259)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1313;
    }
    float _1315 = _1309;
    int _1317 = _1303 + 96;
    uint _1320 = uint(int(uint(_1317) >> uint(2)));
    uint _1322 = uint(int(uint(int(_1320)) >> uint(2)));
    int _1324 = int(_1320) & 3;
    float _1326 = (*spvDescriptorSet0.vp_c15)._m0[int(_1322)][_1324];
    int _1328 = int(_1320) + 1;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    int _1332 = _1328 & 3;
    float _1334 = (*spvDescriptorSet0.vp_c15)._m0[int(_1330)][_1332];
    int _1336 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1338 = _1291 + _1336;
    int _1340 = _1338 + 1;
    float _1342 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1344 = _1303 + 104;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[int(_1356)][_1358];
    bool _1362 = _1340 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1364 = _1340 | _1301;
    int _1366 = _1340;
    if (_1259)
    {
        float _1368 = _1265 * _1315;
        _1275 = _1368;
    }
    float _1370 = _1275;
    bool _1372 = _1364 < 0;
    bool _1374 = _1372 || _1362;
    float _1376 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1342);
    if (_1259)
    {
        float _1378 = _1370 * 0.15915493667125701904296875;
        _1277 = _1378;
    }
    float _1380 = _1277;
    float _1382 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1376);
    float _1384 = _783;
    float _1386 = _1382;
    if (_1259)
    {
        float _1388 = _1380 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    bool _1394 = _1301 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1396 = _1394 || _1374;
    float _1398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1400 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1402 = precise::max(0.0, _1398);
    if (_1259)
    {
        float _1404 = rsqrt(_1229);
        _1386 = _1404;
    }
    float _1406 = _1386;
    float _1408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1412 = -_1209;
    float _1414 = -_1402;
    float _1416 = fma(_1161, _1412, _1414);
    float _1418 = -_1410;
    float _1420 = fma(_1418, _1408, 1.0);
    float _1422 = _1406;
    float _1424 = _1416;
    if (!_1396)
    {
        int _1426 = _1301 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1428 = _1426 + _1340;
        _1366 = _1428;
    }
    int _1430 = _1366;
    float _1432 = _1315;
    if (_1259)
    {
        float _1434 = _1380 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        _1432 = _1436;
    }
    float _1438 = _1432;
    int _1440 = 0;
    if (!_1396)
    {
        int _1442 = _1430 << 2;
        _1440 = _1442;
    }
    int _1444 = _1440;
    int _1446 = 0;
    int _1448 = _1444;
    if (!_1396)
    {
        uint _1450 = uint(int(uint(_1430) >> uint(2)));
        _1446 = int(_1450);
    }
    int _1452 = _1446;
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1456 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1454);
    float _1458 = precise::clamp(_1456, 0.0, 1.0);
    if (!_1396)
    {
        int _1460 = 12 & _1444;
        _1448 = _1460;
    }
    int _1462 = _1448;
    float _1464 = _1219 * _1334;
    float _1466 = _1334;
    float _1468 = _1464;
    if (_1259)
    {
        float _1470 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = -_1458;
    float _1476 = _1474 + 1.0;
    float _1478 = log2(_1420);
    float _1480 = fma(_575, _1326, _1464);
    float _1482 = _1392;
    if (_1259)
    {
        float _1484 = fma(_1392, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1259)
    {
        float _1488 = _1438 + (-1.0);
        _1279 = _1488;
    }
    float _1490 = _1279;
    if (_1259)
    {
        float _1492 = _1406 * _1486;
        _1422 = _1492;
    }
    float _1494 = _1422;
    float _1496 = fma(_569, _1352, _1480);
    if (_1259)
    {
        float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1498;
    }
    float _1500 = _1468;
    int _1502 = _1303 + 56;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.vp_c15)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    if (_1259)
    {
        float _1520 = _1215 * _1494;
        _1281 = _1520;
    }
    float _1522 = _1281;
    if (_1259)
    {
        float _1524 = _1217 * _1494;
        _1283 = _1524;
    }
    float _1526 = _1283;
    if (_1259)
    {
        float _1528 = fma(_1416, _1438, _1500);
        _1424 = _1528;
    }
    float _1530 = _1424;
    float _1532 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1259)
    {
        float _1534 = _1522 * _1522;
        _1285 = _1534;
    }
    float _1536 = _1285;
    if (_1259)
    {
        float _1538 = _1526 * _1526;
        _1311 = _1538;
    }
    float _1540 = _1311;
    int _1542 = _1303 + 48;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = fma(_575, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1562 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1532);
    float _1566 = fma(_1530, _1530, _1536);
    float _1568 = _1496 + _1360;
    float _1570 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1572 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1564);
    int _1574 = _1303 + 64;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
    float _1592 = _1566 + _1540;
    float _1594 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1596 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1570);
    float _1598 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1600 = 1.0 / _1568;
    float _1602 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1594);
    float _1604 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _1606 = _1303 + 72;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    int _1616 = int(_1608) + 1;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    int _1620 = _1616 & 3;
    float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
    float _1624 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1626 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1602);
    float _1628 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1624);
    float _1630 = rsqrt(_1592);
    float _1632 = _1624;
    float _1634 = _1560;
    if (!_1396)
    {
        int _1636 = _1452 << 4;
        int _1638 = _1636 + _1462;
        _1632 = as_type<float>(_1638);
    }
    float _1640 = _1632;
    int _1642 = _1303 + 80;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
    float _1660 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1662 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1628);
    float _1664 = abs(_1476);
    float _1666 = log2(_1664);
    float _1668 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1662);
    int _1670 = _1303 + 88;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    float _1688 = _1630 * _1522;
    float _1690 = _1630 * _1530;
    float _1692 = _1640;
    float _1694 = _1668;
    if (!_1396)
    {
        int _1696 = as_type<int>(_1640) + 400;
        uint _1698 = uint(int(uint(_1696) >> uint(2)));
        uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
        int _1702 = int(_1698) & 3;
        float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
        _1692 = _1704;
    }
    float _1706 = _1692;
    float _1708 = _1630 * _1526;
    float _1710 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = floor(_1560);
    float _1714 = _1219 * _1558;
    float _1716 = 1.0 / _1668;
    float _1718 = fma(_575, _1550, _1714);
    float _1720 = _1219 * _1590;
    float _1722 = fma(_569, _1510, _1718);
    float _1724 = -_1712;
    float _1726 = _1560 + _1724;
    float _1728 = fma(_575, _1582, _1720);
    float _1730 = _1722 + _1518;
    float _1732 = -_1710;
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1732);
    float _1736 = _1518;
    if (!_1396)
    {
        float _1738 = floor(_1241);
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_569, _1614, _1728);
    float _1744 = _1730 * _1600;
    float _1746 = -_1708;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1734);
    float _1750 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1752 = _1742 + _1622;
    bool _1754 = _1744 >= 0.0;
    float _1756 = fma(_1748, -0.5, 0.5);
    float _1758 = _1752 * _1600;
    float _1760 = _1219 * _1658;
    bool _1762 = _1744 <= 1.0;
    bool _1764 = _1762 && _1754;
    float _1766 = exp2(_1750);
    float _1768 = fma(_575, _1650, _1760);
    bool _1770 = _1758 >= 0.0;
    bool _1772 = _1770 && _1764;
    float _1774 = fma(_1748, 0.5, 0.5);
    if (!_1396)
    {
        float _1776 = -_1740;
        float _1778 = _1241 + _1776;
        _1634 = _1778;
    }
    float _1780 = _1634;
    float _1782 = fma(_569, _1678, _1768);
    bool _1784 = _1758 <= 1.0;
    bool _1786 = _1784 && _1772;
    float _1788 = sqrt(_1756);
    float _1790 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = _1782 + _1686;
    float _1794 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1796 = fma(_1774, _1790, -0.212114393711090087890625);
    float _1798 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1800 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1794);
    float _1802 = _1748;
    float _1804 = _1796;
    if (!_1396)
    {
        float _1806 = floor(_1267);
        _1802 = _1806;
    }
    float _1808 = _1802;
    float _1810 = fma(_1774, _1796, 1.570728778839111328125);
    float _1812 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1798);
    float _1814 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1800);
    if (_1786)
    {
        float _1816 = float(_1295);
        _1305 = _1816;
    }
    float _1818 = _1305;
    float _1820 = _1690 + 1.0;
    float _1822 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1814);
    float _1824 = _1788 * 0.636619746685028076171875;
    float _1826 = _1678;
    float _1828 = _1822;
    if (!_1396)
    {
        float _1830 = rint(_1706);
        float _1832 = precise::max(_1830, 0.0);
        uint _1834 = uint(_1832);
        uint _1836 = clamp(_1834, 0u, 65535u);
        _1826 = as_type<float>(_1836);
    }
    float _1838 = _1826;
    float _1840 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1812);
    float _1842 = -_1690;
    float _1844 = fma(_1766, _1820, _1842);
    float _1846 = _1822 * _1716;
    float _1848 = -_1810;
    float _1850 = fma(_1824, _1848, 1.0);
    float _1852 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1840);
    float _1854 = _1478 * 0.693147182464599609375;
    float _1856 = _1792 * _1600;
    float _1858 = _1812;
    float _1860 = _1852;
    if (_1786)
    {
        float _1862 = rint(_1818);
        float _1864 = precise::max(_1862, 0.0);
        uint _1866 = uint(_1864);
        uint _1868 = clamp(_1866, 0u, 65535u);
        _1858 = as_type<float>(_1868);
    }
    float _1870 = _1858;
    float _1872 = _1852 * _1716;
    if (!_1396)
    {
        float _1874 = -_1808;
        float _1876 = _1267 + _1874;
        _1804 = _1876;
    }
    float _1878 = _1804;
    float _1880 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1882 = fma(_1846, 0.5, 0.5);
    float _1884 = fma(_1872, -0.5, 0.5);
    float _1886 = fma(_1844, 0.5, 0.5);
    float2 _5559 = float2(_1726, _1235);
    float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5559, float2(0.0), isnan(_5559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5559, float2(0.0), isnan(_5559)), level(0.0)).x;
    float _1890 = _1838;
    if (!_1396)
    {
        float3 _5576 = float3(_1878, _1780, float(as_type<int>(_1838)));
        float3 _5580 = select(_5576, float3(0.0), isnan(_5576));
        float _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5580.xy, uint(rint(_5580.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5580.xy, uint(rint(_5580.z)), level(0.0)).x;
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = _1870;
    if (_1786)
    {
        float3 _5595 = float3(_1744, _1758, float(as_type<int>(_1870)));
        float3 _5597 = select(_5595, float3(0.0), isnan(_5595));
        float _1898 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5597.xy, uint(rint(_5597.z)), _1856, level(0.0));
        _1896 = _1898;
    }
    float _1900 = _1896;
    float3 _5607 = float3(_1882, _1884, _1880);
    float _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5607, float3(0.0), isnan(_5607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5607, float3(0.0), isnan(_5607)), level(0.0)).x;
    float3 _5616 = float3(_1882, _1884, _1880);
    float4 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5616, float3(0.0), isnan(_5616)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5616, float3(0.0), isnan(_5616)), level(0.0)).xyzw;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = _1905.w;
    float2 _5632 = float2(_1850, _1886);
    float3 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5632, float2(0.0), isnan(_5632)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5632, float2(0.0), isnan(_5632)), level(0.0)).xyz;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = abs(_1245);
    float _1927 = log2(_1925);
    float _1929 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1939 = _1935 || _1937;
    float _1941 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _1943 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1941);
    float _1945 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _1947 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1949 = _1945 + _1668;
    bool _1951 = _1245 <= 8000.0;
    bool _1953 = isnan(_1245);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(8000.0);
    bool _1959 = _1955 || _1957;
    float _1961 = float(_1959);
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1852;
    out.gl_Position.z = _1945;
    out.gl_Position.w = _1668;
    float _1963 = exp2(_1947);
    float _1965 = _1949 * 0.5;
    out.m_78.z = _1965;
    out.m_78.w = _1668;
    if (_1939)
    {
        _1860 = 1.0;
    }
    float _1967 = _1860;
    float _1969 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = fma(_1971, -2.0, 3.0);
    float _1975 = _1971 * _1971;
    float _1977 = _1975 * _1973;
    float _1979 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1981 = -_1977;
    float _1983 = _1981 + 1.0;
    float _1985 = exp2(_1979);
    float _1987 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1977);
    float _1989 = _1961 * _1987;
    float _1991 = _1987;
    float _1993 = _1967;
    if (_1939)
    {
        _1991 = 1.0;
    }
    float _1995 = _1991;
    float _1997 = _1995;
    float _1999 = _1894;
    if (!_1939)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2007;
        float _2011 = _2003 * 6.283185482025146484375;
        float _2013 = cos(_2011);
        float _2015 = _2005 * 0.15915493667125701904296875;
        float _2017 = _2003 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        float _2021 = 1.0 / _2013;
        float _2023 = _2015 * 6.283185482025146484375;
        float _2025 = cos(_2023);
        float _2027 = _2019 * _2021;
        float _2029 = _2015 * 6.283185482025146484375;
        float _2031 = sin(_2029);
        float _2033 = _2025 * _2027;
        float _2035 = 1.0 / _2009;
        float _2037 = 1.0 / _2033;
        float _2039 = _2031 * _2037;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2043 = fma(_1245, _2039, _2041);
        float _2045 = _2043 * _2035;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        _1694 = _2021;
        _1828 = _2043;
        _1993 = _2047;
    }
    float _2049 = _1694;
    float _2051 = _1828;
    float _2053 = _1993;
    float _2055 = _2049;
    float _2057 = _2051;
    if (!_1939)
    {
        float _2059 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = _2061 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2063 * 0.15915493667125701904296875;
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = 1.0 / _2067;
        float _2077 = _2069 * 6.283185482025146484375;
        float _2079 = cos(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = _2069 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = 1.0 / _2087;
        float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2093 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2091;
        float _2095 = 1.0 / _2093;
        float _2097 = _2085 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_1245, _2097, _2099);
        float _2103 = _2101 * _2095;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2055 = _2085;
        _2057 = _2095;
        _1997 = _2109;
    }
    float _2111 = _2055;
    float _2113 = _2057;
    float _2115 = _1997;
    float _2117 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2119 = -_1888;
    float _2121 = _2119 + 1.0;
    float _2123 = -_1985;
    float _2125 = _2123 + 1.0;
    float _2127 = _2111;
    float _2129 = _2113;
    if (!_1786)
    {
        _2127 = 1.0;
    }
    float _2131 = _2127;
    float _2133 = _2121 * _2117;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = _2131;
    if (_1786)
    {
        bool _2139 = _1900 >= _1856;
        bool _2141 = isnan(_1900);
        bool _2143 = _2139 || _2141;
        bool _2145 = isnan(_1856);
        bool _2147 = _2143 || _2145;
        float _2149 = float(_2147);
        _2137 = _2149;
    }
    float _2151 = _2137;
    float _2153 = _2125 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2155 = _2151;
    if (_1396)
    {
        _2129 = 1.0;
    }
    float _2157 = _2129;
    float _2159 = _2157;
    if (!_1396)
    {
        int _2161 = _1430 << 4;
        int _2163 = _2161 + 2048;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.vp_c15)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.vp_c15)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        float _2199 = _1219 * _2179;
        float _2201 = fma(_575, _2171, _2199);
        float _2203 = fma(_569, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1894;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2159 = _2219;
    }
    float _2221 = _2159;
    float _2223 = _2151 * _2221;
    float _2225 = _2153 * _1902;
    float _2227 = -_2135;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = -_2153;
    float _2233 = _2231 + 1.0;
    bool _2235 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2237 = isnan(_1199);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2243 = _2239 || _2241;
    float _2245 = _1913 * _2225;
    float _2247 = -_2223;
    float _2249 = fma(_2247, _2229, 1.0);
    float _2251 = precise::clamp(_2249, 0.0, 1.0);
    float _2253 = _1923 * _2225;
    float _2255 = _1913 * _2233;
    float _2257 = fma(_1919, _2245, _1907);
    float _2259 = fma(_1921, _2245, _1909);
    float _2261 = _2251 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2263 = fma(_1913, _2253, _1911);
    float _2265 = _2053 * _2115;
    out.m_80.x = _2261;
    float _2267 = _2233;
    float _2269 = _2251;
    float _2271 = _2245;
    if (!_2243)
    {
        _717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _717;
    float _2275 = _2265 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2243)
    {
        _2155 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2281 = _2155;
    out.m_82.x = _2257;
    out.m_82.y = _2259;
    out.m_82.z = _2263;
    out.m_82.w = _2255;
    float _2283 = _2281;
    float _2285 = _2281;
    if (!_2243)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2287 = _1999;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2243)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2293 = _2267;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2243)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2299 = _2269;
    float _2301 = _2299;
    float _2303 = _2299;
    if (!_2243)
    {
        _2271 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2305 = _2271;
    bool _2307 = !_2243;
    float _2309 = _2305;
    float _2311 = _2305;
    if (!_2307)
    {
        bool _2313 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2315 = isnan(_1199);
        bool _2317 = _2313 || _2315;
        bool _2319 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2321 = _2317 || _2319;
        if (!_2321)
        {
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2325 = _1199 + _2323;
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2329 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2327;
            float _2331 = 1.0 / _2329;
            float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2349 = _2325 * _2331;
            float _2351 = precise::clamp(_2349, 0.0, 1.0);
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2361 = fma(_2351, _2335, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2363 = fma(_2351, _2355, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2365 = fma(_2351, _2359, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2367 = fma(_2351, _2339, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2369 = fma(_2351, _2343, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2371 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2285 = _2365;
            _2303 = _2369;
            _2279 = _2363;
            _2297 = _2367;
            _2291 = _2361;
            _2311 = _2371;
            _2373 = true;
        }
        else
        {
            bool _2375 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2377 = isnan(_1199);
            bool _2379 = _2375 || _2377;
            bool _2381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2383 = _2379 || _2381;
            if (!_2383)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2385 = _2277;
            _2279 = _2385;
            if (!_2383)
            {
                _2283 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2387 = _2283;
            _2285 = _2387;
            if (!_2383)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2389 = _2289;
            _2291 = _2389;
            if (!_2383)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2391 = _2295;
            _2297 = _2391;
            if (!_2383)
            {
                _2301 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2393 = _2301;
            _2303 = _2393;
            if (!_2383)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2395 = _2309;
            bool _2397 = !_2383;
            _2311 = _2395;
            if (!_2397)
            {
                bool _2399 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2401 = isnan(_1199);
                bool _2403 = _2399 || _2401;
                bool _2405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2407 = _2403 || _2405;
                if (!_2407)
                {
                    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2411 = _1199 + _2409;
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2415 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2413;
                    float _2417 = 1.0 / _2415;
                    float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2435 = _2411 * _2417;
                    float _2437 = precise::clamp(_2435, 0.0, 1.0);
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2447 = fma(_2437, _2421, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2449 = fma(_2437, _2441, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2451 = fma(_2437, _2445, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2453 = fma(_2437, _2425, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2455 = fma(_2437, _2429, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2457 = fma(_2437, _2433, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2285 = _2451;
                    _2303 = _2455;
                    _2279 = _2449;
                    _2297 = _2453;
                    _2291 = _2447;
                    _2311 = _2457;
                    _2373 = true;
                }
                else
                {
                    _2285 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2303 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2373 = false;
    float _2459 = _2285;
    float _2461 = _2303;
    float _2463 = _2279;
    float _2465 = _2297;
    float _2467 = _2291;
    float _2469 = _2311;
    float _2471 = fma(_847, -0.5, 0.5);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = -_2459;
    float _2477 = _2475 + _2461;
    float _2479 = _2275 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2481 = -_2463;
    float _2483 = _2481 + _2465;
    float _2485 = fma(_2473, _2477, _2459);
    out.m_84.x = 0.0;
    float _2487 = -_2467;
    float _2489 = _2487 + _2469;
    float _2491 = fma(_2473, _2483, _2463);
    float _2493 = _2485 * 0.586610972881317138671875;
    out.m_59.x = _2479;
    bool _2495 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2497 = fma(_2473, _2489, _2467);
    float _2499 = fma(_2491, 0.298911988735198974609375, _2493);
    bool _2501 = _2053 > 0.0;
    bool _2503 = isnan(_2053);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    float _2511 = fma(_2497, 0.114477999508380889892578125, _2499);
    bool _2513 = _2115 <= 0.0;
    bool _2515 = !_2509;
    bool _2517 = _2513 || _2515;
    float _2519 = -_2511;
    float _2521 = _2491 + _2519;
    float _2523 = -_2511;
    float _2525 = _2485 + _2523;
    float _2527 = -_2511;
    float _2529 = _2497 + _2527;
    float _2531 = fma(_2521, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    float _2533 = fma(_2525, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    float _2535 = fma(_2529, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2511);
    bool _2537 = !_2495;
    if (!_2537)
    {
        float _2539 = -_1147;
        float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2543 = -_1149;
        float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2547 = -_1151;
        float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2551 = _2541 * _2541;
        float _2553 = fma(_2545, _2545, _2551);
        float _2555 = fma(_2549, _2549, _2553);
        float _2557 = sqrt(_2555);
        float _2559 = rsqrt(_2555);
        float _2561 = -_2557;
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2567 = precise::clamp(_2565, 0.0, 1.0);
        float _2569 = _2545 * _2559;
        float _2571 = _2541 * _2559;
        float _2573 = abs(_2567);
        float _2575 = log2(_2573);
        float _2577 = _2549 * _2559;
        float _2579 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2581 = _847 * _2571;
        float _2583 = -_2571;
        float _2585 = -_2579;
        float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2585);
        float _2589 = fma(_845, _2569, _2581);
        float _2591 = -_2577;
        float _2593 = fma(_2591, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2587);
        float _2595 = fma(_849, _2577, _2589);
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2601 = _2593 + _2599;
        float _2603 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2605 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2607 = precise::clamp(_2605, 0.0, 1.0);
        float _2609 = exp2(_2603);
        float _2611 = _2609 * _2607;
        float _2613 = _2597 * _2611;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2617 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2619 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2615;
        out.m_84.y = _2617;
        out.m_84.z = _2619;
    }
    out.m_86.x = _2531;
    out.m_86.y = _2533;
    out.m_86.z = _2535;
    if (!_2517)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2621 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2621;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

