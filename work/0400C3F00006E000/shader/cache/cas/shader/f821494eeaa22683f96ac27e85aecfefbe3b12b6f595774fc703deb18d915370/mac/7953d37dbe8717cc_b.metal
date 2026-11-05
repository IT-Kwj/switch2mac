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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_110 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_108 [[user(locn14)]];
    float4 m_104 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_90 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_76 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5449 = false;
    bool _741 = false;
    bool _597 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5759 = as_type<float>(_153);
        out.gl_Position.z = _5759;
    }
    if (!_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5822 = as_type<float>(_185);
        out.gl_Position.z = _5822;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = 1.0 / _279;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _305 = 1.0 / _283;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _271 + _307;
    float _311 = 1.0 / _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _309 * _293;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _291;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _271 + _333;
    float _337 = _315 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = _271 + _339;
    float _343 = 1.0 / _297;
    float _345 = _275 * _311;
    bool _347 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _349 = isnan(_271);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    bool _359 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _361 = isnan(_271);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _301;
    float _373 = _335 * _331;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _377 = _271 + _375;
    float _379 = -_329;
    float _381 = _379 + 1.0;
    float _383 = _357 * _381;
    float _385 = _341 * _343;
    bool _387 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _389 = isnan(_271);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_397;
    float _401 = _399 + 1.0;
    float _403 = _377 * _371;
    float _405 = -_357;
    float _407 = _405 + 1.0;
    bool _409 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _411 = isnan(_271);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _423 = isnan(_271);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = _397 * _407;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = _419 * _401;
    float _441 = -_419;
    float _443 = _441 + 1.0;
    bool _445 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_271);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = _369 * _443;
    float _467 = -_369;
    float _469 = _467 + 1.0;
    float _471 = -_455;
    float _473 = _471 + 1.0;
    float _475 = fma(_437, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = fma(_459, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = _455 * _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _485;
    float _489 = _431 * _473;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = fma(_483, _345, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _497 = fma(_487, _345, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _499 = _475 * _489;
    float _501 = _477 * _489;
    float _503 = -_431;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_463, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _513 = fma(_493, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _515 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _499);
    float _517 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _501);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_511, _479, _515);
    float _525 = fma(_513, _479, _517);
    float _527 = fma(_509, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _535;
    float _539 = fma(_495, _465, _523);
    float _541 = fma(_497, _465, _525);
    float _543 = fma(_533, _385, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _545 = fma(_537, _385, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _555 = fma(_527, _439, _539);
    float _557 = fma(_529, _439, _541);
    float _559 = fma(_549, _403, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _561 = fma(_553, _403, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _563 = fma(_543, _433, _555);
    float _565 = fma(_545, _433, _557);
    float _567 = fma(_559, _383, _563);
    float _569 = fma(_561, _383, _565);
    float _571 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].x, _567);
    float _573 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].y, _569);
    bool _575 = !_303;
    float _577 = _383;
    float _595;
    if (!_575)
    {
        float _579 = in.m_76.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        _595 = _179;
    }
    _597 = false;
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _677 = -_651;
    float _679 = _677 + 1.0;
    float _681 = _675 * _661;
    float _683 = _673 * _667;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _687 = _599 + _685;
    float _689 = _619 * _679;
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _693 = fma(_683, _687, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _695 = fma(_693, _689, _691);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[117].x, _695);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = in.m_78.x;
    float _715 = in.m_78.y;
    out.m_80.x = _705;
    out.m_80.y = _707;
    out.m_80.z = _711;
    out.m_80.w = _709;
    float _717 = _573 * _715;
    float _719 = _571 * _713;
    bool _721 = !_659;
    float _739;
    if (!_721)
    {
        float _723 = in.m_76.x;
        float _725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _727 = _723 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _731 = _729 * _725;
        float _733 = floor(_731);
        float _735 = -_733;
        float _737 = _731 + _735;
        _739 = _737;
        _741 = true;
    }
    else
    {
        _739 = _179;
    }
    _741 = false;
    float _743 = _739;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _747 = _743 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _755 = isnan(_743);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _773 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _775 = isnan(_743);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = 1.0 / _751;
    float _787 = -_763;
    float _789 = _787 + 1.0;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _791;
    bool _795 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _797 = isnan(_743);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _783 * _789;
    float _809 = -_783;
    float _811 = _809 + 1.0;
    bool _813 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _815 = 1.0 / _767;
    float _817 = _805 * _811;
    float _819 = -_805;
    float _821 = _819 + 1.0;
    float _823 = 1.0 / _771;
    float _825 = _793 * _785;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _831 = fma(_825, _747, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _833 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _835 = isnan(_743);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _829 * _815;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _853 = _743 + _851;
    float _855 = _831 * _817;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _859 = _743 + _857;
    float _861 = fma(_845, _853, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _863 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[131].x, _855);
    float _865 = _849 * _823;
    float _867 = -_843;
    float _869 = _867 + 1.0;
    float _871 = fma(_861, _807, _863);
    float _873 = fma(_865, _859, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _875 = _763 * _869;
    float _877 = fma(_873, _875, _871);
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[134].x, _877);
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _887;
    out.m_82.y = _889;
    out.m_82.z = _891;
    out.m_82.w = _893;
    bool _895 = !_813;
    if (!_895)
    {
        float _897 = in.m_76.x;
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _901 = _897 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _181 = _911;
    }
    float _913 = _181;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _917 = int(_915);
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _921 = _919 != 0;
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _925 = int(_923);
    float _927 = float(_917);
    float _929 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _931 = int(_929);
    if (_921)
    {
        _577 = 1.0;
    }
    float _933 = _577;
    int _935 = 0;
    float _937 = _933;
    if (_921)
    {
        _935 = 0;
    }
    int _939 = _935;
    float _941 = float(_925);
    float _943 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _945 = int(_943);
    float _947 = 1.0 / _927;
    float _949 = float(uint(_931));
    int _951 = ~_931;
    int _953 = _951 + 1;
    float _955 = 1.0 / _941;
    float _957 = float(uint(_945));
    float _959 = _947 * _135;
    float _961 = 1.0 / _949;
    float _963 = _947;
    float _965 = _941;
    int _967 = _939;
    if (_921)
    {
        float _969 = in.m_76.x;
        float _971 = in.m_76.y;
        _963 = _969;
        _965 = _971;
    }
    float _973 = _963;
    float _975 = _965;
    float _977 = _955 * _135;
    float _979 = 1.0 / _957;
    float _981 = trunc(_959);
    int _983 = int(_981);
    int _985 = as_type<int>(_961) + (-2);
    float _987 = trunc(_977);
    int _989 = int(_987);
    int _991 = as_type<int>(_979) + (-2);
    float _993 = _979;
    float _995 = _973;
    float _997 = _975;
    if (_921)
    {
        _993 = _973;
    }
    float _999 = _993;
    float _1001 = 0.0;
    float _1003 = _999;
    if (_921)
    {
        _1001 = _975;
    }
    float _1005 = _1001;
    float _1007 = 0.0;
    float _1009 = _1005;
    if (_921)
    {
        _1007 = _999;
    }
    float _1011 = _1007;
    float _1013 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1015 = int(_1013);
    float _1017 = float(uint(_983));
    float _1019 = as_type<float>(_985) * _1017;
    int _1021 = as_type<int>(_1017);
    float _1023 = _1011;
    if (_921)
    {
        _1021 = 0;
    }
    int _1025 = _1021;
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1029 = int(_1027);
    float _1031 = float(uint(_989));
    float _1033 = as_type<float>(_991) * _1031;
    float _1035 = _1031;
    int _1037 = _1025;
    if (_921)
    {
        _1035 = 1.0;
    }
    float _1039 = _1035;
    float _1041 = trunc(_1019);
    float _1043 = precise::max(_1041, 0.0);
    uint _1046 = uint(_1043);
    float _1048 = float(uint(_1015));
    float _1050 = 1.0 / _1048;
    float _1052 = float(_1029);
    float _1054 = trunc(_1033);
    float _1056 = precise::max(_1054, 0.0);
    uint _1058 = uint(_1056);
    float _1060 = 1.0 / _1052;
    float _1062 = _1052;
    float _1064 = _1039;
    if (_921)
    {
        _1062 = _999;
    }
    float _1066 = _1062;
    float _1068 = _1066;
    if (!_921)
    {
        float _1070 = in.m_76.x;
        float _1072 = in.m_76.y;
        float _1074 = in.m_76.z;
        float _1076 = _1070 * 3.1415927410125732421875;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1072 * 3.1415927410125732421875;
        float _1082 = _1080 * 0.15915493667125701904296875;
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        float _1088 = _1082 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        _937 = 5.839270114898681640625;
        _1068 = _1074;
        _1064 = 7.345489978790283203125;
        _995 = _1070;
        _1003 = _1072;
        _997 = _1072;
        _1009 = _1090;
        _1037 = 1;
        _967 = 2;
        _1023 = _1086;
    }
    float _1092 = _937;
    float _1094 = _1068;
    float _1096 = _1064;
    float _1098 = _995;
    float _1100 = _1003;
    float _1102 = _997;
    float _1104 = _1009;
    int _1106 = _1037;
    int _1108 = _967;
    float _1110 = _1023;
    int _1112 = _953 * int(_1046);
    int _1114 = _1112 + _983;
    float _1116 = in.m_76.z;
    float _1118 = in.m_76.w;
    int _1120 = ~_945;
    int _1122 = _1120 + 1;
    float _1124 = _1092 * _1094;
    float _1126 = _1096 * _1098;
    float _1128 = float(uint(_1114));
    float _1130 = _1060 * _135;
    int _1132 = _1122 * int(_1058);
    int _1134 = _1132 + _989;
    float _1136 = floor(_1126);
    float _1138 = _1096 * _1100;
    float _1140 = as_type<float>(_985) * _1128;
    float _1142 = float(_931);
    float _1144 = _1098 * 2.0;
    float _1146 = float(uint(_1134));
    float _1148 = in.m_74.w;
    float _1150 = float(_983);
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    float _1158 = as_type<float>(_991) * _1146;
    bool _1160 = _1150 >= _1142;
    bool _1162 = isnan(_1150);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan(_1142);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1174 = _913 + _1172;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1178 = _1176 != 0;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1182 = _913 + _1180;
    bool _1184 = _1102 > 0.5;
    float _1186 = trunc(_1130);
    int _1188 = int(_1186);
    bool _1190 = _1118 > 0.5;
    float _1192 = -_1136;
    float _1194 = _1126 + _1192;
    bool _1196 = _1116 > 0.5;
    float _1198 = in.m_72.w;
    int _1200 = as_type<int>(_1050) + (-2);
    float _1202 = _1102 + _1098;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1214 = _1212 != 0;
    float _1216 = trunc(_1158);
    float _1218 = precise::max(_1216, 0.0);
    uint _1220 = uint(_1218);
    int _1222 = int(_1046) + int(_1156);
    float _1224 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1226 = ~_945;
    int _1228 = _1226 + 1;
    int _1230 = ~_931;
    int _1232 = _1230 + 1;
    float _1234 = floor(_1124);
    float _1236 = float(uint(_1188));
    int _1238 = _1232 * _1222;
    int _1240 = _1238 + _983;
    int _1242 = int(_1190);
    int _1244 = _1196 ? 2 : 0;
    int _1246 = _1242 | _1244;
    int _1248 = _1178 ? 4 : 0;
    int _1250 = _1246 | _1248;
    int _1252 = _1206 ? 8 : 0;
    int _1254 = _1250 | _1252;
    int _1256 = _1210 ? 16 : 0;
    int _1258 = _1254 | _1256;
    int _1260 = _1214 ? 32 : 0;
    int _1262 = _1258 | _1260;
    int _1264 = _1184 ? 64 : 0;
    int _1266 = _1262 | _1264;
    int _1268 = _1266 & 64;
    bool _1270 = !_1178;
    int _1272 = _1270 ? 0 : 1;
    float _1274 = as_type<float>(_1200) * _1236;
    float _1276 = -_241;
    int _1278 = _1184 ? as_type<int>(_1276) : as_type<int>(_241);
    float _1280 = trunc(_1170);
    int _1282 = int(_1280);
    int _1284 = int(_1058) + int(_1220);
    bool _1286 = !_1210;
    float _1288 = _1286 ? _241 : as_type<float>(_1278);
    int _1290 = abs(_1272);
    int _1292 = ~_1015;
    int _1294 = _1292 + 1;
    float _1296 = floor(_1138);
    float _1298 = -_225;
    int _1300 = _1196 ? as_type<int>(_1298) : as_type<int>(_225);
    float _1302 = -_1234;
    float _1304 = _1124 + _1302;
    float _1306 = float(_945);
    bool _1308 = !_1214;
    float _1310 = _1308 ? _225 : as_type<float>(_1300);
    float _1312 = _1194 * _1142;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1324 = _1322 != 0;
    float _1326 = trunc(_1274);
    float _1328 = precise::max(_1326, 0.0);
    uint _1330 = uint(_1328);
    bool _1332 = uint(_1240) >= uint(_931);
    int _1334 = _1228 * _1284;
    int _1336 = _1334 + _989;
    float _1338 = float(_989);
    bool _1340 = !_1320;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = -_1296;
    float _1346 = _1138 + _1344;
    bool _1348 = !_1316;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = trunc(_1312);
    int _1354 = int(_1352);
    bool _1356 = uint(_1336) >= uint(_945);
    float _1358 = _1304 * _1306;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1332;
    int _1366 = _1364 ? 0 : (-1);
    bool _1368 = _1338 >= _1306;
    bool _1370 = isnan(_1338);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(_1306);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    int _1380 = _1294 * int(_1330);
    int _1382 = _1380 + _1188;
    bool _1384 = !_1324;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = trunc(_1358);
    int _1390 = int(_1388);
    bool _1392 = !_1362;
    int _1394 = _1392 ? 0 : 1;
    bool _1396 = !_1356;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1410 = _1408 != 0;
    int _1412 = _1354 * _1290;
    int _1414 = _1412 + _983;
    int _1416 = ~_1222;
    int _1418 = _1416 + _1366;
    int _1420 = _1418 + 1;
    float _1422 = trunc(_1378);
    int _1424 = int(_1422);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1428 = _1426 != 0;
    bool _1430 = !_1406;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _931 * _1420;
    int _1436 = _1434 + _983;
    bool _1438 = !_1428;
    int _1440 = _1438 ? 0 : 1;
    bool _1442 = _931 == 0;
    float _1444 = floor(_1144);
    bool _1446 = _1268 != 0;
    int _1448 = abs(_1440);
    float _1450 = float(uint(_1382));
    int _1452 = ~_1284;
    int _1454 = _1452 + _1398;
    int _1456 = _1454 + 1;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    bool _1462 = !_1442;
    int _1464 = _1462 ? _1436 : (-1);
    float _1466 = _175 * _135;
    float _1468 = as_type<float>(_1200) * _1450;
    bool _1470 = !_1402;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _945 * _1456;
    int _1476 = _1474 + _989;
    float _1478 = _1142 * _1466;
    bool _1480 = _945 == 0;
    float _1482 = _1306 * _1466;
    int _1484 = ~_1282;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = trunc(_1468);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = ~_1424;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    int _1502 = _1390 * _1448;
    int _1504 = _1502 + _989;
    bool _1506 = !_1480;
    int _1508 = _1506 ? _1476 : (-1);
    int _1510 = _1464 * _1488;
    int _1512 = _931 + (-1);
    float _1514 = _1460 * _135;
    int _1516 = _945 + (-1);
    float _1518 = trunc(_1478);
    int _1520 = int(_1518);
    int _1522 = _1508 * _1500;
    int _1524 = abs(_1342);
    int _1526 = _1282 * _1512;
    int _1528 = _1526 + _1510;
    int _1530 = abs(_1432);
    int _1532 = _1424 * _1516;
    int _1534 = _1532 + _1522;
    int _1536 = abs(_1386);
    int _1538 = _1528 * _1524;
    float _1540 = trunc(_1482);
    int _1542 = int(_1540);
    int _1544 = abs(_1350);
    int _1546 = ~_1015;
    int _1548 = _1546 + 1;
    int _1550 = _1534 * _1530;
    int _1552 = int(_1330) + int(_1494);
    int _1554 = _1520 * _1544;
    int _1556 = _1554 + _1538;
    int _1558 = abs(_1394);
    int _1560 = abs(_1472);
    int _1562 = _1414 * _1536;
    int _1564 = _1562 + _1556;
    float _1566 = -_225;
    int _1568 = _1190 ? as_type<int>(_1566) : as_type<int>(_225);
    int _1570 = _1548 * _1552;
    int _1572 = _1570 + _1188;
    float _1574 = float(_1188);
    int _1576 = _1354 * _1558;
    int _1578 = _1576 + _1564;
    float _1580 = float(_1015);
    int _1582 = _1542 * _1560;
    int _1584 = _1582 + _1550;
    bool _1586 = uint(_1572) >= uint(_1015);
    float _1588 = -_241;
    int _1590 = _1196 ? as_type<int>(_1588) : as_type<int>(_241);
    float _1592 = _1580 * _1466;
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1596 = _1594 != 0;
    float _1598 = _1346 * _1580;
    float _1600 = float(uint(_1578));
    bool _1602 = !_1596;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = trunc(_1592);
    int _1608 = int(_1606);
    bool _1610 = !_1410;
    int _1612 = _1610 ? 0 : 1;
    float _1614 = as_type<float>(_985) * _1600;
    int _1616 = abs(_1604);
    bool _1618 = !_1206;
    float _1620 = _1618 ? _225 : as_type<float>(_1568);
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1624 = _1622 != 0;
    float _1626 = trunc(_1614);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = abs(_1612);
    bool _1634 = _1574 >= _1580;
    bool _1636 = isnan(_1574);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(_1580);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    bool _1646 = !_1624;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1504 * _1632;
    int _1652 = _1650 + _1584;
    bool _1654 = !_1586;
    int _1656 = _1654 ? 0 : (-1);
    float _1658 = trunc(_1644);
    int _1660 = int(_1658);
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1664 = _1662 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1672 = _1670 != 0;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1676 = _1674 != 0;
    int _1678 = ~_1552;
    int _1680 = _1678 + _1656;
    int _1682 = _1680 + 1;
    int _1684 = _1390 * _1616;
    int _1686 = _1684 + _1652;
    int _1688 = abs(_1648);
    int _1690 = ~_931;
    int _1692 = _1690 + 1;
    int _1694 = _1015 * _1682;
    int _1696 = _1694 + _1188;
    bool _1698 = !_1668;
    int _1700 = _1698 ? 0 : 1;
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1704 = _1702 != 0;
    float _1706 = trunc(_1598);
    int _1708 = int(_1706);
    bool _1710 = !_1664;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = _1692 * int(_1630);
    int _1716 = _1714 + _1578;
    bool _1718 = _1015 == 0;
    float _1720 = float(uint(_1686));
    float _1722 = float(uint(_1716));
    int _1724 = ~_1660;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = as_type<float>(_991) * _1720;
    bool _1732 = !_1718;
    int _1734 = _1732 ? _1696 : (-1);
    float _1736 = as_type<float>(_1652);
    float _1738 = as_type<float>(_1630);
    float _1740 = as_type<float>(_1448);
    float _1742 = as_type<float>(_1106);
    float _1744 = as_type<float>(_1108);
    if (_1704)
    {
        float _1746 = in.m_76.w;
        _1736 = _1746;
    }
    float _1748 = _1736;
    float _1750 = as_type<float>(_985) * _1722;
    float _1752 = trunc(_1730);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = abs(_1700);
    int _1760 = _1734 * _1728;
    int _1762 = _1015 + (-1);
    int _1764 = abs(_1712);
    float _1766 = trunc(_1750);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    int _1772 = _1660 * _1762;
    int _1774 = _1772 + _1760;
    int _1776 = ~_931;
    int _1778 = _1776 + 1;
    int _1780 = _1708 * _1688;
    int _1782 = _1780 + _1188;
    bool _1784 = _931 == 0;
    int _1786 = _1774 * _1758;
    int _1788 = ~_945;
    int _1790 = _1788 + 1;
    float _1792 = as_type<float>(_1758);
    float _1794 = as_type<float>(_1688);
    if (!_1704)
    {
        _1792 = _241;
    }
    float _1796 = _1792;
    int _1798 = _1608 * _1764;
    int _1800 = _1798 + _1786;
    bool _1802 = !_1672;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = _1796;
    if (_1704)
    {
        float _1808 = _1748 * 3.1415927410125732421875;
        _1794 = _1808;
    }
    float _1810 = _1794;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1814 = _1812 != 0;
    int _1816 = _1790 * int(_1756);
    int _1818 = _1816 + _1686;
    int _1820 = int(_1630) + int(_1770);
    if (_1704)
    {
        float _1822 = _1810 * 0.15915493667125701904296875;
        _1738 = _1822;
    }
    float _1824 = _1738;
    int _1826 = abs(_1804);
    float _1828 = float(uint(_1818));
    int _1830 = _1778 * _1820;
    int _1832 = _1830 + _1578;
    bool _1834 = !_1676;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = _1824;
    if (_1704)
    {
        float _1840 = _1824 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        _1838 = _1842;
    }
    float _1844 = _1838;
    float _1846 = as_type<float>(_991) * _1828;
    int _1848 = abs(_1836);
    int _1850 = _1782 * _1826;
    int _1852 = _1850 + _1800;
    bool _1854 = uint(_1832) >= uint(_931);
    float _1856 = _1598;
    if (_1814)
    {
        float _1858 = in.m_76.x;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = float(uint(_1414));
    int _1864 = _1708 * _1848;
    int _1866 = _1864 + _1852;
    bool _1868 = !_1854;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1846);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1880 = _1878 != 0;
    float _1882 = as_type<float>(_985) * _1862;
    int _1884 = ~_1820;
    int _1886 = _1884 + _1870;
    int _1888 = _1886 + 1;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1894 = !_1880;
    float _1896 = _1894 ? _241 : as_type<float>(_1590);
    float _1898 = float(uint(_1866));
    float _1900 = trunc(_1882);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    int _1906 = _931 * _1888;
    int _1908 = _1906 + _1578;
    bool _1910 = _1880;
    float _1912 = _1898;
    if (_1704)
    {
        bool _1914 = _1844 > 0.5;
        _1910 = _1914;
    }
    bool _1916 = _1910;
    float _1918 = as_type<float>(_1200) * _1898;
    int _1920 = ~_931;
    int _1922 = _1920 + 1;
    bool _1924 = !_1784;
    int _1926 = _1924 ? _1908 : (-1);
    float _1928 = 1.0 / _1892;
    if (_1704)
    {
        float _1930 = -_241;
        float _1932 = _1916 ? _1930 : _241;
        _1806 = _1932;
    }
    float _1934 = _1806;
    int _1936 = _1926 & 3;
    bool _1938 = _1936 != 0;
    if (_1814)
    {
        float _1940 = _1860 * 3.1415927410125732421875;
        _1912 = _1940;
    }
    float _1942 = _1912;
    int _1944 = _1926 & 3;
    bool _1946 = _1944 != 0;
    int _1948 = int(_1756) + int(_1876);
    float _1950 = trunc(_1918);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    int _1956 = _1922 * int(_1904);
    int _1958 = _1956 + _1414;
    int _1960 = ~_1015;
    int _1962 = _1960 + 1;
    float _1964 = _1942;
    if (_1814)
    {
        float _1966 = _1942 * 0.15915493667125701904296875;
        _1964 = _1966;
    }
    float _1968 = _1964;
    int _1970 = _1938 ? 0 : 1;
    bool _1972 = uint(_1944) > 1u;
    float _1974 = float(uint(_1504));
    float _1976 = _1968;
    if (_1814)
    {
        float _1978 = _1968 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1976 = _1980;
    }
    float _1982 = _1976;
    float _1984 = float(uint(_1958));
    float _1986 = as_type<float>(_991) * _1974;
    int _1988 = ~_945;
    int _1990 = _1988 + 1;
    float _1992 = as_type<float>(_985) * _1984;
    int _1994 = ~_1970;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = _1962 * int(_1954);
    int _2002 = _2000 + _1866;
    float _2004 = trunc(_1986);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    int _2010 = _1990 * _1948;
    int _2012 = _2010 + _1686;
    float _2014 = -_225;
    int _2016 = _1446 ? as_type<int>(_2014) : as_type<int>(_225);
    float _2018 = float(uint(_2002));
    bool _2020 = uint(_1944) >= 2u;
    int _2022 = _1998;
    if (!_1972)
    {
        int _2024 = ~_1970;
        int _2026 = _2024 + 1;
        _2022 = _2026;
    }
    int _2028 = _2022;
    float _2030 = as_type<float>(_1200) * _2018;
    bool _2032 = uint(_2012) >= uint(_945);
    float _2034 = trunc(_1992);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    int _2040 = _2020 ? 0 : 1;
    bool _2042 = _1944 != 3;
    bool _2044 = !_2032;
    int _2046 = _2044 ? 0 : (-1);
    int _2048 = ~_945;
    int _2050 = _2048 + 1;
    float _2052 = trunc(_2030);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    int _2058 = ~_1948;
    int _2060 = _2058 + _2046;
    int _2062 = _2060 + 1;
    int _2064 = _2050 * int(_2008);
    int _2066 = _2064 + _1504;
    int _2068 = ~_2040;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    int _2074 = _945 * _2062;
    int _2076 = _2074 + _1686;
    int _2078 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2080 = _2078 != 0;
    int _2082 = _2072;
    bool _2084 = _2042;
    float _2086 = 2.8025969286496341418474591665798e-45;
    if (_2042)
    {
        int _2088 = ~_2040;
        int _2090 = _2088 + 1;
        _2082 = _2090;
    }
    int _2092 = _2082;
    if (_1814)
    {
        bool _2094 = _1982 > 0.5;
        _2084 = _2094;
    }
    bool _2096 = _2084;
    bool _2098 = !_1480;
    int _2100 = _2098 ? _2076 : (-1);
    float _2102 = float(uint(_2066));
    if (!_1814)
    {
        _2086 = _225;
    }
    float _2104 = _2086;
    float _2106 = _2104;
    if (_1814)
    {
        float _2108 = -_225;
        float _2110 = _2096 ? _2108 : _225;
        _2106 = _2110;
    }
    float _2112 = _2106;
    float _2114 = as_type<float>(_991) * _2102;
    int _2116 = _2100 & 3;
    bool _2118 = _2116 != 0;
    bool _2120 = !_2080;
    float _2122 = _2120 ? _225 : as_type<float>(_2016);
    int _2124 = int(_1954) + int(_2056);
    float _2126 = trunc(_2114);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    int _2132 = ~_1015;
    int _2134 = _2132 + 1;
    int _2136 = _2100 & 3;
    bool _2138 = _2136 != 0;
    bool _2140 = uint(_2116) > 1u;
    int _2142 = _2134 * _2124;
    int _2144 = _2142 + _1866;
    int _2146 = int(_1904) + int(_2038);
    int _2148 = ~_931;
    int _2150 = _2148 + 1;
    int _2152 = _2138 ? 0 : 1;
    int _2154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2156 = _2154 != 0;
    int _2158 = _2150 * _2146;
    int _2160 = _2158 + _1414;
    float _2162 = float(uint(_1782));
    bool _2164 = !_2156;
    int _2166 = _2164 ? 0 : 1;
    bool _2168 = uint(_2144) >= uint(_1015);
    float _2170 = as_type<float>(_1200) * _2162;
    int _2172 = ~_2152;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2176;
    if (!_2140)
    {
        int _2180 = ~_2152;
        int _2182 = _2180 + 1;
        _2178 = _2182;
    }
    int _2184 = _2178;
    bool _2186 = uint(_2160) >= uint(_931);
    float _2188 = trunc(_2170);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    bool _2194 = !_2168;
    int _2196 = _2194 ? 0 : (-1);
    bool _2198 = _2116 != 3;
    bool _2200 = !_2186;
    int _2202 = _2200 ? 0 : (-1);
    bool _2204 = uint(_2116) >= 2u;
    int _2206 = ~_2124;
    int _2208 = _2206 + _2196;
    int _2210 = _2208 + 1;
    int _2212 = ~_945;
    int _2214 = _2212 + 1;
    int _2216 = int(_2008) + int(_2130);
    int _2218 = _1015 * _2210;
    int _2220 = _2218 + _1866;
    int _2222 = ~_1015;
    int _2224 = _2222 + 1;
    int _2226 = _2204 ? 0 : 1;
    int _2228 = _2214 * _2216;
    int _2230 = _2228 + _1504;
    int _2232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2234 = _2232 != 0;
    int _2236 = ~_2226;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2240;
    int _2244 = _2184;
    if (_2198)
    {
        int _2246 = ~_2226;
        int _2248 = _2246 + 1;
        _2242 = _2248;
    }
    int _2250 = _2242;
    int _2252 = _2224 * int(_2192);
    int _2254 = _2252 + _1782;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2258 = _2256 != 0;
    bool _2260 = !_2234;
    int _2262 = _2260 ? 0 : 1;
    bool _2264 = uint(_2230) >= uint(_945);
    bool _2266 = !_1718;
    int _2268 = _2266 ? _2220 : (-1);
    bool _2270 = !_2258;
    int _2272 = _2270 ? 0 : 1;
    bool _2274 = !_2264;
    int _2276 = _2274 ? 0 : (-1);
    int _2278 = _2268 & 3;
    bool _2280 = _2278 != 0;
    int _2282 = _2268 & 3;
    bool _2284 = _2282 != 0;
    float _2286 = float(uint(_2254));
    int _2288 = _2280 ? 0 : 1;
    bool _2290 = uint(_2282) > 1u;
    float _2292 = as_type<float>(_1200) * _2286;
    int _2294 = ~_2288;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = trunc(_2292);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    int _2306 = ~_2216;
    int _2308 = _2306 + _2276;
    int _2310 = _2308 + 1;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2320 = _2298;
    if (!_2290)
    {
        int _2322 = ~_2288;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    bool _2328 = uint(_2282) >= 2u;
    float _2330 = 1.0 / _2314;
    int _2332 = ~_1015;
    int _2334 = _2332 + 1;
    int _2336 = _2328 ? 0 : 1;
    bool _2338 = _2282 != 3;
    int _2340 = int(_2192) + int(_2304);
    float _2342 = 1.0 / _2318;
    int _2344 = ~_2336;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = _2334 * _2340;
    int _2352 = _2350 + _1782;
    float _2354 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2354;
    int _2358 = _2348;
    if (_2338)
    {
        int _2360 = ~_2336;
        int _2362 = _2360 + 1;
        _2358 = _2362;
    }
    int _2364 = _2358;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2368 = uint(_2352) >= uint(_1015);
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2372 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2366);
    bool _2374 = !_2368;
    int _2376 = _2374 ? 0 : (-1);
    float _2378 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _2380 = _1098 > 0.5;
    float _2382 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2372);
    float _2384 = -_241;
    int _2386 = _2380 ? as_type<int>(_2384) : as_type<int>(_241);
    int _2388 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2390 = _2388 != 0;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2394 = in.m_56.x;
    float _2396 = in.m_56.y;
    float _2398 = in.m_56.z;
    int _2400 = abs(_2028);
    bool _2402 = !_2390;
    float _2404 = _2402 ? _241 : as_type<float>(_2386);
    float _2406 = fma(_2378, -2.0, _2392);
    bool _2408 = _1106 != 1;
    float _2410 = _1202 + (-1.0);
    int _2412 = ~_2340;
    int _2414 = _2412 + _2376;
    int _2416 = _2414 + 1;
    float _2418 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2406);
    int _2420 = ~_2146;
    int _2422 = _2420 + _2202;
    int _2424 = _2422 + 1;
    int _2426 = abs(_2166);
    int _2428 = _1015 * _2416;
    int _2430 = _2428 + _1782;
    int _2432 = abs(_2326);
    int _2434 = _931 * _2424;
    int _2436 = _2434 + _1414;
    int _2438 = ~_2432;
    int _2440 = _2438 + 1;
    int _2442 = _2440 + 1;
    float _2444 = as_type<float>(_2416);
    if (!_2408)
    {
        _1740 = _1102;
    }
    float _2446 = _1740;
    float _2448 = 0.0;
    float _2450 = _2446;
    if (!_2408)
    {
        _2448 = _1102;
    }
    float _2452 = _2448;
    float _2454 = 0.0;
    float _2456 = _2452;
    if (!_2408)
    {
        _2454 = _1116;
    }
    float _2458 = _2454;
    float _2460 = _197 * _2396;
    float _2462 = _2458;
    if (!_2408)
    {
        _1742 = _1116;
    }
    float _2464 = _1742;
    float _2466 = _1102 * 2.0;
    float _2468 = _2464;
    if (_2408)
    {
        _2450 = _1098;
    }
    float _2470 = _2450;
    float _2472 = _203 * _2396;
    if (_2408)
    {
        _2456 = _1098;
    }
    float _2474 = _2456;
    float _2476 = _209 * _2396;
    if (_2408)
    {
        _2462 = _1102;
    }
    float _2478 = _2462;
    float _2480 = fma(_195, _2394, _2460);
    if (_2408)
    {
        _2468 = _1102;
    }
    float _2482 = _2468;
    float _2484 = floor(_2466);
    bool _2486 = _1108 != 2;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2492 = fma(_201, _2394, _2472);
    float _2494 = fma(_207, _2394, _2476);
    float _2496 = fma(_199, _2398, _2480);
    float _2498 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2500 = fma(_205, _2398, _2492);
    float _2502 = fma(_211, _2398, _2494);
    float _2504 = _1116 * 2.0;
    float _2506 = 1.0 / _2490;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2508;
    float _2512 = 0.0;
    float _2514 = _2498;
    if (_2486)
    {
        _2512 = _1098;
    }
    float _2516 = _2512;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2522 = _2516;
    if (_2486)
    {
        _1744 = _1102;
    }
    float _2524 = _1744;
    float _2526 = _2510 * _1928;
    float _2528 = _2524;
    if (!_2486)
    {
        _2522 = _1116;
    }
    float _2530 = _2522;
    float _2532 = _2500 + _1198;
    if (!_2486)
    {
        _2528 = _1098;
    }
    float _2534 = _2528;
    float _2536 = floor(_2504);
    bool _2538 = _1444 >= 0.0;
    bool _2540 = isnan(_1444);
    bool _2542 = _2538 || _2540;
    bool _2544 = isnan(0.0);
    bool _2546 = _2542 || _2544;
    float _2548 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2550 = _2546 ? 0 : 1;
    bool _2552 = _1444 > 0.0;
    float _2554 = 1.0 / _2520;
    int _2556 = ~_2550;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    bool _2562 = !_1718;
    int _2564 = _2562 ? _2430 : (-1);
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2570 = _2560;
    if (!_2552)
    {
        int _2572 = ~_2550;
        int _2574 = _2572 + 1;
        _2570 = _2574;
    }
    int _2576 = _2570;
    float _2578 = 1.0 / _2568;
    bool _2580 = _2484 >= 0.0;
    bool _2582 = isnan(_2484);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan(0.0);
    bool _2588 = _2584 || _2586;
    int _2590 = _2588 ? 0 : 1;
    bool _2592 = _2484 > 0.0;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2602;
    int _2606 = ~_2590;
    int _2608 = _2606 + 1;
    int _2610 = _2608 + 1;
    float _2612 = 1.0 / _2596;
    float _2614 = _2600 * _2342;
    float _2616 = _2604 * _2330;
    int _2618 = _945 * _2310;
    int _2620 = _2618 + _1504;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2630 = !_1946;
    int _2632 = _2630 ? 0 : 1;
    float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2636 = _2634 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2638 = _2610;
    if (!_2592)
    {
        int _2640 = ~_2590;
        int _2642 = _2640 + 1;
        _2638 = _2642;
    }
    int _2644 = _2638;
    float _2646 = _2624 * _2578;
    bool _2648 = !_1480;
    int _2650 = _2648 ? _2620 : (-1);
    float _2652 = _2628 * _2554;
    bool _2654 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2656 = isnan(_913);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2662 = _2658 || _2660;
    float _2664 = float(_2662);
    float _2666 = _2636 * _2506;
    int _2668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2670 = _2668 != 0;
    int _2672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2674 = _2672 != 0;
    int _2676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2678 = _2676 != 0;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2682 = _913 + _2680;
    bool _2684 = _2536 >= 0.0;
    bool _2686 = isnan(_2536);
    bool _2688 = _2684 || _2686;
    bool _2690 = isnan(0.0);
    bool _2692 = _2688 || _2690;
    float _2694 = -_2664;
    float _2696 = _2694 + 1.0;
    bool _2698 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2700 = isnan(_913);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2706 = _2702 || _2704;
    float _2708 = float(_2706);
    float _2710 = _2356 * _2612;
    int _2712 = _2692 ? 0 : 1;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2716 = _913 + _2714;
    bool _2718 = _2536 > 0.0;
    float _2720 = _2708 * _2696;
    bool _2722 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2724 = isnan(_913);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = -_2708;
    float _2736 = _2734 + 1.0;
    bool _2738 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2740 = isnan(_913);
    bool _2742 = _2738 || _2740;
    bool _2744 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2746 = _2742 || _2744;
    float _2748 = float(_2746);
    float _2750 = fma(_2614, _2716, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2752 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2754 = isnan(_913);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    float _2764 = _2732 * _2736;
    float _2766 = -_2732;
    float _2768 = _2766 + 1.0;
    float _2770 = -_2748;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2526, _2682, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2776 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2778 = isnan(_913);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = _2748 * _2768;
    float _2790 = in.m_70.w;
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _913 + _2792;
    float _2796 = _2762 * _2772;
    float _2798 = -_2762;
    float _2800 = _2798 + 1.0;
    bool _2802 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2804 = isnan(_913);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = fma(_2616, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2816 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2818 = _913 + _2816;
    float _2820 = _2786 * _2800;
    float _2822 = -_2786;
    float _2824 = _2822 + 1.0;
    bool _2826 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2828 = isnan(_913);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = -_2812;
    float _2840 = _2838 + 1.0;
    float _2842 = fma(_2666, _2818, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2846 = _913 + _2844;
    float _2848 = _2812 * _2824;
    float _2850 = _2836 * _2840;
    float _2852 = -_2836;
    float _2854 = _2852 + 1.0;
    float _2856 = fma(_2646, _2846, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2858 = _2774 * _2850;
    float _2860 = fma(_2652, _1174, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2862 = ~_2712;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    float _2868 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2858);
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2872 = _2496 + _2790;
    float _2874 = _2502 + _1148;
    float _2876 = fma(_2750, _2848, _2868);
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2880 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2870);
    float _2882 = fma(_2814, _2820, _2876);
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2886 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2878);
    float _2888 = _1102 + (-0.5);
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2892 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2884);
    float _2894 = _1102 + _1116;
    float _2896 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2890);
    float _2898 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2900 = fma(_2842, _2796, _2882);
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2904 = _2532 + _2902;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2908 = -_2370;
    float _2910 = fma(_2898, 2.0, _2908);
    int _2912 = _2100 >> 31;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2916 = fma(_1224, -2.0, _2906);
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2920 = _2872 + _2918;
    float _2922 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2924 = _2912 & 3;
    float _2926 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2928 = _2866;
    float _2930 = _2874;
    if (!_2718)
    {
        int _2932 = ~_2712;
        int _2934 = _2932 + 1;
        _2928 = _2934;
    }
    int _2936 = _2928;
    float _2938 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2914);
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2942 = _2874 + _2940;
    float _2944 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2922);
    float _2946 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2948 = _1098 + _1116;
    float _2950 = _1098 + (-0.5);
    int _2952 = _2100 + _2924;
    float _2954 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2944);
    float _2956 = -_135;
    float _2958 = fma(_2956, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2910);
    int _2960 = _2952 >> 2;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2966 = _2960 << 4;
    int _2968 = _2966 + 656;
    float _2970 = _2112 + (-0.5);
    bool _2972 = !_2118;
    int _2974 = _2972 ? 0 : 1;
    float _2976 = -_2964;
    float _2978 = fma(_2946, 2.0, _2976);
    float _2980 = fma(_2856, _2788, _2900);
    float _2982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _2984 = uint(int(uint(_2968) >> uint(2)));
    uint _2986 = uint(int(uint(int(_2984)) >> uint(2)));
    int _2988 = int(_2984) & 3;
    float _2990 = (*spvDescriptorSet0.vp_c9)._m0[int(_2986)][_2988];
    int _2992 = int(_2984) + 1;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    int _2996 = _2992 & 3;
    float _2998 = (*spvDescriptorSet0.vp_c9)._m0[int(_2994)][_2996];
    bool _3000 = _2116 != 3;
    float _3002 = -_135;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2978);
    float _3006 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2982);
    float _3008 = fma(_2860, _2764, _2980);
    bool _3010 = !_3000;
    int _3012 = _3010 ? 0 : (-1);
    float _3014 = -_2970;
    float _3016 = -_2418;
    float _3018 = fma(_3014, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3016);
    bool _3020 = _2954 >= 0.0;
    int _3022 = _2968 + 8;
    uint _3024 = uint(int(uint(_3022) >> uint(2)));
    uint _3026 = uint(int(uint(int(_3024)) >> uint(2)));
    int _3028 = int(_3024) & 3;
    float _3030 = (*spvDescriptorSet0.vp_c9)._m0[int(_3026)][_3028];
    int _3032 = int(_3024) + 1;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    int _3036 = _3032 & 3;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[int(_3034)][_3036];
    float _3040 = _1934 + 0.5;
    float _3042 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2962);
    float _3044 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3046 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2958);
    float _3048 = _2404 + 0.5;
    float _3050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3052 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2916);
    float _3054 = _2122 + (-0.5);
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3004);
    float _3058 = fma(_3044, -2.0, _3050);
    int _3060 = abs(_2184);
    float _3062 = -_3054;
    float _3064 = -_3052;
    float _3066 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3064);
    float _3068 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3070 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3072 = fma(_2710, _1182, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3074 = abs(_3012);
    float _3076 = -_3070;
    float _3078 = fma(_2548, 2.0, _3076);
    int _3080 = abs(_2974);
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3084 = fma(_3072, _2720, _3008);
    int _3086 = abs(_2250);
    float _3088 = -_3082;
    float _3090 = fma(_2498, 2.0, _3088);
    int _3092 = ~_3060;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    if (_3020)
    {
        _2514 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3098 = _2514;
    float _3100 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2896);
    int _3102 = ~_3080;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3020)
    {
        float _3110 = _3098 * 5.0;
        _2244 = as_type<int>(_3110);
    }
    int _3112 = _2244;
    bool _3114 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3116 = isnan(0.0);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3122 = _3118 || _3120;
    float _3124 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2892);
    float _3126 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2880);
    if (_3020)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10102 = as_type<float>(_3112);
        out.gl_Position.z = _10102;
    }
    int _3128 = _3096 * as_type<int>(_2998);
    int _3130 = ~_3086;
    int _3132 = _3130 + 1;
    int _3134 = _3132 + 1;
    float _3136 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3138 = int(_3136);
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3142 = _3106 * as_type<int>(_2990);
    int _3144 = _3142 + _3128;
    int _3146 = abs(_2262);
    float _3148 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3058);
    int _3150 = _3134 * as_type<int>(_3030);
    int _3152 = _3150 + _3144;
    float _3154 = exp2(_1514);
    int _3156 = ~_3074;
    int _3158 = _3156 + 1;
    int _3160 = _3158 + 1;
    float _3162 = -_2382;
    float _3164 = _3162 + 1.0;
    int _3166 = ~_3146;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    float _3172 = _3108 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3174 = _1620 + (-0.5);
    int _3176 = _3160 * as_type<int>(_3038);
    int _3178 = _3176 + _3152;
    float _3180 = -_3100;
    float _3182 = _3180 + 1.0;
    float _3184 = float(uint(_3138));
    float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3188 = _3178 * _3170;
    float _3190 = fma(_3164, _2112, _3018);
    float _3192 = -_3182;
    float _3194 = fma(_3192, _1934, _3046);
    int _3196 = _2650 * _3146;
    int _3198 = _3196 + _3188;
    float _3200 = _1896 + 0.5;
    float _3202 = -_3154;
    float _3204 = _3202 + 1.0;
    float _3206 = 1.0 / _3184;
    float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3210 = 1.0 + _3208;
    float _3212 = -_135;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3090);
    float _3216 = fma(_3068, -2.0, _3140);
    float _3218 = _3122 ? _3204 : 0.0;
    out.m_84.x = _3194;
    out.m_84.y = _3190;
    float _3220 = fma(_3172, _3200, _3214);
    bool _3222 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3224 = isnan(1.0);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3230 = _3226 || _3228;
    float _3232 = 1.0 / _3210;
    float _3234 = float(uint(_3198));
    float _3236 = _3186 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3238 = abs(_3138);
    float _3240 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2938);
    float _3242 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2886);
    float _3244 = -_3236;
    float _3246 = -_3148;
    float _3248 = fma(_3244, _3174, _3246);
    int _3250 = ~_3138;
    int _3252 = _3250 + 1;
    float _3254 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3042);
    int _3256 = as_type<int>(_3206) + (-2);
    float _3258 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3006);
    float _3260 = -_135;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3078);
    float _3264 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3216);
    float _3266 = float(uint(_3238));
    float _3268 = as_type<float>(_3256) * _3234;
    float _3270 = _2904 * _2904;
    if (_3230)
    {
        float _3272 = _3218 * _3232;
        _145 = _3272;
    }
    float _3274 = _145;
    float _3276 = trunc(_3268);
    float _3278 = precise::max(_3276, 0.0);
    uint _3280 = uint(_3278);
    int _3282 = _1926 >> 31;
    float _3284 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3084);
    int _3286 = _2268 >> 31;
    float _3288 = fma(_2920, _2920, _3270);
    int _3290 = _3282 & 3;
    float _3292 = -_3254;
    float _3294 = _3292 + 1.0;
    bool _3296 = !_2670;
    int _3298 = _3296 ? 0 : 1;
    float _3300 = 1.0 / _3266;
    int _3302 = _3286 & 3;
    float _3304 = fma(_2942, _2942, _3288);
    int _3306 = _1926 + _3290;
    float _3308 = -_3124;
    float _3310 = _3308 + 1.0;
    int _3312 = _2268 + _3302;
    float _3314 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3316 = -_3294;
    float _3318 = fma(_1896, _3316, _3220);
    float _3320 = rsqrt(_3304);
    int _3322 = _3252 * int(_3280);
    int _3324 = _3322 + _3198;
    float _3326 = -_3310;
    float _3328 = fma(_2404, _3326, _3056);
    int _3330 = abs(_3198);
    float _3332 = -_3258;
    float _3334 = _3332 + 1.0;
    int _3336 = _3306 >> 2;
    out.m_86.x = _3284;
    int _3338 = _3312 >> 2;
    float _3340 = fma(_1620, _3334, _3248);
    float _3342 = float(uint(_3324));
    float _3344 = -_3126;
    float _3346 = _3344 + 1.0;
    int _3348 = as_type<int>(_3300) + (-2);
    float _3350 = -_3240;
    float _3352 = _3350 + 1.0;
    float _3354 = float(uint(_3330));
    float _3356 = as_type<float>(_3256) * _3342;
    int _3358 = _3336 << 4;
    int _3360 = _3358 + 368;
    float _3362 = _3314 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3364 = _3338 << 4;
    int _3366 = _3364 + 800;
    float _3368 = as_type<float>(_3348) * _3354;
    uint _3370 = uint(int(uint(_3360) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    float _3386 = _3362 * _3320;
    float _3388 = fma(_2122, _3346, _3066);
    int _3390 = abs(_3298);
    float _3392 = trunc(_3368);
    float _3394 = precise::max(_3392, 0.0);
    uint _3396 = uint(_3394);
    float _3398 = _2904 * _3386;
    float _3400 = _2920 * _3386;
    out.m_88.x = _3328;
    out.m_88.y = _3388;
    out.m_88.z = _3318;
    out.m_88.w = _3340;
    uint _3402 = uint(int(uint(_3366) >> uint(2)));
    uint _3404 = uint(int(uint(int(_3402)) >> uint(2)));
    int _3406 = int(_3402) & 3;
    float _3408 = (*spvDescriptorSet0.vp_c9)._m0[int(_3404)][_3406];
    int _3410 = int(_3402) + 1;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    int _3414 = _3410 & 3;
    float _3416 = (*spvDescriptorSet0.vp_c9)._m0[int(_3412)][_3414];
    float _3418 = -_3398;
    float _3420 = _2904 + _3418;
    float _3422 = -_3400;
    float _3424 = _2920 + _3422;
    float _3426 = float(_2936);
    float _3428 = _2942 * _3386;
    int _3430 = ~_3238;
    int _3432 = _3430 + 1;
    float _3434 = _3420 * _3420;
    float _3436 = float(_3390);
    float _3438 = trunc(_3356);
    float _3440 = precise::max(_3438, 0.0);
    uint _3442 = uint(_3440);
    int _3444 = ~_3138;
    int _3446 = _3444 + 1;
    float _3448 = fma(_3424, _3424, _3434);
    int _3450 = abs(_2632);
    int _3452 = _3432 * int(_3396);
    int _3454 = _3452 + _3330;
    int _3456 = _3366 + 8;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    uint _3460 = uint(int(uint(int(_3458)) >> uint(2)));
    int _3462 = int(_3458) & 3;
    float _3464 = (*spvDescriptorSet0.vp_c9)._m0[int(_3460)][_3462];
    int _3466 = int(_3458) + 1;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    int _3470 = _3466 & 3;
    float _3472 = (*spvDescriptorSet0.vp_c9)._m0[int(_3468)][_3470];
    float _3474 = _3436 * _3426;
    float _3476 = _3314;
    float _3478 = _3320;
    float _3480 = as_type<float>(_3450);
    if (_3020)
    {
        out.m_63.x = 0.0;
    }
    float _3482 = float(uint(_3454));
    float _3484 = -_3428;
    float _3486 = _2942 + _3484;
    int _3488 = ~_2400;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = _3360 + 8;
    uint _3496 = uint(int(uint(_3494) >> uint(2)));
    uint _3498 = uint(int(uint(int(_3496)) >> uint(2)));
    int _3500 = int(_3496) & 3;
    float _3502 = (*spvDescriptorSet0.vp_c9)._m0[int(_3498)][_3500];
    int _3504 = int(_3496) + 1;
    uint _3506 = uint(int(uint(_3504) >> uint(2)));
    int _3508 = _3504 & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    float _3512 = as_type<float>(_3348) * _3482;
    bool _3514 = !_2284;
    int _3516 = _3514 ? 0 : 1;
    int _3518 = int(_3280) + int(_3442);
    float _3520 = trunc(_3512);
    float _3522 = precise::max(_3520, 0.0);
    uint _3524 = uint(_3522);
    bool _3526 = _1944 != 3;
    bool _3528 = _931 == 0;
    int _3530 = _3446 * _3518;
    int _3532 = _3530 + _3198;
    int _3534 = ~_3238;
    int _3536 = _3534 + 1;
    float _3538 = _1310 + (-0.5);
    bool _3540 = !_3528;
    int _3542 = _3540 ? _2436 : (-1);
    int _3544 = _3492 * as_type<int>(_3384);
    bool _3546 = !_3526;
    int _3548 = _3546 ? 0 : (-1);
    bool _3550 = uint(_3532) >= uint(_3138);
    int _3552 = int(_3396) + int(_3524);
    bool _3554 = !_3550;
    int _3556 = _3554 ? 0 : (-1);
    int _3558 = _2442 * as_type<int>(_3416);
    int _3560 = abs(_3516);
    int _3562 = _3536 * _3552;
    int _3564 = _3562 + _3330;
    int _3566 = ~_3560;
    int _3568 = _3566 + 1;
    int _3570 = _3568 + 1;
    bool _3572 = _2282 != 3;
    int _3574 = ~_3450;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    int _3580 = _3570 * as_type<int>(_3408);
    int _3582 = _3580 + _3558;
    int _3584 = ~_3518;
    int _3586 = _3584 + _3556;
    int _3588 = _3586 + 1;
    bool _3590 = !_3572;
    int _3592 = _3590 ? 0 : (-1);
    int _3594 = _3578 * as_type<int>(_3376);
    int _3596 = _3594 + _3544;
    bool _3598 = uint(_3564) >= uint(_3238);
    int _3600 = _3138 * _3588;
    int _3602 = _3600 + _3198;
    int _3604 = abs(_2092);
    bool _3606 = !_3598;
    int _3608 = _3606 ? 0 : (-1);
    bool _3610 = _3138 == 0;
    int _3612 = abs(_2364);
    bool _3614 = !_3610;
    int _3616 = _3614 ? _3602 : (-1);
    float _3618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3620 = _3138 == 0;
    int _3622 = ~_3612;
    int _3624 = _3622 + 1;
    int _3626 = _3624 + 1;
    int _3628 = _3198 ^ _3138;
    float _3630 = -_3242;
    float _3632 = _3630 + 1.0;
    int _3634 = abs(_3548);
    int _3636 = _3626 * as_type<int>(_3464);
    int _3638 = _3636 + _3582;
    uint _3640 = uint(int(uint(_3628) >> uint(31)));
    float _3642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3644 = ~_3604;
    int _3646 = _3644 + 1;
    int _3648 = _3646 + 1;
    int _3650 = abs(_3592);
    int _3652 = ~_3608;
    int _3654 = _3552 + _3652;
    int _3656 = _3654 + 1;
    int _3658 = _3648 * as_type<int>(_3502);
    int _3660 = _3658 + _3596;
    int _3662 = ~int(_3640);
    int _3664 = _3662 + 1;
    int _3666 = ~_3634;
    int _3668 = _3666 + 1;
    int _3670 = _3668 + 1;
    int _3672 = ~_3650;
    int _3674 = _3672 + 1;
    int _3676 = _3674 + 1;
    int _3678 = _3656 ^ _3664;
    int _3680 = _3670 * as_type<int>(_3510);
    int _3682 = _3680 + _3660;
    int _3684 = abs(_2272);
    int _3686 = _3676 * as_type<int>(_3472);
    int _3688 = _3686 + _3638;
    int _3690 = ~_2426;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    float _3696 = in.m_90.x;
    float _3698 = in.m_90.y;
    float _3700 = in.m_90.z;
    int _3702 = ~_3664;
    int _3704 = _3702 + _3678;
    int _3706 = _3704 + 1;
    float _3708 = _3642 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3710 = ~_3684;
    int _3712 = _3710 + 1;
    int _3714 = _3712 + 1;
    int _3716 = _3682 * _3694;
    bool _3718 = !_3620;
    int _3720 = _3718 ? _3706 : (-1);
    float _3722 = _1288 + 0.5;
    float _3724 = float(_3616);
    int _3726 = _3688 * _3714;
    float _3728 = float(_3720);
    float _3730 = _3618 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3732 = _3542 * _2426;
    int _3734 = _3732 + _3716;
    float _3736 = fma(_3708, _3724, _3262);
    int _3738 = _2564 * _3684;
    int _3740 = _3738 + _3726;
    float _3742 = -_3264;
    float _3744 = fma(_3730, _3728, _3742);
    float _3746 = _3474 * (-2.0);
    float _3748 = fma(_3708, _3722, _3736);
    float _3750 = -_3730;
    float _3752 = fma(_3750, _3538, _3744);
    float _3754 = float(_3734);
    float _3756 = -_3352;
    float _3758 = fma(_1288, _3756, _3748);
    float _3760 = float(_3740);
    float _3762 = fma(_1310, _3632, _3752);
    float _3764 = fma(_2926, _3746, _2926);
    float _3766 = fma(_3746, _3696, _3696);
    bool _3768 = !_2674;
    int _3770 = _3768 ? 0 : 1;
    out.m_92.x = _3754;
    bool _3772 = !_2678;
    int _3774 = _3772 ? 0 : 1;
    int _3776 = abs(_3770);
    out.m_92.w = _3760;
    out.m_94.x = _3758;
    out.m_94.y = _3762;
    float _3778 = _3700;
    int _3780 = _3564;
    float _3782 = _3510;
    float _3784 = _3486;
    if (_3020)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3786 = -_3398;
    float _3788 = _2532 + _3786;
    float _3790 = float(_2576);
    float _3792 = -_3400;
    float _3794 = _2872 + _3792;
    float _3796 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3766);
    float _3798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3800 = _3788 + _3798;
    float _3802 = float(_3776);
    float _3804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3806 = _3794 + _3804;
    float _3808 = fma(_3764, _3274, _3796);
    float _3810 = _3800 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3812 = -_3428;
    float _3814 = _2874 + _3812;
    float _3816 = _3802 * _3790;
    float _3818 = fma(_3806, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3810);
    float _3820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3822 = _3814 + _3820;
    float _3824 = _2894 + (-1.0);
    int _3826 = abs(_3774);
    float _3828 = fma(_3486, _3486, _3448);
    float _3830 = fma(_3822, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3818);
    float _3832 = _3816 * (-2.0);
    float _3834 = fma(_3824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3836 = float(_2644);
    float _3838 = _2948 + (-1.0);
    float _3840 = fma(_3832, _3698, _3698);
    float _3842 = float(_3826);
    float _3844 = fma(_3834, _3832, _3834);
    bool _3846 = _3830 >= 0.0;
    float _3848 = fma(_2888, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3840);
    float _3850 = _3842 * _3836;
    float _3852 = _3808 * 0.15915493667125701904296875;
    float _3854 = fma(_3844, _3274, _3848);
    float _3856 = sqrt(_3828);
    float _3858 = _3850 * (-2.0);
    float _3860 = fma(_3838, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3862 = _3854 * 0.15915493667125701904296875;
    float _3864 = _1116 + (-0.5);
    float _3866 = fma(_3858, _3700, _3700);
    float _3868 = fma(_3860, _3858, _3860);
    float _3870 = _3794;
    if (_3846)
    {
        _3778 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3872 = _3778;
    float _3874 = _3852 * 6.283185482025146484375;
    float _3876 = sin(_3874);
    float _3878 = fma(_3864, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3866);
    int _3880 = as_type<int>(_3872);
    if (_3846)
    {
        out.m_63.x = 0.0;
    }
    if (_3846)
    {
        float _3882 = _3872 * 5.0;
        _3880 = as_type<int>(_3882);
    }
    int _3884 = _3880;
    float _3886 = fma(_3868, _3274, _3878);
    float _3888 = _3852 * 6.283185482025146484375;
    float _3890 = cos(_3888);
    if (_3846)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11211 = as_type<float>(_3884);
        out.gl_Position.z = _11211;
    }
    float _3892 = _3886 * 0.15915493667125701904296875;
    float _3894 = _3862 * 6.283185482025146484375;
    float _3896 = sin(_3894);
    float _3898 = _3862 * 6.283185482025146484375;
    float _3900 = cos(_3898);
    if (_3846)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3902 = _3892 * 6.283185482025146484375;
    float _3904 = cos(_3902);
    float _3906 = _3320 * _3856;
    float _3908 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3912 = _3876 * _3896;
    float _3914 = _3314 * _3906;
    float _3916 = _3906 * _3908;
    float _3918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3920 = _3892 * 6.283185482025146484375;
    float _3922 = sin(_3920);
    float _3924 = _3890 * _3896;
    float _3926 = _3910 * _3916;
    float _3928 = _3890 * _3900;
    float _3930 = _3876 * _3900;
    float _3932 = _3918 * _3914;
    float _3934 = _3890 * _3904;
    float _3936 = _3900 * _3904;
    float _3938 = _3876 * _3904;
    float _3940 = _3896 * _3904;
    float _3942 = _3934 * _3926;
    float _3944 = _3906 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3946 = _3944 * 0.5;
    float _3948 = fma(_3922, _3928, _3912);
    float _3950 = -_3930;
    float _3952 = fma(_3922, _3924, _3950);
    float _3954 = -_3926;
    float _3956 = _3922 * _3954;
    float _3958 = -_3924;
    float _3960 = fma(_3922, _3930, _3958);
    float _3962 = fma(_3948, _3932, _3942);
    float _3964 = _3938 * _3926;
    float _3966 = fma(_3936, _3932, _3956);
    float _3968 = fma(_3922, _3912, _3928);
    float _3970 = fma(_3952, _3946, _3962);
    float _3972 = fma(_3960, _3932, _3964);
    float _3974 = fma(_3940, _3946, _3966);
    float _3976 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = fma(_3968, _3946, _3972);
    float _3980 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3982 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3984 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3986 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3980);
    float _3988 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3982);
    float _3990 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3984);
    float _3992 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3986);
    float _3994 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3988);
    float _3996 = _3990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3998 = _3992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4000 = _3994 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4002 = _2874 + _3996;
    float _4004 = _2872 + _3998;
    float _4006 = _2532 + _4000;
    float _4008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4010 = _4002 + _4008;
    float _4012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4014 = _4004 + _4012;
    float _4016 = _4010 * _4010;
    float _4018 = fma(_4014, _4014, _4016);
    float _4020 = sqrt(_4018);
    bool _4022 = _4020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4024 = _3994;
    float _4026 = _4016;
    float _4028 = _4000;
    if (!_4022)
    {
        _4024 = _4004;
    }
    float _4030 = _4024;
    float _4032 = _4030;
    if (!_4022)
    {
        _4026 = _4002;
    }
    float _4034 = _4026;
    float _4036 = _4034;
    if (!_4022)
    {
        _4028 = _4006;
    }
    float _4038 = _4028;
    bool _4040 = !_4022;
    float _4042 = _4038;
    if (!_4040)
    {
        float _4044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4048 = _4020 + _4046;
        float _4050 = rsqrt(_4018);
        float _4052 = _4048 * _4044;
        float _4054 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4056 = _4052 * 0.15915493667125701904296875;
        float _4058 = _4056 * 6.283185482025146484375;
        float _4060 = cos(_4058);
        float _4062 = _4056 * 6.283185482025146484375;
        float _4064 = sin(_4062);
        float _4066 = _4060 + (-1.0);
        float _4068 = _4066 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4070 = fma(_4064, _4054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4072 = fma(_4006, _4060, _4068);
        float _4074 = _4050 * _4070;
        float _4076 = fma(_4014, _4074, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4078 = fma(_4010, _4074, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4042 = _4072;
        _4032 = _4076;
        _4036 = _4078;
    }
    float _4080 = _4042;
    float _4082 = _4032;
    float _4084 = _4036;
    float _4086 = -_2532;
    float _4088 = _4086 + _4080;
    float _4090 = -_2872;
    float _4092 = _4090 + _4082;
    float _4094 = -_2874;
    float _4096 = _4094 + _4084;
    float _4098 = _4088 * _4088;
    float _4100 = fma(_4092, _4092, _4098);
    float _4102 = fma(_4096, _4096, _4100);
    float _4104 = sqrt(_4102);
    bool _4106 = _4104 > 0.0;
    bool _4108 = !_4106;
    float _4110 = _4080;
    float _4112 = _4082;
    float _4114 = _4084;
    if (!_4108)
    {
        float _4116 = _245 * _245;
        float _4118 = rsqrt(_4102);
        float _4120 = fma(_237, _237, _4116);
        float _4122 = fma(_247, _247, _4120);
        float _4124 = sqrt(_4122);
        float _4126 = _4092 * _4118;
        float _4128 = _4088 * _4118;
        float _4130 = _4096 * _4118;
        bool _4132 = _4124 > 0.0;
        bool _4134 = !_4132;
        _2930 = _4126;
        if (!_4134)
        {
            float _4136 = rsqrt(_4122);
            float _4138 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4140 = _245 * _4136;
            float _4142 = _237 * _4136;
            float _4144 = _4128 * _4140;
            float _4146 = _247 * _4136;
            float _4148 = fma(_4126, _4142, _4144);
            float _4150 = _4138 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4152 = fma(_4130, _4146, _4148);
            float _4154 = _4152 * _4150;
            float _4156 = fma(_237, _4154, _4082);
            float _4158 = fma(_245, _4154, _4080);
            float _4160 = fma(_247, _4154, _4084);
            _4110 = _4158;
            _4112 = _4156;
            _4114 = _4160;
        }
    }
    float _4162 = _4110;
    float _4164 = _4112;
    float _4166 = _4114;
    float _4168 = _2930;
    float _4170 = -_3398;
    float _4172 = _4170 + _4162;
    float _4174 = -_3400;
    float _4176 = _4174 + _4164;
    float _4178 = -_3428;
    float _4180 = _4178 + _4166;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4184 = _4172 + _4182;
    float _4186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4188 = _4176 + _4186;
    float _4190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4192 = _4180 + _4190;
    float _4194 = _4184 * _4184;
    float _4196 = fma(_4188, _4188, _4194);
    float _4198 = _3788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4200 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4202 = fma(_4192, _4192, _4196);
    float _4204 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4198);
    float _4206 = rsqrt(_4202);
    float _4208 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4204);
    float _4210 = _3788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4212 = _4208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4214 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4210);
    float _4216 = sqrt(_4202);
    float _4218 = 1.0 / _4212;
    float _4220 = _4206 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4222 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4214);
    float _4224 = _4188 * _4220;
    float _4226 = _4192 * _4220;
    float _4228 = _4222 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4230 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4232 = _4224 * _4224;
    float _4234 = _4226 * _4226;
    float _4236 = _4228 + _4212;
    float _4238 = _3788 + _4230;
    float _4240 = _4232 + _4234;
    float _4242 = _4236 * _4218;
    float _4244 = _4242 * 0.5;
    float _4246 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4248 = sqrt(_4240);
    float _4250 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4252 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4254 = fma(_4244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4252);
    float _4256 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4246);
    float _4258 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4250);
    float _4260 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4256);
    float _4262 = 1.0 / _4254;
    float _4264 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4258);
    float _4266 = _4260 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4268 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4270 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4272 = trunc(_4266);
    int _4274 = int(_4272);
    float _4276 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4278 = _4248 + _4276;
    float _4280 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4282 = _4262 * _4280;
    float _4284 = trunc(_4268);
    int _4286 = int(_4284);
    bool _4288 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4290 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4292 = _4168;
    float _4294 = _4240;
    int _4296 = 2;
    float _4298 = _4232;
    float _4300 = _4234;
    if (_4270)
    {
        float _4302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4292 = _4302;
    }
    float _4304 = _4292;
    int _4306 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4308 = _4274 + _4306;
    int _4310 = _4308 + 1;
    bool _4312 = !_4288;
    int _4314 = _4312 ? 0 : 1;
    bool _4316 = _4310 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4318 = _4310;
    if (_4270)
    {
        float _4320 = rsqrt(_4240);
        _4294 = _4320;
    }
    float _4322 = _4294;
    int _4324 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4326 = _4286 + _4324;
    int _4328 = _4326 + 1;
    int _4330 = as_type<int>(_4322);
    if (!_4288)
    {
        _4296 = 1;
    }
    int _4332 = _4296;
    float _4334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4336 = _4310 | _4328;
    int _4338 = _4332;
    float _4340 = as_type<float>(_4336);
    if (!_4290)
    {
        _4338 = _4314;
    }
    int _4342 = _4338;
    bool _4344 = _4336 < 0;
    bool _4346 = _4344 || _4316;
    if (_4270)
    {
        float _4348 = _4278 * _4304;
        _4340 = _4348;
    }
    float _4350 = _4340;
    bool _4352 = _4328 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4354 = _4352 || _4346;
    if (_4270)
    {
        float _4356 = _4350 * 0.15915493667125701904296875;
        _2444 = _4356;
    }
    float _4358 = _2444;
    int _4360 = _4342 << 6;
    float _4362 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4364 = precise::max(0.0, _4334);
    int _4366 = as_type<int>(_4014);
    if (_4270)
    {
        float _4368 = _4358 * 6.283185482025146484375;
        float _4370 = sin(_4368);
        _4366 = as_type<int>(_4370);
    }
    int _4372 = _4366;
    int _4374 = _4360 + 96;
    uint _4376 = uint(int(uint(_4374) >> uint(2)));
    uint _4378 = uint(int(uint(int(_4376)) >> uint(2)));
    int _4380 = int(_4376) & 3;
    float _4382 = (*spvDescriptorSet0.vp_c15)._m0[int(_4378)][_4380];
    int _4384 = int(_4376) + 1;
    uint _4386 = uint(int(uint(_4384) >> uint(2)));
    int _4388 = _4384 & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    if (!_4270)
    {
        _3476 = _4224;
    }
    float _4392 = _3476;
    float _4394 = -_4220;
    float _4396 = -_4364;
    float _4398 = fma(_4184, _4394, _4396);
    float _4400 = _4392;
    if (!_4354)
    {
        int _4402 = _4328 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4404 = _4402 + _4310;
        _4318 = _4404;
    }
    int _4406 = _4318;
    int _4408 = _4360 + 48;
    uint _4410 = uint(int(uint(_4408) >> uint(2)));
    uint _4412 = uint(int(uint(int(_4410)) >> uint(2)));
    int _4414 = int(_4410) & 3;
    float _4416 = (*spvDescriptorSet0.vp_c15)._m0[int(_4412)][_4414];
    int _4418 = int(_4410) + 1;
    uint _4420 = uint(int(uint(_4418) >> uint(2)));
    int _4422 = _4418 & 3;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[int(_4420)][_4422];
    float _4426 = _2926;
    if (_4270)
    {
        float _4428 = _4358 * 6.283185482025146484375;
        float _4430 = cos(_4428);
        _4426 = _4430;
    }
    float _4432 = _4426;
    if (_4270)
    {
        float _4434 = _4398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3478 = _4434;
    }
    float _4436 = _3478;
    float _4438 = _4436;
    if (!_4354)
    {
        int _4440 = _4406 << 2;
        _3780 = _4440;
    }
    int _4442 = _3780;
    int _4444 = _4372;
    int _4446 = _4442;
    if (_4270)
    {
        float _4448 = fma(as_type<float>(_4372), _4436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3480 = _4448;
    }
    float _4450 = _3480;
    int _4452 = _4360 + 64;
    uint _4454 = uint(int(uint(_4452) >> uint(2)));
    uint _4456 = uint(int(uint(int(_4454)) >> uint(2)));
    int _4458 = int(_4454) & 3;
    float _4460 = (*spvDescriptorSet0.vp_c15)._m0[int(_4456)][_4458];
    int _4462 = int(_4454) + 1;
    uint _4464 = uint(int(uint(_4462) >> uint(2)));
    int _4466 = _4462 & 3;
    float _4468 = (*spvDescriptorSet0.vp_c15)._m0[int(_4464)][_4466];
    float _4470 = _4450;
    if (!_4270)
    {
        _4438 = _4398;
    }
    float _4472 = _4438;
    float _4474 = floor(_4362);
    float _4476 = _4472;
    if (_4270)
    {
        float _4478 = _4322 * _4450;
        _4470 = _4478;
    }
    float _4480 = _4470;
    if (!_4354)
    {
        uint _4482 = uint(int(uint(_4406) >> uint(2)));
        _4444 = int(_4482);
    }
    int _4484 = _4444;
    float _4486 = as_type<float>(_4484);
    if (!_4354)
    {
        int _4488 = 12 & _4442;
        _4446 = _4488;
    }
    int _4490 = _4446;
    if (_4270)
    {
        float _4492 = _4224 * _4480;
        _4400 = _4492;
    }
    float _4494 = _4400;
    int _4496 = _4360 + 104;
    uint _4498 = uint(int(uint(_4496) >> uint(2)));
    uint _4500 = uint(int(uint(int(_4498)) >> uint(2)));
    int _4502 = int(_4498) & 3;
    float _4504 = (*spvDescriptorSet0.vp_c15)._m0[int(_4500)][_4502];
    int _4506 = int(_4498) + 1;
    uint _4508 = uint(int(uint(_4506) >> uint(2)));
    int _4510 = _4506 & 3;
    float _4512 = (*spvDescriptorSet0.vp_c15)._m0[int(_4508)][_4510];
    if (_4270)
    {
        float _4514 = _4432 + (-1.0);
        _3782 = _4514;
    }
    float _4516 = _3782;
    float _4518 = _4516;
    if (!_4354)
    {
        int _4520 = _4484 << 4;
        int _4522 = _4520 + _4490;
        _4330 = _4522;
    }
    int _4524 = _4330;
    if (_4270)
    {
        float _4526 = _4494 * _4494;
        _4298 = _4526;
    }
    float _4528 = _4298;
    float _4530 = floor(_4200);
    if (_4270)
    {
        float _4532 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3784 = _4532;
    }
    float _4534 = _3784;
    if (!_4270)
    {
        _4518 = _4226;
    }
    float _4536 = _4518;
    float _4538 = _4536;
    if (_4270)
    {
        float _4540 = _4226 * _4480;
        _4538 = _4540;
    }
    float _4542 = _4538;
    int _4544 = _4360 + 56;
    uint _4546 = uint(int(uint(_4544) >> uint(2)));
    uint _4548 = uint(int(uint(int(_4546)) >> uint(2)));
    int _4550 = int(_4546) & 3;
    float _4552 = (*spvDescriptorSet0.vp_c15)._m0[int(_4548)][_4550];
    int _4554 = int(_4546) + 1;
    uint _4556 = uint(int(uint(_4554) >> uint(2)));
    int _4558 = _4554 & 3;
    float _4560 = (*spvDescriptorSet0.vp_c15)._m0[int(_4556)][_4558];
    if (_4270)
    {
        float _4562 = fma(_4398, _4432, _4534);
        _4476 = _4562;
    }
    float _4564 = _4476;
    if (_4270)
    {
        float _4566 = _4542 * _4542;
        _4300 = _4566;
    }
    float _4568 = _4300;
    float _4570 = -_4474;
    float _4572 = _4362 + _4570;
    float _4574 = fma(_4564, _4564, _4528);
    if (!_4354)
    {
        float _4576 = floor(_4266);
        _4486 = _4576;
    }
    float _4578 = _4486;
    int _4580 = _4360 + 72;
    uint _4582 = uint(int(uint(_4580) >> uint(2)));
    uint _4584 = uint(int(uint(int(_4582)) >> uint(2)));
    int _4586 = int(_4582) & 3;
    float _4588 = (*spvDescriptorSet0.vp_c15)._m0[int(_4584)][_4586];
    int _4590 = int(_4582) + 1;
    uint _4592 = uint(int(uint(_4590) >> uint(2)));
    int _4594 = _4590 & 3;
    float _4596 = (*spvDescriptorSet0.vp_c15)._m0[int(_4592)][_4594];
    float _4598 = _4574 + _4568;
    float _4600 = rsqrt(_4598);
    float _4602 = _4238 * _4390;
    int _4604 = _4360 + 80;
    uint _4606 = uint(int(uint(_4604) >> uint(2)));
    uint _4608 = uint(int(uint(int(_4606)) >> uint(2)));
    int _4610 = int(_4606) & 3;
    float _4612 = (*spvDescriptorSet0.vp_c15)._m0[int(_4608)][_4610];
    int _4614 = int(_4606) + 1;
    uint _4616 = uint(int(uint(_4614) >> uint(2)));
    int _4618 = _4614 & 3;
    float _4620 = (*spvDescriptorSet0.vp_c15)._m0[int(_4616)][_4618];
    float _4622 = fma(_3794, _4382, _4602);
    float _4624 = _4238 * _4424;
    float _4626 = _4432;
    float _4628 = _4624;
    if (!_4354)
    {
        int _4630 = _4524 + 400;
        uint _4632 = uint(int(uint(_4630) >> uint(2)));
        uint _4634 = uint(int(uint(int(_4632)) >> uint(2)));
        int _4636 = int(_4632) & 3;
        float _4638 = (*spvDescriptorSet0.vp_c15)._m0[int(_4634)][_4636];
        _4626 = _4638;
    }
    float _4640 = _4626;
    float _4642 = _4600 * _4494;
    float _4644 = _4238 * _4468;
    float _4646 = fma(_3794, _4416, _4624);
    float _4648 = _4600 * _4564;
    float _4650 = _4600 * _4542;
    float _4652 = fma(_3794, _4460, _4644);
    float _4654 = _4642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_4354)
    {
        float _4656 = floor(_4268);
        _4628 = _4656;
    }
    float _4658 = _4628;
    float _4660 = fma(_3814, _4504, _4622);
    float _4662 = -_4654;
    float _4664 = fma(_4648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4662);
    float _4666 = fma(_3814, _4552, _4646);
    float _4668 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4670 = _4660 + _4512;
    float _4672 = _4666 + _4560;
    float _4674 = fma(_3814, _4588, _4652);
    float _4676 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4668);
    float _4678 = 1.0 / _4670;
    int _4680 = _4360 + 88;
    uint _4682 = uint(int(uint(_4680) >> uint(2)));
    uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
    int _4686 = int(_4682) & 3;
    float _4688 = (*spvDescriptorSet0.vp_c15)._m0[int(_4684)][_4686];
    int _4690 = int(_4682) + 1;
    uint _4692 = uint(int(uint(_4690) >> uint(2)));
    int _4694 = _4690 & 3;
    float _4696 = (*spvDescriptorSet0.vp_c15)._m0[int(_4692)][_4694];
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4700 = fma(_4216, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4698);
    float _4702 = precise::clamp(_4700, 0.0, 1.0);
    float _4704 = _4674 + _4596;
    float _4706 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4708 = -_4650;
    float _4710 = fma(_4708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4664);
    float _4712 = -_4702;
    float _4714 = _4712 + 1.0;
    float _4716 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4676);
    float _4718 = _4238 * _4620;
    float _4720 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4722 = abs(_4714);
    float _4724 = log2(_4722);
    float _4726 = _4716 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4728 = fma(_3794, _4612, _4718);
    float _4730 = fma(_4710, 0.5, 0.5);
    float _4732 = _4726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4734 = _4672 * _4678;
    float _4736 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4738 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4706);
    float _4740 = _4704 * _4678;
    bool _4742 = _4734 >= 0.0;
    float _4744 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4736);
    float _4746 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4738);
    float _4748 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _4750 = _4734 <= 1.0;
    bool _4752 = _4750 && _4742;
    float _4754 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4744);
    float _4756 = _4746 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4758 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4748);
    bool _4760 = _4740 >= 0.0;
    bool _4762 = _4760 && _4752;
    float _4764 = _4754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4766 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4768 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4758);
    bool _4770 = _4740 <= 1.0;
    bool _4772 = _4770 && _4762;
    float _4774 = -_4732;
    float _4776 = fma(_4774, _4720, 1.0);
    float _4778 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4766);
    float _4780 = fma(_4710, -0.5, 0.5);
    float _4782 = _4768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4784 = _4724 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4786 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4778);
    float _4788 = sqrt(_4780);
    float _4790 = fma(_4730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4792 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4786);
    float _4794 = _4758;
    float _4796 = _4732;
    float _4798 = _4784;
    float _4800 = _4792;
    if (_4772)
    {
        float _4802 = float(_4342);
        _4794 = _4802;
    }
    float _4804 = _4794;
    if (!_4354)
    {
        float _4806 = rint(_4640);
        float _4808 = precise::max(_4806, 0.0);
        uint _4810 = uint(_4808);
        uint _4812 = clamp(_4810, 0u, 65535u);
        _4796 = as_type<float>(_4812);
    }
    float _4814 = _4796;
    float _4816 = fma(_3814, _4688, _4728);
    float _4818 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4820 = _4816 + _4696;
    float _4822 = fma(_4730, _4790, -0.212114393711090087890625);
    float _4824 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4826 = exp2(_4784);
    float _4828 = -_4530;
    float _4830 = _4200 + _4828;
    float _4832 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4818);
    float _4834 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4824);
    float _4836 = _4788 * 0.636619746685028076171875;
    float _4838 = _4820 * _4678;
    float _4840 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4832);
    float _4842 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4834);
    float _4844 = log2(_4776);
    float _4846 = _4842;
    if (!_4354)
    {
        float _4848 = -_4658;
        float _4850 = _4268 + _4848;
        _4798 = _4850;
    }
    float _4852 = _4798;
    float _4854 = fma(_4730, _4822, 1.570728778839111328125);
    float _4856 = _4648 + 1.0;
    float _4858 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4840);
    float _4860 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4842);
    float _4862 = -_4854;
    float _4864 = fma(_4836, _4862, 1.0);
    if (!_4354)
    {
        float _4866 = -_4578;
        float _4868 = _4266 + _4866;
        _4846 = _4868;
    }
    float _4870 = _4846;
    float _4872 = 1.0 / _4792;
    float _4874 = -_4648;
    float _4876 = fma(_4826, _4856, _4874);
    float _4878 = _4804;
    if (_4772)
    {
        float _4880 = rint(_4804);
        float _4882 = precise::max(_4880, 0.0);
        uint _4884 = uint(_4882);
        uint _4886 = clamp(_4884, 0u, 65535u);
        _4878 = as_type<float>(_4886);
    }
    float _4888 = _4878;
    float _4890 = _4844 * 0.693147182464599609375;
    float _4892 = fma(_4876, 0.5, 0.5);
    float2 _12870 = float2(_4572, _4830);
    float _4894 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12870, float2(0.0), isnan(_12870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12870, float2(0.0), isnan(_12870)), level(0.0)).x;
    float _4896 = as_type<float>(_4342);
    if (!_4354)
    {
        float3 _12888 = float3(_4870, _4852, float(as_type<int>(_4814)));
        float3 _12892 = select(_12888, float3(0.0), isnan(_12888));
        float _4898 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12892.xy, uint(rint(_12892.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12892.xy, uint(rint(_12892.z)), level(0.0)).x;
        _4896 = _4898;
    }
    float _4900 = _4896;
    float _4902 = _4890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4904 = _4858 * _4872;
    float _4906 = _4860 * _4872;
    float _4908 = fma(_4904, 0.5, 0.5);
    float _4910 = fma(_4906, -0.5, 0.5);
    float _4912 = _4888;
    if (_4772)
    {
        float3 _12921 = float3(_4734, _4740, float(as_type<int>(_4888)));
        float3 _12923 = select(_12921, float3(0.0), isnan(_12921));
        float _4914 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12923.xy, uint(rint(_12923.z)), _4838, level(0.0));
        _4912 = _4914;
    }
    float _4916 = _4912;
    float3 _12933 = float3(_4908, _4910, _4902);
    float _4918 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12933, float3(0.0), isnan(_12933)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12933, float3(0.0), isnan(_12933)), level(0.0)).x;
    float3 _12942 = float3(_4908, _4910, _4902);
    float4 _4921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12942, float3(0.0), isnan(_12942)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12942, float3(0.0), isnan(_12942)), level(0.0)).xyzw;
    float _4923 = _4921.x;
    float _4925 = _4921.y;
    float _4927 = _4921.z;
    float _4929 = _4921.w;
    float2 _12958 = float2(_4864, _4892);
    float3 _4933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12958, float2(0.0), isnan(_12958)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12958, float2(0.0), isnan(_12958)), level(0.0)).xyz;
    float _4935 = _4933.x;
    float _4937 = _4933.y;
    float _4939 = _4933.z;
    float _4941 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4943 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4945 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4947 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4949 = fma(_4941, _4941, 1.0);
    float _4951 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4953 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4943);
    float _4955 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4957 = rsqrt(_4949);
    float _4959 = -_3922;
    float _4961 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4947);
    float _4963 = -_3922;
    float _4965 = fma(_4963, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4951);
    float _4967 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4969 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4945);
    float _4971 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4953);
    float _4973 = -_3922;
    float _4975 = fma(_4973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4955);
    float _4977 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4967);
    float _4979 = abs(_4282);
    float _4981 = log2(_4979);
    float _4983 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4969);
    float _4985 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4987 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4977);
    float _4989 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4961);
    float _4991 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4965);
    float _4993 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4975);
    float _4995 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4985);
    float _4997 = _4941 * _4957;
    float _4999 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5001 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4995);
    float _5003 = -_4971;
    float _5005 = _4997 * _5003;
    float _5007 = -_4983;
    float _5009 = _4997 * _5007;
    float _5011 = -_4987;
    float _5013 = _4997 * _5011;
    float _5015 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4999);
    float _5017 = _4981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5019 = fma(_4957, _4989, _5005);
    float _5021 = fma(_4957, _4991, _5009);
    float _5023 = fma(_4957, _4993, _5013);
    float _5025 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5027 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5029 = exp2(_5017);
    float _5031 = _4724 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5033 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5025);
    float _5035 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5027);
    float _5037 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5001);
    float _5039 = _4792 * 0.5;
    out.m_96.x = _5019;
    out.m_96.y = _5021;
    out.m_96.z = _5023;
    bool _5041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5043 = isnan(0.5);
    bool _5045 = _5041 || _5043;
    bool _5047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5049 = _5045 || _5047;
    float _5051 = fma(_4860, -0.5, _5039);
    float _5053 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5033);
    float _5055 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5035);
    float _5057 = exp2(_5031);
    float _5059 = _5037 + _4792;
    float _5061 = _4858 + _4792;
    out.gl_Position.x = _4858;
    out.gl_Position.y = _4860;
    out.gl_Position.z = _5037;
    out.gl_Position.w = _4792;
    float _5063 = fma(_5029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5065 = precise::clamp(_5063, 0.0, 1.0);
    float _5067 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5015);
    float _5069 = _5059 * 0.5;
    float _5071 = fma(_5065, -2.0, 3.0);
    float _5073 = _5065 * _5065;
    out.m_98.x = _5053;
    out.m_98.y = _5055;
    out.m_98.z = _5067;
    float _5075 = _5061 * 0.5;
    float _5077 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5079 = _5073 * _5071;
    float _5081 = _4941 * _4989;
    float _5083 = _4941 * _4991;
    out.m_100.x = _5075;
    out.m_100.y = _5051;
    out.m_100.z = _5069;
    out.m_100.w = _4792;
    float _5085 = -_5079;
    float _5087 = _5085 + 1.0;
    bool _5089 = _4282 <= 8000.0;
    bool _5091 = isnan(_4282);
    bool _5093 = _5089 || _5091;
    bool _5095 = isnan(8000.0);
    bool _5097 = _5093 || _5095;
    float _5099 = float(_5097);
    float _5101 = _4941 * _4993;
    float _5103 = fma(_5077, _5055, _5083);
    float _5105 = fma(_5087, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5079);
    float _5107 = fma(_5077, _5053, _5081);
    float _5109 = fma(_5077, _5067, _5101);
    float _5111 = _5105;
    float _5113 = _5019;
    if (_5049)
    {
        _4800 = 1.0;
    }
    float _5115 = _4800;
    float _5117 = _5099 * _5105;
    float _5119 = _5115;
    float _5121 = _5117;
    if (!_5049)
    {
        float _5123 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5125 = _5123 * 0.15915493667125701904296875;
        float _5127 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5129;
        float _5133 = _5125 * 6.283185482025146484375;
        float _5135 = cos(_5133);
        float _5137 = _5127 * 0.15915493667125701904296875;
        float _5139 = _5125 * 6.283185482025146484375;
        float _5141 = sin(_5139);
        float _5143 = 1.0 / _5135;
        float _5145 = _5137 * 6.283185482025146484375;
        float _5147 = cos(_5145);
        float _5149 = _5141 * _5143;
        float _5151 = _5137 * 6.283185482025146484375;
        float _5153 = sin(_5151);
        float _5155 = _5147 * _5149;
        float _5157 = 1.0 / _5131;
        float _5159 = 1.0 / _5155;
        float _5161 = _5153 * _5159;
        float _5163 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5165 = fma(_4282, _5161, _5163);
        float _5167 = _5165 * _5157;
        float _5169 = precise::clamp(_5167, 0.0, 1.0);
        _5111 = _5157;
        _5113 = _5143;
        _5119 = _5169;
    }
    float _5171 = _5111;
    float _5173 = _5113;
    float _5175 = _5119;
    float _5177 = _5117 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5179 = -_4894;
    float _5181 = _5179 + 1.0;
    float _5183 = -_5057;
    float _5185 = _5183 + 1.0;
    float _5187 = _5171;
    float _5189 = _5173;
    float _5191 = _5177;
    if (!_4772)
    {
        _5187 = 1.0;
    }
    float _5193 = _5187;
    float _5195 = _4971 + _5107;
    float _5197 = _4983 + _5103;
    float _5199 = _4987 + _5109;
    float _5201 = _5193;
    if (_4772)
    {
        bool _5203 = _4916 >= _4838;
        bool _5205 = isnan(_4916);
        bool _5207 = _5203 || _5205;
        bool _5209 = isnan(_4838);
        bool _5211 = _5207 || _5209;
        float _5213 = float(_5211);
        _5201 = _5213;
    }
    float _5215 = _5201;
    float _5217 = _5181 * _5177;
    float _5219 = precise::clamp(_5217, 0.0, 1.0);
    float _5221 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_4354)
    {
        _5189 = 1.0;
    }
    float _5223 = _5189;
    float _5225 = _5223;
    if (!_4354)
    {
        int _5227 = _4406 << 4;
        int _5229 = _5227 + 2048;
        uint _5231 = uint(int(uint(_5229) >> uint(2)));
        uint _5233 = uint(int(uint(int(_5231)) >> uint(2)));
        int _5235 = int(_5231) & 3;
        float _5237 = (*spvDescriptorSet0.vp_c15)._m0[int(_5233)][_5235];
        int _5239 = int(_5231) + 1;
        uint _5241 = uint(int(uint(_5239) >> uint(2)));
        int _5243 = _5239 & 3;
        float _5245 = (*spvDescriptorSet0.vp_c15)._m0[int(_5241)][_5243];
        int _5247 = _5229 + 8;
        uint _5249 = uint(int(uint(_5247) >> uint(2)));
        uint _5251 = uint(int(uint(int(_5249)) >> uint(2)));
        int _5253 = int(_5249) & 3;
        float _5255 = (*spvDescriptorSet0.vp_c15)._m0[int(_5251)][_5253];
        int _5257 = int(_5249) + 1;
        uint _5259 = uint(int(uint(_5257) >> uint(2)));
        int _5261 = _5257 & 3;
        float _5263 = (*spvDescriptorSet0.vp_c15)._m0[int(_5259)][_5261];
        float _5265 = _4238 * _5245;
        float _5267 = fma(_3794, _5237, _5265);
        float _5269 = fma(_3814, _5255, _5267);
        float _5271 = _5269 + _5263;
        float _5273 = precise::clamp(_5271, 0.0, 1.0);
        float _5275 = -_5273;
        float _5277 = _5275 + _4900;
        float _5279 = fma(_5277, 500.0, 1.5);
        float _5281 = exp2(_5279);
        float _5283 = 0.0 + _5281;
        float _5285 = precise::clamp(_5283, 0.0, 1.0);
        _5225 = _5285;
        _5121 = _5237;
        _5191 = _5245;
        _3870 = 500.0;
    }
    float _5287 = _5225;
    float _5289 = _5121;
    float _5291 = _5191;
    float _5293 = _3870;
    float _5295 = _5215 * _5287;
    float _5297 = _5221 * _4918;
    float _5299 = -_5219;
    float _5301 = fma(_5299, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5303 = -_5221;
    float _5305 = _5303 + 1.0;
    out.m_102.x = _5195;
    out.m_102.y = _5197;
    out.m_102.z = _5199;
    float _5307 = _4929 * _5297;
    float _5309 = -_5295;
    float _5311 = fma(_5309, _5301, 1.0);
    float _5313 = precise::clamp(_5311, 0.0, 1.0);
    float _5315 = _4939 * _5297;
    float _5317 = _4929 * _5305;
    float _5319 = fma(_4935, _5307, _4923);
    float _5321 = fma(_4937, _5307, _4925);
    float _5323 = _5313 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5325 = fma(_4929, _5315, _4927);
    bool _5327 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5329 = isnan(_4216);
    bool _5331 = _5327 || _5329;
    bool _5333 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5335 = _5331 || _5333;
    float _5337 = _5175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _5323;
    out.m_106.x = _5319;
    out.m_106.y = _5321;
    out.m_106.z = _5325;
    out.m_106.w = _5317;
    float _5339 = _5291;
    float _5341 = _5289;
    float _5343 = _5293;
    float _5345 = _5305;
    float _5347 = _5307;
    float _5349 = _5313;
    if (!_5335)
    {
        _5339 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5351 = _5339;
    float _5353 = _5351;
    float _5355 = _5351;
    if (!_5335)
    {
        _5341 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5357 = _5341;
    float _5359 = _5357;
    float _5361 = _5357;
    if (!_5335)
    {
        _5343 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5363 = _5343;
    float _5365 = _5363;
    float _5367 = _5363;
    if (!_5335)
    {
        _5345 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5369 = _5345;
    float _5371 = _5369;
    float _5373 = _5369;
    if (!_5335)
    {
        _5347 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5375 = _5347;
    float _5377 = _5375;
    float _5379 = _5375;
    if (!_5335)
    {
        _5349 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5381 = _5349;
    bool _5383 = !_5335;
    float _5385 = _5381;
    float _5387 = _5381;
    if (!_5383)
    {
        bool _5389 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5391 = isnan(_4216);
        bool _5393 = _5389 || _5391;
        bool _5395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5397 = _5393 || _5395;
        if (!_5397)
        {
            float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5401 = _4216 + _5399;
            float _5403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5403;
            float _5407 = 1.0 / _5405;
            float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5429 = _5401 * _5407;
            float _5431 = precise::clamp(_5429, 0.0, 1.0);
            float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5437 = fma(_5431, _5411, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5439 = fma(_5431, _5435, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5441 = fma(_5431, _5415, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5443 = fma(_5431, _5419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5445 = fma(_5431, _5423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5447 = fma(_5431, _5427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5361 = _5439;
            _5379 = _5445;
            _5355 = _5437;
            _5373 = _5443;
            _5367 = _5441;
            _5387 = _5447;
            _5449 = true;
        }
        else
        {
            bool _5451 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5453 = isnan(_4216);
            bool _5455 = _5451 || _5453;
            bool _5457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5459 = _5455 || _5457;
            if (!_5459)
            {
                _5353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5461 = _5353;
            _5355 = _5461;
            if (!_5459)
            {
                _5359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5463 = _5359;
            _5361 = _5463;
            if (!_5459)
            {
                _5365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5465 = _5365;
            _5367 = _5465;
            if (!_5459)
            {
                _5371 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5467 = _5371;
            _5373 = _5467;
            if (!_5459)
            {
                _5377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5469 = _5377;
            _5379 = _5469;
            if (!_5459)
            {
                _5385 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5471 = _5385;
            bool _5473 = !_5459;
            _5387 = _5471;
            if (!_5473)
            {
                bool _5475 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5477 = isnan(_4216);
                bool _5479 = _5475 || _5477;
                bool _5481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5483 = _5479 || _5481;
                if (!_5483)
                {
                    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5487 = _4216 + _5485;
                    float _5489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5489;
                    float _5493 = 1.0 / _5491;
                    float _5495 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5497 = _5495 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5499 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5501 = _5499 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5505 = _5503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5509 = _5507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5513 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5515 = _5487 * _5493;
                    float _5517 = precise::clamp(_5515, 0.0, 1.0);
                    float _5519 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5523 = fma(_5517, _5497, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5525 = fma(_5517, _5521, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5527 = fma(_5517, _5501, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5529 = fma(_5517, _5505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5531 = fma(_5517, _5509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5533 = fma(_5517, _5513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5361 = _5525;
                    _5379 = _5531;
                    _5355 = _5523;
                    _5373 = _5529;
                    _5367 = _5527;
                    _5387 = _5533;
                    _5449 = true;
                }
                else
                {
                    _5361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5373 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5387 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5449 = false;
    float _5535 = _5361;
    float _5537 = _5379;
    float _5539 = _5355;
    float _5541 = _5373;
    float _5543 = _5367;
    float _5545 = _5387;
    float _5547 = fma(_5197, -0.5, 0.5);
    float _5549 = precise::clamp(_5547, 0.0, 1.0);
    float _5551 = -_5535;
    float _5553 = _5551 + _5537;
    float _5555 = -_5539;
    float _5557 = _5555 + _5541;
    out.m_108.x = 0.0;
    float _5559 = fma(_5549, _5553, _5535);
    float _5561 = -_5543;
    float _5563 = _5561 + _5545;
    float _5565 = fma(_5549, _5557, _5539);
    float _5567 = _5559 * 0.586610972881317138671875;
    bool _5569 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5571 = fma(_5549, _5563, _5543);
    float _5573 = _5337 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5575 = fma(_5565, 0.298911988735198974609375, _5567);
    bool _5577 = _5175 > 0.0;
    bool _5579 = isnan(_5175);
    bool _5581 = _5577 || _5579;
    bool _5583 = isnan(0.0);
    bool _5585 = _5581 || _5583;
    float _5587 = fma(_5571, 0.114477999508380889892578125, _5575);
    out.m_63.x = _5573;
    float _5589 = -_5587;
    float _5591 = _5565 + _5589;
    float _5593 = -_5587;
    float _5595 = _5559 + _5593;
    float _5597 = -_5587;
    float _5599 = _5571 + _5597;
    float _5601 = fma(_5591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    float _5603 = fma(_5595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    float _5605 = fma(_5599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    bool _5607 = !_5569;
    if (!_5607)
    {
        float _5609 = -_4172;
        float _5611 = _5609 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5613 = -_4176;
        float _5615 = _5613 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5617 = -_4180;
        float _5619 = _5617 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5621 = _5611 * _5611;
        float _5623 = fma(_5615, _5615, _5621);
        float _5625 = fma(_5619, _5619, _5623);
        float _5627 = sqrt(_5625);
        float _5629 = rsqrt(_5625);
        float _5631 = -_5627;
        float _5633 = _5631 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5635 = _5633 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5637 = precise::clamp(_5635, 0.0, 1.0);
        float _5639 = _5615 * _5629;
        float _5641 = _5611 * _5629;
        float _5643 = abs(_5637);
        float _5645 = log2(_5643);
        float _5647 = _5619 * _5629;
        float _5649 = _5639 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5651 = _5197 * _5641;
        float _5653 = -_5641;
        float _5655 = -_5649;
        float _5657 = fma(_5653, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5655);
        float _5659 = fma(_5195, _5639, _5651);
        float _5661 = -_5647;
        float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5657);
        float _5665 = fma(_5199, _5647, _5659);
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5671 = _5663 + _5669;
        float _5673 = _5645 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5675 = _5671 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5677 = precise::clamp(_5675, 0.0, 1.0);
        float _5679 = exp2(_5673);
        float _5681 = _5679 * _5677;
        float _5683 = _5667 * _5681;
        float _5685 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5687 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5689 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5685;
        out.m_108.y = _5687;
        out.m_108.z = _5689;
    }
    out.m_110.x = _5601;
    out.m_110.y = _5603;
    out.m_110.z = _5605;
    if (_5585)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5691 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5691;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5449 = false;
    bool _741 = false;
    bool _597 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5759 = as_type<float>(_153);
        out.gl_Position.z = _5759;
    }
    if (!_139)
    {
        return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5822 = as_type<float>(_185);
        out.gl_Position.z = _5822;
    }
    if (_173)
    {
        return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = 1.0 / _279;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _305 = 1.0 / _283;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _271 + _307;
    float _311 = 1.0 / _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _309 * _293;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _291;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _271 + _333;
    float _337 = _315 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = _271 + _339;
    float _343 = 1.0 / _297;
    float _345 = _275 * _311;
    bool _347 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _349 = isnan(_271);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    bool _359 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _361 = isnan(_271);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _301;
    float _373 = _335 * _331;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _377 = _271 + _375;
    float _379 = -_329;
    float _381 = _379 + 1.0;
    float _383 = _357 * _381;
    float _385 = _341 * _343;
    bool _387 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _389 = isnan(_271);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_397;
    float _401 = _399 + 1.0;
    float _403 = _377 * _371;
    float _405 = -_357;
    float _407 = _405 + 1.0;
    bool _409 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _411 = isnan(_271);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _423 = isnan(_271);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = _397 * _407;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = _419 * _401;
    float _441 = -_419;
    float _443 = _441 + 1.0;
    bool _445 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_271);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = _369 * _443;
    float _467 = -_369;
    float _469 = _467 + 1.0;
    float _471 = -_455;
    float _473 = _471 + 1.0;
    float _475 = fma(_437, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = fma(_459, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = _455 * _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _485;
    float _489 = _431 * _473;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = fma(_483, _345, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _497 = fma(_487, _345, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _499 = _475 * _489;
    float _501 = _477 * _489;
    float _503 = -_431;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_463, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _513 = fma(_493, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _515 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _499);
    float _517 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _501);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_511, _479, _515);
    float _525 = fma(_513, _479, _517);
    float _527 = fma(_509, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _535;
    float _539 = fma(_495, _465, _523);
    float _541 = fma(_497, _465, _525);
    float _543 = fma(_533, _385, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _545 = fma(_537, _385, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _555 = fma(_527, _439, _539);
    float _557 = fma(_529, _439, _541);
    float _559 = fma(_549, _403, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _561 = fma(_553, _403, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _563 = fma(_543, _433, _555);
    float _565 = fma(_545, _433, _557);
    float _567 = fma(_559, _383, _563);
    float _569 = fma(_561, _383, _565);
    float _571 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].x, _567);
    float _573 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].y, _569);
    bool _575 = !_303;
    float _577 = _383;
    float _595;
    if (!_575)
    {
        float _579 = in.m_76.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        _595 = _179;
    }
    _597 = false;
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _677 = -_651;
    float _679 = _677 + 1.0;
    float _681 = _675 * _661;
    float _683 = _673 * _667;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _687 = _599 + _685;
    float _689 = _619 * _679;
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _693 = fma(_683, _687, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _695 = fma(_693, _689, _691);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[117].x, _695);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = in.m_78.x;
    float _715 = in.m_78.y;
    out.m_80.x = _705;
    out.m_80.y = _707;
    out.m_80.z = _711;
    out.m_80.w = _709;
    float _717 = _573 * _715;
    float _719 = _571 * _713;
    bool _721 = !_659;
    float _739;
    if (!_721)
    {
        float _723 = in.m_76.x;
        float _725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _727 = _723 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _731 = _729 * _725;
        float _733 = floor(_731);
        float _735 = -_733;
        float _737 = _731 + _735;
        _739 = _737;
        _741 = true;
    }
    else
    {
        _739 = _179;
    }
    _741 = false;
    float _743 = _739;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _747 = _743 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _755 = isnan(_743);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _773 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _775 = isnan(_743);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = 1.0 / _751;
    float _787 = -_763;
    float _789 = _787 + 1.0;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _791;
    bool _795 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _797 = isnan(_743);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _783 * _789;
    float _809 = -_783;
    float _811 = _809 + 1.0;
    bool _813 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _815 = 1.0 / _767;
    float _817 = _805 * _811;
    float _819 = -_805;
    float _821 = _819 + 1.0;
    float _823 = 1.0 / _771;
    float _825 = _793 * _785;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _831 = fma(_825, _747, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _833 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _835 = isnan(_743);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _829 * _815;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _853 = _743 + _851;
    float _855 = _831 * _817;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _859 = _743 + _857;
    float _861 = fma(_845, _853, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _863 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[131].x, _855);
    float _865 = _849 * _823;
    float _867 = -_843;
    float _869 = _867 + 1.0;
    float _871 = fma(_861, _807, _863);
    float _873 = fma(_865, _859, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _875 = _763 * _869;
    float _877 = fma(_873, _875, _871);
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[134].x, _877);
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _887;
    out.m_82.y = _889;
    out.m_82.z = _891;
    out.m_82.w = _893;
    bool _895 = !_813;
    if (!_895)
    {
        float _897 = in.m_76.x;
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _901 = _897 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _181 = _911;
    }
    float _913 = _181;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _917 = int(_915);
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _921 = _919 != 0;
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _925 = int(_923);
    float _927 = float(_917);
    float _929 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _931 = int(_929);
    if (_921)
    {
        _577 = 1.0;
    }
    float _933 = _577;
    int _935 = 0;
    float _937 = _933;
    if (_921)
    {
        _935 = 0;
    }
    int _939 = _935;
    float _941 = float(_925);
    float _943 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _945 = int(_943);
    float _947 = 1.0 / _927;
    float _949 = float(uint(_931));
    int _951 = ~_931;
    int _953 = _951 + 1;
    float _955 = 1.0 / _941;
    float _957 = float(uint(_945));
    float _959 = _947 * _135;
    float _961 = 1.0 / _949;
    float _963 = _947;
    float _965 = _941;
    int _967 = _939;
    if (_921)
    {
        float _969 = in.m_76.x;
        float _971 = in.m_76.y;
        _963 = _969;
        _965 = _971;
    }
    float _973 = _963;
    float _975 = _965;
    float _977 = _955 * _135;
    float _979 = 1.0 / _957;
    float _981 = trunc(_959);
    int _983 = int(_981);
    int _985 = as_type<int>(_961) + (-2);
    float _987 = trunc(_977);
    int _989 = int(_987);
    int _991 = as_type<int>(_979) + (-2);
    float _993 = _979;
    float _995 = _973;
    float _997 = _975;
    if (_921)
    {
        _993 = _973;
    }
    float _999 = _993;
    float _1001 = 0.0;
    float _1003 = _999;
    if (_921)
    {
        _1001 = _975;
    }
    float _1005 = _1001;
    float _1007 = 0.0;
    float _1009 = _1005;
    if (_921)
    {
        _1007 = _999;
    }
    float _1011 = _1007;
    float _1013 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1015 = int(_1013);
    float _1017 = float(uint(_983));
    float _1019 = as_type<float>(_985) * _1017;
    int _1021 = as_type<int>(_1017);
    float _1023 = _1011;
    if (_921)
    {
        _1021 = 0;
    }
    int _1025 = _1021;
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1029 = int(_1027);
    float _1031 = float(uint(_989));
    float _1033 = as_type<float>(_991) * _1031;
    float _1035 = _1031;
    int _1037 = _1025;
    if (_921)
    {
        _1035 = 1.0;
    }
    float _1039 = _1035;
    float _1041 = trunc(_1019);
    float _1043 = precise::max(_1041, 0.0);
    uint _1046 = uint(_1043);
    float _1048 = float(uint(_1015));
    float _1050 = 1.0 / _1048;
    float _1052 = float(_1029);
    float _1054 = trunc(_1033);
    float _1056 = precise::max(_1054, 0.0);
    uint _1058 = uint(_1056);
    float _1060 = 1.0 / _1052;
    float _1062 = _1052;
    float _1064 = _1039;
    if (_921)
    {
        _1062 = _999;
    }
    float _1066 = _1062;
    float _1068 = _1066;
    if (!_921)
    {
        float _1070 = in.m_76.x;
        float _1072 = in.m_76.y;
        float _1074 = in.m_76.z;
        float _1076 = _1070 * 3.1415927410125732421875;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1072 * 3.1415927410125732421875;
        float _1082 = _1080 * 0.15915493667125701904296875;
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        float _1088 = _1082 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        _937 = 5.839270114898681640625;
        _1068 = _1074;
        _1064 = 7.345489978790283203125;
        _995 = _1070;
        _1003 = _1072;
        _997 = _1072;
        _1009 = _1090;
        _1037 = 1;
        _967 = 2;
        _1023 = _1086;
    }
    float _1092 = _937;
    float _1094 = _1068;
    float _1096 = _1064;
    float _1098 = _995;
    float _1100 = _1003;
    float _1102 = _997;
    float _1104 = _1009;
    int _1106 = _1037;
    int _1108 = _967;
    float _1110 = _1023;
    int _1112 = _953 * int(_1046);
    int _1114 = _1112 + _983;
    float _1116 = in.m_76.z;
    float _1118 = in.m_76.w;
    int _1120 = ~_945;
    int _1122 = _1120 + 1;
    float _1124 = _1092 * _1094;
    float _1126 = _1096 * _1098;
    float _1128 = float(uint(_1114));
    float _1130 = _1060 * _135;
    int _1132 = _1122 * int(_1058);
    int _1134 = _1132 + _989;
    float _1136 = floor(_1126);
    float _1138 = _1096 * _1100;
    float _1140 = as_type<float>(_985) * _1128;
    float _1142 = float(_931);
    float _1144 = _1098 * 2.0;
    float _1146 = float(uint(_1134));
    float _1148 = in.m_74.w;
    float _1150 = float(_983);
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    float _1158 = as_type<float>(_991) * _1146;
    bool _1160 = _1150 >= _1142;
    bool _1162 = isnan(_1150);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan(_1142);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1174 = _913 + _1172;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1178 = _1176 != 0;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1182 = _913 + _1180;
    bool _1184 = _1102 > 0.5;
    float _1186 = trunc(_1130);
    int _1188 = int(_1186);
    bool _1190 = _1118 > 0.5;
    float _1192 = -_1136;
    float _1194 = _1126 + _1192;
    bool _1196 = _1116 > 0.5;
    float _1198 = in.m_72.w;
    int _1200 = as_type<int>(_1050) + (-2);
    float _1202 = _1102 + _1098;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1214 = _1212 != 0;
    float _1216 = trunc(_1158);
    float _1218 = precise::max(_1216, 0.0);
    uint _1220 = uint(_1218);
    int _1222 = int(_1046) + int(_1156);
    float _1224 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1226 = ~_945;
    int _1228 = _1226 + 1;
    int _1230 = ~_931;
    int _1232 = _1230 + 1;
    float _1234 = floor(_1124);
    float _1236 = float(uint(_1188));
    int _1238 = _1232 * _1222;
    int _1240 = _1238 + _983;
    int _1242 = int(_1190);
    int _1244 = _1196 ? 2 : 0;
    int _1246 = _1242 | _1244;
    int _1248 = _1178 ? 4 : 0;
    int _1250 = _1246 | _1248;
    int _1252 = _1206 ? 8 : 0;
    int _1254 = _1250 | _1252;
    int _1256 = _1210 ? 16 : 0;
    int _1258 = _1254 | _1256;
    int _1260 = _1214 ? 32 : 0;
    int _1262 = _1258 | _1260;
    int _1264 = _1184 ? 64 : 0;
    int _1266 = _1262 | _1264;
    int _1268 = _1266 & 64;
    bool _1270 = !_1178;
    int _1272 = _1270 ? 0 : 1;
    float _1274 = as_type<float>(_1200) * _1236;
    float _1276 = -_241;
    int _1278 = _1184 ? as_type<int>(_1276) : as_type<int>(_241);
    float _1280 = trunc(_1170);
    int _1282 = int(_1280);
    int _1284 = int(_1058) + int(_1220);
    bool _1286 = !_1210;
    float _1288 = _1286 ? _241 : as_type<float>(_1278);
    int _1290 = abs(_1272);
    int _1292 = ~_1015;
    int _1294 = _1292 + 1;
    float _1296 = floor(_1138);
    float _1298 = -_225;
    int _1300 = _1196 ? as_type<int>(_1298) : as_type<int>(_225);
    float _1302 = -_1234;
    float _1304 = _1124 + _1302;
    float _1306 = float(_945);
    bool _1308 = !_1214;
    float _1310 = _1308 ? _225 : as_type<float>(_1300);
    float _1312 = _1194 * _1142;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1324 = _1322 != 0;
    float _1326 = trunc(_1274);
    float _1328 = precise::max(_1326, 0.0);
    uint _1330 = uint(_1328);
    bool _1332 = uint(_1240) >= uint(_931);
    int _1334 = _1228 * _1284;
    int _1336 = _1334 + _989;
    float _1338 = float(_989);
    bool _1340 = !_1320;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = -_1296;
    float _1346 = _1138 + _1344;
    bool _1348 = !_1316;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = trunc(_1312);
    int _1354 = int(_1352);
    bool _1356 = uint(_1336) >= uint(_945);
    float _1358 = _1304 * _1306;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1332;
    int _1366 = _1364 ? 0 : (-1);
    bool _1368 = _1338 >= _1306;
    bool _1370 = isnan(_1338);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(_1306);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    int _1380 = _1294 * int(_1330);
    int _1382 = _1380 + _1188;
    bool _1384 = !_1324;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = trunc(_1358);
    int _1390 = int(_1388);
    bool _1392 = !_1362;
    int _1394 = _1392 ? 0 : 1;
    bool _1396 = !_1356;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1410 = _1408 != 0;
    int _1412 = _1354 * _1290;
    int _1414 = _1412 + _983;
    int _1416 = ~_1222;
    int _1418 = _1416 + _1366;
    int _1420 = _1418 + 1;
    float _1422 = trunc(_1378);
    int _1424 = int(_1422);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1428 = _1426 != 0;
    bool _1430 = !_1406;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _931 * _1420;
    int _1436 = _1434 + _983;
    bool _1438 = !_1428;
    int _1440 = _1438 ? 0 : 1;
    bool _1442 = _931 == 0;
    float _1444 = floor(_1144);
    bool _1446 = _1268 != 0;
    int _1448 = abs(_1440);
    float _1450 = float(uint(_1382));
    int _1452 = ~_1284;
    int _1454 = _1452 + _1398;
    int _1456 = _1454 + 1;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    bool _1462 = !_1442;
    int _1464 = _1462 ? _1436 : (-1);
    float _1466 = _175 * _135;
    float _1468 = as_type<float>(_1200) * _1450;
    bool _1470 = !_1402;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _945 * _1456;
    int _1476 = _1474 + _989;
    float _1478 = _1142 * _1466;
    bool _1480 = _945 == 0;
    float _1482 = _1306 * _1466;
    int _1484 = ~_1282;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = trunc(_1468);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = ~_1424;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    int _1502 = _1390 * _1448;
    int _1504 = _1502 + _989;
    bool _1506 = !_1480;
    int _1508 = _1506 ? _1476 : (-1);
    int _1510 = _1464 * _1488;
    int _1512 = _931 + (-1);
    float _1514 = _1460 * _135;
    int _1516 = _945 + (-1);
    float _1518 = trunc(_1478);
    int _1520 = int(_1518);
    int _1522 = _1508 * _1500;
    int _1524 = abs(_1342);
    int _1526 = _1282 * _1512;
    int _1528 = _1526 + _1510;
    int _1530 = abs(_1432);
    int _1532 = _1424 * _1516;
    int _1534 = _1532 + _1522;
    int _1536 = abs(_1386);
    int _1538 = _1528 * _1524;
    float _1540 = trunc(_1482);
    int _1542 = int(_1540);
    int _1544 = abs(_1350);
    int _1546 = ~_1015;
    int _1548 = _1546 + 1;
    int _1550 = _1534 * _1530;
    int _1552 = int(_1330) + int(_1494);
    int _1554 = _1520 * _1544;
    int _1556 = _1554 + _1538;
    int _1558 = abs(_1394);
    int _1560 = abs(_1472);
    int _1562 = _1414 * _1536;
    int _1564 = _1562 + _1556;
    float _1566 = -_225;
    int _1568 = _1190 ? as_type<int>(_1566) : as_type<int>(_225);
    int _1570 = _1548 * _1552;
    int _1572 = _1570 + _1188;
    float _1574 = float(_1188);
    int _1576 = _1354 * _1558;
    int _1578 = _1576 + _1564;
    float _1580 = float(_1015);
    int _1582 = _1542 * _1560;
    int _1584 = _1582 + _1550;
    bool _1586 = uint(_1572) >= uint(_1015);
    float _1588 = -_241;
    int _1590 = _1196 ? as_type<int>(_1588) : as_type<int>(_241);
    float _1592 = _1580 * _1466;
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1596 = _1594 != 0;
    float _1598 = _1346 * _1580;
    float _1600 = float(uint(_1578));
    bool _1602 = !_1596;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = trunc(_1592);
    int _1608 = int(_1606);
    bool _1610 = !_1410;
    int _1612 = _1610 ? 0 : 1;
    float _1614 = as_type<float>(_985) * _1600;
    int _1616 = abs(_1604);
    bool _1618 = !_1206;
    float _1620 = _1618 ? _225 : as_type<float>(_1568);
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1624 = _1622 != 0;
    float _1626 = trunc(_1614);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = abs(_1612);
    bool _1634 = _1574 >= _1580;
    bool _1636 = isnan(_1574);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(_1580);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    bool _1646 = !_1624;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1504 * _1632;
    int _1652 = _1650 + _1584;
    bool _1654 = !_1586;
    int _1656 = _1654 ? 0 : (-1);
    float _1658 = trunc(_1644);
    int _1660 = int(_1658);
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1664 = _1662 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1672 = _1670 != 0;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1676 = _1674 != 0;
    int _1678 = ~_1552;
    int _1680 = _1678 + _1656;
    int _1682 = _1680 + 1;
    int _1684 = _1390 * _1616;
    int _1686 = _1684 + _1652;
    int _1688 = abs(_1648);
    int _1690 = ~_931;
    int _1692 = _1690 + 1;
    int _1694 = _1015 * _1682;
    int _1696 = _1694 + _1188;
    bool _1698 = !_1668;
    int _1700 = _1698 ? 0 : 1;
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1704 = _1702 != 0;
    float _1706 = trunc(_1598);
    int _1708 = int(_1706);
    bool _1710 = !_1664;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = _1692 * int(_1630);
    int _1716 = _1714 + _1578;
    bool _1718 = _1015 == 0;
    float _1720 = float(uint(_1686));
    float _1722 = float(uint(_1716));
    int _1724 = ~_1660;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = as_type<float>(_991) * _1720;
    bool _1732 = !_1718;
    int _1734 = _1732 ? _1696 : (-1);
    float _1736 = as_type<float>(_1652);
    float _1738 = as_type<float>(_1630);
    float _1740 = as_type<float>(_1448);
    float _1742 = as_type<float>(_1106);
    float _1744 = as_type<float>(_1108);
    if (_1704)
    {
        float _1746 = in.m_76.w;
        _1736 = _1746;
    }
    float _1748 = _1736;
    float _1750 = as_type<float>(_985) * _1722;
    float _1752 = trunc(_1730);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = abs(_1700);
    int _1760 = _1734 * _1728;
    int _1762 = _1015 + (-1);
    int _1764 = abs(_1712);
    float _1766 = trunc(_1750);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    int _1772 = _1660 * _1762;
    int _1774 = _1772 + _1760;
    int _1776 = ~_931;
    int _1778 = _1776 + 1;
    int _1780 = _1708 * _1688;
    int _1782 = _1780 + _1188;
    bool _1784 = _931 == 0;
    int _1786 = _1774 * _1758;
    int _1788 = ~_945;
    int _1790 = _1788 + 1;
    float _1792 = as_type<float>(_1758);
    float _1794 = as_type<float>(_1688);
    if (!_1704)
    {
        _1792 = _241;
    }
    float _1796 = _1792;
    int _1798 = _1608 * _1764;
    int _1800 = _1798 + _1786;
    bool _1802 = !_1672;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = _1796;
    if (_1704)
    {
        float _1808 = _1748 * 3.1415927410125732421875;
        _1794 = _1808;
    }
    float _1810 = _1794;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1814 = _1812 != 0;
    int _1816 = _1790 * int(_1756);
    int _1818 = _1816 + _1686;
    int _1820 = int(_1630) + int(_1770);
    if (_1704)
    {
        float _1822 = _1810 * 0.15915493667125701904296875;
        _1738 = _1822;
    }
    float _1824 = _1738;
    int _1826 = abs(_1804);
    float _1828 = float(uint(_1818));
    int _1830 = _1778 * _1820;
    int _1832 = _1830 + _1578;
    bool _1834 = !_1676;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = _1824;
    if (_1704)
    {
        float _1840 = _1824 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        _1838 = _1842;
    }
    float _1844 = _1838;
    float _1846 = as_type<float>(_991) * _1828;
    int _1848 = abs(_1836);
    int _1850 = _1782 * _1826;
    int _1852 = _1850 + _1800;
    bool _1854 = uint(_1832) >= uint(_931);
    float _1856 = _1598;
    if (_1814)
    {
        float _1858 = in.m_76.x;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = float(uint(_1414));
    int _1864 = _1708 * _1848;
    int _1866 = _1864 + _1852;
    bool _1868 = !_1854;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1846);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1880 = _1878 != 0;
    float _1882 = as_type<float>(_985) * _1862;
    int _1884 = ~_1820;
    int _1886 = _1884 + _1870;
    int _1888 = _1886 + 1;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1894 = !_1880;
    float _1896 = _1894 ? _241 : as_type<float>(_1590);
    float _1898 = float(uint(_1866));
    float _1900 = trunc(_1882);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    int _1906 = _931 * _1888;
    int _1908 = _1906 + _1578;
    bool _1910 = _1880;
    float _1912 = _1898;
    if (_1704)
    {
        bool _1914 = _1844 > 0.5;
        _1910 = _1914;
    }
    bool _1916 = _1910;
    float _1918 = as_type<float>(_1200) * _1898;
    int _1920 = ~_931;
    int _1922 = _1920 + 1;
    bool _1924 = !_1784;
    int _1926 = _1924 ? _1908 : (-1);
    float _1928 = 1.0 / _1892;
    if (_1704)
    {
        float _1930 = -_241;
        float _1932 = _1916 ? _1930 : _241;
        _1806 = _1932;
    }
    float _1934 = _1806;
    int _1936 = _1926 & 3;
    bool _1938 = _1936 != 0;
    if (_1814)
    {
        float _1940 = _1860 * 3.1415927410125732421875;
        _1912 = _1940;
    }
    float _1942 = _1912;
    int _1944 = _1926 & 3;
    bool _1946 = _1944 != 0;
    int _1948 = int(_1756) + int(_1876);
    float _1950 = trunc(_1918);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    int _1956 = _1922 * int(_1904);
    int _1958 = _1956 + _1414;
    int _1960 = ~_1015;
    int _1962 = _1960 + 1;
    float _1964 = _1942;
    if (_1814)
    {
        float _1966 = _1942 * 0.15915493667125701904296875;
        _1964 = _1966;
    }
    float _1968 = _1964;
    int _1970 = _1938 ? 0 : 1;
    bool _1972 = uint(_1944) > 1u;
    float _1974 = float(uint(_1504));
    float _1976 = _1968;
    if (_1814)
    {
        float _1978 = _1968 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1976 = _1980;
    }
    float _1982 = _1976;
    float _1984 = float(uint(_1958));
    float _1986 = as_type<float>(_991) * _1974;
    int _1988 = ~_945;
    int _1990 = _1988 + 1;
    float _1992 = as_type<float>(_985) * _1984;
    int _1994 = ~_1970;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = _1962 * int(_1954);
    int _2002 = _2000 + _1866;
    float _2004 = trunc(_1986);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    int _2010 = _1990 * _1948;
    int _2012 = _2010 + _1686;
    float _2014 = -_225;
    int _2016 = _1446 ? as_type<int>(_2014) : as_type<int>(_225);
    float _2018 = float(uint(_2002));
    bool _2020 = uint(_1944) >= 2u;
    int _2022 = _1998;
    if (!_1972)
    {
        int _2024 = ~_1970;
        int _2026 = _2024 + 1;
        _2022 = _2026;
    }
    int _2028 = _2022;
    float _2030 = as_type<float>(_1200) * _2018;
    bool _2032 = uint(_2012) >= uint(_945);
    float _2034 = trunc(_1992);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    int _2040 = _2020 ? 0 : 1;
    bool _2042 = _1944 != 3;
    bool _2044 = !_2032;
    int _2046 = _2044 ? 0 : (-1);
    int _2048 = ~_945;
    int _2050 = _2048 + 1;
    float _2052 = trunc(_2030);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    int _2058 = ~_1948;
    int _2060 = _2058 + _2046;
    int _2062 = _2060 + 1;
    int _2064 = _2050 * int(_2008);
    int _2066 = _2064 + _1504;
    int _2068 = ~_2040;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    int _2074 = _945 * _2062;
    int _2076 = _2074 + _1686;
    int _2078 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2080 = _2078 != 0;
    int _2082 = _2072;
    bool _2084 = _2042;
    float _2086 = 2.8025969286496341418474591665798e-45;
    if (_2042)
    {
        int _2088 = ~_2040;
        int _2090 = _2088 + 1;
        _2082 = _2090;
    }
    int _2092 = _2082;
    if (_1814)
    {
        bool _2094 = _1982 > 0.5;
        _2084 = _2094;
    }
    bool _2096 = _2084;
    bool _2098 = !_1480;
    int _2100 = _2098 ? _2076 : (-1);
    float _2102 = float(uint(_2066));
    if (!_1814)
    {
        _2086 = _225;
    }
    float _2104 = _2086;
    float _2106 = _2104;
    if (_1814)
    {
        float _2108 = -_225;
        float _2110 = _2096 ? _2108 : _225;
        _2106 = _2110;
    }
    float _2112 = _2106;
    float _2114 = as_type<float>(_991) * _2102;
    int _2116 = _2100 & 3;
    bool _2118 = _2116 != 0;
    bool _2120 = !_2080;
    float _2122 = _2120 ? _225 : as_type<float>(_2016);
    int _2124 = int(_1954) + int(_2056);
    float _2126 = trunc(_2114);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    int _2132 = ~_1015;
    int _2134 = _2132 + 1;
    int _2136 = _2100 & 3;
    bool _2138 = _2136 != 0;
    bool _2140 = uint(_2116) > 1u;
    int _2142 = _2134 * _2124;
    int _2144 = _2142 + _1866;
    int _2146 = int(_1904) + int(_2038);
    int _2148 = ~_931;
    int _2150 = _2148 + 1;
    int _2152 = _2138 ? 0 : 1;
    int _2154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2156 = _2154 != 0;
    int _2158 = _2150 * _2146;
    int _2160 = _2158 + _1414;
    float _2162 = float(uint(_1782));
    bool _2164 = !_2156;
    int _2166 = _2164 ? 0 : 1;
    bool _2168 = uint(_2144) >= uint(_1015);
    float _2170 = as_type<float>(_1200) * _2162;
    int _2172 = ~_2152;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2176;
    if (!_2140)
    {
        int _2180 = ~_2152;
        int _2182 = _2180 + 1;
        _2178 = _2182;
    }
    int _2184 = _2178;
    bool _2186 = uint(_2160) >= uint(_931);
    float _2188 = trunc(_2170);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    bool _2194 = !_2168;
    int _2196 = _2194 ? 0 : (-1);
    bool _2198 = _2116 != 3;
    bool _2200 = !_2186;
    int _2202 = _2200 ? 0 : (-1);
    bool _2204 = uint(_2116) >= 2u;
    int _2206 = ~_2124;
    int _2208 = _2206 + _2196;
    int _2210 = _2208 + 1;
    int _2212 = ~_945;
    int _2214 = _2212 + 1;
    int _2216 = int(_2008) + int(_2130);
    int _2218 = _1015 * _2210;
    int _2220 = _2218 + _1866;
    int _2222 = ~_1015;
    int _2224 = _2222 + 1;
    int _2226 = _2204 ? 0 : 1;
    int _2228 = _2214 * _2216;
    int _2230 = _2228 + _1504;
    int _2232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2234 = _2232 != 0;
    int _2236 = ~_2226;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2240;
    int _2244 = _2184;
    if (_2198)
    {
        int _2246 = ~_2226;
        int _2248 = _2246 + 1;
        _2242 = _2248;
    }
    int _2250 = _2242;
    int _2252 = _2224 * int(_2192);
    int _2254 = _2252 + _1782;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2258 = _2256 != 0;
    bool _2260 = !_2234;
    int _2262 = _2260 ? 0 : 1;
    bool _2264 = uint(_2230) >= uint(_945);
    bool _2266 = !_1718;
    int _2268 = _2266 ? _2220 : (-1);
    bool _2270 = !_2258;
    int _2272 = _2270 ? 0 : 1;
    bool _2274 = !_2264;
    int _2276 = _2274 ? 0 : (-1);
    int _2278 = _2268 & 3;
    bool _2280 = _2278 != 0;
    int _2282 = _2268 & 3;
    bool _2284 = _2282 != 0;
    float _2286 = float(uint(_2254));
    int _2288 = _2280 ? 0 : 1;
    bool _2290 = uint(_2282) > 1u;
    float _2292 = as_type<float>(_1200) * _2286;
    int _2294 = ~_2288;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = trunc(_2292);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    int _2306 = ~_2216;
    int _2308 = _2306 + _2276;
    int _2310 = _2308 + 1;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2320 = _2298;
    if (!_2290)
    {
        int _2322 = ~_2288;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    bool _2328 = uint(_2282) >= 2u;
    float _2330 = 1.0 / _2314;
    int _2332 = ~_1015;
    int _2334 = _2332 + 1;
    int _2336 = _2328 ? 0 : 1;
    bool _2338 = _2282 != 3;
    int _2340 = int(_2192) + int(_2304);
    float _2342 = 1.0 / _2318;
    int _2344 = ~_2336;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = _2334 * _2340;
    int _2352 = _2350 + _1782;
    float _2354 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2354;
    int _2358 = _2348;
    if (_2338)
    {
        int _2360 = ~_2336;
        int _2362 = _2360 + 1;
        _2358 = _2362;
    }
    int _2364 = _2358;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2368 = uint(_2352) >= uint(_1015);
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2372 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2366);
    bool _2374 = !_2368;
    int _2376 = _2374 ? 0 : (-1);
    float _2378 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _2380 = _1098 > 0.5;
    float _2382 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2372);
    float _2384 = -_241;
    int _2386 = _2380 ? as_type<int>(_2384) : as_type<int>(_241);
    int _2388 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2390 = _2388 != 0;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2394 = in.m_56.x;
    float _2396 = in.m_56.y;
    float _2398 = in.m_56.z;
    int _2400 = abs(_2028);
    bool _2402 = !_2390;
    float _2404 = _2402 ? _241 : as_type<float>(_2386);
    float _2406 = fma(_2378, -2.0, _2392);
    bool _2408 = _1106 != 1;
    float _2410 = _1202 + (-1.0);
    int _2412 = ~_2340;
    int _2414 = _2412 + _2376;
    int _2416 = _2414 + 1;
    float _2418 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2406);
    int _2420 = ~_2146;
    int _2422 = _2420 + _2202;
    int _2424 = _2422 + 1;
    int _2426 = abs(_2166);
    int _2428 = _1015 * _2416;
    int _2430 = _2428 + _1782;
    int _2432 = abs(_2326);
    int _2434 = _931 * _2424;
    int _2436 = _2434 + _1414;
    int _2438 = ~_2432;
    int _2440 = _2438 + 1;
    int _2442 = _2440 + 1;
    float _2444 = as_type<float>(_2416);
    if (!_2408)
    {
        _1740 = _1102;
    }
    float _2446 = _1740;
    float _2448 = 0.0;
    float _2450 = _2446;
    if (!_2408)
    {
        _2448 = _1102;
    }
    float _2452 = _2448;
    float _2454 = 0.0;
    float _2456 = _2452;
    if (!_2408)
    {
        _2454 = _1116;
    }
    float _2458 = _2454;
    float _2460 = _197 * _2396;
    float _2462 = _2458;
    if (!_2408)
    {
        _1742 = _1116;
    }
    float _2464 = _1742;
    float _2466 = _1102 * 2.0;
    float _2468 = _2464;
    if (_2408)
    {
        _2450 = _1098;
    }
    float _2470 = _2450;
    float _2472 = _203 * _2396;
    if (_2408)
    {
        _2456 = _1098;
    }
    float _2474 = _2456;
    float _2476 = _209 * _2396;
    if (_2408)
    {
        _2462 = _1102;
    }
    float _2478 = _2462;
    float _2480 = fma(_195, _2394, _2460);
    if (_2408)
    {
        _2468 = _1102;
    }
    float _2482 = _2468;
    float _2484 = floor(_2466);
    bool _2486 = _1108 != 2;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2492 = fma(_201, _2394, _2472);
    float _2494 = fma(_207, _2394, _2476);
    float _2496 = fma(_199, _2398, _2480);
    float _2498 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2500 = fma(_205, _2398, _2492);
    float _2502 = fma(_211, _2398, _2494);
    float _2504 = _1116 * 2.0;
    float _2506 = 1.0 / _2490;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2508;
    float _2512 = 0.0;
    float _2514 = _2498;
    if (_2486)
    {
        _2512 = _1098;
    }
    float _2516 = _2512;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2522 = _2516;
    if (_2486)
    {
        _1744 = _1102;
    }
    float _2524 = _1744;
    float _2526 = _2510 * _1928;
    float _2528 = _2524;
    if (!_2486)
    {
        _2522 = _1116;
    }
    float _2530 = _2522;
    float _2532 = _2500 + _1198;
    if (!_2486)
    {
        _2528 = _1098;
    }
    float _2534 = _2528;
    float _2536 = floor(_2504);
    bool _2538 = _1444 >= 0.0;
    bool _2540 = isnan(_1444);
    bool _2542 = _2538 || _2540;
    bool _2544 = isnan(0.0);
    bool _2546 = _2542 || _2544;
    float _2548 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2550 = _2546 ? 0 : 1;
    bool _2552 = _1444 > 0.0;
    float _2554 = 1.0 / _2520;
    int _2556 = ~_2550;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    bool _2562 = !_1718;
    int _2564 = _2562 ? _2430 : (-1);
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2570 = _2560;
    if (!_2552)
    {
        int _2572 = ~_2550;
        int _2574 = _2572 + 1;
        _2570 = _2574;
    }
    int _2576 = _2570;
    float _2578 = 1.0 / _2568;
    bool _2580 = _2484 >= 0.0;
    bool _2582 = isnan(_2484);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan(0.0);
    bool _2588 = _2584 || _2586;
    int _2590 = _2588 ? 0 : 1;
    bool _2592 = _2484 > 0.0;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2602;
    int _2606 = ~_2590;
    int _2608 = _2606 + 1;
    int _2610 = _2608 + 1;
    float _2612 = 1.0 / _2596;
    float _2614 = _2600 * _2342;
    float _2616 = _2604 * _2330;
    int _2618 = _945 * _2310;
    int _2620 = _2618 + _1504;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2630 = !_1946;
    int _2632 = _2630 ? 0 : 1;
    float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2636 = _2634 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2638 = _2610;
    if (!_2592)
    {
        int _2640 = ~_2590;
        int _2642 = _2640 + 1;
        _2638 = _2642;
    }
    int _2644 = _2638;
    float _2646 = _2624 * _2578;
    bool _2648 = !_1480;
    int _2650 = _2648 ? _2620 : (-1);
    float _2652 = _2628 * _2554;
    bool _2654 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2656 = isnan(_913);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2662 = _2658 || _2660;
    float _2664 = float(_2662);
    float _2666 = _2636 * _2506;
    int _2668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2670 = _2668 != 0;
    int _2672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2674 = _2672 != 0;
    int _2676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2678 = _2676 != 0;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2682 = _913 + _2680;
    bool _2684 = _2536 >= 0.0;
    bool _2686 = isnan(_2536);
    bool _2688 = _2684 || _2686;
    bool _2690 = isnan(0.0);
    bool _2692 = _2688 || _2690;
    float _2694 = -_2664;
    float _2696 = _2694 + 1.0;
    bool _2698 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2700 = isnan(_913);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2706 = _2702 || _2704;
    float _2708 = float(_2706);
    float _2710 = _2356 * _2612;
    int _2712 = _2692 ? 0 : 1;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2716 = _913 + _2714;
    bool _2718 = _2536 > 0.0;
    float _2720 = _2708 * _2696;
    bool _2722 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2724 = isnan(_913);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = -_2708;
    float _2736 = _2734 + 1.0;
    bool _2738 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2740 = isnan(_913);
    bool _2742 = _2738 || _2740;
    bool _2744 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2746 = _2742 || _2744;
    float _2748 = float(_2746);
    float _2750 = fma(_2614, _2716, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2752 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2754 = isnan(_913);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    float _2764 = _2732 * _2736;
    float _2766 = -_2732;
    float _2768 = _2766 + 1.0;
    float _2770 = -_2748;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2526, _2682, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2776 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2778 = isnan(_913);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = _2748 * _2768;
    float _2790 = in.m_70.w;
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _913 + _2792;
    float _2796 = _2762 * _2772;
    float _2798 = -_2762;
    float _2800 = _2798 + 1.0;
    bool _2802 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2804 = isnan(_913);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = fma(_2616, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2816 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2818 = _913 + _2816;
    float _2820 = _2786 * _2800;
    float _2822 = -_2786;
    float _2824 = _2822 + 1.0;
    bool _2826 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2828 = isnan(_913);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = -_2812;
    float _2840 = _2838 + 1.0;
    float _2842 = fma(_2666, _2818, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2846 = _913 + _2844;
    float _2848 = _2812 * _2824;
    float _2850 = _2836 * _2840;
    float _2852 = -_2836;
    float _2854 = _2852 + 1.0;
    float _2856 = fma(_2646, _2846, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2858 = _2774 * _2850;
    float _2860 = fma(_2652, _1174, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2862 = ~_2712;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    float _2868 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2858);
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2872 = _2496 + _2790;
    float _2874 = _2502 + _1148;
    float _2876 = fma(_2750, _2848, _2868);
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2880 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2870);
    float _2882 = fma(_2814, _2820, _2876);
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2886 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2878);
    float _2888 = _1102 + (-0.5);
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2892 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2884);
    float _2894 = _1102 + _1116;
    float _2896 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2890);
    float _2898 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2900 = fma(_2842, _2796, _2882);
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2904 = _2532 + _2902;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2908 = -_2370;
    float _2910 = fma(_2898, 2.0, _2908);
    int _2912 = _2100 >> 31;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2916 = fma(_1224, -2.0, _2906);
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2920 = _2872 + _2918;
    float _2922 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2924 = _2912 & 3;
    float _2926 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2928 = _2866;
    float _2930 = _2874;
    if (!_2718)
    {
        int _2932 = ~_2712;
        int _2934 = _2932 + 1;
        _2928 = _2934;
    }
    int _2936 = _2928;
    float _2938 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2914);
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2942 = _2874 + _2940;
    float _2944 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2922);
    float _2946 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2948 = _1098 + _1116;
    float _2950 = _1098 + (-0.5);
    int _2952 = _2100 + _2924;
    float _2954 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2944);
    float _2956 = -_135;
    float _2958 = fma(_2956, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2910);
    int _2960 = _2952 >> 2;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2966 = _2960 << 4;
    int _2968 = _2966 + 656;
    float _2970 = _2112 + (-0.5);
    bool _2972 = !_2118;
    int _2974 = _2972 ? 0 : 1;
    float _2976 = -_2964;
    float _2978 = fma(_2946, 2.0, _2976);
    float _2980 = fma(_2856, _2788, _2900);
    float _2982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _2984 = uint(int(uint(_2968) >> uint(2)));
    uint _2986 = uint(int(uint(int(_2984)) >> uint(2)));
    int _2988 = int(_2984) & 3;
    float _2990 = (*spvDescriptorSet0.vp_c9)._m0[int(_2986)][_2988];
    int _2992 = int(_2984) + 1;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    int _2996 = _2992 & 3;
    float _2998 = (*spvDescriptorSet0.vp_c9)._m0[int(_2994)][_2996];
    bool _3000 = _2116 != 3;
    float _3002 = -_135;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2978);
    float _3006 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2982);
    float _3008 = fma(_2860, _2764, _2980);
    bool _3010 = !_3000;
    int _3012 = _3010 ? 0 : (-1);
    float _3014 = -_2970;
    float _3016 = -_2418;
    float _3018 = fma(_3014, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3016);
    bool _3020 = _2954 >= 0.0;
    int _3022 = _2968 + 8;
    uint _3024 = uint(int(uint(_3022) >> uint(2)));
    uint _3026 = uint(int(uint(int(_3024)) >> uint(2)));
    int _3028 = int(_3024) & 3;
    float _3030 = (*spvDescriptorSet0.vp_c9)._m0[int(_3026)][_3028];
    int _3032 = int(_3024) + 1;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    int _3036 = _3032 & 3;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[int(_3034)][_3036];
    float _3040 = _1934 + 0.5;
    float _3042 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2962);
    float _3044 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3046 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2958);
    float _3048 = _2404 + 0.5;
    float _3050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3052 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2916);
    float _3054 = _2122 + (-0.5);
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3004);
    float _3058 = fma(_3044, -2.0, _3050);
    int _3060 = abs(_2184);
    float _3062 = -_3054;
    float _3064 = -_3052;
    float _3066 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3064);
    float _3068 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3070 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3072 = fma(_2710, _1182, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3074 = abs(_3012);
    float _3076 = -_3070;
    float _3078 = fma(_2548, 2.0, _3076);
    int _3080 = abs(_2974);
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3084 = fma(_3072, _2720, _3008);
    int _3086 = abs(_2250);
    float _3088 = -_3082;
    float _3090 = fma(_2498, 2.0, _3088);
    int _3092 = ~_3060;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    if (_3020)
    {
        _2514 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3098 = _2514;
    float _3100 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2896);
    int _3102 = ~_3080;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3020)
    {
        float _3110 = _3098 * 5.0;
        _2244 = as_type<int>(_3110);
    }
    int _3112 = _2244;
    bool _3114 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3116 = isnan(0.0);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3122 = _3118 || _3120;
    float _3124 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2892);
    float _3126 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2880);
    if (_3020)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10102 = as_type<float>(_3112);
        out.gl_Position.z = _10102;
    }
    int _3128 = _3096 * as_type<int>(_2998);
    int _3130 = ~_3086;
    int _3132 = _3130 + 1;
    int _3134 = _3132 + 1;
    float _3136 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3138 = int(_3136);
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3142 = _3106 * as_type<int>(_2990);
    int _3144 = _3142 + _3128;
    int _3146 = abs(_2262);
    float _3148 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3058);
    int _3150 = _3134 * as_type<int>(_3030);
    int _3152 = _3150 + _3144;
    float _3154 = exp2(_1514);
    int _3156 = ~_3074;
    int _3158 = _3156 + 1;
    int _3160 = _3158 + 1;
    float _3162 = -_2382;
    float _3164 = _3162 + 1.0;
    int _3166 = ~_3146;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    float _3172 = _3108 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3174 = _1620 + (-0.5);
    int _3176 = _3160 * as_type<int>(_3038);
    int _3178 = _3176 + _3152;
    float _3180 = -_3100;
    float _3182 = _3180 + 1.0;
    float _3184 = float(uint(_3138));
    float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3188 = _3178 * _3170;
    float _3190 = fma(_3164, _2112, _3018);
    float _3192 = -_3182;
    float _3194 = fma(_3192, _1934, _3046);
    int _3196 = _2650 * _3146;
    int _3198 = _3196 + _3188;
    float _3200 = _1896 + 0.5;
    float _3202 = -_3154;
    float _3204 = _3202 + 1.0;
    float _3206 = 1.0 / _3184;
    float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3210 = 1.0 + _3208;
    float _3212 = -_135;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3090);
    float _3216 = fma(_3068, -2.0, _3140);
    float _3218 = _3122 ? _3204 : 0.0;
    out.m_84.x = _3194;
    out.m_84.y = _3190;
    float _3220 = fma(_3172, _3200, _3214);
    bool _3222 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3224 = isnan(1.0);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3230 = _3226 || _3228;
    float _3232 = 1.0 / _3210;
    float _3234 = float(uint(_3198));
    float _3236 = _3186 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3238 = abs(_3138);
    float _3240 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2938);
    float _3242 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2886);
    float _3244 = -_3236;
    float _3246 = -_3148;
    float _3248 = fma(_3244, _3174, _3246);
    int _3250 = ~_3138;
    int _3252 = _3250 + 1;
    float _3254 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3042);
    int _3256 = as_type<int>(_3206) + (-2);
    float _3258 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3006);
    float _3260 = -_135;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3078);
    float _3264 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3216);
    float _3266 = float(uint(_3238));
    float _3268 = as_type<float>(_3256) * _3234;
    float _3270 = _2904 * _2904;
    if (_3230)
    {
        float _3272 = _3218 * _3232;
        _145 = _3272;
    }
    float _3274 = _145;
    float _3276 = trunc(_3268);
    float _3278 = precise::max(_3276, 0.0);
    uint _3280 = uint(_3278);
    int _3282 = _1926 >> 31;
    float _3284 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3084);
    int _3286 = _2268 >> 31;
    float _3288 = fma(_2920, _2920, _3270);
    int _3290 = _3282 & 3;
    float _3292 = -_3254;
    float _3294 = _3292 + 1.0;
    bool _3296 = !_2670;
    int _3298 = _3296 ? 0 : 1;
    float _3300 = 1.0 / _3266;
    int _3302 = _3286 & 3;
    float _3304 = fma(_2942, _2942, _3288);
    int _3306 = _1926 + _3290;
    float _3308 = -_3124;
    float _3310 = _3308 + 1.0;
    int _3312 = _2268 + _3302;
    float _3314 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3316 = -_3294;
    float _3318 = fma(_1896, _3316, _3220);
    float _3320 = rsqrt(_3304);
    int _3322 = _3252 * int(_3280);
    int _3324 = _3322 + _3198;
    float _3326 = -_3310;
    float _3328 = fma(_2404, _3326, _3056);
    int _3330 = abs(_3198);
    float _3332 = -_3258;
    float _3334 = _3332 + 1.0;
    int _3336 = _3306 >> 2;
    out.m_86.x = _3284;
    int _3338 = _3312 >> 2;
    float _3340 = fma(_1620, _3334, _3248);
    float _3342 = float(uint(_3324));
    float _3344 = -_3126;
    float _3346 = _3344 + 1.0;
    int _3348 = as_type<int>(_3300) + (-2);
    float _3350 = -_3240;
    float _3352 = _3350 + 1.0;
    float _3354 = float(uint(_3330));
    float _3356 = as_type<float>(_3256) * _3342;
    int _3358 = _3336 << 4;
    int _3360 = _3358 + 368;
    float _3362 = _3314 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3364 = _3338 << 4;
    int _3366 = _3364 + 800;
    float _3368 = as_type<float>(_3348) * _3354;
    uint _3370 = uint(int(uint(_3360) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    float _3386 = _3362 * _3320;
    float _3388 = fma(_2122, _3346, _3066);
    int _3390 = abs(_3298);
    float _3392 = trunc(_3368);
    float _3394 = precise::max(_3392, 0.0);
    uint _3396 = uint(_3394);
    float _3398 = _2904 * _3386;
    float _3400 = _2920 * _3386;
    out.m_88.x = _3328;
    out.m_88.y = _3388;
    out.m_88.z = _3318;
    out.m_88.w = _3340;
    uint _3402 = uint(int(uint(_3366) >> uint(2)));
    uint _3404 = uint(int(uint(int(_3402)) >> uint(2)));
    int _3406 = int(_3402) & 3;
    float _3408 = (*spvDescriptorSet0.vp_c9)._m0[int(_3404)][_3406];
    int _3410 = int(_3402) + 1;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    int _3414 = _3410 & 3;
    float _3416 = (*spvDescriptorSet0.vp_c9)._m0[int(_3412)][_3414];
    float _3418 = -_3398;
    float _3420 = _2904 + _3418;
    float _3422 = -_3400;
    float _3424 = _2920 + _3422;
    float _3426 = float(_2936);
    float _3428 = _2942 * _3386;
    int _3430 = ~_3238;
    int _3432 = _3430 + 1;
    float _3434 = _3420 * _3420;
    float _3436 = float(_3390);
    float _3438 = trunc(_3356);
    float _3440 = precise::max(_3438, 0.0);
    uint _3442 = uint(_3440);
    int _3444 = ~_3138;
    int _3446 = _3444 + 1;
    float _3448 = fma(_3424, _3424, _3434);
    int _3450 = abs(_2632);
    int _3452 = _3432 * int(_3396);
    int _3454 = _3452 + _3330;
    int _3456 = _3366 + 8;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    uint _3460 = uint(int(uint(int(_3458)) >> uint(2)));
    int _3462 = int(_3458) & 3;
    float _3464 = (*spvDescriptorSet0.vp_c9)._m0[int(_3460)][_3462];
    int _3466 = int(_3458) + 1;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    int _3470 = _3466 & 3;
    float _3472 = (*spvDescriptorSet0.vp_c9)._m0[int(_3468)][_3470];
    float _3474 = _3436 * _3426;
    float _3476 = _3314;
    float _3478 = _3320;
    float _3480 = as_type<float>(_3450);
    if (_3020)
    {
        out.m_63.x = 0.0;
    }
    float _3482 = float(uint(_3454));
    float _3484 = -_3428;
    float _3486 = _2942 + _3484;
    int _3488 = ~_2400;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = _3360 + 8;
    uint _3496 = uint(int(uint(_3494) >> uint(2)));
    uint _3498 = uint(int(uint(int(_3496)) >> uint(2)));
    int _3500 = int(_3496) & 3;
    float _3502 = (*spvDescriptorSet0.vp_c9)._m0[int(_3498)][_3500];
    int _3504 = int(_3496) + 1;
    uint _3506 = uint(int(uint(_3504) >> uint(2)));
    int _3508 = _3504 & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    float _3512 = as_type<float>(_3348) * _3482;
    bool _3514 = !_2284;
    int _3516 = _3514 ? 0 : 1;
    int _3518 = int(_3280) + int(_3442);
    float _3520 = trunc(_3512);
    float _3522 = precise::max(_3520, 0.0);
    uint _3524 = uint(_3522);
    bool _3526 = _1944 != 3;
    bool _3528 = _931 == 0;
    int _3530 = _3446 * _3518;
    int _3532 = _3530 + _3198;
    int _3534 = ~_3238;
    int _3536 = _3534 + 1;
    float _3538 = _1310 + (-0.5);
    bool _3540 = !_3528;
    int _3542 = _3540 ? _2436 : (-1);
    int _3544 = _3492 * as_type<int>(_3384);
    bool _3546 = !_3526;
    int _3548 = _3546 ? 0 : (-1);
    bool _3550 = uint(_3532) >= uint(_3138);
    int _3552 = int(_3396) + int(_3524);
    bool _3554 = !_3550;
    int _3556 = _3554 ? 0 : (-1);
    int _3558 = _2442 * as_type<int>(_3416);
    int _3560 = abs(_3516);
    int _3562 = _3536 * _3552;
    int _3564 = _3562 + _3330;
    int _3566 = ~_3560;
    int _3568 = _3566 + 1;
    int _3570 = _3568 + 1;
    bool _3572 = _2282 != 3;
    int _3574 = ~_3450;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    int _3580 = _3570 * as_type<int>(_3408);
    int _3582 = _3580 + _3558;
    int _3584 = ~_3518;
    int _3586 = _3584 + _3556;
    int _3588 = _3586 + 1;
    bool _3590 = !_3572;
    int _3592 = _3590 ? 0 : (-1);
    int _3594 = _3578 * as_type<int>(_3376);
    int _3596 = _3594 + _3544;
    bool _3598 = uint(_3564) >= uint(_3238);
    int _3600 = _3138 * _3588;
    int _3602 = _3600 + _3198;
    int _3604 = abs(_2092);
    bool _3606 = !_3598;
    int _3608 = _3606 ? 0 : (-1);
    bool _3610 = _3138 == 0;
    int _3612 = abs(_2364);
    bool _3614 = !_3610;
    int _3616 = _3614 ? _3602 : (-1);
    float _3618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3620 = _3138 == 0;
    int _3622 = ~_3612;
    int _3624 = _3622 + 1;
    int _3626 = _3624 + 1;
    int _3628 = _3198 ^ _3138;
    float _3630 = -_3242;
    float _3632 = _3630 + 1.0;
    int _3634 = abs(_3548);
    int _3636 = _3626 * as_type<int>(_3464);
    int _3638 = _3636 + _3582;
    uint _3640 = uint(int(uint(_3628) >> uint(31)));
    float _3642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3644 = ~_3604;
    int _3646 = _3644 + 1;
    int _3648 = _3646 + 1;
    int _3650 = abs(_3592);
    int _3652 = ~_3608;
    int _3654 = _3552 + _3652;
    int _3656 = _3654 + 1;
    int _3658 = _3648 * as_type<int>(_3502);
    int _3660 = _3658 + _3596;
    int _3662 = ~int(_3640);
    int _3664 = _3662 + 1;
    int _3666 = ~_3634;
    int _3668 = _3666 + 1;
    int _3670 = _3668 + 1;
    int _3672 = ~_3650;
    int _3674 = _3672 + 1;
    int _3676 = _3674 + 1;
    int _3678 = _3656 ^ _3664;
    int _3680 = _3670 * as_type<int>(_3510);
    int _3682 = _3680 + _3660;
    int _3684 = abs(_2272);
    int _3686 = _3676 * as_type<int>(_3472);
    int _3688 = _3686 + _3638;
    int _3690 = ~_2426;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    float _3696 = in.m_90.x;
    float _3698 = in.m_90.y;
    float _3700 = in.m_90.z;
    int _3702 = ~_3664;
    int _3704 = _3702 + _3678;
    int _3706 = _3704 + 1;
    float _3708 = _3642 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3710 = ~_3684;
    int _3712 = _3710 + 1;
    int _3714 = _3712 + 1;
    int _3716 = _3682 * _3694;
    bool _3718 = !_3620;
    int _3720 = _3718 ? _3706 : (-1);
    float _3722 = _1288 + 0.5;
    float _3724 = float(_3616);
    int _3726 = _3688 * _3714;
    float _3728 = float(_3720);
    float _3730 = _3618 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3732 = _3542 * _2426;
    int _3734 = _3732 + _3716;
    float _3736 = fma(_3708, _3724, _3262);
    int _3738 = _2564 * _3684;
    int _3740 = _3738 + _3726;
    float _3742 = -_3264;
    float _3744 = fma(_3730, _3728, _3742);
    float _3746 = _3474 * (-2.0);
    float _3748 = fma(_3708, _3722, _3736);
    float _3750 = -_3730;
    float _3752 = fma(_3750, _3538, _3744);
    float _3754 = float(_3734);
    float _3756 = -_3352;
    float _3758 = fma(_1288, _3756, _3748);
    float _3760 = float(_3740);
    float _3762 = fma(_1310, _3632, _3752);
    float _3764 = fma(_2926, _3746, _2926);
    float _3766 = fma(_3746, _3696, _3696);
    bool _3768 = !_2674;
    int _3770 = _3768 ? 0 : 1;
    out.m_92.x = _3754;
    bool _3772 = !_2678;
    int _3774 = _3772 ? 0 : 1;
    int _3776 = abs(_3770);
    out.m_92.w = _3760;
    out.m_94.x = _3758;
    out.m_94.y = _3762;
    float _3778 = _3700;
    int _3780 = _3564;
    float _3782 = _3510;
    float _3784 = _3486;
    if (_3020)
    {
        return out;
    }
    float _3786 = -_3398;
    float _3788 = _2532 + _3786;
    float _3790 = float(_2576);
    float _3792 = -_3400;
    float _3794 = _2872 + _3792;
    float _3796 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3766);
    float _3798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3800 = _3788 + _3798;
    float _3802 = float(_3776);
    float _3804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3806 = _3794 + _3804;
    float _3808 = fma(_3764, _3274, _3796);
    float _3810 = _3800 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3812 = -_3428;
    float _3814 = _2874 + _3812;
    float _3816 = _3802 * _3790;
    float _3818 = fma(_3806, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3810);
    float _3820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3822 = _3814 + _3820;
    float _3824 = _2894 + (-1.0);
    int _3826 = abs(_3774);
    float _3828 = fma(_3486, _3486, _3448);
    float _3830 = fma(_3822, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3818);
    float _3832 = _3816 * (-2.0);
    float _3834 = fma(_3824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3836 = float(_2644);
    float _3838 = _2948 + (-1.0);
    float _3840 = fma(_3832, _3698, _3698);
    float _3842 = float(_3826);
    float _3844 = fma(_3834, _3832, _3834);
    bool _3846 = _3830 >= 0.0;
    float _3848 = fma(_2888, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3840);
    float _3850 = _3842 * _3836;
    float _3852 = _3808 * 0.15915493667125701904296875;
    float _3854 = fma(_3844, _3274, _3848);
    float _3856 = sqrt(_3828);
    float _3858 = _3850 * (-2.0);
    float _3860 = fma(_3838, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3862 = _3854 * 0.15915493667125701904296875;
    float _3864 = _1116 + (-0.5);
    float _3866 = fma(_3858, _3700, _3700);
    float _3868 = fma(_3860, _3858, _3860);
    float _3870 = _3794;
    if (_3846)
    {
        _3778 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3872 = _3778;
    float _3874 = _3852 * 6.283185482025146484375;
    float _3876 = sin(_3874);
    float _3878 = fma(_3864, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3866);
    int _3880 = as_type<int>(_3872);
    if (_3846)
    {
        out.m_63.x = 0.0;
    }
    if (_3846)
    {
        float _3882 = _3872 * 5.0;
        _3880 = as_type<int>(_3882);
    }
    int _3884 = _3880;
    float _3886 = fma(_3868, _3274, _3878);
    float _3888 = _3852 * 6.283185482025146484375;
    float _3890 = cos(_3888);
    if (_3846)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11211 = as_type<float>(_3884);
        out.gl_Position.z = _11211;
    }
    float _3892 = _3886 * 0.15915493667125701904296875;
    float _3894 = _3862 * 6.283185482025146484375;
    float _3896 = sin(_3894);
    float _3898 = _3862 * 6.283185482025146484375;
    float _3900 = cos(_3898);
    if (_3846)
    {
        return out;
    }
    float _3902 = _3892 * 6.283185482025146484375;
    float _3904 = cos(_3902);
    float _3906 = _3320 * _3856;
    float _3908 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3912 = _3876 * _3896;
    float _3914 = _3314 * _3906;
    float _3916 = _3906 * _3908;
    float _3918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3920 = _3892 * 6.283185482025146484375;
    float _3922 = sin(_3920);
    float _3924 = _3890 * _3896;
    float _3926 = _3910 * _3916;
    float _3928 = _3890 * _3900;
    float _3930 = _3876 * _3900;
    float _3932 = _3918 * _3914;
    float _3934 = _3890 * _3904;
    float _3936 = _3900 * _3904;
    float _3938 = _3876 * _3904;
    float _3940 = _3896 * _3904;
    float _3942 = _3934 * _3926;
    float _3944 = _3906 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3946 = _3944 * 0.5;
    float _3948 = fma(_3922, _3928, _3912);
    float _3950 = -_3930;
    float _3952 = fma(_3922, _3924, _3950);
    float _3954 = -_3926;
    float _3956 = _3922 * _3954;
    float _3958 = -_3924;
    float _3960 = fma(_3922, _3930, _3958);
    float _3962 = fma(_3948, _3932, _3942);
    float _3964 = _3938 * _3926;
    float _3966 = fma(_3936, _3932, _3956);
    float _3968 = fma(_3922, _3912, _3928);
    float _3970 = fma(_3952, _3946, _3962);
    float _3972 = fma(_3960, _3932, _3964);
    float _3974 = fma(_3940, _3946, _3966);
    float _3976 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = fma(_3968, _3946, _3972);
    float _3980 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3982 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3984 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3986 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3980);
    float _3988 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3982);
    float _3990 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3984);
    float _3992 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3986);
    float _3994 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3988);
    float _3996 = _3990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3998 = _3992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4000 = _3994 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4002 = _2874 + _3996;
    float _4004 = _2872 + _3998;
    float _4006 = _2532 + _4000;
    float _4008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4010 = _4002 + _4008;
    float _4012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4014 = _4004 + _4012;
    float _4016 = _4010 * _4010;
    float _4018 = fma(_4014, _4014, _4016);
    float _4020 = sqrt(_4018);
    bool _4022 = _4020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4024 = _3994;
    float _4026 = _4016;
    float _4028 = _4000;
    if (!_4022)
    {
        _4024 = _4004;
    }
    float _4030 = _4024;
    float _4032 = _4030;
    if (!_4022)
    {
        _4026 = _4002;
    }
    float _4034 = _4026;
    float _4036 = _4034;
    if (!_4022)
    {
        _4028 = _4006;
    }
    float _4038 = _4028;
    bool _4040 = !_4022;
    float _4042 = _4038;
    if (!_4040)
    {
        float _4044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4048 = _4020 + _4046;
        float _4050 = rsqrt(_4018);
        float _4052 = _4048 * _4044;
        float _4054 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4056 = _4052 * 0.15915493667125701904296875;
        float _4058 = _4056 * 6.283185482025146484375;
        float _4060 = cos(_4058);
        float _4062 = _4056 * 6.283185482025146484375;
        float _4064 = sin(_4062);
        float _4066 = _4060 + (-1.0);
        float _4068 = _4066 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4070 = fma(_4064, _4054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4072 = fma(_4006, _4060, _4068);
        float _4074 = _4050 * _4070;
        float _4076 = fma(_4014, _4074, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4078 = fma(_4010, _4074, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4042 = _4072;
        _4032 = _4076;
        _4036 = _4078;
    }
    float _4080 = _4042;
    float _4082 = _4032;
    float _4084 = _4036;
    float _4086 = -_2532;
    float _4088 = _4086 + _4080;
    float _4090 = -_2872;
    float _4092 = _4090 + _4082;
    float _4094 = -_2874;
    float _4096 = _4094 + _4084;
    float _4098 = _4088 * _4088;
    float _4100 = fma(_4092, _4092, _4098);
    float _4102 = fma(_4096, _4096, _4100);
    float _4104 = sqrt(_4102);
    bool _4106 = _4104 > 0.0;
    bool _4108 = !_4106;
    float _4110 = _4080;
    float _4112 = _4082;
    float _4114 = _4084;
    if (!_4108)
    {
        float _4116 = _245 * _245;
        float _4118 = rsqrt(_4102);
        float _4120 = fma(_237, _237, _4116);
        float _4122 = fma(_247, _247, _4120);
        float _4124 = sqrt(_4122);
        float _4126 = _4092 * _4118;
        float _4128 = _4088 * _4118;
        float _4130 = _4096 * _4118;
        bool _4132 = _4124 > 0.0;
        bool _4134 = !_4132;
        _2930 = _4126;
        if (!_4134)
        {
            float _4136 = rsqrt(_4122);
            float _4138 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4140 = _245 * _4136;
            float _4142 = _237 * _4136;
            float _4144 = _4128 * _4140;
            float _4146 = _247 * _4136;
            float _4148 = fma(_4126, _4142, _4144);
            float _4150 = _4138 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4152 = fma(_4130, _4146, _4148);
            float _4154 = _4152 * _4150;
            float _4156 = fma(_237, _4154, _4082);
            float _4158 = fma(_245, _4154, _4080);
            float _4160 = fma(_247, _4154, _4084);
            _4110 = _4158;
            _4112 = _4156;
            _4114 = _4160;
        }
    }
    float _4162 = _4110;
    float _4164 = _4112;
    float _4166 = _4114;
    float _4168 = _2930;
    float _4170 = -_3398;
    float _4172 = _4170 + _4162;
    float _4174 = -_3400;
    float _4176 = _4174 + _4164;
    float _4178 = -_3428;
    float _4180 = _4178 + _4166;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4184 = _4172 + _4182;
    float _4186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4188 = _4176 + _4186;
    float _4190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4192 = _4180 + _4190;
    float _4194 = _4184 * _4184;
    float _4196 = fma(_4188, _4188, _4194);
    float _4198 = _3788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4200 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4202 = fma(_4192, _4192, _4196);
    float _4204 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4198);
    float _4206 = rsqrt(_4202);
    float _4208 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4204);
    float _4210 = _3788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4212 = _4208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4214 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4210);
    float _4216 = sqrt(_4202);
    float _4218 = 1.0 / _4212;
    float _4220 = _4206 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4222 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4214);
    float _4224 = _4188 * _4220;
    float _4226 = _4192 * _4220;
    float _4228 = _4222 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4230 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4232 = _4224 * _4224;
    float _4234 = _4226 * _4226;
    float _4236 = _4228 + _4212;
    float _4238 = _3788 + _4230;
    float _4240 = _4232 + _4234;
    float _4242 = _4236 * _4218;
    float _4244 = _4242 * 0.5;
    float _4246 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4248 = sqrt(_4240);
    float _4250 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4252 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4254 = fma(_4244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4252);
    float _4256 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4246);
    float _4258 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4250);
    float _4260 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4256);
    float _4262 = 1.0 / _4254;
    float _4264 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4258);
    float _4266 = _4260 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4268 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4270 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4272 = trunc(_4266);
    int _4274 = int(_4272);
    float _4276 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4278 = _4248 + _4276;
    float _4280 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4282 = _4262 * _4280;
    float _4284 = trunc(_4268);
    int _4286 = int(_4284);
    bool _4288 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4290 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4292 = _4168;
    float _4294 = _4240;
    int _4296 = 2;
    float _4298 = _4232;
    float _4300 = _4234;
    if (_4270)
    {
        float _4302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4292 = _4302;
    }
    float _4304 = _4292;
    int _4306 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4308 = _4274 + _4306;
    int _4310 = _4308 + 1;
    bool _4312 = !_4288;
    int _4314 = _4312 ? 0 : 1;
    bool _4316 = _4310 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4318 = _4310;
    if (_4270)
    {
        float _4320 = rsqrt(_4240);
        _4294 = _4320;
    }
    float _4322 = _4294;
    int _4324 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4326 = _4286 + _4324;
    int _4328 = _4326 + 1;
    int _4330 = as_type<int>(_4322);
    if (!_4288)
    {
        _4296 = 1;
    }
    int _4332 = _4296;
    float _4334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4336 = _4310 | _4328;
    int _4338 = _4332;
    float _4340 = as_type<float>(_4336);
    if (!_4290)
    {
        _4338 = _4314;
    }
    int _4342 = _4338;
    bool _4344 = _4336 < 0;
    bool _4346 = _4344 || _4316;
    if (_4270)
    {
        float _4348 = _4278 * _4304;
        _4340 = _4348;
    }
    float _4350 = _4340;
    bool _4352 = _4328 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4354 = _4352 || _4346;
    if (_4270)
    {
        float _4356 = _4350 * 0.15915493667125701904296875;
        _2444 = _4356;
    }
    float _4358 = _2444;
    int _4360 = _4342 << 6;
    float _4362 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4364 = precise::max(0.0, _4334);
    int _4366 = as_type<int>(_4014);
    if (_4270)
    {
        float _4368 = _4358 * 6.283185482025146484375;
        float _4370 = sin(_4368);
        _4366 = as_type<int>(_4370);
    }
    int _4372 = _4366;
    int _4374 = _4360 + 96;
    uint _4376 = uint(int(uint(_4374) >> uint(2)));
    uint _4378 = uint(int(uint(int(_4376)) >> uint(2)));
    int _4380 = int(_4376) & 3;
    float _4382 = (*spvDescriptorSet0.vp_c15)._m0[int(_4378)][_4380];
    int _4384 = int(_4376) + 1;
    uint _4386 = uint(int(uint(_4384) >> uint(2)));
    int _4388 = _4384 & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    if (!_4270)
    {
        _3476 = _4224;
    }
    float _4392 = _3476;
    float _4394 = -_4220;
    float _4396 = -_4364;
    float _4398 = fma(_4184, _4394, _4396);
    float _4400 = _4392;
    if (!_4354)
    {
        int _4402 = _4328 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4404 = _4402 + _4310;
        _4318 = _4404;
    }
    int _4406 = _4318;
    int _4408 = _4360 + 48;
    uint _4410 = uint(int(uint(_4408) >> uint(2)));
    uint _4412 = uint(int(uint(int(_4410)) >> uint(2)));
    int _4414 = int(_4410) & 3;
    float _4416 = (*spvDescriptorSet0.vp_c15)._m0[int(_4412)][_4414];
    int _4418 = int(_4410) + 1;
    uint _4420 = uint(int(uint(_4418) >> uint(2)));
    int _4422 = _4418 & 3;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[int(_4420)][_4422];
    float _4426 = _2926;
    if (_4270)
    {
        float _4428 = _4358 * 6.283185482025146484375;
        float _4430 = cos(_4428);
        _4426 = _4430;
    }
    float _4432 = _4426;
    if (_4270)
    {
        float _4434 = _4398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3478 = _4434;
    }
    float _4436 = _3478;
    float _4438 = _4436;
    if (!_4354)
    {
        int _4440 = _4406 << 2;
        _3780 = _4440;
    }
    int _4442 = _3780;
    int _4444 = _4372;
    int _4446 = _4442;
    if (_4270)
    {
        float _4448 = fma(as_type<float>(_4372), _4436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3480 = _4448;
    }
    float _4450 = _3480;
    int _4452 = _4360 + 64;
    uint _4454 = uint(int(uint(_4452) >> uint(2)));
    uint _4456 = uint(int(uint(int(_4454)) >> uint(2)));
    int _4458 = int(_4454) & 3;
    float _4460 = (*spvDescriptorSet0.vp_c15)._m0[int(_4456)][_4458];
    int _4462 = int(_4454) + 1;
    uint _4464 = uint(int(uint(_4462) >> uint(2)));
    int _4466 = _4462 & 3;
    float _4468 = (*spvDescriptorSet0.vp_c15)._m0[int(_4464)][_4466];
    float _4470 = _4450;
    if (!_4270)
    {
        _4438 = _4398;
    }
    float _4472 = _4438;
    float _4474 = floor(_4362);
    float _4476 = _4472;
    if (_4270)
    {
        float _4478 = _4322 * _4450;
        _4470 = _4478;
    }
    float _4480 = _4470;
    if (!_4354)
    {
        uint _4482 = uint(int(uint(_4406) >> uint(2)));
        _4444 = int(_4482);
    }
    int _4484 = _4444;
    float _4486 = as_type<float>(_4484);
    if (!_4354)
    {
        int _4488 = 12 & _4442;
        _4446 = _4488;
    }
    int _4490 = _4446;
    if (_4270)
    {
        float _4492 = _4224 * _4480;
        _4400 = _4492;
    }
    float _4494 = _4400;
    int _4496 = _4360 + 104;
    uint _4498 = uint(int(uint(_4496) >> uint(2)));
    uint _4500 = uint(int(uint(int(_4498)) >> uint(2)));
    int _4502 = int(_4498) & 3;
    float _4504 = (*spvDescriptorSet0.vp_c15)._m0[int(_4500)][_4502];
    int _4506 = int(_4498) + 1;
    uint _4508 = uint(int(uint(_4506) >> uint(2)));
    int _4510 = _4506 & 3;
    float _4512 = (*spvDescriptorSet0.vp_c15)._m0[int(_4508)][_4510];
    if (_4270)
    {
        float _4514 = _4432 + (-1.0);
        _3782 = _4514;
    }
    float _4516 = _3782;
    float _4518 = _4516;
    if (!_4354)
    {
        int _4520 = _4484 << 4;
        int _4522 = _4520 + _4490;
        _4330 = _4522;
    }
    int _4524 = _4330;
    if (_4270)
    {
        float _4526 = _4494 * _4494;
        _4298 = _4526;
    }
    float _4528 = _4298;
    float _4530 = floor(_4200);
    if (_4270)
    {
        float _4532 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3784 = _4532;
    }
    float _4534 = _3784;
    if (!_4270)
    {
        _4518 = _4226;
    }
    float _4536 = _4518;
    float _4538 = _4536;
    if (_4270)
    {
        float _4540 = _4226 * _4480;
        _4538 = _4540;
    }
    float _4542 = _4538;
    int _4544 = _4360 + 56;
    uint _4546 = uint(int(uint(_4544) >> uint(2)));
    uint _4548 = uint(int(uint(int(_4546)) >> uint(2)));
    int _4550 = int(_4546) & 3;
    float _4552 = (*spvDescriptorSet0.vp_c15)._m0[int(_4548)][_4550];
    int _4554 = int(_4546) + 1;
    uint _4556 = uint(int(uint(_4554) >> uint(2)));
    int _4558 = _4554 & 3;
    float _4560 = (*spvDescriptorSet0.vp_c15)._m0[int(_4556)][_4558];
    if (_4270)
    {
        float _4562 = fma(_4398, _4432, _4534);
        _4476 = _4562;
    }
    float _4564 = _4476;
    if (_4270)
    {
        float _4566 = _4542 * _4542;
        _4300 = _4566;
    }
    float _4568 = _4300;
    float _4570 = -_4474;
    float _4572 = _4362 + _4570;
    float _4574 = fma(_4564, _4564, _4528);
    if (!_4354)
    {
        float _4576 = floor(_4266);
        _4486 = _4576;
    }
    float _4578 = _4486;
    int _4580 = _4360 + 72;
    uint _4582 = uint(int(uint(_4580) >> uint(2)));
    uint _4584 = uint(int(uint(int(_4582)) >> uint(2)));
    int _4586 = int(_4582) & 3;
    float _4588 = (*spvDescriptorSet0.vp_c15)._m0[int(_4584)][_4586];
    int _4590 = int(_4582) + 1;
    uint _4592 = uint(int(uint(_4590) >> uint(2)));
    int _4594 = _4590 & 3;
    float _4596 = (*spvDescriptorSet0.vp_c15)._m0[int(_4592)][_4594];
    float _4598 = _4574 + _4568;
    float _4600 = rsqrt(_4598);
    float _4602 = _4238 * _4390;
    int _4604 = _4360 + 80;
    uint _4606 = uint(int(uint(_4604) >> uint(2)));
    uint _4608 = uint(int(uint(int(_4606)) >> uint(2)));
    int _4610 = int(_4606) & 3;
    float _4612 = (*spvDescriptorSet0.vp_c15)._m0[int(_4608)][_4610];
    int _4614 = int(_4606) + 1;
    uint _4616 = uint(int(uint(_4614) >> uint(2)));
    int _4618 = _4614 & 3;
    float _4620 = (*spvDescriptorSet0.vp_c15)._m0[int(_4616)][_4618];
    float _4622 = fma(_3794, _4382, _4602);
    float _4624 = _4238 * _4424;
    float _4626 = _4432;
    float _4628 = _4624;
    if (!_4354)
    {
        int _4630 = _4524 + 400;
        uint _4632 = uint(int(uint(_4630) >> uint(2)));
        uint _4634 = uint(int(uint(int(_4632)) >> uint(2)));
        int _4636 = int(_4632) & 3;
        float _4638 = (*spvDescriptorSet0.vp_c15)._m0[int(_4634)][_4636];
        _4626 = _4638;
    }
    float _4640 = _4626;
    float _4642 = _4600 * _4494;
    float _4644 = _4238 * _4468;
    float _4646 = fma(_3794, _4416, _4624);
    float _4648 = _4600 * _4564;
    float _4650 = _4600 * _4542;
    float _4652 = fma(_3794, _4460, _4644);
    float _4654 = _4642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_4354)
    {
        float _4656 = floor(_4268);
        _4628 = _4656;
    }
    float _4658 = _4628;
    float _4660 = fma(_3814, _4504, _4622);
    float _4662 = -_4654;
    float _4664 = fma(_4648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4662);
    float _4666 = fma(_3814, _4552, _4646);
    float _4668 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4670 = _4660 + _4512;
    float _4672 = _4666 + _4560;
    float _4674 = fma(_3814, _4588, _4652);
    float _4676 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4668);
    float _4678 = 1.0 / _4670;
    int _4680 = _4360 + 88;
    uint _4682 = uint(int(uint(_4680) >> uint(2)));
    uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
    int _4686 = int(_4682) & 3;
    float _4688 = (*spvDescriptorSet0.vp_c15)._m0[int(_4684)][_4686];
    int _4690 = int(_4682) + 1;
    uint _4692 = uint(int(uint(_4690) >> uint(2)));
    int _4694 = _4690 & 3;
    float _4696 = (*spvDescriptorSet0.vp_c15)._m0[int(_4692)][_4694];
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4700 = fma(_4216, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4698);
    float _4702 = precise::clamp(_4700, 0.0, 1.0);
    float _4704 = _4674 + _4596;
    float _4706 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4708 = -_4650;
    float _4710 = fma(_4708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4664);
    float _4712 = -_4702;
    float _4714 = _4712 + 1.0;
    float _4716 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4676);
    float _4718 = _4238 * _4620;
    float _4720 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4722 = abs(_4714);
    float _4724 = log2(_4722);
    float _4726 = _4716 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4728 = fma(_3794, _4612, _4718);
    float _4730 = fma(_4710, 0.5, 0.5);
    float _4732 = _4726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4734 = _4672 * _4678;
    float _4736 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4738 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4706);
    float _4740 = _4704 * _4678;
    bool _4742 = _4734 >= 0.0;
    float _4744 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4736);
    float _4746 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4738);
    float _4748 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _4750 = _4734 <= 1.0;
    bool _4752 = _4750 && _4742;
    float _4754 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4744);
    float _4756 = _4746 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4758 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4748);
    bool _4760 = _4740 >= 0.0;
    bool _4762 = _4760 && _4752;
    float _4764 = _4754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4766 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4768 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4758);
    bool _4770 = _4740 <= 1.0;
    bool _4772 = _4770 && _4762;
    float _4774 = -_4732;
    float _4776 = fma(_4774, _4720, 1.0);
    float _4778 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4766);
    float _4780 = fma(_4710, -0.5, 0.5);
    float _4782 = _4768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4784 = _4724 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4786 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4778);
    float _4788 = sqrt(_4780);
    float _4790 = fma(_4730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4792 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4786);
    float _4794 = _4758;
    float _4796 = _4732;
    float _4798 = _4784;
    float _4800 = _4792;
    if (_4772)
    {
        float _4802 = float(_4342);
        _4794 = _4802;
    }
    float _4804 = _4794;
    if (!_4354)
    {
        float _4806 = rint(_4640);
        float _4808 = precise::max(_4806, 0.0);
        uint _4810 = uint(_4808);
        uint _4812 = clamp(_4810, 0u, 65535u);
        _4796 = as_type<float>(_4812);
    }
    float _4814 = _4796;
    float _4816 = fma(_3814, _4688, _4728);
    float _4818 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4820 = _4816 + _4696;
    float _4822 = fma(_4730, _4790, -0.212114393711090087890625);
    float _4824 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4826 = exp2(_4784);
    float _4828 = -_4530;
    float _4830 = _4200 + _4828;
    float _4832 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4818);
    float _4834 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4824);
    float _4836 = _4788 * 0.636619746685028076171875;
    float _4838 = _4820 * _4678;
    float _4840 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4832);
    float _4842 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4834);
    float _4844 = log2(_4776);
    float _4846 = _4842;
    if (!_4354)
    {
        float _4848 = -_4658;
        float _4850 = _4268 + _4848;
        _4798 = _4850;
    }
    float _4852 = _4798;
    float _4854 = fma(_4730, _4822, 1.570728778839111328125);
    float _4856 = _4648 + 1.0;
    float _4858 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4840);
    float _4860 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4842);
    float _4862 = -_4854;
    float _4864 = fma(_4836, _4862, 1.0);
    if (!_4354)
    {
        float _4866 = -_4578;
        float _4868 = _4266 + _4866;
        _4846 = _4868;
    }
    float _4870 = _4846;
    float _4872 = 1.0 / _4792;
    float _4874 = -_4648;
    float _4876 = fma(_4826, _4856, _4874);
    float _4878 = _4804;
    if (_4772)
    {
        float _4880 = rint(_4804);
        float _4882 = precise::max(_4880, 0.0);
        uint _4884 = uint(_4882);
        uint _4886 = clamp(_4884, 0u, 65535u);
        _4878 = as_type<float>(_4886);
    }
    float _4888 = _4878;
    float _4890 = _4844 * 0.693147182464599609375;
    float _4892 = fma(_4876, 0.5, 0.5);
    float2 _12870 = float2(_4572, _4830);
    float _4894 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12870, float2(0.0), isnan(_12870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12870, float2(0.0), isnan(_12870)), level(0.0)).x;
    float _4896 = as_type<float>(_4342);
    if (!_4354)
    {
        float3 _12888 = float3(_4870, _4852, float(as_type<int>(_4814)));
        float3 _12892 = select(_12888, float3(0.0), isnan(_12888));
        float _4898 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12892.xy, uint(rint(_12892.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12892.xy, uint(rint(_12892.z)), level(0.0)).x;
        _4896 = _4898;
    }
    float _4900 = _4896;
    float _4902 = _4890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4904 = _4858 * _4872;
    float _4906 = _4860 * _4872;
    float _4908 = fma(_4904, 0.5, 0.5);
    float _4910 = fma(_4906, -0.5, 0.5);
    float _4912 = _4888;
    if (_4772)
    {
        float3 _12921 = float3(_4734, _4740, float(as_type<int>(_4888)));
        float3 _12923 = select(_12921, float3(0.0), isnan(_12921));
        float _4914 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12923.xy, uint(rint(_12923.z)), _4838, level(0.0));
        _4912 = _4914;
    }
    float _4916 = _4912;
    float3 _12933 = float3(_4908, _4910, _4902);
    float _4918 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12933, float3(0.0), isnan(_12933)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12933, float3(0.0), isnan(_12933)), level(0.0)).x;
    float3 _12942 = float3(_4908, _4910, _4902);
    float4 _4921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12942, float3(0.0), isnan(_12942)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12942, float3(0.0), isnan(_12942)), level(0.0)).xyzw;
    float _4923 = _4921.x;
    float _4925 = _4921.y;
    float _4927 = _4921.z;
    float _4929 = _4921.w;
    float2 _12958 = float2(_4864, _4892);
    float3 _4933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12958, float2(0.0), isnan(_12958)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12958, float2(0.0), isnan(_12958)), level(0.0)).xyz;
    float _4935 = _4933.x;
    float _4937 = _4933.y;
    float _4939 = _4933.z;
    float _4941 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4943 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4945 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4947 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4949 = fma(_4941, _4941, 1.0);
    float _4951 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4953 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4943);
    float _4955 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4957 = rsqrt(_4949);
    float _4959 = -_3922;
    float _4961 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4947);
    float _4963 = -_3922;
    float _4965 = fma(_4963, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4951);
    float _4967 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4969 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4945);
    float _4971 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4953);
    float _4973 = -_3922;
    float _4975 = fma(_4973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4955);
    float _4977 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4967);
    float _4979 = abs(_4282);
    float _4981 = log2(_4979);
    float _4983 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4969);
    float _4985 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4987 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4977);
    float _4989 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4961);
    float _4991 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4965);
    float _4993 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4975);
    float _4995 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4985);
    float _4997 = _4941 * _4957;
    float _4999 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5001 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4995);
    float _5003 = -_4971;
    float _5005 = _4997 * _5003;
    float _5007 = -_4983;
    float _5009 = _4997 * _5007;
    float _5011 = -_4987;
    float _5013 = _4997 * _5011;
    float _5015 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4999);
    float _5017 = _4981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5019 = fma(_4957, _4989, _5005);
    float _5021 = fma(_4957, _4991, _5009);
    float _5023 = fma(_4957, _4993, _5013);
    float _5025 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5027 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5029 = exp2(_5017);
    float _5031 = _4724 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5033 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5025);
    float _5035 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5027);
    float _5037 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5001);
    float _5039 = _4792 * 0.5;
    out.m_96.x = _5019;
    out.m_96.y = _5021;
    out.m_96.z = _5023;
    bool _5041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5043 = isnan(0.5);
    bool _5045 = _5041 || _5043;
    bool _5047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5049 = _5045 || _5047;
    float _5051 = fma(_4860, -0.5, _5039);
    float _5053 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5033);
    float _5055 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5035);
    float _5057 = exp2(_5031);
    float _5059 = _5037 + _4792;
    float _5061 = _4858 + _4792;
    out.gl_Position.x = _4858;
    out.gl_Position.y = _4860;
    out.gl_Position.z = _5037;
    out.gl_Position.w = _4792;
    float _5063 = fma(_5029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5065 = precise::clamp(_5063, 0.0, 1.0);
    float _5067 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5015);
    float _5069 = _5059 * 0.5;
    float _5071 = fma(_5065, -2.0, 3.0);
    float _5073 = _5065 * _5065;
    out.m_98.x = _5053;
    out.m_98.y = _5055;
    out.m_98.z = _5067;
    float _5075 = _5061 * 0.5;
    float _5077 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5079 = _5073 * _5071;
    float _5081 = _4941 * _4989;
    float _5083 = _4941 * _4991;
    out.m_100.x = _5075;
    out.m_100.y = _5051;
    out.m_100.z = _5069;
    out.m_100.w = _4792;
    float _5085 = -_5079;
    float _5087 = _5085 + 1.0;
    bool _5089 = _4282 <= 8000.0;
    bool _5091 = isnan(_4282);
    bool _5093 = _5089 || _5091;
    bool _5095 = isnan(8000.0);
    bool _5097 = _5093 || _5095;
    float _5099 = float(_5097);
    float _5101 = _4941 * _4993;
    float _5103 = fma(_5077, _5055, _5083);
    float _5105 = fma(_5087, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5079);
    float _5107 = fma(_5077, _5053, _5081);
    float _5109 = fma(_5077, _5067, _5101);
    float _5111 = _5105;
    float _5113 = _5019;
    if (_5049)
    {
        _4800 = 1.0;
    }
    float _5115 = _4800;
    float _5117 = _5099 * _5105;
    float _5119 = _5115;
    float _5121 = _5117;
    if (!_5049)
    {
        float _5123 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5125 = _5123 * 0.15915493667125701904296875;
        float _5127 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5129;
        float _5133 = _5125 * 6.283185482025146484375;
        float _5135 = cos(_5133);
        float _5137 = _5127 * 0.15915493667125701904296875;
        float _5139 = _5125 * 6.283185482025146484375;
        float _5141 = sin(_5139);
        float _5143 = 1.0 / _5135;
        float _5145 = _5137 * 6.283185482025146484375;
        float _5147 = cos(_5145);
        float _5149 = _5141 * _5143;
        float _5151 = _5137 * 6.283185482025146484375;
        float _5153 = sin(_5151);
        float _5155 = _5147 * _5149;
        float _5157 = 1.0 / _5131;
        float _5159 = 1.0 / _5155;
        float _5161 = _5153 * _5159;
        float _5163 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5165 = fma(_4282, _5161, _5163);
        float _5167 = _5165 * _5157;
        float _5169 = precise::clamp(_5167, 0.0, 1.0);
        _5111 = _5157;
        _5113 = _5143;
        _5119 = _5169;
    }
    float _5171 = _5111;
    float _5173 = _5113;
    float _5175 = _5119;
    float _5177 = _5117 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5179 = -_4894;
    float _5181 = _5179 + 1.0;
    float _5183 = -_5057;
    float _5185 = _5183 + 1.0;
    float _5187 = _5171;
    float _5189 = _5173;
    float _5191 = _5177;
    if (!_4772)
    {
        _5187 = 1.0;
    }
    float _5193 = _5187;
    float _5195 = _4971 + _5107;
    float _5197 = _4983 + _5103;
    float _5199 = _4987 + _5109;
    float _5201 = _5193;
    if (_4772)
    {
        bool _5203 = _4916 >= _4838;
        bool _5205 = isnan(_4916);
        bool _5207 = _5203 || _5205;
        bool _5209 = isnan(_4838);
        bool _5211 = _5207 || _5209;
        float _5213 = float(_5211);
        _5201 = _5213;
    }
    float _5215 = _5201;
    float _5217 = _5181 * _5177;
    float _5219 = precise::clamp(_5217, 0.0, 1.0);
    float _5221 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_4354)
    {
        _5189 = 1.0;
    }
    float _5223 = _5189;
    float _5225 = _5223;
    if (!_4354)
    {
        int _5227 = _4406 << 4;
        int _5229 = _5227 + 2048;
        uint _5231 = uint(int(uint(_5229) >> uint(2)));
        uint _5233 = uint(int(uint(int(_5231)) >> uint(2)));
        int _5235 = int(_5231) & 3;
        float _5237 = (*spvDescriptorSet0.vp_c15)._m0[int(_5233)][_5235];
        int _5239 = int(_5231) + 1;
        uint _5241 = uint(int(uint(_5239) >> uint(2)));
        int _5243 = _5239 & 3;
        float _5245 = (*spvDescriptorSet0.vp_c15)._m0[int(_5241)][_5243];
        int _5247 = _5229 + 8;
        uint _5249 = uint(int(uint(_5247) >> uint(2)));
        uint _5251 = uint(int(uint(int(_5249)) >> uint(2)));
        int _5253 = int(_5249) & 3;
        float _5255 = (*spvDescriptorSet0.vp_c15)._m0[int(_5251)][_5253];
        int _5257 = int(_5249) + 1;
        uint _5259 = uint(int(uint(_5257) >> uint(2)));
        int _5261 = _5257 & 3;
        float _5263 = (*spvDescriptorSet0.vp_c15)._m0[int(_5259)][_5261];
        float _5265 = _4238 * _5245;
        float _5267 = fma(_3794, _5237, _5265);
        float _5269 = fma(_3814, _5255, _5267);
        float _5271 = _5269 + _5263;
        float _5273 = precise::clamp(_5271, 0.0, 1.0);
        float _5275 = -_5273;
        float _5277 = _5275 + _4900;
        float _5279 = fma(_5277, 500.0, 1.5);
        float _5281 = exp2(_5279);
        float _5283 = 0.0 + _5281;
        float _5285 = precise::clamp(_5283, 0.0, 1.0);
        _5225 = _5285;
        _5121 = _5237;
        _5191 = _5245;
        _3870 = 500.0;
    }
    float _5287 = _5225;
    float _5289 = _5121;
    float _5291 = _5191;
    float _5293 = _3870;
    float _5295 = _5215 * _5287;
    float _5297 = _5221 * _4918;
    float _5299 = -_5219;
    float _5301 = fma(_5299, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5303 = -_5221;
    float _5305 = _5303 + 1.0;
    out.m_102.x = _5195;
    out.m_102.y = _5197;
    out.m_102.z = _5199;
    float _5307 = _4929 * _5297;
    float _5309 = -_5295;
    float _5311 = fma(_5309, _5301, 1.0);
    float _5313 = precise::clamp(_5311, 0.0, 1.0);
    float _5315 = _4939 * _5297;
    float _5317 = _4929 * _5305;
    float _5319 = fma(_4935, _5307, _4923);
    float _5321 = fma(_4937, _5307, _4925);
    float _5323 = _5313 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5325 = fma(_4929, _5315, _4927);
    bool _5327 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5329 = isnan(_4216);
    bool _5331 = _5327 || _5329;
    bool _5333 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5335 = _5331 || _5333;
    float _5337 = _5175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _5323;
    out.m_106.x = _5319;
    out.m_106.y = _5321;
    out.m_106.z = _5325;
    out.m_106.w = _5317;
    float _5339 = _5291;
    float _5341 = _5289;
    float _5343 = _5293;
    float _5345 = _5305;
    float _5347 = _5307;
    float _5349 = _5313;
    if (!_5335)
    {
        _5339 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5351 = _5339;
    float _5353 = _5351;
    float _5355 = _5351;
    if (!_5335)
    {
        _5341 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5357 = _5341;
    float _5359 = _5357;
    float _5361 = _5357;
    if (!_5335)
    {
        _5343 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5363 = _5343;
    float _5365 = _5363;
    float _5367 = _5363;
    if (!_5335)
    {
        _5345 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5369 = _5345;
    float _5371 = _5369;
    float _5373 = _5369;
    if (!_5335)
    {
        _5347 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5375 = _5347;
    float _5377 = _5375;
    float _5379 = _5375;
    if (!_5335)
    {
        _5349 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5381 = _5349;
    bool _5383 = !_5335;
    float _5385 = _5381;
    float _5387 = _5381;
    if (!_5383)
    {
        bool _5389 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5391 = isnan(_4216);
        bool _5393 = _5389 || _5391;
        bool _5395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5397 = _5393 || _5395;
        if (!_5397)
        {
            float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5401 = _4216 + _5399;
            float _5403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5403;
            float _5407 = 1.0 / _5405;
            float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5429 = _5401 * _5407;
            float _5431 = precise::clamp(_5429, 0.0, 1.0);
            float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5437 = fma(_5431, _5411, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5439 = fma(_5431, _5435, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5441 = fma(_5431, _5415, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5443 = fma(_5431, _5419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5445 = fma(_5431, _5423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5447 = fma(_5431, _5427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5361 = _5439;
            _5379 = _5445;
            _5355 = _5437;
            _5373 = _5443;
            _5367 = _5441;
            _5387 = _5447;
            _5449 = true;
        }
        else
        {
            bool _5451 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5453 = isnan(_4216);
            bool _5455 = _5451 || _5453;
            bool _5457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5459 = _5455 || _5457;
            if (!_5459)
            {
                _5353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5461 = _5353;
            _5355 = _5461;
            if (!_5459)
            {
                _5359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5463 = _5359;
            _5361 = _5463;
            if (!_5459)
            {
                _5365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5465 = _5365;
            _5367 = _5465;
            if (!_5459)
            {
                _5371 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5467 = _5371;
            _5373 = _5467;
            if (!_5459)
            {
                _5377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5469 = _5377;
            _5379 = _5469;
            if (!_5459)
            {
                _5385 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5471 = _5385;
            bool _5473 = !_5459;
            _5387 = _5471;
            if (!_5473)
            {
                bool _5475 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5477 = isnan(_4216);
                bool _5479 = _5475 || _5477;
                bool _5481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5483 = _5479 || _5481;
                if (!_5483)
                {
                    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5487 = _4216 + _5485;
                    float _5489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5489;
                    float _5493 = 1.0 / _5491;
                    float _5495 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5497 = _5495 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5499 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5501 = _5499 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5505 = _5503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5509 = _5507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5513 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5515 = _5487 * _5493;
                    float _5517 = precise::clamp(_5515, 0.0, 1.0);
                    float _5519 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5523 = fma(_5517, _5497, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5525 = fma(_5517, _5521, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5527 = fma(_5517, _5501, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5529 = fma(_5517, _5505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5531 = fma(_5517, _5509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5533 = fma(_5517, _5513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5361 = _5525;
                    _5379 = _5531;
                    _5355 = _5523;
                    _5373 = _5529;
                    _5367 = _5527;
                    _5387 = _5533;
                    _5449 = true;
                }
                else
                {
                    _5361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5373 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5387 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5449 = false;
    float _5535 = _5361;
    float _5537 = _5379;
    float _5539 = _5355;
    float _5541 = _5373;
    float _5543 = _5367;
    float _5545 = _5387;
    float _5547 = fma(_5197, -0.5, 0.5);
    float _5549 = precise::clamp(_5547, 0.0, 1.0);
    float _5551 = -_5535;
    float _5553 = _5551 + _5537;
    float _5555 = -_5539;
    float _5557 = _5555 + _5541;
    out.m_108.x = 0.0;
    float _5559 = fma(_5549, _5553, _5535);
    float _5561 = -_5543;
    float _5563 = _5561 + _5545;
    float _5565 = fma(_5549, _5557, _5539);
    float _5567 = _5559 * 0.586610972881317138671875;
    bool _5569 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5571 = fma(_5549, _5563, _5543);
    float _5573 = _5337 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5575 = fma(_5565, 0.298911988735198974609375, _5567);
    bool _5577 = _5175 > 0.0;
    bool _5579 = isnan(_5175);
    bool _5581 = _5577 || _5579;
    bool _5583 = isnan(0.0);
    bool _5585 = _5581 || _5583;
    float _5587 = fma(_5571, 0.114477999508380889892578125, _5575);
    out.m_63.x = _5573;
    float _5589 = -_5587;
    float _5591 = _5565 + _5589;
    float _5593 = -_5587;
    float _5595 = _5559 + _5593;
    float _5597 = -_5587;
    float _5599 = _5571 + _5597;
    float _5601 = fma(_5591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    float _5603 = fma(_5595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    float _5605 = fma(_5599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    bool _5607 = !_5569;
    if (!_5607)
    {
        float _5609 = -_4172;
        float _5611 = _5609 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5613 = -_4176;
        float _5615 = _5613 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5617 = -_4180;
        float _5619 = _5617 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5621 = _5611 * _5611;
        float _5623 = fma(_5615, _5615, _5621);
        float _5625 = fma(_5619, _5619, _5623);
        float _5627 = sqrt(_5625);
        float _5629 = rsqrt(_5625);
        float _5631 = -_5627;
        float _5633 = _5631 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5635 = _5633 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5637 = precise::clamp(_5635, 0.0, 1.0);
        float _5639 = _5615 * _5629;
        float _5641 = _5611 * _5629;
        float _5643 = abs(_5637);
        float _5645 = log2(_5643);
        float _5647 = _5619 * _5629;
        float _5649 = _5639 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5651 = _5197 * _5641;
        float _5653 = -_5641;
        float _5655 = -_5649;
        float _5657 = fma(_5653, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5655);
        float _5659 = fma(_5195, _5639, _5651);
        float _5661 = -_5647;
        float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5657);
        float _5665 = fma(_5199, _5647, _5659);
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5671 = _5663 + _5669;
        float _5673 = _5645 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5675 = _5671 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5677 = precise::clamp(_5675, 0.0, 1.0);
        float _5679 = exp2(_5673);
        float _5681 = _5679 * _5677;
        float _5683 = _5667 * _5681;
        float _5685 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5687 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5689 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5685;
        out.m_108.y = _5687;
        out.m_108.z = _5689;
    }
    out.m_110.x = _5601;
    out.m_110.y = _5603;
    out.m_110.z = _5605;
    if (_5585)
    {
        return out;
    }
    float _5691 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5691;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5449 = false;
    bool _741 = false;
    bool _597 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5759 = as_type<float>(_153);
        out.gl_Position.z = _5759;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5822 = as_type<float>(_185);
        out.gl_Position.z = _5822;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = 1.0 / _279;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _305 = 1.0 / _283;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _271 + _307;
    float _311 = 1.0 / _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _309 * _293;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _291;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _271 + _333;
    float _337 = _315 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = _271 + _339;
    float _343 = 1.0 / _297;
    float _345 = _275 * _311;
    bool _347 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _349 = isnan(_271);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    bool _359 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _361 = isnan(_271);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _301;
    float _373 = _335 * _331;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _377 = _271 + _375;
    float _379 = -_329;
    float _381 = _379 + 1.0;
    float _383 = _357 * _381;
    float _385 = _341 * _343;
    bool _387 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _389 = isnan(_271);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_397;
    float _401 = _399 + 1.0;
    float _403 = _377 * _371;
    float _405 = -_357;
    float _407 = _405 + 1.0;
    bool _409 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _411 = isnan(_271);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _423 = isnan(_271);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = _397 * _407;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = _419 * _401;
    float _441 = -_419;
    float _443 = _441 + 1.0;
    bool _445 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_271);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = _369 * _443;
    float _467 = -_369;
    float _469 = _467 + 1.0;
    float _471 = -_455;
    float _473 = _471 + 1.0;
    float _475 = fma(_437, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = fma(_459, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = _455 * _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _485;
    float _489 = _431 * _473;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = fma(_483, _345, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _497 = fma(_487, _345, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _499 = _475 * _489;
    float _501 = _477 * _489;
    float _503 = -_431;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_463, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _513 = fma(_493, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _515 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _499);
    float _517 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _501);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_511, _479, _515);
    float _525 = fma(_513, _479, _517);
    float _527 = fma(_509, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _535;
    float _539 = fma(_495, _465, _523);
    float _541 = fma(_497, _465, _525);
    float _543 = fma(_533, _385, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _545 = fma(_537, _385, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _555 = fma(_527, _439, _539);
    float _557 = fma(_529, _439, _541);
    float _559 = fma(_549, _403, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _561 = fma(_553, _403, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _563 = fma(_543, _433, _555);
    float _565 = fma(_545, _433, _557);
    float _567 = fma(_559, _383, _563);
    float _569 = fma(_561, _383, _565);
    float _571 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].x, _567);
    float _573 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].y, _569);
    bool _575 = !_303;
    float _577 = _383;
    float _595;
    if (!_575)
    {
        float _579 = in.m_76.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        _595 = _179;
    }
    _597 = false;
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _677 = -_651;
    float _679 = _677 + 1.0;
    float _681 = _675 * _661;
    float _683 = _673 * _667;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _687 = _599 + _685;
    float _689 = _619 * _679;
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _693 = fma(_683, _687, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _695 = fma(_693, _689, _691);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[117].x, _695);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = in.m_78.x;
    float _715 = in.m_78.y;
    out.m_80.x = _705;
    out.m_80.y = _707;
    out.m_80.z = _711;
    out.m_80.w = _709;
    float _717 = _573 * _715;
    float _719 = _571 * _713;
    bool _721 = !_659;
    float _739;
    if (!_721)
    {
        float _723 = in.m_76.x;
        float _725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _727 = _723 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _731 = _729 * _725;
        float _733 = floor(_731);
        float _735 = -_733;
        float _737 = _731 + _735;
        _739 = _737;
        _741 = true;
    }
    else
    {
        _739 = _179;
    }
    _741 = false;
    float _743 = _739;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _747 = _743 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _755 = isnan(_743);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _773 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _775 = isnan(_743);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = 1.0 / _751;
    float _787 = -_763;
    float _789 = _787 + 1.0;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _791;
    bool _795 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _797 = isnan(_743);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _783 * _789;
    float _809 = -_783;
    float _811 = _809 + 1.0;
    bool _813 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _815 = 1.0 / _767;
    float _817 = _805 * _811;
    float _819 = -_805;
    float _821 = _819 + 1.0;
    float _823 = 1.0 / _771;
    float _825 = _793 * _785;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _831 = fma(_825, _747, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _833 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _835 = isnan(_743);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _829 * _815;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _853 = _743 + _851;
    float _855 = _831 * _817;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _859 = _743 + _857;
    float _861 = fma(_845, _853, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _863 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[131].x, _855);
    float _865 = _849 * _823;
    float _867 = -_843;
    float _869 = _867 + 1.0;
    float _871 = fma(_861, _807, _863);
    float _873 = fma(_865, _859, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _875 = _763 * _869;
    float _877 = fma(_873, _875, _871);
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[134].x, _877);
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _887;
    out.m_82.y = _889;
    out.m_82.z = _891;
    out.m_82.w = _893;
    bool _895 = !_813;
    if (!_895)
    {
        float _897 = in.m_76.x;
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _901 = _897 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _181 = _911;
    }
    float _913 = _181;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _917 = int(_915);
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _921 = _919 != 0;
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _925 = int(_923);
    float _927 = float(_917);
    float _929 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _931 = int(_929);
    if (_921)
    {
        _577 = 1.0;
    }
    float _933 = _577;
    int _935 = 0;
    float _937 = _933;
    if (_921)
    {
        _935 = 0;
    }
    int _939 = _935;
    float _941 = float(_925);
    float _943 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _945 = int(_943);
    float _947 = 1.0 / _927;
    float _949 = float(uint(_931));
    int _951 = ~_931;
    int _953 = _951 + 1;
    float _955 = 1.0 / _941;
    float _957 = float(uint(_945));
    float _959 = _947 * _135;
    float _961 = 1.0 / _949;
    float _963 = _947;
    float _965 = _941;
    int _967 = _939;
    if (_921)
    {
        float _969 = in.m_76.x;
        float _971 = in.m_76.y;
        _963 = _969;
        _965 = _971;
    }
    float _973 = _963;
    float _975 = _965;
    float _977 = _955 * _135;
    float _979 = 1.0 / _957;
    float _981 = trunc(_959);
    int _983 = int(_981);
    int _985 = as_type<int>(_961) + (-2);
    float _987 = trunc(_977);
    int _989 = int(_987);
    int _991 = as_type<int>(_979) + (-2);
    float _993 = _979;
    float _995 = _973;
    float _997 = _975;
    if (_921)
    {
        _993 = _973;
    }
    float _999 = _993;
    float _1001 = 0.0;
    float _1003 = _999;
    if (_921)
    {
        _1001 = _975;
    }
    float _1005 = _1001;
    float _1007 = 0.0;
    float _1009 = _1005;
    if (_921)
    {
        _1007 = _999;
    }
    float _1011 = _1007;
    float _1013 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1015 = int(_1013);
    float _1017 = float(uint(_983));
    float _1019 = as_type<float>(_985) * _1017;
    int _1021 = as_type<int>(_1017);
    float _1023 = _1011;
    if (_921)
    {
        _1021 = 0;
    }
    int _1025 = _1021;
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1029 = int(_1027);
    float _1031 = float(uint(_989));
    float _1033 = as_type<float>(_991) * _1031;
    float _1035 = _1031;
    int _1037 = _1025;
    if (_921)
    {
        _1035 = 1.0;
    }
    float _1039 = _1035;
    float _1041 = trunc(_1019);
    float _1043 = precise::max(_1041, 0.0);
    uint _1046 = uint(_1043);
    float _1048 = float(uint(_1015));
    float _1050 = 1.0 / _1048;
    float _1052 = float(_1029);
    float _1054 = trunc(_1033);
    float _1056 = precise::max(_1054, 0.0);
    uint _1058 = uint(_1056);
    float _1060 = 1.0 / _1052;
    float _1062 = _1052;
    float _1064 = _1039;
    if (_921)
    {
        _1062 = _999;
    }
    float _1066 = _1062;
    float _1068 = _1066;
    if (!_921)
    {
        float _1070 = in.m_76.x;
        float _1072 = in.m_76.y;
        float _1074 = in.m_76.z;
        float _1076 = _1070 * 3.1415927410125732421875;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1072 * 3.1415927410125732421875;
        float _1082 = _1080 * 0.15915493667125701904296875;
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        float _1088 = _1082 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        _937 = 5.839270114898681640625;
        _1068 = _1074;
        _1064 = 7.345489978790283203125;
        _995 = _1070;
        _1003 = _1072;
        _997 = _1072;
        _1009 = _1090;
        _1037 = 1;
        _967 = 2;
        _1023 = _1086;
    }
    float _1092 = _937;
    float _1094 = _1068;
    float _1096 = _1064;
    float _1098 = _995;
    float _1100 = _1003;
    float _1102 = _997;
    float _1104 = _1009;
    int _1106 = _1037;
    int _1108 = _967;
    float _1110 = _1023;
    int _1112 = _953 * int(_1046);
    int _1114 = _1112 + _983;
    float _1116 = in.m_76.z;
    float _1118 = in.m_76.w;
    int _1120 = ~_945;
    int _1122 = _1120 + 1;
    float _1124 = _1092 * _1094;
    float _1126 = _1096 * _1098;
    float _1128 = float(uint(_1114));
    float _1130 = _1060 * _135;
    int _1132 = _1122 * int(_1058);
    int _1134 = _1132 + _989;
    float _1136 = floor(_1126);
    float _1138 = _1096 * _1100;
    float _1140 = as_type<float>(_985) * _1128;
    float _1142 = float(_931);
    float _1144 = _1098 * 2.0;
    float _1146 = float(uint(_1134));
    float _1148 = in.m_74.w;
    float _1150 = float(_983);
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    float _1158 = as_type<float>(_991) * _1146;
    bool _1160 = _1150 >= _1142;
    bool _1162 = isnan(_1150);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan(_1142);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1174 = _913 + _1172;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1178 = _1176 != 0;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1182 = _913 + _1180;
    bool _1184 = _1102 > 0.5;
    float _1186 = trunc(_1130);
    int _1188 = int(_1186);
    bool _1190 = _1118 > 0.5;
    float _1192 = -_1136;
    float _1194 = _1126 + _1192;
    bool _1196 = _1116 > 0.5;
    float _1198 = in.m_72.w;
    int _1200 = as_type<int>(_1050) + (-2);
    float _1202 = _1102 + _1098;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1214 = _1212 != 0;
    float _1216 = trunc(_1158);
    float _1218 = precise::max(_1216, 0.0);
    uint _1220 = uint(_1218);
    int _1222 = int(_1046) + int(_1156);
    float _1224 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1226 = ~_945;
    int _1228 = _1226 + 1;
    int _1230 = ~_931;
    int _1232 = _1230 + 1;
    float _1234 = floor(_1124);
    float _1236 = float(uint(_1188));
    int _1238 = _1232 * _1222;
    int _1240 = _1238 + _983;
    int _1242 = int(_1190);
    int _1244 = _1196 ? 2 : 0;
    int _1246 = _1242 | _1244;
    int _1248 = _1178 ? 4 : 0;
    int _1250 = _1246 | _1248;
    int _1252 = _1206 ? 8 : 0;
    int _1254 = _1250 | _1252;
    int _1256 = _1210 ? 16 : 0;
    int _1258 = _1254 | _1256;
    int _1260 = _1214 ? 32 : 0;
    int _1262 = _1258 | _1260;
    int _1264 = _1184 ? 64 : 0;
    int _1266 = _1262 | _1264;
    int _1268 = _1266 & 64;
    bool _1270 = !_1178;
    int _1272 = _1270 ? 0 : 1;
    float _1274 = as_type<float>(_1200) * _1236;
    float _1276 = -_241;
    int _1278 = _1184 ? as_type<int>(_1276) : as_type<int>(_241);
    float _1280 = trunc(_1170);
    int _1282 = int(_1280);
    int _1284 = int(_1058) + int(_1220);
    bool _1286 = !_1210;
    float _1288 = _1286 ? _241 : as_type<float>(_1278);
    int _1290 = abs(_1272);
    int _1292 = ~_1015;
    int _1294 = _1292 + 1;
    float _1296 = floor(_1138);
    float _1298 = -_225;
    int _1300 = _1196 ? as_type<int>(_1298) : as_type<int>(_225);
    float _1302 = -_1234;
    float _1304 = _1124 + _1302;
    float _1306 = float(_945);
    bool _1308 = !_1214;
    float _1310 = _1308 ? _225 : as_type<float>(_1300);
    float _1312 = _1194 * _1142;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1324 = _1322 != 0;
    float _1326 = trunc(_1274);
    float _1328 = precise::max(_1326, 0.0);
    uint _1330 = uint(_1328);
    bool _1332 = uint(_1240) >= uint(_931);
    int _1334 = _1228 * _1284;
    int _1336 = _1334 + _989;
    float _1338 = float(_989);
    bool _1340 = !_1320;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = -_1296;
    float _1346 = _1138 + _1344;
    bool _1348 = !_1316;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = trunc(_1312);
    int _1354 = int(_1352);
    bool _1356 = uint(_1336) >= uint(_945);
    float _1358 = _1304 * _1306;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1332;
    int _1366 = _1364 ? 0 : (-1);
    bool _1368 = _1338 >= _1306;
    bool _1370 = isnan(_1338);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(_1306);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    int _1380 = _1294 * int(_1330);
    int _1382 = _1380 + _1188;
    bool _1384 = !_1324;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = trunc(_1358);
    int _1390 = int(_1388);
    bool _1392 = !_1362;
    int _1394 = _1392 ? 0 : 1;
    bool _1396 = !_1356;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1410 = _1408 != 0;
    int _1412 = _1354 * _1290;
    int _1414 = _1412 + _983;
    int _1416 = ~_1222;
    int _1418 = _1416 + _1366;
    int _1420 = _1418 + 1;
    float _1422 = trunc(_1378);
    int _1424 = int(_1422);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1428 = _1426 != 0;
    bool _1430 = !_1406;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _931 * _1420;
    int _1436 = _1434 + _983;
    bool _1438 = !_1428;
    int _1440 = _1438 ? 0 : 1;
    bool _1442 = _931 == 0;
    float _1444 = floor(_1144);
    bool _1446 = _1268 != 0;
    int _1448 = abs(_1440);
    float _1450 = float(uint(_1382));
    int _1452 = ~_1284;
    int _1454 = _1452 + _1398;
    int _1456 = _1454 + 1;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    bool _1462 = !_1442;
    int _1464 = _1462 ? _1436 : (-1);
    float _1466 = _175 * _135;
    float _1468 = as_type<float>(_1200) * _1450;
    bool _1470 = !_1402;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _945 * _1456;
    int _1476 = _1474 + _989;
    float _1478 = _1142 * _1466;
    bool _1480 = _945 == 0;
    float _1482 = _1306 * _1466;
    int _1484 = ~_1282;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = trunc(_1468);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = ~_1424;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    int _1502 = _1390 * _1448;
    int _1504 = _1502 + _989;
    bool _1506 = !_1480;
    int _1508 = _1506 ? _1476 : (-1);
    int _1510 = _1464 * _1488;
    int _1512 = _931 + (-1);
    float _1514 = _1460 * _135;
    int _1516 = _945 + (-1);
    float _1518 = trunc(_1478);
    int _1520 = int(_1518);
    int _1522 = _1508 * _1500;
    int _1524 = abs(_1342);
    int _1526 = _1282 * _1512;
    int _1528 = _1526 + _1510;
    int _1530 = abs(_1432);
    int _1532 = _1424 * _1516;
    int _1534 = _1532 + _1522;
    int _1536 = abs(_1386);
    int _1538 = _1528 * _1524;
    float _1540 = trunc(_1482);
    int _1542 = int(_1540);
    int _1544 = abs(_1350);
    int _1546 = ~_1015;
    int _1548 = _1546 + 1;
    int _1550 = _1534 * _1530;
    int _1552 = int(_1330) + int(_1494);
    int _1554 = _1520 * _1544;
    int _1556 = _1554 + _1538;
    int _1558 = abs(_1394);
    int _1560 = abs(_1472);
    int _1562 = _1414 * _1536;
    int _1564 = _1562 + _1556;
    float _1566 = -_225;
    int _1568 = _1190 ? as_type<int>(_1566) : as_type<int>(_225);
    int _1570 = _1548 * _1552;
    int _1572 = _1570 + _1188;
    float _1574 = float(_1188);
    int _1576 = _1354 * _1558;
    int _1578 = _1576 + _1564;
    float _1580 = float(_1015);
    int _1582 = _1542 * _1560;
    int _1584 = _1582 + _1550;
    bool _1586 = uint(_1572) >= uint(_1015);
    float _1588 = -_241;
    int _1590 = _1196 ? as_type<int>(_1588) : as_type<int>(_241);
    float _1592 = _1580 * _1466;
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1596 = _1594 != 0;
    float _1598 = _1346 * _1580;
    float _1600 = float(uint(_1578));
    bool _1602 = !_1596;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = trunc(_1592);
    int _1608 = int(_1606);
    bool _1610 = !_1410;
    int _1612 = _1610 ? 0 : 1;
    float _1614 = as_type<float>(_985) * _1600;
    int _1616 = abs(_1604);
    bool _1618 = !_1206;
    float _1620 = _1618 ? _225 : as_type<float>(_1568);
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1624 = _1622 != 0;
    float _1626 = trunc(_1614);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = abs(_1612);
    bool _1634 = _1574 >= _1580;
    bool _1636 = isnan(_1574);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(_1580);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    bool _1646 = !_1624;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1504 * _1632;
    int _1652 = _1650 + _1584;
    bool _1654 = !_1586;
    int _1656 = _1654 ? 0 : (-1);
    float _1658 = trunc(_1644);
    int _1660 = int(_1658);
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1664 = _1662 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1672 = _1670 != 0;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1676 = _1674 != 0;
    int _1678 = ~_1552;
    int _1680 = _1678 + _1656;
    int _1682 = _1680 + 1;
    int _1684 = _1390 * _1616;
    int _1686 = _1684 + _1652;
    int _1688 = abs(_1648);
    int _1690 = ~_931;
    int _1692 = _1690 + 1;
    int _1694 = _1015 * _1682;
    int _1696 = _1694 + _1188;
    bool _1698 = !_1668;
    int _1700 = _1698 ? 0 : 1;
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1704 = _1702 != 0;
    float _1706 = trunc(_1598);
    int _1708 = int(_1706);
    bool _1710 = !_1664;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = _1692 * int(_1630);
    int _1716 = _1714 + _1578;
    bool _1718 = _1015 == 0;
    float _1720 = float(uint(_1686));
    float _1722 = float(uint(_1716));
    int _1724 = ~_1660;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = as_type<float>(_991) * _1720;
    bool _1732 = !_1718;
    int _1734 = _1732 ? _1696 : (-1);
    float _1736 = as_type<float>(_1652);
    float _1738 = as_type<float>(_1630);
    float _1740 = as_type<float>(_1448);
    float _1742 = as_type<float>(_1106);
    float _1744 = as_type<float>(_1108);
    if (_1704)
    {
        float _1746 = in.m_76.w;
        _1736 = _1746;
    }
    float _1748 = _1736;
    float _1750 = as_type<float>(_985) * _1722;
    float _1752 = trunc(_1730);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = abs(_1700);
    int _1760 = _1734 * _1728;
    int _1762 = _1015 + (-1);
    int _1764 = abs(_1712);
    float _1766 = trunc(_1750);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    int _1772 = _1660 * _1762;
    int _1774 = _1772 + _1760;
    int _1776 = ~_931;
    int _1778 = _1776 + 1;
    int _1780 = _1708 * _1688;
    int _1782 = _1780 + _1188;
    bool _1784 = _931 == 0;
    int _1786 = _1774 * _1758;
    int _1788 = ~_945;
    int _1790 = _1788 + 1;
    float _1792 = as_type<float>(_1758);
    float _1794 = as_type<float>(_1688);
    if (!_1704)
    {
        _1792 = _241;
    }
    float _1796 = _1792;
    int _1798 = _1608 * _1764;
    int _1800 = _1798 + _1786;
    bool _1802 = !_1672;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = _1796;
    if (_1704)
    {
        float _1808 = _1748 * 3.1415927410125732421875;
        _1794 = _1808;
    }
    float _1810 = _1794;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1814 = _1812 != 0;
    int _1816 = _1790 * int(_1756);
    int _1818 = _1816 + _1686;
    int _1820 = int(_1630) + int(_1770);
    if (_1704)
    {
        float _1822 = _1810 * 0.15915493667125701904296875;
        _1738 = _1822;
    }
    float _1824 = _1738;
    int _1826 = abs(_1804);
    float _1828 = float(uint(_1818));
    int _1830 = _1778 * _1820;
    int _1832 = _1830 + _1578;
    bool _1834 = !_1676;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = _1824;
    if (_1704)
    {
        float _1840 = _1824 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        _1838 = _1842;
    }
    float _1844 = _1838;
    float _1846 = as_type<float>(_991) * _1828;
    int _1848 = abs(_1836);
    int _1850 = _1782 * _1826;
    int _1852 = _1850 + _1800;
    bool _1854 = uint(_1832) >= uint(_931);
    float _1856 = _1598;
    if (_1814)
    {
        float _1858 = in.m_76.x;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = float(uint(_1414));
    int _1864 = _1708 * _1848;
    int _1866 = _1864 + _1852;
    bool _1868 = !_1854;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1846);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1880 = _1878 != 0;
    float _1882 = as_type<float>(_985) * _1862;
    int _1884 = ~_1820;
    int _1886 = _1884 + _1870;
    int _1888 = _1886 + 1;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1894 = !_1880;
    float _1896 = _1894 ? _241 : as_type<float>(_1590);
    float _1898 = float(uint(_1866));
    float _1900 = trunc(_1882);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    int _1906 = _931 * _1888;
    int _1908 = _1906 + _1578;
    bool _1910 = _1880;
    float _1912 = _1898;
    if (_1704)
    {
        bool _1914 = _1844 > 0.5;
        _1910 = _1914;
    }
    bool _1916 = _1910;
    float _1918 = as_type<float>(_1200) * _1898;
    int _1920 = ~_931;
    int _1922 = _1920 + 1;
    bool _1924 = !_1784;
    int _1926 = _1924 ? _1908 : (-1);
    float _1928 = 1.0 / _1892;
    if (_1704)
    {
        float _1930 = -_241;
        float _1932 = _1916 ? _1930 : _241;
        _1806 = _1932;
    }
    float _1934 = _1806;
    int _1936 = _1926 & 3;
    bool _1938 = _1936 != 0;
    if (_1814)
    {
        float _1940 = _1860 * 3.1415927410125732421875;
        _1912 = _1940;
    }
    float _1942 = _1912;
    int _1944 = _1926 & 3;
    bool _1946 = _1944 != 0;
    int _1948 = int(_1756) + int(_1876);
    float _1950 = trunc(_1918);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    int _1956 = _1922 * int(_1904);
    int _1958 = _1956 + _1414;
    int _1960 = ~_1015;
    int _1962 = _1960 + 1;
    float _1964 = _1942;
    if (_1814)
    {
        float _1966 = _1942 * 0.15915493667125701904296875;
        _1964 = _1966;
    }
    float _1968 = _1964;
    int _1970 = _1938 ? 0 : 1;
    bool _1972 = uint(_1944) > 1u;
    float _1974 = float(uint(_1504));
    float _1976 = _1968;
    if (_1814)
    {
        float _1978 = _1968 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1976 = _1980;
    }
    float _1982 = _1976;
    float _1984 = float(uint(_1958));
    float _1986 = as_type<float>(_991) * _1974;
    int _1988 = ~_945;
    int _1990 = _1988 + 1;
    float _1992 = as_type<float>(_985) * _1984;
    int _1994 = ~_1970;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = _1962 * int(_1954);
    int _2002 = _2000 + _1866;
    float _2004 = trunc(_1986);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    int _2010 = _1990 * _1948;
    int _2012 = _2010 + _1686;
    float _2014 = -_225;
    int _2016 = _1446 ? as_type<int>(_2014) : as_type<int>(_225);
    float _2018 = float(uint(_2002));
    bool _2020 = uint(_1944) >= 2u;
    int _2022 = _1998;
    if (!_1972)
    {
        int _2024 = ~_1970;
        int _2026 = _2024 + 1;
        _2022 = _2026;
    }
    int _2028 = _2022;
    float _2030 = as_type<float>(_1200) * _2018;
    bool _2032 = uint(_2012) >= uint(_945);
    float _2034 = trunc(_1992);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    int _2040 = _2020 ? 0 : 1;
    bool _2042 = _1944 != 3;
    bool _2044 = !_2032;
    int _2046 = _2044 ? 0 : (-1);
    int _2048 = ~_945;
    int _2050 = _2048 + 1;
    float _2052 = trunc(_2030);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    int _2058 = ~_1948;
    int _2060 = _2058 + _2046;
    int _2062 = _2060 + 1;
    int _2064 = _2050 * int(_2008);
    int _2066 = _2064 + _1504;
    int _2068 = ~_2040;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    int _2074 = _945 * _2062;
    int _2076 = _2074 + _1686;
    int _2078 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2080 = _2078 != 0;
    int _2082 = _2072;
    bool _2084 = _2042;
    float _2086 = 2.8025969286496341418474591665798e-45;
    if (_2042)
    {
        int _2088 = ~_2040;
        int _2090 = _2088 + 1;
        _2082 = _2090;
    }
    int _2092 = _2082;
    if (_1814)
    {
        bool _2094 = _1982 > 0.5;
        _2084 = _2094;
    }
    bool _2096 = _2084;
    bool _2098 = !_1480;
    int _2100 = _2098 ? _2076 : (-1);
    float _2102 = float(uint(_2066));
    if (!_1814)
    {
        _2086 = _225;
    }
    float _2104 = _2086;
    float _2106 = _2104;
    if (_1814)
    {
        float _2108 = -_225;
        float _2110 = _2096 ? _2108 : _225;
        _2106 = _2110;
    }
    float _2112 = _2106;
    float _2114 = as_type<float>(_991) * _2102;
    int _2116 = _2100 & 3;
    bool _2118 = _2116 != 0;
    bool _2120 = !_2080;
    float _2122 = _2120 ? _225 : as_type<float>(_2016);
    int _2124 = int(_1954) + int(_2056);
    float _2126 = trunc(_2114);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    int _2132 = ~_1015;
    int _2134 = _2132 + 1;
    int _2136 = _2100 & 3;
    bool _2138 = _2136 != 0;
    bool _2140 = uint(_2116) > 1u;
    int _2142 = _2134 * _2124;
    int _2144 = _2142 + _1866;
    int _2146 = int(_1904) + int(_2038);
    int _2148 = ~_931;
    int _2150 = _2148 + 1;
    int _2152 = _2138 ? 0 : 1;
    int _2154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2156 = _2154 != 0;
    int _2158 = _2150 * _2146;
    int _2160 = _2158 + _1414;
    float _2162 = float(uint(_1782));
    bool _2164 = !_2156;
    int _2166 = _2164 ? 0 : 1;
    bool _2168 = uint(_2144) >= uint(_1015);
    float _2170 = as_type<float>(_1200) * _2162;
    int _2172 = ~_2152;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2176;
    if (!_2140)
    {
        int _2180 = ~_2152;
        int _2182 = _2180 + 1;
        _2178 = _2182;
    }
    int _2184 = _2178;
    bool _2186 = uint(_2160) >= uint(_931);
    float _2188 = trunc(_2170);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    bool _2194 = !_2168;
    int _2196 = _2194 ? 0 : (-1);
    bool _2198 = _2116 != 3;
    bool _2200 = !_2186;
    int _2202 = _2200 ? 0 : (-1);
    bool _2204 = uint(_2116) >= 2u;
    int _2206 = ~_2124;
    int _2208 = _2206 + _2196;
    int _2210 = _2208 + 1;
    int _2212 = ~_945;
    int _2214 = _2212 + 1;
    int _2216 = int(_2008) + int(_2130);
    int _2218 = _1015 * _2210;
    int _2220 = _2218 + _1866;
    int _2222 = ~_1015;
    int _2224 = _2222 + 1;
    int _2226 = _2204 ? 0 : 1;
    int _2228 = _2214 * _2216;
    int _2230 = _2228 + _1504;
    int _2232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2234 = _2232 != 0;
    int _2236 = ~_2226;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2240;
    int _2244 = _2184;
    if (_2198)
    {
        int _2246 = ~_2226;
        int _2248 = _2246 + 1;
        _2242 = _2248;
    }
    int _2250 = _2242;
    int _2252 = _2224 * int(_2192);
    int _2254 = _2252 + _1782;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2258 = _2256 != 0;
    bool _2260 = !_2234;
    int _2262 = _2260 ? 0 : 1;
    bool _2264 = uint(_2230) >= uint(_945);
    bool _2266 = !_1718;
    int _2268 = _2266 ? _2220 : (-1);
    bool _2270 = !_2258;
    int _2272 = _2270 ? 0 : 1;
    bool _2274 = !_2264;
    int _2276 = _2274 ? 0 : (-1);
    int _2278 = _2268 & 3;
    bool _2280 = _2278 != 0;
    int _2282 = _2268 & 3;
    bool _2284 = _2282 != 0;
    float _2286 = float(uint(_2254));
    int _2288 = _2280 ? 0 : 1;
    bool _2290 = uint(_2282) > 1u;
    float _2292 = as_type<float>(_1200) * _2286;
    int _2294 = ~_2288;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = trunc(_2292);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    int _2306 = ~_2216;
    int _2308 = _2306 + _2276;
    int _2310 = _2308 + 1;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2320 = _2298;
    if (!_2290)
    {
        int _2322 = ~_2288;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    bool _2328 = uint(_2282) >= 2u;
    float _2330 = 1.0 / _2314;
    int _2332 = ~_1015;
    int _2334 = _2332 + 1;
    int _2336 = _2328 ? 0 : 1;
    bool _2338 = _2282 != 3;
    int _2340 = int(_2192) + int(_2304);
    float _2342 = 1.0 / _2318;
    int _2344 = ~_2336;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = _2334 * _2340;
    int _2352 = _2350 + _1782;
    float _2354 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2354;
    int _2358 = _2348;
    if (_2338)
    {
        int _2360 = ~_2336;
        int _2362 = _2360 + 1;
        _2358 = _2362;
    }
    int _2364 = _2358;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2368 = uint(_2352) >= uint(_1015);
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2372 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2366);
    bool _2374 = !_2368;
    int _2376 = _2374 ? 0 : (-1);
    float _2378 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _2380 = _1098 > 0.5;
    float _2382 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2372);
    float _2384 = -_241;
    int _2386 = _2380 ? as_type<int>(_2384) : as_type<int>(_241);
    int _2388 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2390 = _2388 != 0;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2394 = in.m_56.x;
    float _2396 = in.m_56.y;
    float _2398 = in.m_56.z;
    int _2400 = abs(_2028);
    bool _2402 = !_2390;
    float _2404 = _2402 ? _241 : as_type<float>(_2386);
    float _2406 = fma(_2378, -2.0, _2392);
    bool _2408 = _1106 != 1;
    float _2410 = _1202 + (-1.0);
    int _2412 = ~_2340;
    int _2414 = _2412 + _2376;
    int _2416 = _2414 + 1;
    float _2418 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2406);
    int _2420 = ~_2146;
    int _2422 = _2420 + _2202;
    int _2424 = _2422 + 1;
    int _2426 = abs(_2166);
    int _2428 = _1015 * _2416;
    int _2430 = _2428 + _1782;
    int _2432 = abs(_2326);
    int _2434 = _931 * _2424;
    int _2436 = _2434 + _1414;
    int _2438 = ~_2432;
    int _2440 = _2438 + 1;
    int _2442 = _2440 + 1;
    float _2444 = as_type<float>(_2416);
    if (!_2408)
    {
        _1740 = _1102;
    }
    float _2446 = _1740;
    float _2448 = 0.0;
    float _2450 = _2446;
    if (!_2408)
    {
        _2448 = _1102;
    }
    float _2452 = _2448;
    float _2454 = 0.0;
    float _2456 = _2452;
    if (!_2408)
    {
        _2454 = _1116;
    }
    float _2458 = _2454;
    float _2460 = _197 * _2396;
    float _2462 = _2458;
    if (!_2408)
    {
        _1742 = _1116;
    }
    float _2464 = _1742;
    float _2466 = _1102 * 2.0;
    float _2468 = _2464;
    if (_2408)
    {
        _2450 = _1098;
    }
    float _2470 = _2450;
    float _2472 = _203 * _2396;
    if (_2408)
    {
        _2456 = _1098;
    }
    float _2474 = _2456;
    float _2476 = _209 * _2396;
    if (_2408)
    {
        _2462 = _1102;
    }
    float _2478 = _2462;
    float _2480 = fma(_195, _2394, _2460);
    if (_2408)
    {
        _2468 = _1102;
    }
    float _2482 = _2468;
    float _2484 = floor(_2466);
    bool _2486 = _1108 != 2;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2492 = fma(_201, _2394, _2472);
    float _2494 = fma(_207, _2394, _2476);
    float _2496 = fma(_199, _2398, _2480);
    float _2498 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2500 = fma(_205, _2398, _2492);
    float _2502 = fma(_211, _2398, _2494);
    float _2504 = _1116 * 2.0;
    float _2506 = 1.0 / _2490;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2508;
    float _2512 = 0.0;
    float _2514 = _2498;
    if (_2486)
    {
        _2512 = _1098;
    }
    float _2516 = _2512;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2522 = _2516;
    if (_2486)
    {
        _1744 = _1102;
    }
    float _2524 = _1744;
    float _2526 = _2510 * _1928;
    float _2528 = _2524;
    if (!_2486)
    {
        _2522 = _1116;
    }
    float _2530 = _2522;
    float _2532 = _2500 + _1198;
    if (!_2486)
    {
        _2528 = _1098;
    }
    float _2534 = _2528;
    float _2536 = floor(_2504);
    bool _2538 = _1444 >= 0.0;
    bool _2540 = isnan(_1444);
    bool _2542 = _2538 || _2540;
    bool _2544 = isnan(0.0);
    bool _2546 = _2542 || _2544;
    float _2548 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2550 = _2546 ? 0 : 1;
    bool _2552 = _1444 > 0.0;
    float _2554 = 1.0 / _2520;
    int _2556 = ~_2550;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    bool _2562 = !_1718;
    int _2564 = _2562 ? _2430 : (-1);
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2570 = _2560;
    if (!_2552)
    {
        int _2572 = ~_2550;
        int _2574 = _2572 + 1;
        _2570 = _2574;
    }
    int _2576 = _2570;
    float _2578 = 1.0 / _2568;
    bool _2580 = _2484 >= 0.0;
    bool _2582 = isnan(_2484);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan(0.0);
    bool _2588 = _2584 || _2586;
    int _2590 = _2588 ? 0 : 1;
    bool _2592 = _2484 > 0.0;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2602;
    int _2606 = ~_2590;
    int _2608 = _2606 + 1;
    int _2610 = _2608 + 1;
    float _2612 = 1.0 / _2596;
    float _2614 = _2600 * _2342;
    float _2616 = _2604 * _2330;
    int _2618 = _945 * _2310;
    int _2620 = _2618 + _1504;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2630 = !_1946;
    int _2632 = _2630 ? 0 : 1;
    float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2636 = _2634 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2638 = _2610;
    if (!_2592)
    {
        int _2640 = ~_2590;
        int _2642 = _2640 + 1;
        _2638 = _2642;
    }
    int _2644 = _2638;
    float _2646 = _2624 * _2578;
    bool _2648 = !_1480;
    int _2650 = _2648 ? _2620 : (-1);
    float _2652 = _2628 * _2554;
    bool _2654 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2656 = isnan(_913);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2662 = _2658 || _2660;
    float _2664 = float(_2662);
    float _2666 = _2636 * _2506;
    int _2668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2670 = _2668 != 0;
    int _2672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2674 = _2672 != 0;
    int _2676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2678 = _2676 != 0;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2682 = _913 + _2680;
    bool _2684 = _2536 >= 0.0;
    bool _2686 = isnan(_2536);
    bool _2688 = _2684 || _2686;
    bool _2690 = isnan(0.0);
    bool _2692 = _2688 || _2690;
    float _2694 = -_2664;
    float _2696 = _2694 + 1.0;
    bool _2698 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2700 = isnan(_913);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2706 = _2702 || _2704;
    float _2708 = float(_2706);
    float _2710 = _2356 * _2612;
    int _2712 = _2692 ? 0 : 1;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2716 = _913 + _2714;
    bool _2718 = _2536 > 0.0;
    float _2720 = _2708 * _2696;
    bool _2722 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2724 = isnan(_913);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = -_2708;
    float _2736 = _2734 + 1.0;
    bool _2738 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2740 = isnan(_913);
    bool _2742 = _2738 || _2740;
    bool _2744 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2746 = _2742 || _2744;
    float _2748 = float(_2746);
    float _2750 = fma(_2614, _2716, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2752 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2754 = isnan(_913);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    float _2764 = _2732 * _2736;
    float _2766 = -_2732;
    float _2768 = _2766 + 1.0;
    float _2770 = -_2748;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2526, _2682, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2776 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2778 = isnan(_913);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = _2748 * _2768;
    float _2790 = in.m_70.w;
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _913 + _2792;
    float _2796 = _2762 * _2772;
    float _2798 = -_2762;
    float _2800 = _2798 + 1.0;
    bool _2802 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2804 = isnan(_913);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = fma(_2616, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2816 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2818 = _913 + _2816;
    float _2820 = _2786 * _2800;
    float _2822 = -_2786;
    float _2824 = _2822 + 1.0;
    bool _2826 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2828 = isnan(_913);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = -_2812;
    float _2840 = _2838 + 1.0;
    float _2842 = fma(_2666, _2818, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2846 = _913 + _2844;
    float _2848 = _2812 * _2824;
    float _2850 = _2836 * _2840;
    float _2852 = -_2836;
    float _2854 = _2852 + 1.0;
    float _2856 = fma(_2646, _2846, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2858 = _2774 * _2850;
    float _2860 = fma(_2652, _1174, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2862 = ~_2712;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    float _2868 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2858);
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2872 = _2496 + _2790;
    float _2874 = _2502 + _1148;
    float _2876 = fma(_2750, _2848, _2868);
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2880 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2870);
    float _2882 = fma(_2814, _2820, _2876);
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2886 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2878);
    float _2888 = _1102 + (-0.5);
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2892 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2884);
    float _2894 = _1102 + _1116;
    float _2896 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2890);
    float _2898 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2900 = fma(_2842, _2796, _2882);
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2904 = _2532 + _2902;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2908 = -_2370;
    float _2910 = fma(_2898, 2.0, _2908);
    int _2912 = _2100 >> 31;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2916 = fma(_1224, -2.0, _2906);
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2920 = _2872 + _2918;
    float _2922 = _2904 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2924 = _2912 & 3;
    float _2926 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2928 = _2866;
    float _2930 = _2874;
    if (!_2718)
    {
        int _2932 = ~_2712;
        int _2934 = _2932 + 1;
        _2928 = _2934;
    }
    int _2936 = _2928;
    float _2938 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2914);
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2942 = _2874 + _2940;
    float _2944 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2922);
    float _2946 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2948 = _1098 + _1116;
    float _2950 = _1098 + (-0.5);
    int _2952 = _2100 + _2924;
    float _2954 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2944);
    float _2956 = -_135;
    float _2958 = fma(_2956, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2910);
    int _2960 = _2952 >> 2;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2966 = _2960 << 4;
    int _2968 = _2966 + 656;
    float _2970 = _2112 + (-0.5);
    bool _2972 = !_2118;
    int _2974 = _2972 ? 0 : 1;
    float _2976 = -_2964;
    float _2978 = fma(_2946, 2.0, _2976);
    float _2980 = fma(_2856, _2788, _2900);
    float _2982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _2984 = uint(int(uint(_2968) >> uint(2)));
    uint _2986 = uint(int(uint(int(_2984)) >> uint(2)));
    int _2988 = int(_2984) & 3;
    float _2990 = (*spvDescriptorSet0.vp_c9)._m0[int(_2986)][_2988];
    int _2992 = int(_2984) + 1;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    int _2996 = _2992 & 3;
    float _2998 = (*spvDescriptorSet0.vp_c9)._m0[int(_2994)][_2996];
    bool _3000 = _2116 != 3;
    float _3002 = -_135;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2978);
    float _3006 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2982);
    float _3008 = fma(_2860, _2764, _2980);
    bool _3010 = !_3000;
    int _3012 = _3010 ? 0 : (-1);
    float _3014 = -_2970;
    float _3016 = -_2418;
    float _3018 = fma(_3014, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3016);
    bool _3020 = _2954 >= 0.0;
    int _3022 = _2968 + 8;
    uint _3024 = uint(int(uint(_3022) >> uint(2)));
    uint _3026 = uint(int(uint(int(_3024)) >> uint(2)));
    int _3028 = int(_3024) & 3;
    float _3030 = (*spvDescriptorSet0.vp_c9)._m0[int(_3026)][_3028];
    int _3032 = int(_3024) + 1;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    int _3036 = _3032 & 3;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[int(_3034)][_3036];
    float _3040 = _1934 + 0.5;
    float _3042 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2962);
    float _3044 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3046 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2958);
    float _3048 = _2404 + 0.5;
    float _3050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3052 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2916);
    float _3054 = _2122 + (-0.5);
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3004);
    float _3058 = fma(_3044, -2.0, _3050);
    int _3060 = abs(_2184);
    float _3062 = -_3054;
    float _3064 = -_3052;
    float _3066 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3064);
    float _3068 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3070 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3072 = fma(_2710, _1182, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3074 = abs(_3012);
    float _3076 = -_3070;
    float _3078 = fma(_2548, 2.0, _3076);
    int _3080 = abs(_2974);
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3084 = fma(_3072, _2720, _3008);
    int _3086 = abs(_2250);
    float _3088 = -_3082;
    float _3090 = fma(_2498, 2.0, _3088);
    int _3092 = ~_3060;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    if (_3020)
    {
        _2514 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3098 = _2514;
    float _3100 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2896);
    int _3102 = ~_3080;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3020)
    {
        float _3110 = _3098 * 5.0;
        _2244 = as_type<int>(_3110);
    }
    int _3112 = _2244;
    bool _3114 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3116 = isnan(0.0);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3122 = _3118 || _3120;
    float _3124 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2892);
    float _3126 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2880);
    if (_3020)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10102 = as_type<float>(_3112);
        out.gl_Position.z = _10102;
    }
    int _3128 = _3096 * as_type<int>(_2998);
    int _3130 = ~_3086;
    int _3132 = _3130 + 1;
    int _3134 = _3132 + 1;
    float _3136 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3138 = int(_3136);
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3142 = _3106 * as_type<int>(_2990);
    int _3144 = _3142 + _3128;
    int _3146 = abs(_2262);
    float _3148 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3058);
    int _3150 = _3134 * as_type<int>(_3030);
    int _3152 = _3150 + _3144;
    float _3154 = exp2(_1514);
    int _3156 = ~_3074;
    int _3158 = _3156 + 1;
    int _3160 = _3158 + 1;
    float _3162 = -_2382;
    float _3164 = _3162 + 1.0;
    int _3166 = ~_3146;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    float _3172 = _3108 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3174 = _1620 + (-0.5);
    int _3176 = _3160 * as_type<int>(_3038);
    int _3178 = _3176 + _3152;
    float _3180 = -_3100;
    float _3182 = _3180 + 1.0;
    float _3184 = float(uint(_3138));
    float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3188 = _3178 * _3170;
    float _3190 = fma(_3164, _2112, _3018);
    float _3192 = -_3182;
    float _3194 = fma(_3192, _1934, _3046);
    int _3196 = _2650 * _3146;
    int _3198 = _3196 + _3188;
    float _3200 = _1896 + 0.5;
    float _3202 = -_3154;
    float _3204 = _3202 + 1.0;
    float _3206 = 1.0 / _3184;
    float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3210 = 1.0 + _3208;
    float _3212 = -_135;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3090);
    float _3216 = fma(_3068, -2.0, _3140);
    float _3218 = _3122 ? _3204 : 0.0;
    out.m_84.x = _3194;
    out.m_84.y = _3190;
    float _3220 = fma(_3172, _3200, _3214);
    bool _3222 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3224 = isnan(1.0);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3230 = _3226 || _3228;
    float _3232 = 1.0 / _3210;
    float _3234 = float(uint(_3198));
    float _3236 = _3186 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3238 = abs(_3138);
    float _3240 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2938);
    float _3242 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2886);
    float _3244 = -_3236;
    float _3246 = -_3148;
    float _3248 = fma(_3244, _3174, _3246);
    int _3250 = ~_3138;
    int _3252 = _3250 + 1;
    float _3254 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3042);
    int _3256 = as_type<int>(_3206) + (-2);
    float _3258 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3006);
    float _3260 = -_135;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3078);
    float _3264 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3216);
    float _3266 = float(uint(_3238));
    float _3268 = as_type<float>(_3256) * _3234;
    float _3270 = _2904 * _2904;
    if (_3230)
    {
        float _3272 = _3218 * _3232;
        _145 = _3272;
    }
    float _3274 = _145;
    float _3276 = trunc(_3268);
    float _3278 = precise::max(_3276, 0.0);
    uint _3280 = uint(_3278);
    int _3282 = _1926 >> 31;
    float _3284 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3084);
    int _3286 = _2268 >> 31;
    float _3288 = fma(_2920, _2920, _3270);
    int _3290 = _3282 & 3;
    float _3292 = -_3254;
    float _3294 = _3292 + 1.0;
    bool _3296 = !_2670;
    int _3298 = _3296 ? 0 : 1;
    float _3300 = 1.0 / _3266;
    int _3302 = _3286 & 3;
    float _3304 = fma(_2942, _2942, _3288);
    int _3306 = _1926 + _3290;
    float _3308 = -_3124;
    float _3310 = _3308 + 1.0;
    int _3312 = _2268 + _3302;
    float _3314 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3316 = -_3294;
    float _3318 = fma(_1896, _3316, _3220);
    float _3320 = rsqrt(_3304);
    int _3322 = _3252 * int(_3280);
    int _3324 = _3322 + _3198;
    float _3326 = -_3310;
    float _3328 = fma(_2404, _3326, _3056);
    int _3330 = abs(_3198);
    float _3332 = -_3258;
    float _3334 = _3332 + 1.0;
    int _3336 = _3306 >> 2;
    out.m_86.x = _3284;
    int _3338 = _3312 >> 2;
    float _3340 = fma(_1620, _3334, _3248);
    float _3342 = float(uint(_3324));
    float _3344 = -_3126;
    float _3346 = _3344 + 1.0;
    int _3348 = as_type<int>(_3300) + (-2);
    float _3350 = -_3240;
    float _3352 = _3350 + 1.0;
    float _3354 = float(uint(_3330));
    float _3356 = as_type<float>(_3256) * _3342;
    int _3358 = _3336 << 4;
    int _3360 = _3358 + 368;
    float _3362 = _3314 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3364 = _3338 << 4;
    int _3366 = _3364 + 800;
    float _3368 = as_type<float>(_3348) * _3354;
    uint _3370 = uint(int(uint(_3360) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    float _3386 = _3362 * _3320;
    float _3388 = fma(_2122, _3346, _3066);
    int _3390 = abs(_3298);
    float _3392 = trunc(_3368);
    float _3394 = precise::max(_3392, 0.0);
    uint _3396 = uint(_3394);
    float _3398 = _2904 * _3386;
    float _3400 = _2920 * _3386;
    out.m_88.x = _3328;
    out.m_88.y = _3388;
    out.m_88.z = _3318;
    out.m_88.w = _3340;
    uint _3402 = uint(int(uint(_3366) >> uint(2)));
    uint _3404 = uint(int(uint(int(_3402)) >> uint(2)));
    int _3406 = int(_3402) & 3;
    float _3408 = (*spvDescriptorSet0.vp_c9)._m0[int(_3404)][_3406];
    int _3410 = int(_3402) + 1;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    int _3414 = _3410 & 3;
    float _3416 = (*spvDescriptorSet0.vp_c9)._m0[int(_3412)][_3414];
    float _3418 = -_3398;
    float _3420 = _2904 + _3418;
    float _3422 = -_3400;
    float _3424 = _2920 + _3422;
    float _3426 = float(_2936);
    float _3428 = _2942 * _3386;
    int _3430 = ~_3238;
    int _3432 = _3430 + 1;
    float _3434 = _3420 * _3420;
    float _3436 = float(_3390);
    float _3438 = trunc(_3356);
    float _3440 = precise::max(_3438, 0.0);
    uint _3442 = uint(_3440);
    int _3444 = ~_3138;
    int _3446 = _3444 + 1;
    float _3448 = fma(_3424, _3424, _3434);
    int _3450 = abs(_2632);
    int _3452 = _3432 * int(_3396);
    int _3454 = _3452 + _3330;
    int _3456 = _3366 + 8;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    uint _3460 = uint(int(uint(int(_3458)) >> uint(2)));
    int _3462 = int(_3458) & 3;
    float _3464 = (*spvDescriptorSet0.vp_c9)._m0[int(_3460)][_3462];
    int _3466 = int(_3458) + 1;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    int _3470 = _3466 & 3;
    float _3472 = (*spvDescriptorSet0.vp_c9)._m0[int(_3468)][_3470];
    float _3474 = _3436 * _3426;
    float _3476 = _3314;
    float _3478 = _3320;
    float _3480 = as_type<float>(_3450);
    if (_3020)
    {
        out.m_63.x = 0.0;
    }
    float _3482 = float(uint(_3454));
    float _3484 = -_3428;
    float _3486 = _2942 + _3484;
    int _3488 = ~_2400;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = _3360 + 8;
    uint _3496 = uint(int(uint(_3494) >> uint(2)));
    uint _3498 = uint(int(uint(int(_3496)) >> uint(2)));
    int _3500 = int(_3496) & 3;
    float _3502 = (*spvDescriptorSet0.vp_c9)._m0[int(_3498)][_3500];
    int _3504 = int(_3496) + 1;
    uint _3506 = uint(int(uint(_3504) >> uint(2)));
    int _3508 = _3504 & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    float _3512 = as_type<float>(_3348) * _3482;
    bool _3514 = !_2284;
    int _3516 = _3514 ? 0 : 1;
    int _3518 = int(_3280) + int(_3442);
    float _3520 = trunc(_3512);
    float _3522 = precise::max(_3520, 0.0);
    uint _3524 = uint(_3522);
    bool _3526 = _1944 != 3;
    bool _3528 = _931 == 0;
    int _3530 = _3446 * _3518;
    int _3532 = _3530 + _3198;
    int _3534 = ~_3238;
    int _3536 = _3534 + 1;
    float _3538 = _1310 + (-0.5);
    bool _3540 = !_3528;
    int _3542 = _3540 ? _2436 : (-1);
    int _3544 = _3492 * as_type<int>(_3384);
    bool _3546 = !_3526;
    int _3548 = _3546 ? 0 : (-1);
    bool _3550 = uint(_3532) >= uint(_3138);
    int _3552 = int(_3396) + int(_3524);
    bool _3554 = !_3550;
    int _3556 = _3554 ? 0 : (-1);
    int _3558 = _2442 * as_type<int>(_3416);
    int _3560 = abs(_3516);
    int _3562 = _3536 * _3552;
    int _3564 = _3562 + _3330;
    int _3566 = ~_3560;
    int _3568 = _3566 + 1;
    int _3570 = _3568 + 1;
    bool _3572 = _2282 != 3;
    int _3574 = ~_3450;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    int _3580 = _3570 * as_type<int>(_3408);
    int _3582 = _3580 + _3558;
    int _3584 = ~_3518;
    int _3586 = _3584 + _3556;
    int _3588 = _3586 + 1;
    bool _3590 = !_3572;
    int _3592 = _3590 ? 0 : (-1);
    int _3594 = _3578 * as_type<int>(_3376);
    int _3596 = _3594 + _3544;
    bool _3598 = uint(_3564) >= uint(_3238);
    int _3600 = _3138 * _3588;
    int _3602 = _3600 + _3198;
    int _3604 = abs(_2092);
    bool _3606 = !_3598;
    int _3608 = _3606 ? 0 : (-1);
    bool _3610 = _3138 == 0;
    int _3612 = abs(_2364);
    bool _3614 = !_3610;
    int _3616 = _3614 ? _3602 : (-1);
    float _3618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3620 = _3138 == 0;
    int _3622 = ~_3612;
    int _3624 = _3622 + 1;
    int _3626 = _3624 + 1;
    int _3628 = _3198 ^ _3138;
    float _3630 = -_3242;
    float _3632 = _3630 + 1.0;
    int _3634 = abs(_3548);
    int _3636 = _3626 * as_type<int>(_3464);
    int _3638 = _3636 + _3582;
    uint _3640 = uint(int(uint(_3628) >> uint(31)));
    float _3642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3644 = ~_3604;
    int _3646 = _3644 + 1;
    int _3648 = _3646 + 1;
    int _3650 = abs(_3592);
    int _3652 = ~_3608;
    int _3654 = _3552 + _3652;
    int _3656 = _3654 + 1;
    int _3658 = _3648 * as_type<int>(_3502);
    int _3660 = _3658 + _3596;
    int _3662 = ~int(_3640);
    int _3664 = _3662 + 1;
    int _3666 = ~_3634;
    int _3668 = _3666 + 1;
    int _3670 = _3668 + 1;
    int _3672 = ~_3650;
    int _3674 = _3672 + 1;
    int _3676 = _3674 + 1;
    int _3678 = _3656 ^ _3664;
    int _3680 = _3670 * as_type<int>(_3510);
    int _3682 = _3680 + _3660;
    int _3684 = abs(_2272);
    int _3686 = _3676 * as_type<int>(_3472);
    int _3688 = _3686 + _3638;
    int _3690 = ~_2426;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    float _3696 = in.m_90.x;
    float _3698 = in.m_90.y;
    float _3700 = in.m_90.z;
    int _3702 = ~_3664;
    int _3704 = _3702 + _3678;
    int _3706 = _3704 + 1;
    float _3708 = _3642 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3710 = ~_3684;
    int _3712 = _3710 + 1;
    int _3714 = _3712 + 1;
    int _3716 = _3682 * _3694;
    bool _3718 = !_3620;
    int _3720 = _3718 ? _3706 : (-1);
    float _3722 = _1288 + 0.5;
    float _3724 = float(_3616);
    int _3726 = _3688 * _3714;
    float _3728 = float(_3720);
    float _3730 = _3618 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3732 = _3542 * _2426;
    int _3734 = _3732 + _3716;
    float _3736 = fma(_3708, _3724, _3262);
    int _3738 = _2564 * _3684;
    int _3740 = _3738 + _3726;
    float _3742 = -_3264;
    float _3744 = fma(_3730, _3728, _3742);
    float _3746 = _3474 * (-2.0);
    float _3748 = fma(_3708, _3722, _3736);
    float _3750 = -_3730;
    float _3752 = fma(_3750, _3538, _3744);
    float _3754 = float(_3734);
    float _3756 = -_3352;
    float _3758 = fma(_1288, _3756, _3748);
    float _3760 = float(_3740);
    float _3762 = fma(_1310, _3632, _3752);
    float _3764 = fma(_2926, _3746, _2926);
    float _3766 = fma(_3746, _3696, _3696);
    bool _3768 = !_2674;
    int _3770 = _3768 ? 0 : 1;
    out.m_92.x = _3754;
    bool _3772 = !_2678;
    int _3774 = _3772 ? 0 : 1;
    int _3776 = abs(_3770);
    out.m_92.w = _3760;
    out.m_94.x = _3758;
    out.m_94.y = _3762;
    float _3778 = _3700;
    int _3780 = _3564;
    float _3782 = _3510;
    float _3784 = _3486;
    if (_3020)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3786 = -_3398;
    float _3788 = _2532 + _3786;
    float _3790 = float(_2576);
    float _3792 = -_3400;
    float _3794 = _2872 + _3792;
    float _3796 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3766);
    float _3798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3800 = _3788 + _3798;
    float _3802 = float(_3776);
    float _3804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3806 = _3794 + _3804;
    float _3808 = fma(_3764, _3274, _3796);
    float _3810 = _3800 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3812 = -_3428;
    float _3814 = _2874 + _3812;
    float _3816 = _3802 * _3790;
    float _3818 = fma(_3806, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3810);
    float _3820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3822 = _3814 + _3820;
    float _3824 = _2894 + (-1.0);
    int _3826 = abs(_3774);
    float _3828 = fma(_3486, _3486, _3448);
    float _3830 = fma(_3822, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3818);
    float _3832 = _3816 * (-2.0);
    float _3834 = fma(_3824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3836 = float(_2644);
    float _3838 = _2948 + (-1.0);
    float _3840 = fma(_3832, _3698, _3698);
    float _3842 = float(_3826);
    float _3844 = fma(_3834, _3832, _3834);
    bool _3846 = _3830 >= 0.0;
    float _3848 = fma(_2888, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3840);
    float _3850 = _3842 * _3836;
    float _3852 = _3808 * 0.15915493667125701904296875;
    float _3854 = fma(_3844, _3274, _3848);
    float _3856 = sqrt(_3828);
    float _3858 = _3850 * (-2.0);
    float _3860 = fma(_3838, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3862 = _3854 * 0.15915493667125701904296875;
    float _3864 = _1116 + (-0.5);
    float _3866 = fma(_3858, _3700, _3700);
    float _3868 = fma(_3860, _3858, _3860);
    float _3870 = _3794;
    if (_3846)
    {
        _3778 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3872 = _3778;
    float _3874 = _3852 * 6.283185482025146484375;
    float _3876 = sin(_3874);
    float _3878 = fma(_3864, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3866);
    int _3880 = as_type<int>(_3872);
    if (_3846)
    {
        out.m_63.x = 0.0;
    }
    if (_3846)
    {
        float _3882 = _3872 * 5.0;
        _3880 = as_type<int>(_3882);
    }
    int _3884 = _3880;
    float _3886 = fma(_3868, _3274, _3878);
    float _3888 = _3852 * 6.283185482025146484375;
    float _3890 = cos(_3888);
    if (_3846)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11211 = as_type<float>(_3884);
        out.gl_Position.z = _11211;
    }
    float _3892 = _3886 * 0.15915493667125701904296875;
    float _3894 = _3862 * 6.283185482025146484375;
    float _3896 = sin(_3894);
    float _3898 = _3862 * 6.283185482025146484375;
    float _3900 = cos(_3898);
    if (_3846)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3902 = _3892 * 6.283185482025146484375;
    float _3904 = cos(_3902);
    float _3906 = _3320 * _3856;
    float _3908 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3912 = _3876 * _3896;
    float _3914 = _3314 * _3906;
    float _3916 = _3906 * _3908;
    float _3918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3920 = _3892 * 6.283185482025146484375;
    float _3922 = sin(_3920);
    float _3924 = _3890 * _3896;
    float _3926 = _3910 * _3916;
    float _3928 = _3890 * _3900;
    float _3930 = _3876 * _3900;
    float _3932 = _3918 * _3914;
    float _3934 = _3890 * _3904;
    float _3936 = _3900 * _3904;
    float _3938 = _3876 * _3904;
    float _3940 = _3896 * _3904;
    float _3942 = _3934 * _3926;
    float _3944 = _3906 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3946 = _3944 * 0.5;
    float _3948 = fma(_3922, _3928, _3912);
    float _3950 = -_3930;
    float _3952 = fma(_3922, _3924, _3950);
    float _3954 = -_3926;
    float _3956 = _3922 * _3954;
    float _3958 = -_3924;
    float _3960 = fma(_3922, _3930, _3958);
    float _3962 = fma(_3948, _3932, _3942);
    float _3964 = _3938 * _3926;
    float _3966 = fma(_3936, _3932, _3956);
    float _3968 = fma(_3922, _3912, _3928);
    float _3970 = fma(_3952, _3946, _3962);
    float _3972 = fma(_3960, _3932, _3964);
    float _3974 = fma(_3940, _3946, _3966);
    float _3976 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = fma(_3968, _3946, _3972);
    float _3980 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3982 = _3970 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3984 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3986 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3980);
    float _3988 = fma(_3974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3982);
    float _3990 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3984);
    float _3992 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3986);
    float _3994 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3988);
    float _3996 = _3990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3998 = _3992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4000 = _3994 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4002 = _2874 + _3996;
    float _4004 = _2872 + _3998;
    float _4006 = _2532 + _4000;
    float _4008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4010 = _4002 + _4008;
    float _4012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4014 = _4004 + _4012;
    float _4016 = _4010 * _4010;
    float _4018 = fma(_4014, _4014, _4016);
    float _4020 = sqrt(_4018);
    bool _4022 = _4020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4024 = _3994;
    float _4026 = _4016;
    float _4028 = _4000;
    if (!_4022)
    {
        _4024 = _4004;
    }
    float _4030 = _4024;
    float _4032 = _4030;
    if (!_4022)
    {
        _4026 = _4002;
    }
    float _4034 = _4026;
    float _4036 = _4034;
    if (!_4022)
    {
        _4028 = _4006;
    }
    float _4038 = _4028;
    bool _4040 = !_4022;
    float _4042 = _4038;
    if (!_4040)
    {
        float _4044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4048 = _4020 + _4046;
        float _4050 = rsqrt(_4018);
        float _4052 = _4048 * _4044;
        float _4054 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4056 = _4052 * 0.15915493667125701904296875;
        float _4058 = _4056 * 6.283185482025146484375;
        float _4060 = cos(_4058);
        float _4062 = _4056 * 6.283185482025146484375;
        float _4064 = sin(_4062);
        float _4066 = _4060 + (-1.0);
        float _4068 = _4066 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4070 = fma(_4064, _4054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4072 = fma(_4006, _4060, _4068);
        float _4074 = _4050 * _4070;
        float _4076 = fma(_4014, _4074, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4078 = fma(_4010, _4074, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4042 = _4072;
        _4032 = _4076;
        _4036 = _4078;
    }
    float _4080 = _4042;
    float _4082 = _4032;
    float _4084 = _4036;
    float _4086 = -_2532;
    float _4088 = _4086 + _4080;
    float _4090 = -_2872;
    float _4092 = _4090 + _4082;
    float _4094 = -_2874;
    float _4096 = _4094 + _4084;
    float _4098 = _4088 * _4088;
    float _4100 = fma(_4092, _4092, _4098);
    float _4102 = fma(_4096, _4096, _4100);
    float _4104 = sqrt(_4102);
    bool _4106 = _4104 > 0.0;
    bool _4108 = !_4106;
    float _4110 = _4080;
    float _4112 = _4082;
    float _4114 = _4084;
    if (!_4108)
    {
        float _4116 = _245 * _245;
        float _4118 = rsqrt(_4102);
        float _4120 = fma(_237, _237, _4116);
        float _4122 = fma(_247, _247, _4120);
        float _4124 = sqrt(_4122);
        float _4126 = _4092 * _4118;
        float _4128 = _4088 * _4118;
        float _4130 = _4096 * _4118;
        bool _4132 = _4124 > 0.0;
        bool _4134 = !_4132;
        _2930 = _4126;
        if (!_4134)
        {
            float _4136 = rsqrt(_4122);
            float _4138 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4140 = _245 * _4136;
            float _4142 = _237 * _4136;
            float _4144 = _4128 * _4140;
            float _4146 = _247 * _4136;
            float _4148 = fma(_4126, _4142, _4144);
            float _4150 = _4138 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4152 = fma(_4130, _4146, _4148);
            float _4154 = _4152 * _4150;
            float _4156 = fma(_237, _4154, _4082);
            float _4158 = fma(_245, _4154, _4080);
            float _4160 = fma(_247, _4154, _4084);
            _4110 = _4158;
            _4112 = _4156;
            _4114 = _4160;
        }
    }
    float _4162 = _4110;
    float _4164 = _4112;
    float _4166 = _4114;
    float _4168 = _2930;
    float _4170 = -_3398;
    float _4172 = _4170 + _4162;
    float _4174 = -_3400;
    float _4176 = _4174 + _4164;
    float _4178 = -_3428;
    float _4180 = _4178 + _4166;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4184 = _4172 + _4182;
    float _4186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4188 = _4176 + _4186;
    float _4190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4192 = _4180 + _4190;
    float _4194 = _4184 * _4184;
    float _4196 = fma(_4188, _4188, _4194);
    float _4198 = _3788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4200 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4202 = fma(_4192, _4192, _4196);
    float _4204 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4198);
    float _4206 = rsqrt(_4202);
    float _4208 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4204);
    float _4210 = _3788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4212 = _4208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4214 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4210);
    float _4216 = sqrt(_4202);
    float _4218 = 1.0 / _4212;
    float _4220 = _4206 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4222 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4214);
    float _4224 = _4188 * _4220;
    float _4226 = _4192 * _4220;
    float _4228 = _4222 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4230 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4232 = _4224 * _4224;
    float _4234 = _4226 * _4226;
    float _4236 = _4228 + _4212;
    float _4238 = _3788 + _4230;
    float _4240 = _4232 + _4234;
    float _4242 = _4236 * _4218;
    float _4244 = _4242 * 0.5;
    float _4246 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4248 = sqrt(_4240);
    float _4250 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4252 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4254 = fma(_4244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4252);
    float _4256 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4246);
    float _4258 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4250);
    float _4260 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4256);
    float _4262 = 1.0 / _4254;
    float _4264 = fma(_3814, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4258);
    float _4266 = _4260 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4268 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4270 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4272 = trunc(_4266);
    int _4274 = int(_4272);
    float _4276 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4278 = _4248 + _4276;
    float _4280 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4282 = _4262 * _4280;
    float _4284 = trunc(_4268);
    int _4286 = int(_4284);
    bool _4288 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4290 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4292 = _4168;
    float _4294 = _4240;
    int _4296 = 2;
    float _4298 = _4232;
    float _4300 = _4234;
    if (_4270)
    {
        float _4302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4292 = _4302;
    }
    float _4304 = _4292;
    int _4306 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4308 = _4274 + _4306;
    int _4310 = _4308 + 1;
    bool _4312 = !_4288;
    int _4314 = _4312 ? 0 : 1;
    bool _4316 = _4310 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4318 = _4310;
    if (_4270)
    {
        float _4320 = rsqrt(_4240);
        _4294 = _4320;
    }
    float _4322 = _4294;
    int _4324 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4326 = _4286 + _4324;
    int _4328 = _4326 + 1;
    int _4330 = as_type<int>(_4322);
    if (!_4288)
    {
        _4296 = 1;
    }
    int _4332 = _4296;
    float _4334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4336 = _4310 | _4328;
    int _4338 = _4332;
    float _4340 = as_type<float>(_4336);
    if (!_4290)
    {
        _4338 = _4314;
    }
    int _4342 = _4338;
    bool _4344 = _4336 < 0;
    bool _4346 = _4344 || _4316;
    if (_4270)
    {
        float _4348 = _4278 * _4304;
        _4340 = _4348;
    }
    float _4350 = _4340;
    bool _4352 = _4328 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4354 = _4352 || _4346;
    if (_4270)
    {
        float _4356 = _4350 * 0.15915493667125701904296875;
        _2444 = _4356;
    }
    float _4358 = _2444;
    int _4360 = _4342 << 6;
    float _4362 = fma(_3794, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4364 = precise::max(0.0, _4334);
    int _4366 = as_type<int>(_4014);
    if (_4270)
    {
        float _4368 = _4358 * 6.283185482025146484375;
        float _4370 = sin(_4368);
        _4366 = as_type<int>(_4370);
    }
    int _4372 = _4366;
    int _4374 = _4360 + 96;
    uint _4376 = uint(int(uint(_4374) >> uint(2)));
    uint _4378 = uint(int(uint(int(_4376)) >> uint(2)));
    int _4380 = int(_4376) & 3;
    float _4382 = (*spvDescriptorSet0.vp_c15)._m0[int(_4378)][_4380];
    int _4384 = int(_4376) + 1;
    uint _4386 = uint(int(uint(_4384) >> uint(2)));
    int _4388 = _4384 & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    if (!_4270)
    {
        _3476 = _4224;
    }
    float _4392 = _3476;
    float _4394 = -_4220;
    float _4396 = -_4364;
    float _4398 = fma(_4184, _4394, _4396);
    float _4400 = _4392;
    if (!_4354)
    {
        int _4402 = _4328 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4404 = _4402 + _4310;
        _4318 = _4404;
    }
    int _4406 = _4318;
    int _4408 = _4360 + 48;
    uint _4410 = uint(int(uint(_4408) >> uint(2)));
    uint _4412 = uint(int(uint(int(_4410)) >> uint(2)));
    int _4414 = int(_4410) & 3;
    float _4416 = (*spvDescriptorSet0.vp_c15)._m0[int(_4412)][_4414];
    int _4418 = int(_4410) + 1;
    uint _4420 = uint(int(uint(_4418) >> uint(2)));
    int _4422 = _4418 & 3;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[int(_4420)][_4422];
    float _4426 = _2926;
    if (_4270)
    {
        float _4428 = _4358 * 6.283185482025146484375;
        float _4430 = cos(_4428);
        _4426 = _4430;
    }
    float _4432 = _4426;
    if (_4270)
    {
        float _4434 = _4398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3478 = _4434;
    }
    float _4436 = _3478;
    float _4438 = _4436;
    if (!_4354)
    {
        int _4440 = _4406 << 2;
        _3780 = _4440;
    }
    int _4442 = _3780;
    int _4444 = _4372;
    int _4446 = _4442;
    if (_4270)
    {
        float _4448 = fma(as_type<float>(_4372), _4436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3480 = _4448;
    }
    float _4450 = _3480;
    int _4452 = _4360 + 64;
    uint _4454 = uint(int(uint(_4452) >> uint(2)));
    uint _4456 = uint(int(uint(int(_4454)) >> uint(2)));
    int _4458 = int(_4454) & 3;
    float _4460 = (*spvDescriptorSet0.vp_c15)._m0[int(_4456)][_4458];
    int _4462 = int(_4454) + 1;
    uint _4464 = uint(int(uint(_4462) >> uint(2)));
    int _4466 = _4462 & 3;
    float _4468 = (*spvDescriptorSet0.vp_c15)._m0[int(_4464)][_4466];
    float _4470 = _4450;
    if (!_4270)
    {
        _4438 = _4398;
    }
    float _4472 = _4438;
    float _4474 = floor(_4362);
    float _4476 = _4472;
    if (_4270)
    {
        float _4478 = _4322 * _4450;
        _4470 = _4478;
    }
    float _4480 = _4470;
    if (!_4354)
    {
        uint _4482 = uint(int(uint(_4406) >> uint(2)));
        _4444 = int(_4482);
    }
    int _4484 = _4444;
    float _4486 = as_type<float>(_4484);
    if (!_4354)
    {
        int _4488 = 12 & _4442;
        _4446 = _4488;
    }
    int _4490 = _4446;
    if (_4270)
    {
        float _4492 = _4224 * _4480;
        _4400 = _4492;
    }
    float _4494 = _4400;
    int _4496 = _4360 + 104;
    uint _4498 = uint(int(uint(_4496) >> uint(2)));
    uint _4500 = uint(int(uint(int(_4498)) >> uint(2)));
    int _4502 = int(_4498) & 3;
    float _4504 = (*spvDescriptorSet0.vp_c15)._m0[int(_4500)][_4502];
    int _4506 = int(_4498) + 1;
    uint _4508 = uint(int(uint(_4506) >> uint(2)));
    int _4510 = _4506 & 3;
    float _4512 = (*spvDescriptorSet0.vp_c15)._m0[int(_4508)][_4510];
    if (_4270)
    {
        float _4514 = _4432 + (-1.0);
        _3782 = _4514;
    }
    float _4516 = _3782;
    float _4518 = _4516;
    if (!_4354)
    {
        int _4520 = _4484 << 4;
        int _4522 = _4520 + _4490;
        _4330 = _4522;
    }
    int _4524 = _4330;
    if (_4270)
    {
        float _4526 = _4494 * _4494;
        _4298 = _4526;
    }
    float _4528 = _4298;
    float _4530 = floor(_4200);
    if (_4270)
    {
        float _4532 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3784 = _4532;
    }
    float _4534 = _3784;
    if (!_4270)
    {
        _4518 = _4226;
    }
    float _4536 = _4518;
    float _4538 = _4536;
    if (_4270)
    {
        float _4540 = _4226 * _4480;
        _4538 = _4540;
    }
    float _4542 = _4538;
    int _4544 = _4360 + 56;
    uint _4546 = uint(int(uint(_4544) >> uint(2)));
    uint _4548 = uint(int(uint(int(_4546)) >> uint(2)));
    int _4550 = int(_4546) & 3;
    float _4552 = (*spvDescriptorSet0.vp_c15)._m0[int(_4548)][_4550];
    int _4554 = int(_4546) + 1;
    uint _4556 = uint(int(uint(_4554) >> uint(2)));
    int _4558 = _4554 & 3;
    float _4560 = (*spvDescriptorSet0.vp_c15)._m0[int(_4556)][_4558];
    if (_4270)
    {
        float _4562 = fma(_4398, _4432, _4534);
        _4476 = _4562;
    }
    float _4564 = _4476;
    if (_4270)
    {
        float _4566 = _4542 * _4542;
        _4300 = _4566;
    }
    float _4568 = _4300;
    float _4570 = -_4474;
    float _4572 = _4362 + _4570;
    float _4574 = fma(_4564, _4564, _4528);
    if (!_4354)
    {
        float _4576 = floor(_4266);
        _4486 = _4576;
    }
    float _4578 = _4486;
    int _4580 = _4360 + 72;
    uint _4582 = uint(int(uint(_4580) >> uint(2)));
    uint _4584 = uint(int(uint(int(_4582)) >> uint(2)));
    int _4586 = int(_4582) & 3;
    float _4588 = (*spvDescriptorSet0.vp_c15)._m0[int(_4584)][_4586];
    int _4590 = int(_4582) + 1;
    uint _4592 = uint(int(uint(_4590) >> uint(2)));
    int _4594 = _4590 & 3;
    float _4596 = (*spvDescriptorSet0.vp_c15)._m0[int(_4592)][_4594];
    float _4598 = _4574 + _4568;
    float _4600 = rsqrt(_4598);
    float _4602 = _4238 * _4390;
    int _4604 = _4360 + 80;
    uint _4606 = uint(int(uint(_4604) >> uint(2)));
    uint _4608 = uint(int(uint(int(_4606)) >> uint(2)));
    int _4610 = int(_4606) & 3;
    float _4612 = (*spvDescriptorSet0.vp_c15)._m0[int(_4608)][_4610];
    int _4614 = int(_4606) + 1;
    uint _4616 = uint(int(uint(_4614) >> uint(2)));
    int _4618 = _4614 & 3;
    float _4620 = (*spvDescriptorSet0.vp_c15)._m0[int(_4616)][_4618];
    float _4622 = fma(_3794, _4382, _4602);
    float _4624 = _4238 * _4424;
    float _4626 = _4432;
    float _4628 = _4624;
    if (!_4354)
    {
        int _4630 = _4524 + 400;
        uint _4632 = uint(int(uint(_4630) >> uint(2)));
        uint _4634 = uint(int(uint(int(_4632)) >> uint(2)));
        int _4636 = int(_4632) & 3;
        float _4638 = (*spvDescriptorSet0.vp_c15)._m0[int(_4634)][_4636];
        _4626 = _4638;
    }
    float _4640 = _4626;
    float _4642 = _4600 * _4494;
    float _4644 = _4238 * _4468;
    float _4646 = fma(_3794, _4416, _4624);
    float _4648 = _4600 * _4564;
    float _4650 = _4600 * _4542;
    float _4652 = fma(_3794, _4460, _4644);
    float _4654 = _4642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_4354)
    {
        float _4656 = floor(_4268);
        _4628 = _4656;
    }
    float _4658 = _4628;
    float _4660 = fma(_3814, _4504, _4622);
    float _4662 = -_4654;
    float _4664 = fma(_4648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4662);
    float _4666 = fma(_3814, _4552, _4646);
    float _4668 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4670 = _4660 + _4512;
    float _4672 = _4666 + _4560;
    float _4674 = fma(_3814, _4588, _4652);
    float _4676 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4668);
    float _4678 = 1.0 / _4670;
    int _4680 = _4360 + 88;
    uint _4682 = uint(int(uint(_4680) >> uint(2)));
    uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
    int _4686 = int(_4682) & 3;
    float _4688 = (*spvDescriptorSet0.vp_c15)._m0[int(_4684)][_4686];
    int _4690 = int(_4682) + 1;
    uint _4692 = uint(int(uint(_4690) >> uint(2)));
    int _4694 = _4690 & 3;
    float _4696 = (*spvDescriptorSet0.vp_c15)._m0[int(_4692)][_4694];
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4700 = fma(_4216, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4698);
    float _4702 = precise::clamp(_4700, 0.0, 1.0);
    float _4704 = _4674 + _4596;
    float _4706 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4708 = -_4650;
    float _4710 = fma(_4708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4664);
    float _4712 = -_4702;
    float _4714 = _4712 + 1.0;
    float _4716 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4676);
    float _4718 = _4238 * _4620;
    float _4720 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4722 = abs(_4714);
    float _4724 = log2(_4722);
    float _4726 = _4716 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4728 = fma(_3794, _4612, _4718);
    float _4730 = fma(_4710, 0.5, 0.5);
    float _4732 = _4726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4734 = _4672 * _4678;
    float _4736 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4738 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4706);
    float _4740 = _4704 * _4678;
    bool _4742 = _4734 >= 0.0;
    float _4744 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4736);
    float _4746 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4738);
    float _4748 = _4172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _4750 = _4734 <= 1.0;
    bool _4752 = _4750 && _4742;
    float _4754 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4744);
    float _4756 = _4746 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4758 = fma(_4176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4748);
    bool _4760 = _4740 >= 0.0;
    bool _4762 = _4760 && _4752;
    float _4764 = _4754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4766 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4768 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4758);
    bool _4770 = _4740 <= 1.0;
    bool _4772 = _4770 && _4762;
    float _4774 = -_4732;
    float _4776 = fma(_4774, _4720, 1.0);
    float _4778 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4766);
    float _4780 = fma(_4710, -0.5, 0.5);
    float _4782 = _4768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4784 = _4724 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4786 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4778);
    float _4788 = sqrt(_4780);
    float _4790 = fma(_4730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4792 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4786);
    float _4794 = _4758;
    float _4796 = _4732;
    float _4798 = _4784;
    float _4800 = _4792;
    if (_4772)
    {
        float _4802 = float(_4342);
        _4794 = _4802;
    }
    float _4804 = _4794;
    if (!_4354)
    {
        float _4806 = rint(_4640);
        float _4808 = precise::max(_4806, 0.0);
        uint _4810 = uint(_4808);
        uint _4812 = clamp(_4810, 0u, 65535u);
        _4796 = as_type<float>(_4812);
    }
    float _4814 = _4796;
    float _4816 = fma(_3814, _4688, _4728);
    float _4818 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4820 = _4816 + _4696;
    float _4822 = fma(_4730, _4790, -0.212114393711090087890625);
    float _4824 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4826 = exp2(_4784);
    float _4828 = -_4530;
    float _4830 = _4200 + _4828;
    float _4832 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4818);
    float _4834 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4824);
    float _4836 = _4788 * 0.636619746685028076171875;
    float _4838 = _4820 * _4678;
    float _4840 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4832);
    float _4842 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4834);
    float _4844 = log2(_4776);
    float _4846 = _4842;
    if (!_4354)
    {
        float _4848 = -_4658;
        float _4850 = _4268 + _4848;
        _4798 = _4850;
    }
    float _4852 = _4798;
    float _4854 = fma(_4730, _4822, 1.570728778839111328125);
    float _4856 = _4648 + 1.0;
    float _4858 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4840);
    float _4860 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4842);
    float _4862 = -_4854;
    float _4864 = fma(_4836, _4862, 1.0);
    if (!_4354)
    {
        float _4866 = -_4578;
        float _4868 = _4266 + _4866;
        _4846 = _4868;
    }
    float _4870 = _4846;
    float _4872 = 1.0 / _4792;
    float _4874 = -_4648;
    float _4876 = fma(_4826, _4856, _4874);
    float _4878 = _4804;
    if (_4772)
    {
        float _4880 = rint(_4804);
        float _4882 = precise::max(_4880, 0.0);
        uint _4884 = uint(_4882);
        uint _4886 = clamp(_4884, 0u, 65535u);
        _4878 = as_type<float>(_4886);
    }
    float _4888 = _4878;
    float _4890 = _4844 * 0.693147182464599609375;
    float _4892 = fma(_4876, 0.5, 0.5);
    float2 _12870 = float2(_4572, _4830);
    float _4894 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12870, float2(0.0), isnan(_12870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12870, float2(0.0), isnan(_12870)), level(0.0)).x;
    float _4896 = as_type<float>(_4342);
    if (!_4354)
    {
        float3 _12888 = float3(_4870, _4852, float(as_type<int>(_4814)));
        float3 _12892 = select(_12888, float3(0.0), isnan(_12888));
        float _4898 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12892.xy, uint(rint(_12892.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12892.xy, uint(rint(_12892.z)), level(0.0)).x;
        _4896 = _4898;
    }
    float _4900 = _4896;
    float _4902 = _4890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4904 = _4858 * _4872;
    float _4906 = _4860 * _4872;
    float _4908 = fma(_4904, 0.5, 0.5);
    float _4910 = fma(_4906, -0.5, 0.5);
    float _4912 = _4888;
    if (_4772)
    {
        float3 _12921 = float3(_4734, _4740, float(as_type<int>(_4888)));
        float3 _12923 = select(_12921, float3(0.0), isnan(_12921));
        float _4914 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12923.xy, uint(rint(_12923.z)), _4838, level(0.0));
        _4912 = _4914;
    }
    float _4916 = _4912;
    float3 _12933 = float3(_4908, _4910, _4902);
    float _4918 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12933, float3(0.0), isnan(_12933)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12933, float3(0.0), isnan(_12933)), level(0.0)).x;
    float3 _12942 = float3(_4908, _4910, _4902);
    float4 _4921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12942, float3(0.0), isnan(_12942)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12942, float3(0.0), isnan(_12942)), level(0.0)).xyzw;
    float _4923 = _4921.x;
    float _4925 = _4921.y;
    float _4927 = _4921.z;
    float _4929 = _4921.w;
    float2 _12958 = float2(_4864, _4892);
    float3 _4933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12958, float2(0.0), isnan(_12958)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12958, float2(0.0), isnan(_12958)), level(0.0)).xyz;
    float _4935 = _4933.x;
    float _4937 = _4933.y;
    float _4939 = _4933.z;
    float _4941 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4943 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4945 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4947 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4949 = fma(_4941, _4941, 1.0);
    float _4951 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4953 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4943);
    float _4955 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4957 = rsqrt(_4949);
    float _4959 = -_3922;
    float _4961 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4947);
    float _4963 = -_3922;
    float _4965 = fma(_4963, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4951);
    float _4967 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4969 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4945);
    float _4971 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4953);
    float _4973 = -_3922;
    float _4975 = fma(_4973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4955);
    float _4977 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4967);
    float _4979 = abs(_4282);
    float _4981 = log2(_4979);
    float _4983 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4969);
    float _4985 = _4756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4987 = fma(_3968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4977);
    float _4989 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4961);
    float _4991 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4965);
    float _4993 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4975);
    float _4995 = fma(_4764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4985);
    float _4997 = _4941 * _4957;
    float _4999 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5001 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4995);
    float _5003 = -_4971;
    float _5005 = _4997 * _5003;
    float _5007 = -_4983;
    float _5009 = _4997 * _5007;
    float _5011 = -_4987;
    float _5013 = _4997 * _5011;
    float _5015 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4999);
    float _5017 = _4981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5019 = fma(_4957, _4989, _5005);
    float _5021 = fma(_4957, _4991, _5009);
    float _5023 = fma(_4957, _4993, _5013);
    float _5025 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5027 = _3948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5029 = exp2(_5017);
    float _5031 = _4724 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5033 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5025);
    float _5035 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5027);
    float _5037 = fma(_4782, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5001);
    float _5039 = _4792 * 0.5;
    out.m_96.x = _5019;
    out.m_96.y = _5021;
    out.m_96.z = _5023;
    bool _5041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5043 = isnan(0.5);
    bool _5045 = _5041 || _5043;
    bool _5047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5049 = _5045 || _5047;
    float _5051 = fma(_4860, -0.5, _5039);
    float _5053 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5033);
    float _5055 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5035);
    float _5057 = exp2(_5031);
    float _5059 = _5037 + _4792;
    float _5061 = _4858 + _4792;
    out.gl_Position.x = _4858;
    out.gl_Position.y = _4860;
    out.gl_Position.z = _5037;
    out.gl_Position.w = _4792;
    float _5063 = fma(_5029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5065 = precise::clamp(_5063, 0.0, 1.0);
    float _5067 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5015);
    float _5069 = _5059 * 0.5;
    float _5071 = fma(_5065, -2.0, 3.0);
    float _5073 = _5065 * _5065;
    out.m_98.x = _5053;
    out.m_98.y = _5055;
    out.m_98.z = _5067;
    float _5075 = _5061 * 0.5;
    float _5077 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5079 = _5073 * _5071;
    float _5081 = _4941 * _4989;
    float _5083 = _4941 * _4991;
    out.m_100.x = _5075;
    out.m_100.y = _5051;
    out.m_100.z = _5069;
    out.m_100.w = _4792;
    float _5085 = -_5079;
    float _5087 = _5085 + 1.0;
    bool _5089 = _4282 <= 8000.0;
    bool _5091 = isnan(_4282);
    bool _5093 = _5089 || _5091;
    bool _5095 = isnan(8000.0);
    bool _5097 = _5093 || _5095;
    float _5099 = float(_5097);
    float _5101 = _4941 * _4993;
    float _5103 = fma(_5077, _5055, _5083);
    float _5105 = fma(_5087, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5079);
    float _5107 = fma(_5077, _5053, _5081);
    float _5109 = fma(_5077, _5067, _5101);
    float _5111 = _5105;
    float _5113 = _5019;
    if (_5049)
    {
        _4800 = 1.0;
    }
    float _5115 = _4800;
    float _5117 = _5099 * _5105;
    float _5119 = _5115;
    float _5121 = _5117;
    if (!_5049)
    {
        float _5123 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5125 = _5123 * 0.15915493667125701904296875;
        float _5127 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5129;
        float _5133 = _5125 * 6.283185482025146484375;
        float _5135 = cos(_5133);
        float _5137 = _5127 * 0.15915493667125701904296875;
        float _5139 = _5125 * 6.283185482025146484375;
        float _5141 = sin(_5139);
        float _5143 = 1.0 / _5135;
        float _5145 = _5137 * 6.283185482025146484375;
        float _5147 = cos(_5145);
        float _5149 = _5141 * _5143;
        float _5151 = _5137 * 6.283185482025146484375;
        float _5153 = sin(_5151);
        float _5155 = _5147 * _5149;
        float _5157 = 1.0 / _5131;
        float _5159 = 1.0 / _5155;
        float _5161 = _5153 * _5159;
        float _5163 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5165 = fma(_4282, _5161, _5163);
        float _5167 = _5165 * _5157;
        float _5169 = precise::clamp(_5167, 0.0, 1.0);
        _5111 = _5157;
        _5113 = _5143;
        _5119 = _5169;
    }
    float _5171 = _5111;
    float _5173 = _5113;
    float _5175 = _5119;
    float _5177 = _5117 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5179 = -_4894;
    float _5181 = _5179 + 1.0;
    float _5183 = -_5057;
    float _5185 = _5183 + 1.0;
    float _5187 = _5171;
    float _5189 = _5173;
    float _5191 = _5177;
    if (!_4772)
    {
        _5187 = 1.0;
    }
    float _5193 = _5187;
    float _5195 = _4971 + _5107;
    float _5197 = _4983 + _5103;
    float _5199 = _4987 + _5109;
    float _5201 = _5193;
    if (_4772)
    {
        bool _5203 = _4916 >= _4838;
        bool _5205 = isnan(_4916);
        bool _5207 = _5203 || _5205;
        bool _5209 = isnan(_4838);
        bool _5211 = _5207 || _5209;
        float _5213 = float(_5211);
        _5201 = _5213;
    }
    float _5215 = _5201;
    float _5217 = _5181 * _5177;
    float _5219 = precise::clamp(_5217, 0.0, 1.0);
    float _5221 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_4354)
    {
        _5189 = 1.0;
    }
    float _5223 = _5189;
    float _5225 = _5223;
    if (!_4354)
    {
        int _5227 = _4406 << 4;
        int _5229 = _5227 + 2048;
        uint _5231 = uint(int(uint(_5229) >> uint(2)));
        uint _5233 = uint(int(uint(int(_5231)) >> uint(2)));
        int _5235 = int(_5231) & 3;
        float _5237 = (*spvDescriptorSet0.vp_c15)._m0[int(_5233)][_5235];
        int _5239 = int(_5231) + 1;
        uint _5241 = uint(int(uint(_5239) >> uint(2)));
        int _5243 = _5239 & 3;
        float _5245 = (*spvDescriptorSet0.vp_c15)._m0[int(_5241)][_5243];
        int _5247 = _5229 + 8;
        uint _5249 = uint(int(uint(_5247) >> uint(2)));
        uint _5251 = uint(int(uint(int(_5249)) >> uint(2)));
        int _5253 = int(_5249) & 3;
        float _5255 = (*spvDescriptorSet0.vp_c15)._m0[int(_5251)][_5253];
        int _5257 = int(_5249) + 1;
        uint _5259 = uint(int(uint(_5257) >> uint(2)));
        int _5261 = _5257 & 3;
        float _5263 = (*spvDescriptorSet0.vp_c15)._m0[int(_5259)][_5261];
        float _5265 = _4238 * _5245;
        float _5267 = fma(_3794, _5237, _5265);
        float _5269 = fma(_3814, _5255, _5267);
        float _5271 = _5269 + _5263;
        float _5273 = precise::clamp(_5271, 0.0, 1.0);
        float _5275 = -_5273;
        float _5277 = _5275 + _4900;
        float _5279 = fma(_5277, 500.0, 1.5);
        float _5281 = exp2(_5279);
        float _5283 = 0.0 + _5281;
        float _5285 = precise::clamp(_5283, 0.0, 1.0);
        _5225 = _5285;
        _5121 = _5237;
        _5191 = _5245;
        _3870 = 500.0;
    }
    float _5287 = _5225;
    float _5289 = _5121;
    float _5291 = _5191;
    float _5293 = _3870;
    float _5295 = _5215 * _5287;
    float _5297 = _5221 * _4918;
    float _5299 = -_5219;
    float _5301 = fma(_5299, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5303 = -_5221;
    float _5305 = _5303 + 1.0;
    out.m_102.x = _5195;
    out.m_102.y = _5197;
    out.m_102.z = _5199;
    float _5307 = _4929 * _5297;
    float _5309 = -_5295;
    float _5311 = fma(_5309, _5301, 1.0);
    float _5313 = precise::clamp(_5311, 0.0, 1.0);
    float _5315 = _4939 * _5297;
    float _5317 = _4929 * _5305;
    float _5319 = fma(_4935, _5307, _4923);
    float _5321 = fma(_4937, _5307, _4925);
    float _5323 = _5313 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5325 = fma(_4929, _5315, _4927);
    bool _5327 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5329 = isnan(_4216);
    bool _5331 = _5327 || _5329;
    bool _5333 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5335 = _5331 || _5333;
    float _5337 = _5175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _5323;
    out.m_106.x = _5319;
    out.m_106.y = _5321;
    out.m_106.z = _5325;
    out.m_106.w = _5317;
    float _5339 = _5291;
    float _5341 = _5289;
    float _5343 = _5293;
    float _5345 = _5305;
    float _5347 = _5307;
    float _5349 = _5313;
    if (!_5335)
    {
        _5339 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5351 = _5339;
    float _5353 = _5351;
    float _5355 = _5351;
    if (!_5335)
    {
        _5341 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5357 = _5341;
    float _5359 = _5357;
    float _5361 = _5357;
    if (!_5335)
    {
        _5343 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5363 = _5343;
    float _5365 = _5363;
    float _5367 = _5363;
    if (!_5335)
    {
        _5345 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5369 = _5345;
    float _5371 = _5369;
    float _5373 = _5369;
    if (!_5335)
    {
        _5347 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5375 = _5347;
    float _5377 = _5375;
    float _5379 = _5375;
    if (!_5335)
    {
        _5349 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5381 = _5349;
    bool _5383 = !_5335;
    float _5385 = _5381;
    float _5387 = _5381;
    if (!_5383)
    {
        bool _5389 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5391 = isnan(_4216);
        bool _5393 = _5389 || _5391;
        bool _5395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5397 = _5393 || _5395;
        if (!_5397)
        {
            float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5401 = _4216 + _5399;
            float _5403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5403;
            float _5407 = 1.0 / _5405;
            float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5429 = _5401 * _5407;
            float _5431 = precise::clamp(_5429, 0.0, 1.0);
            float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5437 = fma(_5431, _5411, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5439 = fma(_5431, _5435, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5441 = fma(_5431, _5415, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5443 = fma(_5431, _5419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5445 = fma(_5431, _5423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5447 = fma(_5431, _5427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5361 = _5439;
            _5379 = _5445;
            _5355 = _5437;
            _5373 = _5443;
            _5367 = _5441;
            _5387 = _5447;
            _5449 = true;
        }
        else
        {
            bool _5451 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5453 = isnan(_4216);
            bool _5455 = _5451 || _5453;
            bool _5457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5459 = _5455 || _5457;
            if (!_5459)
            {
                _5353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5461 = _5353;
            _5355 = _5461;
            if (!_5459)
            {
                _5359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5463 = _5359;
            _5361 = _5463;
            if (!_5459)
            {
                _5365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5465 = _5365;
            _5367 = _5465;
            if (!_5459)
            {
                _5371 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5467 = _5371;
            _5373 = _5467;
            if (!_5459)
            {
                _5377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5469 = _5377;
            _5379 = _5469;
            if (!_5459)
            {
                _5385 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5471 = _5385;
            bool _5473 = !_5459;
            _5387 = _5471;
            if (!_5473)
            {
                bool _5475 = _4216 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5477 = isnan(_4216);
                bool _5479 = _5475 || _5477;
                bool _5481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5483 = _5479 || _5481;
                if (!_5483)
                {
                    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5487 = _4216 + _5485;
                    float _5489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5489;
                    float _5493 = 1.0 / _5491;
                    float _5495 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5497 = _5495 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5499 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5501 = _5499 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5505 = _5503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5509 = _5507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5513 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5515 = _5487 * _5493;
                    float _5517 = precise::clamp(_5515, 0.0, 1.0);
                    float _5519 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5523 = fma(_5517, _5497, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5525 = fma(_5517, _5521, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5527 = fma(_5517, _5501, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5529 = fma(_5517, _5505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5531 = fma(_5517, _5509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5533 = fma(_5517, _5513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5361 = _5525;
                    _5379 = _5531;
                    _5355 = _5523;
                    _5373 = _5529;
                    _5367 = _5527;
                    _5387 = _5533;
                    _5449 = true;
                }
                else
                {
                    _5361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5373 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5387 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5449 = false;
    float _5535 = _5361;
    float _5537 = _5379;
    float _5539 = _5355;
    float _5541 = _5373;
    float _5543 = _5367;
    float _5545 = _5387;
    float _5547 = fma(_5197, -0.5, 0.5);
    float _5549 = precise::clamp(_5547, 0.0, 1.0);
    float _5551 = -_5535;
    float _5553 = _5551 + _5537;
    float _5555 = -_5539;
    float _5557 = _5555 + _5541;
    out.m_108.x = 0.0;
    float _5559 = fma(_5549, _5553, _5535);
    float _5561 = -_5543;
    float _5563 = _5561 + _5545;
    float _5565 = fma(_5549, _5557, _5539);
    float _5567 = _5559 * 0.586610972881317138671875;
    bool _5569 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5571 = fma(_5549, _5563, _5543);
    float _5573 = _5337 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5575 = fma(_5565, 0.298911988735198974609375, _5567);
    bool _5577 = _5175 > 0.0;
    bool _5579 = isnan(_5175);
    bool _5581 = _5577 || _5579;
    bool _5583 = isnan(0.0);
    bool _5585 = _5581 || _5583;
    float _5587 = fma(_5571, 0.114477999508380889892578125, _5575);
    out.m_63.x = _5573;
    float _5589 = -_5587;
    float _5591 = _5565 + _5589;
    float _5593 = -_5587;
    float _5595 = _5559 + _5593;
    float _5597 = -_5587;
    float _5599 = _5571 + _5597;
    float _5601 = fma(_5591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    float _5603 = fma(_5595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    float _5605 = fma(_5599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5587);
    bool _5607 = !_5569;
    if (!_5607)
    {
        float _5609 = -_4172;
        float _5611 = _5609 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5613 = -_4176;
        float _5615 = _5613 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5617 = -_4180;
        float _5619 = _5617 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5621 = _5611 * _5611;
        float _5623 = fma(_5615, _5615, _5621);
        float _5625 = fma(_5619, _5619, _5623);
        float _5627 = sqrt(_5625);
        float _5629 = rsqrt(_5625);
        float _5631 = -_5627;
        float _5633 = _5631 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5635 = _5633 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5637 = precise::clamp(_5635, 0.0, 1.0);
        float _5639 = _5615 * _5629;
        float _5641 = _5611 * _5629;
        float _5643 = abs(_5637);
        float _5645 = log2(_5643);
        float _5647 = _5619 * _5629;
        float _5649 = _5639 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5651 = _5197 * _5641;
        float _5653 = -_5641;
        float _5655 = -_5649;
        float _5657 = fma(_5653, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5655);
        float _5659 = fma(_5195, _5639, _5651);
        float _5661 = -_5647;
        float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5657);
        float _5665 = fma(_5199, _5647, _5659);
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5671 = _5663 + _5669;
        float _5673 = _5645 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5675 = _5671 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5677 = precise::clamp(_5675, 0.0, 1.0);
        float _5679 = exp2(_5673);
        float _5681 = _5679 * _5677;
        float _5683 = _5667 * _5681;
        float _5685 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5687 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5689 = _5683 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5685;
        out.m_108.y = _5687;
        out.m_108.z = _5689;
    }
    out.m_110.x = _5601;
    out.m_110.y = _5603;
    out.m_110.z = _5605;
    if (_5585)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5691 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5691;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

