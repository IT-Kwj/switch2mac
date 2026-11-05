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
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3101 = false;
    bool _615 = false;
    bool _493 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_59.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3386 = as_type<float>(_131);
        out.gl_Position.z = _3386;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_145)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _149 >= _153;
    bool _157 = !_145;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3455 = as_type<float>(_167);
        out.gl_Position.z = _3455;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_66.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_61.x;
    float _187 = in.m_61.y;
    float _189 = in.m_61.z;
    float _191 = in.m_56.x;
    float _193 = in.m_56.y;
    float _195 = in.m_56.z;
    int _197 = as_type<int>(_169) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_169) & 2;
    bool _203 = _201 != 0;
    float _205 = _169;
    float _207 = _171;
    if (!_183)
    {
        float _209 = _171 * _171;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    bool _215 = !_199;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _213;
    if (!_183)
    {
        float _221 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_203;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _223;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _171 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _171);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _267 = !_183;
    float _269 = _265;
    float _271 = _263;
    if (!_267)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _171 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _207 = _291;
    }
    float _293 = _207;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _299 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _301 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_183)
    {
        float _303 = _149 * _149;
        float _305 = _303 * 0.5;
        _269 = _305;
    }
    float _307 = _269;
    float _309 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].x, _297);
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].y, _299);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].z, _301);
    float _315 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_183)
    {
        float _317 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _317;
    }
    float _319 = _271;
    bool _321 = !_183;
    float _323 = _319;
    if (!_321)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = _149 * _327;
        float _337 = exp2(_335);
        float _339 = _333 * 0.693147182464599609375;
        float _341 = 1.0 / _339;
        float _343 = 1.0 / _331;
        float _345 = _337 + (-1.0);
        float _347 = -_345;
        float _349 = fma(_347, _341, _149);
        float _351 = _349 * _343;
        float _353 = _351 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _323 = _353;
    }
    float _355 = _323;
    float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].x, _309);
    float _361 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].y, _311);
    float _363 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _367 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _369 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _371 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].z, _313);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].x, _365);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].y, _367);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].z, _369);
    float _379 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = fma(_293, _185, _359);
    float _383 = fma(_293, _187, _361);
    float _385 = fma(_293, _189, _371);
    float _387 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].x, _373);
    float _389 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].y, _375);
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].z, _377);
    float _393 = _379;
    if (!_183)
    {
        _393 = _149;
    }
    float _395 = _393;
    bool _397 = !_183;
    float _399 = _395;
    if (!_397)
    {
        float _401 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _403 = log2(_401);
        float _405 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _407 = _405 + 1.0;
        float _409 = 1.0 / _407;
        float _411 = _149 * _403;
        float _413 = exp2(_411);
        float _415 = -_413;
        float _417 = _415 + 1.0;
        float _419 = _417 * _409;
        _399 = _419;
    }
    float _421 = _399;
    float _423 = fma(_421, _187, _389);
    bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _427 = fma(_421, _185, _387);
    float _429 = fma(_421, _189, _391);
    float _431 = -_423;
    float _433 = _383 + _431;
    float _435 = fma(_381, _173, _191);
    float _437 = -_427;
    float _439 = _381 + _437;
    float _441 = -_429;
    float _443 = _385 + _441;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_383, _173, _193);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _459 = fma(_385, _173, _195);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _465 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    bool _467 = !_425;
    float _469 = _463;
    float _471 = _461;
    float _473 = _465;
    float _491;
    if (!_467)
    {
        float _475 = in.m_68.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_115);
        float _497 = 1.0 / _495;
        float _499 = _149 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_68.x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _501 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    float _513 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _515 = in.m_66.x;
    float _517 = in.m_66.y;
    bool _519 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _521 = isnan(_501);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / _511;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = -_529;
    float _537 = _535 + 1.0;
    float _539 = _507 * _531;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _541;
    bool _545 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_501);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = _513 * _503;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _565 = _555 * _537;
    float _567 = fma(_561, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = trunc(_557);
    int _571 = int(_569);
    float _573 = -_555;
    float _575 = _573 + 1.0;
    float _577 = _563 * _565;
    float _579 = _567 * _565;
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _583 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _585 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[144].x, _583);
    float _587 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[144].y, _581);
    float _589 = _585 * _515;
    float _591 = _587 * _517;
    int _593 = _571 << 4;
    int _595 = _593 + 1712;
    bool _597 = !_533;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _503 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_115);
        float _619 = 1.0 / _617;
        float _621 = _149 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_68.z;
    float _627 = _503 * 2.0;
    float _629 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _631 = log2(_629);
    float _633 = in.m_68.y;
    bool _635 = _503 > 0.5;
    float _637 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = in.m_68.w;
    float _645 = _589 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _647 = floor(_627);
    float _649 = -_217;
    int _651 = _635 ? as_type<int>(_649) : as_type<int>(_217);
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _657 = _655 != 0;
    float _659 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _663 = _661 != 0;
    float _665 = _645 * _653;
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _669 = 0.0;
    float _671 = _631;
    if (_641)
    {
        _669 = _503;
    }
    float _673 = _669;
    float _675 = _625 * 2.0;
    float _677 = 0.0;
    float _679 = _673;
    if (!_641)
    {
        _677 = _625;
    }
    float _681 = _677;
    bool _683 = _647 > 0.0;
    float _685 = _633 * 2.0;
    float _687 = 0.0;
    float _689 = _681;
    if (!_641)
    {
        _687 = _633;
    }
    float _691 = _687;
    float _693 = floor(_675);
    float _695 = _691;
    if (_641)
    {
        _689 = _633;
    }
    float _697 = _689;
    float _699 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_641)
    {
        _679 = _625;
    }
    float _701 = _679;
    if (_641)
    {
        _695 = _503;
    }
    float _703 = _695;
    float _705 = _667 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _707 = floor(_685);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _711 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _713 = isnan(_623);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    bool _723 = _693 >= 0.0;
    bool _725 = isnan(_693);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_699, -2.0, _709);
    bool _735 = _693 > 0.0;
    float _737 = _633 + _625;
    int _739 = _731 ? 0 : 1;
    float _741 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _733);
    bool _743 = _647 >= 0.0;
    bool _745 = isnan(_647);
    bool _747 = _743 || _745;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    float _753 = _737 + (-1.0);
    int _755 = ~_739;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    int _761 = _751 ? 0 : 1;
    float _763 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _765 = !_657;
    float _767 = _765 ? _217 : as_type<float>(_651);
    int _769 = ~_761;
    int _771 = _769 + 1;
    int _773 = _771 + 1;
    int _775 = _773;
    int _777 = _759;
    if (!_683)
    {
        int _779 = ~_761;
        int _781 = _779 + 1;
        _775 = _781;
    }
    int _783 = _775;
    float _785 = _149 * _631;
    if (!_735)
    {
        int _787 = ~_739;
        int _789 = _787 + 1;
        _777 = _789;
    }
    int _791 = _777;
    float _793 = _767 + 0.5;
    bool _795 = _633 > 0.5;
    if (!_641)
    {
        _671 = _625;
    }
    float _797 = _671;
    float _799 = exp2(_785);
    float _801 = -_227;
    int _803 = _795 ? as_type<int>(_801) : as_type<int>(_227);
    float _805 = -_217;
    int _807 = _795 ? as_type<int>(_805) : as_type<int>(_217);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _815 = _813 != 0;
    bool _817 = _707 > 0.0;
    bool _819 = !_663;
    float _821 = _819 ? _227 : as_type<float>(_803);
    bool _823 = _707 >= 0.0;
    bool _825 = isnan(_707);
    bool _827 = _823 || _825;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = _625 > 0.5;
    float _835 = _831 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _837 = -_799;
    float _839 = _837 + 1.0;
    float _841 = -_227;
    int _843 = _833 ? as_type<int>(_841) : as_type<int>(_227);
    int _845 = ~as_type<int>(_835);
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    float _853 = _835;
    float _855 = _797;
    if (!_817)
    {
        int _857 = ~as_type<int>(_835);
        int _859 = _857 + 1;
        _851 = _859;
    }
    int _861 = _851;
    bool _863 = !_811;
    float _865 = _863 ? _217 : as_type<float>(_807);
    bool _867 = !_815;
    float _869 = _867 ? _227 : as_type<float>(_843);
    if (_641)
    {
        _853 = _633;
    }
    float _871 = _853;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _871;
    if (_641)
    {
        _855 = _633;
    }
    float _887 = _855;
    if (!_641)
    {
        _885 = _503;
    }
    float _889 = _885;
    bool _891 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _899 = _895 || _897;
    bool _901 = !_875;
    int _903 = _901 ? 0 : 1;
    float _905 = _899 ? _839 : 0.0;
    float _907 = _451 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _911 = _909 != 0;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _915 = _913 != 0;
    float _917 = _451 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _919 = _643 > 0.5;
    float _921 = _451 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _923 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _931 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _921);
    float _933 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _917);
    float _935 = 1.0 / _927;
    float _937 = _637 * _929;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _943 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _933);
    float _945 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _923);
    float _947 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _931);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _949;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _955 = 1.0 / _941;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _961 = abs(_903);
    float _963 = -_953;
    float _965 = fma(_659, 2.0, _963);
    float _967 = _947 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _969 = float(_791);
    float _971 = -_149;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[76].x, _965);
    float _975 = _951 * _935;
    float _977 = _503 + _625;
    float _979 = _503 + _633;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _985 = _623 + _983;
    float _987 = _977 + (-1.0);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _991 = _623 + _989;
    float _993 = _979 + (-1.0);
    float _995 = _959 * _955;
    float _997 = fma(_975, _991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    out.m_70.w = _981;
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1005 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1007 = isnan(_623);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1019 = 1.0 + _1017;
    float _1021 = fma(_995, _985, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1023 = float(_961);
    float _1025 = _503 + (-0.5);
    bool _1027 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_623);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = -_1015;
    float _1041 = _1039 + 1.0;
    float _1043 = fma(_705, _793, _973);
    float _1045 = 1.0 / _1019;
    float _1047 = -_1037;
    float _1049 = _1047 + 1.0;
    float _1051 = _701 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1053 = float(_861);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1057 = _1015 * _1049;
    float _1059 = _721 * _1041;
    float _1061 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1063 = _821 + (-0.5);
    float _1065 = -_721;
    float _1067 = _1065 + 1.0;
    float _1069 = _997 * _1059;
    float _1071 = -_1055;
    float _1073 = fma(_1051, 2.0, _1071);
    float _1075 = in.m_72.x;
    float _1077 = in.m_72.y;
    float _1079 = in.m_72.z;
    float _1081 = -_1061;
    float _1083 = -_741;
    float _1085 = fma(_1081, _1063, _1083);
    float _1087 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1069);
    float _1089 = _905 * _1045;
    float _1091 = _1023 * _969;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1097 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1093);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1103 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1095);
    float _1105 = _703 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1109 = _1091 * (-2.0);
    float _1111 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1101);
    float _1113 = -_1099;
    float _1115 = fma(_1105, 2.0, _1113);
    float _1117 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1107);
    float _1119 = fma(_1001, _1109, _1001);
    bool _1121 = !_879;
    int _1123 = _1121 ? 0 : 1;
    uint _1126 = uint(int(uint(_595) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    float _1142 = fma(_1109, _1075, _1075);
    bool _1144 = !_883;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_1021, _1057, _1087);
    int _1150 = abs(_1123);
    float _1152 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1142);
    int _1154 = abs(_1146);
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1158 = _595 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    bool _1168 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1170 = isnan(1.0);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1148);
    float _1180 = float(_783);
    float _1182 = _697 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1184 = float(_1150);
    float _1186 = -_149;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1115);
    float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1192 = !_1176;
    float _1194 = _1192 ? _149 : _1089;
    float _1196 = _1184 * _1180;
    float _1198 = float(_1154);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1202 = fma(_1194, _1119, _1152);
    float _1204 = _1196 * (-2.0);
    float _1206 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1200);
    float _1208 = _633 + (-0.5);
    float _1210 = _1202 * 0.15915493667125701904296875;
    float _1212 = fma(_1204, _1077, _1077);
    float _1214 = _1198 * _1053;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1218 = fma(_763, _1204, _763);
    float _1220 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1212);
    float _1222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1224 = _1214 * (-2.0);
    float _1226 = fma(_1194, _1218, _1220);
    float _1228 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1216);
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1234 = fma(_1224, _1079, _1079);
    float _1236 = _625 + (-0.5);
    float _1238 = fma(_999, _1224, _999);
    float _1240 = _865 + 0.5;
    float _1242 = _1226 * 0.15915493667125701904296875;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1234);
    float _1246 = -_149;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1073);
    float _1250 = _1210 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1256 = fma(_1194, _1238, _1244);
    float _1258 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1260 = -_217;
    int _1262 = _833 ? as_type<int>(_1260) : as_type<int>(_217);
    float _1264 = fma(_1182, -2.0, _1232);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_1258, _1240, _1248);
    float _1270 = _1210 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1132 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1276 = -_227;
    int _1278 = _919 ? as_type<int>(_1276) : as_type<int>(_227);
    float _1280 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1282 = !_911;
    float _1284 = _1282 ? _217 : as_type<float>(_1262);
    float _1286 = _889 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1288 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = _1242 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1296 = !_915;
    float _1298 = _1296 ? _227 : as_type<float>(_1278);
    float _1300 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1284 + 0.5;
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1308 = _1298 + (-0.5);
    float _1310 = _1242 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1264);
    float _1316 = fma(_1280, _1302, _1188);
    float _1318 = fma(_1286, -2.0, _1306);
    float _1320 = -_1230;
    float _1322 = -_1314;
    float _1324 = fma(_1320, _1308, _1322);
    float _1326 = _1266 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = _1272 * _1292;
    float _1334 = _1252 * _1292;
    out.m_74.x = _1300;
    out.m_74.y = _1330;
    out.m_74.z = _1304;
    out.m_74.w = _1288;
    float _1336 = _1266 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = _1252 * _1312;
    float _1342 = _1272 * _1312;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1346 = _1252 * _1328;
    float _1348 = _1272 * _1328;
    float _1350 = _1312 * _1328;
    float _1352 = _1292 * _1328;
    float _1354 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1356 = _1348 * _937;
    float _1358 = _869 + (-0.5);
    float _1360 = -_1332;
    float _1362 = fma(_1338, _1340, _1360);
    float _1364 = -_1340;
    float _1366 = fma(_1338, _1332, _1364);
    float _1368 = fma(_1338, _1342, _1334);
    float _1370 = -_937;
    float _1372 = _1338 * _1370;
    float _1374 = fma(_1338, _1334, _1342);
    float _1376 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1318);
    float _1378 = fma(_1368, _665, _1356);
    float _1380 = _1346 * _937;
    float _1382 = fma(_1350, _665, _1372);
    float _1384 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1386 = fma(_1366, _1354, _1378);
    float _1388 = fma(_1362, _665, _1380);
    float _1390 = fma(_1352, _1354, _1382);
    float _1392 = -_1384;
    float _1394 = -_1376;
    float _1396 = fma(_1392, _1358, _1394);
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1400 = fma(_1374, _1354, _1388);
    float _1402 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1404 = _945 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1406 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1398);
    float _1408 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1410 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1402);
    float _1412 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1414 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1406);
    float _1416 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1418 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1410);
    float _1420 = -_1338;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1408);
    float _1424 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1426 = -_1338;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1412);
    float _1430 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1432 = -_1338;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1416);
    float _1436 = _967 + _1424;
    float _1438 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1422);
    float _1440 = _1404 + _1430;
    float _1442 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1428);
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1446 = _1436 + _1444;
    float _1448 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1434);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1452 = _1440 + _1450;
    float _1454 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1456 = _1446 * _1446;
    float _1458 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1460 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1462 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1454);
    float _1464 = fma(_1452, _1452, _1456);
    float _1466 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1458);
    float _1468 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1460);
    float _1470 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1472 = sqrt(_1464);
    float _1474 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1476 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1478 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1480 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1470);
    float _1482 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1474);
    float _1484 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1476);
    float _1486 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1478);
    float _1488 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1480);
    float _1490 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1482);
    float _1492 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1484);
    float _1494 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1486);
    float _1496 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1498 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1462);
    float _1500 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1502 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1468);
    bool _1504 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1508 = _943 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1510 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1512 = _1496 * _1442;
    float _1514 = _1496 * _1438;
    float _1516 = _1496 * _1448;
    float _1518 = _1508 + _1510;
    float _1520 = fma(_1506, _1498, _1512);
    float _1522 = fma(_1506, _1500, _1514);
    float _1524 = fma(_1506, _1502, _1516);
    float _1526 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1111);
    float _1528 = _1111;
    float _1530 = _1440;
    float _1532 = _1436;
    float _1534 = _1500;
    float _1536 = _967;
    if (!_1504)
    {
        _1528 = _1440;
    }
    float _1538 = _1528;
    float _1540 = _1538;
    if (!_1504)
    {
        _1530 = _1518;
    }
    float _1542 = _1530;
    bool _1544 = !_1504;
    float _1546 = _1542;
    if (!_1544)
    {
        float _1548 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1552 = _1472 + _1550;
        float _1554 = rsqrt(_1464);
        float _1556 = _1552 * _1548;
        float _1558 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1560 = _1556 * 0.15915493667125701904296875;
        float _1562 = _1560 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        float _1566 = _1560 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        float _1570 = _1564 + (-1.0);
        float _1572 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1574 = fma(_1568, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1576 = fma(_1518, _1564, _1572);
        float _1578 = _1554 * _1574;
        float _1580 = fma(_1452, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1582 = fma(_1446, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1546 = _1576;
        _1540 = _1580;
        _1532 = _1582;
    }
    float _1584 = _1546;
    float _1586 = _1540;
    float _1588 = _1532;
    float _1590 = fma(_1496, _1496, 1.0);
    float _1592 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1228);
    float _1594 = -_1526;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1097);
    float _1600 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1206);
    float _1602 = -_1592;
    float _1604 = _1602 + 1.0;
    float _1606 = rsqrt(_1590);
    float _1608 = -_1596;
    float _1610 = fma(_865, _1608, _1268);
    float _1612 = -_1508;
    float _1614 = _1612 + _1584;
    float _1616 = -_1598;
    float _1618 = _1616 + 1.0;
    float _1620 = fma(_869, _1604, _1396);
    float _1622 = -_1404;
    float _1624 = _1622 + _1586;
    float _1626 = _1614 * _1614;
    float _1628 = -_1618;
    float _1630 = fma(_767, _1628, _1043);
    float _1632 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1103);
    float _1634 = -_967;
    float _1636 = _1634 + _1588;
    float _1638 = fma(_1624, _1624, _1626);
    float _1640 = -_1600;
    float _1642 = _1640 + 1.0;
    float _1644 = -_1632;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1117);
    float _1650 = fma(_1636, _1636, _1638);
    float _1652 = fma(_821, _1642, _1085);
    float _1654 = _1496 * _1606;
    float _1656 = -_1646;
    float _1658 = fma(_1284, _1656, _1316);
    float _1660 = -_1648;
    float _1662 = _1660 + 1.0;
    float _1664 = sqrt(_1650);
    float _1666 = -_1490;
    float _1668 = _1654 * _1666;
    float _1670 = -_1488;
    float _1672 = _1654 * _1670;
    float _1674 = -_1494;
    float _1676 = _1654 * _1674;
    float _1678 = fma(_1298, _1662, _1324);
    float _1680 = fma(_1606, _1442, _1668);
    float _1682 = fma(_1606, _1438, _1672);
    float _1684 = fma(_1606, _1448, _1676);
    float _1686 = _1490 + _1520;
    float _1688 = _1488 + _1522;
    float _1690 = _1494 + _1524;
    out.m_76.x = _1630;
    out.m_76.y = _1652;
    out.m_76.z = _1658;
    out.m_76.w = _1678;
    out.m_78.x = _1610;
    out.m_78.y = _1620;
    bool _1692 = _1664 > 0.0;
    out.m_80.x = _1498;
    out.m_80.y = _1500;
    out.m_80.z = _1502;
    out.m_82.x = _1680;
    out.m_82.y = _1682;
    out.m_82.z = _1684;
    out.m_84.x = _1686;
    out.m_84.y = _1688;
    out.m_84.z = _1690;
    bool _1694 = !_1692;
    float _1696 = _1678;
    float _1698 = _1652;
    float _1700 = _1588;
    float _1702 = _1584;
    float _1704 = _1586;
    int _1706 = as_type<int>(_1614);
    if (!_1694)
    {
        bool _1708 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1710 = _1498;
        if (_1708)
        {
            float _1712 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1710 = _1712;
        }
        float _1714 = _1710;
        float _1716 = _1714;
        if (_1708)
        {
            float _1718 = _461 * _1714;
            _1696 = _1718;
        }
        float _1720 = _1696;
        float _1722 = _1720;
        if (_1708)
        {
            float _1724 = _463 * _1714;
            _1698 = _1724;
        }
        float _1726 = _1698;
        float _1728 = _1726;
        if (_1708)
        {
            float _1730 = _465 * _1714;
            _1534 = _1730;
        }
        float _1732 = _1534;
        float _1734 = _1732;
        if (!_1708)
        {
            float _1736 = _149 + 1.0;
            float _1738 = _1736;
            if (!_183)
            {
                float _1740 = _1736 * _1736;
                float _1742 = _1740 * 0.5;
                _1716 = _1742;
            }
            float _1744 = _1716;
            float _1746 = _1744;
            if (!_183)
            {
                float _1748 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1746 = _1748;
            }
            float _1750 = _1746;
            bool _1752 = !_183;
            float _1754 = _1750;
            if (!_1752)
            {
                float _1756 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1758 = log2(_1756);
                float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1762 = 1.0 + _1760;
                float _1764 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1766 = _1758 * _1736;
                float _1768 = 1.0 / _1762;
                float _1770 = _1764 * 0.693147182464599609375;
                float _1772 = exp2(_1766);
                float _1774 = 1.0 / _1770;
                float _1776 = _1772 + (-1.0);
                float _1778 = -_1776;
                float _1780 = fma(_1778, _1774, _1736);
                float _1782 = _1780 * _1768;
                float _1784 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1754 = _1784;
            }
            float _1786 = _1754;
            float _1788 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1790 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1792 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1794 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1796 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1798 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1800 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1794);
            float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1796);
            float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1800);
            bool _1806 = !_183;
            if (!_1806)
            {
                float _1808 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1810 = log2(_1808);
                float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1814 = 1.0 + _1812;
                float _1816 = 1.0 / _1814;
                float _1818 = _1810 * _1736;
                float _1820 = exp2(_1818);
                float _1822 = -_1820;
                float _1824 = _1822 + 1.0;
                float _1826 = _1824 * _1816;
                _1738 = _1826;
            }
            float _1828 = _1738;
            float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1798);
            float _1832 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
            float _1834 = fma(_1828, _187, _1804);
            float _1836 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1830);
            float _1838 = fma(_1828, _185, _1832);
            float _1840 = -_423;
            float _1842 = _1840 + _1834;
            float _1844 = fma(_1828, _189, _1836);
            float _1846 = -_427;
            float _1848 = _1846 + _1838;
            float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1852 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1854 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1856 = -_429;
            float _1858 = _1856 + _1844;
            float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1850);
            float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1852);
            float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1854);
            float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1860);
            float _1868 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1862);
            float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1864);
            _469 = _1868;
            _471 = _1866;
            _473 = _1870;
            _1722 = _1866;
            _1728 = _1868;
            _1734 = _1870;
        }
        float _1872 = _469;
        float _1874 = _471;
        float _1876 = _473;
        float _1878 = _1722;
        float _1880 = _1728;
        float _1882 = _1734;
        float _1884 = _1872 * _1872;
        float _1886 = fma(_1874, _1874, _1884);
        float _1888 = rsqrt(_1650);
        float _1890 = fma(_1876, _1876, _1886);
        float _1892 = sqrt(_1890);
        float _1894 = _1624 * _1888;
        float _1896 = _1614 * _1888;
        float _1898 = _1636 * _1888;
        bool _1900 = _1892 > 0.0;
        bool _1902 = !_1900;
        if (!_1902)
        {
            float _1904 = rsqrt(_1890);
            float _1906 = _1904 * _1872;
            float _1908 = _1904 * _1874;
            float _1910 = _1904 * _1876;
            float _1912 = _1896 * _1906;
            float _1914 = fma(_1894, _1908, _1912);
            float _1916 = fma(_1898, _1910, _1914);
            float _1918 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1920 = fma(_1878, _1918, _1586);
            float _1922 = fma(_1880, _1918, _1584);
            float _1924 = fma(_1882, _1918, _1588);
            _1700 = _1924;
            _1702 = _1922;
            _1704 = _1920;
        }
    }
    float _1926 = _1700;
    float _1928 = _1702;
    float _1930 = _1704;
    float _1932 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1934 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1936 = floor(_1932);
    float _1938 = floor(_1934);
    float _1940 = -_1936;
    float _1942 = _1932 + _1940;
    float _1944 = -_1938;
    float _1946 = _1934 + _1944;
    float2 _6360 = float2(_1942, _1946);
    float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6360, float2(0.0), isnan(_6360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6360, float2(0.0), isnan(_6360)), level(0.0)).x;
    float _1950 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1952 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _1954 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1956 = isnan(0.5);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1962 = _1958 || _1960;
    float _1964 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1950);
    float _1966 = _1508 + _1952;
    float _1968 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1964);
    float _1970 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1974 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1976 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1970);
    float _1978 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1972);
    float _1980 = 1.0 / _1974;
    float _1982 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1976);
    float _1984 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1978);
    float _1986 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1988 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1990 = _1984;
    int _1992 = 2;
    if (_1962)
    {
        _1990 = _1926;
    }
    float _1994 = _1990;
    float _1996 = _1986 + _1974;
    float _1998 = _1996 * _1980;
    float _2000 = _1998 * 0.5;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2004 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2002);
    float _2006 = 1.0 / _2004;
    float _2008 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2010 = _2006 * _2008;
    float _2012 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2014 = _2010 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2016 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2012);
    bool _2018 = _2010 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2020 = !_2014;
    int _2022 = _2020 ? 0 : 1;
    float _2024 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2016);
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2028 = _1994;
    if (!_2014)
    {
        _1992 = 1;
    }
    int _2030 = _1992;
    float _2032 = trunc(_2026);
    int _2034 = int(_2032);
    int _2036 = _2030;
    if (!_2018)
    {
        _2036 = _2022;
    }
    int _2038 = _2036;
    int _2040 = _2038 << 6;
    float _2042 = trunc(_1988);
    int _2044 = int(_2042);
    int _2046 = _2040 + 48;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
    int _2052 = int(_2048) & 3;
    float _2054 = (*spvDescriptorSet0.vp_c15)._m0[int(_2050)][_2052];
    int _2056 = int(_2048) + 1;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    int _2060 = _2056 & 3;
    float _2062 = (*spvDescriptorSet0.vp_c15)._m0[int(_2058)][_2060];
    int _2064 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2066 = _2034 + _2064;
    int _2068 = _2066 + 1;
    int _2070 = _2040 + 56;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c15)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
    int _2088 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2090 = _2044 + _2088;
    int _2092 = _2090 + 1;
    int _2094 = _2040 + 64;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c15)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c15)._m0[int(_2106)][_2108];
    float _2112 = as_type<float>(_2044);
    float _2114 = as_type<float>(_2038);
    if (_1962)
    {
        _2112 = _1928;
    }
    float _2116 = _2112;
    bool _2118 = _2092 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2120 = _2092 | _2068;
    int _2122 = _2040 + 72;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    bool _2140 = _2120 < 0;
    bool _2142 = _2140 || _2118;
    float _2144 = as_type<float>(_2120);
    float _2146 = _2116;
    if (_1962)
    {
        _2144 = _1930;
    }
    float _2148 = _2144;
    bool _2150 = _2068 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2152 = _2150 || _2142;
    int _2154 = _2040 + 96;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c15)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c15)._m0[int(_2166)][_2168];
    int _2172 = _2040 + 104;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    uint _2176 = uint(int(uint(int(_2174)) >> uint(2)));
    int _2178 = int(_2174) & 3;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[int(_2176)][_2178];
    int _2182 = int(_2174) + 1;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    int _2186 = _2182 & 3;
    float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
    float _2190 = _2148;
    if (!_1962)
    {
        float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2194 = _1508 + _2192;
        float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2198 = _1404 + _2196;
        float _2200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2202 = -_1508;
        float _2204 = _2202 + _1928;
        float _2206 = _2194 * _2194;
        float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2210 = _967 + _2208;
        float _2212 = -_967;
        float _2214 = _2212 + _1926;
        float _2216 = fma(_2198, _2198, _2206);
        float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2220 = fma(_2210, _2210, _2216);
        float _2222 = sqrt(_2220);
        float _2224 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2226 = precise::min(_2222, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2228 = _2226 * _2218;
        float _2230 = _2224 * _2228;
        float _2232 = -_1404;
        float _2234 = _2232 + _1930;
        float _2236 = fma(_2204, _2230, _1508);
        float _2238 = fma(_2234, _2230, _1404);
        float _2240 = fma(_2214, _2230, _967);
        _2146 = _2236;
        _2190 = _2238;
        _2028 = _2240;
        _1706 = as_type<int>(_2230);
    }
    float _2242 = _2146;
    float _2244 = _2190;
    float _2246 = _2028;
    int _2248 = _1706;
    float _2250 = _1966 * _2170;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2254 = _2248;
    if (!_2152)
    {
        int _2256 = _2068 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2258 = _2256 + _2092;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = _1966 * _2110;
    float _2264 = fma(_1404, _2162, _2250);
    float _2266 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2252);
    float _2268 = _1966 * _2062;
    float _2270 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2272 = fma(_967, _2180, _2264);
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2266);
    int _2276 = as_type<int>(_2264);
    int _2278 = as_type<int>(_2274);
    if (!_2152)
    {
        int _2280 = _2260 << 2;
        _2276 = _2280;
    }
    int _2282 = _2276;
    float _2284 = fma(_1404, _2054, _2268);
    float _2286 = _2272 + _2188;
    float _2288 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2290 = _2282;
    if (!_2152)
    {
        uint _2292 = uint(int(uint(_2260) >> uint(2)));
        _2278 = int(_2292);
    }
    int _2294 = _2278;
    float _2296 = fma(_1404, _2102, _2262);
    if (!_2152)
    {
        int _2298 = 12 & _2282;
        _2290 = _2298;
    }
    int _2300 = _2290;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2304 = _2040 + 80;
    uint _2306 = uint(int(uint(_2304) >> uint(2)));
    uint _2308 = uint(int(uint(int(_2306)) >> uint(2)));
    int _2310 = int(_2306) & 3;
    float _2312 = (*spvDescriptorSet0.vp_c15)._m0[int(_2308)][_2310];
    int _2314 = int(_2306) + 1;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    int _2318 = _2314 & 3;
    float _2320 = (*spvDescriptorSet0.vp_c15)._m0[int(_2316)][_2318];
    float _2322 = 1.0 / _2286;
    float _2324 = fma(_967, _2078, _2284);
    float _2326 = -_2302;
    float _2328 = fma(_2326, _2270, 1.0);
    float _2330 = _2302;
    if (!_2152)
    {
        int _2332 = _2294 << 4;
        int _2334 = _2332 + _2300;
        _2330 = as_type<float>(_2334);
    }
    float _2336 = _2330;
    float _2338 = fma(_967, _2130, _2296);
    float _2340 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2342 = _2324 + _2086;
    int _2344 = _2040 + 88;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    uint _2348 = uint(int(uint(int(_2346)) >> uint(2)));
    int _2350 = int(_2346) & 3;
    float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
    int _2354 = int(_2346) + 1;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    int _2358 = _2354 & 3;
    float _2360 = (*spvDescriptorSet0.vp_c15)._m0[int(_2356)][_2358];
    float _2362 = _2338 + _2138;
    float _2364 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2340);
    float _2366 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2368 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2370 = _1524;
    if (!_2152)
    {
        float _2372 = floor(_2026);
        _2370 = _2372;
    }
    float _2374 = _2370;
    float _2376 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2378 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2366);
    float _2380 = _2336;
    if (!_2152)
    {
        int _2382 = as_type<int>(_2336) + 400;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
        int _2388 = int(_2384) & 3;
        float _2390 = (*spvDescriptorSet0.vp_c15)._m0[int(_2386)][_2388];
        _2380 = _2390;
    }
    float _2392 = _2380;
    float _2394 = _2342 * _2322;
    float _2396 = _2362 * _2322;
    float _2398 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2378);
    float _2400 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2402 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2368);
    bool _2404 = _2394 >= 0.0;
    float _2406 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2408 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2410 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2402);
    bool _2412 = _2394 <= 1.0;
    bool _2414 = _2412 && _2404;
    float _2416 = log2(_2328);
    float _2418 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2408);
    float _2420 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2422 = _2396 >= 0.0;
    bool _2424 = _2422 && _2414;
    float _2426 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2428 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2418);
    float _2430 = _2374;
    float _2432 = _2426;
    if (!_2152)
    {
        float _2434 = -_2374;
        float _2436 = _2026 + _2434;
        _2430 = _2436;
    }
    float _2438 = _2430;
    bool _2440 = _2396 <= 1.0;
    bool _2442 = _2440 && _2424;
    float _2444 = _2402;
    if (!_2152)
    {
        float _2446 = floor(_1988);
        _2444 = _2446;
    }
    float _2448 = _2444;
    float _2450 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2428);
    float _2452 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2454 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2426);
    float _2456 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2452);
    float _2458 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2454);
    float _2460 = 1.0 / _2450;
    float _2462 = _2416 * 0.693147182464599609375;
    float _2464 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2456);
    float _2466 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2458);
    if (_2442)
    {
        float _2468 = float(_2038);
        _2432 = _2468;
    }
    float _2470 = _2432;
    float _2472 = _1966 * _2320;
    float _2474 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2464);
    float _2476 = _2448;
    if (!_2152)
    {
        float _2478 = -_2448;
        float _2480 = _1988 + _2478;
        _2476 = _2480;
    }
    float _2482 = _2476;
    float _2484 = fma(_1404, _2312, _2472);
    float _2486 = _2470;
    if (_2442)
    {
        float _2488 = rint(_2470);
        float _2490 = precise::max(_2488, 0.0);
        uint _2492 = uint(_2490);
        uint _2494 = clamp(_2492, 0u, 65535u);
        _2486 = as_type<float>(_2494);
    }
    float _2496 = _2486;
    float _2498 = fma(_967, _2352, _2484);
    float _2500 = _2474 * _2460;
    float _2502 = _2498 + _2360;
    float _2504 = _2466 * _2460;
    float _2506 = _2392;
    if (!_2152)
    {
        float _2508 = rint(_2392);
        float _2510 = precise::max(_2508, 0.0);
        uint _2512 = uint(_2510);
        uint _2514 = clamp(_2512, 0u, 65535u);
        _2506 = as_type<float>(_2514);
    }
    float _2516 = _2506;
    float _2518 = _2502 * _2322;
    float _2520 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2522 = fma(_2504, 0.5, 0.5);
    float _2524 = fma(_2500, -0.5, 0.5);
    float _2526 = _2396;
    if (_2442)
    {
        float3 _7351 = float3(_2394, _2396, float(as_type<int>(_2496)));
        float3 _7355 = select(_7351, float3(0.0), isnan(_7351));
        float _2528 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7355.xy, uint(rint(_7355.z)), _2518, level(0.0));
        _2526 = _2528;
    }
    float _2530 = _2526;
    float3 _7365 = float3(_2522, _2524, _2520);
    float _2532 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7365, float3(0.0), isnan(_7365)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7365, float3(0.0), isnan(_7365)), level(0.0)).x;
    float3 _7374 = float3(_2522, _2524, _2520);
    float4 _2535 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7374, float3(0.0), isnan(_7374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7374, float3(0.0), isnan(_7374)), level(0.0)).xyzw;
    float _2537 = _2535.x;
    float _2539 = _2535.y;
    float _2541 = _2535.z;
    float _2543 = _2535.w;
    float _2545 = _2482;
    if (!_2152)
    {
        float3 _7397 = float3(_2482, _2438, float(as_type<int>(_2516)));
        float3 _7399 = select(_7397, float3(0.0), isnan(_7397));
        float _2547 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7399.xy, uint(rint(_7399.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7399.xy, uint(rint(_7399.z)), level(0.0)).x;
        _2545 = _2547;
    }
    float _2549 = _2545;
    if (_2152)
    {
        _2114 = 1.0;
    }
    float _2551 = _2114;
    float _2553 = _2551;
    if (!_2152)
    {
        int _2555 = _2260 << 4;
        int _2557 = _2555 + 2048;
        uint _2559 = uint(int(uint(_2557) >> uint(2)));
        uint _2561 = uint(int(uint(int(_2559)) >> uint(2)));
        int _2563 = int(_2559) & 3;
        float _2565 = (*spvDescriptorSet0.vp_c15)._m0[int(_2561)][_2563];
        int _2567 = int(_2559) + 1;
        uint _2569 = uint(int(uint(_2567) >> uint(2)));
        int _2571 = _2567 & 3;
        float _2573 = (*spvDescriptorSet0.vp_c15)._m0[int(_2569)][_2571];
        int _2575 = _2557 + 8;
        uint _2577 = uint(int(uint(_2575) >> uint(2)));
        uint _2579 = uint(int(uint(int(_2577)) >> uint(2)));
        int _2581 = int(_2577) & 3;
        float _2583 = (*spvDescriptorSet0.vp_c15)._m0[int(_2579)][_2581];
        int _2585 = int(_2577) + 1;
        uint _2587 = uint(int(uint(_2585) >> uint(2)));
        int _2589 = _2585 & 3;
        float _2591 = (*spvDescriptorSet0.vp_c15)._m0[int(_2587)][_2589];
        float _2593 = _1966 * _2573;
        float _2595 = fma(_1404, _2565, _2593);
        float _2597 = fma(_967, _2583, _2595);
        float _2599 = _2597 + _2591;
        float _2601 = precise::clamp(_2599, 0.0, 1.0);
        float _2603 = -_2601;
        float _2605 = _2603 + _2549;
        float _2607 = fma(_2605, 500.0, 1.5);
        float _2609 = exp2(_2607);
        float _2611 = 0.0 + _2609;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        _2553 = _2613;
    }
    float _2615 = _2553;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2619 = _2242 + _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2623 = _2244 + _2621;
    float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2627 = _2246 + _2625;
    float _2629 = _2619 * _2619;
    float _2631 = fma(_2623, _2623, _2629);
    float _2633 = fma(_2627, _2627, _2631);
    float _2635 = rsqrt(_2633);
    float _2637 = _2635 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2639 = _2623 * _2637;
    float _2641 = _2627 * _2637;
    float _2643 = _2639 * _2639;
    float _2645 = _2641 * _2641;
    float _2647 = _2643 + _2645;
    float _2649 = sqrt(_2647);
    bool _2651 = _2649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2655 = _2649 + _2653;
    float _2657 = _2627;
    float _2659 = _2635;
    float _2661 = _2655;
    float _2663 = _2637;
    if (_2651)
    {
        float _2665 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2657 = _2665;
    }
    float _2667 = _2657;
    if (_2651)
    {
        float _2669 = rsqrt(_2647);
        _2659 = _2669;
    }
    float _2671 = _2659;
    float _2673 = _2671;
    if (_2651)
    {
        float _2675 = _2655 * _2667;
        _2661 = _2675;
    }
    float _2677 = _2661;
    if (_2651)
    {
        float _2679 = _2677 * 0.15915493667125701904296875;
        _1536 = _2679;
    }
    float _2681 = _1536;
    float _2683 = _2667;
    float _2685 = _2681;
    if (_2651)
    {
        float _2687 = _2681 * 6.283185482025146484375;
        float _2689 = sin(_2687);
        _2683 = _2689;
    }
    float _2691 = _2683;
    float _2693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2695 = precise::max(0.0, _2693);
    float _2697 = _2629;
    float _2699 = _2695;
    if (_2651)
    {
        float _2701 = _2681 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        _2697 = _2703;
    }
    float _2705 = _2697;
    float _2707 = -_2637;
    float _2709 = -_2695;
    float _2711 = fma(_2619, _2707, _2709);
    float _2713 = _2711;
    if (_2651)
    {
        float _2715 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2699 = _2715;
    }
    float _2717 = _2699;
    float _2719 = _2717;
    if (!_2651)
    {
        _2685 = _2643;
    }
    float _2721 = _2685;
    float _2723 = _2691;
    float _2725 = _2721;
    if (_2651)
    {
        float _2727 = fma(_2691, _2717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2723 = _2727;
    }
    float _2729 = _2723;
    float _2731 = _2729;
    float _2733 = _2705;
    if (_2651)
    {
        float _2735 = _2705 + (-1.0);
        _2719 = _2735;
    }
    float _2737 = _2719;
    float _2739 = _2737;
    if (_2651)
    {
        float _2741 = _2671 * _2729;
        _2663 = _2741;
    }
    float _2743 = _2663;
    if (!_2651)
    {
        _2673 = _2639;
    }
    float _2745 = _2673;
    float _2747 = _2745;
    if (_2651)
    {
        float _2749 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2739 = _2749;
    }
    float _2751 = _2739;
    if (_2651)
    {
        float _2753 = _2639 * _2743;
        _2747 = _2753;
    }
    float _2755 = _2747;
    if (!_2651)
    {
        _2731 = _2641;
    }
    float _2757 = _2731;
    float _2759 = _2757;
    if (_2651)
    {
        float _2761 = _2641 * _2743;
        _2759 = _2761;
    }
    float _2763 = _2759;
    if (_2651)
    {
        float _2765 = fma(_2711, _2705, _2751);
        _2713 = _2765;
    }
    float _2767 = _2713;
    if (_2651)
    {
        float _2769 = _2755 * _2755;
        _2725 = _2769;
    }
    float _2771 = _2725;
    if (!_2651)
    {
        _2733 = _2645;
    }
    float _2773 = _2733;
    float _2775 = _2773;
    if (_2651)
    {
        float _2777 = _2763 * _2763;
        _2775 = _2777;
    }
    float _2779 = _2775;
    float _2781 = sqrt(_2633);
    float _2783 = fma(_2767, _2767, _2771);
    float _2785 = _2783 + _2779;
    float _2787 = rsqrt(_2785);
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2791 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2789);
    float _2793 = precise::clamp(_2791, 0.0, 1.0);
    float _2795 = -_2793;
    float _2797 = _2795 + 1.0;
    float _2799 = _2787 * _2755;
    float _2801 = _2787 * _2767;
    float _2803 = _2787 * _2763;
    float _2805 = abs(_2797);
    float _2807 = log2(_2805);
    float _2809 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2811 = -_2809;
    float _2813 = fma(_2801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2811);
    float _2815 = -_2803;
    float _2817 = fma(_2815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2813);
    float _2819 = fma(_2817, -0.5, 0.5);
    float _2821 = fma(_2817, 0.5, 0.5);
    float _2823 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2825 = fma(_2821, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2827 = sqrt(_2819);
    float _2829 = fma(_2821, _2825, -0.212114393711090087890625);
    float _2831 = _2801 + 1.0;
    float _2833 = fma(_2821, _2829, 1.570728778839111328125);
    float _2835 = exp2(_2823);
    float _2837 = _2827 * 0.636619746685028076171875;
    float _2839 = -_2833;
    float _2841 = fma(_2837, _2839, 1.0);
    float _2843 = -_2801;
    float _2845 = fma(_2835, _2831, _2843);
    float _2847 = fma(_2845, 0.5, 0.5);
    float2 _7864 = float2(_2841, _2847);
    float3 _2851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7864, float2(0.0), isnan(_7864)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7864, float2(0.0), isnan(_7864)), level(0.0)).xyz;
    float _2853 = _2851.x;
    float _2855 = _2851.y;
    float _2857 = _2851.z;
    float _2859 = abs(_2010);
    float _2861 = log2(_2859);
    float _2863 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2865 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2867 = -_1948;
    float _2869 = _2867 + 1.0;
    float _2871 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2863);
    out.m_86.x = _2244;
    out.m_86.y = _2242;
    out.m_86.z = _2246;
    bool _2873 = _2010 <= 8000.0;
    bool _2875 = isnan(_2010);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(8000.0);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2871);
    float _2887 = exp2(_2865);
    float _2889 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2885);
    float _2891 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2893 = _2889 + _2450;
    float _2895 = exp2(_2891);
    float _2897 = _2893 * 0.5;
    float _2899 = _2893;
    if (!_2442)
    {
        _2899 = 1.0;
    }
    float _2901 = _2899;
    float _2903 = _2901;
    if (_2442)
    {
        bool _2905 = _2530 >= _2518;
        bool _2907 = isnan(_2530);
        bool _2909 = _2905 || _2907;
        bool _2911 = isnan(_2518);
        bool _2913 = _2909 || _2911;
        float _2915 = float(_2913);
        _2903 = _2915;
    }
    float _2917 = _2903;
    float _2919 = -_2887;
    float _2921 = _2919 + 1.0;
    bool _2923 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2925 = isnan(_2781);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2931 = _2927 || _2929;
    float _2933 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2935 = _2917 * _2615;
    float _2937 = _2933 * _2532;
    float _2939 = -_2933;
    float _2941 = _2939 + 1.0;
    float _2943 = fma(_2895, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2945 = precise::clamp(_2943, 0.0, 1.0);
    float _2947 = _2543 * _2937;
    float _2949 = fma(_2945, -2.0, 3.0);
    float _2951 = _2945 * _2945;
    float _2953 = _2951 * _2949;
    float _2955 = -_2953;
    float _2957 = _2955 + 1.0;
    out.m_88.z = _2897;
    out.m_88.w = _2450;
    float _2959 = fma(_2957, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2953);
    float _2961 = _2543 * _2941;
    float _2963 = _2941;
    float _2965 = _2466;
    float _2967 = _2947;
    if (!_2931)
    {
        _2963 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2969 = _2963;
    float _2971 = _2883 * _2959;
    out.gl_Position.x = _2466;
    out.gl_Position.y = _2474;
    out.gl_Position.z = _2889;
    out.gl_Position.w = _2450;
    float _2973 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2975 = _2869 * _2973;
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = _2973;
    float _2981 = _2977;
    float _2983 = _2969;
    float _2985 = _2969;
    if (!_2931)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2987 = _2979;
    float _2989 = -_2977;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2993 = _2987;
    float _2995 = _2987;
    if (!_2931)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2997 = _2981;
    float _2999 = -_2935;
    float _3001 = fma(_2999, _2991, 1.0);
    float _3003 = precise::clamp(_3001, 0.0, 1.0);
    float _3005 = _3003;
    float _3007 = _2997;
    float _3009 = _2997;
    if (!_2931)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3011 = _2965;
    float _3013 = _3003 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3015 = _3011;
    float _3017 = _3011;
    if (!_2931)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3019 = _3005;
    out.m_90.x = _3013;
    float _3021 = _2857 * _2937;
    float _3023 = fma(_2853, _2947, _2537);
    float _3025 = fma(_2855, _2947, _2539);
    float _3027 = _3019;
    float _3029 = _3019;
    if (!_2931)
    {
        _2967 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3031 = _2967;
    float _3033 = fma(_2543, _3021, _2541);
    out.m_92.x = _3023;
    out.m_92.y = _3025;
    out.m_92.z = _3033;
    out.m_92.w = _2961;
    bool _3035 = !_2931;
    float _3037 = _3031;
    float _3039 = _3031;
    if (!_3035)
    {
        bool _3041 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3043 = isnan(_2781);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3049 = _3045 || _3047;
        if (!_3049)
        {
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3053 = _2781 + _3051;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3055;
            float _3059 = 1.0 / _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3081 = _3053 * _3059;
            float _3083 = precise::clamp(_3081, 0.0, 1.0);
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3089 = fma(_3083, _3063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3091 = fma(_3083, _3087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3093 = fma(_3083, _3067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3095 = fma(_3083, _3071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3097 = fma(_3083, _3075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3099 = fma(_3083, _3079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2995 = _3091;
            _2985 = _3097;
            _3017 = _3089;
            _3039 = _3095;
            _3009 = _3093;
            _3029 = _3099;
            _3101 = true;
        }
        else
        {
            bool _3103 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3105 = isnan(_2781);
            bool _3107 = _3103 || _3105;
            bool _3109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3111 = _3107 || _3109;
            if (!_3111)
            {
                _3015 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3113 = _3015;
            _3017 = _3113;
            if (!_3111)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3115 = _2993;
            _2995 = _3115;
            if (!_3111)
            {
                _3007 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3117 = _3007;
            _3009 = _3117;
            if (!_3111)
            {
                _3037 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3119 = _3037;
            _3039 = _3119;
            if (!_3111)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3121 = _2983;
            _2985 = _3121;
            if (!_3111)
            {
                _3027 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3123 = _3027;
            bool _3125 = !_3111;
            _3029 = _3123;
            if (!_3125)
            {
                bool _3127 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3129 = isnan(_2781);
                bool _3131 = _3127 || _3129;
                bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3135 = _3131 || _3133;
                if (!_3135)
                {
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3139 = _2781 + _3137;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3141;
                    float _3145 = 1.0 / _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3167 = _3139 * _3145;
                    float _3169 = precise::clamp(_3167, 0.0, 1.0);
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2995 = _3177;
                    _2985 = _3183;
                    _3017 = _3175;
                    _3039 = _3181;
                    _3009 = _3179;
                    _3029 = _3185;
                    _3101 = true;
                }
                else
                {
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3017 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3039 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3009 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3029 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3101 = false;
    float _3187 = _2995;
    float _3189 = _2985;
    float _3191 = _3017;
    float _3193 = _3039;
    float _3195 = _3009;
    float _3197 = _3029;
    float _3199 = fma(_1688, -0.5, 0.5);
    float _3201 = precise::clamp(_3199, 0.0, 1.0);
    float _3203 = -_3187;
    float _3205 = _3203 + _3189;
    float _3207 = -_3191;
    float _3209 = _3207 + _3193;
    float _3211 = -_3195;
    float _3213 = _3211 + _3197;
    bool _3215 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3217 = fma(_3201, _3205, _3187);
    float _3219 = fma(_3201, _3209, _3191);
    float _3221 = fma(_3201, _3213, _3195);
    float _3223 = _3217 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _3225 = fma(_3219, 0.298911988735198974609375, _3223);
    float _3227 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3229 = fma(_3221, 0.114477999508380889892578125, _3225);
    out.m_59.x = _3227;
    float _3231 = -_3229;
    float _3233 = _3219 + _3231;
    float _3235 = -_3229;
    float _3237 = _3217 + _3235;
    float _3239 = -_3229;
    float _3241 = _3221 + _3239;
    float _3243 = fma(_3233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3245 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3247 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    out.m_96.x = _3243;
    out.m_96.y = _3245;
    out.m_96.z = _3247;
    if (!_3215)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3249 = -_2242;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3253 = -_2244;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3257 = -_2246;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3261 = _3251 * _3251;
    float _3263 = fma(_3255, _3255, _3261);
    float _3265 = fma(_3259, _3259, _3263);
    float _3267 = sqrt(_3265);
    float _3269 = rsqrt(_3265);
    float _3271 = -_3267;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3255 * _3269;
    float _3281 = _3251 * _3269;
    float _3283 = abs(_3277);
    float _3285 = log2(_3283);
    float _3287 = _3259 * _3269;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3291 = _1688 * _3281;
    float _3293 = -_3281;
    float _3295 = -_3289;
    float _3297 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3295);
    float _3299 = fma(_1686, _3279, _3291);
    float _3301 = -_3287;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3297);
    float _3305 = fma(_1690, _3287, _3299);
    float _3307 = precise::clamp(_3305, 0.0, 1.0);
    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3311 = _3303 + _3309;
    float _3313 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = exp2(_3313);
    float _3321 = _3319 * _3317;
    float _3323 = _3307 * _3321;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3327 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3329 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3325;
    out.m_94.y = _3327;
    out.m_94.z = _3329;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3101 = false;
    bool _615 = false;
    bool _493 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_59.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3386 = as_type<float>(_131);
        out.gl_Position.z = _3386;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_145)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _149 >= _153;
    bool _157 = !_145;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3455 = as_type<float>(_167);
        out.gl_Position.z = _3455;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_66.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_61.x;
    float _187 = in.m_61.y;
    float _189 = in.m_61.z;
    float _191 = in.m_56.x;
    float _193 = in.m_56.y;
    float _195 = in.m_56.z;
    int _197 = as_type<int>(_169) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_169) & 2;
    bool _203 = _201 != 0;
    float _205 = _169;
    float _207 = _171;
    if (!_183)
    {
        float _209 = _171 * _171;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    bool _215 = !_199;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _213;
    if (!_183)
    {
        float _221 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_203;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _223;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _171 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _171);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _267 = !_183;
    float _269 = _265;
    float _271 = _263;
    if (!_267)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _171 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _207 = _291;
    }
    float _293 = _207;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _299 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _301 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_183)
    {
        float _303 = _149 * _149;
        float _305 = _303 * 0.5;
        _269 = _305;
    }
    float _307 = _269;
    float _309 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].x, _297);
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].y, _299);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].z, _301);
    float _315 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_183)
    {
        float _317 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _317;
    }
    float _319 = _271;
    bool _321 = !_183;
    float _323 = _319;
    if (!_321)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = _149 * _327;
        float _337 = exp2(_335);
        float _339 = _333 * 0.693147182464599609375;
        float _341 = 1.0 / _339;
        float _343 = 1.0 / _331;
        float _345 = _337 + (-1.0);
        float _347 = -_345;
        float _349 = fma(_347, _341, _149);
        float _351 = _349 * _343;
        float _353 = _351 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _323 = _353;
    }
    float _355 = _323;
    float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].x, _309);
    float _361 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].y, _311);
    float _363 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _367 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _369 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _371 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].z, _313);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].x, _365);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].y, _367);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].z, _369);
    float _379 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = fma(_293, _185, _359);
    float _383 = fma(_293, _187, _361);
    float _385 = fma(_293, _189, _371);
    float _387 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].x, _373);
    float _389 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].y, _375);
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].z, _377);
    float _393 = _379;
    if (!_183)
    {
        _393 = _149;
    }
    float _395 = _393;
    bool _397 = !_183;
    float _399 = _395;
    if (!_397)
    {
        float _401 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _403 = log2(_401);
        float _405 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _407 = _405 + 1.0;
        float _409 = 1.0 / _407;
        float _411 = _149 * _403;
        float _413 = exp2(_411);
        float _415 = -_413;
        float _417 = _415 + 1.0;
        float _419 = _417 * _409;
        _399 = _419;
    }
    float _421 = _399;
    float _423 = fma(_421, _187, _389);
    bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _427 = fma(_421, _185, _387);
    float _429 = fma(_421, _189, _391);
    float _431 = -_423;
    float _433 = _383 + _431;
    float _435 = fma(_381, _173, _191);
    float _437 = -_427;
    float _439 = _381 + _437;
    float _441 = -_429;
    float _443 = _385 + _441;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_383, _173, _193);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _459 = fma(_385, _173, _195);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _465 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    bool _467 = !_425;
    float _469 = _463;
    float _471 = _461;
    float _473 = _465;
    float _491;
    if (!_467)
    {
        float _475 = in.m_68.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_115);
        float _497 = 1.0 / _495;
        float _499 = _149 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_68.x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _501 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    float _513 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _515 = in.m_66.x;
    float _517 = in.m_66.y;
    bool _519 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _521 = isnan(_501);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / _511;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = -_529;
    float _537 = _535 + 1.0;
    float _539 = _507 * _531;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _541;
    bool _545 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_501);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = _513 * _503;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _565 = _555 * _537;
    float _567 = fma(_561, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = trunc(_557);
    int _571 = int(_569);
    float _573 = -_555;
    float _575 = _573 + 1.0;
    float _577 = _563 * _565;
    float _579 = _567 * _565;
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _583 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _585 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[144].x, _583);
    float _587 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[144].y, _581);
    float _589 = _585 * _515;
    float _591 = _587 * _517;
    int _593 = _571 << 4;
    int _595 = _593 + 1712;
    bool _597 = !_533;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _503 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_115);
        float _619 = 1.0 / _617;
        float _621 = _149 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_68.z;
    float _627 = _503 * 2.0;
    float _629 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _631 = log2(_629);
    float _633 = in.m_68.y;
    bool _635 = _503 > 0.5;
    float _637 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = in.m_68.w;
    float _645 = _589 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _647 = floor(_627);
    float _649 = -_217;
    int _651 = _635 ? as_type<int>(_649) : as_type<int>(_217);
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _657 = _655 != 0;
    float _659 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _663 = _661 != 0;
    float _665 = _645 * _653;
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _669 = 0.0;
    float _671 = _631;
    if (_641)
    {
        _669 = _503;
    }
    float _673 = _669;
    float _675 = _625 * 2.0;
    float _677 = 0.0;
    float _679 = _673;
    if (!_641)
    {
        _677 = _625;
    }
    float _681 = _677;
    bool _683 = _647 > 0.0;
    float _685 = _633 * 2.0;
    float _687 = 0.0;
    float _689 = _681;
    if (!_641)
    {
        _687 = _633;
    }
    float _691 = _687;
    float _693 = floor(_675);
    float _695 = _691;
    if (_641)
    {
        _689 = _633;
    }
    float _697 = _689;
    float _699 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_641)
    {
        _679 = _625;
    }
    float _701 = _679;
    if (_641)
    {
        _695 = _503;
    }
    float _703 = _695;
    float _705 = _667 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _707 = floor(_685);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _711 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _713 = isnan(_623);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    bool _723 = _693 >= 0.0;
    bool _725 = isnan(_693);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_699, -2.0, _709);
    bool _735 = _693 > 0.0;
    float _737 = _633 + _625;
    int _739 = _731 ? 0 : 1;
    float _741 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _733);
    bool _743 = _647 >= 0.0;
    bool _745 = isnan(_647);
    bool _747 = _743 || _745;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    float _753 = _737 + (-1.0);
    int _755 = ~_739;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    int _761 = _751 ? 0 : 1;
    float _763 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _765 = !_657;
    float _767 = _765 ? _217 : as_type<float>(_651);
    int _769 = ~_761;
    int _771 = _769 + 1;
    int _773 = _771 + 1;
    int _775 = _773;
    int _777 = _759;
    if (!_683)
    {
        int _779 = ~_761;
        int _781 = _779 + 1;
        _775 = _781;
    }
    int _783 = _775;
    float _785 = _149 * _631;
    if (!_735)
    {
        int _787 = ~_739;
        int _789 = _787 + 1;
        _777 = _789;
    }
    int _791 = _777;
    float _793 = _767 + 0.5;
    bool _795 = _633 > 0.5;
    if (!_641)
    {
        _671 = _625;
    }
    float _797 = _671;
    float _799 = exp2(_785);
    float _801 = -_227;
    int _803 = _795 ? as_type<int>(_801) : as_type<int>(_227);
    float _805 = -_217;
    int _807 = _795 ? as_type<int>(_805) : as_type<int>(_217);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _815 = _813 != 0;
    bool _817 = _707 > 0.0;
    bool _819 = !_663;
    float _821 = _819 ? _227 : as_type<float>(_803);
    bool _823 = _707 >= 0.0;
    bool _825 = isnan(_707);
    bool _827 = _823 || _825;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = _625 > 0.5;
    float _835 = _831 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _837 = -_799;
    float _839 = _837 + 1.0;
    float _841 = -_227;
    int _843 = _833 ? as_type<int>(_841) : as_type<int>(_227);
    int _845 = ~as_type<int>(_835);
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    float _853 = _835;
    float _855 = _797;
    if (!_817)
    {
        int _857 = ~as_type<int>(_835);
        int _859 = _857 + 1;
        _851 = _859;
    }
    int _861 = _851;
    bool _863 = !_811;
    float _865 = _863 ? _217 : as_type<float>(_807);
    bool _867 = !_815;
    float _869 = _867 ? _227 : as_type<float>(_843);
    if (_641)
    {
        _853 = _633;
    }
    float _871 = _853;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _871;
    if (_641)
    {
        _855 = _633;
    }
    float _887 = _855;
    if (!_641)
    {
        _885 = _503;
    }
    float _889 = _885;
    bool _891 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _899 = _895 || _897;
    bool _901 = !_875;
    int _903 = _901 ? 0 : 1;
    float _905 = _899 ? _839 : 0.0;
    float _907 = _451 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _911 = _909 != 0;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _915 = _913 != 0;
    float _917 = _451 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _919 = _643 > 0.5;
    float _921 = _451 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _923 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _931 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _921);
    float _933 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _917);
    float _935 = 1.0 / _927;
    float _937 = _637 * _929;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _943 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _933);
    float _945 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _923);
    float _947 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _931);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _949;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _955 = 1.0 / _941;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _961 = abs(_903);
    float _963 = -_953;
    float _965 = fma(_659, 2.0, _963);
    float _967 = _947 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _969 = float(_791);
    float _971 = -_149;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[76].x, _965);
    float _975 = _951 * _935;
    float _977 = _503 + _625;
    float _979 = _503 + _633;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _985 = _623 + _983;
    float _987 = _977 + (-1.0);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _991 = _623 + _989;
    float _993 = _979 + (-1.0);
    float _995 = _959 * _955;
    float _997 = fma(_975, _991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    out.m_70.w = _981;
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1005 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1007 = isnan(_623);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1019 = 1.0 + _1017;
    float _1021 = fma(_995, _985, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1023 = float(_961);
    float _1025 = _503 + (-0.5);
    bool _1027 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_623);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = -_1015;
    float _1041 = _1039 + 1.0;
    float _1043 = fma(_705, _793, _973);
    float _1045 = 1.0 / _1019;
    float _1047 = -_1037;
    float _1049 = _1047 + 1.0;
    float _1051 = _701 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1053 = float(_861);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1057 = _1015 * _1049;
    float _1059 = _721 * _1041;
    float _1061 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1063 = _821 + (-0.5);
    float _1065 = -_721;
    float _1067 = _1065 + 1.0;
    float _1069 = _997 * _1059;
    float _1071 = -_1055;
    float _1073 = fma(_1051, 2.0, _1071);
    float _1075 = in.m_72.x;
    float _1077 = in.m_72.y;
    float _1079 = in.m_72.z;
    float _1081 = -_1061;
    float _1083 = -_741;
    float _1085 = fma(_1081, _1063, _1083);
    float _1087 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1069);
    float _1089 = _905 * _1045;
    float _1091 = _1023 * _969;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1097 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1093);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1103 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1095);
    float _1105 = _703 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1109 = _1091 * (-2.0);
    float _1111 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1101);
    float _1113 = -_1099;
    float _1115 = fma(_1105, 2.0, _1113);
    float _1117 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1107);
    float _1119 = fma(_1001, _1109, _1001);
    bool _1121 = !_879;
    int _1123 = _1121 ? 0 : 1;
    uint _1126 = uint(int(uint(_595) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    float _1142 = fma(_1109, _1075, _1075);
    bool _1144 = !_883;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_1021, _1057, _1087);
    int _1150 = abs(_1123);
    float _1152 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1142);
    int _1154 = abs(_1146);
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1158 = _595 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    bool _1168 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1170 = isnan(1.0);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1148);
    float _1180 = float(_783);
    float _1182 = _697 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1184 = float(_1150);
    float _1186 = -_149;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1115);
    float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1192 = !_1176;
    float _1194 = _1192 ? _149 : _1089;
    float _1196 = _1184 * _1180;
    float _1198 = float(_1154);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1202 = fma(_1194, _1119, _1152);
    float _1204 = _1196 * (-2.0);
    float _1206 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1200);
    float _1208 = _633 + (-0.5);
    float _1210 = _1202 * 0.15915493667125701904296875;
    float _1212 = fma(_1204, _1077, _1077);
    float _1214 = _1198 * _1053;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1218 = fma(_763, _1204, _763);
    float _1220 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1212);
    float _1222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1224 = _1214 * (-2.0);
    float _1226 = fma(_1194, _1218, _1220);
    float _1228 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1216);
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1234 = fma(_1224, _1079, _1079);
    float _1236 = _625 + (-0.5);
    float _1238 = fma(_999, _1224, _999);
    float _1240 = _865 + 0.5;
    float _1242 = _1226 * 0.15915493667125701904296875;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1234);
    float _1246 = -_149;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1073);
    float _1250 = _1210 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1256 = fma(_1194, _1238, _1244);
    float _1258 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1260 = -_217;
    int _1262 = _833 ? as_type<int>(_1260) : as_type<int>(_217);
    float _1264 = fma(_1182, -2.0, _1232);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_1258, _1240, _1248);
    float _1270 = _1210 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1132 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1276 = -_227;
    int _1278 = _919 ? as_type<int>(_1276) : as_type<int>(_227);
    float _1280 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1282 = !_911;
    float _1284 = _1282 ? _217 : as_type<float>(_1262);
    float _1286 = _889 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1288 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = _1242 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1296 = !_915;
    float _1298 = _1296 ? _227 : as_type<float>(_1278);
    float _1300 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1284 + 0.5;
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1308 = _1298 + (-0.5);
    float _1310 = _1242 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1264);
    float _1316 = fma(_1280, _1302, _1188);
    float _1318 = fma(_1286, -2.0, _1306);
    float _1320 = -_1230;
    float _1322 = -_1314;
    float _1324 = fma(_1320, _1308, _1322);
    float _1326 = _1266 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = _1272 * _1292;
    float _1334 = _1252 * _1292;
    out.m_74.x = _1300;
    out.m_74.y = _1330;
    out.m_74.z = _1304;
    out.m_74.w = _1288;
    float _1336 = _1266 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = _1252 * _1312;
    float _1342 = _1272 * _1312;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1346 = _1252 * _1328;
    float _1348 = _1272 * _1328;
    float _1350 = _1312 * _1328;
    float _1352 = _1292 * _1328;
    float _1354 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1356 = _1348 * _937;
    float _1358 = _869 + (-0.5);
    float _1360 = -_1332;
    float _1362 = fma(_1338, _1340, _1360);
    float _1364 = -_1340;
    float _1366 = fma(_1338, _1332, _1364);
    float _1368 = fma(_1338, _1342, _1334);
    float _1370 = -_937;
    float _1372 = _1338 * _1370;
    float _1374 = fma(_1338, _1334, _1342);
    float _1376 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1318);
    float _1378 = fma(_1368, _665, _1356);
    float _1380 = _1346 * _937;
    float _1382 = fma(_1350, _665, _1372);
    float _1384 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1386 = fma(_1366, _1354, _1378);
    float _1388 = fma(_1362, _665, _1380);
    float _1390 = fma(_1352, _1354, _1382);
    float _1392 = -_1384;
    float _1394 = -_1376;
    float _1396 = fma(_1392, _1358, _1394);
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1400 = fma(_1374, _1354, _1388);
    float _1402 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1404 = _945 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1406 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1398);
    float _1408 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1410 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1402);
    float _1412 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1414 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1406);
    float _1416 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1418 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1410);
    float _1420 = -_1338;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1408);
    float _1424 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1426 = -_1338;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1412);
    float _1430 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1432 = -_1338;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1416);
    float _1436 = _967 + _1424;
    float _1438 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1422);
    float _1440 = _1404 + _1430;
    float _1442 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1428);
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1446 = _1436 + _1444;
    float _1448 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1434);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1452 = _1440 + _1450;
    float _1454 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1456 = _1446 * _1446;
    float _1458 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1460 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1462 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1454);
    float _1464 = fma(_1452, _1452, _1456);
    float _1466 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1458);
    float _1468 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1460);
    float _1470 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1472 = sqrt(_1464);
    float _1474 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1476 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1478 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1480 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1470);
    float _1482 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1474);
    float _1484 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1476);
    float _1486 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1478);
    float _1488 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1480);
    float _1490 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1482);
    float _1492 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1484);
    float _1494 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1486);
    float _1496 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1498 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1462);
    float _1500 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1502 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1468);
    bool _1504 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1508 = _943 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1510 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1512 = _1496 * _1442;
    float _1514 = _1496 * _1438;
    float _1516 = _1496 * _1448;
    float _1518 = _1508 + _1510;
    float _1520 = fma(_1506, _1498, _1512);
    float _1522 = fma(_1506, _1500, _1514);
    float _1524 = fma(_1506, _1502, _1516);
    float _1526 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1111);
    float _1528 = _1111;
    float _1530 = _1440;
    float _1532 = _1436;
    float _1534 = _1500;
    float _1536 = _967;
    if (!_1504)
    {
        _1528 = _1440;
    }
    float _1538 = _1528;
    float _1540 = _1538;
    if (!_1504)
    {
        _1530 = _1518;
    }
    float _1542 = _1530;
    bool _1544 = !_1504;
    float _1546 = _1542;
    if (!_1544)
    {
        float _1548 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1552 = _1472 + _1550;
        float _1554 = rsqrt(_1464);
        float _1556 = _1552 * _1548;
        float _1558 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1560 = _1556 * 0.15915493667125701904296875;
        float _1562 = _1560 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        float _1566 = _1560 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        float _1570 = _1564 + (-1.0);
        float _1572 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1574 = fma(_1568, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1576 = fma(_1518, _1564, _1572);
        float _1578 = _1554 * _1574;
        float _1580 = fma(_1452, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1582 = fma(_1446, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1546 = _1576;
        _1540 = _1580;
        _1532 = _1582;
    }
    float _1584 = _1546;
    float _1586 = _1540;
    float _1588 = _1532;
    float _1590 = fma(_1496, _1496, 1.0);
    float _1592 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1228);
    float _1594 = -_1526;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1097);
    float _1600 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1206);
    float _1602 = -_1592;
    float _1604 = _1602 + 1.0;
    float _1606 = rsqrt(_1590);
    float _1608 = -_1596;
    float _1610 = fma(_865, _1608, _1268);
    float _1612 = -_1508;
    float _1614 = _1612 + _1584;
    float _1616 = -_1598;
    float _1618 = _1616 + 1.0;
    float _1620 = fma(_869, _1604, _1396);
    float _1622 = -_1404;
    float _1624 = _1622 + _1586;
    float _1626 = _1614 * _1614;
    float _1628 = -_1618;
    float _1630 = fma(_767, _1628, _1043);
    float _1632 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1103);
    float _1634 = -_967;
    float _1636 = _1634 + _1588;
    float _1638 = fma(_1624, _1624, _1626);
    float _1640 = -_1600;
    float _1642 = _1640 + 1.0;
    float _1644 = -_1632;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1117);
    float _1650 = fma(_1636, _1636, _1638);
    float _1652 = fma(_821, _1642, _1085);
    float _1654 = _1496 * _1606;
    float _1656 = -_1646;
    float _1658 = fma(_1284, _1656, _1316);
    float _1660 = -_1648;
    float _1662 = _1660 + 1.0;
    float _1664 = sqrt(_1650);
    float _1666 = -_1490;
    float _1668 = _1654 * _1666;
    float _1670 = -_1488;
    float _1672 = _1654 * _1670;
    float _1674 = -_1494;
    float _1676 = _1654 * _1674;
    float _1678 = fma(_1298, _1662, _1324);
    float _1680 = fma(_1606, _1442, _1668);
    float _1682 = fma(_1606, _1438, _1672);
    float _1684 = fma(_1606, _1448, _1676);
    float _1686 = _1490 + _1520;
    float _1688 = _1488 + _1522;
    float _1690 = _1494 + _1524;
    out.m_76.x = _1630;
    out.m_76.y = _1652;
    out.m_76.z = _1658;
    out.m_76.w = _1678;
    out.m_78.x = _1610;
    out.m_78.y = _1620;
    bool _1692 = _1664 > 0.0;
    out.m_80.x = _1498;
    out.m_80.y = _1500;
    out.m_80.z = _1502;
    out.m_82.x = _1680;
    out.m_82.y = _1682;
    out.m_82.z = _1684;
    out.m_84.x = _1686;
    out.m_84.y = _1688;
    out.m_84.z = _1690;
    bool _1694 = !_1692;
    float _1696 = _1678;
    float _1698 = _1652;
    float _1700 = _1588;
    float _1702 = _1584;
    float _1704 = _1586;
    int _1706 = as_type<int>(_1614);
    if (!_1694)
    {
        bool _1708 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1710 = _1498;
        if (_1708)
        {
            float _1712 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1710 = _1712;
        }
        float _1714 = _1710;
        float _1716 = _1714;
        if (_1708)
        {
            float _1718 = _461 * _1714;
            _1696 = _1718;
        }
        float _1720 = _1696;
        float _1722 = _1720;
        if (_1708)
        {
            float _1724 = _463 * _1714;
            _1698 = _1724;
        }
        float _1726 = _1698;
        float _1728 = _1726;
        if (_1708)
        {
            float _1730 = _465 * _1714;
            _1534 = _1730;
        }
        float _1732 = _1534;
        float _1734 = _1732;
        if (!_1708)
        {
            float _1736 = _149 + 1.0;
            float _1738 = _1736;
            if (!_183)
            {
                float _1740 = _1736 * _1736;
                float _1742 = _1740 * 0.5;
                _1716 = _1742;
            }
            float _1744 = _1716;
            float _1746 = _1744;
            if (!_183)
            {
                float _1748 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1746 = _1748;
            }
            float _1750 = _1746;
            bool _1752 = !_183;
            float _1754 = _1750;
            if (!_1752)
            {
                float _1756 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1758 = log2(_1756);
                float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1762 = 1.0 + _1760;
                float _1764 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1766 = _1758 * _1736;
                float _1768 = 1.0 / _1762;
                float _1770 = _1764 * 0.693147182464599609375;
                float _1772 = exp2(_1766);
                float _1774 = 1.0 / _1770;
                float _1776 = _1772 + (-1.0);
                float _1778 = -_1776;
                float _1780 = fma(_1778, _1774, _1736);
                float _1782 = _1780 * _1768;
                float _1784 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1754 = _1784;
            }
            float _1786 = _1754;
            float _1788 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1790 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1792 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1794 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1796 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1798 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1800 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1794);
            float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1796);
            float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1800);
            bool _1806 = !_183;
            if (!_1806)
            {
                float _1808 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1810 = log2(_1808);
                float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1814 = 1.0 + _1812;
                float _1816 = 1.0 / _1814;
                float _1818 = _1810 * _1736;
                float _1820 = exp2(_1818);
                float _1822 = -_1820;
                float _1824 = _1822 + 1.0;
                float _1826 = _1824 * _1816;
                _1738 = _1826;
            }
            float _1828 = _1738;
            float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1798);
            float _1832 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
            float _1834 = fma(_1828, _187, _1804);
            float _1836 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1830);
            float _1838 = fma(_1828, _185, _1832);
            float _1840 = -_423;
            float _1842 = _1840 + _1834;
            float _1844 = fma(_1828, _189, _1836);
            float _1846 = -_427;
            float _1848 = _1846 + _1838;
            float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1852 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1854 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1856 = -_429;
            float _1858 = _1856 + _1844;
            float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1850);
            float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1852);
            float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1854);
            float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1860);
            float _1868 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1862);
            float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1864);
            _469 = _1868;
            _471 = _1866;
            _473 = _1870;
            _1722 = _1866;
            _1728 = _1868;
            _1734 = _1870;
        }
        float _1872 = _469;
        float _1874 = _471;
        float _1876 = _473;
        float _1878 = _1722;
        float _1880 = _1728;
        float _1882 = _1734;
        float _1884 = _1872 * _1872;
        float _1886 = fma(_1874, _1874, _1884);
        float _1888 = rsqrt(_1650);
        float _1890 = fma(_1876, _1876, _1886);
        float _1892 = sqrt(_1890);
        float _1894 = _1624 * _1888;
        float _1896 = _1614 * _1888;
        float _1898 = _1636 * _1888;
        bool _1900 = _1892 > 0.0;
        bool _1902 = !_1900;
        if (!_1902)
        {
            float _1904 = rsqrt(_1890);
            float _1906 = _1904 * _1872;
            float _1908 = _1904 * _1874;
            float _1910 = _1904 * _1876;
            float _1912 = _1896 * _1906;
            float _1914 = fma(_1894, _1908, _1912);
            float _1916 = fma(_1898, _1910, _1914);
            float _1918 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1920 = fma(_1878, _1918, _1586);
            float _1922 = fma(_1880, _1918, _1584);
            float _1924 = fma(_1882, _1918, _1588);
            _1700 = _1924;
            _1702 = _1922;
            _1704 = _1920;
        }
    }
    float _1926 = _1700;
    float _1928 = _1702;
    float _1930 = _1704;
    float _1932 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1934 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1936 = floor(_1932);
    float _1938 = floor(_1934);
    float _1940 = -_1936;
    float _1942 = _1932 + _1940;
    float _1944 = -_1938;
    float _1946 = _1934 + _1944;
    float2 _6360 = float2(_1942, _1946);
    float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6360, float2(0.0), isnan(_6360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6360, float2(0.0), isnan(_6360)), level(0.0)).x;
    float _1950 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1952 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _1954 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1956 = isnan(0.5);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1962 = _1958 || _1960;
    float _1964 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1950);
    float _1966 = _1508 + _1952;
    float _1968 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1964);
    float _1970 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1974 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1976 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1970);
    float _1978 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1972);
    float _1980 = 1.0 / _1974;
    float _1982 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1976);
    float _1984 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1978);
    float _1986 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1988 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1990 = _1984;
    int _1992 = 2;
    if (_1962)
    {
        _1990 = _1926;
    }
    float _1994 = _1990;
    float _1996 = _1986 + _1974;
    float _1998 = _1996 * _1980;
    float _2000 = _1998 * 0.5;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2004 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2002);
    float _2006 = 1.0 / _2004;
    float _2008 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2010 = _2006 * _2008;
    float _2012 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2014 = _2010 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2016 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2012);
    bool _2018 = _2010 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2020 = !_2014;
    int _2022 = _2020 ? 0 : 1;
    float _2024 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2016);
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2028 = _1994;
    if (!_2014)
    {
        _1992 = 1;
    }
    int _2030 = _1992;
    float _2032 = trunc(_2026);
    int _2034 = int(_2032);
    int _2036 = _2030;
    if (!_2018)
    {
        _2036 = _2022;
    }
    int _2038 = _2036;
    int _2040 = _2038 << 6;
    float _2042 = trunc(_1988);
    int _2044 = int(_2042);
    int _2046 = _2040 + 48;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
    int _2052 = int(_2048) & 3;
    float _2054 = (*spvDescriptorSet0.vp_c15)._m0[int(_2050)][_2052];
    int _2056 = int(_2048) + 1;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    int _2060 = _2056 & 3;
    float _2062 = (*spvDescriptorSet0.vp_c15)._m0[int(_2058)][_2060];
    int _2064 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2066 = _2034 + _2064;
    int _2068 = _2066 + 1;
    int _2070 = _2040 + 56;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c15)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
    int _2088 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2090 = _2044 + _2088;
    int _2092 = _2090 + 1;
    int _2094 = _2040 + 64;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c15)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c15)._m0[int(_2106)][_2108];
    float _2112 = as_type<float>(_2044);
    float _2114 = as_type<float>(_2038);
    if (_1962)
    {
        _2112 = _1928;
    }
    float _2116 = _2112;
    bool _2118 = _2092 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2120 = _2092 | _2068;
    int _2122 = _2040 + 72;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    bool _2140 = _2120 < 0;
    bool _2142 = _2140 || _2118;
    float _2144 = as_type<float>(_2120);
    float _2146 = _2116;
    if (_1962)
    {
        _2144 = _1930;
    }
    float _2148 = _2144;
    bool _2150 = _2068 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2152 = _2150 || _2142;
    int _2154 = _2040 + 96;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c15)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c15)._m0[int(_2166)][_2168];
    int _2172 = _2040 + 104;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    uint _2176 = uint(int(uint(int(_2174)) >> uint(2)));
    int _2178 = int(_2174) & 3;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[int(_2176)][_2178];
    int _2182 = int(_2174) + 1;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    int _2186 = _2182 & 3;
    float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
    float _2190 = _2148;
    if (!_1962)
    {
        float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2194 = _1508 + _2192;
        float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2198 = _1404 + _2196;
        float _2200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2202 = -_1508;
        float _2204 = _2202 + _1928;
        float _2206 = _2194 * _2194;
        float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2210 = _967 + _2208;
        float _2212 = -_967;
        float _2214 = _2212 + _1926;
        float _2216 = fma(_2198, _2198, _2206);
        float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2220 = fma(_2210, _2210, _2216);
        float _2222 = sqrt(_2220);
        float _2224 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2226 = precise::min(_2222, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2228 = _2226 * _2218;
        float _2230 = _2224 * _2228;
        float _2232 = -_1404;
        float _2234 = _2232 + _1930;
        float _2236 = fma(_2204, _2230, _1508);
        float _2238 = fma(_2234, _2230, _1404);
        float _2240 = fma(_2214, _2230, _967);
        _2146 = _2236;
        _2190 = _2238;
        _2028 = _2240;
        _1706 = as_type<int>(_2230);
    }
    float _2242 = _2146;
    float _2244 = _2190;
    float _2246 = _2028;
    int _2248 = _1706;
    float _2250 = _1966 * _2170;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2254 = _2248;
    if (!_2152)
    {
        int _2256 = _2068 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2258 = _2256 + _2092;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = _1966 * _2110;
    float _2264 = fma(_1404, _2162, _2250);
    float _2266 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2252);
    float _2268 = _1966 * _2062;
    float _2270 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2272 = fma(_967, _2180, _2264);
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2266);
    int _2276 = as_type<int>(_2264);
    int _2278 = as_type<int>(_2274);
    if (!_2152)
    {
        int _2280 = _2260 << 2;
        _2276 = _2280;
    }
    int _2282 = _2276;
    float _2284 = fma(_1404, _2054, _2268);
    float _2286 = _2272 + _2188;
    float _2288 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2290 = _2282;
    if (!_2152)
    {
        uint _2292 = uint(int(uint(_2260) >> uint(2)));
        _2278 = int(_2292);
    }
    int _2294 = _2278;
    float _2296 = fma(_1404, _2102, _2262);
    if (!_2152)
    {
        int _2298 = 12 & _2282;
        _2290 = _2298;
    }
    int _2300 = _2290;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2304 = _2040 + 80;
    uint _2306 = uint(int(uint(_2304) >> uint(2)));
    uint _2308 = uint(int(uint(int(_2306)) >> uint(2)));
    int _2310 = int(_2306) & 3;
    float _2312 = (*spvDescriptorSet0.vp_c15)._m0[int(_2308)][_2310];
    int _2314 = int(_2306) + 1;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    int _2318 = _2314 & 3;
    float _2320 = (*spvDescriptorSet0.vp_c15)._m0[int(_2316)][_2318];
    float _2322 = 1.0 / _2286;
    float _2324 = fma(_967, _2078, _2284);
    float _2326 = -_2302;
    float _2328 = fma(_2326, _2270, 1.0);
    float _2330 = _2302;
    if (!_2152)
    {
        int _2332 = _2294 << 4;
        int _2334 = _2332 + _2300;
        _2330 = as_type<float>(_2334);
    }
    float _2336 = _2330;
    float _2338 = fma(_967, _2130, _2296);
    float _2340 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2342 = _2324 + _2086;
    int _2344 = _2040 + 88;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    uint _2348 = uint(int(uint(int(_2346)) >> uint(2)));
    int _2350 = int(_2346) & 3;
    float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
    int _2354 = int(_2346) + 1;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    int _2358 = _2354 & 3;
    float _2360 = (*spvDescriptorSet0.vp_c15)._m0[int(_2356)][_2358];
    float _2362 = _2338 + _2138;
    float _2364 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2340);
    float _2366 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2368 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2370 = _1524;
    if (!_2152)
    {
        float _2372 = floor(_2026);
        _2370 = _2372;
    }
    float _2374 = _2370;
    float _2376 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2378 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2366);
    float _2380 = _2336;
    if (!_2152)
    {
        int _2382 = as_type<int>(_2336) + 400;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
        int _2388 = int(_2384) & 3;
        float _2390 = (*spvDescriptorSet0.vp_c15)._m0[int(_2386)][_2388];
        _2380 = _2390;
    }
    float _2392 = _2380;
    float _2394 = _2342 * _2322;
    float _2396 = _2362 * _2322;
    float _2398 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2378);
    float _2400 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2402 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2368);
    bool _2404 = _2394 >= 0.0;
    float _2406 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2408 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2410 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2402);
    bool _2412 = _2394 <= 1.0;
    bool _2414 = _2412 && _2404;
    float _2416 = log2(_2328);
    float _2418 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2408);
    float _2420 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2422 = _2396 >= 0.0;
    bool _2424 = _2422 && _2414;
    float _2426 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2428 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2418);
    float _2430 = _2374;
    float _2432 = _2426;
    if (!_2152)
    {
        float _2434 = -_2374;
        float _2436 = _2026 + _2434;
        _2430 = _2436;
    }
    float _2438 = _2430;
    bool _2440 = _2396 <= 1.0;
    bool _2442 = _2440 && _2424;
    float _2444 = _2402;
    if (!_2152)
    {
        float _2446 = floor(_1988);
        _2444 = _2446;
    }
    float _2448 = _2444;
    float _2450 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2428);
    float _2452 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2454 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2426);
    float _2456 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2452);
    float _2458 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2454);
    float _2460 = 1.0 / _2450;
    float _2462 = _2416 * 0.693147182464599609375;
    float _2464 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2456);
    float _2466 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2458);
    if (_2442)
    {
        float _2468 = float(_2038);
        _2432 = _2468;
    }
    float _2470 = _2432;
    float _2472 = _1966 * _2320;
    float _2474 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2464);
    float _2476 = _2448;
    if (!_2152)
    {
        float _2478 = -_2448;
        float _2480 = _1988 + _2478;
        _2476 = _2480;
    }
    float _2482 = _2476;
    float _2484 = fma(_1404, _2312, _2472);
    float _2486 = _2470;
    if (_2442)
    {
        float _2488 = rint(_2470);
        float _2490 = precise::max(_2488, 0.0);
        uint _2492 = uint(_2490);
        uint _2494 = clamp(_2492, 0u, 65535u);
        _2486 = as_type<float>(_2494);
    }
    float _2496 = _2486;
    float _2498 = fma(_967, _2352, _2484);
    float _2500 = _2474 * _2460;
    float _2502 = _2498 + _2360;
    float _2504 = _2466 * _2460;
    float _2506 = _2392;
    if (!_2152)
    {
        float _2508 = rint(_2392);
        float _2510 = precise::max(_2508, 0.0);
        uint _2512 = uint(_2510);
        uint _2514 = clamp(_2512, 0u, 65535u);
        _2506 = as_type<float>(_2514);
    }
    float _2516 = _2506;
    float _2518 = _2502 * _2322;
    float _2520 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2522 = fma(_2504, 0.5, 0.5);
    float _2524 = fma(_2500, -0.5, 0.5);
    float _2526 = _2396;
    if (_2442)
    {
        float3 _7351 = float3(_2394, _2396, float(as_type<int>(_2496)));
        float3 _7355 = select(_7351, float3(0.0), isnan(_7351));
        float _2528 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7355.xy, uint(rint(_7355.z)), _2518, level(0.0));
        _2526 = _2528;
    }
    float _2530 = _2526;
    float3 _7365 = float3(_2522, _2524, _2520);
    float _2532 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7365, float3(0.0), isnan(_7365)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7365, float3(0.0), isnan(_7365)), level(0.0)).x;
    float3 _7374 = float3(_2522, _2524, _2520);
    float4 _2535 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7374, float3(0.0), isnan(_7374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7374, float3(0.0), isnan(_7374)), level(0.0)).xyzw;
    float _2537 = _2535.x;
    float _2539 = _2535.y;
    float _2541 = _2535.z;
    float _2543 = _2535.w;
    float _2545 = _2482;
    if (!_2152)
    {
        float3 _7397 = float3(_2482, _2438, float(as_type<int>(_2516)));
        float3 _7399 = select(_7397, float3(0.0), isnan(_7397));
        float _2547 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7399.xy, uint(rint(_7399.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7399.xy, uint(rint(_7399.z)), level(0.0)).x;
        _2545 = _2547;
    }
    float _2549 = _2545;
    if (_2152)
    {
        _2114 = 1.0;
    }
    float _2551 = _2114;
    float _2553 = _2551;
    if (!_2152)
    {
        int _2555 = _2260 << 4;
        int _2557 = _2555 + 2048;
        uint _2559 = uint(int(uint(_2557) >> uint(2)));
        uint _2561 = uint(int(uint(int(_2559)) >> uint(2)));
        int _2563 = int(_2559) & 3;
        float _2565 = (*spvDescriptorSet0.vp_c15)._m0[int(_2561)][_2563];
        int _2567 = int(_2559) + 1;
        uint _2569 = uint(int(uint(_2567) >> uint(2)));
        int _2571 = _2567 & 3;
        float _2573 = (*spvDescriptorSet0.vp_c15)._m0[int(_2569)][_2571];
        int _2575 = _2557 + 8;
        uint _2577 = uint(int(uint(_2575) >> uint(2)));
        uint _2579 = uint(int(uint(int(_2577)) >> uint(2)));
        int _2581 = int(_2577) & 3;
        float _2583 = (*spvDescriptorSet0.vp_c15)._m0[int(_2579)][_2581];
        int _2585 = int(_2577) + 1;
        uint _2587 = uint(int(uint(_2585) >> uint(2)));
        int _2589 = _2585 & 3;
        float _2591 = (*spvDescriptorSet0.vp_c15)._m0[int(_2587)][_2589];
        float _2593 = _1966 * _2573;
        float _2595 = fma(_1404, _2565, _2593);
        float _2597 = fma(_967, _2583, _2595);
        float _2599 = _2597 + _2591;
        float _2601 = precise::clamp(_2599, 0.0, 1.0);
        float _2603 = -_2601;
        float _2605 = _2603 + _2549;
        float _2607 = fma(_2605, 500.0, 1.5);
        float _2609 = exp2(_2607);
        float _2611 = 0.0 + _2609;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        _2553 = _2613;
    }
    float _2615 = _2553;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2619 = _2242 + _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2623 = _2244 + _2621;
    float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2627 = _2246 + _2625;
    float _2629 = _2619 * _2619;
    float _2631 = fma(_2623, _2623, _2629);
    float _2633 = fma(_2627, _2627, _2631);
    float _2635 = rsqrt(_2633);
    float _2637 = _2635 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2639 = _2623 * _2637;
    float _2641 = _2627 * _2637;
    float _2643 = _2639 * _2639;
    float _2645 = _2641 * _2641;
    float _2647 = _2643 + _2645;
    float _2649 = sqrt(_2647);
    bool _2651 = _2649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2655 = _2649 + _2653;
    float _2657 = _2627;
    float _2659 = _2635;
    float _2661 = _2655;
    float _2663 = _2637;
    if (_2651)
    {
        float _2665 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2657 = _2665;
    }
    float _2667 = _2657;
    if (_2651)
    {
        float _2669 = rsqrt(_2647);
        _2659 = _2669;
    }
    float _2671 = _2659;
    float _2673 = _2671;
    if (_2651)
    {
        float _2675 = _2655 * _2667;
        _2661 = _2675;
    }
    float _2677 = _2661;
    if (_2651)
    {
        float _2679 = _2677 * 0.15915493667125701904296875;
        _1536 = _2679;
    }
    float _2681 = _1536;
    float _2683 = _2667;
    float _2685 = _2681;
    if (_2651)
    {
        float _2687 = _2681 * 6.283185482025146484375;
        float _2689 = sin(_2687);
        _2683 = _2689;
    }
    float _2691 = _2683;
    float _2693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2695 = precise::max(0.0, _2693);
    float _2697 = _2629;
    float _2699 = _2695;
    if (_2651)
    {
        float _2701 = _2681 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        _2697 = _2703;
    }
    float _2705 = _2697;
    float _2707 = -_2637;
    float _2709 = -_2695;
    float _2711 = fma(_2619, _2707, _2709);
    float _2713 = _2711;
    if (_2651)
    {
        float _2715 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2699 = _2715;
    }
    float _2717 = _2699;
    float _2719 = _2717;
    if (!_2651)
    {
        _2685 = _2643;
    }
    float _2721 = _2685;
    float _2723 = _2691;
    float _2725 = _2721;
    if (_2651)
    {
        float _2727 = fma(_2691, _2717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2723 = _2727;
    }
    float _2729 = _2723;
    float _2731 = _2729;
    float _2733 = _2705;
    if (_2651)
    {
        float _2735 = _2705 + (-1.0);
        _2719 = _2735;
    }
    float _2737 = _2719;
    float _2739 = _2737;
    if (_2651)
    {
        float _2741 = _2671 * _2729;
        _2663 = _2741;
    }
    float _2743 = _2663;
    if (!_2651)
    {
        _2673 = _2639;
    }
    float _2745 = _2673;
    float _2747 = _2745;
    if (_2651)
    {
        float _2749 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2739 = _2749;
    }
    float _2751 = _2739;
    if (_2651)
    {
        float _2753 = _2639 * _2743;
        _2747 = _2753;
    }
    float _2755 = _2747;
    if (!_2651)
    {
        _2731 = _2641;
    }
    float _2757 = _2731;
    float _2759 = _2757;
    if (_2651)
    {
        float _2761 = _2641 * _2743;
        _2759 = _2761;
    }
    float _2763 = _2759;
    if (_2651)
    {
        float _2765 = fma(_2711, _2705, _2751);
        _2713 = _2765;
    }
    float _2767 = _2713;
    if (_2651)
    {
        float _2769 = _2755 * _2755;
        _2725 = _2769;
    }
    float _2771 = _2725;
    if (!_2651)
    {
        _2733 = _2645;
    }
    float _2773 = _2733;
    float _2775 = _2773;
    if (_2651)
    {
        float _2777 = _2763 * _2763;
        _2775 = _2777;
    }
    float _2779 = _2775;
    float _2781 = sqrt(_2633);
    float _2783 = fma(_2767, _2767, _2771);
    float _2785 = _2783 + _2779;
    float _2787 = rsqrt(_2785);
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2791 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2789);
    float _2793 = precise::clamp(_2791, 0.0, 1.0);
    float _2795 = -_2793;
    float _2797 = _2795 + 1.0;
    float _2799 = _2787 * _2755;
    float _2801 = _2787 * _2767;
    float _2803 = _2787 * _2763;
    float _2805 = abs(_2797);
    float _2807 = log2(_2805);
    float _2809 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2811 = -_2809;
    float _2813 = fma(_2801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2811);
    float _2815 = -_2803;
    float _2817 = fma(_2815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2813);
    float _2819 = fma(_2817, -0.5, 0.5);
    float _2821 = fma(_2817, 0.5, 0.5);
    float _2823 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2825 = fma(_2821, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2827 = sqrt(_2819);
    float _2829 = fma(_2821, _2825, -0.212114393711090087890625);
    float _2831 = _2801 + 1.0;
    float _2833 = fma(_2821, _2829, 1.570728778839111328125);
    float _2835 = exp2(_2823);
    float _2837 = _2827 * 0.636619746685028076171875;
    float _2839 = -_2833;
    float _2841 = fma(_2837, _2839, 1.0);
    float _2843 = -_2801;
    float _2845 = fma(_2835, _2831, _2843);
    float _2847 = fma(_2845, 0.5, 0.5);
    float2 _7864 = float2(_2841, _2847);
    float3 _2851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7864, float2(0.0), isnan(_7864)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7864, float2(0.0), isnan(_7864)), level(0.0)).xyz;
    float _2853 = _2851.x;
    float _2855 = _2851.y;
    float _2857 = _2851.z;
    float _2859 = abs(_2010);
    float _2861 = log2(_2859);
    float _2863 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2865 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2867 = -_1948;
    float _2869 = _2867 + 1.0;
    float _2871 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2863);
    out.m_86.x = _2244;
    out.m_86.y = _2242;
    out.m_86.z = _2246;
    bool _2873 = _2010 <= 8000.0;
    bool _2875 = isnan(_2010);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(8000.0);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2871);
    float _2887 = exp2(_2865);
    float _2889 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2885);
    float _2891 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2893 = _2889 + _2450;
    float _2895 = exp2(_2891);
    float _2897 = _2893 * 0.5;
    float _2899 = _2893;
    if (!_2442)
    {
        _2899 = 1.0;
    }
    float _2901 = _2899;
    float _2903 = _2901;
    if (_2442)
    {
        bool _2905 = _2530 >= _2518;
        bool _2907 = isnan(_2530);
        bool _2909 = _2905 || _2907;
        bool _2911 = isnan(_2518);
        bool _2913 = _2909 || _2911;
        float _2915 = float(_2913);
        _2903 = _2915;
    }
    float _2917 = _2903;
    float _2919 = -_2887;
    float _2921 = _2919 + 1.0;
    bool _2923 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2925 = isnan(_2781);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2931 = _2927 || _2929;
    float _2933 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2935 = _2917 * _2615;
    float _2937 = _2933 * _2532;
    float _2939 = -_2933;
    float _2941 = _2939 + 1.0;
    float _2943 = fma(_2895, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2945 = precise::clamp(_2943, 0.0, 1.0);
    float _2947 = _2543 * _2937;
    float _2949 = fma(_2945, -2.0, 3.0);
    float _2951 = _2945 * _2945;
    float _2953 = _2951 * _2949;
    float _2955 = -_2953;
    float _2957 = _2955 + 1.0;
    out.m_88.z = _2897;
    out.m_88.w = _2450;
    float _2959 = fma(_2957, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2953);
    float _2961 = _2543 * _2941;
    float _2963 = _2941;
    float _2965 = _2466;
    float _2967 = _2947;
    if (!_2931)
    {
        _2963 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2969 = _2963;
    float _2971 = _2883 * _2959;
    out.gl_Position.x = _2466;
    out.gl_Position.y = _2474;
    out.gl_Position.z = _2889;
    out.gl_Position.w = _2450;
    float _2973 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2975 = _2869 * _2973;
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = _2973;
    float _2981 = _2977;
    float _2983 = _2969;
    float _2985 = _2969;
    if (!_2931)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2987 = _2979;
    float _2989 = -_2977;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2993 = _2987;
    float _2995 = _2987;
    if (!_2931)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2997 = _2981;
    float _2999 = -_2935;
    float _3001 = fma(_2999, _2991, 1.0);
    float _3003 = precise::clamp(_3001, 0.0, 1.0);
    float _3005 = _3003;
    float _3007 = _2997;
    float _3009 = _2997;
    if (!_2931)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3011 = _2965;
    float _3013 = _3003 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3015 = _3011;
    float _3017 = _3011;
    if (!_2931)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3019 = _3005;
    out.m_90.x = _3013;
    float _3021 = _2857 * _2937;
    float _3023 = fma(_2853, _2947, _2537);
    float _3025 = fma(_2855, _2947, _2539);
    float _3027 = _3019;
    float _3029 = _3019;
    if (!_2931)
    {
        _2967 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3031 = _2967;
    float _3033 = fma(_2543, _3021, _2541);
    out.m_92.x = _3023;
    out.m_92.y = _3025;
    out.m_92.z = _3033;
    out.m_92.w = _2961;
    bool _3035 = !_2931;
    float _3037 = _3031;
    float _3039 = _3031;
    if (!_3035)
    {
        bool _3041 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3043 = isnan(_2781);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3049 = _3045 || _3047;
        if (!_3049)
        {
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3053 = _2781 + _3051;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3055;
            float _3059 = 1.0 / _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3081 = _3053 * _3059;
            float _3083 = precise::clamp(_3081, 0.0, 1.0);
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3089 = fma(_3083, _3063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3091 = fma(_3083, _3087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3093 = fma(_3083, _3067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3095 = fma(_3083, _3071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3097 = fma(_3083, _3075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3099 = fma(_3083, _3079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2995 = _3091;
            _2985 = _3097;
            _3017 = _3089;
            _3039 = _3095;
            _3009 = _3093;
            _3029 = _3099;
            _3101 = true;
        }
        else
        {
            bool _3103 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3105 = isnan(_2781);
            bool _3107 = _3103 || _3105;
            bool _3109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3111 = _3107 || _3109;
            if (!_3111)
            {
                _3015 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3113 = _3015;
            _3017 = _3113;
            if (!_3111)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3115 = _2993;
            _2995 = _3115;
            if (!_3111)
            {
                _3007 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3117 = _3007;
            _3009 = _3117;
            if (!_3111)
            {
                _3037 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3119 = _3037;
            _3039 = _3119;
            if (!_3111)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3121 = _2983;
            _2985 = _3121;
            if (!_3111)
            {
                _3027 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3123 = _3027;
            bool _3125 = !_3111;
            _3029 = _3123;
            if (!_3125)
            {
                bool _3127 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3129 = isnan(_2781);
                bool _3131 = _3127 || _3129;
                bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3135 = _3131 || _3133;
                if (!_3135)
                {
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3139 = _2781 + _3137;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3141;
                    float _3145 = 1.0 / _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3167 = _3139 * _3145;
                    float _3169 = precise::clamp(_3167, 0.0, 1.0);
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2995 = _3177;
                    _2985 = _3183;
                    _3017 = _3175;
                    _3039 = _3181;
                    _3009 = _3179;
                    _3029 = _3185;
                    _3101 = true;
                }
                else
                {
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3017 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3039 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3009 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3029 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3101 = false;
    float _3187 = _2995;
    float _3189 = _2985;
    float _3191 = _3017;
    float _3193 = _3039;
    float _3195 = _3009;
    float _3197 = _3029;
    float _3199 = fma(_1688, -0.5, 0.5);
    float _3201 = precise::clamp(_3199, 0.0, 1.0);
    float _3203 = -_3187;
    float _3205 = _3203 + _3189;
    float _3207 = -_3191;
    float _3209 = _3207 + _3193;
    float _3211 = -_3195;
    float _3213 = _3211 + _3197;
    bool _3215 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3217 = fma(_3201, _3205, _3187);
    float _3219 = fma(_3201, _3209, _3191);
    float _3221 = fma(_3201, _3213, _3195);
    float _3223 = _3217 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _3225 = fma(_3219, 0.298911988735198974609375, _3223);
    float _3227 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3229 = fma(_3221, 0.114477999508380889892578125, _3225);
    out.m_59.x = _3227;
    float _3231 = -_3229;
    float _3233 = _3219 + _3231;
    float _3235 = -_3229;
    float _3237 = _3217 + _3235;
    float _3239 = -_3229;
    float _3241 = _3221 + _3239;
    float _3243 = fma(_3233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3245 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3247 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    out.m_96.x = _3243;
    out.m_96.y = _3245;
    out.m_96.z = _3247;
    if (!_3215)
    {
        return out;
    }
    float _3249 = -_2242;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3253 = -_2244;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3257 = -_2246;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3261 = _3251 * _3251;
    float _3263 = fma(_3255, _3255, _3261);
    float _3265 = fma(_3259, _3259, _3263);
    float _3267 = sqrt(_3265);
    float _3269 = rsqrt(_3265);
    float _3271 = -_3267;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3255 * _3269;
    float _3281 = _3251 * _3269;
    float _3283 = abs(_3277);
    float _3285 = log2(_3283);
    float _3287 = _3259 * _3269;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3291 = _1688 * _3281;
    float _3293 = -_3281;
    float _3295 = -_3289;
    float _3297 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3295);
    float _3299 = fma(_1686, _3279, _3291);
    float _3301 = -_3287;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3297);
    float _3305 = fma(_1690, _3287, _3299);
    float _3307 = precise::clamp(_3305, 0.0, 1.0);
    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3311 = _3303 + _3309;
    float _3313 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = exp2(_3313);
    float _3321 = _3319 * _3317;
    float _3323 = _3307 * _3321;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3327 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3329 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3325;
    out.m_94.y = _3327;
    out.m_94.z = _3329;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3101 = false;
    bool _615 = false;
    bool _493 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_59.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3386 = as_type<float>(_131);
        out.gl_Position.z = _3386;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_145)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _149 >= _153;
    bool _157 = !_145;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3455 = as_type<float>(_167);
        out.gl_Position.z = _3455;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_66.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_61.x;
    float _187 = in.m_61.y;
    float _189 = in.m_61.z;
    float _191 = in.m_56.x;
    float _193 = in.m_56.y;
    float _195 = in.m_56.z;
    int _197 = as_type<int>(_169) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_169) & 2;
    bool _203 = _201 != 0;
    float _205 = _169;
    float _207 = _171;
    if (!_183)
    {
        float _209 = _171 * _171;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    bool _215 = !_199;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _213;
    if (!_183)
    {
        float _221 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_203;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _223;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _171 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _171);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _267 = !_183;
    float _269 = _265;
    float _271 = _263;
    if (!_267)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _171 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _207 = _291;
    }
    float _293 = _207;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _299 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _301 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_183)
    {
        float _303 = _149 * _149;
        float _305 = _303 * 0.5;
        _269 = _305;
    }
    float _307 = _269;
    float _309 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].x, _297);
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].y, _299);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[8].z, _301);
    float _315 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_183)
    {
        float _317 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _317;
    }
    float _319 = _271;
    bool _321 = !_183;
    float _323 = _319;
    if (!_321)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = _149 * _327;
        float _337 = exp2(_335);
        float _339 = _333 * 0.693147182464599609375;
        float _341 = 1.0 / _339;
        float _343 = 1.0 / _331;
        float _345 = _337 + (-1.0);
        float _347 = -_345;
        float _349 = fma(_347, _341, _149);
        float _351 = _349 * _343;
        float _353 = _351 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _323 = _353;
    }
    float _355 = _323;
    float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].x, _309);
    float _361 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].y, _311);
    float _363 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _367 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _369 = _357 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _371 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[10].z, _313);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].x, _365);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].y, _367);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[8].z, _369);
    float _379 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = fma(_293, _185, _359);
    float _383 = fma(_293, _187, _361);
    float _385 = fma(_293, _189, _371);
    float _387 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].x, _373);
    float _389 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].y, _375);
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[10].z, _377);
    float _393 = _379;
    if (!_183)
    {
        _393 = _149;
    }
    float _395 = _393;
    bool _397 = !_183;
    float _399 = _395;
    if (!_397)
    {
        float _401 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _403 = log2(_401);
        float _405 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _407 = _405 + 1.0;
        float _409 = 1.0 / _407;
        float _411 = _149 * _403;
        float _413 = exp2(_411);
        float _415 = -_413;
        float _417 = _415 + 1.0;
        float _419 = _417 * _409;
        _399 = _419;
    }
    float _421 = _399;
    float _423 = fma(_421, _187, _389);
    bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _427 = fma(_421, _185, _387);
    float _429 = fma(_421, _189, _391);
    float _431 = -_423;
    float _433 = _383 + _431;
    float _435 = fma(_381, _173, _191);
    float _437 = -_427;
    float _439 = _381 + _437;
    float _441 = -_429;
    float _443 = _385 + _441;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_383, _173, _193);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _459 = fma(_385, _173, _195);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _465 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    bool _467 = !_425;
    float _469 = _463;
    float _471 = _461;
    float _473 = _465;
    float _491;
    if (!_467)
    {
        float _475 = in.m_68.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_115);
        float _497 = 1.0 / _495;
        float _499 = _149 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_68.x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _501 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    float _513 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _515 = in.m_66.x;
    float _517 = in.m_66.y;
    bool _519 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _521 = isnan(_501);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / _511;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = -_529;
    float _537 = _535 + 1.0;
    float _539 = _507 * _531;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _541;
    bool _545 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_501);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = _513 * _503;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _565 = _555 * _537;
    float _567 = fma(_561, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = trunc(_557);
    int _571 = int(_569);
    float _573 = -_555;
    float _575 = _573 + 1.0;
    float _577 = _563 * _565;
    float _579 = _567 * _565;
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _583 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _585 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[144].x, _583);
    float _587 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[144].y, _581);
    float _589 = _585 * _515;
    float _591 = _587 * _517;
    int _593 = _571 << 4;
    int _595 = _593 + 1712;
    bool _597 = !_533;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _503 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_115);
        float _619 = 1.0 / _617;
        float _621 = _149 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_68.z;
    float _627 = _503 * 2.0;
    float _629 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _631 = log2(_629);
    float _633 = in.m_68.y;
    bool _635 = _503 > 0.5;
    float _637 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = in.m_68.w;
    float _645 = _589 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _647 = floor(_627);
    float _649 = -_217;
    int _651 = _635 ? as_type<int>(_649) : as_type<int>(_217);
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _657 = _655 != 0;
    float _659 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _663 = _661 != 0;
    float _665 = _645 * _653;
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _669 = 0.0;
    float _671 = _631;
    if (_641)
    {
        _669 = _503;
    }
    float _673 = _669;
    float _675 = _625 * 2.0;
    float _677 = 0.0;
    float _679 = _673;
    if (!_641)
    {
        _677 = _625;
    }
    float _681 = _677;
    bool _683 = _647 > 0.0;
    float _685 = _633 * 2.0;
    float _687 = 0.0;
    float _689 = _681;
    if (!_641)
    {
        _687 = _633;
    }
    float _691 = _687;
    float _693 = floor(_675);
    float _695 = _691;
    if (_641)
    {
        _689 = _633;
    }
    float _697 = _689;
    float _699 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_641)
    {
        _679 = _625;
    }
    float _701 = _679;
    if (_641)
    {
        _695 = _503;
    }
    float _703 = _695;
    float _705 = _667 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _707 = floor(_685);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _711 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _713 = isnan(_623);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    bool _723 = _693 >= 0.0;
    bool _725 = isnan(_693);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_699, -2.0, _709);
    bool _735 = _693 > 0.0;
    float _737 = _633 + _625;
    int _739 = _731 ? 0 : 1;
    float _741 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _733);
    bool _743 = _647 >= 0.0;
    bool _745 = isnan(_647);
    bool _747 = _743 || _745;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    float _753 = _737 + (-1.0);
    int _755 = ~_739;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    int _761 = _751 ? 0 : 1;
    float _763 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _765 = !_657;
    float _767 = _765 ? _217 : as_type<float>(_651);
    int _769 = ~_761;
    int _771 = _769 + 1;
    int _773 = _771 + 1;
    int _775 = _773;
    int _777 = _759;
    if (!_683)
    {
        int _779 = ~_761;
        int _781 = _779 + 1;
        _775 = _781;
    }
    int _783 = _775;
    float _785 = _149 * _631;
    if (!_735)
    {
        int _787 = ~_739;
        int _789 = _787 + 1;
        _777 = _789;
    }
    int _791 = _777;
    float _793 = _767 + 0.5;
    bool _795 = _633 > 0.5;
    if (!_641)
    {
        _671 = _625;
    }
    float _797 = _671;
    float _799 = exp2(_785);
    float _801 = -_227;
    int _803 = _795 ? as_type<int>(_801) : as_type<int>(_227);
    float _805 = -_217;
    int _807 = _795 ? as_type<int>(_805) : as_type<int>(_217);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _815 = _813 != 0;
    bool _817 = _707 > 0.0;
    bool _819 = !_663;
    float _821 = _819 ? _227 : as_type<float>(_803);
    bool _823 = _707 >= 0.0;
    bool _825 = isnan(_707);
    bool _827 = _823 || _825;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = _625 > 0.5;
    float _835 = _831 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _837 = -_799;
    float _839 = _837 + 1.0;
    float _841 = -_227;
    int _843 = _833 ? as_type<int>(_841) : as_type<int>(_227);
    int _845 = ~as_type<int>(_835);
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    float _853 = _835;
    float _855 = _797;
    if (!_817)
    {
        int _857 = ~as_type<int>(_835);
        int _859 = _857 + 1;
        _851 = _859;
    }
    int _861 = _851;
    bool _863 = !_811;
    float _865 = _863 ? _217 : as_type<float>(_807);
    bool _867 = !_815;
    float _869 = _867 ? _227 : as_type<float>(_843);
    if (_641)
    {
        _853 = _633;
    }
    float _871 = _853;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _871;
    if (_641)
    {
        _855 = _633;
    }
    float _887 = _855;
    if (!_641)
    {
        _885 = _503;
    }
    float _889 = _885;
    bool _891 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _899 = _895 || _897;
    bool _901 = !_875;
    int _903 = _901 ? 0 : 1;
    float _905 = _899 ? _839 : 0.0;
    float _907 = _451 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _911 = _909 != 0;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _915 = _913 != 0;
    float _917 = _451 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _919 = _643 > 0.5;
    float _921 = _451 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _923 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _931 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _921);
    float _933 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _917);
    float _935 = 1.0 / _927;
    float _937 = _637 * _929;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _943 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _933);
    float _945 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _923);
    float _947 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _931);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _949;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _955 = 1.0 / _941;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _961 = abs(_903);
    float _963 = -_953;
    float _965 = fma(_659, 2.0, _963);
    float _967 = _947 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _969 = float(_791);
    float _971 = -_149;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[76].x, _965);
    float _975 = _951 * _935;
    float _977 = _503 + _625;
    float _979 = _503 + _633;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _985 = _623 + _983;
    float _987 = _977 + (-1.0);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _991 = _623 + _989;
    float _993 = _979 + (-1.0);
    float _995 = _959 * _955;
    float _997 = fma(_975, _991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    out.m_70.w = _981;
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1005 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1007 = isnan(_623);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1019 = 1.0 + _1017;
    float _1021 = fma(_995, _985, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1023 = float(_961);
    float _1025 = _503 + (-0.5);
    bool _1027 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_623);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = -_1015;
    float _1041 = _1039 + 1.0;
    float _1043 = fma(_705, _793, _973);
    float _1045 = 1.0 / _1019;
    float _1047 = -_1037;
    float _1049 = _1047 + 1.0;
    float _1051 = _701 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1053 = float(_861);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1057 = _1015 * _1049;
    float _1059 = _721 * _1041;
    float _1061 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1063 = _821 + (-0.5);
    float _1065 = -_721;
    float _1067 = _1065 + 1.0;
    float _1069 = _997 * _1059;
    float _1071 = -_1055;
    float _1073 = fma(_1051, 2.0, _1071);
    float _1075 = in.m_72.x;
    float _1077 = in.m_72.y;
    float _1079 = in.m_72.z;
    float _1081 = -_1061;
    float _1083 = -_741;
    float _1085 = fma(_1081, _1063, _1083);
    float _1087 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1069);
    float _1089 = _905 * _1045;
    float _1091 = _1023 * _969;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1097 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1093);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1103 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1095);
    float _1105 = _703 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1109 = _1091 * (-2.0);
    float _1111 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1101);
    float _1113 = -_1099;
    float _1115 = fma(_1105, 2.0, _1113);
    float _1117 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1107);
    float _1119 = fma(_1001, _1109, _1001);
    bool _1121 = !_879;
    int _1123 = _1121 ? 0 : 1;
    uint _1126 = uint(int(uint(_595) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    float _1142 = fma(_1109, _1075, _1075);
    bool _1144 = !_883;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_1021, _1057, _1087);
    int _1150 = abs(_1123);
    float _1152 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1142);
    int _1154 = abs(_1146);
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1158 = _595 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    bool _1168 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1170 = isnan(1.0);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1148);
    float _1180 = float(_783);
    float _1182 = _697 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1184 = float(_1150);
    float _1186 = -_149;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1115);
    float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1192 = !_1176;
    float _1194 = _1192 ? _149 : _1089;
    float _1196 = _1184 * _1180;
    float _1198 = float(_1154);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1202 = fma(_1194, _1119, _1152);
    float _1204 = _1196 * (-2.0);
    float _1206 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1200);
    float _1208 = _633 + (-0.5);
    float _1210 = _1202 * 0.15915493667125701904296875;
    float _1212 = fma(_1204, _1077, _1077);
    float _1214 = _1198 * _1053;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1218 = fma(_763, _1204, _763);
    float _1220 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1212);
    float _1222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1224 = _1214 * (-2.0);
    float _1226 = fma(_1194, _1218, _1220);
    float _1228 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1216);
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1234 = fma(_1224, _1079, _1079);
    float _1236 = _625 + (-0.5);
    float _1238 = fma(_999, _1224, _999);
    float _1240 = _865 + 0.5;
    float _1242 = _1226 * 0.15915493667125701904296875;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1234);
    float _1246 = -_149;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1073);
    float _1250 = _1210 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1256 = fma(_1194, _1238, _1244);
    float _1258 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1260 = -_217;
    int _1262 = _833 ? as_type<int>(_1260) : as_type<int>(_217);
    float _1264 = fma(_1182, -2.0, _1232);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_1258, _1240, _1248);
    float _1270 = _1210 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1132 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1276 = -_227;
    int _1278 = _919 ? as_type<int>(_1276) : as_type<int>(_227);
    float _1280 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1282 = !_911;
    float _1284 = _1282 ? _217 : as_type<float>(_1262);
    float _1286 = _889 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1288 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = _1242 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1296 = !_915;
    float _1298 = _1296 ? _227 : as_type<float>(_1278);
    float _1300 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1284 + 0.5;
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1308 = _1298 + (-0.5);
    float _1310 = _1242 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1264);
    float _1316 = fma(_1280, _1302, _1188);
    float _1318 = fma(_1286, -2.0, _1306);
    float _1320 = -_1230;
    float _1322 = -_1314;
    float _1324 = fma(_1320, _1308, _1322);
    float _1326 = _1266 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = _1272 * _1292;
    float _1334 = _1252 * _1292;
    out.m_74.x = _1300;
    out.m_74.y = _1330;
    out.m_74.z = _1304;
    out.m_74.w = _1288;
    float _1336 = _1266 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = _1252 * _1312;
    float _1342 = _1272 * _1312;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1346 = _1252 * _1328;
    float _1348 = _1272 * _1328;
    float _1350 = _1312 * _1328;
    float _1352 = _1292 * _1328;
    float _1354 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1356 = _1348 * _937;
    float _1358 = _869 + (-0.5);
    float _1360 = -_1332;
    float _1362 = fma(_1338, _1340, _1360);
    float _1364 = -_1340;
    float _1366 = fma(_1338, _1332, _1364);
    float _1368 = fma(_1338, _1342, _1334);
    float _1370 = -_937;
    float _1372 = _1338 * _1370;
    float _1374 = fma(_1338, _1334, _1342);
    float _1376 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1318);
    float _1378 = fma(_1368, _665, _1356);
    float _1380 = _1346 * _937;
    float _1382 = fma(_1350, _665, _1372);
    float _1384 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1386 = fma(_1366, _1354, _1378);
    float _1388 = fma(_1362, _665, _1380);
    float _1390 = fma(_1352, _1354, _1382);
    float _1392 = -_1384;
    float _1394 = -_1376;
    float _1396 = fma(_1392, _1358, _1394);
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1400 = fma(_1374, _1354, _1388);
    float _1402 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1404 = _945 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1406 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1398);
    float _1408 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1410 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1402);
    float _1412 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1414 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1406);
    float _1416 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1418 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1410);
    float _1420 = -_1338;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1408);
    float _1424 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1426 = -_1338;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1412);
    float _1430 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1432 = -_1338;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1416);
    float _1436 = _967 + _1424;
    float _1438 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1422);
    float _1440 = _1404 + _1430;
    float _1442 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1428);
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1446 = _1436 + _1444;
    float _1448 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1434);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1452 = _1440 + _1450;
    float _1454 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1456 = _1446 * _1446;
    float _1458 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1460 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1462 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1454);
    float _1464 = fma(_1452, _1452, _1456);
    float _1466 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1458);
    float _1468 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1460);
    float _1470 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1472 = sqrt(_1464);
    float _1474 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1476 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1478 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1480 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1470);
    float _1482 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1474);
    float _1484 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1476);
    float _1486 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1478);
    float _1488 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1480);
    float _1490 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1482);
    float _1492 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1484);
    float _1494 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1486);
    float _1496 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1498 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1462);
    float _1500 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1502 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1468);
    bool _1504 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1508 = _943 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1510 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1512 = _1496 * _1442;
    float _1514 = _1496 * _1438;
    float _1516 = _1496 * _1448;
    float _1518 = _1508 + _1510;
    float _1520 = fma(_1506, _1498, _1512);
    float _1522 = fma(_1506, _1500, _1514);
    float _1524 = fma(_1506, _1502, _1516);
    float _1526 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1111);
    float _1528 = _1111;
    float _1530 = _1440;
    float _1532 = _1436;
    float _1534 = _1500;
    float _1536 = _967;
    if (!_1504)
    {
        _1528 = _1440;
    }
    float _1538 = _1528;
    float _1540 = _1538;
    if (!_1504)
    {
        _1530 = _1518;
    }
    float _1542 = _1530;
    bool _1544 = !_1504;
    float _1546 = _1542;
    if (!_1544)
    {
        float _1548 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1552 = _1472 + _1550;
        float _1554 = rsqrt(_1464);
        float _1556 = _1552 * _1548;
        float _1558 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1560 = _1556 * 0.15915493667125701904296875;
        float _1562 = _1560 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        float _1566 = _1560 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        float _1570 = _1564 + (-1.0);
        float _1572 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1574 = fma(_1568, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1576 = fma(_1518, _1564, _1572);
        float _1578 = _1554 * _1574;
        float _1580 = fma(_1452, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1582 = fma(_1446, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1546 = _1576;
        _1540 = _1580;
        _1532 = _1582;
    }
    float _1584 = _1546;
    float _1586 = _1540;
    float _1588 = _1532;
    float _1590 = fma(_1496, _1496, 1.0);
    float _1592 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1228);
    float _1594 = -_1526;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1097);
    float _1600 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1206);
    float _1602 = -_1592;
    float _1604 = _1602 + 1.0;
    float _1606 = rsqrt(_1590);
    float _1608 = -_1596;
    float _1610 = fma(_865, _1608, _1268);
    float _1612 = -_1508;
    float _1614 = _1612 + _1584;
    float _1616 = -_1598;
    float _1618 = _1616 + 1.0;
    float _1620 = fma(_869, _1604, _1396);
    float _1622 = -_1404;
    float _1624 = _1622 + _1586;
    float _1626 = _1614 * _1614;
    float _1628 = -_1618;
    float _1630 = fma(_767, _1628, _1043);
    float _1632 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1103);
    float _1634 = -_967;
    float _1636 = _1634 + _1588;
    float _1638 = fma(_1624, _1624, _1626);
    float _1640 = -_1600;
    float _1642 = _1640 + 1.0;
    float _1644 = -_1632;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1117);
    float _1650 = fma(_1636, _1636, _1638);
    float _1652 = fma(_821, _1642, _1085);
    float _1654 = _1496 * _1606;
    float _1656 = -_1646;
    float _1658 = fma(_1284, _1656, _1316);
    float _1660 = -_1648;
    float _1662 = _1660 + 1.0;
    float _1664 = sqrt(_1650);
    float _1666 = -_1490;
    float _1668 = _1654 * _1666;
    float _1670 = -_1488;
    float _1672 = _1654 * _1670;
    float _1674 = -_1494;
    float _1676 = _1654 * _1674;
    float _1678 = fma(_1298, _1662, _1324);
    float _1680 = fma(_1606, _1442, _1668);
    float _1682 = fma(_1606, _1438, _1672);
    float _1684 = fma(_1606, _1448, _1676);
    float _1686 = _1490 + _1520;
    float _1688 = _1488 + _1522;
    float _1690 = _1494 + _1524;
    out.m_76.x = _1630;
    out.m_76.y = _1652;
    out.m_76.z = _1658;
    out.m_76.w = _1678;
    out.m_78.x = _1610;
    out.m_78.y = _1620;
    bool _1692 = _1664 > 0.0;
    out.m_80.x = _1498;
    out.m_80.y = _1500;
    out.m_80.z = _1502;
    out.m_82.x = _1680;
    out.m_82.y = _1682;
    out.m_82.z = _1684;
    out.m_84.x = _1686;
    out.m_84.y = _1688;
    out.m_84.z = _1690;
    bool _1694 = !_1692;
    float _1696 = _1678;
    float _1698 = _1652;
    float _1700 = _1588;
    float _1702 = _1584;
    float _1704 = _1586;
    int _1706 = as_type<int>(_1614);
    if (!_1694)
    {
        bool _1708 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1710 = _1498;
        if (_1708)
        {
            float _1712 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1710 = _1712;
        }
        float _1714 = _1710;
        float _1716 = _1714;
        if (_1708)
        {
            float _1718 = _461 * _1714;
            _1696 = _1718;
        }
        float _1720 = _1696;
        float _1722 = _1720;
        if (_1708)
        {
            float _1724 = _463 * _1714;
            _1698 = _1724;
        }
        float _1726 = _1698;
        float _1728 = _1726;
        if (_1708)
        {
            float _1730 = _465 * _1714;
            _1534 = _1730;
        }
        float _1732 = _1534;
        float _1734 = _1732;
        if (!_1708)
        {
            float _1736 = _149 + 1.0;
            float _1738 = _1736;
            if (!_183)
            {
                float _1740 = _1736 * _1736;
                float _1742 = _1740 * 0.5;
                _1716 = _1742;
            }
            float _1744 = _1716;
            float _1746 = _1744;
            if (!_183)
            {
                float _1748 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1746 = _1748;
            }
            float _1750 = _1746;
            bool _1752 = !_183;
            float _1754 = _1750;
            if (!_1752)
            {
                float _1756 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1758 = log2(_1756);
                float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1762 = 1.0 + _1760;
                float _1764 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1766 = _1758 * _1736;
                float _1768 = 1.0 / _1762;
                float _1770 = _1764 * 0.693147182464599609375;
                float _1772 = exp2(_1766);
                float _1774 = 1.0 / _1770;
                float _1776 = _1772 + (-1.0);
                float _1778 = -_1776;
                float _1780 = fma(_1778, _1774, _1736);
                float _1782 = _1780 * _1768;
                float _1784 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1754 = _1784;
            }
            float _1786 = _1754;
            float _1788 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1790 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1792 = _1786 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1794 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1796 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1798 = _1788 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1800 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1794);
            float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1796);
            float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1800);
            bool _1806 = !_183;
            if (!_1806)
            {
                float _1808 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1810 = log2(_1808);
                float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1814 = 1.0 + _1812;
                float _1816 = 1.0 / _1814;
                float _1818 = _1810 * _1736;
                float _1820 = exp2(_1818);
                float _1822 = -_1820;
                float _1824 = _1822 + 1.0;
                float _1826 = _1824 * _1816;
                _1738 = _1826;
            }
            float _1828 = _1738;
            float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1798);
            float _1832 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
            float _1834 = fma(_1828, _187, _1804);
            float _1836 = fma(_1792, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1830);
            float _1838 = fma(_1828, _185, _1832);
            float _1840 = -_423;
            float _1842 = _1840 + _1834;
            float _1844 = fma(_1828, _189, _1836);
            float _1846 = -_427;
            float _1848 = _1846 + _1838;
            float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1852 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1854 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1856 = -_429;
            float _1858 = _1856 + _1844;
            float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1850);
            float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1852);
            float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1854);
            float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1860);
            float _1868 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1862);
            float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1864);
            _469 = _1868;
            _471 = _1866;
            _473 = _1870;
            _1722 = _1866;
            _1728 = _1868;
            _1734 = _1870;
        }
        float _1872 = _469;
        float _1874 = _471;
        float _1876 = _473;
        float _1878 = _1722;
        float _1880 = _1728;
        float _1882 = _1734;
        float _1884 = _1872 * _1872;
        float _1886 = fma(_1874, _1874, _1884);
        float _1888 = rsqrt(_1650);
        float _1890 = fma(_1876, _1876, _1886);
        float _1892 = sqrt(_1890);
        float _1894 = _1624 * _1888;
        float _1896 = _1614 * _1888;
        float _1898 = _1636 * _1888;
        bool _1900 = _1892 > 0.0;
        bool _1902 = !_1900;
        if (!_1902)
        {
            float _1904 = rsqrt(_1890);
            float _1906 = _1904 * _1872;
            float _1908 = _1904 * _1874;
            float _1910 = _1904 * _1876;
            float _1912 = _1896 * _1906;
            float _1914 = fma(_1894, _1908, _1912);
            float _1916 = fma(_1898, _1910, _1914);
            float _1918 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1920 = fma(_1878, _1918, _1586);
            float _1922 = fma(_1880, _1918, _1584);
            float _1924 = fma(_1882, _1918, _1588);
            _1700 = _1924;
            _1702 = _1922;
            _1704 = _1920;
        }
    }
    float _1926 = _1700;
    float _1928 = _1702;
    float _1930 = _1704;
    float _1932 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1934 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1936 = floor(_1932);
    float _1938 = floor(_1934);
    float _1940 = -_1936;
    float _1942 = _1932 + _1940;
    float _1944 = -_1938;
    float _1946 = _1934 + _1944;
    float2 _6360 = float2(_1942, _1946);
    float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6360, float2(0.0), isnan(_6360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6360, float2(0.0), isnan(_6360)), level(0.0)).x;
    float _1950 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1952 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _1954 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1956 = isnan(0.5);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1962 = _1958 || _1960;
    float _1964 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1950);
    float _1966 = _1508 + _1952;
    float _1968 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1964);
    float _1970 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1974 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1976 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1970);
    float _1978 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1972);
    float _1980 = 1.0 / _1974;
    float _1982 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1976);
    float _1984 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1978);
    float _1986 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1988 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1990 = _1984;
    int _1992 = 2;
    if (_1962)
    {
        _1990 = _1926;
    }
    float _1994 = _1990;
    float _1996 = _1986 + _1974;
    float _1998 = _1996 * _1980;
    float _2000 = _1998 * 0.5;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2004 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2002);
    float _2006 = 1.0 / _2004;
    float _2008 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2010 = _2006 * _2008;
    float _2012 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2014 = _2010 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2016 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2012);
    bool _2018 = _2010 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2020 = !_2014;
    int _2022 = _2020 ? 0 : 1;
    float _2024 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2016);
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2028 = _1994;
    if (!_2014)
    {
        _1992 = 1;
    }
    int _2030 = _1992;
    float _2032 = trunc(_2026);
    int _2034 = int(_2032);
    int _2036 = _2030;
    if (!_2018)
    {
        _2036 = _2022;
    }
    int _2038 = _2036;
    int _2040 = _2038 << 6;
    float _2042 = trunc(_1988);
    int _2044 = int(_2042);
    int _2046 = _2040 + 48;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
    int _2052 = int(_2048) & 3;
    float _2054 = (*spvDescriptorSet0.vp_c15)._m0[int(_2050)][_2052];
    int _2056 = int(_2048) + 1;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    int _2060 = _2056 & 3;
    float _2062 = (*spvDescriptorSet0.vp_c15)._m0[int(_2058)][_2060];
    int _2064 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2066 = _2034 + _2064;
    int _2068 = _2066 + 1;
    int _2070 = _2040 + 56;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c15)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
    int _2088 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2090 = _2044 + _2088;
    int _2092 = _2090 + 1;
    int _2094 = _2040 + 64;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c15)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c15)._m0[int(_2106)][_2108];
    float _2112 = as_type<float>(_2044);
    float _2114 = as_type<float>(_2038);
    if (_1962)
    {
        _2112 = _1928;
    }
    float _2116 = _2112;
    bool _2118 = _2092 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2120 = _2092 | _2068;
    int _2122 = _2040 + 72;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    bool _2140 = _2120 < 0;
    bool _2142 = _2140 || _2118;
    float _2144 = as_type<float>(_2120);
    float _2146 = _2116;
    if (_1962)
    {
        _2144 = _1930;
    }
    float _2148 = _2144;
    bool _2150 = _2068 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2152 = _2150 || _2142;
    int _2154 = _2040 + 96;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c15)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c15)._m0[int(_2166)][_2168];
    int _2172 = _2040 + 104;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    uint _2176 = uint(int(uint(int(_2174)) >> uint(2)));
    int _2178 = int(_2174) & 3;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[int(_2176)][_2178];
    int _2182 = int(_2174) + 1;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    int _2186 = _2182 & 3;
    float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
    float _2190 = _2148;
    if (!_1962)
    {
        float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2194 = _1508 + _2192;
        float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2198 = _1404 + _2196;
        float _2200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2202 = -_1508;
        float _2204 = _2202 + _1928;
        float _2206 = _2194 * _2194;
        float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2210 = _967 + _2208;
        float _2212 = -_967;
        float _2214 = _2212 + _1926;
        float _2216 = fma(_2198, _2198, _2206);
        float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2220 = fma(_2210, _2210, _2216);
        float _2222 = sqrt(_2220);
        float _2224 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2226 = precise::min(_2222, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2228 = _2226 * _2218;
        float _2230 = _2224 * _2228;
        float _2232 = -_1404;
        float _2234 = _2232 + _1930;
        float _2236 = fma(_2204, _2230, _1508);
        float _2238 = fma(_2234, _2230, _1404);
        float _2240 = fma(_2214, _2230, _967);
        _2146 = _2236;
        _2190 = _2238;
        _2028 = _2240;
        _1706 = as_type<int>(_2230);
    }
    float _2242 = _2146;
    float _2244 = _2190;
    float _2246 = _2028;
    int _2248 = _1706;
    float _2250 = _1966 * _2170;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2254 = _2248;
    if (!_2152)
    {
        int _2256 = _2068 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2258 = _2256 + _2092;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = _1966 * _2110;
    float _2264 = fma(_1404, _2162, _2250);
    float _2266 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2252);
    float _2268 = _1966 * _2062;
    float _2270 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2272 = fma(_967, _2180, _2264);
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2266);
    int _2276 = as_type<int>(_2264);
    int _2278 = as_type<int>(_2274);
    if (!_2152)
    {
        int _2280 = _2260 << 2;
        _2276 = _2280;
    }
    int _2282 = _2276;
    float _2284 = fma(_1404, _2054, _2268);
    float _2286 = _2272 + _2188;
    float _2288 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2290 = _2282;
    if (!_2152)
    {
        uint _2292 = uint(int(uint(_2260) >> uint(2)));
        _2278 = int(_2292);
    }
    int _2294 = _2278;
    float _2296 = fma(_1404, _2102, _2262);
    if (!_2152)
    {
        int _2298 = 12 & _2282;
        _2290 = _2298;
    }
    int _2300 = _2290;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2304 = _2040 + 80;
    uint _2306 = uint(int(uint(_2304) >> uint(2)));
    uint _2308 = uint(int(uint(int(_2306)) >> uint(2)));
    int _2310 = int(_2306) & 3;
    float _2312 = (*spvDescriptorSet0.vp_c15)._m0[int(_2308)][_2310];
    int _2314 = int(_2306) + 1;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    int _2318 = _2314 & 3;
    float _2320 = (*spvDescriptorSet0.vp_c15)._m0[int(_2316)][_2318];
    float _2322 = 1.0 / _2286;
    float _2324 = fma(_967, _2078, _2284);
    float _2326 = -_2302;
    float _2328 = fma(_2326, _2270, 1.0);
    float _2330 = _2302;
    if (!_2152)
    {
        int _2332 = _2294 << 4;
        int _2334 = _2332 + _2300;
        _2330 = as_type<float>(_2334);
    }
    float _2336 = _2330;
    float _2338 = fma(_967, _2130, _2296);
    float _2340 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2342 = _2324 + _2086;
    int _2344 = _2040 + 88;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    uint _2348 = uint(int(uint(int(_2346)) >> uint(2)));
    int _2350 = int(_2346) & 3;
    float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
    int _2354 = int(_2346) + 1;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    int _2358 = _2354 & 3;
    float _2360 = (*spvDescriptorSet0.vp_c15)._m0[int(_2356)][_2358];
    float _2362 = _2338 + _2138;
    float _2364 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2340);
    float _2366 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2368 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2370 = _1524;
    if (!_2152)
    {
        float _2372 = floor(_2026);
        _2370 = _2372;
    }
    float _2374 = _2370;
    float _2376 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2378 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2366);
    float _2380 = _2336;
    if (!_2152)
    {
        int _2382 = as_type<int>(_2336) + 400;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
        int _2388 = int(_2384) & 3;
        float _2390 = (*spvDescriptorSet0.vp_c15)._m0[int(_2386)][_2388];
        _2380 = _2390;
    }
    float _2392 = _2380;
    float _2394 = _2342 * _2322;
    float _2396 = _2362 * _2322;
    float _2398 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2378);
    float _2400 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2402 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2368);
    bool _2404 = _2394 >= 0.0;
    float _2406 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2408 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2410 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2402);
    bool _2412 = _2394 <= 1.0;
    bool _2414 = _2412 && _2404;
    float _2416 = log2(_2328);
    float _2418 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2408);
    float _2420 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2422 = _2396 >= 0.0;
    bool _2424 = _2422 && _2414;
    float _2426 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2428 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2418);
    float _2430 = _2374;
    float _2432 = _2426;
    if (!_2152)
    {
        float _2434 = -_2374;
        float _2436 = _2026 + _2434;
        _2430 = _2436;
    }
    float _2438 = _2430;
    bool _2440 = _2396 <= 1.0;
    bool _2442 = _2440 && _2424;
    float _2444 = _2402;
    if (!_2152)
    {
        float _2446 = floor(_1988);
        _2444 = _2446;
    }
    float _2448 = _2444;
    float _2450 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2428);
    float _2452 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2454 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2426);
    float _2456 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2452);
    float _2458 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2454);
    float _2460 = 1.0 / _2450;
    float _2462 = _2416 * 0.693147182464599609375;
    float _2464 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2456);
    float _2466 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2458);
    if (_2442)
    {
        float _2468 = float(_2038);
        _2432 = _2468;
    }
    float _2470 = _2432;
    float _2472 = _1966 * _2320;
    float _2474 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2464);
    float _2476 = _2448;
    if (!_2152)
    {
        float _2478 = -_2448;
        float _2480 = _1988 + _2478;
        _2476 = _2480;
    }
    float _2482 = _2476;
    float _2484 = fma(_1404, _2312, _2472);
    float _2486 = _2470;
    if (_2442)
    {
        float _2488 = rint(_2470);
        float _2490 = precise::max(_2488, 0.0);
        uint _2492 = uint(_2490);
        uint _2494 = clamp(_2492, 0u, 65535u);
        _2486 = as_type<float>(_2494);
    }
    float _2496 = _2486;
    float _2498 = fma(_967, _2352, _2484);
    float _2500 = _2474 * _2460;
    float _2502 = _2498 + _2360;
    float _2504 = _2466 * _2460;
    float _2506 = _2392;
    if (!_2152)
    {
        float _2508 = rint(_2392);
        float _2510 = precise::max(_2508, 0.0);
        uint _2512 = uint(_2510);
        uint _2514 = clamp(_2512, 0u, 65535u);
        _2506 = as_type<float>(_2514);
    }
    float _2516 = _2506;
    float _2518 = _2502 * _2322;
    float _2520 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2522 = fma(_2504, 0.5, 0.5);
    float _2524 = fma(_2500, -0.5, 0.5);
    float _2526 = _2396;
    if (_2442)
    {
        float3 _7351 = float3(_2394, _2396, float(as_type<int>(_2496)));
        float3 _7355 = select(_7351, float3(0.0), isnan(_7351));
        float _2528 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7355.xy, uint(rint(_7355.z)), _2518, level(0.0));
        _2526 = _2528;
    }
    float _2530 = _2526;
    float3 _7365 = float3(_2522, _2524, _2520);
    float _2532 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7365, float3(0.0), isnan(_7365)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7365, float3(0.0), isnan(_7365)), level(0.0)).x;
    float3 _7374 = float3(_2522, _2524, _2520);
    float4 _2535 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7374, float3(0.0), isnan(_7374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7374, float3(0.0), isnan(_7374)), level(0.0)).xyzw;
    float _2537 = _2535.x;
    float _2539 = _2535.y;
    float _2541 = _2535.z;
    float _2543 = _2535.w;
    float _2545 = _2482;
    if (!_2152)
    {
        float3 _7397 = float3(_2482, _2438, float(as_type<int>(_2516)));
        float3 _7399 = select(_7397, float3(0.0), isnan(_7397));
        float _2547 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7399.xy, uint(rint(_7399.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7399.xy, uint(rint(_7399.z)), level(0.0)).x;
        _2545 = _2547;
    }
    float _2549 = _2545;
    if (_2152)
    {
        _2114 = 1.0;
    }
    float _2551 = _2114;
    float _2553 = _2551;
    if (!_2152)
    {
        int _2555 = _2260 << 4;
        int _2557 = _2555 + 2048;
        uint _2559 = uint(int(uint(_2557) >> uint(2)));
        uint _2561 = uint(int(uint(int(_2559)) >> uint(2)));
        int _2563 = int(_2559) & 3;
        float _2565 = (*spvDescriptorSet0.vp_c15)._m0[int(_2561)][_2563];
        int _2567 = int(_2559) + 1;
        uint _2569 = uint(int(uint(_2567) >> uint(2)));
        int _2571 = _2567 & 3;
        float _2573 = (*spvDescriptorSet0.vp_c15)._m0[int(_2569)][_2571];
        int _2575 = _2557 + 8;
        uint _2577 = uint(int(uint(_2575) >> uint(2)));
        uint _2579 = uint(int(uint(int(_2577)) >> uint(2)));
        int _2581 = int(_2577) & 3;
        float _2583 = (*spvDescriptorSet0.vp_c15)._m0[int(_2579)][_2581];
        int _2585 = int(_2577) + 1;
        uint _2587 = uint(int(uint(_2585) >> uint(2)));
        int _2589 = _2585 & 3;
        float _2591 = (*spvDescriptorSet0.vp_c15)._m0[int(_2587)][_2589];
        float _2593 = _1966 * _2573;
        float _2595 = fma(_1404, _2565, _2593);
        float _2597 = fma(_967, _2583, _2595);
        float _2599 = _2597 + _2591;
        float _2601 = precise::clamp(_2599, 0.0, 1.0);
        float _2603 = -_2601;
        float _2605 = _2603 + _2549;
        float _2607 = fma(_2605, 500.0, 1.5);
        float _2609 = exp2(_2607);
        float _2611 = 0.0 + _2609;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        _2553 = _2613;
    }
    float _2615 = _2553;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2619 = _2242 + _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2623 = _2244 + _2621;
    float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2627 = _2246 + _2625;
    float _2629 = _2619 * _2619;
    float _2631 = fma(_2623, _2623, _2629);
    float _2633 = fma(_2627, _2627, _2631);
    float _2635 = rsqrt(_2633);
    float _2637 = _2635 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2639 = _2623 * _2637;
    float _2641 = _2627 * _2637;
    float _2643 = _2639 * _2639;
    float _2645 = _2641 * _2641;
    float _2647 = _2643 + _2645;
    float _2649 = sqrt(_2647);
    bool _2651 = _2649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2655 = _2649 + _2653;
    float _2657 = _2627;
    float _2659 = _2635;
    float _2661 = _2655;
    float _2663 = _2637;
    if (_2651)
    {
        float _2665 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2657 = _2665;
    }
    float _2667 = _2657;
    if (_2651)
    {
        float _2669 = rsqrt(_2647);
        _2659 = _2669;
    }
    float _2671 = _2659;
    float _2673 = _2671;
    if (_2651)
    {
        float _2675 = _2655 * _2667;
        _2661 = _2675;
    }
    float _2677 = _2661;
    if (_2651)
    {
        float _2679 = _2677 * 0.15915493667125701904296875;
        _1536 = _2679;
    }
    float _2681 = _1536;
    float _2683 = _2667;
    float _2685 = _2681;
    if (_2651)
    {
        float _2687 = _2681 * 6.283185482025146484375;
        float _2689 = sin(_2687);
        _2683 = _2689;
    }
    float _2691 = _2683;
    float _2693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2695 = precise::max(0.0, _2693);
    float _2697 = _2629;
    float _2699 = _2695;
    if (_2651)
    {
        float _2701 = _2681 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        _2697 = _2703;
    }
    float _2705 = _2697;
    float _2707 = -_2637;
    float _2709 = -_2695;
    float _2711 = fma(_2619, _2707, _2709);
    float _2713 = _2711;
    if (_2651)
    {
        float _2715 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2699 = _2715;
    }
    float _2717 = _2699;
    float _2719 = _2717;
    if (!_2651)
    {
        _2685 = _2643;
    }
    float _2721 = _2685;
    float _2723 = _2691;
    float _2725 = _2721;
    if (_2651)
    {
        float _2727 = fma(_2691, _2717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2723 = _2727;
    }
    float _2729 = _2723;
    float _2731 = _2729;
    float _2733 = _2705;
    if (_2651)
    {
        float _2735 = _2705 + (-1.0);
        _2719 = _2735;
    }
    float _2737 = _2719;
    float _2739 = _2737;
    if (_2651)
    {
        float _2741 = _2671 * _2729;
        _2663 = _2741;
    }
    float _2743 = _2663;
    if (!_2651)
    {
        _2673 = _2639;
    }
    float _2745 = _2673;
    float _2747 = _2745;
    if (_2651)
    {
        float _2749 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2739 = _2749;
    }
    float _2751 = _2739;
    if (_2651)
    {
        float _2753 = _2639 * _2743;
        _2747 = _2753;
    }
    float _2755 = _2747;
    if (!_2651)
    {
        _2731 = _2641;
    }
    float _2757 = _2731;
    float _2759 = _2757;
    if (_2651)
    {
        float _2761 = _2641 * _2743;
        _2759 = _2761;
    }
    float _2763 = _2759;
    if (_2651)
    {
        float _2765 = fma(_2711, _2705, _2751);
        _2713 = _2765;
    }
    float _2767 = _2713;
    if (_2651)
    {
        float _2769 = _2755 * _2755;
        _2725 = _2769;
    }
    float _2771 = _2725;
    if (!_2651)
    {
        _2733 = _2645;
    }
    float _2773 = _2733;
    float _2775 = _2773;
    if (_2651)
    {
        float _2777 = _2763 * _2763;
        _2775 = _2777;
    }
    float _2779 = _2775;
    float _2781 = sqrt(_2633);
    float _2783 = fma(_2767, _2767, _2771);
    float _2785 = _2783 + _2779;
    float _2787 = rsqrt(_2785);
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2791 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2789);
    float _2793 = precise::clamp(_2791, 0.0, 1.0);
    float _2795 = -_2793;
    float _2797 = _2795 + 1.0;
    float _2799 = _2787 * _2755;
    float _2801 = _2787 * _2767;
    float _2803 = _2787 * _2763;
    float _2805 = abs(_2797);
    float _2807 = log2(_2805);
    float _2809 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2811 = -_2809;
    float _2813 = fma(_2801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2811);
    float _2815 = -_2803;
    float _2817 = fma(_2815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2813);
    float _2819 = fma(_2817, -0.5, 0.5);
    float _2821 = fma(_2817, 0.5, 0.5);
    float _2823 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2825 = fma(_2821, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2827 = sqrt(_2819);
    float _2829 = fma(_2821, _2825, -0.212114393711090087890625);
    float _2831 = _2801 + 1.0;
    float _2833 = fma(_2821, _2829, 1.570728778839111328125);
    float _2835 = exp2(_2823);
    float _2837 = _2827 * 0.636619746685028076171875;
    float _2839 = -_2833;
    float _2841 = fma(_2837, _2839, 1.0);
    float _2843 = -_2801;
    float _2845 = fma(_2835, _2831, _2843);
    float _2847 = fma(_2845, 0.5, 0.5);
    float2 _7864 = float2(_2841, _2847);
    float3 _2851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7864, float2(0.0), isnan(_7864)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7864, float2(0.0), isnan(_7864)), level(0.0)).xyz;
    float _2853 = _2851.x;
    float _2855 = _2851.y;
    float _2857 = _2851.z;
    float _2859 = abs(_2010);
    float _2861 = log2(_2859);
    float _2863 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2865 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2867 = -_1948;
    float _2869 = _2867 + 1.0;
    float _2871 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2863);
    out.m_86.x = _2244;
    out.m_86.y = _2242;
    out.m_86.z = _2246;
    bool _2873 = _2010 <= 8000.0;
    bool _2875 = isnan(_2010);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(8000.0);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2871);
    float _2887 = exp2(_2865);
    float _2889 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2885);
    float _2891 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2893 = _2889 + _2450;
    float _2895 = exp2(_2891);
    float _2897 = _2893 * 0.5;
    float _2899 = _2893;
    if (!_2442)
    {
        _2899 = 1.0;
    }
    float _2901 = _2899;
    float _2903 = _2901;
    if (_2442)
    {
        bool _2905 = _2530 >= _2518;
        bool _2907 = isnan(_2530);
        bool _2909 = _2905 || _2907;
        bool _2911 = isnan(_2518);
        bool _2913 = _2909 || _2911;
        float _2915 = float(_2913);
        _2903 = _2915;
    }
    float _2917 = _2903;
    float _2919 = -_2887;
    float _2921 = _2919 + 1.0;
    bool _2923 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2925 = isnan(_2781);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2931 = _2927 || _2929;
    float _2933 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2935 = _2917 * _2615;
    float _2937 = _2933 * _2532;
    float _2939 = -_2933;
    float _2941 = _2939 + 1.0;
    float _2943 = fma(_2895, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2945 = precise::clamp(_2943, 0.0, 1.0);
    float _2947 = _2543 * _2937;
    float _2949 = fma(_2945, -2.0, 3.0);
    float _2951 = _2945 * _2945;
    float _2953 = _2951 * _2949;
    float _2955 = -_2953;
    float _2957 = _2955 + 1.0;
    out.m_88.z = _2897;
    out.m_88.w = _2450;
    float _2959 = fma(_2957, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2953);
    float _2961 = _2543 * _2941;
    float _2963 = _2941;
    float _2965 = _2466;
    float _2967 = _2947;
    if (!_2931)
    {
        _2963 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2969 = _2963;
    float _2971 = _2883 * _2959;
    out.gl_Position.x = _2466;
    out.gl_Position.y = _2474;
    out.gl_Position.z = _2889;
    out.gl_Position.w = _2450;
    float _2973 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2975 = _2869 * _2973;
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = _2973;
    float _2981 = _2977;
    float _2983 = _2969;
    float _2985 = _2969;
    if (!_2931)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2987 = _2979;
    float _2989 = -_2977;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2993 = _2987;
    float _2995 = _2987;
    if (!_2931)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2997 = _2981;
    float _2999 = -_2935;
    float _3001 = fma(_2999, _2991, 1.0);
    float _3003 = precise::clamp(_3001, 0.0, 1.0);
    float _3005 = _3003;
    float _3007 = _2997;
    float _3009 = _2997;
    if (!_2931)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3011 = _2965;
    float _3013 = _3003 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3015 = _3011;
    float _3017 = _3011;
    if (!_2931)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3019 = _3005;
    out.m_90.x = _3013;
    float _3021 = _2857 * _2937;
    float _3023 = fma(_2853, _2947, _2537);
    float _3025 = fma(_2855, _2947, _2539);
    float _3027 = _3019;
    float _3029 = _3019;
    if (!_2931)
    {
        _2967 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3031 = _2967;
    float _3033 = fma(_2543, _3021, _2541);
    out.m_92.x = _3023;
    out.m_92.y = _3025;
    out.m_92.z = _3033;
    out.m_92.w = _2961;
    bool _3035 = !_2931;
    float _3037 = _3031;
    float _3039 = _3031;
    if (!_3035)
    {
        bool _3041 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3043 = isnan(_2781);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3049 = _3045 || _3047;
        if (!_3049)
        {
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3053 = _2781 + _3051;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3055;
            float _3059 = 1.0 / _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3081 = _3053 * _3059;
            float _3083 = precise::clamp(_3081, 0.0, 1.0);
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3089 = fma(_3083, _3063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3091 = fma(_3083, _3087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3093 = fma(_3083, _3067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3095 = fma(_3083, _3071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3097 = fma(_3083, _3075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3099 = fma(_3083, _3079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2995 = _3091;
            _2985 = _3097;
            _3017 = _3089;
            _3039 = _3095;
            _3009 = _3093;
            _3029 = _3099;
            _3101 = true;
        }
        else
        {
            bool _3103 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3105 = isnan(_2781);
            bool _3107 = _3103 || _3105;
            bool _3109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3111 = _3107 || _3109;
            if (!_3111)
            {
                _3015 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3113 = _3015;
            _3017 = _3113;
            if (!_3111)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3115 = _2993;
            _2995 = _3115;
            if (!_3111)
            {
                _3007 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3117 = _3007;
            _3009 = _3117;
            if (!_3111)
            {
                _3037 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3119 = _3037;
            _3039 = _3119;
            if (!_3111)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3121 = _2983;
            _2985 = _3121;
            if (!_3111)
            {
                _3027 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3123 = _3027;
            bool _3125 = !_3111;
            _3029 = _3123;
            if (!_3125)
            {
                bool _3127 = _2781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3129 = isnan(_2781);
                bool _3131 = _3127 || _3129;
                bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3135 = _3131 || _3133;
                if (!_3135)
                {
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3139 = _2781 + _3137;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3141;
                    float _3145 = 1.0 / _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3167 = _3139 * _3145;
                    float _3169 = precise::clamp(_3167, 0.0, 1.0);
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2995 = _3177;
                    _2985 = _3183;
                    _3017 = _3175;
                    _3039 = _3181;
                    _3009 = _3179;
                    _3029 = _3185;
                    _3101 = true;
                }
                else
                {
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3017 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3039 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3009 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3029 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3101 = false;
    float _3187 = _2995;
    float _3189 = _2985;
    float _3191 = _3017;
    float _3193 = _3039;
    float _3195 = _3009;
    float _3197 = _3029;
    float _3199 = fma(_1688, -0.5, 0.5);
    float _3201 = precise::clamp(_3199, 0.0, 1.0);
    float _3203 = -_3187;
    float _3205 = _3203 + _3189;
    float _3207 = -_3191;
    float _3209 = _3207 + _3193;
    float _3211 = -_3195;
    float _3213 = _3211 + _3197;
    bool _3215 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3217 = fma(_3201, _3205, _3187);
    float _3219 = fma(_3201, _3209, _3191);
    float _3221 = fma(_3201, _3213, _3195);
    float _3223 = _3217 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _3225 = fma(_3219, 0.298911988735198974609375, _3223);
    float _3227 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3229 = fma(_3221, 0.114477999508380889892578125, _3225);
    out.m_59.x = _3227;
    float _3231 = -_3229;
    float _3233 = _3219 + _3231;
    float _3235 = -_3229;
    float _3237 = _3217 + _3235;
    float _3239 = -_3229;
    float _3241 = _3221 + _3239;
    float _3243 = fma(_3233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3245 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3247 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    out.m_96.x = _3243;
    out.m_96.y = _3245;
    out.m_96.z = _3247;
    if (!_3215)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3249 = -_2242;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3253 = -_2244;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3257 = -_2246;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3261 = _3251 * _3251;
    float _3263 = fma(_3255, _3255, _3261);
    float _3265 = fma(_3259, _3259, _3263);
    float _3267 = sqrt(_3265);
    float _3269 = rsqrt(_3265);
    float _3271 = -_3267;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3255 * _3269;
    float _3281 = _3251 * _3269;
    float _3283 = abs(_3277);
    float _3285 = log2(_3283);
    float _3287 = _3259 * _3269;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3291 = _1688 * _3281;
    float _3293 = -_3281;
    float _3295 = -_3289;
    float _3297 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3295);
    float _3299 = fma(_1686, _3279, _3291);
    float _3301 = -_3287;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3297);
    float _3305 = fma(_1690, _3287, _3299);
    float _3307 = precise::clamp(_3305, 0.0, 1.0);
    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3311 = _3303 + _3309;
    float _3313 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = exp2(_3313);
    float _3321 = _3319 * _3317;
    float _3323 = _3307 * _3321;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3327 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3329 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3325;
    out.m_94.y = _3327;
    out.m_94.z = _3329;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

