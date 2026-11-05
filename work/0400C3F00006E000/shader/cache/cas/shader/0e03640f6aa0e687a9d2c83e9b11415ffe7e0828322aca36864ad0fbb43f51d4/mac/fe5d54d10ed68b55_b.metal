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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1566 = false;
    bool _825 = false;
    bool _353 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_48.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_51.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1851 = as_type<float>(_117);
        out.gl_Position.z = _1851;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_53.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    if (_131)
    {
        float _139 = float(_101);
        _137 = _139;
    }
    float _141 = _137;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    if (_147)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _111;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1919 = as_type<float>(_153);
        out.gl_Position.z = _1919;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_55.x;
    float _157 = in.m_55.y;
    float _159 = in.m_55.z;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    float _175 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _173);
    bool _181 = !_161;
    float _183 = _177;
    float _185 = _179;
    float _203;
    if (!_181)
    {
        float _187 = in.m_57.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_101);
        float _209 = 1.0 / _207;
        float _211 = _135 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    bool _231 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _233 = isnan(_213);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -_229;
    float _253 = _251 + 1.0;
    float _255 = 1.0 / _245;
    bool _257 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_213);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _241 * _253;
    float _271 = -_241;
    float _273 = _271 + 1.0;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = _267 * _273;
    float _279 = 1.0 / _249;
    float _281 = -_267;
    float _283 = _281 + 1.0;
    float _285 = _217 * _255;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _213 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = fma(_293, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _301 = fma(_297, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _303 = _289 * _279;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = _299 * _277;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _315 = _301 * _277;
    float _317 = fma(_307, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _319 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _321 = fma(_313, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].y, _315);
    float _325 = fma(_317, _269, _319);
    float _327 = fma(_321, _269, _323);
    float _329 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[145].x, _325);
    float _331 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[145].y, _327);
    bool _333 = !_275;
    float _351;
    if (!_333)
    {
        float _335 = in.m_57.x;
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _339 = _335 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        float _355 = float(_101);
        float _357 = 1.0 / _355;
        float _359 = _135 * _357;
        _351 = _359;
    }
    _353 = false;
    float _361 = _351;
    float _363 = in.m_57.x;
    float _365 = in.m_57.y;
    float _367 = as_type<float>(int(gl_VertexIndex));
    float _369 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _371 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = isnan(_361);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = in.m_62.x;
    float _385 = in.m_62.y;
    bool _387 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _389 = isnan(_361);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = in.m_48.x;
    float _401 = in.m_48.y;
    float _403 = in.m_48.z;
    bool _405 = _363 > 0.5;
    bool _407 = _365 > 0.5;
    int _409 = as_type<int>(_367) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_367) & 2;
    bool _415 = _413 != 0;
    float _417 = _329 * _383;
    float _419 = _331 * _385;
    bool _421 = !_415;
    float _423 = _421 ? (-0.5) : 0.5;
    float _425 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _427 = !_411;
    float _429 = _427 ? (-0.5) : 0.5;
    float _431 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _433 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _439 = _437 != 0;
    float _441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _429);
    float _443 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    float _445 = _431 * _435;
    float _447 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = _425 * _441;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _445 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _461 = 1.0 / _453;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[24].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _469 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _471 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _479 = _477 != 0;
    float _481 = _469 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _483 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _485 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _487 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = _475 + _483;
    float _491 = _481 + _485;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _501 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _503 = _489 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _507 = _491 + _505;
    float _509 = _495 * _461;
    float _511 = 1.0 / _499;
    float _513 = _503 * _503;
    float _515 = _507 * _507;
    float _517 = _445 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _519 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    bool _521 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _523 = isnan(_361);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _513 + _515;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[25].x, _517);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _361 + _541;
    float _545 = sqrt(_533);
    float _547 = -_531;
    float _549 = _547 + 1.0;
    float _551 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _553 = -_423;
    int _555 = _407 ? as_type<int>(_553) : as_type<int>(_423);
    float _557 = fma(_509, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _559 = _381 * _549;
    float _561 = _537 * _511;
    float _563 = -_381;
    float _565 = _563 + 1.0;
    float _567 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
    bool _569 = !_479;
    float _571 = _569 ? _423 : as_type<float>(_555);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _361 + _573;
    float _577 = _397 * _565;
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _581 = -_429;
    int _583 = _405 ? as_type<int>(_581) : as_type<int>(_429);
    float _585 = _423 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _587 = _557 * _577;
    bool _589 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _591 = _567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _593 = _551 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _595 = fma(_561, _575, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _599 = !_439;
    float _601 = _599 ? _429 : as_type<float>(_583);
    float _603 = _429 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = _585 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = _585 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _609 = _585 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _611 = -_397;
    float _613 = _611 + 1.0;
    float _615 = _591 + _593;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _607);
    float _621 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _609);
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _625 = _585;
    float _627 = _603;
    float _629 = _513;
    float _631 = _515;
    float _633 = _613;
    if (!_589)
    {
        _625 = _515;
    }
    float _635 = _625;
    float _637 = _635;
    if (!_589)
    {
        _627 = _513;
    }
    float _639 = _627;
    float _641 = _639;
    if (!_589)
    {
        _629 = _489;
    }
    float _643 = _629;
    float _645 = _643;
    if (!_589)
    {
        _631 = _491;
    }
    float _647 = _631;
    float _649 = _647;
    if (!_589)
    {
        _633 = _615;
    }
    float _651 = _633;
    bool _653 = !_589;
    float _655 = _651;
    if (!_653)
    {
        float _657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _659 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _661 = _545 + _659;
        float _663 = _615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = rsqrt(_533);
        float _667 = _661 * _657;
        float _669 = _667 * 0.15915493667125701904296875;
        float _671 = _669 * 6.283185482025146484375;
        float _673 = sin(_671);
        float _675 = _669 * 6.283185482025146484375;
        float _677 = cos(_675);
        float _679 = fma(_673, _663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _681 = _665 * _679;
        float _683 = _677 + (-1.0);
        float _685 = fma(_503, _681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _687 = fma(_507, _681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _689 = _683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _693 = _685 + _691;
        float _695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _697 = _687 + _695;
        float _699 = fma(_615, _677, _689);
        float _701 = _693 * _693;
        float _703 = _697 * _697;
        _655 = _699;
        _641 = _701;
        _637 = _703;
        _645 = _685;
        _649 = _687;
    }
    float _705 = _655;
    float _707 = _641;
    float _709 = _637;
    float _711 = _645;
    float _713 = _649;
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _717 = _705 + _715;
    float _719 = -_571;
    float _721 = _719 + 0.5;
    float _723 = fma(_595, _559, _623);
    float _725 = _601 + 0.5;
    float _727 = fma(_717, _717, _707);
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _731 = _725 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _733 = _727 + _709;
    float _735 = _729 * _597;
    float _737 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _739 = sqrt(_733);
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _753 = _731 * _579;
    float _755 = _619 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _759 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _773 = _737 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _621 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_64.x = _753;
    out.m_64.y = _735;
    bool _777 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _779 = isnan(_739);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _785 = _781 || _783;
    out.m_66.x = _765;
    out.m_66.y = _767;
    out.m_66.z = _769;
    out.m_66.w = _757;
    out.m_68.x = _759;
    out.m_68.y = _761;
    out.m_68.z = _763;
    out.m_68.w = _773;
    out.m_70.x = _755;
    out.m_70.y = _771;
    out.m_70.z = _775;
    float _787 = _733;
    float _789 = _759;
    if (!_785)
    {
        _787 = 1.0;
    }
    float _791 = _787;
    bool _793 = !_785;
    float _795 = _791;
    if (!_793)
    {
        bool _797 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _799 = isnan(_739);
        bool _801 = _797 || _799;
        bool _803 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _805 = _801 || _803;
        if (!_805)
        {
            float _807 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _809 = _739 + _807;
            float _811 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _813 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _811;
            float _815 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _817 = _815 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _819 = 1.0 / _813;
            float _821 = _809 * _819;
            float _823 = fma(_821, _817, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _795 = _823;
            _825 = true;
        }
        else
        {
            bool _827 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _829 = isnan(_739);
            bool _831 = _827 || _829;
            bool _833 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _835 = _831 || _833;
            if (!_835)
            {
                float _837 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _839 = _739 + _837;
                float _841 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _843 = _841 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _845 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _847 = _845 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _849 = 1.0 / _843;
                float _851 = _839 * _849;
                float _853 = fma(_851, _847, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _795 = _853;
                _825 = true;
            }
            else
            {
                _795 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _825 = false;
    float _855 = _795;
    float _857 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _859 = _705 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _863 = _711 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _867 = _713 + _865;
    float _869 = fma(_859, _855, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _871 = fma(_863, _855, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _873 = fma(_867, _855, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _875 = -_591;
    float _877 = _875 + _869;
    float _879 = -_475;
    float _881 = _879 + _871;
    float _883 = -_481;
    float _885 = _883 + _873;
    float _887 = _877 * _877;
    float _889 = fma(_881, _881, _887);
    float _891 = fma(_885, _885, _889);
    float _893 = sqrt(_891);
    bool _895 = _893 > 0.0;
    float _897 = _869;
    float _899 = _873;
    float _901 = _867;
    if (!_895)
    {
        _789 = _871;
    }
    float _903 = _789;
    bool _905 = !_895;
    float _907 = _903;
    if (!_905)
    {
        float _909 = _177 * _177;
        float _911 = fma(_175, _175, _909);
        float _913 = fma(_179, _179, _911);
        float _915 = rsqrt(_891);
        float _917 = sqrt(_913);
        float _919 = _881 * _915;
        float _921 = _877 * _915;
        float _923 = _885 * _915;
        bool _925 = _917 > 0.0;
        float _927 = _917;
        if (!_925)
        {
            _927 = _871;
        }
        float _929 = _927;
        bool _931 = !_925;
        _907 = _929;
        if (!_931)
        {
            float _933 = rsqrt(_913);
            float _935 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _937 = _177 * _933;
            float _939 = _175 * _933;
            float _941 = _179 * _933;
            float _943 = _921 * _937;
            float _945 = fma(_919, _939, _943);
            float _947 = _935 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _949 = fma(_923, _941, _945);
            float _951 = _949 * _947;
            float _953 = fma(_175, _951, _871);
            float _955 = fma(_177, _951, _869);
            float _957 = fma(_179, _951, _873);
            _897 = _955;
            _907 = _953;
            _899 = _957;
        }
    }
    float _959 = _897;
    float _961 = _907;
    float _963 = _899;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _959 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _961 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_971, _971, _977);
    float _981 = fma(_975, _975, _979);
    float _983 = rsqrt(_981);
    float _985 = sqrt(_981);
    float _987 = _983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _989 = _971 * _987;
    float _991 = _975 * _987;
    float _993 = _989 * _989;
    float _995 = _991 * _991;
    float _997 = _993 + _995;
    float _999 = sqrt(_997);
    bool _1001 = _999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = _999 + _1003;
    float _1007 = _983;
    float _1009 = _1005;
    float _1011 = _967;
    if (_1001)
    {
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1013;
    }
    float _1015 = _1007;
    if (_1001)
    {
        float _1017 = rsqrt(_997);
        _183 = _1017;
    }
    float _1019 = _183;
    float _1021 = _1019;
    if (_1001)
    {
        float _1023 = _1005 * _1015;
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (_1001)
    {
        float _1027 = _1025 * 0.15915493667125701904296875;
        _185 = _1027;
    }
    float _1029 = _185;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = _975;
    if (_1001)
    {
        float _1035 = _1029 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1043 = precise::max(0.0, _1041);
    float _1045 = _1015;
    float _1047 = _1043;
    if (_1001)
    {
        float _1049 = _1029 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = -_987;
    float _1057 = -_1043;
    float _1059 = fma(_967, _1055, _1057);
    float _1061 = _1059;
    if (_1001)
    {
        float _1063 = _1059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1047 = _1063;
    }
    float _1065 = _1047;
    float _1067 = _1065;
    if (_1001)
    {
        float _1069 = _1039 + (-1.0);
        _1011 = _1069;
    }
    float _1071 = _1011;
    float _1073 = _959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1075 = _1071;
    if (_1001)
    {
        float _1077 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1075 = _1077;
    }
    float _1079 = _1075;
    float _1081 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1073);
    float _1083 = _1053;
    if (_1001)
    {
        float _1085 = fma(_1053, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _1087;
    if (_1001)
    {
        float _1091 = fma(_1059, _1039, _1079);
        _1061 = _1091;
    }
    float _1093 = _1061;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1001)
    {
        float _1097 = _1019 * _1087;
        _901 = _1097;
    }
    float _1099 = _901;
    if (!_1001)
    {
        _1021 = _989;
    }
    float _1101 = _1021;
    float _1103 = _1101;
    if (!_1001)
    {
        _1089 = _991;
    }
    float _1105 = _1089;
    float _1107 = _1105;
    if (_1001)
    {
        float _1109 = _989 * _1099;
        _1103 = _1109;
    }
    float _1111 = _1103;
    if (!_1001)
    {
        _1067 = _993;
    }
    float _1113 = _1067;
    float _1115 = _1113;
    if (_1001)
    {
        float _1117 = _991 * _1099;
        _1107 = _1117;
    }
    float _1119 = _1107;
    float _1121 = fma(_475, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1001)
    {
        float _1123 = _1111 * _1111;
        _1115 = _1123;
    }
    float _1125 = _1115;
    if (!_1001)
    {
        _1095 = _995;
    }
    float _1127 = _1095;
    float _1129 = _1127;
    if (_1001)
    {
        float _1131 = _1119 * _1119;
        _1129 = _1131;
    }
    float _1133 = _1129;
    float _1135 = _959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1137 = fma(_1093, _1093, _1125);
    float _1139 = floor(_1121);
    float _1141 = _1137 + _1133;
    float _1143 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1081);
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1147 = fma(_985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1145);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1135);
    float _1153 = fma(_481, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1155 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1157 = rsqrt(_1141);
    float _1159 = -_1149;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1151);
    float _1165 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1167 = -_1165;
    float _1169 = fma(_1167, _1031, 1.0);
    float _1171 = _959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1173 = _959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1175 = abs(_1161);
    float _1177 = log2(_1175);
    float _1179 = -_1139;
    float _1181 = _1121 + _1179;
    float _1183 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1171);
    float _1185 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1173);
    float _1187 = _1157 * _1111;
    float _1189 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1191 = _1157 * _1093;
    float _1193 = _1157 * _1119;
    float _1195 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1197 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1183);
    float _1199 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1201 = floor(_1153);
    float _1203 = -_1195;
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1203);
    float _1207 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1211 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1213 = -_1193;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1205);
    float _1217 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1209);
    float _1221 = log2(_1169);
    float _1223 = fma(_1215, -0.5, 0.5);
    float _1225 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1227 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1219);
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1225);
    float _1231 = _1191 + 1.0;
    float _1233 = exp2(_1211);
    float _1235 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1237 = -_1201;
    float _1239 = _1153 + _1237;
    float _1241 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1229);
    float _1243 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1227);
    float _1245 = sqrt(_1223);
    float _1247 = fma(_1215, 0.5, 0.5);
    float _1249 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1217);
    float _1251 = _1221 * 0.693147182464599609375;
    float _1253 = fma(_1247, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1255 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1249);
    float _1257 = -_1191;
    float _1259 = fma(_1233, _1231, _1257);
    float _1261 = 1.0 / _1243;
    float _1263 = fma(_1247, _1253, -0.212114393711090087890625);
    float _1265 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1241);
    float _1267 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1255);
    float2 _3808 = float2(_1181, _1239);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3808, float2(0.0), isnan(_3808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3808, float2(0.0), isnan(_3808)), level(0.0)).x;
    float _1271 = fma(_1247, _1263, 1.570728778839111328125);
    float _1273 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1275 = _1245 * 0.636619746685028076171875;
    float _1277 = fma(_1259, 0.5, 0.5);
    float _1279 = -_1271;
    float _1281 = fma(_1275, _1279, 1.0);
    float _1283 = _1265 * _1261;
    float _1285 = _1267 * _1261;
    float _1287 = fma(_1283, 0.5, 0.5);
    float _1289 = fma(_1285, -0.5, 0.5);
    float3 _3847 = float3(_1287, _1289, _1273);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3847, float3(0.0), isnan(_3847)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3847, float3(0.0), isnan(_3847)), level(0.0)).x;
    float3 _3858 = float3(_1287, _1289, _1273);
    float4 _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).xyzw;
    float _1296 = _1294.x;
    float _1298 = _1294.y;
    float _1300 = _1294.z;
    float _1302 = _1294.w;
    float2 _3874 = float2(_1281, _1277);
    float3 _1306 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3874, float2(0.0), isnan(_3874)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3874, float2(0.0), isnan(_3874)), level(0.0)).xyz;
    float _1308 = _1306.x;
    float _1310 = _1306.y;
    float _1312 = _1306.z;
    float _1314 = _591 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1316 = _591 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1318 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1320 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1322 = isnan(_985);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1328 = _1324 || _1326;
    float _1330 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1314);
    float _1332 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1316);
    float _1334 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1336 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1338 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1330);
    float _1340 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1332);
    float _1342 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1334);
    float _1344 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1348 = exp2(_1336);
    float _1350 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1342);
    float _1352 = _1346 + _1344;
    float _1354 = 1.0 / _1344;
    out.gl_Position.x = _1265;
    out.gl_Position.y = _1267;
    out.gl_Position.z = _1350;
    out.gl_Position.w = _1243;
    float _1356 = -_1348;
    float _1358 = _1356 + 1.0;
    float _1360 = _1267;
    float _1362 = _1243;
    float _1364 = _1350;
    if (!_1328)
    {
        _1360 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1366 = _1360;
    float _1368 = _1352 * _1354;
    float _1370 = _1368 * 0.5;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1374 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1372);
    float _1376 = 1.0 / _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1380 = _1376 * _1378;
    float _1382 = abs(_1380);
    float _1384 = log2(_1382);
    bool _1386 = _1380 <= 8000.0;
    bool _1388 = isnan(_1380);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan(8000.0);
    bool _1394 = _1390 || _1392;
    float _1396 = float(_1394);
    float _1398 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1400 = exp2(_1398);
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1404 = precise::clamp(_1402, 0.0, 1.0);
    float _1406 = fma(_1404, -2.0, 3.0);
    float _1408 = _1404 * _1404;
    float _1410 = _1408 * _1406;
    float _1412 = in.m_72.x;
    float _1414 = -_1410;
    float _1416 = _1414 + 1.0;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1410);
    float _1420 = _1350 + _1243;
    float _1422 = _1366;
    float _1424 = _1366;
    if (!_1328)
    {
        _1362 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1426 = _1362;
    float _1428 = _1396 * _1418;
    float _1430 = _1420 * 0.5;
    float _1432 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1434 = _1430;
    float _1436 = _1432;
    float _1438 = _1426;
    float _1440 = _1426;
    if (!_1328)
    {
        _1364 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1442 = _1364;
    float _1444 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1446 = -_1432;
    float _1448 = _1446 + 1.0;
    out.m_74.z = _1430;
    out.m_74.w = _1243;
    float _1450 = _1448;
    float _1452 = _1442;
    float _1454 = _1442;
    if (!_1328)
    {
        _1434 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1456 = _1434;
    float _1458 = -_1269;
    float _1460 = _1458 + 1.0;
    float _1462 = _1460 * _1444;
    float _1464 = precise::clamp(_1462, 0.0, 1.0);
    float _1466 = -_1464;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1470 = _1468 * _1412;
    float _1472 = _1470 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1474 = _1432 * _1291;
    float _1476 = _1302 * _1448;
    out.m_76.x = _1472;
    float _1478 = _1456;
    float _1480 = _1456;
    if (!_1328)
    {
        _1450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1482 = _1450;
    float _1484 = _1302 * _1474;
    float _1486 = _1312 * _1474;
    float _1488 = _1482;
    float _1490 = _1482;
    if (!_1328)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1492 = _1436;
    float _1494 = fma(_1308, _1484, _1296);
    float _1496 = fma(_1310, _1484, _1298);
    float _1498 = fma(_1302, _1486, _1300);
    out.m_78.x = _1494;
    out.m_78.y = _1496;
    out.m_78.z = _1498;
    out.m_78.w = _1476;
    bool _1500 = !_1328;
    float _1502 = _1492;
    float _1504 = _1492;
    if (!_1500)
    {
        bool _1506 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1508 = isnan(_985);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1518 = _985 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1520;
            float _1524 = 1.0 / _1522;
            float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1528 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1532 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1546 = _1518 * _1524;
            float _1548 = precise::clamp(_1546, 0.0, 1.0);
            float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1554 = fma(_1548, _1528, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1556 = fma(_1548, _1552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1558 = fma(_1548, _1532, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1560 = fma(_1548, _1536, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1562 = fma(_1548, _1540, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1564 = fma(_1548, _1544, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1440 = _1556;
            _1490 = _1562;
            _1480 = _1554;
            _1424 = _1560;
            _1454 = _1558;
            _1504 = _1564;
            _1566 = true;
        }
        else
        {
            bool _1568 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1570 = isnan(_985);
            bool _1572 = _1568 || _1570;
            bool _1574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1576 = _1572 || _1574;
            if (!_1576)
            {
                _1478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1578 = _1478;
            _1480 = _1578;
            if (!_1576)
            {
                _1438 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1580 = _1438;
            _1440 = _1580;
            if (!_1576)
            {
                _1452 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1582 = _1452;
            _1454 = _1582;
            if (!_1576)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1584 = _1422;
            _1424 = _1584;
            if (!_1576)
            {
                _1488 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1586 = _1488;
            _1490 = _1586;
            if (!_1576)
            {
                _1502 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1588 = _1502;
            bool _1590 = !_1576;
            _1504 = _1588;
            if (!_1590)
            {
                bool _1592 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1594 = isnan(_985);
                bool _1596 = _1592 || _1594;
                bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1600 = _1596 || _1598;
                if (!_1600)
                {
                    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1604 = _985 + _1602;
                    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1606;
                    float _1610 = 1.0 / _1608;
                    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1630 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1632 = _1604 * _1610;
                    float _1634 = precise::clamp(_1632, 0.0, 1.0);
                    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1640 = fma(_1634, _1614, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1642 = fma(_1634, _1638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1644 = fma(_1634, _1618, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1646 = fma(_1634, _1622, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1648 = fma(_1634, _1626, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1650 = fma(_1634, _1630, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1440 = _1642;
                    _1490 = _1648;
                    _1480 = _1640;
                    _1424 = _1646;
                    _1454 = _1644;
                    _1504 = _1650;
                    _1566 = true;
                }
                else
                {
                    _1440 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1490 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1454 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1504 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1566 = false;
    float _1652 = _1440;
    float _1654 = _1490;
    float _1656 = _1480;
    float _1658 = _1424;
    float _1660 = _1454;
    float _1662 = _1504;
    float _1664 = fma(_771, -0.5, 0.5);
    float _1666 = precise::clamp(_1664, 0.0, 1.0);
    float _1668 = -_1652;
    float _1670 = _1668 + _1654;
    float _1672 = -_1656;
    float _1674 = _1672 + _1658;
    float _1676 = -_1660;
    float _1678 = _1676 + _1662;
    bool _1680 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1682 = fma(_1666, _1670, _1652);
    float _1684 = fma(_1666, _1674, _1656);
    float _1686 = fma(_1666, _1678, _1660);
    float _1688 = _1682 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _1690 = fma(_1684, 0.298911988735198974609375, _1688);
    out.m_51.x = 1.0;
    float _1692 = fma(_1686, 0.114477999508380889892578125, _1690);
    float _1694 = -_1692;
    float _1696 = _1684 + _1694;
    float _1698 = -_1692;
    float _1700 = _1682 + _1698;
    float _1702 = -_1692;
    float _1704 = _1686 + _1702;
    float _1706 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    float _1710 = fma(_1700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    float _1712 = fma(_1704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    out.m_76.w = _1706;
    out.m_82.x = _1708;
    out.m_82.y = _1710;
    out.m_82.z = _1712;
    if (!_1680)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1714 = -_959;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1718 = -_961;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1722 = -_963;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1726 = _1716 * _1716;
    float _1728 = fma(_1720, _1720, _1726);
    float _1730 = fma(_1724, _1724, _1728);
    float _1732 = sqrt(_1730);
    float _1734 = rsqrt(_1730);
    float _1736 = -_1732;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1740 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1742 = precise::clamp(_1740, 0.0, 1.0);
    float _1744 = _1720 * _1734;
    float _1746 = _1716 * _1734;
    float _1748 = abs(_1742);
    float _1750 = log2(_1748);
    float _1752 = _1724 * _1734;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1756 = _771 * _1746;
    float _1758 = -_1746;
    float _1760 = -_1754;
    float _1762 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1760);
    float _1764 = fma(_755, _1744, _1756);
    float _1766 = -_1752;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1762);
    float _1770 = fma(_775, _1752, _1764);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1776 = _1768 + _1774;
    float _1778 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1780 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1782 = precise::clamp(_1780, 0.0, 1.0);
    float _1784 = exp2(_1778);
    float _1786 = _1784 * _1782;
    float _1788 = _1772 * _1786;
    float _1790 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1792 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1794 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _1790;
    out.m_80.y = _1792;
    out.m_80.z = _1794;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1566 = false;
    bool _825 = false;
    bool _353 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_48.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_51.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1851 = as_type<float>(_117);
        out.gl_Position.z = _1851;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_53.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    if (_131)
    {
        float _139 = float(_101);
        _137 = _139;
    }
    float _141 = _137;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    if (_147)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _111;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1919 = as_type<float>(_153);
        out.gl_Position.z = _1919;
    }
    if (_147)
    {
        return out;
    }
    float _155 = in.m_55.x;
    float _157 = in.m_55.y;
    float _159 = in.m_55.z;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    float _175 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _173);
    bool _181 = !_161;
    float _183 = _177;
    float _185 = _179;
    float _203;
    if (!_181)
    {
        float _187 = in.m_57.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_101);
        float _209 = 1.0 / _207;
        float _211 = _135 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    bool _231 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _233 = isnan(_213);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -_229;
    float _253 = _251 + 1.0;
    float _255 = 1.0 / _245;
    bool _257 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_213);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _241 * _253;
    float _271 = -_241;
    float _273 = _271 + 1.0;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = _267 * _273;
    float _279 = 1.0 / _249;
    float _281 = -_267;
    float _283 = _281 + 1.0;
    float _285 = _217 * _255;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _213 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = fma(_293, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _301 = fma(_297, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _303 = _289 * _279;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = _299 * _277;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _315 = _301 * _277;
    float _317 = fma(_307, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _319 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _321 = fma(_313, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].y, _315);
    float _325 = fma(_317, _269, _319);
    float _327 = fma(_321, _269, _323);
    float _329 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[145].x, _325);
    float _331 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[145].y, _327);
    bool _333 = !_275;
    float _351;
    if (!_333)
    {
        float _335 = in.m_57.x;
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _339 = _335 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        float _355 = float(_101);
        float _357 = 1.0 / _355;
        float _359 = _135 * _357;
        _351 = _359;
    }
    _353 = false;
    float _361 = _351;
    float _363 = in.m_57.x;
    float _365 = in.m_57.y;
    float _367 = as_type<float>(int(gl_VertexIndex));
    float _369 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _371 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = isnan(_361);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = in.m_62.x;
    float _385 = in.m_62.y;
    bool _387 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _389 = isnan(_361);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = in.m_48.x;
    float _401 = in.m_48.y;
    float _403 = in.m_48.z;
    bool _405 = _363 > 0.5;
    bool _407 = _365 > 0.5;
    int _409 = as_type<int>(_367) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_367) & 2;
    bool _415 = _413 != 0;
    float _417 = _329 * _383;
    float _419 = _331 * _385;
    bool _421 = !_415;
    float _423 = _421 ? (-0.5) : 0.5;
    float _425 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _427 = !_411;
    float _429 = _427 ? (-0.5) : 0.5;
    float _431 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _433 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _439 = _437 != 0;
    float _441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _429);
    float _443 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    float _445 = _431 * _435;
    float _447 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = _425 * _441;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _445 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _461 = 1.0 / _453;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[24].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _469 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _471 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _479 = _477 != 0;
    float _481 = _469 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _483 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _485 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _487 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = _475 + _483;
    float _491 = _481 + _485;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _501 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _503 = _489 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _507 = _491 + _505;
    float _509 = _495 * _461;
    float _511 = 1.0 / _499;
    float _513 = _503 * _503;
    float _515 = _507 * _507;
    float _517 = _445 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _519 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    bool _521 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _523 = isnan(_361);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _513 + _515;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[25].x, _517);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _361 + _541;
    float _545 = sqrt(_533);
    float _547 = -_531;
    float _549 = _547 + 1.0;
    float _551 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _553 = -_423;
    int _555 = _407 ? as_type<int>(_553) : as_type<int>(_423);
    float _557 = fma(_509, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _559 = _381 * _549;
    float _561 = _537 * _511;
    float _563 = -_381;
    float _565 = _563 + 1.0;
    float _567 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
    bool _569 = !_479;
    float _571 = _569 ? _423 : as_type<float>(_555);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _361 + _573;
    float _577 = _397 * _565;
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _581 = -_429;
    int _583 = _405 ? as_type<int>(_581) : as_type<int>(_429);
    float _585 = _423 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _587 = _557 * _577;
    bool _589 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _591 = _567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _593 = _551 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _595 = fma(_561, _575, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _599 = !_439;
    float _601 = _599 ? _429 : as_type<float>(_583);
    float _603 = _429 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = _585 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = _585 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _609 = _585 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _611 = -_397;
    float _613 = _611 + 1.0;
    float _615 = _591 + _593;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _607);
    float _621 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _609);
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _625 = _585;
    float _627 = _603;
    float _629 = _513;
    float _631 = _515;
    float _633 = _613;
    if (!_589)
    {
        _625 = _515;
    }
    float _635 = _625;
    float _637 = _635;
    if (!_589)
    {
        _627 = _513;
    }
    float _639 = _627;
    float _641 = _639;
    if (!_589)
    {
        _629 = _489;
    }
    float _643 = _629;
    float _645 = _643;
    if (!_589)
    {
        _631 = _491;
    }
    float _647 = _631;
    float _649 = _647;
    if (!_589)
    {
        _633 = _615;
    }
    float _651 = _633;
    bool _653 = !_589;
    float _655 = _651;
    if (!_653)
    {
        float _657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _659 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _661 = _545 + _659;
        float _663 = _615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = rsqrt(_533);
        float _667 = _661 * _657;
        float _669 = _667 * 0.15915493667125701904296875;
        float _671 = _669 * 6.283185482025146484375;
        float _673 = sin(_671);
        float _675 = _669 * 6.283185482025146484375;
        float _677 = cos(_675);
        float _679 = fma(_673, _663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _681 = _665 * _679;
        float _683 = _677 + (-1.0);
        float _685 = fma(_503, _681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _687 = fma(_507, _681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _689 = _683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _693 = _685 + _691;
        float _695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _697 = _687 + _695;
        float _699 = fma(_615, _677, _689);
        float _701 = _693 * _693;
        float _703 = _697 * _697;
        _655 = _699;
        _641 = _701;
        _637 = _703;
        _645 = _685;
        _649 = _687;
    }
    float _705 = _655;
    float _707 = _641;
    float _709 = _637;
    float _711 = _645;
    float _713 = _649;
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _717 = _705 + _715;
    float _719 = -_571;
    float _721 = _719 + 0.5;
    float _723 = fma(_595, _559, _623);
    float _725 = _601 + 0.5;
    float _727 = fma(_717, _717, _707);
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _731 = _725 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _733 = _727 + _709;
    float _735 = _729 * _597;
    float _737 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _739 = sqrt(_733);
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _753 = _731 * _579;
    float _755 = _619 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _759 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _773 = _737 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _621 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_64.x = _753;
    out.m_64.y = _735;
    bool _777 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _779 = isnan(_739);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _785 = _781 || _783;
    out.m_66.x = _765;
    out.m_66.y = _767;
    out.m_66.z = _769;
    out.m_66.w = _757;
    out.m_68.x = _759;
    out.m_68.y = _761;
    out.m_68.z = _763;
    out.m_68.w = _773;
    out.m_70.x = _755;
    out.m_70.y = _771;
    out.m_70.z = _775;
    float _787 = _733;
    float _789 = _759;
    if (!_785)
    {
        _787 = 1.0;
    }
    float _791 = _787;
    bool _793 = !_785;
    float _795 = _791;
    if (!_793)
    {
        bool _797 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _799 = isnan(_739);
        bool _801 = _797 || _799;
        bool _803 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _805 = _801 || _803;
        if (!_805)
        {
            float _807 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _809 = _739 + _807;
            float _811 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _813 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _811;
            float _815 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _817 = _815 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _819 = 1.0 / _813;
            float _821 = _809 * _819;
            float _823 = fma(_821, _817, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _795 = _823;
            _825 = true;
        }
        else
        {
            bool _827 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _829 = isnan(_739);
            bool _831 = _827 || _829;
            bool _833 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _835 = _831 || _833;
            if (!_835)
            {
                float _837 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _839 = _739 + _837;
                float _841 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _843 = _841 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _845 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _847 = _845 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _849 = 1.0 / _843;
                float _851 = _839 * _849;
                float _853 = fma(_851, _847, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _795 = _853;
                _825 = true;
            }
            else
            {
                _795 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _825 = false;
    float _855 = _795;
    float _857 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _859 = _705 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _863 = _711 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _867 = _713 + _865;
    float _869 = fma(_859, _855, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _871 = fma(_863, _855, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _873 = fma(_867, _855, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _875 = -_591;
    float _877 = _875 + _869;
    float _879 = -_475;
    float _881 = _879 + _871;
    float _883 = -_481;
    float _885 = _883 + _873;
    float _887 = _877 * _877;
    float _889 = fma(_881, _881, _887);
    float _891 = fma(_885, _885, _889);
    float _893 = sqrt(_891);
    bool _895 = _893 > 0.0;
    float _897 = _869;
    float _899 = _873;
    float _901 = _867;
    if (!_895)
    {
        _789 = _871;
    }
    float _903 = _789;
    bool _905 = !_895;
    float _907 = _903;
    if (!_905)
    {
        float _909 = _177 * _177;
        float _911 = fma(_175, _175, _909);
        float _913 = fma(_179, _179, _911);
        float _915 = rsqrt(_891);
        float _917 = sqrt(_913);
        float _919 = _881 * _915;
        float _921 = _877 * _915;
        float _923 = _885 * _915;
        bool _925 = _917 > 0.0;
        float _927 = _917;
        if (!_925)
        {
            _927 = _871;
        }
        float _929 = _927;
        bool _931 = !_925;
        _907 = _929;
        if (!_931)
        {
            float _933 = rsqrt(_913);
            float _935 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _937 = _177 * _933;
            float _939 = _175 * _933;
            float _941 = _179 * _933;
            float _943 = _921 * _937;
            float _945 = fma(_919, _939, _943);
            float _947 = _935 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _949 = fma(_923, _941, _945);
            float _951 = _949 * _947;
            float _953 = fma(_175, _951, _871);
            float _955 = fma(_177, _951, _869);
            float _957 = fma(_179, _951, _873);
            _897 = _955;
            _907 = _953;
            _899 = _957;
        }
    }
    float _959 = _897;
    float _961 = _907;
    float _963 = _899;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _959 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _961 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_971, _971, _977);
    float _981 = fma(_975, _975, _979);
    float _983 = rsqrt(_981);
    float _985 = sqrt(_981);
    float _987 = _983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _989 = _971 * _987;
    float _991 = _975 * _987;
    float _993 = _989 * _989;
    float _995 = _991 * _991;
    float _997 = _993 + _995;
    float _999 = sqrt(_997);
    bool _1001 = _999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = _999 + _1003;
    float _1007 = _983;
    float _1009 = _1005;
    float _1011 = _967;
    if (_1001)
    {
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1013;
    }
    float _1015 = _1007;
    if (_1001)
    {
        float _1017 = rsqrt(_997);
        _183 = _1017;
    }
    float _1019 = _183;
    float _1021 = _1019;
    if (_1001)
    {
        float _1023 = _1005 * _1015;
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (_1001)
    {
        float _1027 = _1025 * 0.15915493667125701904296875;
        _185 = _1027;
    }
    float _1029 = _185;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = _975;
    if (_1001)
    {
        float _1035 = _1029 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1043 = precise::max(0.0, _1041);
    float _1045 = _1015;
    float _1047 = _1043;
    if (_1001)
    {
        float _1049 = _1029 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = -_987;
    float _1057 = -_1043;
    float _1059 = fma(_967, _1055, _1057);
    float _1061 = _1059;
    if (_1001)
    {
        float _1063 = _1059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1047 = _1063;
    }
    float _1065 = _1047;
    float _1067 = _1065;
    if (_1001)
    {
        float _1069 = _1039 + (-1.0);
        _1011 = _1069;
    }
    float _1071 = _1011;
    float _1073 = _959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1075 = _1071;
    if (_1001)
    {
        float _1077 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1075 = _1077;
    }
    float _1079 = _1075;
    float _1081 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1073);
    float _1083 = _1053;
    if (_1001)
    {
        float _1085 = fma(_1053, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _1087;
    if (_1001)
    {
        float _1091 = fma(_1059, _1039, _1079);
        _1061 = _1091;
    }
    float _1093 = _1061;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1001)
    {
        float _1097 = _1019 * _1087;
        _901 = _1097;
    }
    float _1099 = _901;
    if (!_1001)
    {
        _1021 = _989;
    }
    float _1101 = _1021;
    float _1103 = _1101;
    if (!_1001)
    {
        _1089 = _991;
    }
    float _1105 = _1089;
    float _1107 = _1105;
    if (_1001)
    {
        float _1109 = _989 * _1099;
        _1103 = _1109;
    }
    float _1111 = _1103;
    if (!_1001)
    {
        _1067 = _993;
    }
    float _1113 = _1067;
    float _1115 = _1113;
    if (_1001)
    {
        float _1117 = _991 * _1099;
        _1107 = _1117;
    }
    float _1119 = _1107;
    float _1121 = fma(_475, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1001)
    {
        float _1123 = _1111 * _1111;
        _1115 = _1123;
    }
    float _1125 = _1115;
    if (!_1001)
    {
        _1095 = _995;
    }
    float _1127 = _1095;
    float _1129 = _1127;
    if (_1001)
    {
        float _1131 = _1119 * _1119;
        _1129 = _1131;
    }
    float _1133 = _1129;
    float _1135 = _959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1137 = fma(_1093, _1093, _1125);
    float _1139 = floor(_1121);
    float _1141 = _1137 + _1133;
    float _1143 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1081);
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1147 = fma(_985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1145);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1135);
    float _1153 = fma(_481, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1155 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1157 = rsqrt(_1141);
    float _1159 = -_1149;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1151);
    float _1165 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1167 = -_1165;
    float _1169 = fma(_1167, _1031, 1.0);
    float _1171 = _959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1173 = _959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1175 = abs(_1161);
    float _1177 = log2(_1175);
    float _1179 = -_1139;
    float _1181 = _1121 + _1179;
    float _1183 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1171);
    float _1185 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1173);
    float _1187 = _1157 * _1111;
    float _1189 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1191 = _1157 * _1093;
    float _1193 = _1157 * _1119;
    float _1195 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1197 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1183);
    float _1199 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1201 = floor(_1153);
    float _1203 = -_1195;
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1203);
    float _1207 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1211 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1213 = -_1193;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1205);
    float _1217 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1209);
    float _1221 = log2(_1169);
    float _1223 = fma(_1215, -0.5, 0.5);
    float _1225 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1227 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1219);
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1225);
    float _1231 = _1191 + 1.0;
    float _1233 = exp2(_1211);
    float _1235 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1237 = -_1201;
    float _1239 = _1153 + _1237;
    float _1241 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1229);
    float _1243 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1227);
    float _1245 = sqrt(_1223);
    float _1247 = fma(_1215, 0.5, 0.5);
    float _1249 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1217);
    float _1251 = _1221 * 0.693147182464599609375;
    float _1253 = fma(_1247, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1255 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1249);
    float _1257 = -_1191;
    float _1259 = fma(_1233, _1231, _1257);
    float _1261 = 1.0 / _1243;
    float _1263 = fma(_1247, _1253, -0.212114393711090087890625);
    float _1265 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1241);
    float _1267 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1255);
    float2 _3808 = float2(_1181, _1239);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3808, float2(0.0), isnan(_3808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3808, float2(0.0), isnan(_3808)), level(0.0)).x;
    float _1271 = fma(_1247, _1263, 1.570728778839111328125);
    float _1273 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1275 = _1245 * 0.636619746685028076171875;
    float _1277 = fma(_1259, 0.5, 0.5);
    float _1279 = -_1271;
    float _1281 = fma(_1275, _1279, 1.0);
    float _1283 = _1265 * _1261;
    float _1285 = _1267 * _1261;
    float _1287 = fma(_1283, 0.5, 0.5);
    float _1289 = fma(_1285, -0.5, 0.5);
    float3 _3847 = float3(_1287, _1289, _1273);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3847, float3(0.0), isnan(_3847)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3847, float3(0.0), isnan(_3847)), level(0.0)).x;
    float3 _3858 = float3(_1287, _1289, _1273);
    float4 _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).xyzw;
    float _1296 = _1294.x;
    float _1298 = _1294.y;
    float _1300 = _1294.z;
    float _1302 = _1294.w;
    float2 _3874 = float2(_1281, _1277);
    float3 _1306 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3874, float2(0.0), isnan(_3874)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3874, float2(0.0), isnan(_3874)), level(0.0)).xyz;
    float _1308 = _1306.x;
    float _1310 = _1306.y;
    float _1312 = _1306.z;
    float _1314 = _591 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1316 = _591 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1318 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1320 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1322 = isnan(_985);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1328 = _1324 || _1326;
    float _1330 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1314);
    float _1332 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1316);
    float _1334 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1336 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1338 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1330);
    float _1340 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1332);
    float _1342 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1334);
    float _1344 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1348 = exp2(_1336);
    float _1350 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1342);
    float _1352 = _1346 + _1344;
    float _1354 = 1.0 / _1344;
    out.gl_Position.x = _1265;
    out.gl_Position.y = _1267;
    out.gl_Position.z = _1350;
    out.gl_Position.w = _1243;
    float _1356 = -_1348;
    float _1358 = _1356 + 1.0;
    float _1360 = _1267;
    float _1362 = _1243;
    float _1364 = _1350;
    if (!_1328)
    {
        _1360 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1366 = _1360;
    float _1368 = _1352 * _1354;
    float _1370 = _1368 * 0.5;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1374 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1372);
    float _1376 = 1.0 / _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1380 = _1376 * _1378;
    float _1382 = abs(_1380);
    float _1384 = log2(_1382);
    bool _1386 = _1380 <= 8000.0;
    bool _1388 = isnan(_1380);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan(8000.0);
    bool _1394 = _1390 || _1392;
    float _1396 = float(_1394);
    float _1398 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1400 = exp2(_1398);
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1404 = precise::clamp(_1402, 0.0, 1.0);
    float _1406 = fma(_1404, -2.0, 3.0);
    float _1408 = _1404 * _1404;
    float _1410 = _1408 * _1406;
    float _1412 = in.m_72.x;
    float _1414 = -_1410;
    float _1416 = _1414 + 1.0;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1410);
    float _1420 = _1350 + _1243;
    float _1422 = _1366;
    float _1424 = _1366;
    if (!_1328)
    {
        _1362 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1426 = _1362;
    float _1428 = _1396 * _1418;
    float _1430 = _1420 * 0.5;
    float _1432 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1434 = _1430;
    float _1436 = _1432;
    float _1438 = _1426;
    float _1440 = _1426;
    if (!_1328)
    {
        _1364 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1442 = _1364;
    float _1444 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1446 = -_1432;
    float _1448 = _1446 + 1.0;
    out.m_74.z = _1430;
    out.m_74.w = _1243;
    float _1450 = _1448;
    float _1452 = _1442;
    float _1454 = _1442;
    if (!_1328)
    {
        _1434 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1456 = _1434;
    float _1458 = -_1269;
    float _1460 = _1458 + 1.0;
    float _1462 = _1460 * _1444;
    float _1464 = precise::clamp(_1462, 0.0, 1.0);
    float _1466 = -_1464;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1470 = _1468 * _1412;
    float _1472 = _1470 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1474 = _1432 * _1291;
    float _1476 = _1302 * _1448;
    out.m_76.x = _1472;
    float _1478 = _1456;
    float _1480 = _1456;
    if (!_1328)
    {
        _1450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1482 = _1450;
    float _1484 = _1302 * _1474;
    float _1486 = _1312 * _1474;
    float _1488 = _1482;
    float _1490 = _1482;
    if (!_1328)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1492 = _1436;
    float _1494 = fma(_1308, _1484, _1296);
    float _1496 = fma(_1310, _1484, _1298);
    float _1498 = fma(_1302, _1486, _1300);
    out.m_78.x = _1494;
    out.m_78.y = _1496;
    out.m_78.z = _1498;
    out.m_78.w = _1476;
    bool _1500 = !_1328;
    float _1502 = _1492;
    float _1504 = _1492;
    if (!_1500)
    {
        bool _1506 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1508 = isnan(_985);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1518 = _985 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1520;
            float _1524 = 1.0 / _1522;
            float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1528 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1532 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1546 = _1518 * _1524;
            float _1548 = precise::clamp(_1546, 0.0, 1.0);
            float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1554 = fma(_1548, _1528, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1556 = fma(_1548, _1552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1558 = fma(_1548, _1532, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1560 = fma(_1548, _1536, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1562 = fma(_1548, _1540, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1564 = fma(_1548, _1544, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1440 = _1556;
            _1490 = _1562;
            _1480 = _1554;
            _1424 = _1560;
            _1454 = _1558;
            _1504 = _1564;
            _1566 = true;
        }
        else
        {
            bool _1568 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1570 = isnan(_985);
            bool _1572 = _1568 || _1570;
            bool _1574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1576 = _1572 || _1574;
            if (!_1576)
            {
                _1478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1578 = _1478;
            _1480 = _1578;
            if (!_1576)
            {
                _1438 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1580 = _1438;
            _1440 = _1580;
            if (!_1576)
            {
                _1452 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1582 = _1452;
            _1454 = _1582;
            if (!_1576)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1584 = _1422;
            _1424 = _1584;
            if (!_1576)
            {
                _1488 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1586 = _1488;
            _1490 = _1586;
            if (!_1576)
            {
                _1502 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1588 = _1502;
            bool _1590 = !_1576;
            _1504 = _1588;
            if (!_1590)
            {
                bool _1592 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1594 = isnan(_985);
                bool _1596 = _1592 || _1594;
                bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1600 = _1596 || _1598;
                if (!_1600)
                {
                    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1604 = _985 + _1602;
                    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1606;
                    float _1610 = 1.0 / _1608;
                    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1630 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1632 = _1604 * _1610;
                    float _1634 = precise::clamp(_1632, 0.0, 1.0);
                    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1640 = fma(_1634, _1614, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1642 = fma(_1634, _1638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1644 = fma(_1634, _1618, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1646 = fma(_1634, _1622, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1648 = fma(_1634, _1626, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1650 = fma(_1634, _1630, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1440 = _1642;
                    _1490 = _1648;
                    _1480 = _1640;
                    _1424 = _1646;
                    _1454 = _1644;
                    _1504 = _1650;
                    _1566 = true;
                }
                else
                {
                    _1440 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1490 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1454 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1504 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1566 = false;
    float _1652 = _1440;
    float _1654 = _1490;
    float _1656 = _1480;
    float _1658 = _1424;
    float _1660 = _1454;
    float _1662 = _1504;
    float _1664 = fma(_771, -0.5, 0.5);
    float _1666 = precise::clamp(_1664, 0.0, 1.0);
    float _1668 = -_1652;
    float _1670 = _1668 + _1654;
    float _1672 = -_1656;
    float _1674 = _1672 + _1658;
    float _1676 = -_1660;
    float _1678 = _1676 + _1662;
    bool _1680 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1682 = fma(_1666, _1670, _1652);
    float _1684 = fma(_1666, _1674, _1656);
    float _1686 = fma(_1666, _1678, _1660);
    float _1688 = _1682 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _1690 = fma(_1684, 0.298911988735198974609375, _1688);
    out.m_51.x = 1.0;
    float _1692 = fma(_1686, 0.114477999508380889892578125, _1690);
    float _1694 = -_1692;
    float _1696 = _1684 + _1694;
    float _1698 = -_1692;
    float _1700 = _1682 + _1698;
    float _1702 = -_1692;
    float _1704 = _1686 + _1702;
    float _1706 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    float _1710 = fma(_1700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    float _1712 = fma(_1704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    out.m_76.w = _1706;
    out.m_82.x = _1708;
    out.m_82.y = _1710;
    out.m_82.z = _1712;
    if (!_1680)
    {
        return out;
    }
    float _1714 = -_959;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1718 = -_961;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1722 = -_963;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1726 = _1716 * _1716;
    float _1728 = fma(_1720, _1720, _1726);
    float _1730 = fma(_1724, _1724, _1728);
    float _1732 = sqrt(_1730);
    float _1734 = rsqrt(_1730);
    float _1736 = -_1732;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1740 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1742 = precise::clamp(_1740, 0.0, 1.0);
    float _1744 = _1720 * _1734;
    float _1746 = _1716 * _1734;
    float _1748 = abs(_1742);
    float _1750 = log2(_1748);
    float _1752 = _1724 * _1734;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1756 = _771 * _1746;
    float _1758 = -_1746;
    float _1760 = -_1754;
    float _1762 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1760);
    float _1764 = fma(_755, _1744, _1756);
    float _1766 = -_1752;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1762);
    float _1770 = fma(_775, _1752, _1764);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1776 = _1768 + _1774;
    float _1778 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1780 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1782 = precise::clamp(_1780, 0.0, 1.0);
    float _1784 = exp2(_1778);
    float _1786 = _1784 * _1782;
    float _1788 = _1772 * _1786;
    float _1790 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1792 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1794 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _1790;
    out.m_80.y = _1792;
    out.m_80.z = _1794;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1566 = false;
    bool _825 = false;
    bool _353 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_48.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_51.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1851 = as_type<float>(_117);
        out.gl_Position.z = _1851;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_53.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    if (_131)
    {
        float _139 = float(_101);
        _137 = _139;
    }
    float _141 = _137;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    if (_147)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _111;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1919 = as_type<float>(_153);
        out.gl_Position.z = _1919;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_55.x;
    float _157 = in.m_55.y;
    float _159 = in.m_55.z;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    float _175 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _173);
    bool _181 = !_161;
    float _183 = _177;
    float _185 = _179;
    float _203;
    if (!_181)
    {
        float _187 = in.m_57.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_101);
        float _209 = 1.0 / _207;
        float _211 = _135 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    bool _231 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _233 = isnan(_213);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -_229;
    float _253 = _251 + 1.0;
    float _255 = 1.0 / _245;
    bool _257 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_213);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _241 * _253;
    float _271 = -_241;
    float _273 = _271 + 1.0;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = _267 * _273;
    float _279 = 1.0 / _249;
    float _281 = -_267;
    float _283 = _281 + 1.0;
    float _285 = _217 * _255;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _213 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = fma(_293, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _301 = fma(_297, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _303 = _289 * _279;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = _299 * _277;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _315 = _301 * _277;
    float _317 = fma(_307, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _319 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _321 = fma(_313, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[143].y, _315);
    float _325 = fma(_317, _269, _319);
    float _327 = fma(_321, _269, _323);
    float _329 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[145].x, _325);
    float _331 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[145].y, _327);
    bool _333 = !_275;
    float _351;
    if (!_333)
    {
        float _335 = in.m_57.x;
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _339 = _335 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        float _355 = float(_101);
        float _357 = 1.0 / _355;
        float _359 = _135 * _357;
        _351 = _359;
    }
    _353 = false;
    float _361 = _351;
    float _363 = in.m_57.x;
    float _365 = in.m_57.y;
    float _367 = as_type<float>(int(gl_VertexIndex));
    float _369 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _371 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = isnan(_361);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = in.m_62.x;
    float _385 = in.m_62.y;
    bool _387 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _389 = isnan(_361);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = in.m_48.x;
    float _401 = in.m_48.y;
    float _403 = in.m_48.z;
    bool _405 = _363 > 0.5;
    bool _407 = _365 > 0.5;
    int _409 = as_type<int>(_367) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_367) & 2;
    bool _415 = _413 != 0;
    float _417 = _329 * _383;
    float _419 = _331 * _385;
    bool _421 = !_415;
    float _423 = _421 ? (-0.5) : 0.5;
    float _425 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _427 = !_411;
    float _429 = _427 ? (-0.5) : 0.5;
    float _431 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _433 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _439 = _437 != 0;
    float _441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _429);
    float _443 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    float _445 = _431 * _435;
    float _447 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = _425 * _441;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _445 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _461 = 1.0 / _453;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[24].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _469 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _471 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _479 = _477 != 0;
    float _481 = _469 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _483 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _485 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _487 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = _475 + _483;
    float _491 = _481 + _485;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _501 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _503 = _489 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _507 = _491 + _505;
    float _509 = _495 * _461;
    float _511 = 1.0 / _499;
    float _513 = _503 * _503;
    float _515 = _507 * _507;
    float _517 = _445 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _519 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    bool _521 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _523 = isnan(_361);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _513 + _515;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[25].x, _517);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _361 + _541;
    float _545 = sqrt(_533);
    float _547 = -_531;
    float _549 = _547 + 1.0;
    float _551 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _553 = -_423;
    int _555 = _407 ? as_type<int>(_553) : as_type<int>(_423);
    float _557 = fma(_509, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _559 = _381 * _549;
    float _561 = _537 * _511;
    float _563 = -_381;
    float _565 = _563 + 1.0;
    float _567 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
    bool _569 = !_479;
    float _571 = _569 ? _423 : as_type<float>(_555);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _575 = _361 + _573;
    float _577 = _397 * _565;
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _581 = -_429;
    int _583 = _405 ? as_type<int>(_581) : as_type<int>(_429);
    float _585 = _423 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _587 = _557 * _577;
    bool _589 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _591 = _567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _593 = _551 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _595 = fma(_561, _575, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _599 = !_439;
    float _601 = _599 ? _429 : as_type<float>(_583);
    float _603 = _429 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = _585 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = _585 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _609 = _585 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _611 = -_397;
    float _613 = _611 + 1.0;
    float _615 = _591 + _593;
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _607);
    float _621 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _609);
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _625 = _585;
    float _627 = _603;
    float _629 = _513;
    float _631 = _515;
    float _633 = _613;
    if (!_589)
    {
        _625 = _515;
    }
    float _635 = _625;
    float _637 = _635;
    if (!_589)
    {
        _627 = _513;
    }
    float _639 = _627;
    float _641 = _639;
    if (!_589)
    {
        _629 = _489;
    }
    float _643 = _629;
    float _645 = _643;
    if (!_589)
    {
        _631 = _491;
    }
    float _647 = _631;
    float _649 = _647;
    if (!_589)
    {
        _633 = _615;
    }
    float _651 = _633;
    bool _653 = !_589;
    float _655 = _651;
    if (!_653)
    {
        float _657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _659 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _661 = _545 + _659;
        float _663 = _615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = rsqrt(_533);
        float _667 = _661 * _657;
        float _669 = _667 * 0.15915493667125701904296875;
        float _671 = _669 * 6.283185482025146484375;
        float _673 = sin(_671);
        float _675 = _669 * 6.283185482025146484375;
        float _677 = cos(_675);
        float _679 = fma(_673, _663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _681 = _665 * _679;
        float _683 = _677 + (-1.0);
        float _685 = fma(_503, _681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _687 = fma(_507, _681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _689 = _683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _691 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _693 = _685 + _691;
        float _695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _697 = _687 + _695;
        float _699 = fma(_615, _677, _689);
        float _701 = _693 * _693;
        float _703 = _697 * _697;
        _655 = _699;
        _641 = _701;
        _637 = _703;
        _645 = _685;
        _649 = _687;
    }
    float _705 = _655;
    float _707 = _641;
    float _709 = _637;
    float _711 = _645;
    float _713 = _649;
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _717 = _705 + _715;
    float _719 = -_571;
    float _721 = _719 + 0.5;
    float _723 = fma(_595, _559, _623);
    float _725 = _601 + 0.5;
    float _727 = fma(_717, _717, _707);
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _731 = _725 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _733 = _727 + _709;
    float _735 = _729 * _597;
    float _737 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _739 = sqrt(_733);
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _753 = _731 * _579;
    float _755 = _619 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _759 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _773 = _737 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _621 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_64.x = _753;
    out.m_64.y = _735;
    bool _777 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _779 = isnan(_739);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _785 = _781 || _783;
    out.m_66.x = _765;
    out.m_66.y = _767;
    out.m_66.z = _769;
    out.m_66.w = _757;
    out.m_68.x = _759;
    out.m_68.y = _761;
    out.m_68.z = _763;
    out.m_68.w = _773;
    out.m_70.x = _755;
    out.m_70.y = _771;
    out.m_70.z = _775;
    float _787 = _733;
    float _789 = _759;
    if (!_785)
    {
        _787 = 1.0;
    }
    float _791 = _787;
    bool _793 = !_785;
    float _795 = _791;
    if (!_793)
    {
        bool _797 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _799 = isnan(_739);
        bool _801 = _797 || _799;
        bool _803 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _805 = _801 || _803;
        if (!_805)
        {
            float _807 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _809 = _739 + _807;
            float _811 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _813 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _811;
            float _815 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _817 = _815 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _819 = 1.0 / _813;
            float _821 = _809 * _819;
            float _823 = fma(_821, _817, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _795 = _823;
            _825 = true;
        }
        else
        {
            bool _827 = _739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _829 = isnan(_739);
            bool _831 = _827 || _829;
            bool _833 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _835 = _831 || _833;
            if (!_835)
            {
                float _837 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _839 = _739 + _837;
                float _841 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _843 = _841 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _845 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _847 = _845 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _849 = 1.0 / _843;
                float _851 = _839 * _849;
                float _853 = fma(_851, _847, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _795 = _853;
                _825 = true;
            }
            else
            {
                _795 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _825 = false;
    float _855 = _795;
    float _857 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _859 = _705 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _863 = _711 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _867 = _713 + _865;
    float _869 = fma(_859, _855, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _871 = fma(_863, _855, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _873 = fma(_867, _855, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _875 = -_591;
    float _877 = _875 + _869;
    float _879 = -_475;
    float _881 = _879 + _871;
    float _883 = -_481;
    float _885 = _883 + _873;
    float _887 = _877 * _877;
    float _889 = fma(_881, _881, _887);
    float _891 = fma(_885, _885, _889);
    float _893 = sqrt(_891);
    bool _895 = _893 > 0.0;
    float _897 = _869;
    float _899 = _873;
    float _901 = _867;
    if (!_895)
    {
        _789 = _871;
    }
    float _903 = _789;
    bool _905 = !_895;
    float _907 = _903;
    if (!_905)
    {
        float _909 = _177 * _177;
        float _911 = fma(_175, _175, _909);
        float _913 = fma(_179, _179, _911);
        float _915 = rsqrt(_891);
        float _917 = sqrt(_913);
        float _919 = _881 * _915;
        float _921 = _877 * _915;
        float _923 = _885 * _915;
        bool _925 = _917 > 0.0;
        float _927 = _917;
        if (!_925)
        {
            _927 = _871;
        }
        float _929 = _927;
        bool _931 = !_925;
        _907 = _929;
        if (!_931)
        {
            float _933 = rsqrt(_913);
            float _935 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _937 = _177 * _933;
            float _939 = _175 * _933;
            float _941 = _179 * _933;
            float _943 = _921 * _937;
            float _945 = fma(_919, _939, _943);
            float _947 = _935 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _949 = fma(_923, _941, _945);
            float _951 = _949 * _947;
            float _953 = fma(_175, _951, _871);
            float _955 = fma(_177, _951, _869);
            float _957 = fma(_179, _951, _873);
            _897 = _955;
            _907 = _953;
            _899 = _957;
        }
    }
    float _959 = _897;
    float _961 = _907;
    float _963 = _899;
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _959 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _961 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_971, _971, _977);
    float _981 = fma(_975, _975, _979);
    float _983 = rsqrt(_981);
    float _985 = sqrt(_981);
    float _987 = _983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _989 = _971 * _987;
    float _991 = _975 * _987;
    float _993 = _989 * _989;
    float _995 = _991 * _991;
    float _997 = _993 + _995;
    float _999 = sqrt(_997);
    bool _1001 = _999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = _999 + _1003;
    float _1007 = _983;
    float _1009 = _1005;
    float _1011 = _967;
    if (_1001)
    {
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1013;
    }
    float _1015 = _1007;
    if (_1001)
    {
        float _1017 = rsqrt(_997);
        _183 = _1017;
    }
    float _1019 = _183;
    float _1021 = _1019;
    if (_1001)
    {
        float _1023 = _1005 * _1015;
        _1009 = _1023;
    }
    float _1025 = _1009;
    if (_1001)
    {
        float _1027 = _1025 * 0.15915493667125701904296875;
        _185 = _1027;
    }
    float _1029 = _185;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = _975;
    if (_1001)
    {
        float _1035 = _1029 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1043 = precise::max(0.0, _1041);
    float _1045 = _1015;
    float _1047 = _1043;
    if (_1001)
    {
        float _1049 = _1029 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = -_987;
    float _1057 = -_1043;
    float _1059 = fma(_967, _1055, _1057);
    float _1061 = _1059;
    if (_1001)
    {
        float _1063 = _1059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1047 = _1063;
    }
    float _1065 = _1047;
    float _1067 = _1065;
    if (_1001)
    {
        float _1069 = _1039 + (-1.0);
        _1011 = _1069;
    }
    float _1071 = _1011;
    float _1073 = _959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1075 = _1071;
    if (_1001)
    {
        float _1077 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1075 = _1077;
    }
    float _1079 = _1075;
    float _1081 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1073);
    float _1083 = _1053;
    if (_1001)
    {
        float _1085 = fma(_1053, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _1087;
    if (_1001)
    {
        float _1091 = fma(_1059, _1039, _1079);
        _1061 = _1091;
    }
    float _1093 = _1061;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1001)
    {
        float _1097 = _1019 * _1087;
        _901 = _1097;
    }
    float _1099 = _901;
    if (!_1001)
    {
        _1021 = _989;
    }
    float _1101 = _1021;
    float _1103 = _1101;
    if (!_1001)
    {
        _1089 = _991;
    }
    float _1105 = _1089;
    float _1107 = _1105;
    if (_1001)
    {
        float _1109 = _989 * _1099;
        _1103 = _1109;
    }
    float _1111 = _1103;
    if (!_1001)
    {
        _1067 = _993;
    }
    float _1113 = _1067;
    float _1115 = _1113;
    if (_1001)
    {
        float _1117 = _991 * _1099;
        _1107 = _1117;
    }
    float _1119 = _1107;
    float _1121 = fma(_475, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1001)
    {
        float _1123 = _1111 * _1111;
        _1115 = _1123;
    }
    float _1125 = _1115;
    if (!_1001)
    {
        _1095 = _995;
    }
    float _1127 = _1095;
    float _1129 = _1127;
    if (_1001)
    {
        float _1131 = _1119 * _1119;
        _1129 = _1131;
    }
    float _1133 = _1129;
    float _1135 = _959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1137 = fma(_1093, _1093, _1125);
    float _1139 = floor(_1121);
    float _1141 = _1137 + _1133;
    float _1143 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1081);
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1147 = fma(_985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1145);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1135);
    float _1153 = fma(_481, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1155 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1157 = rsqrt(_1141);
    float _1159 = -_1149;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1151);
    float _1165 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1167 = -_1165;
    float _1169 = fma(_1167, _1031, 1.0);
    float _1171 = _959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1173 = _959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1175 = abs(_1161);
    float _1177 = log2(_1175);
    float _1179 = -_1139;
    float _1181 = _1121 + _1179;
    float _1183 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1171);
    float _1185 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1173);
    float _1187 = _1157 * _1111;
    float _1189 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1191 = _1157 * _1093;
    float _1193 = _1157 * _1119;
    float _1195 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1197 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1183);
    float _1199 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1201 = floor(_1153);
    float _1203 = -_1195;
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1203);
    float _1207 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1211 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1213 = -_1193;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1205);
    float _1217 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1209);
    float _1221 = log2(_1169);
    float _1223 = fma(_1215, -0.5, 0.5);
    float _1225 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1227 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1219);
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1225);
    float _1231 = _1191 + 1.0;
    float _1233 = exp2(_1211);
    float _1235 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1237 = -_1201;
    float _1239 = _1153 + _1237;
    float _1241 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1229);
    float _1243 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1227);
    float _1245 = sqrt(_1223);
    float _1247 = fma(_1215, 0.5, 0.5);
    float _1249 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1217);
    float _1251 = _1221 * 0.693147182464599609375;
    float _1253 = fma(_1247, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1255 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1249);
    float _1257 = -_1191;
    float _1259 = fma(_1233, _1231, _1257);
    float _1261 = 1.0 / _1243;
    float _1263 = fma(_1247, _1253, -0.212114393711090087890625);
    float _1265 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1241);
    float _1267 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1255);
    float2 _3808 = float2(_1181, _1239);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3808, float2(0.0), isnan(_3808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3808, float2(0.0), isnan(_3808)), level(0.0)).x;
    float _1271 = fma(_1247, _1263, 1.570728778839111328125);
    float _1273 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1275 = _1245 * 0.636619746685028076171875;
    float _1277 = fma(_1259, 0.5, 0.5);
    float _1279 = -_1271;
    float _1281 = fma(_1275, _1279, 1.0);
    float _1283 = _1265 * _1261;
    float _1285 = _1267 * _1261;
    float _1287 = fma(_1283, 0.5, 0.5);
    float _1289 = fma(_1285, -0.5, 0.5);
    float3 _3847 = float3(_1287, _1289, _1273);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3847, float3(0.0), isnan(_3847)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3847, float3(0.0), isnan(_3847)), level(0.0)).x;
    float3 _3858 = float3(_1287, _1289, _1273);
    float4 _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).xyzw;
    float _1296 = _1294.x;
    float _1298 = _1294.y;
    float _1300 = _1294.z;
    float _1302 = _1294.w;
    float2 _3874 = float2(_1281, _1277);
    float3 _1306 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3874, float2(0.0), isnan(_3874)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3874, float2(0.0), isnan(_3874)), level(0.0)).xyz;
    float _1308 = _1306.x;
    float _1310 = _1306.y;
    float _1312 = _1306.z;
    float _1314 = _591 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1316 = _591 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1318 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1320 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1322 = isnan(_985);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1328 = _1324 || _1326;
    float _1330 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1314);
    float _1332 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1316);
    float _1334 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1336 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1338 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1330);
    float _1340 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1332);
    float _1342 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1334);
    float _1344 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1348 = exp2(_1336);
    float _1350 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1342);
    float _1352 = _1346 + _1344;
    float _1354 = 1.0 / _1344;
    out.gl_Position.x = _1265;
    out.gl_Position.y = _1267;
    out.gl_Position.z = _1350;
    out.gl_Position.w = _1243;
    float _1356 = -_1348;
    float _1358 = _1356 + 1.0;
    float _1360 = _1267;
    float _1362 = _1243;
    float _1364 = _1350;
    if (!_1328)
    {
        _1360 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1366 = _1360;
    float _1368 = _1352 * _1354;
    float _1370 = _1368 * 0.5;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1374 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1372);
    float _1376 = 1.0 / _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1380 = _1376 * _1378;
    float _1382 = abs(_1380);
    float _1384 = log2(_1382);
    bool _1386 = _1380 <= 8000.0;
    bool _1388 = isnan(_1380);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan(8000.0);
    bool _1394 = _1390 || _1392;
    float _1396 = float(_1394);
    float _1398 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1400 = exp2(_1398);
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1404 = precise::clamp(_1402, 0.0, 1.0);
    float _1406 = fma(_1404, -2.0, 3.0);
    float _1408 = _1404 * _1404;
    float _1410 = _1408 * _1406;
    float _1412 = in.m_72.x;
    float _1414 = -_1410;
    float _1416 = _1414 + 1.0;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1410);
    float _1420 = _1350 + _1243;
    float _1422 = _1366;
    float _1424 = _1366;
    if (!_1328)
    {
        _1362 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1426 = _1362;
    float _1428 = _1396 * _1418;
    float _1430 = _1420 * 0.5;
    float _1432 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1434 = _1430;
    float _1436 = _1432;
    float _1438 = _1426;
    float _1440 = _1426;
    if (!_1328)
    {
        _1364 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1442 = _1364;
    float _1444 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1446 = -_1432;
    float _1448 = _1446 + 1.0;
    out.m_74.z = _1430;
    out.m_74.w = _1243;
    float _1450 = _1448;
    float _1452 = _1442;
    float _1454 = _1442;
    if (!_1328)
    {
        _1434 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1456 = _1434;
    float _1458 = -_1269;
    float _1460 = _1458 + 1.0;
    float _1462 = _1460 * _1444;
    float _1464 = precise::clamp(_1462, 0.0, 1.0);
    float _1466 = -_1464;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1470 = _1468 * _1412;
    float _1472 = _1470 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1474 = _1432 * _1291;
    float _1476 = _1302 * _1448;
    out.m_76.x = _1472;
    float _1478 = _1456;
    float _1480 = _1456;
    if (!_1328)
    {
        _1450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1482 = _1450;
    float _1484 = _1302 * _1474;
    float _1486 = _1312 * _1474;
    float _1488 = _1482;
    float _1490 = _1482;
    if (!_1328)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1492 = _1436;
    float _1494 = fma(_1308, _1484, _1296);
    float _1496 = fma(_1310, _1484, _1298);
    float _1498 = fma(_1302, _1486, _1300);
    out.m_78.x = _1494;
    out.m_78.y = _1496;
    out.m_78.z = _1498;
    out.m_78.w = _1476;
    bool _1500 = !_1328;
    float _1502 = _1492;
    float _1504 = _1492;
    if (!_1500)
    {
        bool _1506 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1508 = isnan(_985);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1518 = _985 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1520;
            float _1524 = 1.0 / _1522;
            float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1528 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1532 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1546 = _1518 * _1524;
            float _1548 = precise::clamp(_1546, 0.0, 1.0);
            float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1554 = fma(_1548, _1528, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1556 = fma(_1548, _1552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1558 = fma(_1548, _1532, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1560 = fma(_1548, _1536, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1562 = fma(_1548, _1540, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1564 = fma(_1548, _1544, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1440 = _1556;
            _1490 = _1562;
            _1480 = _1554;
            _1424 = _1560;
            _1454 = _1558;
            _1504 = _1564;
            _1566 = true;
        }
        else
        {
            bool _1568 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1570 = isnan(_985);
            bool _1572 = _1568 || _1570;
            bool _1574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1576 = _1572 || _1574;
            if (!_1576)
            {
                _1478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1578 = _1478;
            _1480 = _1578;
            if (!_1576)
            {
                _1438 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1580 = _1438;
            _1440 = _1580;
            if (!_1576)
            {
                _1452 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1582 = _1452;
            _1454 = _1582;
            if (!_1576)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1584 = _1422;
            _1424 = _1584;
            if (!_1576)
            {
                _1488 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1586 = _1488;
            _1490 = _1586;
            if (!_1576)
            {
                _1502 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1588 = _1502;
            bool _1590 = !_1576;
            _1504 = _1588;
            if (!_1590)
            {
                bool _1592 = _985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1594 = isnan(_985);
                bool _1596 = _1592 || _1594;
                bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1600 = _1596 || _1598;
                if (!_1600)
                {
                    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1604 = _985 + _1602;
                    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1606;
                    float _1610 = 1.0 / _1608;
                    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1630 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1632 = _1604 * _1610;
                    float _1634 = precise::clamp(_1632, 0.0, 1.0);
                    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1640 = fma(_1634, _1614, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1642 = fma(_1634, _1638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1644 = fma(_1634, _1618, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1646 = fma(_1634, _1622, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1648 = fma(_1634, _1626, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1650 = fma(_1634, _1630, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1440 = _1642;
                    _1490 = _1648;
                    _1480 = _1640;
                    _1424 = _1646;
                    _1454 = _1644;
                    _1504 = _1650;
                    _1566 = true;
                }
                else
                {
                    _1440 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1490 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1454 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1504 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1566 = false;
    float _1652 = _1440;
    float _1654 = _1490;
    float _1656 = _1480;
    float _1658 = _1424;
    float _1660 = _1454;
    float _1662 = _1504;
    float _1664 = fma(_771, -0.5, 0.5);
    float _1666 = precise::clamp(_1664, 0.0, 1.0);
    float _1668 = -_1652;
    float _1670 = _1668 + _1654;
    float _1672 = -_1656;
    float _1674 = _1672 + _1658;
    float _1676 = -_1660;
    float _1678 = _1676 + _1662;
    bool _1680 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1682 = fma(_1666, _1670, _1652);
    float _1684 = fma(_1666, _1674, _1656);
    float _1686 = fma(_1666, _1678, _1660);
    float _1688 = _1682 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _1690 = fma(_1684, 0.298911988735198974609375, _1688);
    out.m_51.x = 1.0;
    float _1692 = fma(_1686, 0.114477999508380889892578125, _1690);
    float _1694 = -_1692;
    float _1696 = _1684 + _1694;
    float _1698 = -_1692;
    float _1700 = _1682 + _1698;
    float _1702 = -_1692;
    float _1704 = _1686 + _1702;
    float _1706 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    float _1710 = fma(_1700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    float _1712 = fma(_1704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1692);
    out.m_76.w = _1706;
    out.m_82.x = _1708;
    out.m_82.y = _1710;
    out.m_82.z = _1712;
    if (!_1680)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1714 = -_959;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1718 = -_961;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1722 = -_963;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1726 = _1716 * _1716;
    float _1728 = fma(_1720, _1720, _1726);
    float _1730 = fma(_1724, _1724, _1728);
    float _1732 = sqrt(_1730);
    float _1734 = rsqrt(_1730);
    float _1736 = -_1732;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1740 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1742 = precise::clamp(_1740, 0.0, 1.0);
    float _1744 = _1720 * _1734;
    float _1746 = _1716 * _1734;
    float _1748 = abs(_1742);
    float _1750 = log2(_1748);
    float _1752 = _1724 * _1734;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1756 = _771 * _1746;
    float _1758 = -_1746;
    float _1760 = -_1754;
    float _1762 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1760);
    float _1764 = fma(_755, _1744, _1756);
    float _1766 = -_1752;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1762);
    float _1770 = fma(_775, _1752, _1764);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1776 = _1768 + _1774;
    float _1778 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1780 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1782 = precise::clamp(_1780, 0.0, 1.0);
    float _1784 = exp2(_1778);
    float _1786 = _1784 * _1782;
    float _1788 = _1772 * _1786;
    float _1790 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1792 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1794 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _1790;
    out.m_80.y = _1792;
    out.m_80.z = _1794;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

