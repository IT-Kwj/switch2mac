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
    constant _16* vp_c9 [[id(1)]];
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
    float4 m_72 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3877 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_111);
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    float _123 = _121;
    if (!_115)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_129);
        out.gl_Position.z = _4164;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_111);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
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
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_167);
        out.gl_Position.z = _4234;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _211;
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
    bool _265 = !_183;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _171 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _199 = _285;
    }
    float _287 = _199;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _185, _291);
    float _299 = fma(_287, _187, _293);
    float _301 = fma(_287, _189, _295);
    float _303 = fma(_297, _173, _191);
    float _305 = fma(_299, _173, _193);
    float _307 = fma(_301, _173, _195);
    bool _309 = !_289;
    float _327;
    if (!_309)
    {
        float _311 = in.m_68.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_111);
        float _333 = 1.0 / _331;
        float _335 = _147 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _341 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _345 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _341);
    float _347 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _343);
    float _349 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _345);
    float _351 = _347 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _353 = _349 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _355 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _357 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _359 = floor(_355);
    float _361 = floor(_357);
    float _363 = -_359;
    float _365 = _355 + _363;
    float _367 = -_361;
    float _369 = _357 + _367;
    float2 _4551 = float2(_365, _369);
    float _371 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4551, float2(0.0), isnan(_4551)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4551, float2(0.0), isnan(_4551)), level(0.0)).x;
    float _373 = in.m_68.y;
    float _375 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _377 = in.m_68.x;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _383;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _389 = 1.0 / _381;
    float _391 = in.m_68.z;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _399 = _397 != 0;
    float _401 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _375);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _405 = 1.0 / _385;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _337 + _407;
    float _411 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _413 = _373 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _415 = _373 * 2.0;
    float _417 = 1.0 / _395;
    float _419 = fma(_413, -2.0, _387);
    float _421 = _377 * 2.0;
    float _423 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = _337 + _425;
    float _429 = _409 * _389;
    float _431 = _377 + _373;
    float _433 = floor(_421);
    float _435 = -_403;
    float _437 = fma(_423, 2.0, _435);
    float _439 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _401);
    float _441 = _427 * _405;
    float _443 = _431 + (-1.0);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = _337 + _445;
    float _449 = _377 + _391;
    float _451 = floor(_415);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _455 = _447 * _417;
    float _457 = _391 + _373;
    float _459 = _391 * 2.0;
    float _461 = _449 + (-1.0);
    bool _463 = _433 > 0.0;
    float _465 = _457 + (-1.0);
    bool _467 = _433 >= 0.0;
    bool _469 = isnan(_433);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = floor(_459);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _493 = _491 != 0;
    float _495 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _497 = _475 ? 0 : 1;
    float _499 = -_147;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[76].x, _437);
    bool _503 = _451 > 0.0;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    bool _509 = _451 >= 0.0;
    bool _511 = isnan(_451);
    bool _513 = _509 || _511;
    bool _515 = isnan(0.0);
    bool _517 = _513 || _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _519;
    bool _523 = !_489;
    int _525 = _523 ? 0 : 1;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _531 = !_485;
    int _533 = _531 ? 0 : 1;
    float _535 = fma(_521, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _537 = !_493;
    int _539 = _537 ? 0 : 1;
    float _541 = fma(_529, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _553 = _551 != 0;
    float _555 = _495 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _557 = ~_497;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    float _563 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _565 = int(_563);
    int _567 = _561;
    int _569 = as_type<int>(_451);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_463)
    {
        int _573 = ~_497;
        int _575 = _573 + 1;
        _567 = _575;
    }
    int _577 = _567;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    bool _583 = !_545;
    int _585 = _583 ? 0 : 1;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _593 = _591 != 0;
    float _595 = fma(_581, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_399)
    {
        _569 = 0;
    }
    int _597 = _569;
    float _599 = fma(_589, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _601 = _477 >= 0.0;
    bool _603 = isnan(_477);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _613 = log2(_611);
    bool _615 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _617 = isnan(_337);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _555);
    bool _629 = _477 > 0.0;
    float _631 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    int _633 = _609 ? 0 : 1;
    float _635 = fma(_353, (*spvDescriptorSet0.vp_c8)._m0[10].z, _627);
    bool _637 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _639 = isnan(_337);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    int _649 = _597;
    if (!_593)
    {
        _649 = 1;
    }
    int _651 = _649;
    float _653 = _635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _655 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _657 = isnan(_337);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    bool _667 = _651 != 1;
    float _669 = -_625;
    float _671 = _669 + 1.0;
    bool _673 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_337);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _647 * _671;
    float _687 = -_647;
    float _689 = _687 + 1.0;
    int _691 = ~_633;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    float _699 = _683;
    if (!_629)
    {
        int _701 = ~_633;
        int _703 = _701 + 1;
        _697 = _703;
    }
    int _705 = _697;
    float _707 = _683 * _689;
    float _709 = -_683;
    float _711 = _709 + 1.0;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_667)
    {
        _699 = _373;
    }
    float _715 = _699;
    float _717 = _665 * _711;
    float _719 = _715;
    if (_667)
    {
        _719 = _377;
    }
    float _721 = _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _723;
    float _727 = _535 * _717;
    float _729 = _495 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[83].z, _713);
    float _733 = float(_111);
    float _735 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _729);
    if (!_667)
    {
        _119 = _391;
    }
    float _737 = _119;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _739;
    float _743 = _737;
    if (_667)
    {
        _743 = _373;
    }
    float _745 = _743;
    float _747 = fma(_353, (*spvDescriptorSet0.vp_c8)._m0[11].z, _735);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _751 = _595 * _717;
    float _753 = float(_507);
    float _755 = _747 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _757 = fma(_725, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _759 = fma(_741, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _761 = 1.0 / _755;
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[83].w, _749);
    float _765 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _731);
    float _767 = _745;
    float _769 = _749;
    if (!_667)
    {
        _767 = _391;
    }
    float _771 = _767;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _775 = _771;
    if (_667)
    {
        _775 = _373;
    }
    float _777 = _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_667)
    {
        _769 = _373;
    }
    float _781 = _769;
    float _783 = 1.0 / _753;
    int _785 = abs(_585);
    float _787 = _777 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _789 = _781;
    if (_667)
    {
        _789 = _377;
    }
    float _791 = _789;
    float _793 = float(_785);
    float _795 = _653 + _755;
    float _797 = float(_705);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _801 = float(_565);
    float _803 = _613 * _147;
    float _805 = _793 * _797;
    float _807 = -_773;
    float _809 = fma(_799, 2.0, _807);
    float _811 = _795 * _761;
    float _813 = _811 * 0.5;
    float _815 = 1.0 / _801;
    float _817 = in.m_70.x;
    float _819 = in.m_70.y;
    float _821 = in.m_70.z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _825 = fma(_787, -2.0, _779);
    float _827 = _783 * _147;
    bool _829 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _831 = isnan(1.0);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _837 = _833 || _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _841 = 1.0 + _839;
    float _843 = exp2(_803);
    float _845 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[78].w, _823);
    float _847 = _805 * (-2.0);
    bool _849 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _861 = float(_577);
    float _863 = 1.0 / _733;
    float _865 = _815 * _147;
    float _867 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _859);
    float _869 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _763);
    float _871 = -_147;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[81].x, _809);
    float _875 = fma(_453, _847, _453);
    float _877 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _867);
    float _879 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _845);
    float _881 = 1.0 / _841;
    bool _883 = !_549;
    int _885 = _883 ? 0 : 1;
    float _887 = -_843;
    float _889 = _887 + 1.0;
    int _891 = abs(_885);
    float _893 = fma(_847, _817, _817);
    float _895 = _857 ? _889 : 0.0;
    float _897 = _863 * _147;
    float _899 = float(_891);
    float _901 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _825);
    float _903 = _899 * _861;
    if (_837)
    {
        float _905 = _895 * _881;
        _149 = _905;
    }
    float _907 = _149;
    int _909 = _517 ? 0 : 1;
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _913 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
    bool _915 = !_553;
    int _917 = _915 ? 0 : 1;
    float _919 = _377 + (-0.5);
    int _921 = ~_909;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = _903 * (-2.0);
    int _929 = _925;
    if (!_503)
    {
        int _931 = ~_909;
        int _933 = _931 + 1;
        _929 = _933;
    }
    int _935 = _929;
    float _937 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[196].x, _893);
    int _939 = abs(_917);
    float _941 = fma(_927, _819, _819);
    float _943 = -_665;
    float _945 = _943 + 1.0;
    float _947 = float(_935);
    float _949 = fma(_875, _907, _937);
    float _951 = float(_939);
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[143].x, _727);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[143].y, _751);
    float _957 = in.m_66.x;
    float _959 = in.m_66.y;
    float _961 = 1.0 / _913;
    float _963 = _951 * _947;
    float _965 = fma(_541, _707, _953);
    float _967 = fma(_599, _707, _955);
    float _969 = _373 + (-0.5);
    float _971 = _963 * (-2.0);
    float _973 = fma(_757, _685, _965);
    float _975 = fma(_759, _685, _967);
    float _977 = fma(_481, _927, _481);
    float _979 = fma(_971, _821, _821);
    float _981 = _391 + (-0.5);
    float _983 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[196].y, _941);
    float _985 = fma(_479, _971, _479);
    float _987 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _989 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _979);
    float _991 = fma(_977, _907, _983);
    float _993 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[146].x, _973);
    float _995 = _495 + _987;
    float _997 = fma(_985, _907, _989);
    float _999 = _949 * 0.15915493667125701904296875;
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[146].y, _975);
    float _1005 = _997 * 0.15915493667125701904296875;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1009 = _961 * _1007;
    float _1011 = _995 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1013 = _995 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1015 = _999 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    float _1019 = _993 * _957;
    bool _1021 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1023 = _1003 * _959;
    float _1025 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1011);
    float _1027 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1013);
    bool _1029 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _1033 = _1001 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _1041 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    float _1045 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1027);
    float _1047 = _1037 * _1031;
    float _1049 = _1041 * _1039;
    float _1051 = _1001 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1057 = !_1021;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = _999 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1067 = _1017 * _1035;
    float _1069 = _1005 * 6.283185482025146484375;
    float _1071 = cos(_1069);
    float _1073 = _1017 * _1053;
    int _1075 = 2;
    if (!_1021)
    {
        _1075 = 1;
    }
    int _1077 = _1075;
    int _1079 = _1077;
    if (!_1029)
    {
        _1079 = _1059;
    }
    int _1081 = _1079;
    float _1083 = _1005 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1063 * _1035;
    float _1089 = _1063 * _1053;
    int _1091 = _1081 << 6;
    int _1093 = _1091 + 104;
    uint _1096 = uint(int(uint(_1093) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    float _1112 = trunc(_1055);
    int _1114 = int(_1112);
    float _1116 = _1017 * _1071;
    float _1118 = _1063 * _1071;
    float _1120 = _1053 * _1071;
    float _1122 = _1035 * _1071;
    float _1124 = _1116 * _1049;
    float _1126 = _1118 * _1049;
    int _1128 = _1091 + 56;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = trunc(_1065);
    int _1148 = int(_1146);
    float _1150 = fma(_1085, _1073, _1087);
    float _1152 = fma(_1085, _1087, _1073);
    float _1154 = -_1049;
    float _1156 = _1085 * _1154;
    float _1158 = -_1067;
    float _1160 = fma(_1085, _1089, _1158);
    float _1162 = -_1089;
    float _1164 = fma(_1085, _1067, _1162);
    float _1166 = fma(_1150, _1047, _1124);
    int _1168 = _1091 + 96;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1188 = _1114 + _1186;
    int _1190 = _1188 + 1;
    float _1192 = fma(_1120, _1047, _1156);
    float _1194 = fma(_1160, _1047, _1126);
    float _1196 = fma(_1164, _411, _1166);
    bool _1198 = _1190 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1200 = fma(_1122, _411, _1192);
    float _1202 = fma(_1152, _411, _1194);
    int _1204 = _1091 + 48;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c15)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[int(_1216)][_1218];
    int _1222 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1224 = _1148 + _1222;
    int _1226 = _1224 + 1;
    float _1228 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1230 = _1190 | _1226;
    float _1232 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1228);
    int _1234 = _1091 + 64;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
    int _1240 = int(_1236) & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    int _1244 = int(_1236) + 1;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    int _1248 = _1244 & 3;
    float _1250 = (*spvDescriptorSet0.vp_c15)._m0[int(_1246)][_1248];
    bool _1252 = _1230 < 0;
    bool _1254 = _1252 || _1198;
    float _1256 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1258 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1232);
    float _1260 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1262 = _1226 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1264 = _1262 || _1254;
    float _1266 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1256);
    float _1268 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1270 = _1091 + 72;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1260);
    float _1290 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1266);
    float _1292 = _353 + _1268;
    float _1294 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1288);
    float _1296 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1300 = _1292 + _1298;
    float _1302 = _351 + _1296;
    int _1304 = _1190;
    int _1306 = _1148;
    float _1308 = _1302;
    float _1310 = _1292;
    float _1312 = _1300;
    float _1314 = as_type<float>(_1081);
    if (!_1264)
    {
        int _1316 = _1226 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1318 = _1316 + _1190;
        _1304 = _1318;
    }
    int _1320 = _1304;
    int _1322 = _1091 + 80;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    float _1340 = _1300 * _1300;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1302 + _1342;
    float _1346 = 0.0;
    float _1348 = as_type<float>(_1320);
    if (!_1264)
    {
        float _1350 = floor(_1055);
        _1346 = _1350;
    }
    float _1352 = _1346;
    int _1354 = 0;
    if (!_1264)
    {
        int _1356 = _1320 << 2;
        _1354 = _1356;
    }
    int _1358 = _1354;
    float _1360 = fma(_1344, _1344, _1340);
    int _1362 = _1358;
    if (!_1264)
    {
        uint _1364 = uint(int(uint(_1320) >> uint(2)));
        _1306 = int(_1364);
    }
    int _1366 = _1306;
    int _1368 = _1366;
    if (!_1264)
    {
        int _1370 = 12 & _1358;
        _1362 = _1370;
    }
    int _1372 = _1362;
    float _1374 = sqrt(_1360);
    float _1376 = _995 * _1184;
    if (!_1264)
    {
        int _1378 = _1366 << 4;
        int _1380 = _1378 + _1372;
        _1368 = _1380;
    }
    int _1382 = _1368;
    float _1384 = fma(_351, _1176, _1376);
    float _1386 = _995 * _1220;
    float _1388 = fma(_353, _1102, _1384);
    float _1390 = fma(_351, _1212, _1386);
    bool _1392 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = fma(_353, _1136, _1390);
    float _1396 = _1388 + _1110;
    float _1398 = _995 * _1250;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1414 = _1412 != 0;
    float _1416 = _1394 + _1144;
    float _1418 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1420 = fma(_351, _1242, _1398);
    float _1422 = 1.0 / _1396;
    bool _1424 = !_1406;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _495 + _1418;
    float _1430 = fma(_353, _1278, _1420);
    bool _1432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1434 = isnan(0.5);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1440 = _1436 || _1438;
    bool _1442 = !_1402;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = _1430 + _1286;
    bool _1448 = !_1410;
    float _1450 = _1448 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1452 = !_1414;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = _1418;
    float _1458 = _1220;
    float _1460 = _1450;
    if (!_1392)
    {
        _1456 = _1428;
    }
    float _1462 = _1456;
    bool _1464 = !_1392;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1374 + _1470;
        float _1474 = _1428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = rsqrt(_1360);
        float _1478 = _1472 * _1468;
        float _1480 = _1478 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1484 + (-1.0);
        float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = fma(_1488, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1496 = fma(_1428, _1484, _1492);
        float _1498 = _1476 * _1494;
        float _1500 = fma(_1344, _1498, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1502 = fma(_1300, _1498, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1308 = _1500;
        _1310 = _1502;
        _1466 = _1496;
        _1458 = _1488;
    }
    float _1504 = _1308;
    float _1506 = _1310;
    float _1508 = _1466;
    float _1510 = _1458;
    float _1512 = _1510;
    float _1514 = _1508;
    if (_1440)
    {
        _1312 = _1504;
    }
    float _1516 = _1312;
    float _1518 = _1516;
    if (_1440)
    {
        _1512 = _1506;
    }
    float _1520 = _1512;
    float _1522 = _1520;
    if (!_1440)
    {
        float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1526 = _495 + _1524;
        float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1530 = _351 + _1528;
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1534 = -_495;
        float _1536 = _1534 + _1508;
        float _1538 = _1526 * _1526;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1542 = _353 + _1540;
        float _1544 = -_351;
        float _1546 = _1544 + _1504;
        float _1548 = -_353;
        float _1550 = _1548 + _1506;
        float _1552 = fma(_1530, _1530, _1538);
        float _1554 = fma(_1542, _1542, _1552);
        float _1556 = sqrt(_1554);
        float _1558 = precise::min(_1556, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1560 = _1558 * _1532;
        float _1562 = fma(_1536, _1560, _495);
        float _1564 = fma(_1546, _1560, _351);
        float _1566 = fma(_1550, _1560, _353);
        _1514 = _1562;
        _1518 = _1564;
        _1522 = _1566;
    }
    float _1568 = _1514;
    float _1570 = _1518;
    float _1572 = _1522;
    int _1574 = _1091 + 88;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
    float _1592 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1598 = _1416 * _1422;
    float _1600 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1602 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1604 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1596);
    float _1606 = 0.0;
    if (!_1264)
    {
        int _1608 = _1382 + 400;
        uint _1610 = uint(int(uint(_1608) >> uint(2)));
        uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
        int _1614 = int(_1610) & 3;
        float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1600);
    bool _1622 = _1598 >= 0.0;
    float _1624 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1626 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1628 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1604);
    float _1630 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1632 = _1446 * _1422;
    bool _1634 = _1598 <= 1.0;
    bool _1636 = _1634 && _1622;
    float _1638 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1626);
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1644 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1646 = _1632 >= 0.0;
    bool _1648 = _1646 && _1636;
    float _1650 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1638);
    float _1652 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1642);
    float _1654 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1658 = _1632 <= 1.0;
    bool _1660 = _1658 && _1648;
    float _1662 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1664 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1652);
    float _1666 = -_1656;
    float _1668 = fma(_1666, _1654, 1.0);
    float _1670 = _1430;
    float _1672 = _1632;
    if (!_1264)
    {
        float _1674 = floor(_1065);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1680 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1664);
    float _1682 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1684 = _995 * _1338;
    float _1686 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1678);
    float _1688 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1682);
    float _1690 = log2(_1668);
    float _1692 = _1688;
    if (_1660)
    {
        float _1694 = float(_1081);
        _1314 = _1694;
    }
    float _1696 = _1314;
    float _1698 = fma(_351, _1330, _1684);
    float _1700 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1686);
    float _1702 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1704 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1700);
    float _1706 = 1.0 / _1680;
    float _1708 = _1704;
    if (!_1264)
    {
        float _1710 = -_1676;
        float _1712 = _1065 + _1710;
        _1692 = _1712;
    }
    float _1714 = _1692;
    float _1716 = fma(_353, _1582, _1698);
    float _1718 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1702);
    float _1720 = _1716 + _1590;
    float _1722 = _1684;
    if (_1660)
    {
        float _1724 = rint(_1696);
        float _1726 = precise::max(_1724, 0.0);
        uint _1728 = uint(_1726);
        uint _1730 = clamp(_1728, 0u, 65535u);
        _1722 = as_type<float>(_1730);
    }
    float _1732 = _1722;
    float _1734 = _1690 * 0.693147182464599609375;
    float _1736 = _1720 * _1422;
    float _1738 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1740 = _1698;
    if (!_1264)
    {
        float _1742 = rint(_1618);
        float _1744 = precise::max(_1742, 0.0);
        uint _1746 = uint(_1744);
        uint _1748 = clamp(_1746, 0u, 65535u);
        _1740 = as_type<float>(_1748);
    }
    float _1750 = _1740;
    float _1752 = _1704 * _1706;
    float _1754 = _1718 * _1706;
    float _1756 = fma(_1752, 0.5, 0.5);
    float _1758 = fma(_1754, -0.5, 0.5);
    float _1760 = _1752;
    if (!_1264)
    {
        float _1762 = -_1352;
        float _1764 = _1055 + _1762;
        _1760 = _1764;
    }
    float _1766 = _1760;
    float _1768 = _1734;
    if (_1660)
    {
        float3 _6794 = float3(_1598, _1632, float(as_type<int>(_1732)));
        float3 _6798 = select(_6794, float3(0.0), isnan(_6794));
        float _1770 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6798.xy, uint(rint(_6798.z)), _1736, level(0.0));
        _1768 = _1770;
    }
    float _1772 = _1768;
    float3 _6808 = float3(_1756, _1758, _1738);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6808, float3(0.0), isnan(_6808)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6808, float3(0.0), isnan(_6808)), level(0.0)).x;
    float3 _6817 = float3(_1756, _1758, _1738);
    float4 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6817, float3(0.0), isnan(_6817)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6817, float3(0.0), isnan(_6817)), level(0.0)).xyzw;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = _1777.w;
    float _1787 = _1714;
    if (!_1264)
    {
        float3 _6840 = float3(_1766, _1714, float(as_type<int>(_1750)));
        float3 _6842 = select(_6840, float3(0.0), isnan(_6840));
        float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6842.xy, uint(rint(_6842.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6842.xy, uint(rint(_6842.z)), level(0.0)).x;
        _1787 = _1789;
    }
    float _1791 = _1787;
    float _1793 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1795 = int(_1793);
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1799 = _1797 != 0;
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1803 = _1801 != 0;
    int _1805 = abs(_525);
    int _1807 = abs(_533);
    float _1809 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1811 = int(_1809);
    int _1813 = abs(_1426);
    int _1815 = abs(_1444);
    int _1817 = abs(_1454);
    if (_1799)
    {
        _571 = _377;
    }
    float _1819 = _571;
    float _1821 = trunc(_827);
    int _1823 = int(_1821);
    float _1825 = float(uint(_1795));
    float _1827 = trunc(_865);
    int _1829 = int(_1827);
    float _1831 = float(uint(_1811));
    float _1833 = _1819;
    if (_1799)
    {
        _1672 = 1.0;
    }
    float _1835 = _1672;
    float _1837 = _1835;
    if (!_1799)
    {
        _1833 = _373;
    }
    float _1839 = _1833;
    if (!_1799)
    {
        _1837 = 1.2345600128173828125;
    }
    float _1841 = _1837;
    float _1843 = 1.0 / _1825;
    float _1845 = float(uint(_1823));
    int _1847 = ~_1795;
    int _1849 = _1847 + 1;
    float _1851 = _1839 * _1841;
    float _1853 = float(_1823);
    float _1855 = 1.0 / _1831;
    float _1857 = float(uint(_1829));
    int _1859 = as_type<int>(_1843) + (-2);
    float _1861 = floor(_1851);
    int _1863 = ~_1795;
    int _1865 = _1863 + 1;
    float _1867 = as_type<float>(_1859) * _1845;
    int _1869 = as_type<int>(_1855) + (-2);
    float _1871 = trunc(_1867);
    float _1873 = precise::max(_1871, 0.0);
    uint _1875 = uint(_1873);
    int _1877 = ~_1811;
    int _1879 = _1877 + 1;
    float _1881 = as_type<float>(_1869) * _1857;
    float _1883 = _1857;
    if (_1799)
    {
        _1883 = 1.0;
    }
    float _1885 = _1883;
    float _1887 = _1885;
    if (!_1799)
    {
        _1887 = 7.345489978790283203125;
    }
    float _1889 = _1887;
    float _1891 = -_1861;
    float _1893 = _1851 + _1891;
    float _1895 = trunc(_1881);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    float _1901 = _1889 * _377;
    int _1903 = _1865 * int(_1875);
    int _1905 = _1903 + _1823;
    float _1907 = floor(_1901);
    float _1909 = float(uint(_1905));
    int _1911 = _1879 * int(_1899);
    int _1913 = _1911 + _1829;
    float _1915 = as_type<float>(_1859) * _1909;
    float _1917 = float(_1795);
    float _1919 = float(uint(_1913));
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = -_1907;
    float _1929 = _1901 + _1927;
    bool _1931 = _1853 >= _1917;
    bool _1933 = isnan(_1853);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(_1917);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = as_type<float>(_1869) * _1919;
    float _1945 = trunc(_1941);
    int _1947 = int(_1945);
    float _1949 = trunc(_1943);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = int(_1875) + int(_1925);
    float _1957 = float(_1811);
    int _1959 = _1849 * _1955;
    int _1961 = _1959 + _1823;
    float _1963 = _1957 * _897;
    float _1965 = _1893 * _1957;
    bool _1967 = uint(_1961) >= uint(_1795);
    float _1969 = trunc(_1963);
    int _1971 = int(_1969);
    int _1973 = int(_1899) + int(_1953);
    float _1975 = _1929 * _1917;
    int _1977 = ~_1811;
    int _1979 = _1977 + 1;
    float _1981 = _1917 * _897;
    float _1983 = float(_1829);
    float _1985 = trunc(_1975);
    int _1987 = int(_1985);
    bool _1989 = _1983 >= _1957;
    bool _1991 = isnan(_1983);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(_1957);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    int _2001 = _1979 * _1973;
    int _2003 = _2001 + _1829;
    bool _2005 = !_1967;
    int _2007 = _2005 ? 0 : (-1);
    int _2009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2011 = _2009 != 0;
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2015 = _2013 != 0;
    float _2017 = trunc(_1965);
    int _2019 = int(_2017);
    int _2021 = ~_1955;
    int _2023 = _2021 + _2007;
    int _2025 = _2023 + 1;
    bool _2027 = !_2011;
    int _2029 = _2027 ? 0 : 1;
    bool _2031 = uint(_2003) >= uint(_1811);
    bool _2033 = !_2015;
    int _2035 = _2033 ? 0 : 1;
    float _2037 = trunc(_1999);
    int _2039 = int(_2037);
    int _2041 = abs(_2029);
    int _2043 = _1795 * _2025;
    int _2045 = _2043 + _1823;
    bool _2047 = !_2031;
    int _2049 = _2047 ? 0 : (-1);
    int _2051 = abs(_2035);
    float _2053 = trunc(_1981);
    int _2055 = int(_2053);
    int _2057 = ~_1973;
    int _2059 = _2057 + _2049;
    int _2061 = _2059 + 1;
    bool _2063 = _1795 == 0;
    int _2065 = _1987 * _2041;
    int _2067 = _2065 + _1823;
    int _2069 = _1811 * _2061;
    int _2071 = _2069 + _1829;
    int _2073 = ~_1947;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2063;
    int _2081 = _2079 ? _2045 : (-1);
    int _2083 = _2019 * _2051;
    int _2085 = _2083 + _1829;
    bool _2087 = _1811 == 0;
    int _2089 = ~_2039;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _2081 * _2077;
    bool _2097 = !_2087;
    int _2099 = _2097 ? _2071 : (-1);
    int _2101 = _1795 + (-1);
    int _2103 = _1811 + (-1);
    int _2105 = _2099 * _2093;
    int _2107 = _1947 * _2101;
    int _2109 = _2107 + _2095;
    bool _2111 = !_1803;
    int _2113 = _2111 ? 0 : 1;
    int _2115 = _2039 * _2103;
    int _2117 = _2115 + _2105;
    int _2119 = _2109 * _1805;
    int _2121 = abs(_539);
    int _2123 = _2117 * _1813;
    int _2125 = abs(as_type<int>(_1450));
    int _2127 = _2055 * _1807;
    int _2129 = _2127 + _2119;
    int _2131 = abs(_2113);
    int _2133 = _2067 * _2121;
    int _2135 = _2133 + _2129;
    int _2137 = ~_1811;
    int _2139 = _2137 + 1;
    int _2141 = _1971 * _1815;
    int _2143 = _2141 + _2123;
    float _2145 = float(uint(_2067));
    int _2147 = _1987 * _2131;
    int _2149 = _2147 + _2135;
    int _2151 = _2085 * _2125;
    int _2153 = _2151 + _2143;
    int _2155 = ~_1795;
    int _2157 = _2155 + 1;
    float _2159 = as_type<float>(_1859) * _2145;
    float _2161 = float(uint(_2149));
    int _2163 = _2019 * _1817;
    int _2165 = _2163 + _2153;
    int _2167 = ~_1795;
    int _2169 = _2167 + 1;
    float _2171 = float(uint(_2085));
    float _2173 = trunc(_2159);
    float _2175 = precise::max(_2173, 0.0);
    uint _2177 = uint(_2175);
    float _2179 = float(uint(_2165));
    float _2181 = as_type<float>(_1859) * _2161;
    float _2183 = as_type<float>(_1869) * _2179;
    float _2185 = trunc(_2181);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    float _2191 = trunc(_2183);
    float _2193 = precise::max(_2191, 0.0);
    uint _2195 = uint(_2193);
    int _2197 = _2157 * int(_2177);
    int _2199 = _2197 + _2067;
    int _2201 = ~_1811;
    int _2203 = _2201 + 1;
    float _2205 = float(uint(_2199));
    int _2207 = _2169 * int(_2189);
    int _2209 = _2207 + _2149;
    float _2211 = as_type<float>(_1859) * _2205;
    float _2213 = float(uint(_2209));
    int _2215 = _2203 * int(_2195);
    int _2217 = _2215 + _2165;
    float _2219 = trunc(_2211);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    float _2225 = as_type<float>(_1859) * _2213;
    float _2227 = as_type<float>(_1869) * _2171;
    float _2229 = float(uint(_2217));
    float _2231 = trunc(_2225);
    float _2233 = precise::max(_2231, 0.0);
    uint _2235 = uint(_2233);
    float _2237 = as_type<float>(_1869) * _2229;
    float _2239 = trunc(_2237);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = int(_2177) + int(_2223);
    int _2247 = ~_1811;
    int _2249 = _2247 + 1;
    float _2251 = trunc(_2227);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = int(_2189) + int(_2235);
    int _2259 = ~_1795;
    int _2261 = _2259 + 1;
    int _2263 = int(_2195) + int(_2243);
    int _2265 = _2169 * _2257;
    int _2267 = _2265 + _2149;
    int _2269 = _2261 * _2245;
    int _2271 = _2269 + _2067;
    bool _2273 = uint(_2267) >= uint(_1795);
    int _2275 = _2249 * _2263;
    int _2277 = _2275 + _2165;
    bool _2279 = uint(_2271) >= uint(_1795);
    int _2281 = _2139 * int(_2255);
    int _2283 = _2281 + _2085;
    bool _2285 = !_2273;
    int _2287 = _2285 ? 0 : (-1);
    bool _2289 = uint(_2277) >= uint(_1811);
    int _2291 = ~_2257;
    int _2293 = _2291 + _2287;
    int _2295 = _2293 + 1;
    float _2297 = float(uint(_2283));
    int _2299 = _1795 * _2295;
    int _2301 = _2299 + _2149;
    float _2303 = as_type<float>(_2295);
    if (_1264)
    {
        _2303 = 1.0;
    }
    float _2305 = _2303;
    float _2307 = as_type<float>(_1869) * _2297;
    float _2309 = _2305;
    float _2311 = _1791;
    float _2313 = _1774;
    if (!_1264)
    {
        int _2315 = _1320 << 4;
        int _2317 = _2315 + 2048;
        uint _2319 = uint(int(uint(_2317) >> uint(2)));
        uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
        int _2323 = int(_2319) & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        int _2327 = int(_2319) + 1;
        uint _2329 = uint(int(uint(_2327) >> uint(2)));
        int _2331 = _2327 & 3;
        float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
        int _2335 = _2317 + 8;
        uint _2337 = uint(int(uint(_2335) >> uint(2)));
        uint _2339 = uint(int(uint(int(_2337)) >> uint(2)));
        int _2341 = int(_2337) & 3;
        float _2343 = (*spvDescriptorSet0.vp_c15)._m0[int(_2339)][_2341];
        int _2345 = int(_2337) + 1;
        uint _2347 = uint(int(uint(_2345) >> uint(2)));
        int _2349 = _2345 & 3;
        float _2351 = (*spvDescriptorSet0.vp_c15)._m0[int(_2347)][_2349];
        float _2353 = _995 * _2333;
        float _2355 = fma(_351, _2325, _2353);
        float _2357 = fma(_353, _2343, _2355);
        float _2359 = _2357 + _2351;
        float _2361 = precise::clamp(_2359, 0.0, 1.0);
        float _2363 = -_2361;
        float _2365 = _2363 + _1791;
        float _2367 = fma(_2365, 500.0, 1.5);
        float _2369 = exp2(_2367);
        float _2371 = 0.0 + _2369;
        float _2373 = precise::clamp(_2371, 0.0, 1.0);
        _1348 = as_type<float>(_2317);
        _2309 = _2373;
    }
    float _2375 = _1348;
    float _2377 = _2309;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2381 = _1568 + _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2385 = _1570 + _2383;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2389 = _1572 + _2387;
    float _2391 = trunc(_2307);
    float _2393 = precise::max(_2391, 0.0);
    uint _2395 = uint(_2393);
    float _2397 = _2381 * _2381;
    float _2399 = fma(_2385, _2385, _2397);
    float _2401 = fma(_2389, _2389, _2399);
    float _2403 = rsqrt(_2401);
    float _2405 = sqrt(_2401);
    float _2407 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2409 = _2385 * _2407;
    float _2411 = _2389 * _2407;
    float _2413 = _2409 * _2409;
    float _2415 = _2411 * _2411;
    float _2417 = _2413 + _2415;
    float _2419 = sqrt(_2417);
    bool _2421 = _2419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2425 = _2419 + _2423;
    float _2427 = _353;
    float _2429 = _2417;
    float _2431 = _2425;
    float _2433 = _2381;
    float _2435 = _2409;
    float _2437 = _2411;
    float _2439 = _2413;
    float _2441 = _2415;
    if (_2421)
    {
        float _2443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2427 = _2443;
    }
    float _2445 = _2427;
    if (_2421)
    {
        float _2447 = rsqrt(_2417);
        _2429 = _2447;
    }
    float _2449 = _2429;
    if (_2421)
    {
        float _2451 = _2425 * _2445;
        _2431 = _2451;
    }
    float _2453 = _2431;
    if (_2421)
    {
        float _2455 = _2453 * 0.15915493667125701904296875;
        _1460 = _2455;
    }
    float _2457 = _1460;
    float _2459 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2461 = _2375;
    if (_2421)
    {
        float _2463 = _2457 * 6.283185482025146484375;
        float _2465 = sin(_2463);
        _2461 = _2465;
    }
    float _2467 = _2461;
    float _2469 = precise::max(0.0, _2459);
    float _2471 = _2453;
    float _2473 = _2469;
    if (_2421)
    {
        float _2475 = _2457 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        _2471 = _2477;
    }
    float _2479 = _2471;
    float _2481 = -_2407;
    float _2483 = -_2469;
    float _2485 = fma(_2381, _2481, _2483);
    if (_2421)
    {
        float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2433 = _2487;
    }
    float _2489 = _2433;
    float _2491 = _2489;
    if (_2421)
    {
        float _2493 = fma(_2467, _2489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2491 = _2493;
    }
    float _2495 = _2491;
    bool _2497 = !_2289;
    int _2499 = _2497 ? 0 : (-1);
    float _2501 = _2495;
    if (_2421)
    {
        float _2503 = _2449 * _2495;
        _2311 = _2503;
    }
    float _2505 = _2311;
    if (!_2421)
    {
        _2501 = _2485;
    }
    float _2507 = _2501;
    float _2509 = _2507;
    if (_2421)
    {
        float _2511 = _2479 + (-1.0);
        _2473 = _2511;
    }
    float _2513 = _2473;
    float _2515 = _2513;
    if (_2421)
    {
        float _2517 = _2409 * _2505;
        _2435 = _2517;
    }
    float _2519 = _2435;
    if (_2421)
    {
        float _2521 = _2411 * _2505;
        _2437 = _2521;
    }
    float _2523 = _2437;
    bool _2525 = !_2279;
    int _2527 = _2525 ? 0 : (-1);
    if (_2421)
    {
        float _2529 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2515 = _2529;
    }
    float _2531 = _2515;
    if (_2421)
    {
        float _2533 = _2519 * _2519;
        _2439 = _2533;
    }
    float _2535 = _2439;
    if (_2421)
    {
        float _2537 = _2523 * _2523;
        _2441 = _2537;
    }
    float _2539 = _2441;
    if (_2421)
    {
        float _2541 = fma(_2485, _2479, _2531);
        _2509 = _2541;
    }
    float _2543 = _2509;
    bool _2545 = !_2063;
    int _2547 = _2545 ? _2301 : (-1);
    float _2549 = fma(_2543, _2543, _2535);
    int _2551 = _2547 & 3;
    bool _2553 = _2551 != 0;
    int _2555 = _2547 & 3;
    bool _2557 = _2555 != 0;
    float _2559 = _2549 + _2539;
    bool _2561 = _2551 != 3;
    float _2563 = rsqrt(_2559);
    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2567 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2565);
    float _2569 = precise::clamp(_2567, 0.0, 1.0);
    float _2571 = -_2569;
    float _2573 = _2571 + 1.0;
    float _2575 = abs(_2573);
    float _2577 = log2(_2575);
    float _2579 = _2563 * _2519;
    float _2581 = _2563 * _2543;
    float _2583 = _2563 * _2523;
    float _2585 = _2579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2587 = _2581 + 1.0;
    float _2589 = -_2585;
    float _2591 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2589);
    float _2593 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2595 = -_2583;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2591);
    float _2599 = exp2(_2593);
    float _2601 = fma(_2597, -0.5, 0.5);
    float _2603 = fma(_2597, 0.5, 0.5);
    float _2605 = fma(_2603, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = sqrt(_2601);
    float _2609 = fma(_2603, _2605, -0.212114393711090087890625);
    float _2611 = fma(_2603, _2609, 1.570728778839111328125);
    float _2613 = -_2581;
    float _2615 = fma(_2599, _2587, _2613);
    float _2617 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2619 = _2557 ? 0 : 1;
    float _2621 = fma(_2615, 0.5, 0.5);
    bool _2623 = uint(_2551) >= 2u;
    float _2625 = _2607 * 0.636619746685028076171875;
    int _2627 = _2623 ? 0 : 1;
    bool _2629 = uint(_2551) > 1u;
    float _2631 = -_2611;
    float _2633 = fma(_2625, _2631, 1.0);
    float _2635 = _2617 * _377;
    float2 _8030 = float2(_2633, _2621);
    float3 _2639 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8030, float2(0.0), isnan(_8030)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8030, float2(0.0), isnan(_8030)), level(0.0)).xyz;
    float _2641 = _2639.x;
    float _2643 = _2639.y;
    float _2645 = _2639.z;
    int _2647 = ~_2245;
    int _2649 = _2647 + _2527;
    int _2651 = _2649 + 1;
    float _2653 = trunc(_2635);
    int _2655 = int(_2653);
    int _2657 = ~_2263;
    int _2659 = _2657 + _2499;
    int _2661 = _2659 + 1;
    float _2663 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2665 = ~_2627;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = _1795 * _2651;
    int _2673 = _2671 + _2067;
    int _2675 = _2669;
    if (_2561)
    {
        int _2677 = ~_2627;
        int _2679 = _2677 + 1;
        _2675 = _2679;
    }
    int _2681 = _2675;
    int _2683 = _1811 * _2661;
    int _2685 = _2683 + _2165;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2689 = _2687 != 0;
    float _2691 = abs(_1009);
    float _2693 = log2(_2691);
    bool _2695 = !_2063;
    int _2697 = _2695 ? _2673 : (-1);
    float _2699 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2663);
    bool _2701 = !_2087;
    int _2703 = _2701 ? _2685 : (-1);
    float _2705 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2707 = !_2553;
    int _2709 = _2707 ? 0 : 1;
    float _2711 = -_765;
    float _2713 = _2711 + 1.0;
    int _2715 = _2703 & 3;
    bool _2717 = _2715 != 0;
    float _2719 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2699);
    bool _2721 = !_2689;
    int _2723 = _2721 ? 0 : 1;
    float _2725 = exp2(_2705);
    bool _2727 = uint(_2715) > 1u;
    float _2729 = -_877;
    float _2731 = _2729 + 1.0;
    int _2733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2735 = _2733 != 0;
    float _2737 = -_879;
    float _2739 = _2737 + 1.0;
    int _2741 = _2703 & 3;
    bool _2743 = _2741 != 0;
    float _2745 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2747 = int(_2255) + int(_2395);
    float _2749 = -_371;
    float _2751 = _2749 + 1.0;
    int _2753 = ~_2619;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    float _2759 = -_869;
    float _2761 = _2759 + 1.0;
    int _2763 = _2757;
    if (!_2629)
    {
        int _2765 = ~_2619;
        int _2767 = _2765 + 1;
        _2763 = _2767;
    }
    int _2769 = _2763;
    float _2771 = exp2(_2745);
    bool _2773 = !_2735;
    int _2775 = _2773 ? 0 : 1;
    int _2777 = _2743 ? 0 : 1;
    float _2779 = -_2725;
    float _2781 = _2779 + 1.0;
    int _2783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2785 = _2783 != 0;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2789 = _2787 != 0;
    float _2791 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2795 = _2793 != 0;
    int _2797 = ~_1811;
    int _2799 = _2797 + 1;
    int _2801 = _2547 >> 31;
    int _2803 = _2703 >> 31;
    int _2805 = _2799 * _2747;
    int _2807 = _2805 + _2085;
    int _2809 = _2801 & 3;
    int _2811 = ~_2777;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = _2815;
    if (!_2727)
    {
        int _2819 = ~_2777;
        int _2821 = _2819 + 1;
        _2817 = _2821;
    }
    int _2823 = _2817;
    int _2825 = _2655 << 4;
    int _2827 = _2825 + 1712;
    int _2829 = _2803 & 3;
    int _2831 = _2547 + _2809;
    uint _2833 = uint(int(uint(_2827) >> uint(2)));
    uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
    int _2837 = int(_2833) & 3;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[int(_2835)][_2837];
    int _2841 = int(_2833) + 1;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    int _2845 = _2841 & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    bool _2849 = !_2717;
    int _2851 = _2849 ? 0 : 1;
    float _2853 = in.m_68.w;
    bool _2855 = uint(_2807) >= uint(_1811);
    int _2857 = _2703 + _2829;
    int _2859 = _2831 >> 2;
    int _2861 = _2827 + 8;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    uint _2865 = uint(int(uint(int(_2863)) >> uint(2)));
    int _2867 = int(_2863) & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    bool _2871 = !_2855;
    int _2873 = _2871 ? 0 : (-1);
    bool _2875 = _2551 != 3;
    bool _2877 = _2715 != 3;
    int _2879 = _2859 << 4;
    int _2881 = _2879 + 368;
    float _2883 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2885 = int(_2883);
    bool _2887 = !_2875;
    int _2889 = _2887 ? 0 : (-1);
    int _2891 = ~_2747;
    int _2893 = _2891 + _2873;
    int _2895 = _2893 + 1;
    bool _2897 = uint(_2715) >= 2u;
    uint _2899 = uint(int(uint(_2881) >> uint(2)));
    uint _2901 = uint(int(uint(int(_2899)) >> uint(2)));
    int _2903 = int(_2899) & 3;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[int(_2901)][_2903];
    int _2907 = int(_2899) + 1;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    int _2911 = _2907 & 3;
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[int(_2909)][_2911];
    int _2915 = _2857 >> 2;
    int _2917 = _1811 * _2895;
    int _2919 = _2917 + _2085;
    int _2921 = _2897 ? 0 : 1;
    bool _2923 = _2715 != 3;
    int _2925 = ~_2921;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = _2929;
    if (_2877)
    {
        int _2933 = ~_2921;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    bool _2939 = _373 > 0.5;
    int _2941 = _2915 << 4;
    int _2943 = _2941 + 512;
    float _2945 = -_227;
    int _2947 = _2939 ? as_type<int>(_2945) : as_type<int>(_227);
    bool _2949 = _2853 > 0.5;
    uint _2951 = uint(int(uint(_2943) >> uint(2)));
    uint _2953 = uint(int(uint(int(_2951)) >> uint(2)));
    int _2955 = int(_2951) & 3;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[int(_2953)][_2955];
    int _2959 = int(_2951) + 1;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    int _2963 = _2959 & 3;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[int(_2961)][_2963];
    bool _2967 = !_2923;
    int _2969 = _2967 ? 0 : (-1);
    bool _2971 = _377 > 0.5;
    float _2973 = -_223;
    int _2975 = _2971 ? as_type<int>(_2973) : as_type<int>(_223);
    int _2977 = _2881 + 8;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
    int _2983 = int(_2979) & 3;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[int(_2981)][_2983];
    int _2987 = int(_2979) + 1;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    int _2991 = _2987 & 3;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[int(_2989)][_2991];
    bool _2995 = !_2087;
    int _2997 = _2995 ? _2919 : (-1);
    float _2999 = _2847 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _3001 = _391 > 0.5;
    float _3003 = _2839 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _3005 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3007 = _3005 != 0;
    float _3009 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3011 = abs(_2769);
    int _3013 = _2943 + 8;
    uint _3015 = uint(int(uint(_3013) >> uint(2)));
    uint _3017 = uint(int(uint(int(_3015)) >> uint(2)));
    int _3019 = int(_3015) & 3;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[int(_3017)][_3019];
    int _3023 = int(_3015) + 1;
    uint _3025 = uint(int(uint(_3023) >> uint(2)));
    int _3027 = _3023 & 3;
    float _3029 = (*spvDescriptorSet0.vp_c9)._m0[int(_3025)][_3027];
    float _3031 = _2869 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3033 = _3003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3037 = abs(_2709);
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3041 = ~_3011;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3049 = _3031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3051 = ~_3037;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    float _3057 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3059 = _3045 * as_type<int>(_2913);
    float _3061 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3063 = _3047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3065 = abs(_2681);
    int _3067 = _3055 * as_type<int>(_2905);
    int _3069 = _3067 + _3059;
    float _3071 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3073 = int(_3071);
    out.m_72.x = _3057;
    out.m_72.y = _3061;
    out.m_72.z = _3063;
    int _3075 = abs(_2823);
    int _3077 = abs(_2851);
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _3081 = ~_3075;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    int _3087 = abs(_2937);
    out.m_74.x = _3033;
    out.m_74.y = _3009;
    out.m_74.z = _3049;
    out.m_74.w = _3079;
    int _3089 = _3085 * as_type<int>(_2965);
    int _3091 = abs(_2889);
    int _3093 = ~_3065;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    int _3099 = ~_3077;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    float _3105 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3107 = ~_3091;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    int _3113 = _3097 * as_type<int>(_2985);
    int _3115 = _3113 + _3069;
    int _3117 = abs(_2723);
    int _3119 = _3103 * as_type<int>(_2957);
    int _3121 = _3119 + _3089;
    int _3123 = _3111 * as_type<int>(_2993);
    int _3125 = _3123 + _3115;
    int _3127 = abs(_2969);
    float _3129 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3131 = ~_3087;
    int _3133 = _3131 + 1;
    int _3135 = _3133 + 1;
    float _3137 = float(uint(_3073));
    int _3139 = abs(_2775);
    int _3141 = _3135 * as_type<int>(_3021);
    int _3143 = _3141 + _3121;
    int _3145 = ~_3127;
    int _3147 = _3145 + 1;
    int _3149 = _3147 + 1;
    float _3151 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3153 = 1.0 / _3137;
    int _3155 = ~_3117;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = ~_3139;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    int _3167 = _3149 * as_type<int>(_3029);
    int _3169 = _3167 + _3143;
    int _3171 = abs(_2885);
    int _3173 = _3125 * _3159;
    int _3175 = _3169 * _3165;
    int _3177 = abs(_3073);
    int _3179 = _2697 * _3117;
    int _3181 = _3179 + _3173;
    float _3183 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3185 = _2997 * _3139;
    int _3187 = _3185 + _3175;
    float _3189 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3191 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3193 = float(uint(_3171));
    float _3195 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3197 = precise::clamp(_3195, 0.0, 1.0);
    float _3199 = -_1085;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3203 = -_1085;
    float _3205 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3189);
    float _3207 = float(uint(_2885));
    float _3209 = -_1085;
    float _3211 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3191);
    int _3213 = as_type<int>(_3153) + (-2);
    float _3215 = 1.0 / _3193;
    float _3217 = float(uint(_3187));
    float _3219 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3221 = float(uint(_3177));
    float _3223 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3205);
    int _3225 = abs(_3181);
    float _3227 = as_type<float>(_3213) * _3217;
    int _3229 = abs(_3187);
    float _3231 = 1.0 / _3207;
    float _3233 = float(uint(_3225));
    float _3235 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3211);
    float _3237 = float(uint(_3181));
    int _3239 = ~_3073;
    int _3241 = _3239 + 1;
    int _3243 = ~_2885;
    int _3245 = _3243 + 1;
    float _3247 = 1.0 / _3221;
    int _3249 = as_type<int>(_3215) + (-2);
    int _3251 = ~_3177;
    int _3253 = _3251 + 1;
    bool _3255 = !_2785;
    float _3257 = _3255 ? _227 : as_type<float>(_2947);
    float _3259 = as_type<float>(_3249) * _3233;
    float _3261 = float(uint(_3229));
    float _3263 = trunc(_3227);
    float _3265 = precise::max(_3263, 0.0);
    uint _3267 = uint(_3265);
    int _3269 = as_type<int>(_3231) + (-2);
    bool _3271 = !_3007;
    float _3273 = _3271 ? _223 : as_type<float>(_2975);
    bool _3275 = _3073 == 0;
    float _3277 = as_type<float>(_3269) * _3237;
    bool _3279 = _1009 <= 8000.0;
    bool _3281 = isnan(_1009);
    bool _3283 = _3279 || _3281;
    bool _3285 = isnan(8000.0);
    bool _3287 = _3283 || _3285;
    float _3289 = float(_3287);
    float _3291 = trunc(_3259);
    float _3293 = precise::max(_3291, 0.0);
    uint _3295 = uint(_3293);
    int _3297 = as_type<int>(_3247) + (-2);
    int _3299 = _3241 * int(_3267);
    int _3301 = _3299 + _3187;
    float _3303 = as_type<float>(_3297) * _3261;
    float _3305 = trunc(_3277);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3105);
    int _3313 = ~_3171;
    int _3315 = _3313 + 1;
    float _3317 = float(uint(_3301));
    float _3319 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3311);
    float _3321 = trunc(_3303);
    float _3323 = precise::max(_3321, 0.0);
    uint _3325 = uint(_3323);
    float _3327 = as_type<float>(_3213) * _3317;
    float _3329 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3331 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3329);
    int _3333 = _3245 * int(_3309);
    int _3335 = _3333 + _3181;
    float _3337 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3331);
    float _3339 = float(uint(_3335));
    float _3341 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3129);
    float _3343 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3151);
    int _3345 = _3253 * int(_3325);
    int _3347 = _3345 + _3229;
    float _3349 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3353 = _3315 * int(_3295);
    int _3355 = _3353 + _3225;
    float _3357 = as_type<float>(_3269) * _3339;
    float _3359 = float(uint(_3347));
    float _3361 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    float _3363 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3351);
    float _3365 = float(uint(_3355));
    float _3367 = trunc(_3357);
    float _3369 = precise::max(_3367, 0.0);
    uint _3371 = uint(_3369);
    float _3373 = as_type<float>(_3297) * _3359;
    float _3375 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3341);
    float _3377 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3343);
    float _3379 = -_227;
    int _3381 = _2949 ? as_type<int>(_3379) : as_type<int>(_227);
    float _3383 = as_type<float>(_3249) * _3365;
    float _3385 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3387 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3361);
    float _3389 = trunc(_3327);
    float _3391 = precise::max(_3389, 0.0);
    uint _3393 = uint(_3391);
    float _3395 = -_223;
    int _3397 = _3001 ? as_type<int>(_3395) : as_type<int>(_223);
    float _3399 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3363);
    bool _3401 = !_2795;
    float _3403 = _3401 ? _227 : as_type<float>(_3381);
    float _3405 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3407 = !_2789;
    float _3409 = _3407 ? _223 : as_type<float>(_3397);
    out.m_76.x = _3319;
    out.m_76.y = _3375;
    out.m_76.z = _3377;
    int _3411 = ~_3073;
    int _3413 = _3411 + 1;
    float _3415 = trunc(_3373);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    float _3421 = _3405 * _3219;
    int _3423 = int(_3309) + int(_3371);
    bool _3425 = _3073 == 0;
    float _3427 = fma(_3385, _3319, _3421);
    int _3429 = ~_2885;
    int _3431 = _3429 + 1;
    float _3433 = trunc(_3383);
    float _3435 = precise::max(_3433, 0.0);
    uint _3437 = uint(_3435);
    int _3439 = int(_3267) + int(_3393);
    int _3441 = ~_3171;
    int _3443 = _3441 + 1;
    int _3445 = _3431 * _3423;
    int _3447 = _3445 + _3181;
    int _3449 = ~_3177;
    int _3451 = _3449 + 1;
    int _3453 = _3413 * _3439;
    int _3455 = _3453 + _3187;
    int _3457 = int(_3325) + int(_3419);
    int _3459 = int(_3295) + int(_3437);
    bool _3461 = uint(_3447) >= uint(_2885);
    int _3463 = _3451 * _3457;
    int _3465 = _3463 + _3229;
    bool _3467 = uint(_3455) >= uint(_3073);
    int _3469 = _3443 * _3459;
    int _3471 = _3469 + _3225;
    bool _3473 = !_3461;
    int _3475 = _3473 ? 0 : (-1);
    float _3477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3479 = !_3467;
    int _3481 = _3479 ? 0 : (-1);
    bool _3483 = uint(_3465) >= uint(_3177);
    bool _3485 = uint(_3471) >= uint(_3171);
    int _3487 = _3181 ^ _2885;
    float _3489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3491 = ~_3423;
    int _3493 = _3491 + _3475;
    int _3495 = _3493 + 1;
    bool _3497 = !_3485;
    int _3499 = _3497 ? 0 : (-1);
    uint _3501 = uint(int(uint(_3487) >> uint(31)));
    int _3503 = _2885 * _3495;
    int _3505 = _3503 + _3181;
    int _3507 = ~_3439;
    int _3509 = _3507 + _3481;
    int _3511 = _3509 + 1;
    int _3513 = ~_3499;
    int _3515 = _3459 + _3513;
    int _3517 = _3515 + 1;
    float _3519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3521 = ~int(_3501);
    int _3523 = _3521 + 1;
    int _3525 = _3073 * _3511;
    int _3527 = _3525 + _3187;
    int _3529 = _3187 ^ _3073;
    bool _3531 = _2885 == 0;
    int _3533 = _3517 ^ _3523;
    uint _3535 = uint(int(uint(_3529) >> uint(31)));
    float _3537 = _3477 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3539 = !_3483;
    int _3541 = _3539 ? 0 : (-1);
    bool _3543 = !_3531;
    int _3545 = _3543 ? _3505 : (-1);
    int _3547 = ~_3523;
    int _3549 = _3547 + _3533;
    int _3551 = _3549 + 1;
    float _3553 = fma(_3405, _3405, 1.0);
    int _3555 = ~_3541;
    int _3557 = _3457 + _3555;
    int _3559 = _3557 + 1;
    float _3561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3563 = ~int(_3535);
    int _3565 = _3563 + 1;
    float _3567 = _3519 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3569 = !_3425;
    int _3571 = _3569 ? _3527 : (-1);
    float _3573 = float(_3545);
    bool _3575 = _2885 == 0;
    float _3577 = rsqrt(_3553);
    int _3579 = _3559 ^ _3565;
    float _3581 = fma(_3537, _3573, _501);
    float _3583 = float(_3571);
    float _3585 = _3273 + 0.5;
    int _3587 = ~_3565;
    int _3589 = _3587 + _3579;
    int _3591 = _3589 + 1;
    bool _3593 = !_3575;
    int _3595 = _3593 ? _3551 : (-1);
    float _3597 = fma(_3537, _3585, _3581);
    float _3599 = fma(_3567, _3583, _873);
    float _3601 = _3409 + 0.5;
    bool _3603 = !_3275;
    int _3605 = _3603 ? _3591 : (-1);
    float _3607 = _3489 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3609 = float(_3595);
    float _3611 = fma(_3567, _3601, _3599);
    float _3613 = _3257 + (-0.5);
    float _3615 = float(_3605);
    float _3617 = _3561 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3619 = -_631;
    float _3621 = fma(_3607, _3609, _3619);
    float _3623 = _3405 * _3577;
    float _3625 = fma(_3197, -2.0, 3.0);
    float _3627 = -_901;
    float _3629 = fma(_3617, _3615, _3627);
    float _3631 = _3403 + (-0.5);
    float _3633 = _3197 * _3197;
    float _3635 = -_3387;
    float _3637 = _3623 * _3635;
    float _3639 = -_3399;
    float _3641 = _3623 * _3639;
    float _3643 = -_3337;
    float _3645 = _3623 * _3643;
    float _3647 = -_3617;
    float _3649 = fma(_3647, _3631, _3629);
    float _3651 = _3633 * _3625;
    float _3653 = fma(_3577, _3223, _3641);
    float _3655 = _3405 * _3223;
    float _3657 = fma(_3577, _3235, _3645);
    float _3659 = -_2713;
    float _3661 = fma(_3409, _3659, _3611);
    float _3663 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2719);
    float _3665 = -_3651;
    float _3667 = _3665 + 1.0;
    float _3669 = -_3607;
    float _3671 = fma(_3669, _3613, _3621);
    float _3673 = -_2731;
    float _3675 = fma(_3273, _3673, _3597);
    float _3677 = _3405 * _3235;
    float _3679 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3651);
    float _3681 = fma(_3257, _2739, _3671);
    float _3683 = _3663 + _1680;
    float _3685 = _3289 * _3679;
    float _3687 = _3289;
    if (!_1660)
    {
        _3687 = 1.0;
    }
    float _3689 = _3687;
    float _3691 = fma(_3385, _3375, _3655);
    float _3693 = _3689;
    if (_1660)
    {
        bool _3695 = _1772 >= _1736;
        bool _3697 = isnan(_1772);
        bool _3699 = _3695 || _3697;
        bool _3701 = isnan(_1736);
        bool _3703 = _3699 || _3701;
        float _3705 = float(_3703);
        _3693 = _3705;
    }
    float _3707 = _3693;
    float _3709 = _3685 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3711 = _2791 * _1774;
    float _3713 = _3683 * 0.5;
    float _3715 = _2751 * _3709;
    float _3717 = precise::clamp(_3715, 0.0, 1.0);
    float _3719 = _3707 * _2377;
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1718;
    out.gl_Position.z = _3663;
    out.gl_Position.w = _1680;
    float _3721 = fma(_3385, _3377, _3677);
    float _3723 = -_3717;
    float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3727 = _2645 * _3711;
    float _3729 = -_2791;
    float _3731 = _3729 + 1.0;
    float _3733 = fma(_3577, _3219, _3637);
    float _3735 = -_3719;
    float _3737 = fma(_3735, _3725, 1.0);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    out.m_78.z = _3713;
    out.m_78.w = _1680;
    float _3741 = fma(_3403, _2761, _3649);
    float _3743 = _3387 + _3427;
    float _3745 = _3399 + _3691;
    float _3747 = _3337 + _3721;
    out.m_80.x = _3733;
    out.m_80.y = _3653;
    out.m_80.z = _3657;
    bool _3749 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3751 = isnan(_2405);
    bool _3753 = _3749 || _3751;
    bool _3755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3757 = _3753 || _3755;
    float _3759 = _1785 * _3711;
    float _3761 = _1785 * _3731;
    float _3763 = fma(_1785, _3727, _1783);
    float _3765 = _3739 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3767 = fma(_2641, _3759, _1779);
    float _3769 = fma(_2643, _3759, _1781);
    out.m_82.x = _3675;
    out.m_82.y = _3681;
    out.m_82.z = _3661;
    out.m_82.w = _3741;
    out.m_84.x = _3765;
    float _3771 = _3713;
    float _3773 = _3711;
    float _3775 = _3719;
    float _3777 = _3739;
    if (!_3757)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3779 = _3771;
    out.m_86.x = _3767;
    out.m_86.y = _3769;
    out.m_86.z = _3763;
    out.m_86.w = _3761;
    float _3781 = _3779;
    float _3783 = _3779;
    if (!_3757)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3785 = _2313;
    float _3787 = _3785;
    float _3789 = _3785;
    if (!_3757)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3791 = _3773;
    out.m_88.x = _3743;
    out.m_88.y = _3745;
    out.m_88.z = _3747;
    float _3793 = _3791;
    float _3795 = _3791;
    if (!_3757)
    {
        _1708 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3797 = _1708;
    float _3799 = _3797;
    float _3801 = _3797;
    if (!_3757)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3803 = _3775;
    float _3805 = _3803;
    float _3807 = _3803;
    if (!_3757)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3809 = _3777;
    bool _3811 = !_3757;
    float _3813 = _3809;
    float _3815 = _3809;
    if (!_3811)
    {
        bool _3817 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3819 = isnan(_2405);
        bool _3821 = _3817 || _3819;
        bool _3823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3825 = _3821 || _3823;
        if (!_3825)
        {
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3829 = _2405 + _3827;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3833 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3831;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3837 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3839 = 1.0 / _3833;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3857 = _3829 * _3839;
            float _3859 = precise::clamp(_3857, 0.0, 1.0);
            float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3865 = fma(_3859, _3837, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3867 = fma(_3859, _3863, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3869 = fma(_3859, _3843, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3859, _3847, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3873 = fma(_3859, _3851, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3875 = fma(_3859, _3855, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3789 = _3869;
            _3807 = _3873;
            _3783 = _3865;
            _3801 = _3871;
            _3795 = _3867;
            _3815 = _3875;
            _3877 = true;
        }
        else
        {
            bool _3879 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3881 = isnan(_2405);
            bool _3883 = _3879 || _3881;
            bool _3885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3887 = _3883 || _3885;
            if (!_3887)
            {
                _3781 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3889 = _3781;
            _3783 = _3889;
            if (!_3887)
            {
                _3787 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3891 = _3787;
            _3789 = _3891;
            if (!_3887)
            {
                _3793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3893 = _3793;
            _3795 = _3893;
            if (!_3887)
            {
                _3799 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3895 = _3799;
            _3801 = _3895;
            if (!_3887)
            {
                _3805 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3897 = _3805;
            _3807 = _3897;
            if (!_3887)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3899 = _3813;
            bool _3901 = !_3887;
            _3815 = _3899;
            if (!_3901)
            {
                bool _3903 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3905 = isnan(_2405);
                bool _3907 = _3903 || _3905;
                bool _3909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3911 = _3907 || _3909;
                if (!_3911)
                {
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3915 = _2405 + _3913;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3919 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3917;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3925 = 1.0 / _3919;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3943 = _3915 * _3925;
                    float _3945 = precise::clamp(_3943, 0.0, 1.0);
                    float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3951 = fma(_3945, _3923, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3953 = fma(_3945, _3949, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3955 = fma(_3945, _3929, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3945, _3933, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3959 = fma(_3945, _3937, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3961 = fma(_3945, _3941, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3789 = _3955;
                    _3807 = _3959;
                    _3783 = _3951;
                    _3801 = _3957;
                    _3795 = _3953;
                    _3815 = _3961;
                    _3877 = true;
                }
                else
                {
                    _3789 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3807 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3783 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3801 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3877 = false;
    float _3963 = _3789;
    float _3965 = _3807;
    float _3967 = _3783;
    float _3969 = _3801;
    float _3971 = _3795;
    float _3973 = _3815;
    float _3975 = fma(_3745, -0.5, 0.5);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = -_3963;
    float _3981 = _3979 + _3965;
    float _3983 = -_3967;
    float _3985 = _3983 + _3969;
    float _3987 = -_3971;
    float _3989 = _3987 + _3973;
    bool _3991 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3993 = fma(_3977, _3981, _3963);
    float _3995 = fma(_3977, _3985, _3967);
    float _3997 = fma(_3977, _3989, _3971);
    float _3999 = _3993 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4001 = fma(_3995, 0.298911988735198974609375, _3999);
    float _4003 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4005 = fma(_3997, 0.114477999508380889892578125, _4001);
    out.m_84.w = _4003;
    float _4007 = -_4005;
    float _4009 = _3995 + _4007;
    float _4011 = -_4005;
    float _4013 = _3993 + _4011;
    float _4015 = -_4005;
    float _4017 = _3997 + _4015;
    out.m_90.x = 0.0;
    float _4019 = fma(_4009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    float _4021 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    float _4023 = fma(_4017, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    out.m_92.x = _4019;
    out.m_92.y = _4021;
    out.m_92.z = _4023;
    if (!_3991)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4025 = -_1568;
    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4029 = -_1570;
    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4033 = -_1572;
    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4037 = _4027 * _4027;
    float _4039 = fma(_4031, _4031, _4037);
    float _4041 = fma(_4035, _4035, _4039);
    float _4043 = sqrt(_4041);
    float _4045 = rsqrt(_4041);
    float _4047 = -_4043;
    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4053 = precise::clamp(_4051, 0.0, 1.0);
    float _4055 = _4031 * _4045;
    float _4057 = _4027 * _4045;
    float _4059 = abs(_4053);
    float _4061 = log2(_4059);
    float _4063 = _4035 * _4045;
    float _4065 = _4055 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4067 = _3745 * _4057;
    float _4069 = -_4057;
    float _4071 = -_4065;
    float _4073 = fma(_4069, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4071);
    float _4075 = fma(_3743, _4055, _4067);
    float _4077 = -_4063;
    float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4073);
    float _4081 = fma(_3747, _4063, _4075);
    float _4083 = precise::clamp(_4081, 0.0, 1.0);
    float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4087 = _4079 + _4085;
    float _4089 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4091 = _4087 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4093 = precise::clamp(_4091, 0.0, 1.0);
    float _4095 = exp2(_4089);
    float _4097 = _4095 * _4093;
    float _4099 = _4083 * _4097;
    float _4101 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4103 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4105 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4101;
    out.m_90.y = _4103;
    out.m_90.z = _4105;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3877 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_111);
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    float _123 = _121;
    if (!_115)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_129);
        out.gl_Position.z = _4164;
    }
    if (!_115)
    {
        return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_111);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
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
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_167);
        out.gl_Position.z = _4234;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _211;
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
    bool _265 = !_183;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _171 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _199 = _285;
    }
    float _287 = _199;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _185, _291);
    float _299 = fma(_287, _187, _293);
    float _301 = fma(_287, _189, _295);
    float _303 = fma(_297, _173, _191);
    float _305 = fma(_299, _173, _193);
    float _307 = fma(_301, _173, _195);
    bool _309 = !_289;
    float _327;
    if (!_309)
    {
        float _311 = in.m_68.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_111);
        float _333 = 1.0 / _331;
        float _335 = _147 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _341 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _345 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _341);
    float _347 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _343);
    float _349 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _345);
    float _351 = _347 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _353 = _349 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _355 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _357 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _359 = floor(_355);
    float _361 = floor(_357);
    float _363 = -_359;
    float _365 = _355 + _363;
    float _367 = -_361;
    float _369 = _357 + _367;
    float2 _4551 = float2(_365, _369);
    float _371 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4551, float2(0.0), isnan(_4551)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4551, float2(0.0), isnan(_4551)), level(0.0)).x;
    float _373 = in.m_68.y;
    float _375 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _377 = in.m_68.x;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _383;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _389 = 1.0 / _381;
    float _391 = in.m_68.z;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _399 = _397 != 0;
    float _401 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _375);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _405 = 1.0 / _385;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _337 + _407;
    float _411 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _413 = _373 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _415 = _373 * 2.0;
    float _417 = 1.0 / _395;
    float _419 = fma(_413, -2.0, _387);
    float _421 = _377 * 2.0;
    float _423 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = _337 + _425;
    float _429 = _409 * _389;
    float _431 = _377 + _373;
    float _433 = floor(_421);
    float _435 = -_403;
    float _437 = fma(_423, 2.0, _435);
    float _439 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _401);
    float _441 = _427 * _405;
    float _443 = _431 + (-1.0);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = _337 + _445;
    float _449 = _377 + _391;
    float _451 = floor(_415);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _455 = _447 * _417;
    float _457 = _391 + _373;
    float _459 = _391 * 2.0;
    float _461 = _449 + (-1.0);
    bool _463 = _433 > 0.0;
    float _465 = _457 + (-1.0);
    bool _467 = _433 >= 0.0;
    bool _469 = isnan(_433);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = floor(_459);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _493 = _491 != 0;
    float _495 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _497 = _475 ? 0 : 1;
    float _499 = -_147;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[76].x, _437);
    bool _503 = _451 > 0.0;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    bool _509 = _451 >= 0.0;
    bool _511 = isnan(_451);
    bool _513 = _509 || _511;
    bool _515 = isnan(0.0);
    bool _517 = _513 || _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _519;
    bool _523 = !_489;
    int _525 = _523 ? 0 : 1;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _531 = !_485;
    int _533 = _531 ? 0 : 1;
    float _535 = fma(_521, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _537 = !_493;
    int _539 = _537 ? 0 : 1;
    float _541 = fma(_529, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _553 = _551 != 0;
    float _555 = _495 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _557 = ~_497;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    float _563 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _565 = int(_563);
    int _567 = _561;
    int _569 = as_type<int>(_451);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_463)
    {
        int _573 = ~_497;
        int _575 = _573 + 1;
        _567 = _575;
    }
    int _577 = _567;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    bool _583 = !_545;
    int _585 = _583 ? 0 : 1;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _593 = _591 != 0;
    float _595 = fma(_581, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_399)
    {
        _569 = 0;
    }
    int _597 = _569;
    float _599 = fma(_589, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _601 = _477 >= 0.0;
    bool _603 = isnan(_477);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _613 = log2(_611);
    bool _615 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _617 = isnan(_337);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _555);
    bool _629 = _477 > 0.0;
    float _631 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    int _633 = _609 ? 0 : 1;
    float _635 = fma(_353, (*spvDescriptorSet0.vp_c8)._m0[10].z, _627);
    bool _637 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _639 = isnan(_337);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    int _649 = _597;
    if (!_593)
    {
        _649 = 1;
    }
    int _651 = _649;
    float _653 = _635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _655 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _657 = isnan(_337);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    bool _667 = _651 != 1;
    float _669 = -_625;
    float _671 = _669 + 1.0;
    bool _673 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_337);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _647 * _671;
    float _687 = -_647;
    float _689 = _687 + 1.0;
    int _691 = ~_633;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    float _699 = _683;
    if (!_629)
    {
        int _701 = ~_633;
        int _703 = _701 + 1;
        _697 = _703;
    }
    int _705 = _697;
    float _707 = _683 * _689;
    float _709 = -_683;
    float _711 = _709 + 1.0;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_667)
    {
        _699 = _373;
    }
    float _715 = _699;
    float _717 = _665 * _711;
    float _719 = _715;
    if (_667)
    {
        _719 = _377;
    }
    float _721 = _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _723;
    float _727 = _535 * _717;
    float _729 = _495 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[83].z, _713);
    float _733 = float(_111);
    float _735 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _729);
    if (!_667)
    {
        _119 = _391;
    }
    float _737 = _119;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _739;
    float _743 = _737;
    if (_667)
    {
        _743 = _373;
    }
    float _745 = _743;
    float _747 = fma(_353, (*spvDescriptorSet0.vp_c8)._m0[11].z, _735);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _751 = _595 * _717;
    float _753 = float(_507);
    float _755 = _747 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _757 = fma(_725, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _759 = fma(_741, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _761 = 1.0 / _755;
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[83].w, _749);
    float _765 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _731);
    float _767 = _745;
    float _769 = _749;
    if (!_667)
    {
        _767 = _391;
    }
    float _771 = _767;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _775 = _771;
    if (_667)
    {
        _775 = _373;
    }
    float _777 = _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_667)
    {
        _769 = _373;
    }
    float _781 = _769;
    float _783 = 1.0 / _753;
    int _785 = abs(_585);
    float _787 = _777 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _789 = _781;
    if (_667)
    {
        _789 = _377;
    }
    float _791 = _789;
    float _793 = float(_785);
    float _795 = _653 + _755;
    float _797 = float(_705);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _801 = float(_565);
    float _803 = _613 * _147;
    float _805 = _793 * _797;
    float _807 = -_773;
    float _809 = fma(_799, 2.0, _807);
    float _811 = _795 * _761;
    float _813 = _811 * 0.5;
    float _815 = 1.0 / _801;
    float _817 = in.m_70.x;
    float _819 = in.m_70.y;
    float _821 = in.m_70.z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _825 = fma(_787, -2.0, _779);
    float _827 = _783 * _147;
    bool _829 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _831 = isnan(1.0);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _837 = _833 || _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _841 = 1.0 + _839;
    float _843 = exp2(_803);
    float _845 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[78].w, _823);
    float _847 = _805 * (-2.0);
    bool _849 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _861 = float(_577);
    float _863 = 1.0 / _733;
    float _865 = _815 * _147;
    float _867 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _859);
    float _869 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _763);
    float _871 = -_147;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[81].x, _809);
    float _875 = fma(_453, _847, _453);
    float _877 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _867);
    float _879 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _845);
    float _881 = 1.0 / _841;
    bool _883 = !_549;
    int _885 = _883 ? 0 : 1;
    float _887 = -_843;
    float _889 = _887 + 1.0;
    int _891 = abs(_885);
    float _893 = fma(_847, _817, _817);
    float _895 = _857 ? _889 : 0.0;
    float _897 = _863 * _147;
    float _899 = float(_891);
    float _901 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _825);
    float _903 = _899 * _861;
    if (_837)
    {
        float _905 = _895 * _881;
        _149 = _905;
    }
    float _907 = _149;
    int _909 = _517 ? 0 : 1;
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _913 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
    bool _915 = !_553;
    int _917 = _915 ? 0 : 1;
    float _919 = _377 + (-0.5);
    int _921 = ~_909;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = _903 * (-2.0);
    int _929 = _925;
    if (!_503)
    {
        int _931 = ~_909;
        int _933 = _931 + 1;
        _929 = _933;
    }
    int _935 = _929;
    float _937 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[196].x, _893);
    int _939 = abs(_917);
    float _941 = fma(_927, _819, _819);
    float _943 = -_665;
    float _945 = _943 + 1.0;
    float _947 = float(_935);
    float _949 = fma(_875, _907, _937);
    float _951 = float(_939);
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[143].x, _727);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[143].y, _751);
    float _957 = in.m_66.x;
    float _959 = in.m_66.y;
    float _961 = 1.0 / _913;
    float _963 = _951 * _947;
    float _965 = fma(_541, _707, _953);
    float _967 = fma(_599, _707, _955);
    float _969 = _373 + (-0.5);
    float _971 = _963 * (-2.0);
    float _973 = fma(_757, _685, _965);
    float _975 = fma(_759, _685, _967);
    float _977 = fma(_481, _927, _481);
    float _979 = fma(_971, _821, _821);
    float _981 = _391 + (-0.5);
    float _983 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[196].y, _941);
    float _985 = fma(_479, _971, _479);
    float _987 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _989 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _979);
    float _991 = fma(_977, _907, _983);
    float _993 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[146].x, _973);
    float _995 = _495 + _987;
    float _997 = fma(_985, _907, _989);
    float _999 = _949 * 0.15915493667125701904296875;
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[146].y, _975);
    float _1005 = _997 * 0.15915493667125701904296875;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1009 = _961 * _1007;
    float _1011 = _995 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1013 = _995 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1015 = _999 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    float _1019 = _993 * _957;
    bool _1021 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1023 = _1003 * _959;
    float _1025 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1011);
    float _1027 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1013);
    bool _1029 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _1033 = _1001 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _1041 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    float _1045 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1027);
    float _1047 = _1037 * _1031;
    float _1049 = _1041 * _1039;
    float _1051 = _1001 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1057 = !_1021;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = _999 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1067 = _1017 * _1035;
    float _1069 = _1005 * 6.283185482025146484375;
    float _1071 = cos(_1069);
    float _1073 = _1017 * _1053;
    int _1075 = 2;
    if (!_1021)
    {
        _1075 = 1;
    }
    int _1077 = _1075;
    int _1079 = _1077;
    if (!_1029)
    {
        _1079 = _1059;
    }
    int _1081 = _1079;
    float _1083 = _1005 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1063 * _1035;
    float _1089 = _1063 * _1053;
    int _1091 = _1081 << 6;
    int _1093 = _1091 + 104;
    uint _1096 = uint(int(uint(_1093) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    float _1112 = trunc(_1055);
    int _1114 = int(_1112);
    float _1116 = _1017 * _1071;
    float _1118 = _1063 * _1071;
    float _1120 = _1053 * _1071;
    float _1122 = _1035 * _1071;
    float _1124 = _1116 * _1049;
    float _1126 = _1118 * _1049;
    int _1128 = _1091 + 56;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = trunc(_1065);
    int _1148 = int(_1146);
    float _1150 = fma(_1085, _1073, _1087);
    float _1152 = fma(_1085, _1087, _1073);
    float _1154 = -_1049;
    float _1156 = _1085 * _1154;
    float _1158 = -_1067;
    float _1160 = fma(_1085, _1089, _1158);
    float _1162 = -_1089;
    float _1164 = fma(_1085, _1067, _1162);
    float _1166 = fma(_1150, _1047, _1124);
    int _1168 = _1091 + 96;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1188 = _1114 + _1186;
    int _1190 = _1188 + 1;
    float _1192 = fma(_1120, _1047, _1156);
    float _1194 = fma(_1160, _1047, _1126);
    float _1196 = fma(_1164, _411, _1166);
    bool _1198 = _1190 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1200 = fma(_1122, _411, _1192);
    float _1202 = fma(_1152, _411, _1194);
    int _1204 = _1091 + 48;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c15)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[int(_1216)][_1218];
    int _1222 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1224 = _1148 + _1222;
    int _1226 = _1224 + 1;
    float _1228 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1230 = _1190 | _1226;
    float _1232 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1228);
    int _1234 = _1091 + 64;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
    int _1240 = int(_1236) & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    int _1244 = int(_1236) + 1;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    int _1248 = _1244 & 3;
    float _1250 = (*spvDescriptorSet0.vp_c15)._m0[int(_1246)][_1248];
    bool _1252 = _1230 < 0;
    bool _1254 = _1252 || _1198;
    float _1256 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1258 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1232);
    float _1260 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1262 = _1226 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1264 = _1262 || _1254;
    float _1266 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1256);
    float _1268 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1270 = _1091 + 72;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1260);
    float _1290 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1266);
    float _1292 = _353 + _1268;
    float _1294 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1288);
    float _1296 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1300 = _1292 + _1298;
    float _1302 = _351 + _1296;
    int _1304 = _1190;
    int _1306 = _1148;
    float _1308 = _1302;
    float _1310 = _1292;
    float _1312 = _1300;
    float _1314 = as_type<float>(_1081);
    if (!_1264)
    {
        int _1316 = _1226 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1318 = _1316 + _1190;
        _1304 = _1318;
    }
    int _1320 = _1304;
    int _1322 = _1091 + 80;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    float _1340 = _1300 * _1300;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1302 + _1342;
    float _1346 = 0.0;
    float _1348 = as_type<float>(_1320);
    if (!_1264)
    {
        float _1350 = floor(_1055);
        _1346 = _1350;
    }
    float _1352 = _1346;
    int _1354 = 0;
    if (!_1264)
    {
        int _1356 = _1320 << 2;
        _1354 = _1356;
    }
    int _1358 = _1354;
    float _1360 = fma(_1344, _1344, _1340);
    int _1362 = _1358;
    if (!_1264)
    {
        uint _1364 = uint(int(uint(_1320) >> uint(2)));
        _1306 = int(_1364);
    }
    int _1366 = _1306;
    int _1368 = _1366;
    if (!_1264)
    {
        int _1370 = 12 & _1358;
        _1362 = _1370;
    }
    int _1372 = _1362;
    float _1374 = sqrt(_1360);
    float _1376 = _995 * _1184;
    if (!_1264)
    {
        int _1378 = _1366 << 4;
        int _1380 = _1378 + _1372;
        _1368 = _1380;
    }
    int _1382 = _1368;
    float _1384 = fma(_351, _1176, _1376);
    float _1386 = _995 * _1220;
    float _1388 = fma(_353, _1102, _1384);
    float _1390 = fma(_351, _1212, _1386);
    bool _1392 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = fma(_353, _1136, _1390);
    float _1396 = _1388 + _1110;
    float _1398 = _995 * _1250;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1414 = _1412 != 0;
    float _1416 = _1394 + _1144;
    float _1418 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1420 = fma(_351, _1242, _1398);
    float _1422 = 1.0 / _1396;
    bool _1424 = !_1406;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _495 + _1418;
    float _1430 = fma(_353, _1278, _1420);
    bool _1432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1434 = isnan(0.5);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1440 = _1436 || _1438;
    bool _1442 = !_1402;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = _1430 + _1286;
    bool _1448 = !_1410;
    float _1450 = _1448 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1452 = !_1414;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = _1418;
    float _1458 = _1220;
    float _1460 = _1450;
    if (!_1392)
    {
        _1456 = _1428;
    }
    float _1462 = _1456;
    bool _1464 = !_1392;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1374 + _1470;
        float _1474 = _1428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = rsqrt(_1360);
        float _1478 = _1472 * _1468;
        float _1480 = _1478 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1484 + (-1.0);
        float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = fma(_1488, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1496 = fma(_1428, _1484, _1492);
        float _1498 = _1476 * _1494;
        float _1500 = fma(_1344, _1498, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1502 = fma(_1300, _1498, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1308 = _1500;
        _1310 = _1502;
        _1466 = _1496;
        _1458 = _1488;
    }
    float _1504 = _1308;
    float _1506 = _1310;
    float _1508 = _1466;
    float _1510 = _1458;
    float _1512 = _1510;
    float _1514 = _1508;
    if (_1440)
    {
        _1312 = _1504;
    }
    float _1516 = _1312;
    float _1518 = _1516;
    if (_1440)
    {
        _1512 = _1506;
    }
    float _1520 = _1512;
    float _1522 = _1520;
    if (!_1440)
    {
        float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1526 = _495 + _1524;
        float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1530 = _351 + _1528;
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1534 = -_495;
        float _1536 = _1534 + _1508;
        float _1538 = _1526 * _1526;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1542 = _353 + _1540;
        float _1544 = -_351;
        float _1546 = _1544 + _1504;
        float _1548 = -_353;
        float _1550 = _1548 + _1506;
        float _1552 = fma(_1530, _1530, _1538);
        float _1554 = fma(_1542, _1542, _1552);
        float _1556 = sqrt(_1554);
        float _1558 = precise::min(_1556, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1560 = _1558 * _1532;
        float _1562 = fma(_1536, _1560, _495);
        float _1564 = fma(_1546, _1560, _351);
        float _1566 = fma(_1550, _1560, _353);
        _1514 = _1562;
        _1518 = _1564;
        _1522 = _1566;
    }
    float _1568 = _1514;
    float _1570 = _1518;
    float _1572 = _1522;
    int _1574 = _1091 + 88;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
    float _1592 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1598 = _1416 * _1422;
    float _1600 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1602 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1604 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1596);
    float _1606 = 0.0;
    if (!_1264)
    {
        int _1608 = _1382 + 400;
        uint _1610 = uint(int(uint(_1608) >> uint(2)));
        uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
        int _1614 = int(_1610) & 3;
        float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1600);
    bool _1622 = _1598 >= 0.0;
    float _1624 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1626 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1628 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1604);
    float _1630 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1632 = _1446 * _1422;
    bool _1634 = _1598 <= 1.0;
    bool _1636 = _1634 && _1622;
    float _1638 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1626);
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1644 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1646 = _1632 >= 0.0;
    bool _1648 = _1646 && _1636;
    float _1650 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1638);
    float _1652 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1642);
    float _1654 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1658 = _1632 <= 1.0;
    bool _1660 = _1658 && _1648;
    float _1662 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1664 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1652);
    float _1666 = -_1656;
    float _1668 = fma(_1666, _1654, 1.0);
    float _1670 = _1430;
    float _1672 = _1632;
    if (!_1264)
    {
        float _1674 = floor(_1065);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1680 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1664);
    float _1682 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1684 = _995 * _1338;
    float _1686 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1678);
    float _1688 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1682);
    float _1690 = log2(_1668);
    float _1692 = _1688;
    if (_1660)
    {
        float _1694 = float(_1081);
        _1314 = _1694;
    }
    float _1696 = _1314;
    float _1698 = fma(_351, _1330, _1684);
    float _1700 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1686);
    float _1702 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1704 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1700);
    float _1706 = 1.0 / _1680;
    float _1708 = _1704;
    if (!_1264)
    {
        float _1710 = -_1676;
        float _1712 = _1065 + _1710;
        _1692 = _1712;
    }
    float _1714 = _1692;
    float _1716 = fma(_353, _1582, _1698);
    float _1718 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1702);
    float _1720 = _1716 + _1590;
    float _1722 = _1684;
    if (_1660)
    {
        float _1724 = rint(_1696);
        float _1726 = precise::max(_1724, 0.0);
        uint _1728 = uint(_1726);
        uint _1730 = clamp(_1728, 0u, 65535u);
        _1722 = as_type<float>(_1730);
    }
    float _1732 = _1722;
    float _1734 = _1690 * 0.693147182464599609375;
    float _1736 = _1720 * _1422;
    float _1738 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1740 = _1698;
    if (!_1264)
    {
        float _1742 = rint(_1618);
        float _1744 = precise::max(_1742, 0.0);
        uint _1746 = uint(_1744);
        uint _1748 = clamp(_1746, 0u, 65535u);
        _1740 = as_type<float>(_1748);
    }
    float _1750 = _1740;
    float _1752 = _1704 * _1706;
    float _1754 = _1718 * _1706;
    float _1756 = fma(_1752, 0.5, 0.5);
    float _1758 = fma(_1754, -0.5, 0.5);
    float _1760 = _1752;
    if (!_1264)
    {
        float _1762 = -_1352;
        float _1764 = _1055 + _1762;
        _1760 = _1764;
    }
    float _1766 = _1760;
    float _1768 = _1734;
    if (_1660)
    {
        float3 _6794 = float3(_1598, _1632, float(as_type<int>(_1732)));
        float3 _6798 = select(_6794, float3(0.0), isnan(_6794));
        float _1770 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6798.xy, uint(rint(_6798.z)), _1736, level(0.0));
        _1768 = _1770;
    }
    float _1772 = _1768;
    float3 _6808 = float3(_1756, _1758, _1738);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6808, float3(0.0), isnan(_6808)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6808, float3(0.0), isnan(_6808)), level(0.0)).x;
    float3 _6817 = float3(_1756, _1758, _1738);
    float4 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6817, float3(0.0), isnan(_6817)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6817, float3(0.0), isnan(_6817)), level(0.0)).xyzw;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = _1777.w;
    float _1787 = _1714;
    if (!_1264)
    {
        float3 _6840 = float3(_1766, _1714, float(as_type<int>(_1750)));
        float3 _6842 = select(_6840, float3(0.0), isnan(_6840));
        float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6842.xy, uint(rint(_6842.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6842.xy, uint(rint(_6842.z)), level(0.0)).x;
        _1787 = _1789;
    }
    float _1791 = _1787;
    float _1793 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1795 = int(_1793);
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1799 = _1797 != 0;
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1803 = _1801 != 0;
    int _1805 = abs(_525);
    int _1807 = abs(_533);
    float _1809 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1811 = int(_1809);
    int _1813 = abs(_1426);
    int _1815 = abs(_1444);
    int _1817 = abs(_1454);
    if (_1799)
    {
        _571 = _377;
    }
    float _1819 = _571;
    float _1821 = trunc(_827);
    int _1823 = int(_1821);
    float _1825 = float(uint(_1795));
    float _1827 = trunc(_865);
    int _1829 = int(_1827);
    float _1831 = float(uint(_1811));
    float _1833 = _1819;
    if (_1799)
    {
        _1672 = 1.0;
    }
    float _1835 = _1672;
    float _1837 = _1835;
    if (!_1799)
    {
        _1833 = _373;
    }
    float _1839 = _1833;
    if (!_1799)
    {
        _1837 = 1.2345600128173828125;
    }
    float _1841 = _1837;
    float _1843 = 1.0 / _1825;
    float _1845 = float(uint(_1823));
    int _1847 = ~_1795;
    int _1849 = _1847 + 1;
    float _1851 = _1839 * _1841;
    float _1853 = float(_1823);
    float _1855 = 1.0 / _1831;
    float _1857 = float(uint(_1829));
    int _1859 = as_type<int>(_1843) + (-2);
    float _1861 = floor(_1851);
    int _1863 = ~_1795;
    int _1865 = _1863 + 1;
    float _1867 = as_type<float>(_1859) * _1845;
    int _1869 = as_type<int>(_1855) + (-2);
    float _1871 = trunc(_1867);
    float _1873 = precise::max(_1871, 0.0);
    uint _1875 = uint(_1873);
    int _1877 = ~_1811;
    int _1879 = _1877 + 1;
    float _1881 = as_type<float>(_1869) * _1857;
    float _1883 = _1857;
    if (_1799)
    {
        _1883 = 1.0;
    }
    float _1885 = _1883;
    float _1887 = _1885;
    if (!_1799)
    {
        _1887 = 7.345489978790283203125;
    }
    float _1889 = _1887;
    float _1891 = -_1861;
    float _1893 = _1851 + _1891;
    float _1895 = trunc(_1881);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    float _1901 = _1889 * _377;
    int _1903 = _1865 * int(_1875);
    int _1905 = _1903 + _1823;
    float _1907 = floor(_1901);
    float _1909 = float(uint(_1905));
    int _1911 = _1879 * int(_1899);
    int _1913 = _1911 + _1829;
    float _1915 = as_type<float>(_1859) * _1909;
    float _1917 = float(_1795);
    float _1919 = float(uint(_1913));
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = -_1907;
    float _1929 = _1901 + _1927;
    bool _1931 = _1853 >= _1917;
    bool _1933 = isnan(_1853);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(_1917);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = as_type<float>(_1869) * _1919;
    float _1945 = trunc(_1941);
    int _1947 = int(_1945);
    float _1949 = trunc(_1943);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = int(_1875) + int(_1925);
    float _1957 = float(_1811);
    int _1959 = _1849 * _1955;
    int _1961 = _1959 + _1823;
    float _1963 = _1957 * _897;
    float _1965 = _1893 * _1957;
    bool _1967 = uint(_1961) >= uint(_1795);
    float _1969 = trunc(_1963);
    int _1971 = int(_1969);
    int _1973 = int(_1899) + int(_1953);
    float _1975 = _1929 * _1917;
    int _1977 = ~_1811;
    int _1979 = _1977 + 1;
    float _1981 = _1917 * _897;
    float _1983 = float(_1829);
    float _1985 = trunc(_1975);
    int _1987 = int(_1985);
    bool _1989 = _1983 >= _1957;
    bool _1991 = isnan(_1983);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(_1957);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    int _2001 = _1979 * _1973;
    int _2003 = _2001 + _1829;
    bool _2005 = !_1967;
    int _2007 = _2005 ? 0 : (-1);
    int _2009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2011 = _2009 != 0;
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2015 = _2013 != 0;
    float _2017 = trunc(_1965);
    int _2019 = int(_2017);
    int _2021 = ~_1955;
    int _2023 = _2021 + _2007;
    int _2025 = _2023 + 1;
    bool _2027 = !_2011;
    int _2029 = _2027 ? 0 : 1;
    bool _2031 = uint(_2003) >= uint(_1811);
    bool _2033 = !_2015;
    int _2035 = _2033 ? 0 : 1;
    float _2037 = trunc(_1999);
    int _2039 = int(_2037);
    int _2041 = abs(_2029);
    int _2043 = _1795 * _2025;
    int _2045 = _2043 + _1823;
    bool _2047 = !_2031;
    int _2049 = _2047 ? 0 : (-1);
    int _2051 = abs(_2035);
    float _2053 = trunc(_1981);
    int _2055 = int(_2053);
    int _2057 = ~_1973;
    int _2059 = _2057 + _2049;
    int _2061 = _2059 + 1;
    bool _2063 = _1795 == 0;
    int _2065 = _1987 * _2041;
    int _2067 = _2065 + _1823;
    int _2069 = _1811 * _2061;
    int _2071 = _2069 + _1829;
    int _2073 = ~_1947;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2063;
    int _2081 = _2079 ? _2045 : (-1);
    int _2083 = _2019 * _2051;
    int _2085 = _2083 + _1829;
    bool _2087 = _1811 == 0;
    int _2089 = ~_2039;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _2081 * _2077;
    bool _2097 = !_2087;
    int _2099 = _2097 ? _2071 : (-1);
    int _2101 = _1795 + (-1);
    int _2103 = _1811 + (-1);
    int _2105 = _2099 * _2093;
    int _2107 = _1947 * _2101;
    int _2109 = _2107 + _2095;
    bool _2111 = !_1803;
    int _2113 = _2111 ? 0 : 1;
    int _2115 = _2039 * _2103;
    int _2117 = _2115 + _2105;
    int _2119 = _2109 * _1805;
    int _2121 = abs(_539);
    int _2123 = _2117 * _1813;
    int _2125 = abs(as_type<int>(_1450));
    int _2127 = _2055 * _1807;
    int _2129 = _2127 + _2119;
    int _2131 = abs(_2113);
    int _2133 = _2067 * _2121;
    int _2135 = _2133 + _2129;
    int _2137 = ~_1811;
    int _2139 = _2137 + 1;
    int _2141 = _1971 * _1815;
    int _2143 = _2141 + _2123;
    float _2145 = float(uint(_2067));
    int _2147 = _1987 * _2131;
    int _2149 = _2147 + _2135;
    int _2151 = _2085 * _2125;
    int _2153 = _2151 + _2143;
    int _2155 = ~_1795;
    int _2157 = _2155 + 1;
    float _2159 = as_type<float>(_1859) * _2145;
    float _2161 = float(uint(_2149));
    int _2163 = _2019 * _1817;
    int _2165 = _2163 + _2153;
    int _2167 = ~_1795;
    int _2169 = _2167 + 1;
    float _2171 = float(uint(_2085));
    float _2173 = trunc(_2159);
    float _2175 = precise::max(_2173, 0.0);
    uint _2177 = uint(_2175);
    float _2179 = float(uint(_2165));
    float _2181 = as_type<float>(_1859) * _2161;
    float _2183 = as_type<float>(_1869) * _2179;
    float _2185 = trunc(_2181);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    float _2191 = trunc(_2183);
    float _2193 = precise::max(_2191, 0.0);
    uint _2195 = uint(_2193);
    int _2197 = _2157 * int(_2177);
    int _2199 = _2197 + _2067;
    int _2201 = ~_1811;
    int _2203 = _2201 + 1;
    float _2205 = float(uint(_2199));
    int _2207 = _2169 * int(_2189);
    int _2209 = _2207 + _2149;
    float _2211 = as_type<float>(_1859) * _2205;
    float _2213 = float(uint(_2209));
    int _2215 = _2203 * int(_2195);
    int _2217 = _2215 + _2165;
    float _2219 = trunc(_2211);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    float _2225 = as_type<float>(_1859) * _2213;
    float _2227 = as_type<float>(_1869) * _2171;
    float _2229 = float(uint(_2217));
    float _2231 = trunc(_2225);
    float _2233 = precise::max(_2231, 0.0);
    uint _2235 = uint(_2233);
    float _2237 = as_type<float>(_1869) * _2229;
    float _2239 = trunc(_2237);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = int(_2177) + int(_2223);
    int _2247 = ~_1811;
    int _2249 = _2247 + 1;
    float _2251 = trunc(_2227);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = int(_2189) + int(_2235);
    int _2259 = ~_1795;
    int _2261 = _2259 + 1;
    int _2263 = int(_2195) + int(_2243);
    int _2265 = _2169 * _2257;
    int _2267 = _2265 + _2149;
    int _2269 = _2261 * _2245;
    int _2271 = _2269 + _2067;
    bool _2273 = uint(_2267) >= uint(_1795);
    int _2275 = _2249 * _2263;
    int _2277 = _2275 + _2165;
    bool _2279 = uint(_2271) >= uint(_1795);
    int _2281 = _2139 * int(_2255);
    int _2283 = _2281 + _2085;
    bool _2285 = !_2273;
    int _2287 = _2285 ? 0 : (-1);
    bool _2289 = uint(_2277) >= uint(_1811);
    int _2291 = ~_2257;
    int _2293 = _2291 + _2287;
    int _2295 = _2293 + 1;
    float _2297 = float(uint(_2283));
    int _2299 = _1795 * _2295;
    int _2301 = _2299 + _2149;
    float _2303 = as_type<float>(_2295);
    if (_1264)
    {
        _2303 = 1.0;
    }
    float _2305 = _2303;
    float _2307 = as_type<float>(_1869) * _2297;
    float _2309 = _2305;
    float _2311 = _1791;
    float _2313 = _1774;
    if (!_1264)
    {
        int _2315 = _1320 << 4;
        int _2317 = _2315 + 2048;
        uint _2319 = uint(int(uint(_2317) >> uint(2)));
        uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
        int _2323 = int(_2319) & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        int _2327 = int(_2319) + 1;
        uint _2329 = uint(int(uint(_2327) >> uint(2)));
        int _2331 = _2327 & 3;
        float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
        int _2335 = _2317 + 8;
        uint _2337 = uint(int(uint(_2335) >> uint(2)));
        uint _2339 = uint(int(uint(int(_2337)) >> uint(2)));
        int _2341 = int(_2337) & 3;
        float _2343 = (*spvDescriptorSet0.vp_c15)._m0[int(_2339)][_2341];
        int _2345 = int(_2337) + 1;
        uint _2347 = uint(int(uint(_2345) >> uint(2)));
        int _2349 = _2345 & 3;
        float _2351 = (*spvDescriptorSet0.vp_c15)._m0[int(_2347)][_2349];
        float _2353 = _995 * _2333;
        float _2355 = fma(_351, _2325, _2353);
        float _2357 = fma(_353, _2343, _2355);
        float _2359 = _2357 + _2351;
        float _2361 = precise::clamp(_2359, 0.0, 1.0);
        float _2363 = -_2361;
        float _2365 = _2363 + _1791;
        float _2367 = fma(_2365, 500.0, 1.5);
        float _2369 = exp2(_2367);
        float _2371 = 0.0 + _2369;
        float _2373 = precise::clamp(_2371, 0.0, 1.0);
        _1348 = as_type<float>(_2317);
        _2309 = _2373;
    }
    float _2375 = _1348;
    float _2377 = _2309;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2381 = _1568 + _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2385 = _1570 + _2383;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2389 = _1572 + _2387;
    float _2391 = trunc(_2307);
    float _2393 = precise::max(_2391, 0.0);
    uint _2395 = uint(_2393);
    float _2397 = _2381 * _2381;
    float _2399 = fma(_2385, _2385, _2397);
    float _2401 = fma(_2389, _2389, _2399);
    float _2403 = rsqrt(_2401);
    float _2405 = sqrt(_2401);
    float _2407 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2409 = _2385 * _2407;
    float _2411 = _2389 * _2407;
    float _2413 = _2409 * _2409;
    float _2415 = _2411 * _2411;
    float _2417 = _2413 + _2415;
    float _2419 = sqrt(_2417);
    bool _2421 = _2419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2425 = _2419 + _2423;
    float _2427 = _353;
    float _2429 = _2417;
    float _2431 = _2425;
    float _2433 = _2381;
    float _2435 = _2409;
    float _2437 = _2411;
    float _2439 = _2413;
    float _2441 = _2415;
    if (_2421)
    {
        float _2443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2427 = _2443;
    }
    float _2445 = _2427;
    if (_2421)
    {
        float _2447 = rsqrt(_2417);
        _2429 = _2447;
    }
    float _2449 = _2429;
    if (_2421)
    {
        float _2451 = _2425 * _2445;
        _2431 = _2451;
    }
    float _2453 = _2431;
    if (_2421)
    {
        float _2455 = _2453 * 0.15915493667125701904296875;
        _1460 = _2455;
    }
    float _2457 = _1460;
    float _2459 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2461 = _2375;
    if (_2421)
    {
        float _2463 = _2457 * 6.283185482025146484375;
        float _2465 = sin(_2463);
        _2461 = _2465;
    }
    float _2467 = _2461;
    float _2469 = precise::max(0.0, _2459);
    float _2471 = _2453;
    float _2473 = _2469;
    if (_2421)
    {
        float _2475 = _2457 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        _2471 = _2477;
    }
    float _2479 = _2471;
    float _2481 = -_2407;
    float _2483 = -_2469;
    float _2485 = fma(_2381, _2481, _2483);
    if (_2421)
    {
        float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2433 = _2487;
    }
    float _2489 = _2433;
    float _2491 = _2489;
    if (_2421)
    {
        float _2493 = fma(_2467, _2489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2491 = _2493;
    }
    float _2495 = _2491;
    bool _2497 = !_2289;
    int _2499 = _2497 ? 0 : (-1);
    float _2501 = _2495;
    if (_2421)
    {
        float _2503 = _2449 * _2495;
        _2311 = _2503;
    }
    float _2505 = _2311;
    if (!_2421)
    {
        _2501 = _2485;
    }
    float _2507 = _2501;
    float _2509 = _2507;
    if (_2421)
    {
        float _2511 = _2479 + (-1.0);
        _2473 = _2511;
    }
    float _2513 = _2473;
    float _2515 = _2513;
    if (_2421)
    {
        float _2517 = _2409 * _2505;
        _2435 = _2517;
    }
    float _2519 = _2435;
    if (_2421)
    {
        float _2521 = _2411 * _2505;
        _2437 = _2521;
    }
    float _2523 = _2437;
    bool _2525 = !_2279;
    int _2527 = _2525 ? 0 : (-1);
    if (_2421)
    {
        float _2529 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2515 = _2529;
    }
    float _2531 = _2515;
    if (_2421)
    {
        float _2533 = _2519 * _2519;
        _2439 = _2533;
    }
    float _2535 = _2439;
    if (_2421)
    {
        float _2537 = _2523 * _2523;
        _2441 = _2537;
    }
    float _2539 = _2441;
    if (_2421)
    {
        float _2541 = fma(_2485, _2479, _2531);
        _2509 = _2541;
    }
    float _2543 = _2509;
    bool _2545 = !_2063;
    int _2547 = _2545 ? _2301 : (-1);
    float _2549 = fma(_2543, _2543, _2535);
    int _2551 = _2547 & 3;
    bool _2553 = _2551 != 0;
    int _2555 = _2547 & 3;
    bool _2557 = _2555 != 0;
    float _2559 = _2549 + _2539;
    bool _2561 = _2551 != 3;
    float _2563 = rsqrt(_2559);
    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2567 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2565);
    float _2569 = precise::clamp(_2567, 0.0, 1.0);
    float _2571 = -_2569;
    float _2573 = _2571 + 1.0;
    float _2575 = abs(_2573);
    float _2577 = log2(_2575);
    float _2579 = _2563 * _2519;
    float _2581 = _2563 * _2543;
    float _2583 = _2563 * _2523;
    float _2585 = _2579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2587 = _2581 + 1.0;
    float _2589 = -_2585;
    float _2591 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2589);
    float _2593 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2595 = -_2583;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2591);
    float _2599 = exp2(_2593);
    float _2601 = fma(_2597, -0.5, 0.5);
    float _2603 = fma(_2597, 0.5, 0.5);
    float _2605 = fma(_2603, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = sqrt(_2601);
    float _2609 = fma(_2603, _2605, -0.212114393711090087890625);
    float _2611 = fma(_2603, _2609, 1.570728778839111328125);
    float _2613 = -_2581;
    float _2615 = fma(_2599, _2587, _2613);
    float _2617 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2619 = _2557 ? 0 : 1;
    float _2621 = fma(_2615, 0.5, 0.5);
    bool _2623 = uint(_2551) >= 2u;
    float _2625 = _2607 * 0.636619746685028076171875;
    int _2627 = _2623 ? 0 : 1;
    bool _2629 = uint(_2551) > 1u;
    float _2631 = -_2611;
    float _2633 = fma(_2625, _2631, 1.0);
    float _2635 = _2617 * _377;
    float2 _8030 = float2(_2633, _2621);
    float3 _2639 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8030, float2(0.0), isnan(_8030)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8030, float2(0.0), isnan(_8030)), level(0.0)).xyz;
    float _2641 = _2639.x;
    float _2643 = _2639.y;
    float _2645 = _2639.z;
    int _2647 = ~_2245;
    int _2649 = _2647 + _2527;
    int _2651 = _2649 + 1;
    float _2653 = trunc(_2635);
    int _2655 = int(_2653);
    int _2657 = ~_2263;
    int _2659 = _2657 + _2499;
    int _2661 = _2659 + 1;
    float _2663 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2665 = ~_2627;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = _1795 * _2651;
    int _2673 = _2671 + _2067;
    int _2675 = _2669;
    if (_2561)
    {
        int _2677 = ~_2627;
        int _2679 = _2677 + 1;
        _2675 = _2679;
    }
    int _2681 = _2675;
    int _2683 = _1811 * _2661;
    int _2685 = _2683 + _2165;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2689 = _2687 != 0;
    float _2691 = abs(_1009);
    float _2693 = log2(_2691);
    bool _2695 = !_2063;
    int _2697 = _2695 ? _2673 : (-1);
    float _2699 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2663);
    bool _2701 = !_2087;
    int _2703 = _2701 ? _2685 : (-1);
    float _2705 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2707 = !_2553;
    int _2709 = _2707 ? 0 : 1;
    float _2711 = -_765;
    float _2713 = _2711 + 1.0;
    int _2715 = _2703 & 3;
    bool _2717 = _2715 != 0;
    float _2719 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2699);
    bool _2721 = !_2689;
    int _2723 = _2721 ? 0 : 1;
    float _2725 = exp2(_2705);
    bool _2727 = uint(_2715) > 1u;
    float _2729 = -_877;
    float _2731 = _2729 + 1.0;
    int _2733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2735 = _2733 != 0;
    float _2737 = -_879;
    float _2739 = _2737 + 1.0;
    int _2741 = _2703 & 3;
    bool _2743 = _2741 != 0;
    float _2745 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2747 = int(_2255) + int(_2395);
    float _2749 = -_371;
    float _2751 = _2749 + 1.0;
    int _2753 = ~_2619;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    float _2759 = -_869;
    float _2761 = _2759 + 1.0;
    int _2763 = _2757;
    if (!_2629)
    {
        int _2765 = ~_2619;
        int _2767 = _2765 + 1;
        _2763 = _2767;
    }
    int _2769 = _2763;
    float _2771 = exp2(_2745);
    bool _2773 = !_2735;
    int _2775 = _2773 ? 0 : 1;
    int _2777 = _2743 ? 0 : 1;
    float _2779 = -_2725;
    float _2781 = _2779 + 1.0;
    int _2783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2785 = _2783 != 0;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2789 = _2787 != 0;
    float _2791 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2795 = _2793 != 0;
    int _2797 = ~_1811;
    int _2799 = _2797 + 1;
    int _2801 = _2547 >> 31;
    int _2803 = _2703 >> 31;
    int _2805 = _2799 * _2747;
    int _2807 = _2805 + _2085;
    int _2809 = _2801 & 3;
    int _2811 = ~_2777;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = _2815;
    if (!_2727)
    {
        int _2819 = ~_2777;
        int _2821 = _2819 + 1;
        _2817 = _2821;
    }
    int _2823 = _2817;
    int _2825 = _2655 << 4;
    int _2827 = _2825 + 1712;
    int _2829 = _2803 & 3;
    int _2831 = _2547 + _2809;
    uint _2833 = uint(int(uint(_2827) >> uint(2)));
    uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
    int _2837 = int(_2833) & 3;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[int(_2835)][_2837];
    int _2841 = int(_2833) + 1;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    int _2845 = _2841 & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    bool _2849 = !_2717;
    int _2851 = _2849 ? 0 : 1;
    float _2853 = in.m_68.w;
    bool _2855 = uint(_2807) >= uint(_1811);
    int _2857 = _2703 + _2829;
    int _2859 = _2831 >> 2;
    int _2861 = _2827 + 8;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    uint _2865 = uint(int(uint(int(_2863)) >> uint(2)));
    int _2867 = int(_2863) & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    bool _2871 = !_2855;
    int _2873 = _2871 ? 0 : (-1);
    bool _2875 = _2551 != 3;
    bool _2877 = _2715 != 3;
    int _2879 = _2859 << 4;
    int _2881 = _2879 + 368;
    float _2883 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2885 = int(_2883);
    bool _2887 = !_2875;
    int _2889 = _2887 ? 0 : (-1);
    int _2891 = ~_2747;
    int _2893 = _2891 + _2873;
    int _2895 = _2893 + 1;
    bool _2897 = uint(_2715) >= 2u;
    uint _2899 = uint(int(uint(_2881) >> uint(2)));
    uint _2901 = uint(int(uint(int(_2899)) >> uint(2)));
    int _2903 = int(_2899) & 3;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[int(_2901)][_2903];
    int _2907 = int(_2899) + 1;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    int _2911 = _2907 & 3;
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[int(_2909)][_2911];
    int _2915 = _2857 >> 2;
    int _2917 = _1811 * _2895;
    int _2919 = _2917 + _2085;
    int _2921 = _2897 ? 0 : 1;
    bool _2923 = _2715 != 3;
    int _2925 = ~_2921;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = _2929;
    if (_2877)
    {
        int _2933 = ~_2921;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    bool _2939 = _373 > 0.5;
    int _2941 = _2915 << 4;
    int _2943 = _2941 + 512;
    float _2945 = -_227;
    int _2947 = _2939 ? as_type<int>(_2945) : as_type<int>(_227);
    bool _2949 = _2853 > 0.5;
    uint _2951 = uint(int(uint(_2943) >> uint(2)));
    uint _2953 = uint(int(uint(int(_2951)) >> uint(2)));
    int _2955 = int(_2951) & 3;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[int(_2953)][_2955];
    int _2959 = int(_2951) + 1;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    int _2963 = _2959 & 3;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[int(_2961)][_2963];
    bool _2967 = !_2923;
    int _2969 = _2967 ? 0 : (-1);
    bool _2971 = _377 > 0.5;
    float _2973 = -_223;
    int _2975 = _2971 ? as_type<int>(_2973) : as_type<int>(_223);
    int _2977 = _2881 + 8;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
    int _2983 = int(_2979) & 3;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[int(_2981)][_2983];
    int _2987 = int(_2979) + 1;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    int _2991 = _2987 & 3;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[int(_2989)][_2991];
    bool _2995 = !_2087;
    int _2997 = _2995 ? _2919 : (-1);
    float _2999 = _2847 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _3001 = _391 > 0.5;
    float _3003 = _2839 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _3005 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3007 = _3005 != 0;
    float _3009 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3011 = abs(_2769);
    int _3013 = _2943 + 8;
    uint _3015 = uint(int(uint(_3013) >> uint(2)));
    uint _3017 = uint(int(uint(int(_3015)) >> uint(2)));
    int _3019 = int(_3015) & 3;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[int(_3017)][_3019];
    int _3023 = int(_3015) + 1;
    uint _3025 = uint(int(uint(_3023) >> uint(2)));
    int _3027 = _3023 & 3;
    float _3029 = (*spvDescriptorSet0.vp_c9)._m0[int(_3025)][_3027];
    float _3031 = _2869 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3033 = _3003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3037 = abs(_2709);
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3041 = ~_3011;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3049 = _3031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3051 = ~_3037;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    float _3057 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3059 = _3045 * as_type<int>(_2913);
    float _3061 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3063 = _3047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3065 = abs(_2681);
    int _3067 = _3055 * as_type<int>(_2905);
    int _3069 = _3067 + _3059;
    float _3071 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3073 = int(_3071);
    out.m_72.x = _3057;
    out.m_72.y = _3061;
    out.m_72.z = _3063;
    int _3075 = abs(_2823);
    int _3077 = abs(_2851);
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _3081 = ~_3075;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    int _3087 = abs(_2937);
    out.m_74.x = _3033;
    out.m_74.y = _3009;
    out.m_74.z = _3049;
    out.m_74.w = _3079;
    int _3089 = _3085 * as_type<int>(_2965);
    int _3091 = abs(_2889);
    int _3093 = ~_3065;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    int _3099 = ~_3077;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    float _3105 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3107 = ~_3091;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    int _3113 = _3097 * as_type<int>(_2985);
    int _3115 = _3113 + _3069;
    int _3117 = abs(_2723);
    int _3119 = _3103 * as_type<int>(_2957);
    int _3121 = _3119 + _3089;
    int _3123 = _3111 * as_type<int>(_2993);
    int _3125 = _3123 + _3115;
    int _3127 = abs(_2969);
    float _3129 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3131 = ~_3087;
    int _3133 = _3131 + 1;
    int _3135 = _3133 + 1;
    float _3137 = float(uint(_3073));
    int _3139 = abs(_2775);
    int _3141 = _3135 * as_type<int>(_3021);
    int _3143 = _3141 + _3121;
    int _3145 = ~_3127;
    int _3147 = _3145 + 1;
    int _3149 = _3147 + 1;
    float _3151 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3153 = 1.0 / _3137;
    int _3155 = ~_3117;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = ~_3139;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    int _3167 = _3149 * as_type<int>(_3029);
    int _3169 = _3167 + _3143;
    int _3171 = abs(_2885);
    int _3173 = _3125 * _3159;
    int _3175 = _3169 * _3165;
    int _3177 = abs(_3073);
    int _3179 = _2697 * _3117;
    int _3181 = _3179 + _3173;
    float _3183 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3185 = _2997 * _3139;
    int _3187 = _3185 + _3175;
    float _3189 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3191 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3193 = float(uint(_3171));
    float _3195 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3197 = precise::clamp(_3195, 0.0, 1.0);
    float _3199 = -_1085;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3203 = -_1085;
    float _3205 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3189);
    float _3207 = float(uint(_2885));
    float _3209 = -_1085;
    float _3211 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3191);
    int _3213 = as_type<int>(_3153) + (-2);
    float _3215 = 1.0 / _3193;
    float _3217 = float(uint(_3187));
    float _3219 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3221 = float(uint(_3177));
    float _3223 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3205);
    int _3225 = abs(_3181);
    float _3227 = as_type<float>(_3213) * _3217;
    int _3229 = abs(_3187);
    float _3231 = 1.0 / _3207;
    float _3233 = float(uint(_3225));
    float _3235 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3211);
    float _3237 = float(uint(_3181));
    int _3239 = ~_3073;
    int _3241 = _3239 + 1;
    int _3243 = ~_2885;
    int _3245 = _3243 + 1;
    float _3247 = 1.0 / _3221;
    int _3249 = as_type<int>(_3215) + (-2);
    int _3251 = ~_3177;
    int _3253 = _3251 + 1;
    bool _3255 = !_2785;
    float _3257 = _3255 ? _227 : as_type<float>(_2947);
    float _3259 = as_type<float>(_3249) * _3233;
    float _3261 = float(uint(_3229));
    float _3263 = trunc(_3227);
    float _3265 = precise::max(_3263, 0.0);
    uint _3267 = uint(_3265);
    int _3269 = as_type<int>(_3231) + (-2);
    bool _3271 = !_3007;
    float _3273 = _3271 ? _223 : as_type<float>(_2975);
    bool _3275 = _3073 == 0;
    float _3277 = as_type<float>(_3269) * _3237;
    bool _3279 = _1009 <= 8000.0;
    bool _3281 = isnan(_1009);
    bool _3283 = _3279 || _3281;
    bool _3285 = isnan(8000.0);
    bool _3287 = _3283 || _3285;
    float _3289 = float(_3287);
    float _3291 = trunc(_3259);
    float _3293 = precise::max(_3291, 0.0);
    uint _3295 = uint(_3293);
    int _3297 = as_type<int>(_3247) + (-2);
    int _3299 = _3241 * int(_3267);
    int _3301 = _3299 + _3187;
    float _3303 = as_type<float>(_3297) * _3261;
    float _3305 = trunc(_3277);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3105);
    int _3313 = ~_3171;
    int _3315 = _3313 + 1;
    float _3317 = float(uint(_3301));
    float _3319 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3311);
    float _3321 = trunc(_3303);
    float _3323 = precise::max(_3321, 0.0);
    uint _3325 = uint(_3323);
    float _3327 = as_type<float>(_3213) * _3317;
    float _3329 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3331 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3329);
    int _3333 = _3245 * int(_3309);
    int _3335 = _3333 + _3181;
    float _3337 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3331);
    float _3339 = float(uint(_3335));
    float _3341 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3129);
    float _3343 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3151);
    int _3345 = _3253 * int(_3325);
    int _3347 = _3345 + _3229;
    float _3349 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3353 = _3315 * int(_3295);
    int _3355 = _3353 + _3225;
    float _3357 = as_type<float>(_3269) * _3339;
    float _3359 = float(uint(_3347));
    float _3361 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    float _3363 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3351);
    float _3365 = float(uint(_3355));
    float _3367 = trunc(_3357);
    float _3369 = precise::max(_3367, 0.0);
    uint _3371 = uint(_3369);
    float _3373 = as_type<float>(_3297) * _3359;
    float _3375 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3341);
    float _3377 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3343);
    float _3379 = -_227;
    int _3381 = _2949 ? as_type<int>(_3379) : as_type<int>(_227);
    float _3383 = as_type<float>(_3249) * _3365;
    float _3385 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3387 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3361);
    float _3389 = trunc(_3327);
    float _3391 = precise::max(_3389, 0.0);
    uint _3393 = uint(_3391);
    float _3395 = -_223;
    int _3397 = _3001 ? as_type<int>(_3395) : as_type<int>(_223);
    float _3399 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3363);
    bool _3401 = !_2795;
    float _3403 = _3401 ? _227 : as_type<float>(_3381);
    float _3405 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3407 = !_2789;
    float _3409 = _3407 ? _223 : as_type<float>(_3397);
    out.m_76.x = _3319;
    out.m_76.y = _3375;
    out.m_76.z = _3377;
    int _3411 = ~_3073;
    int _3413 = _3411 + 1;
    float _3415 = trunc(_3373);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    float _3421 = _3405 * _3219;
    int _3423 = int(_3309) + int(_3371);
    bool _3425 = _3073 == 0;
    float _3427 = fma(_3385, _3319, _3421);
    int _3429 = ~_2885;
    int _3431 = _3429 + 1;
    float _3433 = trunc(_3383);
    float _3435 = precise::max(_3433, 0.0);
    uint _3437 = uint(_3435);
    int _3439 = int(_3267) + int(_3393);
    int _3441 = ~_3171;
    int _3443 = _3441 + 1;
    int _3445 = _3431 * _3423;
    int _3447 = _3445 + _3181;
    int _3449 = ~_3177;
    int _3451 = _3449 + 1;
    int _3453 = _3413 * _3439;
    int _3455 = _3453 + _3187;
    int _3457 = int(_3325) + int(_3419);
    int _3459 = int(_3295) + int(_3437);
    bool _3461 = uint(_3447) >= uint(_2885);
    int _3463 = _3451 * _3457;
    int _3465 = _3463 + _3229;
    bool _3467 = uint(_3455) >= uint(_3073);
    int _3469 = _3443 * _3459;
    int _3471 = _3469 + _3225;
    bool _3473 = !_3461;
    int _3475 = _3473 ? 0 : (-1);
    float _3477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3479 = !_3467;
    int _3481 = _3479 ? 0 : (-1);
    bool _3483 = uint(_3465) >= uint(_3177);
    bool _3485 = uint(_3471) >= uint(_3171);
    int _3487 = _3181 ^ _2885;
    float _3489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3491 = ~_3423;
    int _3493 = _3491 + _3475;
    int _3495 = _3493 + 1;
    bool _3497 = !_3485;
    int _3499 = _3497 ? 0 : (-1);
    uint _3501 = uint(int(uint(_3487) >> uint(31)));
    int _3503 = _2885 * _3495;
    int _3505 = _3503 + _3181;
    int _3507 = ~_3439;
    int _3509 = _3507 + _3481;
    int _3511 = _3509 + 1;
    int _3513 = ~_3499;
    int _3515 = _3459 + _3513;
    int _3517 = _3515 + 1;
    float _3519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3521 = ~int(_3501);
    int _3523 = _3521 + 1;
    int _3525 = _3073 * _3511;
    int _3527 = _3525 + _3187;
    int _3529 = _3187 ^ _3073;
    bool _3531 = _2885 == 0;
    int _3533 = _3517 ^ _3523;
    uint _3535 = uint(int(uint(_3529) >> uint(31)));
    float _3537 = _3477 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3539 = !_3483;
    int _3541 = _3539 ? 0 : (-1);
    bool _3543 = !_3531;
    int _3545 = _3543 ? _3505 : (-1);
    int _3547 = ~_3523;
    int _3549 = _3547 + _3533;
    int _3551 = _3549 + 1;
    float _3553 = fma(_3405, _3405, 1.0);
    int _3555 = ~_3541;
    int _3557 = _3457 + _3555;
    int _3559 = _3557 + 1;
    float _3561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3563 = ~int(_3535);
    int _3565 = _3563 + 1;
    float _3567 = _3519 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3569 = !_3425;
    int _3571 = _3569 ? _3527 : (-1);
    float _3573 = float(_3545);
    bool _3575 = _2885 == 0;
    float _3577 = rsqrt(_3553);
    int _3579 = _3559 ^ _3565;
    float _3581 = fma(_3537, _3573, _501);
    float _3583 = float(_3571);
    float _3585 = _3273 + 0.5;
    int _3587 = ~_3565;
    int _3589 = _3587 + _3579;
    int _3591 = _3589 + 1;
    bool _3593 = !_3575;
    int _3595 = _3593 ? _3551 : (-1);
    float _3597 = fma(_3537, _3585, _3581);
    float _3599 = fma(_3567, _3583, _873);
    float _3601 = _3409 + 0.5;
    bool _3603 = !_3275;
    int _3605 = _3603 ? _3591 : (-1);
    float _3607 = _3489 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3609 = float(_3595);
    float _3611 = fma(_3567, _3601, _3599);
    float _3613 = _3257 + (-0.5);
    float _3615 = float(_3605);
    float _3617 = _3561 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3619 = -_631;
    float _3621 = fma(_3607, _3609, _3619);
    float _3623 = _3405 * _3577;
    float _3625 = fma(_3197, -2.0, 3.0);
    float _3627 = -_901;
    float _3629 = fma(_3617, _3615, _3627);
    float _3631 = _3403 + (-0.5);
    float _3633 = _3197 * _3197;
    float _3635 = -_3387;
    float _3637 = _3623 * _3635;
    float _3639 = -_3399;
    float _3641 = _3623 * _3639;
    float _3643 = -_3337;
    float _3645 = _3623 * _3643;
    float _3647 = -_3617;
    float _3649 = fma(_3647, _3631, _3629);
    float _3651 = _3633 * _3625;
    float _3653 = fma(_3577, _3223, _3641);
    float _3655 = _3405 * _3223;
    float _3657 = fma(_3577, _3235, _3645);
    float _3659 = -_2713;
    float _3661 = fma(_3409, _3659, _3611);
    float _3663 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2719);
    float _3665 = -_3651;
    float _3667 = _3665 + 1.0;
    float _3669 = -_3607;
    float _3671 = fma(_3669, _3613, _3621);
    float _3673 = -_2731;
    float _3675 = fma(_3273, _3673, _3597);
    float _3677 = _3405 * _3235;
    float _3679 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3651);
    float _3681 = fma(_3257, _2739, _3671);
    float _3683 = _3663 + _1680;
    float _3685 = _3289 * _3679;
    float _3687 = _3289;
    if (!_1660)
    {
        _3687 = 1.0;
    }
    float _3689 = _3687;
    float _3691 = fma(_3385, _3375, _3655);
    float _3693 = _3689;
    if (_1660)
    {
        bool _3695 = _1772 >= _1736;
        bool _3697 = isnan(_1772);
        bool _3699 = _3695 || _3697;
        bool _3701 = isnan(_1736);
        bool _3703 = _3699 || _3701;
        float _3705 = float(_3703);
        _3693 = _3705;
    }
    float _3707 = _3693;
    float _3709 = _3685 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3711 = _2791 * _1774;
    float _3713 = _3683 * 0.5;
    float _3715 = _2751 * _3709;
    float _3717 = precise::clamp(_3715, 0.0, 1.0);
    float _3719 = _3707 * _2377;
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1718;
    out.gl_Position.z = _3663;
    out.gl_Position.w = _1680;
    float _3721 = fma(_3385, _3377, _3677);
    float _3723 = -_3717;
    float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3727 = _2645 * _3711;
    float _3729 = -_2791;
    float _3731 = _3729 + 1.0;
    float _3733 = fma(_3577, _3219, _3637);
    float _3735 = -_3719;
    float _3737 = fma(_3735, _3725, 1.0);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    out.m_78.z = _3713;
    out.m_78.w = _1680;
    float _3741 = fma(_3403, _2761, _3649);
    float _3743 = _3387 + _3427;
    float _3745 = _3399 + _3691;
    float _3747 = _3337 + _3721;
    out.m_80.x = _3733;
    out.m_80.y = _3653;
    out.m_80.z = _3657;
    bool _3749 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3751 = isnan(_2405);
    bool _3753 = _3749 || _3751;
    bool _3755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3757 = _3753 || _3755;
    float _3759 = _1785 * _3711;
    float _3761 = _1785 * _3731;
    float _3763 = fma(_1785, _3727, _1783);
    float _3765 = _3739 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3767 = fma(_2641, _3759, _1779);
    float _3769 = fma(_2643, _3759, _1781);
    out.m_82.x = _3675;
    out.m_82.y = _3681;
    out.m_82.z = _3661;
    out.m_82.w = _3741;
    out.m_84.x = _3765;
    float _3771 = _3713;
    float _3773 = _3711;
    float _3775 = _3719;
    float _3777 = _3739;
    if (!_3757)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3779 = _3771;
    out.m_86.x = _3767;
    out.m_86.y = _3769;
    out.m_86.z = _3763;
    out.m_86.w = _3761;
    float _3781 = _3779;
    float _3783 = _3779;
    if (!_3757)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3785 = _2313;
    float _3787 = _3785;
    float _3789 = _3785;
    if (!_3757)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3791 = _3773;
    out.m_88.x = _3743;
    out.m_88.y = _3745;
    out.m_88.z = _3747;
    float _3793 = _3791;
    float _3795 = _3791;
    if (!_3757)
    {
        _1708 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3797 = _1708;
    float _3799 = _3797;
    float _3801 = _3797;
    if (!_3757)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3803 = _3775;
    float _3805 = _3803;
    float _3807 = _3803;
    if (!_3757)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3809 = _3777;
    bool _3811 = !_3757;
    float _3813 = _3809;
    float _3815 = _3809;
    if (!_3811)
    {
        bool _3817 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3819 = isnan(_2405);
        bool _3821 = _3817 || _3819;
        bool _3823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3825 = _3821 || _3823;
        if (!_3825)
        {
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3829 = _2405 + _3827;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3833 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3831;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3837 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3839 = 1.0 / _3833;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3857 = _3829 * _3839;
            float _3859 = precise::clamp(_3857, 0.0, 1.0);
            float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3865 = fma(_3859, _3837, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3867 = fma(_3859, _3863, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3869 = fma(_3859, _3843, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3859, _3847, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3873 = fma(_3859, _3851, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3875 = fma(_3859, _3855, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3789 = _3869;
            _3807 = _3873;
            _3783 = _3865;
            _3801 = _3871;
            _3795 = _3867;
            _3815 = _3875;
            _3877 = true;
        }
        else
        {
            bool _3879 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3881 = isnan(_2405);
            bool _3883 = _3879 || _3881;
            bool _3885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3887 = _3883 || _3885;
            if (!_3887)
            {
                _3781 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3889 = _3781;
            _3783 = _3889;
            if (!_3887)
            {
                _3787 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3891 = _3787;
            _3789 = _3891;
            if (!_3887)
            {
                _3793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3893 = _3793;
            _3795 = _3893;
            if (!_3887)
            {
                _3799 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3895 = _3799;
            _3801 = _3895;
            if (!_3887)
            {
                _3805 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3897 = _3805;
            _3807 = _3897;
            if (!_3887)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3899 = _3813;
            bool _3901 = !_3887;
            _3815 = _3899;
            if (!_3901)
            {
                bool _3903 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3905 = isnan(_2405);
                bool _3907 = _3903 || _3905;
                bool _3909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3911 = _3907 || _3909;
                if (!_3911)
                {
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3915 = _2405 + _3913;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3919 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3917;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3925 = 1.0 / _3919;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3943 = _3915 * _3925;
                    float _3945 = precise::clamp(_3943, 0.0, 1.0);
                    float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3951 = fma(_3945, _3923, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3953 = fma(_3945, _3949, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3955 = fma(_3945, _3929, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3945, _3933, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3959 = fma(_3945, _3937, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3961 = fma(_3945, _3941, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3789 = _3955;
                    _3807 = _3959;
                    _3783 = _3951;
                    _3801 = _3957;
                    _3795 = _3953;
                    _3815 = _3961;
                    _3877 = true;
                }
                else
                {
                    _3789 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3807 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3783 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3801 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3877 = false;
    float _3963 = _3789;
    float _3965 = _3807;
    float _3967 = _3783;
    float _3969 = _3801;
    float _3971 = _3795;
    float _3973 = _3815;
    float _3975 = fma(_3745, -0.5, 0.5);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = -_3963;
    float _3981 = _3979 + _3965;
    float _3983 = -_3967;
    float _3985 = _3983 + _3969;
    float _3987 = -_3971;
    float _3989 = _3987 + _3973;
    bool _3991 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3993 = fma(_3977, _3981, _3963);
    float _3995 = fma(_3977, _3985, _3967);
    float _3997 = fma(_3977, _3989, _3971);
    float _3999 = _3993 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4001 = fma(_3995, 0.298911988735198974609375, _3999);
    float _4003 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4005 = fma(_3997, 0.114477999508380889892578125, _4001);
    out.m_84.w = _4003;
    float _4007 = -_4005;
    float _4009 = _3995 + _4007;
    float _4011 = -_4005;
    float _4013 = _3993 + _4011;
    float _4015 = -_4005;
    float _4017 = _3997 + _4015;
    out.m_90.x = 0.0;
    float _4019 = fma(_4009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    float _4021 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    float _4023 = fma(_4017, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    out.m_92.x = _4019;
    out.m_92.y = _4021;
    out.m_92.z = _4023;
    if (!_3991)
    {
        return out;
    }
    float _4025 = -_1568;
    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4029 = -_1570;
    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4033 = -_1572;
    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4037 = _4027 * _4027;
    float _4039 = fma(_4031, _4031, _4037);
    float _4041 = fma(_4035, _4035, _4039);
    float _4043 = sqrt(_4041);
    float _4045 = rsqrt(_4041);
    float _4047 = -_4043;
    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4053 = precise::clamp(_4051, 0.0, 1.0);
    float _4055 = _4031 * _4045;
    float _4057 = _4027 * _4045;
    float _4059 = abs(_4053);
    float _4061 = log2(_4059);
    float _4063 = _4035 * _4045;
    float _4065 = _4055 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4067 = _3745 * _4057;
    float _4069 = -_4057;
    float _4071 = -_4065;
    float _4073 = fma(_4069, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4071);
    float _4075 = fma(_3743, _4055, _4067);
    float _4077 = -_4063;
    float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4073);
    float _4081 = fma(_3747, _4063, _4075);
    float _4083 = precise::clamp(_4081, 0.0, 1.0);
    float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4087 = _4079 + _4085;
    float _4089 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4091 = _4087 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4093 = precise::clamp(_4091, 0.0, 1.0);
    float _4095 = exp2(_4089);
    float _4097 = _4095 * _4093;
    float _4099 = _4083 * _4097;
    float _4101 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4103 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4105 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4101;
    out.m_90.y = _4103;
    out.m_90.z = _4105;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3877 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_111);
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    float _123 = _121;
    if (!_115)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_129);
        out.gl_Position.z = _4164;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_111);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
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
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_167);
        out.gl_Position.z = _4234;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _211;
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
    bool _265 = !_183;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _171 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _199 = _285;
    }
    float _287 = _199;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _185, _291);
    float _299 = fma(_287, _187, _293);
    float _301 = fma(_287, _189, _295);
    float _303 = fma(_297, _173, _191);
    float _305 = fma(_299, _173, _193);
    float _307 = fma(_301, _173, _195);
    bool _309 = !_289;
    float _327;
    if (!_309)
    {
        float _311 = in.m_68.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_111);
        float _333 = 1.0 / _331;
        float _335 = _147 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _341 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _345 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _341);
    float _347 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _343);
    float _349 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _345);
    float _351 = _347 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _353 = _349 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _355 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _357 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _359 = floor(_355);
    float _361 = floor(_357);
    float _363 = -_359;
    float _365 = _355 + _363;
    float _367 = -_361;
    float _369 = _357 + _367;
    float2 _4551 = float2(_365, _369);
    float _371 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4551, float2(0.0), isnan(_4551)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4551, float2(0.0), isnan(_4551)), level(0.0)).x;
    float _373 = in.m_68.y;
    float _375 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _377 = in.m_68.x;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _383;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _389 = 1.0 / _381;
    float _391 = in.m_68.z;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _399 = _397 != 0;
    float _401 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _375);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _405 = 1.0 / _385;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _337 + _407;
    float _411 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _413 = _373 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _415 = _373 * 2.0;
    float _417 = 1.0 / _395;
    float _419 = fma(_413, -2.0, _387);
    float _421 = _377 * 2.0;
    float _423 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = _337 + _425;
    float _429 = _409 * _389;
    float _431 = _377 + _373;
    float _433 = floor(_421);
    float _435 = -_403;
    float _437 = fma(_423, 2.0, _435);
    float _439 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _401);
    float _441 = _427 * _405;
    float _443 = _431 + (-1.0);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _447 = _337 + _445;
    float _449 = _377 + _391;
    float _451 = floor(_415);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _455 = _447 * _417;
    float _457 = _391 + _373;
    float _459 = _391 * 2.0;
    float _461 = _449 + (-1.0);
    bool _463 = _433 > 0.0;
    float _465 = _457 + (-1.0);
    bool _467 = _433 >= 0.0;
    bool _469 = isnan(_433);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = floor(_459);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _493 = _491 != 0;
    float _495 = _439 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _497 = _475 ? 0 : 1;
    float _499 = -_147;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[76].x, _437);
    bool _503 = _451 > 0.0;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _507 = int(_505);
    bool _509 = _451 >= 0.0;
    bool _511 = isnan(_451);
    bool _513 = _509 || _511;
    bool _515 = isnan(0.0);
    bool _517 = _513 || _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _519;
    bool _523 = !_489;
    int _525 = _523 ? 0 : 1;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _531 = !_485;
    int _533 = _531 ? 0 : 1;
    float _535 = fma(_521, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _537 = !_493;
    int _539 = _537 ? 0 : 1;
    float _541 = fma(_529, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _553 = _551 != 0;
    float _555 = _495 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _557 = ~_497;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    float _563 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _565 = int(_563);
    int _567 = _561;
    int _569 = as_type<int>(_451);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_463)
    {
        int _573 = ~_497;
        int _575 = _573 + 1;
        _567 = _575;
    }
    int _577 = _567;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    bool _583 = !_545;
    int _585 = _583 ? 0 : 1;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _593 = _591 != 0;
    float _595 = fma(_581, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_399)
    {
        _569 = 0;
    }
    int _597 = _569;
    float _599 = fma(_589, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _601 = _477 >= 0.0;
    bool _603 = isnan(_477);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _613 = log2(_611);
    bool _615 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _617 = isnan(_337);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _555);
    bool _629 = _477 > 0.0;
    float _631 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    int _633 = _609 ? 0 : 1;
    float _635 = fma(_353, (*spvDescriptorSet0.vp_c8)._m0[10].z, _627);
    bool _637 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _639 = isnan(_337);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    int _649 = _597;
    if (!_593)
    {
        _649 = 1;
    }
    int _651 = _649;
    float _653 = _635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _655 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _657 = isnan(_337);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    bool _667 = _651 != 1;
    float _669 = -_625;
    float _671 = _669 + 1.0;
    bool _673 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_337);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _647 * _671;
    float _687 = -_647;
    float _689 = _687 + 1.0;
    int _691 = ~_633;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    float _699 = _683;
    if (!_629)
    {
        int _701 = ~_633;
        int _703 = _701 + 1;
        _697 = _703;
    }
    int _705 = _697;
    float _707 = _683 * _689;
    float _709 = -_683;
    float _711 = _709 + 1.0;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_667)
    {
        _699 = _373;
    }
    float _715 = _699;
    float _717 = _665 * _711;
    float _719 = _715;
    if (_667)
    {
        _719 = _377;
    }
    float _721 = _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _723;
    float _727 = _535 * _717;
    float _729 = _495 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[83].z, _713);
    float _733 = float(_111);
    float _735 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _729);
    if (!_667)
    {
        _119 = _391;
    }
    float _737 = _119;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _739;
    float _743 = _737;
    if (_667)
    {
        _743 = _373;
    }
    float _745 = _743;
    float _747 = fma(_353, (*spvDescriptorSet0.vp_c8)._m0[11].z, _735);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _751 = _595 * _717;
    float _753 = float(_507);
    float _755 = _747 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _757 = fma(_725, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _759 = fma(_741, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _761 = 1.0 / _755;
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[83].w, _749);
    float _765 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _731);
    float _767 = _745;
    float _769 = _749;
    if (!_667)
    {
        _767 = _391;
    }
    float _771 = _767;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _775 = _771;
    if (_667)
    {
        _775 = _373;
    }
    float _777 = _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_667)
    {
        _769 = _373;
    }
    float _781 = _769;
    float _783 = 1.0 / _753;
    int _785 = abs(_585);
    float _787 = _777 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _789 = _781;
    if (_667)
    {
        _789 = _377;
    }
    float _791 = _789;
    float _793 = float(_785);
    float _795 = _653 + _755;
    float _797 = float(_705);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _801 = float(_565);
    float _803 = _613 * _147;
    float _805 = _793 * _797;
    float _807 = -_773;
    float _809 = fma(_799, 2.0, _807);
    float _811 = _795 * _761;
    float _813 = _811 * 0.5;
    float _815 = 1.0 / _801;
    float _817 = in.m_70.x;
    float _819 = in.m_70.y;
    float _821 = in.m_70.z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _825 = fma(_787, -2.0, _779);
    float _827 = _783 * _147;
    bool _829 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _831 = isnan(1.0);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _837 = _833 || _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _841 = 1.0 + _839;
    float _843 = exp2(_803);
    float _845 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[78].w, _823);
    float _847 = _805 * (-2.0);
    bool _849 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _861 = float(_577);
    float _863 = 1.0 / _733;
    float _865 = _815 * _147;
    float _867 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _859);
    float _869 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _763);
    float _871 = -_147;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[81].x, _809);
    float _875 = fma(_453, _847, _453);
    float _877 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _867);
    float _879 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _845);
    float _881 = 1.0 / _841;
    bool _883 = !_549;
    int _885 = _883 ? 0 : 1;
    float _887 = -_843;
    float _889 = _887 + 1.0;
    int _891 = abs(_885);
    float _893 = fma(_847, _817, _817);
    float _895 = _857 ? _889 : 0.0;
    float _897 = _863 * _147;
    float _899 = float(_891);
    float _901 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _825);
    float _903 = _899 * _861;
    if (_837)
    {
        float _905 = _895 * _881;
        _149 = _905;
    }
    float _907 = _149;
    int _909 = _517 ? 0 : 1;
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _913 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
    bool _915 = !_553;
    int _917 = _915 ? 0 : 1;
    float _919 = _377 + (-0.5);
    int _921 = ~_909;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = _903 * (-2.0);
    int _929 = _925;
    if (!_503)
    {
        int _931 = ~_909;
        int _933 = _931 + 1;
        _929 = _933;
    }
    int _935 = _929;
    float _937 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[196].x, _893);
    int _939 = abs(_917);
    float _941 = fma(_927, _819, _819);
    float _943 = -_665;
    float _945 = _943 + 1.0;
    float _947 = float(_935);
    float _949 = fma(_875, _907, _937);
    float _951 = float(_939);
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[143].x, _727);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[143].y, _751);
    float _957 = in.m_66.x;
    float _959 = in.m_66.y;
    float _961 = 1.0 / _913;
    float _963 = _951 * _947;
    float _965 = fma(_541, _707, _953);
    float _967 = fma(_599, _707, _955);
    float _969 = _373 + (-0.5);
    float _971 = _963 * (-2.0);
    float _973 = fma(_757, _685, _965);
    float _975 = fma(_759, _685, _967);
    float _977 = fma(_481, _927, _481);
    float _979 = fma(_971, _821, _821);
    float _981 = _391 + (-0.5);
    float _983 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[196].y, _941);
    float _985 = fma(_479, _971, _479);
    float _987 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _989 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _979);
    float _991 = fma(_977, _907, _983);
    float _993 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[146].x, _973);
    float _995 = _495 + _987;
    float _997 = fma(_985, _907, _989);
    float _999 = _949 * 0.15915493667125701904296875;
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[146].y, _975);
    float _1005 = _997 * 0.15915493667125701904296875;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1009 = _961 * _1007;
    float _1011 = _995 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1013 = _995 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1015 = _999 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    float _1019 = _993 * _957;
    bool _1021 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1023 = _1003 * _959;
    float _1025 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1011);
    float _1027 = fma(_351, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1013);
    bool _1029 = _1009 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _1033 = _1001 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _1041 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    float _1045 = fma(_353, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1027);
    float _1047 = _1037 * _1031;
    float _1049 = _1041 * _1039;
    float _1051 = _1001 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1057 = !_1021;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = _999 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1067 = _1017 * _1035;
    float _1069 = _1005 * 6.283185482025146484375;
    float _1071 = cos(_1069);
    float _1073 = _1017 * _1053;
    int _1075 = 2;
    if (!_1021)
    {
        _1075 = 1;
    }
    int _1077 = _1075;
    int _1079 = _1077;
    if (!_1029)
    {
        _1079 = _1059;
    }
    int _1081 = _1079;
    float _1083 = _1005 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1063 * _1035;
    float _1089 = _1063 * _1053;
    int _1091 = _1081 << 6;
    int _1093 = _1091 + 104;
    uint _1096 = uint(int(uint(_1093) >> uint(2)));
    uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
    int _1100 = int(_1096) & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    int _1104 = int(_1096) + 1;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    int _1108 = _1104 & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    float _1112 = trunc(_1055);
    int _1114 = int(_1112);
    float _1116 = _1017 * _1071;
    float _1118 = _1063 * _1071;
    float _1120 = _1053 * _1071;
    float _1122 = _1035 * _1071;
    float _1124 = _1116 * _1049;
    float _1126 = _1118 * _1049;
    int _1128 = _1091 + 56;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = trunc(_1065);
    int _1148 = int(_1146);
    float _1150 = fma(_1085, _1073, _1087);
    float _1152 = fma(_1085, _1087, _1073);
    float _1154 = -_1049;
    float _1156 = _1085 * _1154;
    float _1158 = -_1067;
    float _1160 = fma(_1085, _1089, _1158);
    float _1162 = -_1089;
    float _1164 = fma(_1085, _1067, _1162);
    float _1166 = fma(_1150, _1047, _1124);
    int _1168 = _1091 + 96;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    int _1186 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1188 = _1114 + _1186;
    int _1190 = _1188 + 1;
    float _1192 = fma(_1120, _1047, _1156);
    float _1194 = fma(_1160, _1047, _1126);
    float _1196 = fma(_1164, _411, _1166);
    bool _1198 = _1190 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1200 = fma(_1122, _411, _1192);
    float _1202 = fma(_1152, _411, _1194);
    int _1204 = _1091 + 48;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c15)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[int(_1216)][_1218];
    int _1222 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1224 = _1148 + _1222;
    int _1226 = _1224 + 1;
    float _1228 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1230 = _1190 | _1226;
    float _1232 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1228);
    int _1234 = _1091 + 64;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
    int _1240 = int(_1236) & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    int _1244 = int(_1236) + 1;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    int _1248 = _1244 & 3;
    float _1250 = (*spvDescriptorSet0.vp_c15)._m0[int(_1246)][_1248];
    bool _1252 = _1230 < 0;
    bool _1254 = _1252 || _1198;
    float _1256 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1258 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1232);
    float _1260 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1262 = _1226 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1264 = _1262 || _1254;
    float _1266 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1256);
    float _1268 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1270 = _1091 + 72;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1260);
    float _1290 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1266);
    float _1292 = _353 + _1268;
    float _1294 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1288);
    float _1296 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1300 = _1292 + _1298;
    float _1302 = _351 + _1296;
    int _1304 = _1190;
    int _1306 = _1148;
    float _1308 = _1302;
    float _1310 = _1292;
    float _1312 = _1300;
    float _1314 = as_type<float>(_1081);
    if (!_1264)
    {
        int _1316 = _1226 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1318 = _1316 + _1190;
        _1304 = _1318;
    }
    int _1320 = _1304;
    int _1322 = _1091 + 80;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    float _1340 = _1300 * _1300;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1302 + _1342;
    float _1346 = 0.0;
    float _1348 = as_type<float>(_1320);
    if (!_1264)
    {
        float _1350 = floor(_1055);
        _1346 = _1350;
    }
    float _1352 = _1346;
    int _1354 = 0;
    if (!_1264)
    {
        int _1356 = _1320 << 2;
        _1354 = _1356;
    }
    int _1358 = _1354;
    float _1360 = fma(_1344, _1344, _1340);
    int _1362 = _1358;
    if (!_1264)
    {
        uint _1364 = uint(int(uint(_1320) >> uint(2)));
        _1306 = int(_1364);
    }
    int _1366 = _1306;
    int _1368 = _1366;
    if (!_1264)
    {
        int _1370 = 12 & _1358;
        _1362 = _1370;
    }
    int _1372 = _1362;
    float _1374 = sqrt(_1360);
    float _1376 = _995 * _1184;
    if (!_1264)
    {
        int _1378 = _1366 << 4;
        int _1380 = _1378 + _1372;
        _1368 = _1380;
    }
    int _1382 = _1368;
    float _1384 = fma(_351, _1176, _1376);
    float _1386 = _995 * _1220;
    float _1388 = fma(_353, _1102, _1384);
    float _1390 = fma(_351, _1212, _1386);
    bool _1392 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = fma(_353, _1136, _1390);
    float _1396 = _1388 + _1110;
    float _1398 = _995 * _1250;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1414 = _1412 != 0;
    float _1416 = _1394 + _1144;
    float _1418 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1420 = fma(_351, _1242, _1398);
    float _1422 = 1.0 / _1396;
    bool _1424 = !_1406;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _495 + _1418;
    float _1430 = fma(_353, _1278, _1420);
    bool _1432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1434 = isnan(0.5);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1440 = _1436 || _1438;
    bool _1442 = !_1402;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = _1430 + _1286;
    bool _1448 = !_1410;
    float _1450 = _1448 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1452 = !_1414;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = _1418;
    float _1458 = _1220;
    float _1460 = _1450;
    if (!_1392)
    {
        _1456 = _1428;
    }
    float _1462 = _1456;
    bool _1464 = !_1392;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1374 + _1470;
        float _1474 = _1428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = rsqrt(_1360);
        float _1478 = _1472 * _1468;
        float _1480 = _1478 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1484 + (-1.0);
        float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = fma(_1488, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1496 = fma(_1428, _1484, _1492);
        float _1498 = _1476 * _1494;
        float _1500 = fma(_1344, _1498, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1502 = fma(_1300, _1498, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1308 = _1500;
        _1310 = _1502;
        _1466 = _1496;
        _1458 = _1488;
    }
    float _1504 = _1308;
    float _1506 = _1310;
    float _1508 = _1466;
    float _1510 = _1458;
    float _1512 = _1510;
    float _1514 = _1508;
    if (_1440)
    {
        _1312 = _1504;
    }
    float _1516 = _1312;
    float _1518 = _1516;
    if (_1440)
    {
        _1512 = _1506;
    }
    float _1520 = _1512;
    float _1522 = _1520;
    if (!_1440)
    {
        float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1526 = _495 + _1524;
        float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1530 = _351 + _1528;
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1534 = -_495;
        float _1536 = _1534 + _1508;
        float _1538 = _1526 * _1526;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1542 = _353 + _1540;
        float _1544 = -_351;
        float _1546 = _1544 + _1504;
        float _1548 = -_353;
        float _1550 = _1548 + _1506;
        float _1552 = fma(_1530, _1530, _1538);
        float _1554 = fma(_1542, _1542, _1552);
        float _1556 = sqrt(_1554);
        float _1558 = precise::min(_1556, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1560 = _1558 * _1532;
        float _1562 = fma(_1536, _1560, _495);
        float _1564 = fma(_1546, _1560, _351);
        float _1566 = fma(_1550, _1560, _353);
        _1514 = _1562;
        _1518 = _1564;
        _1522 = _1566;
    }
    float _1568 = _1514;
    float _1570 = _1518;
    float _1572 = _1522;
    int _1574 = _1091 + 88;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
    float _1592 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1598 = _1416 * _1422;
    float _1600 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1602 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1604 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1596);
    float _1606 = 0.0;
    if (!_1264)
    {
        int _1608 = _1382 + 400;
        uint _1610 = uint(int(uint(_1608) >> uint(2)));
        uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
        int _1614 = int(_1610) & 3;
        float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1600);
    bool _1622 = _1598 >= 0.0;
    float _1624 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1626 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1628 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1604);
    float _1630 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1632 = _1446 * _1422;
    bool _1634 = _1598 <= 1.0;
    bool _1636 = _1634 && _1622;
    float _1638 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1626);
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1644 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1646 = _1632 >= 0.0;
    bool _1648 = _1646 && _1636;
    float _1650 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1638);
    float _1652 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1642);
    float _1654 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1658 = _1632 <= 1.0;
    bool _1660 = _1658 && _1648;
    float _1662 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1664 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1652);
    float _1666 = -_1656;
    float _1668 = fma(_1666, _1654, 1.0);
    float _1670 = _1430;
    float _1672 = _1632;
    if (!_1264)
    {
        float _1674 = floor(_1065);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1680 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1664);
    float _1682 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1684 = _995 * _1338;
    float _1686 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1678);
    float _1688 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1682);
    float _1690 = log2(_1668);
    float _1692 = _1688;
    if (_1660)
    {
        float _1694 = float(_1081);
        _1314 = _1694;
    }
    float _1696 = _1314;
    float _1698 = fma(_351, _1330, _1684);
    float _1700 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1686);
    float _1702 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1704 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1700);
    float _1706 = 1.0 / _1680;
    float _1708 = _1704;
    if (!_1264)
    {
        float _1710 = -_1676;
        float _1712 = _1065 + _1710;
        _1692 = _1712;
    }
    float _1714 = _1692;
    float _1716 = fma(_353, _1582, _1698);
    float _1718 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1702);
    float _1720 = _1716 + _1590;
    float _1722 = _1684;
    if (_1660)
    {
        float _1724 = rint(_1696);
        float _1726 = precise::max(_1724, 0.0);
        uint _1728 = uint(_1726);
        uint _1730 = clamp(_1728, 0u, 65535u);
        _1722 = as_type<float>(_1730);
    }
    float _1732 = _1722;
    float _1734 = _1690 * 0.693147182464599609375;
    float _1736 = _1720 * _1422;
    float _1738 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1740 = _1698;
    if (!_1264)
    {
        float _1742 = rint(_1618);
        float _1744 = precise::max(_1742, 0.0);
        uint _1746 = uint(_1744);
        uint _1748 = clamp(_1746, 0u, 65535u);
        _1740 = as_type<float>(_1748);
    }
    float _1750 = _1740;
    float _1752 = _1704 * _1706;
    float _1754 = _1718 * _1706;
    float _1756 = fma(_1752, 0.5, 0.5);
    float _1758 = fma(_1754, -0.5, 0.5);
    float _1760 = _1752;
    if (!_1264)
    {
        float _1762 = -_1352;
        float _1764 = _1055 + _1762;
        _1760 = _1764;
    }
    float _1766 = _1760;
    float _1768 = _1734;
    if (_1660)
    {
        float3 _6794 = float3(_1598, _1632, float(as_type<int>(_1732)));
        float3 _6798 = select(_6794, float3(0.0), isnan(_6794));
        float _1770 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6798.xy, uint(rint(_6798.z)), _1736, level(0.0));
        _1768 = _1770;
    }
    float _1772 = _1768;
    float3 _6808 = float3(_1756, _1758, _1738);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6808, float3(0.0), isnan(_6808)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6808, float3(0.0), isnan(_6808)), level(0.0)).x;
    float3 _6817 = float3(_1756, _1758, _1738);
    float4 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6817, float3(0.0), isnan(_6817)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6817, float3(0.0), isnan(_6817)), level(0.0)).xyzw;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = _1777.w;
    float _1787 = _1714;
    if (!_1264)
    {
        float3 _6840 = float3(_1766, _1714, float(as_type<int>(_1750)));
        float3 _6842 = select(_6840, float3(0.0), isnan(_6840));
        float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6842.xy, uint(rint(_6842.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6842.xy, uint(rint(_6842.z)), level(0.0)).x;
        _1787 = _1789;
    }
    float _1791 = _1787;
    float _1793 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1795 = int(_1793);
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1799 = _1797 != 0;
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1803 = _1801 != 0;
    int _1805 = abs(_525);
    int _1807 = abs(_533);
    float _1809 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1811 = int(_1809);
    int _1813 = abs(_1426);
    int _1815 = abs(_1444);
    int _1817 = abs(_1454);
    if (_1799)
    {
        _571 = _377;
    }
    float _1819 = _571;
    float _1821 = trunc(_827);
    int _1823 = int(_1821);
    float _1825 = float(uint(_1795));
    float _1827 = trunc(_865);
    int _1829 = int(_1827);
    float _1831 = float(uint(_1811));
    float _1833 = _1819;
    if (_1799)
    {
        _1672 = 1.0;
    }
    float _1835 = _1672;
    float _1837 = _1835;
    if (!_1799)
    {
        _1833 = _373;
    }
    float _1839 = _1833;
    if (!_1799)
    {
        _1837 = 1.2345600128173828125;
    }
    float _1841 = _1837;
    float _1843 = 1.0 / _1825;
    float _1845 = float(uint(_1823));
    int _1847 = ~_1795;
    int _1849 = _1847 + 1;
    float _1851 = _1839 * _1841;
    float _1853 = float(_1823);
    float _1855 = 1.0 / _1831;
    float _1857 = float(uint(_1829));
    int _1859 = as_type<int>(_1843) + (-2);
    float _1861 = floor(_1851);
    int _1863 = ~_1795;
    int _1865 = _1863 + 1;
    float _1867 = as_type<float>(_1859) * _1845;
    int _1869 = as_type<int>(_1855) + (-2);
    float _1871 = trunc(_1867);
    float _1873 = precise::max(_1871, 0.0);
    uint _1875 = uint(_1873);
    int _1877 = ~_1811;
    int _1879 = _1877 + 1;
    float _1881 = as_type<float>(_1869) * _1857;
    float _1883 = _1857;
    if (_1799)
    {
        _1883 = 1.0;
    }
    float _1885 = _1883;
    float _1887 = _1885;
    if (!_1799)
    {
        _1887 = 7.345489978790283203125;
    }
    float _1889 = _1887;
    float _1891 = -_1861;
    float _1893 = _1851 + _1891;
    float _1895 = trunc(_1881);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    float _1901 = _1889 * _377;
    int _1903 = _1865 * int(_1875);
    int _1905 = _1903 + _1823;
    float _1907 = floor(_1901);
    float _1909 = float(uint(_1905));
    int _1911 = _1879 * int(_1899);
    int _1913 = _1911 + _1829;
    float _1915 = as_type<float>(_1859) * _1909;
    float _1917 = float(_1795);
    float _1919 = float(uint(_1913));
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = -_1907;
    float _1929 = _1901 + _1927;
    bool _1931 = _1853 >= _1917;
    bool _1933 = isnan(_1853);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(_1917);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = as_type<float>(_1869) * _1919;
    float _1945 = trunc(_1941);
    int _1947 = int(_1945);
    float _1949 = trunc(_1943);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = int(_1875) + int(_1925);
    float _1957 = float(_1811);
    int _1959 = _1849 * _1955;
    int _1961 = _1959 + _1823;
    float _1963 = _1957 * _897;
    float _1965 = _1893 * _1957;
    bool _1967 = uint(_1961) >= uint(_1795);
    float _1969 = trunc(_1963);
    int _1971 = int(_1969);
    int _1973 = int(_1899) + int(_1953);
    float _1975 = _1929 * _1917;
    int _1977 = ~_1811;
    int _1979 = _1977 + 1;
    float _1981 = _1917 * _897;
    float _1983 = float(_1829);
    float _1985 = trunc(_1975);
    int _1987 = int(_1985);
    bool _1989 = _1983 >= _1957;
    bool _1991 = isnan(_1983);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(_1957);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    int _2001 = _1979 * _1973;
    int _2003 = _2001 + _1829;
    bool _2005 = !_1967;
    int _2007 = _2005 ? 0 : (-1);
    int _2009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2011 = _2009 != 0;
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2015 = _2013 != 0;
    float _2017 = trunc(_1965);
    int _2019 = int(_2017);
    int _2021 = ~_1955;
    int _2023 = _2021 + _2007;
    int _2025 = _2023 + 1;
    bool _2027 = !_2011;
    int _2029 = _2027 ? 0 : 1;
    bool _2031 = uint(_2003) >= uint(_1811);
    bool _2033 = !_2015;
    int _2035 = _2033 ? 0 : 1;
    float _2037 = trunc(_1999);
    int _2039 = int(_2037);
    int _2041 = abs(_2029);
    int _2043 = _1795 * _2025;
    int _2045 = _2043 + _1823;
    bool _2047 = !_2031;
    int _2049 = _2047 ? 0 : (-1);
    int _2051 = abs(_2035);
    float _2053 = trunc(_1981);
    int _2055 = int(_2053);
    int _2057 = ~_1973;
    int _2059 = _2057 + _2049;
    int _2061 = _2059 + 1;
    bool _2063 = _1795 == 0;
    int _2065 = _1987 * _2041;
    int _2067 = _2065 + _1823;
    int _2069 = _1811 * _2061;
    int _2071 = _2069 + _1829;
    int _2073 = ~_1947;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2063;
    int _2081 = _2079 ? _2045 : (-1);
    int _2083 = _2019 * _2051;
    int _2085 = _2083 + _1829;
    bool _2087 = _1811 == 0;
    int _2089 = ~_2039;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _2081 * _2077;
    bool _2097 = !_2087;
    int _2099 = _2097 ? _2071 : (-1);
    int _2101 = _1795 + (-1);
    int _2103 = _1811 + (-1);
    int _2105 = _2099 * _2093;
    int _2107 = _1947 * _2101;
    int _2109 = _2107 + _2095;
    bool _2111 = !_1803;
    int _2113 = _2111 ? 0 : 1;
    int _2115 = _2039 * _2103;
    int _2117 = _2115 + _2105;
    int _2119 = _2109 * _1805;
    int _2121 = abs(_539);
    int _2123 = _2117 * _1813;
    int _2125 = abs(as_type<int>(_1450));
    int _2127 = _2055 * _1807;
    int _2129 = _2127 + _2119;
    int _2131 = abs(_2113);
    int _2133 = _2067 * _2121;
    int _2135 = _2133 + _2129;
    int _2137 = ~_1811;
    int _2139 = _2137 + 1;
    int _2141 = _1971 * _1815;
    int _2143 = _2141 + _2123;
    float _2145 = float(uint(_2067));
    int _2147 = _1987 * _2131;
    int _2149 = _2147 + _2135;
    int _2151 = _2085 * _2125;
    int _2153 = _2151 + _2143;
    int _2155 = ~_1795;
    int _2157 = _2155 + 1;
    float _2159 = as_type<float>(_1859) * _2145;
    float _2161 = float(uint(_2149));
    int _2163 = _2019 * _1817;
    int _2165 = _2163 + _2153;
    int _2167 = ~_1795;
    int _2169 = _2167 + 1;
    float _2171 = float(uint(_2085));
    float _2173 = trunc(_2159);
    float _2175 = precise::max(_2173, 0.0);
    uint _2177 = uint(_2175);
    float _2179 = float(uint(_2165));
    float _2181 = as_type<float>(_1859) * _2161;
    float _2183 = as_type<float>(_1869) * _2179;
    float _2185 = trunc(_2181);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    float _2191 = trunc(_2183);
    float _2193 = precise::max(_2191, 0.0);
    uint _2195 = uint(_2193);
    int _2197 = _2157 * int(_2177);
    int _2199 = _2197 + _2067;
    int _2201 = ~_1811;
    int _2203 = _2201 + 1;
    float _2205 = float(uint(_2199));
    int _2207 = _2169 * int(_2189);
    int _2209 = _2207 + _2149;
    float _2211 = as_type<float>(_1859) * _2205;
    float _2213 = float(uint(_2209));
    int _2215 = _2203 * int(_2195);
    int _2217 = _2215 + _2165;
    float _2219 = trunc(_2211);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    float _2225 = as_type<float>(_1859) * _2213;
    float _2227 = as_type<float>(_1869) * _2171;
    float _2229 = float(uint(_2217));
    float _2231 = trunc(_2225);
    float _2233 = precise::max(_2231, 0.0);
    uint _2235 = uint(_2233);
    float _2237 = as_type<float>(_1869) * _2229;
    float _2239 = trunc(_2237);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = int(_2177) + int(_2223);
    int _2247 = ~_1811;
    int _2249 = _2247 + 1;
    float _2251 = trunc(_2227);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = int(_2189) + int(_2235);
    int _2259 = ~_1795;
    int _2261 = _2259 + 1;
    int _2263 = int(_2195) + int(_2243);
    int _2265 = _2169 * _2257;
    int _2267 = _2265 + _2149;
    int _2269 = _2261 * _2245;
    int _2271 = _2269 + _2067;
    bool _2273 = uint(_2267) >= uint(_1795);
    int _2275 = _2249 * _2263;
    int _2277 = _2275 + _2165;
    bool _2279 = uint(_2271) >= uint(_1795);
    int _2281 = _2139 * int(_2255);
    int _2283 = _2281 + _2085;
    bool _2285 = !_2273;
    int _2287 = _2285 ? 0 : (-1);
    bool _2289 = uint(_2277) >= uint(_1811);
    int _2291 = ~_2257;
    int _2293 = _2291 + _2287;
    int _2295 = _2293 + 1;
    float _2297 = float(uint(_2283));
    int _2299 = _1795 * _2295;
    int _2301 = _2299 + _2149;
    float _2303 = as_type<float>(_2295);
    if (_1264)
    {
        _2303 = 1.0;
    }
    float _2305 = _2303;
    float _2307 = as_type<float>(_1869) * _2297;
    float _2309 = _2305;
    float _2311 = _1791;
    float _2313 = _1774;
    if (!_1264)
    {
        int _2315 = _1320 << 4;
        int _2317 = _2315 + 2048;
        uint _2319 = uint(int(uint(_2317) >> uint(2)));
        uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
        int _2323 = int(_2319) & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        int _2327 = int(_2319) + 1;
        uint _2329 = uint(int(uint(_2327) >> uint(2)));
        int _2331 = _2327 & 3;
        float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
        int _2335 = _2317 + 8;
        uint _2337 = uint(int(uint(_2335) >> uint(2)));
        uint _2339 = uint(int(uint(int(_2337)) >> uint(2)));
        int _2341 = int(_2337) & 3;
        float _2343 = (*spvDescriptorSet0.vp_c15)._m0[int(_2339)][_2341];
        int _2345 = int(_2337) + 1;
        uint _2347 = uint(int(uint(_2345) >> uint(2)));
        int _2349 = _2345 & 3;
        float _2351 = (*spvDescriptorSet0.vp_c15)._m0[int(_2347)][_2349];
        float _2353 = _995 * _2333;
        float _2355 = fma(_351, _2325, _2353);
        float _2357 = fma(_353, _2343, _2355);
        float _2359 = _2357 + _2351;
        float _2361 = precise::clamp(_2359, 0.0, 1.0);
        float _2363 = -_2361;
        float _2365 = _2363 + _1791;
        float _2367 = fma(_2365, 500.0, 1.5);
        float _2369 = exp2(_2367);
        float _2371 = 0.0 + _2369;
        float _2373 = precise::clamp(_2371, 0.0, 1.0);
        _1348 = as_type<float>(_2317);
        _2309 = _2373;
    }
    float _2375 = _1348;
    float _2377 = _2309;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2381 = _1568 + _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2385 = _1570 + _2383;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2389 = _1572 + _2387;
    float _2391 = trunc(_2307);
    float _2393 = precise::max(_2391, 0.0);
    uint _2395 = uint(_2393);
    float _2397 = _2381 * _2381;
    float _2399 = fma(_2385, _2385, _2397);
    float _2401 = fma(_2389, _2389, _2399);
    float _2403 = rsqrt(_2401);
    float _2405 = sqrt(_2401);
    float _2407 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2409 = _2385 * _2407;
    float _2411 = _2389 * _2407;
    float _2413 = _2409 * _2409;
    float _2415 = _2411 * _2411;
    float _2417 = _2413 + _2415;
    float _2419 = sqrt(_2417);
    bool _2421 = _2419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2425 = _2419 + _2423;
    float _2427 = _353;
    float _2429 = _2417;
    float _2431 = _2425;
    float _2433 = _2381;
    float _2435 = _2409;
    float _2437 = _2411;
    float _2439 = _2413;
    float _2441 = _2415;
    if (_2421)
    {
        float _2443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2427 = _2443;
    }
    float _2445 = _2427;
    if (_2421)
    {
        float _2447 = rsqrt(_2417);
        _2429 = _2447;
    }
    float _2449 = _2429;
    if (_2421)
    {
        float _2451 = _2425 * _2445;
        _2431 = _2451;
    }
    float _2453 = _2431;
    if (_2421)
    {
        float _2455 = _2453 * 0.15915493667125701904296875;
        _1460 = _2455;
    }
    float _2457 = _1460;
    float _2459 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2461 = _2375;
    if (_2421)
    {
        float _2463 = _2457 * 6.283185482025146484375;
        float _2465 = sin(_2463);
        _2461 = _2465;
    }
    float _2467 = _2461;
    float _2469 = precise::max(0.0, _2459);
    float _2471 = _2453;
    float _2473 = _2469;
    if (_2421)
    {
        float _2475 = _2457 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        _2471 = _2477;
    }
    float _2479 = _2471;
    float _2481 = -_2407;
    float _2483 = -_2469;
    float _2485 = fma(_2381, _2481, _2483);
    if (_2421)
    {
        float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2433 = _2487;
    }
    float _2489 = _2433;
    float _2491 = _2489;
    if (_2421)
    {
        float _2493 = fma(_2467, _2489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2491 = _2493;
    }
    float _2495 = _2491;
    bool _2497 = !_2289;
    int _2499 = _2497 ? 0 : (-1);
    float _2501 = _2495;
    if (_2421)
    {
        float _2503 = _2449 * _2495;
        _2311 = _2503;
    }
    float _2505 = _2311;
    if (!_2421)
    {
        _2501 = _2485;
    }
    float _2507 = _2501;
    float _2509 = _2507;
    if (_2421)
    {
        float _2511 = _2479 + (-1.0);
        _2473 = _2511;
    }
    float _2513 = _2473;
    float _2515 = _2513;
    if (_2421)
    {
        float _2517 = _2409 * _2505;
        _2435 = _2517;
    }
    float _2519 = _2435;
    if (_2421)
    {
        float _2521 = _2411 * _2505;
        _2437 = _2521;
    }
    float _2523 = _2437;
    bool _2525 = !_2279;
    int _2527 = _2525 ? 0 : (-1);
    if (_2421)
    {
        float _2529 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2515 = _2529;
    }
    float _2531 = _2515;
    if (_2421)
    {
        float _2533 = _2519 * _2519;
        _2439 = _2533;
    }
    float _2535 = _2439;
    if (_2421)
    {
        float _2537 = _2523 * _2523;
        _2441 = _2537;
    }
    float _2539 = _2441;
    if (_2421)
    {
        float _2541 = fma(_2485, _2479, _2531);
        _2509 = _2541;
    }
    float _2543 = _2509;
    bool _2545 = !_2063;
    int _2547 = _2545 ? _2301 : (-1);
    float _2549 = fma(_2543, _2543, _2535);
    int _2551 = _2547 & 3;
    bool _2553 = _2551 != 0;
    int _2555 = _2547 & 3;
    bool _2557 = _2555 != 0;
    float _2559 = _2549 + _2539;
    bool _2561 = _2551 != 3;
    float _2563 = rsqrt(_2559);
    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2567 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2565);
    float _2569 = precise::clamp(_2567, 0.0, 1.0);
    float _2571 = -_2569;
    float _2573 = _2571 + 1.0;
    float _2575 = abs(_2573);
    float _2577 = log2(_2575);
    float _2579 = _2563 * _2519;
    float _2581 = _2563 * _2543;
    float _2583 = _2563 * _2523;
    float _2585 = _2579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2587 = _2581 + 1.0;
    float _2589 = -_2585;
    float _2591 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2589);
    float _2593 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2595 = -_2583;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2591);
    float _2599 = exp2(_2593);
    float _2601 = fma(_2597, -0.5, 0.5);
    float _2603 = fma(_2597, 0.5, 0.5);
    float _2605 = fma(_2603, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = sqrt(_2601);
    float _2609 = fma(_2603, _2605, -0.212114393711090087890625);
    float _2611 = fma(_2603, _2609, 1.570728778839111328125);
    float _2613 = -_2581;
    float _2615 = fma(_2599, _2587, _2613);
    float _2617 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2619 = _2557 ? 0 : 1;
    float _2621 = fma(_2615, 0.5, 0.5);
    bool _2623 = uint(_2551) >= 2u;
    float _2625 = _2607 * 0.636619746685028076171875;
    int _2627 = _2623 ? 0 : 1;
    bool _2629 = uint(_2551) > 1u;
    float _2631 = -_2611;
    float _2633 = fma(_2625, _2631, 1.0);
    float _2635 = _2617 * _377;
    float2 _8030 = float2(_2633, _2621);
    float3 _2639 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8030, float2(0.0), isnan(_8030)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8030, float2(0.0), isnan(_8030)), level(0.0)).xyz;
    float _2641 = _2639.x;
    float _2643 = _2639.y;
    float _2645 = _2639.z;
    int _2647 = ~_2245;
    int _2649 = _2647 + _2527;
    int _2651 = _2649 + 1;
    float _2653 = trunc(_2635);
    int _2655 = int(_2653);
    int _2657 = ~_2263;
    int _2659 = _2657 + _2499;
    int _2661 = _2659 + 1;
    float _2663 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2665 = ~_2627;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = _1795 * _2651;
    int _2673 = _2671 + _2067;
    int _2675 = _2669;
    if (_2561)
    {
        int _2677 = ~_2627;
        int _2679 = _2677 + 1;
        _2675 = _2679;
    }
    int _2681 = _2675;
    int _2683 = _1811 * _2661;
    int _2685 = _2683 + _2165;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2689 = _2687 != 0;
    float _2691 = abs(_1009);
    float _2693 = log2(_2691);
    bool _2695 = !_2063;
    int _2697 = _2695 ? _2673 : (-1);
    float _2699 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2663);
    bool _2701 = !_2087;
    int _2703 = _2701 ? _2685 : (-1);
    float _2705 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2707 = !_2553;
    int _2709 = _2707 ? 0 : 1;
    float _2711 = -_765;
    float _2713 = _2711 + 1.0;
    int _2715 = _2703 & 3;
    bool _2717 = _2715 != 0;
    float _2719 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2699);
    bool _2721 = !_2689;
    int _2723 = _2721 ? 0 : 1;
    float _2725 = exp2(_2705);
    bool _2727 = uint(_2715) > 1u;
    float _2729 = -_877;
    float _2731 = _2729 + 1.0;
    int _2733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2735 = _2733 != 0;
    float _2737 = -_879;
    float _2739 = _2737 + 1.0;
    int _2741 = _2703 & 3;
    bool _2743 = _2741 != 0;
    float _2745 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2747 = int(_2255) + int(_2395);
    float _2749 = -_371;
    float _2751 = _2749 + 1.0;
    int _2753 = ~_2619;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    float _2759 = -_869;
    float _2761 = _2759 + 1.0;
    int _2763 = _2757;
    if (!_2629)
    {
        int _2765 = ~_2619;
        int _2767 = _2765 + 1;
        _2763 = _2767;
    }
    int _2769 = _2763;
    float _2771 = exp2(_2745);
    bool _2773 = !_2735;
    int _2775 = _2773 ? 0 : 1;
    int _2777 = _2743 ? 0 : 1;
    float _2779 = -_2725;
    float _2781 = _2779 + 1.0;
    int _2783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2785 = _2783 != 0;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2789 = _2787 != 0;
    float _2791 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2795 = _2793 != 0;
    int _2797 = ~_1811;
    int _2799 = _2797 + 1;
    int _2801 = _2547 >> 31;
    int _2803 = _2703 >> 31;
    int _2805 = _2799 * _2747;
    int _2807 = _2805 + _2085;
    int _2809 = _2801 & 3;
    int _2811 = ~_2777;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = _2815;
    if (!_2727)
    {
        int _2819 = ~_2777;
        int _2821 = _2819 + 1;
        _2817 = _2821;
    }
    int _2823 = _2817;
    int _2825 = _2655 << 4;
    int _2827 = _2825 + 1712;
    int _2829 = _2803 & 3;
    int _2831 = _2547 + _2809;
    uint _2833 = uint(int(uint(_2827) >> uint(2)));
    uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
    int _2837 = int(_2833) & 3;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[int(_2835)][_2837];
    int _2841 = int(_2833) + 1;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    int _2845 = _2841 & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    bool _2849 = !_2717;
    int _2851 = _2849 ? 0 : 1;
    float _2853 = in.m_68.w;
    bool _2855 = uint(_2807) >= uint(_1811);
    int _2857 = _2703 + _2829;
    int _2859 = _2831 >> 2;
    int _2861 = _2827 + 8;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    uint _2865 = uint(int(uint(int(_2863)) >> uint(2)));
    int _2867 = int(_2863) & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    bool _2871 = !_2855;
    int _2873 = _2871 ? 0 : (-1);
    bool _2875 = _2551 != 3;
    bool _2877 = _2715 != 3;
    int _2879 = _2859 << 4;
    int _2881 = _2879 + 368;
    float _2883 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2885 = int(_2883);
    bool _2887 = !_2875;
    int _2889 = _2887 ? 0 : (-1);
    int _2891 = ~_2747;
    int _2893 = _2891 + _2873;
    int _2895 = _2893 + 1;
    bool _2897 = uint(_2715) >= 2u;
    uint _2899 = uint(int(uint(_2881) >> uint(2)));
    uint _2901 = uint(int(uint(int(_2899)) >> uint(2)));
    int _2903 = int(_2899) & 3;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[int(_2901)][_2903];
    int _2907 = int(_2899) + 1;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    int _2911 = _2907 & 3;
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[int(_2909)][_2911];
    int _2915 = _2857 >> 2;
    int _2917 = _1811 * _2895;
    int _2919 = _2917 + _2085;
    int _2921 = _2897 ? 0 : 1;
    bool _2923 = _2715 != 3;
    int _2925 = ~_2921;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = _2929;
    if (_2877)
    {
        int _2933 = ~_2921;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    bool _2939 = _373 > 0.5;
    int _2941 = _2915 << 4;
    int _2943 = _2941 + 512;
    float _2945 = -_227;
    int _2947 = _2939 ? as_type<int>(_2945) : as_type<int>(_227);
    bool _2949 = _2853 > 0.5;
    uint _2951 = uint(int(uint(_2943) >> uint(2)));
    uint _2953 = uint(int(uint(int(_2951)) >> uint(2)));
    int _2955 = int(_2951) & 3;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[int(_2953)][_2955];
    int _2959 = int(_2951) + 1;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    int _2963 = _2959 & 3;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[int(_2961)][_2963];
    bool _2967 = !_2923;
    int _2969 = _2967 ? 0 : (-1);
    bool _2971 = _377 > 0.5;
    float _2973 = -_223;
    int _2975 = _2971 ? as_type<int>(_2973) : as_type<int>(_223);
    int _2977 = _2881 + 8;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
    int _2983 = int(_2979) & 3;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[int(_2981)][_2983];
    int _2987 = int(_2979) + 1;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    int _2991 = _2987 & 3;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[int(_2989)][_2991];
    bool _2995 = !_2087;
    int _2997 = _2995 ? _2919 : (-1);
    float _2999 = _2847 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _3001 = _391 > 0.5;
    float _3003 = _2839 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _3005 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3007 = _3005 != 0;
    float _3009 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3011 = abs(_2769);
    int _3013 = _2943 + 8;
    uint _3015 = uint(int(uint(_3013) >> uint(2)));
    uint _3017 = uint(int(uint(int(_3015)) >> uint(2)));
    int _3019 = int(_3015) & 3;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[int(_3017)][_3019];
    int _3023 = int(_3015) + 1;
    uint _3025 = uint(int(uint(_3023) >> uint(2)));
    int _3027 = _3023 & 3;
    float _3029 = (*spvDescriptorSet0.vp_c9)._m0[int(_3025)][_3027];
    float _3031 = _2869 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3033 = _3003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3037 = abs(_2709);
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3041 = ~_3011;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3049 = _3031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3051 = ~_3037;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    float _3057 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3059 = _3045 * as_type<int>(_2913);
    float _3061 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3063 = _3047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3065 = abs(_2681);
    int _3067 = _3055 * as_type<int>(_2905);
    int _3069 = _3067 + _3059;
    float _3071 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3073 = int(_3071);
    out.m_72.x = _3057;
    out.m_72.y = _3061;
    out.m_72.z = _3063;
    int _3075 = abs(_2823);
    int _3077 = abs(_2851);
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _3081 = ~_3075;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    int _3087 = abs(_2937);
    out.m_74.x = _3033;
    out.m_74.y = _3009;
    out.m_74.z = _3049;
    out.m_74.w = _3079;
    int _3089 = _3085 * as_type<int>(_2965);
    int _3091 = abs(_2889);
    int _3093 = ~_3065;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    int _3099 = ~_3077;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    float _3105 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3107 = ~_3091;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    int _3113 = _3097 * as_type<int>(_2985);
    int _3115 = _3113 + _3069;
    int _3117 = abs(_2723);
    int _3119 = _3103 * as_type<int>(_2957);
    int _3121 = _3119 + _3089;
    int _3123 = _3111 * as_type<int>(_2993);
    int _3125 = _3123 + _3115;
    int _3127 = abs(_2969);
    float _3129 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3131 = ~_3087;
    int _3133 = _3131 + 1;
    int _3135 = _3133 + 1;
    float _3137 = float(uint(_3073));
    int _3139 = abs(_2775);
    int _3141 = _3135 * as_type<int>(_3021);
    int _3143 = _3141 + _3121;
    int _3145 = ~_3127;
    int _3147 = _3145 + 1;
    int _3149 = _3147 + 1;
    float _3151 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3153 = 1.0 / _3137;
    int _3155 = ~_3117;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = ~_3139;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    int _3167 = _3149 * as_type<int>(_3029);
    int _3169 = _3167 + _3143;
    int _3171 = abs(_2885);
    int _3173 = _3125 * _3159;
    int _3175 = _3169 * _3165;
    int _3177 = abs(_3073);
    int _3179 = _2697 * _3117;
    int _3181 = _3179 + _3173;
    float _3183 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3185 = _2997 * _3139;
    int _3187 = _3185 + _3175;
    float _3189 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3191 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3193 = float(uint(_3171));
    float _3195 = fma(_2771, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3197 = precise::clamp(_3195, 0.0, 1.0);
    float _3199 = -_1085;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3203 = -_1085;
    float _3205 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3189);
    float _3207 = float(uint(_2885));
    float _3209 = -_1085;
    float _3211 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3191);
    int _3213 = as_type<int>(_3153) + (-2);
    float _3215 = 1.0 / _3193;
    float _3217 = float(uint(_3187));
    float _3219 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3221 = float(uint(_3177));
    float _3223 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3205);
    int _3225 = abs(_3181);
    float _3227 = as_type<float>(_3213) * _3217;
    int _3229 = abs(_3187);
    float _3231 = 1.0 / _3207;
    float _3233 = float(uint(_3225));
    float _3235 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3211);
    float _3237 = float(uint(_3181));
    int _3239 = ~_3073;
    int _3241 = _3239 + 1;
    int _3243 = ~_2885;
    int _3245 = _3243 + 1;
    float _3247 = 1.0 / _3221;
    int _3249 = as_type<int>(_3215) + (-2);
    int _3251 = ~_3177;
    int _3253 = _3251 + 1;
    bool _3255 = !_2785;
    float _3257 = _3255 ? _227 : as_type<float>(_2947);
    float _3259 = as_type<float>(_3249) * _3233;
    float _3261 = float(uint(_3229));
    float _3263 = trunc(_3227);
    float _3265 = precise::max(_3263, 0.0);
    uint _3267 = uint(_3265);
    int _3269 = as_type<int>(_3231) + (-2);
    bool _3271 = !_3007;
    float _3273 = _3271 ? _223 : as_type<float>(_2975);
    bool _3275 = _3073 == 0;
    float _3277 = as_type<float>(_3269) * _3237;
    bool _3279 = _1009 <= 8000.0;
    bool _3281 = isnan(_1009);
    bool _3283 = _3279 || _3281;
    bool _3285 = isnan(8000.0);
    bool _3287 = _3283 || _3285;
    float _3289 = float(_3287);
    float _3291 = trunc(_3259);
    float _3293 = precise::max(_3291, 0.0);
    uint _3295 = uint(_3293);
    int _3297 = as_type<int>(_3247) + (-2);
    int _3299 = _3241 * int(_3267);
    int _3301 = _3299 + _3187;
    float _3303 = as_type<float>(_3297) * _3261;
    float _3305 = trunc(_3277);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3105);
    int _3313 = ~_3171;
    int _3315 = _3313 + 1;
    float _3317 = float(uint(_3301));
    float _3319 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3311);
    float _3321 = trunc(_3303);
    float _3323 = precise::max(_3321, 0.0);
    uint _3325 = uint(_3323);
    float _3327 = as_type<float>(_3213) * _3317;
    float _3329 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3331 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3329);
    int _3333 = _3245 * int(_3309);
    int _3335 = _3333 + _3181;
    float _3337 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3331);
    float _3339 = float(uint(_3335));
    float _3341 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3129);
    float _3343 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3151);
    int _3345 = _3253 * int(_3325);
    int _3347 = _3345 + _3229;
    float _3349 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3353 = _3315 * int(_3295);
    int _3355 = _3353 + _3225;
    float _3357 = as_type<float>(_3269) * _3339;
    float _3359 = float(uint(_3347));
    float _3361 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    float _3363 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3351);
    float _3365 = float(uint(_3355));
    float _3367 = trunc(_3357);
    float _3369 = precise::max(_3367, 0.0);
    uint _3371 = uint(_3369);
    float _3373 = as_type<float>(_3297) * _3359;
    float _3375 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3341);
    float _3377 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3343);
    float _3379 = -_227;
    int _3381 = _2949 ? as_type<int>(_3379) : as_type<int>(_227);
    float _3383 = as_type<float>(_3249) * _3365;
    float _3385 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3387 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3361);
    float _3389 = trunc(_3327);
    float _3391 = precise::max(_3389, 0.0);
    uint _3393 = uint(_3391);
    float _3395 = -_223;
    int _3397 = _3001 ? as_type<int>(_3395) : as_type<int>(_223);
    float _3399 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3363);
    bool _3401 = !_2795;
    float _3403 = _3401 ? _227 : as_type<float>(_3381);
    float _3405 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3407 = !_2789;
    float _3409 = _3407 ? _223 : as_type<float>(_3397);
    out.m_76.x = _3319;
    out.m_76.y = _3375;
    out.m_76.z = _3377;
    int _3411 = ~_3073;
    int _3413 = _3411 + 1;
    float _3415 = trunc(_3373);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    float _3421 = _3405 * _3219;
    int _3423 = int(_3309) + int(_3371);
    bool _3425 = _3073 == 0;
    float _3427 = fma(_3385, _3319, _3421);
    int _3429 = ~_2885;
    int _3431 = _3429 + 1;
    float _3433 = trunc(_3383);
    float _3435 = precise::max(_3433, 0.0);
    uint _3437 = uint(_3435);
    int _3439 = int(_3267) + int(_3393);
    int _3441 = ~_3171;
    int _3443 = _3441 + 1;
    int _3445 = _3431 * _3423;
    int _3447 = _3445 + _3181;
    int _3449 = ~_3177;
    int _3451 = _3449 + 1;
    int _3453 = _3413 * _3439;
    int _3455 = _3453 + _3187;
    int _3457 = int(_3325) + int(_3419);
    int _3459 = int(_3295) + int(_3437);
    bool _3461 = uint(_3447) >= uint(_2885);
    int _3463 = _3451 * _3457;
    int _3465 = _3463 + _3229;
    bool _3467 = uint(_3455) >= uint(_3073);
    int _3469 = _3443 * _3459;
    int _3471 = _3469 + _3225;
    bool _3473 = !_3461;
    int _3475 = _3473 ? 0 : (-1);
    float _3477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3479 = !_3467;
    int _3481 = _3479 ? 0 : (-1);
    bool _3483 = uint(_3465) >= uint(_3177);
    bool _3485 = uint(_3471) >= uint(_3171);
    int _3487 = _3181 ^ _2885;
    float _3489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3491 = ~_3423;
    int _3493 = _3491 + _3475;
    int _3495 = _3493 + 1;
    bool _3497 = !_3485;
    int _3499 = _3497 ? 0 : (-1);
    uint _3501 = uint(int(uint(_3487) >> uint(31)));
    int _3503 = _2885 * _3495;
    int _3505 = _3503 + _3181;
    int _3507 = ~_3439;
    int _3509 = _3507 + _3481;
    int _3511 = _3509 + 1;
    int _3513 = ~_3499;
    int _3515 = _3459 + _3513;
    int _3517 = _3515 + 1;
    float _3519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3521 = ~int(_3501);
    int _3523 = _3521 + 1;
    int _3525 = _3073 * _3511;
    int _3527 = _3525 + _3187;
    int _3529 = _3187 ^ _3073;
    bool _3531 = _2885 == 0;
    int _3533 = _3517 ^ _3523;
    uint _3535 = uint(int(uint(_3529) >> uint(31)));
    float _3537 = _3477 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3539 = !_3483;
    int _3541 = _3539 ? 0 : (-1);
    bool _3543 = !_3531;
    int _3545 = _3543 ? _3505 : (-1);
    int _3547 = ~_3523;
    int _3549 = _3547 + _3533;
    int _3551 = _3549 + 1;
    float _3553 = fma(_3405, _3405, 1.0);
    int _3555 = ~_3541;
    int _3557 = _3457 + _3555;
    int _3559 = _3557 + 1;
    float _3561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3563 = ~int(_3535);
    int _3565 = _3563 + 1;
    float _3567 = _3519 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3569 = !_3425;
    int _3571 = _3569 ? _3527 : (-1);
    float _3573 = float(_3545);
    bool _3575 = _2885 == 0;
    float _3577 = rsqrt(_3553);
    int _3579 = _3559 ^ _3565;
    float _3581 = fma(_3537, _3573, _501);
    float _3583 = float(_3571);
    float _3585 = _3273 + 0.5;
    int _3587 = ~_3565;
    int _3589 = _3587 + _3579;
    int _3591 = _3589 + 1;
    bool _3593 = !_3575;
    int _3595 = _3593 ? _3551 : (-1);
    float _3597 = fma(_3537, _3585, _3581);
    float _3599 = fma(_3567, _3583, _873);
    float _3601 = _3409 + 0.5;
    bool _3603 = !_3275;
    int _3605 = _3603 ? _3591 : (-1);
    float _3607 = _3489 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3609 = float(_3595);
    float _3611 = fma(_3567, _3601, _3599);
    float _3613 = _3257 + (-0.5);
    float _3615 = float(_3605);
    float _3617 = _3561 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3619 = -_631;
    float _3621 = fma(_3607, _3609, _3619);
    float _3623 = _3405 * _3577;
    float _3625 = fma(_3197, -2.0, 3.0);
    float _3627 = -_901;
    float _3629 = fma(_3617, _3615, _3627);
    float _3631 = _3403 + (-0.5);
    float _3633 = _3197 * _3197;
    float _3635 = -_3387;
    float _3637 = _3623 * _3635;
    float _3639 = -_3399;
    float _3641 = _3623 * _3639;
    float _3643 = -_3337;
    float _3645 = _3623 * _3643;
    float _3647 = -_3617;
    float _3649 = fma(_3647, _3631, _3629);
    float _3651 = _3633 * _3625;
    float _3653 = fma(_3577, _3223, _3641);
    float _3655 = _3405 * _3223;
    float _3657 = fma(_3577, _3235, _3645);
    float _3659 = -_2713;
    float _3661 = fma(_3409, _3659, _3611);
    float _3663 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2719);
    float _3665 = -_3651;
    float _3667 = _3665 + 1.0;
    float _3669 = -_3607;
    float _3671 = fma(_3669, _3613, _3621);
    float _3673 = -_2731;
    float _3675 = fma(_3273, _3673, _3597);
    float _3677 = _3405 * _3235;
    float _3679 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3651);
    float _3681 = fma(_3257, _2739, _3671);
    float _3683 = _3663 + _1680;
    float _3685 = _3289 * _3679;
    float _3687 = _3289;
    if (!_1660)
    {
        _3687 = 1.0;
    }
    float _3689 = _3687;
    float _3691 = fma(_3385, _3375, _3655);
    float _3693 = _3689;
    if (_1660)
    {
        bool _3695 = _1772 >= _1736;
        bool _3697 = isnan(_1772);
        bool _3699 = _3695 || _3697;
        bool _3701 = isnan(_1736);
        bool _3703 = _3699 || _3701;
        float _3705 = float(_3703);
        _3693 = _3705;
    }
    float _3707 = _3693;
    float _3709 = _3685 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3711 = _2791 * _1774;
    float _3713 = _3683 * 0.5;
    float _3715 = _2751 * _3709;
    float _3717 = precise::clamp(_3715, 0.0, 1.0);
    float _3719 = _3707 * _2377;
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1718;
    out.gl_Position.z = _3663;
    out.gl_Position.w = _1680;
    float _3721 = fma(_3385, _3377, _3677);
    float _3723 = -_3717;
    float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3727 = _2645 * _3711;
    float _3729 = -_2791;
    float _3731 = _3729 + 1.0;
    float _3733 = fma(_3577, _3219, _3637);
    float _3735 = -_3719;
    float _3737 = fma(_3735, _3725, 1.0);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    out.m_78.z = _3713;
    out.m_78.w = _1680;
    float _3741 = fma(_3403, _2761, _3649);
    float _3743 = _3387 + _3427;
    float _3745 = _3399 + _3691;
    float _3747 = _3337 + _3721;
    out.m_80.x = _3733;
    out.m_80.y = _3653;
    out.m_80.z = _3657;
    bool _3749 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3751 = isnan(_2405);
    bool _3753 = _3749 || _3751;
    bool _3755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3757 = _3753 || _3755;
    float _3759 = _1785 * _3711;
    float _3761 = _1785 * _3731;
    float _3763 = fma(_1785, _3727, _1783);
    float _3765 = _3739 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3767 = fma(_2641, _3759, _1779);
    float _3769 = fma(_2643, _3759, _1781);
    out.m_82.x = _3675;
    out.m_82.y = _3681;
    out.m_82.z = _3661;
    out.m_82.w = _3741;
    out.m_84.x = _3765;
    float _3771 = _3713;
    float _3773 = _3711;
    float _3775 = _3719;
    float _3777 = _3739;
    if (!_3757)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3779 = _3771;
    out.m_86.x = _3767;
    out.m_86.y = _3769;
    out.m_86.z = _3763;
    out.m_86.w = _3761;
    float _3781 = _3779;
    float _3783 = _3779;
    if (!_3757)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3785 = _2313;
    float _3787 = _3785;
    float _3789 = _3785;
    if (!_3757)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3791 = _3773;
    out.m_88.x = _3743;
    out.m_88.y = _3745;
    out.m_88.z = _3747;
    float _3793 = _3791;
    float _3795 = _3791;
    if (!_3757)
    {
        _1708 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3797 = _1708;
    float _3799 = _3797;
    float _3801 = _3797;
    if (!_3757)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3803 = _3775;
    float _3805 = _3803;
    float _3807 = _3803;
    if (!_3757)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3809 = _3777;
    bool _3811 = !_3757;
    float _3813 = _3809;
    float _3815 = _3809;
    if (!_3811)
    {
        bool _3817 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3819 = isnan(_2405);
        bool _3821 = _3817 || _3819;
        bool _3823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3825 = _3821 || _3823;
        if (!_3825)
        {
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3829 = _2405 + _3827;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3833 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3831;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3837 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3839 = 1.0 / _3833;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3857 = _3829 * _3839;
            float _3859 = precise::clamp(_3857, 0.0, 1.0);
            float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3865 = fma(_3859, _3837, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3867 = fma(_3859, _3863, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3869 = fma(_3859, _3843, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3859, _3847, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3873 = fma(_3859, _3851, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3875 = fma(_3859, _3855, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3789 = _3869;
            _3807 = _3873;
            _3783 = _3865;
            _3801 = _3871;
            _3795 = _3867;
            _3815 = _3875;
            _3877 = true;
        }
        else
        {
            bool _3879 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3881 = isnan(_2405);
            bool _3883 = _3879 || _3881;
            bool _3885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3887 = _3883 || _3885;
            if (!_3887)
            {
                _3781 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3889 = _3781;
            _3783 = _3889;
            if (!_3887)
            {
                _3787 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3891 = _3787;
            _3789 = _3891;
            if (!_3887)
            {
                _3793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3893 = _3793;
            _3795 = _3893;
            if (!_3887)
            {
                _3799 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3895 = _3799;
            _3801 = _3895;
            if (!_3887)
            {
                _3805 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3897 = _3805;
            _3807 = _3897;
            if (!_3887)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3899 = _3813;
            bool _3901 = !_3887;
            _3815 = _3899;
            if (!_3901)
            {
                bool _3903 = _2405 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3905 = isnan(_2405);
                bool _3907 = _3903 || _3905;
                bool _3909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3911 = _3907 || _3909;
                if (!_3911)
                {
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3915 = _2405 + _3913;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3919 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3917;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3925 = 1.0 / _3919;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3943 = _3915 * _3925;
                    float _3945 = precise::clamp(_3943, 0.0, 1.0);
                    float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3951 = fma(_3945, _3923, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3953 = fma(_3945, _3949, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3955 = fma(_3945, _3929, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3945, _3933, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3959 = fma(_3945, _3937, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3961 = fma(_3945, _3941, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3789 = _3955;
                    _3807 = _3959;
                    _3783 = _3951;
                    _3801 = _3957;
                    _3795 = _3953;
                    _3815 = _3961;
                    _3877 = true;
                }
                else
                {
                    _3789 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3807 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3783 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3801 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3877 = false;
    float _3963 = _3789;
    float _3965 = _3807;
    float _3967 = _3783;
    float _3969 = _3801;
    float _3971 = _3795;
    float _3973 = _3815;
    float _3975 = fma(_3745, -0.5, 0.5);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = -_3963;
    float _3981 = _3979 + _3965;
    float _3983 = -_3967;
    float _3985 = _3983 + _3969;
    float _3987 = -_3971;
    float _3989 = _3987 + _3973;
    bool _3991 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3993 = fma(_3977, _3981, _3963);
    float _3995 = fma(_3977, _3985, _3967);
    float _3997 = fma(_3977, _3989, _3971);
    float _3999 = _3993 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _4001 = fma(_3995, 0.298911988735198974609375, _3999);
    float _4003 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4005 = fma(_3997, 0.114477999508380889892578125, _4001);
    out.m_84.w = _4003;
    float _4007 = -_4005;
    float _4009 = _3995 + _4007;
    float _4011 = -_4005;
    float _4013 = _3993 + _4011;
    float _4015 = -_4005;
    float _4017 = _3997 + _4015;
    out.m_90.x = 0.0;
    float _4019 = fma(_4009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    float _4021 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    float _4023 = fma(_4017, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4005);
    out.m_92.x = _4019;
    out.m_92.y = _4021;
    out.m_92.z = _4023;
    if (!_3991)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4025 = -_1568;
    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4029 = -_1570;
    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4033 = -_1572;
    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4037 = _4027 * _4027;
    float _4039 = fma(_4031, _4031, _4037);
    float _4041 = fma(_4035, _4035, _4039);
    float _4043 = sqrt(_4041);
    float _4045 = rsqrt(_4041);
    float _4047 = -_4043;
    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4053 = precise::clamp(_4051, 0.0, 1.0);
    float _4055 = _4031 * _4045;
    float _4057 = _4027 * _4045;
    float _4059 = abs(_4053);
    float _4061 = log2(_4059);
    float _4063 = _4035 * _4045;
    float _4065 = _4055 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4067 = _3745 * _4057;
    float _4069 = -_4057;
    float _4071 = -_4065;
    float _4073 = fma(_4069, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4071);
    float _4075 = fma(_3743, _4055, _4067);
    float _4077 = -_4063;
    float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4073);
    float _4081 = fma(_3747, _4063, _4075);
    float _4083 = precise::clamp(_4081, 0.0, 1.0);
    float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4087 = _4079 + _4085;
    float _4089 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4091 = _4087 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4093 = precise::clamp(_4091, 0.0, 1.0);
    float _4095 = exp2(_4089);
    float _4097 = _4095 * _4093;
    float _4099 = _4083 * _4097;
    float _4101 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4103 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4105 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4101;
    out.m_90.y = _4103;
    out.m_90.z = _4105;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

