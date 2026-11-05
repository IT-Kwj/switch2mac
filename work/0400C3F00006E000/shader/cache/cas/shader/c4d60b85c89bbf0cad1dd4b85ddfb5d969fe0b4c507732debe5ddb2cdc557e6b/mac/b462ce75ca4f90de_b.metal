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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_92 [[user(locn16)]];
    float4 m_94 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3495 = false;
    bool _439 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3799 = as_type<float>(_131);
        out.gl_Position.z = _3799;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3872 = as_type<float>(_173);
        out.gl_Position.z = _3872;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = in.m_62.x;
    float _267 = in.m_62.y;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _255;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = -_279;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _259;
    float _291 = 1.0 / _263;
    float _293 = _247 * _281;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _243 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = _297 * _289;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    bool _311 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_243);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -_321;
    float _327 = _325 + 1.0;
    float _329 = _251 * _291;
    bool _331 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_243);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _321 * _287;
    bool _345 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_243);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _341 * _327;
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = fma(_359, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = _355 * _369;
    float _375 = -_355;
    float _377 = _375 + 1.0;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = _303 * _373;
    float _383 = _323 * _373;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _397 = fma(_387, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_371, _365, _393);
    float _403 = fma(_379, _365, _395);
    float _405 = fma(_397, _343, _401);
    float _407 = fma(_399, _343, _403);
    float _409 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _405);
    float _411 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _407);
    float _413 = _409 * _265;
    float _415 = _411 * _267;
    bool _417 = !_283;
    float _419 = _343;
    float _437;
    if (!_417)
    {
        float _421 = in.m_60.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        _437 = _167;
    }
    _439 = false;
    float _441 = _437;
    bool _443 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = isnan(_441);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_441);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _441 + _475;
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _457;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _487 = _469 * _481;
    float _489 = -_469;
    float _491 = _489 + 1.0;
    float _493 = _473 * _483;
    float _495 = fma(_493, _477, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _497 = _495 * _487;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[115].x, _497);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[116].x, _503);
    float _513 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = _511 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _507;
    out.m_64.y = _509;
    out.m_64.z = _513;
    out.m_64.w = _515;
    bool _517 = !_485;
    if (!_517)
    {
        float _519 = in.m_60.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _169 = _533;
    }
    float _535 = _169;
    float _537 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _539 = int(_537);
    float _541 = in.m_60.x;
    float _543 = in.m_60.y;
    float _545 = _159 * _141;
    float _547 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _555 = int(_553);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _559 = float(_539);
    float _561 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _563 = int(_561);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_551)
    {
        _419 = 1.0;
    }
    float _569 = _419;
    float _571 = _569;
    if (!_551)
    {
        _571 = 7.345489978790283203125;
    }
    float _573 = _571;
    float _575 = float(_555);
    float _577 = 1.0 / _559;
    float _579 = _573 * _541;
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _583 = int(_581);
    float _585 = float(uint(_563));
    bool _587 = _563 == 0;
    float _589 = 1.0 / _575;
    float _591 = _577 * _141;
    float _593 = 1.0 / _585;
    float _595 = float(uint(_583));
    int _597 = ~_583;
    int _599 = _597 + 1;
    float _601 = trunc(_591);
    int _603 = int(_601);
    float _605 = _589 * _141;
    int _607 = ~_563;
    int _609 = _607 + 1;
    float _611 = 1.0 / _595;
    int _613 = as_type<int>(_593) + (-2);
    float _615 = trunc(_605);
    int _617 = int(_615);
    float _619 = float(uint(_603));
    float _621 = as_type<float>(_613) * _619;
    int _623 = as_type<int>(_611) + (-2);
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _627 = ~_583;
    int _629 = _627 + 1;
    float _631 = float(uint(_617));
    float _633 = trunc(_621);
    float _635 = precise::max(_633, 0.0);
    uint _638 = uint(_635);
    float _640 = as_type<float>(_623) * _631;
    float _642 = trunc(_640);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    float _648 = _625 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _650 = _609 * int(_638);
    int _652 = _650 + _603;
    float _654 = floor(_579);
    float _656 = float(uint(_652));
    int _658 = _629 * int(_646);
    int _660 = _658 + _617;
    float _662 = as_type<float>(_613) * _656;
    float _664 = _656;
    if (_551)
    {
        _664 = 1.0;
    }
    float _666 = _664;
    float _668 = float(uint(_660));
    float _670 = trunc(_662);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    float _676 = _666;
    float _678 = _668;
    if (!_551)
    {
        _676 = 1.2345600128173828125;
    }
    float _680 = _676;
    float _682 = -_654;
    float _684 = _579 + _682;
    float _686 = as_type<float>(_623) * _668;
    if (_551)
    {
        _678 = _541;
    }
    float _688 = _678;
    float _690 = _688;
    if (!_551)
    {
        _690 = _543;
    }
    float _692 = _690;
    float _694 = trunc(_686);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    float _700 = _680 * _692;
    int _702 = ~_563;
    int _704 = _702 + 1;
    int _706 = int(_638) + int(_674);
    float _708 = floor(_700);
    float _710 = float(_563);
    float _712 = float(_603);
    int _714 = _704 * _706;
    int _716 = _714 + _603;
    int _718 = int(_646) + int(_698);
    float _720 = _684 * _710;
    float _722 = _710 * _545;
    bool _724 = _712 >= _710;
    bool _726 = isnan(_712);
    bool _728 = _724 || _726;
    bool _730 = isnan(_710);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    bool _736 = uint(_716) >= uint(_563);
    int _738 = _599 * _718;
    int _740 = _738 + _617;
    float _742 = -_708;
    float _744 = _700 + _742;
    float _746 = trunc(_734);
    int _748 = int(_746);
    bool _750 = !_736;
    int _752 = _750 ? 0 : (-1);
    bool _754 = uint(_740) >= uint(_583);
    float _756 = in.m_60.z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _760 = _758 != 0;
    int _762 = ~_706;
    int _764 = _762 + _752;
    int _766 = _764 + 1;
    float _768 = trunc(_720);
    int _770 = int(_768);
    bool _772 = !_760;
    int _774 = _772 ? 0 : 1;
    float _776 = float(_583);
    int _778 = abs(_774);
    int _780 = _563 * _766;
    int _782 = _780 + _603;
    float _784 = float(_617);
    float _786 = _776 * _545;
    int _788 = ~_748;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    bool _794 = !_754;
    int _796 = _794 ? 0 : (-1);
    bool _798 = !_587;
    int _800 = _798 ? _782 : (-1);
    float _802 = trunc(_786);
    int _804 = int(_802);
    bool _806 = _784 >= _776;
    bool _808 = isnan(_784);
    bool _810 = _806 || _808;
    bool _812 = isnan(_776);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = _744 * _776;
    bool _820 = _543 > 0.5;
    int _822 = _800 * _792;
    int _824 = ~_718;
    int _826 = _824 + _796;
    int _828 = _826 + 1;
    int _830 = _770 * _778;
    int _832 = _830 + _603;
    bool _834 = _756 > 0.5;
    float _836 = trunc(_818);
    int _838 = int(_836);
    float _840 = -_217;
    int _842 = _820 ? as_type<int>(_840) : as_type<int>(_217);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _850 = _848 != 0;
    float _852 = -_207;
    int _854 = _834 ? as_type<int>(_852) : as_type<int>(_207);
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _858 = _856 != 0;
    float _860 = trunc(_816);
    int _862 = int(_860);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _866 = _864 != 0;
    bool _868 = !_846;
    float _870 = _868 ? _217 : as_type<float>(_842);
    bool _872 = !_850;
    float _874 = _872 ? _207 : as_type<float>(_854);
    bool _876 = !_858;
    int _878 = _876 ? 0 : 1;
    float _880 = trunc(_722);
    int _882 = int(_880);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    float _896 = _870 + 0.5;
    int _898 = abs(_878);
    int _900 = _563 + (-1);
    bool _902 = !_890;
    int _904 = _902 ? 0 : 1;
    bool _906 = !_866;
    int _908 = _906 ? 0 : 1;
    int _910 = _748 * _900;
    int _912 = _910 + _822;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    int _934 = abs(_904);
    int _936 = _838 * _898;
    int _938 = _936 + _617;
    int _940 = abs(_916);
    int _942 = _583 * _828;
    int _944 = _942 + _617;
    bool _946 = !_894;
    int _948 = _946 ? 0 : 1;
    bool _950 = !_924;
    int _952 = _950 ? 0 : 1;
    bool _954 = _583 == 0;
    int _956 = abs(_948);
    int _958 = _912 * _934;
    int _960 = ~_862;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    bool _966 = !_954;
    int _968 = _966 ? _944 : (-1);
    int _970 = _882 * _940;
    int _972 = _970 + _958;
    int _974 = _583 + (-1);
    int _976 = _968 * _964;
    int _978 = abs(_908);
    int _980 = _832 * _956;
    int _982 = _980 + _972;
    int _984 = abs(_952);
    int _986 = _862 * _974;
    int _988 = _986 + _976;
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    int _994 = _770 * _978;
    int _996 = _994 + _982;
    bool _998 = !_928;
    int _1000 = _998 ? 0 : 1;
    int _1002 = abs(_992);
    bool _1004 = !_932;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = abs(_1000);
    int _1010 = _988 * _984;
    float _1012 = float(uint(_996));
    int _1014 = abs(_1006);
    int _1016 = _804 * _1002;
    int _1018 = _1016 + _1010;
    float _1020 = as_type<float>(_613) * _1012;
    int _1022 = ~_563;
    int _1024 = _1022 + 1;
    int _1026 = _938 * _1008;
    int _1028 = _1026 + _1018;
    bool _1030 = _563 == 0;
    float _1032 = trunc(_1020);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _838 * _1014;
    int _1040 = _1038 + _1028;
    int _1042 = ~_563;
    int _1044 = _1042 + 1;
    int _1046 = ~_583;
    int _1048 = _1046 + 1;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1052 = float(uint(_1040));
    float _1054 = float(uint(_832));
    float _1056 = as_type<float>(_623) * _1052;
    float _1058 = as_type<float>(_613) * _1054;
    int _1060 = _1044 * int(_1036);
    int _1062 = _1060 + _996;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = float(uint(_1062));
    float _1076 = as_type<float>(_613) * _1074;
    float _1078 = trunc(_1058);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    int _1084 = _1048 * int(_1072);
    int _1086 = _1084 + _1040;
    float _1088 = trunc(_1076);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = _543 * 2.0;
    float _1096 = float(uint(_1086));
    float _1098 = floor(_1094);
    float _1100 = as_type<float>(_623) * _1096;
    int _1102 = ~_583;
    int _1104 = _1102 + 1;
    int _1106 = int(_1036) + int(_1092);
    float _1108 = trunc(_1100);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    int _1114 = _1024 * _1106;
    int _1116 = _1114 + _996;
    float _1118 = 1.0 / _1066;
    bool _1120 = uint(_1116) >= uint(_563);
    bool _1122 = !_1120;
    int _1124 = _1122 ? 0 : (-1);
    int _1126 = ~_1106;
    int _1128 = _1126 + _1124;
    int _1130 = _1128 + 1;
    float _1132 = _756 * 2.0;
    int _1134 = int(_1072) + int(_1112);
    float _1136 = float(uint(_938));
    int _1138 = _563 * _1130;
    int _1140 = _1138 + _996;
    float _1142 = _543 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1144 = _1104 * _1134;
    int _1146 = _1144 + _1040;
    float _1148 = floor(_1132);
    float _1150 = as_type<float>(_623) * _1136;
    bool _1152 = !_1030;
    int _1154 = _1152 ? _1140 : (-1);
    float _1156 = fma(_1142, -2.0, _1050);
    bool _1158 = uint(_1146) >= uint(_583);
    int _1160 = _1154 & 3;
    bool _1162 = _1160 != 0;
    int _1164 = _1154 & 3;
    bool _1166 = _1164 != 0;
    float _1168 = trunc(_1150);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = !_1158;
    int _1176 = _1174 ? 0 : (-1);
    int _1178 = _1162 ? 0 : 1;
    bool _1180 = uint(_1164) >= 2u;
    bool _1182 = uint(_1164) > 1u;
    int _1184 = ~_1134;
    int _1186 = _1184 + _1176;
    int _1188 = _1186 + 1;
    int _1190 = _1180 ? 0 : 1;
    bool _1192 = _1164 != 3;
    int _1194 = _583 * _1188;
    int _1196 = _1194 + _1040;
    int _1198 = ~_1178;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1206 = _1204 != 0;
    bool _1208 = !_954;
    int _1210 = _1208 ? _1196 : (-1);
    int _1212 = _1202;
    float _1214 = as_type<float>(_832);
    if (!_1182)
    {
        int _1216 = ~_1178;
        int _1218 = _1216 + 1;
        _1212 = _1218;
    }
    int _1220 = _1212;
    int _1222 = _1210 & 3;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1190;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (_1192)
    {
        int _1234 = ~_1190;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    bool _1240 = uint(_1222) > 1u;
    float _1242 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1244 = log2(_1242);
    int _1246 = _1210 & 3;
    bool _1248 = _1246 != 0;
    if (_1206)
    {
        _567 = 0;
    }
    int _1250 = _567;
    int _1252 = _1248 ? 0 : 1;
    int _1254 = _1250;
    if (!_1206)
    {
        _1254 = 2;
    }
    int _1256 = _1254;
    int _1258 = ~_1252;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    bool _1264 = _543 > 0.5;
    int _1266 = _1262;
    if (!_1240)
    {
        int _1268 = ~_1252;
        int _1270 = _1268 + 1;
        _1266 = _1270;
    }
    int _1272 = _1266;
    float _1274 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1276 = _1244 * _141;
    bool _1278 = _1222 != 3;
    bool _1280 = _1256 != 2;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -_207;
    float _1286 = _1264 ? _1284 : _207;
    float _1288 = exp2(_1276);
    bool _1290 = uint(_1222) >= 2u;
    float _1292 = -_1282;
    float _1294 = fma(_1274, 2.0, _1292);
    float _1296 = _541 * 2.0;
    float _1298 = _1290 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1300 = floor(_1296);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1304 = _1302 != 0;
    int _1306 = ~as_type<int>(_1298);
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1310;
    float _1314 = _1298;
    float _1316 = _1286;
    if (_1278)
    {
        int _1318 = ~as_type<int>(_1298);
        int _1320 = _1318 + 1;
        _1312 = _1320;
    }
    int _1322 = _1312;
    if (_1280)
    {
        _1314 = _541;
    }
    float _1324 = _1314;
    float _1326 = _1324;
    if (!_1280)
    {
        _1326 = _756;
    }
    float _1328 = _1326;
    bool _1330 = !_1304;
    int _1332 = _1330 ? 0 : 1;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1340 = _541 > 0.5;
    float _1342 = -_1288;
    float _1344 = _1342 + 1.0;
    bool _1346 = !_1336;
    float _1348 = _1346 ? _207 : _1286;
    float _1350 = -_557;
    float _1352 = fma(_1338, 2.0, _1350);
    int _1354 = ~_563;
    int _1356 = _1354 + 1;
    float _1358 = -_217;
    int _1360 = _1340 ? as_type<int>(_1358) : as_type<int>(_217);
    float _1362 = -_141;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1352);
    bool _1366 = _1300 > 0.0;
    int _1368 = _1356 * int(_1082);
    int _1370 = _1368 + _832;
    bool _1372 = _1300 >= 0.0;
    bool _1374 = isnan(_1300);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    float _1382 = fma(_648, _896, _1364);
    int _1384 = ~_583;
    int _1386 = _1384 + 1;
    if (_1280)
    {
        _1316 = _543;
    }
    float _1388 = _1316;
    float _1390 = _1388;
    if (!_1280)
    {
        _1390 = _541;
    }
    float _1392 = _1390;
    int _1394 = _1386 * int(_1172);
    int _1396 = _1394 + _938;
    float _1398 = float(uint(_1370));
    bool _1400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1408 = _1404 || _1406;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1412 = float(uint(_1396));
    float _1414 = as_type<float>(_613) * _1398;
    float _1416 = _1408 ? _1344 : 0.0;
    float _1418 = fma(_1410, -2.0, _565);
    bool _1420 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1422 = isnan(1.0);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1428 = _1424 || _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1432 = 1.0 + _1430;
    float _1434 = as_type<float>(_623) * _1412;
    float _1436 = trunc(_1414);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    float _1442 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1418);
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1446 = 1.0 / _1432;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1452 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1444);
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1456 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1448);
    float _1458 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1450);
    float _1460 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1452);
    float _1462 = trunc(_1434);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    float _1468 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1454);
    float _1470 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    float _1472 = -_141;
    float _1474 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1294);
    float _1476 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    float _1478 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1458);
    float _1480 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1468);
    int _1482 = int(_1082) + int(_1440);
    if (_1428)
    {
        float _1484 = _1416 * _1446;
        _163 = _1484;
    }
    float _1486 = _163;
    int _1488 = ~_563;
    int _1490 = _1488 + 1;
    float _1492 = in.m_46.x;
    float _1494 = in.m_46.y;
    float _1496 = in.m_46.z;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1500 = _1498 != 0;
    float _1502 = _1348 + (-0.5);
    int _1504 = ~_583;
    int _1506 = _1504 + 1;
    int _1508 = _1490 * _1482;
    int _1510 = _1508 + _832;
    int _1512 = _1380 ? 0 : 1;
    float _1514 = -_1460;
    float _1516 = _1514 + 1.0;
    bool _1518 = !_1500;
    float _1520 = _1518 ? _217 : as_type<float>(_1360);
    float _1522 = -_1502;
    float _1524 = -_1470;
    float _1526 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1524);
    bool _1528 = _1098 > 0.0;
    float _1530 = -_1476;
    float _1532 = _1530 + 1.0;
    bool _1534 = _1098 >= 0.0;
    bool _1536 = isnan(_1098);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    float _1544 = -_1478;
    float _1546 = _1544 + 1.0;
    int _1548 = int(_1172) + int(_1466);
    int _1550 = ~_1512;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    int _1556 = _1554;
    if (!_1366)
    {
        int _1558 = ~_1512;
        int _1560 = _1558 + 1;
        _1556 = _1560;
    }
    int _1562 = _1556;
    bool _1564 = uint(_1510) >= uint(_563);
    int _1566 = _1506 * _1548;
    int _1568 = _1566 + _938;
    float _1570 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1572 = _1542 ? 0 : 1;
    float _1574 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1576 = !_1564;
    int _1578 = _1576 ? 0 : (-1);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1580;
    bool _1584 = uint(_1568) >= uint(_583);
    float _1586 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1570);
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1590 = _1588 != 0;
    float _1592 = _1582 * _1118;
    bool _1594 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1596 = isnan(_535);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1574);
    int _1608 = ~_1572;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    int _1614 = _1612;
    if (!_1528)
    {
        int _1616 = ~_1572;
        int _1618 = _1616 + 1;
        _1614 = _1618;
    }
    int _1620 = _1614;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1624 = _535 + _1622;
    bool _1626 = !_1584;
    int _1628 = _1626 ? 0 : (-1);
    float _1630 = -_1604;
    float _1632 = _1630 + 1.0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1644 = _1642 != 0;
    float _1646 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1648 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1650 = isnan(_535);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    bool _1660 = !_1166;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1646);
    float _1666 = fma(_1592, _1624, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1668 = _1658 * _1632;
    float _1670 = _1520 + 0.5;
    float _1672 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1664);
    bool _1674 = _1148 >= 0.0;
    bool _1676 = isnan(_1148);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.0);
    bool _1682 = _1678 || _1680;
    float _1684 = _1666 * _1668;
    float _1686 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1474);
    float _1688 = -_1658;
    float _1690 = _1688 + 1.0;
    int _1692 = _1682 ? 0 : 1;
    bool _1694 = _1148 > 0.0;
    float _1696 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1684);
    float _1698 = -_1516;
    float _1700 = fma(_1520, _1698, _1686);
    float _1702 = fma(_1348, _1532, _1526);
    float _1704 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1586);
    float _1706 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1696);
    float _1708 = _1672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1710 = _1154 >> 31;
    float _1712 = _543 + _541;
    int _1714 = _1210 >> 31;
    float _1716 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1606);
    float _1718 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1722 = _1708 + _1720;
    int _1724 = _1710 & 3;
    float _1726 = _1712 + (-1.0);
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1730 = _1714 & 3;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1734 = _1718 + _1732;
    float _1736 = _1722 * _1722;
    int _1738 = _1154 + _1724;
    out.m_66.x = _1700;
    out.m_66.y = _1702;
    float _1740 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1744 = _1728 + _1742;
    float _1746 = fma(_1734, _1734, _1736);
    int _1748 = _1738 >> 2;
    float _1750 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1752 = !_1224;
    int _1754 = _1752 ? 0 : 1;
    float _1756 = fma(_1744, _1744, _1746);
    int _1758 = _1748 << 4;
    int _1760 = _1758 + 368;
    float _1762 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1750);
    int _1764 = _1210 + _1730;
    float _1766 = _547 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1768 = _1164 != 3;
    float _1770 = rsqrt(_1756);
    int _1772 = _1764 >> 2;
    float _1774 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1762);
    int _1776 = ~_1692;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    float _1782 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1784 = _1772 << 4;
    int _1786 = _1784 + 512;
    uint _1788 = uint(int(uint(_1760) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = _1780;
    float _1806 = _1728;
    if (!_1694)
    {
        int _1808 = ~_1692;
        int _1810 = _1808 + 1;
        _1804 = _1810;
    }
    int _1812 = _1804;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1816 = !_1768;
    int _1818 = _1816 ? 0 : (-1);
    out.m_68.w = _1782;
    bool _1820 = _1222 != 3;
    int _1822 = abs(_1238);
    uint _1824 = uint(int(uint(_1786) >> uint(2)));
    uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
    int _1828 = int(_1824) & 3;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[int(_1826)][_1828];
    int _1832 = int(_1824) + 1;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    int _1836 = _1832 & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    bool _1840 = !_1820;
    int _1842 = _1840 ? 0 : (-1);
    bool _1844 = _1774 >= 0.0;
    float _1846 = _1766 * _1770;
    int _1848 = abs(_1322);
    int _1850 = abs(_1332);
    int _1852 = _1760 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    float _1870 = _1722 * _1846;
    float _1872 = _1734 * _1846;
    float _1874 = _1744 * _1846;
    float _1876 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1878 = -_1870;
    float _1880 = _1722 + _1878;
    float _1882 = -_1872;
    float _1884 = _1734 + _1882;
    float _1886 = -_1874;
    float _1888 = _1744 + _1886;
    int _1890 = _1786 + 8;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    float _1908 = _1880 * _1880;
    float _1910 = _874 + (-0.5);
    bool _1912 = !_1636;
    int _1914 = _1912 ? 0 : 1;
    float _1916 = _1872;
    if (_1844)
    {
        out.m_49.x = 0.0;
    }
    float _1918 = fma(_1884, _1884, _1908);
    float _1920 = -_1876;
    float _1922 = -_1442;
    float _1924 = fma(_1920, _1910, _1922);
    int _1926 = abs(_1272);
    float _1928 = -_1546;
    float _1930 = fma(_870, _1928, _1382);
    float _1932 = fma(_1888, _1888, _1918);
    int _1934 = abs(_1220);
    float _1936 = _541 + (-0.5);
    int _1938 = abs(_1662);
    int _1940 = ~_1934;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    int _1946 = ~_1926;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = ~_1938;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = abs(_1754);
    int _1960 = ~_1482;
    int _1962 = _1960 + _1578;
    int _1964 = _1962 + 1;
    int _1966 = _1944 * as_type<int>(_1802);
    int _1968 = ~_1822;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = ~_1548;
    int _1976 = _1974 + _1628;
    int _1978 = _1976 + 1;
    int _1980 = _1956 * as_type<int>(_1794);
    int _1982 = _1980 + _1966;
    int _1984 = abs(_1818);
    int _1986 = _563 * _1964;
    int _1988 = _1986 + _832;
    int _1990 = abs(_1914);
    int _1992 = _1950 * as_type<int>(_1838);
    int _1994 = ~_1958;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = _583 * _1978;
    int _2002 = _2000 + _938;
    bool _2004 = _563 == 0;
    float _2006 = float(_1812);
    int _2008 = _1998 * as_type<int>(_1830);
    int _2010 = _2008 + _1992;
    int _2012 = _1972 * as_type<int>(_1860);
    int _2014 = _2012 + _1982;
    bool _2016 = !_1590;
    int _2018 = _2016 ? 0 : 1;
    int _2020 = abs(_1842);
    int _2022 = abs(_2018);
    int _2024 = ~_1984;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_1848;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = ~_2020;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2028 * as_type<int>(_1868);
    int _2044 = _2042 + _2014;
    float _2046 = float(_1990);
    int _2048 = _2034 * as_type<int>(_1898);
    int _2050 = _2048 + _2010;
    float _2052 = in.m_70.x;
    float _2054 = in.m_70.y;
    float _2056 = in.m_70.z;
    int _2058 = _2040 * as_type<int>(_1906);
    int _2060 = _2058 + _2050;
    float _2062 = sqrt(_1932);
    int _2064 = ~_1850;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = -_1480;
    float _2072 = _2070 + 1.0;
    int _2074 = ~_2022;
    int _2076 = _2074 + 1;
    int _2078 = _2076 + 1;
    float _2080 = _2046 * _2006;
    bool _2082 = !_2004;
    int _2084 = _2082 ? _1988 : (-1);
    int _2086 = _2044 * _2068;
    bool _2088 = !_954;
    int _2090 = _2088 ? _2002 : (-1);
    int _2092 = _2060 * _2078;
    float _2094 = fma(_874, _2072, _1924);
    int _2096 = _2084 * _1850;
    int _2098 = _2096 + _2086;
    if (_1844)
    {
        _1214 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2100 = _1214;
    float _2102 = _2080 * (-2.0);
    int _2104 = _2090 * _2022;
    int _2106 = _2104 + _2092;
    bool _2108 = !_1640;
    int _2110 = _2108 ? 0 : 1;
    out.m_72.x = _1930;
    out.m_72.y = _2094;
    float _2112 = _1770 * _2062;
    int _2114 = as_type<int>(_2100);
    if (_1844)
    {
        float _2116 = _2100 * 5.0;
        _2114 = as_type<int>(_2116);
    }
    int _2118 = _2114;
    float _2120 = float(_2098);
    float _2122 = fma(_2102, _2052, _2052);
    float _2124 = float(_2106);
    float _2126 = _547 * _2112;
    if (_1844)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6724 = as_type<float>(_2118);
        out.gl_Position.z = _6724;
    }
    float _2128 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2122);
    float _2130 = _543 + _756;
    float _2132 = float(_1562);
    out.m_74.x = _2120;
    out.m_74.y = _2124;
    float _2134 = fma(_1740, _2102, _1740);
    float _2136 = _2130 + (-1.0);
    out.m_76.x = _2126;
    bool _2138 = !_1644;
    int _2140 = _2138 ? 0 : 1;
    int _2142 = abs(_2110);
    if (_1844)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2144 = -_1870;
    float _2146 = _1708 + _2144;
    int _2148 = abs(_2140);
    float _2150 = -_1872;
    float _2152 = _1718 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2146 + _2154;
    float _2158 = -_1874;
    float _2160 = _1728 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2164 = _2152 + _2162;
    float _2166 = float(_2142);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2172 = _2160 + _2170;
    float _2174 = float(_1620);
    float _2176 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2168);
    float _2180 = _2166 * _2132;
    float _2182 = float(_2148);
    float _2184 = _543 + (-0.5);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2178);
    float _2188 = _2180 * (-2.0);
    float _2190 = _756 + _541;
    float _2192 = _2182 * _2174;
    float _2194 = fma(_2134, _1486, _2128);
    bool _2196 = _2186 >= 0.0;
    float _2198 = fma(_2188, _2054, _2054);
    float _2200 = fma(_2176, _2188, _2176);
    float _2202 = _2190 + (-1.0);
    float _2204 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2198);
    float _2206 = _2192 * (-2.0);
    float _2208 = _2194 * 0.15915493667125701904296875;
    float _2210 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2212 = fma(_2200, _1486, _2204);
    float _2214 = fma(_2206, _2056, _2056);
    float _2216 = _756 + (-0.5);
    float _2218 = _2208 * 6.283185482025146484375;
    float _2220 = sin(_2218);
    float _2222 = _2212 * 0.15915493667125701904296875;
    float _2224 = _2176;
    float _2226 = _2164;
    float _2228 = _2172;
    if (_2196)
    {
        _2224 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2230 = _2224;
    float _2232 = fma(_2210, _2206, _2210);
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2214);
    int _2236 = as_type<int>(_2230);
    if (_2196)
    {
        out.m_49.x = 0.0;
    }
    if (_2196)
    {
        float _2238 = _2230 * 5.0;
        _2236 = as_type<int>(_2238);
    }
    int _2240 = _2236;
    float _2242 = _2208 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = fma(_2232, _1486, _2234);
    if (_2196)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6927 = as_type<float>(_2240);
        out.gl_Position.z = _6927;
    }
    float _2248 = _2246 * 0.15915493667125701904296875;
    float _2250 = _2222 * 6.283185482025146484375;
    float _2252 = sin(_2250);
    float _2254 = _2222 * 6.283185482025146484375;
    float _2256 = cos(_2254);
    if (_2196)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2258 = _2248 * 6.283185482025146484375;
    float _2260 = cos(_2258);
    float _2262 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2266 = _2220 * _2252;
    float _2268 = _2244 * _2256;
    float _2270 = _2262 * _2112;
    float _2272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2274 = _2220 * _2256;
    float _2276 = _2248 * 6.283185482025146484375;
    float _2278 = sin(_2276);
    float _2280 = _2270 * _2264;
    float _2282 = _2244 * _2252;
    float _2284 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2286 = _2284 * 0.5;
    float _2288 = _2244 * _2260;
    float _2290 = _2256 * _2260;
    float _2292 = _2220 * _2260;
    float _2294 = _2252 * _2260;
    float _2296 = _2126 * _2272;
    float _2298 = _2288 * _2280;
    float _2300 = fma(_2278, _2268, _2266);
    float _2302 = -_2274;
    float _2304 = fma(_2278, _2282, _2302);
    float _2306 = -_2280;
    float _2308 = _2278 * _2306;
    float _2310 = -_2282;
    float _2312 = fma(_2278, _2274, _2310);
    float _2314 = fma(_2300, _2296, _2298);
    float _2316 = _2292 * _2280;
    float _2318 = fma(_2290, _2296, _2308);
    float _2320 = fma(_2304, _2286, _2314);
    float _2322 = fma(_2278, _2266, _2268);
    float _2324 = fma(_2312, _2296, _2316);
    float _2326 = fma(_2294, _2286, _2318);
    float _2328 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2330 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2332 = fma(_2322, _2286, _2324);
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2328);
    float _2336 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2330);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2342 = _2338 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2344 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2346 = _1728 + _2342;
    float _2348 = _1718 + _2344;
    float _2350 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2346 + _2354;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2360 = _2348 + _2358;
    float _2362 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2364 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2352);
    float _2366 = _2356 * _2356;
    float _2368 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2370 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2364);
    float _2372 = fma(_2360, _2360, _2366);
    float _2374 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2376 = sqrt(_2372);
    float _2378 = _1708 + _2374;
    bool _2380 = _2376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2368;
    float _2384 = _2374;
    float _2386 = _2352;
    float _2388 = _2296;
    if (!_2380)
    {
        _2382 = _2348;
    }
    float _2390 = _2382;
    float _2392 = _2390;
    if (!_2380)
    {
        _2384 = _2346;
    }
    float _2394 = _2384;
    float _2396 = _2394;
    if (!_2380)
    {
        _2386 = _2378;
    }
    float _2398 = _2386;
    bool _2400 = !_2380;
    float _2402 = _2398;
    if (!_2400)
    {
        float _2404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2408 = _2376 + _2406;
        float _2410 = rsqrt(_2372);
        float _2412 = _2408 * _2404;
        float _2414 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = _2412 * 0.15915493667125701904296875;
        float _2418 = _2416 * 6.283185482025146484375;
        float _2420 = cos(_2418);
        float _2422 = _2416 * 6.283185482025146484375;
        float _2424 = sin(_2422);
        float _2426 = _2420 + (-1.0);
        float _2428 = fma(_2424, _2414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2432 = _2410 * _2428;
        float _2434 = fma(_2378, _2420, _2430);
        float _2436 = fma(_2360, _2432, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2438 = fma(_2356, _2432, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2402 = _2434;
        _2392 = _2436;
        _2396 = _2438;
        _2388 = _2416;
    }
    float _2440 = _2402;
    float _2442 = _2392;
    float _2444 = _2396;
    float _2446 = _2388;
    float _2448 = -_1708;
    float _2450 = _2448 + _2440;
    float _2452 = -_1718;
    float _2454 = _2452 + _2442;
    float _2456 = -_1728;
    float _2458 = _2456 + _2444;
    float _2460 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2462 = _2450 * _2450;
    float _2464 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2466 = 1.0 / _2460;
    float _2468 = fma(_2454, _2454, _2462);
    float _2470 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2464);
    bool _2472 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2474 = isnan(0.5);
    bool _2476 = _2472 || _2474;
    bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2480 = _2476 || _2478;
    float _2482 = fma(_2458, _2458, _2468);
    float _2484 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2470);
    bool _2486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2488 = isnan(0.5);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2494 = _2490 || _2492;
    float _2496 = sqrt(_2482);
    float _2498 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2500 = _2498 + _2460;
    float _2502 = _2500 * _2466;
    float _2504 = _2502 * 0.5;
    bool _2506 = _2496 > 0.0;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2510 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2508);
    float _2512 = 1.0 / _2510;
    float _2514 = _2504;
    float _2516 = _2466;
    float _2518 = _2446;
    if (!_2506)
    {
        _2514 = _2442;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2506)
    {
        _2516 = _2440;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (!_2506)
    {
        _2518 = _2444;
    }
    float _2528 = _2518;
    bool _2530 = !_2506;
    float _2532 = _2528;
    float _2534 = _2528;
    if (!_2530)
    {
        float _2536 = _211 * _211;
        float _2538 = fma(_209, _209, _2536);
        float _2540 = rsqrt(_2482);
        float _2542 = fma(_213, _213, _2538);
        float _2544 = sqrt(_2542);
        float _2546 = _2454 * _2540;
        float _2548 = _2450 * _2540;
        float _2550 = _2458 * _2540;
        bool _2552 = _2544 > 0.0;
        float _2554 = _2540;
        float _2556 = _2544;
        if (!_2552)
        {
            _2554 = _2442;
        }
        float _2558 = _2554;
        _2522 = _2558;
        if (!_2552)
        {
            _2556 = _2440;
        }
        float _2560 = _2556;
        _2526 = _2560;
        if (!_2552)
        {
            _2532 = _2444;
        }
        float _2562 = _2532;
        bool _2564 = !_2552;
        _2534 = _2562;
        if (!_2564)
        {
            float _2566 = rsqrt(_2542);
            float _2568 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2570 = _211 * _2566;
            float _2572 = _209 * _2566;
            float _2574 = _2548 * _2570;
            float _2576 = _213 * _2566;
            float _2578 = fma(_2546, _2572, _2574);
            float _2580 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2582 = fma(_2550, _2576, _2578);
            float _2584 = _2582 * _2580;
            float _2586 = fma(_209, _2584, _2442);
            float _2588 = fma(_211, _2584, _2440);
            float _2590 = fma(_213, _2584, _2444);
            _2522 = _2586;
            _2526 = _2588;
            _2534 = _2590;
        }
    }
    float _2592 = _2522;
    float _2594 = _2526;
    float _2596 = _2534;
    float _2598 = -_1872;
    float _2600 = _2598 + _2592;
    float _2602 = -_1870;
    float _2604 = _2602 + _2594;
    float _2606 = -_1874;
    float _2608 = _2606 + _2596;
    float _2610 = _2604;
    float _2612 = _2600;
    float _2614 = _2608;
    if (_2494)
    {
        _221 = 1.0;
    }
    float _2616 = _221;
    float _2618 = _2616;
    if (!_2480)
    {
        float _2620 = _2156 * _2156;
        float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2624 = -_1728;
        float _2626 = _2624 + _2596;
        float _2628 = -_1708;
        float _2630 = _2628 + _2594;
        float _2632 = fma(_2164, _2164, _2620);
        float _2634 = fma(_2172, _2172, _2632);
        float _2636 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2638 = sqrt(_2634);
        float _2640 = 1.0 / _2112;
        float _2642 = precise::min(_2638, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2644 = _2642 * _2622;
        float _2646 = _2636 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2648 = -_1718;
        float _2650 = _2648 + _2592;
        float _2652 = _2644 * _2640;
        float _2654 = _2646 * _2652;
        float _2656 = _2626 * _2652;
        float _2658 = fma(_2630, _2654, _2146);
        float _2660 = fma(_2650, _2654, _2152);
        float _2662 = fma(_2646, _2656, _2160);
        _2610 = _2658;
        _2612 = _2660;
        _2614 = _2662;
        _2226 = _2638;
        _1806 = _2656;
    }
    float _2664 = _2610;
    float _2666 = _2612;
    float _2668 = _2614;
    float _2670 = _2226;
    float _2672 = _1806;
    float _2674 = _2670;
    float _2676 = _2672;
    if (_2494)
    {
        _1916 = 1.0;
    }
    float _2678 = _1916;
    float _2680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2682 = _2512 * _2680;
    float _2684 = _2678;
    if (!_2494)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2694 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2692;
        float _2696 = _2688 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = _2690 * 0.15915493667125701904296875;
        float _2702 = _2688 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = 1.0 / _2698;
        float _2708 = _2700 * 6.283185482025146484375;
        float _2710 = cos(_2708);
        float _2712 = _2704 * _2706;
        float _2714 = _2700 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2710 * _2712;
        float _2720 = 1.0 / _2694;
        float _2722 = 1.0 / _2718;
        float _2724 = _2716 * _2722;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2728 = fma(_2682, _2724, _2726);
        float _2730 = _2728 * _2720;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        _2228 = _2700;
        _2674 = _2712;
        _2618 = _2732;
    }
    float _2734 = _2228;
    float _2736 = _2674;
    float _2738 = _2618;
    float _2740 = _2734;
    float _2742 = _2736;
    if (!_2494)
    {
        float _2744 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2746 = _2744 * 0.15915493667125701904296875;
        float _2748 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2750 = _2746 * 6.283185482025146484375;
        float _2752 = cos(_2750);
        float _2754 = _2748 * 0.15915493667125701904296875;
        float _2756 = _2746 * 6.283185482025146484375;
        float _2758 = sin(_2756);
        float _2760 = 1.0 / _2752;
        float _2762 = _2754 * 6.283185482025146484375;
        float _2764 = cos(_2762);
        float _2766 = _2758 * _2760;
        float _2768 = _2754 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = _2764 * _2766;
        float _2774 = 1.0 / _2772;
        float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2778 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2776;
        float _2780 = 1.0 / _2778;
        float _2782 = _2770 * _2774;
        float _2784 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2786 = fma(_2682, _2782, _2784);
        float _2788 = _2786 * _2780;
        float _2790 = precise::clamp(_2788, 0.0, 1.0);
        float _2792 = -_2790;
        float _2794 = _2792 + 1.0;
        _2740 = _2760;
        _2742 = _2772;
        _2684 = _2794;
    }
    float _2796 = _2740;
    float _2798 = _2742;
    float _2800 = _2684;
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2804 = _2664 + _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2808 = _2666 + _2806;
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2812 = _2668 + _2810;
    float _2814 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2816 = _2804 * _2804;
    float _2818 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2814);
    float _2820 = fma(_2808, _2808, _2816);
    float _2822 = fma(_2812, _2812, _2820);
    float _2824 = rsqrt(_2822);
    float _2826 = sqrt(_2822);
    float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2830 = _2808 * _2828;
    float _2832 = _2812 * _2828;
    float _2834 = _2830 * _2830;
    float _2836 = _2832 * _2832;
    float _2838 = _2834 + _2836;
    float _2840 = sqrt(_2838);
    bool _2842 = _2840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2846 = _2840 + _2844;
    float _2848 = _2796;
    float _2850 = _2838;
    float _2852 = _2846;
    float _2854 = _2798;
    float _2856 = _2804;
    if (_2842)
    {
        float _2858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2848 = _2858;
    }
    float _2860 = _2848;
    if (_2842)
    {
        float _2862 = rsqrt(_2838);
        _2850 = _2862;
    }
    float _2864 = _2850;
    float _2866 = _2864;
    if (_2842)
    {
        float _2868 = _2846 * _2860;
        _2852 = _2868;
    }
    float _2870 = _2852;
    if (_2842)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2854 = _2872;
    }
    float _2874 = _2854;
    float _2876 = _2812;
    float _2878 = _2874;
    if (_2842)
    {
        float _2880 = _2874 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        _2876 = _2882;
    }
    float _2884 = _2876;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2888 = precise::max(0.0, _2886);
    float _2890 = _2860;
    if (_2842)
    {
        float _2892 = _2874 * 6.283185482025146484375;
        float _2894 = cos(_2892);
        _2890 = _2894;
    }
    float _2896 = _2890;
    float _2898 = -_2828;
    float _2900 = -_2888;
    float _2902 = fma(_2804, _2898, _2900);
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2842)
    {
        float _2906 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2856 = _2906;
    }
    float _2908 = _2856;
    float _2910 = _2908;
    if (!_2842)
    {
        _2878 = _2830;
    }
    float _2912 = _2878;
    float _2914 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2916 = _2884;
    float _2918 = _2912;
    if (_2842)
    {
        float _2920 = fma(_2884, _2908, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2916 = _2920;
    }
    float _2922 = _2916;
    float _2924 = _2922;
    if (!_2842)
    {
        _2910 = _2902;
    }
    float _2926 = _2910;
    float _2928 = _2926;
    float _2930 = _2896;
    if (_2842)
    {
        float _2932 = _2896 + (-1.0);
        _2904 = _2932;
    }
    float _2934 = _2904;
    float _2936 = _2934;
    if (_2842)
    {
        float _2938 = _2864 * _2922;
        _2676 = _2938;
    }
    float _2940 = _2676;
    if (!_2842)
    {
        _2866 = _2832;
    }
    float _2942 = _2866;
    float _2944 = _2942;
    if (_2842)
    {
        float _2946 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _2946;
    }
    float _2948 = _2936;
    if (_2842)
    {
        float _2950 = _2830 * _2940;
        _2918 = _2950;
    }
    float _2952 = _2918;
    if (!_2842)
    {
        _2924 = _2834;
    }
    float _2954 = _2924;
    float _2956 = _2954;
    if (_2842)
    {
        float _2958 = _2832 * _2940;
        _2944 = _2958;
    }
    float _2960 = _2944;
    if (_2842)
    {
        float _2962 = fma(_2902, _2896, _2948);
        _2928 = _2962;
    }
    float _2964 = _2928;
    if (_2842)
    {
        float _2966 = _2952 * _2952;
        _2956 = _2966;
    }
    float _2968 = _2956;
    if (!_2842)
    {
        _2930 = _2836;
    }
    float _2970 = _2930;
    float _2972 = _2970;
    if (_2842)
    {
        float _2974 = _2960 * _2960;
        _2972 = _2974;
    }
    float _2976 = _2972;
    float _2978 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2980 = fma(_2964, _2964, _2968);
    float _2982 = floor(_2914);
    float _2984 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2978);
    float _2986 = _2980 + _2976;
    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2990 = fma(_2826, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2988);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2984);
    float _2996 = rsqrt(_2986);
    float _2998 = -_2992;
    float _3000 = _2998 + 1.0;
    float _3002 = _2994 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3004 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3006 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3010 = abs(_3000);
    float _3012 = log2(_3010);
    float _3014 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3018 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3006);
    float _3020 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = -_3016;
    float _3024 = fma(_3022, _3008, 1.0);
    float _3026 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3018);
    float _3028 = _2996 * _2952;
    float _3030 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3032 = _2996 * _2964;
    float _3034 = _2996 * _2960;
    float _3036 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3038 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3040 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3042 = floor(_3004);
    float _3044 = -_3036;
    float _3046 = fma(_3032, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3044);
    float _3048 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3050 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3052 = -_3034;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3046);
    float _3056 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2818);
    float _3058 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3048);
    float _3060 = exp2(_3050);
    float _3062 = fma(_3054, -0.5, 0.5);
    float _3064 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3066 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3058);
    float _3068 = fma(_3054, 0.5, 0.5);
    float _3070 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3072 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3066);
    float _3074 = log2(_3024);
    float _3076 = -_3042;
    float _3078 = _3004 + _3076;
    float _3080 = fma(_3068, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3082 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3070);
    float _3084 = fma(_3068, _3080, -0.212114393711090087890625);
    float _3086 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3082);
    float _3088 = 1.0 / _3072;
    float _3090 = -_2982;
    float _3092 = _2914 + _3090;
    float _3094 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3096 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3094);
    float _3098 = _3032 + 1.0;
    float _3100 = sqrt(_3062);
    float _3102 = _3074 * 0.693147182464599609375;
    float _3104 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3096);
    float _3106 = -_3032;
    float _3108 = fma(_3060, _3098, _3106);
    float _3110 = fma(_3068, _3084, 1.570728778839111328125);
    float2 _8280 = float2(_3092, _3078);
    float _3112 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8280, float2(0.0), isnan(_8280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8280, float2(0.0), isnan(_8280)), level(0.0)).x;
    float _3114 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3104);
    float _3116 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3086);
    float _3118 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3120 = fma(_3108, 0.5, 0.5);
    float _3122 = _3114 * _3088;
    float _3124 = _3116 * _3088;
    float _3126 = fma(_3122, 0.5, 0.5);
    float _3128 = fma(_3124, -0.5, 0.5);
    float _3130 = _3100 * 0.636619746685028076171875;
    float _3132 = -_3110;
    float _3134 = fma(_3130, _3132, 1.0);
    float3 _8325 = float3(_3126, _3128, _3118);
    float _3136 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8325, float3(0.0), isnan(_8325)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8325, float3(0.0), isnan(_8325)), level(0.0)).x;
    float3 _8336 = float3(_3126, _3128, _3118);
    float4 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8336, float3(0.0), isnan(_8336)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8336, float3(0.0), isnan(_8336)), level(0.0)).xyzw;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = _3139.w;
    float2 _8352 = float2(_3134, _3120);
    float3 _3151 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8352, float2(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8352, float2(0.0), isnan(_8352)), level(0.0)).xyz;
    float _3153 = _3151.x;
    float _3155 = _3151.y;
    float _3157 = _3151.z;
    float _3159 = abs(_2682);
    float _3161 = log2(_3159);
    float _3163 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3165 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3167 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3169 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3171 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3163);
    float _3173 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3165);
    float _3175 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3167);
    float _3177 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3179 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3181 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3183 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3185 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3187 = -_2278;
    float _3189 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3169);
    float _3191 = -_2278;
    float _3193 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3179);
    float _3195 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3197 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3199 = -_2278;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3177);
    float _3203 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3181);
    float _3205 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3183);
    float _3207 = exp2(_3197);
    float _3209 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3185);
    float _3211 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3213 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3203);
    float _3215 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3205);
    float _3217 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3209);
    float _3219 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3171);
    float _3221 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3189);
    float _3223 = fma(_3195, _3195, 1.0);
    float _3225 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3227 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3229 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3231 = rsqrt(_3223);
    float _3233 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3173);
    float _3235 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3237 = fma(_3207, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3175);
    float _3243 = _3195 * _3221;
    float _3245 = _3239 * _3239;
    float _3247 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3229);
    float _3249 = fma(_3239, -2.0, 3.0);
    float _3251 = _3195 * _3211;
    float _3253 = exp2(_3235);
    float _3255 = fma(_3225, _3233, _3243);
    float _3257 = _3245 * _3249;
    float _3259 = fma(_3225, _3219, _3251);
    float _3261 = _3195 * _3227;
    float _3263 = _3195 * _3231;
    float _3265 = -_3257;
    float _3267 = _3265 + 1.0;
    out.m_78.x = _3219;
    out.m_78.y = _3233;
    out.m_78.z = _3241;
    float _3269 = fma(_3225, _3241, _3261);
    float _3271 = -_3213;
    float _3273 = _3263 * _3271;
    float _3275 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3257);
    float _3277 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3247);
    float _3279 = in.m_80.x;
    float _3281 = fma(_3231, _3211, _3273);
    float _3283 = _3213 + _3259;
    float _3285 = _3215 + _3255;
    float _3287 = -_3253;
    float _3289 = _3287 + 1.0;
    out.m_82.x = _2666;
    out.m_82.y = _2664;
    out.m_82.z = _2668;
    bool _3291 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3293 = isnan(_2826);
    bool _3295 = _3291 || _3293;
    bool _3297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3299 = _3295 || _3297;
    float _3301 = -_3215;
    float _3303 = _3263 * _3301;
    float _3305 = -_3217;
    float _3307 = _3263 * _3305;
    float _3309 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3311 = fma(_3231, _3221, _3303);
    bool _3313 = _2682 <= 8000.0;
    bool _3315 = isnan(_2682);
    bool _3317 = _3313 || _3315;
    bool _3319 = isnan(8000.0);
    bool _3321 = _3317 || _3319;
    float _3323 = float(_3321);
    float _3325 = fma(_3231, _3227, _3307);
    float _3327 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3277);
    float _3329 = _3072 * 0.5;
    float _3331 = _3114 + _3072;
    float _3333 = _3323 * _3275;
    out.m_84.x = _3281;
    out.m_84.y = _3311;
    out.m_84.z = _3325;
    float _3335 = _3327 + _3072;
    float _3337 = fma(_3116, -0.5, _3329);
    float _3339 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3114;
    out.gl_Position.y = _3116;
    out.gl_Position.z = _3327;
    out.gl_Position.w = _3072;
    float _3341 = _3335 * 0.5;
    float _3343 = _3217 + _3269;
    float _3345 = _3331 * 0.5;
    out.m_86.x = _3283;
    out.m_86.y = _3285;
    out.m_86.z = _3343;
    float _3347 = _3215;
    float _3349 = _3325;
    float _3351 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3299)
    {
        _3347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3353 = _3347;
    float _3355 = _3353;
    float _3357 = _3353;
    if (!_3299)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3359 = _3349;
    out.m_88.z = _3341;
    out.m_88.w = _3072;
    out.m_90.x = _3345;
    out.m_90.y = _3337;
    out.m_90.z = _3341;
    out.m_90.w = _3072;
    float _3361 = -_3112;
    float _3363 = _3361 + 1.0;
    float _3365 = _3363 * _3339;
    float _3367 = precise::clamp(_3365, 0.0, 1.0);
    float _3369 = -_3367;
    float _3371 = fma(_3369, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3373 = _3143;
    float _3375 = _3359;
    float _3377 = _3359;
    if (!_3299)
    {
        _3351 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3379 = _3351;
    float _3381 = _3371 * _3279;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3385 = _3309 * _3136;
    float _3387 = -_3309;
    float _3389 = _3387 + 1.0;
    float _3391 = _3147 * _3385;
    float _3393 = _3157 * _3385;
    float _3395 = _3147 * _3389;
    out.m_92.x = _3383;
    float _3397 = fma(_3153, _3391, _3141);
    float _3399 = fma(_3155, _3391, _3143);
    float _3401 = fma(_3147, _3393, _3145);
    float _3403 = _2738 * _2800;
    float _3405 = _3385;
    float _3407 = _3403;
    float _3409 = _3379;
    float _3411 = _3379;
    if (!_3299)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3413 = _3405;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3299)
    {
        _3373 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3419 = _3373;
    out.m_94.x = _3397;
    out.m_94.y = _3399;
    out.m_94.z = _3401;
    out.m_94.w = _3395;
    float _3421 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3423 = _3419;
    float _3425 = _3419;
    if (!_3299)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3427 = _3407;
    bool _3429 = !_3299;
    float _3431 = _3427;
    float _3433 = _3427;
    if (!_3429)
    {
        bool _3435 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3437 = isnan(_2826);
        bool _3439 = _3435 || _3437;
        bool _3441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3443 = _3439 || _3441;
        if (!_3443)
        {
            float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3447 = _2826 + _3445;
            float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3451 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3449;
            float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3457 = 1.0 / _3451;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3475 = _3447 * _3457;
            float _3477 = precise::clamp(_3475, 0.0, 1.0);
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3483 = fma(_3477, _3455, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3485 = fma(_3477, _3481, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3487 = fma(_3477, _3461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3489 = fma(_3477, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3491 = fma(_3477, _3469, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3493 = fma(_3477, _3473, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3377 = _3487;
            _3425 = _3491;
            _3357 = _3483;
            _3417 = _3489;
            _3411 = _3485;
            _3433 = _3493;
            _3495 = true;
        }
        else
        {
            bool _3497 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3499 = isnan(_2826);
            bool _3501 = _3497 || _3499;
            bool _3503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3505 = _3501 || _3503;
            if (!_3505)
            {
                _3355 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3507 = _3355;
            _3357 = _3507;
            if (!_3505)
            {
                _3375 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3509 = _3375;
            _3377 = _3509;
            if (!_3505)
            {
                _3409 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3511 = _3409;
            _3411 = _3511;
            if (!_3505)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3513 = _3415;
            _3417 = _3513;
            if (!_3505)
            {
                _3423 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3515 = _3423;
            _3425 = _3515;
            if (!_3505)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3517 = _3431;
            bool _3519 = !_3505;
            _3433 = _3517;
            if (!_3519)
            {
                bool _3521 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3523 = isnan(_2826);
                bool _3525 = _3521 || _3523;
                bool _3527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3529 = _3525 || _3527;
                if (!_3529)
                {
                    float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3533 = _2826 + _3531;
                    float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3537 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3535;
                    float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3541 = _3539 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3543 = 1.0 / _3537;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3561 = _3533 * _3543;
                    float _3563 = precise::clamp(_3561, 0.0, 1.0);
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3569 = fma(_3563, _3541, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3571 = fma(_3563, _3567, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3573 = fma(_3563, _3547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3575 = fma(_3563, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3577 = fma(_3563, _3555, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3579 = fma(_3563, _3559, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3377 = _3573;
                    _3425 = _3577;
                    _3357 = _3569;
                    _3417 = _3575;
                    _3411 = _3571;
                    _3433 = _3579;
                    _3495 = true;
                }
                else
                {
                    _3377 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3425 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3357 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3411 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3495 = false;
    float _3581 = _3377;
    float _3583 = _3425;
    float _3585 = _3357;
    float _3587 = _3417;
    float _3589 = _3411;
    float _3591 = _3433;
    float _3593 = fma(_3285, -0.5, 0.5);
    float _3595 = precise::clamp(_3593, 0.0, 1.0);
    float _3597 = -_3581;
    float _3599 = _3597 + _3583;
    float _3601 = _3421 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3603 = -_3585;
    float _3605 = _3603 + _3587;
    float _3607 = fma(_3595, _3599, _3581);
    out.m_96.x = 0.0;
    float _3609 = -_3589;
    float _3611 = _3609 + _3591;
    float _3613 = fma(_3595, _3605, _3585);
    float _3615 = _3607 * 0.586610972881317138671875;
    out.m_49.x = _3601;
    bool _3617 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3619 = fma(_3595, _3611, _3589);
    float _3621 = fma(_3613, 0.298911988735198974609375, _3615);
    bool _3623 = _2738 > 0.0;
    bool _3625 = isnan(_2738);
    bool _3627 = _3623 || _3625;
    bool _3629 = isnan(0.0);
    bool _3631 = _3627 || _3629;
    float _3633 = fma(_3619, 0.114477999508380889892578125, _3621);
    bool _3635 = _2800 <= 0.0;
    bool _3637 = !_3631;
    bool _3639 = _3635 || _3637;
    float _3641 = -_3633;
    float _3643 = _3607 + _3641;
    float _3645 = -_3633;
    float _3647 = _3613 + _3645;
    float _3649 = -_3633;
    float _3651 = _3619 + _3649;
    float _3653 = fma(_3643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    float _3655 = fma(_3647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    float _3657 = fma(_3651, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    bool _3659 = !_3617;
    if (!_3659)
    {
        float _3661 = -_2664;
        float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3665 = -_2666;
        float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3669 = -_2668;
        float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3673 = _3663 * _3663;
        float _3675 = fma(_3667, _3667, _3673);
        float _3677 = fma(_3671, _3671, _3675);
        float _3679 = sqrt(_3677);
        float _3681 = rsqrt(_3677);
        float _3683 = -_3679;
        float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3687 = _3685 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3689 = precise::clamp(_3687, 0.0, 1.0);
        float _3691 = _3667 * _3681;
        float _3693 = _3663 * _3681;
        float _3695 = abs(_3689);
        float _3697 = log2(_3695);
        float _3699 = _3671 * _3681;
        float _3701 = _3691 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3703 = _3285 * _3693;
        float _3705 = -_3693;
        float _3707 = -_3701;
        float _3709 = fma(_3705, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3707);
        float _3711 = fma(_3283, _3691, _3703);
        float _3713 = -_3699;
        float _3715 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3709);
        float _3717 = fma(_3343, _3699, _3711);
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3723 = _3715 + _3721;
        float _3725 = _3697 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3727 = _3723 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3729 = precise::clamp(_3727, 0.0, 1.0);
        float _3731 = exp2(_3725);
        float _3733 = _3731 * _3729;
        float _3735 = _3719 * _3733;
        float _3737 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3739 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3741 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3737;
        out.m_96.y = _3739;
        out.m_96.z = _3741;
    }
    out.m_98.x = _3655;
    out.m_98.y = _3653;
    out.m_98.z = _3657;
    if (!_3639)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3743;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3495 = false;
    bool _439 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3799 = as_type<float>(_131);
        out.gl_Position.z = _3799;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3872 = as_type<float>(_173);
        out.gl_Position.z = _3872;
    }
    if (_157)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = in.m_62.x;
    float _267 = in.m_62.y;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _255;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = -_279;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _259;
    float _291 = 1.0 / _263;
    float _293 = _247 * _281;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _243 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = _297 * _289;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    bool _311 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_243);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -_321;
    float _327 = _325 + 1.0;
    float _329 = _251 * _291;
    bool _331 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_243);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _321 * _287;
    bool _345 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_243);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _341 * _327;
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = fma(_359, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = _355 * _369;
    float _375 = -_355;
    float _377 = _375 + 1.0;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = _303 * _373;
    float _383 = _323 * _373;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _397 = fma(_387, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_371, _365, _393);
    float _403 = fma(_379, _365, _395);
    float _405 = fma(_397, _343, _401);
    float _407 = fma(_399, _343, _403);
    float _409 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _405);
    float _411 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _407);
    float _413 = _409 * _265;
    float _415 = _411 * _267;
    bool _417 = !_283;
    float _419 = _343;
    float _437;
    if (!_417)
    {
        float _421 = in.m_60.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        _437 = _167;
    }
    _439 = false;
    float _441 = _437;
    bool _443 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = isnan(_441);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_441);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _441 + _475;
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _457;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _487 = _469 * _481;
    float _489 = -_469;
    float _491 = _489 + 1.0;
    float _493 = _473 * _483;
    float _495 = fma(_493, _477, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _497 = _495 * _487;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[115].x, _497);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[116].x, _503);
    float _513 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = _511 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _507;
    out.m_64.y = _509;
    out.m_64.z = _513;
    out.m_64.w = _515;
    bool _517 = !_485;
    if (!_517)
    {
        float _519 = in.m_60.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _169 = _533;
    }
    float _535 = _169;
    float _537 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _539 = int(_537);
    float _541 = in.m_60.x;
    float _543 = in.m_60.y;
    float _545 = _159 * _141;
    float _547 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _555 = int(_553);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _559 = float(_539);
    float _561 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _563 = int(_561);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_551)
    {
        _419 = 1.0;
    }
    float _569 = _419;
    float _571 = _569;
    if (!_551)
    {
        _571 = 7.345489978790283203125;
    }
    float _573 = _571;
    float _575 = float(_555);
    float _577 = 1.0 / _559;
    float _579 = _573 * _541;
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _583 = int(_581);
    float _585 = float(uint(_563));
    bool _587 = _563 == 0;
    float _589 = 1.0 / _575;
    float _591 = _577 * _141;
    float _593 = 1.0 / _585;
    float _595 = float(uint(_583));
    int _597 = ~_583;
    int _599 = _597 + 1;
    float _601 = trunc(_591);
    int _603 = int(_601);
    float _605 = _589 * _141;
    int _607 = ~_563;
    int _609 = _607 + 1;
    float _611 = 1.0 / _595;
    int _613 = as_type<int>(_593) + (-2);
    float _615 = trunc(_605);
    int _617 = int(_615);
    float _619 = float(uint(_603));
    float _621 = as_type<float>(_613) * _619;
    int _623 = as_type<int>(_611) + (-2);
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _627 = ~_583;
    int _629 = _627 + 1;
    float _631 = float(uint(_617));
    float _633 = trunc(_621);
    float _635 = precise::max(_633, 0.0);
    uint _638 = uint(_635);
    float _640 = as_type<float>(_623) * _631;
    float _642 = trunc(_640);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    float _648 = _625 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _650 = _609 * int(_638);
    int _652 = _650 + _603;
    float _654 = floor(_579);
    float _656 = float(uint(_652));
    int _658 = _629 * int(_646);
    int _660 = _658 + _617;
    float _662 = as_type<float>(_613) * _656;
    float _664 = _656;
    if (_551)
    {
        _664 = 1.0;
    }
    float _666 = _664;
    float _668 = float(uint(_660));
    float _670 = trunc(_662);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    float _676 = _666;
    float _678 = _668;
    if (!_551)
    {
        _676 = 1.2345600128173828125;
    }
    float _680 = _676;
    float _682 = -_654;
    float _684 = _579 + _682;
    float _686 = as_type<float>(_623) * _668;
    if (_551)
    {
        _678 = _541;
    }
    float _688 = _678;
    float _690 = _688;
    if (!_551)
    {
        _690 = _543;
    }
    float _692 = _690;
    float _694 = trunc(_686);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    float _700 = _680 * _692;
    int _702 = ~_563;
    int _704 = _702 + 1;
    int _706 = int(_638) + int(_674);
    float _708 = floor(_700);
    float _710 = float(_563);
    float _712 = float(_603);
    int _714 = _704 * _706;
    int _716 = _714 + _603;
    int _718 = int(_646) + int(_698);
    float _720 = _684 * _710;
    float _722 = _710 * _545;
    bool _724 = _712 >= _710;
    bool _726 = isnan(_712);
    bool _728 = _724 || _726;
    bool _730 = isnan(_710);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    bool _736 = uint(_716) >= uint(_563);
    int _738 = _599 * _718;
    int _740 = _738 + _617;
    float _742 = -_708;
    float _744 = _700 + _742;
    float _746 = trunc(_734);
    int _748 = int(_746);
    bool _750 = !_736;
    int _752 = _750 ? 0 : (-1);
    bool _754 = uint(_740) >= uint(_583);
    float _756 = in.m_60.z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _760 = _758 != 0;
    int _762 = ~_706;
    int _764 = _762 + _752;
    int _766 = _764 + 1;
    float _768 = trunc(_720);
    int _770 = int(_768);
    bool _772 = !_760;
    int _774 = _772 ? 0 : 1;
    float _776 = float(_583);
    int _778 = abs(_774);
    int _780 = _563 * _766;
    int _782 = _780 + _603;
    float _784 = float(_617);
    float _786 = _776 * _545;
    int _788 = ~_748;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    bool _794 = !_754;
    int _796 = _794 ? 0 : (-1);
    bool _798 = !_587;
    int _800 = _798 ? _782 : (-1);
    float _802 = trunc(_786);
    int _804 = int(_802);
    bool _806 = _784 >= _776;
    bool _808 = isnan(_784);
    bool _810 = _806 || _808;
    bool _812 = isnan(_776);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = _744 * _776;
    bool _820 = _543 > 0.5;
    int _822 = _800 * _792;
    int _824 = ~_718;
    int _826 = _824 + _796;
    int _828 = _826 + 1;
    int _830 = _770 * _778;
    int _832 = _830 + _603;
    bool _834 = _756 > 0.5;
    float _836 = trunc(_818);
    int _838 = int(_836);
    float _840 = -_217;
    int _842 = _820 ? as_type<int>(_840) : as_type<int>(_217);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _850 = _848 != 0;
    float _852 = -_207;
    int _854 = _834 ? as_type<int>(_852) : as_type<int>(_207);
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _858 = _856 != 0;
    float _860 = trunc(_816);
    int _862 = int(_860);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _866 = _864 != 0;
    bool _868 = !_846;
    float _870 = _868 ? _217 : as_type<float>(_842);
    bool _872 = !_850;
    float _874 = _872 ? _207 : as_type<float>(_854);
    bool _876 = !_858;
    int _878 = _876 ? 0 : 1;
    float _880 = trunc(_722);
    int _882 = int(_880);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    float _896 = _870 + 0.5;
    int _898 = abs(_878);
    int _900 = _563 + (-1);
    bool _902 = !_890;
    int _904 = _902 ? 0 : 1;
    bool _906 = !_866;
    int _908 = _906 ? 0 : 1;
    int _910 = _748 * _900;
    int _912 = _910 + _822;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    int _934 = abs(_904);
    int _936 = _838 * _898;
    int _938 = _936 + _617;
    int _940 = abs(_916);
    int _942 = _583 * _828;
    int _944 = _942 + _617;
    bool _946 = !_894;
    int _948 = _946 ? 0 : 1;
    bool _950 = !_924;
    int _952 = _950 ? 0 : 1;
    bool _954 = _583 == 0;
    int _956 = abs(_948);
    int _958 = _912 * _934;
    int _960 = ~_862;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    bool _966 = !_954;
    int _968 = _966 ? _944 : (-1);
    int _970 = _882 * _940;
    int _972 = _970 + _958;
    int _974 = _583 + (-1);
    int _976 = _968 * _964;
    int _978 = abs(_908);
    int _980 = _832 * _956;
    int _982 = _980 + _972;
    int _984 = abs(_952);
    int _986 = _862 * _974;
    int _988 = _986 + _976;
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    int _994 = _770 * _978;
    int _996 = _994 + _982;
    bool _998 = !_928;
    int _1000 = _998 ? 0 : 1;
    int _1002 = abs(_992);
    bool _1004 = !_932;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = abs(_1000);
    int _1010 = _988 * _984;
    float _1012 = float(uint(_996));
    int _1014 = abs(_1006);
    int _1016 = _804 * _1002;
    int _1018 = _1016 + _1010;
    float _1020 = as_type<float>(_613) * _1012;
    int _1022 = ~_563;
    int _1024 = _1022 + 1;
    int _1026 = _938 * _1008;
    int _1028 = _1026 + _1018;
    bool _1030 = _563 == 0;
    float _1032 = trunc(_1020);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _838 * _1014;
    int _1040 = _1038 + _1028;
    int _1042 = ~_563;
    int _1044 = _1042 + 1;
    int _1046 = ~_583;
    int _1048 = _1046 + 1;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1052 = float(uint(_1040));
    float _1054 = float(uint(_832));
    float _1056 = as_type<float>(_623) * _1052;
    float _1058 = as_type<float>(_613) * _1054;
    int _1060 = _1044 * int(_1036);
    int _1062 = _1060 + _996;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = float(uint(_1062));
    float _1076 = as_type<float>(_613) * _1074;
    float _1078 = trunc(_1058);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    int _1084 = _1048 * int(_1072);
    int _1086 = _1084 + _1040;
    float _1088 = trunc(_1076);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = _543 * 2.0;
    float _1096 = float(uint(_1086));
    float _1098 = floor(_1094);
    float _1100 = as_type<float>(_623) * _1096;
    int _1102 = ~_583;
    int _1104 = _1102 + 1;
    int _1106 = int(_1036) + int(_1092);
    float _1108 = trunc(_1100);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    int _1114 = _1024 * _1106;
    int _1116 = _1114 + _996;
    float _1118 = 1.0 / _1066;
    bool _1120 = uint(_1116) >= uint(_563);
    bool _1122 = !_1120;
    int _1124 = _1122 ? 0 : (-1);
    int _1126 = ~_1106;
    int _1128 = _1126 + _1124;
    int _1130 = _1128 + 1;
    float _1132 = _756 * 2.0;
    int _1134 = int(_1072) + int(_1112);
    float _1136 = float(uint(_938));
    int _1138 = _563 * _1130;
    int _1140 = _1138 + _996;
    float _1142 = _543 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1144 = _1104 * _1134;
    int _1146 = _1144 + _1040;
    float _1148 = floor(_1132);
    float _1150 = as_type<float>(_623) * _1136;
    bool _1152 = !_1030;
    int _1154 = _1152 ? _1140 : (-1);
    float _1156 = fma(_1142, -2.0, _1050);
    bool _1158 = uint(_1146) >= uint(_583);
    int _1160 = _1154 & 3;
    bool _1162 = _1160 != 0;
    int _1164 = _1154 & 3;
    bool _1166 = _1164 != 0;
    float _1168 = trunc(_1150);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = !_1158;
    int _1176 = _1174 ? 0 : (-1);
    int _1178 = _1162 ? 0 : 1;
    bool _1180 = uint(_1164) >= 2u;
    bool _1182 = uint(_1164) > 1u;
    int _1184 = ~_1134;
    int _1186 = _1184 + _1176;
    int _1188 = _1186 + 1;
    int _1190 = _1180 ? 0 : 1;
    bool _1192 = _1164 != 3;
    int _1194 = _583 * _1188;
    int _1196 = _1194 + _1040;
    int _1198 = ~_1178;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1206 = _1204 != 0;
    bool _1208 = !_954;
    int _1210 = _1208 ? _1196 : (-1);
    int _1212 = _1202;
    float _1214 = as_type<float>(_832);
    if (!_1182)
    {
        int _1216 = ~_1178;
        int _1218 = _1216 + 1;
        _1212 = _1218;
    }
    int _1220 = _1212;
    int _1222 = _1210 & 3;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1190;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (_1192)
    {
        int _1234 = ~_1190;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    bool _1240 = uint(_1222) > 1u;
    float _1242 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1244 = log2(_1242);
    int _1246 = _1210 & 3;
    bool _1248 = _1246 != 0;
    if (_1206)
    {
        _567 = 0;
    }
    int _1250 = _567;
    int _1252 = _1248 ? 0 : 1;
    int _1254 = _1250;
    if (!_1206)
    {
        _1254 = 2;
    }
    int _1256 = _1254;
    int _1258 = ~_1252;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    bool _1264 = _543 > 0.5;
    int _1266 = _1262;
    if (!_1240)
    {
        int _1268 = ~_1252;
        int _1270 = _1268 + 1;
        _1266 = _1270;
    }
    int _1272 = _1266;
    float _1274 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1276 = _1244 * _141;
    bool _1278 = _1222 != 3;
    bool _1280 = _1256 != 2;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -_207;
    float _1286 = _1264 ? _1284 : _207;
    float _1288 = exp2(_1276);
    bool _1290 = uint(_1222) >= 2u;
    float _1292 = -_1282;
    float _1294 = fma(_1274, 2.0, _1292);
    float _1296 = _541 * 2.0;
    float _1298 = _1290 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1300 = floor(_1296);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1304 = _1302 != 0;
    int _1306 = ~as_type<int>(_1298);
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1310;
    float _1314 = _1298;
    float _1316 = _1286;
    if (_1278)
    {
        int _1318 = ~as_type<int>(_1298);
        int _1320 = _1318 + 1;
        _1312 = _1320;
    }
    int _1322 = _1312;
    if (_1280)
    {
        _1314 = _541;
    }
    float _1324 = _1314;
    float _1326 = _1324;
    if (!_1280)
    {
        _1326 = _756;
    }
    float _1328 = _1326;
    bool _1330 = !_1304;
    int _1332 = _1330 ? 0 : 1;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1340 = _541 > 0.5;
    float _1342 = -_1288;
    float _1344 = _1342 + 1.0;
    bool _1346 = !_1336;
    float _1348 = _1346 ? _207 : _1286;
    float _1350 = -_557;
    float _1352 = fma(_1338, 2.0, _1350);
    int _1354 = ~_563;
    int _1356 = _1354 + 1;
    float _1358 = -_217;
    int _1360 = _1340 ? as_type<int>(_1358) : as_type<int>(_217);
    float _1362 = -_141;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1352);
    bool _1366 = _1300 > 0.0;
    int _1368 = _1356 * int(_1082);
    int _1370 = _1368 + _832;
    bool _1372 = _1300 >= 0.0;
    bool _1374 = isnan(_1300);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    float _1382 = fma(_648, _896, _1364);
    int _1384 = ~_583;
    int _1386 = _1384 + 1;
    if (_1280)
    {
        _1316 = _543;
    }
    float _1388 = _1316;
    float _1390 = _1388;
    if (!_1280)
    {
        _1390 = _541;
    }
    float _1392 = _1390;
    int _1394 = _1386 * int(_1172);
    int _1396 = _1394 + _938;
    float _1398 = float(uint(_1370));
    bool _1400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1408 = _1404 || _1406;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1412 = float(uint(_1396));
    float _1414 = as_type<float>(_613) * _1398;
    float _1416 = _1408 ? _1344 : 0.0;
    float _1418 = fma(_1410, -2.0, _565);
    bool _1420 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1422 = isnan(1.0);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1428 = _1424 || _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1432 = 1.0 + _1430;
    float _1434 = as_type<float>(_623) * _1412;
    float _1436 = trunc(_1414);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    float _1442 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1418);
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1446 = 1.0 / _1432;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1452 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1444);
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1456 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1448);
    float _1458 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1450);
    float _1460 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1452);
    float _1462 = trunc(_1434);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    float _1468 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1454);
    float _1470 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    float _1472 = -_141;
    float _1474 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1294);
    float _1476 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    float _1478 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1458);
    float _1480 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1468);
    int _1482 = int(_1082) + int(_1440);
    if (_1428)
    {
        float _1484 = _1416 * _1446;
        _163 = _1484;
    }
    float _1486 = _163;
    int _1488 = ~_563;
    int _1490 = _1488 + 1;
    float _1492 = in.m_46.x;
    float _1494 = in.m_46.y;
    float _1496 = in.m_46.z;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1500 = _1498 != 0;
    float _1502 = _1348 + (-0.5);
    int _1504 = ~_583;
    int _1506 = _1504 + 1;
    int _1508 = _1490 * _1482;
    int _1510 = _1508 + _832;
    int _1512 = _1380 ? 0 : 1;
    float _1514 = -_1460;
    float _1516 = _1514 + 1.0;
    bool _1518 = !_1500;
    float _1520 = _1518 ? _217 : as_type<float>(_1360);
    float _1522 = -_1502;
    float _1524 = -_1470;
    float _1526 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1524);
    bool _1528 = _1098 > 0.0;
    float _1530 = -_1476;
    float _1532 = _1530 + 1.0;
    bool _1534 = _1098 >= 0.0;
    bool _1536 = isnan(_1098);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    float _1544 = -_1478;
    float _1546 = _1544 + 1.0;
    int _1548 = int(_1172) + int(_1466);
    int _1550 = ~_1512;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    int _1556 = _1554;
    if (!_1366)
    {
        int _1558 = ~_1512;
        int _1560 = _1558 + 1;
        _1556 = _1560;
    }
    int _1562 = _1556;
    bool _1564 = uint(_1510) >= uint(_563);
    int _1566 = _1506 * _1548;
    int _1568 = _1566 + _938;
    float _1570 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1572 = _1542 ? 0 : 1;
    float _1574 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1576 = !_1564;
    int _1578 = _1576 ? 0 : (-1);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1580;
    bool _1584 = uint(_1568) >= uint(_583);
    float _1586 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1570);
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1590 = _1588 != 0;
    float _1592 = _1582 * _1118;
    bool _1594 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1596 = isnan(_535);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1574);
    int _1608 = ~_1572;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    int _1614 = _1612;
    if (!_1528)
    {
        int _1616 = ~_1572;
        int _1618 = _1616 + 1;
        _1614 = _1618;
    }
    int _1620 = _1614;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1624 = _535 + _1622;
    bool _1626 = !_1584;
    int _1628 = _1626 ? 0 : (-1);
    float _1630 = -_1604;
    float _1632 = _1630 + 1.0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1644 = _1642 != 0;
    float _1646 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1648 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1650 = isnan(_535);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    bool _1660 = !_1166;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1646);
    float _1666 = fma(_1592, _1624, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1668 = _1658 * _1632;
    float _1670 = _1520 + 0.5;
    float _1672 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1664);
    bool _1674 = _1148 >= 0.0;
    bool _1676 = isnan(_1148);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.0);
    bool _1682 = _1678 || _1680;
    float _1684 = _1666 * _1668;
    float _1686 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1474);
    float _1688 = -_1658;
    float _1690 = _1688 + 1.0;
    int _1692 = _1682 ? 0 : 1;
    bool _1694 = _1148 > 0.0;
    float _1696 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1684);
    float _1698 = -_1516;
    float _1700 = fma(_1520, _1698, _1686);
    float _1702 = fma(_1348, _1532, _1526);
    float _1704 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1586);
    float _1706 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1696);
    float _1708 = _1672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1710 = _1154 >> 31;
    float _1712 = _543 + _541;
    int _1714 = _1210 >> 31;
    float _1716 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1606);
    float _1718 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1722 = _1708 + _1720;
    int _1724 = _1710 & 3;
    float _1726 = _1712 + (-1.0);
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1730 = _1714 & 3;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1734 = _1718 + _1732;
    float _1736 = _1722 * _1722;
    int _1738 = _1154 + _1724;
    out.m_66.x = _1700;
    out.m_66.y = _1702;
    float _1740 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1744 = _1728 + _1742;
    float _1746 = fma(_1734, _1734, _1736);
    int _1748 = _1738 >> 2;
    float _1750 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1752 = !_1224;
    int _1754 = _1752 ? 0 : 1;
    float _1756 = fma(_1744, _1744, _1746);
    int _1758 = _1748 << 4;
    int _1760 = _1758 + 368;
    float _1762 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1750);
    int _1764 = _1210 + _1730;
    float _1766 = _547 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1768 = _1164 != 3;
    float _1770 = rsqrt(_1756);
    int _1772 = _1764 >> 2;
    float _1774 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1762);
    int _1776 = ~_1692;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    float _1782 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1784 = _1772 << 4;
    int _1786 = _1784 + 512;
    uint _1788 = uint(int(uint(_1760) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = _1780;
    float _1806 = _1728;
    if (!_1694)
    {
        int _1808 = ~_1692;
        int _1810 = _1808 + 1;
        _1804 = _1810;
    }
    int _1812 = _1804;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1816 = !_1768;
    int _1818 = _1816 ? 0 : (-1);
    out.m_68.w = _1782;
    bool _1820 = _1222 != 3;
    int _1822 = abs(_1238);
    uint _1824 = uint(int(uint(_1786) >> uint(2)));
    uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
    int _1828 = int(_1824) & 3;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[int(_1826)][_1828];
    int _1832 = int(_1824) + 1;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    int _1836 = _1832 & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    bool _1840 = !_1820;
    int _1842 = _1840 ? 0 : (-1);
    bool _1844 = _1774 >= 0.0;
    float _1846 = _1766 * _1770;
    int _1848 = abs(_1322);
    int _1850 = abs(_1332);
    int _1852 = _1760 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    float _1870 = _1722 * _1846;
    float _1872 = _1734 * _1846;
    float _1874 = _1744 * _1846;
    float _1876 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1878 = -_1870;
    float _1880 = _1722 + _1878;
    float _1882 = -_1872;
    float _1884 = _1734 + _1882;
    float _1886 = -_1874;
    float _1888 = _1744 + _1886;
    int _1890 = _1786 + 8;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    float _1908 = _1880 * _1880;
    float _1910 = _874 + (-0.5);
    bool _1912 = !_1636;
    int _1914 = _1912 ? 0 : 1;
    float _1916 = _1872;
    if (_1844)
    {
        out.m_49.x = 0.0;
    }
    float _1918 = fma(_1884, _1884, _1908);
    float _1920 = -_1876;
    float _1922 = -_1442;
    float _1924 = fma(_1920, _1910, _1922);
    int _1926 = abs(_1272);
    float _1928 = -_1546;
    float _1930 = fma(_870, _1928, _1382);
    float _1932 = fma(_1888, _1888, _1918);
    int _1934 = abs(_1220);
    float _1936 = _541 + (-0.5);
    int _1938 = abs(_1662);
    int _1940 = ~_1934;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    int _1946 = ~_1926;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = ~_1938;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = abs(_1754);
    int _1960 = ~_1482;
    int _1962 = _1960 + _1578;
    int _1964 = _1962 + 1;
    int _1966 = _1944 * as_type<int>(_1802);
    int _1968 = ~_1822;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = ~_1548;
    int _1976 = _1974 + _1628;
    int _1978 = _1976 + 1;
    int _1980 = _1956 * as_type<int>(_1794);
    int _1982 = _1980 + _1966;
    int _1984 = abs(_1818);
    int _1986 = _563 * _1964;
    int _1988 = _1986 + _832;
    int _1990 = abs(_1914);
    int _1992 = _1950 * as_type<int>(_1838);
    int _1994 = ~_1958;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = _583 * _1978;
    int _2002 = _2000 + _938;
    bool _2004 = _563 == 0;
    float _2006 = float(_1812);
    int _2008 = _1998 * as_type<int>(_1830);
    int _2010 = _2008 + _1992;
    int _2012 = _1972 * as_type<int>(_1860);
    int _2014 = _2012 + _1982;
    bool _2016 = !_1590;
    int _2018 = _2016 ? 0 : 1;
    int _2020 = abs(_1842);
    int _2022 = abs(_2018);
    int _2024 = ~_1984;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_1848;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = ~_2020;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2028 * as_type<int>(_1868);
    int _2044 = _2042 + _2014;
    float _2046 = float(_1990);
    int _2048 = _2034 * as_type<int>(_1898);
    int _2050 = _2048 + _2010;
    float _2052 = in.m_70.x;
    float _2054 = in.m_70.y;
    float _2056 = in.m_70.z;
    int _2058 = _2040 * as_type<int>(_1906);
    int _2060 = _2058 + _2050;
    float _2062 = sqrt(_1932);
    int _2064 = ~_1850;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = -_1480;
    float _2072 = _2070 + 1.0;
    int _2074 = ~_2022;
    int _2076 = _2074 + 1;
    int _2078 = _2076 + 1;
    float _2080 = _2046 * _2006;
    bool _2082 = !_2004;
    int _2084 = _2082 ? _1988 : (-1);
    int _2086 = _2044 * _2068;
    bool _2088 = !_954;
    int _2090 = _2088 ? _2002 : (-1);
    int _2092 = _2060 * _2078;
    float _2094 = fma(_874, _2072, _1924);
    int _2096 = _2084 * _1850;
    int _2098 = _2096 + _2086;
    if (_1844)
    {
        _1214 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2100 = _1214;
    float _2102 = _2080 * (-2.0);
    int _2104 = _2090 * _2022;
    int _2106 = _2104 + _2092;
    bool _2108 = !_1640;
    int _2110 = _2108 ? 0 : 1;
    out.m_72.x = _1930;
    out.m_72.y = _2094;
    float _2112 = _1770 * _2062;
    int _2114 = as_type<int>(_2100);
    if (_1844)
    {
        float _2116 = _2100 * 5.0;
        _2114 = as_type<int>(_2116);
    }
    int _2118 = _2114;
    float _2120 = float(_2098);
    float _2122 = fma(_2102, _2052, _2052);
    float _2124 = float(_2106);
    float _2126 = _547 * _2112;
    if (_1844)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6724 = as_type<float>(_2118);
        out.gl_Position.z = _6724;
    }
    float _2128 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2122);
    float _2130 = _543 + _756;
    float _2132 = float(_1562);
    out.m_74.x = _2120;
    out.m_74.y = _2124;
    float _2134 = fma(_1740, _2102, _1740);
    float _2136 = _2130 + (-1.0);
    out.m_76.x = _2126;
    bool _2138 = !_1644;
    int _2140 = _2138 ? 0 : 1;
    int _2142 = abs(_2110);
    if (_1844)
    {
        return out;
    }
    float _2144 = -_1870;
    float _2146 = _1708 + _2144;
    int _2148 = abs(_2140);
    float _2150 = -_1872;
    float _2152 = _1718 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2146 + _2154;
    float _2158 = -_1874;
    float _2160 = _1728 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2164 = _2152 + _2162;
    float _2166 = float(_2142);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2172 = _2160 + _2170;
    float _2174 = float(_1620);
    float _2176 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2168);
    float _2180 = _2166 * _2132;
    float _2182 = float(_2148);
    float _2184 = _543 + (-0.5);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2178);
    float _2188 = _2180 * (-2.0);
    float _2190 = _756 + _541;
    float _2192 = _2182 * _2174;
    float _2194 = fma(_2134, _1486, _2128);
    bool _2196 = _2186 >= 0.0;
    float _2198 = fma(_2188, _2054, _2054);
    float _2200 = fma(_2176, _2188, _2176);
    float _2202 = _2190 + (-1.0);
    float _2204 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2198);
    float _2206 = _2192 * (-2.0);
    float _2208 = _2194 * 0.15915493667125701904296875;
    float _2210 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2212 = fma(_2200, _1486, _2204);
    float _2214 = fma(_2206, _2056, _2056);
    float _2216 = _756 + (-0.5);
    float _2218 = _2208 * 6.283185482025146484375;
    float _2220 = sin(_2218);
    float _2222 = _2212 * 0.15915493667125701904296875;
    float _2224 = _2176;
    float _2226 = _2164;
    float _2228 = _2172;
    if (_2196)
    {
        _2224 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2230 = _2224;
    float _2232 = fma(_2210, _2206, _2210);
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2214);
    int _2236 = as_type<int>(_2230);
    if (_2196)
    {
        out.m_49.x = 0.0;
    }
    if (_2196)
    {
        float _2238 = _2230 * 5.0;
        _2236 = as_type<int>(_2238);
    }
    int _2240 = _2236;
    float _2242 = _2208 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = fma(_2232, _1486, _2234);
    if (_2196)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6927 = as_type<float>(_2240);
        out.gl_Position.z = _6927;
    }
    float _2248 = _2246 * 0.15915493667125701904296875;
    float _2250 = _2222 * 6.283185482025146484375;
    float _2252 = sin(_2250);
    float _2254 = _2222 * 6.283185482025146484375;
    float _2256 = cos(_2254);
    if (_2196)
    {
        return out;
    }
    float _2258 = _2248 * 6.283185482025146484375;
    float _2260 = cos(_2258);
    float _2262 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2266 = _2220 * _2252;
    float _2268 = _2244 * _2256;
    float _2270 = _2262 * _2112;
    float _2272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2274 = _2220 * _2256;
    float _2276 = _2248 * 6.283185482025146484375;
    float _2278 = sin(_2276);
    float _2280 = _2270 * _2264;
    float _2282 = _2244 * _2252;
    float _2284 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2286 = _2284 * 0.5;
    float _2288 = _2244 * _2260;
    float _2290 = _2256 * _2260;
    float _2292 = _2220 * _2260;
    float _2294 = _2252 * _2260;
    float _2296 = _2126 * _2272;
    float _2298 = _2288 * _2280;
    float _2300 = fma(_2278, _2268, _2266);
    float _2302 = -_2274;
    float _2304 = fma(_2278, _2282, _2302);
    float _2306 = -_2280;
    float _2308 = _2278 * _2306;
    float _2310 = -_2282;
    float _2312 = fma(_2278, _2274, _2310);
    float _2314 = fma(_2300, _2296, _2298);
    float _2316 = _2292 * _2280;
    float _2318 = fma(_2290, _2296, _2308);
    float _2320 = fma(_2304, _2286, _2314);
    float _2322 = fma(_2278, _2266, _2268);
    float _2324 = fma(_2312, _2296, _2316);
    float _2326 = fma(_2294, _2286, _2318);
    float _2328 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2330 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2332 = fma(_2322, _2286, _2324);
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2328);
    float _2336 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2330);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2342 = _2338 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2344 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2346 = _1728 + _2342;
    float _2348 = _1718 + _2344;
    float _2350 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2346 + _2354;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2360 = _2348 + _2358;
    float _2362 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2364 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2352);
    float _2366 = _2356 * _2356;
    float _2368 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2370 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2364);
    float _2372 = fma(_2360, _2360, _2366);
    float _2374 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2376 = sqrt(_2372);
    float _2378 = _1708 + _2374;
    bool _2380 = _2376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2368;
    float _2384 = _2374;
    float _2386 = _2352;
    float _2388 = _2296;
    if (!_2380)
    {
        _2382 = _2348;
    }
    float _2390 = _2382;
    float _2392 = _2390;
    if (!_2380)
    {
        _2384 = _2346;
    }
    float _2394 = _2384;
    float _2396 = _2394;
    if (!_2380)
    {
        _2386 = _2378;
    }
    float _2398 = _2386;
    bool _2400 = !_2380;
    float _2402 = _2398;
    if (!_2400)
    {
        float _2404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2408 = _2376 + _2406;
        float _2410 = rsqrt(_2372);
        float _2412 = _2408 * _2404;
        float _2414 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = _2412 * 0.15915493667125701904296875;
        float _2418 = _2416 * 6.283185482025146484375;
        float _2420 = cos(_2418);
        float _2422 = _2416 * 6.283185482025146484375;
        float _2424 = sin(_2422);
        float _2426 = _2420 + (-1.0);
        float _2428 = fma(_2424, _2414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2432 = _2410 * _2428;
        float _2434 = fma(_2378, _2420, _2430);
        float _2436 = fma(_2360, _2432, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2438 = fma(_2356, _2432, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2402 = _2434;
        _2392 = _2436;
        _2396 = _2438;
        _2388 = _2416;
    }
    float _2440 = _2402;
    float _2442 = _2392;
    float _2444 = _2396;
    float _2446 = _2388;
    float _2448 = -_1708;
    float _2450 = _2448 + _2440;
    float _2452 = -_1718;
    float _2454 = _2452 + _2442;
    float _2456 = -_1728;
    float _2458 = _2456 + _2444;
    float _2460 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2462 = _2450 * _2450;
    float _2464 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2466 = 1.0 / _2460;
    float _2468 = fma(_2454, _2454, _2462);
    float _2470 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2464);
    bool _2472 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2474 = isnan(0.5);
    bool _2476 = _2472 || _2474;
    bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2480 = _2476 || _2478;
    float _2482 = fma(_2458, _2458, _2468);
    float _2484 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2470);
    bool _2486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2488 = isnan(0.5);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2494 = _2490 || _2492;
    float _2496 = sqrt(_2482);
    float _2498 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2500 = _2498 + _2460;
    float _2502 = _2500 * _2466;
    float _2504 = _2502 * 0.5;
    bool _2506 = _2496 > 0.0;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2510 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2508);
    float _2512 = 1.0 / _2510;
    float _2514 = _2504;
    float _2516 = _2466;
    float _2518 = _2446;
    if (!_2506)
    {
        _2514 = _2442;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2506)
    {
        _2516 = _2440;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (!_2506)
    {
        _2518 = _2444;
    }
    float _2528 = _2518;
    bool _2530 = !_2506;
    float _2532 = _2528;
    float _2534 = _2528;
    if (!_2530)
    {
        float _2536 = _211 * _211;
        float _2538 = fma(_209, _209, _2536);
        float _2540 = rsqrt(_2482);
        float _2542 = fma(_213, _213, _2538);
        float _2544 = sqrt(_2542);
        float _2546 = _2454 * _2540;
        float _2548 = _2450 * _2540;
        float _2550 = _2458 * _2540;
        bool _2552 = _2544 > 0.0;
        float _2554 = _2540;
        float _2556 = _2544;
        if (!_2552)
        {
            _2554 = _2442;
        }
        float _2558 = _2554;
        _2522 = _2558;
        if (!_2552)
        {
            _2556 = _2440;
        }
        float _2560 = _2556;
        _2526 = _2560;
        if (!_2552)
        {
            _2532 = _2444;
        }
        float _2562 = _2532;
        bool _2564 = !_2552;
        _2534 = _2562;
        if (!_2564)
        {
            float _2566 = rsqrt(_2542);
            float _2568 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2570 = _211 * _2566;
            float _2572 = _209 * _2566;
            float _2574 = _2548 * _2570;
            float _2576 = _213 * _2566;
            float _2578 = fma(_2546, _2572, _2574);
            float _2580 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2582 = fma(_2550, _2576, _2578);
            float _2584 = _2582 * _2580;
            float _2586 = fma(_209, _2584, _2442);
            float _2588 = fma(_211, _2584, _2440);
            float _2590 = fma(_213, _2584, _2444);
            _2522 = _2586;
            _2526 = _2588;
            _2534 = _2590;
        }
    }
    float _2592 = _2522;
    float _2594 = _2526;
    float _2596 = _2534;
    float _2598 = -_1872;
    float _2600 = _2598 + _2592;
    float _2602 = -_1870;
    float _2604 = _2602 + _2594;
    float _2606 = -_1874;
    float _2608 = _2606 + _2596;
    float _2610 = _2604;
    float _2612 = _2600;
    float _2614 = _2608;
    if (_2494)
    {
        _221 = 1.0;
    }
    float _2616 = _221;
    float _2618 = _2616;
    if (!_2480)
    {
        float _2620 = _2156 * _2156;
        float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2624 = -_1728;
        float _2626 = _2624 + _2596;
        float _2628 = -_1708;
        float _2630 = _2628 + _2594;
        float _2632 = fma(_2164, _2164, _2620);
        float _2634 = fma(_2172, _2172, _2632);
        float _2636 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2638 = sqrt(_2634);
        float _2640 = 1.0 / _2112;
        float _2642 = precise::min(_2638, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2644 = _2642 * _2622;
        float _2646 = _2636 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2648 = -_1718;
        float _2650 = _2648 + _2592;
        float _2652 = _2644 * _2640;
        float _2654 = _2646 * _2652;
        float _2656 = _2626 * _2652;
        float _2658 = fma(_2630, _2654, _2146);
        float _2660 = fma(_2650, _2654, _2152);
        float _2662 = fma(_2646, _2656, _2160);
        _2610 = _2658;
        _2612 = _2660;
        _2614 = _2662;
        _2226 = _2638;
        _1806 = _2656;
    }
    float _2664 = _2610;
    float _2666 = _2612;
    float _2668 = _2614;
    float _2670 = _2226;
    float _2672 = _1806;
    float _2674 = _2670;
    float _2676 = _2672;
    if (_2494)
    {
        _1916 = 1.0;
    }
    float _2678 = _1916;
    float _2680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2682 = _2512 * _2680;
    float _2684 = _2678;
    if (!_2494)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2694 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2692;
        float _2696 = _2688 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = _2690 * 0.15915493667125701904296875;
        float _2702 = _2688 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = 1.0 / _2698;
        float _2708 = _2700 * 6.283185482025146484375;
        float _2710 = cos(_2708);
        float _2712 = _2704 * _2706;
        float _2714 = _2700 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2710 * _2712;
        float _2720 = 1.0 / _2694;
        float _2722 = 1.0 / _2718;
        float _2724 = _2716 * _2722;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2728 = fma(_2682, _2724, _2726);
        float _2730 = _2728 * _2720;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        _2228 = _2700;
        _2674 = _2712;
        _2618 = _2732;
    }
    float _2734 = _2228;
    float _2736 = _2674;
    float _2738 = _2618;
    float _2740 = _2734;
    float _2742 = _2736;
    if (!_2494)
    {
        float _2744 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2746 = _2744 * 0.15915493667125701904296875;
        float _2748 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2750 = _2746 * 6.283185482025146484375;
        float _2752 = cos(_2750);
        float _2754 = _2748 * 0.15915493667125701904296875;
        float _2756 = _2746 * 6.283185482025146484375;
        float _2758 = sin(_2756);
        float _2760 = 1.0 / _2752;
        float _2762 = _2754 * 6.283185482025146484375;
        float _2764 = cos(_2762);
        float _2766 = _2758 * _2760;
        float _2768 = _2754 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = _2764 * _2766;
        float _2774 = 1.0 / _2772;
        float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2778 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2776;
        float _2780 = 1.0 / _2778;
        float _2782 = _2770 * _2774;
        float _2784 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2786 = fma(_2682, _2782, _2784);
        float _2788 = _2786 * _2780;
        float _2790 = precise::clamp(_2788, 0.0, 1.0);
        float _2792 = -_2790;
        float _2794 = _2792 + 1.0;
        _2740 = _2760;
        _2742 = _2772;
        _2684 = _2794;
    }
    float _2796 = _2740;
    float _2798 = _2742;
    float _2800 = _2684;
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2804 = _2664 + _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2808 = _2666 + _2806;
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2812 = _2668 + _2810;
    float _2814 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2816 = _2804 * _2804;
    float _2818 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2814);
    float _2820 = fma(_2808, _2808, _2816);
    float _2822 = fma(_2812, _2812, _2820);
    float _2824 = rsqrt(_2822);
    float _2826 = sqrt(_2822);
    float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2830 = _2808 * _2828;
    float _2832 = _2812 * _2828;
    float _2834 = _2830 * _2830;
    float _2836 = _2832 * _2832;
    float _2838 = _2834 + _2836;
    float _2840 = sqrt(_2838);
    bool _2842 = _2840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2846 = _2840 + _2844;
    float _2848 = _2796;
    float _2850 = _2838;
    float _2852 = _2846;
    float _2854 = _2798;
    float _2856 = _2804;
    if (_2842)
    {
        float _2858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2848 = _2858;
    }
    float _2860 = _2848;
    if (_2842)
    {
        float _2862 = rsqrt(_2838);
        _2850 = _2862;
    }
    float _2864 = _2850;
    float _2866 = _2864;
    if (_2842)
    {
        float _2868 = _2846 * _2860;
        _2852 = _2868;
    }
    float _2870 = _2852;
    if (_2842)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2854 = _2872;
    }
    float _2874 = _2854;
    float _2876 = _2812;
    float _2878 = _2874;
    if (_2842)
    {
        float _2880 = _2874 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        _2876 = _2882;
    }
    float _2884 = _2876;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2888 = precise::max(0.0, _2886);
    float _2890 = _2860;
    if (_2842)
    {
        float _2892 = _2874 * 6.283185482025146484375;
        float _2894 = cos(_2892);
        _2890 = _2894;
    }
    float _2896 = _2890;
    float _2898 = -_2828;
    float _2900 = -_2888;
    float _2902 = fma(_2804, _2898, _2900);
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2842)
    {
        float _2906 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2856 = _2906;
    }
    float _2908 = _2856;
    float _2910 = _2908;
    if (!_2842)
    {
        _2878 = _2830;
    }
    float _2912 = _2878;
    float _2914 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2916 = _2884;
    float _2918 = _2912;
    if (_2842)
    {
        float _2920 = fma(_2884, _2908, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2916 = _2920;
    }
    float _2922 = _2916;
    float _2924 = _2922;
    if (!_2842)
    {
        _2910 = _2902;
    }
    float _2926 = _2910;
    float _2928 = _2926;
    float _2930 = _2896;
    if (_2842)
    {
        float _2932 = _2896 + (-1.0);
        _2904 = _2932;
    }
    float _2934 = _2904;
    float _2936 = _2934;
    if (_2842)
    {
        float _2938 = _2864 * _2922;
        _2676 = _2938;
    }
    float _2940 = _2676;
    if (!_2842)
    {
        _2866 = _2832;
    }
    float _2942 = _2866;
    float _2944 = _2942;
    if (_2842)
    {
        float _2946 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _2946;
    }
    float _2948 = _2936;
    if (_2842)
    {
        float _2950 = _2830 * _2940;
        _2918 = _2950;
    }
    float _2952 = _2918;
    if (!_2842)
    {
        _2924 = _2834;
    }
    float _2954 = _2924;
    float _2956 = _2954;
    if (_2842)
    {
        float _2958 = _2832 * _2940;
        _2944 = _2958;
    }
    float _2960 = _2944;
    if (_2842)
    {
        float _2962 = fma(_2902, _2896, _2948);
        _2928 = _2962;
    }
    float _2964 = _2928;
    if (_2842)
    {
        float _2966 = _2952 * _2952;
        _2956 = _2966;
    }
    float _2968 = _2956;
    if (!_2842)
    {
        _2930 = _2836;
    }
    float _2970 = _2930;
    float _2972 = _2970;
    if (_2842)
    {
        float _2974 = _2960 * _2960;
        _2972 = _2974;
    }
    float _2976 = _2972;
    float _2978 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2980 = fma(_2964, _2964, _2968);
    float _2982 = floor(_2914);
    float _2984 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2978);
    float _2986 = _2980 + _2976;
    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2990 = fma(_2826, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2988);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2984);
    float _2996 = rsqrt(_2986);
    float _2998 = -_2992;
    float _3000 = _2998 + 1.0;
    float _3002 = _2994 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3004 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3006 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3010 = abs(_3000);
    float _3012 = log2(_3010);
    float _3014 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3018 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3006);
    float _3020 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = -_3016;
    float _3024 = fma(_3022, _3008, 1.0);
    float _3026 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3018);
    float _3028 = _2996 * _2952;
    float _3030 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3032 = _2996 * _2964;
    float _3034 = _2996 * _2960;
    float _3036 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3038 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3040 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3042 = floor(_3004);
    float _3044 = -_3036;
    float _3046 = fma(_3032, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3044);
    float _3048 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3050 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3052 = -_3034;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3046);
    float _3056 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2818);
    float _3058 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3048);
    float _3060 = exp2(_3050);
    float _3062 = fma(_3054, -0.5, 0.5);
    float _3064 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3066 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3058);
    float _3068 = fma(_3054, 0.5, 0.5);
    float _3070 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3072 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3066);
    float _3074 = log2(_3024);
    float _3076 = -_3042;
    float _3078 = _3004 + _3076;
    float _3080 = fma(_3068, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3082 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3070);
    float _3084 = fma(_3068, _3080, -0.212114393711090087890625);
    float _3086 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3082);
    float _3088 = 1.0 / _3072;
    float _3090 = -_2982;
    float _3092 = _2914 + _3090;
    float _3094 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3096 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3094);
    float _3098 = _3032 + 1.0;
    float _3100 = sqrt(_3062);
    float _3102 = _3074 * 0.693147182464599609375;
    float _3104 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3096);
    float _3106 = -_3032;
    float _3108 = fma(_3060, _3098, _3106);
    float _3110 = fma(_3068, _3084, 1.570728778839111328125);
    float2 _8280 = float2(_3092, _3078);
    float _3112 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8280, float2(0.0), isnan(_8280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8280, float2(0.0), isnan(_8280)), level(0.0)).x;
    float _3114 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3104);
    float _3116 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3086);
    float _3118 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3120 = fma(_3108, 0.5, 0.5);
    float _3122 = _3114 * _3088;
    float _3124 = _3116 * _3088;
    float _3126 = fma(_3122, 0.5, 0.5);
    float _3128 = fma(_3124, -0.5, 0.5);
    float _3130 = _3100 * 0.636619746685028076171875;
    float _3132 = -_3110;
    float _3134 = fma(_3130, _3132, 1.0);
    float3 _8325 = float3(_3126, _3128, _3118);
    float _3136 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8325, float3(0.0), isnan(_8325)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8325, float3(0.0), isnan(_8325)), level(0.0)).x;
    float3 _8336 = float3(_3126, _3128, _3118);
    float4 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8336, float3(0.0), isnan(_8336)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8336, float3(0.0), isnan(_8336)), level(0.0)).xyzw;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = _3139.w;
    float2 _8352 = float2(_3134, _3120);
    float3 _3151 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8352, float2(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8352, float2(0.0), isnan(_8352)), level(0.0)).xyz;
    float _3153 = _3151.x;
    float _3155 = _3151.y;
    float _3157 = _3151.z;
    float _3159 = abs(_2682);
    float _3161 = log2(_3159);
    float _3163 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3165 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3167 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3169 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3171 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3163);
    float _3173 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3165);
    float _3175 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3167);
    float _3177 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3179 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3181 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3183 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3185 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3187 = -_2278;
    float _3189 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3169);
    float _3191 = -_2278;
    float _3193 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3179);
    float _3195 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3197 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3199 = -_2278;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3177);
    float _3203 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3181);
    float _3205 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3183);
    float _3207 = exp2(_3197);
    float _3209 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3185);
    float _3211 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3213 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3203);
    float _3215 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3205);
    float _3217 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3209);
    float _3219 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3171);
    float _3221 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3189);
    float _3223 = fma(_3195, _3195, 1.0);
    float _3225 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3227 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3229 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3231 = rsqrt(_3223);
    float _3233 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3173);
    float _3235 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3237 = fma(_3207, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3175);
    float _3243 = _3195 * _3221;
    float _3245 = _3239 * _3239;
    float _3247 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3229);
    float _3249 = fma(_3239, -2.0, 3.0);
    float _3251 = _3195 * _3211;
    float _3253 = exp2(_3235);
    float _3255 = fma(_3225, _3233, _3243);
    float _3257 = _3245 * _3249;
    float _3259 = fma(_3225, _3219, _3251);
    float _3261 = _3195 * _3227;
    float _3263 = _3195 * _3231;
    float _3265 = -_3257;
    float _3267 = _3265 + 1.0;
    out.m_78.x = _3219;
    out.m_78.y = _3233;
    out.m_78.z = _3241;
    float _3269 = fma(_3225, _3241, _3261);
    float _3271 = -_3213;
    float _3273 = _3263 * _3271;
    float _3275 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3257);
    float _3277 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3247);
    float _3279 = in.m_80.x;
    float _3281 = fma(_3231, _3211, _3273);
    float _3283 = _3213 + _3259;
    float _3285 = _3215 + _3255;
    float _3287 = -_3253;
    float _3289 = _3287 + 1.0;
    out.m_82.x = _2666;
    out.m_82.y = _2664;
    out.m_82.z = _2668;
    bool _3291 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3293 = isnan(_2826);
    bool _3295 = _3291 || _3293;
    bool _3297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3299 = _3295 || _3297;
    float _3301 = -_3215;
    float _3303 = _3263 * _3301;
    float _3305 = -_3217;
    float _3307 = _3263 * _3305;
    float _3309 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3311 = fma(_3231, _3221, _3303);
    bool _3313 = _2682 <= 8000.0;
    bool _3315 = isnan(_2682);
    bool _3317 = _3313 || _3315;
    bool _3319 = isnan(8000.0);
    bool _3321 = _3317 || _3319;
    float _3323 = float(_3321);
    float _3325 = fma(_3231, _3227, _3307);
    float _3327 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3277);
    float _3329 = _3072 * 0.5;
    float _3331 = _3114 + _3072;
    float _3333 = _3323 * _3275;
    out.m_84.x = _3281;
    out.m_84.y = _3311;
    out.m_84.z = _3325;
    float _3335 = _3327 + _3072;
    float _3337 = fma(_3116, -0.5, _3329);
    float _3339 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3114;
    out.gl_Position.y = _3116;
    out.gl_Position.z = _3327;
    out.gl_Position.w = _3072;
    float _3341 = _3335 * 0.5;
    float _3343 = _3217 + _3269;
    float _3345 = _3331 * 0.5;
    out.m_86.x = _3283;
    out.m_86.y = _3285;
    out.m_86.z = _3343;
    float _3347 = _3215;
    float _3349 = _3325;
    float _3351 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3299)
    {
        _3347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3353 = _3347;
    float _3355 = _3353;
    float _3357 = _3353;
    if (!_3299)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3359 = _3349;
    out.m_88.z = _3341;
    out.m_88.w = _3072;
    out.m_90.x = _3345;
    out.m_90.y = _3337;
    out.m_90.z = _3341;
    out.m_90.w = _3072;
    float _3361 = -_3112;
    float _3363 = _3361 + 1.0;
    float _3365 = _3363 * _3339;
    float _3367 = precise::clamp(_3365, 0.0, 1.0);
    float _3369 = -_3367;
    float _3371 = fma(_3369, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3373 = _3143;
    float _3375 = _3359;
    float _3377 = _3359;
    if (!_3299)
    {
        _3351 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3379 = _3351;
    float _3381 = _3371 * _3279;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3385 = _3309 * _3136;
    float _3387 = -_3309;
    float _3389 = _3387 + 1.0;
    float _3391 = _3147 * _3385;
    float _3393 = _3157 * _3385;
    float _3395 = _3147 * _3389;
    out.m_92.x = _3383;
    float _3397 = fma(_3153, _3391, _3141);
    float _3399 = fma(_3155, _3391, _3143);
    float _3401 = fma(_3147, _3393, _3145);
    float _3403 = _2738 * _2800;
    float _3405 = _3385;
    float _3407 = _3403;
    float _3409 = _3379;
    float _3411 = _3379;
    if (!_3299)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3413 = _3405;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3299)
    {
        _3373 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3419 = _3373;
    out.m_94.x = _3397;
    out.m_94.y = _3399;
    out.m_94.z = _3401;
    out.m_94.w = _3395;
    float _3421 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3423 = _3419;
    float _3425 = _3419;
    if (!_3299)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3427 = _3407;
    bool _3429 = !_3299;
    float _3431 = _3427;
    float _3433 = _3427;
    if (!_3429)
    {
        bool _3435 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3437 = isnan(_2826);
        bool _3439 = _3435 || _3437;
        bool _3441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3443 = _3439 || _3441;
        if (!_3443)
        {
            float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3447 = _2826 + _3445;
            float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3451 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3449;
            float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3457 = 1.0 / _3451;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3475 = _3447 * _3457;
            float _3477 = precise::clamp(_3475, 0.0, 1.0);
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3483 = fma(_3477, _3455, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3485 = fma(_3477, _3481, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3487 = fma(_3477, _3461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3489 = fma(_3477, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3491 = fma(_3477, _3469, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3493 = fma(_3477, _3473, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3377 = _3487;
            _3425 = _3491;
            _3357 = _3483;
            _3417 = _3489;
            _3411 = _3485;
            _3433 = _3493;
            _3495 = true;
        }
        else
        {
            bool _3497 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3499 = isnan(_2826);
            bool _3501 = _3497 || _3499;
            bool _3503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3505 = _3501 || _3503;
            if (!_3505)
            {
                _3355 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3507 = _3355;
            _3357 = _3507;
            if (!_3505)
            {
                _3375 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3509 = _3375;
            _3377 = _3509;
            if (!_3505)
            {
                _3409 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3511 = _3409;
            _3411 = _3511;
            if (!_3505)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3513 = _3415;
            _3417 = _3513;
            if (!_3505)
            {
                _3423 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3515 = _3423;
            _3425 = _3515;
            if (!_3505)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3517 = _3431;
            bool _3519 = !_3505;
            _3433 = _3517;
            if (!_3519)
            {
                bool _3521 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3523 = isnan(_2826);
                bool _3525 = _3521 || _3523;
                bool _3527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3529 = _3525 || _3527;
                if (!_3529)
                {
                    float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3533 = _2826 + _3531;
                    float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3537 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3535;
                    float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3541 = _3539 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3543 = 1.0 / _3537;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3561 = _3533 * _3543;
                    float _3563 = precise::clamp(_3561, 0.0, 1.0);
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3569 = fma(_3563, _3541, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3571 = fma(_3563, _3567, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3573 = fma(_3563, _3547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3575 = fma(_3563, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3577 = fma(_3563, _3555, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3579 = fma(_3563, _3559, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3377 = _3573;
                    _3425 = _3577;
                    _3357 = _3569;
                    _3417 = _3575;
                    _3411 = _3571;
                    _3433 = _3579;
                    _3495 = true;
                }
                else
                {
                    _3377 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3425 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3357 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3411 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3495 = false;
    float _3581 = _3377;
    float _3583 = _3425;
    float _3585 = _3357;
    float _3587 = _3417;
    float _3589 = _3411;
    float _3591 = _3433;
    float _3593 = fma(_3285, -0.5, 0.5);
    float _3595 = precise::clamp(_3593, 0.0, 1.0);
    float _3597 = -_3581;
    float _3599 = _3597 + _3583;
    float _3601 = _3421 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3603 = -_3585;
    float _3605 = _3603 + _3587;
    float _3607 = fma(_3595, _3599, _3581);
    out.m_96.x = 0.0;
    float _3609 = -_3589;
    float _3611 = _3609 + _3591;
    float _3613 = fma(_3595, _3605, _3585);
    float _3615 = _3607 * 0.586610972881317138671875;
    out.m_49.x = _3601;
    bool _3617 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3619 = fma(_3595, _3611, _3589);
    float _3621 = fma(_3613, 0.298911988735198974609375, _3615);
    bool _3623 = _2738 > 0.0;
    bool _3625 = isnan(_2738);
    bool _3627 = _3623 || _3625;
    bool _3629 = isnan(0.0);
    bool _3631 = _3627 || _3629;
    float _3633 = fma(_3619, 0.114477999508380889892578125, _3621);
    bool _3635 = _2800 <= 0.0;
    bool _3637 = !_3631;
    bool _3639 = _3635 || _3637;
    float _3641 = -_3633;
    float _3643 = _3607 + _3641;
    float _3645 = -_3633;
    float _3647 = _3613 + _3645;
    float _3649 = -_3633;
    float _3651 = _3619 + _3649;
    float _3653 = fma(_3643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    float _3655 = fma(_3647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    float _3657 = fma(_3651, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    bool _3659 = !_3617;
    if (!_3659)
    {
        float _3661 = -_2664;
        float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3665 = -_2666;
        float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3669 = -_2668;
        float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3673 = _3663 * _3663;
        float _3675 = fma(_3667, _3667, _3673);
        float _3677 = fma(_3671, _3671, _3675);
        float _3679 = sqrt(_3677);
        float _3681 = rsqrt(_3677);
        float _3683 = -_3679;
        float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3687 = _3685 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3689 = precise::clamp(_3687, 0.0, 1.0);
        float _3691 = _3667 * _3681;
        float _3693 = _3663 * _3681;
        float _3695 = abs(_3689);
        float _3697 = log2(_3695);
        float _3699 = _3671 * _3681;
        float _3701 = _3691 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3703 = _3285 * _3693;
        float _3705 = -_3693;
        float _3707 = -_3701;
        float _3709 = fma(_3705, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3707);
        float _3711 = fma(_3283, _3691, _3703);
        float _3713 = -_3699;
        float _3715 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3709);
        float _3717 = fma(_3343, _3699, _3711);
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3723 = _3715 + _3721;
        float _3725 = _3697 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3727 = _3723 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3729 = precise::clamp(_3727, 0.0, 1.0);
        float _3731 = exp2(_3725);
        float _3733 = _3731 * _3729;
        float _3735 = _3719 * _3733;
        float _3737 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3739 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3741 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3737;
        out.m_96.y = _3739;
        out.m_96.z = _3741;
    }
    out.m_98.x = _3655;
    out.m_98.y = _3653;
    out.m_98.z = _3657;
    if (!_3639)
    {
        return out;
    }
    float _3743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3743;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3495 = false;
    bool _439 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3799 = as_type<float>(_131);
        out.gl_Position.z = _3799;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3872 = as_type<float>(_173);
        out.gl_Position.z = _3872;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = in.m_62.x;
    float _267 = in.m_62.y;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _255;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = -_279;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _259;
    float _291 = 1.0 / _263;
    float _293 = _247 * _281;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _243 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = _297 * _289;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    bool _311 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_243);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -_321;
    float _327 = _325 + 1.0;
    float _329 = _251 * _291;
    bool _331 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_243);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _321 * _287;
    bool _345 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_243);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _341 * _327;
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = fma(_359, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = _355 * _369;
    float _375 = -_355;
    float _377 = _375 + 1.0;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = _303 * _373;
    float _383 = _323 * _373;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _397 = fma(_387, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_371, _365, _393);
    float _403 = fma(_379, _365, _395);
    float _405 = fma(_397, _343, _401);
    float _407 = fma(_399, _343, _403);
    float _409 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _405);
    float _411 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _407);
    float _413 = _409 * _265;
    float _415 = _411 * _267;
    bool _417 = !_283;
    float _419 = _343;
    float _437;
    if (!_417)
    {
        float _421 = in.m_60.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        _437 = _167;
    }
    _439 = false;
    float _441 = _437;
    bool _443 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = isnan(_441);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_441);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _441 + _475;
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _457;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _487 = _469 * _481;
    float _489 = -_469;
    float _491 = _489 + 1.0;
    float _493 = _473 * _483;
    float _495 = fma(_493, _477, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _497 = _495 * _487;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[115].x, _497);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[116].x, _503);
    float _513 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = _511 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _507;
    out.m_64.y = _509;
    out.m_64.z = _513;
    out.m_64.w = _515;
    bool _517 = !_485;
    if (!_517)
    {
        float _519 = in.m_60.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _169 = _533;
    }
    float _535 = _169;
    float _537 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _539 = int(_537);
    float _541 = in.m_60.x;
    float _543 = in.m_60.y;
    float _545 = _159 * _141;
    float _547 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _555 = int(_553);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _559 = float(_539);
    float _561 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _563 = int(_561);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_551)
    {
        _419 = 1.0;
    }
    float _569 = _419;
    float _571 = _569;
    if (!_551)
    {
        _571 = 7.345489978790283203125;
    }
    float _573 = _571;
    float _575 = float(_555);
    float _577 = 1.0 / _559;
    float _579 = _573 * _541;
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _583 = int(_581);
    float _585 = float(uint(_563));
    bool _587 = _563 == 0;
    float _589 = 1.0 / _575;
    float _591 = _577 * _141;
    float _593 = 1.0 / _585;
    float _595 = float(uint(_583));
    int _597 = ~_583;
    int _599 = _597 + 1;
    float _601 = trunc(_591);
    int _603 = int(_601);
    float _605 = _589 * _141;
    int _607 = ~_563;
    int _609 = _607 + 1;
    float _611 = 1.0 / _595;
    int _613 = as_type<int>(_593) + (-2);
    float _615 = trunc(_605);
    int _617 = int(_615);
    float _619 = float(uint(_603));
    float _621 = as_type<float>(_613) * _619;
    int _623 = as_type<int>(_611) + (-2);
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _627 = ~_583;
    int _629 = _627 + 1;
    float _631 = float(uint(_617));
    float _633 = trunc(_621);
    float _635 = precise::max(_633, 0.0);
    uint _638 = uint(_635);
    float _640 = as_type<float>(_623) * _631;
    float _642 = trunc(_640);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    float _648 = _625 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _650 = _609 * int(_638);
    int _652 = _650 + _603;
    float _654 = floor(_579);
    float _656 = float(uint(_652));
    int _658 = _629 * int(_646);
    int _660 = _658 + _617;
    float _662 = as_type<float>(_613) * _656;
    float _664 = _656;
    if (_551)
    {
        _664 = 1.0;
    }
    float _666 = _664;
    float _668 = float(uint(_660));
    float _670 = trunc(_662);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    float _676 = _666;
    float _678 = _668;
    if (!_551)
    {
        _676 = 1.2345600128173828125;
    }
    float _680 = _676;
    float _682 = -_654;
    float _684 = _579 + _682;
    float _686 = as_type<float>(_623) * _668;
    if (_551)
    {
        _678 = _541;
    }
    float _688 = _678;
    float _690 = _688;
    if (!_551)
    {
        _690 = _543;
    }
    float _692 = _690;
    float _694 = trunc(_686);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    float _700 = _680 * _692;
    int _702 = ~_563;
    int _704 = _702 + 1;
    int _706 = int(_638) + int(_674);
    float _708 = floor(_700);
    float _710 = float(_563);
    float _712 = float(_603);
    int _714 = _704 * _706;
    int _716 = _714 + _603;
    int _718 = int(_646) + int(_698);
    float _720 = _684 * _710;
    float _722 = _710 * _545;
    bool _724 = _712 >= _710;
    bool _726 = isnan(_712);
    bool _728 = _724 || _726;
    bool _730 = isnan(_710);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    bool _736 = uint(_716) >= uint(_563);
    int _738 = _599 * _718;
    int _740 = _738 + _617;
    float _742 = -_708;
    float _744 = _700 + _742;
    float _746 = trunc(_734);
    int _748 = int(_746);
    bool _750 = !_736;
    int _752 = _750 ? 0 : (-1);
    bool _754 = uint(_740) >= uint(_583);
    float _756 = in.m_60.z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _760 = _758 != 0;
    int _762 = ~_706;
    int _764 = _762 + _752;
    int _766 = _764 + 1;
    float _768 = trunc(_720);
    int _770 = int(_768);
    bool _772 = !_760;
    int _774 = _772 ? 0 : 1;
    float _776 = float(_583);
    int _778 = abs(_774);
    int _780 = _563 * _766;
    int _782 = _780 + _603;
    float _784 = float(_617);
    float _786 = _776 * _545;
    int _788 = ~_748;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    bool _794 = !_754;
    int _796 = _794 ? 0 : (-1);
    bool _798 = !_587;
    int _800 = _798 ? _782 : (-1);
    float _802 = trunc(_786);
    int _804 = int(_802);
    bool _806 = _784 >= _776;
    bool _808 = isnan(_784);
    bool _810 = _806 || _808;
    bool _812 = isnan(_776);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = _744 * _776;
    bool _820 = _543 > 0.5;
    int _822 = _800 * _792;
    int _824 = ~_718;
    int _826 = _824 + _796;
    int _828 = _826 + 1;
    int _830 = _770 * _778;
    int _832 = _830 + _603;
    bool _834 = _756 > 0.5;
    float _836 = trunc(_818);
    int _838 = int(_836);
    float _840 = -_217;
    int _842 = _820 ? as_type<int>(_840) : as_type<int>(_217);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _850 = _848 != 0;
    float _852 = -_207;
    int _854 = _834 ? as_type<int>(_852) : as_type<int>(_207);
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _858 = _856 != 0;
    float _860 = trunc(_816);
    int _862 = int(_860);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _866 = _864 != 0;
    bool _868 = !_846;
    float _870 = _868 ? _217 : as_type<float>(_842);
    bool _872 = !_850;
    float _874 = _872 ? _207 : as_type<float>(_854);
    bool _876 = !_858;
    int _878 = _876 ? 0 : 1;
    float _880 = trunc(_722);
    int _882 = int(_880);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    float _896 = _870 + 0.5;
    int _898 = abs(_878);
    int _900 = _563 + (-1);
    bool _902 = !_890;
    int _904 = _902 ? 0 : 1;
    bool _906 = !_866;
    int _908 = _906 ? 0 : 1;
    int _910 = _748 * _900;
    int _912 = _910 + _822;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    int _934 = abs(_904);
    int _936 = _838 * _898;
    int _938 = _936 + _617;
    int _940 = abs(_916);
    int _942 = _583 * _828;
    int _944 = _942 + _617;
    bool _946 = !_894;
    int _948 = _946 ? 0 : 1;
    bool _950 = !_924;
    int _952 = _950 ? 0 : 1;
    bool _954 = _583 == 0;
    int _956 = abs(_948);
    int _958 = _912 * _934;
    int _960 = ~_862;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    bool _966 = !_954;
    int _968 = _966 ? _944 : (-1);
    int _970 = _882 * _940;
    int _972 = _970 + _958;
    int _974 = _583 + (-1);
    int _976 = _968 * _964;
    int _978 = abs(_908);
    int _980 = _832 * _956;
    int _982 = _980 + _972;
    int _984 = abs(_952);
    int _986 = _862 * _974;
    int _988 = _986 + _976;
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    int _994 = _770 * _978;
    int _996 = _994 + _982;
    bool _998 = !_928;
    int _1000 = _998 ? 0 : 1;
    int _1002 = abs(_992);
    bool _1004 = !_932;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = abs(_1000);
    int _1010 = _988 * _984;
    float _1012 = float(uint(_996));
    int _1014 = abs(_1006);
    int _1016 = _804 * _1002;
    int _1018 = _1016 + _1010;
    float _1020 = as_type<float>(_613) * _1012;
    int _1022 = ~_563;
    int _1024 = _1022 + 1;
    int _1026 = _938 * _1008;
    int _1028 = _1026 + _1018;
    bool _1030 = _563 == 0;
    float _1032 = trunc(_1020);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _838 * _1014;
    int _1040 = _1038 + _1028;
    int _1042 = ~_563;
    int _1044 = _1042 + 1;
    int _1046 = ~_583;
    int _1048 = _1046 + 1;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1052 = float(uint(_1040));
    float _1054 = float(uint(_832));
    float _1056 = as_type<float>(_623) * _1052;
    float _1058 = as_type<float>(_613) * _1054;
    int _1060 = _1044 * int(_1036);
    int _1062 = _1060 + _996;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = float(uint(_1062));
    float _1076 = as_type<float>(_613) * _1074;
    float _1078 = trunc(_1058);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    int _1084 = _1048 * int(_1072);
    int _1086 = _1084 + _1040;
    float _1088 = trunc(_1076);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = _543 * 2.0;
    float _1096 = float(uint(_1086));
    float _1098 = floor(_1094);
    float _1100 = as_type<float>(_623) * _1096;
    int _1102 = ~_583;
    int _1104 = _1102 + 1;
    int _1106 = int(_1036) + int(_1092);
    float _1108 = trunc(_1100);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    int _1114 = _1024 * _1106;
    int _1116 = _1114 + _996;
    float _1118 = 1.0 / _1066;
    bool _1120 = uint(_1116) >= uint(_563);
    bool _1122 = !_1120;
    int _1124 = _1122 ? 0 : (-1);
    int _1126 = ~_1106;
    int _1128 = _1126 + _1124;
    int _1130 = _1128 + 1;
    float _1132 = _756 * 2.0;
    int _1134 = int(_1072) + int(_1112);
    float _1136 = float(uint(_938));
    int _1138 = _563 * _1130;
    int _1140 = _1138 + _996;
    float _1142 = _543 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1144 = _1104 * _1134;
    int _1146 = _1144 + _1040;
    float _1148 = floor(_1132);
    float _1150 = as_type<float>(_623) * _1136;
    bool _1152 = !_1030;
    int _1154 = _1152 ? _1140 : (-1);
    float _1156 = fma(_1142, -2.0, _1050);
    bool _1158 = uint(_1146) >= uint(_583);
    int _1160 = _1154 & 3;
    bool _1162 = _1160 != 0;
    int _1164 = _1154 & 3;
    bool _1166 = _1164 != 0;
    float _1168 = trunc(_1150);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = !_1158;
    int _1176 = _1174 ? 0 : (-1);
    int _1178 = _1162 ? 0 : 1;
    bool _1180 = uint(_1164) >= 2u;
    bool _1182 = uint(_1164) > 1u;
    int _1184 = ~_1134;
    int _1186 = _1184 + _1176;
    int _1188 = _1186 + 1;
    int _1190 = _1180 ? 0 : 1;
    bool _1192 = _1164 != 3;
    int _1194 = _583 * _1188;
    int _1196 = _1194 + _1040;
    int _1198 = ~_1178;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1206 = _1204 != 0;
    bool _1208 = !_954;
    int _1210 = _1208 ? _1196 : (-1);
    int _1212 = _1202;
    float _1214 = as_type<float>(_832);
    if (!_1182)
    {
        int _1216 = ~_1178;
        int _1218 = _1216 + 1;
        _1212 = _1218;
    }
    int _1220 = _1212;
    int _1222 = _1210 & 3;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1190;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (_1192)
    {
        int _1234 = ~_1190;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    bool _1240 = uint(_1222) > 1u;
    float _1242 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1244 = log2(_1242);
    int _1246 = _1210 & 3;
    bool _1248 = _1246 != 0;
    if (_1206)
    {
        _567 = 0;
    }
    int _1250 = _567;
    int _1252 = _1248 ? 0 : 1;
    int _1254 = _1250;
    if (!_1206)
    {
        _1254 = 2;
    }
    int _1256 = _1254;
    int _1258 = ~_1252;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    bool _1264 = _543 > 0.5;
    int _1266 = _1262;
    if (!_1240)
    {
        int _1268 = ~_1252;
        int _1270 = _1268 + 1;
        _1266 = _1270;
    }
    int _1272 = _1266;
    float _1274 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1276 = _1244 * _141;
    bool _1278 = _1222 != 3;
    bool _1280 = _1256 != 2;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -_207;
    float _1286 = _1264 ? _1284 : _207;
    float _1288 = exp2(_1276);
    bool _1290 = uint(_1222) >= 2u;
    float _1292 = -_1282;
    float _1294 = fma(_1274, 2.0, _1292);
    float _1296 = _541 * 2.0;
    float _1298 = _1290 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1300 = floor(_1296);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1304 = _1302 != 0;
    int _1306 = ~as_type<int>(_1298);
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1310;
    float _1314 = _1298;
    float _1316 = _1286;
    if (_1278)
    {
        int _1318 = ~as_type<int>(_1298);
        int _1320 = _1318 + 1;
        _1312 = _1320;
    }
    int _1322 = _1312;
    if (_1280)
    {
        _1314 = _541;
    }
    float _1324 = _1314;
    float _1326 = _1324;
    if (!_1280)
    {
        _1326 = _756;
    }
    float _1328 = _1326;
    bool _1330 = !_1304;
    int _1332 = _1330 ? 0 : 1;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1340 = _541 > 0.5;
    float _1342 = -_1288;
    float _1344 = _1342 + 1.0;
    bool _1346 = !_1336;
    float _1348 = _1346 ? _207 : _1286;
    float _1350 = -_557;
    float _1352 = fma(_1338, 2.0, _1350);
    int _1354 = ~_563;
    int _1356 = _1354 + 1;
    float _1358 = -_217;
    int _1360 = _1340 ? as_type<int>(_1358) : as_type<int>(_217);
    float _1362 = -_141;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1352);
    bool _1366 = _1300 > 0.0;
    int _1368 = _1356 * int(_1082);
    int _1370 = _1368 + _832;
    bool _1372 = _1300 >= 0.0;
    bool _1374 = isnan(_1300);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    float _1382 = fma(_648, _896, _1364);
    int _1384 = ~_583;
    int _1386 = _1384 + 1;
    if (_1280)
    {
        _1316 = _543;
    }
    float _1388 = _1316;
    float _1390 = _1388;
    if (!_1280)
    {
        _1390 = _541;
    }
    float _1392 = _1390;
    int _1394 = _1386 * int(_1172);
    int _1396 = _1394 + _938;
    float _1398 = float(uint(_1370));
    bool _1400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1408 = _1404 || _1406;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1412 = float(uint(_1396));
    float _1414 = as_type<float>(_613) * _1398;
    float _1416 = _1408 ? _1344 : 0.0;
    float _1418 = fma(_1410, -2.0, _565);
    bool _1420 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1422 = isnan(1.0);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1428 = _1424 || _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1432 = 1.0 + _1430;
    float _1434 = as_type<float>(_623) * _1412;
    float _1436 = trunc(_1414);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    float _1442 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1418);
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1446 = 1.0 / _1432;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1452 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1444);
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1456 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1448);
    float _1458 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1450);
    float _1460 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1452);
    float _1462 = trunc(_1434);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    float _1468 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1454);
    float _1470 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    float _1472 = -_141;
    float _1474 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1294);
    float _1476 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    float _1478 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1458);
    float _1480 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1468);
    int _1482 = int(_1082) + int(_1440);
    if (_1428)
    {
        float _1484 = _1416 * _1446;
        _163 = _1484;
    }
    float _1486 = _163;
    int _1488 = ~_563;
    int _1490 = _1488 + 1;
    float _1492 = in.m_46.x;
    float _1494 = in.m_46.y;
    float _1496 = in.m_46.z;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1500 = _1498 != 0;
    float _1502 = _1348 + (-0.5);
    int _1504 = ~_583;
    int _1506 = _1504 + 1;
    int _1508 = _1490 * _1482;
    int _1510 = _1508 + _832;
    int _1512 = _1380 ? 0 : 1;
    float _1514 = -_1460;
    float _1516 = _1514 + 1.0;
    bool _1518 = !_1500;
    float _1520 = _1518 ? _217 : as_type<float>(_1360);
    float _1522 = -_1502;
    float _1524 = -_1470;
    float _1526 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1524);
    bool _1528 = _1098 > 0.0;
    float _1530 = -_1476;
    float _1532 = _1530 + 1.0;
    bool _1534 = _1098 >= 0.0;
    bool _1536 = isnan(_1098);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    float _1544 = -_1478;
    float _1546 = _1544 + 1.0;
    int _1548 = int(_1172) + int(_1466);
    int _1550 = ~_1512;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    int _1556 = _1554;
    if (!_1366)
    {
        int _1558 = ~_1512;
        int _1560 = _1558 + 1;
        _1556 = _1560;
    }
    int _1562 = _1556;
    bool _1564 = uint(_1510) >= uint(_563);
    int _1566 = _1506 * _1548;
    int _1568 = _1566 + _938;
    float _1570 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1572 = _1542 ? 0 : 1;
    float _1574 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1576 = !_1564;
    int _1578 = _1576 ? 0 : (-1);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1580;
    bool _1584 = uint(_1568) >= uint(_583);
    float _1586 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1570);
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1590 = _1588 != 0;
    float _1592 = _1582 * _1118;
    bool _1594 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1596 = isnan(_535);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1574);
    int _1608 = ~_1572;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    int _1614 = _1612;
    if (!_1528)
    {
        int _1616 = ~_1572;
        int _1618 = _1616 + 1;
        _1614 = _1618;
    }
    int _1620 = _1614;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1624 = _535 + _1622;
    bool _1626 = !_1584;
    int _1628 = _1626 ? 0 : (-1);
    float _1630 = -_1604;
    float _1632 = _1630 + 1.0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1644 = _1642 != 0;
    float _1646 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1648 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1650 = isnan(_535);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    bool _1660 = !_1166;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1646);
    float _1666 = fma(_1592, _1624, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1668 = _1658 * _1632;
    float _1670 = _1520 + 0.5;
    float _1672 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1664);
    bool _1674 = _1148 >= 0.0;
    bool _1676 = isnan(_1148);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.0);
    bool _1682 = _1678 || _1680;
    float _1684 = _1666 * _1668;
    float _1686 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1474);
    float _1688 = -_1658;
    float _1690 = _1688 + 1.0;
    int _1692 = _1682 ? 0 : 1;
    bool _1694 = _1148 > 0.0;
    float _1696 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1684);
    float _1698 = -_1516;
    float _1700 = fma(_1520, _1698, _1686);
    float _1702 = fma(_1348, _1532, _1526);
    float _1704 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1586);
    float _1706 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1696);
    float _1708 = _1672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1710 = _1154 >> 31;
    float _1712 = _543 + _541;
    int _1714 = _1210 >> 31;
    float _1716 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1606);
    float _1718 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1722 = _1708 + _1720;
    int _1724 = _1710 & 3;
    float _1726 = _1712 + (-1.0);
    float _1728 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1730 = _1714 & 3;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1734 = _1718 + _1732;
    float _1736 = _1722 * _1722;
    int _1738 = _1154 + _1724;
    out.m_66.x = _1700;
    out.m_66.y = _1702;
    float _1740 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1744 = _1728 + _1742;
    float _1746 = fma(_1734, _1734, _1736);
    int _1748 = _1738 >> 2;
    float _1750 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1752 = !_1224;
    int _1754 = _1752 ? 0 : 1;
    float _1756 = fma(_1744, _1744, _1746);
    int _1758 = _1748 << 4;
    int _1760 = _1758 + 368;
    float _1762 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1750);
    int _1764 = _1210 + _1730;
    float _1766 = _547 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1768 = _1164 != 3;
    float _1770 = rsqrt(_1756);
    int _1772 = _1764 >> 2;
    float _1774 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1762);
    int _1776 = ~_1692;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    float _1782 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1784 = _1772 << 4;
    int _1786 = _1784 + 512;
    uint _1788 = uint(int(uint(_1760) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = _1780;
    float _1806 = _1728;
    if (!_1694)
    {
        int _1808 = ~_1692;
        int _1810 = _1808 + 1;
        _1804 = _1810;
    }
    int _1812 = _1804;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1816 = !_1768;
    int _1818 = _1816 ? 0 : (-1);
    out.m_68.w = _1782;
    bool _1820 = _1222 != 3;
    int _1822 = abs(_1238);
    uint _1824 = uint(int(uint(_1786) >> uint(2)));
    uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
    int _1828 = int(_1824) & 3;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[int(_1826)][_1828];
    int _1832 = int(_1824) + 1;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    int _1836 = _1832 & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    bool _1840 = !_1820;
    int _1842 = _1840 ? 0 : (-1);
    bool _1844 = _1774 >= 0.0;
    float _1846 = _1766 * _1770;
    int _1848 = abs(_1322);
    int _1850 = abs(_1332);
    int _1852 = _1760 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    float _1870 = _1722 * _1846;
    float _1872 = _1734 * _1846;
    float _1874 = _1744 * _1846;
    float _1876 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1878 = -_1870;
    float _1880 = _1722 + _1878;
    float _1882 = -_1872;
    float _1884 = _1734 + _1882;
    float _1886 = -_1874;
    float _1888 = _1744 + _1886;
    int _1890 = _1786 + 8;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    float _1908 = _1880 * _1880;
    float _1910 = _874 + (-0.5);
    bool _1912 = !_1636;
    int _1914 = _1912 ? 0 : 1;
    float _1916 = _1872;
    if (_1844)
    {
        out.m_49.x = 0.0;
    }
    float _1918 = fma(_1884, _1884, _1908);
    float _1920 = -_1876;
    float _1922 = -_1442;
    float _1924 = fma(_1920, _1910, _1922);
    int _1926 = abs(_1272);
    float _1928 = -_1546;
    float _1930 = fma(_870, _1928, _1382);
    float _1932 = fma(_1888, _1888, _1918);
    int _1934 = abs(_1220);
    float _1936 = _541 + (-0.5);
    int _1938 = abs(_1662);
    int _1940 = ~_1934;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    int _1946 = ~_1926;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = ~_1938;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = abs(_1754);
    int _1960 = ~_1482;
    int _1962 = _1960 + _1578;
    int _1964 = _1962 + 1;
    int _1966 = _1944 * as_type<int>(_1802);
    int _1968 = ~_1822;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = ~_1548;
    int _1976 = _1974 + _1628;
    int _1978 = _1976 + 1;
    int _1980 = _1956 * as_type<int>(_1794);
    int _1982 = _1980 + _1966;
    int _1984 = abs(_1818);
    int _1986 = _563 * _1964;
    int _1988 = _1986 + _832;
    int _1990 = abs(_1914);
    int _1992 = _1950 * as_type<int>(_1838);
    int _1994 = ~_1958;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = _583 * _1978;
    int _2002 = _2000 + _938;
    bool _2004 = _563 == 0;
    float _2006 = float(_1812);
    int _2008 = _1998 * as_type<int>(_1830);
    int _2010 = _2008 + _1992;
    int _2012 = _1972 * as_type<int>(_1860);
    int _2014 = _2012 + _1982;
    bool _2016 = !_1590;
    int _2018 = _2016 ? 0 : 1;
    int _2020 = abs(_1842);
    int _2022 = abs(_2018);
    int _2024 = ~_1984;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_1848;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = ~_2020;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2028 * as_type<int>(_1868);
    int _2044 = _2042 + _2014;
    float _2046 = float(_1990);
    int _2048 = _2034 * as_type<int>(_1898);
    int _2050 = _2048 + _2010;
    float _2052 = in.m_70.x;
    float _2054 = in.m_70.y;
    float _2056 = in.m_70.z;
    int _2058 = _2040 * as_type<int>(_1906);
    int _2060 = _2058 + _2050;
    float _2062 = sqrt(_1932);
    int _2064 = ~_1850;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = -_1480;
    float _2072 = _2070 + 1.0;
    int _2074 = ~_2022;
    int _2076 = _2074 + 1;
    int _2078 = _2076 + 1;
    float _2080 = _2046 * _2006;
    bool _2082 = !_2004;
    int _2084 = _2082 ? _1988 : (-1);
    int _2086 = _2044 * _2068;
    bool _2088 = !_954;
    int _2090 = _2088 ? _2002 : (-1);
    int _2092 = _2060 * _2078;
    float _2094 = fma(_874, _2072, _1924);
    int _2096 = _2084 * _1850;
    int _2098 = _2096 + _2086;
    if (_1844)
    {
        _1214 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2100 = _1214;
    float _2102 = _2080 * (-2.0);
    int _2104 = _2090 * _2022;
    int _2106 = _2104 + _2092;
    bool _2108 = !_1640;
    int _2110 = _2108 ? 0 : 1;
    out.m_72.x = _1930;
    out.m_72.y = _2094;
    float _2112 = _1770 * _2062;
    int _2114 = as_type<int>(_2100);
    if (_1844)
    {
        float _2116 = _2100 * 5.0;
        _2114 = as_type<int>(_2116);
    }
    int _2118 = _2114;
    float _2120 = float(_2098);
    float _2122 = fma(_2102, _2052, _2052);
    float _2124 = float(_2106);
    float _2126 = _547 * _2112;
    if (_1844)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6724 = as_type<float>(_2118);
        out.gl_Position.z = _6724;
    }
    float _2128 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2122);
    float _2130 = _543 + _756;
    float _2132 = float(_1562);
    out.m_74.x = _2120;
    out.m_74.y = _2124;
    float _2134 = fma(_1740, _2102, _1740);
    float _2136 = _2130 + (-1.0);
    out.m_76.x = _2126;
    bool _2138 = !_1644;
    int _2140 = _2138 ? 0 : 1;
    int _2142 = abs(_2110);
    if (_1844)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2144 = -_1870;
    float _2146 = _1708 + _2144;
    int _2148 = abs(_2140);
    float _2150 = -_1872;
    float _2152 = _1718 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2146 + _2154;
    float _2158 = -_1874;
    float _2160 = _1728 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2164 = _2152 + _2162;
    float _2166 = float(_2142);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2172 = _2160 + _2170;
    float _2174 = float(_1620);
    float _2176 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2168);
    float _2180 = _2166 * _2132;
    float _2182 = float(_2148);
    float _2184 = _543 + (-0.5);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2178);
    float _2188 = _2180 * (-2.0);
    float _2190 = _756 + _541;
    float _2192 = _2182 * _2174;
    float _2194 = fma(_2134, _1486, _2128);
    bool _2196 = _2186 >= 0.0;
    float _2198 = fma(_2188, _2054, _2054);
    float _2200 = fma(_2176, _2188, _2176);
    float _2202 = _2190 + (-1.0);
    float _2204 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2198);
    float _2206 = _2192 * (-2.0);
    float _2208 = _2194 * 0.15915493667125701904296875;
    float _2210 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2212 = fma(_2200, _1486, _2204);
    float _2214 = fma(_2206, _2056, _2056);
    float _2216 = _756 + (-0.5);
    float _2218 = _2208 * 6.283185482025146484375;
    float _2220 = sin(_2218);
    float _2222 = _2212 * 0.15915493667125701904296875;
    float _2224 = _2176;
    float _2226 = _2164;
    float _2228 = _2172;
    if (_2196)
    {
        _2224 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2230 = _2224;
    float _2232 = fma(_2210, _2206, _2210);
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2214);
    int _2236 = as_type<int>(_2230);
    if (_2196)
    {
        out.m_49.x = 0.0;
    }
    if (_2196)
    {
        float _2238 = _2230 * 5.0;
        _2236 = as_type<int>(_2238);
    }
    int _2240 = _2236;
    float _2242 = _2208 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = fma(_2232, _1486, _2234);
    if (_2196)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6927 = as_type<float>(_2240);
        out.gl_Position.z = _6927;
    }
    float _2248 = _2246 * 0.15915493667125701904296875;
    float _2250 = _2222 * 6.283185482025146484375;
    float _2252 = sin(_2250);
    float _2254 = _2222 * 6.283185482025146484375;
    float _2256 = cos(_2254);
    if (_2196)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2258 = _2248 * 6.283185482025146484375;
    float _2260 = cos(_2258);
    float _2262 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2266 = _2220 * _2252;
    float _2268 = _2244 * _2256;
    float _2270 = _2262 * _2112;
    float _2272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2274 = _2220 * _2256;
    float _2276 = _2248 * 6.283185482025146484375;
    float _2278 = sin(_2276);
    float _2280 = _2270 * _2264;
    float _2282 = _2244 * _2252;
    float _2284 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2286 = _2284 * 0.5;
    float _2288 = _2244 * _2260;
    float _2290 = _2256 * _2260;
    float _2292 = _2220 * _2260;
    float _2294 = _2252 * _2260;
    float _2296 = _2126 * _2272;
    float _2298 = _2288 * _2280;
    float _2300 = fma(_2278, _2268, _2266);
    float _2302 = -_2274;
    float _2304 = fma(_2278, _2282, _2302);
    float _2306 = -_2280;
    float _2308 = _2278 * _2306;
    float _2310 = -_2282;
    float _2312 = fma(_2278, _2274, _2310);
    float _2314 = fma(_2300, _2296, _2298);
    float _2316 = _2292 * _2280;
    float _2318 = fma(_2290, _2296, _2308);
    float _2320 = fma(_2304, _2286, _2314);
    float _2322 = fma(_2278, _2266, _2268);
    float _2324 = fma(_2312, _2296, _2316);
    float _2326 = fma(_2294, _2286, _2318);
    float _2328 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2330 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2332 = fma(_2322, _2286, _2324);
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2328);
    float _2336 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2330);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2342 = _2338 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2344 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2346 = _1728 + _2342;
    float _2348 = _1718 + _2344;
    float _2350 = _2320 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2346 + _2354;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2360 = _2348 + _2358;
    float _2362 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2364 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2352);
    float _2366 = _2356 * _2356;
    float _2368 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2370 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2364);
    float _2372 = fma(_2360, _2360, _2366);
    float _2374 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2376 = sqrt(_2372);
    float _2378 = _1708 + _2374;
    bool _2380 = _2376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2368;
    float _2384 = _2374;
    float _2386 = _2352;
    float _2388 = _2296;
    if (!_2380)
    {
        _2382 = _2348;
    }
    float _2390 = _2382;
    float _2392 = _2390;
    if (!_2380)
    {
        _2384 = _2346;
    }
    float _2394 = _2384;
    float _2396 = _2394;
    if (!_2380)
    {
        _2386 = _2378;
    }
    float _2398 = _2386;
    bool _2400 = !_2380;
    float _2402 = _2398;
    if (!_2400)
    {
        float _2404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2408 = _2376 + _2406;
        float _2410 = rsqrt(_2372);
        float _2412 = _2408 * _2404;
        float _2414 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = _2412 * 0.15915493667125701904296875;
        float _2418 = _2416 * 6.283185482025146484375;
        float _2420 = cos(_2418);
        float _2422 = _2416 * 6.283185482025146484375;
        float _2424 = sin(_2422);
        float _2426 = _2420 + (-1.0);
        float _2428 = fma(_2424, _2414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2432 = _2410 * _2428;
        float _2434 = fma(_2378, _2420, _2430);
        float _2436 = fma(_2360, _2432, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2438 = fma(_2356, _2432, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2402 = _2434;
        _2392 = _2436;
        _2396 = _2438;
        _2388 = _2416;
    }
    float _2440 = _2402;
    float _2442 = _2392;
    float _2444 = _2396;
    float _2446 = _2388;
    float _2448 = -_1708;
    float _2450 = _2448 + _2440;
    float _2452 = -_1718;
    float _2454 = _2452 + _2442;
    float _2456 = -_1728;
    float _2458 = _2456 + _2444;
    float _2460 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2462 = _2450 * _2450;
    float _2464 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2466 = 1.0 / _2460;
    float _2468 = fma(_2454, _2454, _2462);
    float _2470 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2464);
    bool _2472 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2474 = isnan(0.5);
    bool _2476 = _2472 || _2474;
    bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2480 = _2476 || _2478;
    float _2482 = fma(_2458, _2458, _2468);
    float _2484 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2470);
    bool _2486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2488 = isnan(0.5);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2494 = _2490 || _2492;
    float _2496 = sqrt(_2482);
    float _2498 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2500 = _2498 + _2460;
    float _2502 = _2500 * _2466;
    float _2504 = _2502 * 0.5;
    bool _2506 = _2496 > 0.0;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2510 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2508);
    float _2512 = 1.0 / _2510;
    float _2514 = _2504;
    float _2516 = _2466;
    float _2518 = _2446;
    if (!_2506)
    {
        _2514 = _2442;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2506)
    {
        _2516 = _2440;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (!_2506)
    {
        _2518 = _2444;
    }
    float _2528 = _2518;
    bool _2530 = !_2506;
    float _2532 = _2528;
    float _2534 = _2528;
    if (!_2530)
    {
        float _2536 = _211 * _211;
        float _2538 = fma(_209, _209, _2536);
        float _2540 = rsqrt(_2482);
        float _2542 = fma(_213, _213, _2538);
        float _2544 = sqrt(_2542);
        float _2546 = _2454 * _2540;
        float _2548 = _2450 * _2540;
        float _2550 = _2458 * _2540;
        bool _2552 = _2544 > 0.0;
        float _2554 = _2540;
        float _2556 = _2544;
        if (!_2552)
        {
            _2554 = _2442;
        }
        float _2558 = _2554;
        _2522 = _2558;
        if (!_2552)
        {
            _2556 = _2440;
        }
        float _2560 = _2556;
        _2526 = _2560;
        if (!_2552)
        {
            _2532 = _2444;
        }
        float _2562 = _2532;
        bool _2564 = !_2552;
        _2534 = _2562;
        if (!_2564)
        {
            float _2566 = rsqrt(_2542);
            float _2568 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2570 = _211 * _2566;
            float _2572 = _209 * _2566;
            float _2574 = _2548 * _2570;
            float _2576 = _213 * _2566;
            float _2578 = fma(_2546, _2572, _2574);
            float _2580 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2582 = fma(_2550, _2576, _2578);
            float _2584 = _2582 * _2580;
            float _2586 = fma(_209, _2584, _2442);
            float _2588 = fma(_211, _2584, _2440);
            float _2590 = fma(_213, _2584, _2444);
            _2522 = _2586;
            _2526 = _2588;
            _2534 = _2590;
        }
    }
    float _2592 = _2522;
    float _2594 = _2526;
    float _2596 = _2534;
    float _2598 = -_1872;
    float _2600 = _2598 + _2592;
    float _2602 = -_1870;
    float _2604 = _2602 + _2594;
    float _2606 = -_1874;
    float _2608 = _2606 + _2596;
    float _2610 = _2604;
    float _2612 = _2600;
    float _2614 = _2608;
    if (_2494)
    {
        _221 = 1.0;
    }
    float _2616 = _221;
    float _2618 = _2616;
    if (!_2480)
    {
        float _2620 = _2156 * _2156;
        float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2624 = -_1728;
        float _2626 = _2624 + _2596;
        float _2628 = -_1708;
        float _2630 = _2628 + _2594;
        float _2632 = fma(_2164, _2164, _2620);
        float _2634 = fma(_2172, _2172, _2632);
        float _2636 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2638 = sqrt(_2634);
        float _2640 = 1.0 / _2112;
        float _2642 = precise::min(_2638, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2644 = _2642 * _2622;
        float _2646 = _2636 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2648 = -_1718;
        float _2650 = _2648 + _2592;
        float _2652 = _2644 * _2640;
        float _2654 = _2646 * _2652;
        float _2656 = _2626 * _2652;
        float _2658 = fma(_2630, _2654, _2146);
        float _2660 = fma(_2650, _2654, _2152);
        float _2662 = fma(_2646, _2656, _2160);
        _2610 = _2658;
        _2612 = _2660;
        _2614 = _2662;
        _2226 = _2638;
        _1806 = _2656;
    }
    float _2664 = _2610;
    float _2666 = _2612;
    float _2668 = _2614;
    float _2670 = _2226;
    float _2672 = _1806;
    float _2674 = _2670;
    float _2676 = _2672;
    if (_2494)
    {
        _1916 = 1.0;
    }
    float _2678 = _1916;
    float _2680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2682 = _2512 * _2680;
    float _2684 = _2678;
    if (!_2494)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2694 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2692;
        float _2696 = _2688 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = _2690 * 0.15915493667125701904296875;
        float _2702 = _2688 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = 1.0 / _2698;
        float _2708 = _2700 * 6.283185482025146484375;
        float _2710 = cos(_2708);
        float _2712 = _2704 * _2706;
        float _2714 = _2700 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2710 * _2712;
        float _2720 = 1.0 / _2694;
        float _2722 = 1.0 / _2718;
        float _2724 = _2716 * _2722;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2728 = fma(_2682, _2724, _2726);
        float _2730 = _2728 * _2720;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        _2228 = _2700;
        _2674 = _2712;
        _2618 = _2732;
    }
    float _2734 = _2228;
    float _2736 = _2674;
    float _2738 = _2618;
    float _2740 = _2734;
    float _2742 = _2736;
    if (!_2494)
    {
        float _2744 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2746 = _2744 * 0.15915493667125701904296875;
        float _2748 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2750 = _2746 * 6.283185482025146484375;
        float _2752 = cos(_2750);
        float _2754 = _2748 * 0.15915493667125701904296875;
        float _2756 = _2746 * 6.283185482025146484375;
        float _2758 = sin(_2756);
        float _2760 = 1.0 / _2752;
        float _2762 = _2754 * 6.283185482025146484375;
        float _2764 = cos(_2762);
        float _2766 = _2758 * _2760;
        float _2768 = _2754 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = _2764 * _2766;
        float _2774 = 1.0 / _2772;
        float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2778 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2776;
        float _2780 = 1.0 / _2778;
        float _2782 = _2770 * _2774;
        float _2784 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2786 = fma(_2682, _2782, _2784);
        float _2788 = _2786 * _2780;
        float _2790 = precise::clamp(_2788, 0.0, 1.0);
        float _2792 = -_2790;
        float _2794 = _2792 + 1.0;
        _2740 = _2760;
        _2742 = _2772;
        _2684 = _2794;
    }
    float _2796 = _2740;
    float _2798 = _2742;
    float _2800 = _2684;
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2804 = _2664 + _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2808 = _2666 + _2806;
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2812 = _2668 + _2810;
    float _2814 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2816 = _2804 * _2804;
    float _2818 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2814);
    float _2820 = fma(_2808, _2808, _2816);
    float _2822 = fma(_2812, _2812, _2820);
    float _2824 = rsqrt(_2822);
    float _2826 = sqrt(_2822);
    float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2830 = _2808 * _2828;
    float _2832 = _2812 * _2828;
    float _2834 = _2830 * _2830;
    float _2836 = _2832 * _2832;
    float _2838 = _2834 + _2836;
    float _2840 = sqrt(_2838);
    bool _2842 = _2840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2846 = _2840 + _2844;
    float _2848 = _2796;
    float _2850 = _2838;
    float _2852 = _2846;
    float _2854 = _2798;
    float _2856 = _2804;
    if (_2842)
    {
        float _2858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2848 = _2858;
    }
    float _2860 = _2848;
    if (_2842)
    {
        float _2862 = rsqrt(_2838);
        _2850 = _2862;
    }
    float _2864 = _2850;
    float _2866 = _2864;
    if (_2842)
    {
        float _2868 = _2846 * _2860;
        _2852 = _2868;
    }
    float _2870 = _2852;
    if (_2842)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2854 = _2872;
    }
    float _2874 = _2854;
    float _2876 = _2812;
    float _2878 = _2874;
    if (_2842)
    {
        float _2880 = _2874 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        _2876 = _2882;
    }
    float _2884 = _2876;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2888 = precise::max(0.0, _2886);
    float _2890 = _2860;
    if (_2842)
    {
        float _2892 = _2874 * 6.283185482025146484375;
        float _2894 = cos(_2892);
        _2890 = _2894;
    }
    float _2896 = _2890;
    float _2898 = -_2828;
    float _2900 = -_2888;
    float _2902 = fma(_2804, _2898, _2900);
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2842)
    {
        float _2906 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2856 = _2906;
    }
    float _2908 = _2856;
    float _2910 = _2908;
    if (!_2842)
    {
        _2878 = _2830;
    }
    float _2912 = _2878;
    float _2914 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2916 = _2884;
    float _2918 = _2912;
    if (_2842)
    {
        float _2920 = fma(_2884, _2908, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2916 = _2920;
    }
    float _2922 = _2916;
    float _2924 = _2922;
    if (!_2842)
    {
        _2910 = _2902;
    }
    float _2926 = _2910;
    float _2928 = _2926;
    float _2930 = _2896;
    if (_2842)
    {
        float _2932 = _2896 + (-1.0);
        _2904 = _2932;
    }
    float _2934 = _2904;
    float _2936 = _2934;
    if (_2842)
    {
        float _2938 = _2864 * _2922;
        _2676 = _2938;
    }
    float _2940 = _2676;
    if (!_2842)
    {
        _2866 = _2832;
    }
    float _2942 = _2866;
    float _2944 = _2942;
    if (_2842)
    {
        float _2946 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _2946;
    }
    float _2948 = _2936;
    if (_2842)
    {
        float _2950 = _2830 * _2940;
        _2918 = _2950;
    }
    float _2952 = _2918;
    if (!_2842)
    {
        _2924 = _2834;
    }
    float _2954 = _2924;
    float _2956 = _2954;
    if (_2842)
    {
        float _2958 = _2832 * _2940;
        _2944 = _2958;
    }
    float _2960 = _2944;
    if (_2842)
    {
        float _2962 = fma(_2902, _2896, _2948);
        _2928 = _2962;
    }
    float _2964 = _2928;
    if (_2842)
    {
        float _2966 = _2952 * _2952;
        _2956 = _2966;
    }
    float _2968 = _2956;
    if (!_2842)
    {
        _2930 = _2836;
    }
    float _2970 = _2930;
    float _2972 = _2970;
    if (_2842)
    {
        float _2974 = _2960 * _2960;
        _2972 = _2974;
    }
    float _2976 = _2972;
    float _2978 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2980 = fma(_2964, _2964, _2968);
    float _2982 = floor(_2914);
    float _2984 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2978);
    float _2986 = _2980 + _2976;
    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2990 = fma(_2826, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2988);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2984);
    float _2996 = rsqrt(_2986);
    float _2998 = -_2992;
    float _3000 = _2998 + 1.0;
    float _3002 = _2994 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3004 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3006 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3010 = abs(_3000);
    float _3012 = log2(_3010);
    float _3014 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3018 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3006);
    float _3020 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = -_3016;
    float _3024 = fma(_3022, _3008, 1.0);
    float _3026 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3018);
    float _3028 = _2996 * _2952;
    float _3030 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3032 = _2996 * _2964;
    float _3034 = _2996 * _2960;
    float _3036 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3038 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3040 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3042 = floor(_3004);
    float _3044 = -_3036;
    float _3046 = fma(_3032, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3044);
    float _3048 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3050 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3052 = -_3034;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3046);
    float _3056 = fma(_2668, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2818);
    float _3058 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3048);
    float _3060 = exp2(_3050);
    float _3062 = fma(_3054, -0.5, 0.5);
    float _3064 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3066 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3058);
    float _3068 = fma(_3054, 0.5, 0.5);
    float _3070 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3072 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3066);
    float _3074 = log2(_3024);
    float _3076 = -_3042;
    float _3078 = _3004 + _3076;
    float _3080 = fma(_3068, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3082 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3070);
    float _3084 = fma(_3068, _3080, -0.212114393711090087890625);
    float _3086 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3082);
    float _3088 = 1.0 / _3072;
    float _3090 = -_2982;
    float _3092 = _2914 + _3090;
    float _3094 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3096 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3094);
    float _3098 = _3032 + 1.0;
    float _3100 = sqrt(_3062);
    float _3102 = _3074 * 0.693147182464599609375;
    float _3104 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3096);
    float _3106 = -_3032;
    float _3108 = fma(_3060, _3098, _3106);
    float _3110 = fma(_3068, _3084, 1.570728778839111328125);
    float2 _8280 = float2(_3092, _3078);
    float _3112 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8280, float2(0.0), isnan(_8280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8280, float2(0.0), isnan(_8280)), level(0.0)).x;
    float _3114 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3104);
    float _3116 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3086);
    float _3118 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3120 = fma(_3108, 0.5, 0.5);
    float _3122 = _3114 * _3088;
    float _3124 = _3116 * _3088;
    float _3126 = fma(_3122, 0.5, 0.5);
    float _3128 = fma(_3124, -0.5, 0.5);
    float _3130 = _3100 * 0.636619746685028076171875;
    float _3132 = -_3110;
    float _3134 = fma(_3130, _3132, 1.0);
    float3 _8325 = float3(_3126, _3128, _3118);
    float _3136 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8325, float3(0.0), isnan(_8325)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8325, float3(0.0), isnan(_8325)), level(0.0)).x;
    float3 _8336 = float3(_3126, _3128, _3118);
    float4 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8336, float3(0.0), isnan(_8336)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8336, float3(0.0), isnan(_8336)), level(0.0)).xyzw;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = _3139.w;
    float2 _8352 = float2(_3134, _3120);
    float3 _3151 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8352, float2(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8352, float2(0.0), isnan(_8352)), level(0.0)).xyz;
    float _3153 = _3151.x;
    float _3155 = _3151.y;
    float _3157 = _3151.z;
    float _3159 = abs(_2682);
    float _3161 = log2(_3159);
    float _3163 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3165 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3167 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3169 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3171 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3163);
    float _3173 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3165);
    float _3175 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3167);
    float _3177 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3179 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3181 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3183 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3185 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3187 = -_2278;
    float _3189 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3169);
    float _3191 = -_2278;
    float _3193 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3179);
    float _3195 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3197 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3199 = -_2278;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3177);
    float _3203 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3181);
    float _3205 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3183);
    float _3207 = exp2(_3197);
    float _3209 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3185);
    float _3211 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3213 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3203);
    float _3215 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3205);
    float _3217 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3209);
    float _3219 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3171);
    float _3221 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3189);
    float _3223 = fma(_3195, _3195, 1.0);
    float _3225 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3227 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3229 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3231 = rsqrt(_3223);
    float _3233 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3173);
    float _3235 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3237 = fma(_3207, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3175);
    float _3243 = _3195 * _3221;
    float _3245 = _3239 * _3239;
    float _3247 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3229);
    float _3249 = fma(_3239, -2.0, 3.0);
    float _3251 = _3195 * _3211;
    float _3253 = exp2(_3235);
    float _3255 = fma(_3225, _3233, _3243);
    float _3257 = _3245 * _3249;
    float _3259 = fma(_3225, _3219, _3251);
    float _3261 = _3195 * _3227;
    float _3263 = _3195 * _3231;
    float _3265 = -_3257;
    float _3267 = _3265 + 1.0;
    out.m_78.x = _3219;
    out.m_78.y = _3233;
    out.m_78.z = _3241;
    float _3269 = fma(_3225, _3241, _3261);
    float _3271 = -_3213;
    float _3273 = _3263 * _3271;
    float _3275 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3257);
    float _3277 = fma(_3002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3247);
    float _3279 = in.m_80.x;
    float _3281 = fma(_3231, _3211, _3273);
    float _3283 = _3213 + _3259;
    float _3285 = _3215 + _3255;
    float _3287 = -_3253;
    float _3289 = _3287 + 1.0;
    out.m_82.x = _2666;
    out.m_82.y = _2664;
    out.m_82.z = _2668;
    bool _3291 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3293 = isnan(_2826);
    bool _3295 = _3291 || _3293;
    bool _3297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3299 = _3295 || _3297;
    float _3301 = -_3215;
    float _3303 = _3263 * _3301;
    float _3305 = -_3217;
    float _3307 = _3263 * _3305;
    float _3309 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3311 = fma(_3231, _3221, _3303);
    bool _3313 = _2682 <= 8000.0;
    bool _3315 = isnan(_2682);
    bool _3317 = _3313 || _3315;
    bool _3319 = isnan(8000.0);
    bool _3321 = _3317 || _3319;
    float _3323 = float(_3321);
    float _3325 = fma(_3231, _3227, _3307);
    float _3327 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3277);
    float _3329 = _3072 * 0.5;
    float _3331 = _3114 + _3072;
    float _3333 = _3323 * _3275;
    out.m_84.x = _3281;
    out.m_84.y = _3311;
    out.m_84.z = _3325;
    float _3335 = _3327 + _3072;
    float _3337 = fma(_3116, -0.5, _3329);
    float _3339 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3114;
    out.gl_Position.y = _3116;
    out.gl_Position.z = _3327;
    out.gl_Position.w = _3072;
    float _3341 = _3335 * 0.5;
    float _3343 = _3217 + _3269;
    float _3345 = _3331 * 0.5;
    out.m_86.x = _3283;
    out.m_86.y = _3285;
    out.m_86.z = _3343;
    float _3347 = _3215;
    float _3349 = _3325;
    float _3351 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3299)
    {
        _3347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3353 = _3347;
    float _3355 = _3353;
    float _3357 = _3353;
    if (!_3299)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3359 = _3349;
    out.m_88.z = _3341;
    out.m_88.w = _3072;
    out.m_90.x = _3345;
    out.m_90.y = _3337;
    out.m_90.z = _3341;
    out.m_90.w = _3072;
    float _3361 = -_3112;
    float _3363 = _3361 + 1.0;
    float _3365 = _3363 * _3339;
    float _3367 = precise::clamp(_3365, 0.0, 1.0);
    float _3369 = -_3367;
    float _3371 = fma(_3369, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3373 = _3143;
    float _3375 = _3359;
    float _3377 = _3359;
    if (!_3299)
    {
        _3351 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3379 = _3351;
    float _3381 = _3371 * _3279;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3385 = _3309 * _3136;
    float _3387 = -_3309;
    float _3389 = _3387 + 1.0;
    float _3391 = _3147 * _3385;
    float _3393 = _3157 * _3385;
    float _3395 = _3147 * _3389;
    out.m_92.x = _3383;
    float _3397 = fma(_3153, _3391, _3141);
    float _3399 = fma(_3155, _3391, _3143);
    float _3401 = fma(_3147, _3393, _3145);
    float _3403 = _2738 * _2800;
    float _3405 = _3385;
    float _3407 = _3403;
    float _3409 = _3379;
    float _3411 = _3379;
    if (!_3299)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3413 = _3405;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3299)
    {
        _3373 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3419 = _3373;
    out.m_94.x = _3397;
    out.m_94.y = _3399;
    out.m_94.z = _3401;
    out.m_94.w = _3395;
    float _3421 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3423 = _3419;
    float _3425 = _3419;
    if (!_3299)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3427 = _3407;
    bool _3429 = !_3299;
    float _3431 = _3427;
    float _3433 = _3427;
    if (!_3429)
    {
        bool _3435 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3437 = isnan(_2826);
        bool _3439 = _3435 || _3437;
        bool _3441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3443 = _3439 || _3441;
        if (!_3443)
        {
            float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3447 = _2826 + _3445;
            float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3451 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3449;
            float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3457 = 1.0 / _3451;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3475 = _3447 * _3457;
            float _3477 = precise::clamp(_3475, 0.0, 1.0);
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3483 = fma(_3477, _3455, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3485 = fma(_3477, _3481, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3487 = fma(_3477, _3461, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3489 = fma(_3477, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3491 = fma(_3477, _3469, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3493 = fma(_3477, _3473, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3377 = _3487;
            _3425 = _3491;
            _3357 = _3483;
            _3417 = _3489;
            _3411 = _3485;
            _3433 = _3493;
            _3495 = true;
        }
        else
        {
            bool _3497 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3499 = isnan(_2826);
            bool _3501 = _3497 || _3499;
            bool _3503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3505 = _3501 || _3503;
            if (!_3505)
            {
                _3355 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3507 = _3355;
            _3357 = _3507;
            if (!_3505)
            {
                _3375 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3509 = _3375;
            _3377 = _3509;
            if (!_3505)
            {
                _3409 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3511 = _3409;
            _3411 = _3511;
            if (!_3505)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3513 = _3415;
            _3417 = _3513;
            if (!_3505)
            {
                _3423 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3515 = _3423;
            _3425 = _3515;
            if (!_3505)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3517 = _3431;
            bool _3519 = !_3505;
            _3433 = _3517;
            if (!_3519)
            {
                bool _3521 = _2826 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3523 = isnan(_2826);
                bool _3525 = _3521 || _3523;
                bool _3527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3529 = _3525 || _3527;
                if (!_3529)
                {
                    float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3533 = _2826 + _3531;
                    float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3537 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3535;
                    float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3541 = _3539 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3543 = 1.0 / _3537;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3561 = _3533 * _3543;
                    float _3563 = precise::clamp(_3561, 0.0, 1.0);
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3569 = fma(_3563, _3541, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3571 = fma(_3563, _3567, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3573 = fma(_3563, _3547, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3575 = fma(_3563, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3577 = fma(_3563, _3555, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3579 = fma(_3563, _3559, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3377 = _3573;
                    _3425 = _3577;
                    _3357 = _3569;
                    _3417 = _3575;
                    _3411 = _3571;
                    _3433 = _3579;
                    _3495 = true;
                }
                else
                {
                    _3377 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3425 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3357 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3411 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3495 = false;
    float _3581 = _3377;
    float _3583 = _3425;
    float _3585 = _3357;
    float _3587 = _3417;
    float _3589 = _3411;
    float _3591 = _3433;
    float _3593 = fma(_3285, -0.5, 0.5);
    float _3595 = precise::clamp(_3593, 0.0, 1.0);
    float _3597 = -_3581;
    float _3599 = _3597 + _3583;
    float _3601 = _3421 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3603 = -_3585;
    float _3605 = _3603 + _3587;
    float _3607 = fma(_3595, _3599, _3581);
    out.m_96.x = 0.0;
    float _3609 = -_3589;
    float _3611 = _3609 + _3591;
    float _3613 = fma(_3595, _3605, _3585);
    float _3615 = _3607 * 0.586610972881317138671875;
    out.m_49.x = _3601;
    bool _3617 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3619 = fma(_3595, _3611, _3589);
    float _3621 = fma(_3613, 0.298911988735198974609375, _3615);
    bool _3623 = _2738 > 0.0;
    bool _3625 = isnan(_2738);
    bool _3627 = _3623 || _3625;
    bool _3629 = isnan(0.0);
    bool _3631 = _3627 || _3629;
    float _3633 = fma(_3619, 0.114477999508380889892578125, _3621);
    bool _3635 = _2800 <= 0.0;
    bool _3637 = !_3631;
    bool _3639 = _3635 || _3637;
    float _3641 = -_3633;
    float _3643 = _3607 + _3641;
    float _3645 = -_3633;
    float _3647 = _3613 + _3645;
    float _3649 = -_3633;
    float _3651 = _3619 + _3649;
    float _3653 = fma(_3643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    float _3655 = fma(_3647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    float _3657 = fma(_3651, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3633);
    bool _3659 = !_3617;
    if (!_3659)
    {
        float _3661 = -_2664;
        float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3665 = -_2666;
        float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3669 = -_2668;
        float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3673 = _3663 * _3663;
        float _3675 = fma(_3667, _3667, _3673);
        float _3677 = fma(_3671, _3671, _3675);
        float _3679 = sqrt(_3677);
        float _3681 = rsqrt(_3677);
        float _3683 = -_3679;
        float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3687 = _3685 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3689 = precise::clamp(_3687, 0.0, 1.0);
        float _3691 = _3667 * _3681;
        float _3693 = _3663 * _3681;
        float _3695 = abs(_3689);
        float _3697 = log2(_3695);
        float _3699 = _3671 * _3681;
        float _3701 = _3691 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3703 = _3285 * _3693;
        float _3705 = -_3693;
        float _3707 = -_3701;
        float _3709 = fma(_3705, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3707);
        float _3711 = fma(_3283, _3691, _3703);
        float _3713 = -_3699;
        float _3715 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3709);
        float _3717 = fma(_3343, _3699, _3711);
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3723 = _3715 + _3721;
        float _3725 = _3697 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3727 = _3723 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3729 = precise::clamp(_3727, 0.0, 1.0);
        float _3731 = exp2(_3725);
        float _3733 = _3731 * _3729;
        float _3735 = _3719 * _3733;
        float _3737 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3739 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3741 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3737;
        out.m_96.y = _3739;
        out.m_96.z = _3741;
    }
    out.m_98.x = _3655;
    out.m_98.y = _3653;
    out.m_98.z = _3657;
    if (!_3639)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3743;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

