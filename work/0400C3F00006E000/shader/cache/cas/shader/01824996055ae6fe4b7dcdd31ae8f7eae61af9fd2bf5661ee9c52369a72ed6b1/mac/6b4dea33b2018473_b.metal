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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3995 = false;
    bool _947 = false;
    bool _775 = false;
    bool _557 = false;
    bool _381 = false;
    bool _233 = false;
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
        float _4280 = as_type<float>(_131);
        out.gl_Position.z = _4280;
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
        float _4349 = as_type<float>(_167);
        out.gl_Position.z = _4349;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_66.x;
    float _173 = in.m_66.y;
    float _175 = in.m_66.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    float _199 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_179;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_183;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_68.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_115);
        float _237 = 1.0 / _235;
        float _239 = _149 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_257;
    float _269 = _267 + 1.0;
    float _271 = 1.0 / _261;
    bool _273 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_241);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _287 = 1.0 / _265;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = _245 * _271;
    bool _295 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_241);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _241 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_291, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _305 * _269;
    float _319 = -_305;
    float _321 = _319 + 1.0;
    float _323 = fma(_313, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _309 * _287;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _283 * _321;
    float _333 = -_283;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = _323 * _331;
    float _345 = _315 * _331;
    float _347 = fma(_339, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _353 = fma(_341, _317, _349);
    float _355 = fma(_347, _317, _351);
    float _357 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    bool _361 = !_285;
    float _379;
    if (!_361)
    {
        float _363 = in.m_68.x;
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _363 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        float _383 = float(_115);
        float _385 = 1.0 / _383;
        float _387 = _149 * _385;
        _379 = _387;
    }
    _381 = false;
    float _389 = _379;
    float _391 = in.m_70.x;
    float _393 = in.m_70.y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _389 + _395;
    bool _399 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _411;
    float _415 = -_409;
    float _417 = _415 + 1.0;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _413;
    float _423 = _359 * _393;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _429 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _431 = isnan(_389);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _357 * _391;
    float _443 = _397 * _421;
    float _445 = 1.0 / _427;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _389 + _447;
    bool _451 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _453 = isnan(_389);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = _461 * _417;
    float _469 = -_461;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _477;
    float _481 = fma(_465, _443, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _483 = _439 * _471;
    float _485 = fma(_475, _443, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_479, _443, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = -_439;
    float _491 = _489 + 1.0;
    float _493 = _449 * _445;
    float _495 = _485 * _483;
    float _497 = _481 * _483;
    float _499 = _487 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].x, _495);
    float _515 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _517 = fma(_503, _493, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _519 = fma(_507, _493, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _521 = fma(_511, _493, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _523 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].z, _499);
    float _525 = fma(_517, _467, _513);
    float _527 = fma(_519, _467, _515);
    float _529 = fma(_521, _467, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _525);
    float _533 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _527);
    float _535 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _529);
    bool _537 = !_419;
    float _555;
    if (!_537)
    {
        float _539 = in.m_68.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_115);
        float _561 = 1.0 / _559;
        float _563 = _149 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _565 + _567;
    float _571 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _585 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _587 = isnan(_565);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _575;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _603 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _605 = isnan(_565);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _621 = 1.0 / _583;
    float _623 = _579 * _597;
    bool _625 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _601;
    float _639 = -_595;
    float _641 = _639 + 1.0;
    float _643 = fma(_623, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _649 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _651 = isnan(_565);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_635;
    float _663 = _661 + 1.0;
    float _665 = _635 * _641;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _671 = 1.0 / _647;
    float _673 = -_659;
    float _675 = _673 + 1.0;
    float _677 = _613 * _663;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _679;
    float _683 = _669 * _621;
    float _685 = _595 * _675;
    float _687 = _643 * _677;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _565 + _689;
    float _693 = -_613;
    float _695 = _693 + 1.0;
    bool _697 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _699 = isnan(_565);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _681 * _637;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _717 = _565 + _715;
    float _719 = fma(_683, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _687);
    float _723 = -_707;
    float _725 = _723 + 1.0;
    float _727 = _713 * _671;
    float _729 = fma(_709, _717, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _733 = _565 + _731;
    float _735 = fma(_719, _665, _721);
    float _737 = _659 * _725;
    float _739 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = fma(_727, _733, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _743 = fma(_729, _685, _735);
    float _745 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = fma(_741, _737, _743);
    float _749 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[119].x, _747);
    float _751 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _749 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _739;
    out.m_72.y = _745;
    out.m_72.z = _751;
    out.m_72.w = _753;
    bool _755 = !_619;
    float _773;
    if (!_755)
    {
        float _757 = in.m_68.x;
        float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _761 = _757 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _765 = _763 * _759;
        float _767 = floor(_765);
        float _769 = -_767;
        float _771 = _765 + _769;
        _773 = _771;
        _775 = true;
    }
    else
    {
        float _777 = float(_115);
        float _779 = 1.0 / _777;
        float _781 = _149 * _779;
        _773 = _781;
    }
    _775 = false;
    float _783 = _773;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = _783 + _785;
    bool _789 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _791 = isnan(_783);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    bool _801 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _803 = isnan(_783);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _821 = 1.0 / _815;
    bool _823 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _825 = 1.0 / _819;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _827;
    float _831 = _787 * _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _835 = _783 + _833;
    bool _837 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _839 = isnan(_783);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_799;
    float _851 = _849 + 1.0;
    float _853 = fma(_829, _831, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _855 = _847 * _851;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _865;
    float _869 = _811 * _859;
    float _871 = fma(_863, _831, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _873 = fma(_867, _831, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _875 = _835 * _825;
    float _877 = _853 * _869;
    float _879 = _871 * _869;
    float _881 = _873 * _869;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _891 = -_811;
    float _893 = _891 + 1.0;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _899 = fma(_885, _875, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _901 = fma(_889, _875, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].x, _879);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].y, _877);
    float _907 = fma(_897, _875, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].z, _881);
    float _911 = fma(_899, _855, _903);
    float _913 = fma(_901, _855, _905);
    float _915 = fma(_907, _855, _909);
    float _917 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].x, _911);
    float _919 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].y, _913);
    float _921 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].z, _915);
    bool _923 = !_823;
    float _925 = _913;
    float _927 = _917;
    float _945;
    if (!_923)
    {
        float _929 = in.m_68.x;
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _933 = _929 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _937 = _935 * _931;
        float _939 = floor(_937);
        float _941 = -_939;
        float _943 = _937 + _941;
        _945 = _943;
        _947 = true;
    }
    else
    {
        float _949 = float(_115);
        float _951 = 1.0 / _949;
        float _953 = _149 * _951;
        _945 = _953;
    }
    _947 = false;
    float _955 = _945;
    float _957 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _959 = int(_957);
    float _961 = in.m_68.x;
    float _963 = in.m_68.y;
    float _965 = in.m_68.z;
    float _967 = in.m_68.w;
    float _969 = float(_115);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _973 = _955 + _971;
    float _975 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _985 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _989 = float(_959);
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _993 = int(_991);
    float _995 = float(uint(_979));
    float _997 = 1.0 / _989;
    int _999 = ~_979;
    int _1001 = _999 + 1;
    float _1003 = _963 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1005 = _979 == 0;
    float _1007 = fma(_1003, -2.0, _987);
    bool _1009 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1011 = isnan(_955);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _995;
    float _1023 = float(uint(_993));
    float _1025 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1007);
    float _1027 = _149 * _997;
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1031 = int(_1029);
    int _1033 = ~_979;
    int _1035 = _1033 + 1;
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = trunc(_1027);
    int _1041 = int(_1039);
    float _1043 = float(_1031);
    float _1045 = 1.0 / _1023;
    float _1047 = float(uint(_1041));
    float _1049 = 1.0 / _1043;
    float _1051 = as_type<float>(_1037) * _1047;
    float _1053 = trunc(_1051);
    float _1055 = precise::max(_1053, 0.0);
    uint _1058 = uint(_1055);
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>(_1045) + (-2);
    int _1066 = ~_993;
    int _1068 = _1066 + 1;
    float _1070 = _149 * _1049;
    float _1072 = float(_979);
    float _1074 = 1.0 / _969;
    float _1076 = float(_1041);
    float _1078 = _1043;
    float _1080 = _1025;
    float _1082 = _961;
    float _1084 = _965;
    if (_1062)
    {
        float _1086 = in.m_68.x;
        _925 = _1086;
    }
    float _1088 = _925;
    if (_1062)
    {
        _1078 = 1.0;
    }
    float _1090 = _1078;
    int _1092 = _1035 * int(_1058);
    int _1094 = _1092 + _1041;
    float _1096 = _1090;
    if (!_1062)
    {
        _1096 = 1.2345600128173828125;
    }
    float _1098 = _1096;
    float _1100 = _1088;
    if (!_1062)
    {
        float _1102 = in.m_68.y;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = trunc(_1070);
    int _1108 = int(_1106);
    bool _1110 = _1076 >= _1072;
    bool _1112 = isnan(_1076);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(_1072);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = float(uint(_1094));
    float _1124 = as_type<float>(_1037) * _1122;
    float _1126 = _1122;
    if (_1062)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = trunc(_1120);
    int _1132 = int(_1130);
    float _1134 = _1128;
    if (!_1062)
    {
        _1134 = 7.345489978790283203125;
    }
    float _1136 = _1134;
    float _1138 = _1136 * _961;
    float _1140 = trunc(_1124);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    float _1146 = 1.0 / _983;
    int _1148 = int(_1058) + int(_1144);
    float _1150 = floor(_1138);
    int _1152 = _1001 * _1148;
    int _1154 = _1152 + _1041;
    bool _1156 = uint(_1154) >= uint(_979);
    float _1158 = _1104 * _1098;
    float _1160 = float(uint(_1108));
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = floor(_1158);
    float _1168 = as_type<float>(_1064) * _1160;
    int _1170 = ~_1148;
    int _1172 = _1170 + _1164;
    int _1174 = _1172 + 1;
    float _1176 = -_1150;
    float _1178 = _1138 + _1176;
    int _1180 = ~_1132;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _979 + (-1);
    int _1188 = _979 * _1174;
    int _1190 = _1188 + _1041;
    float _1192 = trunc(_1168);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    bool _1198 = !_1005;
    int _1200 = _1198 ? _1190 : (-1);
    float _1202 = -_1166;
    float _1204 = _1158 + _1202;
    int _1206 = _1200 * _1184;
    float _1208 = _1178 * _1072;
    float _1210 = _149 * _1074;
    int _1212 = _1132 * _1186;
    int _1214 = _1212 + _1206;
    float _1216 = _1210 * _1072;
    int _1218 = _1068 * int(_1196);
    int _1220 = _1218 + _1108;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1228 = _1226 != 0;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1208);
    int _1236 = int(_1234);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1240 = _1238 != 0;
    float _1242 = float(uint(_1220));
    bool _1244 = !_1240;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = !_1228;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = trunc(_1216);
    int _1254 = int(_1252);
    float _1256 = as_type<float>(_1064) * _1242;
    bool _1258 = !_1224;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = abs(_1246);
    int _1264 = abs(_1250);
    float _1266 = trunc(_1256);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    int _1272 = abs(_1260);
    int _1274 = _1236 * _1262;
    int _1276 = _1274 + _1041;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1280 = _1278 != 0;
    int _1282 = _1214 * _1264;
    bool _1284 = !_1232;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = !_1280;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _1254 * _1272;
    int _1294 = _1292 + _1282;
    int _1296 = abs(_1286);
    int _1298 = abs(_1290);
    int _1300 = ~_993;
    int _1302 = _1300 + 1;
    int _1304 = _1276 * _1296;
    int _1306 = _1304 + _1294;
    float _1308 = float(_993);
    int _1310 = int(_1196) + int(_1270);
    int _1312 = _1236 * _1298;
    int _1314 = _1312 + _1306;
    float _1316 = _1204 * _1308;
    float _1318 = float(_1108);
    float _1320 = float(uint(_1314));
    int _1322 = _1302 * _1310;
    int _1324 = _1322 + _1108;
    bool _1326 = _1318 >= _1308;
    bool _1328 = isnan(_1318);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(_1308);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = trunc(_1316);
    int _1340 = int(_1338);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1344 = _1342 != 0;
    float _1346 = as_type<float>(_1037) * _1320;
    bool _1348 = uint(_1324) >= uint(_993);
    float _1350 = _1210 * _1308;
    bool _1352 = !_1344;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = !_1348;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = trunc(_1336);
    int _1362 = int(_1360);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1378 = _1376 != 0;
    int _1380 = ~_1310;
    int _1382 = _1380 + _1358;
    int _1384 = _1382 + 1;
    bool _1386 = _993 == 0;
    int _1388 = abs(_1354);
    float _1390 = trunc(_1346);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    int _1396 = _993 * _1384;
    int _1398 = _1396 + _1108;
    int _1400 = ~_979;
    int _1402 = _1400 + 1;
    int _1404 = _1340 * _1388;
    int _1406 = _1404 + _1108;
    int _1408 = _993 + (-1);
    bool _1410 = !_1386;
    int _1412 = _1410 ? _1398 : (-1);
    float _1414 = trunc(_1350);
    int _1416 = int(_1414);
    int _1418 = ~_1362;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    bool _1424 = _979 == 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1428 = _1426 != 0;
    int _1430 = _1412 * _1422;
    bool _1432 = !_1370;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = _1402 * int(_1394);
    int _1438 = _1436 + _1314;
    int _1440 = _1362 * _1408;
    int _1442 = _1440 + _1430;
    int _1444 = abs(_1434);
    float _1446 = float(uint(_1438));
    bool _1448 = !_1366;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = !_1374;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = as_type<float>(_1037) * _1446;
    int _1458 = abs(_1450);
    int _1460 = abs(_1454);
    int _1462 = _1442 * _1444;
    float _1464 = float(uint(_1276));
    float _1466 = trunc(_1456);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    bool _1472 = !_1378;
    int _1474 = _1472 ? 0 : 1;
    int _1476 = _1416 * _1458;
    int _1478 = _1476 + _1462;
    int _1480 = 0;
    if (_1428)
    {
        _1480 = 0;
    }
    int _1482 = _1480;
    float _1484 = as_type<float>(_1037) * _1464;
    int _1486 = abs(_1474);
    int _1488 = _1406 * _1460;
    int _1490 = _1488 + _1478;
    float _1492 = float(uint(_1406));
    float _1494 = trunc(_1484);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = ~_979;
    int _1502 = _1500 + 1;
    int _1504 = _1340 * _1486;
    int _1506 = _1504 + _1490;
    int _1508 = ~_979;
    int _1510 = _1508 + 1;
    float _1512 = as_type<float>(_1064) * _1492;
    int _1514 = ~_993;
    int _1516 = _1514 + 1;
    float _1518 = float(uint(_1506));
    int _1520 = int(_1394) + int(_1470);
    float _1522 = trunc(_1512);
    float _1524 = precise::max(_1522, 0.0);
    uint _1526 = uint(_1524);
    int _1528 = _1482;
    if (!_1428)
    {
        _1528 = 1;
    }
    int _1530 = _1528;
    float _1532 = as_type<float>(_1064) * _1518;
    int _1534 = _1510 * _1520;
    int _1536 = _1534 + _1314;
    int _1538 = _1502 * int(_1498);
    int _1540 = _1538 + _1276;
    float _1542 = trunc(_1532);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    bool _1548 = uint(_1536) >= uint(_979);
    float _1550 = float(uint(_1540));
    bool _1552 = !_1548;
    int _1554 = _1552 ? 0 : (-1);
    float _1556 = as_type<float>(_1037) * _1550;
    int _1558 = ~_1520;
    int _1560 = _1558 + _1554;
    int _1562 = _1560 + 1;
    int _1564 = _1516 * int(_1526);
    int _1566 = _1564 + _1406;
    int _1568 = ~_979;
    int _1570 = _1568 + 1;
    int _1572 = _979 * _1562;
    int _1574 = _1572 + _1314;
    float _1576 = trunc(_1556);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    float _1582 = float(uint(_1566));
    int _1584 = _1516 * int(_1546);
    int _1586 = _1584 + _1506;
    bool _1588 = !_1424;
    int _1590 = _1588 ? _1574 : (-1);
    float _1592 = as_type<float>(_1064) * _1582;
    float _1594 = float(uint(_1586));
    int _1596 = _1590 & 3;
    bool _1598 = _1596 != 0;
    float _1600 = trunc(_1592);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = _1590 & 3;
    bool _1608 = _1606 != 0;
    float _1610 = as_type<float>(_1064) * _1594;
    bool _1612 = uint(_1596) > 1u;
    bool _1614 = _1596 != 3;
    int _1616 = int(_1498) + int(_1580);
    float _1618 = trunc(_1610);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    int _1624 = _1608 ? 0 : 1;
    bool _1626 = uint(_1596) >= 2u;
    int _1628 = _1570 * _1616;
    int _1630 = _1628 + _1276;
    int _1632 = ~_1624;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = _1636;
    if (!_1612)
    {
        int _1640 = ~_1624;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    int _1646 = _1626 ? 0 : 1;
    bool _1648 = uint(_1630) >= uint(_979);
    int _1650 = int(_1526) + int(_1604);
    int _1652 = ~_993;
    int _1654 = _1652 + 1;
    int _1656 = ~_993;
    int _1658 = _1656 + 1;
    int _1660 = ~_1646;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1664;
    if (_1614)
    {
        int _1668 = ~_1646;
        int _1670 = _1668 + 1;
        _1666 = _1670;
    }
    int _1672 = _1666;
    int _1674 = _1654 * _1650;
    int _1676 = _1674 + _1406;
    int _1678 = int(_1546) + int(_1622);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1682 = _1680 != 0;
    bool _1684 = !_1648;
    int _1686 = _1684 ? 0 : (-1);
    int _1688 = _1658 * _1678;
    int _1690 = _1688 + _1506;
    bool _1692 = !_1682;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = uint(_1676) >= uint(_993);
    bool _1698 = uint(_1690) >= uint(_993);
    bool _1700 = !_1696;
    int _1702 = _1700 ? 0 : (-1);
    bool _1704 = _961 > 0.5;
    int _1706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1708 = _1706 != 0;
    float _1710 = -_207;
    int _1712 = _1704 ? as_type<int>(_1710) : as_type<int>(_207);
    float _1714 = in.m_56.x;
    float _1716 = in.m_56.y;
    float _1718 = in.m_56.z;
    bool _1720 = !_1698;
    int _1722 = _1720 ? 0 : (-1);
    bool _1724 = _963 > 0.5;
    bool _1726 = !_1708;
    float _1728 = _1726 ? _207 : as_type<float>(_1712);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    float _1734 = -_211;
    int _1736 = _1724 ? as_type<int>(_1734) : as_type<int>(_211);
    bool _1738 = !_1732;
    float _1740 = _1738 ? _211 : as_type<float>(_1736);
    float _1742 = _961 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1744 = _965 > 0.5;
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1748 = _1746 != 0;
    float _1750 = -_207;
    int _1752 = _1744 ? as_type<int>(_1750) : as_type<int>(_207);
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1756 = _1754 != 0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1760 = _1758 != 0;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1766 = _967 > 0.5;
    float _1768 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1770 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1772 = 1.0 / _1764;
    float _1774 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1786 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1768);
    float _1788 = -_1776;
    float _1790 = fma(_1742, 2.0, _1788);
    float _1792 = _1780 * _1146;
    float _1794 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1770);
    float _1796 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1774);
    bool _1798 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1800 = isnan(_955);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1810;
    bool _1814 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1816 = isnan(_955);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = 1.0 / _1784;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1832 = _1812 * _1772;
    float _1834 = -_1808;
    float _1836 = _1834 + 1.0;
    bool _1838 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1840 = isnan(_955);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -_1824;
    float _1852 = _1850 + 1.0;
    bool _1854 = !_1760;
    float _1856 = _1854 ? _207 : as_type<float>(_1752);
    float _1858 = _1824 * _1836;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1862 = _955 + _1860;
    float _1864 = _1848 * _1852;
    float _1866 = -_1848;
    float _1868 = _1866 + 1.0;
    float _1870 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1794);
    float _1872 = fma(_1792, _1862, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1874 = _1530 != 1;
    float _1876 = _1019 * _1868;
    float _1878 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1796);
    float _1880 = _1830 * _1826;
    float _1882 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1786);
    float _1884 = _1872 * _1876;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1888 = _955 + _1886;
    float _1890 = -_149;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1790);
    float _1894 = -_1019;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1880, _973, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1900 = ~_1678;
    int _1902 = _1900 + _1722;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1832, _1888, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1884);
    float _1910 = _1740 + (-0.5);
    int _1912 = _993 * _1904;
    int _1914 = _1912 + _1506;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1918 = _1728 + 0.5;
    float _1920 = -_1910;
    float _1922 = -_1025;
    float _1924 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1922);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1928 = fma(_1898, _1864, _1908);
    float _1930 = _1832;
    if (!_1874)
    {
        _1930 = _963;
    }
    float _1932 = _1930;
    float _1934 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1916);
    float _1936 = _1932;
    if (!_1874)
    {
        _1080 = _963;
    }
    float _1938 = _1080;
    float _1940 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1892);
    int _1942 = _1590 >> 31;
    float _1944 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1926);
    float _1946 = _1938;
    if (_1874)
    {
        _1936 = _961;
    }
    float _1948 = _1936;
    float _1950 = fma(_1906, _1858, _1928);
    if (_1874)
    {
        _1946 = _961;
    }
    float _1952 = _1946;
    float _1954 = _1870 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1956 = !_1386;
    int _1958 = _1956 ? _1914 : (-1);
    float _1960 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1950);
    int _1962 = as_type<int>(_1960);
    if (!_1874)
    {
        _1082 = _965;
    }
    float _1964 = _1082;
    float _1966 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1968 = _1964;
    if (_1874)
    {
        _1084 = _963;
    }
    float _1970 = _1084;
    float _1972 = _1856 + 0.5;
    if (_1874)
    {
        _1968 = _963;
    }
    float _1974 = _1968;
    int _1976 = _1942 & 3;
    float _1978 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1980 = _1958 >> 31;
    int _1982 = _1590 + _1976;
    int _1984 = _1980 & 3;
    int _1986 = _1958 + _1984;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1992 = _1982 >> 2;
    float _1994 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1988);
    int _1996 = _1986 >> 2;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2000 = !_1598;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2006 = _1958 & 3;
    bool _2008 = _2006 != 0;
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1998);
    int _2012 = _1992 << 4;
    int _2014 = _2012 + 368;
    float _2016 = fma(_1978, -2.0, _1990);
    int _2018 = _1958 & 3;
    bool _2020 = _2018 != 0;
    float _2022 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1944);
    int _2024 = _1996 << 4;
    int _2026 = _2024 + 512;
    uint _2028 = uint(int(uint(_2014) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    int _2044 = _2008 ? 0 : 1;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2048 = _1954 + _2046;
    bool _2050 = uint(_2018) > 1u;
    float _2052 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1994);
    float _2054 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2056 = !_2020;
    int _2058 = _2056 ? 0 : 1;
    uint _2060 = uint(int(uint(_2026) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    bool _2076 = _1596 != 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2080 = _1882 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _1966 + _2082;
    int _2086 = ~_1616;
    int _2088 = _2086 + _1686;
    int _2090 = _2088 + 1;
    float _2092 = -_2078;
    float _2094 = fma(_2004, 2.0, _2092);
    int _2096 = ~_2044;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    int _2102 = _2026 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = _2100;
    if (!_2050)
    {
        int _2122 = ~_2044;
        int _2124 = _2122 + 1;
        _2120 = _2124;
    }
    int _2126 = _2120;
    float _2128 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1934);
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2132 = _2080 + _2130;
    int _2134 = abs(_1644);
    int _2136 = _979 * _2090;
    int _2138 = _2136 + _1276;
    int _2140 = abs(_2126);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2054);
    int _2144 = _2014 + 8;
    uint _2146 = uint(int(uint(_2144) >> uint(2)));
    uint _2148 = uint(int(uint(int(_2146)) >> uint(2)));
    int _2150 = int(_2146) & 3;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[int(_2148)][_2150];
    int _2154 = int(_2146) + 1;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    int _2158 = _2154 & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = ~_2134;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = -_149;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2094);
    float _2172 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2142);
    bool _2174 = !_2076;
    int _2176 = _2174 ? 0 : (-1);
    float _2178 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2010);
    bool _2180 = _2018 != 3;
    float _2182 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2016);
    bool _2184 = uint(_2018) >= 2u;
    float _2186 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2170);
    int _2188 = abs(_2002);
    float _2190 = -_2178;
    float _2192 = _2190 + 1.0;
    int _2194 = ~_2140;
    int _2196 = _2194 + 1;
    int _2198 = _2196 + 1;
    float _2200 = -_2128;
    float _2202 = _2200 + 1.0;
    int _2204 = abs(_2058);
    int _2206 = _2184 ? 0 : 1;
    int _2208 = abs(_1672);
    int _2210 = ~_2206;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = _2214;
    if (_2180)
    {
        int _2218 = ~_2206;
        int _2220 = _2218 + 1;
        _2216 = _2220;
    }
    int _2222 = _2216;
    int _2224 = _2166 * as_type<int>(_2042);
    bool _2226 = _2018 != 3;
    int _2228 = ~_2188;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    int _2234 = abs(_2222);
    int _2236 = _2198 * as_type<int>(_2074);
    int _2238 = _2232 * as_type<int>(_2034);
    int _2240 = _2238 + _2224;
    int _2242 = ~_2208;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = ~_2204;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2234;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = abs(_2176);
    int _2262 = _2252 * as_type<int>(_2066);
    int _2264 = _2262 + _2236;
    bool _2266 = !_2226;
    int _2268 = _2266 ? 0 : (-1);
    bool _2270 = !_1424;
    int _2272 = _2270 ? _2138 : (-1);
    int _2274 = _2258 * as_type<int>(_2110);
    int _2276 = _2274 + _2264;
    int _2278 = abs(_1694);
    int _2280 = _2246 * as_type<int>(_2152);
    int _2282 = _2280 + _2240;
    int _2284 = abs(_2268);
    bool _2286 = !_1756;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = ~_2260;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2288);
    int _2298 = ~_2278;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    int _2304 = _2294 * as_type<int>(_2160);
    int _2306 = _2304 + _2282;
    int _2308 = ~_2284;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    int _2314 = ~_1650;
    int _2316 = _2314 + _1702;
    int _2318 = _2316 + 1;
    int _2320 = _2306 * _2302;
    bool _2322 = _2172 >= 0.0;
    int _2324 = _2312 * as_type<int>(_2118);
    int _2326 = _2324 + _2276;
    int _2328 = ~_2296;
    int _2330 = _2328 + 1;
    int _2332 = _2330 + 1;
    int _2334 = _2272 * _2278;
    int _2336 = _2334 + _2320;
    float _2338 = _2048 * _2048;
    float _2340 = -_211;
    int _2342 = _1766 ? as_type<int>(_2340) : as_type<int>(_211);
    int _2344 = _993 * _2318;
    int _2346 = _2344 + _1406;
    float _2348 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2350 = _2326 * _2332;
    float _2352 = -_2052;
    float _2354 = _2352 + 1.0;
    float _2356 = fma(_2132, _2132, _2338);
    bool _2358 = !_1748;
    float _2360 = _2358 ? _211 : as_type<float>(_2342);
    float _2362 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2364 = -_2354;
    float _2366 = fma(_1856, _2364, _2186);
    float _2368 = fma(_2084, _2084, _2356);
    bool _2370 = !_1386;
    int _2372 = _2370 ? _2346 : (-1);
    float _2374 = _2360 + (-0.5);
    if (_2322)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2376 = _927;
    float _2378 = _1960 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2380 = _2362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2382 = rsqrt(_2368);
    float _2384 = -_2374;
    float _2386 = -_2182;
    float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2386);
    int _2390 = _2372 * _2296;
    int _2392 = _2390 + _2350;
    float _2394 = -_2022;
    float _2396 = _2394 + 1.0;
    float _2398 = -_2202;
    float _2400 = fma(_1728, _2398, _1940);
    float _2402 = fma(_2360, _2192, _2388);
    float _2404 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = fma(_1740, _2396, _1924);
    if (_2322)
    {
        float _2408 = _2376 * 5.0;
        _1962 = as_type<int>(_2408);
    }
    int _2410 = _1962;
    float _2412 = float(_2336);
    out.m_74.x = _2380;
    out.m_74.y = _2404;
    out.m_74.z = _985;
    out.m_74.w = _2378;
    float _2414 = float(_2392);
    out.m_76.x = _2400;
    out.m_76.y = _2406;
    out.m_76.z = _2366;
    out.m_76.w = _2402;
    float _2416 = _2048 * _2382;
    float _2418 = _2132 * _2382;
    float _2420 = as_type<float>(_2410);
    float _2422 = _2416;
    if (_2322)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7742 = as_type<float>(_2410);
        out.gl_Position.z = _7742;
    }
    out.m_78.x = _2412;
    out.m_78.y = _2414;
    if (_2322)
    {
        out.m_59.x = 0.0;
    }
    if (_2322)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2424 = -_2416;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1954);
    float _2428 = _2084 * _2382;
    float _2430 = -_2418;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2436 = _2426 + _2434;
    float _2438 = -_2428;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _2442 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2444 = _2432 + _2442;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2450 = _2440 + _2448;
    float _2452 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2446);
    float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2452);
    bool _2456 = _2454 >= 0.0;
    float _2458 = _2436;
    float _2460 = _2440;
    if (_2456)
    {
        _2420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2462 = _2420;
    int _2464 = as_type<int>(_2462);
    if (_2456)
    {
        out.m_59.x = 0.0;
    }
    if (_2456)
    {
        float _2466 = _2462 * 5.0;
        _2464 = as_type<int>(_2466);
    }
    int _2468 = _2464;
    if (_2456)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7842 = as_type<float>(_2468);
        out.gl_Position.z = _7842;
    }
    if (_2456)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2470 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2472 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2474 = floor(_2470);
    float _2476 = floor(_2472);
    float _2478 = -_2474;
    float _2480 = _2470 + _2478;
    float _2482 = -_2476;
    float _2484 = _2472 + _2482;
    float2 _7878 = float2(_2480, _2484);
    float _2486 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7878, float2(0.0), isnan(_7878)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7878, float2(0.0), isnan(_7878)), level(0.0)).x;
    float _2488 = -_1954;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2492 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2494 = -_2080;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2498 = -_1966;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2502 = _2490 * _2490;
    float _2504 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2492);
    float _2506 = -_2416;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2510 = -_2418;
    float _2512 = fma(_2510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2514 = fma(_2496, _2496, _2502);
    float _2516 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2504);
    float _2518 = _2508 * _2508;
    float _2520 = -_2428;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2524 = fma(_2500, _2500, _2514);
    float _2526 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2528 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2530 = fma(_2512, _2512, _2518);
    float _2532 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2534 = 1.0 / _2526;
    float _2536 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2528);
    float _2538 = fma(_2522, _2522, _2530);
    float _2540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2544 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2536);
    float _2546 = rsqrt(_2524);
    float _2548 = _2544 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2550 = _2548 + _2526;
    float _2552 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2554 = _2550 * _2534;
    float _2556 = _2554 * 0.5;
    float _2558 = _2426 + _2552;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2560);
    float _2564 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2566 = _2496 * _2546;
    float _2568 = _2490 * _2546;
    float _2570 = _2500 * _2546;
    float _2572 = 1.0 / _2562;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2576 = _2566 * _2574;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2580 = _2570 * _2578;
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2584 = -_2576;
    float _2586 = fma(_2570, _2582, _2584);
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2590 = _2568 * _2588;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2594 = -_2580;
    float _2596 = fma(_2568, _2592, _2594);
    float _2598 = _2586 * _2586;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2602 = -_2590;
    float _2604 = fma(_2566, _2600, _2602);
    float _2606 = sqrt(_2538);
    float _2608 = fma(_2596, _2596, _2598);
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2612 = _2572 * _2610;
    float _2614 = fma(_2604, _2604, _2608);
    float _2616 = rsqrt(_2614);
    bool _2618 = _2612 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2620 = _2612 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2622 = _2382 * _2606;
    float _2624 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2626 = _2622 * _2532;
    float _2628 = _2622 * _2624;
    bool _2630 = !_2618;
    int _2632 = _2630 ? 0 : 1;
    float _2634 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2636 = _2634 * 0.5;
    float _2638 = _2540 * _2626;
    float _2640 = _2542 * _2628;
    float _2642 = _2596 * _2616;
    float _2644 = _2586 * _2616;
    float _2646 = _2604 * _2616;
    int _2648 = 2;
    float _2650 = _2640;
    float _2652 = _2622;
    float _2654 = _2558;
    float _2656 = _2644;
    if (!_2618)
    {
        _2648 = 1;
    }
    int _2658 = _2648;
    float _2660 = _2568 * _2642;
    float _2662 = _2570 * _2644;
    int _2664 = _2658;
    if (!_2620)
    {
        _2664 = _2632;
    }
    int _2666 = _2664;
    float _2668 = _2566 * _2646;
    float _2670 = -_2660;
    float _2672 = fma(_2566, _2644, _2670);
    float _2674 = -_2662;
    float _2676 = fma(_2568, _2646, _2674);
    int _2678 = _2666 << 6;
    float _2680 = -_2668;
    float _2682 = fma(_2570, _2642, _2680);
    float _2684 = _2638 * _2672;
    float _2686 = _2638 * _2676;
    int _2688 = _2678 + 48;
    uint _2690 = uint(int(uint(_2688) >> uint(2)));
    uint _2692 = uint(int(uint(int(_2690)) >> uint(2)));
    int _2694 = int(_2690) & 3;
    float _2696 = (*spvDescriptorSet0.vp_c15)._m0[int(_2692)][_2694];
    int _2698 = int(_2690) + 1;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    int _2702 = _2698 & 3;
    float _2704 = (*spvDescriptorSet0.vp_c15)._m0[int(_2700)][_2702];
    float _2706 = fma(_2640, _2646, _2684);
    float _2708 = fma(_2640, _2642, _2686);
    float _2710 = fma(_2636, _2570, _2706);
    float _2712 = fma(_2636, _2566, _2708);
    int _2714 = _2678 + 56;
    uint _2716 = uint(int(uint(_2714) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _1966 + _2710;
    float _2734 = _2080 + _2712;
    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2738 = _2732 + _2736;
    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2742 = _2734 + _2740;
    int _2744 = _2678 + 64;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    uint _2748 = uint(int(uint(int(_2746)) >> uint(2)));
    int _2750 = int(_2746) & 3;
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[int(_2748)][_2750];
    int _2754 = int(_2746) + 1;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    int _2758 = _2754 & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    float _2762 = _2738 * _2738;
    float _2764 = fma(_2742, _2742, _2762);
    float _2766 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2564);
    int _2768 = _2678 + 72;
    uint _2770 = uint(int(uint(_2768) >> uint(2)));
    uint _2772 = uint(int(uint(int(_2770)) >> uint(2)));
    int _2774 = int(_2770) & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    int _2778 = int(_2770) + 1;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    int _2782 = _2778 & 3;
    float _2784 = (*spvDescriptorSet0.vp_c15)._m0[int(_2780)][_2782];
    float _2786 = sqrt(_2764);
    float _2788 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2766);
    float _2790 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2792 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _2794 = _2678 + 96;
    uint _2796 = uint(int(uint(_2794) >> uint(2)));
    uint _2798 = uint(int(uint(int(_2796)) >> uint(2)));
    int _2800 = int(_2796) & 3;
    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[int(_2798)][_2800];
    int _2804 = int(_2796) + 1;
    uint _2806 = uint(int(uint(_2804) >> uint(2)));
    int _2808 = _2804 & 3;
    float _2810 = (*spvDescriptorSet0.vp_c15)._m0[int(_2806)][_2808];
    float _2812 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2790);
    float _2814 = trunc(_2792);
    int _2816 = int(_2814);
    float _2818 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2812);
    float _2820 = _2638 * _2682;
    int _2822 = _2678 + 104;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    uint _2826 = uint(int(uint(int(_2824)) >> uint(2)));
    int _2828 = int(_2824) & 3;
    float _2830 = (*spvDescriptorSet0.vp_c15)._m0[int(_2826)][_2828];
    int _2832 = int(_2824) + 1;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    int _2836 = _2832 & 3;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[int(_2834)][_2836];
    float _2840 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2842 = _2786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2844 = fma(_2640, _2644, _2820);
    float _2846 = trunc(_2840);
    int _2848 = int(_2846);
    float _2850 = fma(_2636, _2568, _2844);
    float _2852 = _1954 + _2850;
    int _2854 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2856 = _2816 + _2854;
    int _2858 = _2856 + 1;
    float _2860 = _2734;
    float _2862 = _2732;
    int _2864 = as_type<int>(_2722);
    float _2866 = as_type<float>(_2666);
    float _2868 = _2840;
    if (!_2842)
    {
        _2650 = _2734;
    }
    float _2870 = _2650;
    float _2872 = _2870;
    if (!_2842)
    {
        _2860 = _2852;
    }
    float _2874 = _2860;
    bool _2876 = !_2842;
    float _2878 = _2874;
    int _2880 = as_type<int>(_2802);
    int _2882 = as_type<int>(_2838);
    int _2884 = as_type<int>(_2752);
    if (!_2876)
    {
        float _2886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2890 = _2786 + _2888;
        float _2892 = rsqrt(_2764);
        float _2894 = _2890 * _2886;
        float _2896 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2898 = _2894 * 0.15915493667125701904296875;
        float _2900 = _2898 * 6.283185482025146484375;
        float _2902 = cos(_2900);
        float _2904 = _2898 * 6.283185482025146484375;
        float _2906 = sin(_2904);
        float _2908 = _2902 + (-1.0);
        float _2910 = fma(_2906, _2896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2914 = _2892 * _2910;
        float _2916 = fma(_2852, _2902, _2912);
        float _2918 = fma(_2742, _2914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2920 = fma(_2738, _2914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2878 = _2916;
        _2872 = _2918;
        _2862 = _2920;
    }
    float _2922 = _2878;
    float _2924 = _2872;
    float _2926 = _2862;
    float _2928 = -_1954;
    float _2930 = _2928 + _2922;
    int _2932 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2934 = _2848 + _2932;
    int _2936 = _2934 + 1;
    int _2938 = _2678 + 80;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    uint _2942 = uint(int(uint(int(_2940)) >> uint(2)));
    int _2944 = int(_2940) & 3;
    float _2946 = (*spvDescriptorSet0.vp_c15)._m0[int(_2942)][_2944];
    int _2948 = int(_2940) + 1;
    uint _2950 = uint(int(uint(_2948) >> uint(2)));
    int _2952 = _2948 & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    float _2956 = -_2080;
    float _2958 = _2956 + _2924;
    float _2960 = _2930 * _2930;
    float _2962 = -_1966;
    float _2964 = _2962 + _2926;
    bool _2966 = _2858 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2968 = fma(_2958, _2958, _2960);
    int _2970 = _2858 | _2936;
    bool _2972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2974 = isnan(0.5);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2964, _2964, _2968);
    bool _2984 = _2970 < 0;
    bool _2986 = _2984 || _2966;
    float _2988 = _2558 * _2810;
    float _2990 = sqrt(_2982);
    bool _2992 = _2936 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2994 = _2992 || _2986;
    float _2996 = fma(_2432, _2802, _2988);
    float _2998 = _2558 * _2704;
    float _3000 = fma(_2440, _2830, _2996);
    float _3002 = fma(_2432, _2696, _2998);
    float _3004 = _3000 + _2838;
    float _3006 = fma(_2440, _2722, _3002);
    float _3008 = _2926;
    float _3010 = _2924;
    float _3012 = _2922;
    if (!_2994)
    {
        int _3014 = _2936 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3016 = _3014 + _2858;
        _2880 = _3016;
    }
    int _3018 = _2880;
    float _3020 = _2830;
    if (!_2994)
    {
        float _3022 = floor(_2792);
        _3020 = _3022;
    }
    float _3024 = _3020;
    bool _3026 = _2990 > 0.0;
    float _3028 = _2558 * _2760;
    float _3030 = _3006 + _2730;
    if (!_2994)
    {
        int _3032 = _3018 << 2;
        _2882 = _3032;
    }
    int _3034 = _2882;
    float _3036 = fma(_2432, _2752, _3028);
    int _3038 = _3034;
    if (!_2994)
    {
        uint _3040 = uint(int(uint(_3018) >> uint(2)));
        _2884 = int(_3040);
    }
    int _3042 = _2884;
    float _3044 = 1.0 / _3004;
    if (!_2994)
    {
        int _3046 = 12 & _3034;
        _3038 = _3046;
    }
    int _3048 = _3038;
    float _3050 = fma(_2440, _2776, _3036);
    float _3052 = as_type<float>(_3048);
    if (!_2994)
    {
        int _3054 = _3042 << 4;
        int _3056 = _3054 + _3048;
        _2864 = _3056;
    }
    int _3058 = _2864;
    bool _3060 = !_3026;
    if (!_3060)
    {
        float _3062 = _201 * _201;
        float _3064 = rsqrt(_2982);
        float _3066 = fma(_199, _199, _3062);
        float _3068 = fma(_203, _203, _3066);
        float _3070 = sqrt(_3068);
        float _3072 = _2958 * _3064;
        float _3074 = _2930 * _3064;
        float _3076 = _2964 * _3064;
        bool _3078 = _3070 > 0.0;
        bool _3080 = !_3078;
        _3052 = _3074;
        if (!_3080)
        {
            float _3082 = rsqrt(_3068);
            float _3084 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3086 = _201 * _3082;
            float _3088 = _199 * _3082;
            float _3090 = _3074 * _3086;
            float _3092 = _203 * _3082;
            float _3094 = fma(_3072, _3088, _3090);
            float _3096 = _3084 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3098 = fma(_3076, _3092, _3094);
            float _3100 = _3098 * _3096;
            float _3102 = fma(_199, _3100, _2924);
            float _3104 = fma(_201, _3100, _2922);
            float _3106 = fma(_203, _3100, _2926);
            _3008 = _3106;
            _3010 = _3102;
            _3012 = _3104;
            _3052 = _3090;
        }
    }
    float _3108 = _3008;
    float _3110 = _3010;
    float _3112 = _3012;
    float _3114 = _3052;
    float _3116 = -_2428;
    float _3118 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3108);
    float _3120 = _3050 + _2784;
    float _3122 = -_2418;
    float _3124 = fma(_3122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3110);
    float _3126 = -_2416;
    float _3128 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3112);
    float _3130 = _3128;
    float _3132 = _3124;
    float _3134 = _3118;
    if (!_2980)
    {
        float _3136 = _2436 * _2436;
        float _3138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3140 = -_1954;
        float _3142 = _3140 + _3112;
        float _3144 = -_1966;
        float _3146 = _3144 + _3108;
        float _3148 = fma(_2444, _2444, _3136);
        float _3150 = fma(_2450, _2450, _3148);
        float _3152 = 1.0 / _2622;
        float _3154 = sqrt(_3150);
        float _3156 = precise::min(_3154, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3158 = _3156 * _3138;
        float _3160 = _3158 * _3152;
        float _3162 = -_2080;
        float _3164 = _3162 + _3110;
        float _3166 = fma(_3142, _3160, _2426);
        float _3168 = fma(_3164, _3160, _2432);
        float _3170 = fma(_3146, _3160, _2440);
        _3130 = _3166;
        _3132 = _3168;
        _2458 = _3136;
        _3134 = _3170;
        _2652 = _3152;
    }
    float _3172 = _3130;
    float _3174 = _3132;
    float _3176 = _2458;
    float _3178 = _3134;
    float _3180 = _2652;
    int _3182 = _2678 + 88;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    uint _3186 = uint(int(uint(int(_3184)) >> uint(2)));
    int _3188 = int(_3184) & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    int _3192 = int(_3184) + 1;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    int _3196 = _3192 & 3;
    float _3198 = (*spvDescriptorSet0.vp_c15)._m0[int(_3194)][_3196];
    float _3200 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3202 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3204 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3206 = _3030 * _3044;
    float _3208 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3200);
    float _3210 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3202);
    float _3212 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3204);
    float _3214 = _3176;
    float _3216 = _3180;
    if (!_2994)
    {
        int _3218 = _3058 + 400;
        uint _3220 = uint(int(uint(_3218) >> uint(2)));
        uint _3222 = uint(int(uint(int(_3220)) >> uint(2)));
        int _3224 = int(_3220) & 3;
        float _3226 = (*spvDescriptorSet0.vp_c15)._m0[int(_3222)][_3224];
        _3214 = _3226;
    }
    float _3228 = _3214;
    float _3230 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3208);
    float _3232 = _3120 * _3044;
    bool _3234 = _3206 >= 0.0;
    float _3236 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3210);
    float _3238 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3240 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3212);
    float _3242 = _3230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3244 = _3206 <= 1.0;
    bool _3246 = _3244 && _3234;
    float _3248 = _3236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3250 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3238);
    float _3252 = _3240 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3256 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3258 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3260 = _3232 >= 0.0;
    bool _3262 = _3260 && _3246;
    float _3264 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3250);
    float _3266 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3254);
    float _3268 = -_3258;
    float _3270 = fma(_3268, _3256, 1.0);
    bool _3272 = _3232 <= 1.0;
    bool _3274 = _3272 && _3262;
    float _3276 = _3264 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3278 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3266);
    float _3280 = _3114;
    if (!_2994)
    {
        float _3282 = floor(_2840);
        _3280 = _3282;
    }
    float _3284 = _3280;
    float _3286 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3288 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3290 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3278);
    float _3292 = _2558 * _2954;
    float _3294 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3286);
    float _3296 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3288);
    float _3298 = 1.0 / _3290;
    float _3300 = fma(_2432, _2946, _3292);
    if (_3274)
    {
        float _3302 = float(_2666);
        _2866 = _3302;
    }
    float _3304 = _2866;
    float _3306 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3294);
    float _3308 = log2(_3270);
    if (!_2994)
    {
        float _3310 = -_3284;
        float _3312 = _2840 + _3310;
        _2422 = _3312;
    }
    float _3314 = _2422;
    float _3316 = fma(_2440, _3190, _3300);
    float _3318 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3306);
    float _3320 = _3316 + _3198;
    float _3322 = _3286;
    float _3324 = _3318;
    if (_3274)
    {
        float _3326 = rint(_3304);
        float _3328 = precise::max(_3326, 0.0);
        uint _3330 = uint(_3328);
        uint _3332 = clamp(_3330, 0u, 65535u);
        _3322 = as_type<float>(_3332);
    }
    float _3334 = _3322;
    float _3336 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3296);
    float _3338 = _3318 * _3298;
    float _3340 = _3320 * _3044;
    float _3342 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3336);
    float _3344 = fma(_3338, 0.5, 0.5);
    float _3346 = _3228;
    float _3348 = _3298;
    if (!_2994)
    {
        float _3350 = rint(_3228);
        float _3352 = precise::max(_3350, 0.0);
        uint _3354 = uint(_3352);
        uint _3356 = clamp(_3354, 0u, 65535u);
        _3346 = as_type<float>(_3356);
    }
    float _3358 = _3346;
    float _3360 = _3308 * 0.693147182464599609375;
    float _3362 = _3342 * _3298;
    if (!_2994)
    {
        float _3364 = -_3024;
        float _3366 = _2792 + _3364;
        _3348 = _3366;
    }
    float _3368 = _3348;
    float _3370 = _3360 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3372 = fma(_3362, -0.5, 0.5);
    float _3374 = _3232;
    if (_3274)
    {
        float3 _9338 = float3(_3206, _3232, float(as_type<int>(_3334)));
        float3 _9342 = select(_9338, float3(0.0), isnan(_9338));
        float _3376 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9342.xy, uint(rint(_9342.z)), _3340, level(0.0));
        _3374 = _3376;
    }
    float _3378 = _3374;
    float3 _9352 = float3(_3344, _3372, _3370);
    float _3380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9352, float3(0.0), isnan(_9352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9352, float3(0.0), isnan(_9352)), level(0.0)).x;
    float3 _9361 = float3(_3344, _3372, _3370);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9361, float3(0.0), isnan(_9361)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9361, float3(0.0), isnan(_9361)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float _3393 = _3368;
    if (!_2994)
    {
        float3 _9384 = float3(_3368, _3314, float(as_type<int>(_3358)));
        float3 _9386 = select(_9384, float3(0.0), isnan(_9384));
        float _3395 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9386.xy, uint(rint(_9386.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9386.xy, uint(rint(_9386.z)), level(0.0)).x;
        _3393 = _3395;
    }
    float _3397 = _3393;
    if (_2994)
    {
        _2868 = 1.0;
    }
    float _3399 = _2868;
    float _3401 = _3399;
    if (!_2994)
    {
        int _3403 = _3018 << 4;
        int _3405 = _3403 + 2048;
        uint _3407 = uint(int(uint(_3405) >> uint(2)));
        uint _3409 = uint(int(uint(int(_3407)) >> uint(2)));
        int _3411 = int(_3407) & 3;
        float _3413 = (*spvDescriptorSet0.vp_c15)._m0[int(_3409)][_3411];
        int _3415 = int(_3407) + 1;
        uint _3417 = uint(int(uint(_3415) >> uint(2)));
        int _3419 = _3415 & 3;
        float _3421 = (*spvDescriptorSet0.vp_c15)._m0[int(_3417)][_3419];
        int _3423 = _3405 + 8;
        uint _3425 = uint(int(uint(_3423) >> uint(2)));
        uint _3427 = uint(int(uint(int(_3425)) >> uint(2)));
        int _3429 = int(_3425) & 3;
        float _3431 = (*spvDescriptorSet0.vp_c15)._m0[int(_3427)][_3429];
        int _3433 = int(_3425) + 1;
        uint _3435 = uint(int(uint(_3433) >> uint(2)));
        int _3437 = _3433 & 3;
        float _3439 = (*spvDescriptorSet0.vp_c15)._m0[int(_3435)][_3437];
        float _3441 = _2558 * _3421;
        float _3443 = fma(_2432, _3413, _3441);
        float _3445 = fma(_2440, _3431, _3443);
        float _3447 = _3445 + _3439;
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = -_3449;
        float _3453 = _3451 + _3397;
        float _3455 = fma(_3453, 500.0, 1.5);
        float _3457 = exp2(_3455);
        float _3459 = 0.0 + _3457;
        float _3461 = precise::clamp(_3459, 0.0, 1.0);
        _2654 = _3441;
        _3401 = _3461;
    }
    float _3463 = _2654;
    float _3465 = _3401;
    float _3467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3469 = _3172 + _3467;
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3473 = _3174 + _3471;
    float _3475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3477 = _3178 + _3475;
    float _3479 = _3469 * _3469;
    float _3481 = fma(_3473, _3473, _3479);
    float _3483 = fma(_3477, _3477, _3481);
    float _3485 = rsqrt(_3483);
    float _3487 = sqrt(_3483);
    float _3489 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3491 = _3473 * _3489;
    float _3493 = _3477 * _3489;
    float _3495 = _3491 * _3491;
    float _3497 = _3493 * _3493;
    float _3499 = _3495 + _3497;
    float _3501 = sqrt(_3499);
    bool _3503 = _3501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3507 = _3501 + _3505;
    float _3509 = _3370;
    float _3511 = _3485;
    float _3513 = _3507;
    float _3515 = _3469;
    float _3517 = _3463;
    if (_3503)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3509 = _3519;
    }
    float _3521 = _3509;
    if (_3503)
    {
        float _3523 = rsqrt(_3499);
        _3511 = _3523;
    }
    float _3525 = _3511;
    float _3527 = _3525;
    if (_3503)
    {
        float _3529 = _3507 * _3521;
        _3513 = _3529;
    }
    float _3531 = _3513;
    if (_3503)
    {
        float _3533 = _3531 * 0.15915493667125701904296875;
        _2460 = _3533;
    }
    float _3535 = _2460;
    float _3537 = _3477;
    if (_3503)
    {
        float _3539 = _3535 * 6.283185482025146484375;
        float _3541 = sin(_3539);
        _3537 = _3541;
    }
    float _3543 = _3537;
    float _3545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3547 = precise::max(0.0, _3545);
    float _3549 = _3521;
    float _3551 = _3547;
    if (_3503)
    {
        float _3553 = _3535 * 6.283185482025146484375;
        float _3555 = cos(_3553);
        _3549 = _3555;
    }
    float _3557 = _3549;
    float _3559 = -_3489;
    float _3561 = -_3547;
    float _3563 = fma(_3469, _3559, _3561);
    if (_3503)
    {
        float _3565 = _3563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3515 = _3565;
    }
    float _3567 = _3515;
    float _3569 = _3567;
    float _3571 = _3543;
    if (_3503)
    {
        float _3573 = fma(_3543, _3567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3569 = _3573;
    }
    float _3575 = _3569;
    float _3577 = _3575;
    if (!_3503)
    {
        _3571 = _3491;
    }
    float _3579 = _3571;
    float _3581 = _3579;
    float _3583 = _3557;
    if (_3503)
    {
        float _3585 = _3557 + (-1.0);
        _3551 = _3585;
    }
    float _3587 = _3551;
    float _3589 = _3587;
    if (_3503)
    {
        float _3591 = _3525 * _3575;
        _3216 = _3591;
    }
    float _3593 = _3216;
    if (!_3503)
    {
        _3577 = _3563;
    }
    float _3595 = _3577;
    float _3597 = _3595;
    if (_3503)
    {
        float _3599 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3517 = _3599;
    }
    float _3601 = _3517;
    if (_3503)
    {
        float _3603 = _3491 * _3593;
        _3581 = _3603;
    }
    float _3605 = _3581;
    if (!_3503)
    {
        _3589 = _3493;
    }
    float _3607 = _3589;
    float _3609 = _3607;
    if (_3503)
    {
        float _3611 = _3493 * _3593;
        _3609 = _3611;
    }
    float _3613 = _3609;
    if (!_3503)
    {
        _3527 = _3495;
    }
    float _3615 = _3527;
    float _3617 = _3615;
    if (_3503)
    {
        float _3619 = fma(_3563, _3557, _3601);
        _3597 = _3619;
    }
    float _3621 = _3597;
    if (_3503)
    {
        float _3623 = _3605 * _3605;
        _3617 = _3623;
    }
    float _3625 = _3617;
    if (!_3503)
    {
        _3583 = _3497;
    }
    float _3627 = _3583;
    float _3629 = _3627;
    if (_3503)
    {
        float _3631 = _3613 * _3613;
        _3629 = _3631;
    }
    float _3633 = _3629;
    float _3635 = fma(_3621, _3621, _3625);
    float _3637 = _3635 + _3633;
    float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3641 = fma(_3487, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3639);
    float _3643 = precise::clamp(_3641, 0.0, 1.0);
    float _3645 = rsqrt(_3637);
    float _3647 = -_3643;
    float _3649 = _3647 + 1.0;
    float _3651 = abs(_3649);
    float _3653 = log2(_3651);
    float _3655 = _3645 * _3605;
    float _3657 = _3645 * _3621;
    float _3659 = _3645 * _3613;
    float _3661 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3663 = -_3661;
    float _3665 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3663);
    float _3667 = -_3659;
    float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3665);
    float _3671 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3673 = fma(_3669, -0.5, 0.5);
    float _3675 = fma(_3669, 0.5, 0.5);
    float _3677 = exp2(_3671);
    float _3679 = fma(_3675, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3681 = fma(_3675, _3679, -0.212114393711090087890625);
    float _3683 = _3657 + 1.0;
    float _3685 = sqrt(_3673);
    float _3687 = fma(_3675, _3681, 1.570728778839111328125);
    float _3689 = -_3657;
    float _3691 = fma(_3677, _3683, _3689);
    float _3693 = _3685 * 0.636619746685028076171875;
    float _3695 = fma(_3691, 0.5, 0.5);
    float _3697 = -_3687;
    float _3699 = fma(_3693, _3697, 1.0);
    float2 _9859 = float2(_3699, _3695);
    float3 _3703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9859, float2(0.0), isnan(_9859)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9859, float2(0.0), isnan(_9859)), level(0.0)).xyz;
    float _3705 = _3703.x;
    float _3707 = _3703.y;
    float _3709 = _3703.z;
    float _3711 = abs(_2612);
    float _3713 = log2(_3711);
    float _3715 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3717 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3719 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3721 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _2642;
    out.m_80.y = _2644;
    out.m_80.z = _2646;
    float _3723 = -_2486;
    float _3725 = _3723 + 1.0;
    float _3727 = exp2(_3717);
    float _3729 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3719);
    bool _3731 = _2612 <= 8000.0;
    bool _3733 = isnan(_2612);
    bool _3735 = _3731 || _3733;
    bool _3737 = isnan(8000.0);
    bool _3739 = _3735 || _3737;
    float _3741 = float(_3739);
    out.m_82.x = _3174;
    out.m_82.y = _3172;
    out.m_82.z = _3178;
    bool _3743 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3745 = isnan(_3487);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3751 = _3747 || _3749;
    float _3753 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3729);
    float _3755 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3757 = fma(_3715, _3715, 1.0);
    float _3759 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3753);
    float _3761 = rsqrt(_3757);
    out.gl_Position.x = _3318;
    out.gl_Position.y = _3342;
    out.gl_Position.z = _3759;
    out.gl_Position.w = _3290;
    float _3763 = -_3727;
    float _3765 = _3763 + 1.0;
    float _3767 = exp2(_3755);
    float _3769 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3771 = _3715 * _3761;
    if (!_3751)
    {
        _3324 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3773 = _3324;
    float _3775 = -_2570;
    float _3777 = _3771 * _3775;
    float _3779 = fma(_3767, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = -_2568;
    float _3785 = _3771 * _3783;
    float _3787 = fma(_3781, -2.0, 3.0);
    float _3789 = _3781 * _3781;
    float _3791 = -_2566;
    float _3793 = _3771 * _3791;
    float _3795 = _3789 * _3787;
    float _3797 = fma(_3761, _2676, _3793);
    float _3799 = fma(_3761, _2682, _3785);
    float _3801 = fma(_3761, _2672, _3777);
    float _3803 = _3715 * _2676;
    float _3805 = _3715 * _2682;
    float _3807 = _3715 * _2672;
    out.m_84.x = _3797;
    out.m_84.y = _3799;
    out.m_84.z = _3801;
    float _3809 = fma(_3721, _2642, _3803);
    float _3811 = fma(_3721, _2644, _3805);
    float _3813 = _3759 + _3290;
    float _3815 = _3773;
    float _3817 = _3773;
    if (!_3274)
    {
        _2656 = 1.0;
    }
    float _3819 = _2656;
    float _3821 = fma(_3721, _2646, _3807);
    float _3823 = _3819;
    if (_3274)
    {
        bool _3825 = _3378 >= _3340;
        bool _3827 = isnan(_3378);
        bool _3829 = _3825 || _3827;
        bool _3831 = isnan(_3340);
        bool _3833 = _3829 || _3831;
        float _3835 = float(_3833);
        _3823 = _3835;
    }
    float _3837 = _3823;
    float _3839 = _3813 * 0.5;
    float _3841 = _3769 * _3380;
    float _3843 = -_3769;
    float _3845 = _3843 + 1.0;
    float _3847 = _2566 + _3809;
    float _3849 = _3837 * _3465;
    float _3851 = -_3795;
    float _3853 = _3851 + 1.0;
    float _3855 = _3391 * _3841;
    float _3857 = _2568 + _3811;
    float _3859 = _2570 + _3821;
    float _3861 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3795);
    float _3863 = _3741 * _3861;
    out.m_86.x = _3847;
    out.m_86.y = _3857;
    out.m_86.z = _3859;
    float _3865 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.z = _3839;
    out.m_88.w = _3290;
    float _3867 = _3725 * _3865;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = -_3869;
    float _3873 = fma(_3871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3875 = _3869;
    float _3877 = _3290;
    float _3879 = _3839;
    float _3881 = _3841;
    if (!_3751)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3883 = _3875;
    float _3885 = _3883;
    float _3887 = _3883;
    if (!_3751)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3889 = _3877;
    float _3891 = -_3849;
    float _3893 = fma(_3891, _3873, 1.0);
    float _3895 = precise::clamp(_3893, 0.0, 1.0);
    float _3897 = _3895;
    float _3899 = _3889;
    float _3901 = _3889;
    if (!_3751)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3903 = _3879;
    float _3905 = _3895 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3907 = _3903;
    float _3909 = _3903;
    if (!_3751)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3911 = _3897;
    out.m_90.x = _3905;
    float _3913 = _3709 * _3841;
    float _3915 = fma(_3705, _3855, _3385);
    float _3917 = fma(_3707, _3855, _3387);
    float _3919 = _3391 * _3845;
    float _3921 = fma(_3391, _3913, _3389);
    float _3923 = _3911;
    float _3925 = _3911;
    if (!_3751)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3927 = _3881;
    out.m_92.x = _3915;
    out.m_92.y = _3917;
    out.m_92.z = _3921;
    out.m_92.w = _3919;
    bool _3929 = !_3751;
    float _3931 = _3927;
    float _3933 = _3927;
    if (!_3929)
    {
        bool _3935 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3937 = isnan(_3487);
        bool _3939 = _3935 || _3937;
        bool _3941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3943 = _3939 || _3941;
        if (!_3943)
        {
            float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3947 = _3487 + _3945;
            float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3951 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3949;
            float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3957 = 1.0 / _3951;
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3975 = _3947 * _3957;
            float _3977 = precise::clamp(_3975, 0.0, 1.0);
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3983 = fma(_3977, _3955, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3985 = fma(_3977, _3981, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3987 = fma(_3977, _3961, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3989 = fma(_3977, _3965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3991 = fma(_3977, _3969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3993 = fma(_3977, _3973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3987;
            _3925 = _3991;
            _3887 = _3983;
            _3909 = _3989;
            _3901 = _3985;
            _3933 = _3993;
            _3995 = true;
        }
        else
        {
            bool _3997 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3999 = isnan(_3487);
            bool _4001 = _3997 || _3999;
            bool _4003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4005 = _4001 || _4003;
            if (!_4005)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4007 = _3885;
            _3887 = _4007;
            if (!_4005)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4009 = _3815;
            _3817 = _4009;
            if (!_4005)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4011 = _3899;
            _3901 = _4011;
            if (!_4005)
            {
                _3907 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4013 = _3907;
            _3909 = _4013;
            if (!_4005)
            {
                _3923 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4015 = _3923;
            _3925 = _4015;
            if (!_4005)
            {
                _3931 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4017 = _3931;
            bool _4019 = !_4005;
            _3933 = _4017;
            if (!_4019)
            {
                bool _4021 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4023 = isnan(_3487);
                bool _4025 = _4021 || _4023;
                bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4029 = _4025 || _4027;
                if (!_4029)
                {
                    float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4033 = _3487 + _4031;
                    float _4035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4037 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4035;
                    float _4039 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4041 = _4039 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4043 = 1.0 / _4037;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4061 = _4033 * _4043;
                    float _4063 = precise::clamp(_4061, 0.0, 1.0);
                    float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4069 = fma(_4063, _4041, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4071 = fma(_4063, _4067, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4073 = fma(_4063, _4047, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4075 = fma(_4063, _4051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4077 = fma(_4063, _4055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4079 = fma(_4063, _4059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _4073;
                    _3925 = _4077;
                    _3887 = _4069;
                    _3909 = _4075;
                    _3901 = _4071;
                    _3933 = _4079;
                    _3995 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3925 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3909 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3933 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3995 = false;
    float _4081 = _3817;
    float _4083 = _3925;
    float _4085 = _3887;
    float _4087 = _3909;
    float _4089 = _3901;
    float _4091 = _3933;
    float _4093 = fma(_3857, -0.5, 0.5);
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = -_4081;
    float _4099 = _4097 + _4083;
    float _4101 = -_4085;
    float _4103 = _4101 + _4087;
    float _4105 = -_4089;
    float _4107 = _4105 + _4091;
    bool _4109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4111 = fma(_4095, _4099, _4081);
    float _4113 = fma(_4095, _4103, _4085);
    float _4115 = fma(_4095, _4107, _4089);
    float _4117 = _4111 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4119 = fma(_4113, 0.298911988735198974609375, _4117);
    float _4121 = fma(_4115, 0.114477999508380889892578125, _4119);
    float _4123 = -_4121;
    float _4125 = _4113 + _4123;
    float _4127 = -_4121;
    float _4129 = _4111 + _4127;
    float _4131 = -_4121;
    float _4133 = _4115 + _4131;
    float _4135 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4137 = fma(_4125, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    float _4139 = fma(_4129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    float _4141 = fma(_4133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    out.m_59.x = _4135;
    out.m_96.x = _4137;
    out.m_96.y = _4139;
    out.m_96.z = _4141;
    if (!_4109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4143 = -_3172;
    float _4145 = _4143 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4147 = -_3174;
    float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4151 = -_3178;
    float _4153 = _4151 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4155 = _4145 * _4145;
    float _4157 = fma(_4149, _4149, _4155);
    float _4159 = fma(_4153, _4153, _4157);
    float _4161 = sqrt(_4159);
    float _4163 = rsqrt(_4159);
    float _4165 = -_4161;
    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4169 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4171 = precise::clamp(_4169, 0.0, 1.0);
    float _4173 = _4149 * _4163;
    float _4175 = _4145 * _4163;
    float _4177 = abs(_4171);
    float _4179 = log2(_4177);
    float _4181 = _4153 * _4163;
    float _4183 = _4173 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4185 = _3857 * _4175;
    float _4187 = -_4175;
    float _4189 = -_4183;
    float _4191 = fma(_4187, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4189);
    float _4193 = fma(_3847, _4173, _4185);
    float _4195 = -_4181;
    float _4197 = fma(_4195, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4191);
    float _4199 = fma(_3859, _4181, _4193);
    float _4201 = precise::clamp(_4199, 0.0, 1.0);
    float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4205 = _4197 + _4203;
    float _4207 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4209 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4211 = precise::clamp(_4209, 0.0, 1.0);
    float _4213 = exp2(_4207);
    float _4215 = _4213 * _4211;
    float _4217 = _4201 * _4215;
    float _4219 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4221 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4223 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4219;
    out.m_94.y = _4221;
    out.m_94.z = _4223;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3995 = false;
    bool _947 = false;
    bool _775 = false;
    bool _557 = false;
    bool _381 = false;
    bool _233 = false;
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
        float _4280 = as_type<float>(_131);
        out.gl_Position.z = _4280;
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
        float _4349 = as_type<float>(_167);
        out.gl_Position.z = _4349;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_66.x;
    float _173 = in.m_66.y;
    float _175 = in.m_66.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    float _199 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_179;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_183;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_68.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_115);
        float _237 = 1.0 / _235;
        float _239 = _149 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_257;
    float _269 = _267 + 1.0;
    float _271 = 1.0 / _261;
    bool _273 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_241);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _287 = 1.0 / _265;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = _245 * _271;
    bool _295 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_241);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _241 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_291, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _305 * _269;
    float _319 = -_305;
    float _321 = _319 + 1.0;
    float _323 = fma(_313, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _309 * _287;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _283 * _321;
    float _333 = -_283;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = _323 * _331;
    float _345 = _315 * _331;
    float _347 = fma(_339, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _353 = fma(_341, _317, _349);
    float _355 = fma(_347, _317, _351);
    float _357 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    bool _361 = !_285;
    float _379;
    if (!_361)
    {
        float _363 = in.m_68.x;
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _363 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        float _383 = float(_115);
        float _385 = 1.0 / _383;
        float _387 = _149 * _385;
        _379 = _387;
    }
    _381 = false;
    float _389 = _379;
    float _391 = in.m_70.x;
    float _393 = in.m_70.y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _389 + _395;
    bool _399 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _411;
    float _415 = -_409;
    float _417 = _415 + 1.0;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _413;
    float _423 = _359 * _393;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _429 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _431 = isnan(_389);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _357 * _391;
    float _443 = _397 * _421;
    float _445 = 1.0 / _427;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _389 + _447;
    bool _451 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _453 = isnan(_389);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = _461 * _417;
    float _469 = -_461;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _477;
    float _481 = fma(_465, _443, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _483 = _439 * _471;
    float _485 = fma(_475, _443, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_479, _443, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = -_439;
    float _491 = _489 + 1.0;
    float _493 = _449 * _445;
    float _495 = _485 * _483;
    float _497 = _481 * _483;
    float _499 = _487 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].x, _495);
    float _515 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _517 = fma(_503, _493, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _519 = fma(_507, _493, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _521 = fma(_511, _493, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _523 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].z, _499);
    float _525 = fma(_517, _467, _513);
    float _527 = fma(_519, _467, _515);
    float _529 = fma(_521, _467, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _525);
    float _533 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _527);
    float _535 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _529);
    bool _537 = !_419;
    float _555;
    if (!_537)
    {
        float _539 = in.m_68.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_115);
        float _561 = 1.0 / _559;
        float _563 = _149 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _565 + _567;
    float _571 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _585 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _587 = isnan(_565);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _575;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _603 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _605 = isnan(_565);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _621 = 1.0 / _583;
    float _623 = _579 * _597;
    bool _625 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _601;
    float _639 = -_595;
    float _641 = _639 + 1.0;
    float _643 = fma(_623, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _649 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _651 = isnan(_565);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_635;
    float _663 = _661 + 1.0;
    float _665 = _635 * _641;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _671 = 1.0 / _647;
    float _673 = -_659;
    float _675 = _673 + 1.0;
    float _677 = _613 * _663;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _679;
    float _683 = _669 * _621;
    float _685 = _595 * _675;
    float _687 = _643 * _677;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _565 + _689;
    float _693 = -_613;
    float _695 = _693 + 1.0;
    bool _697 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _699 = isnan(_565);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _681 * _637;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _717 = _565 + _715;
    float _719 = fma(_683, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _687);
    float _723 = -_707;
    float _725 = _723 + 1.0;
    float _727 = _713 * _671;
    float _729 = fma(_709, _717, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _733 = _565 + _731;
    float _735 = fma(_719, _665, _721);
    float _737 = _659 * _725;
    float _739 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = fma(_727, _733, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _743 = fma(_729, _685, _735);
    float _745 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = fma(_741, _737, _743);
    float _749 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[119].x, _747);
    float _751 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _749 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _739;
    out.m_72.y = _745;
    out.m_72.z = _751;
    out.m_72.w = _753;
    bool _755 = !_619;
    float _773;
    if (!_755)
    {
        float _757 = in.m_68.x;
        float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _761 = _757 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _765 = _763 * _759;
        float _767 = floor(_765);
        float _769 = -_767;
        float _771 = _765 + _769;
        _773 = _771;
        _775 = true;
    }
    else
    {
        float _777 = float(_115);
        float _779 = 1.0 / _777;
        float _781 = _149 * _779;
        _773 = _781;
    }
    _775 = false;
    float _783 = _773;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = _783 + _785;
    bool _789 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _791 = isnan(_783);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    bool _801 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _803 = isnan(_783);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _821 = 1.0 / _815;
    bool _823 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _825 = 1.0 / _819;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _827;
    float _831 = _787 * _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _835 = _783 + _833;
    bool _837 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _839 = isnan(_783);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_799;
    float _851 = _849 + 1.0;
    float _853 = fma(_829, _831, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _855 = _847 * _851;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _865;
    float _869 = _811 * _859;
    float _871 = fma(_863, _831, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _873 = fma(_867, _831, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _875 = _835 * _825;
    float _877 = _853 * _869;
    float _879 = _871 * _869;
    float _881 = _873 * _869;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _891 = -_811;
    float _893 = _891 + 1.0;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _899 = fma(_885, _875, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _901 = fma(_889, _875, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].x, _879);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].y, _877);
    float _907 = fma(_897, _875, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].z, _881);
    float _911 = fma(_899, _855, _903);
    float _913 = fma(_901, _855, _905);
    float _915 = fma(_907, _855, _909);
    float _917 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].x, _911);
    float _919 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].y, _913);
    float _921 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].z, _915);
    bool _923 = !_823;
    float _925 = _913;
    float _927 = _917;
    float _945;
    if (!_923)
    {
        float _929 = in.m_68.x;
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _933 = _929 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _937 = _935 * _931;
        float _939 = floor(_937);
        float _941 = -_939;
        float _943 = _937 + _941;
        _945 = _943;
        _947 = true;
    }
    else
    {
        float _949 = float(_115);
        float _951 = 1.0 / _949;
        float _953 = _149 * _951;
        _945 = _953;
    }
    _947 = false;
    float _955 = _945;
    float _957 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _959 = int(_957);
    float _961 = in.m_68.x;
    float _963 = in.m_68.y;
    float _965 = in.m_68.z;
    float _967 = in.m_68.w;
    float _969 = float(_115);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _973 = _955 + _971;
    float _975 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _985 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _989 = float(_959);
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _993 = int(_991);
    float _995 = float(uint(_979));
    float _997 = 1.0 / _989;
    int _999 = ~_979;
    int _1001 = _999 + 1;
    float _1003 = _963 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1005 = _979 == 0;
    float _1007 = fma(_1003, -2.0, _987);
    bool _1009 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1011 = isnan(_955);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _995;
    float _1023 = float(uint(_993));
    float _1025 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1007);
    float _1027 = _149 * _997;
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1031 = int(_1029);
    int _1033 = ~_979;
    int _1035 = _1033 + 1;
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = trunc(_1027);
    int _1041 = int(_1039);
    float _1043 = float(_1031);
    float _1045 = 1.0 / _1023;
    float _1047 = float(uint(_1041));
    float _1049 = 1.0 / _1043;
    float _1051 = as_type<float>(_1037) * _1047;
    float _1053 = trunc(_1051);
    float _1055 = precise::max(_1053, 0.0);
    uint _1058 = uint(_1055);
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>(_1045) + (-2);
    int _1066 = ~_993;
    int _1068 = _1066 + 1;
    float _1070 = _149 * _1049;
    float _1072 = float(_979);
    float _1074 = 1.0 / _969;
    float _1076 = float(_1041);
    float _1078 = _1043;
    float _1080 = _1025;
    float _1082 = _961;
    float _1084 = _965;
    if (_1062)
    {
        float _1086 = in.m_68.x;
        _925 = _1086;
    }
    float _1088 = _925;
    if (_1062)
    {
        _1078 = 1.0;
    }
    float _1090 = _1078;
    int _1092 = _1035 * int(_1058);
    int _1094 = _1092 + _1041;
    float _1096 = _1090;
    if (!_1062)
    {
        _1096 = 1.2345600128173828125;
    }
    float _1098 = _1096;
    float _1100 = _1088;
    if (!_1062)
    {
        float _1102 = in.m_68.y;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = trunc(_1070);
    int _1108 = int(_1106);
    bool _1110 = _1076 >= _1072;
    bool _1112 = isnan(_1076);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(_1072);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = float(uint(_1094));
    float _1124 = as_type<float>(_1037) * _1122;
    float _1126 = _1122;
    if (_1062)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = trunc(_1120);
    int _1132 = int(_1130);
    float _1134 = _1128;
    if (!_1062)
    {
        _1134 = 7.345489978790283203125;
    }
    float _1136 = _1134;
    float _1138 = _1136 * _961;
    float _1140 = trunc(_1124);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    float _1146 = 1.0 / _983;
    int _1148 = int(_1058) + int(_1144);
    float _1150 = floor(_1138);
    int _1152 = _1001 * _1148;
    int _1154 = _1152 + _1041;
    bool _1156 = uint(_1154) >= uint(_979);
    float _1158 = _1104 * _1098;
    float _1160 = float(uint(_1108));
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = floor(_1158);
    float _1168 = as_type<float>(_1064) * _1160;
    int _1170 = ~_1148;
    int _1172 = _1170 + _1164;
    int _1174 = _1172 + 1;
    float _1176 = -_1150;
    float _1178 = _1138 + _1176;
    int _1180 = ~_1132;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _979 + (-1);
    int _1188 = _979 * _1174;
    int _1190 = _1188 + _1041;
    float _1192 = trunc(_1168);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    bool _1198 = !_1005;
    int _1200 = _1198 ? _1190 : (-1);
    float _1202 = -_1166;
    float _1204 = _1158 + _1202;
    int _1206 = _1200 * _1184;
    float _1208 = _1178 * _1072;
    float _1210 = _149 * _1074;
    int _1212 = _1132 * _1186;
    int _1214 = _1212 + _1206;
    float _1216 = _1210 * _1072;
    int _1218 = _1068 * int(_1196);
    int _1220 = _1218 + _1108;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1228 = _1226 != 0;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1208);
    int _1236 = int(_1234);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1240 = _1238 != 0;
    float _1242 = float(uint(_1220));
    bool _1244 = !_1240;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = !_1228;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = trunc(_1216);
    int _1254 = int(_1252);
    float _1256 = as_type<float>(_1064) * _1242;
    bool _1258 = !_1224;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = abs(_1246);
    int _1264 = abs(_1250);
    float _1266 = trunc(_1256);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    int _1272 = abs(_1260);
    int _1274 = _1236 * _1262;
    int _1276 = _1274 + _1041;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1280 = _1278 != 0;
    int _1282 = _1214 * _1264;
    bool _1284 = !_1232;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = !_1280;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _1254 * _1272;
    int _1294 = _1292 + _1282;
    int _1296 = abs(_1286);
    int _1298 = abs(_1290);
    int _1300 = ~_993;
    int _1302 = _1300 + 1;
    int _1304 = _1276 * _1296;
    int _1306 = _1304 + _1294;
    float _1308 = float(_993);
    int _1310 = int(_1196) + int(_1270);
    int _1312 = _1236 * _1298;
    int _1314 = _1312 + _1306;
    float _1316 = _1204 * _1308;
    float _1318 = float(_1108);
    float _1320 = float(uint(_1314));
    int _1322 = _1302 * _1310;
    int _1324 = _1322 + _1108;
    bool _1326 = _1318 >= _1308;
    bool _1328 = isnan(_1318);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(_1308);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = trunc(_1316);
    int _1340 = int(_1338);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1344 = _1342 != 0;
    float _1346 = as_type<float>(_1037) * _1320;
    bool _1348 = uint(_1324) >= uint(_993);
    float _1350 = _1210 * _1308;
    bool _1352 = !_1344;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = !_1348;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = trunc(_1336);
    int _1362 = int(_1360);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1378 = _1376 != 0;
    int _1380 = ~_1310;
    int _1382 = _1380 + _1358;
    int _1384 = _1382 + 1;
    bool _1386 = _993 == 0;
    int _1388 = abs(_1354);
    float _1390 = trunc(_1346);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    int _1396 = _993 * _1384;
    int _1398 = _1396 + _1108;
    int _1400 = ~_979;
    int _1402 = _1400 + 1;
    int _1404 = _1340 * _1388;
    int _1406 = _1404 + _1108;
    int _1408 = _993 + (-1);
    bool _1410 = !_1386;
    int _1412 = _1410 ? _1398 : (-1);
    float _1414 = trunc(_1350);
    int _1416 = int(_1414);
    int _1418 = ~_1362;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    bool _1424 = _979 == 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1428 = _1426 != 0;
    int _1430 = _1412 * _1422;
    bool _1432 = !_1370;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = _1402 * int(_1394);
    int _1438 = _1436 + _1314;
    int _1440 = _1362 * _1408;
    int _1442 = _1440 + _1430;
    int _1444 = abs(_1434);
    float _1446 = float(uint(_1438));
    bool _1448 = !_1366;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = !_1374;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = as_type<float>(_1037) * _1446;
    int _1458 = abs(_1450);
    int _1460 = abs(_1454);
    int _1462 = _1442 * _1444;
    float _1464 = float(uint(_1276));
    float _1466 = trunc(_1456);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    bool _1472 = !_1378;
    int _1474 = _1472 ? 0 : 1;
    int _1476 = _1416 * _1458;
    int _1478 = _1476 + _1462;
    int _1480 = 0;
    if (_1428)
    {
        _1480 = 0;
    }
    int _1482 = _1480;
    float _1484 = as_type<float>(_1037) * _1464;
    int _1486 = abs(_1474);
    int _1488 = _1406 * _1460;
    int _1490 = _1488 + _1478;
    float _1492 = float(uint(_1406));
    float _1494 = trunc(_1484);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = ~_979;
    int _1502 = _1500 + 1;
    int _1504 = _1340 * _1486;
    int _1506 = _1504 + _1490;
    int _1508 = ~_979;
    int _1510 = _1508 + 1;
    float _1512 = as_type<float>(_1064) * _1492;
    int _1514 = ~_993;
    int _1516 = _1514 + 1;
    float _1518 = float(uint(_1506));
    int _1520 = int(_1394) + int(_1470);
    float _1522 = trunc(_1512);
    float _1524 = precise::max(_1522, 0.0);
    uint _1526 = uint(_1524);
    int _1528 = _1482;
    if (!_1428)
    {
        _1528 = 1;
    }
    int _1530 = _1528;
    float _1532 = as_type<float>(_1064) * _1518;
    int _1534 = _1510 * _1520;
    int _1536 = _1534 + _1314;
    int _1538 = _1502 * int(_1498);
    int _1540 = _1538 + _1276;
    float _1542 = trunc(_1532);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    bool _1548 = uint(_1536) >= uint(_979);
    float _1550 = float(uint(_1540));
    bool _1552 = !_1548;
    int _1554 = _1552 ? 0 : (-1);
    float _1556 = as_type<float>(_1037) * _1550;
    int _1558 = ~_1520;
    int _1560 = _1558 + _1554;
    int _1562 = _1560 + 1;
    int _1564 = _1516 * int(_1526);
    int _1566 = _1564 + _1406;
    int _1568 = ~_979;
    int _1570 = _1568 + 1;
    int _1572 = _979 * _1562;
    int _1574 = _1572 + _1314;
    float _1576 = trunc(_1556);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    float _1582 = float(uint(_1566));
    int _1584 = _1516 * int(_1546);
    int _1586 = _1584 + _1506;
    bool _1588 = !_1424;
    int _1590 = _1588 ? _1574 : (-1);
    float _1592 = as_type<float>(_1064) * _1582;
    float _1594 = float(uint(_1586));
    int _1596 = _1590 & 3;
    bool _1598 = _1596 != 0;
    float _1600 = trunc(_1592);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = _1590 & 3;
    bool _1608 = _1606 != 0;
    float _1610 = as_type<float>(_1064) * _1594;
    bool _1612 = uint(_1596) > 1u;
    bool _1614 = _1596 != 3;
    int _1616 = int(_1498) + int(_1580);
    float _1618 = trunc(_1610);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    int _1624 = _1608 ? 0 : 1;
    bool _1626 = uint(_1596) >= 2u;
    int _1628 = _1570 * _1616;
    int _1630 = _1628 + _1276;
    int _1632 = ~_1624;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = _1636;
    if (!_1612)
    {
        int _1640 = ~_1624;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    int _1646 = _1626 ? 0 : 1;
    bool _1648 = uint(_1630) >= uint(_979);
    int _1650 = int(_1526) + int(_1604);
    int _1652 = ~_993;
    int _1654 = _1652 + 1;
    int _1656 = ~_993;
    int _1658 = _1656 + 1;
    int _1660 = ~_1646;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1664;
    if (_1614)
    {
        int _1668 = ~_1646;
        int _1670 = _1668 + 1;
        _1666 = _1670;
    }
    int _1672 = _1666;
    int _1674 = _1654 * _1650;
    int _1676 = _1674 + _1406;
    int _1678 = int(_1546) + int(_1622);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1682 = _1680 != 0;
    bool _1684 = !_1648;
    int _1686 = _1684 ? 0 : (-1);
    int _1688 = _1658 * _1678;
    int _1690 = _1688 + _1506;
    bool _1692 = !_1682;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = uint(_1676) >= uint(_993);
    bool _1698 = uint(_1690) >= uint(_993);
    bool _1700 = !_1696;
    int _1702 = _1700 ? 0 : (-1);
    bool _1704 = _961 > 0.5;
    int _1706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1708 = _1706 != 0;
    float _1710 = -_207;
    int _1712 = _1704 ? as_type<int>(_1710) : as_type<int>(_207);
    float _1714 = in.m_56.x;
    float _1716 = in.m_56.y;
    float _1718 = in.m_56.z;
    bool _1720 = !_1698;
    int _1722 = _1720 ? 0 : (-1);
    bool _1724 = _963 > 0.5;
    bool _1726 = !_1708;
    float _1728 = _1726 ? _207 : as_type<float>(_1712);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    float _1734 = -_211;
    int _1736 = _1724 ? as_type<int>(_1734) : as_type<int>(_211);
    bool _1738 = !_1732;
    float _1740 = _1738 ? _211 : as_type<float>(_1736);
    float _1742 = _961 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1744 = _965 > 0.5;
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1748 = _1746 != 0;
    float _1750 = -_207;
    int _1752 = _1744 ? as_type<int>(_1750) : as_type<int>(_207);
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1756 = _1754 != 0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1760 = _1758 != 0;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1766 = _967 > 0.5;
    float _1768 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1770 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1772 = 1.0 / _1764;
    float _1774 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1786 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1768);
    float _1788 = -_1776;
    float _1790 = fma(_1742, 2.0, _1788);
    float _1792 = _1780 * _1146;
    float _1794 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1770);
    float _1796 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1774);
    bool _1798 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1800 = isnan(_955);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1810;
    bool _1814 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1816 = isnan(_955);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = 1.0 / _1784;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1832 = _1812 * _1772;
    float _1834 = -_1808;
    float _1836 = _1834 + 1.0;
    bool _1838 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1840 = isnan(_955);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -_1824;
    float _1852 = _1850 + 1.0;
    bool _1854 = !_1760;
    float _1856 = _1854 ? _207 : as_type<float>(_1752);
    float _1858 = _1824 * _1836;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1862 = _955 + _1860;
    float _1864 = _1848 * _1852;
    float _1866 = -_1848;
    float _1868 = _1866 + 1.0;
    float _1870 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1794);
    float _1872 = fma(_1792, _1862, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1874 = _1530 != 1;
    float _1876 = _1019 * _1868;
    float _1878 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1796);
    float _1880 = _1830 * _1826;
    float _1882 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1786);
    float _1884 = _1872 * _1876;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1888 = _955 + _1886;
    float _1890 = -_149;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1790);
    float _1894 = -_1019;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1880, _973, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1900 = ~_1678;
    int _1902 = _1900 + _1722;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1832, _1888, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1884);
    float _1910 = _1740 + (-0.5);
    int _1912 = _993 * _1904;
    int _1914 = _1912 + _1506;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1918 = _1728 + 0.5;
    float _1920 = -_1910;
    float _1922 = -_1025;
    float _1924 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1922);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1928 = fma(_1898, _1864, _1908);
    float _1930 = _1832;
    if (!_1874)
    {
        _1930 = _963;
    }
    float _1932 = _1930;
    float _1934 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1916);
    float _1936 = _1932;
    if (!_1874)
    {
        _1080 = _963;
    }
    float _1938 = _1080;
    float _1940 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1892);
    int _1942 = _1590 >> 31;
    float _1944 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1926);
    float _1946 = _1938;
    if (_1874)
    {
        _1936 = _961;
    }
    float _1948 = _1936;
    float _1950 = fma(_1906, _1858, _1928);
    if (_1874)
    {
        _1946 = _961;
    }
    float _1952 = _1946;
    float _1954 = _1870 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1956 = !_1386;
    int _1958 = _1956 ? _1914 : (-1);
    float _1960 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1950);
    int _1962 = as_type<int>(_1960);
    if (!_1874)
    {
        _1082 = _965;
    }
    float _1964 = _1082;
    float _1966 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1968 = _1964;
    if (_1874)
    {
        _1084 = _963;
    }
    float _1970 = _1084;
    float _1972 = _1856 + 0.5;
    if (_1874)
    {
        _1968 = _963;
    }
    float _1974 = _1968;
    int _1976 = _1942 & 3;
    float _1978 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1980 = _1958 >> 31;
    int _1982 = _1590 + _1976;
    int _1984 = _1980 & 3;
    int _1986 = _1958 + _1984;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1992 = _1982 >> 2;
    float _1994 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1988);
    int _1996 = _1986 >> 2;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2000 = !_1598;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2006 = _1958 & 3;
    bool _2008 = _2006 != 0;
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1998);
    int _2012 = _1992 << 4;
    int _2014 = _2012 + 368;
    float _2016 = fma(_1978, -2.0, _1990);
    int _2018 = _1958 & 3;
    bool _2020 = _2018 != 0;
    float _2022 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1944);
    int _2024 = _1996 << 4;
    int _2026 = _2024 + 512;
    uint _2028 = uint(int(uint(_2014) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    int _2044 = _2008 ? 0 : 1;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2048 = _1954 + _2046;
    bool _2050 = uint(_2018) > 1u;
    float _2052 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1994);
    float _2054 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2056 = !_2020;
    int _2058 = _2056 ? 0 : 1;
    uint _2060 = uint(int(uint(_2026) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    bool _2076 = _1596 != 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2080 = _1882 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _1966 + _2082;
    int _2086 = ~_1616;
    int _2088 = _2086 + _1686;
    int _2090 = _2088 + 1;
    float _2092 = -_2078;
    float _2094 = fma(_2004, 2.0, _2092);
    int _2096 = ~_2044;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    int _2102 = _2026 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = _2100;
    if (!_2050)
    {
        int _2122 = ~_2044;
        int _2124 = _2122 + 1;
        _2120 = _2124;
    }
    int _2126 = _2120;
    float _2128 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1934);
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2132 = _2080 + _2130;
    int _2134 = abs(_1644);
    int _2136 = _979 * _2090;
    int _2138 = _2136 + _1276;
    int _2140 = abs(_2126);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2054);
    int _2144 = _2014 + 8;
    uint _2146 = uint(int(uint(_2144) >> uint(2)));
    uint _2148 = uint(int(uint(int(_2146)) >> uint(2)));
    int _2150 = int(_2146) & 3;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[int(_2148)][_2150];
    int _2154 = int(_2146) + 1;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    int _2158 = _2154 & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = ~_2134;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = -_149;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2094);
    float _2172 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2142);
    bool _2174 = !_2076;
    int _2176 = _2174 ? 0 : (-1);
    float _2178 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2010);
    bool _2180 = _2018 != 3;
    float _2182 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2016);
    bool _2184 = uint(_2018) >= 2u;
    float _2186 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2170);
    int _2188 = abs(_2002);
    float _2190 = -_2178;
    float _2192 = _2190 + 1.0;
    int _2194 = ~_2140;
    int _2196 = _2194 + 1;
    int _2198 = _2196 + 1;
    float _2200 = -_2128;
    float _2202 = _2200 + 1.0;
    int _2204 = abs(_2058);
    int _2206 = _2184 ? 0 : 1;
    int _2208 = abs(_1672);
    int _2210 = ~_2206;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = _2214;
    if (_2180)
    {
        int _2218 = ~_2206;
        int _2220 = _2218 + 1;
        _2216 = _2220;
    }
    int _2222 = _2216;
    int _2224 = _2166 * as_type<int>(_2042);
    bool _2226 = _2018 != 3;
    int _2228 = ~_2188;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    int _2234 = abs(_2222);
    int _2236 = _2198 * as_type<int>(_2074);
    int _2238 = _2232 * as_type<int>(_2034);
    int _2240 = _2238 + _2224;
    int _2242 = ~_2208;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = ~_2204;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2234;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = abs(_2176);
    int _2262 = _2252 * as_type<int>(_2066);
    int _2264 = _2262 + _2236;
    bool _2266 = !_2226;
    int _2268 = _2266 ? 0 : (-1);
    bool _2270 = !_1424;
    int _2272 = _2270 ? _2138 : (-1);
    int _2274 = _2258 * as_type<int>(_2110);
    int _2276 = _2274 + _2264;
    int _2278 = abs(_1694);
    int _2280 = _2246 * as_type<int>(_2152);
    int _2282 = _2280 + _2240;
    int _2284 = abs(_2268);
    bool _2286 = !_1756;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = ~_2260;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2288);
    int _2298 = ~_2278;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    int _2304 = _2294 * as_type<int>(_2160);
    int _2306 = _2304 + _2282;
    int _2308 = ~_2284;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    int _2314 = ~_1650;
    int _2316 = _2314 + _1702;
    int _2318 = _2316 + 1;
    int _2320 = _2306 * _2302;
    bool _2322 = _2172 >= 0.0;
    int _2324 = _2312 * as_type<int>(_2118);
    int _2326 = _2324 + _2276;
    int _2328 = ~_2296;
    int _2330 = _2328 + 1;
    int _2332 = _2330 + 1;
    int _2334 = _2272 * _2278;
    int _2336 = _2334 + _2320;
    float _2338 = _2048 * _2048;
    float _2340 = -_211;
    int _2342 = _1766 ? as_type<int>(_2340) : as_type<int>(_211);
    int _2344 = _993 * _2318;
    int _2346 = _2344 + _1406;
    float _2348 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2350 = _2326 * _2332;
    float _2352 = -_2052;
    float _2354 = _2352 + 1.0;
    float _2356 = fma(_2132, _2132, _2338);
    bool _2358 = !_1748;
    float _2360 = _2358 ? _211 : as_type<float>(_2342);
    float _2362 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2364 = -_2354;
    float _2366 = fma(_1856, _2364, _2186);
    float _2368 = fma(_2084, _2084, _2356);
    bool _2370 = !_1386;
    int _2372 = _2370 ? _2346 : (-1);
    float _2374 = _2360 + (-0.5);
    if (_2322)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2376 = _927;
    float _2378 = _1960 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2380 = _2362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2382 = rsqrt(_2368);
    float _2384 = -_2374;
    float _2386 = -_2182;
    float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2386);
    int _2390 = _2372 * _2296;
    int _2392 = _2390 + _2350;
    float _2394 = -_2022;
    float _2396 = _2394 + 1.0;
    float _2398 = -_2202;
    float _2400 = fma(_1728, _2398, _1940);
    float _2402 = fma(_2360, _2192, _2388);
    float _2404 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = fma(_1740, _2396, _1924);
    if (_2322)
    {
        float _2408 = _2376 * 5.0;
        _1962 = as_type<int>(_2408);
    }
    int _2410 = _1962;
    float _2412 = float(_2336);
    out.m_74.x = _2380;
    out.m_74.y = _2404;
    out.m_74.z = _985;
    out.m_74.w = _2378;
    float _2414 = float(_2392);
    out.m_76.x = _2400;
    out.m_76.y = _2406;
    out.m_76.z = _2366;
    out.m_76.w = _2402;
    float _2416 = _2048 * _2382;
    float _2418 = _2132 * _2382;
    float _2420 = as_type<float>(_2410);
    float _2422 = _2416;
    if (_2322)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7742 = as_type<float>(_2410);
        out.gl_Position.z = _7742;
    }
    out.m_78.x = _2412;
    out.m_78.y = _2414;
    if (_2322)
    {
        out.m_59.x = 0.0;
    }
    if (_2322)
    {
        return out;
    }
    float _2424 = -_2416;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1954);
    float _2428 = _2084 * _2382;
    float _2430 = -_2418;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2436 = _2426 + _2434;
    float _2438 = -_2428;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _2442 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2444 = _2432 + _2442;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2450 = _2440 + _2448;
    float _2452 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2446);
    float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2452);
    bool _2456 = _2454 >= 0.0;
    float _2458 = _2436;
    float _2460 = _2440;
    if (_2456)
    {
        _2420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2462 = _2420;
    int _2464 = as_type<int>(_2462);
    if (_2456)
    {
        out.m_59.x = 0.0;
    }
    if (_2456)
    {
        float _2466 = _2462 * 5.0;
        _2464 = as_type<int>(_2466);
    }
    int _2468 = _2464;
    if (_2456)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7842 = as_type<float>(_2468);
        out.gl_Position.z = _7842;
    }
    if (_2456)
    {
        return out;
    }
    float _2470 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2472 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2474 = floor(_2470);
    float _2476 = floor(_2472);
    float _2478 = -_2474;
    float _2480 = _2470 + _2478;
    float _2482 = -_2476;
    float _2484 = _2472 + _2482;
    float2 _7878 = float2(_2480, _2484);
    float _2486 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7878, float2(0.0), isnan(_7878)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7878, float2(0.0), isnan(_7878)), level(0.0)).x;
    float _2488 = -_1954;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2492 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2494 = -_2080;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2498 = -_1966;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2502 = _2490 * _2490;
    float _2504 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2492);
    float _2506 = -_2416;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2510 = -_2418;
    float _2512 = fma(_2510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2514 = fma(_2496, _2496, _2502);
    float _2516 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2504);
    float _2518 = _2508 * _2508;
    float _2520 = -_2428;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2524 = fma(_2500, _2500, _2514);
    float _2526 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2528 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2530 = fma(_2512, _2512, _2518);
    float _2532 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2534 = 1.0 / _2526;
    float _2536 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2528);
    float _2538 = fma(_2522, _2522, _2530);
    float _2540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2544 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2536);
    float _2546 = rsqrt(_2524);
    float _2548 = _2544 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2550 = _2548 + _2526;
    float _2552 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2554 = _2550 * _2534;
    float _2556 = _2554 * 0.5;
    float _2558 = _2426 + _2552;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2560);
    float _2564 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2566 = _2496 * _2546;
    float _2568 = _2490 * _2546;
    float _2570 = _2500 * _2546;
    float _2572 = 1.0 / _2562;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2576 = _2566 * _2574;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2580 = _2570 * _2578;
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2584 = -_2576;
    float _2586 = fma(_2570, _2582, _2584);
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2590 = _2568 * _2588;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2594 = -_2580;
    float _2596 = fma(_2568, _2592, _2594);
    float _2598 = _2586 * _2586;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2602 = -_2590;
    float _2604 = fma(_2566, _2600, _2602);
    float _2606 = sqrt(_2538);
    float _2608 = fma(_2596, _2596, _2598);
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2612 = _2572 * _2610;
    float _2614 = fma(_2604, _2604, _2608);
    float _2616 = rsqrt(_2614);
    bool _2618 = _2612 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2620 = _2612 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2622 = _2382 * _2606;
    float _2624 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2626 = _2622 * _2532;
    float _2628 = _2622 * _2624;
    bool _2630 = !_2618;
    int _2632 = _2630 ? 0 : 1;
    float _2634 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2636 = _2634 * 0.5;
    float _2638 = _2540 * _2626;
    float _2640 = _2542 * _2628;
    float _2642 = _2596 * _2616;
    float _2644 = _2586 * _2616;
    float _2646 = _2604 * _2616;
    int _2648 = 2;
    float _2650 = _2640;
    float _2652 = _2622;
    float _2654 = _2558;
    float _2656 = _2644;
    if (!_2618)
    {
        _2648 = 1;
    }
    int _2658 = _2648;
    float _2660 = _2568 * _2642;
    float _2662 = _2570 * _2644;
    int _2664 = _2658;
    if (!_2620)
    {
        _2664 = _2632;
    }
    int _2666 = _2664;
    float _2668 = _2566 * _2646;
    float _2670 = -_2660;
    float _2672 = fma(_2566, _2644, _2670);
    float _2674 = -_2662;
    float _2676 = fma(_2568, _2646, _2674);
    int _2678 = _2666 << 6;
    float _2680 = -_2668;
    float _2682 = fma(_2570, _2642, _2680);
    float _2684 = _2638 * _2672;
    float _2686 = _2638 * _2676;
    int _2688 = _2678 + 48;
    uint _2690 = uint(int(uint(_2688) >> uint(2)));
    uint _2692 = uint(int(uint(int(_2690)) >> uint(2)));
    int _2694 = int(_2690) & 3;
    float _2696 = (*spvDescriptorSet0.vp_c15)._m0[int(_2692)][_2694];
    int _2698 = int(_2690) + 1;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    int _2702 = _2698 & 3;
    float _2704 = (*spvDescriptorSet0.vp_c15)._m0[int(_2700)][_2702];
    float _2706 = fma(_2640, _2646, _2684);
    float _2708 = fma(_2640, _2642, _2686);
    float _2710 = fma(_2636, _2570, _2706);
    float _2712 = fma(_2636, _2566, _2708);
    int _2714 = _2678 + 56;
    uint _2716 = uint(int(uint(_2714) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _1966 + _2710;
    float _2734 = _2080 + _2712;
    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2738 = _2732 + _2736;
    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2742 = _2734 + _2740;
    int _2744 = _2678 + 64;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    uint _2748 = uint(int(uint(int(_2746)) >> uint(2)));
    int _2750 = int(_2746) & 3;
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[int(_2748)][_2750];
    int _2754 = int(_2746) + 1;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    int _2758 = _2754 & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    float _2762 = _2738 * _2738;
    float _2764 = fma(_2742, _2742, _2762);
    float _2766 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2564);
    int _2768 = _2678 + 72;
    uint _2770 = uint(int(uint(_2768) >> uint(2)));
    uint _2772 = uint(int(uint(int(_2770)) >> uint(2)));
    int _2774 = int(_2770) & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    int _2778 = int(_2770) + 1;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    int _2782 = _2778 & 3;
    float _2784 = (*spvDescriptorSet0.vp_c15)._m0[int(_2780)][_2782];
    float _2786 = sqrt(_2764);
    float _2788 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2766);
    float _2790 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2792 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _2794 = _2678 + 96;
    uint _2796 = uint(int(uint(_2794) >> uint(2)));
    uint _2798 = uint(int(uint(int(_2796)) >> uint(2)));
    int _2800 = int(_2796) & 3;
    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[int(_2798)][_2800];
    int _2804 = int(_2796) + 1;
    uint _2806 = uint(int(uint(_2804) >> uint(2)));
    int _2808 = _2804 & 3;
    float _2810 = (*spvDescriptorSet0.vp_c15)._m0[int(_2806)][_2808];
    float _2812 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2790);
    float _2814 = trunc(_2792);
    int _2816 = int(_2814);
    float _2818 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2812);
    float _2820 = _2638 * _2682;
    int _2822 = _2678 + 104;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    uint _2826 = uint(int(uint(int(_2824)) >> uint(2)));
    int _2828 = int(_2824) & 3;
    float _2830 = (*spvDescriptorSet0.vp_c15)._m0[int(_2826)][_2828];
    int _2832 = int(_2824) + 1;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    int _2836 = _2832 & 3;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[int(_2834)][_2836];
    float _2840 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2842 = _2786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2844 = fma(_2640, _2644, _2820);
    float _2846 = trunc(_2840);
    int _2848 = int(_2846);
    float _2850 = fma(_2636, _2568, _2844);
    float _2852 = _1954 + _2850;
    int _2854 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2856 = _2816 + _2854;
    int _2858 = _2856 + 1;
    float _2860 = _2734;
    float _2862 = _2732;
    int _2864 = as_type<int>(_2722);
    float _2866 = as_type<float>(_2666);
    float _2868 = _2840;
    if (!_2842)
    {
        _2650 = _2734;
    }
    float _2870 = _2650;
    float _2872 = _2870;
    if (!_2842)
    {
        _2860 = _2852;
    }
    float _2874 = _2860;
    bool _2876 = !_2842;
    float _2878 = _2874;
    int _2880 = as_type<int>(_2802);
    int _2882 = as_type<int>(_2838);
    int _2884 = as_type<int>(_2752);
    if (!_2876)
    {
        float _2886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2890 = _2786 + _2888;
        float _2892 = rsqrt(_2764);
        float _2894 = _2890 * _2886;
        float _2896 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2898 = _2894 * 0.15915493667125701904296875;
        float _2900 = _2898 * 6.283185482025146484375;
        float _2902 = cos(_2900);
        float _2904 = _2898 * 6.283185482025146484375;
        float _2906 = sin(_2904);
        float _2908 = _2902 + (-1.0);
        float _2910 = fma(_2906, _2896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2914 = _2892 * _2910;
        float _2916 = fma(_2852, _2902, _2912);
        float _2918 = fma(_2742, _2914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2920 = fma(_2738, _2914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2878 = _2916;
        _2872 = _2918;
        _2862 = _2920;
    }
    float _2922 = _2878;
    float _2924 = _2872;
    float _2926 = _2862;
    float _2928 = -_1954;
    float _2930 = _2928 + _2922;
    int _2932 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2934 = _2848 + _2932;
    int _2936 = _2934 + 1;
    int _2938 = _2678 + 80;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    uint _2942 = uint(int(uint(int(_2940)) >> uint(2)));
    int _2944 = int(_2940) & 3;
    float _2946 = (*spvDescriptorSet0.vp_c15)._m0[int(_2942)][_2944];
    int _2948 = int(_2940) + 1;
    uint _2950 = uint(int(uint(_2948) >> uint(2)));
    int _2952 = _2948 & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    float _2956 = -_2080;
    float _2958 = _2956 + _2924;
    float _2960 = _2930 * _2930;
    float _2962 = -_1966;
    float _2964 = _2962 + _2926;
    bool _2966 = _2858 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2968 = fma(_2958, _2958, _2960);
    int _2970 = _2858 | _2936;
    bool _2972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2974 = isnan(0.5);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2964, _2964, _2968);
    bool _2984 = _2970 < 0;
    bool _2986 = _2984 || _2966;
    float _2988 = _2558 * _2810;
    float _2990 = sqrt(_2982);
    bool _2992 = _2936 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2994 = _2992 || _2986;
    float _2996 = fma(_2432, _2802, _2988);
    float _2998 = _2558 * _2704;
    float _3000 = fma(_2440, _2830, _2996);
    float _3002 = fma(_2432, _2696, _2998);
    float _3004 = _3000 + _2838;
    float _3006 = fma(_2440, _2722, _3002);
    float _3008 = _2926;
    float _3010 = _2924;
    float _3012 = _2922;
    if (!_2994)
    {
        int _3014 = _2936 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3016 = _3014 + _2858;
        _2880 = _3016;
    }
    int _3018 = _2880;
    float _3020 = _2830;
    if (!_2994)
    {
        float _3022 = floor(_2792);
        _3020 = _3022;
    }
    float _3024 = _3020;
    bool _3026 = _2990 > 0.0;
    float _3028 = _2558 * _2760;
    float _3030 = _3006 + _2730;
    if (!_2994)
    {
        int _3032 = _3018 << 2;
        _2882 = _3032;
    }
    int _3034 = _2882;
    float _3036 = fma(_2432, _2752, _3028);
    int _3038 = _3034;
    if (!_2994)
    {
        uint _3040 = uint(int(uint(_3018) >> uint(2)));
        _2884 = int(_3040);
    }
    int _3042 = _2884;
    float _3044 = 1.0 / _3004;
    if (!_2994)
    {
        int _3046 = 12 & _3034;
        _3038 = _3046;
    }
    int _3048 = _3038;
    float _3050 = fma(_2440, _2776, _3036);
    float _3052 = as_type<float>(_3048);
    if (!_2994)
    {
        int _3054 = _3042 << 4;
        int _3056 = _3054 + _3048;
        _2864 = _3056;
    }
    int _3058 = _2864;
    bool _3060 = !_3026;
    if (!_3060)
    {
        float _3062 = _201 * _201;
        float _3064 = rsqrt(_2982);
        float _3066 = fma(_199, _199, _3062);
        float _3068 = fma(_203, _203, _3066);
        float _3070 = sqrt(_3068);
        float _3072 = _2958 * _3064;
        float _3074 = _2930 * _3064;
        float _3076 = _2964 * _3064;
        bool _3078 = _3070 > 0.0;
        bool _3080 = !_3078;
        _3052 = _3074;
        if (!_3080)
        {
            float _3082 = rsqrt(_3068);
            float _3084 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3086 = _201 * _3082;
            float _3088 = _199 * _3082;
            float _3090 = _3074 * _3086;
            float _3092 = _203 * _3082;
            float _3094 = fma(_3072, _3088, _3090);
            float _3096 = _3084 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3098 = fma(_3076, _3092, _3094);
            float _3100 = _3098 * _3096;
            float _3102 = fma(_199, _3100, _2924);
            float _3104 = fma(_201, _3100, _2922);
            float _3106 = fma(_203, _3100, _2926);
            _3008 = _3106;
            _3010 = _3102;
            _3012 = _3104;
            _3052 = _3090;
        }
    }
    float _3108 = _3008;
    float _3110 = _3010;
    float _3112 = _3012;
    float _3114 = _3052;
    float _3116 = -_2428;
    float _3118 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3108);
    float _3120 = _3050 + _2784;
    float _3122 = -_2418;
    float _3124 = fma(_3122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3110);
    float _3126 = -_2416;
    float _3128 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3112);
    float _3130 = _3128;
    float _3132 = _3124;
    float _3134 = _3118;
    if (!_2980)
    {
        float _3136 = _2436 * _2436;
        float _3138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3140 = -_1954;
        float _3142 = _3140 + _3112;
        float _3144 = -_1966;
        float _3146 = _3144 + _3108;
        float _3148 = fma(_2444, _2444, _3136);
        float _3150 = fma(_2450, _2450, _3148);
        float _3152 = 1.0 / _2622;
        float _3154 = sqrt(_3150);
        float _3156 = precise::min(_3154, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3158 = _3156 * _3138;
        float _3160 = _3158 * _3152;
        float _3162 = -_2080;
        float _3164 = _3162 + _3110;
        float _3166 = fma(_3142, _3160, _2426);
        float _3168 = fma(_3164, _3160, _2432);
        float _3170 = fma(_3146, _3160, _2440);
        _3130 = _3166;
        _3132 = _3168;
        _2458 = _3136;
        _3134 = _3170;
        _2652 = _3152;
    }
    float _3172 = _3130;
    float _3174 = _3132;
    float _3176 = _2458;
    float _3178 = _3134;
    float _3180 = _2652;
    int _3182 = _2678 + 88;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    uint _3186 = uint(int(uint(int(_3184)) >> uint(2)));
    int _3188 = int(_3184) & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    int _3192 = int(_3184) + 1;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    int _3196 = _3192 & 3;
    float _3198 = (*spvDescriptorSet0.vp_c15)._m0[int(_3194)][_3196];
    float _3200 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3202 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3204 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3206 = _3030 * _3044;
    float _3208 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3200);
    float _3210 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3202);
    float _3212 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3204);
    float _3214 = _3176;
    float _3216 = _3180;
    if (!_2994)
    {
        int _3218 = _3058 + 400;
        uint _3220 = uint(int(uint(_3218) >> uint(2)));
        uint _3222 = uint(int(uint(int(_3220)) >> uint(2)));
        int _3224 = int(_3220) & 3;
        float _3226 = (*spvDescriptorSet0.vp_c15)._m0[int(_3222)][_3224];
        _3214 = _3226;
    }
    float _3228 = _3214;
    float _3230 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3208);
    float _3232 = _3120 * _3044;
    bool _3234 = _3206 >= 0.0;
    float _3236 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3210);
    float _3238 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3240 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3212);
    float _3242 = _3230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3244 = _3206 <= 1.0;
    bool _3246 = _3244 && _3234;
    float _3248 = _3236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3250 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3238);
    float _3252 = _3240 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3256 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3258 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3260 = _3232 >= 0.0;
    bool _3262 = _3260 && _3246;
    float _3264 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3250);
    float _3266 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3254);
    float _3268 = -_3258;
    float _3270 = fma(_3268, _3256, 1.0);
    bool _3272 = _3232 <= 1.0;
    bool _3274 = _3272 && _3262;
    float _3276 = _3264 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3278 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3266);
    float _3280 = _3114;
    if (!_2994)
    {
        float _3282 = floor(_2840);
        _3280 = _3282;
    }
    float _3284 = _3280;
    float _3286 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3288 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3290 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3278);
    float _3292 = _2558 * _2954;
    float _3294 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3286);
    float _3296 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3288);
    float _3298 = 1.0 / _3290;
    float _3300 = fma(_2432, _2946, _3292);
    if (_3274)
    {
        float _3302 = float(_2666);
        _2866 = _3302;
    }
    float _3304 = _2866;
    float _3306 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3294);
    float _3308 = log2(_3270);
    if (!_2994)
    {
        float _3310 = -_3284;
        float _3312 = _2840 + _3310;
        _2422 = _3312;
    }
    float _3314 = _2422;
    float _3316 = fma(_2440, _3190, _3300);
    float _3318 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3306);
    float _3320 = _3316 + _3198;
    float _3322 = _3286;
    float _3324 = _3318;
    if (_3274)
    {
        float _3326 = rint(_3304);
        float _3328 = precise::max(_3326, 0.0);
        uint _3330 = uint(_3328);
        uint _3332 = clamp(_3330, 0u, 65535u);
        _3322 = as_type<float>(_3332);
    }
    float _3334 = _3322;
    float _3336 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3296);
    float _3338 = _3318 * _3298;
    float _3340 = _3320 * _3044;
    float _3342 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3336);
    float _3344 = fma(_3338, 0.5, 0.5);
    float _3346 = _3228;
    float _3348 = _3298;
    if (!_2994)
    {
        float _3350 = rint(_3228);
        float _3352 = precise::max(_3350, 0.0);
        uint _3354 = uint(_3352);
        uint _3356 = clamp(_3354, 0u, 65535u);
        _3346 = as_type<float>(_3356);
    }
    float _3358 = _3346;
    float _3360 = _3308 * 0.693147182464599609375;
    float _3362 = _3342 * _3298;
    if (!_2994)
    {
        float _3364 = -_3024;
        float _3366 = _2792 + _3364;
        _3348 = _3366;
    }
    float _3368 = _3348;
    float _3370 = _3360 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3372 = fma(_3362, -0.5, 0.5);
    float _3374 = _3232;
    if (_3274)
    {
        float3 _9338 = float3(_3206, _3232, float(as_type<int>(_3334)));
        float3 _9342 = select(_9338, float3(0.0), isnan(_9338));
        float _3376 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9342.xy, uint(rint(_9342.z)), _3340, level(0.0));
        _3374 = _3376;
    }
    float _3378 = _3374;
    float3 _9352 = float3(_3344, _3372, _3370);
    float _3380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9352, float3(0.0), isnan(_9352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9352, float3(0.0), isnan(_9352)), level(0.0)).x;
    float3 _9361 = float3(_3344, _3372, _3370);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9361, float3(0.0), isnan(_9361)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9361, float3(0.0), isnan(_9361)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float _3393 = _3368;
    if (!_2994)
    {
        float3 _9384 = float3(_3368, _3314, float(as_type<int>(_3358)));
        float3 _9386 = select(_9384, float3(0.0), isnan(_9384));
        float _3395 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9386.xy, uint(rint(_9386.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9386.xy, uint(rint(_9386.z)), level(0.0)).x;
        _3393 = _3395;
    }
    float _3397 = _3393;
    if (_2994)
    {
        _2868 = 1.0;
    }
    float _3399 = _2868;
    float _3401 = _3399;
    if (!_2994)
    {
        int _3403 = _3018 << 4;
        int _3405 = _3403 + 2048;
        uint _3407 = uint(int(uint(_3405) >> uint(2)));
        uint _3409 = uint(int(uint(int(_3407)) >> uint(2)));
        int _3411 = int(_3407) & 3;
        float _3413 = (*spvDescriptorSet0.vp_c15)._m0[int(_3409)][_3411];
        int _3415 = int(_3407) + 1;
        uint _3417 = uint(int(uint(_3415) >> uint(2)));
        int _3419 = _3415 & 3;
        float _3421 = (*spvDescriptorSet0.vp_c15)._m0[int(_3417)][_3419];
        int _3423 = _3405 + 8;
        uint _3425 = uint(int(uint(_3423) >> uint(2)));
        uint _3427 = uint(int(uint(int(_3425)) >> uint(2)));
        int _3429 = int(_3425) & 3;
        float _3431 = (*spvDescriptorSet0.vp_c15)._m0[int(_3427)][_3429];
        int _3433 = int(_3425) + 1;
        uint _3435 = uint(int(uint(_3433) >> uint(2)));
        int _3437 = _3433 & 3;
        float _3439 = (*spvDescriptorSet0.vp_c15)._m0[int(_3435)][_3437];
        float _3441 = _2558 * _3421;
        float _3443 = fma(_2432, _3413, _3441);
        float _3445 = fma(_2440, _3431, _3443);
        float _3447 = _3445 + _3439;
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = -_3449;
        float _3453 = _3451 + _3397;
        float _3455 = fma(_3453, 500.0, 1.5);
        float _3457 = exp2(_3455);
        float _3459 = 0.0 + _3457;
        float _3461 = precise::clamp(_3459, 0.0, 1.0);
        _2654 = _3441;
        _3401 = _3461;
    }
    float _3463 = _2654;
    float _3465 = _3401;
    float _3467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3469 = _3172 + _3467;
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3473 = _3174 + _3471;
    float _3475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3477 = _3178 + _3475;
    float _3479 = _3469 * _3469;
    float _3481 = fma(_3473, _3473, _3479);
    float _3483 = fma(_3477, _3477, _3481);
    float _3485 = rsqrt(_3483);
    float _3487 = sqrt(_3483);
    float _3489 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3491 = _3473 * _3489;
    float _3493 = _3477 * _3489;
    float _3495 = _3491 * _3491;
    float _3497 = _3493 * _3493;
    float _3499 = _3495 + _3497;
    float _3501 = sqrt(_3499);
    bool _3503 = _3501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3507 = _3501 + _3505;
    float _3509 = _3370;
    float _3511 = _3485;
    float _3513 = _3507;
    float _3515 = _3469;
    float _3517 = _3463;
    if (_3503)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3509 = _3519;
    }
    float _3521 = _3509;
    if (_3503)
    {
        float _3523 = rsqrt(_3499);
        _3511 = _3523;
    }
    float _3525 = _3511;
    float _3527 = _3525;
    if (_3503)
    {
        float _3529 = _3507 * _3521;
        _3513 = _3529;
    }
    float _3531 = _3513;
    if (_3503)
    {
        float _3533 = _3531 * 0.15915493667125701904296875;
        _2460 = _3533;
    }
    float _3535 = _2460;
    float _3537 = _3477;
    if (_3503)
    {
        float _3539 = _3535 * 6.283185482025146484375;
        float _3541 = sin(_3539);
        _3537 = _3541;
    }
    float _3543 = _3537;
    float _3545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3547 = precise::max(0.0, _3545);
    float _3549 = _3521;
    float _3551 = _3547;
    if (_3503)
    {
        float _3553 = _3535 * 6.283185482025146484375;
        float _3555 = cos(_3553);
        _3549 = _3555;
    }
    float _3557 = _3549;
    float _3559 = -_3489;
    float _3561 = -_3547;
    float _3563 = fma(_3469, _3559, _3561);
    if (_3503)
    {
        float _3565 = _3563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3515 = _3565;
    }
    float _3567 = _3515;
    float _3569 = _3567;
    float _3571 = _3543;
    if (_3503)
    {
        float _3573 = fma(_3543, _3567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3569 = _3573;
    }
    float _3575 = _3569;
    float _3577 = _3575;
    if (!_3503)
    {
        _3571 = _3491;
    }
    float _3579 = _3571;
    float _3581 = _3579;
    float _3583 = _3557;
    if (_3503)
    {
        float _3585 = _3557 + (-1.0);
        _3551 = _3585;
    }
    float _3587 = _3551;
    float _3589 = _3587;
    if (_3503)
    {
        float _3591 = _3525 * _3575;
        _3216 = _3591;
    }
    float _3593 = _3216;
    if (!_3503)
    {
        _3577 = _3563;
    }
    float _3595 = _3577;
    float _3597 = _3595;
    if (_3503)
    {
        float _3599 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3517 = _3599;
    }
    float _3601 = _3517;
    if (_3503)
    {
        float _3603 = _3491 * _3593;
        _3581 = _3603;
    }
    float _3605 = _3581;
    if (!_3503)
    {
        _3589 = _3493;
    }
    float _3607 = _3589;
    float _3609 = _3607;
    if (_3503)
    {
        float _3611 = _3493 * _3593;
        _3609 = _3611;
    }
    float _3613 = _3609;
    if (!_3503)
    {
        _3527 = _3495;
    }
    float _3615 = _3527;
    float _3617 = _3615;
    if (_3503)
    {
        float _3619 = fma(_3563, _3557, _3601);
        _3597 = _3619;
    }
    float _3621 = _3597;
    if (_3503)
    {
        float _3623 = _3605 * _3605;
        _3617 = _3623;
    }
    float _3625 = _3617;
    if (!_3503)
    {
        _3583 = _3497;
    }
    float _3627 = _3583;
    float _3629 = _3627;
    if (_3503)
    {
        float _3631 = _3613 * _3613;
        _3629 = _3631;
    }
    float _3633 = _3629;
    float _3635 = fma(_3621, _3621, _3625);
    float _3637 = _3635 + _3633;
    float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3641 = fma(_3487, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3639);
    float _3643 = precise::clamp(_3641, 0.0, 1.0);
    float _3645 = rsqrt(_3637);
    float _3647 = -_3643;
    float _3649 = _3647 + 1.0;
    float _3651 = abs(_3649);
    float _3653 = log2(_3651);
    float _3655 = _3645 * _3605;
    float _3657 = _3645 * _3621;
    float _3659 = _3645 * _3613;
    float _3661 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3663 = -_3661;
    float _3665 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3663);
    float _3667 = -_3659;
    float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3665);
    float _3671 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3673 = fma(_3669, -0.5, 0.5);
    float _3675 = fma(_3669, 0.5, 0.5);
    float _3677 = exp2(_3671);
    float _3679 = fma(_3675, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3681 = fma(_3675, _3679, -0.212114393711090087890625);
    float _3683 = _3657 + 1.0;
    float _3685 = sqrt(_3673);
    float _3687 = fma(_3675, _3681, 1.570728778839111328125);
    float _3689 = -_3657;
    float _3691 = fma(_3677, _3683, _3689);
    float _3693 = _3685 * 0.636619746685028076171875;
    float _3695 = fma(_3691, 0.5, 0.5);
    float _3697 = -_3687;
    float _3699 = fma(_3693, _3697, 1.0);
    float2 _9859 = float2(_3699, _3695);
    float3 _3703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9859, float2(0.0), isnan(_9859)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9859, float2(0.0), isnan(_9859)), level(0.0)).xyz;
    float _3705 = _3703.x;
    float _3707 = _3703.y;
    float _3709 = _3703.z;
    float _3711 = abs(_2612);
    float _3713 = log2(_3711);
    float _3715 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3717 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3719 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3721 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _2642;
    out.m_80.y = _2644;
    out.m_80.z = _2646;
    float _3723 = -_2486;
    float _3725 = _3723 + 1.0;
    float _3727 = exp2(_3717);
    float _3729 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3719);
    bool _3731 = _2612 <= 8000.0;
    bool _3733 = isnan(_2612);
    bool _3735 = _3731 || _3733;
    bool _3737 = isnan(8000.0);
    bool _3739 = _3735 || _3737;
    float _3741 = float(_3739);
    out.m_82.x = _3174;
    out.m_82.y = _3172;
    out.m_82.z = _3178;
    bool _3743 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3745 = isnan(_3487);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3751 = _3747 || _3749;
    float _3753 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3729);
    float _3755 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3757 = fma(_3715, _3715, 1.0);
    float _3759 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3753);
    float _3761 = rsqrt(_3757);
    out.gl_Position.x = _3318;
    out.gl_Position.y = _3342;
    out.gl_Position.z = _3759;
    out.gl_Position.w = _3290;
    float _3763 = -_3727;
    float _3765 = _3763 + 1.0;
    float _3767 = exp2(_3755);
    float _3769 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3771 = _3715 * _3761;
    if (!_3751)
    {
        _3324 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3773 = _3324;
    float _3775 = -_2570;
    float _3777 = _3771 * _3775;
    float _3779 = fma(_3767, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = -_2568;
    float _3785 = _3771 * _3783;
    float _3787 = fma(_3781, -2.0, 3.0);
    float _3789 = _3781 * _3781;
    float _3791 = -_2566;
    float _3793 = _3771 * _3791;
    float _3795 = _3789 * _3787;
    float _3797 = fma(_3761, _2676, _3793);
    float _3799 = fma(_3761, _2682, _3785);
    float _3801 = fma(_3761, _2672, _3777);
    float _3803 = _3715 * _2676;
    float _3805 = _3715 * _2682;
    float _3807 = _3715 * _2672;
    out.m_84.x = _3797;
    out.m_84.y = _3799;
    out.m_84.z = _3801;
    float _3809 = fma(_3721, _2642, _3803);
    float _3811 = fma(_3721, _2644, _3805);
    float _3813 = _3759 + _3290;
    float _3815 = _3773;
    float _3817 = _3773;
    if (!_3274)
    {
        _2656 = 1.0;
    }
    float _3819 = _2656;
    float _3821 = fma(_3721, _2646, _3807);
    float _3823 = _3819;
    if (_3274)
    {
        bool _3825 = _3378 >= _3340;
        bool _3827 = isnan(_3378);
        bool _3829 = _3825 || _3827;
        bool _3831 = isnan(_3340);
        bool _3833 = _3829 || _3831;
        float _3835 = float(_3833);
        _3823 = _3835;
    }
    float _3837 = _3823;
    float _3839 = _3813 * 0.5;
    float _3841 = _3769 * _3380;
    float _3843 = -_3769;
    float _3845 = _3843 + 1.0;
    float _3847 = _2566 + _3809;
    float _3849 = _3837 * _3465;
    float _3851 = -_3795;
    float _3853 = _3851 + 1.0;
    float _3855 = _3391 * _3841;
    float _3857 = _2568 + _3811;
    float _3859 = _2570 + _3821;
    float _3861 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3795);
    float _3863 = _3741 * _3861;
    out.m_86.x = _3847;
    out.m_86.y = _3857;
    out.m_86.z = _3859;
    float _3865 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.z = _3839;
    out.m_88.w = _3290;
    float _3867 = _3725 * _3865;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = -_3869;
    float _3873 = fma(_3871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3875 = _3869;
    float _3877 = _3290;
    float _3879 = _3839;
    float _3881 = _3841;
    if (!_3751)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3883 = _3875;
    float _3885 = _3883;
    float _3887 = _3883;
    if (!_3751)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3889 = _3877;
    float _3891 = -_3849;
    float _3893 = fma(_3891, _3873, 1.0);
    float _3895 = precise::clamp(_3893, 0.0, 1.0);
    float _3897 = _3895;
    float _3899 = _3889;
    float _3901 = _3889;
    if (!_3751)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3903 = _3879;
    float _3905 = _3895 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3907 = _3903;
    float _3909 = _3903;
    if (!_3751)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3911 = _3897;
    out.m_90.x = _3905;
    float _3913 = _3709 * _3841;
    float _3915 = fma(_3705, _3855, _3385);
    float _3917 = fma(_3707, _3855, _3387);
    float _3919 = _3391 * _3845;
    float _3921 = fma(_3391, _3913, _3389);
    float _3923 = _3911;
    float _3925 = _3911;
    if (!_3751)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3927 = _3881;
    out.m_92.x = _3915;
    out.m_92.y = _3917;
    out.m_92.z = _3921;
    out.m_92.w = _3919;
    bool _3929 = !_3751;
    float _3931 = _3927;
    float _3933 = _3927;
    if (!_3929)
    {
        bool _3935 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3937 = isnan(_3487);
        bool _3939 = _3935 || _3937;
        bool _3941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3943 = _3939 || _3941;
        if (!_3943)
        {
            float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3947 = _3487 + _3945;
            float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3951 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3949;
            float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3957 = 1.0 / _3951;
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3975 = _3947 * _3957;
            float _3977 = precise::clamp(_3975, 0.0, 1.0);
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3983 = fma(_3977, _3955, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3985 = fma(_3977, _3981, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3987 = fma(_3977, _3961, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3989 = fma(_3977, _3965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3991 = fma(_3977, _3969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3993 = fma(_3977, _3973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3987;
            _3925 = _3991;
            _3887 = _3983;
            _3909 = _3989;
            _3901 = _3985;
            _3933 = _3993;
            _3995 = true;
        }
        else
        {
            bool _3997 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3999 = isnan(_3487);
            bool _4001 = _3997 || _3999;
            bool _4003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4005 = _4001 || _4003;
            if (!_4005)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4007 = _3885;
            _3887 = _4007;
            if (!_4005)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4009 = _3815;
            _3817 = _4009;
            if (!_4005)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4011 = _3899;
            _3901 = _4011;
            if (!_4005)
            {
                _3907 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4013 = _3907;
            _3909 = _4013;
            if (!_4005)
            {
                _3923 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4015 = _3923;
            _3925 = _4015;
            if (!_4005)
            {
                _3931 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4017 = _3931;
            bool _4019 = !_4005;
            _3933 = _4017;
            if (!_4019)
            {
                bool _4021 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4023 = isnan(_3487);
                bool _4025 = _4021 || _4023;
                bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4029 = _4025 || _4027;
                if (!_4029)
                {
                    float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4033 = _3487 + _4031;
                    float _4035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4037 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4035;
                    float _4039 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4041 = _4039 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4043 = 1.0 / _4037;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4061 = _4033 * _4043;
                    float _4063 = precise::clamp(_4061, 0.0, 1.0);
                    float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4069 = fma(_4063, _4041, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4071 = fma(_4063, _4067, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4073 = fma(_4063, _4047, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4075 = fma(_4063, _4051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4077 = fma(_4063, _4055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4079 = fma(_4063, _4059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _4073;
                    _3925 = _4077;
                    _3887 = _4069;
                    _3909 = _4075;
                    _3901 = _4071;
                    _3933 = _4079;
                    _3995 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3925 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3909 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3933 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3995 = false;
    float _4081 = _3817;
    float _4083 = _3925;
    float _4085 = _3887;
    float _4087 = _3909;
    float _4089 = _3901;
    float _4091 = _3933;
    float _4093 = fma(_3857, -0.5, 0.5);
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = -_4081;
    float _4099 = _4097 + _4083;
    float _4101 = -_4085;
    float _4103 = _4101 + _4087;
    float _4105 = -_4089;
    float _4107 = _4105 + _4091;
    bool _4109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4111 = fma(_4095, _4099, _4081);
    float _4113 = fma(_4095, _4103, _4085);
    float _4115 = fma(_4095, _4107, _4089);
    float _4117 = _4111 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4119 = fma(_4113, 0.298911988735198974609375, _4117);
    float _4121 = fma(_4115, 0.114477999508380889892578125, _4119);
    float _4123 = -_4121;
    float _4125 = _4113 + _4123;
    float _4127 = -_4121;
    float _4129 = _4111 + _4127;
    float _4131 = -_4121;
    float _4133 = _4115 + _4131;
    float _4135 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4137 = fma(_4125, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    float _4139 = fma(_4129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    float _4141 = fma(_4133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    out.m_59.x = _4135;
    out.m_96.x = _4137;
    out.m_96.y = _4139;
    out.m_96.z = _4141;
    if (!_4109)
    {
        return out;
    }
    float _4143 = -_3172;
    float _4145 = _4143 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4147 = -_3174;
    float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4151 = -_3178;
    float _4153 = _4151 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4155 = _4145 * _4145;
    float _4157 = fma(_4149, _4149, _4155);
    float _4159 = fma(_4153, _4153, _4157);
    float _4161 = sqrt(_4159);
    float _4163 = rsqrt(_4159);
    float _4165 = -_4161;
    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4169 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4171 = precise::clamp(_4169, 0.0, 1.0);
    float _4173 = _4149 * _4163;
    float _4175 = _4145 * _4163;
    float _4177 = abs(_4171);
    float _4179 = log2(_4177);
    float _4181 = _4153 * _4163;
    float _4183 = _4173 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4185 = _3857 * _4175;
    float _4187 = -_4175;
    float _4189 = -_4183;
    float _4191 = fma(_4187, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4189);
    float _4193 = fma(_3847, _4173, _4185);
    float _4195 = -_4181;
    float _4197 = fma(_4195, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4191);
    float _4199 = fma(_3859, _4181, _4193);
    float _4201 = precise::clamp(_4199, 0.0, 1.0);
    float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4205 = _4197 + _4203;
    float _4207 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4209 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4211 = precise::clamp(_4209, 0.0, 1.0);
    float _4213 = exp2(_4207);
    float _4215 = _4213 * _4211;
    float _4217 = _4201 * _4215;
    float _4219 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4221 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4223 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4219;
    out.m_94.y = _4221;
    out.m_94.z = _4223;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3995 = false;
    bool _947 = false;
    bool _775 = false;
    bool _557 = false;
    bool _381 = false;
    bool _233 = false;
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
        float _4280 = as_type<float>(_131);
        out.gl_Position.z = _4280;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4349 = as_type<float>(_167);
        out.gl_Position.z = _4349;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_66.x;
    float _173 = in.m_66.y;
    float _175 = in.m_66.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    float _199 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_179;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_183;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_68.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_115);
        float _237 = 1.0 / _235;
        float _239 = _149 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_257;
    float _269 = _267 + 1.0;
    float _271 = 1.0 / _261;
    bool _273 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_241);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _287 = 1.0 / _265;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = _245 * _271;
    bool _295 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_241);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _241 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_291, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _305 * _269;
    float _319 = -_305;
    float _321 = _319 + 1.0;
    float _323 = fma(_313, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _309 * _287;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _283 * _321;
    float _333 = -_283;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = _323 * _331;
    float _345 = _315 * _331;
    float _347 = fma(_339, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _353 = fma(_341, _317, _349);
    float _355 = fma(_347, _317, _351);
    float _357 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    bool _361 = !_285;
    float _379;
    if (!_361)
    {
        float _363 = in.m_68.x;
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _363 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        float _383 = float(_115);
        float _385 = 1.0 / _383;
        float _387 = _149 * _385;
        _379 = _387;
    }
    _381 = false;
    float _389 = _379;
    float _391 = in.m_70.x;
    float _393 = in.m_70.y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _389 + _395;
    bool _399 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _411;
    float _415 = -_409;
    float _417 = _415 + 1.0;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _413;
    float _423 = _359 * _393;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _429 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _431 = isnan(_389);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _357 * _391;
    float _443 = _397 * _421;
    float _445 = 1.0 / _427;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _449 = _389 + _447;
    bool _451 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _453 = isnan(_389);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = _461 * _417;
    float _469 = -_461;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _477;
    float _481 = fma(_465, _443, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _483 = _439 * _471;
    float _485 = fma(_475, _443, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_479, _443, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = -_439;
    float _491 = _489 + 1.0;
    float _493 = _449 * _445;
    float _495 = _485 * _483;
    float _497 = _481 * _483;
    float _499 = _487 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].x, _495);
    float _515 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _517 = fma(_503, _493, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _519 = fma(_507, _493, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _521 = fma(_511, _493, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _523 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].z, _499);
    float _525 = fma(_517, _467, _513);
    float _527 = fma(_519, _467, _515);
    float _529 = fma(_521, _467, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _525);
    float _533 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _527);
    float _535 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _529);
    bool _537 = !_419;
    float _555;
    if (!_537)
    {
        float _539 = in.m_68.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_115);
        float _561 = 1.0 / _559;
        float _563 = _149 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _565 + _567;
    float _571 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _585 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _587 = isnan(_565);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _575;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _603 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _605 = isnan(_565);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _621 = 1.0 / _583;
    float _623 = _579 * _597;
    bool _625 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _601;
    float _639 = -_595;
    float _641 = _639 + 1.0;
    float _643 = fma(_623, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _649 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _651 = isnan(_565);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_635;
    float _663 = _661 + 1.0;
    float _665 = _635 * _641;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _671 = 1.0 / _647;
    float _673 = -_659;
    float _675 = _673 + 1.0;
    float _677 = _613 * _663;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _679;
    float _683 = _669 * _621;
    float _685 = _595 * _675;
    float _687 = _643 * _677;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _565 + _689;
    float _693 = -_613;
    float _695 = _693 + 1.0;
    bool _697 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _699 = isnan(_565);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _681 * _637;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _717 = _565 + _715;
    float _719 = fma(_683, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _687);
    float _723 = -_707;
    float _725 = _723 + 1.0;
    float _727 = _713 * _671;
    float _729 = fma(_709, _717, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _733 = _565 + _731;
    float _735 = fma(_719, _665, _721);
    float _737 = _659 * _725;
    float _739 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = fma(_727, _733, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _743 = fma(_729, _685, _735);
    float _745 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = fma(_741, _737, _743);
    float _749 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[119].x, _747);
    float _751 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _749 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _739;
    out.m_72.y = _745;
    out.m_72.z = _751;
    out.m_72.w = _753;
    bool _755 = !_619;
    float _773;
    if (!_755)
    {
        float _757 = in.m_68.x;
        float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _761 = _757 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _765 = _763 * _759;
        float _767 = floor(_765);
        float _769 = -_767;
        float _771 = _765 + _769;
        _773 = _771;
        _775 = true;
    }
    else
    {
        float _777 = float(_115);
        float _779 = 1.0 / _777;
        float _781 = _149 * _779;
        _773 = _781;
    }
    _775 = false;
    float _783 = _773;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = _783 + _785;
    bool _789 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _791 = isnan(_783);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    bool _801 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _803 = isnan(_783);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _821 = 1.0 / _815;
    bool _823 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _825 = 1.0 / _819;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _827;
    float _831 = _787 * _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _835 = _783 + _833;
    bool _837 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _839 = isnan(_783);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_799;
    float _851 = _849 + 1.0;
    float _853 = fma(_829, _831, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _855 = _847 * _851;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _865;
    float _869 = _811 * _859;
    float _871 = fma(_863, _831, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _873 = fma(_867, _831, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _875 = _835 * _825;
    float _877 = _853 * _869;
    float _879 = _871 * _869;
    float _881 = _873 * _869;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _891 = -_811;
    float _893 = _891 + 1.0;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _899 = fma(_885, _875, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _901 = fma(_889, _875, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].x, _879);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].y, _877);
    float _907 = fma(_897, _875, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].z, _881);
    float _911 = fma(_899, _855, _903);
    float _913 = fma(_901, _855, _905);
    float _915 = fma(_907, _855, _909);
    float _917 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].x, _911);
    float _919 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].y, _913);
    float _921 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].z, _915);
    bool _923 = !_823;
    float _925 = _913;
    float _927 = _917;
    float _945;
    if (!_923)
    {
        float _929 = in.m_68.x;
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _933 = _929 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _937 = _935 * _931;
        float _939 = floor(_937);
        float _941 = -_939;
        float _943 = _937 + _941;
        _945 = _943;
        _947 = true;
    }
    else
    {
        float _949 = float(_115);
        float _951 = 1.0 / _949;
        float _953 = _149 * _951;
        _945 = _953;
    }
    _947 = false;
    float _955 = _945;
    float _957 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _959 = int(_957);
    float _961 = in.m_68.x;
    float _963 = in.m_68.y;
    float _965 = in.m_68.z;
    float _967 = in.m_68.w;
    float _969 = float(_115);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _973 = _955 + _971;
    float _975 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _985 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _989 = float(_959);
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _993 = int(_991);
    float _995 = float(uint(_979));
    float _997 = 1.0 / _989;
    int _999 = ~_979;
    int _1001 = _999 + 1;
    float _1003 = _963 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1005 = _979 == 0;
    float _1007 = fma(_1003, -2.0, _987);
    bool _1009 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1011 = isnan(_955);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _995;
    float _1023 = float(uint(_993));
    float _1025 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1007);
    float _1027 = _149 * _997;
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1031 = int(_1029);
    int _1033 = ~_979;
    int _1035 = _1033 + 1;
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = trunc(_1027);
    int _1041 = int(_1039);
    float _1043 = float(_1031);
    float _1045 = 1.0 / _1023;
    float _1047 = float(uint(_1041));
    float _1049 = 1.0 / _1043;
    float _1051 = as_type<float>(_1037) * _1047;
    float _1053 = trunc(_1051);
    float _1055 = precise::max(_1053, 0.0);
    uint _1058 = uint(_1055);
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>(_1045) + (-2);
    int _1066 = ~_993;
    int _1068 = _1066 + 1;
    float _1070 = _149 * _1049;
    float _1072 = float(_979);
    float _1074 = 1.0 / _969;
    float _1076 = float(_1041);
    float _1078 = _1043;
    float _1080 = _1025;
    float _1082 = _961;
    float _1084 = _965;
    if (_1062)
    {
        float _1086 = in.m_68.x;
        _925 = _1086;
    }
    float _1088 = _925;
    if (_1062)
    {
        _1078 = 1.0;
    }
    float _1090 = _1078;
    int _1092 = _1035 * int(_1058);
    int _1094 = _1092 + _1041;
    float _1096 = _1090;
    if (!_1062)
    {
        _1096 = 1.2345600128173828125;
    }
    float _1098 = _1096;
    float _1100 = _1088;
    if (!_1062)
    {
        float _1102 = in.m_68.y;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = trunc(_1070);
    int _1108 = int(_1106);
    bool _1110 = _1076 >= _1072;
    bool _1112 = isnan(_1076);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(_1072);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = float(uint(_1094));
    float _1124 = as_type<float>(_1037) * _1122;
    float _1126 = _1122;
    if (_1062)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = trunc(_1120);
    int _1132 = int(_1130);
    float _1134 = _1128;
    if (!_1062)
    {
        _1134 = 7.345489978790283203125;
    }
    float _1136 = _1134;
    float _1138 = _1136 * _961;
    float _1140 = trunc(_1124);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    float _1146 = 1.0 / _983;
    int _1148 = int(_1058) + int(_1144);
    float _1150 = floor(_1138);
    int _1152 = _1001 * _1148;
    int _1154 = _1152 + _1041;
    bool _1156 = uint(_1154) >= uint(_979);
    float _1158 = _1104 * _1098;
    float _1160 = float(uint(_1108));
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = floor(_1158);
    float _1168 = as_type<float>(_1064) * _1160;
    int _1170 = ~_1148;
    int _1172 = _1170 + _1164;
    int _1174 = _1172 + 1;
    float _1176 = -_1150;
    float _1178 = _1138 + _1176;
    int _1180 = ~_1132;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _979 + (-1);
    int _1188 = _979 * _1174;
    int _1190 = _1188 + _1041;
    float _1192 = trunc(_1168);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    bool _1198 = !_1005;
    int _1200 = _1198 ? _1190 : (-1);
    float _1202 = -_1166;
    float _1204 = _1158 + _1202;
    int _1206 = _1200 * _1184;
    float _1208 = _1178 * _1072;
    float _1210 = _149 * _1074;
    int _1212 = _1132 * _1186;
    int _1214 = _1212 + _1206;
    float _1216 = _1210 * _1072;
    int _1218 = _1068 * int(_1196);
    int _1220 = _1218 + _1108;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1228 = _1226 != 0;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1208);
    int _1236 = int(_1234);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1240 = _1238 != 0;
    float _1242 = float(uint(_1220));
    bool _1244 = !_1240;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = !_1228;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = trunc(_1216);
    int _1254 = int(_1252);
    float _1256 = as_type<float>(_1064) * _1242;
    bool _1258 = !_1224;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = abs(_1246);
    int _1264 = abs(_1250);
    float _1266 = trunc(_1256);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    int _1272 = abs(_1260);
    int _1274 = _1236 * _1262;
    int _1276 = _1274 + _1041;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1280 = _1278 != 0;
    int _1282 = _1214 * _1264;
    bool _1284 = !_1232;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = !_1280;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _1254 * _1272;
    int _1294 = _1292 + _1282;
    int _1296 = abs(_1286);
    int _1298 = abs(_1290);
    int _1300 = ~_993;
    int _1302 = _1300 + 1;
    int _1304 = _1276 * _1296;
    int _1306 = _1304 + _1294;
    float _1308 = float(_993);
    int _1310 = int(_1196) + int(_1270);
    int _1312 = _1236 * _1298;
    int _1314 = _1312 + _1306;
    float _1316 = _1204 * _1308;
    float _1318 = float(_1108);
    float _1320 = float(uint(_1314));
    int _1322 = _1302 * _1310;
    int _1324 = _1322 + _1108;
    bool _1326 = _1318 >= _1308;
    bool _1328 = isnan(_1318);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(_1308);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = trunc(_1316);
    int _1340 = int(_1338);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1344 = _1342 != 0;
    float _1346 = as_type<float>(_1037) * _1320;
    bool _1348 = uint(_1324) >= uint(_993);
    float _1350 = _1210 * _1308;
    bool _1352 = !_1344;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = !_1348;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = trunc(_1336);
    int _1362 = int(_1360);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1378 = _1376 != 0;
    int _1380 = ~_1310;
    int _1382 = _1380 + _1358;
    int _1384 = _1382 + 1;
    bool _1386 = _993 == 0;
    int _1388 = abs(_1354);
    float _1390 = trunc(_1346);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    int _1396 = _993 * _1384;
    int _1398 = _1396 + _1108;
    int _1400 = ~_979;
    int _1402 = _1400 + 1;
    int _1404 = _1340 * _1388;
    int _1406 = _1404 + _1108;
    int _1408 = _993 + (-1);
    bool _1410 = !_1386;
    int _1412 = _1410 ? _1398 : (-1);
    float _1414 = trunc(_1350);
    int _1416 = int(_1414);
    int _1418 = ~_1362;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    bool _1424 = _979 == 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1428 = _1426 != 0;
    int _1430 = _1412 * _1422;
    bool _1432 = !_1370;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = _1402 * int(_1394);
    int _1438 = _1436 + _1314;
    int _1440 = _1362 * _1408;
    int _1442 = _1440 + _1430;
    int _1444 = abs(_1434);
    float _1446 = float(uint(_1438));
    bool _1448 = !_1366;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = !_1374;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = as_type<float>(_1037) * _1446;
    int _1458 = abs(_1450);
    int _1460 = abs(_1454);
    int _1462 = _1442 * _1444;
    float _1464 = float(uint(_1276));
    float _1466 = trunc(_1456);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    bool _1472 = !_1378;
    int _1474 = _1472 ? 0 : 1;
    int _1476 = _1416 * _1458;
    int _1478 = _1476 + _1462;
    int _1480 = 0;
    if (_1428)
    {
        _1480 = 0;
    }
    int _1482 = _1480;
    float _1484 = as_type<float>(_1037) * _1464;
    int _1486 = abs(_1474);
    int _1488 = _1406 * _1460;
    int _1490 = _1488 + _1478;
    float _1492 = float(uint(_1406));
    float _1494 = trunc(_1484);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = ~_979;
    int _1502 = _1500 + 1;
    int _1504 = _1340 * _1486;
    int _1506 = _1504 + _1490;
    int _1508 = ~_979;
    int _1510 = _1508 + 1;
    float _1512 = as_type<float>(_1064) * _1492;
    int _1514 = ~_993;
    int _1516 = _1514 + 1;
    float _1518 = float(uint(_1506));
    int _1520 = int(_1394) + int(_1470);
    float _1522 = trunc(_1512);
    float _1524 = precise::max(_1522, 0.0);
    uint _1526 = uint(_1524);
    int _1528 = _1482;
    if (!_1428)
    {
        _1528 = 1;
    }
    int _1530 = _1528;
    float _1532 = as_type<float>(_1064) * _1518;
    int _1534 = _1510 * _1520;
    int _1536 = _1534 + _1314;
    int _1538 = _1502 * int(_1498);
    int _1540 = _1538 + _1276;
    float _1542 = trunc(_1532);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    bool _1548 = uint(_1536) >= uint(_979);
    float _1550 = float(uint(_1540));
    bool _1552 = !_1548;
    int _1554 = _1552 ? 0 : (-1);
    float _1556 = as_type<float>(_1037) * _1550;
    int _1558 = ~_1520;
    int _1560 = _1558 + _1554;
    int _1562 = _1560 + 1;
    int _1564 = _1516 * int(_1526);
    int _1566 = _1564 + _1406;
    int _1568 = ~_979;
    int _1570 = _1568 + 1;
    int _1572 = _979 * _1562;
    int _1574 = _1572 + _1314;
    float _1576 = trunc(_1556);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    float _1582 = float(uint(_1566));
    int _1584 = _1516 * int(_1546);
    int _1586 = _1584 + _1506;
    bool _1588 = !_1424;
    int _1590 = _1588 ? _1574 : (-1);
    float _1592 = as_type<float>(_1064) * _1582;
    float _1594 = float(uint(_1586));
    int _1596 = _1590 & 3;
    bool _1598 = _1596 != 0;
    float _1600 = trunc(_1592);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = _1590 & 3;
    bool _1608 = _1606 != 0;
    float _1610 = as_type<float>(_1064) * _1594;
    bool _1612 = uint(_1596) > 1u;
    bool _1614 = _1596 != 3;
    int _1616 = int(_1498) + int(_1580);
    float _1618 = trunc(_1610);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    int _1624 = _1608 ? 0 : 1;
    bool _1626 = uint(_1596) >= 2u;
    int _1628 = _1570 * _1616;
    int _1630 = _1628 + _1276;
    int _1632 = ~_1624;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = _1636;
    if (!_1612)
    {
        int _1640 = ~_1624;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    int _1646 = _1626 ? 0 : 1;
    bool _1648 = uint(_1630) >= uint(_979);
    int _1650 = int(_1526) + int(_1604);
    int _1652 = ~_993;
    int _1654 = _1652 + 1;
    int _1656 = ~_993;
    int _1658 = _1656 + 1;
    int _1660 = ~_1646;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1664;
    if (_1614)
    {
        int _1668 = ~_1646;
        int _1670 = _1668 + 1;
        _1666 = _1670;
    }
    int _1672 = _1666;
    int _1674 = _1654 * _1650;
    int _1676 = _1674 + _1406;
    int _1678 = int(_1546) + int(_1622);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1682 = _1680 != 0;
    bool _1684 = !_1648;
    int _1686 = _1684 ? 0 : (-1);
    int _1688 = _1658 * _1678;
    int _1690 = _1688 + _1506;
    bool _1692 = !_1682;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = uint(_1676) >= uint(_993);
    bool _1698 = uint(_1690) >= uint(_993);
    bool _1700 = !_1696;
    int _1702 = _1700 ? 0 : (-1);
    bool _1704 = _961 > 0.5;
    int _1706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1708 = _1706 != 0;
    float _1710 = -_207;
    int _1712 = _1704 ? as_type<int>(_1710) : as_type<int>(_207);
    float _1714 = in.m_56.x;
    float _1716 = in.m_56.y;
    float _1718 = in.m_56.z;
    bool _1720 = !_1698;
    int _1722 = _1720 ? 0 : (-1);
    bool _1724 = _963 > 0.5;
    bool _1726 = !_1708;
    float _1728 = _1726 ? _207 : as_type<float>(_1712);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    float _1734 = -_211;
    int _1736 = _1724 ? as_type<int>(_1734) : as_type<int>(_211);
    bool _1738 = !_1732;
    float _1740 = _1738 ? _211 : as_type<float>(_1736);
    float _1742 = _961 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1744 = _965 > 0.5;
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1748 = _1746 != 0;
    float _1750 = -_207;
    int _1752 = _1744 ? as_type<int>(_1750) : as_type<int>(_207);
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1756 = _1754 != 0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1760 = _1758 != 0;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1766 = _967 > 0.5;
    float _1768 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1770 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1772 = 1.0 / _1764;
    float _1774 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1786 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1768);
    float _1788 = -_1776;
    float _1790 = fma(_1742, 2.0, _1788);
    float _1792 = _1780 * _1146;
    float _1794 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1770);
    float _1796 = fma(_1714, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1774);
    bool _1798 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1800 = isnan(_955);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1810;
    bool _1814 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1816 = isnan(_955);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = 1.0 / _1784;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1832 = _1812 * _1772;
    float _1834 = -_1808;
    float _1836 = _1834 + 1.0;
    bool _1838 = _955 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1840 = isnan(_955);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -_1824;
    float _1852 = _1850 + 1.0;
    bool _1854 = !_1760;
    float _1856 = _1854 ? _207 : as_type<float>(_1752);
    float _1858 = _1824 * _1836;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1862 = _955 + _1860;
    float _1864 = _1848 * _1852;
    float _1866 = -_1848;
    float _1868 = _1866 + 1.0;
    float _1870 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1794);
    float _1872 = fma(_1792, _1862, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1874 = _1530 != 1;
    float _1876 = _1019 * _1868;
    float _1878 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1796);
    float _1880 = _1830 * _1826;
    float _1882 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1786);
    float _1884 = _1872 * _1876;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1888 = _955 + _1886;
    float _1890 = -_149;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1790);
    float _1894 = -_1019;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1880, _973, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1900 = ~_1678;
    int _1902 = _1900 + _1722;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1832, _1888, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1884);
    float _1910 = _1740 + (-0.5);
    int _1912 = _993 * _1904;
    int _1914 = _1912 + _1506;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1918 = _1728 + 0.5;
    float _1920 = -_1910;
    float _1922 = -_1025;
    float _1924 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1922);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1928 = fma(_1898, _1864, _1908);
    float _1930 = _1832;
    if (!_1874)
    {
        _1930 = _963;
    }
    float _1932 = _1930;
    float _1934 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1916);
    float _1936 = _1932;
    if (!_1874)
    {
        _1080 = _963;
    }
    float _1938 = _1080;
    float _1940 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1892);
    int _1942 = _1590 >> 31;
    float _1944 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1926);
    float _1946 = _1938;
    if (_1874)
    {
        _1936 = _961;
    }
    float _1948 = _1936;
    float _1950 = fma(_1906, _1858, _1928);
    if (_1874)
    {
        _1946 = _961;
    }
    float _1952 = _1946;
    float _1954 = _1870 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1956 = !_1386;
    int _1958 = _1956 ? _1914 : (-1);
    float _1960 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1950);
    int _1962 = as_type<int>(_1960);
    if (!_1874)
    {
        _1082 = _965;
    }
    float _1964 = _1082;
    float _1966 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1968 = _1964;
    if (_1874)
    {
        _1084 = _963;
    }
    float _1970 = _1084;
    float _1972 = _1856 + 0.5;
    if (_1874)
    {
        _1968 = _963;
    }
    float _1974 = _1968;
    int _1976 = _1942 & 3;
    float _1978 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1980 = _1958 >> 31;
    int _1982 = _1590 + _1976;
    int _1984 = _1980 & 3;
    int _1986 = _1958 + _1984;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1992 = _1982 >> 2;
    float _1994 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1988);
    int _1996 = _1986 >> 2;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2000 = !_1598;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2006 = _1958 & 3;
    bool _2008 = _2006 != 0;
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1998);
    int _2012 = _1992 << 4;
    int _2014 = _2012 + 368;
    float _2016 = fma(_1978, -2.0, _1990);
    int _2018 = _1958 & 3;
    bool _2020 = _2018 != 0;
    float _2022 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1944);
    int _2024 = _1996 << 4;
    int _2026 = _2024 + 512;
    uint _2028 = uint(int(uint(_2014) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    int _2044 = _2008 ? 0 : 1;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2048 = _1954 + _2046;
    bool _2050 = uint(_2018) > 1u;
    float _2052 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1994);
    float _2054 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2056 = !_2020;
    int _2058 = _2056 ? 0 : 1;
    uint _2060 = uint(int(uint(_2026) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    bool _2076 = _1596 != 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2080 = _1882 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _1966 + _2082;
    int _2086 = ~_1616;
    int _2088 = _2086 + _1686;
    int _2090 = _2088 + 1;
    float _2092 = -_2078;
    float _2094 = fma(_2004, 2.0, _2092);
    int _2096 = ~_2044;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    int _2102 = _2026 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = _2100;
    if (!_2050)
    {
        int _2122 = ~_2044;
        int _2124 = _2122 + 1;
        _2120 = _2124;
    }
    int _2126 = _2120;
    float _2128 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1934);
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2132 = _2080 + _2130;
    int _2134 = abs(_1644);
    int _2136 = _979 * _2090;
    int _2138 = _2136 + _1276;
    int _2140 = abs(_2126);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2054);
    int _2144 = _2014 + 8;
    uint _2146 = uint(int(uint(_2144) >> uint(2)));
    uint _2148 = uint(int(uint(int(_2146)) >> uint(2)));
    int _2150 = int(_2146) & 3;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[int(_2148)][_2150];
    int _2154 = int(_2146) + 1;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    int _2158 = _2154 & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = ~_2134;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = -_149;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2094);
    float _2172 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2142);
    bool _2174 = !_2076;
    int _2176 = _2174 ? 0 : (-1);
    float _2178 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2010);
    bool _2180 = _2018 != 3;
    float _2182 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2016);
    bool _2184 = uint(_2018) >= 2u;
    float _2186 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2170);
    int _2188 = abs(_2002);
    float _2190 = -_2178;
    float _2192 = _2190 + 1.0;
    int _2194 = ~_2140;
    int _2196 = _2194 + 1;
    int _2198 = _2196 + 1;
    float _2200 = -_2128;
    float _2202 = _2200 + 1.0;
    int _2204 = abs(_2058);
    int _2206 = _2184 ? 0 : 1;
    int _2208 = abs(_1672);
    int _2210 = ~_2206;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = _2214;
    if (_2180)
    {
        int _2218 = ~_2206;
        int _2220 = _2218 + 1;
        _2216 = _2220;
    }
    int _2222 = _2216;
    int _2224 = _2166 * as_type<int>(_2042);
    bool _2226 = _2018 != 3;
    int _2228 = ~_2188;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    int _2234 = abs(_2222);
    int _2236 = _2198 * as_type<int>(_2074);
    int _2238 = _2232 * as_type<int>(_2034);
    int _2240 = _2238 + _2224;
    int _2242 = ~_2208;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = ~_2204;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2234;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = abs(_2176);
    int _2262 = _2252 * as_type<int>(_2066);
    int _2264 = _2262 + _2236;
    bool _2266 = !_2226;
    int _2268 = _2266 ? 0 : (-1);
    bool _2270 = !_1424;
    int _2272 = _2270 ? _2138 : (-1);
    int _2274 = _2258 * as_type<int>(_2110);
    int _2276 = _2274 + _2264;
    int _2278 = abs(_1694);
    int _2280 = _2246 * as_type<int>(_2152);
    int _2282 = _2280 + _2240;
    int _2284 = abs(_2268);
    bool _2286 = !_1756;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = ~_2260;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2288);
    int _2298 = ~_2278;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    int _2304 = _2294 * as_type<int>(_2160);
    int _2306 = _2304 + _2282;
    int _2308 = ~_2284;
    int _2310 = _2308 + 1;
    int _2312 = _2310 + 1;
    int _2314 = ~_1650;
    int _2316 = _2314 + _1702;
    int _2318 = _2316 + 1;
    int _2320 = _2306 * _2302;
    bool _2322 = _2172 >= 0.0;
    int _2324 = _2312 * as_type<int>(_2118);
    int _2326 = _2324 + _2276;
    int _2328 = ~_2296;
    int _2330 = _2328 + 1;
    int _2332 = _2330 + 1;
    int _2334 = _2272 * _2278;
    int _2336 = _2334 + _2320;
    float _2338 = _2048 * _2048;
    float _2340 = -_211;
    int _2342 = _1766 ? as_type<int>(_2340) : as_type<int>(_211);
    int _2344 = _993 * _2318;
    int _2346 = _2344 + _1406;
    float _2348 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2350 = _2326 * _2332;
    float _2352 = -_2052;
    float _2354 = _2352 + 1.0;
    float _2356 = fma(_2132, _2132, _2338);
    bool _2358 = !_1748;
    float _2360 = _2358 ? _211 : as_type<float>(_2342);
    float _2362 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2364 = -_2354;
    float _2366 = fma(_1856, _2364, _2186);
    float _2368 = fma(_2084, _2084, _2356);
    bool _2370 = !_1386;
    int _2372 = _2370 ? _2346 : (-1);
    float _2374 = _2360 + (-0.5);
    if (_2322)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2376 = _927;
    float _2378 = _1960 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2380 = _2362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2382 = rsqrt(_2368);
    float _2384 = -_2374;
    float _2386 = -_2182;
    float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2386);
    int _2390 = _2372 * _2296;
    int _2392 = _2390 + _2350;
    float _2394 = -_2022;
    float _2396 = _2394 + 1.0;
    float _2398 = -_2202;
    float _2400 = fma(_1728, _2398, _1940);
    float _2402 = fma(_2360, _2192, _2388);
    float _2404 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = fma(_1740, _2396, _1924);
    if (_2322)
    {
        float _2408 = _2376 * 5.0;
        _1962 = as_type<int>(_2408);
    }
    int _2410 = _1962;
    float _2412 = float(_2336);
    out.m_74.x = _2380;
    out.m_74.y = _2404;
    out.m_74.z = _985;
    out.m_74.w = _2378;
    float _2414 = float(_2392);
    out.m_76.x = _2400;
    out.m_76.y = _2406;
    out.m_76.z = _2366;
    out.m_76.w = _2402;
    float _2416 = _2048 * _2382;
    float _2418 = _2132 * _2382;
    float _2420 = as_type<float>(_2410);
    float _2422 = _2416;
    if (_2322)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7742 = as_type<float>(_2410);
        out.gl_Position.z = _7742;
    }
    out.m_78.x = _2412;
    out.m_78.y = _2414;
    if (_2322)
    {
        out.m_59.x = 0.0;
    }
    if (_2322)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2424 = -_2416;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1954);
    float _2428 = _2084 * _2382;
    float _2430 = -_2418;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2436 = _2426 + _2434;
    float _2438 = -_2428;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _2442 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2444 = _2432 + _2442;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2450 = _2440 + _2448;
    float _2452 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2446);
    float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2452);
    bool _2456 = _2454 >= 0.0;
    float _2458 = _2436;
    float _2460 = _2440;
    if (_2456)
    {
        _2420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2462 = _2420;
    int _2464 = as_type<int>(_2462);
    if (_2456)
    {
        out.m_59.x = 0.0;
    }
    if (_2456)
    {
        float _2466 = _2462 * 5.0;
        _2464 = as_type<int>(_2466);
    }
    int _2468 = _2464;
    if (_2456)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7842 = as_type<float>(_2468);
        out.gl_Position.z = _7842;
    }
    if (_2456)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2470 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2472 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2474 = floor(_2470);
    float _2476 = floor(_2472);
    float _2478 = -_2474;
    float _2480 = _2470 + _2478;
    float _2482 = -_2476;
    float _2484 = _2472 + _2482;
    float2 _7878 = float2(_2480, _2484);
    float _2486 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7878, float2(0.0), isnan(_7878)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7878, float2(0.0), isnan(_7878)), level(0.0)).x;
    float _2488 = -_1954;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2492 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2494 = -_2080;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2498 = -_1966;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2502 = _2490 * _2490;
    float _2504 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2492);
    float _2506 = -_2416;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2510 = -_2418;
    float _2512 = fma(_2510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2514 = fma(_2496, _2496, _2502);
    float _2516 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2504);
    float _2518 = _2508 * _2508;
    float _2520 = -_2428;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2524 = fma(_2500, _2500, _2514);
    float _2526 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2528 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2530 = fma(_2512, _2512, _2518);
    float _2532 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2534 = 1.0 / _2526;
    float _2536 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2528);
    float _2538 = fma(_2522, _2522, _2530);
    float _2540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2544 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2536);
    float _2546 = rsqrt(_2524);
    float _2548 = _2544 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2550 = _2548 + _2526;
    float _2552 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2554 = _2550 * _2534;
    float _2556 = _2554 * 0.5;
    float _2558 = _2426 + _2552;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2560);
    float _2564 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2566 = _2496 * _2546;
    float _2568 = _2490 * _2546;
    float _2570 = _2500 * _2546;
    float _2572 = 1.0 / _2562;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2576 = _2566 * _2574;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2580 = _2570 * _2578;
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2584 = -_2576;
    float _2586 = fma(_2570, _2582, _2584);
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2590 = _2568 * _2588;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2594 = -_2580;
    float _2596 = fma(_2568, _2592, _2594);
    float _2598 = _2586 * _2586;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2602 = -_2590;
    float _2604 = fma(_2566, _2600, _2602);
    float _2606 = sqrt(_2538);
    float _2608 = fma(_2596, _2596, _2598);
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2612 = _2572 * _2610;
    float _2614 = fma(_2604, _2604, _2608);
    float _2616 = rsqrt(_2614);
    bool _2618 = _2612 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2620 = _2612 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2622 = _2382 * _2606;
    float _2624 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2626 = _2622 * _2532;
    float _2628 = _2622 * _2624;
    bool _2630 = !_2618;
    int _2632 = _2630 ? 0 : 1;
    float _2634 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2636 = _2634 * 0.5;
    float _2638 = _2540 * _2626;
    float _2640 = _2542 * _2628;
    float _2642 = _2596 * _2616;
    float _2644 = _2586 * _2616;
    float _2646 = _2604 * _2616;
    int _2648 = 2;
    float _2650 = _2640;
    float _2652 = _2622;
    float _2654 = _2558;
    float _2656 = _2644;
    if (!_2618)
    {
        _2648 = 1;
    }
    int _2658 = _2648;
    float _2660 = _2568 * _2642;
    float _2662 = _2570 * _2644;
    int _2664 = _2658;
    if (!_2620)
    {
        _2664 = _2632;
    }
    int _2666 = _2664;
    float _2668 = _2566 * _2646;
    float _2670 = -_2660;
    float _2672 = fma(_2566, _2644, _2670);
    float _2674 = -_2662;
    float _2676 = fma(_2568, _2646, _2674);
    int _2678 = _2666 << 6;
    float _2680 = -_2668;
    float _2682 = fma(_2570, _2642, _2680);
    float _2684 = _2638 * _2672;
    float _2686 = _2638 * _2676;
    int _2688 = _2678 + 48;
    uint _2690 = uint(int(uint(_2688) >> uint(2)));
    uint _2692 = uint(int(uint(int(_2690)) >> uint(2)));
    int _2694 = int(_2690) & 3;
    float _2696 = (*spvDescriptorSet0.vp_c15)._m0[int(_2692)][_2694];
    int _2698 = int(_2690) + 1;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    int _2702 = _2698 & 3;
    float _2704 = (*spvDescriptorSet0.vp_c15)._m0[int(_2700)][_2702];
    float _2706 = fma(_2640, _2646, _2684);
    float _2708 = fma(_2640, _2642, _2686);
    float _2710 = fma(_2636, _2570, _2706);
    float _2712 = fma(_2636, _2566, _2708);
    int _2714 = _2678 + 56;
    uint _2716 = uint(int(uint(_2714) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _1966 + _2710;
    float _2734 = _2080 + _2712;
    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2738 = _2732 + _2736;
    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2742 = _2734 + _2740;
    int _2744 = _2678 + 64;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    uint _2748 = uint(int(uint(int(_2746)) >> uint(2)));
    int _2750 = int(_2746) & 3;
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[int(_2748)][_2750];
    int _2754 = int(_2746) + 1;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    int _2758 = _2754 & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    float _2762 = _2738 * _2738;
    float _2764 = fma(_2742, _2742, _2762);
    float _2766 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2564);
    int _2768 = _2678 + 72;
    uint _2770 = uint(int(uint(_2768) >> uint(2)));
    uint _2772 = uint(int(uint(int(_2770)) >> uint(2)));
    int _2774 = int(_2770) & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    int _2778 = int(_2770) + 1;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    int _2782 = _2778 & 3;
    float _2784 = (*spvDescriptorSet0.vp_c15)._m0[int(_2780)][_2782];
    float _2786 = sqrt(_2764);
    float _2788 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2766);
    float _2790 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2792 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _2794 = _2678 + 96;
    uint _2796 = uint(int(uint(_2794) >> uint(2)));
    uint _2798 = uint(int(uint(int(_2796)) >> uint(2)));
    int _2800 = int(_2796) & 3;
    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[int(_2798)][_2800];
    int _2804 = int(_2796) + 1;
    uint _2806 = uint(int(uint(_2804) >> uint(2)));
    int _2808 = _2804 & 3;
    float _2810 = (*spvDescriptorSet0.vp_c15)._m0[int(_2806)][_2808];
    float _2812 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2790);
    float _2814 = trunc(_2792);
    int _2816 = int(_2814);
    float _2818 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2812);
    float _2820 = _2638 * _2682;
    int _2822 = _2678 + 104;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    uint _2826 = uint(int(uint(int(_2824)) >> uint(2)));
    int _2828 = int(_2824) & 3;
    float _2830 = (*spvDescriptorSet0.vp_c15)._m0[int(_2826)][_2828];
    int _2832 = int(_2824) + 1;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    int _2836 = _2832 & 3;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[int(_2834)][_2836];
    float _2840 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2842 = _2786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2844 = fma(_2640, _2644, _2820);
    float _2846 = trunc(_2840);
    int _2848 = int(_2846);
    float _2850 = fma(_2636, _2568, _2844);
    float _2852 = _1954 + _2850;
    int _2854 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2856 = _2816 + _2854;
    int _2858 = _2856 + 1;
    float _2860 = _2734;
    float _2862 = _2732;
    int _2864 = as_type<int>(_2722);
    float _2866 = as_type<float>(_2666);
    float _2868 = _2840;
    if (!_2842)
    {
        _2650 = _2734;
    }
    float _2870 = _2650;
    float _2872 = _2870;
    if (!_2842)
    {
        _2860 = _2852;
    }
    float _2874 = _2860;
    bool _2876 = !_2842;
    float _2878 = _2874;
    int _2880 = as_type<int>(_2802);
    int _2882 = as_type<int>(_2838);
    int _2884 = as_type<int>(_2752);
    if (!_2876)
    {
        float _2886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2890 = _2786 + _2888;
        float _2892 = rsqrt(_2764);
        float _2894 = _2890 * _2886;
        float _2896 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2898 = _2894 * 0.15915493667125701904296875;
        float _2900 = _2898 * 6.283185482025146484375;
        float _2902 = cos(_2900);
        float _2904 = _2898 * 6.283185482025146484375;
        float _2906 = sin(_2904);
        float _2908 = _2902 + (-1.0);
        float _2910 = fma(_2906, _2896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2914 = _2892 * _2910;
        float _2916 = fma(_2852, _2902, _2912);
        float _2918 = fma(_2742, _2914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2920 = fma(_2738, _2914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2878 = _2916;
        _2872 = _2918;
        _2862 = _2920;
    }
    float _2922 = _2878;
    float _2924 = _2872;
    float _2926 = _2862;
    float _2928 = -_1954;
    float _2930 = _2928 + _2922;
    int _2932 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2934 = _2848 + _2932;
    int _2936 = _2934 + 1;
    int _2938 = _2678 + 80;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    uint _2942 = uint(int(uint(int(_2940)) >> uint(2)));
    int _2944 = int(_2940) & 3;
    float _2946 = (*spvDescriptorSet0.vp_c15)._m0[int(_2942)][_2944];
    int _2948 = int(_2940) + 1;
    uint _2950 = uint(int(uint(_2948) >> uint(2)));
    int _2952 = _2948 & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    float _2956 = -_2080;
    float _2958 = _2956 + _2924;
    float _2960 = _2930 * _2930;
    float _2962 = -_1966;
    float _2964 = _2962 + _2926;
    bool _2966 = _2858 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2968 = fma(_2958, _2958, _2960);
    int _2970 = _2858 | _2936;
    bool _2972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2974 = isnan(0.5);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2964, _2964, _2968);
    bool _2984 = _2970 < 0;
    bool _2986 = _2984 || _2966;
    float _2988 = _2558 * _2810;
    float _2990 = sqrt(_2982);
    bool _2992 = _2936 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2994 = _2992 || _2986;
    float _2996 = fma(_2432, _2802, _2988);
    float _2998 = _2558 * _2704;
    float _3000 = fma(_2440, _2830, _2996);
    float _3002 = fma(_2432, _2696, _2998);
    float _3004 = _3000 + _2838;
    float _3006 = fma(_2440, _2722, _3002);
    float _3008 = _2926;
    float _3010 = _2924;
    float _3012 = _2922;
    if (!_2994)
    {
        int _3014 = _2936 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3016 = _3014 + _2858;
        _2880 = _3016;
    }
    int _3018 = _2880;
    float _3020 = _2830;
    if (!_2994)
    {
        float _3022 = floor(_2792);
        _3020 = _3022;
    }
    float _3024 = _3020;
    bool _3026 = _2990 > 0.0;
    float _3028 = _2558 * _2760;
    float _3030 = _3006 + _2730;
    if (!_2994)
    {
        int _3032 = _3018 << 2;
        _2882 = _3032;
    }
    int _3034 = _2882;
    float _3036 = fma(_2432, _2752, _3028);
    int _3038 = _3034;
    if (!_2994)
    {
        uint _3040 = uint(int(uint(_3018) >> uint(2)));
        _2884 = int(_3040);
    }
    int _3042 = _2884;
    float _3044 = 1.0 / _3004;
    if (!_2994)
    {
        int _3046 = 12 & _3034;
        _3038 = _3046;
    }
    int _3048 = _3038;
    float _3050 = fma(_2440, _2776, _3036);
    float _3052 = as_type<float>(_3048);
    if (!_2994)
    {
        int _3054 = _3042 << 4;
        int _3056 = _3054 + _3048;
        _2864 = _3056;
    }
    int _3058 = _2864;
    bool _3060 = !_3026;
    if (!_3060)
    {
        float _3062 = _201 * _201;
        float _3064 = rsqrt(_2982);
        float _3066 = fma(_199, _199, _3062);
        float _3068 = fma(_203, _203, _3066);
        float _3070 = sqrt(_3068);
        float _3072 = _2958 * _3064;
        float _3074 = _2930 * _3064;
        float _3076 = _2964 * _3064;
        bool _3078 = _3070 > 0.0;
        bool _3080 = !_3078;
        _3052 = _3074;
        if (!_3080)
        {
            float _3082 = rsqrt(_3068);
            float _3084 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3086 = _201 * _3082;
            float _3088 = _199 * _3082;
            float _3090 = _3074 * _3086;
            float _3092 = _203 * _3082;
            float _3094 = fma(_3072, _3088, _3090);
            float _3096 = _3084 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3098 = fma(_3076, _3092, _3094);
            float _3100 = _3098 * _3096;
            float _3102 = fma(_199, _3100, _2924);
            float _3104 = fma(_201, _3100, _2922);
            float _3106 = fma(_203, _3100, _2926);
            _3008 = _3106;
            _3010 = _3102;
            _3012 = _3104;
            _3052 = _3090;
        }
    }
    float _3108 = _3008;
    float _3110 = _3010;
    float _3112 = _3012;
    float _3114 = _3052;
    float _3116 = -_2428;
    float _3118 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3108);
    float _3120 = _3050 + _2784;
    float _3122 = -_2418;
    float _3124 = fma(_3122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3110);
    float _3126 = -_2416;
    float _3128 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3112);
    float _3130 = _3128;
    float _3132 = _3124;
    float _3134 = _3118;
    if (!_2980)
    {
        float _3136 = _2436 * _2436;
        float _3138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3140 = -_1954;
        float _3142 = _3140 + _3112;
        float _3144 = -_1966;
        float _3146 = _3144 + _3108;
        float _3148 = fma(_2444, _2444, _3136);
        float _3150 = fma(_2450, _2450, _3148);
        float _3152 = 1.0 / _2622;
        float _3154 = sqrt(_3150);
        float _3156 = precise::min(_3154, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3158 = _3156 * _3138;
        float _3160 = _3158 * _3152;
        float _3162 = -_2080;
        float _3164 = _3162 + _3110;
        float _3166 = fma(_3142, _3160, _2426);
        float _3168 = fma(_3164, _3160, _2432);
        float _3170 = fma(_3146, _3160, _2440);
        _3130 = _3166;
        _3132 = _3168;
        _2458 = _3136;
        _3134 = _3170;
        _2652 = _3152;
    }
    float _3172 = _3130;
    float _3174 = _3132;
    float _3176 = _2458;
    float _3178 = _3134;
    float _3180 = _2652;
    int _3182 = _2678 + 88;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    uint _3186 = uint(int(uint(int(_3184)) >> uint(2)));
    int _3188 = int(_3184) & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    int _3192 = int(_3184) + 1;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    int _3196 = _3192 & 3;
    float _3198 = (*spvDescriptorSet0.vp_c15)._m0[int(_3194)][_3196];
    float _3200 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3202 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3204 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3206 = _3030 * _3044;
    float _3208 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3200);
    float _3210 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3202);
    float _3212 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3204);
    float _3214 = _3176;
    float _3216 = _3180;
    if (!_2994)
    {
        int _3218 = _3058 + 400;
        uint _3220 = uint(int(uint(_3218) >> uint(2)));
        uint _3222 = uint(int(uint(int(_3220)) >> uint(2)));
        int _3224 = int(_3220) & 3;
        float _3226 = (*spvDescriptorSet0.vp_c15)._m0[int(_3222)][_3224];
        _3214 = _3226;
    }
    float _3228 = _3214;
    float _3230 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3208);
    float _3232 = _3120 * _3044;
    bool _3234 = _3206 >= 0.0;
    float _3236 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3210);
    float _3238 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3240 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3212);
    float _3242 = _3230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3244 = _3206 <= 1.0;
    bool _3246 = _3244 && _3234;
    float _3248 = _3236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3250 = fma(_3174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3238);
    float _3252 = _3240 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3256 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3258 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3260 = _3232 >= 0.0;
    bool _3262 = _3260 && _3246;
    float _3264 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3250);
    float _3266 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3254);
    float _3268 = -_3258;
    float _3270 = fma(_3268, _3256, 1.0);
    bool _3272 = _3232 <= 1.0;
    bool _3274 = _3272 && _3262;
    float _3276 = _3264 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3278 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3266);
    float _3280 = _3114;
    if (!_2994)
    {
        float _3282 = floor(_2840);
        _3280 = _3282;
    }
    float _3284 = _3280;
    float _3286 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3288 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3290 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3278);
    float _3292 = _2558 * _2954;
    float _3294 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3286);
    float _3296 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3288);
    float _3298 = 1.0 / _3290;
    float _3300 = fma(_2432, _2946, _3292);
    if (_3274)
    {
        float _3302 = float(_2666);
        _2866 = _3302;
    }
    float _3304 = _2866;
    float _3306 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3294);
    float _3308 = log2(_3270);
    if (!_2994)
    {
        float _3310 = -_3284;
        float _3312 = _2840 + _3310;
        _2422 = _3312;
    }
    float _3314 = _2422;
    float _3316 = fma(_2440, _3190, _3300);
    float _3318 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3306);
    float _3320 = _3316 + _3198;
    float _3322 = _3286;
    float _3324 = _3318;
    if (_3274)
    {
        float _3326 = rint(_3304);
        float _3328 = precise::max(_3326, 0.0);
        uint _3330 = uint(_3328);
        uint _3332 = clamp(_3330, 0u, 65535u);
        _3322 = as_type<float>(_3332);
    }
    float _3334 = _3322;
    float _3336 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3296);
    float _3338 = _3318 * _3298;
    float _3340 = _3320 * _3044;
    float _3342 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3336);
    float _3344 = fma(_3338, 0.5, 0.5);
    float _3346 = _3228;
    float _3348 = _3298;
    if (!_2994)
    {
        float _3350 = rint(_3228);
        float _3352 = precise::max(_3350, 0.0);
        uint _3354 = uint(_3352);
        uint _3356 = clamp(_3354, 0u, 65535u);
        _3346 = as_type<float>(_3356);
    }
    float _3358 = _3346;
    float _3360 = _3308 * 0.693147182464599609375;
    float _3362 = _3342 * _3298;
    if (!_2994)
    {
        float _3364 = -_3024;
        float _3366 = _2792 + _3364;
        _3348 = _3366;
    }
    float _3368 = _3348;
    float _3370 = _3360 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3372 = fma(_3362, -0.5, 0.5);
    float _3374 = _3232;
    if (_3274)
    {
        float3 _9338 = float3(_3206, _3232, float(as_type<int>(_3334)));
        float3 _9342 = select(_9338, float3(0.0), isnan(_9338));
        float _3376 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9342.xy, uint(rint(_9342.z)), _3340, level(0.0));
        _3374 = _3376;
    }
    float _3378 = _3374;
    float3 _9352 = float3(_3344, _3372, _3370);
    float _3380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9352, float3(0.0), isnan(_9352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9352, float3(0.0), isnan(_9352)), level(0.0)).x;
    float3 _9361 = float3(_3344, _3372, _3370);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9361, float3(0.0), isnan(_9361)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9361, float3(0.0), isnan(_9361)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float _3393 = _3368;
    if (!_2994)
    {
        float3 _9384 = float3(_3368, _3314, float(as_type<int>(_3358)));
        float3 _9386 = select(_9384, float3(0.0), isnan(_9384));
        float _3395 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9386.xy, uint(rint(_9386.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9386.xy, uint(rint(_9386.z)), level(0.0)).x;
        _3393 = _3395;
    }
    float _3397 = _3393;
    if (_2994)
    {
        _2868 = 1.0;
    }
    float _3399 = _2868;
    float _3401 = _3399;
    if (!_2994)
    {
        int _3403 = _3018 << 4;
        int _3405 = _3403 + 2048;
        uint _3407 = uint(int(uint(_3405) >> uint(2)));
        uint _3409 = uint(int(uint(int(_3407)) >> uint(2)));
        int _3411 = int(_3407) & 3;
        float _3413 = (*spvDescriptorSet0.vp_c15)._m0[int(_3409)][_3411];
        int _3415 = int(_3407) + 1;
        uint _3417 = uint(int(uint(_3415) >> uint(2)));
        int _3419 = _3415 & 3;
        float _3421 = (*spvDescriptorSet0.vp_c15)._m0[int(_3417)][_3419];
        int _3423 = _3405 + 8;
        uint _3425 = uint(int(uint(_3423) >> uint(2)));
        uint _3427 = uint(int(uint(int(_3425)) >> uint(2)));
        int _3429 = int(_3425) & 3;
        float _3431 = (*spvDescriptorSet0.vp_c15)._m0[int(_3427)][_3429];
        int _3433 = int(_3425) + 1;
        uint _3435 = uint(int(uint(_3433) >> uint(2)));
        int _3437 = _3433 & 3;
        float _3439 = (*spvDescriptorSet0.vp_c15)._m0[int(_3435)][_3437];
        float _3441 = _2558 * _3421;
        float _3443 = fma(_2432, _3413, _3441);
        float _3445 = fma(_2440, _3431, _3443);
        float _3447 = _3445 + _3439;
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = -_3449;
        float _3453 = _3451 + _3397;
        float _3455 = fma(_3453, 500.0, 1.5);
        float _3457 = exp2(_3455);
        float _3459 = 0.0 + _3457;
        float _3461 = precise::clamp(_3459, 0.0, 1.0);
        _2654 = _3441;
        _3401 = _3461;
    }
    float _3463 = _2654;
    float _3465 = _3401;
    float _3467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3469 = _3172 + _3467;
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3473 = _3174 + _3471;
    float _3475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3477 = _3178 + _3475;
    float _3479 = _3469 * _3469;
    float _3481 = fma(_3473, _3473, _3479);
    float _3483 = fma(_3477, _3477, _3481);
    float _3485 = rsqrt(_3483);
    float _3487 = sqrt(_3483);
    float _3489 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3491 = _3473 * _3489;
    float _3493 = _3477 * _3489;
    float _3495 = _3491 * _3491;
    float _3497 = _3493 * _3493;
    float _3499 = _3495 + _3497;
    float _3501 = sqrt(_3499);
    bool _3503 = _3501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3507 = _3501 + _3505;
    float _3509 = _3370;
    float _3511 = _3485;
    float _3513 = _3507;
    float _3515 = _3469;
    float _3517 = _3463;
    if (_3503)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3509 = _3519;
    }
    float _3521 = _3509;
    if (_3503)
    {
        float _3523 = rsqrt(_3499);
        _3511 = _3523;
    }
    float _3525 = _3511;
    float _3527 = _3525;
    if (_3503)
    {
        float _3529 = _3507 * _3521;
        _3513 = _3529;
    }
    float _3531 = _3513;
    if (_3503)
    {
        float _3533 = _3531 * 0.15915493667125701904296875;
        _2460 = _3533;
    }
    float _3535 = _2460;
    float _3537 = _3477;
    if (_3503)
    {
        float _3539 = _3535 * 6.283185482025146484375;
        float _3541 = sin(_3539);
        _3537 = _3541;
    }
    float _3543 = _3537;
    float _3545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3547 = precise::max(0.0, _3545);
    float _3549 = _3521;
    float _3551 = _3547;
    if (_3503)
    {
        float _3553 = _3535 * 6.283185482025146484375;
        float _3555 = cos(_3553);
        _3549 = _3555;
    }
    float _3557 = _3549;
    float _3559 = -_3489;
    float _3561 = -_3547;
    float _3563 = fma(_3469, _3559, _3561);
    if (_3503)
    {
        float _3565 = _3563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3515 = _3565;
    }
    float _3567 = _3515;
    float _3569 = _3567;
    float _3571 = _3543;
    if (_3503)
    {
        float _3573 = fma(_3543, _3567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3569 = _3573;
    }
    float _3575 = _3569;
    float _3577 = _3575;
    if (!_3503)
    {
        _3571 = _3491;
    }
    float _3579 = _3571;
    float _3581 = _3579;
    float _3583 = _3557;
    if (_3503)
    {
        float _3585 = _3557 + (-1.0);
        _3551 = _3585;
    }
    float _3587 = _3551;
    float _3589 = _3587;
    if (_3503)
    {
        float _3591 = _3525 * _3575;
        _3216 = _3591;
    }
    float _3593 = _3216;
    if (!_3503)
    {
        _3577 = _3563;
    }
    float _3595 = _3577;
    float _3597 = _3595;
    if (_3503)
    {
        float _3599 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3517 = _3599;
    }
    float _3601 = _3517;
    if (_3503)
    {
        float _3603 = _3491 * _3593;
        _3581 = _3603;
    }
    float _3605 = _3581;
    if (!_3503)
    {
        _3589 = _3493;
    }
    float _3607 = _3589;
    float _3609 = _3607;
    if (_3503)
    {
        float _3611 = _3493 * _3593;
        _3609 = _3611;
    }
    float _3613 = _3609;
    if (!_3503)
    {
        _3527 = _3495;
    }
    float _3615 = _3527;
    float _3617 = _3615;
    if (_3503)
    {
        float _3619 = fma(_3563, _3557, _3601);
        _3597 = _3619;
    }
    float _3621 = _3597;
    if (_3503)
    {
        float _3623 = _3605 * _3605;
        _3617 = _3623;
    }
    float _3625 = _3617;
    if (!_3503)
    {
        _3583 = _3497;
    }
    float _3627 = _3583;
    float _3629 = _3627;
    if (_3503)
    {
        float _3631 = _3613 * _3613;
        _3629 = _3631;
    }
    float _3633 = _3629;
    float _3635 = fma(_3621, _3621, _3625);
    float _3637 = _3635 + _3633;
    float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3641 = fma(_3487, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3639);
    float _3643 = precise::clamp(_3641, 0.0, 1.0);
    float _3645 = rsqrt(_3637);
    float _3647 = -_3643;
    float _3649 = _3647 + 1.0;
    float _3651 = abs(_3649);
    float _3653 = log2(_3651);
    float _3655 = _3645 * _3605;
    float _3657 = _3645 * _3621;
    float _3659 = _3645 * _3613;
    float _3661 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3663 = -_3661;
    float _3665 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3663);
    float _3667 = -_3659;
    float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3665);
    float _3671 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3673 = fma(_3669, -0.5, 0.5);
    float _3675 = fma(_3669, 0.5, 0.5);
    float _3677 = exp2(_3671);
    float _3679 = fma(_3675, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3681 = fma(_3675, _3679, -0.212114393711090087890625);
    float _3683 = _3657 + 1.0;
    float _3685 = sqrt(_3673);
    float _3687 = fma(_3675, _3681, 1.570728778839111328125);
    float _3689 = -_3657;
    float _3691 = fma(_3677, _3683, _3689);
    float _3693 = _3685 * 0.636619746685028076171875;
    float _3695 = fma(_3691, 0.5, 0.5);
    float _3697 = -_3687;
    float _3699 = fma(_3693, _3697, 1.0);
    float2 _9859 = float2(_3699, _3695);
    float3 _3703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9859, float2(0.0), isnan(_9859)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9859, float2(0.0), isnan(_9859)), level(0.0)).xyz;
    float _3705 = _3703.x;
    float _3707 = _3703.y;
    float _3709 = _3703.z;
    float _3711 = abs(_2612);
    float _3713 = log2(_3711);
    float _3715 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3717 = _3653 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3719 = _3242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3721 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _2642;
    out.m_80.y = _2644;
    out.m_80.z = _2646;
    float _3723 = -_2486;
    float _3725 = _3723 + 1.0;
    float _3727 = exp2(_3717);
    float _3729 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3719);
    bool _3731 = _2612 <= 8000.0;
    bool _3733 = isnan(_2612);
    bool _3735 = _3731 || _3733;
    bool _3737 = isnan(8000.0);
    bool _3739 = _3735 || _3737;
    float _3741 = float(_3739);
    out.m_82.x = _3174;
    out.m_82.y = _3172;
    out.m_82.z = _3178;
    bool _3743 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3745 = isnan(_3487);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3751 = _3747 || _3749;
    float _3753 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3729);
    float _3755 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3757 = fma(_3715, _3715, 1.0);
    float _3759 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3753);
    float _3761 = rsqrt(_3757);
    out.gl_Position.x = _3318;
    out.gl_Position.y = _3342;
    out.gl_Position.z = _3759;
    out.gl_Position.w = _3290;
    float _3763 = -_3727;
    float _3765 = _3763 + 1.0;
    float _3767 = exp2(_3755);
    float _3769 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3771 = _3715 * _3761;
    if (!_3751)
    {
        _3324 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3773 = _3324;
    float _3775 = -_2570;
    float _3777 = _3771 * _3775;
    float _3779 = fma(_3767, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = -_2568;
    float _3785 = _3771 * _3783;
    float _3787 = fma(_3781, -2.0, 3.0);
    float _3789 = _3781 * _3781;
    float _3791 = -_2566;
    float _3793 = _3771 * _3791;
    float _3795 = _3789 * _3787;
    float _3797 = fma(_3761, _2676, _3793);
    float _3799 = fma(_3761, _2682, _3785);
    float _3801 = fma(_3761, _2672, _3777);
    float _3803 = _3715 * _2676;
    float _3805 = _3715 * _2682;
    float _3807 = _3715 * _2672;
    out.m_84.x = _3797;
    out.m_84.y = _3799;
    out.m_84.z = _3801;
    float _3809 = fma(_3721, _2642, _3803);
    float _3811 = fma(_3721, _2644, _3805);
    float _3813 = _3759 + _3290;
    float _3815 = _3773;
    float _3817 = _3773;
    if (!_3274)
    {
        _2656 = 1.0;
    }
    float _3819 = _2656;
    float _3821 = fma(_3721, _2646, _3807);
    float _3823 = _3819;
    if (_3274)
    {
        bool _3825 = _3378 >= _3340;
        bool _3827 = isnan(_3378);
        bool _3829 = _3825 || _3827;
        bool _3831 = isnan(_3340);
        bool _3833 = _3829 || _3831;
        float _3835 = float(_3833);
        _3823 = _3835;
    }
    float _3837 = _3823;
    float _3839 = _3813 * 0.5;
    float _3841 = _3769 * _3380;
    float _3843 = -_3769;
    float _3845 = _3843 + 1.0;
    float _3847 = _2566 + _3809;
    float _3849 = _3837 * _3465;
    float _3851 = -_3795;
    float _3853 = _3851 + 1.0;
    float _3855 = _3391 * _3841;
    float _3857 = _2568 + _3811;
    float _3859 = _2570 + _3821;
    float _3861 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3795);
    float _3863 = _3741 * _3861;
    out.m_86.x = _3847;
    out.m_86.y = _3857;
    out.m_86.z = _3859;
    float _3865 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.z = _3839;
    out.m_88.w = _3290;
    float _3867 = _3725 * _3865;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = -_3869;
    float _3873 = fma(_3871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3875 = _3869;
    float _3877 = _3290;
    float _3879 = _3839;
    float _3881 = _3841;
    if (!_3751)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3883 = _3875;
    float _3885 = _3883;
    float _3887 = _3883;
    if (!_3751)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3889 = _3877;
    float _3891 = -_3849;
    float _3893 = fma(_3891, _3873, 1.0);
    float _3895 = precise::clamp(_3893, 0.0, 1.0);
    float _3897 = _3895;
    float _3899 = _3889;
    float _3901 = _3889;
    if (!_3751)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3903 = _3879;
    float _3905 = _3895 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3907 = _3903;
    float _3909 = _3903;
    if (!_3751)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3911 = _3897;
    out.m_90.x = _3905;
    float _3913 = _3709 * _3841;
    float _3915 = fma(_3705, _3855, _3385);
    float _3917 = fma(_3707, _3855, _3387);
    float _3919 = _3391 * _3845;
    float _3921 = fma(_3391, _3913, _3389);
    float _3923 = _3911;
    float _3925 = _3911;
    if (!_3751)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3927 = _3881;
    out.m_92.x = _3915;
    out.m_92.y = _3917;
    out.m_92.z = _3921;
    out.m_92.w = _3919;
    bool _3929 = !_3751;
    float _3931 = _3927;
    float _3933 = _3927;
    if (!_3929)
    {
        bool _3935 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3937 = isnan(_3487);
        bool _3939 = _3935 || _3937;
        bool _3941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3943 = _3939 || _3941;
        if (!_3943)
        {
            float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3947 = _3487 + _3945;
            float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3951 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3949;
            float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3957 = 1.0 / _3951;
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3975 = _3947 * _3957;
            float _3977 = precise::clamp(_3975, 0.0, 1.0);
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3983 = fma(_3977, _3955, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3985 = fma(_3977, _3981, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3987 = fma(_3977, _3961, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3989 = fma(_3977, _3965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3991 = fma(_3977, _3969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3993 = fma(_3977, _3973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3987;
            _3925 = _3991;
            _3887 = _3983;
            _3909 = _3989;
            _3901 = _3985;
            _3933 = _3993;
            _3995 = true;
        }
        else
        {
            bool _3997 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3999 = isnan(_3487);
            bool _4001 = _3997 || _3999;
            bool _4003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4005 = _4001 || _4003;
            if (!_4005)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4007 = _3885;
            _3887 = _4007;
            if (!_4005)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4009 = _3815;
            _3817 = _4009;
            if (!_4005)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4011 = _3899;
            _3901 = _4011;
            if (!_4005)
            {
                _3907 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4013 = _3907;
            _3909 = _4013;
            if (!_4005)
            {
                _3923 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4015 = _3923;
            _3925 = _4015;
            if (!_4005)
            {
                _3931 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4017 = _3931;
            bool _4019 = !_4005;
            _3933 = _4017;
            if (!_4019)
            {
                bool _4021 = _3487 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4023 = isnan(_3487);
                bool _4025 = _4021 || _4023;
                bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4029 = _4025 || _4027;
                if (!_4029)
                {
                    float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4033 = _3487 + _4031;
                    float _4035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4037 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4035;
                    float _4039 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4041 = _4039 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4043 = 1.0 / _4037;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4061 = _4033 * _4043;
                    float _4063 = precise::clamp(_4061, 0.0, 1.0);
                    float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4069 = fma(_4063, _4041, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4071 = fma(_4063, _4067, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4073 = fma(_4063, _4047, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4075 = fma(_4063, _4051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4077 = fma(_4063, _4055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4079 = fma(_4063, _4059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _4073;
                    _3925 = _4077;
                    _3887 = _4069;
                    _3909 = _4075;
                    _3901 = _4071;
                    _3933 = _4079;
                    _3995 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3925 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3909 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3933 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3995 = false;
    float _4081 = _3817;
    float _4083 = _3925;
    float _4085 = _3887;
    float _4087 = _3909;
    float _4089 = _3901;
    float _4091 = _3933;
    float _4093 = fma(_3857, -0.5, 0.5);
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = -_4081;
    float _4099 = _4097 + _4083;
    float _4101 = -_4085;
    float _4103 = _4101 + _4087;
    float _4105 = -_4089;
    float _4107 = _4105 + _4091;
    bool _4109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4111 = fma(_4095, _4099, _4081);
    float _4113 = fma(_4095, _4103, _4085);
    float _4115 = fma(_4095, _4107, _4089);
    float _4117 = _4111 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4119 = fma(_4113, 0.298911988735198974609375, _4117);
    float _4121 = fma(_4115, 0.114477999508380889892578125, _4119);
    float _4123 = -_4121;
    float _4125 = _4113 + _4123;
    float _4127 = -_4121;
    float _4129 = _4111 + _4127;
    float _4131 = -_4121;
    float _4133 = _4115 + _4131;
    float _4135 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4137 = fma(_4125, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    float _4139 = fma(_4129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    float _4141 = fma(_4133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4121);
    out.m_59.x = _4135;
    out.m_96.x = _4137;
    out.m_96.y = _4139;
    out.m_96.z = _4141;
    if (!_4109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4143 = -_3172;
    float _4145 = _4143 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4147 = -_3174;
    float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4151 = -_3178;
    float _4153 = _4151 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4155 = _4145 * _4145;
    float _4157 = fma(_4149, _4149, _4155);
    float _4159 = fma(_4153, _4153, _4157);
    float _4161 = sqrt(_4159);
    float _4163 = rsqrt(_4159);
    float _4165 = -_4161;
    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4169 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4171 = precise::clamp(_4169, 0.0, 1.0);
    float _4173 = _4149 * _4163;
    float _4175 = _4145 * _4163;
    float _4177 = abs(_4171);
    float _4179 = log2(_4177);
    float _4181 = _4153 * _4163;
    float _4183 = _4173 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4185 = _3857 * _4175;
    float _4187 = -_4175;
    float _4189 = -_4183;
    float _4191 = fma(_4187, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4189);
    float _4193 = fma(_3847, _4173, _4185);
    float _4195 = -_4181;
    float _4197 = fma(_4195, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4191);
    float _4199 = fma(_3859, _4181, _4193);
    float _4201 = precise::clamp(_4199, 0.0, 1.0);
    float _4203 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4205 = _4197 + _4203;
    float _4207 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4209 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4211 = precise::clamp(_4209, 0.0, 1.0);
    float _4213 = exp2(_4207);
    float _4215 = _4213 * _4211;
    float _4217 = _4201 * _4215;
    float _4219 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4221 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4223 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4219;
    out.m_94.y = _4221;
    out.m_94.z = _4223;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

