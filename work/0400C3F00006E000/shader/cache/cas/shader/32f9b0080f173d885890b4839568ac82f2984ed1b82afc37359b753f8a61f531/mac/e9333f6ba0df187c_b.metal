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
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_72 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_82 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2641 = false;
    bool _313 = false;
    bool _211 = false;
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
        float _2946 = as_type<float>(_131);
        out.gl_Position.z = _2946;
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
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3015 = as_type<float>(_169);
        out.gl_Position.z = _3015;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_66.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_66.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_56.x;
    float _325 = in.m_56.y;
    float _327 = in.m_56.z;
    float _329 = in.m_68.x;
    float _331 = in.m_68.y;
    float _333 = in.m_68.z;
    float _335 = in.m_68.w;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_66.x;
    float _343 = in.m_66.y;
    float _345 = in.m_66.z;
    float _347 = in.m_66.w;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _355 = _353 != 0;
    float _357 = in.m_70.x;
    float _359 = in.m_70.y;
    float _361 = in.m_70.z;
    float _363 = in.m_70.w;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _371 = _369 != 0;
    float _373 = in.m_72.x;
    float _375 = in.m_72.y;
    float _377 = in.m_72.z;
    float _379 = in.m_72.w;
    float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _383 = _325 * _331;
    bool _385 = _347 > 0.5;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _391 = fma(_323, _329, _383);
    float _393 = _325 * _359;
    float _395 = 1.0 / _389;
    float _397 = fma(_327, _333, _391);
    float _399 = fma(_323, _357, _393);
    float _401 = _325 * _375;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _405 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _407 = fma(_323, _373, _401);
    bool _409 = _341 > 0.5;
    float _411 = fma(_405, -2.0, _403);
    float _413 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _419 = fma(_327, _361, _399);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _421;
    float _425 = -_185;
    int _427 = _409 ? as_type<int>(_425) : as_type<int>(_185);
    float _429 = -_417;
    float _431 = fma(_413, 2.0, _429);
    bool _433 = _343 > 0.5;
    float _435 = _423 * _395;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _321 + _437;
    float _441 = fma(_327, _377, _407);
    float _443 = -_189;
    int _445 = _433 ? as_type<int>(_443) : as_type<int>(_189);
    float _447 = _397 + _335;
    float _449 = _423;
    if (!_371)
    {
        _449 = _345;
    }
    float _451 = _449;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _455 = _451;
    if (_371)
    {
        _455 = _343;
    }
    float _457 = _455;
    float _459 = fma(_435, _439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _461 = !_339;
    float _463 = _461 ? _185 : as_type<float>(_427);
    float _465 = _415 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _467 = !_351;
    float _469 = _467 ? _189 : as_type<float>(_445);
    float _471 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[83].w, _453);
    float _473 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _411);
    float _475 = _381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = -_149;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _481 = _463 + 0.5;
    float _483 = _469 + (-0.5);
    bool _485 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_321);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = _441 + _379;
    float _499 = fma(_475, _481, _479);
    float _501 = -_465;
    float _503 = -_473;
    float _505 = fma(_501, _483, _503);
    bool _507 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _509 = isnan(_321);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _419 + _363;
    float _521 = -_495;
    float _523 = _521 + 1.0;
    float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _527 = _475;
    if (!_371)
    {
        _527 = _343;
    }
    float _529 = _527;
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _447 + _531;
    float _535 = _517 * _523;
    float _537 = _529;
    if (_371)
    {
        _537 = _341;
    }
    float _539 = _537;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _543 = _345 > 0.5;
    float _545 = _459 * _535;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _549 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[83].z, _541);
    float _551 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _553 = -_185;
    int _555 = _543 ? as_type<int>(_553) : as_type<int>(_185);
    float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _559 = _539;
    if (!_371)
    {
        _559 = _345;
    }
    float _561 = _559;
    float _563 = -_547;
    float _565 = fma(_551, 2.0, _563);
    float _567 = _561;
    if (_371)
    {
        _567 = _343;
    }
    float _569 = _567;
    float _571 = -_517;
    float _573 = _571 + 1.0;
    bool _575 = !_355;
    float _577 = _575 ? _185 : as_type<float>(_555);
    float _579 = -_149;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _565);
    float _583 = _569 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _585 = _525 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _587 = _577 + 0.5;
    float _589 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _593 = fma(_585, _587, _581);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _519 + _595;
    float _599 = fma(_583, -2.0, _591);
    float _601 = -_189;
    int _603 = _385 ? as_type<int>(_601) : as_type<int>(_189);
    float _605 = _557 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _607 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _611 = _497 + _609;
    bool _613 = !_367;
    float _615 = _613 ? _189 : as_type<float>(_603);
    float _617 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[28].x, _607);
    float _619 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _599);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _625 = _615 + (-0.5);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].z, _617);
    float _629 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].z, _621);
    float _631 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _549);
    float _633 = -_605;
    float _635 = -_619;
    float _637 = fma(_633, _625, _635);
    float _639 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _623);
    float _641 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[116].x, _589);
    float _643 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _471);
    float _645 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _647 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _639);
    float _649 = -_631;
    float _651 = _649 + 1.0;
    bool _653 = _627 >= 0.0;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = -_647;
    float _661 = _659 + 1.0;
    float _663 = -_643;
    float _665 = _663 + 1.0;
    float _667 = -_657;
    float _669 = fma(_463, _667, _499);
    float _671 = fma(_469, _661, _505);
    float _673 = -_651;
    float _675 = fma(_577, _673, _593);
    float _677 = _597 * _597;
    float _679 = fma(_615, _665, _637);
    float _681 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _683 = fma(_533, _533, _677);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = fma(_611, _611, _683);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = rsqrt(_687);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _697 = _675;
    if (_653)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _699 = _695;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _721 = as_type<int>(_699);
    if (_653)
    {
        float _723 = _699 * 5.0;
        _721 = as_type<int>(_723);
    }
    int _725 = _721;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _737 = _735 != 0;
    out.m_74.x = _709;
    out.m_74.y = _711;
    out.m_74.z = _713;
    out.m_74.w = _681;
    float _739 = _597 * _693;
    float _741 = _533 * _693;
    out.m_76.x = _715;
    out.m_76.y = _717;
    out.m_76.z = _719;
    out.m_76.w = _685;
    bool _743 = !_729;
    int _745 = _743 ? 0 : 1;
    bool _747 = !_733;
    int _749 = _747 ? 0 : 1;
    out.m_78.x = _669;
    out.m_78.y = _671;
    out.m_78.z = _675;
    out.m_78.w = _679;
    bool _751 = !_737;
    int _753 = _751 ? 0 : 1;
    float _755 = _739;
    if (_653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4006 = as_type<float>(_725);
        out.gl_Position.z = _4006;
    }
    if (_653)
    {
        out.m_59.x = 0.0;
    }
    if (_653)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _757 = -_739;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _519);
    float _761 = _611 * _693;
    float _763 = -_741;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _769 = _759 + _767;
    float _771 = -_761;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _497);
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _777 = _765 + _775;
    float _779 = _769 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _773 + _781;
    float _785 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _779);
    float _787 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[28].z, _785);
    bool _789 = _787 >= 0.0;
    float _791 = _761;
    if (_789)
    {
        _697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _793 = _697;
    int _795 = as_type<int>(_793);
    if (_789)
    {
        out.m_59.x = 0.0;
    }
    if (_789)
    {
        float _797 = _793 * 5.0;
        _795 = as_type<int>(_797);
    }
    int _799 = _795;
    if (_789)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4101 = as_type<float>(_799);
        out.gl_Position.z = _4101;
    }
    if (_789)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _801 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _803 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _805 = floor(_801);
    float _807 = floor(_803);
    float _809 = -_805;
    float _811 = _801 + _809;
    float _813 = -_807;
    float _815 = _803 + _813;
    float2 _4137 = float2(_811, _815);
    float _817 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4137, float2(0.0), isnan(_4137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4137, float2(0.0), isnan(_4137)), level(0.0)).x;
    float _819 = _345 * 2.0;
    float _821 = _341 * 2.0;
    float _823 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _825 = log2(_823);
    int _827 = abs(_749);
    float _829 = _343 * 2.0;
    float _831 = -_739;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _835 = -_741;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _533);
    int _839 = abs(_753);
    float _841 = floor(_819);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _845 = 1.0 + _843;
    float _847 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _849 = _833 * _833;
    float _851 = -_761;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _855 = _759 + _847;
    float _857 = fma(_837, _837, _849);
    float _859 = floor(_821);
    float _861 = fma(_853, _853, _857);
    bool _863 = _841 > 0.0;
    float _865 = floor(_829);
    bool _867 = _841 >= 0.0;
    bool _869 = isnan(_841);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    int _877 = abs(_745);
    int _879 = _875 ? 0 : 1;
    bool _881 = _859 > 0.0;
    float _883 = 1.0 / _845;
    int _885 = ~_879;
    int _887 = _885 + 1;
    int _889 = _887 + 1;
    bool _891 = _859 >= 0.0;
    bool _893 = isnan(_859);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = _825 * _149;
    int _903 = _889;
    int _905 = 2;
    if (!_863)
    {
        int _907 = ~_879;
        int _909 = _907 + 1;
        _903 = _909;
    }
    int _911 = _903;
    float _913 = float(_877);
    float _915 = sqrt(_861);
    float _917 = float(_911);
    float _919 = _343 + _345;
    int _921 = _899 ? 0 : 1;
    float _923 = _913 * _917;
    int _925 = ~_921;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = in.m_80.x;
    float _933 = in.m_80.y;
    float _935 = in.m_80.z;
    float _937 = exp2(_901);
    int _939 = _929;
    if (!_881)
    {
        int _941 = ~_921;
        int _943 = _941 + 1;
        _939 = _943;
    }
    int _945 = _939;
    float _947 = _919 + (-1.0);
    bool _949 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(1.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    float _959 = float(_827);
    bool _961 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _963 = isnan(0.0);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _969 = _965 || _967;
    float _971 = _693 * _915;
    float _973 = _343 + _341;
    float _975 = float(_945);
    float _977 = _923 * (-2.0);
    float _979 = _343 + (-0.5);
    float _981 = _973 + (-1.0);
    float _983 = _959 * _975;
    float _985 = -_937;
    float _987 = _985 + 1.0;
    float _989 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _993 = _341 + (-0.5);
    float _995 = _345 + _341;
    float _997 = _969 ? _987 : 0.0;
    float _999 = _345 + (-0.5);
    float _1001 = fma(_977, _931, _931);
    bool _1003 = _865 > 0.0;
    float _1005 = fma(_991, _977, _991);
    if (_957)
    {
        float _1007 = _997 * _883;
        _153 = _1007;
    }
    float _1009 = _153;
    float _1011 = _983 * (-2.0);
    float _1013 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1001);
    bool _1015 = _865 >= 0.0;
    bool _1017 = isnan(_865);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    float _1025 = _995 + (-1.0);
    float _1027 = fma(_989, _1011, _989);
    float _1029 = fma(_1005, _1009, _1013);
    float _1031 = fma(_1011, _933, _933);
    int _1033 = _1023 ? 0 : 1;
    float _1035 = _1029 * 0.15915493667125701904296875;
    float _1037 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1031);
    int _1039 = ~_1033;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = _1035 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    int _1049 = _1043;
    if (!_1003)
    {
        int _1051 = ~_1033;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = fma(_1027, _1009, _1037);
    float _1059 = float(_839);
    float _1061 = float(_1055);
    float _1063 = _1057 * 0.15915493667125701904296875;
    float _1065 = _1035 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1059 * _1061;
    float _1071 = _759 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1073 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1075 = _1069 * (-2.0);
    float _1077 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1071);
    float _1079 = _1063 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = fma(_1075, _935, _935);
    float _1085 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1077);
    float _1087 = fma(_1073, _1075, _1073);
    float _1089 = _759 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1091 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1083);
    float _1093 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1095 = _855 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1097 = _1063 * 6.283185482025146484375;
    float _1099 = cos(_1097);
    float _1101 = fma(_1087, _1009, _1091);
    float _1103 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1089);
    float _1105 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1095);
    float _1107 = _1101 * 0.15915493667125701904296875;
    float _1109 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1103);
    float _1111 = in.m_82.x;
    float _1113 = in.m_82.y;
    float _1115 = 1.0 / _1093;
    float _1117 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1105);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _1067 * _1081;
    float _1123 = _1047 * _1081;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1127 = _1119 + _1093;
    float _1129 = _1107 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1127 * _1115;
    float _1135 = _1133 * 0.5;
    float _1137 = _855 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1139 = _1107 * 6.283185482025146484375;
    float _1141 = cos(_1139);
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1145 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1143);
    float _1147 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1137);
    float _1149 = _291 * _1113;
    float _1151 = _1047 * _1099;
    float _1153 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1147);
    float _1155 = 1.0 / _1145;
    float _1157 = _289 * _1111;
    float _1159 = -_1121;
    float _1161 = fma(_1131, _1151, _1159);
    float _1163 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1165 = -_1151;
    float _1167 = fma(_1131, _1121, _1165);
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1173 = _1067 * _1099;
    float _1175 = trunc(_1125);
    int _1177 = int(_1175);
    float _1179 = _1067 * _1141;
    float _1181 = _1099 * _1141;
    float _1183 = _1047 * _1141;
    float _1185 = _1081 * _1141;
    float _1187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1189 = _971 * _1169;
    float _1191 = fma(_1131, _1173, _1123);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1195 = _1155 * _1193;
    float _1197 = trunc(_1163);
    int _1199 = int(_1197);
    float _1201 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1203 = fma(_1131, _1123, _1173);
    bool _1205 = _1195 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1207 = _971 * _1201;
    bool _1209 = _1195 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1211 = !_1205;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1171 * _1207;
    int _1217 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1219 = _1177 + _1217;
    int _1221 = _1219 + 1;
    float _1223 = _1187 * _1189;
    float _1225 = _1179 * _1215;
    bool _1227 = _1221 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1229 = -_1215;
    float _1231 = _1131 * _1229;
    int _1233 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1235 = _1199 + _1233;
    int _1237 = _1235 + 1;
    float _1239 = fma(_1191, _1223, _1225);
    int _1241 = _1221;
    int _1243 = _1237;
    float _1245 = _1125;
    if (!_1205)
    {
        _905 = 1;
    }
    int _1247 = _905;
    float _1249 = fma(_1181, _1223, _1231);
    int _1251 = _1247;
    if (!_1209)
    {
        _1251 = _1213;
    }
    int _1253 = _1251;
    float _1255 = _971 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1257 = _1255 * 0.5;
    int _1259 = _1221 | _1237;
    float _1261 = _1183 * _1215;
    int _1263 = _1253 << 6;
    float _1265 = fma(_1185, _1257, _1249);
    bool _1267 = _1259 < 0;
    bool _1269 = _1267 || _1227;
    float _1271 = fma(_1161, _1223, _1261);
    int _1273 = _1263 + 96;
    uint _1276 = uint(int(uint(_1273) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c15)._m0[int(_1286)][_1288];
    float _1292 = fma(_1167, _1257, _1239);
    bool _1294 = _1237 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1296 = _1294 || _1269;
    float _1298 = fma(_1203, _1257, _1271);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1308 = _1304 || _1306;
    float _1310 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1312 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1314 = _1263 + 104;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.vp_c15)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    float _1332 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1310);
    float _1334 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1312);
    float _1336 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1338 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1334);
    float _1340 = as_type<float>(_1253);
    if (!_1296)
    {
        int _1342 = _1237 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1344 = _1342 + _1221;
        _1241 = _1344;
    }
    int _1346 = _1241;
    int _1348 = _1263 + 48;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    float _1366 = _1336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1368 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1370 = 0.0;
    float _1372 = as_type<float>(_1346);
    if (!_1296)
    {
        float _1374 = floor(_1125);
        _1370 = _1374;
    }
    float _1376 = _1370;
    int _1378 = 0;
    if (!_1296)
    {
        int _1380 = _1346 << 2;
        _1378 = _1380;
    }
    int _1382 = _1378;
    float _1384 = _497 + _1366;
    int _1386 = _1382;
    float _1388 = _1384;
    if (!_1296)
    {
        uint _1390 = uint(int(uint(_1346) >> uint(2)));
        _1243 = int(_1390);
    }
    int _1392 = _1243;
    float _1394 = _447 + _1368;
    int _1396 = _1263 + 64;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    float _1414 = _1394;
    if (!_1296)
    {
        int _1416 = 12 & _1382;
        _1386 = _1416;
    }
    int _1418 = _1386;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1422 = _1384 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1394 + _1424;
    float _1428 = 0.0;
    if (!_1296)
    {
        int _1430 = _1392 << 4;
        int _1432 = _1430 + _1418;
        _1428 = as_type<float>(_1432);
    }
    float _1434 = _1428;
    float _1436 = _1422 * _1422;
    int _1438 = _1263 + 56;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
    int _1444 = int(_1440) & 3;
    float _1446 = (*spvDescriptorSet0.vp_c15)._m0[int(_1442)][_1444];
    int _1448 = int(_1440) + 1;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    int _1452 = _1448 & 3;
    float _1454 = (*spvDescriptorSet0.vp_c15)._m0[int(_1450)][_1452];
    float _1456 = fma(_1426, _1426, _1436);
    float _1458 = sqrt(_1456);
    int _1460 = _1263 + 72;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[int(_1472)][_1474];
    int _1478 = _1263 + 80;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    float _1496 = _855 * _1290;
    float _1498 = fma(_765, _1282, _1496);
    float _1500 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1502 = _1458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1504 = _1263 + 88;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_773, _1322, _1498);
    float _1524 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1500);
    float _1526 = _1292;
    if (!_1296)
    {
        float _1528 = floor(_1163);
        _1526 = _1528;
    }
    float _1530 = _1526;
    float _1532 = _1522 + _1330;
    float _1534 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1524);
    float _1536 = _1434;
    if (!_1296)
    {
        int _1538 = as_type<int>(_1434) + 400;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
        int _1544 = int(_1540) & 3;
        float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
        _1536 = _1546;
    }
    float _1548 = _1536;
    float _1550 = _855 * _1364;
    float _1552 = 1.0 / _1532;
    float _1554 = fma(_765, _1356, _1550);
    float _1556 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1558 = _855 * _1412;
    float _1560 = _519 + _1556;
    float _1562 = fma(_765, _1404, _1558);
    float _1564 = _1364;
    float _1566 = _1404;
    if (!_1502)
    {
        _1564 = _1560;
    }
    float _1568 = _1564;
    float _1570 = fma(_773, _1446, _1554);
    float _1572 = fma(_773, _1468, _1562);
    bool _1574 = !_1502;
    float _1576 = _1568;
    float _1578 = _1530;
    if (!_1574)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1458 + _1582;
        float _1586 = rsqrt(_1456);
        float _1588 = _1584 * _1580;
        float _1590 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1592 = _1588 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1600, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1606 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = _1586 * _1604;
        float _1610 = fma(_1560, _1596, _1606);
        float _1612 = fma(_1426, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1614 = fma(_1422, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1414 = _1612;
        _1576 = _1610;
        _1388 = _1614;
        _1566 = _1592;
    }
    float _1616 = _1414;
    float _1618 = _1576;
    float _1620 = _1388;
    float _1622 = _1566;
    float _1624 = -_741;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1628 = -_739;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1618);
    float _1632 = -_761;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1620);
    float _1636 = _1570 + _1454;
    float _1638 = _1572 + _1476;
    float _1640 = _1630;
    float _1642 = _1626;
    float _1644 = _1634;
    if (!_1308)
    {
        float _1646 = _769 * _769;
        float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1650 = -_497;
        float _1652 = _1650 + _1620;
        float _1654 = -_519;
        float _1656 = _1654 + _1618;
        float _1658 = fma(_777, _777, _1646);
        float _1660 = fma(_783, _783, _1658);
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1664 = sqrt(_1660);
        float _1666 = 1.0 / _971;
        float _1668 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1670 = precise::min(_1664, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1672 = _1670 * _1648;
        float _1674 = _1672 * _1666;
        float _1676 = -_447;
        float _1678 = _1676 + _1616;
        float _1680 = _1668 * _1674;
        float _1682 = _1652 * _1674;
        float _1684 = fma(_1656, _1680, _759);
        float _1686 = fma(_1678, _1680, _765);
        float _1688 = fma(_1668, _1682, _773);
        _1640 = _1684;
        _1642 = _1686;
        _1644 = _1688;
    }
    float _1690 = _1640;
    float _1692 = _1642;
    float _1694 = _1644;
    float _1696 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = _1636 * _1552;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1696);
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1708 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1710 = _1700 >= 0.0;
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1714 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1718 = _1638 * _1552;
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1722 = _1700 <= 1.0;
    bool _1724 = _1722 && _1710;
    float _1726 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1708);
    float _1732 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1734 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1736 = _1718 >= 0.0;
    bool _1738 = _1736 && _1724;
    float _1740 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1732);
    float _1744 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1746 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1748 = _1718 <= 1.0;
    bool _1750 = _1748 && _1738;
    float _1752 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1754 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1756 = -_1746;
    float _1758 = fma(_1756, _1744, 1.0);
    float _1760 = _855 * _1494;
    float _1762 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1754);
    float _1766 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_765, _1486, _1760);
    float _1770 = log2(_1758);
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1774 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1776 = fma(_773, _1512, _1768);
    float _1778 = _1764;
    if (_1750)
    {
        float _1780 = float(_1253);
        _1340 = _1780;
    }
    float _1782 = _1340;
    float _1784 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1786 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1788 = _1776 + _1520;
    float _1790 = 1.0 / _1764;
    float _1792 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1794 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1786);
    float _1796 = _1786;
    float _1798 = _1792;
    if (!_1296)
    {
        float _1800 = -_1530;
        float _1802 = _1163 + _1800;
        _1578 = _1802;
    }
    float _1804 = _1578;
    if (!_1296)
    {
        float _1806 = -_1376;
        float _1808 = _1125 + _1806;
        _1796 = _1808;
    }
    float _1810 = _1796;
    float _1812 = _1622;
    if (!_1296)
    {
        float _1814 = rint(_1548);
        float _1816 = precise::max(_1814, 0.0);
        uint _1818 = uint(_1816);
        uint _1820 = clamp(_1818, 0u, 65535u);
        _1812 = as_type<float>(_1820);
    }
    float _1822 = _1812;
    float _1824 = _1770 * 0.693147182464599609375;
    float _1826 = _1788 * _1552;
    float _1828 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1830 = _1768;
    float _1832 = _1828;
    if (_1750)
    {
        float _1834 = rint(_1782);
        float _1836 = precise::max(_1834, 0.0);
        uint _1838 = uint(_1836);
        uint _1840 = clamp(_1838, 0u, 65535u);
        _1830 = as_type<float>(_1840);
    }
    float _1842 = _1830;
    float _1844 = _1792 * _1790;
    float _1846 = _1794 * _1790;
    float _1848 = fma(_1844, 0.5, 0.5);
    float _1850 = fma(_1846, -0.5, 0.5);
    float _1852 = _1376;
    float _1854 = _1850;
    float _1856 = _1848;
    if (!_1296)
    {
        float3 _5786 = float3(_1810, _1804, float(as_type<int>(_1822)));
        float3 _5790 = select(_5786, float3(0.0), isnan(_5786));
        float _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5790.xy, uint(rint(_5790.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5790.xy, uint(rint(_5790.z)), level(0.0)).x;
        _1852 = _1858;
    }
    float _1860 = _1852;
    float _1862 = _1718;
    if (_1750)
    {
        float3 _5805 = float3(_1700, _1718, float(as_type<int>(_1842)));
        float3 _5807 = select(_5805, float3(0.0), isnan(_5805));
        float _1864 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5807.xy, uint(rint(_5807.z)), _1826, level(0.0));
        _1862 = _1864;
    }
    float _1866 = _1862;
    float3 _5817 = float3(_1848, _1850, _1828);
    float _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5817, float3(0.0), isnan(_5817)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5817, float3(0.0), isnan(_5817)), level(0.0)).x;
    float3 _5826 = float3(_1848, _1850, _1828);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5826, float3(0.0), isnan(_5826)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5826, float3(0.0), isnan(_5826)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    bool _1881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1883 = isnan(0.5);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1889 = _1885 || _1887;
    if (_1296)
    {
        _791 = 1.0;
    }
    float _1891 = _791;
    float _1893 = _1891;
    if (_1889)
    {
        _1245 = 1.0;
    }
    float _1895 = _1245;
    float _1897 = _1895;
    if (_1889)
    {
        _755 = 1.0;
    }
    float _1899 = _755;
    float _1901 = _1899;
    float _1903 = _1873;
    if (!_1889)
    {
        float _1905 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1911 = _1907 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1909 * 0.15915493667125701904296875;
        float _1917 = _1907 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1913;
        float _1923 = _1915 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = _1915 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = 1.0 / _1933;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1937;
        float _1941 = 1.0 / _1939;
        float _1943 = _1931 * _1935;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = fma(_1195, _1943, _1945);
        float _1949 = _1947 * _1941;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1854 = _1947;
        _1856 = _1915;
        _1901 = _1951;
    }
    float _1953 = _1854;
    float _1955 = _1856;
    float _1957 = _1901;
    float _1959 = _1955;
    float _1961 = _1953;
    if (!_1889)
    {
        float _1963 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1965 = _1963 * 0.15915493667125701904296875;
        float _1967 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1969 = _1965 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1967 * 0.15915493667125701904296875;
        float _1975 = _1965 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = 1.0 / _1971;
        float _1981 = _1973 * 6.283185482025146484375;
        float _1983 = cos(_1981);
        float _1985 = _1977 * _1979;
        float _1987 = _1973 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1983 * _1985;
        float _1993 = 1.0 / _1991;
        float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1997 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1995;
        float _1999 = 1.0 / _1997;
        float _2001 = _1989 * _1993;
        float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2005 = fma(_1195, _2001, _2003);
        float _2007 = _2005 * _1999;
        float _2009 = precise::clamp(_2007, 0.0, 1.0);
        float _2011 = -_2009;
        float _2013 = _2011 + 1.0;
        _1959 = _1991;
        _1961 = _1979;
        _1897 = _2013;
    }
    float _2015 = _1959;
    float _2017 = _1961;
    float _2019 = _1897;
    if (!_1296)
    {
        int _2021 = _1346 << 4;
        int _2023 = _2021 + 2048;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
        int _2029 = int(_2025) & 3;
        float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
        int _2033 = int(_2025) + 1;
        uint _2035 = uint(int(uint(_2033) >> uint(2)));
        int _2037 = _2033 & 3;
        float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
        int _2041 = _2023 + 8;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
        int _2047 = int(_2043) & 3;
        float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
        int _2051 = int(_2043) + 1;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        int _2055 = _2051 & 3;
        float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
        float _2059 = _855 * _2039;
        float _2061 = fma(_765, _2031, _2059);
        float _2063 = fma(_773, _2049, _2061);
        float _2065 = _2063 + _2057;
        float _2067 = precise::clamp(_2065, 0.0, 1.0);
        float _2069 = -_2067;
        float _2071 = _2069 + _1860;
        float _2073 = fma(_2071, 500.0, 1.5);
        float _2075 = exp2(_2073);
        float _2077 = 0.0 + _2075;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        _1372 = as_type<float>(_2023);
        _1893 = _2079;
    }
    float _2081 = _1372;
    float _2083 = _1893;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2087 = _1690 + _2085;
    float _2089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2091 = _1692 + _2089;
    float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2095 = _1694 + _2093;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = rsqrt(_2101);
    float _2105 = sqrt(_2101);
    float _2107 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2109 = _2091 * _2107;
    float _2111 = _2095 * _2107;
    float _2113 = _2109 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 + _2115;
    float _2119 = sqrt(_2117);
    bool _2121 = _2119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = _2119 + _2123;
    float _2127 = _2015;
    float _2129 = _2117;
    float _2131 = _2125;
    float _2133 = _2109;
    float _2135 = _2111;
    float _2137 = _2113;
    float _2139 = _2115;
    if (_2121)
    {
        float _2141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2141;
    }
    float _2143 = _2127;
    if (_2121)
    {
        float _2145 = rsqrt(_2117);
        _2129 = _2145;
    }
    float _2147 = _2129;
    if (_2121)
    {
        float _2149 = _2125 * _2143;
        _2131 = _2149;
    }
    float _2151 = _2131;
    if (_2121)
    {
        float _2153 = _2151 * 0.15915493667125701904296875;
        _1832 = _2153;
    }
    float _2155 = _1832;
    float _2157 = _2017;
    if (_2121)
    {
        float _2159 = _2155 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        _2157 = _2161;
    }
    float _2163 = _2157;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = precise::max(0.0, _2165);
    float _2169 = _2081;
    float _2171 = _2167;
    float _2173 = _2165;
    if (_2121)
    {
        float _2175 = _2155 * 6.283185482025146484375;
        float _2177 = cos(_2175);
        _2169 = _2177;
    }
    float _2179 = _2169;
    float _2181 = -_2107;
    float _2183 = -_2167;
    float _2185 = fma(_2087, _2181, _2183);
    float _2187 = _2185;
    if (_2121)
    {
        float _2189 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2189;
    }
    float _2191 = _2171;
    float _2193 = _2163;
    float _2195 = _2191;
    if (_2121)
    {
        float _2197 = fma(_2163, _2191, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2193 = _2197;
    }
    float _2199 = _2193;
    float _2201 = _2199;
    if (_2121)
    {
        float _2203 = _2179 + (-1.0);
        _2173 = _2203;
    }
    float _2205 = _2173;
    if (_2121)
    {
        float _2207 = _2147 * _2199;
        _2201 = _2207;
    }
    float _2209 = _2201;
    if (_2121)
    {
        float _2211 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2211;
    }
    float _2213 = _2195;
    if (_2121)
    {
        float _2215 = _2109 * _2209;
        _2133 = _2215;
    }
    float _2217 = _2133;
    if (_2121)
    {
        float _2219 = _2111 * _2209;
        _2135 = _2219;
    }
    float _2221 = _2135;
    if (_2121)
    {
        float _2223 = fma(_2185, _2179, _2213);
        _2187 = _2223;
    }
    float _2225 = _2187;
    if (_2121)
    {
        float _2227 = _2217 * _2217;
        _2137 = _2227;
    }
    float _2229 = _2137;
    if (_2121)
    {
        float _2231 = _2221 * _2221;
        _2139 = _2231;
    }
    float _2233 = _2139;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2237 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2235);
    float _2239 = precise::clamp(_2237, 0.0, 1.0);
    float _2241 = fma(_2225, _2225, _2229);
    float _2243 = -_2239;
    float _2245 = _2243 + 1.0;
    float _2247 = _2241 + _2233;
    float _2249 = rsqrt(_2247);
    float _2251 = _2249 * _2225;
    float _2253 = _2249 * _2217;
    float _2255 = abs(_2245);
    float _2257 = log2(_2255);
    float _2259 = _2249 * _2221;
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2263 = -_2261;
    float _2265 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2263);
    float _2267 = -_2259;
    float _2269 = fma(_2267, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2265);
    float _2271 = fma(_2269, -0.5, 0.5);
    float _2273 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2275 = fma(_2269, 0.5, 0.5);
    float _2277 = _2251 + 1.0;
    float _2279 = sqrt(_2271);
    float _2281 = fma(_2275, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2283 = fma(_2275, _2281, -0.212114393711090087890625);
    float _2285 = exp2(_2273);
    float _2287 = fma(_2275, _2283, 1.570728778839111328125);
    float _2289 = _2279 * 0.636619746685028076171875;
    float _2291 = -_2287;
    float _2293 = fma(_2289, _2291, 1.0);
    float _2295 = -_2251;
    float _2297 = fma(_2285, _2277, _2295);
    float _2299 = fma(_2297, 0.5, 0.5);
    float2 _6445 = float2(_2293, _2299);
    float3 _2303 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).xyz;
    float _2305 = _2303.x;
    float _2307 = _2303.y;
    float _2309 = _2303.z;
    float _2311 = abs(_1195);
    float _2313 = log2(_2311);
    float _2315 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2317 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2319 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2321 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2323 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2325 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2315);
    float _2329 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2317);
    float _2331 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2319);
    float _2333 = -_1131;
    float _2335 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2321);
    float _2337 = -_1131;
    float _2339 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2323);
    float _2341 = -_1131;
    float _2343 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    float _2345 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2347 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2349 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2351 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2353 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2355 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2327);
    float _2357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2329);
    float _2359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2331);
    float _2361 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2345);
    float _2363 = exp2(_2351);
    float _2365 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2367 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2347);
    float _2369 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2349);
    float _2371 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2335);
    float _2373 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2339);
    float _2375 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2377 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2343);
    float _2379 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2365);
    float _2381 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2361);
    float _2383 = exp2(_2353);
    float _2385 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2367);
    float _2387 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2369);
    float _2389 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2391 = _2375 * _2371;
    float _2393 = _2375 * _2373;
    float _2395 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2379);
    float _2397 = _2375 * _2377;
    float _2399 = fma(_2389, _2355, _2391);
    float _2401 = fma(_2389, _2357, _2393);
    float _2403 = fma(_2389, _2359, _2397);
    float _2405 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = _1764 * 0.5;
    float _2413 = _1792 + _1764;
    float _2415 = _2405 + _1764;
    float _2417 = fma(_2409, -2.0, 3.0);
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1794;
    out.gl_Position.z = _2405;
    out.gl_Position.w = _1764;
    float _2419 = _2409 * _2409;
    float _2421 = fma(_1794, -0.5, _2411);
    bool _2423 = _1195 <= 8000.0;
    bool _2425 = isnan(_1195);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(8000.0);
    bool _2431 = _2427 || _2429;
    float _2433 = float(_2431);
    float _2435 = _2415 * 0.5;
    float _2437 = _2419 * _2417;
    float _2439 = _2413 * 0.5;
    float _2441 = _2381 + _2399;
    float _2443 = _2385 + _2401;
    float _2445 = _2387 + _2403;
    float _2447 = -_817;
    float _2449 = _2447 + 1.0;
    out.m_84.x = _2439;
    out.m_84.y = _2421;
    out.m_84.z = _2435;
    out.m_84.w = _1764;
    bool _2451 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2453 = isnan(_2105);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2459 = _2455 || _2457;
    float _2461 = -_2383;
    float _2463 = _2461 + 1.0;
    if (!_1750)
    {
        _1798 = 1.0;
    }
    float _2465 = _1798;
    float _2467 = -_2437;
    float _2469 = _2467 + 1.0;
    float _2471 = _2465;
    if (_1750)
    {
        bool _2473 = _1866 >= _1826;
        bool _2475 = isnan(_1866);
        bool _2477 = _2473 || _2475;
        bool _2479 = isnan(_1826);
        bool _2481 = _2477 || _2479;
        float _2483 = float(_2481);
        _2471 = _2483;
    }
    float _2485 = _2471;
    float _2487 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2441;
    out.m_86.y = _2443;
    out.m_86.z = _2445;
    float _2489 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2437);
    float _2491 = _2487 * _1868;
    float _2493 = -_2487;
    float _2495 = _2493 + 1.0;
    float _2497 = _2433 * _2489;
    out.m_88.x = _1692;
    out.m_88.y = _1690;
    out.m_88.z = _1694;
    float _2499 = _1879 * _2491;
    float _2501 = _1879 * _2495;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2505 = _2485 * _2083;
    float _2507 = _2495;
    if (!_2459)
    {
        _1778 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2509 = _1778;
    float _2511 = _2449 * _2503;
    float _2513 = precise::clamp(_2511, 0.0, 1.0);
    float _2515 = _2509;
    float _2517 = _2509;
    if (!_2459)
    {
        _2507 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2519 = _2507;
    float _2521 = -_2513;
    float _2523 = fma(_2521, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2525 = -_2505;
    float _2527 = fma(_2525, _2523, 1.0);
    float _2529 = precise::clamp(_2527, 0.0, 1.0);
    float _2531 = _2523;
    float _2533 = _2519;
    float _2535 = _2519;
    if (!_2459)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2537 = _2531;
    float _2539 = _2529 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _2539;
    float _2541 = _2539;
    float _2543 = _2537;
    float _2545 = _2537;
    if (!_2459)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2547 = _2541;
    float _2549 = _2309 * _2491;
    float _2551 = fma(_2305, _2499, _1873);
    float _2553 = fma(_2307, _2499, _1875);
    float _2555 = _1957 * _2019;
    float _2557 = fma(_1879, _2549, _1877);
    float _2559 = _2555;
    float _2561 = _2547;
    float _2563 = _2547;
    if (!_2459)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2565 = _1903;
    float _2567 = _2555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2569 = _2565;
    float _2571 = _2565;
    if (!_2459)
    {
        _2559 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2573 = _2559;
    out.m_92.x = _2551;
    out.m_92.y = _2553;
    out.m_92.z = _2557;
    out.m_92.w = _2501;
    bool _2575 = !_2459;
    float _2577 = _2573;
    float _2579 = _2573;
    if (!_2575)
    {
        bool _2581 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2583 = isnan(_2105);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2589 = _2585 || _2587;
        if (!_2589)
        {
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2593 = _2105 + _2591;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2595;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2603 = 1.0 / _2597;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2621 = _2593 * _2603;
            float _2623 = precise::clamp(_2621, 0.0, 1.0);
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2629 = fma(_2623, _2601, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2631 = fma(_2623, _2627, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2633 = fma(_2623, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2635 = fma(_2623, _2611, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2637 = fma(_2623, _2615, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2639 = fma(_2623, _2619, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2517 = _2633;
            _2563 = _2637;
            _2571 = _2629;
            _2545 = _2635;
            _2535 = _2631;
            _2579 = _2639;
            _2641 = true;
        }
        else
        {
            bool _2643 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2645 = isnan(_2105);
            bool _2647 = _2643 || _2645;
            bool _2649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2651 = _2647 || _2649;
            if (!_2651)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2653 = _2569;
            _2571 = _2653;
            if (!_2651)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2655 = _2515;
            _2517 = _2655;
            if (!_2651)
            {
                _2533 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2657 = _2533;
            _2535 = _2657;
            if (!_2651)
            {
                _2543 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2659 = _2543;
            _2545 = _2659;
            if (!_2651)
            {
                _2561 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2661 = _2561;
            _2563 = _2661;
            if (!_2651)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2663 = _2577;
            bool _2665 = !_2651;
            _2579 = _2663;
            if (!_2665)
            {
                bool _2667 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2669 = isnan(_2105);
                bool _2671 = _2667 || _2669;
                bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2675 = _2671 || _2673;
                if (!_2675)
                {
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2679 = _2105 + _2677;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2683 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2681;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2689 = 1.0 / _2683;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2707 = _2679 * _2689;
                    float _2709 = precise::clamp(_2707, 0.0, 1.0);
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2715 = fma(_2709, _2687, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2717 = fma(_2709, _2713, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2719 = fma(_2709, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2721 = fma(_2709, _2697, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2723 = fma(_2709, _2701, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2725 = fma(_2709, _2705, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2517 = _2719;
                    _2563 = _2723;
                    _2571 = _2715;
                    _2545 = _2721;
                    _2535 = _2717;
                    _2579 = _2725;
                    _2641 = true;
                }
                else
                {
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2563 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2545 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2535 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2641 = false;
    float _2727 = _2517;
    float _2729 = _2563;
    float _2731 = _2571;
    float _2733 = _2545;
    float _2735 = _2535;
    float _2737 = _2579;
    float _2739 = fma(_2443, -0.5, 0.5);
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = -_2727;
    float _2745 = _2743 + _2729;
    float _2747 = _2567 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2749 = -_2731;
    float _2751 = _2749 + _2733;
    float _2753 = fma(_2741, _2745, _2727);
    out.m_94.x = 0.0;
    float _2755 = -_2735;
    float _2757 = _2755 + _2737;
    float _2759 = fma(_2741, _2751, _2731);
    float _2761 = _2753 * 0.586610972881317138671875;
    out.m_59.x = _2747;
    bool _2763 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2765 = fma(_2741, _2757, _2735);
    float _2767 = fma(_2759, 0.298911988735198974609375, _2761);
    bool _2769 = _1957 > 0.0;
    bool _2771 = isnan(_1957);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan(0.0);
    bool _2777 = _2773 || _2775;
    float _2779 = fma(_2765, 0.114477999508380889892578125, _2767);
    bool _2781 = _2019 <= 0.0;
    bool _2783 = !_2777;
    bool _2785 = _2781 || _2783;
    float _2787 = -_2779;
    float _2789 = _2759 + _2787;
    float _2791 = -_2779;
    float _2793 = _2753 + _2791;
    float _2795 = -_2779;
    float _2797 = _2765 + _2795;
    float _2799 = fma(_2789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    float _2801 = fma(_2793, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    float _2803 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    bool _2805 = !_2763;
    if (!_2805)
    {
        float _2807 = -_1690;
        float _2809 = _2807 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2811 = -_1692;
        float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2815 = -_1694;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2819 = _2809 * _2809;
        float _2821 = fma(_2813, _2813, _2819);
        float _2823 = fma(_2817, _2817, _2821);
        float _2825 = sqrt(_2823);
        float _2827 = rsqrt(_2823);
        float _2829 = -_2825;
        float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2833 = _2831 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        float _2837 = _2813 * _2827;
        float _2839 = _2809 * _2827;
        float _2841 = abs(_2835);
        float _2843 = log2(_2841);
        float _2845 = _2817 * _2827;
        float _2847 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2849 = _2443 * _2839;
        float _2851 = -_2839;
        float _2853 = -_2847;
        float _2855 = fma(_2851, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2853);
        float _2857 = fma(_2441, _2837, _2849);
        float _2859 = -_2845;
        float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2855);
        float _2863 = fma(_2445, _2845, _2857);
        float _2865 = precise::clamp(_2863, 0.0, 1.0);
        float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2869 = _2861 + _2867;
        float _2871 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2873 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = exp2(_2871);
        float _2879 = _2877 * _2875;
        float _2881 = _2865 * _2879;
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2885 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2887 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2883;
        out.m_94.y = _2885;
        out.m_94.z = _2887;
    }
    out.m_96.x = _2799;
    out.m_96.y = _2801;
    out.m_96.z = _2803;
    if (!_2785)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2889 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2889;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2641 = false;
    bool _313 = false;
    bool _211 = false;
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
        float _2946 = as_type<float>(_131);
        out.gl_Position.z = _2946;
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
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3015 = as_type<float>(_169);
        out.gl_Position.z = _3015;
    }
    if (_163)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_66.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_66.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_56.x;
    float _325 = in.m_56.y;
    float _327 = in.m_56.z;
    float _329 = in.m_68.x;
    float _331 = in.m_68.y;
    float _333 = in.m_68.z;
    float _335 = in.m_68.w;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_66.x;
    float _343 = in.m_66.y;
    float _345 = in.m_66.z;
    float _347 = in.m_66.w;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _355 = _353 != 0;
    float _357 = in.m_70.x;
    float _359 = in.m_70.y;
    float _361 = in.m_70.z;
    float _363 = in.m_70.w;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _371 = _369 != 0;
    float _373 = in.m_72.x;
    float _375 = in.m_72.y;
    float _377 = in.m_72.z;
    float _379 = in.m_72.w;
    float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _383 = _325 * _331;
    bool _385 = _347 > 0.5;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _391 = fma(_323, _329, _383);
    float _393 = _325 * _359;
    float _395 = 1.0 / _389;
    float _397 = fma(_327, _333, _391);
    float _399 = fma(_323, _357, _393);
    float _401 = _325 * _375;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _405 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _407 = fma(_323, _373, _401);
    bool _409 = _341 > 0.5;
    float _411 = fma(_405, -2.0, _403);
    float _413 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _419 = fma(_327, _361, _399);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _421;
    float _425 = -_185;
    int _427 = _409 ? as_type<int>(_425) : as_type<int>(_185);
    float _429 = -_417;
    float _431 = fma(_413, 2.0, _429);
    bool _433 = _343 > 0.5;
    float _435 = _423 * _395;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _321 + _437;
    float _441 = fma(_327, _377, _407);
    float _443 = -_189;
    int _445 = _433 ? as_type<int>(_443) : as_type<int>(_189);
    float _447 = _397 + _335;
    float _449 = _423;
    if (!_371)
    {
        _449 = _345;
    }
    float _451 = _449;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _455 = _451;
    if (_371)
    {
        _455 = _343;
    }
    float _457 = _455;
    float _459 = fma(_435, _439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _461 = !_339;
    float _463 = _461 ? _185 : as_type<float>(_427);
    float _465 = _415 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _467 = !_351;
    float _469 = _467 ? _189 : as_type<float>(_445);
    float _471 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[83].w, _453);
    float _473 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _411);
    float _475 = _381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = -_149;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _481 = _463 + 0.5;
    float _483 = _469 + (-0.5);
    bool _485 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_321);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = _441 + _379;
    float _499 = fma(_475, _481, _479);
    float _501 = -_465;
    float _503 = -_473;
    float _505 = fma(_501, _483, _503);
    bool _507 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _509 = isnan(_321);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _419 + _363;
    float _521 = -_495;
    float _523 = _521 + 1.0;
    float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _527 = _475;
    if (!_371)
    {
        _527 = _343;
    }
    float _529 = _527;
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _447 + _531;
    float _535 = _517 * _523;
    float _537 = _529;
    if (_371)
    {
        _537 = _341;
    }
    float _539 = _537;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _543 = _345 > 0.5;
    float _545 = _459 * _535;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _549 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[83].z, _541);
    float _551 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _553 = -_185;
    int _555 = _543 ? as_type<int>(_553) : as_type<int>(_185);
    float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _559 = _539;
    if (!_371)
    {
        _559 = _345;
    }
    float _561 = _559;
    float _563 = -_547;
    float _565 = fma(_551, 2.0, _563);
    float _567 = _561;
    if (_371)
    {
        _567 = _343;
    }
    float _569 = _567;
    float _571 = -_517;
    float _573 = _571 + 1.0;
    bool _575 = !_355;
    float _577 = _575 ? _185 : as_type<float>(_555);
    float _579 = -_149;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _565);
    float _583 = _569 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _585 = _525 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _587 = _577 + 0.5;
    float _589 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _593 = fma(_585, _587, _581);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _519 + _595;
    float _599 = fma(_583, -2.0, _591);
    float _601 = -_189;
    int _603 = _385 ? as_type<int>(_601) : as_type<int>(_189);
    float _605 = _557 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _607 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _611 = _497 + _609;
    bool _613 = !_367;
    float _615 = _613 ? _189 : as_type<float>(_603);
    float _617 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[28].x, _607);
    float _619 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _599);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _625 = _615 + (-0.5);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].z, _617);
    float _629 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].z, _621);
    float _631 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _549);
    float _633 = -_605;
    float _635 = -_619;
    float _637 = fma(_633, _625, _635);
    float _639 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _623);
    float _641 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[116].x, _589);
    float _643 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _471);
    float _645 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _647 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _639);
    float _649 = -_631;
    float _651 = _649 + 1.0;
    bool _653 = _627 >= 0.0;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = -_647;
    float _661 = _659 + 1.0;
    float _663 = -_643;
    float _665 = _663 + 1.0;
    float _667 = -_657;
    float _669 = fma(_463, _667, _499);
    float _671 = fma(_469, _661, _505);
    float _673 = -_651;
    float _675 = fma(_577, _673, _593);
    float _677 = _597 * _597;
    float _679 = fma(_615, _665, _637);
    float _681 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _683 = fma(_533, _533, _677);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = fma(_611, _611, _683);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = rsqrt(_687);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _697 = _675;
    if (_653)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _699 = _695;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _721 = as_type<int>(_699);
    if (_653)
    {
        float _723 = _699 * 5.0;
        _721 = as_type<int>(_723);
    }
    int _725 = _721;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _737 = _735 != 0;
    out.m_74.x = _709;
    out.m_74.y = _711;
    out.m_74.z = _713;
    out.m_74.w = _681;
    float _739 = _597 * _693;
    float _741 = _533 * _693;
    out.m_76.x = _715;
    out.m_76.y = _717;
    out.m_76.z = _719;
    out.m_76.w = _685;
    bool _743 = !_729;
    int _745 = _743 ? 0 : 1;
    bool _747 = !_733;
    int _749 = _747 ? 0 : 1;
    out.m_78.x = _669;
    out.m_78.y = _671;
    out.m_78.z = _675;
    out.m_78.w = _679;
    bool _751 = !_737;
    int _753 = _751 ? 0 : 1;
    float _755 = _739;
    if (_653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4006 = as_type<float>(_725);
        out.gl_Position.z = _4006;
    }
    if (_653)
    {
        out.m_59.x = 0.0;
    }
    if (_653)
    {
        return out;
    }
    float _757 = -_739;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _519);
    float _761 = _611 * _693;
    float _763 = -_741;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _769 = _759 + _767;
    float _771 = -_761;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _497);
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _777 = _765 + _775;
    float _779 = _769 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _773 + _781;
    float _785 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _779);
    float _787 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[28].z, _785);
    bool _789 = _787 >= 0.0;
    float _791 = _761;
    if (_789)
    {
        _697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _793 = _697;
    int _795 = as_type<int>(_793);
    if (_789)
    {
        out.m_59.x = 0.0;
    }
    if (_789)
    {
        float _797 = _793 * 5.0;
        _795 = as_type<int>(_797);
    }
    int _799 = _795;
    if (_789)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4101 = as_type<float>(_799);
        out.gl_Position.z = _4101;
    }
    if (_789)
    {
        return out;
    }
    float _801 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _803 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _805 = floor(_801);
    float _807 = floor(_803);
    float _809 = -_805;
    float _811 = _801 + _809;
    float _813 = -_807;
    float _815 = _803 + _813;
    float2 _4137 = float2(_811, _815);
    float _817 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4137, float2(0.0), isnan(_4137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4137, float2(0.0), isnan(_4137)), level(0.0)).x;
    float _819 = _345 * 2.0;
    float _821 = _341 * 2.0;
    float _823 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _825 = log2(_823);
    int _827 = abs(_749);
    float _829 = _343 * 2.0;
    float _831 = -_739;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _835 = -_741;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _533);
    int _839 = abs(_753);
    float _841 = floor(_819);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _845 = 1.0 + _843;
    float _847 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _849 = _833 * _833;
    float _851 = -_761;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _855 = _759 + _847;
    float _857 = fma(_837, _837, _849);
    float _859 = floor(_821);
    float _861 = fma(_853, _853, _857);
    bool _863 = _841 > 0.0;
    float _865 = floor(_829);
    bool _867 = _841 >= 0.0;
    bool _869 = isnan(_841);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    int _877 = abs(_745);
    int _879 = _875 ? 0 : 1;
    bool _881 = _859 > 0.0;
    float _883 = 1.0 / _845;
    int _885 = ~_879;
    int _887 = _885 + 1;
    int _889 = _887 + 1;
    bool _891 = _859 >= 0.0;
    bool _893 = isnan(_859);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = _825 * _149;
    int _903 = _889;
    int _905 = 2;
    if (!_863)
    {
        int _907 = ~_879;
        int _909 = _907 + 1;
        _903 = _909;
    }
    int _911 = _903;
    float _913 = float(_877);
    float _915 = sqrt(_861);
    float _917 = float(_911);
    float _919 = _343 + _345;
    int _921 = _899 ? 0 : 1;
    float _923 = _913 * _917;
    int _925 = ~_921;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = in.m_80.x;
    float _933 = in.m_80.y;
    float _935 = in.m_80.z;
    float _937 = exp2(_901);
    int _939 = _929;
    if (!_881)
    {
        int _941 = ~_921;
        int _943 = _941 + 1;
        _939 = _943;
    }
    int _945 = _939;
    float _947 = _919 + (-1.0);
    bool _949 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(1.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    float _959 = float(_827);
    bool _961 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _963 = isnan(0.0);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _969 = _965 || _967;
    float _971 = _693 * _915;
    float _973 = _343 + _341;
    float _975 = float(_945);
    float _977 = _923 * (-2.0);
    float _979 = _343 + (-0.5);
    float _981 = _973 + (-1.0);
    float _983 = _959 * _975;
    float _985 = -_937;
    float _987 = _985 + 1.0;
    float _989 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _993 = _341 + (-0.5);
    float _995 = _345 + _341;
    float _997 = _969 ? _987 : 0.0;
    float _999 = _345 + (-0.5);
    float _1001 = fma(_977, _931, _931);
    bool _1003 = _865 > 0.0;
    float _1005 = fma(_991, _977, _991);
    if (_957)
    {
        float _1007 = _997 * _883;
        _153 = _1007;
    }
    float _1009 = _153;
    float _1011 = _983 * (-2.0);
    float _1013 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1001);
    bool _1015 = _865 >= 0.0;
    bool _1017 = isnan(_865);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    float _1025 = _995 + (-1.0);
    float _1027 = fma(_989, _1011, _989);
    float _1029 = fma(_1005, _1009, _1013);
    float _1031 = fma(_1011, _933, _933);
    int _1033 = _1023 ? 0 : 1;
    float _1035 = _1029 * 0.15915493667125701904296875;
    float _1037 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1031);
    int _1039 = ~_1033;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = _1035 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    int _1049 = _1043;
    if (!_1003)
    {
        int _1051 = ~_1033;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = fma(_1027, _1009, _1037);
    float _1059 = float(_839);
    float _1061 = float(_1055);
    float _1063 = _1057 * 0.15915493667125701904296875;
    float _1065 = _1035 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1059 * _1061;
    float _1071 = _759 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1073 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1075 = _1069 * (-2.0);
    float _1077 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1071);
    float _1079 = _1063 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = fma(_1075, _935, _935);
    float _1085 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1077);
    float _1087 = fma(_1073, _1075, _1073);
    float _1089 = _759 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1091 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1083);
    float _1093 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1095 = _855 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1097 = _1063 * 6.283185482025146484375;
    float _1099 = cos(_1097);
    float _1101 = fma(_1087, _1009, _1091);
    float _1103 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1089);
    float _1105 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1095);
    float _1107 = _1101 * 0.15915493667125701904296875;
    float _1109 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1103);
    float _1111 = in.m_82.x;
    float _1113 = in.m_82.y;
    float _1115 = 1.0 / _1093;
    float _1117 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1105);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _1067 * _1081;
    float _1123 = _1047 * _1081;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1127 = _1119 + _1093;
    float _1129 = _1107 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1127 * _1115;
    float _1135 = _1133 * 0.5;
    float _1137 = _855 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1139 = _1107 * 6.283185482025146484375;
    float _1141 = cos(_1139);
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1145 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1143);
    float _1147 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1137);
    float _1149 = _291 * _1113;
    float _1151 = _1047 * _1099;
    float _1153 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1147);
    float _1155 = 1.0 / _1145;
    float _1157 = _289 * _1111;
    float _1159 = -_1121;
    float _1161 = fma(_1131, _1151, _1159);
    float _1163 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1165 = -_1151;
    float _1167 = fma(_1131, _1121, _1165);
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1173 = _1067 * _1099;
    float _1175 = trunc(_1125);
    int _1177 = int(_1175);
    float _1179 = _1067 * _1141;
    float _1181 = _1099 * _1141;
    float _1183 = _1047 * _1141;
    float _1185 = _1081 * _1141;
    float _1187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1189 = _971 * _1169;
    float _1191 = fma(_1131, _1173, _1123);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1195 = _1155 * _1193;
    float _1197 = trunc(_1163);
    int _1199 = int(_1197);
    float _1201 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1203 = fma(_1131, _1123, _1173);
    bool _1205 = _1195 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1207 = _971 * _1201;
    bool _1209 = _1195 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1211 = !_1205;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1171 * _1207;
    int _1217 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1219 = _1177 + _1217;
    int _1221 = _1219 + 1;
    float _1223 = _1187 * _1189;
    float _1225 = _1179 * _1215;
    bool _1227 = _1221 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1229 = -_1215;
    float _1231 = _1131 * _1229;
    int _1233 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1235 = _1199 + _1233;
    int _1237 = _1235 + 1;
    float _1239 = fma(_1191, _1223, _1225);
    int _1241 = _1221;
    int _1243 = _1237;
    float _1245 = _1125;
    if (!_1205)
    {
        _905 = 1;
    }
    int _1247 = _905;
    float _1249 = fma(_1181, _1223, _1231);
    int _1251 = _1247;
    if (!_1209)
    {
        _1251 = _1213;
    }
    int _1253 = _1251;
    float _1255 = _971 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1257 = _1255 * 0.5;
    int _1259 = _1221 | _1237;
    float _1261 = _1183 * _1215;
    int _1263 = _1253 << 6;
    float _1265 = fma(_1185, _1257, _1249);
    bool _1267 = _1259 < 0;
    bool _1269 = _1267 || _1227;
    float _1271 = fma(_1161, _1223, _1261);
    int _1273 = _1263 + 96;
    uint _1276 = uint(int(uint(_1273) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c15)._m0[int(_1286)][_1288];
    float _1292 = fma(_1167, _1257, _1239);
    bool _1294 = _1237 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1296 = _1294 || _1269;
    float _1298 = fma(_1203, _1257, _1271);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1308 = _1304 || _1306;
    float _1310 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1312 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1314 = _1263 + 104;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.vp_c15)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    float _1332 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1310);
    float _1334 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1312);
    float _1336 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1338 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1334);
    float _1340 = as_type<float>(_1253);
    if (!_1296)
    {
        int _1342 = _1237 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1344 = _1342 + _1221;
        _1241 = _1344;
    }
    int _1346 = _1241;
    int _1348 = _1263 + 48;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    float _1366 = _1336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1368 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1370 = 0.0;
    float _1372 = as_type<float>(_1346);
    if (!_1296)
    {
        float _1374 = floor(_1125);
        _1370 = _1374;
    }
    float _1376 = _1370;
    int _1378 = 0;
    if (!_1296)
    {
        int _1380 = _1346 << 2;
        _1378 = _1380;
    }
    int _1382 = _1378;
    float _1384 = _497 + _1366;
    int _1386 = _1382;
    float _1388 = _1384;
    if (!_1296)
    {
        uint _1390 = uint(int(uint(_1346) >> uint(2)));
        _1243 = int(_1390);
    }
    int _1392 = _1243;
    float _1394 = _447 + _1368;
    int _1396 = _1263 + 64;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    float _1414 = _1394;
    if (!_1296)
    {
        int _1416 = 12 & _1382;
        _1386 = _1416;
    }
    int _1418 = _1386;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1422 = _1384 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1394 + _1424;
    float _1428 = 0.0;
    if (!_1296)
    {
        int _1430 = _1392 << 4;
        int _1432 = _1430 + _1418;
        _1428 = as_type<float>(_1432);
    }
    float _1434 = _1428;
    float _1436 = _1422 * _1422;
    int _1438 = _1263 + 56;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
    int _1444 = int(_1440) & 3;
    float _1446 = (*spvDescriptorSet0.vp_c15)._m0[int(_1442)][_1444];
    int _1448 = int(_1440) + 1;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    int _1452 = _1448 & 3;
    float _1454 = (*spvDescriptorSet0.vp_c15)._m0[int(_1450)][_1452];
    float _1456 = fma(_1426, _1426, _1436);
    float _1458 = sqrt(_1456);
    int _1460 = _1263 + 72;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[int(_1472)][_1474];
    int _1478 = _1263 + 80;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    float _1496 = _855 * _1290;
    float _1498 = fma(_765, _1282, _1496);
    float _1500 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1502 = _1458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1504 = _1263 + 88;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_773, _1322, _1498);
    float _1524 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1500);
    float _1526 = _1292;
    if (!_1296)
    {
        float _1528 = floor(_1163);
        _1526 = _1528;
    }
    float _1530 = _1526;
    float _1532 = _1522 + _1330;
    float _1534 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1524);
    float _1536 = _1434;
    if (!_1296)
    {
        int _1538 = as_type<int>(_1434) + 400;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
        int _1544 = int(_1540) & 3;
        float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
        _1536 = _1546;
    }
    float _1548 = _1536;
    float _1550 = _855 * _1364;
    float _1552 = 1.0 / _1532;
    float _1554 = fma(_765, _1356, _1550);
    float _1556 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1558 = _855 * _1412;
    float _1560 = _519 + _1556;
    float _1562 = fma(_765, _1404, _1558);
    float _1564 = _1364;
    float _1566 = _1404;
    if (!_1502)
    {
        _1564 = _1560;
    }
    float _1568 = _1564;
    float _1570 = fma(_773, _1446, _1554);
    float _1572 = fma(_773, _1468, _1562);
    bool _1574 = !_1502;
    float _1576 = _1568;
    float _1578 = _1530;
    if (!_1574)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1458 + _1582;
        float _1586 = rsqrt(_1456);
        float _1588 = _1584 * _1580;
        float _1590 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1592 = _1588 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1600, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1606 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = _1586 * _1604;
        float _1610 = fma(_1560, _1596, _1606);
        float _1612 = fma(_1426, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1614 = fma(_1422, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1414 = _1612;
        _1576 = _1610;
        _1388 = _1614;
        _1566 = _1592;
    }
    float _1616 = _1414;
    float _1618 = _1576;
    float _1620 = _1388;
    float _1622 = _1566;
    float _1624 = -_741;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1628 = -_739;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1618);
    float _1632 = -_761;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1620);
    float _1636 = _1570 + _1454;
    float _1638 = _1572 + _1476;
    float _1640 = _1630;
    float _1642 = _1626;
    float _1644 = _1634;
    if (!_1308)
    {
        float _1646 = _769 * _769;
        float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1650 = -_497;
        float _1652 = _1650 + _1620;
        float _1654 = -_519;
        float _1656 = _1654 + _1618;
        float _1658 = fma(_777, _777, _1646);
        float _1660 = fma(_783, _783, _1658);
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1664 = sqrt(_1660);
        float _1666 = 1.0 / _971;
        float _1668 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1670 = precise::min(_1664, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1672 = _1670 * _1648;
        float _1674 = _1672 * _1666;
        float _1676 = -_447;
        float _1678 = _1676 + _1616;
        float _1680 = _1668 * _1674;
        float _1682 = _1652 * _1674;
        float _1684 = fma(_1656, _1680, _759);
        float _1686 = fma(_1678, _1680, _765);
        float _1688 = fma(_1668, _1682, _773);
        _1640 = _1684;
        _1642 = _1686;
        _1644 = _1688;
    }
    float _1690 = _1640;
    float _1692 = _1642;
    float _1694 = _1644;
    float _1696 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = _1636 * _1552;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1696);
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1708 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1710 = _1700 >= 0.0;
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1714 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1718 = _1638 * _1552;
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1722 = _1700 <= 1.0;
    bool _1724 = _1722 && _1710;
    float _1726 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1708);
    float _1732 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1734 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1736 = _1718 >= 0.0;
    bool _1738 = _1736 && _1724;
    float _1740 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1732);
    float _1744 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1746 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1748 = _1718 <= 1.0;
    bool _1750 = _1748 && _1738;
    float _1752 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1754 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1756 = -_1746;
    float _1758 = fma(_1756, _1744, 1.0);
    float _1760 = _855 * _1494;
    float _1762 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1754);
    float _1766 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_765, _1486, _1760);
    float _1770 = log2(_1758);
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1774 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1776 = fma(_773, _1512, _1768);
    float _1778 = _1764;
    if (_1750)
    {
        float _1780 = float(_1253);
        _1340 = _1780;
    }
    float _1782 = _1340;
    float _1784 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1786 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1788 = _1776 + _1520;
    float _1790 = 1.0 / _1764;
    float _1792 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1794 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1786);
    float _1796 = _1786;
    float _1798 = _1792;
    if (!_1296)
    {
        float _1800 = -_1530;
        float _1802 = _1163 + _1800;
        _1578 = _1802;
    }
    float _1804 = _1578;
    if (!_1296)
    {
        float _1806 = -_1376;
        float _1808 = _1125 + _1806;
        _1796 = _1808;
    }
    float _1810 = _1796;
    float _1812 = _1622;
    if (!_1296)
    {
        float _1814 = rint(_1548);
        float _1816 = precise::max(_1814, 0.0);
        uint _1818 = uint(_1816);
        uint _1820 = clamp(_1818, 0u, 65535u);
        _1812 = as_type<float>(_1820);
    }
    float _1822 = _1812;
    float _1824 = _1770 * 0.693147182464599609375;
    float _1826 = _1788 * _1552;
    float _1828 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1830 = _1768;
    float _1832 = _1828;
    if (_1750)
    {
        float _1834 = rint(_1782);
        float _1836 = precise::max(_1834, 0.0);
        uint _1838 = uint(_1836);
        uint _1840 = clamp(_1838, 0u, 65535u);
        _1830 = as_type<float>(_1840);
    }
    float _1842 = _1830;
    float _1844 = _1792 * _1790;
    float _1846 = _1794 * _1790;
    float _1848 = fma(_1844, 0.5, 0.5);
    float _1850 = fma(_1846, -0.5, 0.5);
    float _1852 = _1376;
    float _1854 = _1850;
    float _1856 = _1848;
    if (!_1296)
    {
        float3 _5786 = float3(_1810, _1804, float(as_type<int>(_1822)));
        float3 _5790 = select(_5786, float3(0.0), isnan(_5786));
        float _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5790.xy, uint(rint(_5790.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5790.xy, uint(rint(_5790.z)), level(0.0)).x;
        _1852 = _1858;
    }
    float _1860 = _1852;
    float _1862 = _1718;
    if (_1750)
    {
        float3 _5805 = float3(_1700, _1718, float(as_type<int>(_1842)));
        float3 _5807 = select(_5805, float3(0.0), isnan(_5805));
        float _1864 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5807.xy, uint(rint(_5807.z)), _1826, level(0.0));
        _1862 = _1864;
    }
    float _1866 = _1862;
    float3 _5817 = float3(_1848, _1850, _1828);
    float _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5817, float3(0.0), isnan(_5817)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5817, float3(0.0), isnan(_5817)), level(0.0)).x;
    float3 _5826 = float3(_1848, _1850, _1828);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5826, float3(0.0), isnan(_5826)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5826, float3(0.0), isnan(_5826)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    bool _1881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1883 = isnan(0.5);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1889 = _1885 || _1887;
    if (_1296)
    {
        _791 = 1.0;
    }
    float _1891 = _791;
    float _1893 = _1891;
    if (_1889)
    {
        _1245 = 1.0;
    }
    float _1895 = _1245;
    float _1897 = _1895;
    if (_1889)
    {
        _755 = 1.0;
    }
    float _1899 = _755;
    float _1901 = _1899;
    float _1903 = _1873;
    if (!_1889)
    {
        float _1905 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1911 = _1907 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1909 * 0.15915493667125701904296875;
        float _1917 = _1907 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1913;
        float _1923 = _1915 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = _1915 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = 1.0 / _1933;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1937;
        float _1941 = 1.0 / _1939;
        float _1943 = _1931 * _1935;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = fma(_1195, _1943, _1945);
        float _1949 = _1947 * _1941;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1854 = _1947;
        _1856 = _1915;
        _1901 = _1951;
    }
    float _1953 = _1854;
    float _1955 = _1856;
    float _1957 = _1901;
    float _1959 = _1955;
    float _1961 = _1953;
    if (!_1889)
    {
        float _1963 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1965 = _1963 * 0.15915493667125701904296875;
        float _1967 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1969 = _1965 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1967 * 0.15915493667125701904296875;
        float _1975 = _1965 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = 1.0 / _1971;
        float _1981 = _1973 * 6.283185482025146484375;
        float _1983 = cos(_1981);
        float _1985 = _1977 * _1979;
        float _1987 = _1973 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1983 * _1985;
        float _1993 = 1.0 / _1991;
        float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1997 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1995;
        float _1999 = 1.0 / _1997;
        float _2001 = _1989 * _1993;
        float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2005 = fma(_1195, _2001, _2003);
        float _2007 = _2005 * _1999;
        float _2009 = precise::clamp(_2007, 0.0, 1.0);
        float _2011 = -_2009;
        float _2013 = _2011 + 1.0;
        _1959 = _1991;
        _1961 = _1979;
        _1897 = _2013;
    }
    float _2015 = _1959;
    float _2017 = _1961;
    float _2019 = _1897;
    if (!_1296)
    {
        int _2021 = _1346 << 4;
        int _2023 = _2021 + 2048;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
        int _2029 = int(_2025) & 3;
        float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
        int _2033 = int(_2025) + 1;
        uint _2035 = uint(int(uint(_2033) >> uint(2)));
        int _2037 = _2033 & 3;
        float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
        int _2041 = _2023 + 8;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
        int _2047 = int(_2043) & 3;
        float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
        int _2051 = int(_2043) + 1;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        int _2055 = _2051 & 3;
        float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
        float _2059 = _855 * _2039;
        float _2061 = fma(_765, _2031, _2059);
        float _2063 = fma(_773, _2049, _2061);
        float _2065 = _2063 + _2057;
        float _2067 = precise::clamp(_2065, 0.0, 1.0);
        float _2069 = -_2067;
        float _2071 = _2069 + _1860;
        float _2073 = fma(_2071, 500.0, 1.5);
        float _2075 = exp2(_2073);
        float _2077 = 0.0 + _2075;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        _1372 = as_type<float>(_2023);
        _1893 = _2079;
    }
    float _2081 = _1372;
    float _2083 = _1893;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2087 = _1690 + _2085;
    float _2089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2091 = _1692 + _2089;
    float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2095 = _1694 + _2093;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = rsqrt(_2101);
    float _2105 = sqrt(_2101);
    float _2107 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2109 = _2091 * _2107;
    float _2111 = _2095 * _2107;
    float _2113 = _2109 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 + _2115;
    float _2119 = sqrt(_2117);
    bool _2121 = _2119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = _2119 + _2123;
    float _2127 = _2015;
    float _2129 = _2117;
    float _2131 = _2125;
    float _2133 = _2109;
    float _2135 = _2111;
    float _2137 = _2113;
    float _2139 = _2115;
    if (_2121)
    {
        float _2141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2141;
    }
    float _2143 = _2127;
    if (_2121)
    {
        float _2145 = rsqrt(_2117);
        _2129 = _2145;
    }
    float _2147 = _2129;
    if (_2121)
    {
        float _2149 = _2125 * _2143;
        _2131 = _2149;
    }
    float _2151 = _2131;
    if (_2121)
    {
        float _2153 = _2151 * 0.15915493667125701904296875;
        _1832 = _2153;
    }
    float _2155 = _1832;
    float _2157 = _2017;
    if (_2121)
    {
        float _2159 = _2155 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        _2157 = _2161;
    }
    float _2163 = _2157;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = precise::max(0.0, _2165);
    float _2169 = _2081;
    float _2171 = _2167;
    float _2173 = _2165;
    if (_2121)
    {
        float _2175 = _2155 * 6.283185482025146484375;
        float _2177 = cos(_2175);
        _2169 = _2177;
    }
    float _2179 = _2169;
    float _2181 = -_2107;
    float _2183 = -_2167;
    float _2185 = fma(_2087, _2181, _2183);
    float _2187 = _2185;
    if (_2121)
    {
        float _2189 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2189;
    }
    float _2191 = _2171;
    float _2193 = _2163;
    float _2195 = _2191;
    if (_2121)
    {
        float _2197 = fma(_2163, _2191, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2193 = _2197;
    }
    float _2199 = _2193;
    float _2201 = _2199;
    if (_2121)
    {
        float _2203 = _2179 + (-1.0);
        _2173 = _2203;
    }
    float _2205 = _2173;
    if (_2121)
    {
        float _2207 = _2147 * _2199;
        _2201 = _2207;
    }
    float _2209 = _2201;
    if (_2121)
    {
        float _2211 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2211;
    }
    float _2213 = _2195;
    if (_2121)
    {
        float _2215 = _2109 * _2209;
        _2133 = _2215;
    }
    float _2217 = _2133;
    if (_2121)
    {
        float _2219 = _2111 * _2209;
        _2135 = _2219;
    }
    float _2221 = _2135;
    if (_2121)
    {
        float _2223 = fma(_2185, _2179, _2213);
        _2187 = _2223;
    }
    float _2225 = _2187;
    if (_2121)
    {
        float _2227 = _2217 * _2217;
        _2137 = _2227;
    }
    float _2229 = _2137;
    if (_2121)
    {
        float _2231 = _2221 * _2221;
        _2139 = _2231;
    }
    float _2233 = _2139;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2237 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2235);
    float _2239 = precise::clamp(_2237, 0.0, 1.0);
    float _2241 = fma(_2225, _2225, _2229);
    float _2243 = -_2239;
    float _2245 = _2243 + 1.0;
    float _2247 = _2241 + _2233;
    float _2249 = rsqrt(_2247);
    float _2251 = _2249 * _2225;
    float _2253 = _2249 * _2217;
    float _2255 = abs(_2245);
    float _2257 = log2(_2255);
    float _2259 = _2249 * _2221;
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2263 = -_2261;
    float _2265 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2263);
    float _2267 = -_2259;
    float _2269 = fma(_2267, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2265);
    float _2271 = fma(_2269, -0.5, 0.5);
    float _2273 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2275 = fma(_2269, 0.5, 0.5);
    float _2277 = _2251 + 1.0;
    float _2279 = sqrt(_2271);
    float _2281 = fma(_2275, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2283 = fma(_2275, _2281, -0.212114393711090087890625);
    float _2285 = exp2(_2273);
    float _2287 = fma(_2275, _2283, 1.570728778839111328125);
    float _2289 = _2279 * 0.636619746685028076171875;
    float _2291 = -_2287;
    float _2293 = fma(_2289, _2291, 1.0);
    float _2295 = -_2251;
    float _2297 = fma(_2285, _2277, _2295);
    float _2299 = fma(_2297, 0.5, 0.5);
    float2 _6445 = float2(_2293, _2299);
    float3 _2303 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).xyz;
    float _2305 = _2303.x;
    float _2307 = _2303.y;
    float _2309 = _2303.z;
    float _2311 = abs(_1195);
    float _2313 = log2(_2311);
    float _2315 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2317 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2319 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2321 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2323 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2325 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2315);
    float _2329 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2317);
    float _2331 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2319);
    float _2333 = -_1131;
    float _2335 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2321);
    float _2337 = -_1131;
    float _2339 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2323);
    float _2341 = -_1131;
    float _2343 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    float _2345 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2347 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2349 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2351 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2353 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2355 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2327);
    float _2357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2329);
    float _2359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2331);
    float _2361 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2345);
    float _2363 = exp2(_2351);
    float _2365 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2367 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2347);
    float _2369 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2349);
    float _2371 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2335);
    float _2373 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2339);
    float _2375 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2377 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2343);
    float _2379 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2365);
    float _2381 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2361);
    float _2383 = exp2(_2353);
    float _2385 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2367);
    float _2387 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2369);
    float _2389 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2391 = _2375 * _2371;
    float _2393 = _2375 * _2373;
    float _2395 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2379);
    float _2397 = _2375 * _2377;
    float _2399 = fma(_2389, _2355, _2391);
    float _2401 = fma(_2389, _2357, _2393);
    float _2403 = fma(_2389, _2359, _2397);
    float _2405 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = _1764 * 0.5;
    float _2413 = _1792 + _1764;
    float _2415 = _2405 + _1764;
    float _2417 = fma(_2409, -2.0, 3.0);
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1794;
    out.gl_Position.z = _2405;
    out.gl_Position.w = _1764;
    float _2419 = _2409 * _2409;
    float _2421 = fma(_1794, -0.5, _2411);
    bool _2423 = _1195 <= 8000.0;
    bool _2425 = isnan(_1195);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(8000.0);
    bool _2431 = _2427 || _2429;
    float _2433 = float(_2431);
    float _2435 = _2415 * 0.5;
    float _2437 = _2419 * _2417;
    float _2439 = _2413 * 0.5;
    float _2441 = _2381 + _2399;
    float _2443 = _2385 + _2401;
    float _2445 = _2387 + _2403;
    float _2447 = -_817;
    float _2449 = _2447 + 1.0;
    out.m_84.x = _2439;
    out.m_84.y = _2421;
    out.m_84.z = _2435;
    out.m_84.w = _1764;
    bool _2451 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2453 = isnan(_2105);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2459 = _2455 || _2457;
    float _2461 = -_2383;
    float _2463 = _2461 + 1.0;
    if (!_1750)
    {
        _1798 = 1.0;
    }
    float _2465 = _1798;
    float _2467 = -_2437;
    float _2469 = _2467 + 1.0;
    float _2471 = _2465;
    if (_1750)
    {
        bool _2473 = _1866 >= _1826;
        bool _2475 = isnan(_1866);
        bool _2477 = _2473 || _2475;
        bool _2479 = isnan(_1826);
        bool _2481 = _2477 || _2479;
        float _2483 = float(_2481);
        _2471 = _2483;
    }
    float _2485 = _2471;
    float _2487 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2441;
    out.m_86.y = _2443;
    out.m_86.z = _2445;
    float _2489 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2437);
    float _2491 = _2487 * _1868;
    float _2493 = -_2487;
    float _2495 = _2493 + 1.0;
    float _2497 = _2433 * _2489;
    out.m_88.x = _1692;
    out.m_88.y = _1690;
    out.m_88.z = _1694;
    float _2499 = _1879 * _2491;
    float _2501 = _1879 * _2495;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2505 = _2485 * _2083;
    float _2507 = _2495;
    if (!_2459)
    {
        _1778 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2509 = _1778;
    float _2511 = _2449 * _2503;
    float _2513 = precise::clamp(_2511, 0.0, 1.0);
    float _2515 = _2509;
    float _2517 = _2509;
    if (!_2459)
    {
        _2507 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2519 = _2507;
    float _2521 = -_2513;
    float _2523 = fma(_2521, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2525 = -_2505;
    float _2527 = fma(_2525, _2523, 1.0);
    float _2529 = precise::clamp(_2527, 0.0, 1.0);
    float _2531 = _2523;
    float _2533 = _2519;
    float _2535 = _2519;
    if (!_2459)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2537 = _2531;
    float _2539 = _2529 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _2539;
    float _2541 = _2539;
    float _2543 = _2537;
    float _2545 = _2537;
    if (!_2459)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2547 = _2541;
    float _2549 = _2309 * _2491;
    float _2551 = fma(_2305, _2499, _1873);
    float _2553 = fma(_2307, _2499, _1875);
    float _2555 = _1957 * _2019;
    float _2557 = fma(_1879, _2549, _1877);
    float _2559 = _2555;
    float _2561 = _2547;
    float _2563 = _2547;
    if (!_2459)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2565 = _1903;
    float _2567 = _2555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2569 = _2565;
    float _2571 = _2565;
    if (!_2459)
    {
        _2559 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2573 = _2559;
    out.m_92.x = _2551;
    out.m_92.y = _2553;
    out.m_92.z = _2557;
    out.m_92.w = _2501;
    bool _2575 = !_2459;
    float _2577 = _2573;
    float _2579 = _2573;
    if (!_2575)
    {
        bool _2581 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2583 = isnan(_2105);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2589 = _2585 || _2587;
        if (!_2589)
        {
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2593 = _2105 + _2591;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2595;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2603 = 1.0 / _2597;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2621 = _2593 * _2603;
            float _2623 = precise::clamp(_2621, 0.0, 1.0);
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2629 = fma(_2623, _2601, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2631 = fma(_2623, _2627, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2633 = fma(_2623, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2635 = fma(_2623, _2611, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2637 = fma(_2623, _2615, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2639 = fma(_2623, _2619, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2517 = _2633;
            _2563 = _2637;
            _2571 = _2629;
            _2545 = _2635;
            _2535 = _2631;
            _2579 = _2639;
            _2641 = true;
        }
        else
        {
            bool _2643 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2645 = isnan(_2105);
            bool _2647 = _2643 || _2645;
            bool _2649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2651 = _2647 || _2649;
            if (!_2651)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2653 = _2569;
            _2571 = _2653;
            if (!_2651)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2655 = _2515;
            _2517 = _2655;
            if (!_2651)
            {
                _2533 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2657 = _2533;
            _2535 = _2657;
            if (!_2651)
            {
                _2543 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2659 = _2543;
            _2545 = _2659;
            if (!_2651)
            {
                _2561 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2661 = _2561;
            _2563 = _2661;
            if (!_2651)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2663 = _2577;
            bool _2665 = !_2651;
            _2579 = _2663;
            if (!_2665)
            {
                bool _2667 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2669 = isnan(_2105);
                bool _2671 = _2667 || _2669;
                bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2675 = _2671 || _2673;
                if (!_2675)
                {
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2679 = _2105 + _2677;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2683 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2681;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2689 = 1.0 / _2683;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2707 = _2679 * _2689;
                    float _2709 = precise::clamp(_2707, 0.0, 1.0);
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2715 = fma(_2709, _2687, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2717 = fma(_2709, _2713, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2719 = fma(_2709, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2721 = fma(_2709, _2697, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2723 = fma(_2709, _2701, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2725 = fma(_2709, _2705, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2517 = _2719;
                    _2563 = _2723;
                    _2571 = _2715;
                    _2545 = _2721;
                    _2535 = _2717;
                    _2579 = _2725;
                    _2641 = true;
                }
                else
                {
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2563 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2545 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2535 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2641 = false;
    float _2727 = _2517;
    float _2729 = _2563;
    float _2731 = _2571;
    float _2733 = _2545;
    float _2735 = _2535;
    float _2737 = _2579;
    float _2739 = fma(_2443, -0.5, 0.5);
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = -_2727;
    float _2745 = _2743 + _2729;
    float _2747 = _2567 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2749 = -_2731;
    float _2751 = _2749 + _2733;
    float _2753 = fma(_2741, _2745, _2727);
    out.m_94.x = 0.0;
    float _2755 = -_2735;
    float _2757 = _2755 + _2737;
    float _2759 = fma(_2741, _2751, _2731);
    float _2761 = _2753 * 0.586610972881317138671875;
    out.m_59.x = _2747;
    bool _2763 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2765 = fma(_2741, _2757, _2735);
    float _2767 = fma(_2759, 0.298911988735198974609375, _2761);
    bool _2769 = _1957 > 0.0;
    bool _2771 = isnan(_1957);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan(0.0);
    bool _2777 = _2773 || _2775;
    float _2779 = fma(_2765, 0.114477999508380889892578125, _2767);
    bool _2781 = _2019 <= 0.0;
    bool _2783 = !_2777;
    bool _2785 = _2781 || _2783;
    float _2787 = -_2779;
    float _2789 = _2759 + _2787;
    float _2791 = -_2779;
    float _2793 = _2753 + _2791;
    float _2795 = -_2779;
    float _2797 = _2765 + _2795;
    float _2799 = fma(_2789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    float _2801 = fma(_2793, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    float _2803 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    bool _2805 = !_2763;
    if (!_2805)
    {
        float _2807 = -_1690;
        float _2809 = _2807 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2811 = -_1692;
        float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2815 = -_1694;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2819 = _2809 * _2809;
        float _2821 = fma(_2813, _2813, _2819);
        float _2823 = fma(_2817, _2817, _2821);
        float _2825 = sqrt(_2823);
        float _2827 = rsqrt(_2823);
        float _2829 = -_2825;
        float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2833 = _2831 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        float _2837 = _2813 * _2827;
        float _2839 = _2809 * _2827;
        float _2841 = abs(_2835);
        float _2843 = log2(_2841);
        float _2845 = _2817 * _2827;
        float _2847 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2849 = _2443 * _2839;
        float _2851 = -_2839;
        float _2853 = -_2847;
        float _2855 = fma(_2851, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2853);
        float _2857 = fma(_2441, _2837, _2849);
        float _2859 = -_2845;
        float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2855);
        float _2863 = fma(_2445, _2845, _2857);
        float _2865 = precise::clamp(_2863, 0.0, 1.0);
        float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2869 = _2861 + _2867;
        float _2871 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2873 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = exp2(_2871);
        float _2879 = _2877 * _2875;
        float _2881 = _2865 * _2879;
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2885 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2887 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2883;
        out.m_94.y = _2885;
        out.m_94.z = _2887;
    }
    out.m_96.x = _2799;
    out.m_96.y = _2801;
    out.m_96.z = _2803;
    if (!_2785)
    {
        return out;
    }
    float _2889 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2889;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2641 = false;
    bool _313 = false;
    bool _211 = false;
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
        float _2946 = as_type<float>(_131);
        out.gl_Position.z = _2946;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3015 = as_type<float>(_169);
        out.gl_Position.z = _3015;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_66.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_66.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_56.x;
    float _325 = in.m_56.y;
    float _327 = in.m_56.z;
    float _329 = in.m_68.x;
    float _331 = in.m_68.y;
    float _333 = in.m_68.z;
    float _335 = in.m_68.w;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_66.x;
    float _343 = in.m_66.y;
    float _345 = in.m_66.z;
    float _347 = in.m_66.w;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _355 = _353 != 0;
    float _357 = in.m_70.x;
    float _359 = in.m_70.y;
    float _361 = in.m_70.z;
    float _363 = in.m_70.w;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _371 = _369 != 0;
    float _373 = in.m_72.x;
    float _375 = in.m_72.y;
    float _377 = in.m_72.z;
    float _379 = in.m_72.w;
    float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _383 = _325 * _331;
    bool _385 = _347 > 0.5;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _391 = fma(_323, _329, _383);
    float _393 = _325 * _359;
    float _395 = 1.0 / _389;
    float _397 = fma(_327, _333, _391);
    float _399 = fma(_323, _357, _393);
    float _401 = _325 * _375;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _405 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _407 = fma(_323, _373, _401);
    bool _409 = _341 > 0.5;
    float _411 = fma(_405, -2.0, _403);
    float _413 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _419 = fma(_327, _361, _399);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _421;
    float _425 = -_185;
    int _427 = _409 ? as_type<int>(_425) : as_type<int>(_185);
    float _429 = -_417;
    float _431 = fma(_413, 2.0, _429);
    bool _433 = _343 > 0.5;
    float _435 = _423 * _395;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _321 + _437;
    float _441 = fma(_327, _377, _407);
    float _443 = -_189;
    int _445 = _433 ? as_type<int>(_443) : as_type<int>(_189);
    float _447 = _397 + _335;
    float _449 = _423;
    if (!_371)
    {
        _449 = _345;
    }
    float _451 = _449;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _455 = _451;
    if (_371)
    {
        _455 = _343;
    }
    float _457 = _455;
    float _459 = fma(_435, _439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _461 = !_339;
    float _463 = _461 ? _185 : as_type<float>(_427);
    float _465 = _415 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _467 = !_351;
    float _469 = _467 ? _189 : as_type<float>(_445);
    float _471 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[83].w, _453);
    float _473 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _411);
    float _475 = _381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = -_149;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _481 = _463 + 0.5;
    float _483 = _469 + (-0.5);
    bool _485 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_321);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = _441 + _379;
    float _499 = fma(_475, _481, _479);
    float _501 = -_465;
    float _503 = -_473;
    float _505 = fma(_501, _483, _503);
    bool _507 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _509 = isnan(_321);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _419 + _363;
    float _521 = -_495;
    float _523 = _521 + 1.0;
    float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _527 = _475;
    if (!_371)
    {
        _527 = _343;
    }
    float _529 = _527;
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _447 + _531;
    float _535 = _517 * _523;
    float _537 = _529;
    if (_371)
    {
        _537 = _341;
    }
    float _539 = _537;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _543 = _345 > 0.5;
    float _545 = _459 * _535;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _549 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[83].z, _541);
    float _551 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _553 = -_185;
    int _555 = _543 ? as_type<int>(_553) : as_type<int>(_185);
    float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _559 = _539;
    if (!_371)
    {
        _559 = _345;
    }
    float _561 = _559;
    float _563 = -_547;
    float _565 = fma(_551, 2.0, _563);
    float _567 = _561;
    if (_371)
    {
        _567 = _343;
    }
    float _569 = _567;
    float _571 = -_517;
    float _573 = _571 + 1.0;
    bool _575 = !_355;
    float _577 = _575 ? _185 : as_type<float>(_555);
    float _579 = -_149;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _565);
    float _583 = _569 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _585 = _525 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _587 = _577 + 0.5;
    float _589 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _593 = fma(_585, _587, _581);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _519 + _595;
    float _599 = fma(_583, -2.0, _591);
    float _601 = -_189;
    int _603 = _385 ? as_type<int>(_601) : as_type<int>(_189);
    float _605 = _557 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _607 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _611 = _497 + _609;
    bool _613 = !_367;
    float _615 = _613 ? _189 : as_type<float>(_603);
    float _617 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[28].x, _607);
    float _619 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _599);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _625 = _615 + (-0.5);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].z, _617);
    float _629 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].z, _621);
    float _631 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _549);
    float _633 = -_605;
    float _635 = -_619;
    float _637 = fma(_633, _625, _635);
    float _639 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _623);
    float _641 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[116].x, _589);
    float _643 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _471);
    float _645 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _647 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _639);
    float _649 = -_631;
    float _651 = _649 + 1.0;
    bool _653 = _627 >= 0.0;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = -_647;
    float _661 = _659 + 1.0;
    float _663 = -_643;
    float _665 = _663 + 1.0;
    float _667 = -_657;
    float _669 = fma(_463, _667, _499);
    float _671 = fma(_469, _661, _505);
    float _673 = -_651;
    float _675 = fma(_577, _673, _593);
    float _677 = _597 * _597;
    float _679 = fma(_615, _665, _637);
    float _681 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _683 = fma(_533, _533, _677);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = fma(_611, _611, _683);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = rsqrt(_687);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _697 = _675;
    if (_653)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _699 = _695;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _721 = as_type<int>(_699);
    if (_653)
    {
        float _723 = _699 * 5.0;
        _721 = as_type<int>(_723);
    }
    int _725 = _721;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _729 = _727 != 0;
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _737 = _735 != 0;
    out.m_74.x = _709;
    out.m_74.y = _711;
    out.m_74.z = _713;
    out.m_74.w = _681;
    float _739 = _597 * _693;
    float _741 = _533 * _693;
    out.m_76.x = _715;
    out.m_76.y = _717;
    out.m_76.z = _719;
    out.m_76.w = _685;
    bool _743 = !_729;
    int _745 = _743 ? 0 : 1;
    bool _747 = !_733;
    int _749 = _747 ? 0 : 1;
    out.m_78.x = _669;
    out.m_78.y = _671;
    out.m_78.z = _675;
    out.m_78.w = _679;
    bool _751 = !_737;
    int _753 = _751 ? 0 : 1;
    float _755 = _739;
    if (_653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4006 = as_type<float>(_725);
        out.gl_Position.z = _4006;
    }
    if (_653)
    {
        out.m_59.x = 0.0;
    }
    if (_653)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _757 = -_739;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _519);
    float _761 = _611 * _693;
    float _763 = -_741;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _769 = _759 + _767;
    float _771 = -_761;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _497);
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _777 = _765 + _775;
    float _779 = _769 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _773 + _781;
    float _785 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _779);
    float _787 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[28].z, _785);
    bool _789 = _787 >= 0.0;
    float _791 = _761;
    if (_789)
    {
        _697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _793 = _697;
    int _795 = as_type<int>(_793);
    if (_789)
    {
        out.m_59.x = 0.0;
    }
    if (_789)
    {
        float _797 = _793 * 5.0;
        _795 = as_type<int>(_797);
    }
    int _799 = _795;
    if (_789)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4101 = as_type<float>(_799);
        out.gl_Position.z = _4101;
    }
    if (_789)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _801 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _803 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _805 = floor(_801);
    float _807 = floor(_803);
    float _809 = -_805;
    float _811 = _801 + _809;
    float _813 = -_807;
    float _815 = _803 + _813;
    float2 _4137 = float2(_811, _815);
    float _817 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4137, float2(0.0), isnan(_4137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4137, float2(0.0), isnan(_4137)), level(0.0)).x;
    float _819 = _345 * 2.0;
    float _821 = _341 * 2.0;
    float _823 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _825 = log2(_823);
    int _827 = abs(_749);
    float _829 = _343 * 2.0;
    float _831 = -_739;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _835 = -_741;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _533);
    int _839 = abs(_753);
    float _841 = floor(_819);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _845 = 1.0 + _843;
    float _847 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _849 = _833 * _833;
    float _851 = -_761;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _855 = _759 + _847;
    float _857 = fma(_837, _837, _849);
    float _859 = floor(_821);
    float _861 = fma(_853, _853, _857);
    bool _863 = _841 > 0.0;
    float _865 = floor(_829);
    bool _867 = _841 >= 0.0;
    bool _869 = isnan(_841);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    int _877 = abs(_745);
    int _879 = _875 ? 0 : 1;
    bool _881 = _859 > 0.0;
    float _883 = 1.0 / _845;
    int _885 = ~_879;
    int _887 = _885 + 1;
    int _889 = _887 + 1;
    bool _891 = _859 >= 0.0;
    bool _893 = isnan(_859);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = _825 * _149;
    int _903 = _889;
    int _905 = 2;
    if (!_863)
    {
        int _907 = ~_879;
        int _909 = _907 + 1;
        _903 = _909;
    }
    int _911 = _903;
    float _913 = float(_877);
    float _915 = sqrt(_861);
    float _917 = float(_911);
    float _919 = _343 + _345;
    int _921 = _899 ? 0 : 1;
    float _923 = _913 * _917;
    int _925 = ~_921;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = in.m_80.x;
    float _933 = in.m_80.y;
    float _935 = in.m_80.z;
    float _937 = exp2(_901);
    int _939 = _929;
    if (!_881)
    {
        int _941 = ~_921;
        int _943 = _941 + 1;
        _939 = _943;
    }
    int _945 = _939;
    float _947 = _919 + (-1.0);
    bool _949 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(1.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    float _959 = float(_827);
    bool _961 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _963 = isnan(0.0);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _969 = _965 || _967;
    float _971 = _693 * _915;
    float _973 = _343 + _341;
    float _975 = float(_945);
    float _977 = _923 * (-2.0);
    float _979 = _343 + (-0.5);
    float _981 = _973 + (-1.0);
    float _983 = _959 * _975;
    float _985 = -_937;
    float _987 = _985 + 1.0;
    float _989 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _993 = _341 + (-0.5);
    float _995 = _345 + _341;
    float _997 = _969 ? _987 : 0.0;
    float _999 = _345 + (-0.5);
    float _1001 = fma(_977, _931, _931);
    bool _1003 = _865 > 0.0;
    float _1005 = fma(_991, _977, _991);
    if (_957)
    {
        float _1007 = _997 * _883;
        _153 = _1007;
    }
    float _1009 = _153;
    float _1011 = _983 * (-2.0);
    float _1013 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1001);
    bool _1015 = _865 >= 0.0;
    bool _1017 = isnan(_865);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    float _1025 = _995 + (-1.0);
    float _1027 = fma(_989, _1011, _989);
    float _1029 = fma(_1005, _1009, _1013);
    float _1031 = fma(_1011, _933, _933);
    int _1033 = _1023 ? 0 : 1;
    float _1035 = _1029 * 0.15915493667125701904296875;
    float _1037 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1031);
    int _1039 = ~_1033;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = _1035 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    int _1049 = _1043;
    if (!_1003)
    {
        int _1051 = ~_1033;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = fma(_1027, _1009, _1037);
    float _1059 = float(_839);
    float _1061 = float(_1055);
    float _1063 = _1057 * 0.15915493667125701904296875;
    float _1065 = _1035 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1059 * _1061;
    float _1071 = _759 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1073 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1075 = _1069 * (-2.0);
    float _1077 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1071);
    float _1079 = _1063 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = fma(_1075, _935, _935);
    float _1085 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1077);
    float _1087 = fma(_1073, _1075, _1073);
    float _1089 = _759 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1091 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1083);
    float _1093 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1095 = _855 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1097 = _1063 * 6.283185482025146484375;
    float _1099 = cos(_1097);
    float _1101 = fma(_1087, _1009, _1091);
    float _1103 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1089);
    float _1105 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1095);
    float _1107 = _1101 * 0.15915493667125701904296875;
    float _1109 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1103);
    float _1111 = in.m_82.x;
    float _1113 = in.m_82.y;
    float _1115 = 1.0 / _1093;
    float _1117 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1105);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _1067 * _1081;
    float _1123 = _1047 * _1081;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1127 = _1119 + _1093;
    float _1129 = _1107 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1127 * _1115;
    float _1135 = _1133 * 0.5;
    float _1137 = _855 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1139 = _1107 * 6.283185482025146484375;
    float _1141 = cos(_1139);
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1145 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1143);
    float _1147 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1137);
    float _1149 = _291 * _1113;
    float _1151 = _1047 * _1099;
    float _1153 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1147);
    float _1155 = 1.0 / _1145;
    float _1157 = _289 * _1111;
    float _1159 = -_1121;
    float _1161 = fma(_1131, _1151, _1159);
    float _1163 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1165 = -_1151;
    float _1167 = fma(_1131, _1121, _1165);
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1173 = _1067 * _1099;
    float _1175 = trunc(_1125);
    int _1177 = int(_1175);
    float _1179 = _1067 * _1141;
    float _1181 = _1099 * _1141;
    float _1183 = _1047 * _1141;
    float _1185 = _1081 * _1141;
    float _1187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1189 = _971 * _1169;
    float _1191 = fma(_1131, _1173, _1123);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1195 = _1155 * _1193;
    float _1197 = trunc(_1163);
    int _1199 = int(_1197);
    float _1201 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1203 = fma(_1131, _1123, _1173);
    bool _1205 = _1195 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1207 = _971 * _1201;
    bool _1209 = _1195 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1211 = !_1205;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1171 * _1207;
    int _1217 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1219 = _1177 + _1217;
    int _1221 = _1219 + 1;
    float _1223 = _1187 * _1189;
    float _1225 = _1179 * _1215;
    bool _1227 = _1221 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1229 = -_1215;
    float _1231 = _1131 * _1229;
    int _1233 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1235 = _1199 + _1233;
    int _1237 = _1235 + 1;
    float _1239 = fma(_1191, _1223, _1225);
    int _1241 = _1221;
    int _1243 = _1237;
    float _1245 = _1125;
    if (!_1205)
    {
        _905 = 1;
    }
    int _1247 = _905;
    float _1249 = fma(_1181, _1223, _1231);
    int _1251 = _1247;
    if (!_1209)
    {
        _1251 = _1213;
    }
    int _1253 = _1251;
    float _1255 = _971 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1257 = _1255 * 0.5;
    int _1259 = _1221 | _1237;
    float _1261 = _1183 * _1215;
    int _1263 = _1253 << 6;
    float _1265 = fma(_1185, _1257, _1249);
    bool _1267 = _1259 < 0;
    bool _1269 = _1267 || _1227;
    float _1271 = fma(_1161, _1223, _1261);
    int _1273 = _1263 + 96;
    uint _1276 = uint(int(uint(_1273) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c15)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c15)._m0[int(_1286)][_1288];
    float _1292 = fma(_1167, _1257, _1239);
    bool _1294 = _1237 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1296 = _1294 || _1269;
    float _1298 = fma(_1203, _1257, _1271);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1308 = _1304 || _1306;
    float _1310 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1312 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1314 = _1263 + 104;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.vp_c15)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    float _1332 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1310);
    float _1334 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1312);
    float _1336 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1338 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1334);
    float _1340 = as_type<float>(_1253);
    if (!_1296)
    {
        int _1342 = _1237 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1344 = _1342 + _1221;
        _1241 = _1344;
    }
    int _1346 = _1241;
    int _1348 = _1263 + 48;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    float _1366 = _1336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1368 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1370 = 0.0;
    float _1372 = as_type<float>(_1346);
    if (!_1296)
    {
        float _1374 = floor(_1125);
        _1370 = _1374;
    }
    float _1376 = _1370;
    int _1378 = 0;
    if (!_1296)
    {
        int _1380 = _1346 << 2;
        _1378 = _1380;
    }
    int _1382 = _1378;
    float _1384 = _497 + _1366;
    int _1386 = _1382;
    float _1388 = _1384;
    if (!_1296)
    {
        uint _1390 = uint(int(uint(_1346) >> uint(2)));
        _1243 = int(_1390);
    }
    int _1392 = _1243;
    float _1394 = _447 + _1368;
    int _1396 = _1263 + 64;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    float _1414 = _1394;
    if (!_1296)
    {
        int _1416 = 12 & _1382;
        _1386 = _1416;
    }
    int _1418 = _1386;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1422 = _1384 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1394 + _1424;
    float _1428 = 0.0;
    if (!_1296)
    {
        int _1430 = _1392 << 4;
        int _1432 = _1430 + _1418;
        _1428 = as_type<float>(_1432);
    }
    float _1434 = _1428;
    float _1436 = _1422 * _1422;
    int _1438 = _1263 + 56;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
    int _1444 = int(_1440) & 3;
    float _1446 = (*spvDescriptorSet0.vp_c15)._m0[int(_1442)][_1444];
    int _1448 = int(_1440) + 1;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    int _1452 = _1448 & 3;
    float _1454 = (*spvDescriptorSet0.vp_c15)._m0[int(_1450)][_1452];
    float _1456 = fma(_1426, _1426, _1436);
    float _1458 = sqrt(_1456);
    int _1460 = _1263 + 72;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[int(_1472)][_1474];
    int _1478 = _1263 + 80;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    float _1496 = _855 * _1290;
    float _1498 = fma(_765, _1282, _1496);
    float _1500 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1502 = _1458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1504 = _1263 + 88;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_773, _1322, _1498);
    float _1524 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1500);
    float _1526 = _1292;
    if (!_1296)
    {
        float _1528 = floor(_1163);
        _1526 = _1528;
    }
    float _1530 = _1526;
    float _1532 = _1522 + _1330;
    float _1534 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1524);
    float _1536 = _1434;
    if (!_1296)
    {
        int _1538 = as_type<int>(_1434) + 400;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
        int _1544 = int(_1540) & 3;
        float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
        _1536 = _1546;
    }
    float _1548 = _1536;
    float _1550 = _855 * _1364;
    float _1552 = 1.0 / _1532;
    float _1554 = fma(_765, _1356, _1550);
    float _1556 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1558 = _855 * _1412;
    float _1560 = _519 + _1556;
    float _1562 = fma(_765, _1404, _1558);
    float _1564 = _1364;
    float _1566 = _1404;
    if (!_1502)
    {
        _1564 = _1560;
    }
    float _1568 = _1564;
    float _1570 = fma(_773, _1446, _1554);
    float _1572 = fma(_773, _1468, _1562);
    bool _1574 = !_1502;
    float _1576 = _1568;
    float _1578 = _1530;
    if (!_1574)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1458 + _1582;
        float _1586 = rsqrt(_1456);
        float _1588 = _1584 * _1580;
        float _1590 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1592 = _1588 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1600, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1606 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = _1586 * _1604;
        float _1610 = fma(_1560, _1596, _1606);
        float _1612 = fma(_1426, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1614 = fma(_1422, _1608, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1414 = _1612;
        _1576 = _1610;
        _1388 = _1614;
        _1566 = _1592;
    }
    float _1616 = _1414;
    float _1618 = _1576;
    float _1620 = _1388;
    float _1622 = _1566;
    float _1624 = -_741;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1628 = -_739;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1618);
    float _1632 = -_761;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1620);
    float _1636 = _1570 + _1454;
    float _1638 = _1572 + _1476;
    float _1640 = _1630;
    float _1642 = _1626;
    float _1644 = _1634;
    if (!_1308)
    {
        float _1646 = _769 * _769;
        float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1650 = -_497;
        float _1652 = _1650 + _1620;
        float _1654 = -_519;
        float _1656 = _1654 + _1618;
        float _1658 = fma(_777, _777, _1646);
        float _1660 = fma(_783, _783, _1658);
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1664 = sqrt(_1660);
        float _1666 = 1.0 / _971;
        float _1668 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1670 = precise::min(_1664, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1672 = _1670 * _1648;
        float _1674 = _1672 * _1666;
        float _1676 = -_447;
        float _1678 = _1676 + _1616;
        float _1680 = _1668 * _1674;
        float _1682 = _1652 * _1674;
        float _1684 = fma(_1656, _1680, _759);
        float _1686 = fma(_1678, _1680, _765);
        float _1688 = fma(_1668, _1682, _773);
        _1640 = _1684;
        _1642 = _1686;
        _1644 = _1688;
    }
    float _1690 = _1640;
    float _1692 = _1642;
    float _1694 = _1644;
    float _1696 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = _1636 * _1552;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1696);
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1708 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1710 = _1700 >= 0.0;
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1714 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1718 = _1638 * _1552;
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1722 = _1700 <= 1.0;
    bool _1724 = _1722 && _1710;
    float _1726 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1708);
    float _1732 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1734 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1736 = _1718 >= 0.0;
    bool _1738 = _1736 && _1724;
    float _1740 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1732);
    float _1744 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1746 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1748 = _1718 <= 1.0;
    bool _1750 = _1748 && _1738;
    float _1752 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1754 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1756 = -_1746;
    float _1758 = fma(_1756, _1744, 1.0);
    float _1760 = _855 * _1494;
    float _1762 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1754);
    float _1766 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_765, _1486, _1760);
    float _1770 = log2(_1758);
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1774 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1776 = fma(_773, _1512, _1768);
    float _1778 = _1764;
    if (_1750)
    {
        float _1780 = float(_1253);
        _1340 = _1780;
    }
    float _1782 = _1340;
    float _1784 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1786 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1788 = _1776 + _1520;
    float _1790 = 1.0 / _1764;
    float _1792 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1794 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1786);
    float _1796 = _1786;
    float _1798 = _1792;
    if (!_1296)
    {
        float _1800 = -_1530;
        float _1802 = _1163 + _1800;
        _1578 = _1802;
    }
    float _1804 = _1578;
    if (!_1296)
    {
        float _1806 = -_1376;
        float _1808 = _1125 + _1806;
        _1796 = _1808;
    }
    float _1810 = _1796;
    float _1812 = _1622;
    if (!_1296)
    {
        float _1814 = rint(_1548);
        float _1816 = precise::max(_1814, 0.0);
        uint _1818 = uint(_1816);
        uint _1820 = clamp(_1818, 0u, 65535u);
        _1812 = as_type<float>(_1820);
    }
    float _1822 = _1812;
    float _1824 = _1770 * 0.693147182464599609375;
    float _1826 = _1788 * _1552;
    float _1828 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1830 = _1768;
    float _1832 = _1828;
    if (_1750)
    {
        float _1834 = rint(_1782);
        float _1836 = precise::max(_1834, 0.0);
        uint _1838 = uint(_1836);
        uint _1840 = clamp(_1838, 0u, 65535u);
        _1830 = as_type<float>(_1840);
    }
    float _1842 = _1830;
    float _1844 = _1792 * _1790;
    float _1846 = _1794 * _1790;
    float _1848 = fma(_1844, 0.5, 0.5);
    float _1850 = fma(_1846, -0.5, 0.5);
    float _1852 = _1376;
    float _1854 = _1850;
    float _1856 = _1848;
    if (!_1296)
    {
        float3 _5786 = float3(_1810, _1804, float(as_type<int>(_1822)));
        float3 _5790 = select(_5786, float3(0.0), isnan(_5786));
        float _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5790.xy, uint(rint(_5790.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5790.xy, uint(rint(_5790.z)), level(0.0)).x;
        _1852 = _1858;
    }
    float _1860 = _1852;
    float _1862 = _1718;
    if (_1750)
    {
        float3 _5805 = float3(_1700, _1718, float(as_type<int>(_1842)));
        float3 _5807 = select(_5805, float3(0.0), isnan(_5805));
        float _1864 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5807.xy, uint(rint(_5807.z)), _1826, level(0.0));
        _1862 = _1864;
    }
    float _1866 = _1862;
    float3 _5817 = float3(_1848, _1850, _1828);
    float _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5817, float3(0.0), isnan(_5817)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5817, float3(0.0), isnan(_5817)), level(0.0)).x;
    float3 _5826 = float3(_1848, _1850, _1828);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5826, float3(0.0), isnan(_5826)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5826, float3(0.0), isnan(_5826)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    bool _1881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1883 = isnan(0.5);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1889 = _1885 || _1887;
    if (_1296)
    {
        _791 = 1.0;
    }
    float _1891 = _791;
    float _1893 = _1891;
    if (_1889)
    {
        _1245 = 1.0;
    }
    float _1895 = _1245;
    float _1897 = _1895;
    if (_1889)
    {
        _755 = 1.0;
    }
    float _1899 = _755;
    float _1901 = _1899;
    float _1903 = _1873;
    if (!_1889)
    {
        float _1905 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1911 = _1907 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1909 * 0.15915493667125701904296875;
        float _1917 = _1907 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1913;
        float _1923 = _1915 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = _1915 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = 1.0 / _1933;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1937;
        float _1941 = 1.0 / _1939;
        float _1943 = _1931 * _1935;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = fma(_1195, _1943, _1945);
        float _1949 = _1947 * _1941;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1854 = _1947;
        _1856 = _1915;
        _1901 = _1951;
    }
    float _1953 = _1854;
    float _1955 = _1856;
    float _1957 = _1901;
    float _1959 = _1955;
    float _1961 = _1953;
    if (!_1889)
    {
        float _1963 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1965 = _1963 * 0.15915493667125701904296875;
        float _1967 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1969 = _1965 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1967 * 0.15915493667125701904296875;
        float _1975 = _1965 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = 1.0 / _1971;
        float _1981 = _1973 * 6.283185482025146484375;
        float _1983 = cos(_1981);
        float _1985 = _1977 * _1979;
        float _1987 = _1973 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1983 * _1985;
        float _1993 = 1.0 / _1991;
        float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1997 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1995;
        float _1999 = 1.0 / _1997;
        float _2001 = _1989 * _1993;
        float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2005 = fma(_1195, _2001, _2003);
        float _2007 = _2005 * _1999;
        float _2009 = precise::clamp(_2007, 0.0, 1.0);
        float _2011 = -_2009;
        float _2013 = _2011 + 1.0;
        _1959 = _1991;
        _1961 = _1979;
        _1897 = _2013;
    }
    float _2015 = _1959;
    float _2017 = _1961;
    float _2019 = _1897;
    if (!_1296)
    {
        int _2021 = _1346 << 4;
        int _2023 = _2021 + 2048;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
        int _2029 = int(_2025) & 3;
        float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
        int _2033 = int(_2025) + 1;
        uint _2035 = uint(int(uint(_2033) >> uint(2)));
        int _2037 = _2033 & 3;
        float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
        int _2041 = _2023 + 8;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
        int _2047 = int(_2043) & 3;
        float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
        int _2051 = int(_2043) + 1;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        int _2055 = _2051 & 3;
        float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
        float _2059 = _855 * _2039;
        float _2061 = fma(_765, _2031, _2059);
        float _2063 = fma(_773, _2049, _2061);
        float _2065 = _2063 + _2057;
        float _2067 = precise::clamp(_2065, 0.0, 1.0);
        float _2069 = -_2067;
        float _2071 = _2069 + _1860;
        float _2073 = fma(_2071, 500.0, 1.5);
        float _2075 = exp2(_2073);
        float _2077 = 0.0 + _2075;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        _1372 = as_type<float>(_2023);
        _1893 = _2079;
    }
    float _2081 = _1372;
    float _2083 = _1893;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2087 = _1690 + _2085;
    float _2089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2091 = _1692 + _2089;
    float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2095 = _1694 + _2093;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = rsqrt(_2101);
    float _2105 = sqrt(_2101);
    float _2107 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2109 = _2091 * _2107;
    float _2111 = _2095 * _2107;
    float _2113 = _2109 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 + _2115;
    float _2119 = sqrt(_2117);
    bool _2121 = _2119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = _2119 + _2123;
    float _2127 = _2015;
    float _2129 = _2117;
    float _2131 = _2125;
    float _2133 = _2109;
    float _2135 = _2111;
    float _2137 = _2113;
    float _2139 = _2115;
    if (_2121)
    {
        float _2141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2141;
    }
    float _2143 = _2127;
    if (_2121)
    {
        float _2145 = rsqrt(_2117);
        _2129 = _2145;
    }
    float _2147 = _2129;
    if (_2121)
    {
        float _2149 = _2125 * _2143;
        _2131 = _2149;
    }
    float _2151 = _2131;
    if (_2121)
    {
        float _2153 = _2151 * 0.15915493667125701904296875;
        _1832 = _2153;
    }
    float _2155 = _1832;
    float _2157 = _2017;
    if (_2121)
    {
        float _2159 = _2155 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        _2157 = _2161;
    }
    float _2163 = _2157;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = precise::max(0.0, _2165);
    float _2169 = _2081;
    float _2171 = _2167;
    float _2173 = _2165;
    if (_2121)
    {
        float _2175 = _2155 * 6.283185482025146484375;
        float _2177 = cos(_2175);
        _2169 = _2177;
    }
    float _2179 = _2169;
    float _2181 = -_2107;
    float _2183 = -_2167;
    float _2185 = fma(_2087, _2181, _2183);
    float _2187 = _2185;
    if (_2121)
    {
        float _2189 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2189;
    }
    float _2191 = _2171;
    float _2193 = _2163;
    float _2195 = _2191;
    if (_2121)
    {
        float _2197 = fma(_2163, _2191, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2193 = _2197;
    }
    float _2199 = _2193;
    float _2201 = _2199;
    if (_2121)
    {
        float _2203 = _2179 + (-1.0);
        _2173 = _2203;
    }
    float _2205 = _2173;
    if (_2121)
    {
        float _2207 = _2147 * _2199;
        _2201 = _2207;
    }
    float _2209 = _2201;
    if (_2121)
    {
        float _2211 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2211;
    }
    float _2213 = _2195;
    if (_2121)
    {
        float _2215 = _2109 * _2209;
        _2133 = _2215;
    }
    float _2217 = _2133;
    if (_2121)
    {
        float _2219 = _2111 * _2209;
        _2135 = _2219;
    }
    float _2221 = _2135;
    if (_2121)
    {
        float _2223 = fma(_2185, _2179, _2213);
        _2187 = _2223;
    }
    float _2225 = _2187;
    if (_2121)
    {
        float _2227 = _2217 * _2217;
        _2137 = _2227;
    }
    float _2229 = _2137;
    if (_2121)
    {
        float _2231 = _2221 * _2221;
        _2139 = _2231;
    }
    float _2233 = _2139;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2237 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2235);
    float _2239 = precise::clamp(_2237, 0.0, 1.0);
    float _2241 = fma(_2225, _2225, _2229);
    float _2243 = -_2239;
    float _2245 = _2243 + 1.0;
    float _2247 = _2241 + _2233;
    float _2249 = rsqrt(_2247);
    float _2251 = _2249 * _2225;
    float _2253 = _2249 * _2217;
    float _2255 = abs(_2245);
    float _2257 = log2(_2255);
    float _2259 = _2249 * _2221;
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2263 = -_2261;
    float _2265 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2263);
    float _2267 = -_2259;
    float _2269 = fma(_2267, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2265);
    float _2271 = fma(_2269, -0.5, 0.5);
    float _2273 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2275 = fma(_2269, 0.5, 0.5);
    float _2277 = _2251 + 1.0;
    float _2279 = sqrt(_2271);
    float _2281 = fma(_2275, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2283 = fma(_2275, _2281, -0.212114393711090087890625);
    float _2285 = exp2(_2273);
    float _2287 = fma(_2275, _2283, 1.570728778839111328125);
    float _2289 = _2279 * 0.636619746685028076171875;
    float _2291 = -_2287;
    float _2293 = fma(_2289, _2291, 1.0);
    float _2295 = -_2251;
    float _2297 = fma(_2285, _2277, _2295);
    float _2299 = fma(_2297, 0.5, 0.5);
    float2 _6445 = float2(_2293, _2299);
    float3 _2303 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).xyz;
    float _2305 = _2303.x;
    float _2307 = _2303.y;
    float _2309 = _2303.z;
    float _2311 = abs(_1195);
    float _2313 = log2(_2311);
    float _2315 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2317 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2319 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2321 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2323 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2325 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2315);
    float _2329 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2317);
    float _2331 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2319);
    float _2333 = -_1131;
    float _2335 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2321);
    float _2337 = -_1131;
    float _2339 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2323);
    float _2341 = -_1131;
    float _2343 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    float _2345 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2347 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2349 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2351 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2353 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2355 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2327);
    float _2357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2329);
    float _2359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2331);
    float _2361 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2345);
    float _2363 = exp2(_2351);
    float _2365 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2367 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2347);
    float _2369 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2349);
    float _2371 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2335);
    float _2373 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2339);
    float _2375 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2377 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2343);
    float _2379 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2365);
    float _2381 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2361);
    float _2383 = exp2(_2353);
    float _2385 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2367);
    float _2387 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2369);
    float _2389 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2391 = _2375 * _2371;
    float _2393 = _2375 * _2373;
    float _2395 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2379);
    float _2397 = _2375 * _2377;
    float _2399 = fma(_2389, _2355, _2391);
    float _2401 = fma(_2389, _2357, _2393);
    float _2403 = fma(_2389, _2359, _2397);
    float _2405 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = _1764 * 0.5;
    float _2413 = _1792 + _1764;
    float _2415 = _2405 + _1764;
    float _2417 = fma(_2409, -2.0, 3.0);
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1794;
    out.gl_Position.z = _2405;
    out.gl_Position.w = _1764;
    float _2419 = _2409 * _2409;
    float _2421 = fma(_1794, -0.5, _2411);
    bool _2423 = _1195 <= 8000.0;
    bool _2425 = isnan(_1195);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(8000.0);
    bool _2431 = _2427 || _2429;
    float _2433 = float(_2431);
    float _2435 = _2415 * 0.5;
    float _2437 = _2419 * _2417;
    float _2439 = _2413 * 0.5;
    float _2441 = _2381 + _2399;
    float _2443 = _2385 + _2401;
    float _2445 = _2387 + _2403;
    float _2447 = -_817;
    float _2449 = _2447 + 1.0;
    out.m_84.x = _2439;
    out.m_84.y = _2421;
    out.m_84.z = _2435;
    out.m_84.w = _1764;
    bool _2451 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2453 = isnan(_2105);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2459 = _2455 || _2457;
    float _2461 = -_2383;
    float _2463 = _2461 + 1.0;
    if (!_1750)
    {
        _1798 = 1.0;
    }
    float _2465 = _1798;
    float _2467 = -_2437;
    float _2469 = _2467 + 1.0;
    float _2471 = _2465;
    if (_1750)
    {
        bool _2473 = _1866 >= _1826;
        bool _2475 = isnan(_1866);
        bool _2477 = _2473 || _2475;
        bool _2479 = isnan(_1826);
        bool _2481 = _2477 || _2479;
        float _2483 = float(_2481);
        _2471 = _2483;
    }
    float _2485 = _2471;
    float _2487 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2441;
    out.m_86.y = _2443;
    out.m_86.z = _2445;
    float _2489 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2437);
    float _2491 = _2487 * _1868;
    float _2493 = -_2487;
    float _2495 = _2493 + 1.0;
    float _2497 = _2433 * _2489;
    out.m_88.x = _1692;
    out.m_88.y = _1690;
    out.m_88.z = _1694;
    float _2499 = _1879 * _2491;
    float _2501 = _1879 * _2495;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2505 = _2485 * _2083;
    float _2507 = _2495;
    if (!_2459)
    {
        _1778 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2509 = _1778;
    float _2511 = _2449 * _2503;
    float _2513 = precise::clamp(_2511, 0.0, 1.0);
    float _2515 = _2509;
    float _2517 = _2509;
    if (!_2459)
    {
        _2507 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2519 = _2507;
    float _2521 = -_2513;
    float _2523 = fma(_2521, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2525 = -_2505;
    float _2527 = fma(_2525, _2523, 1.0);
    float _2529 = precise::clamp(_2527, 0.0, 1.0);
    float _2531 = _2523;
    float _2533 = _2519;
    float _2535 = _2519;
    if (!_2459)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2537 = _2531;
    float _2539 = _2529 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _2539;
    float _2541 = _2539;
    float _2543 = _2537;
    float _2545 = _2537;
    if (!_2459)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2547 = _2541;
    float _2549 = _2309 * _2491;
    float _2551 = fma(_2305, _2499, _1873);
    float _2553 = fma(_2307, _2499, _1875);
    float _2555 = _1957 * _2019;
    float _2557 = fma(_1879, _2549, _1877);
    float _2559 = _2555;
    float _2561 = _2547;
    float _2563 = _2547;
    if (!_2459)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2565 = _1903;
    float _2567 = _2555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2569 = _2565;
    float _2571 = _2565;
    if (!_2459)
    {
        _2559 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2573 = _2559;
    out.m_92.x = _2551;
    out.m_92.y = _2553;
    out.m_92.z = _2557;
    out.m_92.w = _2501;
    bool _2575 = !_2459;
    float _2577 = _2573;
    float _2579 = _2573;
    if (!_2575)
    {
        bool _2581 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2583 = isnan(_2105);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2589 = _2585 || _2587;
        if (!_2589)
        {
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2593 = _2105 + _2591;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2595;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2603 = 1.0 / _2597;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2621 = _2593 * _2603;
            float _2623 = precise::clamp(_2621, 0.0, 1.0);
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2629 = fma(_2623, _2601, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2631 = fma(_2623, _2627, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2633 = fma(_2623, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2635 = fma(_2623, _2611, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2637 = fma(_2623, _2615, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2639 = fma(_2623, _2619, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2517 = _2633;
            _2563 = _2637;
            _2571 = _2629;
            _2545 = _2635;
            _2535 = _2631;
            _2579 = _2639;
            _2641 = true;
        }
        else
        {
            bool _2643 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2645 = isnan(_2105);
            bool _2647 = _2643 || _2645;
            bool _2649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2651 = _2647 || _2649;
            if (!_2651)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2653 = _2569;
            _2571 = _2653;
            if (!_2651)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2655 = _2515;
            _2517 = _2655;
            if (!_2651)
            {
                _2533 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2657 = _2533;
            _2535 = _2657;
            if (!_2651)
            {
                _2543 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2659 = _2543;
            _2545 = _2659;
            if (!_2651)
            {
                _2561 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2661 = _2561;
            _2563 = _2661;
            if (!_2651)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2663 = _2577;
            bool _2665 = !_2651;
            _2579 = _2663;
            if (!_2665)
            {
                bool _2667 = _2105 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2669 = isnan(_2105);
                bool _2671 = _2667 || _2669;
                bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2675 = _2671 || _2673;
                if (!_2675)
                {
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2679 = _2105 + _2677;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2683 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2681;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2689 = 1.0 / _2683;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2707 = _2679 * _2689;
                    float _2709 = precise::clamp(_2707, 0.0, 1.0);
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2715 = fma(_2709, _2687, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2717 = fma(_2709, _2713, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2719 = fma(_2709, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2721 = fma(_2709, _2697, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2723 = fma(_2709, _2701, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2725 = fma(_2709, _2705, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2517 = _2719;
                    _2563 = _2723;
                    _2571 = _2715;
                    _2545 = _2721;
                    _2535 = _2717;
                    _2579 = _2725;
                    _2641 = true;
                }
                else
                {
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2563 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2545 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2535 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2641 = false;
    float _2727 = _2517;
    float _2729 = _2563;
    float _2731 = _2571;
    float _2733 = _2545;
    float _2735 = _2535;
    float _2737 = _2579;
    float _2739 = fma(_2443, -0.5, 0.5);
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = -_2727;
    float _2745 = _2743 + _2729;
    float _2747 = _2567 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2749 = -_2731;
    float _2751 = _2749 + _2733;
    float _2753 = fma(_2741, _2745, _2727);
    out.m_94.x = 0.0;
    float _2755 = -_2735;
    float _2757 = _2755 + _2737;
    float _2759 = fma(_2741, _2751, _2731);
    float _2761 = _2753 * 0.586610972881317138671875;
    out.m_59.x = _2747;
    bool _2763 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2765 = fma(_2741, _2757, _2735);
    float _2767 = fma(_2759, 0.298911988735198974609375, _2761);
    bool _2769 = _1957 > 0.0;
    bool _2771 = isnan(_1957);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan(0.0);
    bool _2777 = _2773 || _2775;
    float _2779 = fma(_2765, 0.114477999508380889892578125, _2767);
    bool _2781 = _2019 <= 0.0;
    bool _2783 = !_2777;
    bool _2785 = _2781 || _2783;
    float _2787 = -_2779;
    float _2789 = _2759 + _2787;
    float _2791 = -_2779;
    float _2793 = _2753 + _2791;
    float _2795 = -_2779;
    float _2797 = _2765 + _2795;
    float _2799 = fma(_2789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    float _2801 = fma(_2793, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    float _2803 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2779);
    bool _2805 = !_2763;
    if (!_2805)
    {
        float _2807 = -_1690;
        float _2809 = _2807 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2811 = -_1692;
        float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2815 = -_1694;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2819 = _2809 * _2809;
        float _2821 = fma(_2813, _2813, _2819);
        float _2823 = fma(_2817, _2817, _2821);
        float _2825 = sqrt(_2823);
        float _2827 = rsqrt(_2823);
        float _2829 = -_2825;
        float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2833 = _2831 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        float _2837 = _2813 * _2827;
        float _2839 = _2809 * _2827;
        float _2841 = abs(_2835);
        float _2843 = log2(_2841);
        float _2845 = _2817 * _2827;
        float _2847 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2849 = _2443 * _2839;
        float _2851 = -_2839;
        float _2853 = -_2847;
        float _2855 = fma(_2851, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2853);
        float _2857 = fma(_2441, _2837, _2849);
        float _2859 = -_2845;
        float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2855);
        float _2863 = fma(_2445, _2845, _2857);
        float _2865 = precise::clamp(_2863, 0.0, 1.0);
        float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2869 = _2861 + _2867;
        float _2871 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2873 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = exp2(_2871);
        float _2879 = _2877 * _2875;
        float _2881 = _2865 * _2879;
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2885 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2887 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2883;
        out.m_94.y = _2885;
        out.m_94.z = _2887;
    }
    out.m_96.x = _2799;
    out.m_96.y = _2801;
    out.m_96.z = _2803;
    if (!_2785)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2889 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2889;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

