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
    float4 m_78 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_74 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2979 = false;
    bool _537 = false;
    bool _341 = false;
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
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_59.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3284 = as_type<float>(_127);
        out.gl_Position.z = _3284;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_141)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _129 = as_type<int>(_161);
    }
    int _163 = _129;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_163);
        out.gl_Position.z = _3353;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _175 = _169 * _167;
    float _177 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    float _181 = _177 * _173;
    float _183 = _179 * 6.283185482025146484375;
    float _185 = floor(_179);
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _181);
    int _189 = as_type<int>(_171) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_171) & 2;
    bool _195 = _193 != 0;
    float _197 = _183 * 0.15915493667125701904296875;
    bool _199 = !_195;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = floor(_187);
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _187 * 6.283185482025146484375;
    bool _211 = !_191;
    float _213 = _211 ? (-0.5) : 0.5;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _221 = _219 != 0;
    float _223 = _209 * 0.15915493667125701904296875;
    bool _225 = !_207;
    int _227 = _225 ? 0 : 1;
    float _229 = _197 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = -_185;
    float _235 = _179 + _233;
    bool _237 = !_217;
    int _239 = _237 ? 0 : 1;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _243 = abs(_239);
    float _245 = _223 * 6.283185482025146484375;
    float _247 = cos(_245);
    float _249 = -_203;
    float _251 = _187 + _249;
    bool _253 = _235 < 0.5;
    float _255 = float(_253);
    float _257 = -_235;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _261 = !_221;
    int _263 = _261 ? 0 : 1;
    int _265 = abs(_227);
    float _267 = -_255;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = fma(_231, 0.5, 0.5);
    int _273 = abs(_263);
    float _275 = -_271;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_243);
    float _281 = fma(_247, 0.5, 0.5);
    bool _283 = _251 < 0.5;
    float _285 = float(_283);
    float _287 = -_251;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _291 = float(_265);
    float _293 = abs(_259);
    float _295 = _279 * _293;
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _305 = abs(_289);
    float _307 = _279 * _305;
    float _309 = float(_273);
    float _311 = fma(_291, _277, _295);
    float _313 = fma(_291, _303, _307);
    float _315 = abs(_269);
    float _317 = fma(_309, _315, _311);
    float _319 = abs(_299);
    float _321 = fma(_309, _319, _313);
    bool _323 = !_241;
    float _339;
    if (!_323)
    {
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _327 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        float _343 = float(_111);
        float _345 = 1.0 / _343;
        float _347 = _145 * _345;
        _339 = _347;
    }
    _341 = false;
    float _349 = _339;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _349 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = _349 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _349 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _371;
    bool _375 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_349);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = 1.0 / _365;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _373;
    float _393 = 1.0 / _369;
    float _395 = _353 * _387;
    bool _397 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _399 = isnan(_349);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_385;
    float _411 = _409 + 1.0;
    float _413 = _407 * _411;
    float _415 = _357 * _391;
    bool _417 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_349);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_407;
    float _431 = _429 + 1.0;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = _427 * _431;
    float _439 = -_427;
    float _441 = _439 + 1.0;
    float _443 = _361 * _393;
    bool _445 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_349);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = fma(_435, _443, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_459, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _455 * _441;
    float _475 = fma(_465, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_469, _443, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = -_455;
    float _481 = _479 + 1.0;
    float _483 = _471 * _473;
    float _485 = _475 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _487;
    float _491 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _485);
    float _499 = fma(_489, _415, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _501 = fma(_461, _437, _491);
    float _503 = fma(_495, _415, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = fma(_477, _437, _497);
    float _507 = fma(_499, _413, _501);
    float _509 = fma(_503, _413, _505);
    float _511 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[146].x, _507);
    float _513 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[146].y, _509);
    bool _515 = !_389;
    float _533;
    float _535;
    if (!_515)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _519 = _165 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _521 = float(_111);
        float _523 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _525 = _523 * _517;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _521;
        _535 = _531;
        _537 = true;
    }
    else
    {
        float _539 = float(_111);
        float _541 = 1.0 / _539;
        float _543 = _145 * _541;
        _533 = _539;
        _535 = _543;
    }
    _537 = false;
    float _545 = _533;
    float _547 = _535;
    float _549 = in.m_56.x;
    float _551 = in.m_56.y;
    float _553 = in.m_56.z;
    float _555 = in.m_68.x;
    float _557 = in.m_68.y;
    float _559 = in.m_68.z;
    float _561 = in.m_68.w;
    float _563 = in.m_70.x;
    float _565 = in.m_70.y;
    float _567 = in.m_70.z;
    float _569 = in.m_70.w;
    float _571 = _551 * _557;
    float _573 = _551 * _565;
    float _575 = fma(_549, _555, _571);
    float _577 = fma(_549, _563, _573);
    float _579 = fma(_553, _559, _575);
    float _581 = fma(_553, _567, _577);
    float _583 = _579 + _561;
    float _585 = _581 + _569;
    float _587 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _589 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _591 = floor(_587);
    float _593 = floor(_589);
    float _595 = -_591;
    float _597 = _587 + _595;
    float _599 = -_593;
    float _601 = _589 + _599;
    float2 _4007 = float2(_597, _601);
    float _603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4007, float2(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4007, float2(0.0), isnan(_4007)), level(0.0)).x;
    float _605 = in.m_72.x;
    float _607 = in.m_72.y;
    float _609 = in.m_72.z;
    float _611 = in.m_72.w;
    float _613 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _615 = _551 * _607;
    float _617 = fma(_549, _605, _615);
    float _619 = fma(_553, _609, _617);
    float _621 = _619 + _611;
    float _623 = _621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _625 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _627 = _621 + _625;
    float _629 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[11].x, _623);
    float _631 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[11].z, _629);
    float _633 = _621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _635 = _631 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _637 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[10].x, _633);
    float _639 = 1.0 / _635;
    float _641 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[10].z, _637);
    float _643 = _641 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _645 = _643 + _635;
    float _647 = _645 * _639;
    float _649 = _647 * 0.5;
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _653 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[30].w, _651);
    float _655 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _657 = in.m_74.x;
    float _659 = in.m_74.y;
    float _661 = _621 + _655;
    float _663 = 1.0 / _653;
    float _665 = _661 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _667 = _661 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _669 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[126].x, _665);
    float _671 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[127].x, _667);
    float _673 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[126].z, _669);
    float _675 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[127].z, _671);
    float _677 = _673 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _681 = _663 * _679;
    float _683 = _675 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _685 = trunc(_677);
    int _687 = int(_685);
    float _689 = _511 * _657;
    bool _691 = _681 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _693 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _695 = _583 + _693;
    bool _697 = _681 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _699 = _317 * _689;
    bool _701 = !_691;
    int _703 = _701 ? 0 : 1;
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _707 = trunc(_683);
    int _709 = int(_707);
    float _711 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = _513 * _659;
    float _715 = _711 * _705;
    float _717 = _321 * _713;
    int _719 = 2;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c10)._m0[3].x);
    float _723 = _677;
    if (!_691)
    {
        _719 = 1;
    }
    int _725 = _719;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    int _729 = _725;
    if (!_697)
    {
        _729 = _703;
    }
    int _731 = _729;
    float _733 = _627 * _627;
    int _735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _737 = _687 + _735;
    int _739 = _737 + 1;
    float _741 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _743 = _731 << 6;
    float _745 = fma(_695, _695, _733);
    bool _747 = _739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _749 = _741 * _727;
    int _751 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _753 = _709 + _751;
    int _755 = _753 + 1;
    float _757 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _759 = _585 + _757;
    int _761 = _743 + 96;
    uint _764 = uint(int(uint(_761) >> uint(2)));
    uint _766 = uint(int(uint(int(_764)) >> uint(2)));
    int _768 = int(_764) & 3;
    float _770 = (*spvDescriptorSet0.vp_c15)._m0[int(_766)][_768];
    int _772 = int(_764) + 1;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    int _776 = _772 & 3;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[int(_774)][_776];
    float _780 = _749 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _782 = _739 | _755;
    float _784 = fma(_759, _759, _745);
    float _786 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].x, _780);
    bool _788 = _782 < 0;
    bool _790 = _788 || _747;
    float _792 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, -9.0, 10.0);
    int _794 = _743 + 104;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    float _812 = rsqrt(_784);
    bool _814 = _755 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _816 = _814 || _790;
    float _818 = _749 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _820 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _786);
    float _822 = _749 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _824 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].x, _818);
    int _826 = _743 + 48;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    float _844 = _820 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _846 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _822);
    float _848 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _824);
    float _850 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _846);
    int _852 = _755;
    float _854 = as_type<float>(_731);
    if (!_816)
    {
        int _856 = _755 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _858 = _856 + _739;
        _721 = _858;
    }
    int _860 = _721;
    int _862 = _743 + 64;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c15)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c15)._m0[int(_874)][_876];
    float _880 = _812 * _792;
    float _882 = _848 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = 0.0;
    int _886 = as_type<int>(_812);
    if (!_816)
    {
        float _888 = floor(_677);
        _884 = _888;
    }
    float _890 = _884;
    if (!_816)
    {
        int _892 = _860 << 2;
        _852 = _892;
    }
    int _894 = _852;
    float _896 = fma(_759, _880, _759);
    int _898 = _894;
    if (!_816)
    {
        uint _900 = uint(int(uint(_860) >> uint(2)));
        _886 = int(_900);
    }
    int _902 = _886;
    float _904 = fma(_695, _880, _695);
    if (!_816)
    {
        int _906 = 12 & _894;
        _898 = _906;
    }
    int _908 = _898;
    float _910 = _896 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _912 = _743 + 56;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c15)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.vp_c15)._m0[int(_924)][_926];
    float _930 = _904 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _932 = 0.0;
    if (!_816)
    {
        int _934 = _902 << 4;
        int _936 = _934 + _908;
        _932 = as_type<float>(_936);
    }
    float _938 = _932;
    float _940 = _882 + _910;
    float _942 = fma(_627, _880, _627);
    float _944 = _844 + _930;
    float _946 = _850 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _948 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _950 = _940 + _948;
    int _952 = _743 + 72;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _972 = _944 + _970;
    float _974 = _942 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _976 = _950 * _950;
    float _978 = _661 * _778;
    float _980 = fma(_972, _972, _976);
    float _982 = _938;
    float _984 = _778;
    float _986 = _944;
    float _988 = _940;
    float _990 = _974;
    if (!_816)
    {
        int _992 = as_type<int>(_938) + 400;
        uint _994 = uint(int(uint(_992) >> uint(2)));
        uint _996 = uint(int(uint(int(_994)) >> uint(2)));
        int _998 = int(_994) & 3;
        float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
        _982 = _1000;
    }
    float _1002 = _982;
    if (!_816)
    {
        float _1004 = floor(_683);
        _984 = _1004;
    }
    float _1006 = _984;
    float _1008 = fma(_583, _770, _978);
    float _1010 = fma(_585, _802, _1008);
    int _1012 = _743 + 80;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    float _1030 = sqrt(_980);
    float _1032 = _661 * _842;
    float _1034 = _1010 + _810;
    int _1036 = _743 + 88;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c15)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    float _1054 = fma(_583, _834, _1032);
    float _1056 = 1.0 / _1034;
    float _1058 = _661 * _878;
    bool _1060 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = fma(_583, _870, _1058);
    float _1064 = _946 + _974;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1076 = _1074 != 0;
    bool _1078 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1080 = isnan(0.5);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1086 = _1082 || _1084;
    float _1088 = fma(_585, _920, _1054);
    bool _1090 = !_1072;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = !_1068;
    int _1096 = _1094 ? 0 : 1;
    bool _1098 = !_1076;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = fma(_585, _960, _1062);
    float _1104 = _1010;
    float _1106 = _1062;
    if (!_1060)
    {
        _1104 = _1064;
    }
    float _1108 = _1104;
    bool _1110 = !_1060;
    float _1112 = _1108;
    float _1114 = _1002;
    if (!_1110)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1030 + _1118;
        float _1122 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = rsqrt(_980);
        float _1126 = _1120 * _1116;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = fma(_1132, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1140 = _1124 * _1138;
        float _1142 = _1136 + (-1.0);
        float _1144 = fma(_972, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = fma(_950, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1148 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = fma(_1064, _1136, _1148);
        _986 = _1144;
        _988 = _1146;
        _1112 = _1150;
        _990 = _1148;
        _1106 = _1138;
    }
    float _1152 = _986;
    float _1154 = _988;
    float _1156 = _1112;
    float _1158 = _990;
    float _1160 = _1106;
    float _1162 = _1088 + _928;
    float _1164 = _1102 + _968;
    float _1166 = _1158;
    float _1168 = _1160;
    float _1170 = _1156;
    if (_1086)
    {
        _1166 = _1152;
    }
    float _1172 = _1166;
    float _1174 = _1172;
    if (_1086)
    {
        _1168 = _1154;
    }
    float _1176 = _1168;
    float _1178 = _1176;
    if (!_1086)
    {
        float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1182 = _621 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1186 = _583 + _1184;
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1190 = -_583;
        float _1192 = _1190 + _1152;
        float _1194 = _1182 * _1182;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1198 = _585 + _1196;
        float _1200 = -_585;
        float _1202 = _1200 + _1154;
        float _1204 = fma(_1186, _1186, _1194);
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1208 = fma(_1198, _1198, _1204);
        float _1210 = sqrt(_1208);
        float _1212 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1214 = precise::min(_1210, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1216 = _1214 * _1206;
        float _1218 = -_621;
        float _1220 = _1218 + _1156;
        float _1222 = _1212 * _1216;
        float _1224 = fma(_1220, _1222, _621);
        float _1226 = fma(_1192, _1222, _583);
        float _1228 = fma(_1202, _1222, _585);
        _1170 = _1224;
        _1174 = _1226;
        _1178 = _1228;
    }
    float _1230 = _1170;
    float _1232 = _1174;
    float _1234 = _1178;
    float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = _1162 * _1056;
    float _1240 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1236);
    float _1246 = _1164 * _1056;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1240);
    bool _1250 = _1238 >= 0.0;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1244);
    float _1254 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1256 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1248);
    float _1260 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1262 = _1238 <= 1.0;
    bool _1264 = _1262 && _1250;
    float _1266 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1254);
    float _1268 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1270 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1272 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1274 = _1246 >= 0.0;
    bool _1276 = _1274 && _1264;
    float _1278 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1268);
    float _1282 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1272);
    bool _1284 = _1246 <= 1.0;
    bool _1286 = _1284 && _1276;
    float _1288 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1290 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1292 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1294 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1282);
    float _1296 = _1268;
    if (!_816)
    {
        float _1298 = rint(_1002);
        float _1300 = precise::max(_1298, 0.0);
        uint _1302 = uint(_1300);
        uint _1304 = clamp(_1302, 0u, 65535u);
        _1114 = as_type<float>(_1304);
    }
    float _1306 = _1114;
    float _1308 = -_1290;
    float _1310 = fma(_1308, _1288, 1.0);
    float _1312 = _661 * _1028;
    float _1314 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1294);
    float _1316 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1318 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = fma(_583, _1020, _1312);
    if (!_816)
    {
        float _1322 = -_1006;
        float _1324 = _683 + _1322;
        _1296 = _1324;
    }
    float _1326 = _1296;
    float _1328 = 1.0 / _1314;
    if (_1286)
    {
        float _1330 = float(_731);
        _854 = _1330;
    }
    float _1332 = _854;
    float _1334 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1316);
    float _1336 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1338 = fma(_585, _1044, _1320);
    if (!_816)
    {
        float _1340 = -_890;
        float _1342 = _677 + _1340;
        _723 = _1342;
    }
    float _1344 = _723;
    float _1346 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1334);
    float _1348 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1350 = log2(_1310);
    float _1352 = _1338 + _1052;
    float _1354 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1346);
    float _1356 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1348);
    float _1358 = _1352 * _1056;
    float _1360 = _1332;
    float _1362 = _1356;
    if (_1286)
    {
        float _1364 = rint(_1332);
        float _1366 = precise::max(_1364, 0.0);
        uint _1368 = uint(_1366);
        uint _1370 = clamp(_1368, 0u, 65535u);
        _1360 = as_type<float>(_1370);
    }
    float _1372 = _1360;
    float _1374 = _1354 * _1328;
    float _1376 = _1356 * _1328;
    float _1378 = fma(_1374, 0.5, 0.5);
    float _1380 = fma(_1376, -0.5, 0.5);
    float _1382 = _1350 * 0.693147182464599609375;
    float _1384 = _1326;
    if (!_816)
    {
        float3 _5324 = float3(_1344, _1326, float(as_type<int>(_1306)));
        float3 _5328 = select(_5324, float3(0.0), isnan(_5324));
        float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5328.xy, uint(rint(_5328.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5328.xy, uint(rint(_5328.z)), level(0.0)).x;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1392 = _1246;
    if (_1286)
    {
        float3 _5347 = float3(_1238, _1246, float(as_type<int>(_1372)));
        float3 _5349 = select(_5347, float3(0.0), isnan(_5347));
        float _1394 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5349.xy, uint(rint(_5349.z)), _1358, level(0.0));
        _1392 = _1394;
    }
    float _1396 = _1392;
    float3 _5359 = float3(_1378, _1380, _1390);
    float _1398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5359, float3(0.0), isnan(_5359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5359, float3(0.0), isnan(_5359)), level(0.0)).x;
    float3 _5368 = float3(_1378, _1380, _1390);
    float4 _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5368, float3(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5368, float3(0.0), isnan(_5368)), level(0.0)).xyzw;
    float _1403 = _1401.x;
    float _1405 = _1401.y;
    float _1407 = _1401.z;
    float _1409 = _1401.w;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1413 = int(_1411);
    int _1415 = abs(_1096);
    int _1417 = abs(_1100);
    float _1419 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1421 = int(_1419);
    float _1423 = float(_1413);
    float _1425 = 1.0 / _1423;
    float _1427 = float(uint(_1421));
    float _1429 = 1.0 / _1427;
    float _1431 = _145 * _1425;
    float _1433 = trunc(_1431);
    int _1435 = int(_1433);
    int _1437 = as_type<int>(_1429) + (-2);
    int _1439 = ~_1421;
    int _1441 = _1439 + 1;
    float _1443 = 1.0 / _545;
    float _1445 = float(uint(_1435));
    float _1447 = as_type<float>(_1437) * _1445;
    float _1449 = trunc(_1447);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    int _1455 = ~_1421;
    int _1457 = _1455 + 1;
    int _1459 = _1441 * int(_1453);
    int _1461 = _1459 + _1435;
    float _1463 = float(uint(_1461));
    float _1465 = as_type<float>(_1437) * _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1469 = _1467 != 0;
    float _1471 = trunc(_1465);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    bool _1477 = !_1469;
    float _1479 = _1477 ? 7.345489978790283203125 : 1.0;
    float _1481 = _1479 * _165;
    int _1483 = _1421 + (-1);
    float _1485 = floor(_1481);
    int _1487 = int(_1453) + int(_1475);
    float _1489 = float(_1421);
    float _1491 = float(_1435);
    int _1493 = _1457 * _1487;
    int _1495 = _1493 + _1435;
    bool _1497 = _1491 >= _1489;
    bool _1499 = isnan(_1491);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(_1489);
    bool _1505 = _1501 || _1503;
    float _1507 = float(_1505);
    bool _1509 = uint(_1495) >= uint(_1421);
    float _1511 = -_1485;
    float _1513 = _1481 + _1511;
    float _1515 = trunc(_1507);
    int _1517 = int(_1515);
    bool _1519 = !_1509;
    int _1521 = _1519 ? 0 : (-1);
    float _1523 = _1513 * _1489;
    float _1525 = _145 * _1489;
    bool _1527 = _1421 == 0;
    int _1529 = ~_1487;
    int _1531 = _1529 + _1521;
    int _1533 = _1531 + 1;
    float _1535 = _1525 * _1443;
    float _1537 = trunc(_1523);
    int _1539 = int(_1537);
    int _1541 = _1421 * _1533;
    int _1543 = _1541 + _1435;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1547 = _1545 != 0;
    int _1549 = ~_1517;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    float _1555 = trunc(_1535);
    int _1557 = int(_1555);
    bool _1559 = !_1527;
    int _1561 = _1559 ? _1543 : (-1);
    bool _1563 = !_1547;
    int _1565 = _1563 ? 0 : 1;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1569 = _1567 != 0;
    int _1571 = _1561 * _1553;
    int _1573 = abs(_1092);
    int _1575 = abs(_1565);
    int _1577 = _1517 * _1483;
    int _1579 = _1577 + _1571;
    bool _1581 = !_1569;
    int _1583 = _1581 ? 0 : 1;
    int _1585 = _1539 * _1575;
    int _1587 = _1585 + _1435;
    int _1589 = _1579 * _1573;
    int _1591 = abs(_1583);
    int _1593 = _1557 * _1415;
    int _1595 = _1593 + _1589;
    int _1597 = ~_1421;
    int _1599 = _1597 + 1;
    bool _1601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1603 = isnan(0.5);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1609 = _1605 || _1607;
    int _1611 = _1587 * _1417;
    int _1613 = _1611 + _1595;
    int _1615 = ~_1421;
    int _1617 = _1615 + 1;
    float _1619 = as_type<float>(_1579);
    float _1621 = as_type<float>(_1415);
    float _1623 = as_type<float>(_1417);
    if (_816)
    {
        _1619 = 1.0;
    }
    float _1625 = _1619;
    int _1627 = _1539 * _1591;
    int _1629 = _1627 + _1613;
    float _1631 = float(uint(_1629));
    float _1633 = as_type<float>(_1437) * _1631;
    float _1635 = trunc(_1633);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    int _1641 = _1617 * int(_1639);
    int _1643 = _1641 + _1629;
    float _1645 = float(uint(_1643));
    float _1647 = as_type<float>(_1643);
    float _1649 = _1625;
    if (_1609)
    {
        _1647 = 1.0;
    }
    float _1651 = _1647;
    float _1653 = as_type<float>(_1437) * _1645;
    float _1655 = trunc(_1653);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    int _1661 = int(_1639) + int(_1659);
    int _1663 = _1599 * _1661;
    int _1665 = _1663 + _1629;
    bool _1667 = uint(_1665) >= uint(_1421);
    bool _1669 = !_1667;
    int _1671 = _1669 ? 0 : (-1);
    int _1673 = ~_1661;
    int _1675 = _1673 + _1671;
    int _1677 = _1675 + 1;
    int _1679 = _1421 * _1677;
    int _1681 = _1679 + _1629;
    float _1683 = as_type<float>(_1677);
    float _1685 = as_type<float>(_1665);
    float _1687 = _1651;
    if (_1609)
    {
        _1683 = 1.0;
    }
    float _1689 = _1683;
    float _1691 = _1689;
    float _1693 = _1407;
    if (!_1609)
    {
        float _1695 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1701;
        float _1705 = _1697 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        float _1709 = _1699 * 0.15915493667125701904296875;
        float _1711 = _1697 * 6.283185482025146484375;
        float _1713 = sin(_1711);
        float _1715 = 1.0 / _1707;
        float _1717 = _1709 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1713 * _1715;
        float _1723 = _1709 * 6.283185482025146484375;
        float _1725 = sin(_1723);
        float _1727 = _1719 * _1721;
        float _1729 = 1.0 / _1703;
        float _1731 = 1.0 / _1727;
        float _1733 = _1725 * _1731;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = fma(_681, _1733, _1735);
        float _1739 = _1737 * _1729;
        float _1741 = precise::clamp(_1739, 0.0, 1.0);
        _1621 = _1721;
        _1685 = _1729;
        _1623 = _1709;
        _1691 = _1741;
    }
    float _1743 = _1621;
    float _1745 = _1685;
    float _1747 = _1623;
    float _1749 = _1691;
    float _1751 = _1745;
    float _1753 = _1743;
    float _1755 = _1747;
    if (!_1609)
    {
        float _1757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1759 = _1757 * 0.15915493667125701904296875;
        float _1761 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1763 = _1759 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1761 * 0.15915493667125701904296875;
        float _1769 = _1759 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = 1.0 / _1765;
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        float _1779 = _1771 * _1773;
        float _1781 = _1767 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = 1.0 / _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1791 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1789;
        float _1793 = 1.0 / _1791;
        float _1795 = _1783 * _1787;
        float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1799 = fma(_681, _1795, _1797);
        float _1801 = _1799 * _1793;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        float _1805 = -_1803;
        float _1807 = _1805 + 1.0;
        _1751 = _1787;
        _1753 = _1773;
        _1687 = _1807;
    }
    float _1809 = _1751;
    float _1811 = _1753;
    float _1813 = _1687;
    float _1815 = _1811;
    if (!_816)
    {
        int _1817 = _860 << 4;
        int _1819 = _1817 + 2048;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
        int _1837 = _1819 + 8;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
        int _1843 = int(_1839) & 3;
        float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
        int _1847 = int(_1839) + 1;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        int _1851 = _1847 & 3;
        float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
        float _1855 = _661 * _1835;
        float _1857 = fma(_583, _1827, _1855);
        float _1859 = fma(_585, _1845, _1857);
        float _1861 = _1859 + _1853;
        float _1863 = precise::clamp(_1861, 0.0, 1.0);
        float _1865 = -_1863;
        float _1867 = _1865 + _1388;
        float _1869 = fma(_1867, 500.0, 1.5);
        float _1871 = exp2(_1869);
        float _1873 = 0.0 + _1871;
        float _1875 = precise::clamp(_1873, 0.0, 1.0);
        _1649 = _1875;
    }
    float _1877 = _1649;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1230 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1232 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1889 = _1234 + _1887;
    float _1891 = _1881 * _1881;
    float _1893 = fma(_1885, _1885, _1891);
    float _1895 = fma(_1889, _1889, _1893);
    float _1897 = rsqrt(_1895);
    float _1899 = sqrt(_1895);
    float _1901 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1903 = _1885 * _1901;
    float _1905 = _1889 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 + _1909;
    float _1913 = sqrt(_1911);
    bool _1915 = _1913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = _1913 + _1917;
    float _1921 = _1891;
    float _1923 = _1919;
    float _1925 = _1903;
    float _1927 = _1905;
    float _1929 = _1909;
    if (_1915)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1921 = _1931;
    }
    float _1933 = _1921;
    if (_1915)
    {
        float _1935 = rsqrt(_1911);
        _1815 = _1935;
    }
    float _1937 = _1815;
    float _1939 = _1937;
    if (_1915)
    {
        float _1941 = _1919 * _1933;
        _1923 = _1941;
    }
    float _1943 = _1923;
    if (_1915)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1755 = _1945;
    }
    float _1947 = _1755;
    float _1949 = _1809;
    if (_1915)
    {
        float _1951 = _1947 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1959 = precise::max(0.0, _1957);
    float _1961 = _1933;
    float _1963 = _1959;
    if (_1915)
    {
        float _1965 = _1947 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        _1961 = _1967;
    }
    float _1969 = _1961;
    float _1971 = -_1901;
    float _1973 = -_1959;
    float _1975 = fma(_1881, _1971, _1973);
    float _1977 = _1975;
    if (_1915)
    {
        float _1979 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1963 = _1979;
    }
    float _1981 = _1963;
    float _1983 = _1955;
    float _1985 = _1981;
    if (_1915)
    {
        float _1987 = fma(_1955, _1981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1983 = _1987;
    }
    float _1989 = _1983;
    float _1991 = _1989;
    if (_1915)
    {
        float _1993 = _1969 + (-1.0);
        _1985 = _1993;
    }
    float _1995 = _1985;
    float _1997 = _1995;
    if (_1915)
    {
        float _1999 = _1937 * _1989;
        _1991 = _1999;
    }
    float _2001 = _1991;
    if (_1915)
    {
        float _2003 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1939 = _2003;
    }
    float _2005 = _1939;
    if (_1915)
    {
        float _2007 = _1903 * _2001;
        _1925 = _2007;
    }
    float _2009 = _1925;
    if (!_1915)
    {
        _1997 = _1907;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1915)
    {
        float _2015 = _1905 * _2001;
        _1927 = _2015;
    }
    float _2017 = _1927;
    if (_1915)
    {
        float _2019 = fma(_1975, _1969, _2005);
        _1977 = _2019;
    }
    float _2021 = _1977;
    if (_1915)
    {
        float _2023 = _2009 * _2009;
        _2013 = _2023;
    }
    float _2025 = _2013;
    if (_1915)
    {
        float _2027 = _2017 * _2017;
        _1929 = _2027;
    }
    float _2029 = _1929;
    float _2031 = fma(_2021, _2021, _2025);
    float _2033 = _2031 + _2029;
    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2037 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2035);
    float _2039 = precise::clamp(_2037, 0.0, 1.0);
    float _2041 = rsqrt(_2033);
    float _2043 = -_2039;
    float _2045 = _2043 + 1.0;
    float _2047 = abs(_2045);
    float _2049 = log2(_2047);
    float _2051 = _2041 * _2009;
    float _2053 = _2041 * _2021;
    float _2055 = _2041 * _2017;
    float _2057 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2059 = -_2057;
    float _2061 = fma(_2053, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2059);
    float _2063 = -_2055;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2061);
    float _2067 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2069 = fma(_2065, -0.5, 0.5);
    float _2071 = fma(_2065, 0.5, 0.5);
    float _2073 = exp2(_2067);
    float _2075 = fma(_2071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2077 = fma(_2071, _2075, -0.212114393711090087890625);
    float _2079 = _2053 + 1.0;
    float _2081 = sqrt(_2069);
    float _2083 = fma(_2071, _2077, 1.570728778839111328125);
    float _2085 = -_2053;
    float _2087 = fma(_2073, _2079, _2085);
    float _2089 = float(uint(_1587));
    float _2091 = fma(_2087, 0.5, 0.5);
    float _2093 = _2081 * 0.636619746685028076171875;
    float _2095 = -_2083;
    float _2097 = fma(_2093, _2095, 1.0);
    bool _2099 = !_1527;
    int _2101 = _2099 ? _1681 : (-1);
    float2 _6340 = float2(_2097, _2091);
    float3 _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6340, float2(0.0), isnan(_6340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6340, float2(0.0), isnan(_6340)), level(0.0)).xyz;
    float _2107 = _2105.x;
    float _2109 = _2105.y;
    float _2111 = _2105.z;
    float _2113 = as_type<float>(_1437) * _2089;
    int _2115 = _2101 >> 31;
    float _2117 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2119 = _2101 & 3;
    bool _2121 = _2119 != 0;
    float _2123 = -_603;
    float _2125 = _2123 + 1.0;
    int _2127 = _2115 & 3;
    float _2129 = trunc(_2113);
    float _2131 = precise::max(_2129, 0.0);
    uint _2133 = uint(_2131);
    int _2135 = _2121 ? 0 : 1;
    int _2137 = _2101 + _2127;
    int _2139 = ~_1421;
    int _2141 = _2139 + 1;
    int _2143 = _2137 >> 2;
    float _2145 = exp2(_2117);
    int _2147 = ~_2135;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    int _2153 = _2143 << 4;
    int _2155 = _2153 + 368;
    int _2157 = ~_1421;
    int _2159 = _2157 + 1;
    uint _2161 = uint(int(uint(_2155) >> uint(2)));
    uint _2163 = uint(int(uint(int(_2161)) >> uint(2)));
    int _2165 = int(_2161) & 3;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[int(_2163)][_2165];
    int _2169 = int(_2161) + 1;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    int _2173 = _2169 & 3;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[int(_2171)][_2173];
    int _2177 = _2141 * int(_2133);
    int _2179 = _2177 + _1587;
    float _2181 = float(uint(_2179));
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2187 = as_type<float>(_1437) * _2181;
    int _2189 = _2101 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = 1.0 / _2185;
    int _2195 = _2155 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    uint _2199 = uint(int(uint(int(_2197)) >> uint(2)));
    int _2201 = int(_2197) & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    int _2205 = int(_2197) + 1;
    uint _2207 = uint(int(uint(_2205) >> uint(2)));
    int _2209 = _2205 & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    bool _2213 = uint(_2189) > 1u;
    bool _2215 = _2189 != 3;
    bool _2217 = _2189 != 3;
    float _2219 = trunc(_2187);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    bool _2225 = !_2217;
    int _2227 = _2225 ? 0 : (-1);
    int _2229 = abs(_2227);
    int _2231 = _2151;
    if (!_2213)
    {
        int _2233 = ~_2135;
        int _2235 = _2233 + 1;
        _2231 = _2235;
    }
    int _2237 = _2231;
    bool _2239 = uint(_2189) >= 2u;
    int _2241 = abs(_2237);
    float _2243 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2245 = int(_2243);
    int _2247 = _2239 ? 0 : 1;
    int _2249 = int(_2133) + int(_2223);
    int _2251 = ~_2247;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    bool _2257 = !_2191;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = _2159 * _2249;
    int _2263 = _2261 + _1587;
    int _2265 = _2255;
    if (_2215)
    {
        int _2267 = ~_2247;
        int _2269 = _2267 + 1;
        _2265 = _2269;
    }
    int _2271 = _2265;
    int _2273 = ~_2241;
    int _2275 = _2273 + 1;
    int _2277 = _2275 + 1;
    int _2279 = abs(_2259);
    int _2281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2283 = _2281 != 0;
    int _2285 = _2277 * as_type<int>(_2175);
    int _2287 = abs(_2271);
    bool _2289 = uint(_2263) >= uint(_1421);
    bool _2291 = !_2283;
    int _2293 = _2291 ? 0 : 1;
    int _2295 = ~_2279;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2293);
    int _2303 = _2299 * as_type<int>(_2167);
    int _2305 = _2303 + _2285;
    bool _2307 = !_2289;
    int _2309 = _2307 ? 0 : (-1);
    int _2311 = ~_2287;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = float(uint(_2245));
    int _2319 = ~_2249;
    int _2321 = _2319 + _2309;
    int _2323 = _2321 + 1;
    int _2325 = _2315 * as_type<int>(_2203);
    int _2327 = _2325 + _2305;
    int _2329 = ~_2229;
    int _2331 = _2329 + 1;
    int _2333 = _2331 + 1;
    float _2335 = 1.0 / _2317;
    int _2337 = abs(_2245);
    int _2339 = _2333 * as_type<int>(_2211);
    int _2341 = _2339 + _2327;
    int _2343 = ~_2301;
    int _2345 = _2343 + 1;
    int _2347 = _2345 + 1;
    int _2349 = _1421 * _2323;
    int _2351 = _2349 + _1587;
    float _2353 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2355 = _2341 * _2347;
    float _2357 = float(uint(_2337));
    float _2359 = in.m_63.y;
    bool _2361 = !_1527;
    int _2363 = _2361 ? _2351 : (-1);
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2367 = 1.0 / _2357;
    int _2369 = _2363 * _2301;
    int _2371 = _2369 + _2355;
    float _2373 = -_2365;
    float _2375 = fma(_2353, 2.0, _2373);
    int _2377 = as_type<int>(_2335) + (-2);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2381 = _2379 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2385 = _2383 != 0;
    float _2387 = -_145;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2375);
    float _2391 = float(uint(_2371));
    float _2393 = 1.0 / _2381;
    int _2395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2397 = _2395 != 0;
    int _2399 = abs(_2371);
    float _2401 = as_type<float>(_2377) * _2391;
    int _2403 = as_type<int>(_2367) + (-2);
    float _2405 = float(uint(_2399));
    float _2407 = trunc(_2401);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2415 = as_type<float>(_2403) * _2405;
    bool _2417 = _165 > 0.5;
    float _2419 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2419;
    float _2423 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2413);
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2427 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2429 = trunc(_2415);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    float _2435 = _2421 * _2393;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2439 = _547 + _2437;
    bool _2441 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2443 = isnan(_547);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = fma(_2427, -2.0, _2425);
    int _2455 = ~_2245;
    int _2457 = _2455 + 1;
    float _2459 = fma(_2435, _2439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2461 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2463 = isnan(_547);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = -_2451;
    float _2475 = _2473 + 1.0;
    float _2477 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _2481 = _2457 * int(_2411);
    int _2483 = _2481 + _2371;
    bool _2485 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2487 = isnan(_547);
    bool _2489 = _2485 || _2487;
    bool _2491 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2493 = _2489 || _2491;
    float _2495 = float(_2493);
    float _2497 = _2471 * _2475;
    int _2499 = ~_2337;
    int _2501 = _2499 + 1;
    float _2503 = -_2471;
    float _2505 = _2503 + 1.0;
    float _2507 = float(uint(_2483));
    float _2509 = _2479 * _2193;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2513 = _2501 * int(_2433);
    int _2515 = _2513 + _2399;
    float _2517 = _2495 * _2505;
    float _2519 = as_type<float>(_2377) * _2507;
    bool _2521 = _2359 > 0.5;
    float _2523 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2511);
    float _2525 = _2459 * _2517;
    float _2527 = float(uint(_2515));
    float _2529 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2531 = -_213;
    int _2533 = _2417 ? as_type<int>(_2531) : as_type<int>(_213);
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2537 = _547 + _2535;
    float _2539 = trunc(_2519);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    float _2545 = as_type<float>(_2403) * _2527;
    bool _2547 = !_2385;
    float _2549 = _2547 ? _213 : as_type<float>(_2533);
    float _2551 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2553 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2555 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2557 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2559 = -_2495;
    float _2561 = _2559 + 1.0;
    float _2563 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2553);
    float _2565 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2555);
    float _2567 = fma(_2509, _2537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2569 = trunc(_2545);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    float _2575 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2557);
    float _2577 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2525);
    float _2579 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2423);
    int _2581 = ~_2245;
    int _2583 = _2581 + 1;
    float _2585 = fma(_2567, _2497, _2577);
    int _2587 = int(_2411) + int(_2543);
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2595 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2453);
    int _2597 = ~_2337;
    int _2599 = _2597 + 1;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2603 = int(_2433) + int(_2573);
    int _2605 = _2583 * _2587;
    int _2607 = _2605 + _2371;
    float _2609 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2523);
    float _2611 = _2589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2613 = _2591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2615 = uint(_2607) >= uint(_2245);
    int _2617 = _2599 * _2603;
    int _2619 = _2617 + _2399;
    float _2621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2623 = -_201;
    int _2625 = _2521 ? as_type<int>(_2623) : as_type<int>(_201);
    out.m_76.x = _2611;
    out.m_76.y = _2613;
    out.m_76.z = _2601;
    bool _2627 = !_2615;
    int _2629 = _2627 ? 0 : (-1);
    float _2631 = fma(_2451, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2585);
    bool _2633 = uint(_2619) >= uint(_2337);
    float _2635 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2637 = ~_2587;
    int _2639 = _2637 + _2629;
    int _2641 = _2639 + 1;
    float _2643 = -_2579;
    float _2645 = _2643 + 1.0;
    bool _2647 = _2245 == 0;
    float _2649 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    bool _2651 = _2245 == 0;
    float _2653 = abs(_681);
    float _2655 = log2(_2653);
    bool _2657 = !_2397;
    float _2659 = _2657 ? _201 : as_type<float>(_2625);
    int _2661 = _2245 * _2641;
    int _2663 = _2661 + _2371;
    int _2665 = _2371 ^ _2245;
    bool _2667 = !_2633;
    int _2669 = _2667 ? 0 : (-1);
    uint _2671 = uint(int(uint(_2665) >> uint(31)));
    float _2673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2675 = !_2647;
    int _2677 = _2675 ? _2663 : (-1);
    int _2679 = ~int(_2671);
    int _2681 = _2679 + 1;
    int _2683 = ~_2669;
    int _2685 = _2603 + _2683;
    int _2687 = _2685 + 1;
    float _2689 = float(_2677);
    float _2691 = _2621 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2693 = _2687 ^ _2681;
    float _2695 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2649);
    float _2697 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2699 = fma(_2691, _2689, _2389);
    float _2701 = _2549 + 0.5;
    int _2703 = ~_2681;
    int _2705 = _2703 + _2693;
    int _2707 = _2705 + 1;
    float _2709 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2711 = fma(_2691, _2701, _2699);
    float _2713 = exp2(_2697);
    float _2715 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2717 = !_2651;
    int _2719 = _2717 ? _2707 : (-1);
    float _2721 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2727 = float(_2719);
    float _2729 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2731 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2733 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2735 = _2631 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2737 = -_2595;
    float _2739 = fma(_2715, _2727, _2737);
    bool _2741 = _681 <= 8000.0;
    bool _2743 = isnan(_681);
    bool _2745 = _2741 || _2743;
    bool _2747 = isnan(8000.0);
    bool _2749 = _2745 || _2747;
    float _2751 = float(_2749);
    float _2753 = _2659 + (-0.5);
    out.m_78.x = _2729;
    out.m_78.y = _2731;
    out.m_78.z = _2733;
    out.m_78.w = _2735;
    float _2755 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2757 = precise::clamp(_2755, 0.0, 1.0);
    float _2759 = _2709 + _1314;
    float _2761 = -_2715;
    float _2763 = fma(_2761, _2753, _2739);
    out.gl_Position.x = _1354;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _2709;
    out.gl_Position.w = _1314;
    float _2765 = -_2645;
    float _2767 = fma(_2549, _2765, _2711);
    float _2769 = -_2609;
    float _2771 = _2769 + 1.0;
    float _2773 = _2759 * 0.5;
    bool _2775 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2777 = isnan(_1899);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2659, _2771, _2763);
    out.m_80.z = _2773;
    out.m_80.w = _1314;
    out.m_82.x = _2767;
    out.m_82.y = _2785;
    float _2787 = -_2145;
    float _2789 = _2787 + 1.0;
    float _2791 = fma(_2757, -2.0, 3.0);
    float _2793 = _2757 * _2757;
    float _2795 = _2735;
    float _2797 = _2733;
    if (!_1286)
    {
        _1362 = 1.0;
    }
    float _2799 = _1362;
    float _2801 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2803 = _2799;
    if (_1286)
    {
        bool _2805 = _1396 >= _1358;
        bool _2807 = isnan(_1396);
        bool _2809 = _2805 || _2807;
        bool _2811 = isnan(_1358);
        bool _2813 = _2809 || _2811;
        float _2815 = float(_2813);
        _2803 = _2815;
    }
    float _2817 = _2803;
    float _2819 = _2793 * _2791;
    float _2821 = _2819;
    if (!_2783)
    {
        _2795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2823 = _2795;
    float _2825 = _2801 * _1398;
    float _2827 = -_2801;
    float _2829 = _2827 + 1.0;
    float _2831 = -_2819;
    float _2833 = _2831 + 1.0;
    float _2835 = _2817 * _1877;
    float _2837 = _1409 * _2825;
    float _2839 = _1409 * _2829;
    float _2841 = fma(_2833, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2819);
    float _2843 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2783)
    {
        _2797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2849 = _2797;
    float _2851 = _2751 * _2841;
    float _2853 = _2851;
    float _2855 = _2849;
    float _2857 = _2849;
    if (!_2783)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2859 = _2821;
    float _2861 = _2111 * _2825;
    float _2863 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2865 = fma(_2107, _2837, _1403);
    float _2867 = fma(_2109, _2837, _1405);
    float _2869 = fma(_1409, _2861, _1407);
    float _2871 = _2125 * _2863;
    float _2873 = precise::clamp(_2871, 0.0, 1.0);
    float _2875 = _2575 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2877 = _1749 * _1813;
    float _2879 = _2873;
    float _2881 = _2859;
    float _2883 = _2859;
    if (!_2783)
    {
        _1693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2885 = _1693;
    float _2887 = -_2873;
    float _2889 = fma(_2887, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_84.x = _2865;
    out.m_84.y = _2867;
    out.m_84.z = _2869;
    out.m_84.w = _2839;
    float _2891 = _2885;
    float _2893 = _2885;
    if (!_2783)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2895 = _2853;
    float _2897 = -_2835;
    float _2899 = fma(_2897, _2889, 1.0);
    float _2901 = precise::clamp(_2899, 0.0, 1.0);
    float _2903 = _2895;
    float _2905 = _2895;
    if (!_2783)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2907 = _2879;
    float _2909 = _2901 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2911 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_86.x = _2909;
    out.m_88.x = _2843;
    out.m_88.y = _2911;
    out.m_88.z = _2875;
    bool _2913 = !_2783;
    float _2915 = _2907;
    float _2917 = _2907;
    if (!_2913)
    {
        bool _2919 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2921 = isnan(_1899);
        bool _2923 = _2919 || _2921;
        bool _2925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2927 = _2923 || _2925;
        if (!_2927)
        {
            float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2931 = _1899 + _2929;
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2935 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2933;
            float _2937 = 1.0 / _2935;
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2959 = _2931 * _2937;
            float _2961 = precise::clamp(_2959, 0.0, 1.0);
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = fma(_2961, _2941, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2969 = fma(_2961, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2971 = fma(_2961, _2945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2973 = fma(_2961, _2949, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2975 = fma(_2961, _2953, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2977 = fma(_2961, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2847 = _2969;
            _2905 = _2975;
            _2893 = _2967;
            _2883 = _2973;
            _2857 = _2971;
            _2917 = _2977;
            _2979 = true;
        }
        else
        {
            bool _2981 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2983 = isnan(_1899);
            bool _2985 = _2981 || _2983;
            bool _2987 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2989 = _2985 || _2987;
            if (!_2989)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2991 = _2891;
            _2893 = _2991;
            if (!_2989)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2993 = _2845;
            _2847 = _2993;
            if (!_2989)
            {
                _2855 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2995 = _2855;
            _2857 = _2995;
            if (!_2989)
            {
                _2881 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2997 = _2881;
            _2883 = _2997;
            if (!_2989)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2999 = _2903;
            _2905 = _2999;
            if (!_2989)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3001 = _2915;
            bool _3003 = !_2989;
            _2917 = _3001;
            if (!_3003)
            {
                bool _3005 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3007 = isnan(_1899);
                bool _3009 = _3005 || _3007;
                bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3013 = _3009 || _3011;
                if (!_3013)
                {
                    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3017 = _1899 + _3015;
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3021 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3019;
                    float _3023 = 1.0 / _3021;
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3045 = _3017 * _3023;
                    float _3047 = precise::clamp(_3045, 0.0, 1.0);
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = fma(_3047, _3027, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3055 = fma(_3047, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3057 = fma(_3047, _3031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3059 = fma(_3047, _3035, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3061 = fma(_3047, _3039, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3063 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2847 = _3055;
                    _2905 = _3061;
                    _2893 = _3053;
                    _2883 = _3059;
                    _2857 = _3057;
                    _2917 = _3063;
                    _2979 = true;
                }
                else
                {
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2883 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2857 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2979 = false;
    float _3065 = _2847;
    float _3067 = _2905;
    float _3069 = _2893;
    float _3071 = _2883;
    float _3073 = _2857;
    float _3075 = _2917;
    float _3077 = _2877 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3079 = fma(_2911, -0.5, 0.5);
    float _3081 = precise::clamp(_3079, 0.0, 1.0);
    float _3083 = -_3065;
    float _3085 = _3083 + _3067;
    float _3087 = -_3069;
    float _3089 = _3087 + _3071;
    out.m_59.x = _3077;
    float _3091 = fma(_3081, _3085, _3065);
    float _3093 = -_3073;
    float _3095 = _3093 + _3075;
    float _3097 = fma(_3081, _3089, _3069);
    float _3099 = _3091 * 0.586610972881317138671875;
    bool _3101 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = fma(_3081, _3095, _3073);
    out.m_90.x = 0.0;
    float _3105 = fma(_3097, 0.298911988735198974609375, _3099);
    bool _3107 = _1749 > 0.0;
    bool _3109 = isnan(_1749);
    bool _3111 = _3107 || _3109;
    bool _3113 = isnan(0.0);
    bool _3115 = _3111 || _3113;
    float _3117 = fma(_3103, 0.114477999508380889892578125, _3105);
    bool _3119 = _1813 <= 0.0;
    bool _3121 = !_3115;
    bool _3123 = _3119 || _3121;
    float _3125 = -_3117;
    float _3127 = _3097 + _3125;
    float _3129 = -_3117;
    float _3131 = _3091 + _3129;
    float _3133 = -_3117;
    float _3135 = _3103 + _3133;
    float _3137 = fma(_3127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    float _3139 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    float _3141 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    bool _3143 = !_3101;
    if (!_3143)
    {
        float _3145 = -_1230;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3149 = -_1232;
        float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3153 = -_1234;
        float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3157 = _3147 * _3147;
        float _3159 = fma(_3151, _3151, _3157);
        float _3161 = fma(_3155, _3155, _3159);
        float _3163 = sqrt(_3161);
        float _3165 = rsqrt(_3161);
        float _3167 = -_3163;
        float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3171 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3173 = precise::clamp(_3171, 0.0, 1.0);
        float _3175 = _3151 * _3165;
        float _3177 = _3147 * _3165;
        float _3179 = abs(_3173);
        float _3181 = log2(_3179);
        float _3183 = _3155 * _3165;
        float _3185 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3187 = _2911 * _3177;
        float _3189 = -_3177;
        float _3191 = -_3185;
        float _3193 = fma(_3189, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3191);
        float _3195 = fma(_2843, _3175, _3187);
        float _3197 = -_3183;
        float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3193);
        float _3201 = fma(_2875, _3183, _3195);
        float _3203 = precise::clamp(_3201, 0.0, 1.0);
        float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3207 = _3199 + _3205;
        float _3209 = _3181 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3211 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3213 = precise::clamp(_3211, 0.0, 1.0);
        float _3215 = exp2(_3209);
        float _3217 = _3215 * _3213;
        float _3219 = _3203 * _3217;
        float _3221 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3223 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3225 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3221;
        out.m_90.y = _3223;
        out.m_90.z = _3225;
    }
    out.m_92.x = _3137;
    out.m_92.y = _3139;
    out.m_92.z = _3141;
    if (!_3123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3227 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3227;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2979 = false;
    bool _537 = false;
    bool _341 = false;
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
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_59.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3284 = as_type<float>(_127);
        out.gl_Position.z = _3284;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_141)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _129 = as_type<int>(_161);
    }
    int _163 = _129;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_163);
        out.gl_Position.z = _3353;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _175 = _169 * _167;
    float _177 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    float _181 = _177 * _173;
    float _183 = _179 * 6.283185482025146484375;
    float _185 = floor(_179);
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _181);
    int _189 = as_type<int>(_171) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_171) & 2;
    bool _195 = _193 != 0;
    float _197 = _183 * 0.15915493667125701904296875;
    bool _199 = !_195;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = floor(_187);
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _187 * 6.283185482025146484375;
    bool _211 = !_191;
    float _213 = _211 ? (-0.5) : 0.5;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _221 = _219 != 0;
    float _223 = _209 * 0.15915493667125701904296875;
    bool _225 = !_207;
    int _227 = _225 ? 0 : 1;
    float _229 = _197 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = -_185;
    float _235 = _179 + _233;
    bool _237 = !_217;
    int _239 = _237 ? 0 : 1;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _243 = abs(_239);
    float _245 = _223 * 6.283185482025146484375;
    float _247 = cos(_245);
    float _249 = -_203;
    float _251 = _187 + _249;
    bool _253 = _235 < 0.5;
    float _255 = float(_253);
    float _257 = -_235;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _261 = !_221;
    int _263 = _261 ? 0 : 1;
    int _265 = abs(_227);
    float _267 = -_255;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = fma(_231, 0.5, 0.5);
    int _273 = abs(_263);
    float _275 = -_271;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_243);
    float _281 = fma(_247, 0.5, 0.5);
    bool _283 = _251 < 0.5;
    float _285 = float(_283);
    float _287 = -_251;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _291 = float(_265);
    float _293 = abs(_259);
    float _295 = _279 * _293;
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _305 = abs(_289);
    float _307 = _279 * _305;
    float _309 = float(_273);
    float _311 = fma(_291, _277, _295);
    float _313 = fma(_291, _303, _307);
    float _315 = abs(_269);
    float _317 = fma(_309, _315, _311);
    float _319 = abs(_299);
    float _321 = fma(_309, _319, _313);
    bool _323 = !_241;
    float _339;
    if (!_323)
    {
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _327 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        float _343 = float(_111);
        float _345 = 1.0 / _343;
        float _347 = _145 * _345;
        _339 = _347;
    }
    _341 = false;
    float _349 = _339;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _349 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = _349 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _349 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _371;
    bool _375 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_349);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = 1.0 / _365;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _373;
    float _393 = 1.0 / _369;
    float _395 = _353 * _387;
    bool _397 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _399 = isnan(_349);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_385;
    float _411 = _409 + 1.0;
    float _413 = _407 * _411;
    float _415 = _357 * _391;
    bool _417 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_349);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_407;
    float _431 = _429 + 1.0;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = _427 * _431;
    float _439 = -_427;
    float _441 = _439 + 1.0;
    float _443 = _361 * _393;
    bool _445 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_349);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = fma(_435, _443, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_459, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _455 * _441;
    float _475 = fma(_465, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_469, _443, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = -_455;
    float _481 = _479 + 1.0;
    float _483 = _471 * _473;
    float _485 = _475 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _487;
    float _491 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _485);
    float _499 = fma(_489, _415, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _501 = fma(_461, _437, _491);
    float _503 = fma(_495, _415, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = fma(_477, _437, _497);
    float _507 = fma(_499, _413, _501);
    float _509 = fma(_503, _413, _505);
    float _511 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[146].x, _507);
    float _513 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[146].y, _509);
    bool _515 = !_389;
    float _533;
    float _535;
    if (!_515)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _519 = _165 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _521 = float(_111);
        float _523 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _525 = _523 * _517;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _521;
        _535 = _531;
        _537 = true;
    }
    else
    {
        float _539 = float(_111);
        float _541 = 1.0 / _539;
        float _543 = _145 * _541;
        _533 = _539;
        _535 = _543;
    }
    _537 = false;
    float _545 = _533;
    float _547 = _535;
    float _549 = in.m_56.x;
    float _551 = in.m_56.y;
    float _553 = in.m_56.z;
    float _555 = in.m_68.x;
    float _557 = in.m_68.y;
    float _559 = in.m_68.z;
    float _561 = in.m_68.w;
    float _563 = in.m_70.x;
    float _565 = in.m_70.y;
    float _567 = in.m_70.z;
    float _569 = in.m_70.w;
    float _571 = _551 * _557;
    float _573 = _551 * _565;
    float _575 = fma(_549, _555, _571);
    float _577 = fma(_549, _563, _573);
    float _579 = fma(_553, _559, _575);
    float _581 = fma(_553, _567, _577);
    float _583 = _579 + _561;
    float _585 = _581 + _569;
    float _587 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _589 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _591 = floor(_587);
    float _593 = floor(_589);
    float _595 = -_591;
    float _597 = _587 + _595;
    float _599 = -_593;
    float _601 = _589 + _599;
    float2 _4007 = float2(_597, _601);
    float _603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4007, float2(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4007, float2(0.0), isnan(_4007)), level(0.0)).x;
    float _605 = in.m_72.x;
    float _607 = in.m_72.y;
    float _609 = in.m_72.z;
    float _611 = in.m_72.w;
    float _613 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _615 = _551 * _607;
    float _617 = fma(_549, _605, _615);
    float _619 = fma(_553, _609, _617);
    float _621 = _619 + _611;
    float _623 = _621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _625 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _627 = _621 + _625;
    float _629 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[11].x, _623);
    float _631 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[11].z, _629);
    float _633 = _621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _635 = _631 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _637 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[10].x, _633);
    float _639 = 1.0 / _635;
    float _641 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[10].z, _637);
    float _643 = _641 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _645 = _643 + _635;
    float _647 = _645 * _639;
    float _649 = _647 * 0.5;
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _653 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[30].w, _651);
    float _655 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _657 = in.m_74.x;
    float _659 = in.m_74.y;
    float _661 = _621 + _655;
    float _663 = 1.0 / _653;
    float _665 = _661 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _667 = _661 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _669 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[126].x, _665);
    float _671 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[127].x, _667);
    float _673 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[126].z, _669);
    float _675 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[127].z, _671);
    float _677 = _673 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _681 = _663 * _679;
    float _683 = _675 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _685 = trunc(_677);
    int _687 = int(_685);
    float _689 = _511 * _657;
    bool _691 = _681 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _693 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _695 = _583 + _693;
    bool _697 = _681 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _699 = _317 * _689;
    bool _701 = !_691;
    int _703 = _701 ? 0 : 1;
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _707 = trunc(_683);
    int _709 = int(_707);
    float _711 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = _513 * _659;
    float _715 = _711 * _705;
    float _717 = _321 * _713;
    int _719 = 2;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c10)._m0[3].x);
    float _723 = _677;
    if (!_691)
    {
        _719 = 1;
    }
    int _725 = _719;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    int _729 = _725;
    if (!_697)
    {
        _729 = _703;
    }
    int _731 = _729;
    float _733 = _627 * _627;
    int _735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _737 = _687 + _735;
    int _739 = _737 + 1;
    float _741 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _743 = _731 << 6;
    float _745 = fma(_695, _695, _733);
    bool _747 = _739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _749 = _741 * _727;
    int _751 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _753 = _709 + _751;
    int _755 = _753 + 1;
    float _757 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _759 = _585 + _757;
    int _761 = _743 + 96;
    uint _764 = uint(int(uint(_761) >> uint(2)));
    uint _766 = uint(int(uint(int(_764)) >> uint(2)));
    int _768 = int(_764) & 3;
    float _770 = (*spvDescriptorSet0.vp_c15)._m0[int(_766)][_768];
    int _772 = int(_764) + 1;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    int _776 = _772 & 3;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[int(_774)][_776];
    float _780 = _749 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _782 = _739 | _755;
    float _784 = fma(_759, _759, _745);
    float _786 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].x, _780);
    bool _788 = _782 < 0;
    bool _790 = _788 || _747;
    float _792 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, -9.0, 10.0);
    int _794 = _743 + 104;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    float _812 = rsqrt(_784);
    bool _814 = _755 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _816 = _814 || _790;
    float _818 = _749 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _820 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _786);
    float _822 = _749 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _824 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].x, _818);
    int _826 = _743 + 48;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    float _844 = _820 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _846 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _822);
    float _848 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _824);
    float _850 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _846);
    int _852 = _755;
    float _854 = as_type<float>(_731);
    if (!_816)
    {
        int _856 = _755 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _858 = _856 + _739;
        _721 = _858;
    }
    int _860 = _721;
    int _862 = _743 + 64;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c15)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c15)._m0[int(_874)][_876];
    float _880 = _812 * _792;
    float _882 = _848 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = 0.0;
    int _886 = as_type<int>(_812);
    if (!_816)
    {
        float _888 = floor(_677);
        _884 = _888;
    }
    float _890 = _884;
    if (!_816)
    {
        int _892 = _860 << 2;
        _852 = _892;
    }
    int _894 = _852;
    float _896 = fma(_759, _880, _759);
    int _898 = _894;
    if (!_816)
    {
        uint _900 = uint(int(uint(_860) >> uint(2)));
        _886 = int(_900);
    }
    int _902 = _886;
    float _904 = fma(_695, _880, _695);
    if (!_816)
    {
        int _906 = 12 & _894;
        _898 = _906;
    }
    int _908 = _898;
    float _910 = _896 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _912 = _743 + 56;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c15)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.vp_c15)._m0[int(_924)][_926];
    float _930 = _904 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _932 = 0.0;
    if (!_816)
    {
        int _934 = _902 << 4;
        int _936 = _934 + _908;
        _932 = as_type<float>(_936);
    }
    float _938 = _932;
    float _940 = _882 + _910;
    float _942 = fma(_627, _880, _627);
    float _944 = _844 + _930;
    float _946 = _850 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _948 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _950 = _940 + _948;
    int _952 = _743 + 72;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _972 = _944 + _970;
    float _974 = _942 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _976 = _950 * _950;
    float _978 = _661 * _778;
    float _980 = fma(_972, _972, _976);
    float _982 = _938;
    float _984 = _778;
    float _986 = _944;
    float _988 = _940;
    float _990 = _974;
    if (!_816)
    {
        int _992 = as_type<int>(_938) + 400;
        uint _994 = uint(int(uint(_992) >> uint(2)));
        uint _996 = uint(int(uint(int(_994)) >> uint(2)));
        int _998 = int(_994) & 3;
        float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
        _982 = _1000;
    }
    float _1002 = _982;
    if (!_816)
    {
        float _1004 = floor(_683);
        _984 = _1004;
    }
    float _1006 = _984;
    float _1008 = fma(_583, _770, _978);
    float _1010 = fma(_585, _802, _1008);
    int _1012 = _743 + 80;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    float _1030 = sqrt(_980);
    float _1032 = _661 * _842;
    float _1034 = _1010 + _810;
    int _1036 = _743 + 88;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c15)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    float _1054 = fma(_583, _834, _1032);
    float _1056 = 1.0 / _1034;
    float _1058 = _661 * _878;
    bool _1060 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = fma(_583, _870, _1058);
    float _1064 = _946 + _974;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1076 = _1074 != 0;
    bool _1078 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1080 = isnan(0.5);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1086 = _1082 || _1084;
    float _1088 = fma(_585, _920, _1054);
    bool _1090 = !_1072;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = !_1068;
    int _1096 = _1094 ? 0 : 1;
    bool _1098 = !_1076;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = fma(_585, _960, _1062);
    float _1104 = _1010;
    float _1106 = _1062;
    if (!_1060)
    {
        _1104 = _1064;
    }
    float _1108 = _1104;
    bool _1110 = !_1060;
    float _1112 = _1108;
    float _1114 = _1002;
    if (!_1110)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1030 + _1118;
        float _1122 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = rsqrt(_980);
        float _1126 = _1120 * _1116;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = fma(_1132, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1140 = _1124 * _1138;
        float _1142 = _1136 + (-1.0);
        float _1144 = fma(_972, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = fma(_950, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1148 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = fma(_1064, _1136, _1148);
        _986 = _1144;
        _988 = _1146;
        _1112 = _1150;
        _990 = _1148;
        _1106 = _1138;
    }
    float _1152 = _986;
    float _1154 = _988;
    float _1156 = _1112;
    float _1158 = _990;
    float _1160 = _1106;
    float _1162 = _1088 + _928;
    float _1164 = _1102 + _968;
    float _1166 = _1158;
    float _1168 = _1160;
    float _1170 = _1156;
    if (_1086)
    {
        _1166 = _1152;
    }
    float _1172 = _1166;
    float _1174 = _1172;
    if (_1086)
    {
        _1168 = _1154;
    }
    float _1176 = _1168;
    float _1178 = _1176;
    if (!_1086)
    {
        float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1182 = _621 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1186 = _583 + _1184;
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1190 = -_583;
        float _1192 = _1190 + _1152;
        float _1194 = _1182 * _1182;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1198 = _585 + _1196;
        float _1200 = -_585;
        float _1202 = _1200 + _1154;
        float _1204 = fma(_1186, _1186, _1194);
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1208 = fma(_1198, _1198, _1204);
        float _1210 = sqrt(_1208);
        float _1212 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1214 = precise::min(_1210, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1216 = _1214 * _1206;
        float _1218 = -_621;
        float _1220 = _1218 + _1156;
        float _1222 = _1212 * _1216;
        float _1224 = fma(_1220, _1222, _621);
        float _1226 = fma(_1192, _1222, _583);
        float _1228 = fma(_1202, _1222, _585);
        _1170 = _1224;
        _1174 = _1226;
        _1178 = _1228;
    }
    float _1230 = _1170;
    float _1232 = _1174;
    float _1234 = _1178;
    float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = _1162 * _1056;
    float _1240 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1236);
    float _1246 = _1164 * _1056;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1240);
    bool _1250 = _1238 >= 0.0;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1244);
    float _1254 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1256 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1248);
    float _1260 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1262 = _1238 <= 1.0;
    bool _1264 = _1262 && _1250;
    float _1266 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1254);
    float _1268 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1270 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1272 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1274 = _1246 >= 0.0;
    bool _1276 = _1274 && _1264;
    float _1278 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1268);
    float _1282 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1272);
    bool _1284 = _1246 <= 1.0;
    bool _1286 = _1284 && _1276;
    float _1288 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1290 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1292 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1294 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1282);
    float _1296 = _1268;
    if (!_816)
    {
        float _1298 = rint(_1002);
        float _1300 = precise::max(_1298, 0.0);
        uint _1302 = uint(_1300);
        uint _1304 = clamp(_1302, 0u, 65535u);
        _1114 = as_type<float>(_1304);
    }
    float _1306 = _1114;
    float _1308 = -_1290;
    float _1310 = fma(_1308, _1288, 1.0);
    float _1312 = _661 * _1028;
    float _1314 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1294);
    float _1316 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1318 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = fma(_583, _1020, _1312);
    if (!_816)
    {
        float _1322 = -_1006;
        float _1324 = _683 + _1322;
        _1296 = _1324;
    }
    float _1326 = _1296;
    float _1328 = 1.0 / _1314;
    if (_1286)
    {
        float _1330 = float(_731);
        _854 = _1330;
    }
    float _1332 = _854;
    float _1334 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1316);
    float _1336 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1338 = fma(_585, _1044, _1320);
    if (!_816)
    {
        float _1340 = -_890;
        float _1342 = _677 + _1340;
        _723 = _1342;
    }
    float _1344 = _723;
    float _1346 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1334);
    float _1348 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1350 = log2(_1310);
    float _1352 = _1338 + _1052;
    float _1354 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1346);
    float _1356 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1348);
    float _1358 = _1352 * _1056;
    float _1360 = _1332;
    float _1362 = _1356;
    if (_1286)
    {
        float _1364 = rint(_1332);
        float _1366 = precise::max(_1364, 0.0);
        uint _1368 = uint(_1366);
        uint _1370 = clamp(_1368, 0u, 65535u);
        _1360 = as_type<float>(_1370);
    }
    float _1372 = _1360;
    float _1374 = _1354 * _1328;
    float _1376 = _1356 * _1328;
    float _1378 = fma(_1374, 0.5, 0.5);
    float _1380 = fma(_1376, -0.5, 0.5);
    float _1382 = _1350 * 0.693147182464599609375;
    float _1384 = _1326;
    if (!_816)
    {
        float3 _5324 = float3(_1344, _1326, float(as_type<int>(_1306)));
        float3 _5328 = select(_5324, float3(0.0), isnan(_5324));
        float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5328.xy, uint(rint(_5328.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5328.xy, uint(rint(_5328.z)), level(0.0)).x;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1392 = _1246;
    if (_1286)
    {
        float3 _5347 = float3(_1238, _1246, float(as_type<int>(_1372)));
        float3 _5349 = select(_5347, float3(0.0), isnan(_5347));
        float _1394 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5349.xy, uint(rint(_5349.z)), _1358, level(0.0));
        _1392 = _1394;
    }
    float _1396 = _1392;
    float3 _5359 = float3(_1378, _1380, _1390);
    float _1398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5359, float3(0.0), isnan(_5359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5359, float3(0.0), isnan(_5359)), level(0.0)).x;
    float3 _5368 = float3(_1378, _1380, _1390);
    float4 _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5368, float3(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5368, float3(0.0), isnan(_5368)), level(0.0)).xyzw;
    float _1403 = _1401.x;
    float _1405 = _1401.y;
    float _1407 = _1401.z;
    float _1409 = _1401.w;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1413 = int(_1411);
    int _1415 = abs(_1096);
    int _1417 = abs(_1100);
    float _1419 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1421 = int(_1419);
    float _1423 = float(_1413);
    float _1425 = 1.0 / _1423;
    float _1427 = float(uint(_1421));
    float _1429 = 1.0 / _1427;
    float _1431 = _145 * _1425;
    float _1433 = trunc(_1431);
    int _1435 = int(_1433);
    int _1437 = as_type<int>(_1429) + (-2);
    int _1439 = ~_1421;
    int _1441 = _1439 + 1;
    float _1443 = 1.0 / _545;
    float _1445 = float(uint(_1435));
    float _1447 = as_type<float>(_1437) * _1445;
    float _1449 = trunc(_1447);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    int _1455 = ~_1421;
    int _1457 = _1455 + 1;
    int _1459 = _1441 * int(_1453);
    int _1461 = _1459 + _1435;
    float _1463 = float(uint(_1461));
    float _1465 = as_type<float>(_1437) * _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1469 = _1467 != 0;
    float _1471 = trunc(_1465);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    bool _1477 = !_1469;
    float _1479 = _1477 ? 7.345489978790283203125 : 1.0;
    float _1481 = _1479 * _165;
    int _1483 = _1421 + (-1);
    float _1485 = floor(_1481);
    int _1487 = int(_1453) + int(_1475);
    float _1489 = float(_1421);
    float _1491 = float(_1435);
    int _1493 = _1457 * _1487;
    int _1495 = _1493 + _1435;
    bool _1497 = _1491 >= _1489;
    bool _1499 = isnan(_1491);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(_1489);
    bool _1505 = _1501 || _1503;
    float _1507 = float(_1505);
    bool _1509 = uint(_1495) >= uint(_1421);
    float _1511 = -_1485;
    float _1513 = _1481 + _1511;
    float _1515 = trunc(_1507);
    int _1517 = int(_1515);
    bool _1519 = !_1509;
    int _1521 = _1519 ? 0 : (-1);
    float _1523 = _1513 * _1489;
    float _1525 = _145 * _1489;
    bool _1527 = _1421 == 0;
    int _1529 = ~_1487;
    int _1531 = _1529 + _1521;
    int _1533 = _1531 + 1;
    float _1535 = _1525 * _1443;
    float _1537 = trunc(_1523);
    int _1539 = int(_1537);
    int _1541 = _1421 * _1533;
    int _1543 = _1541 + _1435;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1547 = _1545 != 0;
    int _1549 = ~_1517;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    float _1555 = trunc(_1535);
    int _1557 = int(_1555);
    bool _1559 = !_1527;
    int _1561 = _1559 ? _1543 : (-1);
    bool _1563 = !_1547;
    int _1565 = _1563 ? 0 : 1;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1569 = _1567 != 0;
    int _1571 = _1561 * _1553;
    int _1573 = abs(_1092);
    int _1575 = abs(_1565);
    int _1577 = _1517 * _1483;
    int _1579 = _1577 + _1571;
    bool _1581 = !_1569;
    int _1583 = _1581 ? 0 : 1;
    int _1585 = _1539 * _1575;
    int _1587 = _1585 + _1435;
    int _1589 = _1579 * _1573;
    int _1591 = abs(_1583);
    int _1593 = _1557 * _1415;
    int _1595 = _1593 + _1589;
    int _1597 = ~_1421;
    int _1599 = _1597 + 1;
    bool _1601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1603 = isnan(0.5);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1609 = _1605 || _1607;
    int _1611 = _1587 * _1417;
    int _1613 = _1611 + _1595;
    int _1615 = ~_1421;
    int _1617 = _1615 + 1;
    float _1619 = as_type<float>(_1579);
    float _1621 = as_type<float>(_1415);
    float _1623 = as_type<float>(_1417);
    if (_816)
    {
        _1619 = 1.0;
    }
    float _1625 = _1619;
    int _1627 = _1539 * _1591;
    int _1629 = _1627 + _1613;
    float _1631 = float(uint(_1629));
    float _1633 = as_type<float>(_1437) * _1631;
    float _1635 = trunc(_1633);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    int _1641 = _1617 * int(_1639);
    int _1643 = _1641 + _1629;
    float _1645 = float(uint(_1643));
    float _1647 = as_type<float>(_1643);
    float _1649 = _1625;
    if (_1609)
    {
        _1647 = 1.0;
    }
    float _1651 = _1647;
    float _1653 = as_type<float>(_1437) * _1645;
    float _1655 = trunc(_1653);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    int _1661 = int(_1639) + int(_1659);
    int _1663 = _1599 * _1661;
    int _1665 = _1663 + _1629;
    bool _1667 = uint(_1665) >= uint(_1421);
    bool _1669 = !_1667;
    int _1671 = _1669 ? 0 : (-1);
    int _1673 = ~_1661;
    int _1675 = _1673 + _1671;
    int _1677 = _1675 + 1;
    int _1679 = _1421 * _1677;
    int _1681 = _1679 + _1629;
    float _1683 = as_type<float>(_1677);
    float _1685 = as_type<float>(_1665);
    float _1687 = _1651;
    if (_1609)
    {
        _1683 = 1.0;
    }
    float _1689 = _1683;
    float _1691 = _1689;
    float _1693 = _1407;
    if (!_1609)
    {
        float _1695 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1701;
        float _1705 = _1697 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        float _1709 = _1699 * 0.15915493667125701904296875;
        float _1711 = _1697 * 6.283185482025146484375;
        float _1713 = sin(_1711);
        float _1715 = 1.0 / _1707;
        float _1717 = _1709 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1713 * _1715;
        float _1723 = _1709 * 6.283185482025146484375;
        float _1725 = sin(_1723);
        float _1727 = _1719 * _1721;
        float _1729 = 1.0 / _1703;
        float _1731 = 1.0 / _1727;
        float _1733 = _1725 * _1731;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = fma(_681, _1733, _1735);
        float _1739 = _1737 * _1729;
        float _1741 = precise::clamp(_1739, 0.0, 1.0);
        _1621 = _1721;
        _1685 = _1729;
        _1623 = _1709;
        _1691 = _1741;
    }
    float _1743 = _1621;
    float _1745 = _1685;
    float _1747 = _1623;
    float _1749 = _1691;
    float _1751 = _1745;
    float _1753 = _1743;
    float _1755 = _1747;
    if (!_1609)
    {
        float _1757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1759 = _1757 * 0.15915493667125701904296875;
        float _1761 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1763 = _1759 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1761 * 0.15915493667125701904296875;
        float _1769 = _1759 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = 1.0 / _1765;
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        float _1779 = _1771 * _1773;
        float _1781 = _1767 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = 1.0 / _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1791 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1789;
        float _1793 = 1.0 / _1791;
        float _1795 = _1783 * _1787;
        float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1799 = fma(_681, _1795, _1797);
        float _1801 = _1799 * _1793;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        float _1805 = -_1803;
        float _1807 = _1805 + 1.0;
        _1751 = _1787;
        _1753 = _1773;
        _1687 = _1807;
    }
    float _1809 = _1751;
    float _1811 = _1753;
    float _1813 = _1687;
    float _1815 = _1811;
    if (!_816)
    {
        int _1817 = _860 << 4;
        int _1819 = _1817 + 2048;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
        int _1837 = _1819 + 8;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
        int _1843 = int(_1839) & 3;
        float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
        int _1847 = int(_1839) + 1;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        int _1851 = _1847 & 3;
        float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
        float _1855 = _661 * _1835;
        float _1857 = fma(_583, _1827, _1855);
        float _1859 = fma(_585, _1845, _1857);
        float _1861 = _1859 + _1853;
        float _1863 = precise::clamp(_1861, 0.0, 1.0);
        float _1865 = -_1863;
        float _1867 = _1865 + _1388;
        float _1869 = fma(_1867, 500.0, 1.5);
        float _1871 = exp2(_1869);
        float _1873 = 0.0 + _1871;
        float _1875 = precise::clamp(_1873, 0.0, 1.0);
        _1649 = _1875;
    }
    float _1877 = _1649;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1230 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1232 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1889 = _1234 + _1887;
    float _1891 = _1881 * _1881;
    float _1893 = fma(_1885, _1885, _1891);
    float _1895 = fma(_1889, _1889, _1893);
    float _1897 = rsqrt(_1895);
    float _1899 = sqrt(_1895);
    float _1901 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1903 = _1885 * _1901;
    float _1905 = _1889 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 + _1909;
    float _1913 = sqrt(_1911);
    bool _1915 = _1913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = _1913 + _1917;
    float _1921 = _1891;
    float _1923 = _1919;
    float _1925 = _1903;
    float _1927 = _1905;
    float _1929 = _1909;
    if (_1915)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1921 = _1931;
    }
    float _1933 = _1921;
    if (_1915)
    {
        float _1935 = rsqrt(_1911);
        _1815 = _1935;
    }
    float _1937 = _1815;
    float _1939 = _1937;
    if (_1915)
    {
        float _1941 = _1919 * _1933;
        _1923 = _1941;
    }
    float _1943 = _1923;
    if (_1915)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1755 = _1945;
    }
    float _1947 = _1755;
    float _1949 = _1809;
    if (_1915)
    {
        float _1951 = _1947 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1959 = precise::max(0.0, _1957);
    float _1961 = _1933;
    float _1963 = _1959;
    if (_1915)
    {
        float _1965 = _1947 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        _1961 = _1967;
    }
    float _1969 = _1961;
    float _1971 = -_1901;
    float _1973 = -_1959;
    float _1975 = fma(_1881, _1971, _1973);
    float _1977 = _1975;
    if (_1915)
    {
        float _1979 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1963 = _1979;
    }
    float _1981 = _1963;
    float _1983 = _1955;
    float _1985 = _1981;
    if (_1915)
    {
        float _1987 = fma(_1955, _1981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1983 = _1987;
    }
    float _1989 = _1983;
    float _1991 = _1989;
    if (_1915)
    {
        float _1993 = _1969 + (-1.0);
        _1985 = _1993;
    }
    float _1995 = _1985;
    float _1997 = _1995;
    if (_1915)
    {
        float _1999 = _1937 * _1989;
        _1991 = _1999;
    }
    float _2001 = _1991;
    if (_1915)
    {
        float _2003 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1939 = _2003;
    }
    float _2005 = _1939;
    if (_1915)
    {
        float _2007 = _1903 * _2001;
        _1925 = _2007;
    }
    float _2009 = _1925;
    if (!_1915)
    {
        _1997 = _1907;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1915)
    {
        float _2015 = _1905 * _2001;
        _1927 = _2015;
    }
    float _2017 = _1927;
    if (_1915)
    {
        float _2019 = fma(_1975, _1969, _2005);
        _1977 = _2019;
    }
    float _2021 = _1977;
    if (_1915)
    {
        float _2023 = _2009 * _2009;
        _2013 = _2023;
    }
    float _2025 = _2013;
    if (_1915)
    {
        float _2027 = _2017 * _2017;
        _1929 = _2027;
    }
    float _2029 = _1929;
    float _2031 = fma(_2021, _2021, _2025);
    float _2033 = _2031 + _2029;
    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2037 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2035);
    float _2039 = precise::clamp(_2037, 0.0, 1.0);
    float _2041 = rsqrt(_2033);
    float _2043 = -_2039;
    float _2045 = _2043 + 1.0;
    float _2047 = abs(_2045);
    float _2049 = log2(_2047);
    float _2051 = _2041 * _2009;
    float _2053 = _2041 * _2021;
    float _2055 = _2041 * _2017;
    float _2057 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2059 = -_2057;
    float _2061 = fma(_2053, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2059);
    float _2063 = -_2055;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2061);
    float _2067 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2069 = fma(_2065, -0.5, 0.5);
    float _2071 = fma(_2065, 0.5, 0.5);
    float _2073 = exp2(_2067);
    float _2075 = fma(_2071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2077 = fma(_2071, _2075, -0.212114393711090087890625);
    float _2079 = _2053 + 1.0;
    float _2081 = sqrt(_2069);
    float _2083 = fma(_2071, _2077, 1.570728778839111328125);
    float _2085 = -_2053;
    float _2087 = fma(_2073, _2079, _2085);
    float _2089 = float(uint(_1587));
    float _2091 = fma(_2087, 0.5, 0.5);
    float _2093 = _2081 * 0.636619746685028076171875;
    float _2095 = -_2083;
    float _2097 = fma(_2093, _2095, 1.0);
    bool _2099 = !_1527;
    int _2101 = _2099 ? _1681 : (-1);
    float2 _6340 = float2(_2097, _2091);
    float3 _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6340, float2(0.0), isnan(_6340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6340, float2(0.0), isnan(_6340)), level(0.0)).xyz;
    float _2107 = _2105.x;
    float _2109 = _2105.y;
    float _2111 = _2105.z;
    float _2113 = as_type<float>(_1437) * _2089;
    int _2115 = _2101 >> 31;
    float _2117 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2119 = _2101 & 3;
    bool _2121 = _2119 != 0;
    float _2123 = -_603;
    float _2125 = _2123 + 1.0;
    int _2127 = _2115 & 3;
    float _2129 = trunc(_2113);
    float _2131 = precise::max(_2129, 0.0);
    uint _2133 = uint(_2131);
    int _2135 = _2121 ? 0 : 1;
    int _2137 = _2101 + _2127;
    int _2139 = ~_1421;
    int _2141 = _2139 + 1;
    int _2143 = _2137 >> 2;
    float _2145 = exp2(_2117);
    int _2147 = ~_2135;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    int _2153 = _2143 << 4;
    int _2155 = _2153 + 368;
    int _2157 = ~_1421;
    int _2159 = _2157 + 1;
    uint _2161 = uint(int(uint(_2155) >> uint(2)));
    uint _2163 = uint(int(uint(int(_2161)) >> uint(2)));
    int _2165 = int(_2161) & 3;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[int(_2163)][_2165];
    int _2169 = int(_2161) + 1;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    int _2173 = _2169 & 3;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[int(_2171)][_2173];
    int _2177 = _2141 * int(_2133);
    int _2179 = _2177 + _1587;
    float _2181 = float(uint(_2179));
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2187 = as_type<float>(_1437) * _2181;
    int _2189 = _2101 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = 1.0 / _2185;
    int _2195 = _2155 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    uint _2199 = uint(int(uint(int(_2197)) >> uint(2)));
    int _2201 = int(_2197) & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    int _2205 = int(_2197) + 1;
    uint _2207 = uint(int(uint(_2205) >> uint(2)));
    int _2209 = _2205 & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    bool _2213 = uint(_2189) > 1u;
    bool _2215 = _2189 != 3;
    bool _2217 = _2189 != 3;
    float _2219 = trunc(_2187);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    bool _2225 = !_2217;
    int _2227 = _2225 ? 0 : (-1);
    int _2229 = abs(_2227);
    int _2231 = _2151;
    if (!_2213)
    {
        int _2233 = ~_2135;
        int _2235 = _2233 + 1;
        _2231 = _2235;
    }
    int _2237 = _2231;
    bool _2239 = uint(_2189) >= 2u;
    int _2241 = abs(_2237);
    float _2243 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2245 = int(_2243);
    int _2247 = _2239 ? 0 : 1;
    int _2249 = int(_2133) + int(_2223);
    int _2251 = ~_2247;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    bool _2257 = !_2191;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = _2159 * _2249;
    int _2263 = _2261 + _1587;
    int _2265 = _2255;
    if (_2215)
    {
        int _2267 = ~_2247;
        int _2269 = _2267 + 1;
        _2265 = _2269;
    }
    int _2271 = _2265;
    int _2273 = ~_2241;
    int _2275 = _2273 + 1;
    int _2277 = _2275 + 1;
    int _2279 = abs(_2259);
    int _2281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2283 = _2281 != 0;
    int _2285 = _2277 * as_type<int>(_2175);
    int _2287 = abs(_2271);
    bool _2289 = uint(_2263) >= uint(_1421);
    bool _2291 = !_2283;
    int _2293 = _2291 ? 0 : 1;
    int _2295 = ~_2279;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2293);
    int _2303 = _2299 * as_type<int>(_2167);
    int _2305 = _2303 + _2285;
    bool _2307 = !_2289;
    int _2309 = _2307 ? 0 : (-1);
    int _2311 = ~_2287;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = float(uint(_2245));
    int _2319 = ~_2249;
    int _2321 = _2319 + _2309;
    int _2323 = _2321 + 1;
    int _2325 = _2315 * as_type<int>(_2203);
    int _2327 = _2325 + _2305;
    int _2329 = ~_2229;
    int _2331 = _2329 + 1;
    int _2333 = _2331 + 1;
    float _2335 = 1.0 / _2317;
    int _2337 = abs(_2245);
    int _2339 = _2333 * as_type<int>(_2211);
    int _2341 = _2339 + _2327;
    int _2343 = ~_2301;
    int _2345 = _2343 + 1;
    int _2347 = _2345 + 1;
    int _2349 = _1421 * _2323;
    int _2351 = _2349 + _1587;
    float _2353 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2355 = _2341 * _2347;
    float _2357 = float(uint(_2337));
    float _2359 = in.m_63.y;
    bool _2361 = !_1527;
    int _2363 = _2361 ? _2351 : (-1);
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2367 = 1.0 / _2357;
    int _2369 = _2363 * _2301;
    int _2371 = _2369 + _2355;
    float _2373 = -_2365;
    float _2375 = fma(_2353, 2.0, _2373);
    int _2377 = as_type<int>(_2335) + (-2);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2381 = _2379 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2385 = _2383 != 0;
    float _2387 = -_145;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2375);
    float _2391 = float(uint(_2371));
    float _2393 = 1.0 / _2381;
    int _2395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2397 = _2395 != 0;
    int _2399 = abs(_2371);
    float _2401 = as_type<float>(_2377) * _2391;
    int _2403 = as_type<int>(_2367) + (-2);
    float _2405 = float(uint(_2399));
    float _2407 = trunc(_2401);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2415 = as_type<float>(_2403) * _2405;
    bool _2417 = _165 > 0.5;
    float _2419 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2419;
    float _2423 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2413);
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2427 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2429 = trunc(_2415);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    float _2435 = _2421 * _2393;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2439 = _547 + _2437;
    bool _2441 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2443 = isnan(_547);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = fma(_2427, -2.0, _2425);
    int _2455 = ~_2245;
    int _2457 = _2455 + 1;
    float _2459 = fma(_2435, _2439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2461 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2463 = isnan(_547);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = -_2451;
    float _2475 = _2473 + 1.0;
    float _2477 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _2481 = _2457 * int(_2411);
    int _2483 = _2481 + _2371;
    bool _2485 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2487 = isnan(_547);
    bool _2489 = _2485 || _2487;
    bool _2491 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2493 = _2489 || _2491;
    float _2495 = float(_2493);
    float _2497 = _2471 * _2475;
    int _2499 = ~_2337;
    int _2501 = _2499 + 1;
    float _2503 = -_2471;
    float _2505 = _2503 + 1.0;
    float _2507 = float(uint(_2483));
    float _2509 = _2479 * _2193;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2513 = _2501 * int(_2433);
    int _2515 = _2513 + _2399;
    float _2517 = _2495 * _2505;
    float _2519 = as_type<float>(_2377) * _2507;
    bool _2521 = _2359 > 0.5;
    float _2523 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2511);
    float _2525 = _2459 * _2517;
    float _2527 = float(uint(_2515));
    float _2529 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2531 = -_213;
    int _2533 = _2417 ? as_type<int>(_2531) : as_type<int>(_213);
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2537 = _547 + _2535;
    float _2539 = trunc(_2519);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    float _2545 = as_type<float>(_2403) * _2527;
    bool _2547 = !_2385;
    float _2549 = _2547 ? _213 : as_type<float>(_2533);
    float _2551 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2553 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2555 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2557 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2559 = -_2495;
    float _2561 = _2559 + 1.0;
    float _2563 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2553);
    float _2565 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2555);
    float _2567 = fma(_2509, _2537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2569 = trunc(_2545);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    float _2575 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2557);
    float _2577 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2525);
    float _2579 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2423);
    int _2581 = ~_2245;
    int _2583 = _2581 + 1;
    float _2585 = fma(_2567, _2497, _2577);
    int _2587 = int(_2411) + int(_2543);
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2595 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2453);
    int _2597 = ~_2337;
    int _2599 = _2597 + 1;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2603 = int(_2433) + int(_2573);
    int _2605 = _2583 * _2587;
    int _2607 = _2605 + _2371;
    float _2609 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2523);
    float _2611 = _2589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2613 = _2591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2615 = uint(_2607) >= uint(_2245);
    int _2617 = _2599 * _2603;
    int _2619 = _2617 + _2399;
    float _2621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2623 = -_201;
    int _2625 = _2521 ? as_type<int>(_2623) : as_type<int>(_201);
    out.m_76.x = _2611;
    out.m_76.y = _2613;
    out.m_76.z = _2601;
    bool _2627 = !_2615;
    int _2629 = _2627 ? 0 : (-1);
    float _2631 = fma(_2451, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2585);
    bool _2633 = uint(_2619) >= uint(_2337);
    float _2635 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2637 = ~_2587;
    int _2639 = _2637 + _2629;
    int _2641 = _2639 + 1;
    float _2643 = -_2579;
    float _2645 = _2643 + 1.0;
    bool _2647 = _2245 == 0;
    float _2649 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    bool _2651 = _2245 == 0;
    float _2653 = abs(_681);
    float _2655 = log2(_2653);
    bool _2657 = !_2397;
    float _2659 = _2657 ? _201 : as_type<float>(_2625);
    int _2661 = _2245 * _2641;
    int _2663 = _2661 + _2371;
    int _2665 = _2371 ^ _2245;
    bool _2667 = !_2633;
    int _2669 = _2667 ? 0 : (-1);
    uint _2671 = uint(int(uint(_2665) >> uint(31)));
    float _2673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2675 = !_2647;
    int _2677 = _2675 ? _2663 : (-1);
    int _2679 = ~int(_2671);
    int _2681 = _2679 + 1;
    int _2683 = ~_2669;
    int _2685 = _2603 + _2683;
    int _2687 = _2685 + 1;
    float _2689 = float(_2677);
    float _2691 = _2621 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2693 = _2687 ^ _2681;
    float _2695 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2649);
    float _2697 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2699 = fma(_2691, _2689, _2389);
    float _2701 = _2549 + 0.5;
    int _2703 = ~_2681;
    int _2705 = _2703 + _2693;
    int _2707 = _2705 + 1;
    float _2709 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2711 = fma(_2691, _2701, _2699);
    float _2713 = exp2(_2697);
    float _2715 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2717 = !_2651;
    int _2719 = _2717 ? _2707 : (-1);
    float _2721 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2727 = float(_2719);
    float _2729 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2731 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2733 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2735 = _2631 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2737 = -_2595;
    float _2739 = fma(_2715, _2727, _2737);
    bool _2741 = _681 <= 8000.0;
    bool _2743 = isnan(_681);
    bool _2745 = _2741 || _2743;
    bool _2747 = isnan(8000.0);
    bool _2749 = _2745 || _2747;
    float _2751 = float(_2749);
    float _2753 = _2659 + (-0.5);
    out.m_78.x = _2729;
    out.m_78.y = _2731;
    out.m_78.z = _2733;
    out.m_78.w = _2735;
    float _2755 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2757 = precise::clamp(_2755, 0.0, 1.0);
    float _2759 = _2709 + _1314;
    float _2761 = -_2715;
    float _2763 = fma(_2761, _2753, _2739);
    out.gl_Position.x = _1354;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _2709;
    out.gl_Position.w = _1314;
    float _2765 = -_2645;
    float _2767 = fma(_2549, _2765, _2711);
    float _2769 = -_2609;
    float _2771 = _2769 + 1.0;
    float _2773 = _2759 * 0.5;
    bool _2775 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2777 = isnan(_1899);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2659, _2771, _2763);
    out.m_80.z = _2773;
    out.m_80.w = _1314;
    out.m_82.x = _2767;
    out.m_82.y = _2785;
    float _2787 = -_2145;
    float _2789 = _2787 + 1.0;
    float _2791 = fma(_2757, -2.0, 3.0);
    float _2793 = _2757 * _2757;
    float _2795 = _2735;
    float _2797 = _2733;
    if (!_1286)
    {
        _1362 = 1.0;
    }
    float _2799 = _1362;
    float _2801 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2803 = _2799;
    if (_1286)
    {
        bool _2805 = _1396 >= _1358;
        bool _2807 = isnan(_1396);
        bool _2809 = _2805 || _2807;
        bool _2811 = isnan(_1358);
        bool _2813 = _2809 || _2811;
        float _2815 = float(_2813);
        _2803 = _2815;
    }
    float _2817 = _2803;
    float _2819 = _2793 * _2791;
    float _2821 = _2819;
    if (!_2783)
    {
        _2795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2823 = _2795;
    float _2825 = _2801 * _1398;
    float _2827 = -_2801;
    float _2829 = _2827 + 1.0;
    float _2831 = -_2819;
    float _2833 = _2831 + 1.0;
    float _2835 = _2817 * _1877;
    float _2837 = _1409 * _2825;
    float _2839 = _1409 * _2829;
    float _2841 = fma(_2833, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2819);
    float _2843 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2783)
    {
        _2797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2849 = _2797;
    float _2851 = _2751 * _2841;
    float _2853 = _2851;
    float _2855 = _2849;
    float _2857 = _2849;
    if (!_2783)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2859 = _2821;
    float _2861 = _2111 * _2825;
    float _2863 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2865 = fma(_2107, _2837, _1403);
    float _2867 = fma(_2109, _2837, _1405);
    float _2869 = fma(_1409, _2861, _1407);
    float _2871 = _2125 * _2863;
    float _2873 = precise::clamp(_2871, 0.0, 1.0);
    float _2875 = _2575 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2877 = _1749 * _1813;
    float _2879 = _2873;
    float _2881 = _2859;
    float _2883 = _2859;
    if (!_2783)
    {
        _1693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2885 = _1693;
    float _2887 = -_2873;
    float _2889 = fma(_2887, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_84.x = _2865;
    out.m_84.y = _2867;
    out.m_84.z = _2869;
    out.m_84.w = _2839;
    float _2891 = _2885;
    float _2893 = _2885;
    if (!_2783)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2895 = _2853;
    float _2897 = -_2835;
    float _2899 = fma(_2897, _2889, 1.0);
    float _2901 = precise::clamp(_2899, 0.0, 1.0);
    float _2903 = _2895;
    float _2905 = _2895;
    if (!_2783)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2907 = _2879;
    float _2909 = _2901 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2911 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_86.x = _2909;
    out.m_88.x = _2843;
    out.m_88.y = _2911;
    out.m_88.z = _2875;
    bool _2913 = !_2783;
    float _2915 = _2907;
    float _2917 = _2907;
    if (!_2913)
    {
        bool _2919 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2921 = isnan(_1899);
        bool _2923 = _2919 || _2921;
        bool _2925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2927 = _2923 || _2925;
        if (!_2927)
        {
            float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2931 = _1899 + _2929;
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2935 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2933;
            float _2937 = 1.0 / _2935;
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2959 = _2931 * _2937;
            float _2961 = precise::clamp(_2959, 0.0, 1.0);
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = fma(_2961, _2941, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2969 = fma(_2961, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2971 = fma(_2961, _2945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2973 = fma(_2961, _2949, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2975 = fma(_2961, _2953, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2977 = fma(_2961, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2847 = _2969;
            _2905 = _2975;
            _2893 = _2967;
            _2883 = _2973;
            _2857 = _2971;
            _2917 = _2977;
            _2979 = true;
        }
        else
        {
            bool _2981 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2983 = isnan(_1899);
            bool _2985 = _2981 || _2983;
            bool _2987 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2989 = _2985 || _2987;
            if (!_2989)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2991 = _2891;
            _2893 = _2991;
            if (!_2989)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2993 = _2845;
            _2847 = _2993;
            if (!_2989)
            {
                _2855 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2995 = _2855;
            _2857 = _2995;
            if (!_2989)
            {
                _2881 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2997 = _2881;
            _2883 = _2997;
            if (!_2989)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2999 = _2903;
            _2905 = _2999;
            if (!_2989)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3001 = _2915;
            bool _3003 = !_2989;
            _2917 = _3001;
            if (!_3003)
            {
                bool _3005 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3007 = isnan(_1899);
                bool _3009 = _3005 || _3007;
                bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3013 = _3009 || _3011;
                if (!_3013)
                {
                    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3017 = _1899 + _3015;
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3021 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3019;
                    float _3023 = 1.0 / _3021;
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3045 = _3017 * _3023;
                    float _3047 = precise::clamp(_3045, 0.0, 1.0);
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = fma(_3047, _3027, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3055 = fma(_3047, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3057 = fma(_3047, _3031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3059 = fma(_3047, _3035, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3061 = fma(_3047, _3039, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3063 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2847 = _3055;
                    _2905 = _3061;
                    _2893 = _3053;
                    _2883 = _3059;
                    _2857 = _3057;
                    _2917 = _3063;
                    _2979 = true;
                }
                else
                {
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2883 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2857 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2979 = false;
    float _3065 = _2847;
    float _3067 = _2905;
    float _3069 = _2893;
    float _3071 = _2883;
    float _3073 = _2857;
    float _3075 = _2917;
    float _3077 = _2877 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3079 = fma(_2911, -0.5, 0.5);
    float _3081 = precise::clamp(_3079, 0.0, 1.0);
    float _3083 = -_3065;
    float _3085 = _3083 + _3067;
    float _3087 = -_3069;
    float _3089 = _3087 + _3071;
    out.m_59.x = _3077;
    float _3091 = fma(_3081, _3085, _3065);
    float _3093 = -_3073;
    float _3095 = _3093 + _3075;
    float _3097 = fma(_3081, _3089, _3069);
    float _3099 = _3091 * 0.586610972881317138671875;
    bool _3101 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = fma(_3081, _3095, _3073);
    out.m_90.x = 0.0;
    float _3105 = fma(_3097, 0.298911988735198974609375, _3099);
    bool _3107 = _1749 > 0.0;
    bool _3109 = isnan(_1749);
    bool _3111 = _3107 || _3109;
    bool _3113 = isnan(0.0);
    bool _3115 = _3111 || _3113;
    float _3117 = fma(_3103, 0.114477999508380889892578125, _3105);
    bool _3119 = _1813 <= 0.0;
    bool _3121 = !_3115;
    bool _3123 = _3119 || _3121;
    float _3125 = -_3117;
    float _3127 = _3097 + _3125;
    float _3129 = -_3117;
    float _3131 = _3091 + _3129;
    float _3133 = -_3117;
    float _3135 = _3103 + _3133;
    float _3137 = fma(_3127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    float _3139 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    float _3141 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    bool _3143 = !_3101;
    if (!_3143)
    {
        float _3145 = -_1230;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3149 = -_1232;
        float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3153 = -_1234;
        float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3157 = _3147 * _3147;
        float _3159 = fma(_3151, _3151, _3157);
        float _3161 = fma(_3155, _3155, _3159);
        float _3163 = sqrt(_3161);
        float _3165 = rsqrt(_3161);
        float _3167 = -_3163;
        float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3171 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3173 = precise::clamp(_3171, 0.0, 1.0);
        float _3175 = _3151 * _3165;
        float _3177 = _3147 * _3165;
        float _3179 = abs(_3173);
        float _3181 = log2(_3179);
        float _3183 = _3155 * _3165;
        float _3185 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3187 = _2911 * _3177;
        float _3189 = -_3177;
        float _3191 = -_3185;
        float _3193 = fma(_3189, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3191);
        float _3195 = fma(_2843, _3175, _3187);
        float _3197 = -_3183;
        float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3193);
        float _3201 = fma(_2875, _3183, _3195);
        float _3203 = precise::clamp(_3201, 0.0, 1.0);
        float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3207 = _3199 + _3205;
        float _3209 = _3181 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3211 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3213 = precise::clamp(_3211, 0.0, 1.0);
        float _3215 = exp2(_3209);
        float _3217 = _3215 * _3213;
        float _3219 = _3203 * _3217;
        float _3221 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3223 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3225 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3221;
        out.m_90.y = _3223;
        out.m_90.z = _3225;
    }
    out.m_92.x = _3137;
    out.m_92.y = _3139;
    out.m_92.z = _3141;
    if (!_3123)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3227 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3227;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2979 = false;
    bool _537 = false;
    bool _341 = false;
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
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_59.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3284 = as_type<float>(_127);
        out.gl_Position.z = _3284;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_141)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _129 = as_type<int>(_161);
    }
    int _163 = _129;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_163);
        out.gl_Position.z = _3353;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _175 = _169 * _167;
    float _177 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    float _181 = _177 * _173;
    float _183 = _179 * 6.283185482025146484375;
    float _185 = floor(_179);
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _181);
    int _189 = as_type<int>(_171) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_171) & 2;
    bool _195 = _193 != 0;
    float _197 = _183 * 0.15915493667125701904296875;
    bool _199 = !_195;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = floor(_187);
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _187 * 6.283185482025146484375;
    bool _211 = !_191;
    float _213 = _211 ? (-0.5) : 0.5;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _221 = _219 != 0;
    float _223 = _209 * 0.15915493667125701904296875;
    bool _225 = !_207;
    int _227 = _225 ? 0 : 1;
    float _229 = _197 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = -_185;
    float _235 = _179 + _233;
    bool _237 = !_217;
    int _239 = _237 ? 0 : 1;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _243 = abs(_239);
    float _245 = _223 * 6.283185482025146484375;
    float _247 = cos(_245);
    float _249 = -_203;
    float _251 = _187 + _249;
    bool _253 = _235 < 0.5;
    float _255 = float(_253);
    float _257 = -_235;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _261 = !_221;
    int _263 = _261 ? 0 : 1;
    int _265 = abs(_227);
    float _267 = -_255;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = fma(_231, 0.5, 0.5);
    int _273 = abs(_263);
    float _275 = -_271;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_243);
    float _281 = fma(_247, 0.5, 0.5);
    bool _283 = _251 < 0.5;
    float _285 = float(_283);
    float _287 = -_251;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _291 = float(_265);
    float _293 = abs(_259);
    float _295 = _279 * _293;
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _305 = abs(_289);
    float _307 = _279 * _305;
    float _309 = float(_273);
    float _311 = fma(_291, _277, _295);
    float _313 = fma(_291, _303, _307);
    float _315 = abs(_269);
    float _317 = fma(_309, _315, _311);
    float _319 = abs(_299);
    float _321 = fma(_309, _319, _313);
    bool _323 = !_241;
    float _339;
    if (!_323)
    {
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _327 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        float _343 = float(_111);
        float _345 = 1.0 / _343;
        float _347 = _145 * _345;
        _339 = _347;
    }
    _341 = false;
    float _349 = _339;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _349 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = _349 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _349 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _371;
    bool _375 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_349);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = 1.0 / _365;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _373;
    float _393 = 1.0 / _369;
    float _395 = _353 * _387;
    bool _397 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _399 = isnan(_349);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_385;
    float _411 = _409 + 1.0;
    float _413 = _407 * _411;
    float _415 = _357 * _391;
    bool _417 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_349);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_407;
    float _431 = _429 + 1.0;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = _427 * _431;
    float _439 = -_427;
    float _441 = _439 + 1.0;
    float _443 = _361 * _393;
    bool _445 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_349);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = fma(_435, _443, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_459, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _455 * _441;
    float _475 = fma(_465, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_469, _443, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = -_455;
    float _481 = _479 + 1.0;
    float _483 = _471 * _473;
    float _485 = _475 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _487;
    float _491 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _493;
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _485);
    float _499 = fma(_489, _415, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _501 = fma(_461, _437, _491);
    float _503 = fma(_495, _415, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = fma(_477, _437, _497);
    float _507 = fma(_499, _413, _501);
    float _509 = fma(_503, _413, _505);
    float _511 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[146].x, _507);
    float _513 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[146].y, _509);
    bool _515 = !_389;
    float _533;
    float _535;
    if (!_515)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _519 = _165 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _521 = float(_111);
        float _523 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _525 = _523 * _517;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _521;
        _535 = _531;
        _537 = true;
    }
    else
    {
        float _539 = float(_111);
        float _541 = 1.0 / _539;
        float _543 = _145 * _541;
        _533 = _539;
        _535 = _543;
    }
    _537 = false;
    float _545 = _533;
    float _547 = _535;
    float _549 = in.m_56.x;
    float _551 = in.m_56.y;
    float _553 = in.m_56.z;
    float _555 = in.m_68.x;
    float _557 = in.m_68.y;
    float _559 = in.m_68.z;
    float _561 = in.m_68.w;
    float _563 = in.m_70.x;
    float _565 = in.m_70.y;
    float _567 = in.m_70.z;
    float _569 = in.m_70.w;
    float _571 = _551 * _557;
    float _573 = _551 * _565;
    float _575 = fma(_549, _555, _571);
    float _577 = fma(_549, _563, _573);
    float _579 = fma(_553, _559, _575);
    float _581 = fma(_553, _567, _577);
    float _583 = _579 + _561;
    float _585 = _581 + _569;
    float _587 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _589 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _591 = floor(_587);
    float _593 = floor(_589);
    float _595 = -_591;
    float _597 = _587 + _595;
    float _599 = -_593;
    float _601 = _589 + _599;
    float2 _4007 = float2(_597, _601);
    float _603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4007, float2(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4007, float2(0.0), isnan(_4007)), level(0.0)).x;
    float _605 = in.m_72.x;
    float _607 = in.m_72.y;
    float _609 = in.m_72.z;
    float _611 = in.m_72.w;
    float _613 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _615 = _551 * _607;
    float _617 = fma(_549, _605, _615);
    float _619 = fma(_553, _609, _617);
    float _621 = _619 + _611;
    float _623 = _621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _625 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _627 = _621 + _625;
    float _629 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[11].x, _623);
    float _631 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[11].z, _629);
    float _633 = _621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _635 = _631 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _637 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[10].x, _633);
    float _639 = 1.0 / _635;
    float _641 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[10].z, _637);
    float _643 = _641 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _645 = _643 + _635;
    float _647 = _645 * _639;
    float _649 = _647 * 0.5;
    float _651 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _653 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[30].w, _651);
    float _655 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _657 = in.m_74.x;
    float _659 = in.m_74.y;
    float _661 = _621 + _655;
    float _663 = 1.0 / _653;
    float _665 = _661 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _667 = _661 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _669 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[126].x, _665);
    float _671 = fma(_583, (*spvDescriptorSet0.vp_c15)._m0[127].x, _667);
    float _673 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[126].z, _669);
    float _675 = fma(_585, (*spvDescriptorSet0.vp_c15)._m0[127].z, _671);
    float _677 = _673 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _681 = _663 * _679;
    float _683 = _675 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _685 = trunc(_677);
    int _687 = int(_685);
    float _689 = _511 * _657;
    bool _691 = _681 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _693 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _695 = _583 + _693;
    bool _697 = _681 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _699 = _317 * _689;
    bool _701 = !_691;
    int _703 = _701 ? 0 : 1;
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _707 = trunc(_683);
    int _709 = int(_707);
    float _711 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = _513 * _659;
    float _715 = _711 * _705;
    float _717 = _321 * _713;
    int _719 = 2;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c10)._m0[3].x);
    float _723 = _677;
    if (!_691)
    {
        _719 = 1;
    }
    int _725 = _719;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    int _729 = _725;
    if (!_697)
    {
        _729 = _703;
    }
    int _731 = _729;
    float _733 = _627 * _627;
    int _735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _737 = _687 + _735;
    int _739 = _737 + 1;
    float _741 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _743 = _731 << 6;
    float _745 = fma(_695, _695, _733);
    bool _747 = _739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _749 = _741 * _727;
    int _751 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _753 = _709 + _751;
    int _755 = _753 + 1;
    float _757 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _759 = _585 + _757;
    int _761 = _743 + 96;
    uint _764 = uint(int(uint(_761) >> uint(2)));
    uint _766 = uint(int(uint(int(_764)) >> uint(2)));
    int _768 = int(_764) & 3;
    float _770 = (*spvDescriptorSet0.vp_c15)._m0[int(_766)][_768];
    int _772 = int(_764) + 1;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    int _776 = _772 & 3;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[int(_774)][_776];
    float _780 = _749 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _782 = _739 | _755;
    float _784 = fma(_759, _759, _745);
    float _786 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].x, _780);
    bool _788 = _782 < 0;
    bool _790 = _788 || _747;
    float _792 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, -9.0, 10.0);
    int _794 = _743 + 104;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    float _812 = rsqrt(_784);
    bool _814 = _755 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _816 = _814 || _790;
    float _818 = _749 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _820 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _786);
    float _822 = _749 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _824 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].x, _818);
    int _826 = _743 + 48;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    float _844 = _820 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _846 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _822);
    float _848 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _824);
    float _850 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _846);
    int _852 = _755;
    float _854 = as_type<float>(_731);
    if (!_816)
    {
        int _856 = _755 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _858 = _856 + _739;
        _721 = _858;
    }
    int _860 = _721;
    int _862 = _743 + 64;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c15)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c15)._m0[int(_874)][_876];
    float _880 = _812 * _792;
    float _882 = _848 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = 0.0;
    int _886 = as_type<int>(_812);
    if (!_816)
    {
        float _888 = floor(_677);
        _884 = _888;
    }
    float _890 = _884;
    if (!_816)
    {
        int _892 = _860 << 2;
        _852 = _892;
    }
    int _894 = _852;
    float _896 = fma(_759, _880, _759);
    int _898 = _894;
    if (!_816)
    {
        uint _900 = uint(int(uint(_860) >> uint(2)));
        _886 = int(_900);
    }
    int _902 = _886;
    float _904 = fma(_695, _880, _695);
    if (!_816)
    {
        int _906 = 12 & _894;
        _898 = _906;
    }
    int _908 = _898;
    float _910 = _896 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _912 = _743 + 56;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c15)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.vp_c15)._m0[int(_924)][_926];
    float _930 = _904 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _932 = 0.0;
    if (!_816)
    {
        int _934 = _902 << 4;
        int _936 = _934 + _908;
        _932 = as_type<float>(_936);
    }
    float _938 = _932;
    float _940 = _882 + _910;
    float _942 = fma(_627, _880, _627);
    float _944 = _844 + _930;
    float _946 = _850 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _948 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _950 = _940 + _948;
    int _952 = _743 + 72;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _972 = _944 + _970;
    float _974 = _942 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _976 = _950 * _950;
    float _978 = _661 * _778;
    float _980 = fma(_972, _972, _976);
    float _982 = _938;
    float _984 = _778;
    float _986 = _944;
    float _988 = _940;
    float _990 = _974;
    if (!_816)
    {
        int _992 = as_type<int>(_938) + 400;
        uint _994 = uint(int(uint(_992) >> uint(2)));
        uint _996 = uint(int(uint(int(_994)) >> uint(2)));
        int _998 = int(_994) & 3;
        float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
        _982 = _1000;
    }
    float _1002 = _982;
    if (!_816)
    {
        float _1004 = floor(_683);
        _984 = _1004;
    }
    float _1006 = _984;
    float _1008 = fma(_583, _770, _978);
    float _1010 = fma(_585, _802, _1008);
    int _1012 = _743 + 80;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    float _1030 = sqrt(_980);
    float _1032 = _661 * _842;
    float _1034 = _1010 + _810;
    int _1036 = _743 + 88;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c15)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    float _1054 = fma(_583, _834, _1032);
    float _1056 = 1.0 / _1034;
    float _1058 = _661 * _878;
    bool _1060 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = fma(_583, _870, _1058);
    float _1064 = _946 + _974;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1076 = _1074 != 0;
    bool _1078 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1080 = isnan(0.5);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1086 = _1082 || _1084;
    float _1088 = fma(_585, _920, _1054);
    bool _1090 = !_1072;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = !_1068;
    int _1096 = _1094 ? 0 : 1;
    bool _1098 = !_1076;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = fma(_585, _960, _1062);
    float _1104 = _1010;
    float _1106 = _1062;
    if (!_1060)
    {
        _1104 = _1064;
    }
    float _1108 = _1104;
    bool _1110 = !_1060;
    float _1112 = _1108;
    float _1114 = _1002;
    if (!_1110)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1030 + _1118;
        float _1122 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = rsqrt(_980);
        float _1126 = _1120 * _1116;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = fma(_1132, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1140 = _1124 * _1138;
        float _1142 = _1136 + (-1.0);
        float _1144 = fma(_972, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = fma(_950, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1148 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = fma(_1064, _1136, _1148);
        _986 = _1144;
        _988 = _1146;
        _1112 = _1150;
        _990 = _1148;
        _1106 = _1138;
    }
    float _1152 = _986;
    float _1154 = _988;
    float _1156 = _1112;
    float _1158 = _990;
    float _1160 = _1106;
    float _1162 = _1088 + _928;
    float _1164 = _1102 + _968;
    float _1166 = _1158;
    float _1168 = _1160;
    float _1170 = _1156;
    if (_1086)
    {
        _1166 = _1152;
    }
    float _1172 = _1166;
    float _1174 = _1172;
    if (_1086)
    {
        _1168 = _1154;
    }
    float _1176 = _1168;
    float _1178 = _1176;
    if (!_1086)
    {
        float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1182 = _621 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1186 = _583 + _1184;
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1190 = -_583;
        float _1192 = _1190 + _1152;
        float _1194 = _1182 * _1182;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1198 = _585 + _1196;
        float _1200 = -_585;
        float _1202 = _1200 + _1154;
        float _1204 = fma(_1186, _1186, _1194);
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1208 = fma(_1198, _1198, _1204);
        float _1210 = sqrt(_1208);
        float _1212 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1214 = precise::min(_1210, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1216 = _1214 * _1206;
        float _1218 = -_621;
        float _1220 = _1218 + _1156;
        float _1222 = _1212 * _1216;
        float _1224 = fma(_1220, _1222, _621);
        float _1226 = fma(_1192, _1222, _583);
        float _1228 = fma(_1202, _1222, _585);
        _1170 = _1224;
        _1174 = _1226;
        _1178 = _1228;
    }
    float _1230 = _1170;
    float _1232 = _1174;
    float _1234 = _1178;
    float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = _1162 * _1056;
    float _1240 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1236);
    float _1246 = _1164 * _1056;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1240);
    bool _1250 = _1238 >= 0.0;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1244);
    float _1254 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1256 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1248);
    float _1260 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1262 = _1238 <= 1.0;
    bool _1264 = _1262 && _1250;
    float _1266 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1254);
    float _1268 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1270 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1272 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1274 = _1246 >= 0.0;
    bool _1276 = _1274 && _1264;
    float _1278 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1268);
    float _1282 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1272);
    bool _1284 = _1246 <= 1.0;
    bool _1286 = _1284 && _1276;
    float _1288 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1290 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1292 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1294 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1282);
    float _1296 = _1268;
    if (!_816)
    {
        float _1298 = rint(_1002);
        float _1300 = precise::max(_1298, 0.0);
        uint _1302 = uint(_1300);
        uint _1304 = clamp(_1302, 0u, 65535u);
        _1114 = as_type<float>(_1304);
    }
    float _1306 = _1114;
    float _1308 = -_1290;
    float _1310 = fma(_1308, _1288, 1.0);
    float _1312 = _661 * _1028;
    float _1314 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1294);
    float _1316 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1318 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1320 = fma(_583, _1020, _1312);
    if (!_816)
    {
        float _1322 = -_1006;
        float _1324 = _683 + _1322;
        _1296 = _1324;
    }
    float _1326 = _1296;
    float _1328 = 1.0 / _1314;
    if (_1286)
    {
        float _1330 = float(_731);
        _854 = _1330;
    }
    float _1332 = _854;
    float _1334 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1316);
    float _1336 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1318);
    float _1338 = fma(_585, _1044, _1320);
    if (!_816)
    {
        float _1340 = -_890;
        float _1342 = _677 + _1340;
        _723 = _1342;
    }
    float _1344 = _723;
    float _1346 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1334);
    float _1348 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1350 = log2(_1310);
    float _1352 = _1338 + _1052;
    float _1354 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1346);
    float _1356 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1348);
    float _1358 = _1352 * _1056;
    float _1360 = _1332;
    float _1362 = _1356;
    if (_1286)
    {
        float _1364 = rint(_1332);
        float _1366 = precise::max(_1364, 0.0);
        uint _1368 = uint(_1366);
        uint _1370 = clamp(_1368, 0u, 65535u);
        _1360 = as_type<float>(_1370);
    }
    float _1372 = _1360;
    float _1374 = _1354 * _1328;
    float _1376 = _1356 * _1328;
    float _1378 = fma(_1374, 0.5, 0.5);
    float _1380 = fma(_1376, -0.5, 0.5);
    float _1382 = _1350 * 0.693147182464599609375;
    float _1384 = _1326;
    if (!_816)
    {
        float3 _5324 = float3(_1344, _1326, float(as_type<int>(_1306)));
        float3 _5328 = select(_5324, float3(0.0), isnan(_5324));
        float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5328.xy, uint(rint(_5328.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5328.xy, uint(rint(_5328.z)), level(0.0)).x;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1392 = _1246;
    if (_1286)
    {
        float3 _5347 = float3(_1238, _1246, float(as_type<int>(_1372)));
        float3 _5349 = select(_5347, float3(0.0), isnan(_5347));
        float _1394 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5349.xy, uint(rint(_5349.z)), _1358, level(0.0));
        _1392 = _1394;
    }
    float _1396 = _1392;
    float3 _5359 = float3(_1378, _1380, _1390);
    float _1398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5359, float3(0.0), isnan(_5359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5359, float3(0.0), isnan(_5359)), level(0.0)).x;
    float3 _5368 = float3(_1378, _1380, _1390);
    float4 _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5368, float3(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5368, float3(0.0), isnan(_5368)), level(0.0)).xyzw;
    float _1403 = _1401.x;
    float _1405 = _1401.y;
    float _1407 = _1401.z;
    float _1409 = _1401.w;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1413 = int(_1411);
    int _1415 = abs(_1096);
    int _1417 = abs(_1100);
    float _1419 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1421 = int(_1419);
    float _1423 = float(_1413);
    float _1425 = 1.0 / _1423;
    float _1427 = float(uint(_1421));
    float _1429 = 1.0 / _1427;
    float _1431 = _145 * _1425;
    float _1433 = trunc(_1431);
    int _1435 = int(_1433);
    int _1437 = as_type<int>(_1429) + (-2);
    int _1439 = ~_1421;
    int _1441 = _1439 + 1;
    float _1443 = 1.0 / _545;
    float _1445 = float(uint(_1435));
    float _1447 = as_type<float>(_1437) * _1445;
    float _1449 = trunc(_1447);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    int _1455 = ~_1421;
    int _1457 = _1455 + 1;
    int _1459 = _1441 * int(_1453);
    int _1461 = _1459 + _1435;
    float _1463 = float(uint(_1461));
    float _1465 = as_type<float>(_1437) * _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1469 = _1467 != 0;
    float _1471 = trunc(_1465);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    bool _1477 = !_1469;
    float _1479 = _1477 ? 7.345489978790283203125 : 1.0;
    float _1481 = _1479 * _165;
    int _1483 = _1421 + (-1);
    float _1485 = floor(_1481);
    int _1487 = int(_1453) + int(_1475);
    float _1489 = float(_1421);
    float _1491 = float(_1435);
    int _1493 = _1457 * _1487;
    int _1495 = _1493 + _1435;
    bool _1497 = _1491 >= _1489;
    bool _1499 = isnan(_1491);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(_1489);
    bool _1505 = _1501 || _1503;
    float _1507 = float(_1505);
    bool _1509 = uint(_1495) >= uint(_1421);
    float _1511 = -_1485;
    float _1513 = _1481 + _1511;
    float _1515 = trunc(_1507);
    int _1517 = int(_1515);
    bool _1519 = !_1509;
    int _1521 = _1519 ? 0 : (-1);
    float _1523 = _1513 * _1489;
    float _1525 = _145 * _1489;
    bool _1527 = _1421 == 0;
    int _1529 = ~_1487;
    int _1531 = _1529 + _1521;
    int _1533 = _1531 + 1;
    float _1535 = _1525 * _1443;
    float _1537 = trunc(_1523);
    int _1539 = int(_1537);
    int _1541 = _1421 * _1533;
    int _1543 = _1541 + _1435;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1547 = _1545 != 0;
    int _1549 = ~_1517;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    float _1555 = trunc(_1535);
    int _1557 = int(_1555);
    bool _1559 = !_1527;
    int _1561 = _1559 ? _1543 : (-1);
    bool _1563 = !_1547;
    int _1565 = _1563 ? 0 : 1;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1569 = _1567 != 0;
    int _1571 = _1561 * _1553;
    int _1573 = abs(_1092);
    int _1575 = abs(_1565);
    int _1577 = _1517 * _1483;
    int _1579 = _1577 + _1571;
    bool _1581 = !_1569;
    int _1583 = _1581 ? 0 : 1;
    int _1585 = _1539 * _1575;
    int _1587 = _1585 + _1435;
    int _1589 = _1579 * _1573;
    int _1591 = abs(_1583);
    int _1593 = _1557 * _1415;
    int _1595 = _1593 + _1589;
    int _1597 = ~_1421;
    int _1599 = _1597 + 1;
    bool _1601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1603 = isnan(0.5);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1609 = _1605 || _1607;
    int _1611 = _1587 * _1417;
    int _1613 = _1611 + _1595;
    int _1615 = ~_1421;
    int _1617 = _1615 + 1;
    float _1619 = as_type<float>(_1579);
    float _1621 = as_type<float>(_1415);
    float _1623 = as_type<float>(_1417);
    if (_816)
    {
        _1619 = 1.0;
    }
    float _1625 = _1619;
    int _1627 = _1539 * _1591;
    int _1629 = _1627 + _1613;
    float _1631 = float(uint(_1629));
    float _1633 = as_type<float>(_1437) * _1631;
    float _1635 = trunc(_1633);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    int _1641 = _1617 * int(_1639);
    int _1643 = _1641 + _1629;
    float _1645 = float(uint(_1643));
    float _1647 = as_type<float>(_1643);
    float _1649 = _1625;
    if (_1609)
    {
        _1647 = 1.0;
    }
    float _1651 = _1647;
    float _1653 = as_type<float>(_1437) * _1645;
    float _1655 = trunc(_1653);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    int _1661 = int(_1639) + int(_1659);
    int _1663 = _1599 * _1661;
    int _1665 = _1663 + _1629;
    bool _1667 = uint(_1665) >= uint(_1421);
    bool _1669 = !_1667;
    int _1671 = _1669 ? 0 : (-1);
    int _1673 = ~_1661;
    int _1675 = _1673 + _1671;
    int _1677 = _1675 + 1;
    int _1679 = _1421 * _1677;
    int _1681 = _1679 + _1629;
    float _1683 = as_type<float>(_1677);
    float _1685 = as_type<float>(_1665);
    float _1687 = _1651;
    if (_1609)
    {
        _1683 = 1.0;
    }
    float _1689 = _1683;
    float _1691 = _1689;
    float _1693 = _1407;
    if (!_1609)
    {
        float _1695 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1701;
        float _1705 = _1697 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        float _1709 = _1699 * 0.15915493667125701904296875;
        float _1711 = _1697 * 6.283185482025146484375;
        float _1713 = sin(_1711);
        float _1715 = 1.0 / _1707;
        float _1717 = _1709 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1713 * _1715;
        float _1723 = _1709 * 6.283185482025146484375;
        float _1725 = sin(_1723);
        float _1727 = _1719 * _1721;
        float _1729 = 1.0 / _1703;
        float _1731 = 1.0 / _1727;
        float _1733 = _1725 * _1731;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = fma(_681, _1733, _1735);
        float _1739 = _1737 * _1729;
        float _1741 = precise::clamp(_1739, 0.0, 1.0);
        _1621 = _1721;
        _1685 = _1729;
        _1623 = _1709;
        _1691 = _1741;
    }
    float _1743 = _1621;
    float _1745 = _1685;
    float _1747 = _1623;
    float _1749 = _1691;
    float _1751 = _1745;
    float _1753 = _1743;
    float _1755 = _1747;
    if (!_1609)
    {
        float _1757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1759 = _1757 * 0.15915493667125701904296875;
        float _1761 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1763 = _1759 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1761 * 0.15915493667125701904296875;
        float _1769 = _1759 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = 1.0 / _1765;
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        float _1779 = _1771 * _1773;
        float _1781 = _1767 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = 1.0 / _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1791 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1789;
        float _1793 = 1.0 / _1791;
        float _1795 = _1783 * _1787;
        float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1799 = fma(_681, _1795, _1797);
        float _1801 = _1799 * _1793;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        float _1805 = -_1803;
        float _1807 = _1805 + 1.0;
        _1751 = _1787;
        _1753 = _1773;
        _1687 = _1807;
    }
    float _1809 = _1751;
    float _1811 = _1753;
    float _1813 = _1687;
    float _1815 = _1811;
    if (!_816)
    {
        int _1817 = _860 << 4;
        int _1819 = _1817 + 2048;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
        int _1837 = _1819 + 8;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
        int _1843 = int(_1839) & 3;
        float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
        int _1847 = int(_1839) + 1;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        int _1851 = _1847 & 3;
        float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
        float _1855 = _661 * _1835;
        float _1857 = fma(_583, _1827, _1855);
        float _1859 = fma(_585, _1845, _1857);
        float _1861 = _1859 + _1853;
        float _1863 = precise::clamp(_1861, 0.0, 1.0);
        float _1865 = -_1863;
        float _1867 = _1865 + _1388;
        float _1869 = fma(_1867, 500.0, 1.5);
        float _1871 = exp2(_1869);
        float _1873 = 0.0 + _1871;
        float _1875 = precise::clamp(_1873, 0.0, 1.0);
        _1649 = _1875;
    }
    float _1877 = _1649;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1230 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1232 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1889 = _1234 + _1887;
    float _1891 = _1881 * _1881;
    float _1893 = fma(_1885, _1885, _1891);
    float _1895 = fma(_1889, _1889, _1893);
    float _1897 = rsqrt(_1895);
    float _1899 = sqrt(_1895);
    float _1901 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1903 = _1885 * _1901;
    float _1905 = _1889 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 + _1909;
    float _1913 = sqrt(_1911);
    bool _1915 = _1913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = _1913 + _1917;
    float _1921 = _1891;
    float _1923 = _1919;
    float _1925 = _1903;
    float _1927 = _1905;
    float _1929 = _1909;
    if (_1915)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1921 = _1931;
    }
    float _1933 = _1921;
    if (_1915)
    {
        float _1935 = rsqrt(_1911);
        _1815 = _1935;
    }
    float _1937 = _1815;
    float _1939 = _1937;
    if (_1915)
    {
        float _1941 = _1919 * _1933;
        _1923 = _1941;
    }
    float _1943 = _1923;
    if (_1915)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1755 = _1945;
    }
    float _1947 = _1755;
    float _1949 = _1809;
    if (_1915)
    {
        float _1951 = _1947 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1959 = precise::max(0.0, _1957);
    float _1961 = _1933;
    float _1963 = _1959;
    if (_1915)
    {
        float _1965 = _1947 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        _1961 = _1967;
    }
    float _1969 = _1961;
    float _1971 = -_1901;
    float _1973 = -_1959;
    float _1975 = fma(_1881, _1971, _1973);
    float _1977 = _1975;
    if (_1915)
    {
        float _1979 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1963 = _1979;
    }
    float _1981 = _1963;
    float _1983 = _1955;
    float _1985 = _1981;
    if (_1915)
    {
        float _1987 = fma(_1955, _1981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1983 = _1987;
    }
    float _1989 = _1983;
    float _1991 = _1989;
    if (_1915)
    {
        float _1993 = _1969 + (-1.0);
        _1985 = _1993;
    }
    float _1995 = _1985;
    float _1997 = _1995;
    if (_1915)
    {
        float _1999 = _1937 * _1989;
        _1991 = _1999;
    }
    float _2001 = _1991;
    if (_1915)
    {
        float _2003 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1939 = _2003;
    }
    float _2005 = _1939;
    if (_1915)
    {
        float _2007 = _1903 * _2001;
        _1925 = _2007;
    }
    float _2009 = _1925;
    if (!_1915)
    {
        _1997 = _1907;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1915)
    {
        float _2015 = _1905 * _2001;
        _1927 = _2015;
    }
    float _2017 = _1927;
    if (_1915)
    {
        float _2019 = fma(_1975, _1969, _2005);
        _1977 = _2019;
    }
    float _2021 = _1977;
    if (_1915)
    {
        float _2023 = _2009 * _2009;
        _2013 = _2023;
    }
    float _2025 = _2013;
    if (_1915)
    {
        float _2027 = _2017 * _2017;
        _1929 = _2027;
    }
    float _2029 = _1929;
    float _2031 = fma(_2021, _2021, _2025);
    float _2033 = _2031 + _2029;
    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2037 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2035);
    float _2039 = precise::clamp(_2037, 0.0, 1.0);
    float _2041 = rsqrt(_2033);
    float _2043 = -_2039;
    float _2045 = _2043 + 1.0;
    float _2047 = abs(_2045);
    float _2049 = log2(_2047);
    float _2051 = _2041 * _2009;
    float _2053 = _2041 * _2021;
    float _2055 = _2041 * _2017;
    float _2057 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2059 = -_2057;
    float _2061 = fma(_2053, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2059);
    float _2063 = -_2055;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2061);
    float _2067 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2069 = fma(_2065, -0.5, 0.5);
    float _2071 = fma(_2065, 0.5, 0.5);
    float _2073 = exp2(_2067);
    float _2075 = fma(_2071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2077 = fma(_2071, _2075, -0.212114393711090087890625);
    float _2079 = _2053 + 1.0;
    float _2081 = sqrt(_2069);
    float _2083 = fma(_2071, _2077, 1.570728778839111328125);
    float _2085 = -_2053;
    float _2087 = fma(_2073, _2079, _2085);
    float _2089 = float(uint(_1587));
    float _2091 = fma(_2087, 0.5, 0.5);
    float _2093 = _2081 * 0.636619746685028076171875;
    float _2095 = -_2083;
    float _2097 = fma(_2093, _2095, 1.0);
    bool _2099 = !_1527;
    int _2101 = _2099 ? _1681 : (-1);
    float2 _6340 = float2(_2097, _2091);
    float3 _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6340, float2(0.0), isnan(_6340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6340, float2(0.0), isnan(_6340)), level(0.0)).xyz;
    float _2107 = _2105.x;
    float _2109 = _2105.y;
    float _2111 = _2105.z;
    float _2113 = as_type<float>(_1437) * _2089;
    int _2115 = _2101 >> 31;
    float _2117 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2119 = _2101 & 3;
    bool _2121 = _2119 != 0;
    float _2123 = -_603;
    float _2125 = _2123 + 1.0;
    int _2127 = _2115 & 3;
    float _2129 = trunc(_2113);
    float _2131 = precise::max(_2129, 0.0);
    uint _2133 = uint(_2131);
    int _2135 = _2121 ? 0 : 1;
    int _2137 = _2101 + _2127;
    int _2139 = ~_1421;
    int _2141 = _2139 + 1;
    int _2143 = _2137 >> 2;
    float _2145 = exp2(_2117);
    int _2147 = ~_2135;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    int _2153 = _2143 << 4;
    int _2155 = _2153 + 368;
    int _2157 = ~_1421;
    int _2159 = _2157 + 1;
    uint _2161 = uint(int(uint(_2155) >> uint(2)));
    uint _2163 = uint(int(uint(int(_2161)) >> uint(2)));
    int _2165 = int(_2161) & 3;
    float _2167 = (*spvDescriptorSet0.vp_c9)._m0[int(_2163)][_2165];
    int _2169 = int(_2161) + 1;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    int _2173 = _2169 & 3;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[int(_2171)][_2173];
    int _2177 = _2141 * int(_2133);
    int _2179 = _2177 + _1587;
    float _2181 = float(uint(_2179));
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2187 = as_type<float>(_1437) * _2181;
    int _2189 = _2101 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = 1.0 / _2185;
    int _2195 = _2155 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    uint _2199 = uint(int(uint(int(_2197)) >> uint(2)));
    int _2201 = int(_2197) & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    int _2205 = int(_2197) + 1;
    uint _2207 = uint(int(uint(_2205) >> uint(2)));
    int _2209 = _2205 & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    bool _2213 = uint(_2189) > 1u;
    bool _2215 = _2189 != 3;
    bool _2217 = _2189 != 3;
    float _2219 = trunc(_2187);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    bool _2225 = !_2217;
    int _2227 = _2225 ? 0 : (-1);
    int _2229 = abs(_2227);
    int _2231 = _2151;
    if (!_2213)
    {
        int _2233 = ~_2135;
        int _2235 = _2233 + 1;
        _2231 = _2235;
    }
    int _2237 = _2231;
    bool _2239 = uint(_2189) >= 2u;
    int _2241 = abs(_2237);
    float _2243 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2245 = int(_2243);
    int _2247 = _2239 ? 0 : 1;
    int _2249 = int(_2133) + int(_2223);
    int _2251 = ~_2247;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    bool _2257 = !_2191;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = _2159 * _2249;
    int _2263 = _2261 + _1587;
    int _2265 = _2255;
    if (_2215)
    {
        int _2267 = ~_2247;
        int _2269 = _2267 + 1;
        _2265 = _2269;
    }
    int _2271 = _2265;
    int _2273 = ~_2241;
    int _2275 = _2273 + 1;
    int _2277 = _2275 + 1;
    int _2279 = abs(_2259);
    int _2281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2283 = _2281 != 0;
    int _2285 = _2277 * as_type<int>(_2175);
    int _2287 = abs(_2271);
    bool _2289 = uint(_2263) >= uint(_1421);
    bool _2291 = !_2283;
    int _2293 = _2291 ? 0 : 1;
    int _2295 = ~_2279;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2293);
    int _2303 = _2299 * as_type<int>(_2167);
    int _2305 = _2303 + _2285;
    bool _2307 = !_2289;
    int _2309 = _2307 ? 0 : (-1);
    int _2311 = ~_2287;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = float(uint(_2245));
    int _2319 = ~_2249;
    int _2321 = _2319 + _2309;
    int _2323 = _2321 + 1;
    int _2325 = _2315 * as_type<int>(_2203);
    int _2327 = _2325 + _2305;
    int _2329 = ~_2229;
    int _2331 = _2329 + 1;
    int _2333 = _2331 + 1;
    float _2335 = 1.0 / _2317;
    int _2337 = abs(_2245);
    int _2339 = _2333 * as_type<int>(_2211);
    int _2341 = _2339 + _2327;
    int _2343 = ~_2301;
    int _2345 = _2343 + 1;
    int _2347 = _2345 + 1;
    int _2349 = _1421 * _2323;
    int _2351 = _2349 + _1587;
    float _2353 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2355 = _2341 * _2347;
    float _2357 = float(uint(_2337));
    float _2359 = in.m_63.y;
    bool _2361 = !_1527;
    int _2363 = _2361 ? _2351 : (-1);
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2367 = 1.0 / _2357;
    int _2369 = _2363 * _2301;
    int _2371 = _2369 + _2355;
    float _2373 = -_2365;
    float _2375 = fma(_2353, 2.0, _2373);
    int _2377 = as_type<int>(_2335) + (-2);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2381 = _2379 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2385 = _2383 != 0;
    float _2387 = -_145;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2375);
    float _2391 = float(uint(_2371));
    float _2393 = 1.0 / _2381;
    int _2395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2397 = _2395 != 0;
    int _2399 = abs(_2371);
    float _2401 = as_type<float>(_2377) * _2391;
    int _2403 = as_type<int>(_2367) + (-2);
    float _2405 = float(uint(_2399));
    float _2407 = trunc(_2401);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2415 = as_type<float>(_2403) * _2405;
    bool _2417 = _165 > 0.5;
    float _2419 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2419;
    float _2423 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2413);
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2427 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2429 = trunc(_2415);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    float _2435 = _2421 * _2393;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2439 = _547 + _2437;
    bool _2441 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2443 = isnan(_547);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = fma(_2427, -2.0, _2425);
    int _2455 = ~_2245;
    int _2457 = _2455 + 1;
    float _2459 = fma(_2435, _2439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2461 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2463 = isnan(_547);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = -_2451;
    float _2475 = _2473 + 1.0;
    float _2477 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _2481 = _2457 * int(_2411);
    int _2483 = _2481 + _2371;
    bool _2485 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2487 = isnan(_547);
    bool _2489 = _2485 || _2487;
    bool _2491 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2493 = _2489 || _2491;
    float _2495 = float(_2493);
    float _2497 = _2471 * _2475;
    int _2499 = ~_2337;
    int _2501 = _2499 + 1;
    float _2503 = -_2471;
    float _2505 = _2503 + 1.0;
    float _2507 = float(uint(_2483));
    float _2509 = _2479 * _2193;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2513 = _2501 * int(_2433);
    int _2515 = _2513 + _2399;
    float _2517 = _2495 * _2505;
    float _2519 = as_type<float>(_2377) * _2507;
    bool _2521 = _2359 > 0.5;
    float _2523 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2511);
    float _2525 = _2459 * _2517;
    float _2527 = float(uint(_2515));
    float _2529 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2531 = -_213;
    int _2533 = _2417 ? as_type<int>(_2531) : as_type<int>(_213);
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2537 = _547 + _2535;
    float _2539 = trunc(_2519);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    float _2545 = as_type<float>(_2403) * _2527;
    bool _2547 = !_2385;
    float _2549 = _2547 ? _213 : as_type<float>(_2533);
    float _2551 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2553 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2555 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2557 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2559 = -_2495;
    float _2561 = _2559 + 1.0;
    float _2563 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2553);
    float _2565 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2555);
    float _2567 = fma(_2509, _2537, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2569 = trunc(_2545);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    float _2575 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2557);
    float _2577 = fma(_2561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2525);
    float _2579 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2423);
    int _2581 = ~_2245;
    int _2583 = _2581 + 1;
    float _2585 = fma(_2567, _2497, _2577);
    int _2587 = int(_2411) + int(_2543);
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2595 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2453);
    int _2597 = ~_2337;
    int _2599 = _2597 + 1;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2603 = int(_2433) + int(_2573);
    int _2605 = _2583 * _2587;
    int _2607 = _2605 + _2371;
    float _2609 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2523);
    float _2611 = _2589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2613 = _2591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2615 = uint(_2607) >= uint(_2245);
    int _2617 = _2599 * _2603;
    int _2619 = _2617 + _2399;
    float _2621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2623 = -_201;
    int _2625 = _2521 ? as_type<int>(_2623) : as_type<int>(_201);
    out.m_76.x = _2611;
    out.m_76.y = _2613;
    out.m_76.z = _2601;
    bool _2627 = !_2615;
    int _2629 = _2627 ? 0 : (-1);
    float _2631 = fma(_2451, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2585);
    bool _2633 = uint(_2619) >= uint(_2337);
    float _2635 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2637 = ~_2587;
    int _2639 = _2637 + _2629;
    int _2641 = _2639 + 1;
    float _2643 = -_2579;
    float _2645 = _2643 + 1.0;
    bool _2647 = _2245 == 0;
    float _2649 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    bool _2651 = _2245 == 0;
    float _2653 = abs(_681);
    float _2655 = log2(_2653);
    bool _2657 = !_2397;
    float _2659 = _2657 ? _201 : as_type<float>(_2625);
    int _2661 = _2245 * _2641;
    int _2663 = _2661 + _2371;
    int _2665 = _2371 ^ _2245;
    bool _2667 = !_2633;
    int _2669 = _2667 ? 0 : (-1);
    uint _2671 = uint(int(uint(_2665) >> uint(31)));
    float _2673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2675 = !_2647;
    int _2677 = _2675 ? _2663 : (-1);
    int _2679 = ~int(_2671);
    int _2681 = _2679 + 1;
    int _2683 = ~_2669;
    int _2685 = _2603 + _2683;
    int _2687 = _2685 + 1;
    float _2689 = float(_2677);
    float _2691 = _2621 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2693 = _2687 ^ _2681;
    float _2695 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2649);
    float _2697 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2699 = fma(_2691, _2689, _2389);
    float _2701 = _2549 + 0.5;
    int _2703 = ~_2681;
    int _2705 = _2703 + _2693;
    int _2707 = _2705 + 1;
    float _2709 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2711 = fma(_2691, _2701, _2699);
    float _2713 = exp2(_2697);
    float _2715 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2717 = !_2651;
    int _2719 = _2717 ? _2707 : (-1);
    float _2721 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2727 = float(_2719);
    float _2729 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2731 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2733 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2735 = _2631 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2737 = -_2595;
    float _2739 = fma(_2715, _2727, _2737);
    bool _2741 = _681 <= 8000.0;
    bool _2743 = isnan(_681);
    bool _2745 = _2741 || _2743;
    bool _2747 = isnan(8000.0);
    bool _2749 = _2745 || _2747;
    float _2751 = float(_2749);
    float _2753 = _2659 + (-0.5);
    out.m_78.x = _2729;
    out.m_78.y = _2731;
    out.m_78.z = _2733;
    out.m_78.w = _2735;
    float _2755 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2757 = precise::clamp(_2755, 0.0, 1.0);
    float _2759 = _2709 + _1314;
    float _2761 = -_2715;
    float _2763 = fma(_2761, _2753, _2739);
    out.gl_Position.x = _1354;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _2709;
    out.gl_Position.w = _1314;
    float _2765 = -_2645;
    float _2767 = fma(_2549, _2765, _2711);
    float _2769 = -_2609;
    float _2771 = _2769 + 1.0;
    float _2773 = _2759 * 0.5;
    bool _2775 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2777 = isnan(_1899);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2659, _2771, _2763);
    out.m_80.z = _2773;
    out.m_80.w = _1314;
    out.m_82.x = _2767;
    out.m_82.y = _2785;
    float _2787 = -_2145;
    float _2789 = _2787 + 1.0;
    float _2791 = fma(_2757, -2.0, 3.0);
    float _2793 = _2757 * _2757;
    float _2795 = _2735;
    float _2797 = _2733;
    if (!_1286)
    {
        _1362 = 1.0;
    }
    float _2799 = _1362;
    float _2801 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2803 = _2799;
    if (_1286)
    {
        bool _2805 = _1396 >= _1358;
        bool _2807 = isnan(_1396);
        bool _2809 = _2805 || _2807;
        bool _2811 = isnan(_1358);
        bool _2813 = _2809 || _2811;
        float _2815 = float(_2813);
        _2803 = _2815;
    }
    float _2817 = _2803;
    float _2819 = _2793 * _2791;
    float _2821 = _2819;
    if (!_2783)
    {
        _2795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2823 = _2795;
    float _2825 = _2801 * _1398;
    float _2827 = -_2801;
    float _2829 = _2827 + 1.0;
    float _2831 = -_2819;
    float _2833 = _2831 + 1.0;
    float _2835 = _2817 * _1877;
    float _2837 = _1409 * _2825;
    float _2839 = _1409 * _2829;
    float _2841 = fma(_2833, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2819);
    float _2843 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2783)
    {
        _2797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2849 = _2797;
    float _2851 = _2751 * _2841;
    float _2853 = _2851;
    float _2855 = _2849;
    float _2857 = _2849;
    if (!_2783)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2859 = _2821;
    float _2861 = _2111 * _2825;
    float _2863 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2865 = fma(_2107, _2837, _1403);
    float _2867 = fma(_2109, _2837, _1405);
    float _2869 = fma(_1409, _2861, _1407);
    float _2871 = _2125 * _2863;
    float _2873 = precise::clamp(_2871, 0.0, 1.0);
    float _2875 = _2575 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2877 = _1749 * _1813;
    float _2879 = _2873;
    float _2881 = _2859;
    float _2883 = _2859;
    if (!_2783)
    {
        _1693 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2885 = _1693;
    float _2887 = -_2873;
    float _2889 = fma(_2887, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_84.x = _2865;
    out.m_84.y = _2867;
    out.m_84.z = _2869;
    out.m_84.w = _2839;
    float _2891 = _2885;
    float _2893 = _2885;
    if (!_2783)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2895 = _2853;
    float _2897 = -_2835;
    float _2899 = fma(_2897, _2889, 1.0);
    float _2901 = precise::clamp(_2899, 0.0, 1.0);
    float _2903 = _2895;
    float _2905 = _2895;
    if (!_2783)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2907 = _2879;
    float _2909 = _2901 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2911 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_86.x = _2909;
    out.m_88.x = _2843;
    out.m_88.y = _2911;
    out.m_88.z = _2875;
    bool _2913 = !_2783;
    float _2915 = _2907;
    float _2917 = _2907;
    if (!_2913)
    {
        bool _2919 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2921 = isnan(_1899);
        bool _2923 = _2919 || _2921;
        bool _2925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2927 = _2923 || _2925;
        if (!_2927)
        {
            float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2931 = _1899 + _2929;
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2935 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2933;
            float _2937 = 1.0 / _2935;
            float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2959 = _2931 * _2937;
            float _2961 = precise::clamp(_2959, 0.0, 1.0);
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = fma(_2961, _2941, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2969 = fma(_2961, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2971 = fma(_2961, _2945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2973 = fma(_2961, _2949, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2975 = fma(_2961, _2953, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2977 = fma(_2961, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2847 = _2969;
            _2905 = _2975;
            _2893 = _2967;
            _2883 = _2973;
            _2857 = _2971;
            _2917 = _2977;
            _2979 = true;
        }
        else
        {
            bool _2981 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2983 = isnan(_1899);
            bool _2985 = _2981 || _2983;
            bool _2987 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2989 = _2985 || _2987;
            if (!_2989)
            {
                _2891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2991 = _2891;
            _2893 = _2991;
            if (!_2989)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2993 = _2845;
            _2847 = _2993;
            if (!_2989)
            {
                _2855 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2995 = _2855;
            _2857 = _2995;
            if (!_2989)
            {
                _2881 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2997 = _2881;
            _2883 = _2997;
            if (!_2989)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2999 = _2903;
            _2905 = _2999;
            if (!_2989)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3001 = _2915;
            bool _3003 = !_2989;
            _2917 = _3001;
            if (!_3003)
            {
                bool _3005 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3007 = isnan(_1899);
                bool _3009 = _3005 || _3007;
                bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3013 = _3009 || _3011;
                if (!_3013)
                {
                    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3017 = _1899 + _3015;
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3021 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3019;
                    float _3023 = 1.0 / _3021;
                    float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3045 = _3017 * _3023;
                    float _3047 = precise::clamp(_3045, 0.0, 1.0);
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = fma(_3047, _3027, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3055 = fma(_3047, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3057 = fma(_3047, _3031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3059 = fma(_3047, _3035, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3061 = fma(_3047, _3039, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3063 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2847 = _3055;
                    _2905 = _3061;
                    _2893 = _3053;
                    _2883 = _3059;
                    _2857 = _3057;
                    _2917 = _3063;
                    _2979 = true;
                }
                else
                {
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2883 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2857 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2979 = false;
    float _3065 = _2847;
    float _3067 = _2905;
    float _3069 = _2893;
    float _3071 = _2883;
    float _3073 = _2857;
    float _3075 = _2917;
    float _3077 = _2877 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3079 = fma(_2911, -0.5, 0.5);
    float _3081 = precise::clamp(_3079, 0.0, 1.0);
    float _3083 = -_3065;
    float _3085 = _3083 + _3067;
    float _3087 = -_3069;
    float _3089 = _3087 + _3071;
    out.m_59.x = _3077;
    float _3091 = fma(_3081, _3085, _3065);
    float _3093 = -_3073;
    float _3095 = _3093 + _3075;
    float _3097 = fma(_3081, _3089, _3069);
    float _3099 = _3091 * 0.586610972881317138671875;
    bool _3101 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = fma(_3081, _3095, _3073);
    out.m_90.x = 0.0;
    float _3105 = fma(_3097, 0.298911988735198974609375, _3099);
    bool _3107 = _1749 > 0.0;
    bool _3109 = isnan(_1749);
    bool _3111 = _3107 || _3109;
    bool _3113 = isnan(0.0);
    bool _3115 = _3111 || _3113;
    float _3117 = fma(_3103, 0.114477999508380889892578125, _3105);
    bool _3119 = _1813 <= 0.0;
    bool _3121 = !_3115;
    bool _3123 = _3119 || _3121;
    float _3125 = -_3117;
    float _3127 = _3097 + _3125;
    float _3129 = -_3117;
    float _3131 = _3091 + _3129;
    float _3133 = -_3117;
    float _3135 = _3103 + _3133;
    float _3137 = fma(_3127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    float _3139 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    float _3141 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3117);
    bool _3143 = !_3101;
    if (!_3143)
    {
        float _3145 = -_1230;
        float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3149 = -_1232;
        float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3153 = -_1234;
        float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3157 = _3147 * _3147;
        float _3159 = fma(_3151, _3151, _3157);
        float _3161 = fma(_3155, _3155, _3159);
        float _3163 = sqrt(_3161);
        float _3165 = rsqrt(_3161);
        float _3167 = -_3163;
        float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3171 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3173 = precise::clamp(_3171, 0.0, 1.0);
        float _3175 = _3151 * _3165;
        float _3177 = _3147 * _3165;
        float _3179 = abs(_3173);
        float _3181 = log2(_3179);
        float _3183 = _3155 * _3165;
        float _3185 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3187 = _2911 * _3177;
        float _3189 = -_3177;
        float _3191 = -_3185;
        float _3193 = fma(_3189, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3191);
        float _3195 = fma(_2843, _3175, _3187);
        float _3197 = -_3183;
        float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3193);
        float _3201 = fma(_2875, _3183, _3195);
        float _3203 = precise::clamp(_3201, 0.0, 1.0);
        float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3207 = _3199 + _3205;
        float _3209 = _3181 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3211 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3213 = precise::clamp(_3211, 0.0, 1.0);
        float _3215 = exp2(_3209);
        float _3217 = _3215 * _3213;
        float _3219 = _3203 * _3217;
        float _3221 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3223 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3225 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3221;
        out.m_90.y = _3223;
        out.m_90.z = _3225;
    }
    out.m_92.x = _3137;
    out.m_92.y = _3139;
    out.m_92.z = _3141;
    if (!_3123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3227 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3227;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

