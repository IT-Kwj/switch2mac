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
    float4 m_90 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
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
    float4 m_94 [[attribute(4)]];
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5475 = false;
    bool _745 = false;
    bool _601 = false;
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
        float _5785 = as_type<float>(_153);
        out.gl_Position.z = _5785;
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
        float _5848 = as_type<float>(_185);
        out.gl_Position.z = _5848;
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
    float _303 = 1.0 / _283;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _307 * _293;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _291;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _271 + _333;
    float _337 = _315 * _303;
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
    bool _359 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_271);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = 1.0 / _301;
    float _377 = _335 * _331;
    bool _379 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _381 = isnan(_271);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _271 + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _395;
    float _399 = -_389;
    float _401 = _399 + 1.0;
    float _403 = _341 * _343;
    float _405 = -_329;
    float _407 = _405 + 1.0;
    float _409 = fma(_397, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = _357 * _407;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _389 * _373;
    bool _427 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _429 = isnan(_271);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _439;
    float _443 = _393 * _375;
    float _445 = _423 * _401;
    float _447 = -_423;
    float _449 = _447 + 1.0;
    bool _451 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _453 = isnan(_271);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_441, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = _437 * _449;
    float _471 = -_437;
    float _473 = _471 + 1.0;
    float _475 = -_461;
    float _477 = _475 + 1.0;
    float _479 = fma(_467, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = _461 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = _369 * _477;
    float _493 = -_369;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = fma(_489, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _503 = _463 * _491;
    float _505 = _409 * _491;
    float _507 = fma(_483, _345, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_499, _345, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _513 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_479, _485, _511);
    float _525 = fma(_501, _485, _513);
    float _527 = fma(_517, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _535;
    float _539 = fma(_507, _469, _523);
    float _541 = fma(_509, _469, _525);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _547 = fma(_533, _403, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _549 = fma(_537, _403, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _555 = fma(_527, _445, _539);
    float _557 = fma(_529, _445, _541);
    float _559 = fma(_545, _443, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _561 = fma(_553, _443, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _563 = fma(_547, _425, _555);
    float _565 = fma(_549, _425, _557);
    float _567 = fma(_559, _411, _563);
    float _569 = fma(_561, _411, _565);
    float _571 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].x, _567);
    float _573 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].y, _569);
    bool _575 = !_309;
    float _577 = _513;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _581 = _377;
    float _599;
    if (!_575)
    {
        float _583 = in.m_76.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        _599 = _179;
    }
    _601 = false;
    float _603 = _599;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _603 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _613 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_603);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_603);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _641;
    bool _645 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = isnan(_603);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = 1.0 / _611;
    float _659 = -_623;
    float _661 = _659 + 1.0;
    bool _663 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _665 = _639 * _661;
    float _667 = -_639;
    float _669 = _667 + 1.0;
    float _671 = 1.0 / _627;
    float _673 = _643 * _657;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = fma(_673, _607, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -_655;
    float _683 = _681 + 1.0;
    float _685 = _679 * _665;
    float _687 = _677 * _671;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _603 + _689;
    float _693 = _623 * _683;
    float _695 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[115].x, _685);
    float _697 = fma(_687, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = fma(_697, _693, _695);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[117].x, _699);
    float _707 = in.m_78.x;
    float _709 = in.m_78.y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _713 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _719 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _713;
    out.m_80.y = _719;
    out.m_80.z = _715;
    out.m_80.w = _717;
    float _721 = _573 * _709;
    float _723 = _571 * _707;
    bool _725 = !_663;
    float _743;
    if (!_725)
    {
        float _727 = in.m_76.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        _743 = _179;
    }
    _745 = false;
    float _747 = _743;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _747 + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _757 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _759 = isnan(_747);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _777 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _779 = isnan(_747);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = 1.0 / _755;
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _795;
    bool _799 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _801 = isnan(_747);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _787 * _793;
    float _813 = -_787;
    float _815 = _813 + 1.0;
    bool _817 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _819 = 1.0 / _771;
    float _821 = _809 * _815;
    float _823 = -_809;
    float _825 = _823 + 1.0;
    float _827 = 1.0 / _775;
    float _829 = _797 * _789;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _835 = fma(_829, _751, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _837 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _839 = isnan(_747);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = _833 * _819;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _857 = _747 + _855;
    float _859 = _835 * _821;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _863 = _747 + _861;
    float _865 = fma(_849, _857, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _867 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[131].x, _859);
    float _869 = _853 * _827;
    float _871 = -_847;
    float _873 = _871 + 1.0;
    float _875 = fma(_865, _811, _867);
    float _877 = fma(_869, _863, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _879 = _767 * _873;
    float _881 = fma(_877, _879, _875);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _889 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[134].x, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _889 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _891;
    out.m_82.y = _893;
    out.m_82.z = _895;
    out.m_82.w = _897;
    bool _899 = !_817;
    if (!_899)
    {
        float _901 = in.m_76.x;
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _905 = _901 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _909 = _907 * _903;
        float _911 = floor(_909);
        float _913 = -_911;
        float _915 = _909 + _913;
        _181 = _915;
    }
    float _917 = _181;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _921 = int(_919);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _925 = int(_923);
    float _927 = float(_921);
    float _929 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _931 = int(_929);
    float _933 = float(uint(_925));
    float _935 = 1.0 / _927;
    int _937 = ~_925;
    int _939 = _937 + 1;
    float _941 = 1.0 / _933;
    float _943 = float(uint(_931));
    float _945 = _935 * _135;
    int _947 = ~_925;
    int _949 = _947 + 1;
    float _951 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _953 = int(_951);
    int _955 = as_type<int>(_941) + (-2);
    float _957 = trunc(_945);
    int _959 = int(_957);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _967 = int(_965);
    float _969 = float(uint(_959));
    if (_963)
    {
        _577 = 1.0;
    }
    float _971 = _577;
    int _973 = 0;
    int _975 = 0;
    float _977 = _971;
    if (_963)
    {
        _973 = 0;
        _975 = 0;
    }
    int _979 = _973;
    int _981 = _975;
    int _983 = _979;
    int _985 = _981;
    if (_963)
    {
        _579 = 1.0;
    }
    float _987 = _579;
    float _989 = as_type<float>(_955) * _969;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _993 = int(_991);
    float _995 = trunc(_989);
    float _997 = precise::max(_995, 0.0);
    uint _1000 = uint(_997);
    float _1002 = float(_993);
    float _1004 = 1.0 / _1002;
    int _1006 = _949 * int(_1000);
    int _1008 = _1006 + _959;
    float _1010 = float(uint(_1008));
    float _1012 = as_type<float>(_955) * _1010;
    float _1014 = _1010;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1018 = _1002;
    float _1020 = _987;
    if (_963)
    {
        float _1022 = in.m_76.x;
        float _1024 = in.m_76.y;
        _1014 = _1022;
        _1016 = _1024;
    }
    float _1026 = _1014;
    float _1028 = _1016;
    float _1030 = trunc(_1012);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = 1.0 / _943;
    int _1038 = int(_1000) + int(_1034);
    float _1040 = float(_925);
    float _1042 = float(_959);
    int _1044 = _939 * _1038;
    int _1046 = _1044 + _959;
    float _1048 = _1042;
    float _1050 = _1026;
    float _1052 = _1028;
    if (_963)
    {
        _581 = _1026;
    }
    float _1054 = _581;
    bool _1056 = _1042 >= _1040;
    bool _1058 = isnan(_1042);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(_1040);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    bool _1068 = uint(_1046) >= uint(_925);
    float _1070 = 0.0;
    float _1072 = _1054;
    if (_963)
    {
        _1070 = _1054;
    }
    float _1074 = _1070;
    float _1076 = trunc(_1066);
    int _1078 = int(_1076);
    float _1080 = _1074;
    if (_963)
    {
        _1048 = _1028;
    }
    float _1082 = _1048;
    float _1084 = _1082;
    if (_963)
    {
        _1018 = _1054;
    }
    float _1086 = _1018;
    float _1088 = _1086;
    if (!_963)
    {
        float _1090 = in.m_76.x;
        float _1092 = in.m_76.y;
        float _1094 = in.m_76.z;
        float _1096 = _1090 * 3.1415927410125732421875;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1092 * 3.1415927410125732421875;
        float _1102 = _1100 * 0.15915493667125701904296875;
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        _977 = 7.345489978790283203125;
        _1050 = _1090;
        _1052 = _1092;
        _1020 = 5.839270114898681640625;
        _1088 = _1094;
        _1072 = _1092;
        _983 = 1;
        _985 = 2;
        _1080 = _1106;
        _1084 = _1110;
    }
    float _1112 = _977;
    float _1114 = _1050;
    float _1116 = _1052;
    float _1118 = _1020;
    float _1120 = _1088;
    float _1122 = _1072;
    int _1124 = _983;
    int _1126 = _985;
    float _1128 = _1080;
    float _1130 = _1084;
    float _1132 = _1112 * _1114;
    float _1134 = in.m_76.z;
    float _1136 = in.m_76.w;
    bool _1138 = !_1068;
    int _1140 = _1138 ? 0 : (-1);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1144 = _917 + _1142;
    float _1146 = floor(_1132);
    float _1148 = float(_967);
    float _1150 = in.m_70.w;
    int _1152 = ~_1038;
    int _1154 = _1152 + _1140;
    int _1156 = _1154 + 1;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1160 = _917 + _1158;
    float _1162 = float(uint(_953));
    bool _1164 = _925 == 0;
    float _1166 = 1.0 / _1148;
    int _1168 = _925 * _1156;
    int _1170 = _1168 + _959;
    int _1172 = ~_1078;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1164;
    int _1180 = _1178 ? _1170 : (-1);
    float _1182 = -_1146;
    float _1184 = _1132 + _1182;
    float _1186 = 1.0 / _1162;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1190 = _1188 != 0;
    int _1192 = _1180 * _1176;
    float _1194 = _1184 * _1040;
    bool _1196 = _1134 > 0.5;
    float _1198 = _175 * _135;
    bool _1200 = !_1190;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _1166 * _135;
    bool _1206 = _1116 > 0.5;
    float _1208 = _1004 * _135;
    float _1210 = trunc(_1194);
    int _1212 = int(_1210);
    int _1214 = abs(_1202);
    float _1216 = _1040 * _1198;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1228 = _1226 != 0;
    float _1230 = -_225;
    int _1232 = _1196 ? as_type<int>(_1230) : as_type<int>(_225);
    float _1234 = -_241;
    int _1236 = _1206 ? as_type<int>(_1234) : as_type<int>(_241);
    float _1238 = trunc(_1208);
    int _1240 = int(_1238);
    bool _1242 = !_1228;
    float _1244 = _1242 ? _225 : as_type<float>(_1232);
    bool _1246 = !_1224;
    float _1248 = _1246 ? _241 : as_type<float>(_1236);
    float _1250 = trunc(_1204);
    int _1252 = int(_1250);
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1264 = _1262 != 0;
    int _1266 = _1212 * _1214;
    int _1268 = _1266 + _959;
    int _1270 = _925 + (-1);
    int _1272 = as_type<int>(_1036) + (-2);
    bool _1274 = !_1260;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = trunc(_1216);
    int _1280 = int(_1278);
    float _1282 = float(uint(_1240));
    int _1284 = _1078 * _1270;
    int _1286 = _1284 + _1192;
    bool _1288 = !_1256;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1294 = _1292 != 0;
    float _1296 = as_type<float>(_1272) * _1282;
    int _1298 = as_type<int>(_1186) + (-2);
    int _1300 = abs(_1276);
    bool _1302 = !_1264;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = trunc(_1296);
    float _1308 = precise::max(_1306, 0.0);
    uint _1310 = uint(_1308);
    int _1312 = abs(_1290);
    int _1314 = _1286 * _1300;
    bool _1316 = !_1294;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = float(uint(_1252));
    int _1322 = abs(_1304);
    int _1324 = abs(_1318);
    float _1326 = as_type<float>(_1298) * _1320;
    int _1328 = _1280 * _1312;
    int _1330 = _1328 + _1314;
    int _1332 = ~_931;
    int _1334 = _1332 + 1;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = _1268 * _1322;
    int _1344 = _1342 + _1330;
    int _1346 = ~_953;
    int _1348 = _1346 + 1;
    int _1350 = _1212 * _1324;
    int _1352 = _1350 + _1344;
    int _1354 = ~_931;
    int _1356 = _1354 + 1;
    int _1358 = _1334 * int(_1310);
    int _1360 = _1358 + _1240;
    int _1362 = ~_925;
    int _1364 = _1362 + 1;
    float _1366 = float(uint(_1352));
    float _1368 = float(uint(_1360));
    int _1370 = ~_953;
    int _1372 = _1370 + 1;
    int _1374 = _1348 * int(_1340);
    int _1376 = _1374 + _1252;
    float _1378 = as_type<float>(_955) * _1366;
    float _1380 = as_type<float>(_1272) * _1368;
    bool _1382 = _1136 > 0.5;
    float _1384 = float(uint(_1376));
    float _1386 = trunc(_1378);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    float _1392 = float(_931);
    float _1394 = as_type<float>(_1298) * _1384;
    float _1396 = trunc(_1380);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1406 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1408 = isnan(_917);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1422 = trunc(_1394);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    int _1428 = _1364 * int(_1390);
    int _1430 = _1428 + _1352;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1434 = float(uint(_1430));
    int _1436 = int(_1310) + int(_1400);
    float _1438 = _1118 * _1120;
    float _1440 = -_241;
    int _1442 = _1196 ? as_type<int>(_1440) : as_type<int>(_241);
    float _1444 = as_type<float>(_955) * _1434;
    float _1446 = 1.0 / _1404;
    int _1448 = _1356 * _1436;
    int _1450 = _1448 + _1240;
    int _1452 = int(_1340) + int(_1426);
    float _1454 = _1112 * _1122;
    bool _1456 = uint(_1450) >= uint(_931);
    float _1458 = trunc(_1444);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = -_225;
    int _1466 = _1382 ? as_type<int>(_1464) : as_type<int>(_225);
    int _1468 = _1372 * _1452;
    int _1470 = _1468 + _1252;
    bool _1472 = !_1456;
    int _1474 = _1472 ? 0 : (-1);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    bool _1480 = uint(_1470) >= uint(_953);
    float _1482 = floor(_1438);
    bool _1484 = !_1478;
    float _1486 = _1484 ? _241 : as_type<float>(_1442);
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1498 = _1496 != 0;
    int _1500 = ~_925;
    int _1502 = _1500 + 1;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1506 = _1504 != 0;
    float _1508 = floor(_1454);
    bool _1510 = !_1494;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1516 = _1514 != 0;
    int _1518 = int(_1390) + int(_1462);
    float _1520 = float(_1240);
    float _1522 = -_1482;
    float _1524 = _1438 + _1522;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1528 = _1526 != 0;
    int _1530 = _1502 * _1518;
    int _1532 = _1530 + _1352;
    bool _1534 = _1520 >= _1392;
    bool _1536 = isnan(_1520);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(_1392);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = 1.0 / _1420;
    bool _1548 = !_1506;
    int _1550 = _1548 ? 0 : 1;
    bool _1552 = !_1528;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = 0.0;
    float _1558 = _1150;
    if (_1516)
    {
        float _1560 = in.m_76.w;
        _1556 = _1560;
    }
    float _1562 = _1556;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1566 = _1564 != 0;
    float _1568 = -_1508;
    float _1570 = _1454 + _1568;
    bool _1572 = uint(_1532) >= uint(_925);
    float _1574 = trunc(_1544);
    int _1576 = int(_1574);
    int _1578 = ~_1436;
    int _1580 = _1578 + _1474;
    int _1582 = _1580 + 1;
    bool _1584 = !_1220;
    float _1586 = _1584 ? _225 : as_type<float>(_1466);
    bool _1588 = !_1566;
    int _1590 = _1588 ? 0 : 1;
    int _1592 = _931 * _1582;
    int _1594 = _1592 + _1240;
    bool _1596 = !_1480;
    int _1598 = _1596 ? 0 : (-1);
    bool _1600 = !_1572;
    int _1602 = _1600 ? 0 : (-1);
    float _1604 = _1392 * _1198;
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1608 = _1606 != 0;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1620 = _1618 != 0;
    float _1622 = _1524 * _1392;
    int _1624 = _931 + (-1);
    bool _1626 = !_1490;
    int _1628 = _1626 ? 0 : 1;
    float _1630 = trunc(_1604);
    int _1632 = int(_1630);
    bool _1634 = !_1612;
    int _1636 = _1634 ? 0 : 1;
    bool _1638 = _931 == 0;
    float _1640 = _1562;
    bool _1642 = _1616;
    if (_1516)
    {
        float _1644 = _1562 * 3.1415927410125732421875;
        _1640 = _1644;
    }
    float _1646 = _1640;
    int _1648 = ~_1576;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    bool _1654 = !_1638;
    int _1656 = _1654 ? _1594 : (-1);
    float _1658 = _1646;
    if (_1516)
    {
        float _1660 = _1646 * 0.15915493667125701904296875;
        _1658 = _1660;
    }
    float _1662 = _1658;
    bool _1664 = !_1498;
    int _1666 = _1664 ? 0 : 1;
    int _1668 = abs(_1512);
    int _1670 = _1656 * _1652;
    float _1672 = float(_953);
    float _1674 = trunc(_1622);
    int _1676 = int(_1674);
    float _1678 = float(_1252);
    int _1680 = _1576 * _1624;
    int _1682 = _1680 + _1670;
    int _1684 = abs(_1628);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1688 = _1686 != 0;
    int _1690 = _1682 * _1668;
    int _1692 = abs(_1666);
    float _1694 = _1662;
    if (_1516)
    {
        float _1696 = _1662 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        _1694 = _1698;
    }
    float _1700 = _1694;
    int _1702 = abs(_1550);
    bool _1704 = _1678 >= _1672;
    bool _1706 = isnan(_1678);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(_1672);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    int _1716 = _1676 * _1702;
    int _1718 = _1716 + _1240;
    float _1720 = trunc(_1714);
    int _1722 = int(_1720);
    int _1724 = _1632 * _1684;
    int _1726 = _1724 + _1690;
    float _1728 = _1672 * _1198;
    int _1730 = abs(_1554);
    float _1732 = _1570 * _1672;
    int _1734 = _1718 * _1692;
    int _1736 = _1734 + _1726;
    int _1738 = ~_1452;
    int _1740 = _1738 + _1598;
    int _1742 = _1740 + 1;
    float _1744 = _1570;
    if (_1688)
    {
        float _1746 = in.m_76.x;
        _1744 = _1746;
    }
    float _1748 = _1744;
    bool _1750 = !_1608;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1676 * _1730;
    int _1756 = _1754 + _1736;
    bool _1758 = !_1616;
    int _1760 = _1758 ? 0 : 1;
    int _1762 = _953 * _1742;
    int _1764 = _1762 + _1252;
    bool _1766 = _953 == 0;
    float _1768 = trunc(_1732);
    int _1770 = int(_1768);
    if (_1516)
    {
        bool _1772 = _1700 > 0.5;
        _1642 = _1772;
    }
    bool _1774 = _1642;
    float _1776 = float(uint(_1268));
    float _1778 = float(uint(_1756));
    int _1780 = ~_1722;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    float _1786 = as_type<float>(_955) * _1776;
    bool _1788 = !_1766;
    int _1790 = _1788 ? _1764 : (-1);
    float _1792 = trunc(_1728);
    int _1794 = int(_1792);
    int _1796 = abs(_1590);
    float _1798 = as_type<float>(_1272) * _1778;
    int _1800 = _953 + (-1);
    int _1802 = _1790 * _1784;
    int _1804 = abs(_1636);
    float _1806 = trunc(_1786);
    float _1808 = precise::max(_1806, 0.0);
    uint _1810 = uint(_1808);
    int _1812 = _1722 * _1800;
    int _1814 = _1812 + _1802;
    int _1816 = abs(_1752);
    float _1818 = _1748;
    float _1820 = _1786;
    float _1822 = as_type<float>(_1816);
    if (_1688)
    {
        float _1824 = _1748 * 3.1415927410125732421875;
        _1818 = _1824;
    }
    float _1826 = _1818;
    int _1828 = ~_925;
    int _1830 = _1828 + 1;
    int _1832 = _1770 * _1796;
    int _1834 = _1832 + _1252;
    int _1836 = ~_931;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1798);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1814 * _1804;
    float _1848 = as_type<float>(_1830);
    if (_1688)
    {
        float _1850 = _1826 * 0.15915493667125701904296875;
        _1848 = _1850;
    }
    float _1852 = _1848;
    int _1854 = _1794 * _1816;
    int _1856 = _1854 + _1846;
    float _1858 = float(uint(_1718));
    int _1860 = _1830 * int(_1810);
    int _1862 = _1860 + _1268;
    int _1864 = abs(_1760);
    float _1866 = _1852;
    if (_1688)
    {
        float _1868 = _1852 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    bool _1874 = !_1620;
    int _1876 = _1874 ? 0 : 1;
    float _1878 = as_type<float>(_1272) * _1858;
    int _1880 = ~_1518;
    int _1882 = _1880 + _1602;
    int _1884 = _1882 + 1;
    float _1886 = float(uint(_1862));
    int _1888 = _1838 * int(_1844);
    int _1890 = _1888 + _1756;
    int _1892 = _925 * _1884;
    int _1894 = _1892 + _1352;
    int _1896 = abs(_1876);
    float _1898 = trunc(_1878);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = float(uint(_1890));
    float _1906 = as_type<float>(_955) * _1886;
    bool _1908 = _925 == 0;
    int _1910 = _1834 * _1864;
    int _1912 = _1910 + _1856;
    float _1914 = as_type<float>(_1272) * _1904;
    int _1916 = ~_931;
    int _1918 = _1916 + 1;
    bool _1920 = !_1908;
    int _1922 = _1920 ? _1894 : (-1);
    int _1924 = _1770 * _1896;
    int _1926 = _1924 + _1912;
    if (!_1516)
    {
        _1820 = _241;
    }
    float _1928 = _1820;
    float _1930 = trunc(_1914);
    float _1932 = precise::max(_1930, 0.0);
    uint _1934 = uint(_1932);
    float _1936 = _1928;
    if (_1516)
    {
        float _1938 = -_241;
        float _1940 = _1774 ? _1938 : _241;
        _1936 = _1940;
    }
    float _1942 = _1936;
    int _1944 = _1922 & 3;
    bool _1946 = _1944 != 0;
    int _1948 = _1922 & 3;
    bool _1950 = _1948 != 0;
    int _1952 = _1918 * int(_1902);
    int _1954 = _1952 + _1718;
    int _1956 = _1946 ? 0 : 1;
    float _1958 = trunc(_1906);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    bool _1964 = uint(_1948) > 1u;
    bool _1966 = _1948 != 3;
    float _1968 = float(uint(_1926));
    int _1970 = int(_1844) + int(_1934);
    int _1972 = ~_931;
    int _1974 = _1972 + 1;
    float _1976 = as_type<float>(_1298) * _1968;
    float _1978 = float(uint(_1954));
    int _1980 = ~_1956;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    int _1986 = _1974 * _1970;
    int _1988 = _1986 + _1756;
    int _1990 = _1984;
    bool _1992 = _1966;
    if (!_1964)
    {
        int _1994 = ~_1956;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    float _2000 = as_type<float>(_1272) * _1978;
    bool _2002 = uint(_1948) >= 2u;
    float _2004 = trunc(_1976);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    bool _2010 = _1116 > 0.5;
    int _2012 = _2002 ? 0 : 1;
    bool _2014 = uint(_1988) >= uint(_931);
    int _2016 = ~_2012;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    float _2022 = trunc(_2000);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    bool _2028 = !_2014;
    int _2030 = _2028 ? 0 : (-1);
    int _2032 = _2020;
    if (_1966)
    {
        int _2034 = ~_2012;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    int _2040 = ~_1970;
    int _2042 = _2040 + _2030;
    int _2044 = _2042 + 1;
    if (_1688)
    {
        bool _2046 = _1872 > 0.5;
        _1992 = _2046;
    }
    bool _2048 = _1992;
    int _2050 = _931 * _2044;
    int _2052 = _2050 + _1756;
    if (!_1688)
    {
        _1822 = _225;
    }
    float _2054 = _1822;
    float _2056 = -_225;
    int _2058 = _2010 ? as_type<int>(_2056) : as_type<int>(_225);
    bool _2060 = !_1638;
    int _2062 = _2060 ? _2052 : (-1);
    int _2064 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2066 = _2064 != 0;
    float _2068 = _2054;
    if (_1688)
    {
        float _2070 = -_225;
        float _2072 = _2048 ? _2070 : _225;
        _2068 = _2072;
    }
    float _2074 = _2068;
    int _2076 = _2062 & 3;
    bool _2078 = _2076 != 0;
    int _2080 = ~_953;
    int _2082 = _2080 + 1;
    bool _2084 = !_2066;
    float _2086 = _2084 ? _225 : as_type<float>(_2058);
    bool _2088 = uint(_2076) > 1u;
    int _2090 = _2082 * int(_2008);
    int _2092 = _2090 + _1926;
    int _2094 = _2062 & 3;
    bool _2096 = _2094 != 0;
    int _2098 = int(_1810) + int(_1962);
    float _2100 = float(uint(_2092));
    int _2102 = _2096 ? 0 : 1;
    int _2104 = ~_925;
    int _2106 = _2104 + 1;
    float _2108 = as_type<float>(_1298) * _2100;
    int _2110 = ~_2102;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    int _2116 = _2114;
    if (!_2088)
    {
        int _2118 = ~_2102;
        int _2120 = _2118 + 1;
        _2116 = _2120;
    }
    int _2122 = _2116;
    int _2124 = _2106 * _2098;
    int _2126 = _2124 + _1268;
    bool _2128 = uint(_2076) >= 2u;
    float _2130 = trunc(_2108);
    float _2132 = precise::max(_2130, 0.0);
    uint _2134 = uint(_2132);
    bool _2136 = !_2078;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2128 ? 0 : 1;
    bool _2142 = uint(_2126) >= uint(_925);
    bool _2144 = _2076 != 3;
    bool _2146 = _2076 != 3;
    int _2148 = int(_1902) + int(_2026);
    float _2150 = in.m_56.x;
    float _2152 = in.m_56.y;
    float _2154 = in.m_56.z;
    int _2156 = ~_931;
    int _2158 = _2156 + 1;
    bool _2160 = !_2142;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = int(_2008) + int(_2134);
    int _2166 = _2158 * _2148;
    int _2168 = _2166 + _1718;
    int _2170 = ~_2140;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    int _2176 = _2174;
    if (_2144)
    {
        int _2178 = ~_2140;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    bool _2184 = uint(_2168) >= uint(_931);
    int _2186 = ~_953;
    int _2188 = _2186 + 1;
    int _2190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2192 = _2190 != 0;
    bool _2194 = !_2146;
    int _2196 = _2194 ? 0 : (-1);
    int _2198 = _2188 * _2164;
    int _2200 = _2198 + _1926;
    bool _2202 = !_2192;
    int _2204 = _2202 ? 0 : 1;
    bool _2206 = uint(_2200) >= uint(_953);
    float _2208 = _197 * _2152;
    bool _2210 = !_2184;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2220 = _2218 != 0;
    float _2222 = fma(_195, _2150, _2208);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2226 = _2224 != 0;
    float _2228 = _209 * _2152;
    bool _2230 = !_2206;
    int _2232 = _2230 ? 0 : (-1);
    float _2234 = _203 * _2152;
    float _2236 = 1.0 / _2216;
    bool _2238 = _1114 > 0.5;
    float _2240 = fma(_201, _2150, _2234);
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2246 = -_241;
    int _2248 = _2238 ? as_type<int>(_2246) : as_type<int>(_241);
    int _2250 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2252 = _2250 != 0;
    float _2254 = fma(_207, _2150, _2228);
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2260 = 1.0 / _2244;
    float _2262 = fma(_199, _2154, _2222);
    float _2264 = fma(_205, _2154, _2240);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2274 = 1.0 / _2258;
    float _2276 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2278 = _2276 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2280 = _2268 * _1446;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2286 = _2272 * _2236;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2296 = 1.0 / _2278;
    bool _2298 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2300 = isnan(_917);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = fma(_211, _2154, _2254);
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2312;
    float _2316 = _2294 * _2260;
    bool _2318 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2320 = isnan(_917);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = -_2308;
    float _2332 = _2330 + 1.0;
    float _2334 = 1.0 / _2284;
    float _2336 = _2314 * _2274;
    bool _2338 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2340 = isnan(_917);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2346 = _2342 || _2344;
    float _2348 = float(_2346);
    float _2350 = _2328 * _2332;
    float _2352 = -_2328;
    float _2354 = _2352 + 1.0;
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2356;
    bool _2360 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2362 = isnan(_917);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2368 = _2364 || _2366;
    float _2370 = float(_2368);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2376 = -_2348;
    float _2378 = _2376 + 1.0;
    float _2380 = _2348 * _2354;
    float _2382 = _2358 * _1546;
    float _2384 = _2374 * _2296;
    bool _2386 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2388 = isnan(_917);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = _2370 * _2378;
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2402 = _917 + _2400;
    float _2404 = -_2370;
    float _2406 = _2404 + 1.0;
    bool _2408 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2410 = isnan(_917);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2416 = _2412 || _2414;
    float _2418 = float(_2416);
    float _2420 = in.m_72.w;
    float _2422 = _2290 * _2334;
    float _2424 = fma(_2280, _2402, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2426 = _2396 * _2406;
    float _2428 = -_2396;
    float _2430 = _2428 + 1.0;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2434 = _917 + _2432;
    float _2436 = -_2418;
    float _2438 = _2436 + 1.0;
    bool _2440 = !_2252;
    float _2442 = _2440 ? _241 : as_type<float>(_2248);
    float _2444 = _2418 * _2430;
    float _2446 = fma(_2286, _2434, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2448 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2450 = isnan(_917);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2456 = _2452 || _2454;
    float _2458 = float(_2456);
    float _2460 = _1416 * _2438;
    float _2462 = in.m_74.w;
    float _2464 = -_1416;
    float _2466 = _2464 + 1.0;
    bool _2468 = _1124 != 1;
    float _2470 = -_2458;
    float _2472 = _2470 + 1.0;
    float _2474 = fma(_2422, _1144, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2476 = _2458 * _2466;
    float _2478 = _2262 + _1150;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2482 = _917 + _2480;
    float _2484 = _2424 * _2476;
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2488 = _917 + _2486;
    float _2490 = fma(_2336, _2482, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2492 = _2264 + _2420;
    float _2494 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2484);
    float _2496 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2498 = _917 + _2496;
    float _2500 = _2460;
    float _2502 = _2446;
    float _2504 = _2494;
    if (!_2468)
    {
        _1558 = _1116;
    }
    float _2506 = _1558;
    float _2508 = fma(_2446, _2460, _2494);
    float _2510 = _2506;
    if (!_2468)
    {
        _2500 = _1116;
    }
    float _2512 = _2500;
    float _2514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2516 = _2512;
    if (!_2468)
    {
        _2502 = _1134;
    }
    float _2518 = _2502;
    float _2520 = fma(_2382, _2498, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2522 = _2518;
    if (!_2468)
    {
        _2504 = _1134;
    }
    float _2524 = _2504;
    float _2526 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2528 = _2524;
    if (_2468)
    {
        _2516 = _1114;
    }
    float _2530 = _2516;
    float _2532 = _2310 + _2462;
    if (_2468)
    {
        _2510 = _1114;
    }
    float _2534 = _2510;
    float _2536 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_2468)
    {
        _2522 = _1116;
    }
    float _2538 = _2522;
    float _2540 = fma(_2316, _1160, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2542 = _2540;
    if (_2468)
    {
        _2528 = _1116;
    }
    float _2544 = _2528;
    float _2546 = -_2514;
    float _2548 = fma(_2536, 2.0, _2546);
    bool _2550 = _1126 != 2;
    float _2552 = fma(_2474, _2444, _2508);
    float _2554 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2556 = fma(_2540, _2426, _2552);
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2560 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2564 = _2492 + _2562;
    float _2566 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2558);
    float _2568 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2570 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2526);
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2576 = -_2560;
    float _2578 = fma(_2568, 2.0, _2576);
    float _2580 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2582 = fma(_2554, -2.0, _2572);
    float _2584 = fma(_2490, _2398, _2556);
    float _2586 = fma(_2580, -2.0, _2574);
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2590 = _2478 + _2588;
    float _2592 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2596 = _2074 + (-0.5);
    float _2598 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2586);
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2532 + _2600;
    float _2604 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2592);
    float _2606 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2594);
    int _2608 = _2062 >> 31;
    float _2610 = -_2596;
    float _2612 = -_2598;
    float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2612);
    float _2616 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2604);
    float _2618 = -_135;
    float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2548);
    float _2622 = _2442 + 0.5;
    int _2624 = _2608 & 3;
    float _2626 = fma(_2384, _2488, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2628 = 0.0;
    if (_2550)
    {
        _2628 = _1116;
    }
    float _2630 = _2628;
    float _2632 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2620);
    float _2634 = _2630;
    if (_2550)
    {
        _2542 = _1114;
    }
    float _2636 = _2542;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2640 = _2636;
    if (!_2550)
    {
        _2640 = _1134;
    }
    float _2642 = _2640;
    float _2644 = -_135;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2578);
    if (!_2550)
    {
        _2634 = _1114;
    }
    float _2648 = _2634;
    float _2650 = fma(_2534, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2638);
    bool _2652 = _2616 >= 0.0;
    float _2654 = _1942 + 0.5;
    int _2656 = _2062 + _2624;
    float _2658 = fma(_2626, _2380, _2584);
    float _2660 = float(uint(_1834));
    float _2662 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2646);
    int _2664 = _2656 >> 2;
    float _2666 = _2086 + (-0.5);
    float _2668 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2582);
    int _2670 = _2664 << 4;
    int _2672 = _2670 + 656;
    float _2674 = as_type<float>(_1298) * _2660;
    float _2676 = -_2666;
    float _2678 = -_2668;
    float _2680 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2678);
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2684 = trunc(_2674);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    uint _2690 = uint(int(uint(_2672) >> uint(2)));
    uint _2692 = uint(int(uint(int(_2690)) >> uint(2)));
    int _2694 = int(_2690) & 3;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[int(_2692)][_2694];
    int _2698 = int(_2690) + 1;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    int _2702 = _2698 & 3;
    float _2704 = (*spvDescriptorSet0.vp_c9)._m0[int(_2700)][_2702];
    float _2706 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2710 = ~_953;
    int _2712 = _2710 + 1;
    float _2714 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2716 = -_2708;
    float _2718 = fma(_2706, 2.0, _2716);
    float _2720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2722 = _2672 + 8;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    uint _2726 = uint(int(uint(int(_2724)) >> uint(2)));
    int _2728 = int(_2724) & 3;
    float _2730 = (*spvDescriptorSet0.vp_c9)._m0[int(_2726)][_2728];
    int _2732 = int(_2724) + 1;
    uint _2734 = uint(int(uint(_2732) >> uint(2)));
    int _2736 = _2732 & 3;
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[int(_2734)][_2736];
    float _2740 = -_1432;
    float _2742 = fma(_2714, 2.0, _2740);
    float _2744 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2748 = _2674;
    if (_2652)
    {
        _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2750 = _2748;
    float _2752 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2754 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2566);
    int _2756 = _2712 * int(_2688);
    int _2758 = _2756 + _1834;
    float _2760 = fma(_2744, -2.0, _2682);
    float _2762 = fma(_2752, -2.0, _2746);
    int _2764 = as_type<int>(_2750);
    if (_2652)
    {
        float _2766 = _2750 * 5.0;
        _2764 = as_type<int>(_2766);
    }
    int _2768 = _2764;
    float _2770 = float(uint(_2758));
    float _2772 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2570);
    int _2774 = abs(_2122);
    float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9671 = as_type<float>(_2768);
        out.gl_Position.z = _9671;
    }
    float _2778 = as_type<float>(_1298) * _2770;
    float _2780 = -_2754;
    float _2782 = _2780 + 1.0;
    float _2784 = -_2772;
    float _2786 = _2784 + 1.0;
    int _2788 = abs(_2182);
    float _2790 = fma(_2520, _2350, _2658);
    float _2792 = -_2782;
    float _2794 = fma(_2792, _1942, _2662);
    float _2796 = _2720 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2798 = fma(_2786, _2074, _2614);
    int _2800 = ~_2164;
    int _2802 = _2800 + _2232;
    int _2804 = _2802 + 1;
    float _2806 = trunc(_2778);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    int _2812 = ~_2148;
    int _2814 = _2812 + _2212;
    int _2816 = _2814 + 1;
    float _2818 = _1586 + (-0.5);
    float _2820 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2760);
    out.m_84.x = _2794;
    out.m_84.y = _2798;
    int _2822 = abs(_2204);
    float _2824 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2826 = -_2796;
    float _2828 = -_2820;
    float _2830 = fma(_2826, _2818, _2828);
    float _2832 = _1486 + 0.5;
    int _2834 = abs(_2138);
    float _2836 = -_135;
    float _2838 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2742);
    int _2840 = ~_2774;
    int _2842 = _2840 + 1;
    int _2844 = _2842 + 1;
    float _2846 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2790);
    int _2848 = abs(_2196);
    int _2850 = _953 * _2804;
    int _2852 = _2850 + _1926;
    int _2854 = int(_2688) + int(_2810);
    int _2856 = _2844 * as_type<int>(_2704);
    int _2858 = ~_2834;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2866 = int(_2864);
    float _2868 = fma(_2824, _2832, _2838);
    bool _2870 = !_1766;
    int _2872 = _2870 ? _2852 : (-1);
    int _2874 = _2862 * as_type<int>(_2696);
    int _2876 = _2874 + _2856;
    int _2878 = ~_2788;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    out.m_86.x = _2846;
    int _2884 = ~_2848;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    float _2890 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2762);
    int _2892 = _1922 >> 31;
    int _2894 = _2882 * as_type<int>(_2730);
    int _2896 = _2894 + _2876;
    int _2898 = ~_2822;
    int _2900 = _2898 + 1;
    int _2902 = _2900 + 1;
    float _2904 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2606);
    int _2906 = _2892 & 3;
    int _2908 = _2888 * as_type<int>(_2738);
    int _2910 = _2908 + _2896;
    int _2912 = _2872 >> 31;
    int _2914 = _931 * _2816;
    int _2916 = _2914 + _1718;
    int _2918 = _1922 + _2906;
    int _2920 = _2910 * _2902;
    int _2922 = _2912 & 3;
    float _2924 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2650);
    bool _2926 = !_1638;
    int _2928 = _2926 ? _2916 : (-1);
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = float(uint(_2866));
    float _2936 = -_2924;
    float _2938 = _2936 + 1.0;
    bool _2940 = !_2220;
    int _2942 = _2940 ? 0 : 1;
    int _2944 = _2928 * _2822;
    int _2946 = _2944 + _2920;
    int _2948 = _2872 & 3;
    bool _2950 = _2948 != 0;
    float _2952 = 1.0 / _2934;
    int _2954 = _2872 + _2922;
    float _2956 = -_2938;
    float _2958 = fma(_1486, _2956, _2868);
    int _2960 = _2918 >> 2;
    float _2962 = _2958;
    if (_2652)
    {
        out.m_63.x = 0.0;
    }
    int _2964 = _2872 & 3;
    bool _2966 = _2964 != 0;
    int _2968 = abs(_2866);
    int _2970 = _2950 ? 0 : 1;
    int _2972 = _2960 << 4;
    int _2974 = _2972 + 368;
    bool _2976 = uint(_2964) > 1u;
    int _2978 = _2954 >> 2;
    float _2980 = float(uint(_2968));
    uint _2982 = uint(int(uint(_2974) >> uint(2)));
    uint _2984 = uint(int(uint(int(_2982)) >> uint(2)));
    int _2986 = int(_2982) & 3;
    float _2988 = (*spvDescriptorSet0.vp_c9)._m0[int(_2984)][_2986];
    int _2990 = int(_2982) + 1;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    int _2994 = _2990 & 3;
    float _2996 = (*spvDescriptorSet0.vp_c9)._m0[int(_2992)][_2994];
    int _2998 = _2978 << 4;
    int _3000 = _2998 + 800;
    int _3002 = ~_2970;
    int _3004 = _3002 + 1;
    int _3006 = _3004 + 1;
    float _3008 = 1.0 / _2980;
    int _3010 = ~_953;
    int _3012 = _3010 + 1;
    uint _3014 = uint(int(uint(_3000) >> uint(2)));
    uint _3016 = uint(int(uint(int(_3014)) >> uint(2)));
    int _3018 = int(_3014) & 3;
    float _3020 = (*spvDescriptorSet0.vp_c9)._m0[int(_3016)][_3018];
    int _3022 = int(_3014) + 1;
    uint _3024 = uint(int(uint(_3022) >> uint(2)));
    int _3026 = _3022 & 3;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[int(_3024)][_3026];
    int _3030 = _3006;
    if (!_2976)
    {
        int _3032 = ~_2970;
        int _3034 = _3032 + 1;
        _3030 = _3034;
    }
    int _3036 = _3030;
    bool _3038 = _2964 != 3;
    int _3040 = _3012 * _2854;
    int _3042 = _3040 + _1834;
    int _3044 = as_type<int>(_2952) + (-2);
    float _3046 = float(uint(_2946));
    bool _3048 = !_2966;
    int _3050 = _3048 ? 0 : 1;
    bool _3052 = uint(_2964) >= 2u;
    float _3054 = as_type<float>(_3044) * _3046;
    bool _3056 = !_1950;
    int _3058 = _3056 ? 0 : 1;
    int _3060 = _3052 ? 0 : 1;
    int _3062 = abs(_2946);
    float _3064 = trunc(_3054);
    float _3066 = precise::max(_3064, 0.0);
    uint _3068 = uint(_3066);
    bool _3070 = uint(_3042) >= uint(_953);
    int _3072 = as_type<int>(_3008) + (-2);
    int _3074 = _2974 + 8;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    uint _3078 = uint(int(uint(int(_3076)) >> uint(2)));
    int _3080 = int(_3076) & 3;
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[int(_3078)][_3080];
    int _3084 = int(_3076) + 1;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    int _3088 = _3084 & 3;
    float _3090 = (*spvDescriptorSet0.vp_c9)._m0[int(_3086)][_3088];
    int _3092 = ~_3060;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    int _3098 = _3096;
    if (_3038)
    {
        int _3100 = ~_3060;
        int _3102 = _3100 + 1;
        _3098 = _3102;
    }
    int _3104 = _3098;
    float _3106 = float(uint(_3062));
    bool _3108 = _2964 != 3;
    int _3110 = _3000 + 8;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    uint _3114 = uint(int(uint(int(_3112)) >> uint(2)));
    int _3116 = int(_3112) & 3;
    float _3118 = (*spvDescriptorSet0.vp_c9)._m0[int(_3114)][_3116];
    int _3120 = int(_3112) + 1;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    int _3124 = _3120 & 3;
    float _3126 = (*spvDescriptorSet0.vp_c9)._m0[int(_3122)][_3124];
    float _3128 = as_type<float>(_3072) * _3106;
    bool _3130 = _1948 != 3;
    int _3132 = ~_2866;
    int _3134 = _3132 + 1;
    float _3136 = trunc(_3128);
    float _3138 = precise::max(_3136, 0.0);
    uint _3140 = uint(_3138);
    bool _3142 = !_3070;
    int _3144 = _3142 ? 0 : (-1);
    bool _3146 = !_3130;
    int _3148 = _3146 ? 0 : (-1);
    int _3150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3152 = _3150 != 0;
    int _3154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3156 = _3154 != 0;
    int _3158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3160 = _3158 != 0;
    int _3162 = ~_2098;
    int _3164 = _3162 + _2162;
    int _3166 = _3164 + 1;
    int _3168 = _3134 * int(_3068);
    int _3170 = _3168 + _2946;
    int _3172 = abs(_1998);
    int _3174 = ~_2968;
    int _3176 = _3174 + 1;
    int _3178 = _925 * _3166;
    int _3180 = _3178 + _1268;
    int _3182 = ~_3172;
    int _3184 = _3182 + 1;
    int _3186 = _3184 + 1;
    float _3188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3190 = abs(_3036);
    float _3192 = float(uint(_3170));
    int _3194 = _3186 * as_type<int>(_2996);
    int _3196 = ~_3190;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    float _3202 = as_type<float>(_3044) * _3192;
    int _3204 = ~_2854;
    int _3206 = _3204 + _3144;
    int _3208 = _3206 + 1;
    int _3210 = _3176 * int(_3140);
    int _3212 = _3210 + _3062;
    int _3214 = abs(_3050);
    int _3216 = _3200 * as_type<int>(_3028);
    int _3218 = abs(_3058);
    float _3220 = trunc(_3202);
    float _3222 = precise::max(_3220, 0.0);
    uint _3224 = uint(_3222);
    float _3226 = float(uint(_3212));
    int _3228 = _953 * _3208;
    int _3230 = _3228 + _1834;
    int _3232 = abs(_2038);
    int _3234 = ~_3218;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    float _3240 = as_type<float>(_3072) * _3226;
    int _3242 = ~_3214;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    int _3248 = abs(_3104);
    int _3250 = _3238 * as_type<int>(_2988);
    int _3252 = _3250 + _3194;
    float _3254 = trunc(_3240);
    float _3256 = precise::max(_3254, 0.0);
    uint _3258 = uint(_3256);
    int _3260 = ~_3232;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    int _3266 = _3246 * as_type<int>(_3020);
    int _3268 = _3266 + _3216;
    int _3270 = ~_3248;
    int _3272 = _3270 + 1;
    int _3274 = _3272 + 1;
    int _3276 = abs(_3148);
    int _3278 = _3264 * as_type<int>(_3082);
    int _3280 = _3278 + _3252;
    bool _3282 = !_3108;
    int _3284 = _3282 ? 0 : (-1);
    int _3286 = _3274 * as_type<int>(_3118);
    int _3288 = _3286 + _3268;
    int _3290 = ~_2866;
    int _3292 = _3290 + 1;
    int _3294 = int(_3068) + int(_3224);
    int _3296 = ~_3276;
    int _3298 = _3296 + 1;
    int _3300 = _3298 + 1;
    int _3302 = abs(_3284);
    int _3304 = _3292 * _3294;
    int _3306 = _3304 + _2946;
    int _3308 = abs(_2942);
    int _3310 = _3300 * as_type<int>(_3090);
    int _3312 = _3310 + _3280;
    bool _3314 = _925 == 0;
    int _3316 = ~_3302;
    int _3318 = _3316 + 1;
    int _3320 = _3318 + 1;
    int _3322 = int(_3140) + int(_3258);
    int _3324 = ~_2968;
    int _3326 = _3324 + 1;
    int _3328 = _3320 * as_type<int>(_3126);
    int _3330 = _3328 + _3288;
    bool _3332 = !_3314;
    int _3334 = _3332 ? _3180 : (-1);
    int _3336 = _3326 * _3322;
    int _3338 = _3336 + _3062;
    bool _3340 = uint(_3306) >= uint(_2866);
    int _3342 = ~_3308;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3350 = !_3340;
    int _3352 = _3350 ? 0 : (-1);
    bool _3354 = uint(_3338) >= uint(_2968);
    int _3356 = _3312 * _3346;
    int _3358 = ~_3294;
    int _3360 = _3358 + _3352;
    int _3362 = _3360 + 1;
    float _3364 = -_135;
    float _3366 = fma(_3364, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2718);
    bool _3368 = !_2226;
    int _3370 = _3368 ? 0 : 1;
    int _3372 = _3334 * _3308;
    int _3374 = _3372 + _3356;
    int _3376 = _2946 ^ _2866;
    bool _3378 = !_3354;
    int _3380 = _3378 ? 0 : (-1);
    int _3382 = abs(_3370);
    int _3384 = _2866 * _3362;
    int _3386 = _3384 + _2946;
    uint _3388 = uint(int(uint(_3376) >> uint(31)));
    float _3390 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3392 = _2866 == 0;
    int _3394 = ~_3380;
    int _3396 = _3322 + _3394;
    int _3398 = _3396 + 1;
    int _3400 = ~int(_3388);
    int _3402 = _3400 + 1;
    bool _3404 = !_3392;
    int _3406 = _3404 ? _3386 : (-1);
    int _3408 = _3398 ^ _3402;
    float _3410 = float(_3406);
    int _3412 = ~_3382;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    bool _3418 = _2866 == 0;
    int _3420 = ~_3402;
    int _3422 = _3420 + _3408;
    int _3424 = _3422 + 1;
    float _3426 = fma(_3390, _3410, _3366);
    bool _3428 = !_1766;
    int _3430 = _3428 ? _3230 : (-1);
    int _3432 = _3330 * _3416;
    bool _3434 = !_3418;
    int _3436 = _3434 ? _3424 : (-1);
    float _3438 = _1248 + 0.5;
    int _3440 = _3430 * _3382;
    int _3442 = _3440 + _3432;
    float _3444 = float(_3436);
    float _3446 = _3188 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3448 = fma(_3390, _3438, _3426);
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3452 = -_2890;
    float _3454 = fma(_3446, _3444, _3452);
    float _3456 = _1244 + (-0.5);
    float _3458 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3460 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3450);
    float _3462 = -_3446;
    float _3464 = fma(_3462, _3456, _3454);
    float _3466 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3458);
    float _3468 = _2564 * _2564;
    float _3470 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3460);
    float _3472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3474 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3466);
    float _3476 = -_3470;
    float _3478 = _3476 + 1.0;
    float _3480 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3472);
    float _3482 = -_3474;
    float _3484 = _3482 + 1.0;
    float _3486 = fma(_2590, _2590, _3468);
    float _3488 = -_3478;
    float _3490 = fma(_1248, _3488, _3448);
    float _3492 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3480);
    float _3494 = -_3484;
    float _3496 = fma(_2442, _3494, _2632);
    float _3498 = fma(_2602, _2602, _3486);
    float _3500 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3502 = -_3492;
    float _3504 = _3502 + 1.0;
    float _3506 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3508 = rsqrt(_3498);
    float _3510 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3500);
    float _3512 = fma(_1586, _2932, _2830);
    float _3514 = float(_3374);
    float _3516 = fma(_2086, _3504, _2680);
    float _3518 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3510);
    float _3520 = _3506 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3522 = float(_3442);
    out.m_88.x = _3514;
    float _3524 = -_3518;
    float _3526 = _3524 + 1.0;
    bool _3528 = !_3156;
    int _3530 = _3528 ? 0 : 1;
    out.m_90.x = _3496;
    out.m_90.y = _3516;
    out.m_90.z = _2958;
    out.m_90.w = _3512;
    float _3532 = fma(_1244, _3526, _3464);
    bool _3534 = !_3160;
    int _3536 = _3534 ? 0 : 1;
    float _3538 = _3520 * _3508;
    out.m_88.w = _3522;
    bool _3540 = !_3152;
    int _3542 = _3540 ? 0 : 1;
    float _3544 = _2590 * _3538;
    out.m_92.x = _3490;
    out.m_92.y = _3532;
    float _3546 = _2564 * _3538;
    if (_2652)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3548 = -_3546;
    float _3550 = _2492 + _3548;
    float _3552 = _2602 * _3538;
    float _3554 = -_3544;
    float _3556 = _2478 + _3554;
    float _3558 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3560 = _3550 + _3558;
    float _3562 = -_3552;
    float _3564 = _2532 + _3562;
    float _3566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3568 = _3556 + _3566;
    float _3570 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3574 = _3564 + _3572;
    float _3576 = fma(_3568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3570);
    float _3578 = fma(_3574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3576);
    bool _3580 = _3578 >= 0.0;
    float _3582 = _3568;
    float _3584 = _3564;
    if (_3580)
    {
        _2962 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3586 = _2962;
    int _3588 = as_type<int>(_3586);
    if (_3580)
    {
        out.m_63.x = 0.0;
    }
    if (_3580)
    {
        float _3590 = _3586 * 5.0;
        _3588 = as_type<int>(_3590);
    }
    int _3592 = _3588;
    if (_3580)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10850 = as_type<float>(_3592);
        out.gl_Position.z = _10850;
    }
    if (_3580)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3594 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3596 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3598 = floor(_3594);
    float _3600 = floor(_3596);
    float _3602 = -_3598;
    float _3604 = _3594 + _3602;
    float _3606 = -_3600;
    float _3608 = _3596 + _3606;
    float2 _10886 = float2(_3604, _3608);
    float _3610 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10886, float2(0.0), isnan(_10886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10886, float2(0.0), isnan(_10886)), level(0.0)).x;
    float _3612 = _1134 * 2.0;
    float _3614 = _1114 * 2.0;
    float _3616 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3618 = log2(_3616);
    float _3620 = _1116 + _1114;
    float _3622 = _1116 * 2.0;
    int _3624 = abs(_3542);
    float _3626 = -_3546;
    float _3628 = _2564 + _3626;
    float _3630 = _3620 + (-1.0);
    float _3632 = -_3544;
    float _3634 = _2590 + _3632;
    float _3636 = -_3552;
    float _3638 = _2602 + _3636;
    float _3640 = floor(_3612);
    float _3642 = _3628 * _3628;
    int _3644 = abs(_3536);
    float _3646 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3648 = floor(_3614);
    float _3650 = _3618 * _135;
    bool _3652 = _3640 > 0.0;
    float _3654 = floor(_3622);
    bool _3656 = _3640 >= 0.0;
    bool _3658 = isnan(_3640);
    bool _3660 = _3656 || _3658;
    bool _3662 = isnan(0.0);
    bool _3664 = _3660 || _3662;
    float _3666 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3668 = _1116 + _1134;
    float _3670 = _1116 + (-0.5);
    int _3672 = _3664 ? 0 : 1;
    float _3674 = _3668 + (-1.0);
    bool _3676 = _3648 >= 0.0;
    bool _3678 = isnan(_3648);
    bool _3680 = _3676 || _3678;
    bool _3682 = isnan(0.0);
    bool _3684 = _3680 || _3682;
    float _3686 = exp2(_3650);
    int _3688 = ~_3672;
    int _3690 = _3688 + 1;
    int _3692 = _3690 + 1;
    float _3694 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3696 = _3692;
    int _3698 = 2;
    if (!_3652)
    {
        int _3700 = ~_3672;
        int _3702 = _3700 + 1;
        _3696 = _3702;
    }
    int _3704 = _3696;
    float _3706 = _3550 + _3694;
    bool _3708 = _3648 > 0.0;
    bool _3710 = _3654 > 0.0;
    float _3712 = fma(_3674, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _3714 = _3654 >= 0.0;
    bool _3716 = isnan(_3654);
    bool _3718 = _3714 || _3716;
    bool _3720 = isnan(0.0);
    bool _3722 = _3718 || _3720;
    float _3724 = in.m_94.x;
    float _3726 = in.m_94.y;
    float _3728 = in.m_94.z;
    float _3730 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3732 = 1.0 + _3730;
    int _3734 = _3684 ? 0 : 1;
    float _3736 = float(_3704);
    float _3738 = 1.0 / _3732;
    float _3740 = float(_3624);
    float _3742 = -_3686;
    float _3744 = _3742 + 1.0;
    int _3746 = ~_3734;
    int _3748 = _3746 + 1;
    int _3750 = _3748 + 1;
    int _3752 = _3750;
    if (!_3708)
    {
        int _3754 = ~_3734;
        int _3756 = _3754 + 1;
        _3752 = _3756;
    }
    int _3758 = _3752;
    float _3760 = _3740 * _3736;
    bool _3762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3764 = isnan(1.0);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3770 = _3766 || _3768;
    float _3772 = fma(_3634, _3634, _3642);
    int _3774 = abs(_3530);
    float _3776 = _3760 * (-2.0);
    float _3778 = float(_3758);
    float _3780 = fma(_3638, _3638, _3772);
    float _3782 = float(_3774);
    float _3784 = fma(_3666, _3776, _3666);
    bool _3786 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3788 = isnan(0.0);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3794 = _3790 || _3792;
    float _3796 = _3782 * _3778;
    float _3798 = _3794 ? _3744 : 0.0;
    float _3800 = _1114 + (-0.5);
    float _3802 = fma(_3776, _3724, _3724);
    float _3804 = _1114 + _1134;
    float _3806 = _1134 + (-0.5);
    if (_3770)
    {
        float _3808 = _3798 * _3738;
        _145 = _3808;
    }
    float _3810 = _145;
    float _3812 = fma(_3800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3802);
    int _3814 = _3722 ? 0 : 1;
    float _3816 = _3796 * (-2.0);
    float _3818 = _3804 + (-1.0);
    float _3820 = fma(_3784, _3810, _3812);
    int _3822 = ~_3814;
    int _3824 = _3822 + 1;
    int _3826 = _3824 + 1;
    float _3828 = fma(_3712, _3816, _3712);
    float _3830 = fma(_3816, _3726, _3726);
    int _3832 = _3826;
    if (!_3710)
    {
        int _3834 = ~_3814;
        int _3836 = _3834 + 1;
        _3832 = _3836;
    }
    int _3838 = _3832;
    float _3840 = _3820 * 0.15915493667125701904296875;
    float _3842 = fma(_3670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3830);
    float _3844 = float(_3838);
    float _3846 = _3840 * 6.283185482025146484375;
    float _3848 = sin(_3846);
    float _3850 = float(_3644);
    float _3852 = fma(_3828, _3810, _3842);
    float _3854 = _3850 * _3844;
    float _3856 = _3852 * 0.15915493667125701904296875;
    float _3858 = _3840 * 6.283185482025146484375;
    float _3860 = cos(_3858);
    float _3862 = _3854 * (-2.0);
    float _3864 = fma(_3818, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3866 = fma(_3862, _3728, _3728);
    float _3868 = fma(_3864, _3862, _3864);
    float _3870 = _3856 * 6.283185482025146484375;
    float _3872 = sin(_3870);
    float _3874 = fma(_3806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3866);
    float _3876 = fma(_3868, _3810, _3874);
    float _3878 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3880 = _3856 * 6.283185482025146484375;
    float _3882 = cos(_3880);
    float _3884 = _3876 * 0.15915493667125701904296875;
    float _3886 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3878);
    float _3888 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3886);
    float _3890 = sqrt(_3780);
    float _3892 = _3848 * _3872;
    float _3894 = _3888 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3896 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3898 = _3860 * _3872;
    float _3900 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3896);
    float _3902 = 1.0 / _3894;
    float _3904 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3900);
    float _3906 = _3904 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3908 = _3884 * 6.283185482025146484375;
    float _3910 = sin(_3908);
    float _3912 = _3860 * _3882;
    float _3914 = _3508 * _3890;
    float _3916 = _3906 + _3894;
    float _3918 = _3914 * _3646;
    float _3920 = _3506 * _3914;
    float _3922 = _3884 * 6.283185482025146484375;
    float _3924 = cos(_3922);
    float _3926 = _3916 * _3902;
    float _3928 = _3926 * 0.5;
    float _3930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3932 = _3914 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3934 = _3932 * 0.5;
    float _3936 = _3930 * _3918;
    float _3938 = fma(_3910, _3912, _3892);
    float _3940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3942 = fma(_3928, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3940);
    float _3944 = fma(_3910, _3892, _3912);
    float _3946 = _3848 * _3882;
    float _3948 = 1.0 / _3942;
    float _3950 = -_3898;
    float _3952 = fma(_3910, _3946, _3950);
    float _3954 = _3860 * _3924;
    float _3956 = _3882 * _3924;
    float _3958 = _3848 * _3924;
    float _3960 = _3872 * _3924;
    float _3962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3964 = -_3946;
    float _3966 = fma(_3910, _3898, _3964);
    float _3968 = -_3936;
    float _3970 = _3910 * _3968;
    float _3972 = _3958 * _3936;
    float _3974 = _3962 * _3920;
    float _3976 = _3706 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3978 = _3954 * _3936;
    float _3980 = _3706 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3982 = fma(_3956, _3974, _3970);
    float _3984 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3976);
    float _3986 = fma(_3952, _3974, _3972);
    float _3988 = fma(_3938, _3974, _3978);
    float _3990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3992 = _3948 * _3990;
    float _3994 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3984);
    float _3996 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3980);
    float _3998 = fma(_3966, _3934, _3988);
    float _4000 = fma(_3960, _3934, _3982);
    bool _4002 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4004 = _3994 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4006 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4008 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4010 = fma(_3944, _3934, _3986);
    float _4012 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3996);
    float _4014 = trunc(_4004);
    int _4016 = int(_4014);
    float _4018 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4020 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4008);
    float _4022 = _4012 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4024 = !_4002;
    int _4026 = _4024 ? 0 : 1;
    float _4028 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4018);
    float _4030 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4020);
    int _4032 = as_type<int>(_3998);
    int _4034 = as_type<int>(_4010);
    float _4036 = _4004;
    if (!_4002)
    {
        _3698 = 1;
    }
    int _4038 = _3698;
    float _4040 = trunc(_4022);
    int _4042 = int(_4040);
    int _4044 = _4038;
    if (!_4006)
    {
        _4044 = _4026;
    }
    int _4046 = _4044;
    float _4048 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4028);
    float _4050 = _4030 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _4052 = _4046 << 6;
    float _4054 = _4048 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4056 = _2532 + _4050;
    int _4058 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4060 = _4016 + _4058;
    int _4062 = _4060 + 1;
    int _4064 = _4052 + 56;
    uint _4066 = uint(int(uint(_4064) >> uint(2)));
    uint _4068 = uint(int(uint(int(_4066)) >> uint(2)));
    int _4070 = int(_4066) & 3;
    float _4072 = (*spvDescriptorSet0.vp_c15)._m0[int(_4068)][_4070];
    int _4074 = int(_4066) + 1;
    uint _4076 = uint(int(uint(_4074) >> uint(2)));
    int _4078 = _4074 & 3;
    float _4080 = (*spvDescriptorSet0.vp_c15)._m0[int(_4076)][_4078];
    float _4082 = _2478 + _4054;
    float _4084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4086 = _4056 + _4084;
    bool _4088 = _4062 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4090 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4092 = _4082 + _4090;
    float _4094 = _4086 * _4086;
    int _4096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4098 = _4042 + _4096;
    int _4100 = _4098 + 1;
    int _4102 = _4052 + 48;
    uint _4104 = uint(int(uint(_4102) >> uint(2)));
    uint _4106 = uint(int(uint(int(_4104)) >> uint(2)));
    int _4108 = int(_4104) & 3;
    float _4110 = (*spvDescriptorSet0.vp_c15)._m0[int(_4106)][_4108];
    int _4112 = int(_4104) + 1;
    uint _4114 = uint(int(uint(_4112) >> uint(2)));
    int _4116 = _4112 & 3;
    float _4118 = (*spvDescriptorSet0.vp_c15)._m0[int(_4114)][_4116];
    float _4120 = fma(_4092, _4092, _4094);
    int _4122 = _4062 | _4100;
    float _4124 = sqrt(_4120);
    bool _4126 = _4122 < 0;
    bool _4128 = _4126 || _4088;
    int _4130 = _4052 + 64;
    uint _4132 = uint(int(uint(_4130) >> uint(2)));
    uint _4134 = uint(int(uint(int(_4132)) >> uint(2)));
    int _4136 = int(_4132) & 3;
    float _4138 = (*spvDescriptorSet0.vp_c15)._m0[int(_4134)][_4136];
    int _4140 = int(_4132) + 1;
    uint _4142 = uint(int(uint(_4140) >> uint(2)));
    int _4144 = _4140 & 3;
    float _4146 = (*spvDescriptorSet0.vp_c15)._m0[int(_4142)][_4144];
    float _4148 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _4150 = _4100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4152 = _4150 || _4128;
    float _4154 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4148);
    int _4156 = _4052 + 72;
    uint _4158 = uint(int(uint(_4156) >> uint(2)));
    uint _4160 = uint(int(uint(int(_4158)) >> uint(2)));
    int _4162 = int(_4158) & 3;
    float _4164 = (*spvDescriptorSet0.vp_c15)._m0[int(_4160)][_4162];
    int _4166 = int(_4158) + 1;
    uint _4168 = uint(int(uint(_4166) >> uint(2)));
    int _4170 = _4166 & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    float _4174 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4154);
    float _4176 = _4174 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _4178 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4180 = _4052 + 96;
    uint _4182 = uint(int(uint(_4180) >> uint(2)));
    uint _4184 = uint(int(uint(int(_4182)) >> uint(2)));
    int _4186 = int(_4182) & 3;
    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[int(_4184)][_4186];
    int _4190 = int(_4182) + 1;
    uint _4192 = uint(int(uint(_4190) >> uint(2)));
    int _4194 = _4190 & 3;
    float _4196 = (*spvDescriptorSet0.vp_c15)._m0[int(_4192)][_4194];
    int _4198 = _4062;
    int _4200 = as_type<int>(_4174);
    float _4202 = _4094;
    float _4204 = _4082;
    float _4206 = _4056;
    if (!_4152)
    {
        int _4208 = _4100 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4210 = _4208 + _4062;
        _4032 = _4210;
    }
    int _4212 = _4032;
    float _4214 = _2492 + _4176;
    if (!_4152)
    {
        int _4216 = _4212 << 2;
        _4034 = _4216;
    }
    int _4218 = _4034;
    int _4220 = _4052 + 104;
    uint _4222 = uint(int(uint(_4220) >> uint(2)));
    uint _4224 = uint(int(uint(int(_4222)) >> uint(2)));
    int _4226 = int(_4222) & 3;
    float _4228 = (*spvDescriptorSet0.vp_c15)._m0[int(_4224)][_4226];
    int _4230 = int(_4222) + 1;
    uint _4232 = uint(int(uint(_4230) >> uint(2)));
    int _4234 = _4230 & 3;
    float _4236 = (*spvDescriptorSet0.vp_c15)._m0[int(_4232)][_4234];
    float _4238 = as_type<float>(_4218);
    if (!_4152)
    {
        uint _4240 = uint(int(uint(_4212) >> uint(2)));
        _4198 = int(_4240);
    }
    int _4242 = _4198;
    float _4244 = as_type<float>(_4242);
    if (!_4152)
    {
        int _4246 = 12 & _4218;
        _4200 = _4246;
    }
    int _4248 = _4200;
    if (!_4178)
    {
        _4202 = _4082;
    }
    float _4250 = _4202;
    float _4252 = _4250;
    if (!_4152)
    {
        int _4254 = _4242 << 4;
        int _4256 = _4254 + _4248;
        _4244 = as_type<float>(_4256);
    }
    float _4258 = _4244;
    if (!_4178)
    {
        _4204 = _4214;
    }
    float _4260 = _4204;
    bool _4262 = !_4178;
    float _4264 = _4260;
    if (!_4262)
    {
        float _4266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4270 = _4124 + _4268;
        float _4272 = _4214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4274 = rsqrt(_4120);
        float _4276 = _4270 * _4266;
        float _4278 = _4276 * 0.15915493667125701904296875;
        float _4280 = _4278 * 6.283185482025146484375;
        float _4282 = cos(_4280);
        float _4284 = _4278 * 6.283185482025146484375;
        float _4286 = sin(_4284);
        float _4288 = _4282 + (-1.0);
        float _4290 = fma(_4286, _4272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4292 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4294 = _4274 * _4290;
        float _4296 = fma(_4214, _4282, _4292);
        float _4298 = fma(_4092, _4294, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4300 = fma(_4086, _4294, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4264 = _4296;
        _4252 = _4298;
        _4206 = _4300;
        _4238 = _4288;
    }
    float _4302 = _4264;
    float _4304 = _4252;
    float _4306 = _4206;
    float _4308 = _4238;
    float _4310 = -_2492;
    float _4312 = _4310 + _4302;
    int _4314 = _4052 + 80;
    uint _4316 = uint(int(uint(_4314) >> uint(2)));
    uint _4318 = uint(int(uint(int(_4316)) >> uint(2)));
    int _4320 = int(_4316) & 3;
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[int(_4318)][_4320];
    int _4324 = int(_4316) + 1;
    uint _4326 = uint(int(uint(_4324) >> uint(2)));
    int _4328 = _4324 & 3;
    float _4330 = (*spvDescriptorSet0.vp_c15)._m0[int(_4326)][_4328];
    float _4332 = -_2478;
    float _4334 = _4332 + _4304;
    float _4336 = -_2532;
    float _4338 = _4336 + _4306;
    float _4340 = _4312 * _4312;
    float _4342 = _3706 * _4196;
    float _4344 = _4308;
    float _4346 = _4340;
    float _4348 = _4304;
    float _4350 = _4302;
    float _4352 = _4306;
    if (!_4152)
    {
        float _4354 = floor(_4004);
        _4344 = _4354;
    }
    float _4356 = _4344;
    float _4358 = _3706 * _4146;
    float _4360 = fma(_4334, _4334, _4340);
    int _4362 = _4052 + 88;
    uint _4364 = uint(int(uint(_4362) >> uint(2)));
    uint _4366 = uint(int(uint(int(_4364)) >> uint(2)));
    int _4368 = int(_4364) & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    int _4372 = int(_4364) + 1;
    uint _4374 = uint(int(uint(_4372) >> uint(2)));
    int _4376 = _4372 & 3;
    float _4378 = (*spvDescriptorSet0.vp_c15)._m0[int(_4374)][_4376];
    float _4380 = fma(_3556, _4188, _4342);
    float _4382 = fma(_3556, _4138, _4358);
    float _4384 = fma(_4338, _4338, _4360);
    float _4386 = fma(_3564, _4228, _4380);
    if (!_4152)
    {
        float _4388 = floor(_4022);
        _4346 = _4388;
    }
    float _4390 = _4346;
    bool _4392 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4394 = isnan(0.5);
    bool _4396 = _4392 || _4394;
    bool _4398 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4400 = _4396 || _4398;
    float _4402 = _4258;
    float _4404 = _4390;
    if (!_4152)
    {
        int _4406 = as_type<int>(_4258) + 400;
        uint _4408 = uint(int(uint(_4406) >> uint(2)));
        uint _4410 = uint(int(uint(int(_4408)) >> uint(2)));
        int _4412 = int(_4408) & 3;
        float _4414 = (*spvDescriptorSet0.vp_c15)._m0[int(_4410)][_4412];
        _4402 = _4414;
    }
    float _4416 = _4402;
    float _4418 = _4386 + _4236;
    float _4420 = _3706 * _4118;
    float _4422 = fma(_3564, _4164, _4382);
    float _4424 = sqrt(_4384);
    float _4426 = fma(_3556, _4110, _4420);
    float _4428 = fma(_3564, _4072, _4426);
    float _4430 = 1.0 / _4418;
    bool _4432 = _4424 > 0.0;
    bool _4434 = !_4432;
    if (!_4434)
    {
        float _4436 = _245 * _245;
        float _4438 = rsqrt(_4384);
        float _4440 = fma(_237, _237, _4436);
        float _4442 = fma(_247, _247, _4440);
        float _4444 = sqrt(_4442);
        float _4446 = _4334 * _4438;
        float _4448 = _4312 * _4438;
        float _4450 = _4338 * _4438;
        bool _4452 = _4444 > 0.0;
        bool _4454 = !_4452;
        if (!_4454)
        {
            float _4456 = rsqrt(_4442);
            float _4458 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4460 = _245 * _4456;
            float _4462 = _237 * _4456;
            float _4464 = _247 * _4456;
            float _4466 = _4448 * _4460;
            float _4468 = fma(_4446, _4462, _4466);
            float _4470 = _4458 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4472 = fma(_4450, _4464, _4468);
            float _4474 = _4472 * _4470;
            float _4476 = fma(_237, _4474, _4304);
            float _4478 = fma(_245, _4474, _4302);
            float _4480 = fma(_247, _4474, _4306);
            _4348 = _4476;
            _4350 = _4478;
            _4352 = _4480;
        }
    }
    float _4482 = _4348;
    float _4484 = _4350;
    float _4486 = _4352;
    float _4488 = -_3544;
    float _4490 = _4488 + _4482;
    float _4492 = -_3546;
    float _4494 = _4492 + _4484;
    float _4496 = -_3552;
    float _4498 = _4496 + _4486;
    float _4500 = _4428 + _4080;
    float _4502 = _4422 + _4172;
    float _4504 = _4494;
    float _4506 = _4490;
    float _4508 = _4498;
    float _4510 = _4502;
    if (!_4400)
    {
        float _4512 = _3560 * _3560;
        float _4514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4516 = -_2532;
        float _4518 = _4516 + _4486;
        float _4520 = -_2492;
        float _4522 = _4520 + _4484;
        float _4524 = fma(_3568, _3568, _4512);
        float _4526 = -_2478;
        float _4528 = _4526 + _4482;
        float _4530 = fma(_3574, _3574, _4524);
        float _4532 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4534 = sqrt(_4530);
        float _4536 = 1.0 / _3914;
        float _4538 = precise::min(_4534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4540 = _4538 * _4514;
        float _4542 = _4532 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4544 = _4540 * _4536;
        float _4546 = _4542 * _4544;
        float _4548 = _4518 * _4544;
        float _4550 = fma(_4522, _4546, _3550);
        float _4552 = fma(_4528, _4546, _3556);
        float _4554 = fma(_4542, _4548, _3564);
        _4504 = _4550;
        _4506 = _4552;
        _4508 = _4554;
    }
    float _4556 = _4504;
    float _4558 = _4506;
    float _4560 = _4508;
    float _4562 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4564 = _4500 * _4430;
    float _4566 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4568 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4570 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4562);
    float _4572 = _4502 * _4430;
    float _4574 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4566);
    bool _4576 = _4564 >= 0.0;
    float _4578 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4570);
    float _4580 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4582 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4584 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4574);
    float _4586 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4588 = _4564 <= 1.0;
    bool _4590 = _4588 && _4576;
    float _4592 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4580);
    float _4594 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4582);
    float _4596 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4598 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4600 = _4572 >= 0.0;
    bool _4602 = _4600 && _4590;
    float _4604 = _4592 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4606 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4594);
    float _4608 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4598);
    bool _4610 = _4572 <= 1.0;
    bool _4612 = _4610 && _4602;
    float _4614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4616 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4618 = _4606 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4620 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4608);
    float _4622 = _3706 * _4330;
    float _4624 = -_4616;
    float _4626 = fma(_4624, _4614, 1.0);
    float _4628 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4630 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4632 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4634 = fma(_3556, _4322, _4622);
    float _4636 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4628);
    float _4638 = 1.0 / _4630;
    float _4640 = _4594;
    float _4642 = _4592;
    float _4644 = _4630;
    if (_4612)
    {
        float _4646 = float(_4046);
        _4640 = _4646;
    }
    float _4648 = _4640;
    float _4650 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4632);
    float _4652 = fma(_3564, _4370, _4634);
    float _4654 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4636);
    if (!_4152)
    {
        float _4656 = -_4390;
        float _4658 = _4022 + _4656;
        _4404 = _4658;
    }
    float _4660 = _4404;
    float _4662 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4650);
    float _4664 = _4652 + _4378;
    float _4666 = log2(_4626);
    float _4668 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4654);
    float _4670 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4662);
    if (!_4152)
    {
        float _4672 = -_4356;
        float _4674 = _4004 + _4672;
        _4510 = _4674;
    }
    float _4676 = _4510;
    float _4678 = _4664 * _4430;
    float _4680 = _4422;
    if (!_4152)
    {
        float _4682 = rint(_4416);
        float _4684 = precise::max(_4682, 0.0);
        uint _4686 = uint(_4684);
        uint _4688 = clamp(_4686, 0u, 65535u);
        _4680 = as_type<float>(_4688);
    }
    float _4690 = _4680;
    float _4692 = _4668 * _4638;
    float _4694 = _4670 * _4638;
    float _4696 = fma(_4692, 0.5, 0.5);
    float _4698 = fma(_4694, -0.5, 0.5);
    float _4700 = _4648;
    if (_4612)
    {
        float _4702 = rint(_4648);
        float _4704 = precise::max(_4702, 0.0);
        uint _4706 = uint(_4704);
        uint _4708 = clamp(_4706, 0u, 65535u);
        _4700 = as_type<float>(_4708);
    }
    float _4710 = _4700;
    float _4712 = _4666 * 0.693147182464599609375;
    float _4714 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4716 = _4660;
    float _4718 = _4714;
    if (!_4152)
    {
        float3 _12635 = float3(_4676, _4660, float(as_type<int>(_4690)));
        float3 _12639 = select(_12635, float3(0.0), isnan(_12635));
        float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12639.xy, uint(rint(_12639.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12639.xy, uint(rint(_12639.z)), level(0.0)).x;
        _4716 = _4720;
    }
    float _4722 = _4716;
    float _4724 = _4712;
    if (_4612)
    {
        float3 _12654 = float3(_4564, _4572, float(as_type<int>(_4710)));
        float3 _12656 = select(_12654, float3(0.0), isnan(_12654));
        float _4726 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12656.xy, uint(rint(_12656.z)), _4678, level(0.0));
        _4724 = _4726;
    }
    float _4728 = _4724;
    float3 _12666 = float3(_4696, _4698, _4714);
    float _4730 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12666, float3(0.0), isnan(_12666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12666, float3(0.0), isnan(_12666)), level(0.0)).x;
    float3 _12675 = float3(_4696, _4698, _4714);
    float4 _4733 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12675, float3(0.0), isnan(_12675)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12675, float3(0.0), isnan(_12675)), level(0.0)).xyzw;
    float _4735 = _4733.x;
    float _4737 = _4733.y;
    float _4739 = _4733.z;
    float _4741 = _4733.w;
    bool _4743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4745 = isnan(0.5);
    bool _4747 = _4743 || _4745;
    bool _4749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4751 = _4747 || _4749;
    if (_4152)
    {
        _3582 = 1.0;
    }
    float _4753 = _3582;
    float _4755 = _4753;
    if (_4751)
    {
        _4642 = 1.0;
    }
    float _4757 = _4642;
    float _4759 = _4757;
    float _4761 = _4737;
    float _4763 = _4735;
    if (!_4751)
    {
        float _4765 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4767 = _4765 * 0.15915493667125701904296875;
        float _4769 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4771 = _4767 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = _4769 * 0.15915493667125701904296875;
        float _4777 = _4767 * 6.283185482025146484375;
        float _4779 = sin(_4777);
        float _4781 = 1.0 / _4773;
        float _4783 = _4775 * 6.283185482025146484375;
        float _4785 = cos(_4783);
        float _4787 = _4779 * _4781;
        float _4789 = _4775 * 6.283185482025146484375;
        float _4791 = sin(_4789);
        float _4793 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4795 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4793;
        float _4797 = _4785 * _4787;
        float _4799 = 1.0 / _4795;
        float _4801 = 1.0 / _4797;
        float _4803 = _4791 * _4801;
        float _4805 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4807 = fma(_3992, _4803, _4805);
        float _4809 = _4807 * _4799;
        float _4811 = precise::clamp(_4809, 0.0, 1.0);
        _4718 = _4767;
        _4759 = _4811;
    }
    float _4813 = _4718;
    float _4815 = _4759;
    float _4817 = _4813;
    if (!_4152)
    {
        int _4819 = _4212 << 4;
        int _4821 = _4819 + 2048;
        uint _4823 = uint(int(uint(_4821) >> uint(2)));
        uint _4825 = uint(int(uint(int(_4823)) >> uint(2)));
        int _4827 = int(_4823) & 3;
        float _4829 = (*spvDescriptorSet0.vp_c15)._m0[int(_4825)][_4827];
        int _4831 = int(_4823) + 1;
        uint _4833 = uint(int(uint(_4831) >> uint(2)));
        int _4835 = _4831 & 3;
        float _4837 = (*spvDescriptorSet0.vp_c15)._m0[int(_4833)][_4835];
        int _4839 = _4821 + 8;
        uint _4841 = uint(int(uint(_4839) >> uint(2)));
        uint _4843 = uint(int(uint(int(_4841)) >> uint(2)));
        int _4845 = int(_4841) & 3;
        float _4847 = (*spvDescriptorSet0.vp_c15)._m0[int(_4843)][_4845];
        int _4849 = int(_4841) + 1;
        uint _4851 = uint(int(uint(_4849) >> uint(2)));
        int _4853 = _4849 & 3;
        float _4855 = (*spvDescriptorSet0.vp_c15)._m0[int(_4851)][_4853];
        float _4857 = _3706 * _4837;
        float _4859 = fma(_3556, _4829, _4857);
        float _4861 = fma(_3564, _4847, _4859);
        float _4863 = _4861 + _4855;
        float _4865 = precise::clamp(_4863, 0.0, 1.0);
        float _4867 = -_4865;
        float _4869 = _4867 + _4722;
        float _4871 = fma(_4869, 500.0, 1.5);
        float _4873 = exp2(_4871);
        float _4875 = 0.0 + _4873;
        float _4877 = precise::clamp(_4875, 0.0, 1.0);
        _4755 = _4877;
    }
    float _4879 = _4755;
    float _4881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4883 = _4556 + _4881;
    float _4885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4887 = _4558 + _4885;
    float _4889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4891 = _4560 + _4889;
    float _4893 = _4883 * _4883;
    float _4895 = fma(_4887, _4887, _4893);
    float _4897 = fma(_4891, _4891, _4895);
    float _4899 = rsqrt(_4897);
    float _4901 = _4899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4903 = _4887 * _4901;
    float _4905 = _4891 * _4901;
    float _4907 = _4903 * _4903;
    float _4909 = _4905 * _4905;
    float _4911 = _4907 + _4909;
    float _4913 = sqrt(_4911);
    bool _4915 = _4913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4919 = _4913 + _4917;
    float _4921 = _4891;
    float _4923 = _4919;
    float _4925 = _4883;
    if (_4915)
    {
        float _4927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4921 = _4927;
    }
    float _4929 = _4921;
    if (_4915)
    {
        float _4931 = rsqrt(_4911);
        _4817 = _4931;
    }
    float _4933 = _4817;
    float _4935 = _4933;
    if (_4915)
    {
        float _4937 = _4919 * _4929;
        _4923 = _4937;
    }
    float _4939 = _4923;
    if (_4915)
    {
        float _4941 = _4939 * 0.15915493667125701904296875;
        _3584 = _4941;
    }
    float _4943 = _3584;
    float _4945 = _4899;
    if (_4915)
    {
        float _4947 = _4943 * 6.283185482025146484375;
        float _4949 = sin(_4947);
        _4945 = _4949;
    }
    float _4951 = _4945;
    float _4953 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4955 = precise::max(0.0, _4953);
    float _4957 = _4893;
    float _4959 = _4955;
    float _4961 = _4953;
    if (_4915)
    {
        float _4963 = _4943 * 6.283185482025146484375;
        float _4965 = cos(_4963);
        _4957 = _4965;
    }
    float _4967 = _4957;
    float _4969 = -_4901;
    float _4971 = -_4955;
    float _4973 = fma(_4883, _4969, _4971);
    if (!_4915)
    {
        _4925 = _4905;
    }
    float _4975 = _4925;
    float _4977 = _4975;
    if (_4915)
    {
        float _4979 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4959 = _4979;
    }
    float _4981 = _4959;
    float _4983 = _4981;
    float _4985 = _4951;
    if (_4915)
    {
        float _4987 = fma(_4951, _4981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4983 = _4987;
    }
    float _4989 = _4983;
    float _4991 = _4989;
    if (!_4915)
    {
        _4985 = _4903;
    }
    float _4993 = _4985;
    float _4995 = _4993;
    float _4997 = _4967;
    if (_4915)
    {
        float _4999 = _4967 + (-1.0);
        _4961 = _4999;
    }
    float _5001 = _4961;
    float _5003 = _5001;
    if (_4915)
    {
        float _5005 = _4933 * _4989;
        _4036 = _5005;
    }
    float _5007 = _4036;
    if (!_4915)
    {
        _4991 = _4973;
    }
    float _5009 = _4991;
    float _5011 = _5009;
    if (_4915)
    {
        float _5013 = _5001 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5003 = _5013;
    }
    float _5015 = _5003;
    if (_4915)
    {
        float _5017 = _4903 * _5007;
        _4995 = _5017;
    }
    float _5019 = _4995;
    if (!_4915)
    {
        _4935 = _4907;
    }
    float _5021 = _4935;
    float _5023 = _5021;
    if (_4915)
    {
        float _5025 = _4905 * _5007;
        _4977 = _5025;
    }
    float _5027 = _4977;
    if (_4915)
    {
        float _5029 = fma(_4973, _4967, _5015);
        _5011 = _5029;
    }
    float _5031 = _5011;
    if (_4915)
    {
        float _5033 = _5019 * _5019;
        _5023 = _5033;
    }
    float _5035 = _5023;
    if (!_4915)
    {
        _4997 = _4909;
    }
    float _5037 = _4997;
    float _5039 = _5037;
    if (_4915)
    {
        float _5041 = _5027 * _5027;
        _5039 = _5041;
    }
    float _5043 = _5039;
    float _5045 = sqrt(_4897);
    float _5047 = fma(_5031, _5031, _5035);
    float _5049 = _5047 + _5043;
    float _5051 = rsqrt(_5049);
    float _5053 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5055 = fma(_5045, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5053);
    float _5057 = precise::clamp(_5055, 0.0, 1.0);
    float _5059 = -_5057;
    float _5061 = _5059 + 1.0;
    float _5063 = abs(_5061);
    float _5065 = log2(_5063);
    float _5067 = _5051 * _5019;
    float _5069 = _5051 * _5031;
    float _5071 = _5051 * _5027;
    float _5073 = _5067 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5075 = -_5073;
    float _5077 = fma(_5069, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5075);
    float _5079 = -_5071;
    float _5081 = fma(_5079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5077);
    float _5083 = _5065 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5085 = fma(_5081, -0.5, 0.5);
    float _5087 = fma(_5081, 0.5, 0.5);
    float _5089 = exp2(_5083);
    float _5091 = fma(_5087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5093 = fma(_5087, _5091, -0.212114393711090087890625);
    float _5095 = _5069 + 1.0;
    float _5097 = sqrt(_5085);
    float _5099 = fma(_5087, _5093, 1.570728778839111328125);
    float _5101 = -_5069;
    float _5103 = fma(_5089, _5095, _5101);
    float _5105 = fma(_5103, 0.5, 0.5);
    float _5107 = _5097 * 0.636619746685028076171875;
    float _5109 = -_5099;
    float _5111 = fma(_5107, _5109, 1.0);
    float2 _13243 = float2(_5111, _5105);
    float3 _5115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13243, float2(0.0), isnan(_13243)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13243, float2(0.0), isnan(_13243)), level(0.0)).xyz;
    float _5117 = _5115.x;
    float _5119 = _5115.y;
    float _5121 = _5115.z;
    float _5123 = abs(_3992);
    float _5125 = log2(_5123);
    float _5127 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5129 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5131 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5133 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5135 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5127);
    float _5137 = fma(_5129, _5129, 1.0);
    float _5139 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5131);
    float _5141 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5143 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5145 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5147 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5133);
    float _5149 = rsqrt(_5137);
    float _5151 = -_3910;
    float _5153 = fma(_5151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5141);
    float _5155 = -_3910;
    float _5157 = fma(_5155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5143);
    float _5159 = -_3910;
    float _5161 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5145);
    float _5163 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5165 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5167 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5169 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5171 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5147);
    float _5173 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5175 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5165);
    float _5177 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5167);
    float _5179 = exp2(_5163);
    float _5181 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5169);
    float _5183 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5153);
    float _5185 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5173);
    float _5187 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5139);
    float _5189 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5135);
    float _5191 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5193 = _5129 * _5183;
    float _5195 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5157);
    float _5197 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5161);
    float _5199 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5185);
    float _5201 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5175);
    float _5203 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5177);
    float _5205 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5181);
    float _5207 = fma(_5191, _5187, _5193);
    float _5209 = _5129 * _5195;
    float _5211 = _5129 * _5197;
    float _5213 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5199);
    float _5215 = _5129 * _5149;
    float _5217 = fma(_5191, _5189, _5209);
    float _5219 = fma(_5191, _5171, _5211);
    float _5221 = -_5201;
    float _5223 = _5215 * _5221;
    float _5225 = _4630 * 0.5;
    float _5227 = fma(_5179, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5229 = precise::clamp(_5227, 0.0, 1.0);
    out.m_96.x = _5187;
    out.m_96.y = _5189;
    out.m_96.z = _5171;
    float _5231 = _5065 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5233 = -_5205;
    float _5235 = _5215 * _5233;
    bool _5237 = _3992 <= 8000.0;
    bool _5239 = isnan(_3992);
    bool _5241 = _5237 || _5239;
    bool _5243 = isnan(8000.0);
    bool _5245 = _5241 || _5243;
    float _5247 = float(_5245);
    out.gl_Position.x = _4668;
    out.gl_Position.y = _4670;
    out.gl_Position.z = _5213;
    out.gl_Position.w = _4630;
    float _5249 = -_3610;
    float _5251 = _5249 + 1.0;
    float _5253 = _5213 + _4630;
    float _5255 = exp2(_5231);
    float _5257 = _5203 + _5217;
    bool _5259 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5261 = isnan(_5045);
    bool _5263 = _5259 || _5261;
    bool _5265 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5267 = _5263 || _5265;
    float _5269 = _5253 * 0.5;
    float _5271 = fma(_5149, _5183, _5223);
    float _5273 = fma(_4670, -0.5, _5225);
    float _5275 = _5201 + _5207;
    float _5277 = fma(_5229, -2.0, 3.0);
    float _5279 = _5229 * _5229;
    float _5281 = -_5203;
    float _5283 = _5215 * _5281;
    float _5285 = _5279 * _5277;
    float _5287 = fma(_5149, _5195, _5283);
    float _5289 = fma(_5149, _5197, _5235);
    float _5291 = _4668 + _4630;
    float _5293 = -_5285;
    float _5295 = _5293 + 1.0;
    float _5297 = -_5255;
    float _5299 = _5297 + 1.0;
    float _5301 = _5205 + _5219;
    float _5303 = _5291 * 0.5;
    float _5305 = fma(_5295, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5285);
    float _5307 = _5299 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_98.x = _5271;
    out.m_98.y = _5287;
    out.m_98.z = _5289;
    float _5309 = _5305;
    float _5311 = _5299;
    if (!_5267)
    {
        _4644 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5313 = _4644;
    float _5315 = _5247 * _5305;
    float _5317 = _5313;
    float _5319 = _5313;
    if (!_4612)
    {
        _5309 = 1.0;
    }
    float _5321 = _5309;
    out.m_100.x = _5303;
    out.m_100.y = _5273;
    out.m_100.z = _5269;
    out.m_100.w = _4630;
    float _5323 = _5321;
    if (_4612)
    {
        bool _5325 = _4728 >= _4678;
        bool _5327 = isnan(_4728);
        bool _5329 = _5325 || _5327;
        bool _5331 = isnan(_4678);
        bool _5333 = _5329 || _5331;
        float _5335 = float(_5333);
        _5323 = _5335;
    }
    float _5337 = _5323;
    float _5339 = _5315 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5267)
    {
        _5311 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5341 = _5311;
    out.m_102.x = _5275;
    out.m_102.y = _5257;
    out.m_102.z = _5301;
    float _5343 = _5251 * _5339;
    float _5345 = precise::clamp(_5343, 0.0, 1.0);
    float _5347 = _5337 * _4879;
    float _5349 = _5307 * _4730;
    float _5351 = -_5307;
    float _5353 = _5351 + 1.0;
    float _5355 = -_5345;
    float _5357 = fma(_5355, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5359 = _4815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5361 = _4741 * _5349;
    float _5363 = -_5347;
    float _5365 = fma(_5363, _5357, 1.0);
    float _5367 = precise::clamp(_5365, 0.0, 1.0);
    float _5369 = _4741 * _5353;
    float _5371 = _5353;
    float _5373 = _5367;
    float _5375 = _5341;
    float _5377 = _5341;
    if (!_5267)
    {
        _5371 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5379 = _5371;
    float _5381 = _5367 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5383 = _5379;
    float _5385 = _5379;
    if (!_5267)
    {
        _5373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5387 = _5373;
    out.m_104.x = _5381;
    float _5389 = _5121 * _5349;
    float _5391 = fma(_5117, _5361, _4735);
    float _5393 = fma(_5119, _5361, _4737);
    float _5395 = _5387;
    float _5397 = _5387;
    if (!_5267)
    {
        _4761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5399 = _4761;
    float _5401 = fma(_4741, _5389, _4739);
    float _5403 = _5399;
    float _5405 = _5399;
    if (!_5267)
    {
        _4763 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5407 = _4763;
    out.m_106.x = _5391;
    out.m_106.y = _5393;
    out.m_106.z = _5401;
    out.m_106.w = _5369;
    bool _5409 = !_5267;
    float _5411 = _5407;
    float _5413 = _5407;
    if (!_5409)
    {
        bool _5415 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5417 = isnan(_5045);
        bool _5419 = _5415 || _5417;
        bool _5421 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5423 = _5419 || _5421;
        if (!_5423)
        {
            float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5427 = _5045 + _5425;
            float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5431 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5429;
            float _5433 = 1.0 / _5431;
            float _5435 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5437 = _5435 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5439 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5441 = _5439 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5443 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5445 = _5443 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5447 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5449 = _5447 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5453 = _5451 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5455 = _5427 * _5433;
            float _5457 = precise::clamp(_5455, 0.0, 1.0);
            float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5463 = fma(_5457, _5437, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5465 = fma(_5457, _5461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5467 = fma(_5457, _5441, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5469 = fma(_5457, _5445, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5471 = fma(_5457, _5449, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5473 = fma(_5457, _5453, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5413 = _5465;
            _5377 = _5471;
            _5405 = _5463;
            _5385 = _5469;
            _5319 = _5467;
            _5397 = _5473;
            _5475 = true;
        }
        else
        {
            bool _5477 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5479 = isnan(_5045);
            bool _5481 = _5477 || _5479;
            bool _5483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5485 = _5481 || _5483;
            if (!_5485)
            {
                _5403 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5487 = _5403;
            _5405 = _5487;
            if (!_5485)
            {
                _5411 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5489 = _5411;
            _5413 = _5489;
            if (!_5485)
            {
                _5317 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5491 = _5317;
            _5319 = _5491;
            if (!_5485)
            {
                _5383 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5493 = _5383;
            _5385 = _5493;
            if (!_5485)
            {
                _5375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5495 = _5375;
            _5377 = _5495;
            if (!_5485)
            {
                _5395 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5497 = _5395;
            bool _5499 = !_5485;
            _5397 = _5497;
            if (!_5499)
            {
                bool _5501 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5503 = isnan(_5045);
                bool _5505 = _5501 || _5503;
                bool _5507 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5509 = _5505 || _5507;
                if (!_5509)
                {
                    float _5511 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5513 = _5045 + _5511;
                    float _5515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5517 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5515;
                    float _5519 = 1.0 / _5517;
                    float _5521 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5523 = _5521 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5525 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5527 = _5525 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5529 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5531 = _5529 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5533 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5535 = _5533 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5537 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5539 = _5537 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5541 = _5513 * _5519;
                    float _5543 = precise::clamp(_5541, 0.0, 1.0);
                    float _5545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5547 = _5545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5549 = fma(_5543, _5523, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5551 = fma(_5543, _5547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5553 = fma(_5543, _5527, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5555 = fma(_5543, _5531, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5557 = fma(_5543, _5535, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5559 = fma(_5543, _5539, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5413 = _5551;
                    _5377 = _5557;
                    _5405 = _5549;
                    _5385 = _5555;
                    _5319 = _5553;
                    _5397 = _5559;
                    _5475 = true;
                }
                else
                {
                    _5413 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5405 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5385 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5319 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5397 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5475 = false;
    float _5561 = _5413;
    float _5563 = _5377;
    float _5565 = _5405;
    float _5567 = _5385;
    float _5569 = _5319;
    float _5571 = _5397;
    float _5573 = fma(_5257, -0.5, 0.5);
    float _5575 = precise::clamp(_5573, 0.0, 1.0);
    float _5577 = -_5561;
    float _5579 = _5577 + _5563;
    float _5581 = _5359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5583 = -_5565;
    float _5585 = _5583 + _5567;
    float _5587 = fma(_5575, _5579, _5561);
    out.m_108.x = 0.0;
    float _5589 = -_5569;
    float _5591 = _5589 + _5571;
    float _5593 = fma(_5575, _5585, _5565);
    float _5595 = _5587 * 0.586610972881317138671875;
    out.m_63.x = _5581;
    bool _5597 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5599 = fma(_5575, _5591, _5569);
    float _5601 = fma(_5593, 0.298911988735198974609375, _5595);
    bool _5603 = _4815 > 0.0;
    bool _5605 = isnan(_4815);
    bool _5607 = _5603 || _5605;
    bool _5609 = isnan(0.0);
    bool _5611 = _5607 || _5609;
    float _5613 = fma(_5599, 0.114477999508380889892578125, _5601);
    float _5615 = -_5613;
    float _5617 = _5593 + _5615;
    float _5619 = -_5613;
    float _5621 = _5587 + _5619;
    float _5623 = -_5613;
    float _5625 = _5599 + _5623;
    float _5627 = fma(_5617, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    float _5629 = fma(_5621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    float _5631 = fma(_5625, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    bool _5633 = !_5597;
    if (!_5633)
    {
        float _5635 = -_4556;
        float _5637 = _5635 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5639 = -_4558;
        float _5641 = _5639 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5643 = -_4560;
        float _5645 = _5643 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5647 = _5637 * _5637;
        float _5649 = fma(_5641, _5641, _5647);
        float _5651 = fma(_5645, _5645, _5649);
        float _5653 = sqrt(_5651);
        float _5655 = rsqrt(_5651);
        float _5657 = -_5653;
        float _5659 = _5657 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5661 = _5659 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5663 = precise::clamp(_5661, 0.0, 1.0);
        float _5665 = _5641 * _5655;
        float _5667 = _5637 * _5655;
        float _5669 = abs(_5663);
        float _5671 = log2(_5669);
        float _5673 = _5645 * _5655;
        float _5675 = _5665 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5677 = _5257 * _5667;
        float _5679 = -_5667;
        float _5681 = -_5675;
        float _5683 = fma(_5679, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5681);
        float _5685 = fma(_5275, _5665, _5677);
        float _5687 = -_5673;
        float _5689 = fma(_5687, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5683);
        float _5691 = fma(_5301, _5673, _5685);
        float _5693 = precise::clamp(_5691, 0.0, 1.0);
        float _5695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5697 = _5689 + _5695;
        float _5699 = _5671 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5701 = _5697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5703 = precise::clamp(_5701, 0.0, 1.0);
        float _5705 = exp2(_5699);
        float _5707 = _5705 * _5703;
        float _5709 = _5693 * _5707;
        float _5711 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5713 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5715 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5711;
        out.m_108.y = _5713;
        out.m_108.z = _5715;
    }
    out.m_110.x = _5627;
    out.m_110.y = _5629;
    out.m_110.z = _5631;
    if (_5611)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5717 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5717;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5475 = false;
    bool _745 = false;
    bool _601 = false;
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
        float _5785 = as_type<float>(_153);
        out.gl_Position.z = _5785;
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
        float _5848 = as_type<float>(_185);
        out.gl_Position.z = _5848;
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
    float _303 = 1.0 / _283;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _307 * _293;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _291;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _271 + _333;
    float _337 = _315 * _303;
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
    bool _359 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_271);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = 1.0 / _301;
    float _377 = _335 * _331;
    bool _379 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _381 = isnan(_271);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _271 + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _395;
    float _399 = -_389;
    float _401 = _399 + 1.0;
    float _403 = _341 * _343;
    float _405 = -_329;
    float _407 = _405 + 1.0;
    float _409 = fma(_397, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = _357 * _407;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _389 * _373;
    bool _427 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _429 = isnan(_271);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _439;
    float _443 = _393 * _375;
    float _445 = _423 * _401;
    float _447 = -_423;
    float _449 = _447 + 1.0;
    bool _451 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _453 = isnan(_271);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_441, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = _437 * _449;
    float _471 = -_437;
    float _473 = _471 + 1.0;
    float _475 = -_461;
    float _477 = _475 + 1.0;
    float _479 = fma(_467, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = _461 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = _369 * _477;
    float _493 = -_369;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = fma(_489, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _503 = _463 * _491;
    float _505 = _409 * _491;
    float _507 = fma(_483, _345, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_499, _345, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _513 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_479, _485, _511);
    float _525 = fma(_501, _485, _513);
    float _527 = fma(_517, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _535;
    float _539 = fma(_507, _469, _523);
    float _541 = fma(_509, _469, _525);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _547 = fma(_533, _403, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _549 = fma(_537, _403, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _555 = fma(_527, _445, _539);
    float _557 = fma(_529, _445, _541);
    float _559 = fma(_545, _443, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _561 = fma(_553, _443, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _563 = fma(_547, _425, _555);
    float _565 = fma(_549, _425, _557);
    float _567 = fma(_559, _411, _563);
    float _569 = fma(_561, _411, _565);
    float _571 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].x, _567);
    float _573 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].y, _569);
    bool _575 = !_309;
    float _577 = _513;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _581 = _377;
    float _599;
    if (!_575)
    {
        float _583 = in.m_76.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        _599 = _179;
    }
    _601 = false;
    float _603 = _599;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _603 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _613 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_603);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_603);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _641;
    bool _645 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = isnan(_603);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = 1.0 / _611;
    float _659 = -_623;
    float _661 = _659 + 1.0;
    bool _663 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _665 = _639 * _661;
    float _667 = -_639;
    float _669 = _667 + 1.0;
    float _671 = 1.0 / _627;
    float _673 = _643 * _657;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = fma(_673, _607, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -_655;
    float _683 = _681 + 1.0;
    float _685 = _679 * _665;
    float _687 = _677 * _671;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _603 + _689;
    float _693 = _623 * _683;
    float _695 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[115].x, _685);
    float _697 = fma(_687, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = fma(_697, _693, _695);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[117].x, _699);
    float _707 = in.m_78.x;
    float _709 = in.m_78.y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _713 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _719 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _713;
    out.m_80.y = _719;
    out.m_80.z = _715;
    out.m_80.w = _717;
    float _721 = _573 * _709;
    float _723 = _571 * _707;
    bool _725 = !_663;
    float _743;
    if (!_725)
    {
        float _727 = in.m_76.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        _743 = _179;
    }
    _745 = false;
    float _747 = _743;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _747 + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _757 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _759 = isnan(_747);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _777 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _779 = isnan(_747);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = 1.0 / _755;
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _795;
    bool _799 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _801 = isnan(_747);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _787 * _793;
    float _813 = -_787;
    float _815 = _813 + 1.0;
    bool _817 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _819 = 1.0 / _771;
    float _821 = _809 * _815;
    float _823 = -_809;
    float _825 = _823 + 1.0;
    float _827 = 1.0 / _775;
    float _829 = _797 * _789;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _835 = fma(_829, _751, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _837 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _839 = isnan(_747);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = _833 * _819;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _857 = _747 + _855;
    float _859 = _835 * _821;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _863 = _747 + _861;
    float _865 = fma(_849, _857, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _867 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[131].x, _859);
    float _869 = _853 * _827;
    float _871 = -_847;
    float _873 = _871 + 1.0;
    float _875 = fma(_865, _811, _867);
    float _877 = fma(_869, _863, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _879 = _767 * _873;
    float _881 = fma(_877, _879, _875);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _889 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[134].x, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _889 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _891;
    out.m_82.y = _893;
    out.m_82.z = _895;
    out.m_82.w = _897;
    bool _899 = !_817;
    if (!_899)
    {
        float _901 = in.m_76.x;
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _905 = _901 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _909 = _907 * _903;
        float _911 = floor(_909);
        float _913 = -_911;
        float _915 = _909 + _913;
        _181 = _915;
    }
    float _917 = _181;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _921 = int(_919);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _925 = int(_923);
    float _927 = float(_921);
    float _929 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _931 = int(_929);
    float _933 = float(uint(_925));
    float _935 = 1.0 / _927;
    int _937 = ~_925;
    int _939 = _937 + 1;
    float _941 = 1.0 / _933;
    float _943 = float(uint(_931));
    float _945 = _935 * _135;
    int _947 = ~_925;
    int _949 = _947 + 1;
    float _951 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _953 = int(_951);
    int _955 = as_type<int>(_941) + (-2);
    float _957 = trunc(_945);
    int _959 = int(_957);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _967 = int(_965);
    float _969 = float(uint(_959));
    if (_963)
    {
        _577 = 1.0;
    }
    float _971 = _577;
    int _973 = 0;
    int _975 = 0;
    float _977 = _971;
    if (_963)
    {
        _973 = 0;
        _975 = 0;
    }
    int _979 = _973;
    int _981 = _975;
    int _983 = _979;
    int _985 = _981;
    if (_963)
    {
        _579 = 1.0;
    }
    float _987 = _579;
    float _989 = as_type<float>(_955) * _969;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _993 = int(_991);
    float _995 = trunc(_989);
    float _997 = precise::max(_995, 0.0);
    uint _1000 = uint(_997);
    float _1002 = float(_993);
    float _1004 = 1.0 / _1002;
    int _1006 = _949 * int(_1000);
    int _1008 = _1006 + _959;
    float _1010 = float(uint(_1008));
    float _1012 = as_type<float>(_955) * _1010;
    float _1014 = _1010;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1018 = _1002;
    float _1020 = _987;
    if (_963)
    {
        float _1022 = in.m_76.x;
        float _1024 = in.m_76.y;
        _1014 = _1022;
        _1016 = _1024;
    }
    float _1026 = _1014;
    float _1028 = _1016;
    float _1030 = trunc(_1012);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = 1.0 / _943;
    int _1038 = int(_1000) + int(_1034);
    float _1040 = float(_925);
    float _1042 = float(_959);
    int _1044 = _939 * _1038;
    int _1046 = _1044 + _959;
    float _1048 = _1042;
    float _1050 = _1026;
    float _1052 = _1028;
    if (_963)
    {
        _581 = _1026;
    }
    float _1054 = _581;
    bool _1056 = _1042 >= _1040;
    bool _1058 = isnan(_1042);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(_1040);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    bool _1068 = uint(_1046) >= uint(_925);
    float _1070 = 0.0;
    float _1072 = _1054;
    if (_963)
    {
        _1070 = _1054;
    }
    float _1074 = _1070;
    float _1076 = trunc(_1066);
    int _1078 = int(_1076);
    float _1080 = _1074;
    if (_963)
    {
        _1048 = _1028;
    }
    float _1082 = _1048;
    float _1084 = _1082;
    if (_963)
    {
        _1018 = _1054;
    }
    float _1086 = _1018;
    float _1088 = _1086;
    if (!_963)
    {
        float _1090 = in.m_76.x;
        float _1092 = in.m_76.y;
        float _1094 = in.m_76.z;
        float _1096 = _1090 * 3.1415927410125732421875;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1092 * 3.1415927410125732421875;
        float _1102 = _1100 * 0.15915493667125701904296875;
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        _977 = 7.345489978790283203125;
        _1050 = _1090;
        _1052 = _1092;
        _1020 = 5.839270114898681640625;
        _1088 = _1094;
        _1072 = _1092;
        _983 = 1;
        _985 = 2;
        _1080 = _1106;
        _1084 = _1110;
    }
    float _1112 = _977;
    float _1114 = _1050;
    float _1116 = _1052;
    float _1118 = _1020;
    float _1120 = _1088;
    float _1122 = _1072;
    int _1124 = _983;
    int _1126 = _985;
    float _1128 = _1080;
    float _1130 = _1084;
    float _1132 = _1112 * _1114;
    float _1134 = in.m_76.z;
    float _1136 = in.m_76.w;
    bool _1138 = !_1068;
    int _1140 = _1138 ? 0 : (-1);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1144 = _917 + _1142;
    float _1146 = floor(_1132);
    float _1148 = float(_967);
    float _1150 = in.m_70.w;
    int _1152 = ~_1038;
    int _1154 = _1152 + _1140;
    int _1156 = _1154 + 1;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1160 = _917 + _1158;
    float _1162 = float(uint(_953));
    bool _1164 = _925 == 0;
    float _1166 = 1.0 / _1148;
    int _1168 = _925 * _1156;
    int _1170 = _1168 + _959;
    int _1172 = ~_1078;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1164;
    int _1180 = _1178 ? _1170 : (-1);
    float _1182 = -_1146;
    float _1184 = _1132 + _1182;
    float _1186 = 1.0 / _1162;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1190 = _1188 != 0;
    int _1192 = _1180 * _1176;
    float _1194 = _1184 * _1040;
    bool _1196 = _1134 > 0.5;
    float _1198 = _175 * _135;
    bool _1200 = !_1190;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _1166 * _135;
    bool _1206 = _1116 > 0.5;
    float _1208 = _1004 * _135;
    float _1210 = trunc(_1194);
    int _1212 = int(_1210);
    int _1214 = abs(_1202);
    float _1216 = _1040 * _1198;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1228 = _1226 != 0;
    float _1230 = -_225;
    int _1232 = _1196 ? as_type<int>(_1230) : as_type<int>(_225);
    float _1234 = -_241;
    int _1236 = _1206 ? as_type<int>(_1234) : as_type<int>(_241);
    float _1238 = trunc(_1208);
    int _1240 = int(_1238);
    bool _1242 = !_1228;
    float _1244 = _1242 ? _225 : as_type<float>(_1232);
    bool _1246 = !_1224;
    float _1248 = _1246 ? _241 : as_type<float>(_1236);
    float _1250 = trunc(_1204);
    int _1252 = int(_1250);
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1264 = _1262 != 0;
    int _1266 = _1212 * _1214;
    int _1268 = _1266 + _959;
    int _1270 = _925 + (-1);
    int _1272 = as_type<int>(_1036) + (-2);
    bool _1274 = !_1260;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = trunc(_1216);
    int _1280 = int(_1278);
    float _1282 = float(uint(_1240));
    int _1284 = _1078 * _1270;
    int _1286 = _1284 + _1192;
    bool _1288 = !_1256;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1294 = _1292 != 0;
    float _1296 = as_type<float>(_1272) * _1282;
    int _1298 = as_type<int>(_1186) + (-2);
    int _1300 = abs(_1276);
    bool _1302 = !_1264;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = trunc(_1296);
    float _1308 = precise::max(_1306, 0.0);
    uint _1310 = uint(_1308);
    int _1312 = abs(_1290);
    int _1314 = _1286 * _1300;
    bool _1316 = !_1294;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = float(uint(_1252));
    int _1322 = abs(_1304);
    int _1324 = abs(_1318);
    float _1326 = as_type<float>(_1298) * _1320;
    int _1328 = _1280 * _1312;
    int _1330 = _1328 + _1314;
    int _1332 = ~_931;
    int _1334 = _1332 + 1;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = _1268 * _1322;
    int _1344 = _1342 + _1330;
    int _1346 = ~_953;
    int _1348 = _1346 + 1;
    int _1350 = _1212 * _1324;
    int _1352 = _1350 + _1344;
    int _1354 = ~_931;
    int _1356 = _1354 + 1;
    int _1358 = _1334 * int(_1310);
    int _1360 = _1358 + _1240;
    int _1362 = ~_925;
    int _1364 = _1362 + 1;
    float _1366 = float(uint(_1352));
    float _1368 = float(uint(_1360));
    int _1370 = ~_953;
    int _1372 = _1370 + 1;
    int _1374 = _1348 * int(_1340);
    int _1376 = _1374 + _1252;
    float _1378 = as_type<float>(_955) * _1366;
    float _1380 = as_type<float>(_1272) * _1368;
    bool _1382 = _1136 > 0.5;
    float _1384 = float(uint(_1376));
    float _1386 = trunc(_1378);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    float _1392 = float(_931);
    float _1394 = as_type<float>(_1298) * _1384;
    float _1396 = trunc(_1380);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1406 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1408 = isnan(_917);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1422 = trunc(_1394);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    int _1428 = _1364 * int(_1390);
    int _1430 = _1428 + _1352;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1434 = float(uint(_1430));
    int _1436 = int(_1310) + int(_1400);
    float _1438 = _1118 * _1120;
    float _1440 = -_241;
    int _1442 = _1196 ? as_type<int>(_1440) : as_type<int>(_241);
    float _1444 = as_type<float>(_955) * _1434;
    float _1446 = 1.0 / _1404;
    int _1448 = _1356 * _1436;
    int _1450 = _1448 + _1240;
    int _1452 = int(_1340) + int(_1426);
    float _1454 = _1112 * _1122;
    bool _1456 = uint(_1450) >= uint(_931);
    float _1458 = trunc(_1444);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = -_225;
    int _1466 = _1382 ? as_type<int>(_1464) : as_type<int>(_225);
    int _1468 = _1372 * _1452;
    int _1470 = _1468 + _1252;
    bool _1472 = !_1456;
    int _1474 = _1472 ? 0 : (-1);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    bool _1480 = uint(_1470) >= uint(_953);
    float _1482 = floor(_1438);
    bool _1484 = !_1478;
    float _1486 = _1484 ? _241 : as_type<float>(_1442);
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1498 = _1496 != 0;
    int _1500 = ~_925;
    int _1502 = _1500 + 1;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1506 = _1504 != 0;
    float _1508 = floor(_1454);
    bool _1510 = !_1494;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1516 = _1514 != 0;
    int _1518 = int(_1390) + int(_1462);
    float _1520 = float(_1240);
    float _1522 = -_1482;
    float _1524 = _1438 + _1522;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1528 = _1526 != 0;
    int _1530 = _1502 * _1518;
    int _1532 = _1530 + _1352;
    bool _1534 = _1520 >= _1392;
    bool _1536 = isnan(_1520);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(_1392);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = 1.0 / _1420;
    bool _1548 = !_1506;
    int _1550 = _1548 ? 0 : 1;
    bool _1552 = !_1528;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = 0.0;
    float _1558 = _1150;
    if (_1516)
    {
        float _1560 = in.m_76.w;
        _1556 = _1560;
    }
    float _1562 = _1556;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1566 = _1564 != 0;
    float _1568 = -_1508;
    float _1570 = _1454 + _1568;
    bool _1572 = uint(_1532) >= uint(_925);
    float _1574 = trunc(_1544);
    int _1576 = int(_1574);
    int _1578 = ~_1436;
    int _1580 = _1578 + _1474;
    int _1582 = _1580 + 1;
    bool _1584 = !_1220;
    float _1586 = _1584 ? _225 : as_type<float>(_1466);
    bool _1588 = !_1566;
    int _1590 = _1588 ? 0 : 1;
    int _1592 = _931 * _1582;
    int _1594 = _1592 + _1240;
    bool _1596 = !_1480;
    int _1598 = _1596 ? 0 : (-1);
    bool _1600 = !_1572;
    int _1602 = _1600 ? 0 : (-1);
    float _1604 = _1392 * _1198;
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1608 = _1606 != 0;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1620 = _1618 != 0;
    float _1622 = _1524 * _1392;
    int _1624 = _931 + (-1);
    bool _1626 = !_1490;
    int _1628 = _1626 ? 0 : 1;
    float _1630 = trunc(_1604);
    int _1632 = int(_1630);
    bool _1634 = !_1612;
    int _1636 = _1634 ? 0 : 1;
    bool _1638 = _931 == 0;
    float _1640 = _1562;
    bool _1642 = _1616;
    if (_1516)
    {
        float _1644 = _1562 * 3.1415927410125732421875;
        _1640 = _1644;
    }
    float _1646 = _1640;
    int _1648 = ~_1576;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    bool _1654 = !_1638;
    int _1656 = _1654 ? _1594 : (-1);
    float _1658 = _1646;
    if (_1516)
    {
        float _1660 = _1646 * 0.15915493667125701904296875;
        _1658 = _1660;
    }
    float _1662 = _1658;
    bool _1664 = !_1498;
    int _1666 = _1664 ? 0 : 1;
    int _1668 = abs(_1512);
    int _1670 = _1656 * _1652;
    float _1672 = float(_953);
    float _1674 = trunc(_1622);
    int _1676 = int(_1674);
    float _1678 = float(_1252);
    int _1680 = _1576 * _1624;
    int _1682 = _1680 + _1670;
    int _1684 = abs(_1628);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1688 = _1686 != 0;
    int _1690 = _1682 * _1668;
    int _1692 = abs(_1666);
    float _1694 = _1662;
    if (_1516)
    {
        float _1696 = _1662 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        _1694 = _1698;
    }
    float _1700 = _1694;
    int _1702 = abs(_1550);
    bool _1704 = _1678 >= _1672;
    bool _1706 = isnan(_1678);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(_1672);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    int _1716 = _1676 * _1702;
    int _1718 = _1716 + _1240;
    float _1720 = trunc(_1714);
    int _1722 = int(_1720);
    int _1724 = _1632 * _1684;
    int _1726 = _1724 + _1690;
    float _1728 = _1672 * _1198;
    int _1730 = abs(_1554);
    float _1732 = _1570 * _1672;
    int _1734 = _1718 * _1692;
    int _1736 = _1734 + _1726;
    int _1738 = ~_1452;
    int _1740 = _1738 + _1598;
    int _1742 = _1740 + 1;
    float _1744 = _1570;
    if (_1688)
    {
        float _1746 = in.m_76.x;
        _1744 = _1746;
    }
    float _1748 = _1744;
    bool _1750 = !_1608;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1676 * _1730;
    int _1756 = _1754 + _1736;
    bool _1758 = !_1616;
    int _1760 = _1758 ? 0 : 1;
    int _1762 = _953 * _1742;
    int _1764 = _1762 + _1252;
    bool _1766 = _953 == 0;
    float _1768 = trunc(_1732);
    int _1770 = int(_1768);
    if (_1516)
    {
        bool _1772 = _1700 > 0.5;
        _1642 = _1772;
    }
    bool _1774 = _1642;
    float _1776 = float(uint(_1268));
    float _1778 = float(uint(_1756));
    int _1780 = ~_1722;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    float _1786 = as_type<float>(_955) * _1776;
    bool _1788 = !_1766;
    int _1790 = _1788 ? _1764 : (-1);
    float _1792 = trunc(_1728);
    int _1794 = int(_1792);
    int _1796 = abs(_1590);
    float _1798 = as_type<float>(_1272) * _1778;
    int _1800 = _953 + (-1);
    int _1802 = _1790 * _1784;
    int _1804 = abs(_1636);
    float _1806 = trunc(_1786);
    float _1808 = precise::max(_1806, 0.0);
    uint _1810 = uint(_1808);
    int _1812 = _1722 * _1800;
    int _1814 = _1812 + _1802;
    int _1816 = abs(_1752);
    float _1818 = _1748;
    float _1820 = _1786;
    float _1822 = as_type<float>(_1816);
    if (_1688)
    {
        float _1824 = _1748 * 3.1415927410125732421875;
        _1818 = _1824;
    }
    float _1826 = _1818;
    int _1828 = ~_925;
    int _1830 = _1828 + 1;
    int _1832 = _1770 * _1796;
    int _1834 = _1832 + _1252;
    int _1836 = ~_931;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1798);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1814 * _1804;
    float _1848 = as_type<float>(_1830);
    if (_1688)
    {
        float _1850 = _1826 * 0.15915493667125701904296875;
        _1848 = _1850;
    }
    float _1852 = _1848;
    int _1854 = _1794 * _1816;
    int _1856 = _1854 + _1846;
    float _1858 = float(uint(_1718));
    int _1860 = _1830 * int(_1810);
    int _1862 = _1860 + _1268;
    int _1864 = abs(_1760);
    float _1866 = _1852;
    if (_1688)
    {
        float _1868 = _1852 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    bool _1874 = !_1620;
    int _1876 = _1874 ? 0 : 1;
    float _1878 = as_type<float>(_1272) * _1858;
    int _1880 = ~_1518;
    int _1882 = _1880 + _1602;
    int _1884 = _1882 + 1;
    float _1886 = float(uint(_1862));
    int _1888 = _1838 * int(_1844);
    int _1890 = _1888 + _1756;
    int _1892 = _925 * _1884;
    int _1894 = _1892 + _1352;
    int _1896 = abs(_1876);
    float _1898 = trunc(_1878);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = float(uint(_1890));
    float _1906 = as_type<float>(_955) * _1886;
    bool _1908 = _925 == 0;
    int _1910 = _1834 * _1864;
    int _1912 = _1910 + _1856;
    float _1914 = as_type<float>(_1272) * _1904;
    int _1916 = ~_931;
    int _1918 = _1916 + 1;
    bool _1920 = !_1908;
    int _1922 = _1920 ? _1894 : (-1);
    int _1924 = _1770 * _1896;
    int _1926 = _1924 + _1912;
    if (!_1516)
    {
        _1820 = _241;
    }
    float _1928 = _1820;
    float _1930 = trunc(_1914);
    float _1932 = precise::max(_1930, 0.0);
    uint _1934 = uint(_1932);
    float _1936 = _1928;
    if (_1516)
    {
        float _1938 = -_241;
        float _1940 = _1774 ? _1938 : _241;
        _1936 = _1940;
    }
    float _1942 = _1936;
    int _1944 = _1922 & 3;
    bool _1946 = _1944 != 0;
    int _1948 = _1922 & 3;
    bool _1950 = _1948 != 0;
    int _1952 = _1918 * int(_1902);
    int _1954 = _1952 + _1718;
    int _1956 = _1946 ? 0 : 1;
    float _1958 = trunc(_1906);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    bool _1964 = uint(_1948) > 1u;
    bool _1966 = _1948 != 3;
    float _1968 = float(uint(_1926));
    int _1970 = int(_1844) + int(_1934);
    int _1972 = ~_931;
    int _1974 = _1972 + 1;
    float _1976 = as_type<float>(_1298) * _1968;
    float _1978 = float(uint(_1954));
    int _1980 = ~_1956;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    int _1986 = _1974 * _1970;
    int _1988 = _1986 + _1756;
    int _1990 = _1984;
    bool _1992 = _1966;
    if (!_1964)
    {
        int _1994 = ~_1956;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    float _2000 = as_type<float>(_1272) * _1978;
    bool _2002 = uint(_1948) >= 2u;
    float _2004 = trunc(_1976);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    bool _2010 = _1116 > 0.5;
    int _2012 = _2002 ? 0 : 1;
    bool _2014 = uint(_1988) >= uint(_931);
    int _2016 = ~_2012;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    float _2022 = trunc(_2000);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    bool _2028 = !_2014;
    int _2030 = _2028 ? 0 : (-1);
    int _2032 = _2020;
    if (_1966)
    {
        int _2034 = ~_2012;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    int _2040 = ~_1970;
    int _2042 = _2040 + _2030;
    int _2044 = _2042 + 1;
    if (_1688)
    {
        bool _2046 = _1872 > 0.5;
        _1992 = _2046;
    }
    bool _2048 = _1992;
    int _2050 = _931 * _2044;
    int _2052 = _2050 + _1756;
    if (!_1688)
    {
        _1822 = _225;
    }
    float _2054 = _1822;
    float _2056 = -_225;
    int _2058 = _2010 ? as_type<int>(_2056) : as_type<int>(_225);
    bool _2060 = !_1638;
    int _2062 = _2060 ? _2052 : (-1);
    int _2064 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2066 = _2064 != 0;
    float _2068 = _2054;
    if (_1688)
    {
        float _2070 = -_225;
        float _2072 = _2048 ? _2070 : _225;
        _2068 = _2072;
    }
    float _2074 = _2068;
    int _2076 = _2062 & 3;
    bool _2078 = _2076 != 0;
    int _2080 = ~_953;
    int _2082 = _2080 + 1;
    bool _2084 = !_2066;
    float _2086 = _2084 ? _225 : as_type<float>(_2058);
    bool _2088 = uint(_2076) > 1u;
    int _2090 = _2082 * int(_2008);
    int _2092 = _2090 + _1926;
    int _2094 = _2062 & 3;
    bool _2096 = _2094 != 0;
    int _2098 = int(_1810) + int(_1962);
    float _2100 = float(uint(_2092));
    int _2102 = _2096 ? 0 : 1;
    int _2104 = ~_925;
    int _2106 = _2104 + 1;
    float _2108 = as_type<float>(_1298) * _2100;
    int _2110 = ~_2102;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    int _2116 = _2114;
    if (!_2088)
    {
        int _2118 = ~_2102;
        int _2120 = _2118 + 1;
        _2116 = _2120;
    }
    int _2122 = _2116;
    int _2124 = _2106 * _2098;
    int _2126 = _2124 + _1268;
    bool _2128 = uint(_2076) >= 2u;
    float _2130 = trunc(_2108);
    float _2132 = precise::max(_2130, 0.0);
    uint _2134 = uint(_2132);
    bool _2136 = !_2078;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2128 ? 0 : 1;
    bool _2142 = uint(_2126) >= uint(_925);
    bool _2144 = _2076 != 3;
    bool _2146 = _2076 != 3;
    int _2148 = int(_1902) + int(_2026);
    float _2150 = in.m_56.x;
    float _2152 = in.m_56.y;
    float _2154 = in.m_56.z;
    int _2156 = ~_931;
    int _2158 = _2156 + 1;
    bool _2160 = !_2142;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = int(_2008) + int(_2134);
    int _2166 = _2158 * _2148;
    int _2168 = _2166 + _1718;
    int _2170 = ~_2140;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    int _2176 = _2174;
    if (_2144)
    {
        int _2178 = ~_2140;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    bool _2184 = uint(_2168) >= uint(_931);
    int _2186 = ~_953;
    int _2188 = _2186 + 1;
    int _2190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2192 = _2190 != 0;
    bool _2194 = !_2146;
    int _2196 = _2194 ? 0 : (-1);
    int _2198 = _2188 * _2164;
    int _2200 = _2198 + _1926;
    bool _2202 = !_2192;
    int _2204 = _2202 ? 0 : 1;
    bool _2206 = uint(_2200) >= uint(_953);
    float _2208 = _197 * _2152;
    bool _2210 = !_2184;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2220 = _2218 != 0;
    float _2222 = fma(_195, _2150, _2208);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2226 = _2224 != 0;
    float _2228 = _209 * _2152;
    bool _2230 = !_2206;
    int _2232 = _2230 ? 0 : (-1);
    float _2234 = _203 * _2152;
    float _2236 = 1.0 / _2216;
    bool _2238 = _1114 > 0.5;
    float _2240 = fma(_201, _2150, _2234);
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2246 = -_241;
    int _2248 = _2238 ? as_type<int>(_2246) : as_type<int>(_241);
    int _2250 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2252 = _2250 != 0;
    float _2254 = fma(_207, _2150, _2228);
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2260 = 1.0 / _2244;
    float _2262 = fma(_199, _2154, _2222);
    float _2264 = fma(_205, _2154, _2240);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2274 = 1.0 / _2258;
    float _2276 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2278 = _2276 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2280 = _2268 * _1446;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2286 = _2272 * _2236;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2296 = 1.0 / _2278;
    bool _2298 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2300 = isnan(_917);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = fma(_211, _2154, _2254);
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2312;
    float _2316 = _2294 * _2260;
    bool _2318 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2320 = isnan(_917);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = -_2308;
    float _2332 = _2330 + 1.0;
    float _2334 = 1.0 / _2284;
    float _2336 = _2314 * _2274;
    bool _2338 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2340 = isnan(_917);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2346 = _2342 || _2344;
    float _2348 = float(_2346);
    float _2350 = _2328 * _2332;
    float _2352 = -_2328;
    float _2354 = _2352 + 1.0;
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2356;
    bool _2360 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2362 = isnan(_917);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2368 = _2364 || _2366;
    float _2370 = float(_2368);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2376 = -_2348;
    float _2378 = _2376 + 1.0;
    float _2380 = _2348 * _2354;
    float _2382 = _2358 * _1546;
    float _2384 = _2374 * _2296;
    bool _2386 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2388 = isnan(_917);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = _2370 * _2378;
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2402 = _917 + _2400;
    float _2404 = -_2370;
    float _2406 = _2404 + 1.0;
    bool _2408 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2410 = isnan(_917);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2416 = _2412 || _2414;
    float _2418 = float(_2416);
    float _2420 = in.m_72.w;
    float _2422 = _2290 * _2334;
    float _2424 = fma(_2280, _2402, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2426 = _2396 * _2406;
    float _2428 = -_2396;
    float _2430 = _2428 + 1.0;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2434 = _917 + _2432;
    float _2436 = -_2418;
    float _2438 = _2436 + 1.0;
    bool _2440 = !_2252;
    float _2442 = _2440 ? _241 : as_type<float>(_2248);
    float _2444 = _2418 * _2430;
    float _2446 = fma(_2286, _2434, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2448 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2450 = isnan(_917);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2456 = _2452 || _2454;
    float _2458 = float(_2456);
    float _2460 = _1416 * _2438;
    float _2462 = in.m_74.w;
    float _2464 = -_1416;
    float _2466 = _2464 + 1.0;
    bool _2468 = _1124 != 1;
    float _2470 = -_2458;
    float _2472 = _2470 + 1.0;
    float _2474 = fma(_2422, _1144, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2476 = _2458 * _2466;
    float _2478 = _2262 + _1150;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2482 = _917 + _2480;
    float _2484 = _2424 * _2476;
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2488 = _917 + _2486;
    float _2490 = fma(_2336, _2482, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2492 = _2264 + _2420;
    float _2494 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2484);
    float _2496 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2498 = _917 + _2496;
    float _2500 = _2460;
    float _2502 = _2446;
    float _2504 = _2494;
    if (!_2468)
    {
        _1558 = _1116;
    }
    float _2506 = _1558;
    float _2508 = fma(_2446, _2460, _2494);
    float _2510 = _2506;
    if (!_2468)
    {
        _2500 = _1116;
    }
    float _2512 = _2500;
    float _2514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2516 = _2512;
    if (!_2468)
    {
        _2502 = _1134;
    }
    float _2518 = _2502;
    float _2520 = fma(_2382, _2498, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2522 = _2518;
    if (!_2468)
    {
        _2504 = _1134;
    }
    float _2524 = _2504;
    float _2526 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2528 = _2524;
    if (_2468)
    {
        _2516 = _1114;
    }
    float _2530 = _2516;
    float _2532 = _2310 + _2462;
    if (_2468)
    {
        _2510 = _1114;
    }
    float _2534 = _2510;
    float _2536 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_2468)
    {
        _2522 = _1116;
    }
    float _2538 = _2522;
    float _2540 = fma(_2316, _1160, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2542 = _2540;
    if (_2468)
    {
        _2528 = _1116;
    }
    float _2544 = _2528;
    float _2546 = -_2514;
    float _2548 = fma(_2536, 2.0, _2546);
    bool _2550 = _1126 != 2;
    float _2552 = fma(_2474, _2444, _2508);
    float _2554 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2556 = fma(_2540, _2426, _2552);
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2560 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2564 = _2492 + _2562;
    float _2566 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2558);
    float _2568 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2570 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2526);
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2576 = -_2560;
    float _2578 = fma(_2568, 2.0, _2576);
    float _2580 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2582 = fma(_2554, -2.0, _2572);
    float _2584 = fma(_2490, _2398, _2556);
    float _2586 = fma(_2580, -2.0, _2574);
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2590 = _2478 + _2588;
    float _2592 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2596 = _2074 + (-0.5);
    float _2598 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2586);
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2532 + _2600;
    float _2604 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2592);
    float _2606 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2594);
    int _2608 = _2062 >> 31;
    float _2610 = -_2596;
    float _2612 = -_2598;
    float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2612);
    float _2616 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2604);
    float _2618 = -_135;
    float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2548);
    float _2622 = _2442 + 0.5;
    int _2624 = _2608 & 3;
    float _2626 = fma(_2384, _2488, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2628 = 0.0;
    if (_2550)
    {
        _2628 = _1116;
    }
    float _2630 = _2628;
    float _2632 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2620);
    float _2634 = _2630;
    if (_2550)
    {
        _2542 = _1114;
    }
    float _2636 = _2542;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2640 = _2636;
    if (!_2550)
    {
        _2640 = _1134;
    }
    float _2642 = _2640;
    float _2644 = -_135;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2578);
    if (!_2550)
    {
        _2634 = _1114;
    }
    float _2648 = _2634;
    float _2650 = fma(_2534, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2638);
    bool _2652 = _2616 >= 0.0;
    float _2654 = _1942 + 0.5;
    int _2656 = _2062 + _2624;
    float _2658 = fma(_2626, _2380, _2584);
    float _2660 = float(uint(_1834));
    float _2662 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2646);
    int _2664 = _2656 >> 2;
    float _2666 = _2086 + (-0.5);
    float _2668 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2582);
    int _2670 = _2664 << 4;
    int _2672 = _2670 + 656;
    float _2674 = as_type<float>(_1298) * _2660;
    float _2676 = -_2666;
    float _2678 = -_2668;
    float _2680 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2678);
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2684 = trunc(_2674);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    uint _2690 = uint(int(uint(_2672) >> uint(2)));
    uint _2692 = uint(int(uint(int(_2690)) >> uint(2)));
    int _2694 = int(_2690) & 3;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[int(_2692)][_2694];
    int _2698 = int(_2690) + 1;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    int _2702 = _2698 & 3;
    float _2704 = (*spvDescriptorSet0.vp_c9)._m0[int(_2700)][_2702];
    float _2706 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2710 = ~_953;
    int _2712 = _2710 + 1;
    float _2714 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2716 = -_2708;
    float _2718 = fma(_2706, 2.0, _2716);
    float _2720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2722 = _2672 + 8;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    uint _2726 = uint(int(uint(int(_2724)) >> uint(2)));
    int _2728 = int(_2724) & 3;
    float _2730 = (*spvDescriptorSet0.vp_c9)._m0[int(_2726)][_2728];
    int _2732 = int(_2724) + 1;
    uint _2734 = uint(int(uint(_2732) >> uint(2)));
    int _2736 = _2732 & 3;
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[int(_2734)][_2736];
    float _2740 = -_1432;
    float _2742 = fma(_2714, 2.0, _2740);
    float _2744 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2748 = _2674;
    if (_2652)
    {
        _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2750 = _2748;
    float _2752 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2754 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2566);
    int _2756 = _2712 * int(_2688);
    int _2758 = _2756 + _1834;
    float _2760 = fma(_2744, -2.0, _2682);
    float _2762 = fma(_2752, -2.0, _2746);
    int _2764 = as_type<int>(_2750);
    if (_2652)
    {
        float _2766 = _2750 * 5.0;
        _2764 = as_type<int>(_2766);
    }
    int _2768 = _2764;
    float _2770 = float(uint(_2758));
    float _2772 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2570);
    int _2774 = abs(_2122);
    float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9671 = as_type<float>(_2768);
        out.gl_Position.z = _9671;
    }
    float _2778 = as_type<float>(_1298) * _2770;
    float _2780 = -_2754;
    float _2782 = _2780 + 1.0;
    float _2784 = -_2772;
    float _2786 = _2784 + 1.0;
    int _2788 = abs(_2182);
    float _2790 = fma(_2520, _2350, _2658);
    float _2792 = -_2782;
    float _2794 = fma(_2792, _1942, _2662);
    float _2796 = _2720 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2798 = fma(_2786, _2074, _2614);
    int _2800 = ~_2164;
    int _2802 = _2800 + _2232;
    int _2804 = _2802 + 1;
    float _2806 = trunc(_2778);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    int _2812 = ~_2148;
    int _2814 = _2812 + _2212;
    int _2816 = _2814 + 1;
    float _2818 = _1586 + (-0.5);
    float _2820 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2760);
    out.m_84.x = _2794;
    out.m_84.y = _2798;
    int _2822 = abs(_2204);
    float _2824 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2826 = -_2796;
    float _2828 = -_2820;
    float _2830 = fma(_2826, _2818, _2828);
    float _2832 = _1486 + 0.5;
    int _2834 = abs(_2138);
    float _2836 = -_135;
    float _2838 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2742);
    int _2840 = ~_2774;
    int _2842 = _2840 + 1;
    int _2844 = _2842 + 1;
    float _2846 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2790);
    int _2848 = abs(_2196);
    int _2850 = _953 * _2804;
    int _2852 = _2850 + _1926;
    int _2854 = int(_2688) + int(_2810);
    int _2856 = _2844 * as_type<int>(_2704);
    int _2858 = ~_2834;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2866 = int(_2864);
    float _2868 = fma(_2824, _2832, _2838);
    bool _2870 = !_1766;
    int _2872 = _2870 ? _2852 : (-1);
    int _2874 = _2862 * as_type<int>(_2696);
    int _2876 = _2874 + _2856;
    int _2878 = ~_2788;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    out.m_86.x = _2846;
    int _2884 = ~_2848;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    float _2890 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2762);
    int _2892 = _1922 >> 31;
    int _2894 = _2882 * as_type<int>(_2730);
    int _2896 = _2894 + _2876;
    int _2898 = ~_2822;
    int _2900 = _2898 + 1;
    int _2902 = _2900 + 1;
    float _2904 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2606);
    int _2906 = _2892 & 3;
    int _2908 = _2888 * as_type<int>(_2738);
    int _2910 = _2908 + _2896;
    int _2912 = _2872 >> 31;
    int _2914 = _931 * _2816;
    int _2916 = _2914 + _1718;
    int _2918 = _1922 + _2906;
    int _2920 = _2910 * _2902;
    int _2922 = _2912 & 3;
    float _2924 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2650);
    bool _2926 = !_1638;
    int _2928 = _2926 ? _2916 : (-1);
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = float(uint(_2866));
    float _2936 = -_2924;
    float _2938 = _2936 + 1.0;
    bool _2940 = !_2220;
    int _2942 = _2940 ? 0 : 1;
    int _2944 = _2928 * _2822;
    int _2946 = _2944 + _2920;
    int _2948 = _2872 & 3;
    bool _2950 = _2948 != 0;
    float _2952 = 1.0 / _2934;
    int _2954 = _2872 + _2922;
    float _2956 = -_2938;
    float _2958 = fma(_1486, _2956, _2868);
    int _2960 = _2918 >> 2;
    float _2962 = _2958;
    if (_2652)
    {
        out.m_63.x = 0.0;
    }
    int _2964 = _2872 & 3;
    bool _2966 = _2964 != 0;
    int _2968 = abs(_2866);
    int _2970 = _2950 ? 0 : 1;
    int _2972 = _2960 << 4;
    int _2974 = _2972 + 368;
    bool _2976 = uint(_2964) > 1u;
    int _2978 = _2954 >> 2;
    float _2980 = float(uint(_2968));
    uint _2982 = uint(int(uint(_2974) >> uint(2)));
    uint _2984 = uint(int(uint(int(_2982)) >> uint(2)));
    int _2986 = int(_2982) & 3;
    float _2988 = (*spvDescriptorSet0.vp_c9)._m0[int(_2984)][_2986];
    int _2990 = int(_2982) + 1;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    int _2994 = _2990 & 3;
    float _2996 = (*spvDescriptorSet0.vp_c9)._m0[int(_2992)][_2994];
    int _2998 = _2978 << 4;
    int _3000 = _2998 + 800;
    int _3002 = ~_2970;
    int _3004 = _3002 + 1;
    int _3006 = _3004 + 1;
    float _3008 = 1.0 / _2980;
    int _3010 = ~_953;
    int _3012 = _3010 + 1;
    uint _3014 = uint(int(uint(_3000) >> uint(2)));
    uint _3016 = uint(int(uint(int(_3014)) >> uint(2)));
    int _3018 = int(_3014) & 3;
    float _3020 = (*spvDescriptorSet0.vp_c9)._m0[int(_3016)][_3018];
    int _3022 = int(_3014) + 1;
    uint _3024 = uint(int(uint(_3022) >> uint(2)));
    int _3026 = _3022 & 3;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[int(_3024)][_3026];
    int _3030 = _3006;
    if (!_2976)
    {
        int _3032 = ~_2970;
        int _3034 = _3032 + 1;
        _3030 = _3034;
    }
    int _3036 = _3030;
    bool _3038 = _2964 != 3;
    int _3040 = _3012 * _2854;
    int _3042 = _3040 + _1834;
    int _3044 = as_type<int>(_2952) + (-2);
    float _3046 = float(uint(_2946));
    bool _3048 = !_2966;
    int _3050 = _3048 ? 0 : 1;
    bool _3052 = uint(_2964) >= 2u;
    float _3054 = as_type<float>(_3044) * _3046;
    bool _3056 = !_1950;
    int _3058 = _3056 ? 0 : 1;
    int _3060 = _3052 ? 0 : 1;
    int _3062 = abs(_2946);
    float _3064 = trunc(_3054);
    float _3066 = precise::max(_3064, 0.0);
    uint _3068 = uint(_3066);
    bool _3070 = uint(_3042) >= uint(_953);
    int _3072 = as_type<int>(_3008) + (-2);
    int _3074 = _2974 + 8;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    uint _3078 = uint(int(uint(int(_3076)) >> uint(2)));
    int _3080 = int(_3076) & 3;
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[int(_3078)][_3080];
    int _3084 = int(_3076) + 1;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    int _3088 = _3084 & 3;
    float _3090 = (*spvDescriptorSet0.vp_c9)._m0[int(_3086)][_3088];
    int _3092 = ~_3060;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    int _3098 = _3096;
    if (_3038)
    {
        int _3100 = ~_3060;
        int _3102 = _3100 + 1;
        _3098 = _3102;
    }
    int _3104 = _3098;
    float _3106 = float(uint(_3062));
    bool _3108 = _2964 != 3;
    int _3110 = _3000 + 8;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    uint _3114 = uint(int(uint(int(_3112)) >> uint(2)));
    int _3116 = int(_3112) & 3;
    float _3118 = (*spvDescriptorSet0.vp_c9)._m0[int(_3114)][_3116];
    int _3120 = int(_3112) + 1;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    int _3124 = _3120 & 3;
    float _3126 = (*spvDescriptorSet0.vp_c9)._m0[int(_3122)][_3124];
    float _3128 = as_type<float>(_3072) * _3106;
    bool _3130 = _1948 != 3;
    int _3132 = ~_2866;
    int _3134 = _3132 + 1;
    float _3136 = trunc(_3128);
    float _3138 = precise::max(_3136, 0.0);
    uint _3140 = uint(_3138);
    bool _3142 = !_3070;
    int _3144 = _3142 ? 0 : (-1);
    bool _3146 = !_3130;
    int _3148 = _3146 ? 0 : (-1);
    int _3150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3152 = _3150 != 0;
    int _3154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3156 = _3154 != 0;
    int _3158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3160 = _3158 != 0;
    int _3162 = ~_2098;
    int _3164 = _3162 + _2162;
    int _3166 = _3164 + 1;
    int _3168 = _3134 * int(_3068);
    int _3170 = _3168 + _2946;
    int _3172 = abs(_1998);
    int _3174 = ~_2968;
    int _3176 = _3174 + 1;
    int _3178 = _925 * _3166;
    int _3180 = _3178 + _1268;
    int _3182 = ~_3172;
    int _3184 = _3182 + 1;
    int _3186 = _3184 + 1;
    float _3188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3190 = abs(_3036);
    float _3192 = float(uint(_3170));
    int _3194 = _3186 * as_type<int>(_2996);
    int _3196 = ~_3190;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    float _3202 = as_type<float>(_3044) * _3192;
    int _3204 = ~_2854;
    int _3206 = _3204 + _3144;
    int _3208 = _3206 + 1;
    int _3210 = _3176 * int(_3140);
    int _3212 = _3210 + _3062;
    int _3214 = abs(_3050);
    int _3216 = _3200 * as_type<int>(_3028);
    int _3218 = abs(_3058);
    float _3220 = trunc(_3202);
    float _3222 = precise::max(_3220, 0.0);
    uint _3224 = uint(_3222);
    float _3226 = float(uint(_3212));
    int _3228 = _953 * _3208;
    int _3230 = _3228 + _1834;
    int _3232 = abs(_2038);
    int _3234 = ~_3218;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    float _3240 = as_type<float>(_3072) * _3226;
    int _3242 = ~_3214;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    int _3248 = abs(_3104);
    int _3250 = _3238 * as_type<int>(_2988);
    int _3252 = _3250 + _3194;
    float _3254 = trunc(_3240);
    float _3256 = precise::max(_3254, 0.0);
    uint _3258 = uint(_3256);
    int _3260 = ~_3232;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    int _3266 = _3246 * as_type<int>(_3020);
    int _3268 = _3266 + _3216;
    int _3270 = ~_3248;
    int _3272 = _3270 + 1;
    int _3274 = _3272 + 1;
    int _3276 = abs(_3148);
    int _3278 = _3264 * as_type<int>(_3082);
    int _3280 = _3278 + _3252;
    bool _3282 = !_3108;
    int _3284 = _3282 ? 0 : (-1);
    int _3286 = _3274 * as_type<int>(_3118);
    int _3288 = _3286 + _3268;
    int _3290 = ~_2866;
    int _3292 = _3290 + 1;
    int _3294 = int(_3068) + int(_3224);
    int _3296 = ~_3276;
    int _3298 = _3296 + 1;
    int _3300 = _3298 + 1;
    int _3302 = abs(_3284);
    int _3304 = _3292 * _3294;
    int _3306 = _3304 + _2946;
    int _3308 = abs(_2942);
    int _3310 = _3300 * as_type<int>(_3090);
    int _3312 = _3310 + _3280;
    bool _3314 = _925 == 0;
    int _3316 = ~_3302;
    int _3318 = _3316 + 1;
    int _3320 = _3318 + 1;
    int _3322 = int(_3140) + int(_3258);
    int _3324 = ~_2968;
    int _3326 = _3324 + 1;
    int _3328 = _3320 * as_type<int>(_3126);
    int _3330 = _3328 + _3288;
    bool _3332 = !_3314;
    int _3334 = _3332 ? _3180 : (-1);
    int _3336 = _3326 * _3322;
    int _3338 = _3336 + _3062;
    bool _3340 = uint(_3306) >= uint(_2866);
    int _3342 = ~_3308;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3350 = !_3340;
    int _3352 = _3350 ? 0 : (-1);
    bool _3354 = uint(_3338) >= uint(_2968);
    int _3356 = _3312 * _3346;
    int _3358 = ~_3294;
    int _3360 = _3358 + _3352;
    int _3362 = _3360 + 1;
    float _3364 = -_135;
    float _3366 = fma(_3364, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2718);
    bool _3368 = !_2226;
    int _3370 = _3368 ? 0 : 1;
    int _3372 = _3334 * _3308;
    int _3374 = _3372 + _3356;
    int _3376 = _2946 ^ _2866;
    bool _3378 = !_3354;
    int _3380 = _3378 ? 0 : (-1);
    int _3382 = abs(_3370);
    int _3384 = _2866 * _3362;
    int _3386 = _3384 + _2946;
    uint _3388 = uint(int(uint(_3376) >> uint(31)));
    float _3390 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3392 = _2866 == 0;
    int _3394 = ~_3380;
    int _3396 = _3322 + _3394;
    int _3398 = _3396 + 1;
    int _3400 = ~int(_3388);
    int _3402 = _3400 + 1;
    bool _3404 = !_3392;
    int _3406 = _3404 ? _3386 : (-1);
    int _3408 = _3398 ^ _3402;
    float _3410 = float(_3406);
    int _3412 = ~_3382;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    bool _3418 = _2866 == 0;
    int _3420 = ~_3402;
    int _3422 = _3420 + _3408;
    int _3424 = _3422 + 1;
    float _3426 = fma(_3390, _3410, _3366);
    bool _3428 = !_1766;
    int _3430 = _3428 ? _3230 : (-1);
    int _3432 = _3330 * _3416;
    bool _3434 = !_3418;
    int _3436 = _3434 ? _3424 : (-1);
    float _3438 = _1248 + 0.5;
    int _3440 = _3430 * _3382;
    int _3442 = _3440 + _3432;
    float _3444 = float(_3436);
    float _3446 = _3188 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3448 = fma(_3390, _3438, _3426);
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3452 = -_2890;
    float _3454 = fma(_3446, _3444, _3452);
    float _3456 = _1244 + (-0.5);
    float _3458 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3460 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3450);
    float _3462 = -_3446;
    float _3464 = fma(_3462, _3456, _3454);
    float _3466 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3458);
    float _3468 = _2564 * _2564;
    float _3470 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3460);
    float _3472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3474 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3466);
    float _3476 = -_3470;
    float _3478 = _3476 + 1.0;
    float _3480 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3472);
    float _3482 = -_3474;
    float _3484 = _3482 + 1.0;
    float _3486 = fma(_2590, _2590, _3468);
    float _3488 = -_3478;
    float _3490 = fma(_1248, _3488, _3448);
    float _3492 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3480);
    float _3494 = -_3484;
    float _3496 = fma(_2442, _3494, _2632);
    float _3498 = fma(_2602, _2602, _3486);
    float _3500 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3502 = -_3492;
    float _3504 = _3502 + 1.0;
    float _3506 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3508 = rsqrt(_3498);
    float _3510 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3500);
    float _3512 = fma(_1586, _2932, _2830);
    float _3514 = float(_3374);
    float _3516 = fma(_2086, _3504, _2680);
    float _3518 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3510);
    float _3520 = _3506 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3522 = float(_3442);
    out.m_88.x = _3514;
    float _3524 = -_3518;
    float _3526 = _3524 + 1.0;
    bool _3528 = !_3156;
    int _3530 = _3528 ? 0 : 1;
    out.m_90.x = _3496;
    out.m_90.y = _3516;
    out.m_90.z = _2958;
    out.m_90.w = _3512;
    float _3532 = fma(_1244, _3526, _3464);
    bool _3534 = !_3160;
    int _3536 = _3534 ? 0 : 1;
    float _3538 = _3520 * _3508;
    out.m_88.w = _3522;
    bool _3540 = !_3152;
    int _3542 = _3540 ? 0 : 1;
    float _3544 = _2590 * _3538;
    out.m_92.x = _3490;
    out.m_92.y = _3532;
    float _3546 = _2564 * _3538;
    if (_2652)
    {
        return out;
    }
    float _3548 = -_3546;
    float _3550 = _2492 + _3548;
    float _3552 = _2602 * _3538;
    float _3554 = -_3544;
    float _3556 = _2478 + _3554;
    float _3558 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3560 = _3550 + _3558;
    float _3562 = -_3552;
    float _3564 = _2532 + _3562;
    float _3566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3568 = _3556 + _3566;
    float _3570 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3574 = _3564 + _3572;
    float _3576 = fma(_3568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3570);
    float _3578 = fma(_3574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3576);
    bool _3580 = _3578 >= 0.0;
    float _3582 = _3568;
    float _3584 = _3564;
    if (_3580)
    {
        _2962 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3586 = _2962;
    int _3588 = as_type<int>(_3586);
    if (_3580)
    {
        out.m_63.x = 0.0;
    }
    if (_3580)
    {
        float _3590 = _3586 * 5.0;
        _3588 = as_type<int>(_3590);
    }
    int _3592 = _3588;
    if (_3580)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10850 = as_type<float>(_3592);
        out.gl_Position.z = _10850;
    }
    if (_3580)
    {
        return out;
    }
    float _3594 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3596 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3598 = floor(_3594);
    float _3600 = floor(_3596);
    float _3602 = -_3598;
    float _3604 = _3594 + _3602;
    float _3606 = -_3600;
    float _3608 = _3596 + _3606;
    float2 _10886 = float2(_3604, _3608);
    float _3610 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10886, float2(0.0), isnan(_10886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10886, float2(0.0), isnan(_10886)), level(0.0)).x;
    float _3612 = _1134 * 2.0;
    float _3614 = _1114 * 2.0;
    float _3616 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3618 = log2(_3616);
    float _3620 = _1116 + _1114;
    float _3622 = _1116 * 2.0;
    int _3624 = abs(_3542);
    float _3626 = -_3546;
    float _3628 = _2564 + _3626;
    float _3630 = _3620 + (-1.0);
    float _3632 = -_3544;
    float _3634 = _2590 + _3632;
    float _3636 = -_3552;
    float _3638 = _2602 + _3636;
    float _3640 = floor(_3612);
    float _3642 = _3628 * _3628;
    int _3644 = abs(_3536);
    float _3646 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3648 = floor(_3614);
    float _3650 = _3618 * _135;
    bool _3652 = _3640 > 0.0;
    float _3654 = floor(_3622);
    bool _3656 = _3640 >= 0.0;
    bool _3658 = isnan(_3640);
    bool _3660 = _3656 || _3658;
    bool _3662 = isnan(0.0);
    bool _3664 = _3660 || _3662;
    float _3666 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3668 = _1116 + _1134;
    float _3670 = _1116 + (-0.5);
    int _3672 = _3664 ? 0 : 1;
    float _3674 = _3668 + (-1.0);
    bool _3676 = _3648 >= 0.0;
    bool _3678 = isnan(_3648);
    bool _3680 = _3676 || _3678;
    bool _3682 = isnan(0.0);
    bool _3684 = _3680 || _3682;
    float _3686 = exp2(_3650);
    int _3688 = ~_3672;
    int _3690 = _3688 + 1;
    int _3692 = _3690 + 1;
    float _3694 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3696 = _3692;
    int _3698 = 2;
    if (!_3652)
    {
        int _3700 = ~_3672;
        int _3702 = _3700 + 1;
        _3696 = _3702;
    }
    int _3704 = _3696;
    float _3706 = _3550 + _3694;
    bool _3708 = _3648 > 0.0;
    bool _3710 = _3654 > 0.0;
    float _3712 = fma(_3674, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _3714 = _3654 >= 0.0;
    bool _3716 = isnan(_3654);
    bool _3718 = _3714 || _3716;
    bool _3720 = isnan(0.0);
    bool _3722 = _3718 || _3720;
    float _3724 = in.m_94.x;
    float _3726 = in.m_94.y;
    float _3728 = in.m_94.z;
    float _3730 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3732 = 1.0 + _3730;
    int _3734 = _3684 ? 0 : 1;
    float _3736 = float(_3704);
    float _3738 = 1.0 / _3732;
    float _3740 = float(_3624);
    float _3742 = -_3686;
    float _3744 = _3742 + 1.0;
    int _3746 = ~_3734;
    int _3748 = _3746 + 1;
    int _3750 = _3748 + 1;
    int _3752 = _3750;
    if (!_3708)
    {
        int _3754 = ~_3734;
        int _3756 = _3754 + 1;
        _3752 = _3756;
    }
    int _3758 = _3752;
    float _3760 = _3740 * _3736;
    bool _3762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3764 = isnan(1.0);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3770 = _3766 || _3768;
    float _3772 = fma(_3634, _3634, _3642);
    int _3774 = abs(_3530);
    float _3776 = _3760 * (-2.0);
    float _3778 = float(_3758);
    float _3780 = fma(_3638, _3638, _3772);
    float _3782 = float(_3774);
    float _3784 = fma(_3666, _3776, _3666);
    bool _3786 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3788 = isnan(0.0);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3794 = _3790 || _3792;
    float _3796 = _3782 * _3778;
    float _3798 = _3794 ? _3744 : 0.0;
    float _3800 = _1114 + (-0.5);
    float _3802 = fma(_3776, _3724, _3724);
    float _3804 = _1114 + _1134;
    float _3806 = _1134 + (-0.5);
    if (_3770)
    {
        float _3808 = _3798 * _3738;
        _145 = _3808;
    }
    float _3810 = _145;
    float _3812 = fma(_3800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3802);
    int _3814 = _3722 ? 0 : 1;
    float _3816 = _3796 * (-2.0);
    float _3818 = _3804 + (-1.0);
    float _3820 = fma(_3784, _3810, _3812);
    int _3822 = ~_3814;
    int _3824 = _3822 + 1;
    int _3826 = _3824 + 1;
    float _3828 = fma(_3712, _3816, _3712);
    float _3830 = fma(_3816, _3726, _3726);
    int _3832 = _3826;
    if (!_3710)
    {
        int _3834 = ~_3814;
        int _3836 = _3834 + 1;
        _3832 = _3836;
    }
    int _3838 = _3832;
    float _3840 = _3820 * 0.15915493667125701904296875;
    float _3842 = fma(_3670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3830);
    float _3844 = float(_3838);
    float _3846 = _3840 * 6.283185482025146484375;
    float _3848 = sin(_3846);
    float _3850 = float(_3644);
    float _3852 = fma(_3828, _3810, _3842);
    float _3854 = _3850 * _3844;
    float _3856 = _3852 * 0.15915493667125701904296875;
    float _3858 = _3840 * 6.283185482025146484375;
    float _3860 = cos(_3858);
    float _3862 = _3854 * (-2.0);
    float _3864 = fma(_3818, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3866 = fma(_3862, _3728, _3728);
    float _3868 = fma(_3864, _3862, _3864);
    float _3870 = _3856 * 6.283185482025146484375;
    float _3872 = sin(_3870);
    float _3874 = fma(_3806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3866);
    float _3876 = fma(_3868, _3810, _3874);
    float _3878 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3880 = _3856 * 6.283185482025146484375;
    float _3882 = cos(_3880);
    float _3884 = _3876 * 0.15915493667125701904296875;
    float _3886 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3878);
    float _3888 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3886);
    float _3890 = sqrt(_3780);
    float _3892 = _3848 * _3872;
    float _3894 = _3888 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3896 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3898 = _3860 * _3872;
    float _3900 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3896);
    float _3902 = 1.0 / _3894;
    float _3904 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3900);
    float _3906 = _3904 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3908 = _3884 * 6.283185482025146484375;
    float _3910 = sin(_3908);
    float _3912 = _3860 * _3882;
    float _3914 = _3508 * _3890;
    float _3916 = _3906 + _3894;
    float _3918 = _3914 * _3646;
    float _3920 = _3506 * _3914;
    float _3922 = _3884 * 6.283185482025146484375;
    float _3924 = cos(_3922);
    float _3926 = _3916 * _3902;
    float _3928 = _3926 * 0.5;
    float _3930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3932 = _3914 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3934 = _3932 * 0.5;
    float _3936 = _3930 * _3918;
    float _3938 = fma(_3910, _3912, _3892);
    float _3940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3942 = fma(_3928, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3940);
    float _3944 = fma(_3910, _3892, _3912);
    float _3946 = _3848 * _3882;
    float _3948 = 1.0 / _3942;
    float _3950 = -_3898;
    float _3952 = fma(_3910, _3946, _3950);
    float _3954 = _3860 * _3924;
    float _3956 = _3882 * _3924;
    float _3958 = _3848 * _3924;
    float _3960 = _3872 * _3924;
    float _3962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3964 = -_3946;
    float _3966 = fma(_3910, _3898, _3964);
    float _3968 = -_3936;
    float _3970 = _3910 * _3968;
    float _3972 = _3958 * _3936;
    float _3974 = _3962 * _3920;
    float _3976 = _3706 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3978 = _3954 * _3936;
    float _3980 = _3706 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3982 = fma(_3956, _3974, _3970);
    float _3984 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3976);
    float _3986 = fma(_3952, _3974, _3972);
    float _3988 = fma(_3938, _3974, _3978);
    float _3990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3992 = _3948 * _3990;
    float _3994 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3984);
    float _3996 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3980);
    float _3998 = fma(_3966, _3934, _3988);
    float _4000 = fma(_3960, _3934, _3982);
    bool _4002 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4004 = _3994 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4006 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4008 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4010 = fma(_3944, _3934, _3986);
    float _4012 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3996);
    float _4014 = trunc(_4004);
    int _4016 = int(_4014);
    float _4018 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4020 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4008);
    float _4022 = _4012 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4024 = !_4002;
    int _4026 = _4024 ? 0 : 1;
    float _4028 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4018);
    float _4030 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4020);
    int _4032 = as_type<int>(_3998);
    int _4034 = as_type<int>(_4010);
    float _4036 = _4004;
    if (!_4002)
    {
        _3698 = 1;
    }
    int _4038 = _3698;
    float _4040 = trunc(_4022);
    int _4042 = int(_4040);
    int _4044 = _4038;
    if (!_4006)
    {
        _4044 = _4026;
    }
    int _4046 = _4044;
    float _4048 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4028);
    float _4050 = _4030 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _4052 = _4046 << 6;
    float _4054 = _4048 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4056 = _2532 + _4050;
    int _4058 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4060 = _4016 + _4058;
    int _4062 = _4060 + 1;
    int _4064 = _4052 + 56;
    uint _4066 = uint(int(uint(_4064) >> uint(2)));
    uint _4068 = uint(int(uint(int(_4066)) >> uint(2)));
    int _4070 = int(_4066) & 3;
    float _4072 = (*spvDescriptorSet0.vp_c15)._m0[int(_4068)][_4070];
    int _4074 = int(_4066) + 1;
    uint _4076 = uint(int(uint(_4074) >> uint(2)));
    int _4078 = _4074 & 3;
    float _4080 = (*spvDescriptorSet0.vp_c15)._m0[int(_4076)][_4078];
    float _4082 = _2478 + _4054;
    float _4084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4086 = _4056 + _4084;
    bool _4088 = _4062 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4090 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4092 = _4082 + _4090;
    float _4094 = _4086 * _4086;
    int _4096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4098 = _4042 + _4096;
    int _4100 = _4098 + 1;
    int _4102 = _4052 + 48;
    uint _4104 = uint(int(uint(_4102) >> uint(2)));
    uint _4106 = uint(int(uint(int(_4104)) >> uint(2)));
    int _4108 = int(_4104) & 3;
    float _4110 = (*spvDescriptorSet0.vp_c15)._m0[int(_4106)][_4108];
    int _4112 = int(_4104) + 1;
    uint _4114 = uint(int(uint(_4112) >> uint(2)));
    int _4116 = _4112 & 3;
    float _4118 = (*spvDescriptorSet0.vp_c15)._m0[int(_4114)][_4116];
    float _4120 = fma(_4092, _4092, _4094);
    int _4122 = _4062 | _4100;
    float _4124 = sqrt(_4120);
    bool _4126 = _4122 < 0;
    bool _4128 = _4126 || _4088;
    int _4130 = _4052 + 64;
    uint _4132 = uint(int(uint(_4130) >> uint(2)));
    uint _4134 = uint(int(uint(int(_4132)) >> uint(2)));
    int _4136 = int(_4132) & 3;
    float _4138 = (*spvDescriptorSet0.vp_c15)._m0[int(_4134)][_4136];
    int _4140 = int(_4132) + 1;
    uint _4142 = uint(int(uint(_4140) >> uint(2)));
    int _4144 = _4140 & 3;
    float _4146 = (*spvDescriptorSet0.vp_c15)._m0[int(_4142)][_4144];
    float _4148 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _4150 = _4100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4152 = _4150 || _4128;
    float _4154 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4148);
    int _4156 = _4052 + 72;
    uint _4158 = uint(int(uint(_4156) >> uint(2)));
    uint _4160 = uint(int(uint(int(_4158)) >> uint(2)));
    int _4162 = int(_4158) & 3;
    float _4164 = (*spvDescriptorSet0.vp_c15)._m0[int(_4160)][_4162];
    int _4166 = int(_4158) + 1;
    uint _4168 = uint(int(uint(_4166) >> uint(2)));
    int _4170 = _4166 & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    float _4174 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4154);
    float _4176 = _4174 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _4178 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4180 = _4052 + 96;
    uint _4182 = uint(int(uint(_4180) >> uint(2)));
    uint _4184 = uint(int(uint(int(_4182)) >> uint(2)));
    int _4186 = int(_4182) & 3;
    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[int(_4184)][_4186];
    int _4190 = int(_4182) + 1;
    uint _4192 = uint(int(uint(_4190) >> uint(2)));
    int _4194 = _4190 & 3;
    float _4196 = (*spvDescriptorSet0.vp_c15)._m0[int(_4192)][_4194];
    int _4198 = _4062;
    int _4200 = as_type<int>(_4174);
    float _4202 = _4094;
    float _4204 = _4082;
    float _4206 = _4056;
    if (!_4152)
    {
        int _4208 = _4100 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4210 = _4208 + _4062;
        _4032 = _4210;
    }
    int _4212 = _4032;
    float _4214 = _2492 + _4176;
    if (!_4152)
    {
        int _4216 = _4212 << 2;
        _4034 = _4216;
    }
    int _4218 = _4034;
    int _4220 = _4052 + 104;
    uint _4222 = uint(int(uint(_4220) >> uint(2)));
    uint _4224 = uint(int(uint(int(_4222)) >> uint(2)));
    int _4226 = int(_4222) & 3;
    float _4228 = (*spvDescriptorSet0.vp_c15)._m0[int(_4224)][_4226];
    int _4230 = int(_4222) + 1;
    uint _4232 = uint(int(uint(_4230) >> uint(2)));
    int _4234 = _4230 & 3;
    float _4236 = (*spvDescriptorSet0.vp_c15)._m0[int(_4232)][_4234];
    float _4238 = as_type<float>(_4218);
    if (!_4152)
    {
        uint _4240 = uint(int(uint(_4212) >> uint(2)));
        _4198 = int(_4240);
    }
    int _4242 = _4198;
    float _4244 = as_type<float>(_4242);
    if (!_4152)
    {
        int _4246 = 12 & _4218;
        _4200 = _4246;
    }
    int _4248 = _4200;
    if (!_4178)
    {
        _4202 = _4082;
    }
    float _4250 = _4202;
    float _4252 = _4250;
    if (!_4152)
    {
        int _4254 = _4242 << 4;
        int _4256 = _4254 + _4248;
        _4244 = as_type<float>(_4256);
    }
    float _4258 = _4244;
    if (!_4178)
    {
        _4204 = _4214;
    }
    float _4260 = _4204;
    bool _4262 = !_4178;
    float _4264 = _4260;
    if (!_4262)
    {
        float _4266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4270 = _4124 + _4268;
        float _4272 = _4214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4274 = rsqrt(_4120);
        float _4276 = _4270 * _4266;
        float _4278 = _4276 * 0.15915493667125701904296875;
        float _4280 = _4278 * 6.283185482025146484375;
        float _4282 = cos(_4280);
        float _4284 = _4278 * 6.283185482025146484375;
        float _4286 = sin(_4284);
        float _4288 = _4282 + (-1.0);
        float _4290 = fma(_4286, _4272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4292 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4294 = _4274 * _4290;
        float _4296 = fma(_4214, _4282, _4292);
        float _4298 = fma(_4092, _4294, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4300 = fma(_4086, _4294, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4264 = _4296;
        _4252 = _4298;
        _4206 = _4300;
        _4238 = _4288;
    }
    float _4302 = _4264;
    float _4304 = _4252;
    float _4306 = _4206;
    float _4308 = _4238;
    float _4310 = -_2492;
    float _4312 = _4310 + _4302;
    int _4314 = _4052 + 80;
    uint _4316 = uint(int(uint(_4314) >> uint(2)));
    uint _4318 = uint(int(uint(int(_4316)) >> uint(2)));
    int _4320 = int(_4316) & 3;
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[int(_4318)][_4320];
    int _4324 = int(_4316) + 1;
    uint _4326 = uint(int(uint(_4324) >> uint(2)));
    int _4328 = _4324 & 3;
    float _4330 = (*spvDescriptorSet0.vp_c15)._m0[int(_4326)][_4328];
    float _4332 = -_2478;
    float _4334 = _4332 + _4304;
    float _4336 = -_2532;
    float _4338 = _4336 + _4306;
    float _4340 = _4312 * _4312;
    float _4342 = _3706 * _4196;
    float _4344 = _4308;
    float _4346 = _4340;
    float _4348 = _4304;
    float _4350 = _4302;
    float _4352 = _4306;
    if (!_4152)
    {
        float _4354 = floor(_4004);
        _4344 = _4354;
    }
    float _4356 = _4344;
    float _4358 = _3706 * _4146;
    float _4360 = fma(_4334, _4334, _4340);
    int _4362 = _4052 + 88;
    uint _4364 = uint(int(uint(_4362) >> uint(2)));
    uint _4366 = uint(int(uint(int(_4364)) >> uint(2)));
    int _4368 = int(_4364) & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    int _4372 = int(_4364) + 1;
    uint _4374 = uint(int(uint(_4372) >> uint(2)));
    int _4376 = _4372 & 3;
    float _4378 = (*spvDescriptorSet0.vp_c15)._m0[int(_4374)][_4376];
    float _4380 = fma(_3556, _4188, _4342);
    float _4382 = fma(_3556, _4138, _4358);
    float _4384 = fma(_4338, _4338, _4360);
    float _4386 = fma(_3564, _4228, _4380);
    if (!_4152)
    {
        float _4388 = floor(_4022);
        _4346 = _4388;
    }
    float _4390 = _4346;
    bool _4392 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4394 = isnan(0.5);
    bool _4396 = _4392 || _4394;
    bool _4398 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4400 = _4396 || _4398;
    float _4402 = _4258;
    float _4404 = _4390;
    if (!_4152)
    {
        int _4406 = as_type<int>(_4258) + 400;
        uint _4408 = uint(int(uint(_4406) >> uint(2)));
        uint _4410 = uint(int(uint(int(_4408)) >> uint(2)));
        int _4412 = int(_4408) & 3;
        float _4414 = (*spvDescriptorSet0.vp_c15)._m0[int(_4410)][_4412];
        _4402 = _4414;
    }
    float _4416 = _4402;
    float _4418 = _4386 + _4236;
    float _4420 = _3706 * _4118;
    float _4422 = fma(_3564, _4164, _4382);
    float _4424 = sqrt(_4384);
    float _4426 = fma(_3556, _4110, _4420);
    float _4428 = fma(_3564, _4072, _4426);
    float _4430 = 1.0 / _4418;
    bool _4432 = _4424 > 0.0;
    bool _4434 = !_4432;
    if (!_4434)
    {
        float _4436 = _245 * _245;
        float _4438 = rsqrt(_4384);
        float _4440 = fma(_237, _237, _4436);
        float _4442 = fma(_247, _247, _4440);
        float _4444 = sqrt(_4442);
        float _4446 = _4334 * _4438;
        float _4448 = _4312 * _4438;
        float _4450 = _4338 * _4438;
        bool _4452 = _4444 > 0.0;
        bool _4454 = !_4452;
        if (!_4454)
        {
            float _4456 = rsqrt(_4442);
            float _4458 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4460 = _245 * _4456;
            float _4462 = _237 * _4456;
            float _4464 = _247 * _4456;
            float _4466 = _4448 * _4460;
            float _4468 = fma(_4446, _4462, _4466);
            float _4470 = _4458 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4472 = fma(_4450, _4464, _4468);
            float _4474 = _4472 * _4470;
            float _4476 = fma(_237, _4474, _4304);
            float _4478 = fma(_245, _4474, _4302);
            float _4480 = fma(_247, _4474, _4306);
            _4348 = _4476;
            _4350 = _4478;
            _4352 = _4480;
        }
    }
    float _4482 = _4348;
    float _4484 = _4350;
    float _4486 = _4352;
    float _4488 = -_3544;
    float _4490 = _4488 + _4482;
    float _4492 = -_3546;
    float _4494 = _4492 + _4484;
    float _4496 = -_3552;
    float _4498 = _4496 + _4486;
    float _4500 = _4428 + _4080;
    float _4502 = _4422 + _4172;
    float _4504 = _4494;
    float _4506 = _4490;
    float _4508 = _4498;
    float _4510 = _4502;
    if (!_4400)
    {
        float _4512 = _3560 * _3560;
        float _4514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4516 = -_2532;
        float _4518 = _4516 + _4486;
        float _4520 = -_2492;
        float _4522 = _4520 + _4484;
        float _4524 = fma(_3568, _3568, _4512);
        float _4526 = -_2478;
        float _4528 = _4526 + _4482;
        float _4530 = fma(_3574, _3574, _4524);
        float _4532 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4534 = sqrt(_4530);
        float _4536 = 1.0 / _3914;
        float _4538 = precise::min(_4534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4540 = _4538 * _4514;
        float _4542 = _4532 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4544 = _4540 * _4536;
        float _4546 = _4542 * _4544;
        float _4548 = _4518 * _4544;
        float _4550 = fma(_4522, _4546, _3550);
        float _4552 = fma(_4528, _4546, _3556);
        float _4554 = fma(_4542, _4548, _3564);
        _4504 = _4550;
        _4506 = _4552;
        _4508 = _4554;
    }
    float _4556 = _4504;
    float _4558 = _4506;
    float _4560 = _4508;
    float _4562 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4564 = _4500 * _4430;
    float _4566 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4568 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4570 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4562);
    float _4572 = _4502 * _4430;
    float _4574 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4566);
    bool _4576 = _4564 >= 0.0;
    float _4578 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4570);
    float _4580 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4582 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4584 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4574);
    float _4586 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4588 = _4564 <= 1.0;
    bool _4590 = _4588 && _4576;
    float _4592 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4580);
    float _4594 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4582);
    float _4596 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4598 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4600 = _4572 >= 0.0;
    bool _4602 = _4600 && _4590;
    float _4604 = _4592 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4606 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4594);
    float _4608 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4598);
    bool _4610 = _4572 <= 1.0;
    bool _4612 = _4610 && _4602;
    float _4614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4616 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4618 = _4606 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4620 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4608);
    float _4622 = _3706 * _4330;
    float _4624 = -_4616;
    float _4626 = fma(_4624, _4614, 1.0);
    float _4628 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4630 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4632 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4634 = fma(_3556, _4322, _4622);
    float _4636 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4628);
    float _4638 = 1.0 / _4630;
    float _4640 = _4594;
    float _4642 = _4592;
    float _4644 = _4630;
    if (_4612)
    {
        float _4646 = float(_4046);
        _4640 = _4646;
    }
    float _4648 = _4640;
    float _4650 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4632);
    float _4652 = fma(_3564, _4370, _4634);
    float _4654 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4636);
    if (!_4152)
    {
        float _4656 = -_4390;
        float _4658 = _4022 + _4656;
        _4404 = _4658;
    }
    float _4660 = _4404;
    float _4662 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4650);
    float _4664 = _4652 + _4378;
    float _4666 = log2(_4626);
    float _4668 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4654);
    float _4670 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4662);
    if (!_4152)
    {
        float _4672 = -_4356;
        float _4674 = _4004 + _4672;
        _4510 = _4674;
    }
    float _4676 = _4510;
    float _4678 = _4664 * _4430;
    float _4680 = _4422;
    if (!_4152)
    {
        float _4682 = rint(_4416);
        float _4684 = precise::max(_4682, 0.0);
        uint _4686 = uint(_4684);
        uint _4688 = clamp(_4686, 0u, 65535u);
        _4680 = as_type<float>(_4688);
    }
    float _4690 = _4680;
    float _4692 = _4668 * _4638;
    float _4694 = _4670 * _4638;
    float _4696 = fma(_4692, 0.5, 0.5);
    float _4698 = fma(_4694, -0.5, 0.5);
    float _4700 = _4648;
    if (_4612)
    {
        float _4702 = rint(_4648);
        float _4704 = precise::max(_4702, 0.0);
        uint _4706 = uint(_4704);
        uint _4708 = clamp(_4706, 0u, 65535u);
        _4700 = as_type<float>(_4708);
    }
    float _4710 = _4700;
    float _4712 = _4666 * 0.693147182464599609375;
    float _4714 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4716 = _4660;
    float _4718 = _4714;
    if (!_4152)
    {
        float3 _12635 = float3(_4676, _4660, float(as_type<int>(_4690)));
        float3 _12639 = select(_12635, float3(0.0), isnan(_12635));
        float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12639.xy, uint(rint(_12639.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12639.xy, uint(rint(_12639.z)), level(0.0)).x;
        _4716 = _4720;
    }
    float _4722 = _4716;
    float _4724 = _4712;
    if (_4612)
    {
        float3 _12654 = float3(_4564, _4572, float(as_type<int>(_4710)));
        float3 _12656 = select(_12654, float3(0.0), isnan(_12654));
        float _4726 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12656.xy, uint(rint(_12656.z)), _4678, level(0.0));
        _4724 = _4726;
    }
    float _4728 = _4724;
    float3 _12666 = float3(_4696, _4698, _4714);
    float _4730 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12666, float3(0.0), isnan(_12666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12666, float3(0.0), isnan(_12666)), level(0.0)).x;
    float3 _12675 = float3(_4696, _4698, _4714);
    float4 _4733 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12675, float3(0.0), isnan(_12675)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12675, float3(0.0), isnan(_12675)), level(0.0)).xyzw;
    float _4735 = _4733.x;
    float _4737 = _4733.y;
    float _4739 = _4733.z;
    float _4741 = _4733.w;
    bool _4743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4745 = isnan(0.5);
    bool _4747 = _4743 || _4745;
    bool _4749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4751 = _4747 || _4749;
    if (_4152)
    {
        _3582 = 1.0;
    }
    float _4753 = _3582;
    float _4755 = _4753;
    if (_4751)
    {
        _4642 = 1.0;
    }
    float _4757 = _4642;
    float _4759 = _4757;
    float _4761 = _4737;
    float _4763 = _4735;
    if (!_4751)
    {
        float _4765 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4767 = _4765 * 0.15915493667125701904296875;
        float _4769 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4771 = _4767 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = _4769 * 0.15915493667125701904296875;
        float _4777 = _4767 * 6.283185482025146484375;
        float _4779 = sin(_4777);
        float _4781 = 1.0 / _4773;
        float _4783 = _4775 * 6.283185482025146484375;
        float _4785 = cos(_4783);
        float _4787 = _4779 * _4781;
        float _4789 = _4775 * 6.283185482025146484375;
        float _4791 = sin(_4789);
        float _4793 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4795 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4793;
        float _4797 = _4785 * _4787;
        float _4799 = 1.0 / _4795;
        float _4801 = 1.0 / _4797;
        float _4803 = _4791 * _4801;
        float _4805 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4807 = fma(_3992, _4803, _4805);
        float _4809 = _4807 * _4799;
        float _4811 = precise::clamp(_4809, 0.0, 1.0);
        _4718 = _4767;
        _4759 = _4811;
    }
    float _4813 = _4718;
    float _4815 = _4759;
    float _4817 = _4813;
    if (!_4152)
    {
        int _4819 = _4212 << 4;
        int _4821 = _4819 + 2048;
        uint _4823 = uint(int(uint(_4821) >> uint(2)));
        uint _4825 = uint(int(uint(int(_4823)) >> uint(2)));
        int _4827 = int(_4823) & 3;
        float _4829 = (*spvDescriptorSet0.vp_c15)._m0[int(_4825)][_4827];
        int _4831 = int(_4823) + 1;
        uint _4833 = uint(int(uint(_4831) >> uint(2)));
        int _4835 = _4831 & 3;
        float _4837 = (*spvDescriptorSet0.vp_c15)._m0[int(_4833)][_4835];
        int _4839 = _4821 + 8;
        uint _4841 = uint(int(uint(_4839) >> uint(2)));
        uint _4843 = uint(int(uint(int(_4841)) >> uint(2)));
        int _4845 = int(_4841) & 3;
        float _4847 = (*spvDescriptorSet0.vp_c15)._m0[int(_4843)][_4845];
        int _4849 = int(_4841) + 1;
        uint _4851 = uint(int(uint(_4849) >> uint(2)));
        int _4853 = _4849 & 3;
        float _4855 = (*spvDescriptorSet0.vp_c15)._m0[int(_4851)][_4853];
        float _4857 = _3706 * _4837;
        float _4859 = fma(_3556, _4829, _4857);
        float _4861 = fma(_3564, _4847, _4859);
        float _4863 = _4861 + _4855;
        float _4865 = precise::clamp(_4863, 0.0, 1.0);
        float _4867 = -_4865;
        float _4869 = _4867 + _4722;
        float _4871 = fma(_4869, 500.0, 1.5);
        float _4873 = exp2(_4871);
        float _4875 = 0.0 + _4873;
        float _4877 = precise::clamp(_4875, 0.0, 1.0);
        _4755 = _4877;
    }
    float _4879 = _4755;
    float _4881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4883 = _4556 + _4881;
    float _4885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4887 = _4558 + _4885;
    float _4889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4891 = _4560 + _4889;
    float _4893 = _4883 * _4883;
    float _4895 = fma(_4887, _4887, _4893);
    float _4897 = fma(_4891, _4891, _4895);
    float _4899 = rsqrt(_4897);
    float _4901 = _4899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4903 = _4887 * _4901;
    float _4905 = _4891 * _4901;
    float _4907 = _4903 * _4903;
    float _4909 = _4905 * _4905;
    float _4911 = _4907 + _4909;
    float _4913 = sqrt(_4911);
    bool _4915 = _4913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4919 = _4913 + _4917;
    float _4921 = _4891;
    float _4923 = _4919;
    float _4925 = _4883;
    if (_4915)
    {
        float _4927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4921 = _4927;
    }
    float _4929 = _4921;
    if (_4915)
    {
        float _4931 = rsqrt(_4911);
        _4817 = _4931;
    }
    float _4933 = _4817;
    float _4935 = _4933;
    if (_4915)
    {
        float _4937 = _4919 * _4929;
        _4923 = _4937;
    }
    float _4939 = _4923;
    if (_4915)
    {
        float _4941 = _4939 * 0.15915493667125701904296875;
        _3584 = _4941;
    }
    float _4943 = _3584;
    float _4945 = _4899;
    if (_4915)
    {
        float _4947 = _4943 * 6.283185482025146484375;
        float _4949 = sin(_4947);
        _4945 = _4949;
    }
    float _4951 = _4945;
    float _4953 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4955 = precise::max(0.0, _4953);
    float _4957 = _4893;
    float _4959 = _4955;
    float _4961 = _4953;
    if (_4915)
    {
        float _4963 = _4943 * 6.283185482025146484375;
        float _4965 = cos(_4963);
        _4957 = _4965;
    }
    float _4967 = _4957;
    float _4969 = -_4901;
    float _4971 = -_4955;
    float _4973 = fma(_4883, _4969, _4971);
    if (!_4915)
    {
        _4925 = _4905;
    }
    float _4975 = _4925;
    float _4977 = _4975;
    if (_4915)
    {
        float _4979 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4959 = _4979;
    }
    float _4981 = _4959;
    float _4983 = _4981;
    float _4985 = _4951;
    if (_4915)
    {
        float _4987 = fma(_4951, _4981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4983 = _4987;
    }
    float _4989 = _4983;
    float _4991 = _4989;
    if (!_4915)
    {
        _4985 = _4903;
    }
    float _4993 = _4985;
    float _4995 = _4993;
    float _4997 = _4967;
    if (_4915)
    {
        float _4999 = _4967 + (-1.0);
        _4961 = _4999;
    }
    float _5001 = _4961;
    float _5003 = _5001;
    if (_4915)
    {
        float _5005 = _4933 * _4989;
        _4036 = _5005;
    }
    float _5007 = _4036;
    if (!_4915)
    {
        _4991 = _4973;
    }
    float _5009 = _4991;
    float _5011 = _5009;
    if (_4915)
    {
        float _5013 = _5001 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5003 = _5013;
    }
    float _5015 = _5003;
    if (_4915)
    {
        float _5017 = _4903 * _5007;
        _4995 = _5017;
    }
    float _5019 = _4995;
    if (!_4915)
    {
        _4935 = _4907;
    }
    float _5021 = _4935;
    float _5023 = _5021;
    if (_4915)
    {
        float _5025 = _4905 * _5007;
        _4977 = _5025;
    }
    float _5027 = _4977;
    if (_4915)
    {
        float _5029 = fma(_4973, _4967, _5015);
        _5011 = _5029;
    }
    float _5031 = _5011;
    if (_4915)
    {
        float _5033 = _5019 * _5019;
        _5023 = _5033;
    }
    float _5035 = _5023;
    if (!_4915)
    {
        _4997 = _4909;
    }
    float _5037 = _4997;
    float _5039 = _5037;
    if (_4915)
    {
        float _5041 = _5027 * _5027;
        _5039 = _5041;
    }
    float _5043 = _5039;
    float _5045 = sqrt(_4897);
    float _5047 = fma(_5031, _5031, _5035);
    float _5049 = _5047 + _5043;
    float _5051 = rsqrt(_5049);
    float _5053 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5055 = fma(_5045, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5053);
    float _5057 = precise::clamp(_5055, 0.0, 1.0);
    float _5059 = -_5057;
    float _5061 = _5059 + 1.0;
    float _5063 = abs(_5061);
    float _5065 = log2(_5063);
    float _5067 = _5051 * _5019;
    float _5069 = _5051 * _5031;
    float _5071 = _5051 * _5027;
    float _5073 = _5067 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5075 = -_5073;
    float _5077 = fma(_5069, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5075);
    float _5079 = -_5071;
    float _5081 = fma(_5079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5077);
    float _5083 = _5065 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5085 = fma(_5081, -0.5, 0.5);
    float _5087 = fma(_5081, 0.5, 0.5);
    float _5089 = exp2(_5083);
    float _5091 = fma(_5087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5093 = fma(_5087, _5091, -0.212114393711090087890625);
    float _5095 = _5069 + 1.0;
    float _5097 = sqrt(_5085);
    float _5099 = fma(_5087, _5093, 1.570728778839111328125);
    float _5101 = -_5069;
    float _5103 = fma(_5089, _5095, _5101);
    float _5105 = fma(_5103, 0.5, 0.5);
    float _5107 = _5097 * 0.636619746685028076171875;
    float _5109 = -_5099;
    float _5111 = fma(_5107, _5109, 1.0);
    float2 _13243 = float2(_5111, _5105);
    float3 _5115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13243, float2(0.0), isnan(_13243)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13243, float2(0.0), isnan(_13243)), level(0.0)).xyz;
    float _5117 = _5115.x;
    float _5119 = _5115.y;
    float _5121 = _5115.z;
    float _5123 = abs(_3992);
    float _5125 = log2(_5123);
    float _5127 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5129 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5131 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5133 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5135 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5127);
    float _5137 = fma(_5129, _5129, 1.0);
    float _5139 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5131);
    float _5141 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5143 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5145 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5147 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5133);
    float _5149 = rsqrt(_5137);
    float _5151 = -_3910;
    float _5153 = fma(_5151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5141);
    float _5155 = -_3910;
    float _5157 = fma(_5155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5143);
    float _5159 = -_3910;
    float _5161 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5145);
    float _5163 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5165 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5167 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5169 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5171 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5147);
    float _5173 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5175 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5165);
    float _5177 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5167);
    float _5179 = exp2(_5163);
    float _5181 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5169);
    float _5183 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5153);
    float _5185 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5173);
    float _5187 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5139);
    float _5189 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5135);
    float _5191 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5193 = _5129 * _5183;
    float _5195 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5157);
    float _5197 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5161);
    float _5199 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5185);
    float _5201 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5175);
    float _5203 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5177);
    float _5205 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5181);
    float _5207 = fma(_5191, _5187, _5193);
    float _5209 = _5129 * _5195;
    float _5211 = _5129 * _5197;
    float _5213 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5199);
    float _5215 = _5129 * _5149;
    float _5217 = fma(_5191, _5189, _5209);
    float _5219 = fma(_5191, _5171, _5211);
    float _5221 = -_5201;
    float _5223 = _5215 * _5221;
    float _5225 = _4630 * 0.5;
    float _5227 = fma(_5179, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5229 = precise::clamp(_5227, 0.0, 1.0);
    out.m_96.x = _5187;
    out.m_96.y = _5189;
    out.m_96.z = _5171;
    float _5231 = _5065 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5233 = -_5205;
    float _5235 = _5215 * _5233;
    bool _5237 = _3992 <= 8000.0;
    bool _5239 = isnan(_3992);
    bool _5241 = _5237 || _5239;
    bool _5243 = isnan(8000.0);
    bool _5245 = _5241 || _5243;
    float _5247 = float(_5245);
    out.gl_Position.x = _4668;
    out.gl_Position.y = _4670;
    out.gl_Position.z = _5213;
    out.gl_Position.w = _4630;
    float _5249 = -_3610;
    float _5251 = _5249 + 1.0;
    float _5253 = _5213 + _4630;
    float _5255 = exp2(_5231);
    float _5257 = _5203 + _5217;
    bool _5259 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5261 = isnan(_5045);
    bool _5263 = _5259 || _5261;
    bool _5265 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5267 = _5263 || _5265;
    float _5269 = _5253 * 0.5;
    float _5271 = fma(_5149, _5183, _5223);
    float _5273 = fma(_4670, -0.5, _5225);
    float _5275 = _5201 + _5207;
    float _5277 = fma(_5229, -2.0, 3.0);
    float _5279 = _5229 * _5229;
    float _5281 = -_5203;
    float _5283 = _5215 * _5281;
    float _5285 = _5279 * _5277;
    float _5287 = fma(_5149, _5195, _5283);
    float _5289 = fma(_5149, _5197, _5235);
    float _5291 = _4668 + _4630;
    float _5293 = -_5285;
    float _5295 = _5293 + 1.0;
    float _5297 = -_5255;
    float _5299 = _5297 + 1.0;
    float _5301 = _5205 + _5219;
    float _5303 = _5291 * 0.5;
    float _5305 = fma(_5295, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5285);
    float _5307 = _5299 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_98.x = _5271;
    out.m_98.y = _5287;
    out.m_98.z = _5289;
    float _5309 = _5305;
    float _5311 = _5299;
    if (!_5267)
    {
        _4644 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5313 = _4644;
    float _5315 = _5247 * _5305;
    float _5317 = _5313;
    float _5319 = _5313;
    if (!_4612)
    {
        _5309 = 1.0;
    }
    float _5321 = _5309;
    out.m_100.x = _5303;
    out.m_100.y = _5273;
    out.m_100.z = _5269;
    out.m_100.w = _4630;
    float _5323 = _5321;
    if (_4612)
    {
        bool _5325 = _4728 >= _4678;
        bool _5327 = isnan(_4728);
        bool _5329 = _5325 || _5327;
        bool _5331 = isnan(_4678);
        bool _5333 = _5329 || _5331;
        float _5335 = float(_5333);
        _5323 = _5335;
    }
    float _5337 = _5323;
    float _5339 = _5315 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5267)
    {
        _5311 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5341 = _5311;
    out.m_102.x = _5275;
    out.m_102.y = _5257;
    out.m_102.z = _5301;
    float _5343 = _5251 * _5339;
    float _5345 = precise::clamp(_5343, 0.0, 1.0);
    float _5347 = _5337 * _4879;
    float _5349 = _5307 * _4730;
    float _5351 = -_5307;
    float _5353 = _5351 + 1.0;
    float _5355 = -_5345;
    float _5357 = fma(_5355, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5359 = _4815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5361 = _4741 * _5349;
    float _5363 = -_5347;
    float _5365 = fma(_5363, _5357, 1.0);
    float _5367 = precise::clamp(_5365, 0.0, 1.0);
    float _5369 = _4741 * _5353;
    float _5371 = _5353;
    float _5373 = _5367;
    float _5375 = _5341;
    float _5377 = _5341;
    if (!_5267)
    {
        _5371 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5379 = _5371;
    float _5381 = _5367 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5383 = _5379;
    float _5385 = _5379;
    if (!_5267)
    {
        _5373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5387 = _5373;
    out.m_104.x = _5381;
    float _5389 = _5121 * _5349;
    float _5391 = fma(_5117, _5361, _4735);
    float _5393 = fma(_5119, _5361, _4737);
    float _5395 = _5387;
    float _5397 = _5387;
    if (!_5267)
    {
        _4761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5399 = _4761;
    float _5401 = fma(_4741, _5389, _4739);
    float _5403 = _5399;
    float _5405 = _5399;
    if (!_5267)
    {
        _4763 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5407 = _4763;
    out.m_106.x = _5391;
    out.m_106.y = _5393;
    out.m_106.z = _5401;
    out.m_106.w = _5369;
    bool _5409 = !_5267;
    float _5411 = _5407;
    float _5413 = _5407;
    if (!_5409)
    {
        bool _5415 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5417 = isnan(_5045);
        bool _5419 = _5415 || _5417;
        bool _5421 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5423 = _5419 || _5421;
        if (!_5423)
        {
            float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5427 = _5045 + _5425;
            float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5431 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5429;
            float _5433 = 1.0 / _5431;
            float _5435 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5437 = _5435 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5439 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5441 = _5439 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5443 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5445 = _5443 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5447 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5449 = _5447 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5453 = _5451 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5455 = _5427 * _5433;
            float _5457 = precise::clamp(_5455, 0.0, 1.0);
            float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5463 = fma(_5457, _5437, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5465 = fma(_5457, _5461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5467 = fma(_5457, _5441, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5469 = fma(_5457, _5445, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5471 = fma(_5457, _5449, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5473 = fma(_5457, _5453, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5413 = _5465;
            _5377 = _5471;
            _5405 = _5463;
            _5385 = _5469;
            _5319 = _5467;
            _5397 = _5473;
            _5475 = true;
        }
        else
        {
            bool _5477 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5479 = isnan(_5045);
            bool _5481 = _5477 || _5479;
            bool _5483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5485 = _5481 || _5483;
            if (!_5485)
            {
                _5403 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5487 = _5403;
            _5405 = _5487;
            if (!_5485)
            {
                _5411 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5489 = _5411;
            _5413 = _5489;
            if (!_5485)
            {
                _5317 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5491 = _5317;
            _5319 = _5491;
            if (!_5485)
            {
                _5383 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5493 = _5383;
            _5385 = _5493;
            if (!_5485)
            {
                _5375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5495 = _5375;
            _5377 = _5495;
            if (!_5485)
            {
                _5395 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5497 = _5395;
            bool _5499 = !_5485;
            _5397 = _5497;
            if (!_5499)
            {
                bool _5501 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5503 = isnan(_5045);
                bool _5505 = _5501 || _5503;
                bool _5507 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5509 = _5505 || _5507;
                if (!_5509)
                {
                    float _5511 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5513 = _5045 + _5511;
                    float _5515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5517 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5515;
                    float _5519 = 1.0 / _5517;
                    float _5521 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5523 = _5521 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5525 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5527 = _5525 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5529 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5531 = _5529 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5533 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5535 = _5533 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5537 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5539 = _5537 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5541 = _5513 * _5519;
                    float _5543 = precise::clamp(_5541, 0.0, 1.0);
                    float _5545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5547 = _5545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5549 = fma(_5543, _5523, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5551 = fma(_5543, _5547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5553 = fma(_5543, _5527, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5555 = fma(_5543, _5531, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5557 = fma(_5543, _5535, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5559 = fma(_5543, _5539, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5413 = _5551;
                    _5377 = _5557;
                    _5405 = _5549;
                    _5385 = _5555;
                    _5319 = _5553;
                    _5397 = _5559;
                    _5475 = true;
                }
                else
                {
                    _5413 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5405 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5385 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5319 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5397 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5475 = false;
    float _5561 = _5413;
    float _5563 = _5377;
    float _5565 = _5405;
    float _5567 = _5385;
    float _5569 = _5319;
    float _5571 = _5397;
    float _5573 = fma(_5257, -0.5, 0.5);
    float _5575 = precise::clamp(_5573, 0.0, 1.0);
    float _5577 = -_5561;
    float _5579 = _5577 + _5563;
    float _5581 = _5359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5583 = -_5565;
    float _5585 = _5583 + _5567;
    float _5587 = fma(_5575, _5579, _5561);
    out.m_108.x = 0.0;
    float _5589 = -_5569;
    float _5591 = _5589 + _5571;
    float _5593 = fma(_5575, _5585, _5565);
    float _5595 = _5587 * 0.586610972881317138671875;
    out.m_63.x = _5581;
    bool _5597 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5599 = fma(_5575, _5591, _5569);
    float _5601 = fma(_5593, 0.298911988735198974609375, _5595);
    bool _5603 = _4815 > 0.0;
    bool _5605 = isnan(_4815);
    bool _5607 = _5603 || _5605;
    bool _5609 = isnan(0.0);
    bool _5611 = _5607 || _5609;
    float _5613 = fma(_5599, 0.114477999508380889892578125, _5601);
    float _5615 = -_5613;
    float _5617 = _5593 + _5615;
    float _5619 = -_5613;
    float _5621 = _5587 + _5619;
    float _5623 = -_5613;
    float _5625 = _5599 + _5623;
    float _5627 = fma(_5617, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    float _5629 = fma(_5621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    float _5631 = fma(_5625, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    bool _5633 = !_5597;
    if (!_5633)
    {
        float _5635 = -_4556;
        float _5637 = _5635 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5639 = -_4558;
        float _5641 = _5639 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5643 = -_4560;
        float _5645 = _5643 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5647 = _5637 * _5637;
        float _5649 = fma(_5641, _5641, _5647);
        float _5651 = fma(_5645, _5645, _5649);
        float _5653 = sqrt(_5651);
        float _5655 = rsqrt(_5651);
        float _5657 = -_5653;
        float _5659 = _5657 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5661 = _5659 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5663 = precise::clamp(_5661, 0.0, 1.0);
        float _5665 = _5641 * _5655;
        float _5667 = _5637 * _5655;
        float _5669 = abs(_5663);
        float _5671 = log2(_5669);
        float _5673 = _5645 * _5655;
        float _5675 = _5665 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5677 = _5257 * _5667;
        float _5679 = -_5667;
        float _5681 = -_5675;
        float _5683 = fma(_5679, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5681);
        float _5685 = fma(_5275, _5665, _5677);
        float _5687 = -_5673;
        float _5689 = fma(_5687, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5683);
        float _5691 = fma(_5301, _5673, _5685);
        float _5693 = precise::clamp(_5691, 0.0, 1.0);
        float _5695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5697 = _5689 + _5695;
        float _5699 = _5671 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5701 = _5697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5703 = precise::clamp(_5701, 0.0, 1.0);
        float _5705 = exp2(_5699);
        float _5707 = _5705 * _5703;
        float _5709 = _5693 * _5707;
        float _5711 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5713 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5715 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5711;
        out.m_108.y = _5713;
        out.m_108.z = _5715;
    }
    out.m_110.x = _5627;
    out.m_110.y = _5629;
    out.m_110.z = _5631;
    if (_5611)
    {
        return out;
    }
    float _5717 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5717;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5475 = false;
    bool _745 = false;
    bool _601 = false;
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
        float _5785 = as_type<float>(_153);
        out.gl_Position.z = _5785;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _5848 = as_type<float>(_185);
        out.gl_Position.z = _5848;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _303 = 1.0 / _283;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _307 * _293;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _291;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _271 + _333;
    float _337 = _315 * _303;
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
    bool _359 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_271);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = 1.0 / _301;
    float _377 = _335 * _331;
    bool _379 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _381 = isnan(_271);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _271 + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _395;
    float _399 = -_389;
    float _401 = _399 + 1.0;
    float _403 = _341 * _343;
    float _405 = -_329;
    float _407 = _405 + 1.0;
    float _409 = fma(_397, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = _357 * _407;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _389 * _373;
    bool _427 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _429 = isnan(_271);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _439;
    float _443 = _393 * _375;
    float _445 = _423 * _401;
    float _447 = -_423;
    float _449 = _447 + 1.0;
    bool _451 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _453 = isnan(_271);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_441, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = _437 * _449;
    float _471 = -_437;
    float _473 = _471 + 1.0;
    float _475 = -_461;
    float _477 = _475 + 1.0;
    float _479 = fma(_467, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = _461 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = _369 * _477;
    float _493 = -_369;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = fma(_489, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _503 = _463 * _491;
    float _505 = _409 * _491;
    float _507 = fma(_483, _345, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_499, _345, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _513 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_479, _485, _511);
    float _525 = fma(_501, _485, _513);
    float _527 = fma(_517, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _535;
    float _539 = fma(_507, _469, _523);
    float _541 = fma(_509, _469, _525);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _547 = fma(_533, _403, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _549 = fma(_537, _403, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _555 = fma(_527, _445, _539);
    float _557 = fma(_529, _445, _541);
    float _559 = fma(_545, _443, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _561 = fma(_553, _443, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _563 = fma(_547, _425, _555);
    float _565 = fma(_549, _425, _557);
    float _567 = fma(_559, _411, _563);
    float _569 = fma(_561, _411, _565);
    float _571 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].x, _567);
    float _573 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[149].y, _569);
    bool _575 = !_309;
    float _577 = _513;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _581 = _377;
    float _599;
    if (!_575)
    {
        float _583 = in.m_76.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        _599 = _179;
    }
    _601 = false;
    float _603 = _599;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _603 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _613 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = isnan(_603);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_603);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _641;
    bool _645 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = isnan(_603);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = 1.0 / _611;
    float _659 = -_623;
    float _661 = _659 + 1.0;
    bool _663 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _665 = _639 * _661;
    float _667 = -_639;
    float _669 = _667 + 1.0;
    float _671 = 1.0 / _627;
    float _673 = _643 * _657;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = fma(_673, _607, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -_655;
    float _683 = _681 + 1.0;
    float _685 = _679 * _665;
    float _687 = _677 * _671;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _603 + _689;
    float _693 = _623 * _683;
    float _695 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[115].x, _685);
    float _697 = fma(_687, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = fma(_697, _693, _695);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[117].x, _699);
    float _707 = in.m_78.x;
    float _709 = in.m_78.y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _713 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _719 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _713;
    out.m_80.y = _719;
    out.m_80.z = _715;
    out.m_80.w = _717;
    float _721 = _573 * _709;
    float _723 = _571 * _707;
    bool _725 = !_663;
    float _743;
    if (!_725)
    {
        float _727 = in.m_76.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        _743 = _179;
    }
    _745 = false;
    float _747 = _743;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _747 + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _757 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _759 = isnan(_747);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _777 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _779 = isnan(_747);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = 1.0 / _755;
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _795;
    bool _799 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _801 = isnan(_747);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _787 * _793;
    float _813 = -_787;
    float _815 = _813 + 1.0;
    bool _817 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _819 = 1.0 / _771;
    float _821 = _809 * _815;
    float _823 = -_809;
    float _825 = _823 + 1.0;
    float _827 = 1.0 / _775;
    float _829 = _797 * _789;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _835 = fma(_829, _751, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _837 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _839 = isnan(_747);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = _833 * _819;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _857 = _747 + _855;
    float _859 = _835 * _821;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _863 = _747 + _861;
    float _865 = fma(_849, _857, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _867 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[131].x, _859);
    float _869 = _853 * _827;
    float _871 = -_847;
    float _873 = _871 + 1.0;
    float _875 = fma(_865, _811, _867);
    float _877 = fma(_869, _863, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _879 = _767 * _873;
    float _881 = fma(_877, _879, _875);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _889 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[134].x, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _889 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _891;
    out.m_82.y = _893;
    out.m_82.z = _895;
    out.m_82.w = _897;
    bool _899 = !_817;
    if (!_899)
    {
        float _901 = in.m_76.x;
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _905 = _901 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _909 = _907 * _903;
        float _911 = floor(_909);
        float _913 = -_911;
        float _915 = _909 + _913;
        _181 = _915;
    }
    float _917 = _181;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _921 = int(_919);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _925 = int(_923);
    float _927 = float(_921);
    float _929 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _931 = int(_929);
    float _933 = float(uint(_925));
    float _935 = 1.0 / _927;
    int _937 = ~_925;
    int _939 = _937 + 1;
    float _941 = 1.0 / _933;
    float _943 = float(uint(_931));
    float _945 = _935 * _135;
    int _947 = ~_925;
    int _949 = _947 + 1;
    float _951 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _953 = int(_951);
    int _955 = as_type<int>(_941) + (-2);
    float _957 = trunc(_945);
    int _959 = int(_957);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _967 = int(_965);
    float _969 = float(uint(_959));
    if (_963)
    {
        _577 = 1.0;
    }
    float _971 = _577;
    int _973 = 0;
    int _975 = 0;
    float _977 = _971;
    if (_963)
    {
        _973 = 0;
        _975 = 0;
    }
    int _979 = _973;
    int _981 = _975;
    int _983 = _979;
    int _985 = _981;
    if (_963)
    {
        _579 = 1.0;
    }
    float _987 = _579;
    float _989 = as_type<float>(_955) * _969;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _993 = int(_991);
    float _995 = trunc(_989);
    float _997 = precise::max(_995, 0.0);
    uint _1000 = uint(_997);
    float _1002 = float(_993);
    float _1004 = 1.0 / _1002;
    int _1006 = _949 * int(_1000);
    int _1008 = _1006 + _959;
    float _1010 = float(uint(_1008));
    float _1012 = as_type<float>(_955) * _1010;
    float _1014 = _1010;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1018 = _1002;
    float _1020 = _987;
    if (_963)
    {
        float _1022 = in.m_76.x;
        float _1024 = in.m_76.y;
        _1014 = _1022;
        _1016 = _1024;
    }
    float _1026 = _1014;
    float _1028 = _1016;
    float _1030 = trunc(_1012);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = 1.0 / _943;
    int _1038 = int(_1000) + int(_1034);
    float _1040 = float(_925);
    float _1042 = float(_959);
    int _1044 = _939 * _1038;
    int _1046 = _1044 + _959;
    float _1048 = _1042;
    float _1050 = _1026;
    float _1052 = _1028;
    if (_963)
    {
        _581 = _1026;
    }
    float _1054 = _581;
    bool _1056 = _1042 >= _1040;
    bool _1058 = isnan(_1042);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(_1040);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    bool _1068 = uint(_1046) >= uint(_925);
    float _1070 = 0.0;
    float _1072 = _1054;
    if (_963)
    {
        _1070 = _1054;
    }
    float _1074 = _1070;
    float _1076 = trunc(_1066);
    int _1078 = int(_1076);
    float _1080 = _1074;
    if (_963)
    {
        _1048 = _1028;
    }
    float _1082 = _1048;
    float _1084 = _1082;
    if (_963)
    {
        _1018 = _1054;
    }
    float _1086 = _1018;
    float _1088 = _1086;
    if (!_963)
    {
        float _1090 = in.m_76.x;
        float _1092 = in.m_76.y;
        float _1094 = in.m_76.z;
        float _1096 = _1090 * 3.1415927410125732421875;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1092 * 3.1415927410125732421875;
        float _1102 = _1100 * 0.15915493667125701904296875;
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        _977 = 7.345489978790283203125;
        _1050 = _1090;
        _1052 = _1092;
        _1020 = 5.839270114898681640625;
        _1088 = _1094;
        _1072 = _1092;
        _983 = 1;
        _985 = 2;
        _1080 = _1106;
        _1084 = _1110;
    }
    float _1112 = _977;
    float _1114 = _1050;
    float _1116 = _1052;
    float _1118 = _1020;
    float _1120 = _1088;
    float _1122 = _1072;
    int _1124 = _983;
    int _1126 = _985;
    float _1128 = _1080;
    float _1130 = _1084;
    float _1132 = _1112 * _1114;
    float _1134 = in.m_76.z;
    float _1136 = in.m_76.w;
    bool _1138 = !_1068;
    int _1140 = _1138 ? 0 : (-1);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1144 = _917 + _1142;
    float _1146 = floor(_1132);
    float _1148 = float(_967);
    float _1150 = in.m_70.w;
    int _1152 = ~_1038;
    int _1154 = _1152 + _1140;
    int _1156 = _1154 + 1;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1160 = _917 + _1158;
    float _1162 = float(uint(_953));
    bool _1164 = _925 == 0;
    float _1166 = 1.0 / _1148;
    int _1168 = _925 * _1156;
    int _1170 = _1168 + _959;
    int _1172 = ~_1078;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1164;
    int _1180 = _1178 ? _1170 : (-1);
    float _1182 = -_1146;
    float _1184 = _1132 + _1182;
    float _1186 = 1.0 / _1162;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1190 = _1188 != 0;
    int _1192 = _1180 * _1176;
    float _1194 = _1184 * _1040;
    bool _1196 = _1134 > 0.5;
    float _1198 = _175 * _135;
    bool _1200 = !_1190;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _1166 * _135;
    bool _1206 = _1116 > 0.5;
    float _1208 = _1004 * _135;
    float _1210 = trunc(_1194);
    int _1212 = int(_1210);
    int _1214 = abs(_1202);
    float _1216 = _1040 * _1198;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1228 = _1226 != 0;
    float _1230 = -_225;
    int _1232 = _1196 ? as_type<int>(_1230) : as_type<int>(_225);
    float _1234 = -_241;
    int _1236 = _1206 ? as_type<int>(_1234) : as_type<int>(_241);
    float _1238 = trunc(_1208);
    int _1240 = int(_1238);
    bool _1242 = !_1228;
    float _1244 = _1242 ? _225 : as_type<float>(_1232);
    bool _1246 = !_1224;
    float _1248 = _1246 ? _241 : as_type<float>(_1236);
    float _1250 = trunc(_1204);
    int _1252 = int(_1250);
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1264 = _1262 != 0;
    int _1266 = _1212 * _1214;
    int _1268 = _1266 + _959;
    int _1270 = _925 + (-1);
    int _1272 = as_type<int>(_1036) + (-2);
    bool _1274 = !_1260;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = trunc(_1216);
    int _1280 = int(_1278);
    float _1282 = float(uint(_1240));
    int _1284 = _1078 * _1270;
    int _1286 = _1284 + _1192;
    bool _1288 = !_1256;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1294 = _1292 != 0;
    float _1296 = as_type<float>(_1272) * _1282;
    int _1298 = as_type<int>(_1186) + (-2);
    int _1300 = abs(_1276);
    bool _1302 = !_1264;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = trunc(_1296);
    float _1308 = precise::max(_1306, 0.0);
    uint _1310 = uint(_1308);
    int _1312 = abs(_1290);
    int _1314 = _1286 * _1300;
    bool _1316 = !_1294;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = float(uint(_1252));
    int _1322 = abs(_1304);
    int _1324 = abs(_1318);
    float _1326 = as_type<float>(_1298) * _1320;
    int _1328 = _1280 * _1312;
    int _1330 = _1328 + _1314;
    int _1332 = ~_931;
    int _1334 = _1332 + 1;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = _1268 * _1322;
    int _1344 = _1342 + _1330;
    int _1346 = ~_953;
    int _1348 = _1346 + 1;
    int _1350 = _1212 * _1324;
    int _1352 = _1350 + _1344;
    int _1354 = ~_931;
    int _1356 = _1354 + 1;
    int _1358 = _1334 * int(_1310);
    int _1360 = _1358 + _1240;
    int _1362 = ~_925;
    int _1364 = _1362 + 1;
    float _1366 = float(uint(_1352));
    float _1368 = float(uint(_1360));
    int _1370 = ~_953;
    int _1372 = _1370 + 1;
    int _1374 = _1348 * int(_1340);
    int _1376 = _1374 + _1252;
    float _1378 = as_type<float>(_955) * _1366;
    float _1380 = as_type<float>(_1272) * _1368;
    bool _1382 = _1136 > 0.5;
    float _1384 = float(uint(_1376));
    float _1386 = trunc(_1378);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    float _1392 = float(_931);
    float _1394 = as_type<float>(_1298) * _1384;
    float _1396 = trunc(_1380);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1406 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1408 = isnan(_917);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1422 = trunc(_1394);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    int _1428 = _1364 * int(_1390);
    int _1430 = _1428 + _1352;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1434 = float(uint(_1430));
    int _1436 = int(_1310) + int(_1400);
    float _1438 = _1118 * _1120;
    float _1440 = -_241;
    int _1442 = _1196 ? as_type<int>(_1440) : as_type<int>(_241);
    float _1444 = as_type<float>(_955) * _1434;
    float _1446 = 1.0 / _1404;
    int _1448 = _1356 * _1436;
    int _1450 = _1448 + _1240;
    int _1452 = int(_1340) + int(_1426);
    float _1454 = _1112 * _1122;
    bool _1456 = uint(_1450) >= uint(_931);
    float _1458 = trunc(_1444);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = -_225;
    int _1466 = _1382 ? as_type<int>(_1464) : as_type<int>(_225);
    int _1468 = _1372 * _1452;
    int _1470 = _1468 + _1252;
    bool _1472 = !_1456;
    int _1474 = _1472 ? 0 : (-1);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    bool _1480 = uint(_1470) >= uint(_953);
    float _1482 = floor(_1438);
    bool _1484 = !_1478;
    float _1486 = _1484 ? _241 : as_type<float>(_1442);
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1498 = _1496 != 0;
    int _1500 = ~_925;
    int _1502 = _1500 + 1;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1506 = _1504 != 0;
    float _1508 = floor(_1454);
    bool _1510 = !_1494;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1516 = _1514 != 0;
    int _1518 = int(_1390) + int(_1462);
    float _1520 = float(_1240);
    float _1522 = -_1482;
    float _1524 = _1438 + _1522;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1528 = _1526 != 0;
    int _1530 = _1502 * _1518;
    int _1532 = _1530 + _1352;
    bool _1534 = _1520 >= _1392;
    bool _1536 = isnan(_1520);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(_1392);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = 1.0 / _1420;
    bool _1548 = !_1506;
    int _1550 = _1548 ? 0 : 1;
    bool _1552 = !_1528;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = 0.0;
    float _1558 = _1150;
    if (_1516)
    {
        float _1560 = in.m_76.w;
        _1556 = _1560;
    }
    float _1562 = _1556;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1566 = _1564 != 0;
    float _1568 = -_1508;
    float _1570 = _1454 + _1568;
    bool _1572 = uint(_1532) >= uint(_925);
    float _1574 = trunc(_1544);
    int _1576 = int(_1574);
    int _1578 = ~_1436;
    int _1580 = _1578 + _1474;
    int _1582 = _1580 + 1;
    bool _1584 = !_1220;
    float _1586 = _1584 ? _225 : as_type<float>(_1466);
    bool _1588 = !_1566;
    int _1590 = _1588 ? 0 : 1;
    int _1592 = _931 * _1582;
    int _1594 = _1592 + _1240;
    bool _1596 = !_1480;
    int _1598 = _1596 ? 0 : (-1);
    bool _1600 = !_1572;
    int _1602 = _1600 ? 0 : (-1);
    float _1604 = _1392 * _1198;
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1608 = _1606 != 0;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1620 = _1618 != 0;
    float _1622 = _1524 * _1392;
    int _1624 = _931 + (-1);
    bool _1626 = !_1490;
    int _1628 = _1626 ? 0 : 1;
    float _1630 = trunc(_1604);
    int _1632 = int(_1630);
    bool _1634 = !_1612;
    int _1636 = _1634 ? 0 : 1;
    bool _1638 = _931 == 0;
    float _1640 = _1562;
    bool _1642 = _1616;
    if (_1516)
    {
        float _1644 = _1562 * 3.1415927410125732421875;
        _1640 = _1644;
    }
    float _1646 = _1640;
    int _1648 = ~_1576;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    bool _1654 = !_1638;
    int _1656 = _1654 ? _1594 : (-1);
    float _1658 = _1646;
    if (_1516)
    {
        float _1660 = _1646 * 0.15915493667125701904296875;
        _1658 = _1660;
    }
    float _1662 = _1658;
    bool _1664 = !_1498;
    int _1666 = _1664 ? 0 : 1;
    int _1668 = abs(_1512);
    int _1670 = _1656 * _1652;
    float _1672 = float(_953);
    float _1674 = trunc(_1622);
    int _1676 = int(_1674);
    float _1678 = float(_1252);
    int _1680 = _1576 * _1624;
    int _1682 = _1680 + _1670;
    int _1684 = abs(_1628);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1688 = _1686 != 0;
    int _1690 = _1682 * _1668;
    int _1692 = abs(_1666);
    float _1694 = _1662;
    if (_1516)
    {
        float _1696 = _1662 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        _1694 = _1698;
    }
    float _1700 = _1694;
    int _1702 = abs(_1550);
    bool _1704 = _1678 >= _1672;
    bool _1706 = isnan(_1678);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(_1672);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    int _1716 = _1676 * _1702;
    int _1718 = _1716 + _1240;
    float _1720 = trunc(_1714);
    int _1722 = int(_1720);
    int _1724 = _1632 * _1684;
    int _1726 = _1724 + _1690;
    float _1728 = _1672 * _1198;
    int _1730 = abs(_1554);
    float _1732 = _1570 * _1672;
    int _1734 = _1718 * _1692;
    int _1736 = _1734 + _1726;
    int _1738 = ~_1452;
    int _1740 = _1738 + _1598;
    int _1742 = _1740 + 1;
    float _1744 = _1570;
    if (_1688)
    {
        float _1746 = in.m_76.x;
        _1744 = _1746;
    }
    float _1748 = _1744;
    bool _1750 = !_1608;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1676 * _1730;
    int _1756 = _1754 + _1736;
    bool _1758 = !_1616;
    int _1760 = _1758 ? 0 : 1;
    int _1762 = _953 * _1742;
    int _1764 = _1762 + _1252;
    bool _1766 = _953 == 0;
    float _1768 = trunc(_1732);
    int _1770 = int(_1768);
    if (_1516)
    {
        bool _1772 = _1700 > 0.5;
        _1642 = _1772;
    }
    bool _1774 = _1642;
    float _1776 = float(uint(_1268));
    float _1778 = float(uint(_1756));
    int _1780 = ~_1722;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    float _1786 = as_type<float>(_955) * _1776;
    bool _1788 = !_1766;
    int _1790 = _1788 ? _1764 : (-1);
    float _1792 = trunc(_1728);
    int _1794 = int(_1792);
    int _1796 = abs(_1590);
    float _1798 = as_type<float>(_1272) * _1778;
    int _1800 = _953 + (-1);
    int _1802 = _1790 * _1784;
    int _1804 = abs(_1636);
    float _1806 = trunc(_1786);
    float _1808 = precise::max(_1806, 0.0);
    uint _1810 = uint(_1808);
    int _1812 = _1722 * _1800;
    int _1814 = _1812 + _1802;
    int _1816 = abs(_1752);
    float _1818 = _1748;
    float _1820 = _1786;
    float _1822 = as_type<float>(_1816);
    if (_1688)
    {
        float _1824 = _1748 * 3.1415927410125732421875;
        _1818 = _1824;
    }
    float _1826 = _1818;
    int _1828 = ~_925;
    int _1830 = _1828 + 1;
    int _1832 = _1770 * _1796;
    int _1834 = _1832 + _1252;
    int _1836 = ~_931;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1798);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1814 * _1804;
    float _1848 = as_type<float>(_1830);
    if (_1688)
    {
        float _1850 = _1826 * 0.15915493667125701904296875;
        _1848 = _1850;
    }
    float _1852 = _1848;
    int _1854 = _1794 * _1816;
    int _1856 = _1854 + _1846;
    float _1858 = float(uint(_1718));
    int _1860 = _1830 * int(_1810);
    int _1862 = _1860 + _1268;
    int _1864 = abs(_1760);
    float _1866 = _1852;
    if (_1688)
    {
        float _1868 = _1852 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    bool _1874 = !_1620;
    int _1876 = _1874 ? 0 : 1;
    float _1878 = as_type<float>(_1272) * _1858;
    int _1880 = ~_1518;
    int _1882 = _1880 + _1602;
    int _1884 = _1882 + 1;
    float _1886 = float(uint(_1862));
    int _1888 = _1838 * int(_1844);
    int _1890 = _1888 + _1756;
    int _1892 = _925 * _1884;
    int _1894 = _1892 + _1352;
    int _1896 = abs(_1876);
    float _1898 = trunc(_1878);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    float _1904 = float(uint(_1890));
    float _1906 = as_type<float>(_955) * _1886;
    bool _1908 = _925 == 0;
    int _1910 = _1834 * _1864;
    int _1912 = _1910 + _1856;
    float _1914 = as_type<float>(_1272) * _1904;
    int _1916 = ~_931;
    int _1918 = _1916 + 1;
    bool _1920 = !_1908;
    int _1922 = _1920 ? _1894 : (-1);
    int _1924 = _1770 * _1896;
    int _1926 = _1924 + _1912;
    if (!_1516)
    {
        _1820 = _241;
    }
    float _1928 = _1820;
    float _1930 = trunc(_1914);
    float _1932 = precise::max(_1930, 0.0);
    uint _1934 = uint(_1932);
    float _1936 = _1928;
    if (_1516)
    {
        float _1938 = -_241;
        float _1940 = _1774 ? _1938 : _241;
        _1936 = _1940;
    }
    float _1942 = _1936;
    int _1944 = _1922 & 3;
    bool _1946 = _1944 != 0;
    int _1948 = _1922 & 3;
    bool _1950 = _1948 != 0;
    int _1952 = _1918 * int(_1902);
    int _1954 = _1952 + _1718;
    int _1956 = _1946 ? 0 : 1;
    float _1958 = trunc(_1906);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    bool _1964 = uint(_1948) > 1u;
    bool _1966 = _1948 != 3;
    float _1968 = float(uint(_1926));
    int _1970 = int(_1844) + int(_1934);
    int _1972 = ~_931;
    int _1974 = _1972 + 1;
    float _1976 = as_type<float>(_1298) * _1968;
    float _1978 = float(uint(_1954));
    int _1980 = ~_1956;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    int _1986 = _1974 * _1970;
    int _1988 = _1986 + _1756;
    int _1990 = _1984;
    bool _1992 = _1966;
    if (!_1964)
    {
        int _1994 = ~_1956;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    float _2000 = as_type<float>(_1272) * _1978;
    bool _2002 = uint(_1948) >= 2u;
    float _2004 = trunc(_1976);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    bool _2010 = _1116 > 0.5;
    int _2012 = _2002 ? 0 : 1;
    bool _2014 = uint(_1988) >= uint(_931);
    int _2016 = ~_2012;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    float _2022 = trunc(_2000);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    bool _2028 = !_2014;
    int _2030 = _2028 ? 0 : (-1);
    int _2032 = _2020;
    if (_1966)
    {
        int _2034 = ~_2012;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    int _2040 = ~_1970;
    int _2042 = _2040 + _2030;
    int _2044 = _2042 + 1;
    if (_1688)
    {
        bool _2046 = _1872 > 0.5;
        _1992 = _2046;
    }
    bool _2048 = _1992;
    int _2050 = _931 * _2044;
    int _2052 = _2050 + _1756;
    if (!_1688)
    {
        _1822 = _225;
    }
    float _2054 = _1822;
    float _2056 = -_225;
    int _2058 = _2010 ? as_type<int>(_2056) : as_type<int>(_225);
    bool _2060 = !_1638;
    int _2062 = _2060 ? _2052 : (-1);
    int _2064 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2066 = _2064 != 0;
    float _2068 = _2054;
    if (_1688)
    {
        float _2070 = -_225;
        float _2072 = _2048 ? _2070 : _225;
        _2068 = _2072;
    }
    float _2074 = _2068;
    int _2076 = _2062 & 3;
    bool _2078 = _2076 != 0;
    int _2080 = ~_953;
    int _2082 = _2080 + 1;
    bool _2084 = !_2066;
    float _2086 = _2084 ? _225 : as_type<float>(_2058);
    bool _2088 = uint(_2076) > 1u;
    int _2090 = _2082 * int(_2008);
    int _2092 = _2090 + _1926;
    int _2094 = _2062 & 3;
    bool _2096 = _2094 != 0;
    int _2098 = int(_1810) + int(_1962);
    float _2100 = float(uint(_2092));
    int _2102 = _2096 ? 0 : 1;
    int _2104 = ~_925;
    int _2106 = _2104 + 1;
    float _2108 = as_type<float>(_1298) * _2100;
    int _2110 = ~_2102;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    int _2116 = _2114;
    if (!_2088)
    {
        int _2118 = ~_2102;
        int _2120 = _2118 + 1;
        _2116 = _2120;
    }
    int _2122 = _2116;
    int _2124 = _2106 * _2098;
    int _2126 = _2124 + _1268;
    bool _2128 = uint(_2076) >= 2u;
    float _2130 = trunc(_2108);
    float _2132 = precise::max(_2130, 0.0);
    uint _2134 = uint(_2132);
    bool _2136 = !_2078;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2128 ? 0 : 1;
    bool _2142 = uint(_2126) >= uint(_925);
    bool _2144 = _2076 != 3;
    bool _2146 = _2076 != 3;
    int _2148 = int(_1902) + int(_2026);
    float _2150 = in.m_56.x;
    float _2152 = in.m_56.y;
    float _2154 = in.m_56.z;
    int _2156 = ~_931;
    int _2158 = _2156 + 1;
    bool _2160 = !_2142;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = int(_2008) + int(_2134);
    int _2166 = _2158 * _2148;
    int _2168 = _2166 + _1718;
    int _2170 = ~_2140;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    int _2176 = _2174;
    if (_2144)
    {
        int _2178 = ~_2140;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    bool _2184 = uint(_2168) >= uint(_931);
    int _2186 = ~_953;
    int _2188 = _2186 + 1;
    int _2190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2192 = _2190 != 0;
    bool _2194 = !_2146;
    int _2196 = _2194 ? 0 : (-1);
    int _2198 = _2188 * _2164;
    int _2200 = _2198 + _1926;
    bool _2202 = !_2192;
    int _2204 = _2202 ? 0 : 1;
    bool _2206 = uint(_2200) >= uint(_953);
    float _2208 = _197 * _2152;
    bool _2210 = !_2184;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2220 = _2218 != 0;
    float _2222 = fma(_195, _2150, _2208);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2226 = _2224 != 0;
    float _2228 = _209 * _2152;
    bool _2230 = !_2206;
    int _2232 = _2230 ? 0 : (-1);
    float _2234 = _203 * _2152;
    float _2236 = 1.0 / _2216;
    bool _2238 = _1114 > 0.5;
    float _2240 = fma(_201, _2150, _2234);
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2246 = -_241;
    int _2248 = _2238 ? as_type<int>(_2246) : as_type<int>(_241);
    int _2250 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2252 = _2250 != 0;
    float _2254 = fma(_207, _2150, _2228);
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2260 = 1.0 / _2244;
    float _2262 = fma(_199, _2154, _2222);
    float _2264 = fma(_205, _2154, _2240);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2274 = 1.0 / _2258;
    float _2276 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2278 = _2276 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2280 = _2268 * _1446;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2286 = _2272 * _2236;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2296 = 1.0 / _2278;
    bool _2298 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2300 = isnan(_917);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = fma(_211, _2154, _2254);
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2312;
    float _2316 = _2294 * _2260;
    bool _2318 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2320 = isnan(_917);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = -_2308;
    float _2332 = _2330 + 1.0;
    float _2334 = 1.0 / _2284;
    float _2336 = _2314 * _2274;
    bool _2338 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2340 = isnan(_917);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2346 = _2342 || _2344;
    float _2348 = float(_2346);
    float _2350 = _2328 * _2332;
    float _2352 = -_2328;
    float _2354 = _2352 + 1.0;
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2356;
    bool _2360 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2362 = isnan(_917);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2368 = _2364 || _2366;
    float _2370 = float(_2368);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2376 = -_2348;
    float _2378 = _2376 + 1.0;
    float _2380 = _2348 * _2354;
    float _2382 = _2358 * _1546;
    float _2384 = _2374 * _2296;
    bool _2386 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2388 = isnan(_917);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = _2370 * _2378;
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2402 = _917 + _2400;
    float _2404 = -_2370;
    float _2406 = _2404 + 1.0;
    bool _2408 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2410 = isnan(_917);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2416 = _2412 || _2414;
    float _2418 = float(_2416);
    float _2420 = in.m_72.w;
    float _2422 = _2290 * _2334;
    float _2424 = fma(_2280, _2402, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2426 = _2396 * _2406;
    float _2428 = -_2396;
    float _2430 = _2428 + 1.0;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2434 = _917 + _2432;
    float _2436 = -_2418;
    float _2438 = _2436 + 1.0;
    bool _2440 = !_2252;
    float _2442 = _2440 ? _241 : as_type<float>(_2248);
    float _2444 = _2418 * _2430;
    float _2446 = fma(_2286, _2434, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2448 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2450 = isnan(_917);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2456 = _2452 || _2454;
    float _2458 = float(_2456);
    float _2460 = _1416 * _2438;
    float _2462 = in.m_74.w;
    float _2464 = -_1416;
    float _2466 = _2464 + 1.0;
    bool _2468 = _1124 != 1;
    float _2470 = -_2458;
    float _2472 = _2470 + 1.0;
    float _2474 = fma(_2422, _1144, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2476 = _2458 * _2466;
    float _2478 = _2262 + _1150;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2482 = _917 + _2480;
    float _2484 = _2424 * _2476;
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2488 = _917 + _2486;
    float _2490 = fma(_2336, _2482, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2492 = _2264 + _2420;
    float _2494 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2484);
    float _2496 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2498 = _917 + _2496;
    float _2500 = _2460;
    float _2502 = _2446;
    float _2504 = _2494;
    if (!_2468)
    {
        _1558 = _1116;
    }
    float _2506 = _1558;
    float _2508 = fma(_2446, _2460, _2494);
    float _2510 = _2506;
    if (!_2468)
    {
        _2500 = _1116;
    }
    float _2512 = _2500;
    float _2514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2516 = _2512;
    if (!_2468)
    {
        _2502 = _1134;
    }
    float _2518 = _2502;
    float _2520 = fma(_2382, _2498, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2522 = _2518;
    if (!_2468)
    {
        _2504 = _1134;
    }
    float _2524 = _2504;
    float _2526 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2528 = _2524;
    if (_2468)
    {
        _2516 = _1114;
    }
    float _2530 = _2516;
    float _2532 = _2310 + _2462;
    if (_2468)
    {
        _2510 = _1114;
    }
    float _2534 = _2510;
    float _2536 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_2468)
    {
        _2522 = _1116;
    }
    float _2538 = _2522;
    float _2540 = fma(_2316, _1160, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2542 = _2540;
    if (_2468)
    {
        _2528 = _1116;
    }
    float _2544 = _2528;
    float _2546 = -_2514;
    float _2548 = fma(_2536, 2.0, _2546);
    bool _2550 = _1126 != 2;
    float _2552 = fma(_2474, _2444, _2508);
    float _2554 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2556 = fma(_2540, _2426, _2552);
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2560 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2564 = _2492 + _2562;
    float _2566 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2558);
    float _2568 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2570 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2526);
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2576 = -_2560;
    float _2578 = fma(_2568, 2.0, _2576);
    float _2580 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2582 = fma(_2554, -2.0, _2572);
    float _2584 = fma(_2490, _2398, _2556);
    float _2586 = fma(_2580, -2.0, _2574);
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2590 = _2478 + _2588;
    float _2592 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2596 = _2074 + (-0.5);
    float _2598 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2586);
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2532 + _2600;
    float _2604 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2592);
    float _2606 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2594);
    int _2608 = _2062 >> 31;
    float _2610 = -_2596;
    float _2612 = -_2598;
    float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2612);
    float _2616 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2604);
    float _2618 = -_135;
    float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2548);
    float _2622 = _2442 + 0.5;
    int _2624 = _2608 & 3;
    float _2626 = fma(_2384, _2488, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2628 = 0.0;
    if (_2550)
    {
        _2628 = _1116;
    }
    float _2630 = _2628;
    float _2632 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2620);
    float _2634 = _2630;
    if (_2550)
    {
        _2542 = _1114;
    }
    float _2636 = _2542;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2640 = _2636;
    if (!_2550)
    {
        _2640 = _1134;
    }
    float _2642 = _2640;
    float _2644 = -_135;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2578);
    if (!_2550)
    {
        _2634 = _1114;
    }
    float _2648 = _2634;
    float _2650 = fma(_2534, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2638);
    bool _2652 = _2616 >= 0.0;
    float _2654 = _1942 + 0.5;
    int _2656 = _2062 + _2624;
    float _2658 = fma(_2626, _2380, _2584);
    float _2660 = float(uint(_1834));
    float _2662 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2646);
    int _2664 = _2656 >> 2;
    float _2666 = _2086 + (-0.5);
    float _2668 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2582);
    int _2670 = _2664 << 4;
    int _2672 = _2670 + 656;
    float _2674 = as_type<float>(_1298) * _2660;
    float _2676 = -_2666;
    float _2678 = -_2668;
    float _2680 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2678);
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2684 = trunc(_2674);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    uint _2690 = uint(int(uint(_2672) >> uint(2)));
    uint _2692 = uint(int(uint(int(_2690)) >> uint(2)));
    int _2694 = int(_2690) & 3;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[int(_2692)][_2694];
    int _2698 = int(_2690) + 1;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    int _2702 = _2698 & 3;
    float _2704 = (*spvDescriptorSet0.vp_c9)._m0[int(_2700)][_2702];
    float _2706 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2710 = ~_953;
    int _2712 = _2710 + 1;
    float _2714 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2716 = -_2708;
    float _2718 = fma(_2706, 2.0, _2716);
    float _2720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2722 = _2672 + 8;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    uint _2726 = uint(int(uint(int(_2724)) >> uint(2)));
    int _2728 = int(_2724) & 3;
    float _2730 = (*spvDescriptorSet0.vp_c9)._m0[int(_2726)][_2728];
    int _2732 = int(_2724) + 1;
    uint _2734 = uint(int(uint(_2732) >> uint(2)));
    int _2736 = _2732 & 3;
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[int(_2734)][_2736];
    float _2740 = -_1432;
    float _2742 = fma(_2714, 2.0, _2740);
    float _2744 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2748 = _2674;
    if (_2652)
    {
        _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2750 = _2748;
    float _2752 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2754 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2566);
    int _2756 = _2712 * int(_2688);
    int _2758 = _2756 + _1834;
    float _2760 = fma(_2744, -2.0, _2682);
    float _2762 = fma(_2752, -2.0, _2746);
    int _2764 = as_type<int>(_2750);
    if (_2652)
    {
        float _2766 = _2750 * 5.0;
        _2764 = as_type<int>(_2766);
    }
    int _2768 = _2764;
    float _2770 = float(uint(_2758));
    float _2772 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2570);
    int _2774 = abs(_2122);
    float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9671 = as_type<float>(_2768);
        out.gl_Position.z = _9671;
    }
    float _2778 = as_type<float>(_1298) * _2770;
    float _2780 = -_2754;
    float _2782 = _2780 + 1.0;
    float _2784 = -_2772;
    float _2786 = _2784 + 1.0;
    int _2788 = abs(_2182);
    float _2790 = fma(_2520, _2350, _2658);
    float _2792 = -_2782;
    float _2794 = fma(_2792, _1942, _2662);
    float _2796 = _2720 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2798 = fma(_2786, _2074, _2614);
    int _2800 = ~_2164;
    int _2802 = _2800 + _2232;
    int _2804 = _2802 + 1;
    float _2806 = trunc(_2778);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    int _2812 = ~_2148;
    int _2814 = _2812 + _2212;
    int _2816 = _2814 + 1;
    float _2818 = _1586 + (-0.5);
    float _2820 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2760);
    out.m_84.x = _2794;
    out.m_84.y = _2798;
    int _2822 = abs(_2204);
    float _2824 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2826 = -_2796;
    float _2828 = -_2820;
    float _2830 = fma(_2826, _2818, _2828);
    float _2832 = _1486 + 0.5;
    int _2834 = abs(_2138);
    float _2836 = -_135;
    float _2838 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2742);
    int _2840 = ~_2774;
    int _2842 = _2840 + 1;
    int _2844 = _2842 + 1;
    float _2846 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2790);
    int _2848 = abs(_2196);
    int _2850 = _953 * _2804;
    int _2852 = _2850 + _1926;
    int _2854 = int(_2688) + int(_2810);
    int _2856 = _2844 * as_type<int>(_2704);
    int _2858 = ~_2834;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2866 = int(_2864);
    float _2868 = fma(_2824, _2832, _2838);
    bool _2870 = !_1766;
    int _2872 = _2870 ? _2852 : (-1);
    int _2874 = _2862 * as_type<int>(_2696);
    int _2876 = _2874 + _2856;
    int _2878 = ~_2788;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    out.m_86.x = _2846;
    int _2884 = ~_2848;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    float _2890 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2762);
    int _2892 = _1922 >> 31;
    int _2894 = _2882 * as_type<int>(_2730);
    int _2896 = _2894 + _2876;
    int _2898 = ~_2822;
    int _2900 = _2898 + 1;
    int _2902 = _2900 + 1;
    float _2904 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2606);
    int _2906 = _2892 & 3;
    int _2908 = _2888 * as_type<int>(_2738);
    int _2910 = _2908 + _2896;
    int _2912 = _2872 >> 31;
    int _2914 = _931 * _2816;
    int _2916 = _2914 + _1718;
    int _2918 = _1922 + _2906;
    int _2920 = _2910 * _2902;
    int _2922 = _2912 & 3;
    float _2924 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2650);
    bool _2926 = !_1638;
    int _2928 = _2926 ? _2916 : (-1);
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = float(uint(_2866));
    float _2936 = -_2924;
    float _2938 = _2936 + 1.0;
    bool _2940 = !_2220;
    int _2942 = _2940 ? 0 : 1;
    int _2944 = _2928 * _2822;
    int _2946 = _2944 + _2920;
    int _2948 = _2872 & 3;
    bool _2950 = _2948 != 0;
    float _2952 = 1.0 / _2934;
    int _2954 = _2872 + _2922;
    float _2956 = -_2938;
    float _2958 = fma(_1486, _2956, _2868);
    int _2960 = _2918 >> 2;
    float _2962 = _2958;
    if (_2652)
    {
        out.m_63.x = 0.0;
    }
    int _2964 = _2872 & 3;
    bool _2966 = _2964 != 0;
    int _2968 = abs(_2866);
    int _2970 = _2950 ? 0 : 1;
    int _2972 = _2960 << 4;
    int _2974 = _2972 + 368;
    bool _2976 = uint(_2964) > 1u;
    int _2978 = _2954 >> 2;
    float _2980 = float(uint(_2968));
    uint _2982 = uint(int(uint(_2974) >> uint(2)));
    uint _2984 = uint(int(uint(int(_2982)) >> uint(2)));
    int _2986 = int(_2982) & 3;
    float _2988 = (*spvDescriptorSet0.vp_c9)._m0[int(_2984)][_2986];
    int _2990 = int(_2982) + 1;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    int _2994 = _2990 & 3;
    float _2996 = (*spvDescriptorSet0.vp_c9)._m0[int(_2992)][_2994];
    int _2998 = _2978 << 4;
    int _3000 = _2998 + 800;
    int _3002 = ~_2970;
    int _3004 = _3002 + 1;
    int _3006 = _3004 + 1;
    float _3008 = 1.0 / _2980;
    int _3010 = ~_953;
    int _3012 = _3010 + 1;
    uint _3014 = uint(int(uint(_3000) >> uint(2)));
    uint _3016 = uint(int(uint(int(_3014)) >> uint(2)));
    int _3018 = int(_3014) & 3;
    float _3020 = (*spvDescriptorSet0.vp_c9)._m0[int(_3016)][_3018];
    int _3022 = int(_3014) + 1;
    uint _3024 = uint(int(uint(_3022) >> uint(2)));
    int _3026 = _3022 & 3;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[int(_3024)][_3026];
    int _3030 = _3006;
    if (!_2976)
    {
        int _3032 = ~_2970;
        int _3034 = _3032 + 1;
        _3030 = _3034;
    }
    int _3036 = _3030;
    bool _3038 = _2964 != 3;
    int _3040 = _3012 * _2854;
    int _3042 = _3040 + _1834;
    int _3044 = as_type<int>(_2952) + (-2);
    float _3046 = float(uint(_2946));
    bool _3048 = !_2966;
    int _3050 = _3048 ? 0 : 1;
    bool _3052 = uint(_2964) >= 2u;
    float _3054 = as_type<float>(_3044) * _3046;
    bool _3056 = !_1950;
    int _3058 = _3056 ? 0 : 1;
    int _3060 = _3052 ? 0 : 1;
    int _3062 = abs(_2946);
    float _3064 = trunc(_3054);
    float _3066 = precise::max(_3064, 0.0);
    uint _3068 = uint(_3066);
    bool _3070 = uint(_3042) >= uint(_953);
    int _3072 = as_type<int>(_3008) + (-2);
    int _3074 = _2974 + 8;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    uint _3078 = uint(int(uint(int(_3076)) >> uint(2)));
    int _3080 = int(_3076) & 3;
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[int(_3078)][_3080];
    int _3084 = int(_3076) + 1;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    int _3088 = _3084 & 3;
    float _3090 = (*spvDescriptorSet0.vp_c9)._m0[int(_3086)][_3088];
    int _3092 = ~_3060;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    int _3098 = _3096;
    if (_3038)
    {
        int _3100 = ~_3060;
        int _3102 = _3100 + 1;
        _3098 = _3102;
    }
    int _3104 = _3098;
    float _3106 = float(uint(_3062));
    bool _3108 = _2964 != 3;
    int _3110 = _3000 + 8;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    uint _3114 = uint(int(uint(int(_3112)) >> uint(2)));
    int _3116 = int(_3112) & 3;
    float _3118 = (*spvDescriptorSet0.vp_c9)._m0[int(_3114)][_3116];
    int _3120 = int(_3112) + 1;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    int _3124 = _3120 & 3;
    float _3126 = (*spvDescriptorSet0.vp_c9)._m0[int(_3122)][_3124];
    float _3128 = as_type<float>(_3072) * _3106;
    bool _3130 = _1948 != 3;
    int _3132 = ~_2866;
    int _3134 = _3132 + 1;
    float _3136 = trunc(_3128);
    float _3138 = precise::max(_3136, 0.0);
    uint _3140 = uint(_3138);
    bool _3142 = !_3070;
    int _3144 = _3142 ? 0 : (-1);
    bool _3146 = !_3130;
    int _3148 = _3146 ? 0 : (-1);
    int _3150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3152 = _3150 != 0;
    int _3154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3156 = _3154 != 0;
    int _3158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3160 = _3158 != 0;
    int _3162 = ~_2098;
    int _3164 = _3162 + _2162;
    int _3166 = _3164 + 1;
    int _3168 = _3134 * int(_3068);
    int _3170 = _3168 + _2946;
    int _3172 = abs(_1998);
    int _3174 = ~_2968;
    int _3176 = _3174 + 1;
    int _3178 = _925 * _3166;
    int _3180 = _3178 + _1268;
    int _3182 = ~_3172;
    int _3184 = _3182 + 1;
    int _3186 = _3184 + 1;
    float _3188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3190 = abs(_3036);
    float _3192 = float(uint(_3170));
    int _3194 = _3186 * as_type<int>(_2996);
    int _3196 = ~_3190;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    float _3202 = as_type<float>(_3044) * _3192;
    int _3204 = ~_2854;
    int _3206 = _3204 + _3144;
    int _3208 = _3206 + 1;
    int _3210 = _3176 * int(_3140);
    int _3212 = _3210 + _3062;
    int _3214 = abs(_3050);
    int _3216 = _3200 * as_type<int>(_3028);
    int _3218 = abs(_3058);
    float _3220 = trunc(_3202);
    float _3222 = precise::max(_3220, 0.0);
    uint _3224 = uint(_3222);
    float _3226 = float(uint(_3212));
    int _3228 = _953 * _3208;
    int _3230 = _3228 + _1834;
    int _3232 = abs(_2038);
    int _3234 = ~_3218;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    float _3240 = as_type<float>(_3072) * _3226;
    int _3242 = ~_3214;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    int _3248 = abs(_3104);
    int _3250 = _3238 * as_type<int>(_2988);
    int _3252 = _3250 + _3194;
    float _3254 = trunc(_3240);
    float _3256 = precise::max(_3254, 0.0);
    uint _3258 = uint(_3256);
    int _3260 = ~_3232;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    int _3266 = _3246 * as_type<int>(_3020);
    int _3268 = _3266 + _3216;
    int _3270 = ~_3248;
    int _3272 = _3270 + 1;
    int _3274 = _3272 + 1;
    int _3276 = abs(_3148);
    int _3278 = _3264 * as_type<int>(_3082);
    int _3280 = _3278 + _3252;
    bool _3282 = !_3108;
    int _3284 = _3282 ? 0 : (-1);
    int _3286 = _3274 * as_type<int>(_3118);
    int _3288 = _3286 + _3268;
    int _3290 = ~_2866;
    int _3292 = _3290 + 1;
    int _3294 = int(_3068) + int(_3224);
    int _3296 = ~_3276;
    int _3298 = _3296 + 1;
    int _3300 = _3298 + 1;
    int _3302 = abs(_3284);
    int _3304 = _3292 * _3294;
    int _3306 = _3304 + _2946;
    int _3308 = abs(_2942);
    int _3310 = _3300 * as_type<int>(_3090);
    int _3312 = _3310 + _3280;
    bool _3314 = _925 == 0;
    int _3316 = ~_3302;
    int _3318 = _3316 + 1;
    int _3320 = _3318 + 1;
    int _3322 = int(_3140) + int(_3258);
    int _3324 = ~_2968;
    int _3326 = _3324 + 1;
    int _3328 = _3320 * as_type<int>(_3126);
    int _3330 = _3328 + _3288;
    bool _3332 = !_3314;
    int _3334 = _3332 ? _3180 : (-1);
    int _3336 = _3326 * _3322;
    int _3338 = _3336 + _3062;
    bool _3340 = uint(_3306) >= uint(_2866);
    int _3342 = ~_3308;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3350 = !_3340;
    int _3352 = _3350 ? 0 : (-1);
    bool _3354 = uint(_3338) >= uint(_2968);
    int _3356 = _3312 * _3346;
    int _3358 = ~_3294;
    int _3360 = _3358 + _3352;
    int _3362 = _3360 + 1;
    float _3364 = -_135;
    float _3366 = fma(_3364, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2718);
    bool _3368 = !_2226;
    int _3370 = _3368 ? 0 : 1;
    int _3372 = _3334 * _3308;
    int _3374 = _3372 + _3356;
    int _3376 = _2946 ^ _2866;
    bool _3378 = !_3354;
    int _3380 = _3378 ? 0 : (-1);
    int _3382 = abs(_3370);
    int _3384 = _2866 * _3362;
    int _3386 = _3384 + _2946;
    uint _3388 = uint(int(uint(_3376) >> uint(31)));
    float _3390 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3392 = _2866 == 0;
    int _3394 = ~_3380;
    int _3396 = _3322 + _3394;
    int _3398 = _3396 + 1;
    int _3400 = ~int(_3388);
    int _3402 = _3400 + 1;
    bool _3404 = !_3392;
    int _3406 = _3404 ? _3386 : (-1);
    int _3408 = _3398 ^ _3402;
    float _3410 = float(_3406);
    int _3412 = ~_3382;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    bool _3418 = _2866 == 0;
    int _3420 = ~_3402;
    int _3422 = _3420 + _3408;
    int _3424 = _3422 + 1;
    float _3426 = fma(_3390, _3410, _3366);
    bool _3428 = !_1766;
    int _3430 = _3428 ? _3230 : (-1);
    int _3432 = _3330 * _3416;
    bool _3434 = !_3418;
    int _3436 = _3434 ? _3424 : (-1);
    float _3438 = _1248 + 0.5;
    int _3440 = _3430 * _3382;
    int _3442 = _3440 + _3432;
    float _3444 = float(_3436);
    float _3446 = _3188 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3448 = fma(_3390, _3438, _3426);
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3452 = -_2890;
    float _3454 = fma(_3446, _3444, _3452);
    float _3456 = _1244 + (-0.5);
    float _3458 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3460 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3450);
    float _3462 = -_3446;
    float _3464 = fma(_3462, _3456, _3454);
    float _3466 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3458);
    float _3468 = _2564 * _2564;
    float _3470 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3460);
    float _3472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3474 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3466);
    float _3476 = -_3470;
    float _3478 = _3476 + 1.0;
    float _3480 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3472);
    float _3482 = -_3474;
    float _3484 = _3482 + 1.0;
    float _3486 = fma(_2590, _2590, _3468);
    float _3488 = -_3478;
    float _3490 = fma(_1248, _3488, _3448);
    float _3492 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3480);
    float _3494 = -_3484;
    float _3496 = fma(_2442, _3494, _2632);
    float _3498 = fma(_2602, _2602, _3486);
    float _3500 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3502 = -_3492;
    float _3504 = _3502 + 1.0;
    float _3506 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3508 = rsqrt(_3498);
    float _3510 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3500);
    float _3512 = fma(_1586, _2932, _2830);
    float _3514 = float(_3374);
    float _3516 = fma(_2086, _3504, _2680);
    float _3518 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3510);
    float _3520 = _3506 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3522 = float(_3442);
    out.m_88.x = _3514;
    float _3524 = -_3518;
    float _3526 = _3524 + 1.0;
    bool _3528 = !_3156;
    int _3530 = _3528 ? 0 : 1;
    out.m_90.x = _3496;
    out.m_90.y = _3516;
    out.m_90.z = _2958;
    out.m_90.w = _3512;
    float _3532 = fma(_1244, _3526, _3464);
    bool _3534 = !_3160;
    int _3536 = _3534 ? 0 : 1;
    float _3538 = _3520 * _3508;
    out.m_88.w = _3522;
    bool _3540 = !_3152;
    int _3542 = _3540 ? 0 : 1;
    float _3544 = _2590 * _3538;
    out.m_92.x = _3490;
    out.m_92.y = _3532;
    float _3546 = _2564 * _3538;
    if (_2652)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3548 = -_3546;
    float _3550 = _2492 + _3548;
    float _3552 = _2602 * _3538;
    float _3554 = -_3544;
    float _3556 = _2478 + _3554;
    float _3558 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3560 = _3550 + _3558;
    float _3562 = -_3552;
    float _3564 = _2532 + _3562;
    float _3566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3568 = _3556 + _3566;
    float _3570 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3574 = _3564 + _3572;
    float _3576 = fma(_3568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3570);
    float _3578 = fma(_3574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3576);
    bool _3580 = _3578 >= 0.0;
    float _3582 = _3568;
    float _3584 = _3564;
    if (_3580)
    {
        _2962 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3586 = _2962;
    int _3588 = as_type<int>(_3586);
    if (_3580)
    {
        out.m_63.x = 0.0;
    }
    if (_3580)
    {
        float _3590 = _3586 * 5.0;
        _3588 = as_type<int>(_3590);
    }
    int _3592 = _3588;
    if (_3580)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10850 = as_type<float>(_3592);
        out.gl_Position.z = _10850;
    }
    if (_3580)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3594 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3596 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3598 = floor(_3594);
    float _3600 = floor(_3596);
    float _3602 = -_3598;
    float _3604 = _3594 + _3602;
    float _3606 = -_3600;
    float _3608 = _3596 + _3606;
    float2 _10886 = float2(_3604, _3608);
    float _3610 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10886, float2(0.0), isnan(_10886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10886, float2(0.0), isnan(_10886)), level(0.0)).x;
    float _3612 = _1134 * 2.0;
    float _3614 = _1114 * 2.0;
    float _3616 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3618 = log2(_3616);
    float _3620 = _1116 + _1114;
    float _3622 = _1116 * 2.0;
    int _3624 = abs(_3542);
    float _3626 = -_3546;
    float _3628 = _2564 + _3626;
    float _3630 = _3620 + (-1.0);
    float _3632 = -_3544;
    float _3634 = _2590 + _3632;
    float _3636 = -_3552;
    float _3638 = _2602 + _3636;
    float _3640 = floor(_3612);
    float _3642 = _3628 * _3628;
    int _3644 = abs(_3536);
    float _3646 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3648 = floor(_3614);
    float _3650 = _3618 * _135;
    bool _3652 = _3640 > 0.0;
    float _3654 = floor(_3622);
    bool _3656 = _3640 >= 0.0;
    bool _3658 = isnan(_3640);
    bool _3660 = _3656 || _3658;
    bool _3662 = isnan(0.0);
    bool _3664 = _3660 || _3662;
    float _3666 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3668 = _1116 + _1134;
    float _3670 = _1116 + (-0.5);
    int _3672 = _3664 ? 0 : 1;
    float _3674 = _3668 + (-1.0);
    bool _3676 = _3648 >= 0.0;
    bool _3678 = isnan(_3648);
    bool _3680 = _3676 || _3678;
    bool _3682 = isnan(0.0);
    bool _3684 = _3680 || _3682;
    float _3686 = exp2(_3650);
    int _3688 = ~_3672;
    int _3690 = _3688 + 1;
    int _3692 = _3690 + 1;
    float _3694 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3696 = _3692;
    int _3698 = 2;
    if (!_3652)
    {
        int _3700 = ~_3672;
        int _3702 = _3700 + 1;
        _3696 = _3702;
    }
    int _3704 = _3696;
    float _3706 = _3550 + _3694;
    bool _3708 = _3648 > 0.0;
    bool _3710 = _3654 > 0.0;
    float _3712 = fma(_3674, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _3714 = _3654 >= 0.0;
    bool _3716 = isnan(_3654);
    bool _3718 = _3714 || _3716;
    bool _3720 = isnan(0.0);
    bool _3722 = _3718 || _3720;
    float _3724 = in.m_94.x;
    float _3726 = in.m_94.y;
    float _3728 = in.m_94.z;
    float _3730 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3732 = 1.0 + _3730;
    int _3734 = _3684 ? 0 : 1;
    float _3736 = float(_3704);
    float _3738 = 1.0 / _3732;
    float _3740 = float(_3624);
    float _3742 = -_3686;
    float _3744 = _3742 + 1.0;
    int _3746 = ~_3734;
    int _3748 = _3746 + 1;
    int _3750 = _3748 + 1;
    int _3752 = _3750;
    if (!_3708)
    {
        int _3754 = ~_3734;
        int _3756 = _3754 + 1;
        _3752 = _3756;
    }
    int _3758 = _3752;
    float _3760 = _3740 * _3736;
    bool _3762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3764 = isnan(1.0);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3770 = _3766 || _3768;
    float _3772 = fma(_3634, _3634, _3642);
    int _3774 = abs(_3530);
    float _3776 = _3760 * (-2.0);
    float _3778 = float(_3758);
    float _3780 = fma(_3638, _3638, _3772);
    float _3782 = float(_3774);
    float _3784 = fma(_3666, _3776, _3666);
    bool _3786 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3788 = isnan(0.0);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3794 = _3790 || _3792;
    float _3796 = _3782 * _3778;
    float _3798 = _3794 ? _3744 : 0.0;
    float _3800 = _1114 + (-0.5);
    float _3802 = fma(_3776, _3724, _3724);
    float _3804 = _1114 + _1134;
    float _3806 = _1134 + (-0.5);
    if (_3770)
    {
        float _3808 = _3798 * _3738;
        _145 = _3808;
    }
    float _3810 = _145;
    float _3812 = fma(_3800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3802);
    int _3814 = _3722 ? 0 : 1;
    float _3816 = _3796 * (-2.0);
    float _3818 = _3804 + (-1.0);
    float _3820 = fma(_3784, _3810, _3812);
    int _3822 = ~_3814;
    int _3824 = _3822 + 1;
    int _3826 = _3824 + 1;
    float _3828 = fma(_3712, _3816, _3712);
    float _3830 = fma(_3816, _3726, _3726);
    int _3832 = _3826;
    if (!_3710)
    {
        int _3834 = ~_3814;
        int _3836 = _3834 + 1;
        _3832 = _3836;
    }
    int _3838 = _3832;
    float _3840 = _3820 * 0.15915493667125701904296875;
    float _3842 = fma(_3670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3830);
    float _3844 = float(_3838);
    float _3846 = _3840 * 6.283185482025146484375;
    float _3848 = sin(_3846);
    float _3850 = float(_3644);
    float _3852 = fma(_3828, _3810, _3842);
    float _3854 = _3850 * _3844;
    float _3856 = _3852 * 0.15915493667125701904296875;
    float _3858 = _3840 * 6.283185482025146484375;
    float _3860 = cos(_3858);
    float _3862 = _3854 * (-2.0);
    float _3864 = fma(_3818, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3866 = fma(_3862, _3728, _3728);
    float _3868 = fma(_3864, _3862, _3864);
    float _3870 = _3856 * 6.283185482025146484375;
    float _3872 = sin(_3870);
    float _3874 = fma(_3806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3866);
    float _3876 = fma(_3868, _3810, _3874);
    float _3878 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3880 = _3856 * 6.283185482025146484375;
    float _3882 = cos(_3880);
    float _3884 = _3876 * 0.15915493667125701904296875;
    float _3886 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3878);
    float _3888 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3886);
    float _3890 = sqrt(_3780);
    float _3892 = _3848 * _3872;
    float _3894 = _3888 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3896 = _3550 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3898 = _3860 * _3872;
    float _3900 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3896);
    float _3902 = 1.0 / _3894;
    float _3904 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3900);
    float _3906 = _3904 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3908 = _3884 * 6.283185482025146484375;
    float _3910 = sin(_3908);
    float _3912 = _3860 * _3882;
    float _3914 = _3508 * _3890;
    float _3916 = _3906 + _3894;
    float _3918 = _3914 * _3646;
    float _3920 = _3506 * _3914;
    float _3922 = _3884 * 6.283185482025146484375;
    float _3924 = cos(_3922);
    float _3926 = _3916 * _3902;
    float _3928 = _3926 * 0.5;
    float _3930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3932 = _3914 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3934 = _3932 * 0.5;
    float _3936 = _3930 * _3918;
    float _3938 = fma(_3910, _3912, _3892);
    float _3940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3942 = fma(_3928, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3940);
    float _3944 = fma(_3910, _3892, _3912);
    float _3946 = _3848 * _3882;
    float _3948 = 1.0 / _3942;
    float _3950 = -_3898;
    float _3952 = fma(_3910, _3946, _3950);
    float _3954 = _3860 * _3924;
    float _3956 = _3882 * _3924;
    float _3958 = _3848 * _3924;
    float _3960 = _3872 * _3924;
    float _3962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3964 = -_3946;
    float _3966 = fma(_3910, _3898, _3964);
    float _3968 = -_3936;
    float _3970 = _3910 * _3968;
    float _3972 = _3958 * _3936;
    float _3974 = _3962 * _3920;
    float _3976 = _3706 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3978 = _3954 * _3936;
    float _3980 = _3706 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3982 = fma(_3956, _3974, _3970);
    float _3984 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3976);
    float _3986 = fma(_3952, _3974, _3972);
    float _3988 = fma(_3938, _3974, _3978);
    float _3990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3992 = _3948 * _3990;
    float _3994 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3984);
    float _3996 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3980);
    float _3998 = fma(_3966, _3934, _3988);
    float _4000 = fma(_3960, _3934, _3982);
    bool _4002 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4004 = _3994 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4006 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4008 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4010 = fma(_3944, _3934, _3986);
    float _4012 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3996);
    float _4014 = trunc(_4004);
    int _4016 = int(_4014);
    float _4018 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4020 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4008);
    float _4022 = _4012 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4024 = !_4002;
    int _4026 = _4024 ? 0 : 1;
    float _4028 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4018);
    float _4030 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4020);
    int _4032 = as_type<int>(_3998);
    int _4034 = as_type<int>(_4010);
    float _4036 = _4004;
    if (!_4002)
    {
        _3698 = 1;
    }
    int _4038 = _3698;
    float _4040 = trunc(_4022);
    int _4042 = int(_4040);
    int _4044 = _4038;
    if (!_4006)
    {
        _4044 = _4026;
    }
    int _4046 = _4044;
    float _4048 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4028);
    float _4050 = _4030 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _4052 = _4046 << 6;
    float _4054 = _4048 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4056 = _2532 + _4050;
    int _4058 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4060 = _4016 + _4058;
    int _4062 = _4060 + 1;
    int _4064 = _4052 + 56;
    uint _4066 = uint(int(uint(_4064) >> uint(2)));
    uint _4068 = uint(int(uint(int(_4066)) >> uint(2)));
    int _4070 = int(_4066) & 3;
    float _4072 = (*spvDescriptorSet0.vp_c15)._m0[int(_4068)][_4070];
    int _4074 = int(_4066) + 1;
    uint _4076 = uint(int(uint(_4074) >> uint(2)));
    int _4078 = _4074 & 3;
    float _4080 = (*spvDescriptorSet0.vp_c15)._m0[int(_4076)][_4078];
    float _4082 = _2478 + _4054;
    float _4084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4086 = _4056 + _4084;
    bool _4088 = _4062 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4090 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4092 = _4082 + _4090;
    float _4094 = _4086 * _4086;
    int _4096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4098 = _4042 + _4096;
    int _4100 = _4098 + 1;
    int _4102 = _4052 + 48;
    uint _4104 = uint(int(uint(_4102) >> uint(2)));
    uint _4106 = uint(int(uint(int(_4104)) >> uint(2)));
    int _4108 = int(_4104) & 3;
    float _4110 = (*spvDescriptorSet0.vp_c15)._m0[int(_4106)][_4108];
    int _4112 = int(_4104) + 1;
    uint _4114 = uint(int(uint(_4112) >> uint(2)));
    int _4116 = _4112 & 3;
    float _4118 = (*spvDescriptorSet0.vp_c15)._m0[int(_4114)][_4116];
    float _4120 = fma(_4092, _4092, _4094);
    int _4122 = _4062 | _4100;
    float _4124 = sqrt(_4120);
    bool _4126 = _4122 < 0;
    bool _4128 = _4126 || _4088;
    int _4130 = _4052 + 64;
    uint _4132 = uint(int(uint(_4130) >> uint(2)));
    uint _4134 = uint(int(uint(int(_4132)) >> uint(2)));
    int _4136 = int(_4132) & 3;
    float _4138 = (*spvDescriptorSet0.vp_c15)._m0[int(_4134)][_4136];
    int _4140 = int(_4132) + 1;
    uint _4142 = uint(int(uint(_4140) >> uint(2)));
    int _4144 = _4140 & 3;
    float _4146 = (*spvDescriptorSet0.vp_c15)._m0[int(_4142)][_4144];
    float _4148 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _4150 = _4100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4152 = _4150 || _4128;
    float _4154 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4148);
    int _4156 = _4052 + 72;
    uint _4158 = uint(int(uint(_4156) >> uint(2)));
    uint _4160 = uint(int(uint(int(_4158)) >> uint(2)));
    int _4162 = int(_4158) & 3;
    float _4164 = (*spvDescriptorSet0.vp_c15)._m0[int(_4160)][_4162];
    int _4166 = int(_4158) + 1;
    uint _4168 = uint(int(uint(_4166) >> uint(2)));
    int _4170 = _4166 & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    float _4174 = fma(_4010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4154);
    float _4176 = _4174 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _4178 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4180 = _4052 + 96;
    uint _4182 = uint(int(uint(_4180) >> uint(2)));
    uint _4184 = uint(int(uint(int(_4182)) >> uint(2)));
    int _4186 = int(_4182) & 3;
    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[int(_4184)][_4186];
    int _4190 = int(_4182) + 1;
    uint _4192 = uint(int(uint(_4190) >> uint(2)));
    int _4194 = _4190 & 3;
    float _4196 = (*spvDescriptorSet0.vp_c15)._m0[int(_4192)][_4194];
    int _4198 = _4062;
    int _4200 = as_type<int>(_4174);
    float _4202 = _4094;
    float _4204 = _4082;
    float _4206 = _4056;
    if (!_4152)
    {
        int _4208 = _4100 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4210 = _4208 + _4062;
        _4032 = _4210;
    }
    int _4212 = _4032;
    float _4214 = _2492 + _4176;
    if (!_4152)
    {
        int _4216 = _4212 << 2;
        _4034 = _4216;
    }
    int _4218 = _4034;
    int _4220 = _4052 + 104;
    uint _4222 = uint(int(uint(_4220) >> uint(2)));
    uint _4224 = uint(int(uint(int(_4222)) >> uint(2)));
    int _4226 = int(_4222) & 3;
    float _4228 = (*spvDescriptorSet0.vp_c15)._m0[int(_4224)][_4226];
    int _4230 = int(_4222) + 1;
    uint _4232 = uint(int(uint(_4230) >> uint(2)));
    int _4234 = _4230 & 3;
    float _4236 = (*spvDescriptorSet0.vp_c15)._m0[int(_4232)][_4234];
    float _4238 = as_type<float>(_4218);
    if (!_4152)
    {
        uint _4240 = uint(int(uint(_4212) >> uint(2)));
        _4198 = int(_4240);
    }
    int _4242 = _4198;
    float _4244 = as_type<float>(_4242);
    if (!_4152)
    {
        int _4246 = 12 & _4218;
        _4200 = _4246;
    }
    int _4248 = _4200;
    if (!_4178)
    {
        _4202 = _4082;
    }
    float _4250 = _4202;
    float _4252 = _4250;
    if (!_4152)
    {
        int _4254 = _4242 << 4;
        int _4256 = _4254 + _4248;
        _4244 = as_type<float>(_4256);
    }
    float _4258 = _4244;
    if (!_4178)
    {
        _4204 = _4214;
    }
    float _4260 = _4204;
    bool _4262 = !_4178;
    float _4264 = _4260;
    if (!_4262)
    {
        float _4266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4270 = _4124 + _4268;
        float _4272 = _4214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4274 = rsqrt(_4120);
        float _4276 = _4270 * _4266;
        float _4278 = _4276 * 0.15915493667125701904296875;
        float _4280 = _4278 * 6.283185482025146484375;
        float _4282 = cos(_4280);
        float _4284 = _4278 * 6.283185482025146484375;
        float _4286 = sin(_4284);
        float _4288 = _4282 + (-1.0);
        float _4290 = fma(_4286, _4272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4292 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4294 = _4274 * _4290;
        float _4296 = fma(_4214, _4282, _4292);
        float _4298 = fma(_4092, _4294, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4300 = fma(_4086, _4294, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4264 = _4296;
        _4252 = _4298;
        _4206 = _4300;
        _4238 = _4288;
    }
    float _4302 = _4264;
    float _4304 = _4252;
    float _4306 = _4206;
    float _4308 = _4238;
    float _4310 = -_2492;
    float _4312 = _4310 + _4302;
    int _4314 = _4052 + 80;
    uint _4316 = uint(int(uint(_4314) >> uint(2)));
    uint _4318 = uint(int(uint(int(_4316)) >> uint(2)));
    int _4320 = int(_4316) & 3;
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[int(_4318)][_4320];
    int _4324 = int(_4316) + 1;
    uint _4326 = uint(int(uint(_4324) >> uint(2)));
    int _4328 = _4324 & 3;
    float _4330 = (*spvDescriptorSet0.vp_c15)._m0[int(_4326)][_4328];
    float _4332 = -_2478;
    float _4334 = _4332 + _4304;
    float _4336 = -_2532;
    float _4338 = _4336 + _4306;
    float _4340 = _4312 * _4312;
    float _4342 = _3706 * _4196;
    float _4344 = _4308;
    float _4346 = _4340;
    float _4348 = _4304;
    float _4350 = _4302;
    float _4352 = _4306;
    if (!_4152)
    {
        float _4354 = floor(_4004);
        _4344 = _4354;
    }
    float _4356 = _4344;
    float _4358 = _3706 * _4146;
    float _4360 = fma(_4334, _4334, _4340);
    int _4362 = _4052 + 88;
    uint _4364 = uint(int(uint(_4362) >> uint(2)));
    uint _4366 = uint(int(uint(int(_4364)) >> uint(2)));
    int _4368 = int(_4364) & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    int _4372 = int(_4364) + 1;
    uint _4374 = uint(int(uint(_4372) >> uint(2)));
    int _4376 = _4372 & 3;
    float _4378 = (*spvDescriptorSet0.vp_c15)._m0[int(_4374)][_4376];
    float _4380 = fma(_3556, _4188, _4342);
    float _4382 = fma(_3556, _4138, _4358);
    float _4384 = fma(_4338, _4338, _4360);
    float _4386 = fma(_3564, _4228, _4380);
    if (!_4152)
    {
        float _4388 = floor(_4022);
        _4346 = _4388;
    }
    float _4390 = _4346;
    bool _4392 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4394 = isnan(0.5);
    bool _4396 = _4392 || _4394;
    bool _4398 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4400 = _4396 || _4398;
    float _4402 = _4258;
    float _4404 = _4390;
    if (!_4152)
    {
        int _4406 = as_type<int>(_4258) + 400;
        uint _4408 = uint(int(uint(_4406) >> uint(2)));
        uint _4410 = uint(int(uint(int(_4408)) >> uint(2)));
        int _4412 = int(_4408) & 3;
        float _4414 = (*spvDescriptorSet0.vp_c15)._m0[int(_4410)][_4412];
        _4402 = _4414;
    }
    float _4416 = _4402;
    float _4418 = _4386 + _4236;
    float _4420 = _3706 * _4118;
    float _4422 = fma(_3564, _4164, _4382);
    float _4424 = sqrt(_4384);
    float _4426 = fma(_3556, _4110, _4420);
    float _4428 = fma(_3564, _4072, _4426);
    float _4430 = 1.0 / _4418;
    bool _4432 = _4424 > 0.0;
    bool _4434 = !_4432;
    if (!_4434)
    {
        float _4436 = _245 * _245;
        float _4438 = rsqrt(_4384);
        float _4440 = fma(_237, _237, _4436);
        float _4442 = fma(_247, _247, _4440);
        float _4444 = sqrt(_4442);
        float _4446 = _4334 * _4438;
        float _4448 = _4312 * _4438;
        float _4450 = _4338 * _4438;
        bool _4452 = _4444 > 0.0;
        bool _4454 = !_4452;
        if (!_4454)
        {
            float _4456 = rsqrt(_4442);
            float _4458 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4460 = _245 * _4456;
            float _4462 = _237 * _4456;
            float _4464 = _247 * _4456;
            float _4466 = _4448 * _4460;
            float _4468 = fma(_4446, _4462, _4466);
            float _4470 = _4458 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4472 = fma(_4450, _4464, _4468);
            float _4474 = _4472 * _4470;
            float _4476 = fma(_237, _4474, _4304);
            float _4478 = fma(_245, _4474, _4302);
            float _4480 = fma(_247, _4474, _4306);
            _4348 = _4476;
            _4350 = _4478;
            _4352 = _4480;
        }
    }
    float _4482 = _4348;
    float _4484 = _4350;
    float _4486 = _4352;
    float _4488 = -_3544;
    float _4490 = _4488 + _4482;
    float _4492 = -_3546;
    float _4494 = _4492 + _4484;
    float _4496 = -_3552;
    float _4498 = _4496 + _4486;
    float _4500 = _4428 + _4080;
    float _4502 = _4422 + _4172;
    float _4504 = _4494;
    float _4506 = _4490;
    float _4508 = _4498;
    float _4510 = _4502;
    if (!_4400)
    {
        float _4512 = _3560 * _3560;
        float _4514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4516 = -_2532;
        float _4518 = _4516 + _4486;
        float _4520 = -_2492;
        float _4522 = _4520 + _4484;
        float _4524 = fma(_3568, _3568, _4512);
        float _4526 = -_2478;
        float _4528 = _4526 + _4482;
        float _4530 = fma(_3574, _3574, _4524);
        float _4532 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4534 = sqrt(_4530);
        float _4536 = 1.0 / _3914;
        float _4538 = precise::min(_4534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4540 = _4538 * _4514;
        float _4542 = _4532 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4544 = _4540 * _4536;
        float _4546 = _4542 * _4544;
        float _4548 = _4518 * _4544;
        float _4550 = fma(_4522, _4546, _3550);
        float _4552 = fma(_4528, _4546, _3556);
        float _4554 = fma(_4542, _4548, _3564);
        _4504 = _4550;
        _4506 = _4552;
        _4508 = _4554;
    }
    float _4556 = _4504;
    float _4558 = _4506;
    float _4560 = _4508;
    float _4562 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4564 = _4500 * _4430;
    float _4566 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4568 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4570 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4562);
    float _4572 = _4502 * _4430;
    float _4574 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4566);
    bool _4576 = _4564 >= 0.0;
    float _4578 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4570);
    float _4580 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4582 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4584 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4574);
    float _4586 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4588 = _4564 <= 1.0;
    bool _4590 = _4588 && _4576;
    float _4592 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4580);
    float _4594 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4582);
    float _4596 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4598 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4600 = _4572 >= 0.0;
    bool _4602 = _4600 && _4590;
    float _4604 = _4592 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4606 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4594);
    float _4608 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4598);
    bool _4610 = _4572 <= 1.0;
    bool _4612 = _4610 && _4602;
    float _4614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4616 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4618 = _4606 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4620 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4608);
    float _4622 = _3706 * _4330;
    float _4624 = -_4616;
    float _4626 = fma(_4624, _4614, 1.0);
    float _4628 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4630 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4632 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4634 = fma(_3556, _4322, _4622);
    float _4636 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4628);
    float _4638 = 1.0 / _4630;
    float _4640 = _4594;
    float _4642 = _4592;
    float _4644 = _4630;
    if (_4612)
    {
        float _4646 = float(_4046);
        _4640 = _4646;
    }
    float _4648 = _4640;
    float _4650 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4632);
    float _4652 = fma(_3564, _4370, _4634);
    float _4654 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4636);
    if (!_4152)
    {
        float _4656 = -_4390;
        float _4658 = _4022 + _4656;
        _4404 = _4658;
    }
    float _4660 = _4404;
    float _4662 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4650);
    float _4664 = _4652 + _4378;
    float _4666 = log2(_4626);
    float _4668 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4654);
    float _4670 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4662);
    if (!_4152)
    {
        float _4672 = -_4356;
        float _4674 = _4004 + _4672;
        _4510 = _4674;
    }
    float _4676 = _4510;
    float _4678 = _4664 * _4430;
    float _4680 = _4422;
    if (!_4152)
    {
        float _4682 = rint(_4416);
        float _4684 = precise::max(_4682, 0.0);
        uint _4686 = uint(_4684);
        uint _4688 = clamp(_4686, 0u, 65535u);
        _4680 = as_type<float>(_4688);
    }
    float _4690 = _4680;
    float _4692 = _4668 * _4638;
    float _4694 = _4670 * _4638;
    float _4696 = fma(_4692, 0.5, 0.5);
    float _4698 = fma(_4694, -0.5, 0.5);
    float _4700 = _4648;
    if (_4612)
    {
        float _4702 = rint(_4648);
        float _4704 = precise::max(_4702, 0.0);
        uint _4706 = uint(_4704);
        uint _4708 = clamp(_4706, 0u, 65535u);
        _4700 = as_type<float>(_4708);
    }
    float _4710 = _4700;
    float _4712 = _4666 * 0.693147182464599609375;
    float _4714 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4716 = _4660;
    float _4718 = _4714;
    if (!_4152)
    {
        float3 _12635 = float3(_4676, _4660, float(as_type<int>(_4690)));
        float3 _12639 = select(_12635, float3(0.0), isnan(_12635));
        float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12639.xy, uint(rint(_12639.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12639.xy, uint(rint(_12639.z)), level(0.0)).x;
        _4716 = _4720;
    }
    float _4722 = _4716;
    float _4724 = _4712;
    if (_4612)
    {
        float3 _12654 = float3(_4564, _4572, float(as_type<int>(_4710)));
        float3 _12656 = select(_12654, float3(0.0), isnan(_12654));
        float _4726 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12656.xy, uint(rint(_12656.z)), _4678, level(0.0));
        _4724 = _4726;
    }
    float _4728 = _4724;
    float3 _12666 = float3(_4696, _4698, _4714);
    float _4730 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12666, float3(0.0), isnan(_12666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12666, float3(0.0), isnan(_12666)), level(0.0)).x;
    float3 _12675 = float3(_4696, _4698, _4714);
    float4 _4733 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12675, float3(0.0), isnan(_12675)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12675, float3(0.0), isnan(_12675)), level(0.0)).xyzw;
    float _4735 = _4733.x;
    float _4737 = _4733.y;
    float _4739 = _4733.z;
    float _4741 = _4733.w;
    bool _4743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4745 = isnan(0.5);
    bool _4747 = _4743 || _4745;
    bool _4749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4751 = _4747 || _4749;
    if (_4152)
    {
        _3582 = 1.0;
    }
    float _4753 = _3582;
    float _4755 = _4753;
    if (_4751)
    {
        _4642 = 1.0;
    }
    float _4757 = _4642;
    float _4759 = _4757;
    float _4761 = _4737;
    float _4763 = _4735;
    if (!_4751)
    {
        float _4765 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4767 = _4765 * 0.15915493667125701904296875;
        float _4769 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4771 = _4767 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = _4769 * 0.15915493667125701904296875;
        float _4777 = _4767 * 6.283185482025146484375;
        float _4779 = sin(_4777);
        float _4781 = 1.0 / _4773;
        float _4783 = _4775 * 6.283185482025146484375;
        float _4785 = cos(_4783);
        float _4787 = _4779 * _4781;
        float _4789 = _4775 * 6.283185482025146484375;
        float _4791 = sin(_4789);
        float _4793 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4795 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4793;
        float _4797 = _4785 * _4787;
        float _4799 = 1.0 / _4795;
        float _4801 = 1.0 / _4797;
        float _4803 = _4791 * _4801;
        float _4805 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4807 = fma(_3992, _4803, _4805);
        float _4809 = _4807 * _4799;
        float _4811 = precise::clamp(_4809, 0.0, 1.0);
        _4718 = _4767;
        _4759 = _4811;
    }
    float _4813 = _4718;
    float _4815 = _4759;
    float _4817 = _4813;
    if (!_4152)
    {
        int _4819 = _4212 << 4;
        int _4821 = _4819 + 2048;
        uint _4823 = uint(int(uint(_4821) >> uint(2)));
        uint _4825 = uint(int(uint(int(_4823)) >> uint(2)));
        int _4827 = int(_4823) & 3;
        float _4829 = (*spvDescriptorSet0.vp_c15)._m0[int(_4825)][_4827];
        int _4831 = int(_4823) + 1;
        uint _4833 = uint(int(uint(_4831) >> uint(2)));
        int _4835 = _4831 & 3;
        float _4837 = (*spvDescriptorSet0.vp_c15)._m0[int(_4833)][_4835];
        int _4839 = _4821 + 8;
        uint _4841 = uint(int(uint(_4839) >> uint(2)));
        uint _4843 = uint(int(uint(int(_4841)) >> uint(2)));
        int _4845 = int(_4841) & 3;
        float _4847 = (*spvDescriptorSet0.vp_c15)._m0[int(_4843)][_4845];
        int _4849 = int(_4841) + 1;
        uint _4851 = uint(int(uint(_4849) >> uint(2)));
        int _4853 = _4849 & 3;
        float _4855 = (*spvDescriptorSet0.vp_c15)._m0[int(_4851)][_4853];
        float _4857 = _3706 * _4837;
        float _4859 = fma(_3556, _4829, _4857);
        float _4861 = fma(_3564, _4847, _4859);
        float _4863 = _4861 + _4855;
        float _4865 = precise::clamp(_4863, 0.0, 1.0);
        float _4867 = -_4865;
        float _4869 = _4867 + _4722;
        float _4871 = fma(_4869, 500.0, 1.5);
        float _4873 = exp2(_4871);
        float _4875 = 0.0 + _4873;
        float _4877 = precise::clamp(_4875, 0.0, 1.0);
        _4755 = _4877;
    }
    float _4879 = _4755;
    float _4881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4883 = _4556 + _4881;
    float _4885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4887 = _4558 + _4885;
    float _4889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4891 = _4560 + _4889;
    float _4893 = _4883 * _4883;
    float _4895 = fma(_4887, _4887, _4893);
    float _4897 = fma(_4891, _4891, _4895);
    float _4899 = rsqrt(_4897);
    float _4901 = _4899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4903 = _4887 * _4901;
    float _4905 = _4891 * _4901;
    float _4907 = _4903 * _4903;
    float _4909 = _4905 * _4905;
    float _4911 = _4907 + _4909;
    float _4913 = sqrt(_4911);
    bool _4915 = _4913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4919 = _4913 + _4917;
    float _4921 = _4891;
    float _4923 = _4919;
    float _4925 = _4883;
    if (_4915)
    {
        float _4927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4921 = _4927;
    }
    float _4929 = _4921;
    if (_4915)
    {
        float _4931 = rsqrt(_4911);
        _4817 = _4931;
    }
    float _4933 = _4817;
    float _4935 = _4933;
    if (_4915)
    {
        float _4937 = _4919 * _4929;
        _4923 = _4937;
    }
    float _4939 = _4923;
    if (_4915)
    {
        float _4941 = _4939 * 0.15915493667125701904296875;
        _3584 = _4941;
    }
    float _4943 = _3584;
    float _4945 = _4899;
    if (_4915)
    {
        float _4947 = _4943 * 6.283185482025146484375;
        float _4949 = sin(_4947);
        _4945 = _4949;
    }
    float _4951 = _4945;
    float _4953 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4955 = precise::max(0.0, _4953);
    float _4957 = _4893;
    float _4959 = _4955;
    float _4961 = _4953;
    if (_4915)
    {
        float _4963 = _4943 * 6.283185482025146484375;
        float _4965 = cos(_4963);
        _4957 = _4965;
    }
    float _4967 = _4957;
    float _4969 = -_4901;
    float _4971 = -_4955;
    float _4973 = fma(_4883, _4969, _4971);
    if (!_4915)
    {
        _4925 = _4905;
    }
    float _4975 = _4925;
    float _4977 = _4975;
    if (_4915)
    {
        float _4979 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4959 = _4979;
    }
    float _4981 = _4959;
    float _4983 = _4981;
    float _4985 = _4951;
    if (_4915)
    {
        float _4987 = fma(_4951, _4981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4983 = _4987;
    }
    float _4989 = _4983;
    float _4991 = _4989;
    if (!_4915)
    {
        _4985 = _4903;
    }
    float _4993 = _4985;
    float _4995 = _4993;
    float _4997 = _4967;
    if (_4915)
    {
        float _4999 = _4967 + (-1.0);
        _4961 = _4999;
    }
    float _5001 = _4961;
    float _5003 = _5001;
    if (_4915)
    {
        float _5005 = _4933 * _4989;
        _4036 = _5005;
    }
    float _5007 = _4036;
    if (!_4915)
    {
        _4991 = _4973;
    }
    float _5009 = _4991;
    float _5011 = _5009;
    if (_4915)
    {
        float _5013 = _5001 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5003 = _5013;
    }
    float _5015 = _5003;
    if (_4915)
    {
        float _5017 = _4903 * _5007;
        _4995 = _5017;
    }
    float _5019 = _4995;
    if (!_4915)
    {
        _4935 = _4907;
    }
    float _5021 = _4935;
    float _5023 = _5021;
    if (_4915)
    {
        float _5025 = _4905 * _5007;
        _4977 = _5025;
    }
    float _5027 = _4977;
    if (_4915)
    {
        float _5029 = fma(_4973, _4967, _5015);
        _5011 = _5029;
    }
    float _5031 = _5011;
    if (_4915)
    {
        float _5033 = _5019 * _5019;
        _5023 = _5033;
    }
    float _5035 = _5023;
    if (!_4915)
    {
        _4997 = _4909;
    }
    float _5037 = _4997;
    float _5039 = _5037;
    if (_4915)
    {
        float _5041 = _5027 * _5027;
        _5039 = _5041;
    }
    float _5043 = _5039;
    float _5045 = sqrt(_4897);
    float _5047 = fma(_5031, _5031, _5035);
    float _5049 = _5047 + _5043;
    float _5051 = rsqrt(_5049);
    float _5053 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5055 = fma(_5045, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5053);
    float _5057 = precise::clamp(_5055, 0.0, 1.0);
    float _5059 = -_5057;
    float _5061 = _5059 + 1.0;
    float _5063 = abs(_5061);
    float _5065 = log2(_5063);
    float _5067 = _5051 * _5019;
    float _5069 = _5051 * _5031;
    float _5071 = _5051 * _5027;
    float _5073 = _5067 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5075 = -_5073;
    float _5077 = fma(_5069, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5075);
    float _5079 = -_5071;
    float _5081 = fma(_5079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5077);
    float _5083 = _5065 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5085 = fma(_5081, -0.5, 0.5);
    float _5087 = fma(_5081, 0.5, 0.5);
    float _5089 = exp2(_5083);
    float _5091 = fma(_5087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5093 = fma(_5087, _5091, -0.212114393711090087890625);
    float _5095 = _5069 + 1.0;
    float _5097 = sqrt(_5085);
    float _5099 = fma(_5087, _5093, 1.570728778839111328125);
    float _5101 = -_5069;
    float _5103 = fma(_5089, _5095, _5101);
    float _5105 = fma(_5103, 0.5, 0.5);
    float _5107 = _5097 * 0.636619746685028076171875;
    float _5109 = -_5099;
    float _5111 = fma(_5107, _5109, 1.0);
    float2 _13243 = float2(_5111, _5105);
    float3 _5115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13243, float2(0.0), isnan(_13243)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13243, float2(0.0), isnan(_13243)), level(0.0)).xyz;
    float _5117 = _5115.x;
    float _5119 = _5115.y;
    float _5121 = _5115.z;
    float _5123 = abs(_3992);
    float _5125 = log2(_5123);
    float _5127 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5129 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5131 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5133 = _3938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5135 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5127);
    float _5137 = fma(_5129, _5129, 1.0);
    float _5139 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5131);
    float _5141 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5143 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5145 = _3954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5147 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5133);
    float _5149 = rsqrt(_5137);
    float _5151 = -_3910;
    float _5153 = fma(_5151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5141);
    float _5155 = -_3910;
    float _5157 = fma(_5155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5143);
    float _5159 = -_3910;
    float _5161 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5145);
    float _5163 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5165 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5167 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5169 = _3966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5171 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5147);
    float _5173 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5175 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5165);
    float _5177 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5167);
    float _5179 = exp2(_5163);
    float _5181 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5169);
    float _5183 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5153);
    float _5185 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5173);
    float _5187 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5139);
    float _5189 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5135);
    float _5191 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5193 = _5129 * _5183;
    float _5195 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5157);
    float _5197 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5161);
    float _5199 = fma(_4604, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5185);
    float _5201 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5175);
    float _5203 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5177);
    float _5205 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5181);
    float _5207 = fma(_5191, _5187, _5193);
    float _5209 = _5129 * _5195;
    float _5211 = _5129 * _5197;
    float _5213 = fma(_4618, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5199);
    float _5215 = _5129 * _5149;
    float _5217 = fma(_5191, _5189, _5209);
    float _5219 = fma(_5191, _5171, _5211);
    float _5221 = -_5201;
    float _5223 = _5215 * _5221;
    float _5225 = _4630 * 0.5;
    float _5227 = fma(_5179, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5229 = precise::clamp(_5227, 0.0, 1.0);
    out.m_96.x = _5187;
    out.m_96.y = _5189;
    out.m_96.z = _5171;
    float _5231 = _5065 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5233 = -_5205;
    float _5235 = _5215 * _5233;
    bool _5237 = _3992 <= 8000.0;
    bool _5239 = isnan(_3992);
    bool _5241 = _5237 || _5239;
    bool _5243 = isnan(8000.0);
    bool _5245 = _5241 || _5243;
    float _5247 = float(_5245);
    out.gl_Position.x = _4668;
    out.gl_Position.y = _4670;
    out.gl_Position.z = _5213;
    out.gl_Position.w = _4630;
    float _5249 = -_3610;
    float _5251 = _5249 + 1.0;
    float _5253 = _5213 + _4630;
    float _5255 = exp2(_5231);
    float _5257 = _5203 + _5217;
    bool _5259 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5261 = isnan(_5045);
    bool _5263 = _5259 || _5261;
    bool _5265 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5267 = _5263 || _5265;
    float _5269 = _5253 * 0.5;
    float _5271 = fma(_5149, _5183, _5223);
    float _5273 = fma(_4670, -0.5, _5225);
    float _5275 = _5201 + _5207;
    float _5277 = fma(_5229, -2.0, 3.0);
    float _5279 = _5229 * _5229;
    float _5281 = -_5203;
    float _5283 = _5215 * _5281;
    float _5285 = _5279 * _5277;
    float _5287 = fma(_5149, _5195, _5283);
    float _5289 = fma(_5149, _5197, _5235);
    float _5291 = _4668 + _4630;
    float _5293 = -_5285;
    float _5295 = _5293 + 1.0;
    float _5297 = -_5255;
    float _5299 = _5297 + 1.0;
    float _5301 = _5205 + _5219;
    float _5303 = _5291 * 0.5;
    float _5305 = fma(_5295, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5285);
    float _5307 = _5299 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_98.x = _5271;
    out.m_98.y = _5287;
    out.m_98.z = _5289;
    float _5309 = _5305;
    float _5311 = _5299;
    if (!_5267)
    {
        _4644 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5313 = _4644;
    float _5315 = _5247 * _5305;
    float _5317 = _5313;
    float _5319 = _5313;
    if (!_4612)
    {
        _5309 = 1.0;
    }
    float _5321 = _5309;
    out.m_100.x = _5303;
    out.m_100.y = _5273;
    out.m_100.z = _5269;
    out.m_100.w = _4630;
    float _5323 = _5321;
    if (_4612)
    {
        bool _5325 = _4728 >= _4678;
        bool _5327 = isnan(_4728);
        bool _5329 = _5325 || _5327;
        bool _5331 = isnan(_4678);
        bool _5333 = _5329 || _5331;
        float _5335 = float(_5333);
        _5323 = _5335;
    }
    float _5337 = _5323;
    float _5339 = _5315 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5267)
    {
        _5311 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5341 = _5311;
    out.m_102.x = _5275;
    out.m_102.y = _5257;
    out.m_102.z = _5301;
    float _5343 = _5251 * _5339;
    float _5345 = precise::clamp(_5343, 0.0, 1.0);
    float _5347 = _5337 * _4879;
    float _5349 = _5307 * _4730;
    float _5351 = -_5307;
    float _5353 = _5351 + 1.0;
    float _5355 = -_5345;
    float _5357 = fma(_5355, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5359 = _4815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5361 = _4741 * _5349;
    float _5363 = -_5347;
    float _5365 = fma(_5363, _5357, 1.0);
    float _5367 = precise::clamp(_5365, 0.0, 1.0);
    float _5369 = _4741 * _5353;
    float _5371 = _5353;
    float _5373 = _5367;
    float _5375 = _5341;
    float _5377 = _5341;
    if (!_5267)
    {
        _5371 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5379 = _5371;
    float _5381 = _5367 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5383 = _5379;
    float _5385 = _5379;
    if (!_5267)
    {
        _5373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5387 = _5373;
    out.m_104.x = _5381;
    float _5389 = _5121 * _5349;
    float _5391 = fma(_5117, _5361, _4735);
    float _5393 = fma(_5119, _5361, _4737);
    float _5395 = _5387;
    float _5397 = _5387;
    if (!_5267)
    {
        _4761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5399 = _4761;
    float _5401 = fma(_4741, _5389, _4739);
    float _5403 = _5399;
    float _5405 = _5399;
    if (!_5267)
    {
        _4763 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5407 = _4763;
    out.m_106.x = _5391;
    out.m_106.y = _5393;
    out.m_106.z = _5401;
    out.m_106.w = _5369;
    bool _5409 = !_5267;
    float _5411 = _5407;
    float _5413 = _5407;
    if (!_5409)
    {
        bool _5415 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5417 = isnan(_5045);
        bool _5419 = _5415 || _5417;
        bool _5421 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5423 = _5419 || _5421;
        if (!_5423)
        {
            float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5427 = _5045 + _5425;
            float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5431 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5429;
            float _5433 = 1.0 / _5431;
            float _5435 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5437 = _5435 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5439 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5441 = _5439 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5443 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5445 = _5443 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5447 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5449 = _5447 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5453 = _5451 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5455 = _5427 * _5433;
            float _5457 = precise::clamp(_5455, 0.0, 1.0);
            float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5463 = fma(_5457, _5437, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5465 = fma(_5457, _5461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5467 = fma(_5457, _5441, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5469 = fma(_5457, _5445, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5471 = fma(_5457, _5449, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5473 = fma(_5457, _5453, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5413 = _5465;
            _5377 = _5471;
            _5405 = _5463;
            _5385 = _5469;
            _5319 = _5467;
            _5397 = _5473;
            _5475 = true;
        }
        else
        {
            bool _5477 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5479 = isnan(_5045);
            bool _5481 = _5477 || _5479;
            bool _5483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5485 = _5481 || _5483;
            if (!_5485)
            {
                _5403 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5487 = _5403;
            _5405 = _5487;
            if (!_5485)
            {
                _5411 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5489 = _5411;
            _5413 = _5489;
            if (!_5485)
            {
                _5317 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5491 = _5317;
            _5319 = _5491;
            if (!_5485)
            {
                _5383 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5493 = _5383;
            _5385 = _5493;
            if (!_5485)
            {
                _5375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5495 = _5375;
            _5377 = _5495;
            if (!_5485)
            {
                _5395 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5497 = _5395;
            bool _5499 = !_5485;
            _5397 = _5497;
            if (!_5499)
            {
                bool _5501 = _5045 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5503 = isnan(_5045);
                bool _5505 = _5501 || _5503;
                bool _5507 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5509 = _5505 || _5507;
                if (!_5509)
                {
                    float _5511 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5513 = _5045 + _5511;
                    float _5515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5517 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5515;
                    float _5519 = 1.0 / _5517;
                    float _5521 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5523 = _5521 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5525 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5527 = _5525 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5529 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5531 = _5529 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5533 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5535 = _5533 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5537 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5539 = _5537 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5541 = _5513 * _5519;
                    float _5543 = precise::clamp(_5541, 0.0, 1.0);
                    float _5545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5547 = _5545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5549 = fma(_5543, _5523, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5551 = fma(_5543, _5547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5553 = fma(_5543, _5527, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5555 = fma(_5543, _5531, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5557 = fma(_5543, _5535, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5559 = fma(_5543, _5539, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5413 = _5551;
                    _5377 = _5557;
                    _5405 = _5549;
                    _5385 = _5555;
                    _5319 = _5553;
                    _5397 = _5559;
                    _5475 = true;
                }
                else
                {
                    _5413 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5405 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5385 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5319 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5397 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5475 = false;
    float _5561 = _5413;
    float _5563 = _5377;
    float _5565 = _5405;
    float _5567 = _5385;
    float _5569 = _5319;
    float _5571 = _5397;
    float _5573 = fma(_5257, -0.5, 0.5);
    float _5575 = precise::clamp(_5573, 0.0, 1.0);
    float _5577 = -_5561;
    float _5579 = _5577 + _5563;
    float _5581 = _5359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5583 = -_5565;
    float _5585 = _5583 + _5567;
    float _5587 = fma(_5575, _5579, _5561);
    out.m_108.x = 0.0;
    float _5589 = -_5569;
    float _5591 = _5589 + _5571;
    float _5593 = fma(_5575, _5585, _5565);
    float _5595 = _5587 * 0.586610972881317138671875;
    out.m_63.x = _5581;
    bool _5597 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5599 = fma(_5575, _5591, _5569);
    float _5601 = fma(_5593, 0.298911988735198974609375, _5595);
    bool _5603 = _4815 > 0.0;
    bool _5605 = isnan(_4815);
    bool _5607 = _5603 || _5605;
    bool _5609 = isnan(0.0);
    bool _5611 = _5607 || _5609;
    float _5613 = fma(_5599, 0.114477999508380889892578125, _5601);
    float _5615 = -_5613;
    float _5617 = _5593 + _5615;
    float _5619 = -_5613;
    float _5621 = _5587 + _5619;
    float _5623 = -_5613;
    float _5625 = _5599 + _5623;
    float _5627 = fma(_5617, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    float _5629 = fma(_5621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    float _5631 = fma(_5625, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5613);
    bool _5633 = !_5597;
    if (!_5633)
    {
        float _5635 = -_4556;
        float _5637 = _5635 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5639 = -_4558;
        float _5641 = _5639 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5643 = -_4560;
        float _5645 = _5643 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5647 = _5637 * _5637;
        float _5649 = fma(_5641, _5641, _5647);
        float _5651 = fma(_5645, _5645, _5649);
        float _5653 = sqrt(_5651);
        float _5655 = rsqrt(_5651);
        float _5657 = -_5653;
        float _5659 = _5657 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5661 = _5659 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5663 = precise::clamp(_5661, 0.0, 1.0);
        float _5665 = _5641 * _5655;
        float _5667 = _5637 * _5655;
        float _5669 = abs(_5663);
        float _5671 = log2(_5669);
        float _5673 = _5645 * _5655;
        float _5675 = _5665 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5677 = _5257 * _5667;
        float _5679 = -_5667;
        float _5681 = -_5675;
        float _5683 = fma(_5679, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5681);
        float _5685 = fma(_5275, _5665, _5677);
        float _5687 = -_5673;
        float _5689 = fma(_5687, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5683);
        float _5691 = fma(_5301, _5673, _5685);
        float _5693 = precise::clamp(_5691, 0.0, 1.0);
        float _5695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5697 = _5689 + _5695;
        float _5699 = _5671 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5701 = _5697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5703 = precise::clamp(_5701, 0.0, 1.0);
        float _5705 = exp2(_5699);
        float _5707 = _5705 * _5703;
        float _5709 = _5693 * _5707;
        float _5711 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5713 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5715 = _5709 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5711;
        out.m_108.y = _5713;
        out.m_108.z = _5715;
    }
    out.m_110.x = _5627;
    out.m_110.y = _5629;
    out.m_110.z = _5631;
    if (_5611)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5717 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5717;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

