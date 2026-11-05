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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_106 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_98 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_104 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 m_102 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
    float4 m_74 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5387 = false;
    bool _3976 = false;
    bool _583 = false;
    bool _439 = false;
    bool _249 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_58.w;
    float _122 = in.m_60.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = as_type<float>(_127);
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_65.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5697 = as_type<float>(_149);
        out.gl_Position.z = _5697;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _151 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_122);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_127);
    bool _163 = _131 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _139;
    if (_167)
    {
        out.m_65.x = 0.0;
    }
    float _173 = _131 * _169;
    int _175 = 0;
    float _177 = _173;
    if (_167)
    {
        float _179 = _171 * 5.0;
        _175 = as_type<int>(_179);
    }
    int _181 = _175;
    out.m_63.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5760 = as_type<float>(_181);
        out.gl_Position.z = _5760;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    int _191 = as_type<int>(_183) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_183) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = _187 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _203 = _187 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _205 = _187 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].x, _203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].x, _205);
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].z, _209);
    float _221 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    bool _223 = !_197;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_199;
    float _229 = _217;
    float _247;
    if (!_227)
    {
        float _231 = in.m_72.x;
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _235 = _231 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _239 = _237 * _233;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _245;
        _249 = true;
    }
    else
    {
        _247 = _173;
    }
    _249 = false;
    float _251 = _247;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _251 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _251 + _257;
    bool _261 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_251);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _251 + _285;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _275;
    float _293 = 1.0 / _283;
    float _295 = 1.0 / _279;
    float _297 = _255 * _291;
    bool _299 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_251);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_271;
    float _313 = _311 + 1.0;
    bool _315 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_251);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _309 * _313;
    float _329 = _259 * _293;
    float _331 = -_309;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = _287 * _295;
    bool _341 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_251);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _353;
    float _357 = _325 * _333;
    float _359 = -_325;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = fma(_355, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = _351 * _361;
    float _375 = fma(_365, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = fma(_337, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_369, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -_351;
    float _383 = _381 + 1.0;
    float _385 = _371 * _373;
    float _387 = _375 * _373;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _395;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _401 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_377, _357, _393);
    float _405 = fma(_397, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _407 = fma(_379, _357, _399);
    float _409 = fma(_401, _327, _403);
    float _411 = fma(_405, _327, _407);
    float _413 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _409);
    float _415 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _411);
    bool _417 = !_289;
    float _419 = _413;
    float _437;
    if (!_417)
    {
        float _421 = in.m_72.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        _437 = _173;
    }
    _439 = false;
    float _441 = _437;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _441 + _443;
    float _447 = in.m_74.x;
    float _449 = in.m_74.y;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_441);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_441);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    bool _487 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_441);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _453;
    float _501 = -_465;
    float _503 = _501 + 1.0;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _507 = 1.0 / _469;
    float _509 = _485 * _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = _415 * _449;
    float _517 = _413 * _447;
    float _519 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _481 * _503;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    float _527 = -_481;
    float _529 = _527 + 1.0;
    float _531 = _513 * _507;
    float _533 = _519 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _441 + _535;
    float _539 = _465 * _525;
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _543 = fma(_531, _537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = fma(_543, _539, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _545);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _555;
    out.m_76.y = _557;
    out.m_76.z = _561;
    out.m_76.w = _559;
    bool _563 = !_505;
    float _581;
    if (!_563)
    {
        float _565 = in.m_72.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        _581 = _173;
    }
    _583 = false;
    float _585 = _581;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _589 = _585 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _595 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_585);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _611 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _613 = isnan(_585);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _623;
    bool _627 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _629 = isnan(_585);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _593;
    float _641 = -_605;
    float _643 = _641 + 1.0;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _647 = 1.0 / _609;
    float _649 = _625 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _655 = fma(_649, _589, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _657 = _621 * _643;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = -_621;
    float _665 = _663 + 1.0;
    float _667 = _653 * _647;
    float _669 = _655 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _585 + _671;
    float _675 = _605 * _661;
    float _677 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _669);
    float _679 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _681 = fma(_679, _675, _677);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[133].x, _681);
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _691;
    out.m_78.y = _693;
    out.m_78.z = _695;
    out.m_78.w = _697;
    bool _699 = !_645;
    if (!_699)
    {
        float _701 = in.m_72.x;
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _705 = _701 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _709 = _707 * _703;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _177 = _715;
    }
    float _717 = _177;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _721 = int(_719);
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = float(_721);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _731 = int(_729);
    float _733 = float(_725);
    float _735 = 1.0 / _727;
    float _737 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _739 = int(_737);
    float _741 = float(uint(_731));
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _745 = _743 != 0;
    float _747 = 1.0 / _733;
    float _749 = _735 * _131;
    float _751 = float(uint(_739));
    float _753 = 1.0 / _741;
    int _755 = ~_739;
    int _757 = _755 + 1;
    if (_745)
    {
        _419 = 1.0;
    }
    float _759 = _419;
    int _761 = 0;
    float _763 = _759;
    if (_745)
    {
        _761 = 0;
    }
    int _765 = _761;
    float _767 = _747 * _131;
    float _769 = trunc(_749);
    int _771 = int(_769);
    int _773 = 0;
    int _775 = _765;
    if (_745)
    {
        _773 = 0;
    }
    int _777 = _773;
    float _779 = 1.0 / _751;
    int _781 = as_type<int>(_753) + (-2);
    int _783 = ~_731;
    int _785 = _783 + 1;
    float _787 = trunc(_767);
    int _789 = int(_787);
    float _791 = float(uint(_771));
    int _793 = as_type<int>(_779) + (-2);
    float _795 = as_type<float>(_781) * _791;
    float _797 = _791;
    float _799 = _767;
    float _801 = _795;
    int _803 = _777;
    if (_745)
    {
        float _805 = in.m_72.x;
        float _807 = in.m_72.y;
        _797 = _805;
        _799 = _807;
    }
    float _809 = _797;
    float _811 = _799;
    float _813 = trunc(_795);
    float _815 = precise::max(_813, 0.0);
    uint _818 = uint(_815);
    float _820 = float(uint(_789));
    float _822 = as_type<float>(_793) * _820;
    float _824 = trunc(_822);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = _785 * int(_818);
    int _832 = _830 + _771;
    float _834 = float(uint(_832));
    float _836 = 0.0;
    float _838 = _834;
    float _840 = _809;
    float _842 = _811;
    if (_745)
    {
        _836 = _809;
    }
    float _844 = _836;
    float _846 = _844;
    if (_745)
    {
        _801 = _811;
    }
    float _848 = _801;
    float _850 = as_type<float>(_781) * _834;
    float _852 = _848;
    if (_745)
    {
        _838 = _844;
    }
    float _854 = _838;
    int _856 = _757 * int(_828);
    int _858 = _856 + _789;
    float _860 = trunc(_850);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = float(uint(_858));
    float _868 = as_type<float>(_793) * _866;
    float _870 = _866;
    float _872 = _868;
    float _874 = _854;
    if (_745)
    {
        _870 = 1.0;
    }
    float _876 = _870;
    float _878 = trunc(_868);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    float _884 = _876;
    if (_745)
    {
        _872 = _844;
    }
    float _886 = _872;
    float _888 = _886;
    if (!_745)
    {
        float _890 = in.m_72.x;
        float _892 = in.m_72.y;
        float _894 = in.m_72.z;
        float _896 = _890 * 3.1415927410125732421875;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _892 * 3.1415927410125732421875;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        _763 = 7.345489978790283203125;
        _840 = _890;
        _884 = 5.839270114898681640625;
        _888 = _894;
        _842 = _892;
        _874 = _906;
        _852 = _910;
        _775 = 1;
        _803 = 2;
        _846 = _892;
    }
    float _912 = _763;
    float _914 = _840;
    float _916 = _884;
    float _918 = _888;
    float _920 = _842;
    float _922 = _874;
    float _924 = _852;
    int _926 = _775;
    int _928 = _803;
    float _930 = _846;
    float _932 = _912 * _914;
    int _934 = int(_828) + int(_882);
    float _936 = _916 * _918;
    int _938 = ~_739;
    int _940 = _938 + 1;
    float _942 = floor(_932);
    int _944 = int(_818) + int(_864);
    float _946 = in.m_72.z;
    float _948 = in.m_72.w;
    float _950 = _169 * _131;
    int _952 = ~_731;
    int _954 = _952 + 1;
    float _956 = _920 * 2.0;
    float _958 = float(_739);
    float _960 = floor(_936);
    int _962 = _940 * _934;
    int _964 = _962 + _789;
    int _966 = _954 * _944;
    int _968 = _966 + _771;
    bool _970 = uint(_964) >= uint(_739);
    float _972 = -_942;
    float _974 = _932 + _972;
    bool _976 = uint(_968) >= uint(_731);
    float _978 = floor(_956);
    bool _980 = !_970;
    int _982 = _980 ? 0 : (-1);
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _986 = _984 != 0;
    bool _988 = !_976;
    int _990 = _988 ? 0 : (-1);
    float _992 = -_960;
    float _994 = _936 + _992;
    float _996 = _974 * _958;
    bool _998 = !_986;
    int _1000 = _998 ? 0 : 1;
    bool _1002 = _946 > 0.5;
    bool _1004 = _920 > 0.5;
    float _1006 = trunc(_996);
    int _1008 = int(_1006);
    int _1010 = ~_934;
    int _1012 = _1010 + _982;
    int _1014 = _1012 + 1;
    int _1016 = ~_944;
    int _1018 = _1016 + _990;
    int _1020 = _1018 + 1;
    float _1022 = float(_789);
    int _1024 = _739 * _1014;
    int _1026 = _1024 + _789;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1038 = _1036 != 0;
    int _1040 = _731 * _1020;
    int _1042 = _1040 + _771;
    float _1044 = -_225;
    int _1046 = _1002 ? as_type<int>(_1044) : as_type<int>(_225);
    float _1048 = -_215;
    int _1050 = _1004 ? as_type<int>(_1048) : as_type<int>(_215);
    bool _1052 = _1022 >= _958;
    bool _1054 = isnan(_1022);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(_958);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _958 * _950;
    bool _1066 = !_1038;
    float _1068 = _1066 ? _225 : as_type<float>(_1046);
    int _1070 = abs(_1000);
    float _1072 = trunc(_1062);
    int _1074 = int(_1072);
    bool _1076 = !_1034;
    float _1078 = _1076 ? _215 : as_type<float>(_1050);
    float _1080 = float(_731);
    int _1082 = _1008 * _1070;
    int _1084 = _1082 + _789;
    float _1086 = float(_771);
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1098 = _1096 != 0;
    float _1100 = _994 * _1080;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1104 = _1102 != 0;
    float _1106 = trunc(_1064);
    int _1108 = int(_1106);
    bool _1110 = _1086 >= _1080;
    bool _1112 = isnan(_1086);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(_1080);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1080 * _950;
    bool _1124 = !_1094;
    int _1126 = _1124 ? 0 : 1;
    bool _1128 = !_1090;
    int _1130 = _1128 ? 0 : 1;
    bool _1132 = !_1098;
    int _1134 = _1132 ? 0 : 1;
    float _1136 = trunc(_1120);
    int _1138 = int(_1136);
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1146 = _1144 != 0;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1150 = _1148 != 0;
    bool _1152 = !_1104;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1158 = _1156 != 0;
    bool _1160 = !_1142;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = trunc(_1100);
    int _1166 = int(_1164);
    bool _1168 = _739 == 0;
    int _1170 = ~_1074;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    bool _1176 = !_1168;
    int _1178 = _1176 ? _1026 : (-1);
    float _1180 = trunc(_1122);
    int _1182 = int(_1180);
    int _1184 = _739 + (-1);
    bool _1186 = !_1146;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = _1178 * _1174;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1194 = _1192 != 0;
    int _1196 = ~_1138;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    int _1202 = _1074 * _1184;
    int _1204 = _1202 + _1190;
    bool _1206 = !_1194;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = as_type<float>(_1190);
    float _1212 = as_type<float>(_928);
    if (_1158)
    {
        float _1214 = in.m_72.w;
        _1210 = _1214;
    }
    float _1216 = _1210;
    bool _1218 = _731 == 0;
    int _1220 = abs(_1126);
    bool _1222 = !_1218;
    int _1224 = _1222 ? _1042 : (-1);
    int _1226 = abs(_1208);
    int _1228 = _1204 * _1220;
    int _1230 = _731 + (-1);
    int _1232 = _1224 * _1200;
    int _1234 = abs(_1130);
    int _1236 = _1138 * _1230;
    int _1238 = _1236 + _1232;
    int _1240 = abs(_1188);
    int _1242 = _1108 * _1234;
    int _1244 = _1242 + _1228;
    int _1246 = abs(_1162);
    int _1248 = _1166 * _1226;
    int _1250 = _1248 + _771;
    int _1252 = abs(_1134);
    int _1254 = _1238 * _1240;
    float _1256 = _914 * 2.0;
    int _1258 = abs(_1154);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1262 = _1260 != 0;
    int _1264 = _1182 * _1246;
    int _1266 = _1264 + _1254;
    float _1268 = as_type<float>(_1254);
    bool _1270 = _1262;
    float _1272 = as_type<float>(_1246);
    if (_1158)
    {
        float _1274 = _1216 * 3.1415927410125732421875;
        _1268 = _1274;
    }
    float _1276 = _1268;
    bool _1278 = !_1150;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = floor(_1256);
    bool _1284 = !_1262;
    int _1286 = _1284 ? 0 : 1;
    int _1288 = _1084 * _1252;
    int _1290 = _1288 + _1244;
    int _1292 = abs(_1280);
    float _1294 = _1276;
    if (_1158)
    {
        float _1296 = _1276 * 0.15915493667125701904296875;
        _1294 = _1296;
    }
    float _1298 = _1294;
    int _1300 = abs(_1286);
    int _1302 = _1008 * _1258;
    int _1304 = _1302 + _1290;
    float _1306 = as_type<float>(_1008);
    if (_1158)
    {
        float _1308 = _1298 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = float(uint(_1304));
    int _1316 = _1250 * _1292;
    int _1318 = _1316 + _1266;
    float _1320 = 0.0;
    if (!_1158)
    {
        _1320 = _215;
    }
    float _1322 = _1320;
    bool _1324 = _739 == 0;
    int _1326 = _1166 * _1300;
    int _1328 = _1326 + _1318;
    float _1330 = as_type<float>(_793) * _1314;
    float _1332 = -_215;
    int _1334 = _1002 ? as_type<int>(_1332) : as_type<int>(_215);
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1338 = _1336 != 0;
    float _1340 = trunc(_1330);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    float _1346 = float(uint(_1328));
    float _1348 = _1322;
    if (_1158)
    {
        bool _1350 = _1312 > 0.5;
        _1270 = _1350;
    }
    bool _1352 = _1270;
    int _1354 = ~_739;
    int _1356 = _1354 + 1;
    float _1358 = as_type<float>(_781) * _1346;
    if (_1158)
    {
        float _1360 = -_215;
        float _1362 = _1352 ? _1360 : _215;
        _1348 = _1362;
    }
    float _1364 = _1348;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1368 = _1366 != 0;
    int _1370 = ~_731;
    int _1372 = _1370 + 1;
    float _1374 = trunc(_1358);
    float _1376 = precise::max(_1374, 0.0);
    uint _1378 = uint(_1376);
    bool _1380 = !_1338;
    float _1382 = _1380 ? _215 : as_type<float>(_1334);
    int _1384 = _1356 * int(_1344);
    int _1386 = _1384 + _1304;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1390 = float(uint(_1386));
    float _1392 = as_type<float>(_1240);
    if (_1368)
    {
        float _1394 = in.m_72.x;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = 0.0;
    if (!_1368)
    {
        _1398 = _225;
    }
    float _1400 = _1398;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1404 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1388);
    float _1406 = as_type<float>(_793) * _1390;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1410 = _1372 * int(_1378);
    int _1412 = _1410 + _1328;
    float _1414 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1402);
    float _1416 = trunc(_1406);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    float _1422 = _922 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1424 = _924 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1426 = float(uint(_1412));
    float _1428 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1404);
    int _1430 = ~_739;
    int _1432 = _1430 + 1;
    float _1434 = -_1408;
    float _1436 = fma(_1422, 2.0, _1434);
    float _1438 = as_type<float>(_781) * _1426;
    float _1440 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1414);
    float _1442 = trunc(_1438);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1454 = int(_1344) + int(_1420);
    float _1456 = as_type<float>(_1420);
    float _1458 = _1400;
    if (_1368)
    {
        float _1460 = _1396 * 3.1415927410125732421875;
        _1456 = _1460;
    }
    float _1462 = _1456;
    int _1464 = ~_731;
    int _1466 = _1464 + 1;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1470 = _1432 * _1454;
    int _1472 = _1470 + _1304;
    float _1474 = _1462;
    float _1476 = as_type<float>(_1466);
    if (_1368)
    {
        float _1478 = _1462 * 0.15915493667125701904296875;
        _1474 = _1478;
    }
    float _1480 = _1474;
    float _1482 = -_131;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1436);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1488 = uint(_1472) >= uint(_739);
    int _1490 = int(_1378) + int(_1446);
    float _1492 = _1480;
    if (_1368)
    {
        float _1494 = _1480 * 6.283185482025146484375;
        float _1496 = sin(_1494);
        _1492 = _1496;
    }
    float _1498 = _1492;
    float _1500 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1486);
    bool _1502 = !_1488;
    int _1504 = _1502 ? 0 : (-1);
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1510 = _1466 * _1490;
    int _1512 = _1510 + _1328;
    int _1514 = ~_1454;
    int _1516 = _1514 + _1504;
    int _1518 = _1516 + 1;
    float _1520 = -_225;
    int _1522 = _1004 ? as_type<int>(_1520) : as_type<int>(_225);
    float _1524 = 1.0 / _1508;
    bool _1526 = uint(_1512) >= uint(_731);
    int _1528 = _739 * _1518;
    int _1530 = _1528 + _1304;
    bool _1532 = !_1526;
    int _1534 = _1532 ? 0 : (-1);
    bool _1536 = _1526;
    float _1538 = 1.4012984643248170709237295832899e-45;
    if (_1368)
    {
        bool _1540 = _1498 > 0.5;
        _1536 = _1540;
    }
    bool _1542 = _1536;
    bool _1544 = !_1324;
    int _1546 = _1544 ? _1530 : (-1);
    if (_1368)
    {
        float _1548 = -_225;
        float _1550 = _1542 ? _1548 : _225;
        _1458 = _1550;
    }
    float _1552 = _1458;
    int _1554 = ~_1490;
    int _1556 = _1554 + _1534;
    int _1558 = _1556 + 1;
    int _1560 = _1546 & 3;
    bool _1562 = _1560 != 0;
    bool _1564 = _948 > 0.5;
    int _1566 = _731 * _1558;
    int _1568 = _1566 + _1328;
    bool _1570 = uint(_1560) > 1u;
    float _1572 = -_225;
    int _1574 = _1564 ? as_type<int>(_1572) : as_type<int>(_225);
    int _1576 = _1546 & 3;
    bool _1578 = _1576 != 0;
    bool _1580 = !_1218;
    int _1582 = _1580 ? _1568 : (-1);
    int _1584 = _1578 ? 0 : 1;
    int _1586 = _1582 & 3;
    bool _1588 = _1586 != 0;
    int _1590 = ~_1584;
    int _1592 = _1590 + 1;
    int _1594 = _1592 + 1;
    int _1596 = _1594;
    if (!_1570)
    {
        int _1598 = ~_1584;
        int _1600 = _1598 + 1;
        _1596 = _1600;
    }
    int _1602 = _1596;
    bool _1604 = uint(_1586) >= 2u;
    int _1606 = _1604 ? 0 : 1;
    bool _1608 = _1586 != 3;
    int _1610 = ~_1606;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    int _1616 = _1582 & 3;
    bool _1618 = _1616 != 0;
    int _1620 = int(_1608);
    int _1622 = _1618 ? 2 : 0;
    int _1624 = _1620 | _1622;
    int _1626 = _1588 ? 4 : 0;
    int _1628 = _1624 | _1626;
    int _1630 = _1030 ? 8 : 0;
    int _1632 = _1628 | _1630;
    int _1634 = _1562 ? 16 : 0;
    int _1636 = _1632 | _1634;
    int _1638 = _1218 ? 32 : 0;
    int _1640 = _1636 | _1638;
    int _1642 = _1324 ? 64 : 0;
    int _1644 = _1640 | _1642;
    int _1646 = _1644 & 4;
    int _1648 = _1618 ? 0 : 1;
    bool _1650 = uint(_1586) > 1u;
    int _1652 = ~_1648;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1614;
    int _1660 = _1656;
    if (_1608)
    {
        int _1662 = ~_1606;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    int _1668 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1670 = _1668 != 0;
    float _1672 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1674 = int(_1672);
    int _1676 = int(_1670);
    int _1678 = _1650 ? 2 : 0;
    int _1680 = _1676 | _1678;
    int _1682 = _1588 ? 4 : 0;
    int _1684 = _1680 | _1682;
    int _1686 = _1030 ? 8 : 0;
    int _1688 = _1684 | _1686;
    int _1690 = _1562 ? 16 : 0;
    int _1692 = _1688 | _1690;
    int _1694 = _1218 ? 32 : 0;
    int _1696 = _1692 | _1694;
    int _1698 = _1324 ? 64 : 0;
    int _1700 = _1696 | _1698;
    int _1702 = _1700 & 16;
    bool _1704 = !_1670;
    float _1706 = _1704 ? _225 : as_type<float>(_1522);
    if (!_1650)
    {
        int _1708 = ~_1648;
        int _1710 = _1708 + 1;
        _1660 = _1710;
    }
    int _1712 = _1660;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1716 = _1714 != 0;
    float _1718 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1720 = int(_1718);
    bool _1722 = !_1030;
    float _1724 = _1722 ? _225 : as_type<float>(_1574);
    bool _1726 = !_1716;
    int _1728 = _1726 ? 0 : 1;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1732 = _1730 != 0;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1736 = _1734 != 0;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1744 = _1742 != 0;
    int _1746 = abs(_1728);
    float _1748 = float(_1674);
    bool _1750 = !_1732;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = _914 > 0.5;
    float _1756 = 1.0 / _1748;
    float _1758 = float(uint(_1720));
    float _1760 = -_215;
    int _1762 = _1754 ? as_type<int>(_1760) : as_type<int>(_215);
    int _1764 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1766 = _1764 != 0;
    int _1768 = ~_1720;
    int _1770 = _1768 + 1;
    float _1772 = 1.0 / _1758;
    bool _1774 = !_1766;
    float _1776 = _1774 ? _215 : as_type<float>(_1762);
    bool _1778 = _926 != 1;
    bool _1780 = !_1736;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = abs(_1752);
    float _1786 = _1756 * _131;
    int _1788 = abs(_1782);
    int _1790 = ~_1720;
    int _1792 = _1790 + 1;
    float _1794 = trunc(_1786);
    int _1796 = int(_1794);
    bool _1798 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1800 = isnan(_717);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    int _1810 = as_type<int>(_1772) + (-2);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1814 = _1812 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1816 = _1772;
    if (!_1778)
    {
        _1538 = _920;
    }
    float _1818 = _1538;
    float _1820 = _1818;
    if (!_1778)
    {
        _1272 = _920;
    }
    float _1822 = _1272;
    float _1824 = _1822;
    if (!_1778)
    {
        _1816 = _946;
    }
    float _1826 = _1816;
    float _1828 = 1.0 / _1814;
    float _1830 = _1826;
    if (!_1778)
    {
        _1476 = _946;
    }
    float _1832 = _1476;
    float _1834 = _1832;
    if (_1778)
    {
        _1820 = _914;
    }
    float _1836 = _1820;
    if (_1778)
    {
        _1824 = _914;
    }
    float _1838 = _1824;
    float _1840 = float(uint(_1796));
    float _1842 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1778)
    {
        _1830 = _920;
    }
    float _1844 = _1830;
    float _1846 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1468);
    if (_1778)
    {
        _1834 = _920;
    }
    float _1848 = _1834;
    float _1850 = as_type<float>(_1810) * _1840;
    bool _1852 = _928 != 2;
    float _1854 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1856 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1858 = isnan(_717);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = trunc(_1850);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    float _1874 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1876 = _1850;
    if (_1852)
    {
        _1212 = _914;
    }
    float _1878 = _1212;
    float _1880 = _1878;
    if (_1852)
    {
        _1876 = _920;
    }
    float _1882 = _1876;
    float _1884 = _1882;
    if (!_1852)
    {
        _1880 = _946;
    }
    float _1886 = _1880;
    int _1888 = _1770 * int(_1872);
    int _1890 = _1888 + _1796;
    if (!_1852)
    {
        _1884 = _914;
    }
    float _1892 = _1884;
    bool _1894 = _1282 >= 0.0;
    bool _1896 = isnan(_1282);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.0);
    bool _1902 = _1898 || _1900;
    float _1904 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1906 = float(uint(_1890));
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1910 = _1902 ? 0 : 1;
    bool _1912 = _1282 > 0.0;
    float _1914 = as_type<float>(_1810) * _1906;
    int _1916 = ~_1910;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = _946 * 2.0;
    float _1924 = _912 * _930;
    float _1926 = trunc(_1914);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    bool _1932 = !_1744;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = fma(_1908, -2.0, _1452);
    bool _1938 = _1646 != 0;
    bool _1940 = !_1740;
    int _1942 = _1940 ? 0 : 1;
    float _1944 = floor(_1922);
    int _1946 = _1920;
    if (!_1912)
    {
        int _1948 = ~_1910;
        int _1950 = _1948 + 1;
        _1946 = _1950;
    }
    int _1952 = _1946;
    bool _1954 = _978 >= 0.0;
    bool _1956 = isnan(_978);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1968 = !_1938;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1962 ? 0 : 1;
    float _1974 = floor(_1924);
    bool _1976 = _978 > 0.0;
    int _1978 = ~_1720;
    int _1980 = _1978 + 1;
    int _1982 = int(_1872) + int(_1930);
    int _1984 = ~_1972;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    float _1990 = 1.0 / _1966;
    float _1992 = float(_1720);
    int _1994 = _1980 * _1982;
    int _1996 = _1994 + _1796;
    float _1998 = float(_1952);
    int _2000 = _1988;
    if (!_1976)
    {
        int _2002 = ~_1972;
        int _2004 = _2002 + 1;
        _2000 = _2004;
    }
    int _2006 = _2000;
    bool _2008 = uint(_1996) >= uint(_1720);
    float _2010 = -_1974;
    float _2012 = _1924 + _2010;
    float _2014 = float(_1796);
    float _2016 = _1992 * _950;
    bool _2018 = !_2008;
    int _2020 = _2018 ? 0 : (-1);
    bool _2022 = _2014 >= _1992;
    bool _2024 = isnan(_2014);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(_1992);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2036 = _2034 != 0;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2040 = _2038 != 0;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2044 = _2042 != 0;
    float _2046 = _2012 * _1992;
    int _2048 = ~_1982;
    int _2050 = _2048 + _2020;
    int _2052 = _2050 + 1;
    float _2054 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2056 = trunc(_2032);
    int _2058 = int(_2056);
    float _2060 = float(uint(_1084));
    float _2062 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1846);
    bool _2064 = _1944 >= 0.0;
    bool _2066 = isnan(_1944);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan(0.0);
    bool _2072 = _2068 || _2070;
    int _2074 = _1720 * _2052;
    int _2076 = _2074 + _1796;
    bool _2078 = _1944 > 0.0;
    float _2080 = as_type<float>(_793) * _2060;
    int _2082 = _2072 ? 0 : 1;
    float _2084 = trunc(_2046);
    int _2086 = int(_2084);
    bool _2088 = _1720 == 0;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2096 = _2094 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2098 = !_2088;
    int _2100 = _2098 ? _2076 : (-1);
    float _2102 = _2092 * _1524;
    int _2104 = ~_2082;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = trunc(_2080);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    int _2116 = ~_2058;
    int _2118 = _2116 + 1;
    int _2120 = _2118 + 1;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2124 = _2108;
    if (!_2078)
    {
        int _2126 = ~_2082;
        int _2128 = _2126 + 1;
        _2124 = _2128;
    }
    int _2130 = _2124;
    float _2132 = -_2062;
    float _2134 = _2132 + 1.0;
    int _2136 = ~_739;
    int _2138 = _2136 + 1;
    int _2140 = _2100 * _2120;
    float _2142 = -_2122;
    float _2144 = fma(_2054, 2.0, _2142);
    int _2146 = _1720 + (-1);
    float _2148 = trunc(_2016);
    int _2150 = int(_2148);
    float _2152 = float(uint(_1250));
    float _2154 = -_131;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2144);
    bool _2158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2160 = isnan(0.0);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2166 = _2162 || _2164;
    int _2168 = _2058 * _2146;
    int _2170 = _2168 + _2140;
    float _2172 = as_type<float>(_781) * _2152;
    int _2174 = _2138 * int(_2114);
    int _2176 = _2174 + _1084;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2180 = _2178 != 0;
    int _2182 = _2170 * _1788;
    bool _2184 = !_2040;
    int _2186 = _2184 ? 0 : 1;
    int _2188 = _2086 * _1746;
    int _2190 = _2188 + _1796;
    float _2192 = trunc(_2172);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = float(uint(_2176));
    int _2200 = ~_731;
    int _2202 = _2200 + 1;
    int _2204 = _2150 * _1784;
    int _2206 = _2204 + _2182;
    float _2208 = as_type<float>(_793) * _2198;
    int _2210 = abs(_1942);
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2214 = abs(_1934);
    float _2216 = float(uint(_2190));
    int _2218 = _2190 * _2210;
    int _2220 = _2218 + _2206;
    int _2222 = _2202 * int(_2196);
    int _2224 = _2222 + _1250;
    float _2226 = _920 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2228 = _2086 * _2214;
    int _2230 = _2228 + _2220;
    float _2232 = as_type<float>(_1810) * _2216;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2236 = fma(_2226, -2.0, _2212);
    int _2238 = ~_1720;
    int _2240 = _2238 + 1;
    float _2242 = trunc(_2232);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = float(uint(_2224));
    float _2250 = fma(_1424, -2.0, _2234);
    float _2252 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2236);
    float _2254 = float(uint(_2230));
    float _2256 = as_type<float>(_781) * _2248;
    int _2258 = ~_739;
    int _2260 = _2258 + 1;
    float _2262 = trunc(_2208);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2250);
    float _2270 = as_type<float>(_1810) * _2254;
    float _2272 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1874);
    float _2274 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2276 = _1702 != 0;
    bool _2278 = !_2036;
    int _2280 = _2278 ? 0 : 1;
    float _2282 = trunc(_2270);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    int _2288 = _2240 * int(_2246);
    int _2290 = _2288 + _2190;
    int _2292 = abs(_2186);
    float _2294 = -_2272;
    float _2296 = _2294 + 1.0;
    bool _2298 = !_2044;
    int _2300 = _2298 ? 0 : 1;
    float _2302 = float(uint(_2290));
    int _2304 = int(_2114) + int(_2266);
    float _2306 = trunc(_2256);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    float _2312 = as_type<float>(_1810) * _2302;
    float _2314 = float(_2006);
    bool _2316 = _731 == 0;
    int _2318 = _2260 * _2304;
    int _2320 = _2318 + _1084;
    int _2322 = _1792 * int(_2286);
    int _2324 = _2322 + _2230;
    float _2326 = trunc(_2312);
    float _2328 = precise::max(_2326, 0.0);
    uint _2330 = uint(_2328);
    bool _2332 = uint(_2320) >= uint(_739);
    float _2334 = float(uint(_2324));
    int _2336 = int(_2196) + int(_2310);
    float _2338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2340 = log2(_2338);
    float _2342 = as_type<float>(_1810) * _2334;
    int _2344 = ~_731;
    int _2346 = _2344 + 1;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2350 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2352 = !_2332;
    int _2354 = _2352 ? 0 : (-1);
    int _2356 = int(_2246) + int(_2330);
    float _2358 = trunc(_2342);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    int _2364 = _2346 * _2336;
    int _2366 = _2364 + _1250;
    int _2368 = ~_1720;
    int _2370 = _2368 + 1;
    float _2372 = fma(_2350, -2.0, _1448);
    int _2374 = ~_1720;
    int _2376 = _2374 + 1;
    float _2378 = -_2348;
    float _2380 = fma(_1842, 2.0, _2378);
    bool _2382 = uint(_2366) >= uint(_731);
    int _2384 = _2370 * _2356;
    int _2386 = _2384 + _2190;
    float _2388 = _2340 * _131;
    float _2390 = -_131;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2380);
    bool _2394 = !_2382;
    int _2396 = _2394 ? 0 : (-1);
    float _2398 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2372);
    bool _2400 = uint(_2386) >= uint(_1720);
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    int _2406 = int(_2286) + int(_2362);
    float _2408 = -_2402;
    float _2410 = fma(_1904, 2.0, _2408);
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2414 = _2412 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2416 = !_2400;
    int _2418 = _2416 ? 0 : (-1);
    int _2420 = _2376 * _2406;
    int _2422 = _2420 + _2230;
    float _2424 = _1854 * _2404;
    float _2426 = exp2(_2388);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2430 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2432 = isnan(_717);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    bool _2442 = uint(_2422) >= uint(_1720);
    float _2444 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2428);
    float _2446 = 1.0 / _2414;
    float _2448 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2444);
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2452 = !_2442;
    int _2454 = _2452 ? 0 : (-1);
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2458 = 1.0 + _2456;
    float _2460 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2450);
    float _2462 = -_2426;
    float _2464 = _2462 + 1.0;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2468 = 1.0 / _2458;
    bool _2470 = _1586 != 3;
    float _2472 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2474 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2466);
    float _2476 = _2166 ? _2464 : 0.0;
    float _2478 = in.m_58.x;
    float _2480 = in.m_58.y;
    float _2482 = in.m_58.z;
    bool _2484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2486 = isnan(1.0);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1500);
    float _2496 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2474);
    float _2498 = -_131;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2410);
    float _2502 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1936);
    bool _2504 = !_2470;
    int _2506 = _2504 ? 0 : (-1);
    float _2508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    int _2510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2512 = _2510 != 0;
    float _2514 = _2274 * _2508;
    bool _2516 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2518 = isnan(_717);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    if (_2492)
    {
        float _2528 = _2476 * _2468;
        _141 = _2528;
    }
    float _2530 = _141;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2534 = _2532 != 0;
    float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2540 = -_2526;
    float _2542 = _2540 + 1.0;
    float _2544 = -_1866;
    float _2546 = _2544 + 1.0;
    int _2548 = ~_2304;
    int _2550 = _2548 + _2354;
    int _2552 = _2550 + 1;
    float _2554 = 1.0 / _2538;
    float _2556 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2558 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2560 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2570 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2556);
    float _2572 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2558);
    float _2574 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2560);
    float _2576 = _2564 * _2446;
    float _2578 = 1.0 / _2568;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2584 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2572);
    bool _2586 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2588 = isnan(_717);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = _2582 * _1990;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2604 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2606 = isnan(_717);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    float _2616 = -_2596;
    float _2618 = _2616 + 1.0;
    bool _2620 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2622 = isnan(_717);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2628 = _2624 || _2626;
    float _2630 = float(_2628);
    float _2632 = _2584 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2634 = 1.0 / _2602;
    float _2636 = _2630 * _2618;
    float _2638 = _2096 * _2578;
    float _2640 = -_2630;
    float _2642 = _2640 + 1.0;
    float _2644 = _2614 * _2642;
    float _2646 = -_2614;
    float _2648 = _2646 + 1.0;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2650;
    float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2656 = _2654 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2660 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2658;
    float _2662 = _2526 * _2648;
    float _2664 = _1808 * _2542;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2668 = _717 + _2666;
    float _2670 = _2652 * _2634;
    float _2672 = -_1808;
    float _2674 = _2672 + 1.0;
    bool _2676 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2678 = isnan(_717);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = fma(_2576, _2668, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2690 = _2660 * _2554;
    float _2692 = _2440 * _2674;
    float _2694 = -_2440;
    float _2696 = _2694 + 1.0;
    float _2698 = _2656 * _1828;
    float _2700 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2574);
    float _2702 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2704 = _717 + _2702;
    float _2706 = _1866 * _2696;
    float _2708 = _2686 * _2546;
    float _2710 = -_2686;
    float _2712 = _2710 + 1.0;
    float _2714 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2570);
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2718 = _717 + _2716;
    float _2720 = _2688 * _2708;
    float _2722 = fma(_2598, _2704, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2726 = _717 + _2724;
    float _2728 = fma(_2102, _2718, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2730 = fma(_2712, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2720);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2734 = _717 + _2732;
    float _2736 = fma(_2722, _2706, _2730);
    float _2738 = fma(_2638, _2734, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2740 = fma(_2670, _2726, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2742 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2744 = _717 + _2742;
    float _2746 = fma(_2728, _2692, _2736);
    float _2748 = _920 + _914;
    float _2750 = in.m_80.x;
    float _2752 = in.m_80.y;
    float _2754 = in.m_80.z;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2758 = _717 + _2756;
    float _2760 = fma(_2698, _2744, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2762 = _2748 + (-1.0);
    float _2764 = fma(_2738, _2664, _2746);
    int _2766 = abs(_2280);
    float _2768 = _914 + (-0.5);
    float _2770 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2772 = float(_2130);
    float _2774 = fma(_2740, _2662, _2764);
    float _2776 = float(_2766);
    float _2778 = _1364 + 0.5;
    float _2780 = _914 + _946;
    float _2782 = fma(_2760, _2644, _2774);
    int _2784 = abs(_2300);
    float _2786 = _2776 * _2772;
    float _2788 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1484);
    float _2790 = _920 + _946;
    float _2792 = fma(_2690, _2758, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2794 = _2786 * (-2.0);
    float _2796 = _2790 + (-1.0);
    float _2798 = fma(_2794, _2750, _2750);
    float _2800 = float(_2292);
    float _2802 = fma(_2770, _2794, _2770);
    float _2804 = _920 + (-0.5);
    float _2806 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2798);
    float _2808 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2810 = _2800 * _1998;
    float _2812 = fma(_2802, _2530, _2806);
    float _2814 = _1776 + 0.5;
    float _2816 = _2810 * (-2.0);
    float _2818 = float(_2784);
    float _2820 = _1552 + (-0.5);
    float _2822 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2156);
    float _2824 = _2812 * 0.15915493667125701904296875;
    float _2826 = fma(_2816, _2752, _2752);
    float _2828 = _2818 * _2314;
    float _2830 = -_1428;
    float _2832 = _2830 + 1.0;
    float _2834 = -_2820;
    float _2836 = -_2268;
    float _2838 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2836);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2842 = -_1440;
    float _2844 = _2842 + 1.0;
    float _2846 = fma(_2808, _2816, _2808);
    float _2848 = fma(_2804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2826);
    float _2850 = _2780 + (-1.0);
    float _2852 = _2828 * (-2.0);
    float _2854 = -_2832;
    float _2856 = fma(_2854, _1364, _2788);
    float _2858 = fma(_2844, _1552, _2838);
    float _2860 = fma(_2846, _2530, _2848);
    float _2862 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2866 = fma(_2852, _2754, _2754);
    float _2868 = _946 + (-0.5);
    float _2870 = _2860 * 0.15915493667125701904296875;
    float _2872 = fma(_2862, _2852, _2862);
    float _2874 = _1382 + 0.5;
    float _2876 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2866);
    float _2878 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_82.x = _2856;
    out.m_82.y = _2858;
    float _2880 = _2824 * 6.283185482025146484375;
    float _2882 = sin(_2880);
    float _2884 = fma(_2872, _2530, _2876);
    float _2886 = fma(_2878, _2874, _2392);
    float _2888 = _1706 + (-0.5);
    int _2890 = ~_2336;
    int _2892 = _2890 + _2396;
    int _2894 = _2892 + 1;
    float _2896 = _2884 * 0.15915493667125701904296875;
    int _2898 = _1582 >> 31;
    float _2900 = _2864 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2902 = _2824 * 6.283185482025146484375;
    float _2904 = cos(_2902);
    float _2906 = -_2448;
    float _2908 = _2906 + 1.0;
    float _2910 = _1724 + (-0.5);
    float _2912 = -_2888;
    float _2914 = -_2252;
    float _2916 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2914);
    float _2918 = -_2134;
    float _2920 = fma(_1382, _2918, _2886);
    int _2922 = ~_2356;
    int _2924 = _2922 + _2418;
    int _2926 = _2924 + 1;
    float _2928 = -_2900;
    float _2930 = -_2398;
    float _2932 = fma(_2928, _2910, _2930);
    float _2934 = -_2472;
    float _2936 = _2934 + 1.0;
    float _2938 = _2870 * 6.283185482025146484375;
    float _2940 = sin(_2938);
    int _2942 = _2898 & 3;
    float _2944 = fma(_1706, _2908, _2916);
    float _2946 = -_2936;
    float _2948 = fma(_1776, _2946, _2822);
    float _2950 = fma(_1724, _2296, _2932);
    int _2952 = _1582 + _2942;
    int _2954 = _739 * _2552;
    int _2956 = _2954 + _1084;
    float _2958 = fma(_2792, _2636, _2782);
    float _2960 = _2870 * 6.283185482025146484375;
    float _2962 = cos(_2960);
    out.m_84.x = _2948;
    out.m_84.y = _2944;
    out.m_84.z = _2920;
    out.m_84.w = _2950;
    int _2964 = _731 * _2894;
    int _2966 = _2964 + _1250;
    float _2968 = fma(_2596, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2958);
    int _2970 = _1720 * _2926;
    int _2972 = _2970 + _2190;
    bool _2974 = !_2316;
    int _2976 = _2974 ? _2966 : (-1);
    float _2978 = _2896 * 6.283185482025146484375;
    float _2980 = cos(_2978);
    float _2982 = _2882 * _2940;
    float _2984 = _2904 * _2940;
    out.m_86.x = _2968;
    int _2986 = _2952 >> 2;
    float _2988 = _2896 * 6.283185482025146484375;
    float _2990 = sin(_2988);
    float _2992 = _2882 * _2962;
    int _2994 = _2986 << 4;
    int _2996 = _2994 + 656;
    float _2998 = _2882 * _2980;
    float _3000 = _2904 * _2962;
    float _3002 = _2904 * _2980;
    float _3004 = _2962 * _2980;
    float _3006 = _2998 * _2514;
    float _3008 = _2940 * _2980;
    float _3010 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3012 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3014 = -_2984;
    float _3016 = fma(_2990, _2992, _3014);
    float _3018 = -_2992;
    float _3020 = fma(_2990, _2984, _3018);
    float _3022 = fma(_2990, _3000, _2982);
    float _3024 = fma(_2990, _2982, _3000);
    float _3026 = -_2514;
    float _3028 = _2990 * _3026;
    float _3030 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _3032 = uint(int(uint(_2996) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c9)._m0[int(_3042)][_3044];
    float _3048 = _3002 * _2514;
    float _3050 = fma(_3004, _2424, _3028);
    float _3052 = -_2990;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3030);
    float _3056 = fma(_3016, _2424, _3006);
    float _3058 = fma(_3022, _2424, _3048);
    float _3060 = -_2990;
    float _3062 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3010);
    float _3064 = -_2990;
    float _3066 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3012);
    float _3068 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3070 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3054);
    float _3072 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3062);
    float _3074 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3066);
    float _3076 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3080 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3068);
    float _3082 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3084 = _2996 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    float _3102 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3076);
    float _3104 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3078);
    float _3106 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3108 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3110 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3112 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3082);
    float _3114 = fma(_3008, _3106, _3050);
    float _3116 = fma(_3020, _3106, _3058);
    float _3118 = fma(_3024, _3106, _3056);
    float _3120 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3104);
    float _3122 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3108);
    float _3124 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3080);
    float _3126 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3110);
    float _3128 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3130 = abs(_1712);
    float _3132 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3134 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3126);
    int _3136 = abs(_1970);
    float _3138 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3102);
    int _3140 = ~_3130;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    float _3146 = _3128 * _3072;
    int _3148 = ~_3136;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3112);
    float _3156 = _3128 * _3070;
    out.m_88.x = _3138;
    out.m_88.y = _3120;
    out.m_88.z = _3124;
    float _3158 = fma(_3132, _3120, _3146);
    int _3160 = abs(_2506);
    float _3162 = fma(_3132, _3138, _3156);
    float _3164 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3122);
    float _3166 = _3128 * _3074;
    int _3168 = _3144 * as_type<int>(_3046);
    int _3170 = ~_2406;
    int _3172 = _3170 + _2454;
    int _3174 = _3172 + 1;
    float _3176 = fma(_3132, _3124, _3166);
    float _3178 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3180 = int(_3178);
    int _3182 = _3152 * as_type<int>(_3038);
    int _3184 = _3182 + _3168;
    int _3186 = abs(_1666);
    float _3188 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3190 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3192 = _1720 * _3174;
    int _3194 = _3192 + _2230;
    int _3196 = ~_3186;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    float _3202 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3188);
    float _3204 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3190);
    int _3206 = ~_3160;
    int _3208 = _3206 + 1;
    int _3210 = _3208 + 1;
    float _3212 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3214 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3202);
    bool _3216 = !_2088;
    float _3218 = _3216 ? as_type<float>(_3194) : as_type<float>(0xffffffffu /* nan */);
    int _3220 = _3200 * as_type<int>(_3092);
    int _3222 = _3220 + _3184;
    float _3224 = _2714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _3226 = _1546 >> 31;
    float _3228 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3212);
    int _3230 = _3210 * as_type<int>(_3100);
    int _3232 = _3230 + _3222;
    float _3234 = _3214 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3236 = as_type<int>(_3218) >> 31;
    float _3238 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3228);
    int _3240 = _3226 & 3;
    float _3242 = _3224 + _3234;
    bool _3244 = !_2180;
    int _3246 = _3244 ? 0 : 1;
    float _3248 = _3238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3250 = _1546 + _3240;
    float _3252 = _2700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _3254 = abs(_3246);
    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3258 = _3242 + _3256;
    int _3260 = _3236 & 3;
    float _3262 = _3252 + _3248;
    int _3264 = abs(_3180);
    float _3266 = _3258 * _3258;
    int _3268 = as_type<int>(_3218) + _3260;
    float _3270 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3272 = _3262 + _3270;
    bool _3274 = uint(_1560) >= 2u;
    float _3276 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3204);
    int _3278 = _3268 >> 2;
    float _3280 = _3272 * _3272;
    float _3282 = float(uint(_3180));
    float _3284 = _3276 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3286 = _3278 << 4;
    int _3288 = _3286 + 800;
    float _3290 = _3266 + _3280;
    float _3292 = float(uint(_3264));
    float _3294 = 1.0 / _3282;
    uint _3296 = uint(int(uint(_3288) >> uint(2)));
    uint _3298 = uint(int(uint(int(_3296)) >> uint(2)));
    int _3300 = int(_3296) & 3;
    float _3302 = (*spvDescriptorSet0.vp_c9)._m0[int(_3298)][_3300];
    int _3304 = int(_3296) + 1;
    uint _3306 = uint(int(uint(_3304) >> uint(2)));
    int _3308 = _3304 & 3;
    float _3310 = (*spvDescriptorSet0.vp_c9)._m0[int(_3306)][_3308];
    int _3312 = _3274 ? 0 : 1;
    float _3314 = _2632 + _3284;
    bool _3316 = _1560 != 3;
    int _3318 = ~_3254;
    int _3320 = _3318 + 1;
    int _3322 = _3320 + 1;
    float _3324 = 1.0 / _3292;
    int _3326 = ~_3312;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    int _3332 = _3232 * _3322;
    int _3334 = _3250 >> 2;
    int _3336 = as_type<int>(_3218) & 3;
    bool _3338 = _3336 != 0;
    int _3340 = _2976 * _3254;
    int _3342 = _3340 + _3332;
    float _3344 = sqrt(_3290);
    int _3346 = _3330;
    float _3348 = _3284;
    float _3350 = _3242;
    float _3352 = _3218;
    float _3354 = _3262;
    if (_3316)
    {
        int _3356 = ~_3312;
        int _3358 = _3356 + 1;
        _3346 = _3358;
    }
    int _3360 = _3346;
    int _3362 = _3334 << 4;
    int _3364 = _3362 + 368;
    int _3366 = abs(_3342);
    int _3368 = as_type<int>(_3294) + (-2);
    uint _3370 = uint(int(uint(_3364) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    float _3386 = float(uint(_3342));
    int _3388 = as_type<int>(_3324) + (-2);
    float _3390 = float(uint(_3366));
    int _3392 = _3338 ? 0 : 1;
    int _3394 = _3364 + 8;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c9)._m0[int(_3406)][_3408];
    bool _3412 = _3344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3414 = as_type<float>(_3388) * _3390;
    bool _3416 = !_2276;
    int _3418 = _3416 ? 0 : 1;
    bool _3420 = _1560 != 3;
    int _3422 = ~_3180;
    int _3424 = _3422 + 1;
    float _3426 = as_type<float>(_3368) * _3386;
    float _3428 = trunc(_3414);
    float _3430 = precise::max(_3428, 0.0);
    uint _3432 = uint(_3430);
    int _3434 = as_type<int>(_3218) & 3;
    bool _3436 = _3434 != 0;
    int _3438 = ~_3264;
    int _3440 = _3438 + 1;
    float _3442 = _3294;
    if (!_3412)
    {
        _3348 = _3242;
    }
    float _3444 = _3348;
    float _3446 = _3444;
    if (!_3412)
    {
        _3350 = _3262;
    }
    float _3448 = _3350;
    float _3450 = trunc(_3426);
    float _3452 = precise::max(_3450, 0.0);
    uint _3454 = uint(_3452);
    float _3456 = _3448;
    if (!_3412)
    {
        _3352 = _3280;
    }
    float _3458 = _3352;
    float _3460 = _3458;
    if (!_3412)
    {
        _3442 = _3266;
    }
    float _3462 = _3442;
    float _3464 = _3462;
    if (!_3412)
    {
        _3354 = _3314;
    }
    float _3466 = _3354;
    int _3468 = ~_3392;
    int _3470 = _3468 + 1;
    int _3472 = _3470 + 1;
    bool _3474 = uint(_3434) > 1u;
    bool _3476 = !_3412;
    float _3478 = _3466;
    int _3480 = _3472;
    if (!_3476)
    {
        float _3482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3486 = _3344 + _3484;
        float _3488 = rsqrt(_3290);
        float _3490 = _3486 * _3482;
        float _3492 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3494 = _3490 * 0.15915493667125701904296875;
        float _3496 = _3494 * 6.283185482025146484375;
        float _3498 = sin(_3496);
        float _3500 = _3494 * 6.283185482025146484375;
        float _3502 = cos(_3500);
        float _3504 = fma(_3498, _3492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3506 = _3488 * _3504;
        float _3508 = _3502 + (-1.0);
        float _3510 = fma(_3258, _3506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3512 = fma(_3272, _3506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3514 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3518 = _3510 + _3516;
        float _3520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3522 = _3512 + _3520;
        float _3524 = fma(_3314, _3502, _3514);
        float _3526 = _3518 * _3518;
        float _3528 = _3522 * _3522;
        _3478 = _3524;
        _3464 = _3526;
        _3460 = _3528;
        _3446 = _3510;
        _3456 = _3512;
    }
    float _3530 = _3478;
    float _3532 = _3464;
    float _3534 = _3460;
    float _3536 = _3446;
    float _3538 = _3456;
    int _3540 = _3288 + 8;
    uint _3542 = uint(int(uint(_3540) >> uint(2)));
    uint _3544 = uint(int(uint(int(_3542)) >> uint(2)));
    int _3546 = int(_3542) & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    int _3550 = int(_3542) + 1;
    uint _3552 = uint(int(uint(_3550) >> uint(2)));
    int _3554 = _3550 & 3;
    float _3556 = (*spvDescriptorSet0.vp_c9)._m0[int(_3552)][_3554];
    if (!_3474)
    {
        int _3558 = ~_3392;
        int _3560 = _3558 + 1;
        _3480 = _3560;
    }
    int _3562 = _3480;
    float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3566 = _3530 + _3564;
    int _3568 = _3440 * int(_3432);
    int _3570 = _3568 + _3366;
    int _3572 = abs(_1602);
    float _3574 = fma(_3566, _3566, _3532);
    bool _3576 = !_3436;
    int _3578 = _3576 ? 0 : 1;
    int _3580 = _3424 * int(_3454);
    int _3582 = _3580 + _3342;
    float _3584 = float(uint(_3570));
    float _3586 = -_2494;
    float _3588 = _3586 + 1.0;
    bool _3590 = _3434 != 3;
    float _3592 = -_2496;
    float _3594 = _3592 + 1.0;
    float _3596 = float(uint(_3582));
    float _3598 = as_type<float>(_3388) * _3584;
    int _3600 = ~_3572;
    int _3602 = _3600 + 1;
    int _3604 = _3602 + 1;
    bool _3606 = uint(_3434) >= 2u;
    float _3608 = as_type<float>(_3368) * _3596;
    int _3610 = abs(_3562);
    float _3612 = trunc(_3598);
    float _3614 = precise::max(_3612, 0.0);
    uint _3616 = uint(_3614);
    int _3618 = abs(_3418);
    int _3620 = _3604 * as_type<int>(_3384);
    int _3622 = abs(_3360);
    int _3624 = ~_3610;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    int _3630 = abs(_3578);
    float _3632 = trunc(_3608);
    float _3634 = precise::max(_3632, 0.0);
    uint _3636 = uint(_3634);
    int _3638 = _3606 ? 0 : 1;
    int _3640 = _3628 * as_type<int>(_3310);
    int _3642 = ~_3618;
    int _3644 = _3642 + 1;
    int _3646 = _3644 + 1;
    float _3648 = _3574 + _3534;
    int _3650 = ~_3630;
    int _3652 = _3650 + 1;
    int _3654 = _3652 + 1;
    int _3656 = _3646 * as_type<int>(_3376);
    int _3658 = _3656 + _3620;
    int _3660 = ~_3638;
    int _3662 = _3660 + 1;
    int _3664 = _3662 + 1;
    bool _3666 = _3434 != 3;
    int _3668 = _3654 * as_type<int>(_3302);
    int _3670 = _3668 + _3640;
    int _3672 = _3664;
    float _3674 = _3648;
    if (_3590)
    {
        int _3676 = ~_3638;
        int _3678 = _3676 + 1;
        _3672 = _3678;
    }
    int _3680 = _3672;
    int _3682 = int(_3432) + int(_3616);
    int _3684 = ~_3264;
    int _3686 = _3684 + 1;
    int _3688 = ~_3622;
    int _3690 = _3688 + 1;
    int _3692 = _3690 + 1;
    int _3694 = abs(_3680);
    int _3696 = _3686 * _3682;
    int _3698 = _3696 + _3366;
    bool _3700 = !_3666;
    int _3702 = _3700 ? 0 : (-1);
    int _3704 = _3692 * as_type<int>(_3402);
    int _3706 = _3704 + _3658;
    bool _3708 = !_3420;
    int _3710 = _3708 ? 0 : (-1);
    float _3712 = fma(_3128, _3128, 1.0);
    int _3714 = ~_3694;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    int _3720 = abs(_3702);
    int _3722 = ~_3180;
    int _3724 = _3722 + 1;
    int _3726 = _3718 * as_type<int>(_3548);
    int _3728 = _3726 + _3670;
    int _3730 = int(_3454) + int(_3636);
    float _3732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3734 = uint(_3698) >= uint(_3264);
    int _3736 = abs(_3710);
    int _3738 = _3724 * _3730;
    int _3740 = _3738 + _3342;
    int _3742 = ~_3720;
    int _3744 = _3742 + 1;
    int _3746 = _3744 + 1;
    int _3748 = ~_3736;
    int _3750 = _3748 + 1;
    int _3752 = _3750 + 1;
    float _3754 = rsqrt(_3712);
    bool _3756 = uint(_3740) >= uint(_3180);
    int _3758 = _3746 * as_type<int>(_3556);
    int _3760 = _3758 + _3728;
    int _3762 = _3342 ^ _3180;
    int _3764 = _3752 * as_type<int>(_3410);
    int _3766 = _3764 + _3706;
    bool _3768 = !_3734;
    int _3770 = _3768 ? 0 : (-1);
    uint _3772 = uint(int(uint(_3762) >> uint(31)));
    float _3774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3776 = !_3756;
    int _3778 = _3776 ? 0 : (-1);
    bool _3780 = !_2534;
    int _3782 = _3780 ? 0 : 1;
    int _3784 = ~_3770;
    int _3786 = _3682 + _3784;
    int _3788 = _3786 + 1;
    int _3790 = ~int(_3772);
    int _3792 = _3790 + 1;
    int _3794 = ~_3730;
    int _3796 = _3794 + _3778;
    int _3798 = _3796 + 1;
    int _3800 = abs(_3782);
    bool _3802 = !_2512;
    int _3804 = _3802 ? 0 : 1;
    int _3806 = _3180 * _3798;
    int _3808 = _3806 + _3342;
    int _3810 = _3788 ^ _3792;
    int _3812 = ~_3800;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    int _3818 = abs(_3804);
    bool _3820 = _3180 == 0;
    int _3822 = _3766 * _3816;
    bool _3824 = _3180 == 0;
    int _3826 = ~_3792;
    int _3828 = _3826 + _3810;
    int _3830 = _3828 + 1;
    int _3832 = ~_3818;
    int _3834 = _3832 + 1;
    int _3836 = _3834 + 1;
    bool _3838 = !_3820;
    int _3840 = _3838 ? _3808 : (-1);
    bool _3842 = !_3824;
    int _3844 = _3842 ? _3830 : (-1);
    int _3846 = _3760 * _3836;
    float _3848 = float(_3840);
    float _3850 = _3732 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3852 = _739 == 0;
    float _3854 = _3774 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3856 = float(_3844);
    float _3858 = fma(_3850, _3848, _2500);
    bool _3860 = !_3852;
    int _3862 = _3860 ? _2956 : (-1);
    float _3864 = _1078 + 0.5;
    bool _3866 = !_2088;
    int _3868 = _3866 ? _2972 : (-1);
    float _3870 = -_2502;
    float _3872 = fma(_3854, _3856, _3870);
    float _3874 = _1068 + (-0.5);
    int _3876 = _3862 * _3800;
    int _3878 = _3876 + _3822;
    float _3880 = fma(_3850, _3864, _3858);
    float _3882 = _3128 * _3754;
    float _3884 = -_3854;
    float _3886 = fma(_3884, _3874, _3872);
    int _3888 = _3868 * _3818;
    int _3890 = _3888 + _3846;
    float _3892 = -_3588;
    float _3894 = fma(_1078, _3892, _3880);
    float _3896 = -_3154;
    float _3898 = _3882 * _3896;
    float _3900 = fma(_1068, _3594, _3886);
    float _3902 = -_3164;
    float _3904 = _3882 * _3902;
    float _3906 = sqrt(_3648);
    float _3908 = -_3134;
    float _3910 = _3882 * _3908;
    float _3912 = fma(_3754, _3070, _3898);
    float _3914 = fma(_3754, _3072, _3904);
    float _3916 = float(_3890);
    float _3918 = fma(_3754, _3074, _3910);
    float _3920 = _3154 + _3162;
    float _3922 = float(_3878);
    float _3924 = _3164 + _3158;
    float _3926 = _3134 + _3176;
    out.m_90.x = _3912;
    out.m_90.y = _3914;
    out.m_90.z = _3918;
    out.m_92.x = _3922;
    bool _3928 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3930 = isnan(_3906);
    bool _3932 = _3928 || _3930;
    bool _3934 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3936 = _3932 || _3934;
    out.m_92.w = _3916;
    out.m_94.x = _3894;
    out.m_94.y = _3900;
    out.m_96.x = _3920;
    out.m_96.y = _3924;
    out.m_96.z = _3926;
    int _3938 = as_type<int>(_3754);
    float _3940 = as_type<float>(_3800);
    if (!_3936)
    {
        _3674 = 1.0;
    }
    float _3942 = _3674;
    bool _3944 = !_3936;
    float _3946 = _3942;
    if (!_3944)
    {
        bool _3948 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3950 = isnan(_3906);
        bool _3952 = _3948 || _3950;
        bool _3954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3956 = _3952 || _3954;
        if (!_3956)
        {
            float _3958 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3960 = _3906 + _3958;
            float _3962 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3964 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3962;
            float _3966 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3968 = _3966 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3970 = 1.0 / _3964;
            float _3972 = _3960 * _3970;
            float _3974 = fma(_3972, _3968, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3946 = _3974;
            _3976 = true;
        }
        else
        {
            bool _3978 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3980 = isnan(_3906);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3986 = _3982 || _3984;
            if (!_3986)
            {
                float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3990 = _3906 + _3988;
                float _3992 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3994 = _3992 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3996 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3998 = _3996 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4000 = 1.0 / _3994;
                float _4002 = _3990 * _4000;
                float _4004 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3946 = _4004;
                _3976 = true;
            }
            else
            {
                _3946 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3976 = false;
    float _4006 = _3946;
    float _4008 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4010 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4012 = floor(_4008);
    float _4014 = floor(_4010);
    float _4016 = -_4012;
    float _4018 = _4008 + _4016;
    float _4020 = -_4014;
    float _4022 = _4010 + _4020;
    float2 _11447 = float2(_4018, _4022);
    float _4024 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11447, float2(0.0), isnan(_11447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11447, float2(0.0), isnan(_11447)), level(0.0)).x;
    float _4026 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4028 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4030 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4032 = _3530 + _4030;
    float _4034 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4026);
    float _4036 = _2632 + _4028;
    float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4040 = _3536 + _4038;
    float _4042 = fma(_4032, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4044 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4034);
    float _4046 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4048 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4050 = _4044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4052 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4046);
    float _4054 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4056 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4048);
    float _4058 = 1.0 / _4050;
    float _4060 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4052);
    float _4062 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4054);
    float _4064 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4056);
    float _4066 = fma(_4040, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4068 = _4060 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4070 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4062);
    float _4072 = _4064 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4074 = -_2632;
    float _4076 = _4074 + _4042;
    float _4078 = _4068 + _4050;
    float _4080 = _4070 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4082 = trunc(_4072);
    int _4084 = int(_4082);
    float _4086 = -_3224;
    float _4088 = _4086 + _4066;
    float _4090 = _4076 * _4076;
    float _4092 = _4078 * _4058;
    float _4094 = _4092 * 0.5;
    float _4096 = fma(_4088, _4088, _4090);
    float _4098 = trunc(_4080);
    int _4100 = int(_4098);
    float _4102 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4104 = fma(_4094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4102);
    float _4106 = 1.0 / _4104;
    int _4108 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4110 = _4084 + _4108;
    int _4112 = _4110 + 1;
    int _4114 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4116 = _4100 + _4114;
    int _4118 = _4116 + 1;
    int _4120 = _4112 | _4118;
    float _4122 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4124 = _4106 * _4122;
    bool _4126 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4128 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4130 = !_4126;
    int _4132 = _4130 ? 0 : 1;
    int _4134 = 2;
    int _4136 = _4118;
    int _4138 = _4112;
    float _4140 = _4032;
    float _4142 = _4066;
    if (!_4126)
    {
        _4134 = 1;
    }
    int _4144 = _4134;
    int _4146 = _4144;
    if (!_4128)
    {
        _4146 = _4132;
    }
    int _4148 = _4146;
    float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4152 = _3538 + _4150;
    bool _4154 = _4112 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4156 = _4148 << 6;
    float _4158 = fma(_4152, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4160 = _4120 < 0;
    bool _4162 = _4160 || _4154;
    int _4164 = _4156 + 96;
    uint _4166 = uint(int(uint(_4164) >> uint(2)));
    uint _4168 = uint(int(uint(int(_4166)) >> uint(2)));
    int _4170 = int(_4166) & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    int _4174 = int(_4166) + 1;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    int _4178 = _4174 & 3;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[int(_4176)][_4178];
    float _4182 = -_3252;
    float _4184 = _4182 + _4158;
    bool _4186 = _4118 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4188 = _4186 || _4162;
    float _4190 = fma(_4184, _4184, _4096);
    int _4192 = _4156 + 104;
    uint _4194 = uint(int(uint(_4192) >> uint(2)));
    uint _4196 = uint(int(uint(int(_4194)) >> uint(2)));
    int _4198 = int(_4194) & 3;
    float _4200 = (*spvDescriptorSet0.vp_c15)._m0[int(_4196)][_4198];
    int _4202 = int(_4194) + 1;
    uint _4204 = uint(int(uint(_4202) >> uint(2)));
    int _4206 = _4202 & 3;
    float _4208 = (*spvDescriptorSet0.vp_c15)._m0[int(_4204)][_4206];
    float _4210 = sqrt(_4190);
    if (!_4188)
    {
        int _4212 = _4118 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4214 = _4212 + _4112;
        _3938 = _4214;
    }
    int _4216 = _3938;
    int _4218 = _4156 + 48;
    uint _4220 = uint(int(uint(_4218) >> uint(2)));
    uint _4222 = uint(int(uint(int(_4220)) >> uint(2)));
    int _4224 = int(_4220) & 3;
    float _4226 = (*spvDescriptorSet0.vp_c15)._m0[int(_4222)][_4224];
    int _4228 = int(_4220) + 1;
    uint _4230 = uint(int(uint(_4228) >> uint(2)));
    int _4232 = _4228 & 3;
    float _4234 = (*spvDescriptorSet0.vp_c15)._m0[int(_4230)][_4232];
    float _4236 = _3538;
    if (!_4188)
    {
        float _4238 = floor(_4072);
        _4236 = _4238;
    }
    float _4240 = _4236;
    if (!_4188)
    {
        int _4242 = _4216 << 2;
        _4136 = _4242;
    }
    int _4244 = _4136;
    int _4246 = _4244;
    if (!_4188)
    {
        uint _4248 = uint(int(uint(_4216) >> uint(2)));
        _4138 = int(_4248);
    }
    int _4250 = _4138;
    if (!_4188)
    {
        int _4252 = 12 & _4244;
        _4246 = _4252;
    }
    int _4254 = _4246;
    int _4256 = _4156 + 64;
    uint _4258 = uint(int(uint(_4256) >> uint(2)));
    uint _4260 = uint(int(uint(int(_4258)) >> uint(2)));
    int _4262 = int(_4258) & 3;
    float _4264 = (*spvDescriptorSet0.vp_c15)._m0[int(_4260)][_4262];
    int _4266 = int(_4258) + 1;
    uint _4268 = uint(int(uint(_4266) >> uint(2)));
    int _4270 = _4266 & 3;
    float _4272 = (*spvDescriptorSet0.vp_c15)._m0[int(_4268)][_4270];
    bool _4274 = _4210 > 0.0;
    if (!_4188)
    {
        int _4276 = _4250 << 4;
        int _4278 = _4276 + _4254;
        _4140 = as_type<float>(_4278);
    }
    float _4280 = _4140;
    int _4282 = _4156 + 56;
    uint _4284 = uint(int(uint(_4282) >> uint(2)));
    uint _4286 = uint(int(uint(int(_4284)) >> uint(2)));
    int _4288 = int(_4284) & 3;
    float _4290 = (*spvDescriptorSet0.vp_c15)._m0[int(_4286)][_4288];
    int _4292 = int(_4284) + 1;
    uint _4294 = uint(int(uint(_4292) >> uint(2)));
    int _4296 = _4292 & 3;
    float _4298 = (*spvDescriptorSet0.vp_c15)._m0[int(_4294)][_4296];
    bool _4300 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4302 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4304 = _4300 || _4302;
    bool _4306 = isnan(0.5);
    bool _4308 = _4304 || _4306;
    float _4310 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4274)
    {
        _3940 = _4066;
    }
    float _4312 = _3940;
    int _4314 = _4156 + 72;
    uint _4316 = uint(int(uint(_4314) >> uint(2)));
    uint _4318 = uint(int(uint(int(_4316)) >> uint(2)));
    int _4320 = int(_4316) & 3;
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[int(_4318)][_4320];
    int _4324 = int(_4316) + 1;
    uint _4326 = uint(int(uint(_4324) >> uint(2)));
    int _4328 = _4324 & 3;
    float _4330 = (*spvDescriptorSet0.vp_c15)._m0[int(_4326)][_4328];
    float _4332 = _4312;
    float _4334 = _4312;
    if (!_4274)
    {
        _4310 = _4158;
    }
    float _4336 = _4310;
    float _4338 = _4036 * _4180;
    int _4340 = _4156 + 80;
    uint _4342 = uint(int(uint(_4340) >> uint(2)));
    uint _4344 = uint(int(uint(int(_4342)) >> uint(2)));
    int _4346 = int(_4342) & 3;
    float _4348 = (*spvDescriptorSet0.vp_c15)._m0[int(_4344)][_4346];
    int _4350 = int(_4342) + 1;
    uint _4352 = uint(int(uint(_4350) >> uint(2)));
    int _4354 = _4350 & 3;
    float _4356 = (*spvDescriptorSet0.vp_c15)._m0[int(_4352)][_4354];
    float _4358 = fma(_3224, _4172, _4338);
    float _4360 = fma(_3252, _4200, _4358);
    int _4362 = _4156 + 88;
    uint _4364 = uint(int(uint(_4362) >> uint(2)));
    uint _4366 = uint(int(uint(int(_4364)) >> uint(2)));
    int _4368 = int(_4364) & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    int _4372 = int(_4364) + 1;
    uint _4374 = uint(int(uint(_4372) >> uint(2)));
    int _4376 = _4372 & 3;
    float _4378 = (*spvDescriptorSet0.vp_c15)._m0[int(_4374)][_4376];
    float _4380 = _4360 + _4208;
    float _4382 = _4036 * _4234;
    float _4384 = _4280;
    float _4386 = _4382;
    float _4388 = _4336;
    float _4390 = _4240;
    if (!_4188)
    {
        int _4392 = as_type<int>(_4280) + 400;
        uint _4394 = uint(int(uint(_4392) >> uint(2)));
        uint _4396 = uint(int(uint(int(_4394)) >> uint(2)));
        int _4398 = int(_4394) & 3;
        float _4400 = (*spvDescriptorSet0.vp_c15)._m0[int(_4396)][_4398];
        _4384 = _4400;
    }
    float _4402 = _4384;
    float _4404 = 1.0 / _4380;
    float _4406 = fma(_3224, _4226, _4382);
    if (!_4274)
    {
        _4386 = _4042;
    }
    float _4408 = _4386;
    float _4410 = _4036 * _4272;
    float _4412 = fma(_3224, _4264, _4410);
    bool _4414 = !_4274;
    float _4416 = _4408;
    float _4418 = _4322;
    float _4420 = _4402;
    if (!_4414)
    {
        float _4422 = _221 * _221;
        float _4424 = rsqrt(_4190);
        float _4426 = fma(_219, _219, _4422);
        float _4428 = fma(_217, _217, _4426);
        float _4430 = sqrt(_4428);
        float _4432 = _4088 * _4424;
        float _4434 = _4076 * _4424;
        float _4436 = _4184 * _4424;
        bool _4438 = _4430 > 0.0;
        float _4440 = _4430;
        float _4442 = _4424;
        if (!_4438)
        {
            _4332 = _4066;
        }
        float _4444 = _4332;
        _4334 = _4444;
        if (!_4438)
        {
            _4440 = _4042;
        }
        float _4446 = _4440;
        _4416 = _4446;
        if (!_4438)
        {
            _4442 = _4158;
        }
        float _4448 = _4442;
        bool _4450 = !_4438;
        _4388 = _4448;
        if (!_4450)
        {
            float _4452 = rsqrt(_4428);
            float _4454 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4456 = _221 * _4452;
            float _4458 = _219 * _4452;
            float _4460 = _217 * _4452;
            float _4462 = _4434 * _4456;
            float _4464 = fma(_4432, _4458, _4462);
            float _4466 = _4454 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4468 = fma(_4436, _4460, _4464);
            float _4470 = _4468 * _4466;
            float _4472 = fma(_219, _4470, _4066);
            float _4474 = fma(_221, _4470, _4042);
            float _4476 = fma(_217, _4470, _4158);
            _4334 = _4472;
            _4416 = _4474;
            _4388 = _4476;
        }
    }
    float _4478 = _4334;
    float _4480 = _4416;
    float _4482 = _4388;
    float _4484 = fma(_3252, _4322, _4412);
    float _4486 = fma(_3252, _4290, _4406);
    float _4488 = _4482;
    if (_4308)
    {
        _4418 = _4478;
    }
    float _4490 = _4418;
    float _4492 = _4490;
    if (_4308)
    {
        _229 = _4480;
    }
    float _4494 = _229;
    float _4496 = _4494;
    if (!_4308)
    {
        float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4500 = _2632 + _4498;
        float _4502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4504 = _3224 + _4502;
        float _4506 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4508 = -_2632;
        float _4510 = _4508 + _4480;
        float _4512 = _4500 * _4500;
        float _4514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4516 = _3252 + _4514;
        float _4518 = fma(_4504, _4504, _4512);
        float _4520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4522 = fma(_4516, _4516, _4518);
        float _4524 = sqrt(_4522);
        float _4526 = _4506 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4528 = -_3224;
        float _4530 = _4528 + _4478;
        float _4532 = precise::min(_4524, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4534 = _4532 * _4520;
        float _4536 = _4526 * _4534;
        float _4538 = -_3252;
        float _4540 = _4538 + _4482;
        float _4542 = fma(_4510, _4536, _2632);
        float _4544 = fma(_4530, _4536, _3224);
        float _4546 = fma(_4540, _4536, _3252);
        _4496 = _4542;
        _4492 = _4544;
        _4488 = _4546;
    }
    float _4548 = _4496;
    float _4550 = _4492;
    float _4552 = _4488;
    float _4554 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4556 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4558 = _4486 + _4298;
    float _4560 = _4484 + _4330;
    float _4562 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4564 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4554);
    float _4566 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4556);
    float _4568 = _4558 * _4404;
    float _4570 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4572 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4562);
    float _4574 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4564);
    float _4576 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4566);
    float _4578 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4570);
    bool _4580 = _4568 >= 0.0;
    float _4582 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4572);
    float _4584 = _4574 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4586 = _4560 * _4404;
    float _4588 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4578);
    bool _4590 = _4568 <= 1.0;
    bool _4592 = _4590 && _4580;
    float _4594 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4596 = _4582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4598 = _4588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4600 = _4586 >= 0.0;
    bool _4602 = _4600 && _4592;
    float _4604 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4606 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4608 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4594);
    bool _4610 = _4586 <= 1.0;
    bool _4612 = _4610 && _4602;
    float _4614 = _4576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4616 = -_4606;
    float _4618 = fma(_4616, _4604, 1.0);
    float _4620 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4608);
    float _4622 = _4566;
    float _4624 = _4560;
    float _4626 = _4568;
    if (!_4188)
    {
        float _4628 = rint(_4402);
        float _4630 = precise::max(_4628, 0.0);
        uint _4632 = uint(_4630);
        uint _4634 = clamp(_4632, 0u, 65535u);
        _4622 = as_type<float>(_4634);
    }
    float _4636 = _4622;
    float _4638 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_4188)
    {
        float _4640 = -_4240;
        float _4642 = _4072 + _4640;
        _4624 = _4642;
    }
    float _4644 = _4624;
    float _4646 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4648 = _4036 * _4356;
    float _4650 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4652 = log2(_4618);
    if (_4612)
    {
        float _4654 = float(_4148);
        _4420 = _4654;
    }
    float _4656 = _4420;
    float _4658 = fma(_3224, _4348, _4648);
    float _4660 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4650);
    float _4662 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4638);
    float _4664 = fma(_3252, _4370, _4658);
    float _4666 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4660);
    float _4668 = 1.0 / _4646;
    float _4670 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4662);
    float _4672 = _4664 + _4378;
    float _4674 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4666);
    float _4676 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4670);
    float _4678 = _4672 * _4404;
    float _4680 = _4486;
    float _4682 = _4674;
    float _4684 = _4678;
    if (!_4188)
    {
        float _4686 = floor(_4080);
        _4680 = _4686;
    }
    float _4688 = _4680;
    float _4690 = _4652 * 0.693147182464599609375;
    float _4692 = _4690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4694 = _4656;
    if (_4612)
    {
        float _4696 = rint(_4656);
        float _4698 = precise::max(_4696, 0.0);
        uint _4700 = uint(_4698);
        uint _4702 = clamp(_4700, 0u, 65535u);
        _4694 = as_type<float>(_4702);
    }
    float _4704 = _4694;
    float _4706 = _4674 * _4668;
    float _4708 = _4676 * _4668;
    float _4710 = fma(_4706, 0.5, 0.5);
    float _4712 = fma(_4708, -0.5, 0.5);
    float _4714 = _4688;
    if (!_4188)
    {
        float _4716 = -_4688;
        float _4718 = _4080 + _4716;
        _4714 = _4718;
    }
    float _4720 = _4714;
    float _4722 = _4668;
    if (!_4188)
    {
        float3 _12626 = float3(_4644, _4720, float(as_type<int>(_4636)));
        float3 _12630 = select(_12626, float3(0.0), isnan(_12626));
        float _4724 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12630.xy, uint(rint(_12630.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12630.xy, uint(rint(_12630.z)), level(0.0)).x;
        _4722 = _4724;
    }
    float _4726 = _4722;
    float _4728 = _4586;
    float _4730 = _4704;
    if (_4612)
    {
        float3 _12646 = float3(_4568, _4586, float(as_type<int>(_4704)));
        float3 _12648 = select(_12646, float3(0.0), isnan(_12646));
        float _4732 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12648.xy, uint(rint(_12648.z)), _4678, level(0.0));
        _4728 = _4732;
    }
    float _4734 = _4728;
    float3 _12658 = float3(_4710, _4712, _4692);
    float _4736 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12658, float3(0.0), isnan(_12658)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12658, float3(0.0), isnan(_12658)), level(0.0)).x;
    float3 _12667 = float3(_4710, _4712, _4692);
    float4 _4739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12667, float3(0.0), isnan(_12667)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12667, float3(0.0), isnan(_12667)), level(0.0)).xyzw;
    float _4741 = _4739.x;
    float _4743 = _4739.y;
    float _4745 = _4739.z;
    float _4747 = _4739.w;
    float _4749 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_4188)
    {
        _4390 = 1.0;
    }
    float _4751 = _4390;
    bool _4753 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4755 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4757 = _4753 || _4755;
    bool _4759 = isnan(0.5);
    bool _4761 = _4757 || _4759;
    float _4763 = _4751;
    if (_4761)
    {
        _4749 = 1.0;
    }
    float _4765 = _4749;
    float _4767 = _4765;
    if (!_4761)
    {
        float _4769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4771;
        float _4775 = _4769 * 0.15915493667125701904296875;
        float _4777 = _4775 * 6.283185482025146484375;
        float _4779 = cos(_4777);
        float _4781 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4783 = _4781 * 0.15915493667125701904296875;
        float _4785 = _4775 * 6.283185482025146484375;
        float _4787 = sin(_4785);
        float _4789 = 1.0 / _4779;
        float _4791 = _4783 * 6.283185482025146484375;
        float _4793 = cos(_4791);
        float _4795 = _4787 * _4789;
        float _4797 = _4783 * 6.283185482025146484375;
        float _4799 = sin(_4797);
        float _4801 = _4793 * _4795;
        float _4803 = 1.0 / _4773;
        float _4805 = 1.0 / _4801;
        float _4807 = _4799 * _4805;
        float _4809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4811 = fma(_4124, _4807, _4809);
        float _4813 = _4811 * _4803;
        float _4815 = precise::clamp(_4813, 0.0, 1.0);
        _4730 = _4801;
        _4626 = _4811;
        _4767 = _4815;
    }
    float _4817 = _4730;
    float _4819 = _4626;
    float _4821 = _4767;
    float _4823 = _4817;
    float _4825 = _4819;
    if (!_4188)
    {
        int _4827 = _4216 << 4;
        int _4829 = _4827 + 2048;
        uint _4831 = uint(int(uint(_4829) >> uint(2)));
        uint _4833 = uint(int(uint(int(_4831)) >> uint(2)));
        int _4835 = int(_4831) & 3;
        float _4837 = (*spvDescriptorSet0.vp_c15)._m0[int(_4833)][_4835];
        int _4839 = int(_4831) + 1;
        uint _4841 = uint(int(uint(_4839) >> uint(2)));
        int _4843 = _4839 & 3;
        float _4845 = (*spvDescriptorSet0.vp_c15)._m0[int(_4841)][_4843];
        int _4847 = _4829 + 8;
        uint _4849 = uint(int(uint(_4847) >> uint(2)));
        uint _4851 = uint(int(uint(int(_4849)) >> uint(2)));
        int _4853 = int(_4849) & 3;
        float _4855 = (*spvDescriptorSet0.vp_c15)._m0[int(_4851)][_4853];
        int _4857 = int(_4849) + 1;
        uint _4859 = uint(int(uint(_4857) >> uint(2)));
        int _4861 = _4857 & 3;
        float _4863 = (*spvDescriptorSet0.vp_c15)._m0[int(_4859)][_4861];
        float _4865 = _4036 * _4845;
        float _4867 = fma(_3224, _4837, _4865);
        float _4869 = fma(_3252, _4855, _4867);
        float _4871 = _4869 + _4863;
        float _4873 = precise::clamp(_4871, 0.0, 1.0);
        float _4875 = -_4873;
        float _4877 = _4875 + _4726;
        float _4879 = fma(_4877, 500.0, 1.5);
        float _4881 = exp2(_4879);
        float _4883 = 0.0 + _4881;
        float _4885 = precise::clamp(_4883, 0.0, 1.0);
        _4823 = _4837;
        _4825 = _4845;
        _4763 = _4885;
    }
    float _4887 = _4823;
    float _4889 = _4825;
    float _4891 = _4763;
    float _4893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4895 = _4548 + _4893;
    float _4897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4899 = _4550 + _4897;
    float _4901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4903 = _4552 + _4901;
    float _4905 = _4895 * _4895;
    float _4907 = fma(_4899, _4899, _4905);
    float _4909 = fma(_4903, _4903, _4907);
    float _4911 = rsqrt(_4909);
    float _4913 = _4911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4915 = _4899 * _4913;
    float _4917 = _4903 * _4913;
    float _4919 = _4915 * _4915;
    float _4921 = _4917 * _4917;
    float _4923 = _4919 + _4921;
    float _4925 = sqrt(_4923);
    bool _4927 = _4925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4931 = _4925 + _4929;
    float _4933 = _4911;
    float _4935 = _4931;
    float _4937 = _4887;
    float _4939 = _4895;
    float _4941 = _4913;
    if (_4927)
    {
        float _4943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4933 = _4943;
    }
    float _4945 = _4933;
    float _4947 = _4945;
    if (_4927)
    {
        float _4949 = _4931 * _4945;
        _4935 = _4949;
    }
    float _4951 = _4935;
    if (_4927)
    {
        float _4953 = rsqrt(_4923);
        _4947 = _4953;
    }
    float _4955 = _4947;
    float _4957 = _4955;
    if (_4927)
    {
        float _4959 = _4951 * 0.15915493667125701904296875;
        _4937 = _4959;
    }
    float _4961 = _4937;
    float _4963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4965 = _4903;
    float _4967 = _4961;
    if (_4927)
    {
        float _4969 = _4961 * 6.283185482025146484375;
        float _4971 = sin(_4969);
        _4965 = _4971;
    }
    float _4973 = _4965;
    float _4975 = precise::max(0.0, _4963);
    float _4977 = _4889;
    float _4979 = _4975;
    if (_4927)
    {
        float _4981 = _4961 * 6.283185482025146484375;
        float _4983 = cos(_4981);
        _4977 = _4983;
    }
    float _4985 = _4977;
    float _4987 = -_4913;
    float _4989 = -_4975;
    float _4991 = fma(_4895, _4987, _4989);
    if (_4927)
    {
        float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4939 = _4993;
    }
    float _4995 = _4939;
    float _4997 = _4973;
    float _4999 = _4995;
    if (_4927)
    {
        float _5001 = fma(_4973, _4995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4997 = _5001;
    }
    float _5003 = _4997;
    float _5005 = _5003;
    if (!_4927)
    {
        _4999 = _4917;
    }
    float _5007 = _4999;
    float _5009 = _5007;
    if (!_4927)
    {
        _4967 = _4919;
    }
    float _5011 = _4967;
    float _5013 = _5011;
    if (_4927)
    {
        float _5015 = _4955 * _5003;
        _4142 = _5015;
    }
    float _5017 = _4142;
    if (!_4927)
    {
        _4957 = _4915;
    }
    float _5019 = _4957;
    float _5021 = _5019;
    float _5023 = _4985;
    if (_4927)
    {
        float _5025 = _4985 + (-1.0);
        _4979 = _5025;
    }
    float _5027 = _4979;
    if (_4927)
    {
        float _5029 = _4915 * _5017;
        _5021 = _5029;
    }
    float _5031 = _5021;
    if (!_4927)
    {
        _5005 = _4991;
    }
    float _5033 = _5005;
    float _5035 = _5033;
    if (_4927)
    {
        float _5037 = _4917 * _5017;
        _5009 = _5037;
    }
    float _5039 = _5009;
    if (_4927)
    {
        float _5041 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4941 = _5041;
    }
    float _5043 = _4941;
    if (_4927)
    {
        float _5045 = _5031 * _5031;
        _5013 = _5045;
    }
    float _5047 = _5013;
    float _5049 = sqrt(_4909);
    if (_4927)
    {
        float _5051 = fma(_4991, _4985, _5043);
        _5035 = _5051;
    }
    float _5053 = _5035;
    if (!_4927)
    {
        _5023 = _4921;
    }
    float _5055 = _5023;
    float _5057 = _5055;
    if (_4927)
    {
        float _5059 = _5039 * _5039;
        _5057 = _5059;
    }
    float _5061 = _5057;
    float _5063 = fma(_5053, _5053, _5047);
    float _5065 = _5063 + _5061;
    float _5067 = rsqrt(_5065);
    float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5071 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5069);
    float _5073 = precise::clamp(_5071, 0.0, 1.0);
    float _5075 = -_5073;
    float _5077 = _5075 + 1.0;
    float _5079 = abs(_5077);
    float _5081 = log2(_5079);
    float _5083 = _5067 * _5031;
    float _5085 = _5067 * _5053;
    float _5087 = _5067 * _5039;
    float _5089 = _5083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5091 = -_5089;
    float _5093 = fma(_5085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5091);
    float _5095 = -_5087;
    float _5097 = fma(_5095, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5093);
    float _5099 = _5081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5101 = fma(_5097, -0.5, 0.5);
    float _5103 = fma(_5097, 0.5, 0.5);
    float _5105 = _5085 + 1.0;
    float _5107 = exp2(_5099);
    float _5109 = fma(_5103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5111 = fma(_5103, _5109, -0.212114393711090087890625);
    float _5113 = sqrt(_5101);
    float _5115 = fma(_5103, _5111, 1.570728778839111328125);
    float _5117 = -_5085;
    float _5119 = fma(_5107, _5105, _5117);
    float _5121 = fma(_5119, 0.5, 0.5);
    float _5123 = _5113 * 0.636619746685028076171875;
    float _5125 = -_5115;
    float _5127 = fma(_5123, _5125, 1.0);
    float2 _13244 = float2(_5127, _5121);
    float3 _5131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13244, float2(0.0), isnan(_13244)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13244, float2(0.0), isnan(_13244)), level(0.0)).xyz;
    float _5133 = _5131.x;
    float _5135 = _5131.y;
    float _5137 = _5131.z;
    float _5139 = abs(_4124);
    float _5141 = log2(_5139);
    float _5143 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5145 = _5081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5147 = -_4024;
    float _5149 = _5147 + 1.0;
    float _5151 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5143);
    float _5153 = _4674 + _4646;
    bool _5155 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5157 = isnan(_5049);
    bool _5159 = _5155 || _5157;
    bool _5161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5163 = _5159 || _5161;
    float _5165 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5151);
    float _5167 = exp2(_5145);
    bool _5169 = _4124 <= 8000.0;
    bool _5171 = isnan(_4124);
    bool _5173 = _5169 || _5171;
    bool _5175 = isnan(8000.0);
    bool _5177 = _5173 || _5175;
    float _5179 = float(_5177);
    float _5181 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5165);
    float _5183 = _5153 * 0.5;
    float _5185 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5187 = _4646 * 0.5;
    float _5189 = _5181 + _4646;
    out.gl_Position.x = _4674;
    out.gl_Position.y = _4676;
    out.gl_Position.z = _5181;
    out.gl_Position.w = _4646;
    float _5191 = fma(_4676, -0.5, _5187);
    float _5193 = exp2(_5185);
    float _5195 = _5189 * 0.5;
    out.m_98.x = _5183;
    out.m_98.y = _5191;
    out.m_98.z = _5195;
    out.m_98.w = _4646;
    float _5197 = -_5167;
    float _5199 = _5197 + 1.0;
    if (!_4612)
    {
        _4682 = 1.0;
    }
    float _5201 = _4682;
    float _5203 = _5201;
    if (_4612)
    {
        bool _5205 = _4734 >= _4678;
        bool _5207 = isnan(_4734);
        bool _5209 = _5205 || _5207;
        bool _5211 = isnan(_4678);
        bool _5213 = _5209 || _5211;
        float _5215 = float(_5213);
        _5203 = _5215;
    }
    float _5217 = _5203;
    float _5219 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5221 = fma(_5193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = _5219;
    if (!_5163)
    {
        _4684 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5227 = _4684;
    float _5229 = _5217 * _4891;
    float _5231 = fma(_5223, -2.0, 3.0);
    float _5233 = _5223 * _5223;
    float _5235 = _5219 * _4736;
    float _5237 = -_5219;
    float _5239 = _5237 + 1.0;
    float _5241 = _5239;
    float _5243 = _5227;
    float _5245 = _5227;
    if (!_5163)
    {
        _5225 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5247 = _5225;
    float _5249 = _5233 * _5231;
    float _5251 = -_5249;
    float _5253 = _5251 + 1.0;
    float _5255 = fma(_5253, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5249);
    float _5257 = _5179 * _5255;
    float _5259 = _5257 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5261 = _5149 * _5259;
    float _5263 = precise::clamp(_5261, 0.0, 1.0);
    float _5265 = _4747 * _5235;
    float _5267 = -_5263;
    float _5269 = fma(_5267, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5271 = _5263;
    float _5273 = _5265;
    float _5275 = _5247;
    float _5277 = _5247;
    if (!_5163)
    {
        _5271 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5279 = _5271;
    float _5281 = -_5229;
    float _5283 = fma(_5281, _5269, 1.0);
    float _5285 = precise::clamp(_5283, 0.0, 1.0);
    float _5287 = _4747 * _5239;
    float _5289 = _5285;
    float _5291 = _5279;
    float _5293 = _5279;
    if (!_5163)
    {
        _5241 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5295 = _5241;
    float _5297 = _5285 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5299 = _5295;
    float _5301 = _5295;
    if (!_5163)
    {
        _5289 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5303 = _5289;
    out.m_100.x = _5297;
    float _5305 = _5137 * _5235;
    float _5307 = fma(_5133, _5265, _4741);
    float _5309 = fma(_5135, _5265, _4743);
    float _5311 = _4821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5313 = fma(_4747, _5305, _4745);
    float _5315 = _5303;
    float _5317 = _5303;
    if (!_5163)
    {
        _5273 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5319 = _5273;
    out.m_102.x = _5307;
    out.m_102.y = _5309;
    out.m_102.z = _5313;
    out.m_102.w = _5287;
    bool _5321 = !_5163;
    float _5323 = _5319;
    float _5325 = _5319;
    if (!_5321)
    {
        bool _5327 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5329 = isnan(_5049);
        bool _5331 = _5327 || _5329;
        bool _5333 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5335 = _5331 || _5333;
        if (!_5335)
        {
            float _5337 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5339 = _5049 + _5337;
            float _5341 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5343 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5341;
            float _5345 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5347 = _5345 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5349 = 1.0 / _5343;
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5353 = _5351 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5355 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5357 = _5355 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5367 = _5339 * _5349;
            float _5369 = precise::clamp(_5367, 0.0, 1.0);
            float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5373 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5375 = fma(_5369, _5347, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5377 = fma(_5369, _5373, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5379 = fma(_5369, _5353, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5381 = fma(_5369, _5357, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5383 = fma(_5369, _5361, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5385 = fma(_5369, _5365, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5293 = _5379;
            _5325 = _5383;
            _5245 = _5375;
            _5301 = _5381;
            _5277 = _5377;
            _5317 = _5385;
            _5387 = true;
        }
        else
        {
            bool _5389 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5391 = isnan(_5049);
            bool _5393 = _5389 || _5391;
            bool _5395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5397 = _5393 || _5395;
            if (!_5397)
            {
                _5243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5399 = _5243;
            _5245 = _5399;
            if (!_5397)
            {
                _5291 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5401 = _5291;
            _5293 = _5401;
            if (!_5397)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5403 = _5275;
            _5277 = _5403;
            if (!_5397)
            {
                _5299 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5405 = _5299;
            _5301 = _5405;
            if (!_5397)
            {
                _5323 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5407 = _5323;
            _5325 = _5407;
            if (!_5397)
            {
                _5315 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5409 = _5315;
            bool _5411 = !_5397;
            _5317 = _5409;
            if (!_5411)
            {
                bool _5413 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5415 = isnan(_5049);
                bool _5417 = _5413 || _5415;
                bool _5419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5421 = _5417 || _5419;
                if (!_5421)
                {
                    float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5425 = _5049 + _5423;
                    float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5429 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5427;
                    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5433 = _5431 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5435 = 1.0 / _5429;
                    float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5443 = _5441 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5451 = _5449 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5453 = _5425 * _5435;
                    float _5455 = precise::clamp(_5453, 0.0, 1.0);
                    float _5457 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5459 = _5457 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5461 = fma(_5455, _5433, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5463 = fma(_5455, _5459, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5465 = fma(_5455, _5439, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5467 = fma(_5455, _5443, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5469 = fma(_5455, _5447, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5471 = fma(_5455, _5451, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5293 = _5465;
                    _5325 = _5469;
                    _5245 = _5461;
                    _5301 = _5467;
                    _5277 = _5463;
                    _5317 = _5471;
                    _5387 = true;
                }
                else
                {
                    _5293 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5325 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5301 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5317 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5387 = false;
    float _5473 = _5293;
    float _5475 = _5325;
    float _5477 = _5245;
    float _5479 = _5301;
    float _5481 = _5277;
    float _5483 = _5317;
    float _5485 = fma(_3924, -0.5, 0.5);
    float _5487 = precise::clamp(_5485, 0.0, 1.0);
    float _5489 = -_5473;
    float _5491 = _5489 + _5475;
    float _5493 = _5311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5495 = -_5477;
    float _5497 = _5495 + _5479;
    float _5499 = fma(_5487, _5491, _5473);
    out.m_104.x = 0.0;
    float _5501 = -_5481;
    float _5503 = _5501 + _5483;
    float _5505 = fma(_5487, _5497, _5477);
    float _5507 = _5499 * 0.586610972881317138671875;
    out.m_65.x = _5493;
    bool _5509 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5511 = fma(_5487, _5503, _5481);
    float _5513 = fma(_5505, 0.298911988735198974609375, _5507);
    bool _5515 = _4821 > 0.0;
    bool _5517 = isnan(_4821);
    bool _5519 = _5515 || _5517;
    bool _5521 = isnan(0.0);
    bool _5523 = _5519 || _5521;
    float _5525 = fma(_5511, 0.114477999508380889892578125, _5513);
    float _5527 = -_5525;
    float _5529 = _5505 + _5527;
    float _5531 = -_5525;
    float _5533 = _5499 + _5531;
    float _5535 = -_5525;
    float _5537 = _5511 + _5535;
    float _5539 = fma(_5529, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    float _5541 = fma(_5533, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    float _5543 = fma(_5537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    bool _5545 = !_5509;
    if (!_5545)
    {
        float _5547 = -_4548;
        float _5549 = _5547 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5551 = -_4550;
        float _5553 = _5551 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5555 = -_4552;
        float _5557 = _5555 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5559 = _5549 * _5549;
        float _5561 = fma(_5553, _5553, _5559);
        float _5563 = fma(_5557, _5557, _5561);
        float _5565 = sqrt(_5563);
        float _5567 = rsqrt(_5563);
        float _5569 = -_5565;
        float _5571 = _5569 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5573 = _5571 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5575 = precise::clamp(_5573, 0.0, 1.0);
        float _5577 = _5553 * _5567;
        float _5579 = _5549 * _5567;
        float _5581 = abs(_5575);
        float _5583 = log2(_5581);
        float _5585 = _5557 * _5567;
        float _5587 = _5577 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5589 = _3924 * _5579;
        float _5591 = -_5579;
        float _5593 = -_5587;
        float _5595 = fma(_5591, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5593);
        float _5597 = fma(_3920, _5577, _5589);
        float _5599 = -_5585;
        float _5601 = fma(_5599, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5595);
        float _5603 = fma(_3926, _5585, _5597);
        float _5605 = precise::clamp(_5603, 0.0, 1.0);
        float _5607 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5609 = _5601 + _5607;
        float _5611 = _5583 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5613 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5615 = precise::clamp(_5613, 0.0, 1.0);
        float _5617 = exp2(_5611);
        float _5619 = _5617 * _5615;
        float _5621 = _5605 * _5619;
        float _5623 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5625 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5627 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5623;
        out.m_104.y = _5625;
        out.m_104.z = _5627;
    }
    out.m_106.x = _5539;
    out.m_106.y = _5541;
    out.m_106.z = _5543;
    if (_5523)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_65.x = 0.0;
    float _5629 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5629;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5387 = false;
    bool _3976 = false;
    bool _583 = false;
    bool _439 = false;
    bool _249 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_58.w;
    float _122 = in.m_60.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = as_type<float>(_127);
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_65.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5697 = as_type<float>(_149);
        out.gl_Position.z = _5697;
    }
    if (!_135)
    {
        return out;
    }
    bool _151 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_122);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_127);
    bool _163 = _131 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _139;
    if (_167)
    {
        out.m_65.x = 0.0;
    }
    float _173 = _131 * _169;
    int _175 = 0;
    float _177 = _173;
    if (_167)
    {
        float _179 = _171 * 5.0;
        _175 = as_type<int>(_179);
    }
    int _181 = _175;
    out.m_63.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5760 = as_type<float>(_181);
        out.gl_Position.z = _5760;
    }
    if (_167)
    {
        return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    int _191 = as_type<int>(_183) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_183) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = _187 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _203 = _187 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _205 = _187 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].x, _203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].x, _205);
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].z, _209);
    float _221 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    bool _223 = !_197;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_199;
    float _229 = _217;
    float _247;
    if (!_227)
    {
        float _231 = in.m_72.x;
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _235 = _231 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _239 = _237 * _233;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _245;
        _249 = true;
    }
    else
    {
        _247 = _173;
    }
    _249 = false;
    float _251 = _247;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _251 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _251 + _257;
    bool _261 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_251);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _251 + _285;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _275;
    float _293 = 1.0 / _283;
    float _295 = 1.0 / _279;
    float _297 = _255 * _291;
    bool _299 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_251);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_271;
    float _313 = _311 + 1.0;
    bool _315 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_251);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _309 * _313;
    float _329 = _259 * _293;
    float _331 = -_309;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = _287 * _295;
    bool _341 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_251);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _353;
    float _357 = _325 * _333;
    float _359 = -_325;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = fma(_355, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = _351 * _361;
    float _375 = fma(_365, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = fma(_337, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_369, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -_351;
    float _383 = _381 + 1.0;
    float _385 = _371 * _373;
    float _387 = _375 * _373;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _395;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _401 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_377, _357, _393);
    float _405 = fma(_397, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _407 = fma(_379, _357, _399);
    float _409 = fma(_401, _327, _403);
    float _411 = fma(_405, _327, _407);
    float _413 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _409);
    float _415 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _411);
    bool _417 = !_289;
    float _419 = _413;
    float _437;
    if (!_417)
    {
        float _421 = in.m_72.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        _437 = _173;
    }
    _439 = false;
    float _441 = _437;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _441 + _443;
    float _447 = in.m_74.x;
    float _449 = in.m_74.y;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_441);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_441);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    bool _487 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_441);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _453;
    float _501 = -_465;
    float _503 = _501 + 1.0;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _507 = 1.0 / _469;
    float _509 = _485 * _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = _415 * _449;
    float _517 = _413 * _447;
    float _519 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _481 * _503;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    float _527 = -_481;
    float _529 = _527 + 1.0;
    float _531 = _513 * _507;
    float _533 = _519 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _441 + _535;
    float _539 = _465 * _525;
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _543 = fma(_531, _537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = fma(_543, _539, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _545);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _555;
    out.m_76.y = _557;
    out.m_76.z = _561;
    out.m_76.w = _559;
    bool _563 = !_505;
    float _581;
    if (!_563)
    {
        float _565 = in.m_72.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        _581 = _173;
    }
    _583 = false;
    float _585 = _581;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _589 = _585 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _595 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_585);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _611 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _613 = isnan(_585);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _623;
    bool _627 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _629 = isnan(_585);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _593;
    float _641 = -_605;
    float _643 = _641 + 1.0;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _647 = 1.0 / _609;
    float _649 = _625 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _655 = fma(_649, _589, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _657 = _621 * _643;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = -_621;
    float _665 = _663 + 1.0;
    float _667 = _653 * _647;
    float _669 = _655 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _585 + _671;
    float _675 = _605 * _661;
    float _677 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _669);
    float _679 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _681 = fma(_679, _675, _677);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[133].x, _681);
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _691;
    out.m_78.y = _693;
    out.m_78.z = _695;
    out.m_78.w = _697;
    bool _699 = !_645;
    if (!_699)
    {
        float _701 = in.m_72.x;
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _705 = _701 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _709 = _707 * _703;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _177 = _715;
    }
    float _717 = _177;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _721 = int(_719);
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = float(_721);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _731 = int(_729);
    float _733 = float(_725);
    float _735 = 1.0 / _727;
    float _737 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _739 = int(_737);
    float _741 = float(uint(_731));
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _745 = _743 != 0;
    float _747 = 1.0 / _733;
    float _749 = _735 * _131;
    float _751 = float(uint(_739));
    float _753 = 1.0 / _741;
    int _755 = ~_739;
    int _757 = _755 + 1;
    if (_745)
    {
        _419 = 1.0;
    }
    float _759 = _419;
    int _761 = 0;
    float _763 = _759;
    if (_745)
    {
        _761 = 0;
    }
    int _765 = _761;
    float _767 = _747 * _131;
    float _769 = trunc(_749);
    int _771 = int(_769);
    int _773 = 0;
    int _775 = _765;
    if (_745)
    {
        _773 = 0;
    }
    int _777 = _773;
    float _779 = 1.0 / _751;
    int _781 = as_type<int>(_753) + (-2);
    int _783 = ~_731;
    int _785 = _783 + 1;
    float _787 = trunc(_767);
    int _789 = int(_787);
    float _791 = float(uint(_771));
    int _793 = as_type<int>(_779) + (-2);
    float _795 = as_type<float>(_781) * _791;
    float _797 = _791;
    float _799 = _767;
    float _801 = _795;
    int _803 = _777;
    if (_745)
    {
        float _805 = in.m_72.x;
        float _807 = in.m_72.y;
        _797 = _805;
        _799 = _807;
    }
    float _809 = _797;
    float _811 = _799;
    float _813 = trunc(_795);
    float _815 = precise::max(_813, 0.0);
    uint _818 = uint(_815);
    float _820 = float(uint(_789));
    float _822 = as_type<float>(_793) * _820;
    float _824 = trunc(_822);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = _785 * int(_818);
    int _832 = _830 + _771;
    float _834 = float(uint(_832));
    float _836 = 0.0;
    float _838 = _834;
    float _840 = _809;
    float _842 = _811;
    if (_745)
    {
        _836 = _809;
    }
    float _844 = _836;
    float _846 = _844;
    if (_745)
    {
        _801 = _811;
    }
    float _848 = _801;
    float _850 = as_type<float>(_781) * _834;
    float _852 = _848;
    if (_745)
    {
        _838 = _844;
    }
    float _854 = _838;
    int _856 = _757 * int(_828);
    int _858 = _856 + _789;
    float _860 = trunc(_850);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = float(uint(_858));
    float _868 = as_type<float>(_793) * _866;
    float _870 = _866;
    float _872 = _868;
    float _874 = _854;
    if (_745)
    {
        _870 = 1.0;
    }
    float _876 = _870;
    float _878 = trunc(_868);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    float _884 = _876;
    if (_745)
    {
        _872 = _844;
    }
    float _886 = _872;
    float _888 = _886;
    if (!_745)
    {
        float _890 = in.m_72.x;
        float _892 = in.m_72.y;
        float _894 = in.m_72.z;
        float _896 = _890 * 3.1415927410125732421875;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _892 * 3.1415927410125732421875;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        _763 = 7.345489978790283203125;
        _840 = _890;
        _884 = 5.839270114898681640625;
        _888 = _894;
        _842 = _892;
        _874 = _906;
        _852 = _910;
        _775 = 1;
        _803 = 2;
        _846 = _892;
    }
    float _912 = _763;
    float _914 = _840;
    float _916 = _884;
    float _918 = _888;
    float _920 = _842;
    float _922 = _874;
    float _924 = _852;
    int _926 = _775;
    int _928 = _803;
    float _930 = _846;
    float _932 = _912 * _914;
    int _934 = int(_828) + int(_882);
    float _936 = _916 * _918;
    int _938 = ~_739;
    int _940 = _938 + 1;
    float _942 = floor(_932);
    int _944 = int(_818) + int(_864);
    float _946 = in.m_72.z;
    float _948 = in.m_72.w;
    float _950 = _169 * _131;
    int _952 = ~_731;
    int _954 = _952 + 1;
    float _956 = _920 * 2.0;
    float _958 = float(_739);
    float _960 = floor(_936);
    int _962 = _940 * _934;
    int _964 = _962 + _789;
    int _966 = _954 * _944;
    int _968 = _966 + _771;
    bool _970 = uint(_964) >= uint(_739);
    float _972 = -_942;
    float _974 = _932 + _972;
    bool _976 = uint(_968) >= uint(_731);
    float _978 = floor(_956);
    bool _980 = !_970;
    int _982 = _980 ? 0 : (-1);
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _986 = _984 != 0;
    bool _988 = !_976;
    int _990 = _988 ? 0 : (-1);
    float _992 = -_960;
    float _994 = _936 + _992;
    float _996 = _974 * _958;
    bool _998 = !_986;
    int _1000 = _998 ? 0 : 1;
    bool _1002 = _946 > 0.5;
    bool _1004 = _920 > 0.5;
    float _1006 = trunc(_996);
    int _1008 = int(_1006);
    int _1010 = ~_934;
    int _1012 = _1010 + _982;
    int _1014 = _1012 + 1;
    int _1016 = ~_944;
    int _1018 = _1016 + _990;
    int _1020 = _1018 + 1;
    float _1022 = float(_789);
    int _1024 = _739 * _1014;
    int _1026 = _1024 + _789;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1038 = _1036 != 0;
    int _1040 = _731 * _1020;
    int _1042 = _1040 + _771;
    float _1044 = -_225;
    int _1046 = _1002 ? as_type<int>(_1044) : as_type<int>(_225);
    float _1048 = -_215;
    int _1050 = _1004 ? as_type<int>(_1048) : as_type<int>(_215);
    bool _1052 = _1022 >= _958;
    bool _1054 = isnan(_1022);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(_958);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _958 * _950;
    bool _1066 = !_1038;
    float _1068 = _1066 ? _225 : as_type<float>(_1046);
    int _1070 = abs(_1000);
    float _1072 = trunc(_1062);
    int _1074 = int(_1072);
    bool _1076 = !_1034;
    float _1078 = _1076 ? _215 : as_type<float>(_1050);
    float _1080 = float(_731);
    int _1082 = _1008 * _1070;
    int _1084 = _1082 + _789;
    float _1086 = float(_771);
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1098 = _1096 != 0;
    float _1100 = _994 * _1080;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1104 = _1102 != 0;
    float _1106 = trunc(_1064);
    int _1108 = int(_1106);
    bool _1110 = _1086 >= _1080;
    bool _1112 = isnan(_1086);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(_1080);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1080 * _950;
    bool _1124 = !_1094;
    int _1126 = _1124 ? 0 : 1;
    bool _1128 = !_1090;
    int _1130 = _1128 ? 0 : 1;
    bool _1132 = !_1098;
    int _1134 = _1132 ? 0 : 1;
    float _1136 = trunc(_1120);
    int _1138 = int(_1136);
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1146 = _1144 != 0;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1150 = _1148 != 0;
    bool _1152 = !_1104;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1158 = _1156 != 0;
    bool _1160 = !_1142;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = trunc(_1100);
    int _1166 = int(_1164);
    bool _1168 = _739 == 0;
    int _1170 = ~_1074;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    bool _1176 = !_1168;
    int _1178 = _1176 ? _1026 : (-1);
    float _1180 = trunc(_1122);
    int _1182 = int(_1180);
    int _1184 = _739 + (-1);
    bool _1186 = !_1146;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = _1178 * _1174;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1194 = _1192 != 0;
    int _1196 = ~_1138;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    int _1202 = _1074 * _1184;
    int _1204 = _1202 + _1190;
    bool _1206 = !_1194;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = as_type<float>(_1190);
    float _1212 = as_type<float>(_928);
    if (_1158)
    {
        float _1214 = in.m_72.w;
        _1210 = _1214;
    }
    float _1216 = _1210;
    bool _1218 = _731 == 0;
    int _1220 = abs(_1126);
    bool _1222 = !_1218;
    int _1224 = _1222 ? _1042 : (-1);
    int _1226 = abs(_1208);
    int _1228 = _1204 * _1220;
    int _1230 = _731 + (-1);
    int _1232 = _1224 * _1200;
    int _1234 = abs(_1130);
    int _1236 = _1138 * _1230;
    int _1238 = _1236 + _1232;
    int _1240 = abs(_1188);
    int _1242 = _1108 * _1234;
    int _1244 = _1242 + _1228;
    int _1246 = abs(_1162);
    int _1248 = _1166 * _1226;
    int _1250 = _1248 + _771;
    int _1252 = abs(_1134);
    int _1254 = _1238 * _1240;
    float _1256 = _914 * 2.0;
    int _1258 = abs(_1154);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1262 = _1260 != 0;
    int _1264 = _1182 * _1246;
    int _1266 = _1264 + _1254;
    float _1268 = as_type<float>(_1254);
    bool _1270 = _1262;
    float _1272 = as_type<float>(_1246);
    if (_1158)
    {
        float _1274 = _1216 * 3.1415927410125732421875;
        _1268 = _1274;
    }
    float _1276 = _1268;
    bool _1278 = !_1150;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = floor(_1256);
    bool _1284 = !_1262;
    int _1286 = _1284 ? 0 : 1;
    int _1288 = _1084 * _1252;
    int _1290 = _1288 + _1244;
    int _1292 = abs(_1280);
    float _1294 = _1276;
    if (_1158)
    {
        float _1296 = _1276 * 0.15915493667125701904296875;
        _1294 = _1296;
    }
    float _1298 = _1294;
    int _1300 = abs(_1286);
    int _1302 = _1008 * _1258;
    int _1304 = _1302 + _1290;
    float _1306 = as_type<float>(_1008);
    if (_1158)
    {
        float _1308 = _1298 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = float(uint(_1304));
    int _1316 = _1250 * _1292;
    int _1318 = _1316 + _1266;
    float _1320 = 0.0;
    if (!_1158)
    {
        _1320 = _215;
    }
    float _1322 = _1320;
    bool _1324 = _739 == 0;
    int _1326 = _1166 * _1300;
    int _1328 = _1326 + _1318;
    float _1330 = as_type<float>(_793) * _1314;
    float _1332 = -_215;
    int _1334 = _1002 ? as_type<int>(_1332) : as_type<int>(_215);
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1338 = _1336 != 0;
    float _1340 = trunc(_1330);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    float _1346 = float(uint(_1328));
    float _1348 = _1322;
    if (_1158)
    {
        bool _1350 = _1312 > 0.5;
        _1270 = _1350;
    }
    bool _1352 = _1270;
    int _1354 = ~_739;
    int _1356 = _1354 + 1;
    float _1358 = as_type<float>(_781) * _1346;
    if (_1158)
    {
        float _1360 = -_215;
        float _1362 = _1352 ? _1360 : _215;
        _1348 = _1362;
    }
    float _1364 = _1348;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1368 = _1366 != 0;
    int _1370 = ~_731;
    int _1372 = _1370 + 1;
    float _1374 = trunc(_1358);
    float _1376 = precise::max(_1374, 0.0);
    uint _1378 = uint(_1376);
    bool _1380 = !_1338;
    float _1382 = _1380 ? _215 : as_type<float>(_1334);
    int _1384 = _1356 * int(_1344);
    int _1386 = _1384 + _1304;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1390 = float(uint(_1386));
    float _1392 = as_type<float>(_1240);
    if (_1368)
    {
        float _1394 = in.m_72.x;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = 0.0;
    if (!_1368)
    {
        _1398 = _225;
    }
    float _1400 = _1398;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1404 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1388);
    float _1406 = as_type<float>(_793) * _1390;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1410 = _1372 * int(_1378);
    int _1412 = _1410 + _1328;
    float _1414 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1402);
    float _1416 = trunc(_1406);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    float _1422 = _922 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1424 = _924 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1426 = float(uint(_1412));
    float _1428 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1404);
    int _1430 = ~_739;
    int _1432 = _1430 + 1;
    float _1434 = -_1408;
    float _1436 = fma(_1422, 2.0, _1434);
    float _1438 = as_type<float>(_781) * _1426;
    float _1440 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1414);
    float _1442 = trunc(_1438);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1454 = int(_1344) + int(_1420);
    float _1456 = as_type<float>(_1420);
    float _1458 = _1400;
    if (_1368)
    {
        float _1460 = _1396 * 3.1415927410125732421875;
        _1456 = _1460;
    }
    float _1462 = _1456;
    int _1464 = ~_731;
    int _1466 = _1464 + 1;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1470 = _1432 * _1454;
    int _1472 = _1470 + _1304;
    float _1474 = _1462;
    float _1476 = as_type<float>(_1466);
    if (_1368)
    {
        float _1478 = _1462 * 0.15915493667125701904296875;
        _1474 = _1478;
    }
    float _1480 = _1474;
    float _1482 = -_131;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1436);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1488 = uint(_1472) >= uint(_739);
    int _1490 = int(_1378) + int(_1446);
    float _1492 = _1480;
    if (_1368)
    {
        float _1494 = _1480 * 6.283185482025146484375;
        float _1496 = sin(_1494);
        _1492 = _1496;
    }
    float _1498 = _1492;
    float _1500 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1486);
    bool _1502 = !_1488;
    int _1504 = _1502 ? 0 : (-1);
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1510 = _1466 * _1490;
    int _1512 = _1510 + _1328;
    int _1514 = ~_1454;
    int _1516 = _1514 + _1504;
    int _1518 = _1516 + 1;
    float _1520 = -_225;
    int _1522 = _1004 ? as_type<int>(_1520) : as_type<int>(_225);
    float _1524 = 1.0 / _1508;
    bool _1526 = uint(_1512) >= uint(_731);
    int _1528 = _739 * _1518;
    int _1530 = _1528 + _1304;
    bool _1532 = !_1526;
    int _1534 = _1532 ? 0 : (-1);
    bool _1536 = _1526;
    float _1538 = 1.4012984643248170709237295832899e-45;
    if (_1368)
    {
        bool _1540 = _1498 > 0.5;
        _1536 = _1540;
    }
    bool _1542 = _1536;
    bool _1544 = !_1324;
    int _1546 = _1544 ? _1530 : (-1);
    if (_1368)
    {
        float _1548 = -_225;
        float _1550 = _1542 ? _1548 : _225;
        _1458 = _1550;
    }
    float _1552 = _1458;
    int _1554 = ~_1490;
    int _1556 = _1554 + _1534;
    int _1558 = _1556 + 1;
    int _1560 = _1546 & 3;
    bool _1562 = _1560 != 0;
    bool _1564 = _948 > 0.5;
    int _1566 = _731 * _1558;
    int _1568 = _1566 + _1328;
    bool _1570 = uint(_1560) > 1u;
    float _1572 = -_225;
    int _1574 = _1564 ? as_type<int>(_1572) : as_type<int>(_225);
    int _1576 = _1546 & 3;
    bool _1578 = _1576 != 0;
    bool _1580 = !_1218;
    int _1582 = _1580 ? _1568 : (-1);
    int _1584 = _1578 ? 0 : 1;
    int _1586 = _1582 & 3;
    bool _1588 = _1586 != 0;
    int _1590 = ~_1584;
    int _1592 = _1590 + 1;
    int _1594 = _1592 + 1;
    int _1596 = _1594;
    if (!_1570)
    {
        int _1598 = ~_1584;
        int _1600 = _1598 + 1;
        _1596 = _1600;
    }
    int _1602 = _1596;
    bool _1604 = uint(_1586) >= 2u;
    int _1606 = _1604 ? 0 : 1;
    bool _1608 = _1586 != 3;
    int _1610 = ~_1606;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    int _1616 = _1582 & 3;
    bool _1618 = _1616 != 0;
    int _1620 = int(_1608);
    int _1622 = _1618 ? 2 : 0;
    int _1624 = _1620 | _1622;
    int _1626 = _1588 ? 4 : 0;
    int _1628 = _1624 | _1626;
    int _1630 = _1030 ? 8 : 0;
    int _1632 = _1628 | _1630;
    int _1634 = _1562 ? 16 : 0;
    int _1636 = _1632 | _1634;
    int _1638 = _1218 ? 32 : 0;
    int _1640 = _1636 | _1638;
    int _1642 = _1324 ? 64 : 0;
    int _1644 = _1640 | _1642;
    int _1646 = _1644 & 4;
    int _1648 = _1618 ? 0 : 1;
    bool _1650 = uint(_1586) > 1u;
    int _1652 = ~_1648;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1614;
    int _1660 = _1656;
    if (_1608)
    {
        int _1662 = ~_1606;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    int _1668 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1670 = _1668 != 0;
    float _1672 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1674 = int(_1672);
    int _1676 = int(_1670);
    int _1678 = _1650 ? 2 : 0;
    int _1680 = _1676 | _1678;
    int _1682 = _1588 ? 4 : 0;
    int _1684 = _1680 | _1682;
    int _1686 = _1030 ? 8 : 0;
    int _1688 = _1684 | _1686;
    int _1690 = _1562 ? 16 : 0;
    int _1692 = _1688 | _1690;
    int _1694 = _1218 ? 32 : 0;
    int _1696 = _1692 | _1694;
    int _1698 = _1324 ? 64 : 0;
    int _1700 = _1696 | _1698;
    int _1702 = _1700 & 16;
    bool _1704 = !_1670;
    float _1706 = _1704 ? _225 : as_type<float>(_1522);
    if (!_1650)
    {
        int _1708 = ~_1648;
        int _1710 = _1708 + 1;
        _1660 = _1710;
    }
    int _1712 = _1660;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1716 = _1714 != 0;
    float _1718 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1720 = int(_1718);
    bool _1722 = !_1030;
    float _1724 = _1722 ? _225 : as_type<float>(_1574);
    bool _1726 = !_1716;
    int _1728 = _1726 ? 0 : 1;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1732 = _1730 != 0;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1736 = _1734 != 0;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1744 = _1742 != 0;
    int _1746 = abs(_1728);
    float _1748 = float(_1674);
    bool _1750 = !_1732;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = _914 > 0.5;
    float _1756 = 1.0 / _1748;
    float _1758 = float(uint(_1720));
    float _1760 = -_215;
    int _1762 = _1754 ? as_type<int>(_1760) : as_type<int>(_215);
    int _1764 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1766 = _1764 != 0;
    int _1768 = ~_1720;
    int _1770 = _1768 + 1;
    float _1772 = 1.0 / _1758;
    bool _1774 = !_1766;
    float _1776 = _1774 ? _215 : as_type<float>(_1762);
    bool _1778 = _926 != 1;
    bool _1780 = !_1736;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = abs(_1752);
    float _1786 = _1756 * _131;
    int _1788 = abs(_1782);
    int _1790 = ~_1720;
    int _1792 = _1790 + 1;
    float _1794 = trunc(_1786);
    int _1796 = int(_1794);
    bool _1798 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1800 = isnan(_717);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    int _1810 = as_type<int>(_1772) + (-2);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1814 = _1812 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1816 = _1772;
    if (!_1778)
    {
        _1538 = _920;
    }
    float _1818 = _1538;
    float _1820 = _1818;
    if (!_1778)
    {
        _1272 = _920;
    }
    float _1822 = _1272;
    float _1824 = _1822;
    if (!_1778)
    {
        _1816 = _946;
    }
    float _1826 = _1816;
    float _1828 = 1.0 / _1814;
    float _1830 = _1826;
    if (!_1778)
    {
        _1476 = _946;
    }
    float _1832 = _1476;
    float _1834 = _1832;
    if (_1778)
    {
        _1820 = _914;
    }
    float _1836 = _1820;
    if (_1778)
    {
        _1824 = _914;
    }
    float _1838 = _1824;
    float _1840 = float(uint(_1796));
    float _1842 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1778)
    {
        _1830 = _920;
    }
    float _1844 = _1830;
    float _1846 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1468);
    if (_1778)
    {
        _1834 = _920;
    }
    float _1848 = _1834;
    float _1850 = as_type<float>(_1810) * _1840;
    bool _1852 = _928 != 2;
    float _1854 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1856 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1858 = isnan(_717);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = trunc(_1850);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    float _1874 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1876 = _1850;
    if (_1852)
    {
        _1212 = _914;
    }
    float _1878 = _1212;
    float _1880 = _1878;
    if (_1852)
    {
        _1876 = _920;
    }
    float _1882 = _1876;
    float _1884 = _1882;
    if (!_1852)
    {
        _1880 = _946;
    }
    float _1886 = _1880;
    int _1888 = _1770 * int(_1872);
    int _1890 = _1888 + _1796;
    if (!_1852)
    {
        _1884 = _914;
    }
    float _1892 = _1884;
    bool _1894 = _1282 >= 0.0;
    bool _1896 = isnan(_1282);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.0);
    bool _1902 = _1898 || _1900;
    float _1904 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1906 = float(uint(_1890));
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1910 = _1902 ? 0 : 1;
    bool _1912 = _1282 > 0.0;
    float _1914 = as_type<float>(_1810) * _1906;
    int _1916 = ~_1910;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = _946 * 2.0;
    float _1924 = _912 * _930;
    float _1926 = trunc(_1914);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    bool _1932 = !_1744;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = fma(_1908, -2.0, _1452);
    bool _1938 = _1646 != 0;
    bool _1940 = !_1740;
    int _1942 = _1940 ? 0 : 1;
    float _1944 = floor(_1922);
    int _1946 = _1920;
    if (!_1912)
    {
        int _1948 = ~_1910;
        int _1950 = _1948 + 1;
        _1946 = _1950;
    }
    int _1952 = _1946;
    bool _1954 = _978 >= 0.0;
    bool _1956 = isnan(_978);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1968 = !_1938;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1962 ? 0 : 1;
    float _1974 = floor(_1924);
    bool _1976 = _978 > 0.0;
    int _1978 = ~_1720;
    int _1980 = _1978 + 1;
    int _1982 = int(_1872) + int(_1930);
    int _1984 = ~_1972;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    float _1990 = 1.0 / _1966;
    float _1992 = float(_1720);
    int _1994 = _1980 * _1982;
    int _1996 = _1994 + _1796;
    float _1998 = float(_1952);
    int _2000 = _1988;
    if (!_1976)
    {
        int _2002 = ~_1972;
        int _2004 = _2002 + 1;
        _2000 = _2004;
    }
    int _2006 = _2000;
    bool _2008 = uint(_1996) >= uint(_1720);
    float _2010 = -_1974;
    float _2012 = _1924 + _2010;
    float _2014 = float(_1796);
    float _2016 = _1992 * _950;
    bool _2018 = !_2008;
    int _2020 = _2018 ? 0 : (-1);
    bool _2022 = _2014 >= _1992;
    bool _2024 = isnan(_2014);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(_1992);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2036 = _2034 != 0;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2040 = _2038 != 0;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2044 = _2042 != 0;
    float _2046 = _2012 * _1992;
    int _2048 = ~_1982;
    int _2050 = _2048 + _2020;
    int _2052 = _2050 + 1;
    float _2054 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2056 = trunc(_2032);
    int _2058 = int(_2056);
    float _2060 = float(uint(_1084));
    float _2062 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1846);
    bool _2064 = _1944 >= 0.0;
    bool _2066 = isnan(_1944);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan(0.0);
    bool _2072 = _2068 || _2070;
    int _2074 = _1720 * _2052;
    int _2076 = _2074 + _1796;
    bool _2078 = _1944 > 0.0;
    float _2080 = as_type<float>(_793) * _2060;
    int _2082 = _2072 ? 0 : 1;
    float _2084 = trunc(_2046);
    int _2086 = int(_2084);
    bool _2088 = _1720 == 0;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2096 = _2094 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2098 = !_2088;
    int _2100 = _2098 ? _2076 : (-1);
    float _2102 = _2092 * _1524;
    int _2104 = ~_2082;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = trunc(_2080);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    int _2116 = ~_2058;
    int _2118 = _2116 + 1;
    int _2120 = _2118 + 1;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2124 = _2108;
    if (!_2078)
    {
        int _2126 = ~_2082;
        int _2128 = _2126 + 1;
        _2124 = _2128;
    }
    int _2130 = _2124;
    float _2132 = -_2062;
    float _2134 = _2132 + 1.0;
    int _2136 = ~_739;
    int _2138 = _2136 + 1;
    int _2140 = _2100 * _2120;
    float _2142 = -_2122;
    float _2144 = fma(_2054, 2.0, _2142);
    int _2146 = _1720 + (-1);
    float _2148 = trunc(_2016);
    int _2150 = int(_2148);
    float _2152 = float(uint(_1250));
    float _2154 = -_131;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2144);
    bool _2158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2160 = isnan(0.0);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2166 = _2162 || _2164;
    int _2168 = _2058 * _2146;
    int _2170 = _2168 + _2140;
    float _2172 = as_type<float>(_781) * _2152;
    int _2174 = _2138 * int(_2114);
    int _2176 = _2174 + _1084;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2180 = _2178 != 0;
    int _2182 = _2170 * _1788;
    bool _2184 = !_2040;
    int _2186 = _2184 ? 0 : 1;
    int _2188 = _2086 * _1746;
    int _2190 = _2188 + _1796;
    float _2192 = trunc(_2172);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = float(uint(_2176));
    int _2200 = ~_731;
    int _2202 = _2200 + 1;
    int _2204 = _2150 * _1784;
    int _2206 = _2204 + _2182;
    float _2208 = as_type<float>(_793) * _2198;
    int _2210 = abs(_1942);
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2214 = abs(_1934);
    float _2216 = float(uint(_2190));
    int _2218 = _2190 * _2210;
    int _2220 = _2218 + _2206;
    int _2222 = _2202 * int(_2196);
    int _2224 = _2222 + _1250;
    float _2226 = _920 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2228 = _2086 * _2214;
    int _2230 = _2228 + _2220;
    float _2232 = as_type<float>(_1810) * _2216;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2236 = fma(_2226, -2.0, _2212);
    int _2238 = ~_1720;
    int _2240 = _2238 + 1;
    float _2242 = trunc(_2232);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = float(uint(_2224));
    float _2250 = fma(_1424, -2.0, _2234);
    float _2252 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2236);
    float _2254 = float(uint(_2230));
    float _2256 = as_type<float>(_781) * _2248;
    int _2258 = ~_739;
    int _2260 = _2258 + 1;
    float _2262 = trunc(_2208);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2250);
    float _2270 = as_type<float>(_1810) * _2254;
    float _2272 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1874);
    float _2274 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2276 = _1702 != 0;
    bool _2278 = !_2036;
    int _2280 = _2278 ? 0 : 1;
    float _2282 = trunc(_2270);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    int _2288 = _2240 * int(_2246);
    int _2290 = _2288 + _2190;
    int _2292 = abs(_2186);
    float _2294 = -_2272;
    float _2296 = _2294 + 1.0;
    bool _2298 = !_2044;
    int _2300 = _2298 ? 0 : 1;
    float _2302 = float(uint(_2290));
    int _2304 = int(_2114) + int(_2266);
    float _2306 = trunc(_2256);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    float _2312 = as_type<float>(_1810) * _2302;
    float _2314 = float(_2006);
    bool _2316 = _731 == 0;
    int _2318 = _2260 * _2304;
    int _2320 = _2318 + _1084;
    int _2322 = _1792 * int(_2286);
    int _2324 = _2322 + _2230;
    float _2326 = trunc(_2312);
    float _2328 = precise::max(_2326, 0.0);
    uint _2330 = uint(_2328);
    bool _2332 = uint(_2320) >= uint(_739);
    float _2334 = float(uint(_2324));
    int _2336 = int(_2196) + int(_2310);
    float _2338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2340 = log2(_2338);
    float _2342 = as_type<float>(_1810) * _2334;
    int _2344 = ~_731;
    int _2346 = _2344 + 1;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2350 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2352 = !_2332;
    int _2354 = _2352 ? 0 : (-1);
    int _2356 = int(_2246) + int(_2330);
    float _2358 = trunc(_2342);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    int _2364 = _2346 * _2336;
    int _2366 = _2364 + _1250;
    int _2368 = ~_1720;
    int _2370 = _2368 + 1;
    float _2372 = fma(_2350, -2.0, _1448);
    int _2374 = ~_1720;
    int _2376 = _2374 + 1;
    float _2378 = -_2348;
    float _2380 = fma(_1842, 2.0, _2378);
    bool _2382 = uint(_2366) >= uint(_731);
    int _2384 = _2370 * _2356;
    int _2386 = _2384 + _2190;
    float _2388 = _2340 * _131;
    float _2390 = -_131;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2380);
    bool _2394 = !_2382;
    int _2396 = _2394 ? 0 : (-1);
    float _2398 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2372);
    bool _2400 = uint(_2386) >= uint(_1720);
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    int _2406 = int(_2286) + int(_2362);
    float _2408 = -_2402;
    float _2410 = fma(_1904, 2.0, _2408);
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2414 = _2412 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2416 = !_2400;
    int _2418 = _2416 ? 0 : (-1);
    int _2420 = _2376 * _2406;
    int _2422 = _2420 + _2230;
    float _2424 = _1854 * _2404;
    float _2426 = exp2(_2388);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2430 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2432 = isnan(_717);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    bool _2442 = uint(_2422) >= uint(_1720);
    float _2444 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2428);
    float _2446 = 1.0 / _2414;
    float _2448 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2444);
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2452 = !_2442;
    int _2454 = _2452 ? 0 : (-1);
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2458 = 1.0 + _2456;
    float _2460 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2450);
    float _2462 = -_2426;
    float _2464 = _2462 + 1.0;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2468 = 1.0 / _2458;
    bool _2470 = _1586 != 3;
    float _2472 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2474 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2466);
    float _2476 = _2166 ? _2464 : 0.0;
    float _2478 = in.m_58.x;
    float _2480 = in.m_58.y;
    float _2482 = in.m_58.z;
    bool _2484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2486 = isnan(1.0);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1500);
    float _2496 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2474);
    float _2498 = -_131;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2410);
    float _2502 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1936);
    bool _2504 = !_2470;
    int _2506 = _2504 ? 0 : (-1);
    float _2508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    int _2510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2512 = _2510 != 0;
    float _2514 = _2274 * _2508;
    bool _2516 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2518 = isnan(_717);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    if (_2492)
    {
        float _2528 = _2476 * _2468;
        _141 = _2528;
    }
    float _2530 = _141;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2534 = _2532 != 0;
    float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2540 = -_2526;
    float _2542 = _2540 + 1.0;
    float _2544 = -_1866;
    float _2546 = _2544 + 1.0;
    int _2548 = ~_2304;
    int _2550 = _2548 + _2354;
    int _2552 = _2550 + 1;
    float _2554 = 1.0 / _2538;
    float _2556 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2558 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2560 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2570 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2556);
    float _2572 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2558);
    float _2574 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2560);
    float _2576 = _2564 * _2446;
    float _2578 = 1.0 / _2568;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2584 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2572);
    bool _2586 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2588 = isnan(_717);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = _2582 * _1990;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2604 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2606 = isnan(_717);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    float _2616 = -_2596;
    float _2618 = _2616 + 1.0;
    bool _2620 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2622 = isnan(_717);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2628 = _2624 || _2626;
    float _2630 = float(_2628);
    float _2632 = _2584 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2634 = 1.0 / _2602;
    float _2636 = _2630 * _2618;
    float _2638 = _2096 * _2578;
    float _2640 = -_2630;
    float _2642 = _2640 + 1.0;
    float _2644 = _2614 * _2642;
    float _2646 = -_2614;
    float _2648 = _2646 + 1.0;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2650;
    float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2656 = _2654 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2660 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2658;
    float _2662 = _2526 * _2648;
    float _2664 = _1808 * _2542;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2668 = _717 + _2666;
    float _2670 = _2652 * _2634;
    float _2672 = -_1808;
    float _2674 = _2672 + 1.0;
    bool _2676 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2678 = isnan(_717);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = fma(_2576, _2668, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2690 = _2660 * _2554;
    float _2692 = _2440 * _2674;
    float _2694 = -_2440;
    float _2696 = _2694 + 1.0;
    float _2698 = _2656 * _1828;
    float _2700 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2574);
    float _2702 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2704 = _717 + _2702;
    float _2706 = _1866 * _2696;
    float _2708 = _2686 * _2546;
    float _2710 = -_2686;
    float _2712 = _2710 + 1.0;
    float _2714 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2570);
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2718 = _717 + _2716;
    float _2720 = _2688 * _2708;
    float _2722 = fma(_2598, _2704, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2726 = _717 + _2724;
    float _2728 = fma(_2102, _2718, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2730 = fma(_2712, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2720);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2734 = _717 + _2732;
    float _2736 = fma(_2722, _2706, _2730);
    float _2738 = fma(_2638, _2734, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2740 = fma(_2670, _2726, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2742 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2744 = _717 + _2742;
    float _2746 = fma(_2728, _2692, _2736);
    float _2748 = _920 + _914;
    float _2750 = in.m_80.x;
    float _2752 = in.m_80.y;
    float _2754 = in.m_80.z;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2758 = _717 + _2756;
    float _2760 = fma(_2698, _2744, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2762 = _2748 + (-1.0);
    float _2764 = fma(_2738, _2664, _2746);
    int _2766 = abs(_2280);
    float _2768 = _914 + (-0.5);
    float _2770 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2772 = float(_2130);
    float _2774 = fma(_2740, _2662, _2764);
    float _2776 = float(_2766);
    float _2778 = _1364 + 0.5;
    float _2780 = _914 + _946;
    float _2782 = fma(_2760, _2644, _2774);
    int _2784 = abs(_2300);
    float _2786 = _2776 * _2772;
    float _2788 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1484);
    float _2790 = _920 + _946;
    float _2792 = fma(_2690, _2758, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2794 = _2786 * (-2.0);
    float _2796 = _2790 + (-1.0);
    float _2798 = fma(_2794, _2750, _2750);
    float _2800 = float(_2292);
    float _2802 = fma(_2770, _2794, _2770);
    float _2804 = _920 + (-0.5);
    float _2806 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2798);
    float _2808 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2810 = _2800 * _1998;
    float _2812 = fma(_2802, _2530, _2806);
    float _2814 = _1776 + 0.5;
    float _2816 = _2810 * (-2.0);
    float _2818 = float(_2784);
    float _2820 = _1552 + (-0.5);
    float _2822 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2156);
    float _2824 = _2812 * 0.15915493667125701904296875;
    float _2826 = fma(_2816, _2752, _2752);
    float _2828 = _2818 * _2314;
    float _2830 = -_1428;
    float _2832 = _2830 + 1.0;
    float _2834 = -_2820;
    float _2836 = -_2268;
    float _2838 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2836);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2842 = -_1440;
    float _2844 = _2842 + 1.0;
    float _2846 = fma(_2808, _2816, _2808);
    float _2848 = fma(_2804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2826);
    float _2850 = _2780 + (-1.0);
    float _2852 = _2828 * (-2.0);
    float _2854 = -_2832;
    float _2856 = fma(_2854, _1364, _2788);
    float _2858 = fma(_2844, _1552, _2838);
    float _2860 = fma(_2846, _2530, _2848);
    float _2862 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2866 = fma(_2852, _2754, _2754);
    float _2868 = _946 + (-0.5);
    float _2870 = _2860 * 0.15915493667125701904296875;
    float _2872 = fma(_2862, _2852, _2862);
    float _2874 = _1382 + 0.5;
    float _2876 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2866);
    float _2878 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_82.x = _2856;
    out.m_82.y = _2858;
    float _2880 = _2824 * 6.283185482025146484375;
    float _2882 = sin(_2880);
    float _2884 = fma(_2872, _2530, _2876);
    float _2886 = fma(_2878, _2874, _2392);
    float _2888 = _1706 + (-0.5);
    int _2890 = ~_2336;
    int _2892 = _2890 + _2396;
    int _2894 = _2892 + 1;
    float _2896 = _2884 * 0.15915493667125701904296875;
    int _2898 = _1582 >> 31;
    float _2900 = _2864 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2902 = _2824 * 6.283185482025146484375;
    float _2904 = cos(_2902);
    float _2906 = -_2448;
    float _2908 = _2906 + 1.0;
    float _2910 = _1724 + (-0.5);
    float _2912 = -_2888;
    float _2914 = -_2252;
    float _2916 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2914);
    float _2918 = -_2134;
    float _2920 = fma(_1382, _2918, _2886);
    int _2922 = ~_2356;
    int _2924 = _2922 + _2418;
    int _2926 = _2924 + 1;
    float _2928 = -_2900;
    float _2930 = -_2398;
    float _2932 = fma(_2928, _2910, _2930);
    float _2934 = -_2472;
    float _2936 = _2934 + 1.0;
    float _2938 = _2870 * 6.283185482025146484375;
    float _2940 = sin(_2938);
    int _2942 = _2898 & 3;
    float _2944 = fma(_1706, _2908, _2916);
    float _2946 = -_2936;
    float _2948 = fma(_1776, _2946, _2822);
    float _2950 = fma(_1724, _2296, _2932);
    int _2952 = _1582 + _2942;
    int _2954 = _739 * _2552;
    int _2956 = _2954 + _1084;
    float _2958 = fma(_2792, _2636, _2782);
    float _2960 = _2870 * 6.283185482025146484375;
    float _2962 = cos(_2960);
    out.m_84.x = _2948;
    out.m_84.y = _2944;
    out.m_84.z = _2920;
    out.m_84.w = _2950;
    int _2964 = _731 * _2894;
    int _2966 = _2964 + _1250;
    float _2968 = fma(_2596, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2958);
    int _2970 = _1720 * _2926;
    int _2972 = _2970 + _2190;
    bool _2974 = !_2316;
    int _2976 = _2974 ? _2966 : (-1);
    float _2978 = _2896 * 6.283185482025146484375;
    float _2980 = cos(_2978);
    float _2982 = _2882 * _2940;
    float _2984 = _2904 * _2940;
    out.m_86.x = _2968;
    int _2986 = _2952 >> 2;
    float _2988 = _2896 * 6.283185482025146484375;
    float _2990 = sin(_2988);
    float _2992 = _2882 * _2962;
    int _2994 = _2986 << 4;
    int _2996 = _2994 + 656;
    float _2998 = _2882 * _2980;
    float _3000 = _2904 * _2962;
    float _3002 = _2904 * _2980;
    float _3004 = _2962 * _2980;
    float _3006 = _2998 * _2514;
    float _3008 = _2940 * _2980;
    float _3010 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3012 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3014 = -_2984;
    float _3016 = fma(_2990, _2992, _3014);
    float _3018 = -_2992;
    float _3020 = fma(_2990, _2984, _3018);
    float _3022 = fma(_2990, _3000, _2982);
    float _3024 = fma(_2990, _2982, _3000);
    float _3026 = -_2514;
    float _3028 = _2990 * _3026;
    float _3030 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _3032 = uint(int(uint(_2996) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c9)._m0[int(_3042)][_3044];
    float _3048 = _3002 * _2514;
    float _3050 = fma(_3004, _2424, _3028);
    float _3052 = -_2990;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3030);
    float _3056 = fma(_3016, _2424, _3006);
    float _3058 = fma(_3022, _2424, _3048);
    float _3060 = -_2990;
    float _3062 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3010);
    float _3064 = -_2990;
    float _3066 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3012);
    float _3068 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3070 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3054);
    float _3072 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3062);
    float _3074 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3066);
    float _3076 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3080 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3068);
    float _3082 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3084 = _2996 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    float _3102 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3076);
    float _3104 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3078);
    float _3106 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3108 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3110 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3112 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3082);
    float _3114 = fma(_3008, _3106, _3050);
    float _3116 = fma(_3020, _3106, _3058);
    float _3118 = fma(_3024, _3106, _3056);
    float _3120 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3104);
    float _3122 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3108);
    float _3124 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3080);
    float _3126 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3110);
    float _3128 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3130 = abs(_1712);
    float _3132 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3134 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3126);
    int _3136 = abs(_1970);
    float _3138 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3102);
    int _3140 = ~_3130;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    float _3146 = _3128 * _3072;
    int _3148 = ~_3136;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3112);
    float _3156 = _3128 * _3070;
    out.m_88.x = _3138;
    out.m_88.y = _3120;
    out.m_88.z = _3124;
    float _3158 = fma(_3132, _3120, _3146);
    int _3160 = abs(_2506);
    float _3162 = fma(_3132, _3138, _3156);
    float _3164 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3122);
    float _3166 = _3128 * _3074;
    int _3168 = _3144 * as_type<int>(_3046);
    int _3170 = ~_2406;
    int _3172 = _3170 + _2454;
    int _3174 = _3172 + 1;
    float _3176 = fma(_3132, _3124, _3166);
    float _3178 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3180 = int(_3178);
    int _3182 = _3152 * as_type<int>(_3038);
    int _3184 = _3182 + _3168;
    int _3186 = abs(_1666);
    float _3188 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3190 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3192 = _1720 * _3174;
    int _3194 = _3192 + _2230;
    int _3196 = ~_3186;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    float _3202 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3188);
    float _3204 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3190);
    int _3206 = ~_3160;
    int _3208 = _3206 + 1;
    int _3210 = _3208 + 1;
    float _3212 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3214 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3202);
    bool _3216 = !_2088;
    float _3218 = _3216 ? as_type<float>(_3194) : as_type<float>(0xffffffffu /* nan */);
    int _3220 = _3200 * as_type<int>(_3092);
    int _3222 = _3220 + _3184;
    float _3224 = _2714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _3226 = _1546 >> 31;
    float _3228 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3212);
    int _3230 = _3210 * as_type<int>(_3100);
    int _3232 = _3230 + _3222;
    float _3234 = _3214 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3236 = as_type<int>(_3218) >> 31;
    float _3238 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3228);
    int _3240 = _3226 & 3;
    float _3242 = _3224 + _3234;
    bool _3244 = !_2180;
    int _3246 = _3244 ? 0 : 1;
    float _3248 = _3238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3250 = _1546 + _3240;
    float _3252 = _2700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _3254 = abs(_3246);
    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3258 = _3242 + _3256;
    int _3260 = _3236 & 3;
    float _3262 = _3252 + _3248;
    int _3264 = abs(_3180);
    float _3266 = _3258 * _3258;
    int _3268 = as_type<int>(_3218) + _3260;
    float _3270 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3272 = _3262 + _3270;
    bool _3274 = uint(_1560) >= 2u;
    float _3276 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3204);
    int _3278 = _3268 >> 2;
    float _3280 = _3272 * _3272;
    float _3282 = float(uint(_3180));
    float _3284 = _3276 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3286 = _3278 << 4;
    int _3288 = _3286 + 800;
    float _3290 = _3266 + _3280;
    float _3292 = float(uint(_3264));
    float _3294 = 1.0 / _3282;
    uint _3296 = uint(int(uint(_3288) >> uint(2)));
    uint _3298 = uint(int(uint(int(_3296)) >> uint(2)));
    int _3300 = int(_3296) & 3;
    float _3302 = (*spvDescriptorSet0.vp_c9)._m0[int(_3298)][_3300];
    int _3304 = int(_3296) + 1;
    uint _3306 = uint(int(uint(_3304) >> uint(2)));
    int _3308 = _3304 & 3;
    float _3310 = (*spvDescriptorSet0.vp_c9)._m0[int(_3306)][_3308];
    int _3312 = _3274 ? 0 : 1;
    float _3314 = _2632 + _3284;
    bool _3316 = _1560 != 3;
    int _3318 = ~_3254;
    int _3320 = _3318 + 1;
    int _3322 = _3320 + 1;
    float _3324 = 1.0 / _3292;
    int _3326 = ~_3312;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    int _3332 = _3232 * _3322;
    int _3334 = _3250 >> 2;
    int _3336 = as_type<int>(_3218) & 3;
    bool _3338 = _3336 != 0;
    int _3340 = _2976 * _3254;
    int _3342 = _3340 + _3332;
    float _3344 = sqrt(_3290);
    int _3346 = _3330;
    float _3348 = _3284;
    float _3350 = _3242;
    float _3352 = _3218;
    float _3354 = _3262;
    if (_3316)
    {
        int _3356 = ~_3312;
        int _3358 = _3356 + 1;
        _3346 = _3358;
    }
    int _3360 = _3346;
    int _3362 = _3334 << 4;
    int _3364 = _3362 + 368;
    int _3366 = abs(_3342);
    int _3368 = as_type<int>(_3294) + (-2);
    uint _3370 = uint(int(uint(_3364) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    float _3386 = float(uint(_3342));
    int _3388 = as_type<int>(_3324) + (-2);
    float _3390 = float(uint(_3366));
    int _3392 = _3338 ? 0 : 1;
    int _3394 = _3364 + 8;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c9)._m0[int(_3406)][_3408];
    bool _3412 = _3344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3414 = as_type<float>(_3388) * _3390;
    bool _3416 = !_2276;
    int _3418 = _3416 ? 0 : 1;
    bool _3420 = _1560 != 3;
    int _3422 = ~_3180;
    int _3424 = _3422 + 1;
    float _3426 = as_type<float>(_3368) * _3386;
    float _3428 = trunc(_3414);
    float _3430 = precise::max(_3428, 0.0);
    uint _3432 = uint(_3430);
    int _3434 = as_type<int>(_3218) & 3;
    bool _3436 = _3434 != 0;
    int _3438 = ~_3264;
    int _3440 = _3438 + 1;
    float _3442 = _3294;
    if (!_3412)
    {
        _3348 = _3242;
    }
    float _3444 = _3348;
    float _3446 = _3444;
    if (!_3412)
    {
        _3350 = _3262;
    }
    float _3448 = _3350;
    float _3450 = trunc(_3426);
    float _3452 = precise::max(_3450, 0.0);
    uint _3454 = uint(_3452);
    float _3456 = _3448;
    if (!_3412)
    {
        _3352 = _3280;
    }
    float _3458 = _3352;
    float _3460 = _3458;
    if (!_3412)
    {
        _3442 = _3266;
    }
    float _3462 = _3442;
    float _3464 = _3462;
    if (!_3412)
    {
        _3354 = _3314;
    }
    float _3466 = _3354;
    int _3468 = ~_3392;
    int _3470 = _3468 + 1;
    int _3472 = _3470 + 1;
    bool _3474 = uint(_3434) > 1u;
    bool _3476 = !_3412;
    float _3478 = _3466;
    int _3480 = _3472;
    if (!_3476)
    {
        float _3482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3486 = _3344 + _3484;
        float _3488 = rsqrt(_3290);
        float _3490 = _3486 * _3482;
        float _3492 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3494 = _3490 * 0.15915493667125701904296875;
        float _3496 = _3494 * 6.283185482025146484375;
        float _3498 = sin(_3496);
        float _3500 = _3494 * 6.283185482025146484375;
        float _3502 = cos(_3500);
        float _3504 = fma(_3498, _3492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3506 = _3488 * _3504;
        float _3508 = _3502 + (-1.0);
        float _3510 = fma(_3258, _3506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3512 = fma(_3272, _3506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3514 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3518 = _3510 + _3516;
        float _3520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3522 = _3512 + _3520;
        float _3524 = fma(_3314, _3502, _3514);
        float _3526 = _3518 * _3518;
        float _3528 = _3522 * _3522;
        _3478 = _3524;
        _3464 = _3526;
        _3460 = _3528;
        _3446 = _3510;
        _3456 = _3512;
    }
    float _3530 = _3478;
    float _3532 = _3464;
    float _3534 = _3460;
    float _3536 = _3446;
    float _3538 = _3456;
    int _3540 = _3288 + 8;
    uint _3542 = uint(int(uint(_3540) >> uint(2)));
    uint _3544 = uint(int(uint(int(_3542)) >> uint(2)));
    int _3546 = int(_3542) & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    int _3550 = int(_3542) + 1;
    uint _3552 = uint(int(uint(_3550) >> uint(2)));
    int _3554 = _3550 & 3;
    float _3556 = (*spvDescriptorSet0.vp_c9)._m0[int(_3552)][_3554];
    if (!_3474)
    {
        int _3558 = ~_3392;
        int _3560 = _3558 + 1;
        _3480 = _3560;
    }
    int _3562 = _3480;
    float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3566 = _3530 + _3564;
    int _3568 = _3440 * int(_3432);
    int _3570 = _3568 + _3366;
    int _3572 = abs(_1602);
    float _3574 = fma(_3566, _3566, _3532);
    bool _3576 = !_3436;
    int _3578 = _3576 ? 0 : 1;
    int _3580 = _3424 * int(_3454);
    int _3582 = _3580 + _3342;
    float _3584 = float(uint(_3570));
    float _3586 = -_2494;
    float _3588 = _3586 + 1.0;
    bool _3590 = _3434 != 3;
    float _3592 = -_2496;
    float _3594 = _3592 + 1.0;
    float _3596 = float(uint(_3582));
    float _3598 = as_type<float>(_3388) * _3584;
    int _3600 = ~_3572;
    int _3602 = _3600 + 1;
    int _3604 = _3602 + 1;
    bool _3606 = uint(_3434) >= 2u;
    float _3608 = as_type<float>(_3368) * _3596;
    int _3610 = abs(_3562);
    float _3612 = trunc(_3598);
    float _3614 = precise::max(_3612, 0.0);
    uint _3616 = uint(_3614);
    int _3618 = abs(_3418);
    int _3620 = _3604 * as_type<int>(_3384);
    int _3622 = abs(_3360);
    int _3624 = ~_3610;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    int _3630 = abs(_3578);
    float _3632 = trunc(_3608);
    float _3634 = precise::max(_3632, 0.0);
    uint _3636 = uint(_3634);
    int _3638 = _3606 ? 0 : 1;
    int _3640 = _3628 * as_type<int>(_3310);
    int _3642 = ~_3618;
    int _3644 = _3642 + 1;
    int _3646 = _3644 + 1;
    float _3648 = _3574 + _3534;
    int _3650 = ~_3630;
    int _3652 = _3650 + 1;
    int _3654 = _3652 + 1;
    int _3656 = _3646 * as_type<int>(_3376);
    int _3658 = _3656 + _3620;
    int _3660 = ~_3638;
    int _3662 = _3660 + 1;
    int _3664 = _3662 + 1;
    bool _3666 = _3434 != 3;
    int _3668 = _3654 * as_type<int>(_3302);
    int _3670 = _3668 + _3640;
    int _3672 = _3664;
    float _3674 = _3648;
    if (_3590)
    {
        int _3676 = ~_3638;
        int _3678 = _3676 + 1;
        _3672 = _3678;
    }
    int _3680 = _3672;
    int _3682 = int(_3432) + int(_3616);
    int _3684 = ~_3264;
    int _3686 = _3684 + 1;
    int _3688 = ~_3622;
    int _3690 = _3688 + 1;
    int _3692 = _3690 + 1;
    int _3694 = abs(_3680);
    int _3696 = _3686 * _3682;
    int _3698 = _3696 + _3366;
    bool _3700 = !_3666;
    int _3702 = _3700 ? 0 : (-1);
    int _3704 = _3692 * as_type<int>(_3402);
    int _3706 = _3704 + _3658;
    bool _3708 = !_3420;
    int _3710 = _3708 ? 0 : (-1);
    float _3712 = fma(_3128, _3128, 1.0);
    int _3714 = ~_3694;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    int _3720 = abs(_3702);
    int _3722 = ~_3180;
    int _3724 = _3722 + 1;
    int _3726 = _3718 * as_type<int>(_3548);
    int _3728 = _3726 + _3670;
    int _3730 = int(_3454) + int(_3636);
    float _3732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3734 = uint(_3698) >= uint(_3264);
    int _3736 = abs(_3710);
    int _3738 = _3724 * _3730;
    int _3740 = _3738 + _3342;
    int _3742 = ~_3720;
    int _3744 = _3742 + 1;
    int _3746 = _3744 + 1;
    int _3748 = ~_3736;
    int _3750 = _3748 + 1;
    int _3752 = _3750 + 1;
    float _3754 = rsqrt(_3712);
    bool _3756 = uint(_3740) >= uint(_3180);
    int _3758 = _3746 * as_type<int>(_3556);
    int _3760 = _3758 + _3728;
    int _3762 = _3342 ^ _3180;
    int _3764 = _3752 * as_type<int>(_3410);
    int _3766 = _3764 + _3706;
    bool _3768 = !_3734;
    int _3770 = _3768 ? 0 : (-1);
    uint _3772 = uint(int(uint(_3762) >> uint(31)));
    float _3774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3776 = !_3756;
    int _3778 = _3776 ? 0 : (-1);
    bool _3780 = !_2534;
    int _3782 = _3780 ? 0 : 1;
    int _3784 = ~_3770;
    int _3786 = _3682 + _3784;
    int _3788 = _3786 + 1;
    int _3790 = ~int(_3772);
    int _3792 = _3790 + 1;
    int _3794 = ~_3730;
    int _3796 = _3794 + _3778;
    int _3798 = _3796 + 1;
    int _3800 = abs(_3782);
    bool _3802 = !_2512;
    int _3804 = _3802 ? 0 : 1;
    int _3806 = _3180 * _3798;
    int _3808 = _3806 + _3342;
    int _3810 = _3788 ^ _3792;
    int _3812 = ~_3800;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    int _3818 = abs(_3804);
    bool _3820 = _3180 == 0;
    int _3822 = _3766 * _3816;
    bool _3824 = _3180 == 0;
    int _3826 = ~_3792;
    int _3828 = _3826 + _3810;
    int _3830 = _3828 + 1;
    int _3832 = ~_3818;
    int _3834 = _3832 + 1;
    int _3836 = _3834 + 1;
    bool _3838 = !_3820;
    int _3840 = _3838 ? _3808 : (-1);
    bool _3842 = !_3824;
    int _3844 = _3842 ? _3830 : (-1);
    int _3846 = _3760 * _3836;
    float _3848 = float(_3840);
    float _3850 = _3732 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3852 = _739 == 0;
    float _3854 = _3774 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3856 = float(_3844);
    float _3858 = fma(_3850, _3848, _2500);
    bool _3860 = !_3852;
    int _3862 = _3860 ? _2956 : (-1);
    float _3864 = _1078 + 0.5;
    bool _3866 = !_2088;
    int _3868 = _3866 ? _2972 : (-1);
    float _3870 = -_2502;
    float _3872 = fma(_3854, _3856, _3870);
    float _3874 = _1068 + (-0.5);
    int _3876 = _3862 * _3800;
    int _3878 = _3876 + _3822;
    float _3880 = fma(_3850, _3864, _3858);
    float _3882 = _3128 * _3754;
    float _3884 = -_3854;
    float _3886 = fma(_3884, _3874, _3872);
    int _3888 = _3868 * _3818;
    int _3890 = _3888 + _3846;
    float _3892 = -_3588;
    float _3894 = fma(_1078, _3892, _3880);
    float _3896 = -_3154;
    float _3898 = _3882 * _3896;
    float _3900 = fma(_1068, _3594, _3886);
    float _3902 = -_3164;
    float _3904 = _3882 * _3902;
    float _3906 = sqrt(_3648);
    float _3908 = -_3134;
    float _3910 = _3882 * _3908;
    float _3912 = fma(_3754, _3070, _3898);
    float _3914 = fma(_3754, _3072, _3904);
    float _3916 = float(_3890);
    float _3918 = fma(_3754, _3074, _3910);
    float _3920 = _3154 + _3162;
    float _3922 = float(_3878);
    float _3924 = _3164 + _3158;
    float _3926 = _3134 + _3176;
    out.m_90.x = _3912;
    out.m_90.y = _3914;
    out.m_90.z = _3918;
    out.m_92.x = _3922;
    bool _3928 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3930 = isnan(_3906);
    bool _3932 = _3928 || _3930;
    bool _3934 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3936 = _3932 || _3934;
    out.m_92.w = _3916;
    out.m_94.x = _3894;
    out.m_94.y = _3900;
    out.m_96.x = _3920;
    out.m_96.y = _3924;
    out.m_96.z = _3926;
    int _3938 = as_type<int>(_3754);
    float _3940 = as_type<float>(_3800);
    if (!_3936)
    {
        _3674 = 1.0;
    }
    float _3942 = _3674;
    bool _3944 = !_3936;
    float _3946 = _3942;
    if (!_3944)
    {
        bool _3948 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3950 = isnan(_3906);
        bool _3952 = _3948 || _3950;
        bool _3954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3956 = _3952 || _3954;
        if (!_3956)
        {
            float _3958 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3960 = _3906 + _3958;
            float _3962 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3964 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3962;
            float _3966 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3968 = _3966 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3970 = 1.0 / _3964;
            float _3972 = _3960 * _3970;
            float _3974 = fma(_3972, _3968, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3946 = _3974;
            _3976 = true;
        }
        else
        {
            bool _3978 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3980 = isnan(_3906);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3986 = _3982 || _3984;
            if (!_3986)
            {
                float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3990 = _3906 + _3988;
                float _3992 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3994 = _3992 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3996 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3998 = _3996 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4000 = 1.0 / _3994;
                float _4002 = _3990 * _4000;
                float _4004 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3946 = _4004;
                _3976 = true;
            }
            else
            {
                _3946 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3976 = false;
    float _4006 = _3946;
    float _4008 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4010 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4012 = floor(_4008);
    float _4014 = floor(_4010);
    float _4016 = -_4012;
    float _4018 = _4008 + _4016;
    float _4020 = -_4014;
    float _4022 = _4010 + _4020;
    float2 _11447 = float2(_4018, _4022);
    float _4024 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11447, float2(0.0), isnan(_11447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11447, float2(0.0), isnan(_11447)), level(0.0)).x;
    float _4026 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4028 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4030 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4032 = _3530 + _4030;
    float _4034 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4026);
    float _4036 = _2632 + _4028;
    float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4040 = _3536 + _4038;
    float _4042 = fma(_4032, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4044 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4034);
    float _4046 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4048 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4050 = _4044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4052 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4046);
    float _4054 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4056 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4048);
    float _4058 = 1.0 / _4050;
    float _4060 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4052);
    float _4062 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4054);
    float _4064 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4056);
    float _4066 = fma(_4040, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4068 = _4060 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4070 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4062);
    float _4072 = _4064 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4074 = -_2632;
    float _4076 = _4074 + _4042;
    float _4078 = _4068 + _4050;
    float _4080 = _4070 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4082 = trunc(_4072);
    int _4084 = int(_4082);
    float _4086 = -_3224;
    float _4088 = _4086 + _4066;
    float _4090 = _4076 * _4076;
    float _4092 = _4078 * _4058;
    float _4094 = _4092 * 0.5;
    float _4096 = fma(_4088, _4088, _4090);
    float _4098 = trunc(_4080);
    int _4100 = int(_4098);
    float _4102 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4104 = fma(_4094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4102);
    float _4106 = 1.0 / _4104;
    int _4108 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4110 = _4084 + _4108;
    int _4112 = _4110 + 1;
    int _4114 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4116 = _4100 + _4114;
    int _4118 = _4116 + 1;
    int _4120 = _4112 | _4118;
    float _4122 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4124 = _4106 * _4122;
    bool _4126 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4128 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4130 = !_4126;
    int _4132 = _4130 ? 0 : 1;
    int _4134 = 2;
    int _4136 = _4118;
    int _4138 = _4112;
    float _4140 = _4032;
    float _4142 = _4066;
    if (!_4126)
    {
        _4134 = 1;
    }
    int _4144 = _4134;
    int _4146 = _4144;
    if (!_4128)
    {
        _4146 = _4132;
    }
    int _4148 = _4146;
    float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4152 = _3538 + _4150;
    bool _4154 = _4112 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4156 = _4148 << 6;
    float _4158 = fma(_4152, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4160 = _4120 < 0;
    bool _4162 = _4160 || _4154;
    int _4164 = _4156 + 96;
    uint _4166 = uint(int(uint(_4164) >> uint(2)));
    uint _4168 = uint(int(uint(int(_4166)) >> uint(2)));
    int _4170 = int(_4166) & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    int _4174 = int(_4166) + 1;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    int _4178 = _4174 & 3;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[int(_4176)][_4178];
    float _4182 = -_3252;
    float _4184 = _4182 + _4158;
    bool _4186 = _4118 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4188 = _4186 || _4162;
    float _4190 = fma(_4184, _4184, _4096);
    int _4192 = _4156 + 104;
    uint _4194 = uint(int(uint(_4192) >> uint(2)));
    uint _4196 = uint(int(uint(int(_4194)) >> uint(2)));
    int _4198 = int(_4194) & 3;
    float _4200 = (*spvDescriptorSet0.vp_c15)._m0[int(_4196)][_4198];
    int _4202 = int(_4194) + 1;
    uint _4204 = uint(int(uint(_4202) >> uint(2)));
    int _4206 = _4202 & 3;
    float _4208 = (*spvDescriptorSet0.vp_c15)._m0[int(_4204)][_4206];
    float _4210 = sqrt(_4190);
    if (!_4188)
    {
        int _4212 = _4118 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4214 = _4212 + _4112;
        _3938 = _4214;
    }
    int _4216 = _3938;
    int _4218 = _4156 + 48;
    uint _4220 = uint(int(uint(_4218) >> uint(2)));
    uint _4222 = uint(int(uint(int(_4220)) >> uint(2)));
    int _4224 = int(_4220) & 3;
    float _4226 = (*spvDescriptorSet0.vp_c15)._m0[int(_4222)][_4224];
    int _4228 = int(_4220) + 1;
    uint _4230 = uint(int(uint(_4228) >> uint(2)));
    int _4232 = _4228 & 3;
    float _4234 = (*spvDescriptorSet0.vp_c15)._m0[int(_4230)][_4232];
    float _4236 = _3538;
    if (!_4188)
    {
        float _4238 = floor(_4072);
        _4236 = _4238;
    }
    float _4240 = _4236;
    if (!_4188)
    {
        int _4242 = _4216 << 2;
        _4136 = _4242;
    }
    int _4244 = _4136;
    int _4246 = _4244;
    if (!_4188)
    {
        uint _4248 = uint(int(uint(_4216) >> uint(2)));
        _4138 = int(_4248);
    }
    int _4250 = _4138;
    if (!_4188)
    {
        int _4252 = 12 & _4244;
        _4246 = _4252;
    }
    int _4254 = _4246;
    int _4256 = _4156 + 64;
    uint _4258 = uint(int(uint(_4256) >> uint(2)));
    uint _4260 = uint(int(uint(int(_4258)) >> uint(2)));
    int _4262 = int(_4258) & 3;
    float _4264 = (*spvDescriptorSet0.vp_c15)._m0[int(_4260)][_4262];
    int _4266 = int(_4258) + 1;
    uint _4268 = uint(int(uint(_4266) >> uint(2)));
    int _4270 = _4266 & 3;
    float _4272 = (*spvDescriptorSet0.vp_c15)._m0[int(_4268)][_4270];
    bool _4274 = _4210 > 0.0;
    if (!_4188)
    {
        int _4276 = _4250 << 4;
        int _4278 = _4276 + _4254;
        _4140 = as_type<float>(_4278);
    }
    float _4280 = _4140;
    int _4282 = _4156 + 56;
    uint _4284 = uint(int(uint(_4282) >> uint(2)));
    uint _4286 = uint(int(uint(int(_4284)) >> uint(2)));
    int _4288 = int(_4284) & 3;
    float _4290 = (*spvDescriptorSet0.vp_c15)._m0[int(_4286)][_4288];
    int _4292 = int(_4284) + 1;
    uint _4294 = uint(int(uint(_4292) >> uint(2)));
    int _4296 = _4292 & 3;
    float _4298 = (*spvDescriptorSet0.vp_c15)._m0[int(_4294)][_4296];
    bool _4300 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4302 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4304 = _4300 || _4302;
    bool _4306 = isnan(0.5);
    bool _4308 = _4304 || _4306;
    float _4310 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4274)
    {
        _3940 = _4066;
    }
    float _4312 = _3940;
    int _4314 = _4156 + 72;
    uint _4316 = uint(int(uint(_4314) >> uint(2)));
    uint _4318 = uint(int(uint(int(_4316)) >> uint(2)));
    int _4320 = int(_4316) & 3;
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[int(_4318)][_4320];
    int _4324 = int(_4316) + 1;
    uint _4326 = uint(int(uint(_4324) >> uint(2)));
    int _4328 = _4324 & 3;
    float _4330 = (*spvDescriptorSet0.vp_c15)._m0[int(_4326)][_4328];
    float _4332 = _4312;
    float _4334 = _4312;
    if (!_4274)
    {
        _4310 = _4158;
    }
    float _4336 = _4310;
    float _4338 = _4036 * _4180;
    int _4340 = _4156 + 80;
    uint _4342 = uint(int(uint(_4340) >> uint(2)));
    uint _4344 = uint(int(uint(int(_4342)) >> uint(2)));
    int _4346 = int(_4342) & 3;
    float _4348 = (*spvDescriptorSet0.vp_c15)._m0[int(_4344)][_4346];
    int _4350 = int(_4342) + 1;
    uint _4352 = uint(int(uint(_4350) >> uint(2)));
    int _4354 = _4350 & 3;
    float _4356 = (*spvDescriptorSet0.vp_c15)._m0[int(_4352)][_4354];
    float _4358 = fma(_3224, _4172, _4338);
    float _4360 = fma(_3252, _4200, _4358);
    int _4362 = _4156 + 88;
    uint _4364 = uint(int(uint(_4362) >> uint(2)));
    uint _4366 = uint(int(uint(int(_4364)) >> uint(2)));
    int _4368 = int(_4364) & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    int _4372 = int(_4364) + 1;
    uint _4374 = uint(int(uint(_4372) >> uint(2)));
    int _4376 = _4372 & 3;
    float _4378 = (*spvDescriptorSet0.vp_c15)._m0[int(_4374)][_4376];
    float _4380 = _4360 + _4208;
    float _4382 = _4036 * _4234;
    float _4384 = _4280;
    float _4386 = _4382;
    float _4388 = _4336;
    float _4390 = _4240;
    if (!_4188)
    {
        int _4392 = as_type<int>(_4280) + 400;
        uint _4394 = uint(int(uint(_4392) >> uint(2)));
        uint _4396 = uint(int(uint(int(_4394)) >> uint(2)));
        int _4398 = int(_4394) & 3;
        float _4400 = (*spvDescriptorSet0.vp_c15)._m0[int(_4396)][_4398];
        _4384 = _4400;
    }
    float _4402 = _4384;
    float _4404 = 1.0 / _4380;
    float _4406 = fma(_3224, _4226, _4382);
    if (!_4274)
    {
        _4386 = _4042;
    }
    float _4408 = _4386;
    float _4410 = _4036 * _4272;
    float _4412 = fma(_3224, _4264, _4410);
    bool _4414 = !_4274;
    float _4416 = _4408;
    float _4418 = _4322;
    float _4420 = _4402;
    if (!_4414)
    {
        float _4422 = _221 * _221;
        float _4424 = rsqrt(_4190);
        float _4426 = fma(_219, _219, _4422);
        float _4428 = fma(_217, _217, _4426);
        float _4430 = sqrt(_4428);
        float _4432 = _4088 * _4424;
        float _4434 = _4076 * _4424;
        float _4436 = _4184 * _4424;
        bool _4438 = _4430 > 0.0;
        float _4440 = _4430;
        float _4442 = _4424;
        if (!_4438)
        {
            _4332 = _4066;
        }
        float _4444 = _4332;
        _4334 = _4444;
        if (!_4438)
        {
            _4440 = _4042;
        }
        float _4446 = _4440;
        _4416 = _4446;
        if (!_4438)
        {
            _4442 = _4158;
        }
        float _4448 = _4442;
        bool _4450 = !_4438;
        _4388 = _4448;
        if (!_4450)
        {
            float _4452 = rsqrt(_4428);
            float _4454 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4456 = _221 * _4452;
            float _4458 = _219 * _4452;
            float _4460 = _217 * _4452;
            float _4462 = _4434 * _4456;
            float _4464 = fma(_4432, _4458, _4462);
            float _4466 = _4454 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4468 = fma(_4436, _4460, _4464);
            float _4470 = _4468 * _4466;
            float _4472 = fma(_219, _4470, _4066);
            float _4474 = fma(_221, _4470, _4042);
            float _4476 = fma(_217, _4470, _4158);
            _4334 = _4472;
            _4416 = _4474;
            _4388 = _4476;
        }
    }
    float _4478 = _4334;
    float _4480 = _4416;
    float _4482 = _4388;
    float _4484 = fma(_3252, _4322, _4412);
    float _4486 = fma(_3252, _4290, _4406);
    float _4488 = _4482;
    if (_4308)
    {
        _4418 = _4478;
    }
    float _4490 = _4418;
    float _4492 = _4490;
    if (_4308)
    {
        _229 = _4480;
    }
    float _4494 = _229;
    float _4496 = _4494;
    if (!_4308)
    {
        float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4500 = _2632 + _4498;
        float _4502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4504 = _3224 + _4502;
        float _4506 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4508 = -_2632;
        float _4510 = _4508 + _4480;
        float _4512 = _4500 * _4500;
        float _4514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4516 = _3252 + _4514;
        float _4518 = fma(_4504, _4504, _4512);
        float _4520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4522 = fma(_4516, _4516, _4518);
        float _4524 = sqrt(_4522);
        float _4526 = _4506 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4528 = -_3224;
        float _4530 = _4528 + _4478;
        float _4532 = precise::min(_4524, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4534 = _4532 * _4520;
        float _4536 = _4526 * _4534;
        float _4538 = -_3252;
        float _4540 = _4538 + _4482;
        float _4542 = fma(_4510, _4536, _2632);
        float _4544 = fma(_4530, _4536, _3224);
        float _4546 = fma(_4540, _4536, _3252);
        _4496 = _4542;
        _4492 = _4544;
        _4488 = _4546;
    }
    float _4548 = _4496;
    float _4550 = _4492;
    float _4552 = _4488;
    float _4554 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4556 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4558 = _4486 + _4298;
    float _4560 = _4484 + _4330;
    float _4562 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4564 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4554);
    float _4566 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4556);
    float _4568 = _4558 * _4404;
    float _4570 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4572 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4562);
    float _4574 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4564);
    float _4576 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4566);
    float _4578 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4570);
    bool _4580 = _4568 >= 0.0;
    float _4582 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4572);
    float _4584 = _4574 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4586 = _4560 * _4404;
    float _4588 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4578);
    bool _4590 = _4568 <= 1.0;
    bool _4592 = _4590 && _4580;
    float _4594 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4596 = _4582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4598 = _4588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4600 = _4586 >= 0.0;
    bool _4602 = _4600 && _4592;
    float _4604 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4606 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4608 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4594);
    bool _4610 = _4586 <= 1.0;
    bool _4612 = _4610 && _4602;
    float _4614 = _4576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4616 = -_4606;
    float _4618 = fma(_4616, _4604, 1.0);
    float _4620 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4608);
    float _4622 = _4566;
    float _4624 = _4560;
    float _4626 = _4568;
    if (!_4188)
    {
        float _4628 = rint(_4402);
        float _4630 = precise::max(_4628, 0.0);
        uint _4632 = uint(_4630);
        uint _4634 = clamp(_4632, 0u, 65535u);
        _4622 = as_type<float>(_4634);
    }
    float _4636 = _4622;
    float _4638 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_4188)
    {
        float _4640 = -_4240;
        float _4642 = _4072 + _4640;
        _4624 = _4642;
    }
    float _4644 = _4624;
    float _4646 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4648 = _4036 * _4356;
    float _4650 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4652 = log2(_4618);
    if (_4612)
    {
        float _4654 = float(_4148);
        _4420 = _4654;
    }
    float _4656 = _4420;
    float _4658 = fma(_3224, _4348, _4648);
    float _4660 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4650);
    float _4662 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4638);
    float _4664 = fma(_3252, _4370, _4658);
    float _4666 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4660);
    float _4668 = 1.0 / _4646;
    float _4670 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4662);
    float _4672 = _4664 + _4378;
    float _4674 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4666);
    float _4676 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4670);
    float _4678 = _4672 * _4404;
    float _4680 = _4486;
    float _4682 = _4674;
    float _4684 = _4678;
    if (!_4188)
    {
        float _4686 = floor(_4080);
        _4680 = _4686;
    }
    float _4688 = _4680;
    float _4690 = _4652 * 0.693147182464599609375;
    float _4692 = _4690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4694 = _4656;
    if (_4612)
    {
        float _4696 = rint(_4656);
        float _4698 = precise::max(_4696, 0.0);
        uint _4700 = uint(_4698);
        uint _4702 = clamp(_4700, 0u, 65535u);
        _4694 = as_type<float>(_4702);
    }
    float _4704 = _4694;
    float _4706 = _4674 * _4668;
    float _4708 = _4676 * _4668;
    float _4710 = fma(_4706, 0.5, 0.5);
    float _4712 = fma(_4708, -0.5, 0.5);
    float _4714 = _4688;
    if (!_4188)
    {
        float _4716 = -_4688;
        float _4718 = _4080 + _4716;
        _4714 = _4718;
    }
    float _4720 = _4714;
    float _4722 = _4668;
    if (!_4188)
    {
        float3 _12626 = float3(_4644, _4720, float(as_type<int>(_4636)));
        float3 _12630 = select(_12626, float3(0.0), isnan(_12626));
        float _4724 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12630.xy, uint(rint(_12630.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12630.xy, uint(rint(_12630.z)), level(0.0)).x;
        _4722 = _4724;
    }
    float _4726 = _4722;
    float _4728 = _4586;
    float _4730 = _4704;
    if (_4612)
    {
        float3 _12646 = float3(_4568, _4586, float(as_type<int>(_4704)));
        float3 _12648 = select(_12646, float3(0.0), isnan(_12646));
        float _4732 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12648.xy, uint(rint(_12648.z)), _4678, level(0.0));
        _4728 = _4732;
    }
    float _4734 = _4728;
    float3 _12658 = float3(_4710, _4712, _4692);
    float _4736 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12658, float3(0.0), isnan(_12658)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12658, float3(0.0), isnan(_12658)), level(0.0)).x;
    float3 _12667 = float3(_4710, _4712, _4692);
    float4 _4739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12667, float3(0.0), isnan(_12667)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12667, float3(0.0), isnan(_12667)), level(0.0)).xyzw;
    float _4741 = _4739.x;
    float _4743 = _4739.y;
    float _4745 = _4739.z;
    float _4747 = _4739.w;
    float _4749 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_4188)
    {
        _4390 = 1.0;
    }
    float _4751 = _4390;
    bool _4753 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4755 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4757 = _4753 || _4755;
    bool _4759 = isnan(0.5);
    bool _4761 = _4757 || _4759;
    float _4763 = _4751;
    if (_4761)
    {
        _4749 = 1.0;
    }
    float _4765 = _4749;
    float _4767 = _4765;
    if (!_4761)
    {
        float _4769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4771;
        float _4775 = _4769 * 0.15915493667125701904296875;
        float _4777 = _4775 * 6.283185482025146484375;
        float _4779 = cos(_4777);
        float _4781 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4783 = _4781 * 0.15915493667125701904296875;
        float _4785 = _4775 * 6.283185482025146484375;
        float _4787 = sin(_4785);
        float _4789 = 1.0 / _4779;
        float _4791 = _4783 * 6.283185482025146484375;
        float _4793 = cos(_4791);
        float _4795 = _4787 * _4789;
        float _4797 = _4783 * 6.283185482025146484375;
        float _4799 = sin(_4797);
        float _4801 = _4793 * _4795;
        float _4803 = 1.0 / _4773;
        float _4805 = 1.0 / _4801;
        float _4807 = _4799 * _4805;
        float _4809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4811 = fma(_4124, _4807, _4809);
        float _4813 = _4811 * _4803;
        float _4815 = precise::clamp(_4813, 0.0, 1.0);
        _4730 = _4801;
        _4626 = _4811;
        _4767 = _4815;
    }
    float _4817 = _4730;
    float _4819 = _4626;
    float _4821 = _4767;
    float _4823 = _4817;
    float _4825 = _4819;
    if (!_4188)
    {
        int _4827 = _4216 << 4;
        int _4829 = _4827 + 2048;
        uint _4831 = uint(int(uint(_4829) >> uint(2)));
        uint _4833 = uint(int(uint(int(_4831)) >> uint(2)));
        int _4835 = int(_4831) & 3;
        float _4837 = (*spvDescriptorSet0.vp_c15)._m0[int(_4833)][_4835];
        int _4839 = int(_4831) + 1;
        uint _4841 = uint(int(uint(_4839) >> uint(2)));
        int _4843 = _4839 & 3;
        float _4845 = (*spvDescriptorSet0.vp_c15)._m0[int(_4841)][_4843];
        int _4847 = _4829 + 8;
        uint _4849 = uint(int(uint(_4847) >> uint(2)));
        uint _4851 = uint(int(uint(int(_4849)) >> uint(2)));
        int _4853 = int(_4849) & 3;
        float _4855 = (*spvDescriptorSet0.vp_c15)._m0[int(_4851)][_4853];
        int _4857 = int(_4849) + 1;
        uint _4859 = uint(int(uint(_4857) >> uint(2)));
        int _4861 = _4857 & 3;
        float _4863 = (*spvDescriptorSet0.vp_c15)._m0[int(_4859)][_4861];
        float _4865 = _4036 * _4845;
        float _4867 = fma(_3224, _4837, _4865);
        float _4869 = fma(_3252, _4855, _4867);
        float _4871 = _4869 + _4863;
        float _4873 = precise::clamp(_4871, 0.0, 1.0);
        float _4875 = -_4873;
        float _4877 = _4875 + _4726;
        float _4879 = fma(_4877, 500.0, 1.5);
        float _4881 = exp2(_4879);
        float _4883 = 0.0 + _4881;
        float _4885 = precise::clamp(_4883, 0.0, 1.0);
        _4823 = _4837;
        _4825 = _4845;
        _4763 = _4885;
    }
    float _4887 = _4823;
    float _4889 = _4825;
    float _4891 = _4763;
    float _4893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4895 = _4548 + _4893;
    float _4897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4899 = _4550 + _4897;
    float _4901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4903 = _4552 + _4901;
    float _4905 = _4895 * _4895;
    float _4907 = fma(_4899, _4899, _4905);
    float _4909 = fma(_4903, _4903, _4907);
    float _4911 = rsqrt(_4909);
    float _4913 = _4911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4915 = _4899 * _4913;
    float _4917 = _4903 * _4913;
    float _4919 = _4915 * _4915;
    float _4921 = _4917 * _4917;
    float _4923 = _4919 + _4921;
    float _4925 = sqrt(_4923);
    bool _4927 = _4925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4931 = _4925 + _4929;
    float _4933 = _4911;
    float _4935 = _4931;
    float _4937 = _4887;
    float _4939 = _4895;
    float _4941 = _4913;
    if (_4927)
    {
        float _4943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4933 = _4943;
    }
    float _4945 = _4933;
    float _4947 = _4945;
    if (_4927)
    {
        float _4949 = _4931 * _4945;
        _4935 = _4949;
    }
    float _4951 = _4935;
    if (_4927)
    {
        float _4953 = rsqrt(_4923);
        _4947 = _4953;
    }
    float _4955 = _4947;
    float _4957 = _4955;
    if (_4927)
    {
        float _4959 = _4951 * 0.15915493667125701904296875;
        _4937 = _4959;
    }
    float _4961 = _4937;
    float _4963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4965 = _4903;
    float _4967 = _4961;
    if (_4927)
    {
        float _4969 = _4961 * 6.283185482025146484375;
        float _4971 = sin(_4969);
        _4965 = _4971;
    }
    float _4973 = _4965;
    float _4975 = precise::max(0.0, _4963);
    float _4977 = _4889;
    float _4979 = _4975;
    if (_4927)
    {
        float _4981 = _4961 * 6.283185482025146484375;
        float _4983 = cos(_4981);
        _4977 = _4983;
    }
    float _4985 = _4977;
    float _4987 = -_4913;
    float _4989 = -_4975;
    float _4991 = fma(_4895, _4987, _4989);
    if (_4927)
    {
        float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4939 = _4993;
    }
    float _4995 = _4939;
    float _4997 = _4973;
    float _4999 = _4995;
    if (_4927)
    {
        float _5001 = fma(_4973, _4995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4997 = _5001;
    }
    float _5003 = _4997;
    float _5005 = _5003;
    if (!_4927)
    {
        _4999 = _4917;
    }
    float _5007 = _4999;
    float _5009 = _5007;
    if (!_4927)
    {
        _4967 = _4919;
    }
    float _5011 = _4967;
    float _5013 = _5011;
    if (_4927)
    {
        float _5015 = _4955 * _5003;
        _4142 = _5015;
    }
    float _5017 = _4142;
    if (!_4927)
    {
        _4957 = _4915;
    }
    float _5019 = _4957;
    float _5021 = _5019;
    float _5023 = _4985;
    if (_4927)
    {
        float _5025 = _4985 + (-1.0);
        _4979 = _5025;
    }
    float _5027 = _4979;
    if (_4927)
    {
        float _5029 = _4915 * _5017;
        _5021 = _5029;
    }
    float _5031 = _5021;
    if (!_4927)
    {
        _5005 = _4991;
    }
    float _5033 = _5005;
    float _5035 = _5033;
    if (_4927)
    {
        float _5037 = _4917 * _5017;
        _5009 = _5037;
    }
    float _5039 = _5009;
    if (_4927)
    {
        float _5041 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4941 = _5041;
    }
    float _5043 = _4941;
    if (_4927)
    {
        float _5045 = _5031 * _5031;
        _5013 = _5045;
    }
    float _5047 = _5013;
    float _5049 = sqrt(_4909);
    if (_4927)
    {
        float _5051 = fma(_4991, _4985, _5043);
        _5035 = _5051;
    }
    float _5053 = _5035;
    if (!_4927)
    {
        _5023 = _4921;
    }
    float _5055 = _5023;
    float _5057 = _5055;
    if (_4927)
    {
        float _5059 = _5039 * _5039;
        _5057 = _5059;
    }
    float _5061 = _5057;
    float _5063 = fma(_5053, _5053, _5047);
    float _5065 = _5063 + _5061;
    float _5067 = rsqrt(_5065);
    float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5071 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5069);
    float _5073 = precise::clamp(_5071, 0.0, 1.0);
    float _5075 = -_5073;
    float _5077 = _5075 + 1.0;
    float _5079 = abs(_5077);
    float _5081 = log2(_5079);
    float _5083 = _5067 * _5031;
    float _5085 = _5067 * _5053;
    float _5087 = _5067 * _5039;
    float _5089 = _5083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5091 = -_5089;
    float _5093 = fma(_5085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5091);
    float _5095 = -_5087;
    float _5097 = fma(_5095, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5093);
    float _5099 = _5081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5101 = fma(_5097, -0.5, 0.5);
    float _5103 = fma(_5097, 0.5, 0.5);
    float _5105 = _5085 + 1.0;
    float _5107 = exp2(_5099);
    float _5109 = fma(_5103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5111 = fma(_5103, _5109, -0.212114393711090087890625);
    float _5113 = sqrt(_5101);
    float _5115 = fma(_5103, _5111, 1.570728778839111328125);
    float _5117 = -_5085;
    float _5119 = fma(_5107, _5105, _5117);
    float _5121 = fma(_5119, 0.5, 0.5);
    float _5123 = _5113 * 0.636619746685028076171875;
    float _5125 = -_5115;
    float _5127 = fma(_5123, _5125, 1.0);
    float2 _13244 = float2(_5127, _5121);
    float3 _5131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13244, float2(0.0), isnan(_13244)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13244, float2(0.0), isnan(_13244)), level(0.0)).xyz;
    float _5133 = _5131.x;
    float _5135 = _5131.y;
    float _5137 = _5131.z;
    float _5139 = abs(_4124);
    float _5141 = log2(_5139);
    float _5143 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5145 = _5081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5147 = -_4024;
    float _5149 = _5147 + 1.0;
    float _5151 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5143);
    float _5153 = _4674 + _4646;
    bool _5155 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5157 = isnan(_5049);
    bool _5159 = _5155 || _5157;
    bool _5161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5163 = _5159 || _5161;
    float _5165 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5151);
    float _5167 = exp2(_5145);
    bool _5169 = _4124 <= 8000.0;
    bool _5171 = isnan(_4124);
    bool _5173 = _5169 || _5171;
    bool _5175 = isnan(8000.0);
    bool _5177 = _5173 || _5175;
    float _5179 = float(_5177);
    float _5181 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5165);
    float _5183 = _5153 * 0.5;
    float _5185 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5187 = _4646 * 0.5;
    float _5189 = _5181 + _4646;
    out.gl_Position.x = _4674;
    out.gl_Position.y = _4676;
    out.gl_Position.z = _5181;
    out.gl_Position.w = _4646;
    float _5191 = fma(_4676, -0.5, _5187);
    float _5193 = exp2(_5185);
    float _5195 = _5189 * 0.5;
    out.m_98.x = _5183;
    out.m_98.y = _5191;
    out.m_98.z = _5195;
    out.m_98.w = _4646;
    float _5197 = -_5167;
    float _5199 = _5197 + 1.0;
    if (!_4612)
    {
        _4682 = 1.0;
    }
    float _5201 = _4682;
    float _5203 = _5201;
    if (_4612)
    {
        bool _5205 = _4734 >= _4678;
        bool _5207 = isnan(_4734);
        bool _5209 = _5205 || _5207;
        bool _5211 = isnan(_4678);
        bool _5213 = _5209 || _5211;
        float _5215 = float(_5213);
        _5203 = _5215;
    }
    float _5217 = _5203;
    float _5219 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5221 = fma(_5193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = _5219;
    if (!_5163)
    {
        _4684 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5227 = _4684;
    float _5229 = _5217 * _4891;
    float _5231 = fma(_5223, -2.0, 3.0);
    float _5233 = _5223 * _5223;
    float _5235 = _5219 * _4736;
    float _5237 = -_5219;
    float _5239 = _5237 + 1.0;
    float _5241 = _5239;
    float _5243 = _5227;
    float _5245 = _5227;
    if (!_5163)
    {
        _5225 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5247 = _5225;
    float _5249 = _5233 * _5231;
    float _5251 = -_5249;
    float _5253 = _5251 + 1.0;
    float _5255 = fma(_5253, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5249);
    float _5257 = _5179 * _5255;
    float _5259 = _5257 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5261 = _5149 * _5259;
    float _5263 = precise::clamp(_5261, 0.0, 1.0);
    float _5265 = _4747 * _5235;
    float _5267 = -_5263;
    float _5269 = fma(_5267, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5271 = _5263;
    float _5273 = _5265;
    float _5275 = _5247;
    float _5277 = _5247;
    if (!_5163)
    {
        _5271 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5279 = _5271;
    float _5281 = -_5229;
    float _5283 = fma(_5281, _5269, 1.0);
    float _5285 = precise::clamp(_5283, 0.0, 1.0);
    float _5287 = _4747 * _5239;
    float _5289 = _5285;
    float _5291 = _5279;
    float _5293 = _5279;
    if (!_5163)
    {
        _5241 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5295 = _5241;
    float _5297 = _5285 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5299 = _5295;
    float _5301 = _5295;
    if (!_5163)
    {
        _5289 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5303 = _5289;
    out.m_100.x = _5297;
    float _5305 = _5137 * _5235;
    float _5307 = fma(_5133, _5265, _4741);
    float _5309 = fma(_5135, _5265, _4743);
    float _5311 = _4821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5313 = fma(_4747, _5305, _4745);
    float _5315 = _5303;
    float _5317 = _5303;
    if (!_5163)
    {
        _5273 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5319 = _5273;
    out.m_102.x = _5307;
    out.m_102.y = _5309;
    out.m_102.z = _5313;
    out.m_102.w = _5287;
    bool _5321 = !_5163;
    float _5323 = _5319;
    float _5325 = _5319;
    if (!_5321)
    {
        bool _5327 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5329 = isnan(_5049);
        bool _5331 = _5327 || _5329;
        bool _5333 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5335 = _5331 || _5333;
        if (!_5335)
        {
            float _5337 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5339 = _5049 + _5337;
            float _5341 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5343 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5341;
            float _5345 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5347 = _5345 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5349 = 1.0 / _5343;
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5353 = _5351 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5355 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5357 = _5355 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5367 = _5339 * _5349;
            float _5369 = precise::clamp(_5367, 0.0, 1.0);
            float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5373 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5375 = fma(_5369, _5347, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5377 = fma(_5369, _5373, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5379 = fma(_5369, _5353, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5381 = fma(_5369, _5357, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5383 = fma(_5369, _5361, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5385 = fma(_5369, _5365, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5293 = _5379;
            _5325 = _5383;
            _5245 = _5375;
            _5301 = _5381;
            _5277 = _5377;
            _5317 = _5385;
            _5387 = true;
        }
        else
        {
            bool _5389 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5391 = isnan(_5049);
            bool _5393 = _5389 || _5391;
            bool _5395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5397 = _5393 || _5395;
            if (!_5397)
            {
                _5243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5399 = _5243;
            _5245 = _5399;
            if (!_5397)
            {
                _5291 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5401 = _5291;
            _5293 = _5401;
            if (!_5397)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5403 = _5275;
            _5277 = _5403;
            if (!_5397)
            {
                _5299 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5405 = _5299;
            _5301 = _5405;
            if (!_5397)
            {
                _5323 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5407 = _5323;
            _5325 = _5407;
            if (!_5397)
            {
                _5315 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5409 = _5315;
            bool _5411 = !_5397;
            _5317 = _5409;
            if (!_5411)
            {
                bool _5413 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5415 = isnan(_5049);
                bool _5417 = _5413 || _5415;
                bool _5419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5421 = _5417 || _5419;
                if (!_5421)
                {
                    float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5425 = _5049 + _5423;
                    float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5429 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5427;
                    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5433 = _5431 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5435 = 1.0 / _5429;
                    float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5443 = _5441 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5451 = _5449 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5453 = _5425 * _5435;
                    float _5455 = precise::clamp(_5453, 0.0, 1.0);
                    float _5457 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5459 = _5457 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5461 = fma(_5455, _5433, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5463 = fma(_5455, _5459, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5465 = fma(_5455, _5439, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5467 = fma(_5455, _5443, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5469 = fma(_5455, _5447, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5471 = fma(_5455, _5451, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5293 = _5465;
                    _5325 = _5469;
                    _5245 = _5461;
                    _5301 = _5467;
                    _5277 = _5463;
                    _5317 = _5471;
                    _5387 = true;
                }
                else
                {
                    _5293 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5325 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5301 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5317 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5387 = false;
    float _5473 = _5293;
    float _5475 = _5325;
    float _5477 = _5245;
    float _5479 = _5301;
    float _5481 = _5277;
    float _5483 = _5317;
    float _5485 = fma(_3924, -0.5, 0.5);
    float _5487 = precise::clamp(_5485, 0.0, 1.0);
    float _5489 = -_5473;
    float _5491 = _5489 + _5475;
    float _5493 = _5311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5495 = -_5477;
    float _5497 = _5495 + _5479;
    float _5499 = fma(_5487, _5491, _5473);
    out.m_104.x = 0.0;
    float _5501 = -_5481;
    float _5503 = _5501 + _5483;
    float _5505 = fma(_5487, _5497, _5477);
    float _5507 = _5499 * 0.586610972881317138671875;
    out.m_65.x = _5493;
    bool _5509 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5511 = fma(_5487, _5503, _5481);
    float _5513 = fma(_5505, 0.298911988735198974609375, _5507);
    bool _5515 = _4821 > 0.0;
    bool _5517 = isnan(_4821);
    bool _5519 = _5515 || _5517;
    bool _5521 = isnan(0.0);
    bool _5523 = _5519 || _5521;
    float _5525 = fma(_5511, 0.114477999508380889892578125, _5513);
    float _5527 = -_5525;
    float _5529 = _5505 + _5527;
    float _5531 = -_5525;
    float _5533 = _5499 + _5531;
    float _5535 = -_5525;
    float _5537 = _5511 + _5535;
    float _5539 = fma(_5529, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    float _5541 = fma(_5533, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    float _5543 = fma(_5537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    bool _5545 = !_5509;
    if (!_5545)
    {
        float _5547 = -_4548;
        float _5549 = _5547 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5551 = -_4550;
        float _5553 = _5551 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5555 = -_4552;
        float _5557 = _5555 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5559 = _5549 * _5549;
        float _5561 = fma(_5553, _5553, _5559);
        float _5563 = fma(_5557, _5557, _5561);
        float _5565 = sqrt(_5563);
        float _5567 = rsqrt(_5563);
        float _5569 = -_5565;
        float _5571 = _5569 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5573 = _5571 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5575 = precise::clamp(_5573, 0.0, 1.0);
        float _5577 = _5553 * _5567;
        float _5579 = _5549 * _5567;
        float _5581 = abs(_5575);
        float _5583 = log2(_5581);
        float _5585 = _5557 * _5567;
        float _5587 = _5577 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5589 = _3924 * _5579;
        float _5591 = -_5579;
        float _5593 = -_5587;
        float _5595 = fma(_5591, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5593);
        float _5597 = fma(_3920, _5577, _5589);
        float _5599 = -_5585;
        float _5601 = fma(_5599, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5595);
        float _5603 = fma(_3926, _5585, _5597);
        float _5605 = precise::clamp(_5603, 0.0, 1.0);
        float _5607 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5609 = _5601 + _5607;
        float _5611 = _5583 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5613 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5615 = precise::clamp(_5613, 0.0, 1.0);
        float _5617 = exp2(_5611);
        float _5619 = _5617 * _5615;
        float _5621 = _5605 * _5619;
        float _5623 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5625 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5627 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5623;
        out.m_104.y = _5625;
        out.m_104.z = _5627;
    }
    out.m_106.x = _5539;
    out.m_106.y = _5541;
    out.m_106.z = _5543;
    if (_5523)
    {
        return out;
    }
    out.m_65.x = 0.0;
    float _5629 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5629;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5387 = false;
    bool _3976 = false;
    bool _583 = false;
    bool _439 = false;
    bool _249 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_58.w;
    float _122 = in.m_60.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = as_type<float>(_127);
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_65.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5697 = as_type<float>(_149);
        out.gl_Position.z = _5697;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _151 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_122);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_127);
    bool _163 = _131 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _139;
    if (_167)
    {
        out.m_65.x = 0.0;
    }
    float _173 = _131 * _169;
    int _175 = 0;
    float _177 = _173;
    if (_167)
    {
        float _179 = _171 * 5.0;
        _175 = as_type<int>(_179);
    }
    int _181 = _175;
    out.m_63.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5760 = as_type<float>(_181);
        out.gl_Position.z = _5760;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    int _191 = as_type<int>(_183) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_183) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = _187 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _203 = _187 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _205 = _187 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].x, _203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].x, _205);
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].z, _209);
    float _221 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    bool _223 = !_197;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_199;
    float _229 = _217;
    float _247;
    if (!_227)
    {
        float _231 = in.m_72.x;
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _235 = _231 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _239 = _237 * _233;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _245;
        _249 = true;
    }
    else
    {
        _247 = _173;
    }
    _249 = false;
    float _251 = _247;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _251 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _251 + _257;
    bool _261 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_251);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _251 + _285;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _275;
    float _293 = 1.0 / _283;
    float _295 = 1.0 / _279;
    float _297 = _255 * _291;
    bool _299 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_251);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_271;
    float _313 = _311 + 1.0;
    bool _315 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_251);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _309 * _313;
    float _329 = _259 * _293;
    float _331 = -_309;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = _287 * _295;
    bool _341 = _251 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_251);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _353;
    float _357 = _325 * _333;
    float _359 = -_325;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = fma(_355, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = _351 * _361;
    float _375 = fma(_365, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = fma(_337, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_369, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -_351;
    float _383 = _381 + 1.0;
    float _385 = _371 * _373;
    float _387 = _375 * _373;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _395;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _401 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_377, _357, _393);
    float _405 = fma(_397, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _407 = fma(_379, _357, _399);
    float _409 = fma(_401, _327, _403);
    float _411 = fma(_405, _327, _407);
    float _413 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _409);
    float _415 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _411);
    bool _417 = !_289;
    float _419 = _413;
    float _437;
    if (!_417)
    {
        float _421 = in.m_72.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        _437 = _173;
    }
    _439 = false;
    float _441 = _437;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _441 + _443;
    float _447 = in.m_74.x;
    float _449 = in.m_74.y;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_441);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_441);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    bool _487 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_441);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _453;
    float _501 = -_465;
    float _503 = _501 + 1.0;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _507 = 1.0 / _469;
    float _509 = _485 * _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = _415 * _449;
    float _517 = _413 * _447;
    float _519 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _481 * _503;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    float _527 = -_481;
    float _529 = _527 + 1.0;
    float _531 = _513 * _507;
    float _533 = _519 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _441 + _535;
    float _539 = _465 * _525;
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _543 = fma(_531, _537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = fma(_543, _539, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _545);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _555;
    out.m_76.y = _557;
    out.m_76.z = _561;
    out.m_76.w = _559;
    bool _563 = !_505;
    float _581;
    if (!_563)
    {
        float _565 = in.m_72.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        _581 = _173;
    }
    _583 = false;
    float _585 = _581;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _589 = _585 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _595 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_585);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _611 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _613 = isnan(_585);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _623;
    bool _627 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _629 = isnan(_585);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _593;
    float _641 = -_605;
    float _643 = _641 + 1.0;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _647 = 1.0 / _609;
    float _649 = _625 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _655 = fma(_649, _589, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _657 = _621 * _643;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = -_621;
    float _665 = _663 + 1.0;
    float _667 = _653 * _647;
    float _669 = _655 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _585 + _671;
    float _675 = _605 * _661;
    float _677 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _669);
    float _679 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _681 = fma(_679, _675, _677);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[133].x, _681);
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _691;
    out.m_78.y = _693;
    out.m_78.z = _695;
    out.m_78.w = _697;
    bool _699 = !_645;
    if (!_699)
    {
        float _701 = in.m_72.x;
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _705 = _701 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _709 = _707 * _703;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _177 = _715;
    }
    float _717 = _177;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _721 = int(_719);
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = float(_721);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _731 = int(_729);
    float _733 = float(_725);
    float _735 = 1.0 / _727;
    float _737 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _739 = int(_737);
    float _741 = float(uint(_731));
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _745 = _743 != 0;
    float _747 = 1.0 / _733;
    float _749 = _735 * _131;
    float _751 = float(uint(_739));
    float _753 = 1.0 / _741;
    int _755 = ~_739;
    int _757 = _755 + 1;
    if (_745)
    {
        _419 = 1.0;
    }
    float _759 = _419;
    int _761 = 0;
    float _763 = _759;
    if (_745)
    {
        _761 = 0;
    }
    int _765 = _761;
    float _767 = _747 * _131;
    float _769 = trunc(_749);
    int _771 = int(_769);
    int _773 = 0;
    int _775 = _765;
    if (_745)
    {
        _773 = 0;
    }
    int _777 = _773;
    float _779 = 1.0 / _751;
    int _781 = as_type<int>(_753) + (-2);
    int _783 = ~_731;
    int _785 = _783 + 1;
    float _787 = trunc(_767);
    int _789 = int(_787);
    float _791 = float(uint(_771));
    int _793 = as_type<int>(_779) + (-2);
    float _795 = as_type<float>(_781) * _791;
    float _797 = _791;
    float _799 = _767;
    float _801 = _795;
    int _803 = _777;
    if (_745)
    {
        float _805 = in.m_72.x;
        float _807 = in.m_72.y;
        _797 = _805;
        _799 = _807;
    }
    float _809 = _797;
    float _811 = _799;
    float _813 = trunc(_795);
    float _815 = precise::max(_813, 0.0);
    uint _818 = uint(_815);
    float _820 = float(uint(_789));
    float _822 = as_type<float>(_793) * _820;
    float _824 = trunc(_822);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = _785 * int(_818);
    int _832 = _830 + _771;
    float _834 = float(uint(_832));
    float _836 = 0.0;
    float _838 = _834;
    float _840 = _809;
    float _842 = _811;
    if (_745)
    {
        _836 = _809;
    }
    float _844 = _836;
    float _846 = _844;
    if (_745)
    {
        _801 = _811;
    }
    float _848 = _801;
    float _850 = as_type<float>(_781) * _834;
    float _852 = _848;
    if (_745)
    {
        _838 = _844;
    }
    float _854 = _838;
    int _856 = _757 * int(_828);
    int _858 = _856 + _789;
    float _860 = trunc(_850);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = float(uint(_858));
    float _868 = as_type<float>(_793) * _866;
    float _870 = _866;
    float _872 = _868;
    float _874 = _854;
    if (_745)
    {
        _870 = 1.0;
    }
    float _876 = _870;
    float _878 = trunc(_868);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    float _884 = _876;
    if (_745)
    {
        _872 = _844;
    }
    float _886 = _872;
    float _888 = _886;
    if (!_745)
    {
        float _890 = in.m_72.x;
        float _892 = in.m_72.y;
        float _894 = in.m_72.z;
        float _896 = _890 * 3.1415927410125732421875;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _892 * 3.1415927410125732421875;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        _763 = 7.345489978790283203125;
        _840 = _890;
        _884 = 5.839270114898681640625;
        _888 = _894;
        _842 = _892;
        _874 = _906;
        _852 = _910;
        _775 = 1;
        _803 = 2;
        _846 = _892;
    }
    float _912 = _763;
    float _914 = _840;
    float _916 = _884;
    float _918 = _888;
    float _920 = _842;
    float _922 = _874;
    float _924 = _852;
    int _926 = _775;
    int _928 = _803;
    float _930 = _846;
    float _932 = _912 * _914;
    int _934 = int(_828) + int(_882);
    float _936 = _916 * _918;
    int _938 = ~_739;
    int _940 = _938 + 1;
    float _942 = floor(_932);
    int _944 = int(_818) + int(_864);
    float _946 = in.m_72.z;
    float _948 = in.m_72.w;
    float _950 = _169 * _131;
    int _952 = ~_731;
    int _954 = _952 + 1;
    float _956 = _920 * 2.0;
    float _958 = float(_739);
    float _960 = floor(_936);
    int _962 = _940 * _934;
    int _964 = _962 + _789;
    int _966 = _954 * _944;
    int _968 = _966 + _771;
    bool _970 = uint(_964) >= uint(_739);
    float _972 = -_942;
    float _974 = _932 + _972;
    bool _976 = uint(_968) >= uint(_731);
    float _978 = floor(_956);
    bool _980 = !_970;
    int _982 = _980 ? 0 : (-1);
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _986 = _984 != 0;
    bool _988 = !_976;
    int _990 = _988 ? 0 : (-1);
    float _992 = -_960;
    float _994 = _936 + _992;
    float _996 = _974 * _958;
    bool _998 = !_986;
    int _1000 = _998 ? 0 : 1;
    bool _1002 = _946 > 0.5;
    bool _1004 = _920 > 0.5;
    float _1006 = trunc(_996);
    int _1008 = int(_1006);
    int _1010 = ~_934;
    int _1012 = _1010 + _982;
    int _1014 = _1012 + 1;
    int _1016 = ~_944;
    int _1018 = _1016 + _990;
    int _1020 = _1018 + 1;
    float _1022 = float(_789);
    int _1024 = _739 * _1014;
    int _1026 = _1024 + _789;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1038 = _1036 != 0;
    int _1040 = _731 * _1020;
    int _1042 = _1040 + _771;
    float _1044 = -_225;
    int _1046 = _1002 ? as_type<int>(_1044) : as_type<int>(_225);
    float _1048 = -_215;
    int _1050 = _1004 ? as_type<int>(_1048) : as_type<int>(_215);
    bool _1052 = _1022 >= _958;
    bool _1054 = isnan(_1022);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(_958);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _958 * _950;
    bool _1066 = !_1038;
    float _1068 = _1066 ? _225 : as_type<float>(_1046);
    int _1070 = abs(_1000);
    float _1072 = trunc(_1062);
    int _1074 = int(_1072);
    bool _1076 = !_1034;
    float _1078 = _1076 ? _215 : as_type<float>(_1050);
    float _1080 = float(_731);
    int _1082 = _1008 * _1070;
    int _1084 = _1082 + _789;
    float _1086 = float(_771);
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1098 = _1096 != 0;
    float _1100 = _994 * _1080;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1104 = _1102 != 0;
    float _1106 = trunc(_1064);
    int _1108 = int(_1106);
    bool _1110 = _1086 >= _1080;
    bool _1112 = isnan(_1086);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(_1080);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1080 * _950;
    bool _1124 = !_1094;
    int _1126 = _1124 ? 0 : 1;
    bool _1128 = !_1090;
    int _1130 = _1128 ? 0 : 1;
    bool _1132 = !_1098;
    int _1134 = _1132 ? 0 : 1;
    float _1136 = trunc(_1120);
    int _1138 = int(_1136);
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1146 = _1144 != 0;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1150 = _1148 != 0;
    bool _1152 = !_1104;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1158 = _1156 != 0;
    bool _1160 = !_1142;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = trunc(_1100);
    int _1166 = int(_1164);
    bool _1168 = _739 == 0;
    int _1170 = ~_1074;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    bool _1176 = !_1168;
    int _1178 = _1176 ? _1026 : (-1);
    float _1180 = trunc(_1122);
    int _1182 = int(_1180);
    int _1184 = _739 + (-1);
    bool _1186 = !_1146;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = _1178 * _1174;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1194 = _1192 != 0;
    int _1196 = ~_1138;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    int _1202 = _1074 * _1184;
    int _1204 = _1202 + _1190;
    bool _1206 = !_1194;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = as_type<float>(_1190);
    float _1212 = as_type<float>(_928);
    if (_1158)
    {
        float _1214 = in.m_72.w;
        _1210 = _1214;
    }
    float _1216 = _1210;
    bool _1218 = _731 == 0;
    int _1220 = abs(_1126);
    bool _1222 = !_1218;
    int _1224 = _1222 ? _1042 : (-1);
    int _1226 = abs(_1208);
    int _1228 = _1204 * _1220;
    int _1230 = _731 + (-1);
    int _1232 = _1224 * _1200;
    int _1234 = abs(_1130);
    int _1236 = _1138 * _1230;
    int _1238 = _1236 + _1232;
    int _1240 = abs(_1188);
    int _1242 = _1108 * _1234;
    int _1244 = _1242 + _1228;
    int _1246 = abs(_1162);
    int _1248 = _1166 * _1226;
    int _1250 = _1248 + _771;
    int _1252 = abs(_1134);
    int _1254 = _1238 * _1240;
    float _1256 = _914 * 2.0;
    int _1258 = abs(_1154);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1262 = _1260 != 0;
    int _1264 = _1182 * _1246;
    int _1266 = _1264 + _1254;
    float _1268 = as_type<float>(_1254);
    bool _1270 = _1262;
    float _1272 = as_type<float>(_1246);
    if (_1158)
    {
        float _1274 = _1216 * 3.1415927410125732421875;
        _1268 = _1274;
    }
    float _1276 = _1268;
    bool _1278 = !_1150;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = floor(_1256);
    bool _1284 = !_1262;
    int _1286 = _1284 ? 0 : 1;
    int _1288 = _1084 * _1252;
    int _1290 = _1288 + _1244;
    int _1292 = abs(_1280);
    float _1294 = _1276;
    if (_1158)
    {
        float _1296 = _1276 * 0.15915493667125701904296875;
        _1294 = _1296;
    }
    float _1298 = _1294;
    int _1300 = abs(_1286);
    int _1302 = _1008 * _1258;
    int _1304 = _1302 + _1290;
    float _1306 = as_type<float>(_1008);
    if (_1158)
    {
        float _1308 = _1298 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = float(uint(_1304));
    int _1316 = _1250 * _1292;
    int _1318 = _1316 + _1266;
    float _1320 = 0.0;
    if (!_1158)
    {
        _1320 = _215;
    }
    float _1322 = _1320;
    bool _1324 = _739 == 0;
    int _1326 = _1166 * _1300;
    int _1328 = _1326 + _1318;
    float _1330 = as_type<float>(_793) * _1314;
    float _1332 = -_215;
    int _1334 = _1002 ? as_type<int>(_1332) : as_type<int>(_215);
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1338 = _1336 != 0;
    float _1340 = trunc(_1330);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    float _1346 = float(uint(_1328));
    float _1348 = _1322;
    if (_1158)
    {
        bool _1350 = _1312 > 0.5;
        _1270 = _1350;
    }
    bool _1352 = _1270;
    int _1354 = ~_739;
    int _1356 = _1354 + 1;
    float _1358 = as_type<float>(_781) * _1346;
    if (_1158)
    {
        float _1360 = -_215;
        float _1362 = _1352 ? _1360 : _215;
        _1348 = _1362;
    }
    float _1364 = _1348;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1368 = _1366 != 0;
    int _1370 = ~_731;
    int _1372 = _1370 + 1;
    float _1374 = trunc(_1358);
    float _1376 = precise::max(_1374, 0.0);
    uint _1378 = uint(_1376);
    bool _1380 = !_1338;
    float _1382 = _1380 ? _215 : as_type<float>(_1334);
    int _1384 = _1356 * int(_1344);
    int _1386 = _1384 + _1304;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1390 = float(uint(_1386));
    float _1392 = as_type<float>(_1240);
    if (_1368)
    {
        float _1394 = in.m_72.x;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = 0.0;
    if (!_1368)
    {
        _1398 = _225;
    }
    float _1400 = _1398;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1404 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1388);
    float _1406 = as_type<float>(_793) * _1390;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1410 = _1372 * int(_1378);
    int _1412 = _1410 + _1328;
    float _1414 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1402);
    float _1416 = trunc(_1406);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    float _1422 = _922 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1424 = _924 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1426 = float(uint(_1412));
    float _1428 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1404);
    int _1430 = ~_739;
    int _1432 = _1430 + 1;
    float _1434 = -_1408;
    float _1436 = fma(_1422, 2.0, _1434);
    float _1438 = as_type<float>(_781) * _1426;
    float _1440 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1414);
    float _1442 = trunc(_1438);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1454 = int(_1344) + int(_1420);
    float _1456 = as_type<float>(_1420);
    float _1458 = _1400;
    if (_1368)
    {
        float _1460 = _1396 * 3.1415927410125732421875;
        _1456 = _1460;
    }
    float _1462 = _1456;
    int _1464 = ~_731;
    int _1466 = _1464 + 1;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1470 = _1432 * _1454;
    int _1472 = _1470 + _1304;
    float _1474 = _1462;
    float _1476 = as_type<float>(_1466);
    if (_1368)
    {
        float _1478 = _1462 * 0.15915493667125701904296875;
        _1474 = _1478;
    }
    float _1480 = _1474;
    float _1482 = -_131;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1436);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1488 = uint(_1472) >= uint(_739);
    int _1490 = int(_1378) + int(_1446);
    float _1492 = _1480;
    if (_1368)
    {
        float _1494 = _1480 * 6.283185482025146484375;
        float _1496 = sin(_1494);
        _1492 = _1496;
    }
    float _1498 = _1492;
    float _1500 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1486);
    bool _1502 = !_1488;
    int _1504 = _1502 ? 0 : (-1);
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1510 = _1466 * _1490;
    int _1512 = _1510 + _1328;
    int _1514 = ~_1454;
    int _1516 = _1514 + _1504;
    int _1518 = _1516 + 1;
    float _1520 = -_225;
    int _1522 = _1004 ? as_type<int>(_1520) : as_type<int>(_225);
    float _1524 = 1.0 / _1508;
    bool _1526 = uint(_1512) >= uint(_731);
    int _1528 = _739 * _1518;
    int _1530 = _1528 + _1304;
    bool _1532 = !_1526;
    int _1534 = _1532 ? 0 : (-1);
    bool _1536 = _1526;
    float _1538 = 1.4012984643248170709237295832899e-45;
    if (_1368)
    {
        bool _1540 = _1498 > 0.5;
        _1536 = _1540;
    }
    bool _1542 = _1536;
    bool _1544 = !_1324;
    int _1546 = _1544 ? _1530 : (-1);
    if (_1368)
    {
        float _1548 = -_225;
        float _1550 = _1542 ? _1548 : _225;
        _1458 = _1550;
    }
    float _1552 = _1458;
    int _1554 = ~_1490;
    int _1556 = _1554 + _1534;
    int _1558 = _1556 + 1;
    int _1560 = _1546 & 3;
    bool _1562 = _1560 != 0;
    bool _1564 = _948 > 0.5;
    int _1566 = _731 * _1558;
    int _1568 = _1566 + _1328;
    bool _1570 = uint(_1560) > 1u;
    float _1572 = -_225;
    int _1574 = _1564 ? as_type<int>(_1572) : as_type<int>(_225);
    int _1576 = _1546 & 3;
    bool _1578 = _1576 != 0;
    bool _1580 = !_1218;
    int _1582 = _1580 ? _1568 : (-1);
    int _1584 = _1578 ? 0 : 1;
    int _1586 = _1582 & 3;
    bool _1588 = _1586 != 0;
    int _1590 = ~_1584;
    int _1592 = _1590 + 1;
    int _1594 = _1592 + 1;
    int _1596 = _1594;
    if (!_1570)
    {
        int _1598 = ~_1584;
        int _1600 = _1598 + 1;
        _1596 = _1600;
    }
    int _1602 = _1596;
    bool _1604 = uint(_1586) >= 2u;
    int _1606 = _1604 ? 0 : 1;
    bool _1608 = _1586 != 3;
    int _1610 = ~_1606;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    int _1616 = _1582 & 3;
    bool _1618 = _1616 != 0;
    int _1620 = int(_1608);
    int _1622 = _1618 ? 2 : 0;
    int _1624 = _1620 | _1622;
    int _1626 = _1588 ? 4 : 0;
    int _1628 = _1624 | _1626;
    int _1630 = _1030 ? 8 : 0;
    int _1632 = _1628 | _1630;
    int _1634 = _1562 ? 16 : 0;
    int _1636 = _1632 | _1634;
    int _1638 = _1218 ? 32 : 0;
    int _1640 = _1636 | _1638;
    int _1642 = _1324 ? 64 : 0;
    int _1644 = _1640 | _1642;
    int _1646 = _1644 & 4;
    int _1648 = _1618 ? 0 : 1;
    bool _1650 = uint(_1586) > 1u;
    int _1652 = ~_1648;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1614;
    int _1660 = _1656;
    if (_1608)
    {
        int _1662 = ~_1606;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    int _1668 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1670 = _1668 != 0;
    float _1672 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1674 = int(_1672);
    int _1676 = int(_1670);
    int _1678 = _1650 ? 2 : 0;
    int _1680 = _1676 | _1678;
    int _1682 = _1588 ? 4 : 0;
    int _1684 = _1680 | _1682;
    int _1686 = _1030 ? 8 : 0;
    int _1688 = _1684 | _1686;
    int _1690 = _1562 ? 16 : 0;
    int _1692 = _1688 | _1690;
    int _1694 = _1218 ? 32 : 0;
    int _1696 = _1692 | _1694;
    int _1698 = _1324 ? 64 : 0;
    int _1700 = _1696 | _1698;
    int _1702 = _1700 & 16;
    bool _1704 = !_1670;
    float _1706 = _1704 ? _225 : as_type<float>(_1522);
    if (!_1650)
    {
        int _1708 = ~_1648;
        int _1710 = _1708 + 1;
        _1660 = _1710;
    }
    int _1712 = _1660;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1716 = _1714 != 0;
    float _1718 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1720 = int(_1718);
    bool _1722 = !_1030;
    float _1724 = _1722 ? _225 : as_type<float>(_1574);
    bool _1726 = !_1716;
    int _1728 = _1726 ? 0 : 1;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1732 = _1730 != 0;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1736 = _1734 != 0;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1744 = _1742 != 0;
    int _1746 = abs(_1728);
    float _1748 = float(_1674);
    bool _1750 = !_1732;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = _914 > 0.5;
    float _1756 = 1.0 / _1748;
    float _1758 = float(uint(_1720));
    float _1760 = -_215;
    int _1762 = _1754 ? as_type<int>(_1760) : as_type<int>(_215);
    int _1764 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1766 = _1764 != 0;
    int _1768 = ~_1720;
    int _1770 = _1768 + 1;
    float _1772 = 1.0 / _1758;
    bool _1774 = !_1766;
    float _1776 = _1774 ? _215 : as_type<float>(_1762);
    bool _1778 = _926 != 1;
    bool _1780 = !_1736;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = abs(_1752);
    float _1786 = _1756 * _131;
    int _1788 = abs(_1782);
    int _1790 = ~_1720;
    int _1792 = _1790 + 1;
    float _1794 = trunc(_1786);
    int _1796 = int(_1794);
    bool _1798 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1800 = isnan(_717);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    int _1810 = as_type<int>(_1772) + (-2);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1814 = _1812 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1816 = _1772;
    if (!_1778)
    {
        _1538 = _920;
    }
    float _1818 = _1538;
    float _1820 = _1818;
    if (!_1778)
    {
        _1272 = _920;
    }
    float _1822 = _1272;
    float _1824 = _1822;
    if (!_1778)
    {
        _1816 = _946;
    }
    float _1826 = _1816;
    float _1828 = 1.0 / _1814;
    float _1830 = _1826;
    if (!_1778)
    {
        _1476 = _946;
    }
    float _1832 = _1476;
    float _1834 = _1832;
    if (_1778)
    {
        _1820 = _914;
    }
    float _1836 = _1820;
    if (_1778)
    {
        _1824 = _914;
    }
    float _1838 = _1824;
    float _1840 = float(uint(_1796));
    float _1842 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1778)
    {
        _1830 = _920;
    }
    float _1844 = _1830;
    float _1846 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1468);
    if (_1778)
    {
        _1834 = _920;
    }
    float _1848 = _1834;
    float _1850 = as_type<float>(_1810) * _1840;
    bool _1852 = _928 != 2;
    float _1854 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1856 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1858 = isnan(_717);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = trunc(_1850);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    float _1874 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1876 = _1850;
    if (_1852)
    {
        _1212 = _914;
    }
    float _1878 = _1212;
    float _1880 = _1878;
    if (_1852)
    {
        _1876 = _920;
    }
    float _1882 = _1876;
    float _1884 = _1882;
    if (!_1852)
    {
        _1880 = _946;
    }
    float _1886 = _1880;
    int _1888 = _1770 * int(_1872);
    int _1890 = _1888 + _1796;
    if (!_1852)
    {
        _1884 = _914;
    }
    float _1892 = _1884;
    bool _1894 = _1282 >= 0.0;
    bool _1896 = isnan(_1282);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.0);
    bool _1902 = _1898 || _1900;
    float _1904 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1906 = float(uint(_1890));
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1910 = _1902 ? 0 : 1;
    bool _1912 = _1282 > 0.0;
    float _1914 = as_type<float>(_1810) * _1906;
    int _1916 = ~_1910;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = _946 * 2.0;
    float _1924 = _912 * _930;
    float _1926 = trunc(_1914);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    bool _1932 = !_1744;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = fma(_1908, -2.0, _1452);
    bool _1938 = _1646 != 0;
    bool _1940 = !_1740;
    int _1942 = _1940 ? 0 : 1;
    float _1944 = floor(_1922);
    int _1946 = _1920;
    if (!_1912)
    {
        int _1948 = ~_1910;
        int _1950 = _1948 + 1;
        _1946 = _1950;
    }
    int _1952 = _1946;
    bool _1954 = _978 >= 0.0;
    bool _1956 = isnan(_978);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1968 = !_1938;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1962 ? 0 : 1;
    float _1974 = floor(_1924);
    bool _1976 = _978 > 0.0;
    int _1978 = ~_1720;
    int _1980 = _1978 + 1;
    int _1982 = int(_1872) + int(_1930);
    int _1984 = ~_1972;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    float _1990 = 1.0 / _1966;
    float _1992 = float(_1720);
    int _1994 = _1980 * _1982;
    int _1996 = _1994 + _1796;
    float _1998 = float(_1952);
    int _2000 = _1988;
    if (!_1976)
    {
        int _2002 = ~_1972;
        int _2004 = _2002 + 1;
        _2000 = _2004;
    }
    int _2006 = _2000;
    bool _2008 = uint(_1996) >= uint(_1720);
    float _2010 = -_1974;
    float _2012 = _1924 + _2010;
    float _2014 = float(_1796);
    float _2016 = _1992 * _950;
    bool _2018 = !_2008;
    int _2020 = _2018 ? 0 : (-1);
    bool _2022 = _2014 >= _1992;
    bool _2024 = isnan(_2014);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(_1992);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2036 = _2034 != 0;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2040 = _2038 != 0;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2044 = _2042 != 0;
    float _2046 = _2012 * _1992;
    int _2048 = ~_1982;
    int _2050 = _2048 + _2020;
    int _2052 = _2050 + 1;
    float _2054 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2056 = trunc(_2032);
    int _2058 = int(_2056);
    float _2060 = float(uint(_1084));
    float _2062 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1846);
    bool _2064 = _1944 >= 0.0;
    bool _2066 = isnan(_1944);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan(0.0);
    bool _2072 = _2068 || _2070;
    int _2074 = _1720 * _2052;
    int _2076 = _2074 + _1796;
    bool _2078 = _1944 > 0.0;
    float _2080 = as_type<float>(_793) * _2060;
    int _2082 = _2072 ? 0 : 1;
    float _2084 = trunc(_2046);
    int _2086 = int(_2084);
    bool _2088 = _1720 == 0;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2096 = _2094 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2098 = !_2088;
    int _2100 = _2098 ? _2076 : (-1);
    float _2102 = _2092 * _1524;
    int _2104 = ~_2082;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = trunc(_2080);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    int _2116 = ~_2058;
    int _2118 = _2116 + 1;
    int _2120 = _2118 + 1;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2124 = _2108;
    if (!_2078)
    {
        int _2126 = ~_2082;
        int _2128 = _2126 + 1;
        _2124 = _2128;
    }
    int _2130 = _2124;
    float _2132 = -_2062;
    float _2134 = _2132 + 1.0;
    int _2136 = ~_739;
    int _2138 = _2136 + 1;
    int _2140 = _2100 * _2120;
    float _2142 = -_2122;
    float _2144 = fma(_2054, 2.0, _2142);
    int _2146 = _1720 + (-1);
    float _2148 = trunc(_2016);
    int _2150 = int(_2148);
    float _2152 = float(uint(_1250));
    float _2154 = -_131;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2144);
    bool _2158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2160 = isnan(0.0);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2166 = _2162 || _2164;
    int _2168 = _2058 * _2146;
    int _2170 = _2168 + _2140;
    float _2172 = as_type<float>(_781) * _2152;
    int _2174 = _2138 * int(_2114);
    int _2176 = _2174 + _1084;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2180 = _2178 != 0;
    int _2182 = _2170 * _1788;
    bool _2184 = !_2040;
    int _2186 = _2184 ? 0 : 1;
    int _2188 = _2086 * _1746;
    int _2190 = _2188 + _1796;
    float _2192 = trunc(_2172);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = float(uint(_2176));
    int _2200 = ~_731;
    int _2202 = _2200 + 1;
    int _2204 = _2150 * _1784;
    int _2206 = _2204 + _2182;
    float _2208 = as_type<float>(_793) * _2198;
    int _2210 = abs(_1942);
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2214 = abs(_1934);
    float _2216 = float(uint(_2190));
    int _2218 = _2190 * _2210;
    int _2220 = _2218 + _2206;
    int _2222 = _2202 * int(_2196);
    int _2224 = _2222 + _1250;
    float _2226 = _920 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2228 = _2086 * _2214;
    int _2230 = _2228 + _2220;
    float _2232 = as_type<float>(_1810) * _2216;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2236 = fma(_2226, -2.0, _2212);
    int _2238 = ~_1720;
    int _2240 = _2238 + 1;
    float _2242 = trunc(_2232);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = float(uint(_2224));
    float _2250 = fma(_1424, -2.0, _2234);
    float _2252 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2236);
    float _2254 = float(uint(_2230));
    float _2256 = as_type<float>(_781) * _2248;
    int _2258 = ~_739;
    int _2260 = _2258 + 1;
    float _2262 = trunc(_2208);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2250);
    float _2270 = as_type<float>(_1810) * _2254;
    float _2272 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1874);
    float _2274 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2276 = _1702 != 0;
    bool _2278 = !_2036;
    int _2280 = _2278 ? 0 : 1;
    float _2282 = trunc(_2270);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    int _2288 = _2240 * int(_2246);
    int _2290 = _2288 + _2190;
    int _2292 = abs(_2186);
    float _2294 = -_2272;
    float _2296 = _2294 + 1.0;
    bool _2298 = !_2044;
    int _2300 = _2298 ? 0 : 1;
    float _2302 = float(uint(_2290));
    int _2304 = int(_2114) + int(_2266);
    float _2306 = trunc(_2256);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    float _2312 = as_type<float>(_1810) * _2302;
    float _2314 = float(_2006);
    bool _2316 = _731 == 0;
    int _2318 = _2260 * _2304;
    int _2320 = _2318 + _1084;
    int _2322 = _1792 * int(_2286);
    int _2324 = _2322 + _2230;
    float _2326 = trunc(_2312);
    float _2328 = precise::max(_2326, 0.0);
    uint _2330 = uint(_2328);
    bool _2332 = uint(_2320) >= uint(_739);
    float _2334 = float(uint(_2324));
    int _2336 = int(_2196) + int(_2310);
    float _2338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2340 = log2(_2338);
    float _2342 = as_type<float>(_1810) * _2334;
    int _2344 = ~_731;
    int _2346 = _2344 + 1;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2350 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2352 = !_2332;
    int _2354 = _2352 ? 0 : (-1);
    int _2356 = int(_2246) + int(_2330);
    float _2358 = trunc(_2342);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    int _2364 = _2346 * _2336;
    int _2366 = _2364 + _1250;
    int _2368 = ~_1720;
    int _2370 = _2368 + 1;
    float _2372 = fma(_2350, -2.0, _1448);
    int _2374 = ~_1720;
    int _2376 = _2374 + 1;
    float _2378 = -_2348;
    float _2380 = fma(_1842, 2.0, _2378);
    bool _2382 = uint(_2366) >= uint(_731);
    int _2384 = _2370 * _2356;
    int _2386 = _2384 + _2190;
    float _2388 = _2340 * _131;
    float _2390 = -_131;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2380);
    bool _2394 = !_2382;
    int _2396 = _2394 ? 0 : (-1);
    float _2398 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2372);
    bool _2400 = uint(_2386) >= uint(_1720);
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    int _2406 = int(_2286) + int(_2362);
    float _2408 = -_2402;
    float _2410 = fma(_1904, 2.0, _2408);
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2414 = _2412 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2416 = !_2400;
    int _2418 = _2416 ? 0 : (-1);
    int _2420 = _2376 * _2406;
    int _2422 = _2420 + _2230;
    float _2424 = _1854 * _2404;
    float _2426 = exp2(_2388);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2430 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2432 = isnan(_717);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    bool _2442 = uint(_2422) >= uint(_1720);
    float _2444 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2428);
    float _2446 = 1.0 / _2414;
    float _2448 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2444);
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2452 = !_2442;
    int _2454 = _2452 ? 0 : (-1);
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2458 = 1.0 + _2456;
    float _2460 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2450);
    float _2462 = -_2426;
    float _2464 = _2462 + 1.0;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2468 = 1.0 / _2458;
    bool _2470 = _1586 != 3;
    float _2472 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2474 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2466);
    float _2476 = _2166 ? _2464 : 0.0;
    float _2478 = in.m_58.x;
    float _2480 = in.m_58.y;
    float _2482 = in.m_58.z;
    bool _2484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2486 = isnan(1.0);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1500);
    float _2496 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2474);
    float _2498 = -_131;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2410);
    float _2502 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1936);
    bool _2504 = !_2470;
    int _2506 = _2504 ? 0 : (-1);
    float _2508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    int _2510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2512 = _2510 != 0;
    float _2514 = _2274 * _2508;
    bool _2516 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2518 = isnan(_717);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    if (_2492)
    {
        float _2528 = _2476 * _2468;
        _141 = _2528;
    }
    float _2530 = _141;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2534 = _2532 != 0;
    float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2540 = -_2526;
    float _2542 = _2540 + 1.0;
    float _2544 = -_1866;
    float _2546 = _2544 + 1.0;
    int _2548 = ~_2304;
    int _2550 = _2548 + _2354;
    int _2552 = _2550 + 1;
    float _2554 = 1.0 / _2538;
    float _2556 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2558 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2560 = _2480 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2570 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2556);
    float _2572 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2558);
    float _2574 = fma(_2478, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2560);
    float _2576 = _2564 * _2446;
    float _2578 = 1.0 / _2568;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2584 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2572);
    bool _2586 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2588 = isnan(_717);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = _2582 * _1990;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2604 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2606 = isnan(_717);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    float _2616 = -_2596;
    float _2618 = _2616 + 1.0;
    bool _2620 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2622 = isnan(_717);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2628 = _2624 || _2626;
    float _2630 = float(_2628);
    float _2632 = _2584 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2634 = 1.0 / _2602;
    float _2636 = _2630 * _2618;
    float _2638 = _2096 * _2578;
    float _2640 = -_2630;
    float _2642 = _2640 + 1.0;
    float _2644 = _2614 * _2642;
    float _2646 = -_2614;
    float _2648 = _2646 + 1.0;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2650;
    float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2656 = _2654 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2660 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2658;
    float _2662 = _2526 * _2648;
    float _2664 = _1808 * _2542;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2668 = _717 + _2666;
    float _2670 = _2652 * _2634;
    float _2672 = -_1808;
    float _2674 = _2672 + 1.0;
    bool _2676 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2678 = isnan(_717);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = fma(_2576, _2668, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2690 = _2660 * _2554;
    float _2692 = _2440 * _2674;
    float _2694 = -_2440;
    float _2696 = _2694 + 1.0;
    float _2698 = _2656 * _1828;
    float _2700 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2574);
    float _2702 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2704 = _717 + _2702;
    float _2706 = _1866 * _2696;
    float _2708 = _2686 * _2546;
    float _2710 = -_2686;
    float _2712 = _2710 + 1.0;
    float _2714 = fma(_2482, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2570);
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2718 = _717 + _2716;
    float _2720 = _2688 * _2708;
    float _2722 = fma(_2598, _2704, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2726 = _717 + _2724;
    float _2728 = fma(_2102, _2718, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2730 = fma(_2712, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2720);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2734 = _717 + _2732;
    float _2736 = fma(_2722, _2706, _2730);
    float _2738 = fma(_2638, _2734, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2740 = fma(_2670, _2726, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2742 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2744 = _717 + _2742;
    float _2746 = fma(_2728, _2692, _2736);
    float _2748 = _920 + _914;
    float _2750 = in.m_80.x;
    float _2752 = in.m_80.y;
    float _2754 = in.m_80.z;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2758 = _717 + _2756;
    float _2760 = fma(_2698, _2744, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2762 = _2748 + (-1.0);
    float _2764 = fma(_2738, _2664, _2746);
    int _2766 = abs(_2280);
    float _2768 = _914 + (-0.5);
    float _2770 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2772 = float(_2130);
    float _2774 = fma(_2740, _2662, _2764);
    float _2776 = float(_2766);
    float _2778 = _1364 + 0.5;
    float _2780 = _914 + _946;
    float _2782 = fma(_2760, _2644, _2774);
    int _2784 = abs(_2300);
    float _2786 = _2776 * _2772;
    float _2788 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1484);
    float _2790 = _920 + _946;
    float _2792 = fma(_2690, _2758, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2794 = _2786 * (-2.0);
    float _2796 = _2790 + (-1.0);
    float _2798 = fma(_2794, _2750, _2750);
    float _2800 = float(_2292);
    float _2802 = fma(_2770, _2794, _2770);
    float _2804 = _920 + (-0.5);
    float _2806 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2798);
    float _2808 = fma(_2796, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2810 = _2800 * _1998;
    float _2812 = fma(_2802, _2530, _2806);
    float _2814 = _1776 + 0.5;
    float _2816 = _2810 * (-2.0);
    float _2818 = float(_2784);
    float _2820 = _1552 + (-0.5);
    float _2822 = fma(_2814, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2156);
    float _2824 = _2812 * 0.15915493667125701904296875;
    float _2826 = fma(_2816, _2752, _2752);
    float _2828 = _2818 * _2314;
    float _2830 = -_1428;
    float _2832 = _2830 + 1.0;
    float _2834 = -_2820;
    float _2836 = -_2268;
    float _2838 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2836);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2842 = -_1440;
    float _2844 = _2842 + 1.0;
    float _2846 = fma(_2808, _2816, _2808);
    float _2848 = fma(_2804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2826);
    float _2850 = _2780 + (-1.0);
    float _2852 = _2828 * (-2.0);
    float _2854 = -_2832;
    float _2856 = fma(_2854, _1364, _2788);
    float _2858 = fma(_2844, _1552, _2838);
    float _2860 = fma(_2846, _2530, _2848);
    float _2862 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2866 = fma(_2852, _2754, _2754);
    float _2868 = _946 + (-0.5);
    float _2870 = _2860 * 0.15915493667125701904296875;
    float _2872 = fma(_2862, _2852, _2862);
    float _2874 = _1382 + 0.5;
    float _2876 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2866);
    float _2878 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_82.x = _2856;
    out.m_82.y = _2858;
    float _2880 = _2824 * 6.283185482025146484375;
    float _2882 = sin(_2880);
    float _2884 = fma(_2872, _2530, _2876);
    float _2886 = fma(_2878, _2874, _2392);
    float _2888 = _1706 + (-0.5);
    int _2890 = ~_2336;
    int _2892 = _2890 + _2396;
    int _2894 = _2892 + 1;
    float _2896 = _2884 * 0.15915493667125701904296875;
    int _2898 = _1582 >> 31;
    float _2900 = _2864 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2902 = _2824 * 6.283185482025146484375;
    float _2904 = cos(_2902);
    float _2906 = -_2448;
    float _2908 = _2906 + 1.0;
    float _2910 = _1724 + (-0.5);
    float _2912 = -_2888;
    float _2914 = -_2252;
    float _2916 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2914);
    float _2918 = -_2134;
    float _2920 = fma(_1382, _2918, _2886);
    int _2922 = ~_2356;
    int _2924 = _2922 + _2418;
    int _2926 = _2924 + 1;
    float _2928 = -_2900;
    float _2930 = -_2398;
    float _2932 = fma(_2928, _2910, _2930);
    float _2934 = -_2472;
    float _2936 = _2934 + 1.0;
    float _2938 = _2870 * 6.283185482025146484375;
    float _2940 = sin(_2938);
    int _2942 = _2898 & 3;
    float _2944 = fma(_1706, _2908, _2916);
    float _2946 = -_2936;
    float _2948 = fma(_1776, _2946, _2822);
    float _2950 = fma(_1724, _2296, _2932);
    int _2952 = _1582 + _2942;
    int _2954 = _739 * _2552;
    int _2956 = _2954 + _1084;
    float _2958 = fma(_2792, _2636, _2782);
    float _2960 = _2870 * 6.283185482025146484375;
    float _2962 = cos(_2960);
    out.m_84.x = _2948;
    out.m_84.y = _2944;
    out.m_84.z = _2920;
    out.m_84.w = _2950;
    int _2964 = _731 * _2894;
    int _2966 = _2964 + _1250;
    float _2968 = fma(_2596, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2958);
    int _2970 = _1720 * _2926;
    int _2972 = _2970 + _2190;
    bool _2974 = !_2316;
    int _2976 = _2974 ? _2966 : (-1);
    float _2978 = _2896 * 6.283185482025146484375;
    float _2980 = cos(_2978);
    float _2982 = _2882 * _2940;
    float _2984 = _2904 * _2940;
    out.m_86.x = _2968;
    int _2986 = _2952 >> 2;
    float _2988 = _2896 * 6.283185482025146484375;
    float _2990 = sin(_2988);
    float _2992 = _2882 * _2962;
    int _2994 = _2986 << 4;
    int _2996 = _2994 + 656;
    float _2998 = _2882 * _2980;
    float _3000 = _2904 * _2962;
    float _3002 = _2904 * _2980;
    float _3004 = _2962 * _2980;
    float _3006 = _2998 * _2514;
    float _3008 = _2940 * _2980;
    float _3010 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3012 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3014 = -_2984;
    float _3016 = fma(_2990, _2992, _3014);
    float _3018 = -_2992;
    float _3020 = fma(_2990, _2984, _3018);
    float _3022 = fma(_2990, _3000, _2982);
    float _3024 = fma(_2990, _2982, _3000);
    float _3026 = -_2514;
    float _3028 = _2990 * _3026;
    float _3030 = _3002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _3032 = uint(int(uint(_2996) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c9)._m0[int(_3042)][_3044];
    float _3048 = _3002 * _2514;
    float _3050 = fma(_3004, _2424, _3028);
    float _3052 = -_2990;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3030);
    float _3056 = fma(_3016, _2424, _3006);
    float _3058 = fma(_3022, _2424, _3048);
    float _3060 = -_2990;
    float _3062 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3010);
    float _3064 = -_2990;
    float _3066 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3012);
    float _3068 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3070 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3054);
    float _3072 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3062);
    float _3074 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3066);
    float _3076 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3080 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3068);
    float _3082 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3084 = _2996 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    float _3102 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3076);
    float _3104 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3078);
    float _3106 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3108 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3110 = _3020 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3112 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3082);
    float _3114 = fma(_3008, _3106, _3050);
    float _3116 = fma(_3020, _3106, _3058);
    float _3118 = fma(_3024, _3106, _3056);
    float _3120 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3104);
    float _3122 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3108);
    float _3124 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3080);
    float _3126 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3110);
    float _3128 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3130 = abs(_1712);
    float _3132 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3134 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3126);
    int _3136 = abs(_1970);
    float _3138 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3102);
    int _3140 = ~_3130;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    float _3146 = _3128 * _3072;
    int _3148 = ~_3136;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3112);
    float _3156 = _3128 * _3070;
    out.m_88.x = _3138;
    out.m_88.y = _3120;
    out.m_88.z = _3124;
    float _3158 = fma(_3132, _3120, _3146);
    int _3160 = abs(_2506);
    float _3162 = fma(_3132, _3138, _3156);
    float _3164 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3122);
    float _3166 = _3128 * _3074;
    int _3168 = _3144 * as_type<int>(_3046);
    int _3170 = ~_2406;
    int _3172 = _3170 + _2454;
    int _3174 = _3172 + 1;
    float _3176 = fma(_3132, _3124, _3166);
    float _3178 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3180 = int(_3178);
    int _3182 = _3152 * as_type<int>(_3038);
    int _3184 = _3182 + _3168;
    int _3186 = abs(_1666);
    float _3188 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3190 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3192 = _1720 * _3174;
    int _3194 = _3192 + _2230;
    int _3196 = ~_3186;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    float _3202 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3188);
    float _3204 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3190);
    int _3206 = ~_3160;
    int _3208 = _3206 + 1;
    int _3210 = _3208 + 1;
    float _3212 = _3116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3214 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3202);
    bool _3216 = !_2088;
    float _3218 = _3216 ? as_type<float>(_3194) : as_type<float>(0xffffffffu /* nan */);
    int _3220 = _3200 * as_type<int>(_3092);
    int _3222 = _3220 + _3184;
    float _3224 = _2714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _3226 = _1546 >> 31;
    float _3228 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3212);
    int _3230 = _3210 * as_type<int>(_3100);
    int _3232 = _3230 + _3222;
    float _3234 = _3214 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3236 = as_type<int>(_3218) >> 31;
    float _3238 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3228);
    int _3240 = _3226 & 3;
    float _3242 = _3224 + _3234;
    bool _3244 = !_2180;
    int _3246 = _3244 ? 0 : 1;
    float _3248 = _3238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3250 = _1546 + _3240;
    float _3252 = _2700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _3254 = abs(_3246);
    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3258 = _3242 + _3256;
    int _3260 = _3236 & 3;
    float _3262 = _3252 + _3248;
    int _3264 = abs(_3180);
    float _3266 = _3258 * _3258;
    int _3268 = as_type<int>(_3218) + _3260;
    float _3270 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3272 = _3262 + _3270;
    bool _3274 = uint(_1560) >= 2u;
    float _3276 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3204);
    int _3278 = _3268 >> 2;
    float _3280 = _3272 * _3272;
    float _3282 = float(uint(_3180));
    float _3284 = _3276 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3286 = _3278 << 4;
    int _3288 = _3286 + 800;
    float _3290 = _3266 + _3280;
    float _3292 = float(uint(_3264));
    float _3294 = 1.0 / _3282;
    uint _3296 = uint(int(uint(_3288) >> uint(2)));
    uint _3298 = uint(int(uint(int(_3296)) >> uint(2)));
    int _3300 = int(_3296) & 3;
    float _3302 = (*spvDescriptorSet0.vp_c9)._m0[int(_3298)][_3300];
    int _3304 = int(_3296) + 1;
    uint _3306 = uint(int(uint(_3304) >> uint(2)));
    int _3308 = _3304 & 3;
    float _3310 = (*spvDescriptorSet0.vp_c9)._m0[int(_3306)][_3308];
    int _3312 = _3274 ? 0 : 1;
    float _3314 = _2632 + _3284;
    bool _3316 = _1560 != 3;
    int _3318 = ~_3254;
    int _3320 = _3318 + 1;
    int _3322 = _3320 + 1;
    float _3324 = 1.0 / _3292;
    int _3326 = ~_3312;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    int _3332 = _3232 * _3322;
    int _3334 = _3250 >> 2;
    int _3336 = as_type<int>(_3218) & 3;
    bool _3338 = _3336 != 0;
    int _3340 = _2976 * _3254;
    int _3342 = _3340 + _3332;
    float _3344 = sqrt(_3290);
    int _3346 = _3330;
    float _3348 = _3284;
    float _3350 = _3242;
    float _3352 = _3218;
    float _3354 = _3262;
    if (_3316)
    {
        int _3356 = ~_3312;
        int _3358 = _3356 + 1;
        _3346 = _3358;
    }
    int _3360 = _3346;
    int _3362 = _3334 << 4;
    int _3364 = _3362 + 368;
    int _3366 = abs(_3342);
    int _3368 = as_type<int>(_3294) + (-2);
    uint _3370 = uint(int(uint(_3364) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    float _3386 = float(uint(_3342));
    int _3388 = as_type<int>(_3324) + (-2);
    float _3390 = float(uint(_3366));
    int _3392 = _3338 ? 0 : 1;
    int _3394 = _3364 + 8;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c9)._m0[int(_3406)][_3408];
    bool _3412 = _3344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3414 = as_type<float>(_3388) * _3390;
    bool _3416 = !_2276;
    int _3418 = _3416 ? 0 : 1;
    bool _3420 = _1560 != 3;
    int _3422 = ~_3180;
    int _3424 = _3422 + 1;
    float _3426 = as_type<float>(_3368) * _3386;
    float _3428 = trunc(_3414);
    float _3430 = precise::max(_3428, 0.0);
    uint _3432 = uint(_3430);
    int _3434 = as_type<int>(_3218) & 3;
    bool _3436 = _3434 != 0;
    int _3438 = ~_3264;
    int _3440 = _3438 + 1;
    float _3442 = _3294;
    if (!_3412)
    {
        _3348 = _3242;
    }
    float _3444 = _3348;
    float _3446 = _3444;
    if (!_3412)
    {
        _3350 = _3262;
    }
    float _3448 = _3350;
    float _3450 = trunc(_3426);
    float _3452 = precise::max(_3450, 0.0);
    uint _3454 = uint(_3452);
    float _3456 = _3448;
    if (!_3412)
    {
        _3352 = _3280;
    }
    float _3458 = _3352;
    float _3460 = _3458;
    if (!_3412)
    {
        _3442 = _3266;
    }
    float _3462 = _3442;
    float _3464 = _3462;
    if (!_3412)
    {
        _3354 = _3314;
    }
    float _3466 = _3354;
    int _3468 = ~_3392;
    int _3470 = _3468 + 1;
    int _3472 = _3470 + 1;
    bool _3474 = uint(_3434) > 1u;
    bool _3476 = !_3412;
    float _3478 = _3466;
    int _3480 = _3472;
    if (!_3476)
    {
        float _3482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3486 = _3344 + _3484;
        float _3488 = rsqrt(_3290);
        float _3490 = _3486 * _3482;
        float _3492 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3494 = _3490 * 0.15915493667125701904296875;
        float _3496 = _3494 * 6.283185482025146484375;
        float _3498 = sin(_3496);
        float _3500 = _3494 * 6.283185482025146484375;
        float _3502 = cos(_3500);
        float _3504 = fma(_3498, _3492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3506 = _3488 * _3504;
        float _3508 = _3502 + (-1.0);
        float _3510 = fma(_3258, _3506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3512 = fma(_3272, _3506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3514 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3518 = _3510 + _3516;
        float _3520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3522 = _3512 + _3520;
        float _3524 = fma(_3314, _3502, _3514);
        float _3526 = _3518 * _3518;
        float _3528 = _3522 * _3522;
        _3478 = _3524;
        _3464 = _3526;
        _3460 = _3528;
        _3446 = _3510;
        _3456 = _3512;
    }
    float _3530 = _3478;
    float _3532 = _3464;
    float _3534 = _3460;
    float _3536 = _3446;
    float _3538 = _3456;
    int _3540 = _3288 + 8;
    uint _3542 = uint(int(uint(_3540) >> uint(2)));
    uint _3544 = uint(int(uint(int(_3542)) >> uint(2)));
    int _3546 = int(_3542) & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    int _3550 = int(_3542) + 1;
    uint _3552 = uint(int(uint(_3550) >> uint(2)));
    int _3554 = _3550 & 3;
    float _3556 = (*spvDescriptorSet0.vp_c9)._m0[int(_3552)][_3554];
    if (!_3474)
    {
        int _3558 = ~_3392;
        int _3560 = _3558 + 1;
        _3480 = _3560;
    }
    int _3562 = _3480;
    float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3566 = _3530 + _3564;
    int _3568 = _3440 * int(_3432);
    int _3570 = _3568 + _3366;
    int _3572 = abs(_1602);
    float _3574 = fma(_3566, _3566, _3532);
    bool _3576 = !_3436;
    int _3578 = _3576 ? 0 : 1;
    int _3580 = _3424 * int(_3454);
    int _3582 = _3580 + _3342;
    float _3584 = float(uint(_3570));
    float _3586 = -_2494;
    float _3588 = _3586 + 1.0;
    bool _3590 = _3434 != 3;
    float _3592 = -_2496;
    float _3594 = _3592 + 1.0;
    float _3596 = float(uint(_3582));
    float _3598 = as_type<float>(_3388) * _3584;
    int _3600 = ~_3572;
    int _3602 = _3600 + 1;
    int _3604 = _3602 + 1;
    bool _3606 = uint(_3434) >= 2u;
    float _3608 = as_type<float>(_3368) * _3596;
    int _3610 = abs(_3562);
    float _3612 = trunc(_3598);
    float _3614 = precise::max(_3612, 0.0);
    uint _3616 = uint(_3614);
    int _3618 = abs(_3418);
    int _3620 = _3604 * as_type<int>(_3384);
    int _3622 = abs(_3360);
    int _3624 = ~_3610;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    int _3630 = abs(_3578);
    float _3632 = trunc(_3608);
    float _3634 = precise::max(_3632, 0.0);
    uint _3636 = uint(_3634);
    int _3638 = _3606 ? 0 : 1;
    int _3640 = _3628 * as_type<int>(_3310);
    int _3642 = ~_3618;
    int _3644 = _3642 + 1;
    int _3646 = _3644 + 1;
    float _3648 = _3574 + _3534;
    int _3650 = ~_3630;
    int _3652 = _3650 + 1;
    int _3654 = _3652 + 1;
    int _3656 = _3646 * as_type<int>(_3376);
    int _3658 = _3656 + _3620;
    int _3660 = ~_3638;
    int _3662 = _3660 + 1;
    int _3664 = _3662 + 1;
    bool _3666 = _3434 != 3;
    int _3668 = _3654 * as_type<int>(_3302);
    int _3670 = _3668 + _3640;
    int _3672 = _3664;
    float _3674 = _3648;
    if (_3590)
    {
        int _3676 = ~_3638;
        int _3678 = _3676 + 1;
        _3672 = _3678;
    }
    int _3680 = _3672;
    int _3682 = int(_3432) + int(_3616);
    int _3684 = ~_3264;
    int _3686 = _3684 + 1;
    int _3688 = ~_3622;
    int _3690 = _3688 + 1;
    int _3692 = _3690 + 1;
    int _3694 = abs(_3680);
    int _3696 = _3686 * _3682;
    int _3698 = _3696 + _3366;
    bool _3700 = !_3666;
    int _3702 = _3700 ? 0 : (-1);
    int _3704 = _3692 * as_type<int>(_3402);
    int _3706 = _3704 + _3658;
    bool _3708 = !_3420;
    int _3710 = _3708 ? 0 : (-1);
    float _3712 = fma(_3128, _3128, 1.0);
    int _3714 = ~_3694;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    int _3720 = abs(_3702);
    int _3722 = ~_3180;
    int _3724 = _3722 + 1;
    int _3726 = _3718 * as_type<int>(_3548);
    int _3728 = _3726 + _3670;
    int _3730 = int(_3454) + int(_3636);
    float _3732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3734 = uint(_3698) >= uint(_3264);
    int _3736 = abs(_3710);
    int _3738 = _3724 * _3730;
    int _3740 = _3738 + _3342;
    int _3742 = ~_3720;
    int _3744 = _3742 + 1;
    int _3746 = _3744 + 1;
    int _3748 = ~_3736;
    int _3750 = _3748 + 1;
    int _3752 = _3750 + 1;
    float _3754 = rsqrt(_3712);
    bool _3756 = uint(_3740) >= uint(_3180);
    int _3758 = _3746 * as_type<int>(_3556);
    int _3760 = _3758 + _3728;
    int _3762 = _3342 ^ _3180;
    int _3764 = _3752 * as_type<int>(_3410);
    int _3766 = _3764 + _3706;
    bool _3768 = !_3734;
    int _3770 = _3768 ? 0 : (-1);
    uint _3772 = uint(int(uint(_3762) >> uint(31)));
    float _3774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3776 = !_3756;
    int _3778 = _3776 ? 0 : (-1);
    bool _3780 = !_2534;
    int _3782 = _3780 ? 0 : 1;
    int _3784 = ~_3770;
    int _3786 = _3682 + _3784;
    int _3788 = _3786 + 1;
    int _3790 = ~int(_3772);
    int _3792 = _3790 + 1;
    int _3794 = ~_3730;
    int _3796 = _3794 + _3778;
    int _3798 = _3796 + 1;
    int _3800 = abs(_3782);
    bool _3802 = !_2512;
    int _3804 = _3802 ? 0 : 1;
    int _3806 = _3180 * _3798;
    int _3808 = _3806 + _3342;
    int _3810 = _3788 ^ _3792;
    int _3812 = ~_3800;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    int _3818 = abs(_3804);
    bool _3820 = _3180 == 0;
    int _3822 = _3766 * _3816;
    bool _3824 = _3180 == 0;
    int _3826 = ~_3792;
    int _3828 = _3826 + _3810;
    int _3830 = _3828 + 1;
    int _3832 = ~_3818;
    int _3834 = _3832 + 1;
    int _3836 = _3834 + 1;
    bool _3838 = !_3820;
    int _3840 = _3838 ? _3808 : (-1);
    bool _3842 = !_3824;
    int _3844 = _3842 ? _3830 : (-1);
    int _3846 = _3760 * _3836;
    float _3848 = float(_3840);
    float _3850 = _3732 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3852 = _739 == 0;
    float _3854 = _3774 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3856 = float(_3844);
    float _3858 = fma(_3850, _3848, _2500);
    bool _3860 = !_3852;
    int _3862 = _3860 ? _2956 : (-1);
    float _3864 = _1078 + 0.5;
    bool _3866 = !_2088;
    int _3868 = _3866 ? _2972 : (-1);
    float _3870 = -_2502;
    float _3872 = fma(_3854, _3856, _3870);
    float _3874 = _1068 + (-0.5);
    int _3876 = _3862 * _3800;
    int _3878 = _3876 + _3822;
    float _3880 = fma(_3850, _3864, _3858);
    float _3882 = _3128 * _3754;
    float _3884 = -_3854;
    float _3886 = fma(_3884, _3874, _3872);
    int _3888 = _3868 * _3818;
    int _3890 = _3888 + _3846;
    float _3892 = -_3588;
    float _3894 = fma(_1078, _3892, _3880);
    float _3896 = -_3154;
    float _3898 = _3882 * _3896;
    float _3900 = fma(_1068, _3594, _3886);
    float _3902 = -_3164;
    float _3904 = _3882 * _3902;
    float _3906 = sqrt(_3648);
    float _3908 = -_3134;
    float _3910 = _3882 * _3908;
    float _3912 = fma(_3754, _3070, _3898);
    float _3914 = fma(_3754, _3072, _3904);
    float _3916 = float(_3890);
    float _3918 = fma(_3754, _3074, _3910);
    float _3920 = _3154 + _3162;
    float _3922 = float(_3878);
    float _3924 = _3164 + _3158;
    float _3926 = _3134 + _3176;
    out.m_90.x = _3912;
    out.m_90.y = _3914;
    out.m_90.z = _3918;
    out.m_92.x = _3922;
    bool _3928 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3930 = isnan(_3906);
    bool _3932 = _3928 || _3930;
    bool _3934 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3936 = _3932 || _3934;
    out.m_92.w = _3916;
    out.m_94.x = _3894;
    out.m_94.y = _3900;
    out.m_96.x = _3920;
    out.m_96.y = _3924;
    out.m_96.z = _3926;
    int _3938 = as_type<int>(_3754);
    float _3940 = as_type<float>(_3800);
    if (!_3936)
    {
        _3674 = 1.0;
    }
    float _3942 = _3674;
    bool _3944 = !_3936;
    float _3946 = _3942;
    if (!_3944)
    {
        bool _3948 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3950 = isnan(_3906);
        bool _3952 = _3948 || _3950;
        bool _3954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3956 = _3952 || _3954;
        if (!_3956)
        {
            float _3958 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3960 = _3906 + _3958;
            float _3962 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3964 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3962;
            float _3966 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3968 = _3966 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3970 = 1.0 / _3964;
            float _3972 = _3960 * _3970;
            float _3974 = fma(_3972, _3968, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3946 = _3974;
            _3976 = true;
        }
        else
        {
            bool _3978 = _3906 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3980 = isnan(_3906);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3986 = _3982 || _3984;
            if (!_3986)
            {
                float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3990 = _3906 + _3988;
                float _3992 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3994 = _3992 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3996 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3998 = _3996 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4000 = 1.0 / _3994;
                float _4002 = _3990 * _4000;
                float _4004 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3946 = _4004;
                _3976 = true;
            }
            else
            {
                _3946 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3976 = false;
    float _4006 = _3946;
    float _4008 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4010 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4012 = floor(_4008);
    float _4014 = floor(_4010);
    float _4016 = -_4012;
    float _4018 = _4008 + _4016;
    float _4020 = -_4014;
    float _4022 = _4010 + _4020;
    float2 _11447 = float2(_4018, _4022);
    float _4024 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11447, float2(0.0), isnan(_11447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11447, float2(0.0), isnan(_11447)), level(0.0)).x;
    float _4026 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4028 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4030 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4032 = _3530 + _4030;
    float _4034 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4026);
    float _4036 = _2632 + _4028;
    float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4040 = _3536 + _4038;
    float _4042 = fma(_4032, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4044 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4034);
    float _4046 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4048 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4050 = _4044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4052 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4046);
    float _4054 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4056 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4048);
    float _4058 = 1.0 / _4050;
    float _4060 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4052);
    float _4062 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4054);
    float _4064 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4056);
    float _4066 = fma(_4040, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4068 = _4060 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4070 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4062);
    float _4072 = _4064 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4074 = -_2632;
    float _4076 = _4074 + _4042;
    float _4078 = _4068 + _4050;
    float _4080 = _4070 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4082 = trunc(_4072);
    int _4084 = int(_4082);
    float _4086 = -_3224;
    float _4088 = _4086 + _4066;
    float _4090 = _4076 * _4076;
    float _4092 = _4078 * _4058;
    float _4094 = _4092 * 0.5;
    float _4096 = fma(_4088, _4088, _4090);
    float _4098 = trunc(_4080);
    int _4100 = int(_4098);
    float _4102 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4104 = fma(_4094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4102);
    float _4106 = 1.0 / _4104;
    int _4108 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4110 = _4084 + _4108;
    int _4112 = _4110 + 1;
    int _4114 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4116 = _4100 + _4114;
    int _4118 = _4116 + 1;
    int _4120 = _4112 | _4118;
    float _4122 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4124 = _4106 * _4122;
    bool _4126 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4128 = _4124 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4130 = !_4126;
    int _4132 = _4130 ? 0 : 1;
    int _4134 = 2;
    int _4136 = _4118;
    int _4138 = _4112;
    float _4140 = _4032;
    float _4142 = _4066;
    if (!_4126)
    {
        _4134 = 1;
    }
    int _4144 = _4134;
    int _4146 = _4144;
    if (!_4128)
    {
        _4146 = _4132;
    }
    int _4148 = _4146;
    float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4152 = _3538 + _4150;
    bool _4154 = _4112 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4156 = _4148 << 6;
    float _4158 = fma(_4152, _4006, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4160 = _4120 < 0;
    bool _4162 = _4160 || _4154;
    int _4164 = _4156 + 96;
    uint _4166 = uint(int(uint(_4164) >> uint(2)));
    uint _4168 = uint(int(uint(int(_4166)) >> uint(2)));
    int _4170 = int(_4166) & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    int _4174 = int(_4166) + 1;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    int _4178 = _4174 & 3;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[int(_4176)][_4178];
    float _4182 = -_3252;
    float _4184 = _4182 + _4158;
    bool _4186 = _4118 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4188 = _4186 || _4162;
    float _4190 = fma(_4184, _4184, _4096);
    int _4192 = _4156 + 104;
    uint _4194 = uint(int(uint(_4192) >> uint(2)));
    uint _4196 = uint(int(uint(int(_4194)) >> uint(2)));
    int _4198 = int(_4194) & 3;
    float _4200 = (*spvDescriptorSet0.vp_c15)._m0[int(_4196)][_4198];
    int _4202 = int(_4194) + 1;
    uint _4204 = uint(int(uint(_4202) >> uint(2)));
    int _4206 = _4202 & 3;
    float _4208 = (*spvDescriptorSet0.vp_c15)._m0[int(_4204)][_4206];
    float _4210 = sqrt(_4190);
    if (!_4188)
    {
        int _4212 = _4118 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4214 = _4212 + _4112;
        _3938 = _4214;
    }
    int _4216 = _3938;
    int _4218 = _4156 + 48;
    uint _4220 = uint(int(uint(_4218) >> uint(2)));
    uint _4222 = uint(int(uint(int(_4220)) >> uint(2)));
    int _4224 = int(_4220) & 3;
    float _4226 = (*spvDescriptorSet0.vp_c15)._m0[int(_4222)][_4224];
    int _4228 = int(_4220) + 1;
    uint _4230 = uint(int(uint(_4228) >> uint(2)));
    int _4232 = _4228 & 3;
    float _4234 = (*spvDescriptorSet0.vp_c15)._m0[int(_4230)][_4232];
    float _4236 = _3538;
    if (!_4188)
    {
        float _4238 = floor(_4072);
        _4236 = _4238;
    }
    float _4240 = _4236;
    if (!_4188)
    {
        int _4242 = _4216 << 2;
        _4136 = _4242;
    }
    int _4244 = _4136;
    int _4246 = _4244;
    if (!_4188)
    {
        uint _4248 = uint(int(uint(_4216) >> uint(2)));
        _4138 = int(_4248);
    }
    int _4250 = _4138;
    if (!_4188)
    {
        int _4252 = 12 & _4244;
        _4246 = _4252;
    }
    int _4254 = _4246;
    int _4256 = _4156 + 64;
    uint _4258 = uint(int(uint(_4256) >> uint(2)));
    uint _4260 = uint(int(uint(int(_4258)) >> uint(2)));
    int _4262 = int(_4258) & 3;
    float _4264 = (*spvDescriptorSet0.vp_c15)._m0[int(_4260)][_4262];
    int _4266 = int(_4258) + 1;
    uint _4268 = uint(int(uint(_4266) >> uint(2)));
    int _4270 = _4266 & 3;
    float _4272 = (*spvDescriptorSet0.vp_c15)._m0[int(_4268)][_4270];
    bool _4274 = _4210 > 0.0;
    if (!_4188)
    {
        int _4276 = _4250 << 4;
        int _4278 = _4276 + _4254;
        _4140 = as_type<float>(_4278);
    }
    float _4280 = _4140;
    int _4282 = _4156 + 56;
    uint _4284 = uint(int(uint(_4282) >> uint(2)));
    uint _4286 = uint(int(uint(int(_4284)) >> uint(2)));
    int _4288 = int(_4284) & 3;
    float _4290 = (*spvDescriptorSet0.vp_c15)._m0[int(_4286)][_4288];
    int _4292 = int(_4284) + 1;
    uint _4294 = uint(int(uint(_4292) >> uint(2)));
    int _4296 = _4292 & 3;
    float _4298 = (*spvDescriptorSet0.vp_c15)._m0[int(_4294)][_4296];
    bool _4300 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4302 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4304 = _4300 || _4302;
    bool _4306 = isnan(0.5);
    bool _4308 = _4304 || _4306;
    float _4310 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4274)
    {
        _3940 = _4066;
    }
    float _4312 = _3940;
    int _4314 = _4156 + 72;
    uint _4316 = uint(int(uint(_4314) >> uint(2)));
    uint _4318 = uint(int(uint(int(_4316)) >> uint(2)));
    int _4320 = int(_4316) & 3;
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[int(_4318)][_4320];
    int _4324 = int(_4316) + 1;
    uint _4326 = uint(int(uint(_4324) >> uint(2)));
    int _4328 = _4324 & 3;
    float _4330 = (*spvDescriptorSet0.vp_c15)._m0[int(_4326)][_4328];
    float _4332 = _4312;
    float _4334 = _4312;
    if (!_4274)
    {
        _4310 = _4158;
    }
    float _4336 = _4310;
    float _4338 = _4036 * _4180;
    int _4340 = _4156 + 80;
    uint _4342 = uint(int(uint(_4340) >> uint(2)));
    uint _4344 = uint(int(uint(int(_4342)) >> uint(2)));
    int _4346 = int(_4342) & 3;
    float _4348 = (*spvDescriptorSet0.vp_c15)._m0[int(_4344)][_4346];
    int _4350 = int(_4342) + 1;
    uint _4352 = uint(int(uint(_4350) >> uint(2)));
    int _4354 = _4350 & 3;
    float _4356 = (*spvDescriptorSet0.vp_c15)._m0[int(_4352)][_4354];
    float _4358 = fma(_3224, _4172, _4338);
    float _4360 = fma(_3252, _4200, _4358);
    int _4362 = _4156 + 88;
    uint _4364 = uint(int(uint(_4362) >> uint(2)));
    uint _4366 = uint(int(uint(int(_4364)) >> uint(2)));
    int _4368 = int(_4364) & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    int _4372 = int(_4364) + 1;
    uint _4374 = uint(int(uint(_4372) >> uint(2)));
    int _4376 = _4372 & 3;
    float _4378 = (*spvDescriptorSet0.vp_c15)._m0[int(_4374)][_4376];
    float _4380 = _4360 + _4208;
    float _4382 = _4036 * _4234;
    float _4384 = _4280;
    float _4386 = _4382;
    float _4388 = _4336;
    float _4390 = _4240;
    if (!_4188)
    {
        int _4392 = as_type<int>(_4280) + 400;
        uint _4394 = uint(int(uint(_4392) >> uint(2)));
        uint _4396 = uint(int(uint(int(_4394)) >> uint(2)));
        int _4398 = int(_4394) & 3;
        float _4400 = (*spvDescriptorSet0.vp_c15)._m0[int(_4396)][_4398];
        _4384 = _4400;
    }
    float _4402 = _4384;
    float _4404 = 1.0 / _4380;
    float _4406 = fma(_3224, _4226, _4382);
    if (!_4274)
    {
        _4386 = _4042;
    }
    float _4408 = _4386;
    float _4410 = _4036 * _4272;
    float _4412 = fma(_3224, _4264, _4410);
    bool _4414 = !_4274;
    float _4416 = _4408;
    float _4418 = _4322;
    float _4420 = _4402;
    if (!_4414)
    {
        float _4422 = _221 * _221;
        float _4424 = rsqrt(_4190);
        float _4426 = fma(_219, _219, _4422);
        float _4428 = fma(_217, _217, _4426);
        float _4430 = sqrt(_4428);
        float _4432 = _4088 * _4424;
        float _4434 = _4076 * _4424;
        float _4436 = _4184 * _4424;
        bool _4438 = _4430 > 0.0;
        float _4440 = _4430;
        float _4442 = _4424;
        if (!_4438)
        {
            _4332 = _4066;
        }
        float _4444 = _4332;
        _4334 = _4444;
        if (!_4438)
        {
            _4440 = _4042;
        }
        float _4446 = _4440;
        _4416 = _4446;
        if (!_4438)
        {
            _4442 = _4158;
        }
        float _4448 = _4442;
        bool _4450 = !_4438;
        _4388 = _4448;
        if (!_4450)
        {
            float _4452 = rsqrt(_4428);
            float _4454 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4456 = _221 * _4452;
            float _4458 = _219 * _4452;
            float _4460 = _217 * _4452;
            float _4462 = _4434 * _4456;
            float _4464 = fma(_4432, _4458, _4462);
            float _4466 = _4454 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4468 = fma(_4436, _4460, _4464);
            float _4470 = _4468 * _4466;
            float _4472 = fma(_219, _4470, _4066);
            float _4474 = fma(_221, _4470, _4042);
            float _4476 = fma(_217, _4470, _4158);
            _4334 = _4472;
            _4416 = _4474;
            _4388 = _4476;
        }
    }
    float _4478 = _4334;
    float _4480 = _4416;
    float _4482 = _4388;
    float _4484 = fma(_3252, _4322, _4412);
    float _4486 = fma(_3252, _4290, _4406);
    float _4488 = _4482;
    if (_4308)
    {
        _4418 = _4478;
    }
    float _4490 = _4418;
    float _4492 = _4490;
    if (_4308)
    {
        _229 = _4480;
    }
    float _4494 = _229;
    float _4496 = _4494;
    if (!_4308)
    {
        float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4500 = _2632 + _4498;
        float _4502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4504 = _3224 + _4502;
        float _4506 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4508 = -_2632;
        float _4510 = _4508 + _4480;
        float _4512 = _4500 * _4500;
        float _4514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4516 = _3252 + _4514;
        float _4518 = fma(_4504, _4504, _4512);
        float _4520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4522 = fma(_4516, _4516, _4518);
        float _4524 = sqrt(_4522);
        float _4526 = _4506 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4528 = -_3224;
        float _4530 = _4528 + _4478;
        float _4532 = precise::min(_4524, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4534 = _4532 * _4520;
        float _4536 = _4526 * _4534;
        float _4538 = -_3252;
        float _4540 = _4538 + _4482;
        float _4542 = fma(_4510, _4536, _2632);
        float _4544 = fma(_4530, _4536, _3224);
        float _4546 = fma(_4540, _4536, _3252);
        _4496 = _4542;
        _4492 = _4544;
        _4488 = _4546;
    }
    float _4548 = _4496;
    float _4550 = _4492;
    float _4552 = _4488;
    float _4554 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4556 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4558 = _4486 + _4298;
    float _4560 = _4484 + _4330;
    float _4562 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4564 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4554);
    float _4566 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4556);
    float _4568 = _4558 * _4404;
    float _4570 = _4548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4572 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4562);
    float _4574 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4564);
    float _4576 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4566);
    float _4578 = fma(_4550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4570);
    bool _4580 = _4568 >= 0.0;
    float _4582 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4572);
    float _4584 = _4574 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4586 = _4560 * _4404;
    float _4588 = fma(_4552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4578);
    bool _4590 = _4568 <= 1.0;
    bool _4592 = _4590 && _4580;
    float _4594 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4596 = _4582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4598 = _4588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4600 = _4586 >= 0.0;
    bool _4602 = _4600 && _4592;
    float _4604 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4606 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4608 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4594);
    bool _4610 = _4586 <= 1.0;
    bool _4612 = _4610 && _4602;
    float _4614 = _4576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4616 = -_4606;
    float _4618 = fma(_4616, _4604, 1.0);
    float _4620 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4608);
    float _4622 = _4566;
    float _4624 = _4560;
    float _4626 = _4568;
    if (!_4188)
    {
        float _4628 = rint(_4402);
        float _4630 = precise::max(_4628, 0.0);
        uint _4632 = uint(_4630);
        uint _4634 = clamp(_4632, 0u, 65535u);
        _4622 = as_type<float>(_4634);
    }
    float _4636 = _4622;
    float _4638 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_4188)
    {
        float _4640 = -_4240;
        float _4642 = _4072 + _4640;
        _4624 = _4642;
    }
    float _4644 = _4624;
    float _4646 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4648 = _4036 * _4356;
    float _4650 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4652 = log2(_4618);
    if (_4612)
    {
        float _4654 = float(_4148);
        _4420 = _4654;
    }
    float _4656 = _4420;
    float _4658 = fma(_3224, _4348, _4648);
    float _4660 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4650);
    float _4662 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4638);
    float _4664 = fma(_3252, _4370, _4658);
    float _4666 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4660);
    float _4668 = 1.0 / _4646;
    float _4670 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4662);
    float _4672 = _4664 + _4378;
    float _4674 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4666);
    float _4676 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4670);
    float _4678 = _4672 * _4404;
    float _4680 = _4486;
    float _4682 = _4674;
    float _4684 = _4678;
    if (!_4188)
    {
        float _4686 = floor(_4080);
        _4680 = _4686;
    }
    float _4688 = _4680;
    float _4690 = _4652 * 0.693147182464599609375;
    float _4692 = _4690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4694 = _4656;
    if (_4612)
    {
        float _4696 = rint(_4656);
        float _4698 = precise::max(_4696, 0.0);
        uint _4700 = uint(_4698);
        uint _4702 = clamp(_4700, 0u, 65535u);
        _4694 = as_type<float>(_4702);
    }
    float _4704 = _4694;
    float _4706 = _4674 * _4668;
    float _4708 = _4676 * _4668;
    float _4710 = fma(_4706, 0.5, 0.5);
    float _4712 = fma(_4708, -0.5, 0.5);
    float _4714 = _4688;
    if (!_4188)
    {
        float _4716 = -_4688;
        float _4718 = _4080 + _4716;
        _4714 = _4718;
    }
    float _4720 = _4714;
    float _4722 = _4668;
    if (!_4188)
    {
        float3 _12626 = float3(_4644, _4720, float(as_type<int>(_4636)));
        float3 _12630 = select(_12626, float3(0.0), isnan(_12626));
        float _4724 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12630.xy, uint(rint(_12630.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12630.xy, uint(rint(_12630.z)), level(0.0)).x;
        _4722 = _4724;
    }
    float _4726 = _4722;
    float _4728 = _4586;
    float _4730 = _4704;
    if (_4612)
    {
        float3 _12646 = float3(_4568, _4586, float(as_type<int>(_4704)));
        float3 _12648 = select(_12646, float3(0.0), isnan(_12646));
        float _4732 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12648.xy, uint(rint(_12648.z)), _4678, level(0.0));
        _4728 = _4732;
    }
    float _4734 = _4728;
    float3 _12658 = float3(_4710, _4712, _4692);
    float _4736 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12658, float3(0.0), isnan(_12658)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12658, float3(0.0), isnan(_12658)), level(0.0)).x;
    float3 _12667 = float3(_4710, _4712, _4692);
    float4 _4739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12667, float3(0.0), isnan(_12667)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12667, float3(0.0), isnan(_12667)), level(0.0)).xyzw;
    float _4741 = _4739.x;
    float _4743 = _4739.y;
    float _4745 = _4739.z;
    float _4747 = _4739.w;
    float _4749 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_4188)
    {
        _4390 = 1.0;
    }
    float _4751 = _4390;
    bool _4753 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4755 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4757 = _4753 || _4755;
    bool _4759 = isnan(0.5);
    bool _4761 = _4757 || _4759;
    float _4763 = _4751;
    if (_4761)
    {
        _4749 = 1.0;
    }
    float _4765 = _4749;
    float _4767 = _4765;
    if (!_4761)
    {
        float _4769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4771;
        float _4775 = _4769 * 0.15915493667125701904296875;
        float _4777 = _4775 * 6.283185482025146484375;
        float _4779 = cos(_4777);
        float _4781 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4783 = _4781 * 0.15915493667125701904296875;
        float _4785 = _4775 * 6.283185482025146484375;
        float _4787 = sin(_4785);
        float _4789 = 1.0 / _4779;
        float _4791 = _4783 * 6.283185482025146484375;
        float _4793 = cos(_4791);
        float _4795 = _4787 * _4789;
        float _4797 = _4783 * 6.283185482025146484375;
        float _4799 = sin(_4797);
        float _4801 = _4793 * _4795;
        float _4803 = 1.0 / _4773;
        float _4805 = 1.0 / _4801;
        float _4807 = _4799 * _4805;
        float _4809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4811 = fma(_4124, _4807, _4809);
        float _4813 = _4811 * _4803;
        float _4815 = precise::clamp(_4813, 0.0, 1.0);
        _4730 = _4801;
        _4626 = _4811;
        _4767 = _4815;
    }
    float _4817 = _4730;
    float _4819 = _4626;
    float _4821 = _4767;
    float _4823 = _4817;
    float _4825 = _4819;
    if (!_4188)
    {
        int _4827 = _4216 << 4;
        int _4829 = _4827 + 2048;
        uint _4831 = uint(int(uint(_4829) >> uint(2)));
        uint _4833 = uint(int(uint(int(_4831)) >> uint(2)));
        int _4835 = int(_4831) & 3;
        float _4837 = (*spvDescriptorSet0.vp_c15)._m0[int(_4833)][_4835];
        int _4839 = int(_4831) + 1;
        uint _4841 = uint(int(uint(_4839) >> uint(2)));
        int _4843 = _4839 & 3;
        float _4845 = (*spvDescriptorSet0.vp_c15)._m0[int(_4841)][_4843];
        int _4847 = _4829 + 8;
        uint _4849 = uint(int(uint(_4847) >> uint(2)));
        uint _4851 = uint(int(uint(int(_4849)) >> uint(2)));
        int _4853 = int(_4849) & 3;
        float _4855 = (*spvDescriptorSet0.vp_c15)._m0[int(_4851)][_4853];
        int _4857 = int(_4849) + 1;
        uint _4859 = uint(int(uint(_4857) >> uint(2)));
        int _4861 = _4857 & 3;
        float _4863 = (*spvDescriptorSet0.vp_c15)._m0[int(_4859)][_4861];
        float _4865 = _4036 * _4845;
        float _4867 = fma(_3224, _4837, _4865);
        float _4869 = fma(_3252, _4855, _4867);
        float _4871 = _4869 + _4863;
        float _4873 = precise::clamp(_4871, 0.0, 1.0);
        float _4875 = -_4873;
        float _4877 = _4875 + _4726;
        float _4879 = fma(_4877, 500.0, 1.5);
        float _4881 = exp2(_4879);
        float _4883 = 0.0 + _4881;
        float _4885 = precise::clamp(_4883, 0.0, 1.0);
        _4823 = _4837;
        _4825 = _4845;
        _4763 = _4885;
    }
    float _4887 = _4823;
    float _4889 = _4825;
    float _4891 = _4763;
    float _4893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4895 = _4548 + _4893;
    float _4897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4899 = _4550 + _4897;
    float _4901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4903 = _4552 + _4901;
    float _4905 = _4895 * _4895;
    float _4907 = fma(_4899, _4899, _4905);
    float _4909 = fma(_4903, _4903, _4907);
    float _4911 = rsqrt(_4909);
    float _4913 = _4911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4915 = _4899 * _4913;
    float _4917 = _4903 * _4913;
    float _4919 = _4915 * _4915;
    float _4921 = _4917 * _4917;
    float _4923 = _4919 + _4921;
    float _4925 = sqrt(_4923);
    bool _4927 = _4925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4931 = _4925 + _4929;
    float _4933 = _4911;
    float _4935 = _4931;
    float _4937 = _4887;
    float _4939 = _4895;
    float _4941 = _4913;
    if (_4927)
    {
        float _4943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4933 = _4943;
    }
    float _4945 = _4933;
    float _4947 = _4945;
    if (_4927)
    {
        float _4949 = _4931 * _4945;
        _4935 = _4949;
    }
    float _4951 = _4935;
    if (_4927)
    {
        float _4953 = rsqrt(_4923);
        _4947 = _4953;
    }
    float _4955 = _4947;
    float _4957 = _4955;
    if (_4927)
    {
        float _4959 = _4951 * 0.15915493667125701904296875;
        _4937 = _4959;
    }
    float _4961 = _4937;
    float _4963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4965 = _4903;
    float _4967 = _4961;
    if (_4927)
    {
        float _4969 = _4961 * 6.283185482025146484375;
        float _4971 = sin(_4969);
        _4965 = _4971;
    }
    float _4973 = _4965;
    float _4975 = precise::max(0.0, _4963);
    float _4977 = _4889;
    float _4979 = _4975;
    if (_4927)
    {
        float _4981 = _4961 * 6.283185482025146484375;
        float _4983 = cos(_4981);
        _4977 = _4983;
    }
    float _4985 = _4977;
    float _4987 = -_4913;
    float _4989 = -_4975;
    float _4991 = fma(_4895, _4987, _4989);
    if (_4927)
    {
        float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4939 = _4993;
    }
    float _4995 = _4939;
    float _4997 = _4973;
    float _4999 = _4995;
    if (_4927)
    {
        float _5001 = fma(_4973, _4995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4997 = _5001;
    }
    float _5003 = _4997;
    float _5005 = _5003;
    if (!_4927)
    {
        _4999 = _4917;
    }
    float _5007 = _4999;
    float _5009 = _5007;
    if (!_4927)
    {
        _4967 = _4919;
    }
    float _5011 = _4967;
    float _5013 = _5011;
    if (_4927)
    {
        float _5015 = _4955 * _5003;
        _4142 = _5015;
    }
    float _5017 = _4142;
    if (!_4927)
    {
        _4957 = _4915;
    }
    float _5019 = _4957;
    float _5021 = _5019;
    float _5023 = _4985;
    if (_4927)
    {
        float _5025 = _4985 + (-1.0);
        _4979 = _5025;
    }
    float _5027 = _4979;
    if (_4927)
    {
        float _5029 = _4915 * _5017;
        _5021 = _5029;
    }
    float _5031 = _5021;
    if (!_4927)
    {
        _5005 = _4991;
    }
    float _5033 = _5005;
    float _5035 = _5033;
    if (_4927)
    {
        float _5037 = _4917 * _5017;
        _5009 = _5037;
    }
    float _5039 = _5009;
    if (_4927)
    {
        float _5041 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4941 = _5041;
    }
    float _5043 = _4941;
    if (_4927)
    {
        float _5045 = _5031 * _5031;
        _5013 = _5045;
    }
    float _5047 = _5013;
    float _5049 = sqrt(_4909);
    if (_4927)
    {
        float _5051 = fma(_4991, _4985, _5043);
        _5035 = _5051;
    }
    float _5053 = _5035;
    if (!_4927)
    {
        _5023 = _4921;
    }
    float _5055 = _5023;
    float _5057 = _5055;
    if (_4927)
    {
        float _5059 = _5039 * _5039;
        _5057 = _5059;
    }
    float _5061 = _5057;
    float _5063 = fma(_5053, _5053, _5047);
    float _5065 = _5063 + _5061;
    float _5067 = rsqrt(_5065);
    float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5071 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5069);
    float _5073 = precise::clamp(_5071, 0.0, 1.0);
    float _5075 = -_5073;
    float _5077 = _5075 + 1.0;
    float _5079 = abs(_5077);
    float _5081 = log2(_5079);
    float _5083 = _5067 * _5031;
    float _5085 = _5067 * _5053;
    float _5087 = _5067 * _5039;
    float _5089 = _5083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5091 = -_5089;
    float _5093 = fma(_5085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5091);
    float _5095 = -_5087;
    float _5097 = fma(_5095, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5093);
    float _5099 = _5081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5101 = fma(_5097, -0.5, 0.5);
    float _5103 = fma(_5097, 0.5, 0.5);
    float _5105 = _5085 + 1.0;
    float _5107 = exp2(_5099);
    float _5109 = fma(_5103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5111 = fma(_5103, _5109, -0.212114393711090087890625);
    float _5113 = sqrt(_5101);
    float _5115 = fma(_5103, _5111, 1.570728778839111328125);
    float _5117 = -_5085;
    float _5119 = fma(_5107, _5105, _5117);
    float _5121 = fma(_5119, 0.5, 0.5);
    float _5123 = _5113 * 0.636619746685028076171875;
    float _5125 = -_5115;
    float _5127 = fma(_5123, _5125, 1.0);
    float2 _13244 = float2(_5127, _5121);
    float3 _5131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13244, float2(0.0), isnan(_13244)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13244, float2(0.0), isnan(_13244)), level(0.0)).xyz;
    float _5133 = _5131.x;
    float _5135 = _5131.y;
    float _5137 = _5131.z;
    float _5139 = abs(_4124);
    float _5141 = log2(_5139);
    float _5143 = _4584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5145 = _5081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5147 = -_4024;
    float _5149 = _5147 + 1.0;
    float _5151 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5143);
    float _5153 = _4674 + _4646;
    bool _5155 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5157 = isnan(_5049);
    bool _5159 = _5155 || _5157;
    bool _5161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5163 = _5159 || _5161;
    float _5165 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5151);
    float _5167 = exp2(_5145);
    bool _5169 = _4124 <= 8000.0;
    bool _5171 = isnan(_4124);
    bool _5173 = _5169 || _5171;
    bool _5175 = isnan(8000.0);
    bool _5177 = _5173 || _5175;
    float _5179 = float(_5177);
    float _5181 = fma(_4614, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5165);
    float _5183 = _5153 * 0.5;
    float _5185 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5187 = _4646 * 0.5;
    float _5189 = _5181 + _4646;
    out.gl_Position.x = _4674;
    out.gl_Position.y = _4676;
    out.gl_Position.z = _5181;
    out.gl_Position.w = _4646;
    float _5191 = fma(_4676, -0.5, _5187);
    float _5193 = exp2(_5185);
    float _5195 = _5189 * 0.5;
    out.m_98.x = _5183;
    out.m_98.y = _5191;
    out.m_98.z = _5195;
    out.m_98.w = _4646;
    float _5197 = -_5167;
    float _5199 = _5197 + 1.0;
    if (!_4612)
    {
        _4682 = 1.0;
    }
    float _5201 = _4682;
    float _5203 = _5201;
    if (_4612)
    {
        bool _5205 = _4734 >= _4678;
        bool _5207 = isnan(_4734);
        bool _5209 = _5205 || _5207;
        bool _5211 = isnan(_4678);
        bool _5213 = _5209 || _5211;
        float _5215 = float(_5213);
        _5203 = _5215;
    }
    float _5217 = _5203;
    float _5219 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5221 = fma(_5193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = _5219;
    if (!_5163)
    {
        _4684 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5227 = _4684;
    float _5229 = _5217 * _4891;
    float _5231 = fma(_5223, -2.0, 3.0);
    float _5233 = _5223 * _5223;
    float _5235 = _5219 * _4736;
    float _5237 = -_5219;
    float _5239 = _5237 + 1.0;
    float _5241 = _5239;
    float _5243 = _5227;
    float _5245 = _5227;
    if (!_5163)
    {
        _5225 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5247 = _5225;
    float _5249 = _5233 * _5231;
    float _5251 = -_5249;
    float _5253 = _5251 + 1.0;
    float _5255 = fma(_5253, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5249);
    float _5257 = _5179 * _5255;
    float _5259 = _5257 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5261 = _5149 * _5259;
    float _5263 = precise::clamp(_5261, 0.0, 1.0);
    float _5265 = _4747 * _5235;
    float _5267 = -_5263;
    float _5269 = fma(_5267, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5271 = _5263;
    float _5273 = _5265;
    float _5275 = _5247;
    float _5277 = _5247;
    if (!_5163)
    {
        _5271 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5279 = _5271;
    float _5281 = -_5229;
    float _5283 = fma(_5281, _5269, 1.0);
    float _5285 = precise::clamp(_5283, 0.0, 1.0);
    float _5287 = _4747 * _5239;
    float _5289 = _5285;
    float _5291 = _5279;
    float _5293 = _5279;
    if (!_5163)
    {
        _5241 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5295 = _5241;
    float _5297 = _5285 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5299 = _5295;
    float _5301 = _5295;
    if (!_5163)
    {
        _5289 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5303 = _5289;
    out.m_100.x = _5297;
    float _5305 = _5137 * _5235;
    float _5307 = fma(_5133, _5265, _4741);
    float _5309 = fma(_5135, _5265, _4743);
    float _5311 = _4821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5313 = fma(_4747, _5305, _4745);
    float _5315 = _5303;
    float _5317 = _5303;
    if (!_5163)
    {
        _5273 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5319 = _5273;
    out.m_102.x = _5307;
    out.m_102.y = _5309;
    out.m_102.z = _5313;
    out.m_102.w = _5287;
    bool _5321 = !_5163;
    float _5323 = _5319;
    float _5325 = _5319;
    if (!_5321)
    {
        bool _5327 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5329 = isnan(_5049);
        bool _5331 = _5327 || _5329;
        bool _5333 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5335 = _5331 || _5333;
        if (!_5335)
        {
            float _5337 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5339 = _5049 + _5337;
            float _5341 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5343 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5341;
            float _5345 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5347 = _5345 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5349 = 1.0 / _5343;
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5353 = _5351 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5355 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5357 = _5355 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5367 = _5339 * _5349;
            float _5369 = precise::clamp(_5367, 0.0, 1.0);
            float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5373 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5375 = fma(_5369, _5347, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5377 = fma(_5369, _5373, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5379 = fma(_5369, _5353, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5381 = fma(_5369, _5357, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5383 = fma(_5369, _5361, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5385 = fma(_5369, _5365, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5293 = _5379;
            _5325 = _5383;
            _5245 = _5375;
            _5301 = _5381;
            _5277 = _5377;
            _5317 = _5385;
            _5387 = true;
        }
        else
        {
            bool _5389 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5391 = isnan(_5049);
            bool _5393 = _5389 || _5391;
            bool _5395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5397 = _5393 || _5395;
            if (!_5397)
            {
                _5243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5399 = _5243;
            _5245 = _5399;
            if (!_5397)
            {
                _5291 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5401 = _5291;
            _5293 = _5401;
            if (!_5397)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5403 = _5275;
            _5277 = _5403;
            if (!_5397)
            {
                _5299 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5405 = _5299;
            _5301 = _5405;
            if (!_5397)
            {
                _5323 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5407 = _5323;
            _5325 = _5407;
            if (!_5397)
            {
                _5315 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5409 = _5315;
            bool _5411 = !_5397;
            _5317 = _5409;
            if (!_5411)
            {
                bool _5413 = _5049 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5415 = isnan(_5049);
                bool _5417 = _5413 || _5415;
                bool _5419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5421 = _5417 || _5419;
                if (!_5421)
                {
                    float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5425 = _5049 + _5423;
                    float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5429 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5427;
                    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5433 = _5431 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5435 = 1.0 / _5429;
                    float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5443 = _5441 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5451 = _5449 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5453 = _5425 * _5435;
                    float _5455 = precise::clamp(_5453, 0.0, 1.0);
                    float _5457 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5459 = _5457 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5461 = fma(_5455, _5433, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5463 = fma(_5455, _5459, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5465 = fma(_5455, _5439, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5467 = fma(_5455, _5443, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5469 = fma(_5455, _5447, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5471 = fma(_5455, _5451, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5293 = _5465;
                    _5325 = _5469;
                    _5245 = _5461;
                    _5301 = _5467;
                    _5277 = _5463;
                    _5317 = _5471;
                    _5387 = true;
                }
                else
                {
                    _5293 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5325 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5301 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5317 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5387 = false;
    float _5473 = _5293;
    float _5475 = _5325;
    float _5477 = _5245;
    float _5479 = _5301;
    float _5481 = _5277;
    float _5483 = _5317;
    float _5485 = fma(_3924, -0.5, 0.5);
    float _5487 = precise::clamp(_5485, 0.0, 1.0);
    float _5489 = -_5473;
    float _5491 = _5489 + _5475;
    float _5493 = _5311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5495 = -_5477;
    float _5497 = _5495 + _5479;
    float _5499 = fma(_5487, _5491, _5473);
    out.m_104.x = 0.0;
    float _5501 = -_5481;
    float _5503 = _5501 + _5483;
    float _5505 = fma(_5487, _5497, _5477);
    float _5507 = _5499 * 0.586610972881317138671875;
    out.m_65.x = _5493;
    bool _5509 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5511 = fma(_5487, _5503, _5481);
    float _5513 = fma(_5505, 0.298911988735198974609375, _5507);
    bool _5515 = _4821 > 0.0;
    bool _5517 = isnan(_4821);
    bool _5519 = _5515 || _5517;
    bool _5521 = isnan(0.0);
    bool _5523 = _5519 || _5521;
    float _5525 = fma(_5511, 0.114477999508380889892578125, _5513);
    float _5527 = -_5525;
    float _5529 = _5505 + _5527;
    float _5531 = -_5525;
    float _5533 = _5499 + _5531;
    float _5535 = -_5525;
    float _5537 = _5511 + _5535;
    float _5539 = fma(_5529, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    float _5541 = fma(_5533, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    float _5543 = fma(_5537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5525);
    bool _5545 = !_5509;
    if (!_5545)
    {
        float _5547 = -_4548;
        float _5549 = _5547 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5551 = -_4550;
        float _5553 = _5551 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5555 = -_4552;
        float _5557 = _5555 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5559 = _5549 * _5549;
        float _5561 = fma(_5553, _5553, _5559);
        float _5563 = fma(_5557, _5557, _5561);
        float _5565 = sqrt(_5563);
        float _5567 = rsqrt(_5563);
        float _5569 = -_5565;
        float _5571 = _5569 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5573 = _5571 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5575 = precise::clamp(_5573, 0.0, 1.0);
        float _5577 = _5553 * _5567;
        float _5579 = _5549 * _5567;
        float _5581 = abs(_5575);
        float _5583 = log2(_5581);
        float _5585 = _5557 * _5567;
        float _5587 = _5577 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5589 = _3924 * _5579;
        float _5591 = -_5579;
        float _5593 = -_5587;
        float _5595 = fma(_5591, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5593);
        float _5597 = fma(_3920, _5577, _5589);
        float _5599 = -_5585;
        float _5601 = fma(_5599, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5595);
        float _5603 = fma(_3926, _5585, _5597);
        float _5605 = precise::clamp(_5603, 0.0, 1.0);
        float _5607 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5609 = _5601 + _5607;
        float _5611 = _5583 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5613 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5615 = precise::clamp(_5613, 0.0, 1.0);
        float _5617 = exp2(_5611);
        float _5619 = _5617 * _5615;
        float _5621 = _5605 * _5619;
        float _5623 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5625 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5627 = _5621 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5623;
        out.m_104.y = _5625;
        out.m_104.z = _5627;
    }
    out.m_106.x = _5539;
    out.m_106.y = _5541;
    out.m_106.z = _5543;
    if (_5523)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_65.x = 0.0;
    float _5629 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5629;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

