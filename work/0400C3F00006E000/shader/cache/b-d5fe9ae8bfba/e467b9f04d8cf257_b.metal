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
    float4 m_66 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2770 = false;
    bool _603 = false;
    bool _429 = false;
    bool _323 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3074 = as_type<float>(_121);
        out.gl_Position.z = _3074;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_53.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3146 = as_type<float>(_161);
        out.gl_Position.z = _3146;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_60.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _145;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _249;
    float _275 = _265 * _253;
    float _277 = -_265;
    float _279 = _277 + 1.0;
    float _281 = _233 * _273;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _287 * _275;
    float _293 = _289 * _275;
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _291);
    float _297 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _293);
    float _299 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _295);
    float _301 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _297);
    bool _303 = !_271;
    float _321;
    if (!_303)
    {
        float _305 = in.m_60.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        _321 = _145;
    }
    _323 = false;
    float _325 = _321;
    float _327 = in.m_62.x;
    float _329 = in.m_62.y;
    bool _331 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _333 = isnan(_325);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _347 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _349 = isnan(_325);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _325 + _363;
    float _367 = -_341;
    float _369 = _367 + 1.0;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _373 = 1.0 / _345;
    float _375 = _357 * _369;
    float _377 = -_357;
    float _379 = _377 + 1.0;
    float _381 = _301 * _329;
    float _383 = _299 * _327;
    float _385 = _361 * _373;
    float _387 = fma(_385, _365, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _389 = _387 * _375;
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[115].x, _389);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _399 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[116].x, _391);
    float _401 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _399 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _401;
    out.m_64.y = _403;
    out.m_64.z = _405;
    out.m_64.w = _407;
    bool _409 = !_371;
    float _427;
    if (!_409)
    {
        float _411 = in.m_60.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _145;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _461 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _463 = isnan(_431);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _439;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _479;
    bool _483 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _485 = isnan(_431);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _471 * _477;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _503 = 1.0 / _455;
    float _505 = _493 * _499;
    float _507 = -_493;
    float _509 = _507 + 1.0;
    float _511 = 1.0 / _459;
    float _513 = _481 * _473;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _519 = fma(_513, _435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _521 = _517 * _503;
    bool _523 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _525 = isnan(_431);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _541 = _431 + _539;
    float _543 = _519 * _505;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _547 = _431 + _545;
    float _549 = -_533;
    float _551 = _549 + 1.0;
    float _553 = fma(_521, _541, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _555 = _537 * _511;
    float _557 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[131].x, _543);
    float _559 = _451 * _551;
    float _561 = fma(_555, _547, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _563 = fma(_553, _495, _557);
    float _565 = fma(_561, _559, _563);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _573 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[134].x, _565);
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _573 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _575;
    out.m_66.y = _577;
    out.m_66.z = _579;
    out.m_66.w = _581;
    bool _583 = !_501;
    float _601;
    if (!_583)
    {
        float _585 = in.m_60.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        _601 = _145;
    }
    _603 = false;
    float _605 = _601;
    float _607 = in.m_60.x;
    float _609 = in.m_60.y;
    float _611 = in.m_60.z;
    float _613 = in.m_60.w;
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _627 = _625 != 0;
    float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _635 = 1.0 / _633;
    float _637 = _607 * 2.0;
    bool _639 = _607 > 0.5;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _643 = _613 > 0.5;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _649 = -_189;
    int _651 = _639 ? as_type<int>(_649) : as_type<int>(_189);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _659 = _657 != 0;
    float _661 = 1.0 / _647;
    bool _663 = !_619;
    float _665 = _663 ? _189 : as_type<float>(_651);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _675 = _673 != 0;
    float _677 = _609 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _679 = in.m_46.x;
    float _681 = in.m_46.y;
    float _683 = in.m_46.z;
    bool _685 = _609 > 0.5;
    float _687 = fma(_677, -2.0, _667);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _693 = -_199;
    int _695 = _685 ? as_type<int>(_693) : as_type<int>(_199);
    float _697 = 1.0 / _655;
    bool _699 = !_623;
    float _701 = _699 ? _199 : as_type<float>(_695);
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = _607 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _709 = 1.0 / _691;
    float _711 = -_641;
    float _713 = fma(_707, 2.0, _711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _731 = _721 * _697;
    float _733 = _681 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _735 = _681 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _737 = _681 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _739 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[4].x, _733);
    float _741 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[5].x, _735);
    float _743 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[6].x, _737);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _749 = 1.0 / _725;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _763 = _753 * _661;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _769 = _717 * _709;
    float _771 = 1.0 / _747;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _773;
    float _777 = -_189;
    int _779 = _685 ? as_type<int>(_777) : as_type<int>(_189);
    float _781 = _767 * _635;
    bool _783 = _611 > 0.5;
    float _785 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[5].z, _741);
    float _787 = 1.0 / _729;
    float _789 = _775 * _749;
    float _791 = -_189;
    int _793 = _783 ? as_type<int>(_791) : as_type<int>(_189);
    float _795 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _797 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _799 = isnan(_605);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    bool _809 = !_659;
    float _811 = _809 ? _189 : as_type<float>(_793);
    float _813 = _761 * _771;
    float _815 = _611 * 2.0;
    float _817 = _609 + _611;
    float _819 = floor(_637);
    bool _821 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _823 = isnan(_605);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _817 + (-1.0);
    bool _835 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _837 = isnan(_605);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = _757 * _787;
    float _849 = -_831;
    float _851 = _849 + 1.0;
    float _853 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = floor(_815);
    bool _857 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _859 = isnan(_605);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _845 * _851;
    float _871 = -_199;
    int _873 = _783 ? as_type<int>(_871) : as_type<int>(_199);
    float _875 = -_845;
    float _877 = _875 + 1.0;
    float _879 = -_867;
    float _881 = _879 + 1.0;
    bool _883 = _819 > 0.0;
    float _885 = _609 + _607;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _889 = _885 + (-1.0);
    bool _891 = !_671;
    float _893 = _891 ? _189 : as_type<float>(_779);
    bool _895 = _855 > 0.0;
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _899 = _855 >= 0.0;
    bool _901 = isnan(_855);
    bool _903 = _899 || _901;
    bool _905 = isnan(0.0);
    bool _907 = _903 || _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _911 = _605 + _909;
    bool _913 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _915 = isnan(_605);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _893 + 0.5;
    int _927 = _907 ? 0 : 1;
    float _929 = fma(_763, _911, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _931 = _819 >= 0.0;
    bool _933 = isnan(_819);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = -_923;
    float _943 = _941 + 1.0;
    float _945 = _923 * _881;
    bool _947 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _949 = isnan(_605);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _961 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[6].z, _743);
    float _963 = _807 * _943;
    float _965 = -_807;
    float _967 = _965 + 1.0;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _971 = _605 + _969;
    bool _973 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _975 = isnan(_605);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = -_957;
    float _987 = _985 + 1.0;
    float _989 = _957 * _967;
    float _991 = fma(_781, _971, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _995 = _605 + _993;
    bool _997 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _999 = isnan(_605);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = _983 * _987;
    float _1011 = -_983;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_769, _995, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1019 = _605 + _1017;
    float _1021 = _959 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1023 = _1007 * _1013;
    float _1025 = -_1007;
    float _1027 = _1025 + 1.0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1031 = _605 + _1029;
    float _1033 = fma(_731, _1019, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1035 = _1019;
    float _1037 = _877;
    float _1039 = _789;
    if (!_705)
    {
        _1035 = _611;
    }
    float _1041 = _1035;
    float _1043 = _831 * _1027;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1047 = _605 + _1045;
    float _1049 = fma(_847, _1031, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1051 = _1041;
    if (_705)
    {
        _1051 = _609;
    }
    float _1053 = _1051;
    float _1055 = _961 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1057 = fma(_813, _1047, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1059 = ~_927;
    int _1061 = _1059 + 1;
    int _1063 = _1061 + 1;
    float _1065 = _929 * _869;
    int _1067 = _1063;
    if (!_895)
    {
        int _1069 = ~_927;
        int _1071 = _1069 + 1;
        _1067 = _1071;
    }
    int _1073 = _1067;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1077 = _605 + _1075;
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1081 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1065);
    float _1083 = -_133;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[76].x, _713);
    float _1087 = fma(_789, _1077, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1089 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[83].w, _887);
    bool _1091 = !_675;
    float _1093 = _1091 ? _199 : as_type<float>(_873);
    float _1095 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1097 = _665 + 0.5;
    float _1099 = fma(_991, _1043, _1081);
    if (!_705)
    {
        _1037 = _609;
    }
    float _1101 = _1037;
    float _1103 = fma(_1095, _1097, _1085);
    float _1105 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _687);
    float _1107 = _1101;
    if (!_705)
    {
        _1039 = _611;
    }
    float _1109 = _1039;
    float _1111 = fma(_1015, _1023, _1099);
    float _1113 = _1109;
    if (_705)
    {
        _1107 = _607;
    }
    float _1115 = _1107;
    float _1117 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_705)
    {
        _1113 = _609;
    }
    float _1119 = _1113;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    float _1135 = _701 + (-0.5);
    float _1137 = fma(_1033, _1009, _1111);
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1141 = -_1117;
    float _1143 = -_1105;
    float _1145 = fma(_1141, _1135, _1143);
    float _1147 = _629 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1153 = fma(_1049, _989, _1137);
    float _1155 = _811 + 0.5;
    float _1157 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1149);
    float _1159 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1161 = _939 ? 0 : 1;
    float _1163 = fma(_1057, _963, _1153);
    float _1165 = -_1121;
    float _1167 = fma(_1159, 2.0, _1165);
    int _1169 = ~_1161;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = -_1093;
    float _1177 = _1175 + 0.5;
    int _1179 = _1173;
    if (!_883)
    {
        int _1181 = ~_1161;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -_133;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1167);
    float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1193 = -_199;
    int _1195 = _643 ? as_type<int>(_1193) : as_type<int>(_199);
    float _1197 = fma(_1147, _1155, _1189);
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1201 = _795 + _1199;
    float _1203 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1207 = fma(_1087, _945, _1163);
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1213 = _1021 + _1211;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1217 = !_627;
    float _1219 = _1217 ? _199 : as_type<float>(_1195);
    float _1221 = fma(_1139, -2.0, _1205);
    float _1223 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1209);
    float _1225 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1215);
    float _1227 = _925 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1229 = _1219 + (-0.5);
    float _1231 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1221);
    float _1233 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1223);
    float _1235 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1055 + _1237;
    float _1241 = -_1203;
    float _1243 = -_1231;
    float _1245 = fma(_1241, _1229, _1243);
    float _1247 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1249 = -_1233;
    float _1251 = _1249 + 1.0;
    float _1253 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1157);
    float _1255 = _1227 * _1191;
    float _1257 = -_1235;
    float _1259 = _1257 + 1.0;
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1225);
    float _1263 = _1201 * _1201;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1267 = -_1251;
    float _1269 = fma(_665, _1267, _1103);
    float _1271 = -_1253;
    float _1273 = _1271 + 1.0;
    bool _1275 = !_1125;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1281 = log2(_1279);
    float _1283 = fma(_1219, _1259, _1245);
    float _1285 = fma(_1213, _1213, _1263);
    bool _1287 = _1261 >= 0.0;
    float _1289 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1265);
    float _1291 = -_1273;
    float _1293 = fma(_811, _1291, _1197);
    int _1295 = abs(_1277);
    float _1297 = fma(_1239, _1239, _1285);
    float _1299 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1289);
    float _1301 = float(_1073);
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1305 = float(_1295);
    float _1307 = -_1299;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1207);
    float _1313 = _1305 * _1301;
    float _1315 = fma(_701, _1309, _1145);
    float _1317 = rsqrt(_1297);
    float _1319 = in.m_68.x;
    float _1321 = in.m_68.y;
    float _1323 = in.m_68.z;
    float _1325 = _1309;
    int _1327 = _1295;
    if (_1287)
    {
        _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1329 = _1325;
    float _1331 = _1281 * _133;
    bool _1333 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1335 = isnan(0.0);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1341 = _1337 || _1339;
    out.m_70.x = _1269;
    out.m_70.y = _1315;
    out.m_70.z = _1293;
    out.m_70.w = _1283;
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    if (_1287)
    {
        float _1353 = _1329 * 5.0;
        _1327 = as_type<int>(_1353);
    }
    int _1355 = _1327;
    float _1357 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1359 = exp2(_1331);
    float _1361 = _1247 * _1303;
    out.m_72.x = _1311;
    float _1363 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_74.x = _1255;
    out.m_74.y = _1361;
    float _1365 = _1363 * _1317;
    bool _1367 = !_1133;
    int _1369 = _1367 ? 0 : 1;
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5120 = as_type<float>(_1355);
        out.gl_Position.z = _5120;
    }
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1373 = 1.0 + _1371;
    bool _1375 = !_1129;
    int _1377 = _1375 ? 0 : 1;
    float _1379 = _1213 * _1365;
    float _1381 = _1379;
    if (_1287)
    {
        out.m_49.x = 0.0;
    }
    float _1383 = _1201 * _1365;
    if (_1287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1385 = -_1383;
    float _1387 = _795 + _1385;
    float _1389 = -_1379;
    float _1391 = _1021 + _1389;
    float _1393 = _1239 * _1365;
    float _1395 = 1.0 / _1373;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1399 = _1387 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1403 = _1391 + _1401;
    float _1405 = _609 * 2.0;
    int _1407 = abs(_1377);
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1411 = -_1393;
    float _1413 = _1055 + _1411;
    float _1415 = -_1359;
    float _1417 = _1415 + 1.0;
    float _1419 = float(_1407);
    float _1421 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1409);
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1413 + _1423;
    float _1427 = float(_1185);
    float _1429 = _1313 * (-2.0);
    float _1431 = floor(_1405);
    float _1433 = _1341 ? _1417 : 0.0;
    float _1435 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1421);
    float _1437 = _607 + (-0.5);
    float _1439 = fma(_1429, _1319, _1319);
    float _1441 = _1419 * _1427;
    float _1443 = _1427;
    if (_1351)
    {
        float _1445 = _1433 * _1395;
        _155 = _1445;
    }
    float _1447 = _155;
    float _1449 = fma(_897, _1429, _897);
    float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    bool _1453 = _1435 >= 0.0;
    float _1455 = _1441 * (-2.0);
    float _1457 = _609 + (-0.5);
    float _1459 = fma(_1449, _1447, _1451);
    int _1461 = abs(_1369);
    float _1463 = fma(_1455, _1321, _1321);
    float _1465 = fma(_853, _1455, _853);
    bool _1467 = _1431 > 0.0;
    float _1469 = _1459 * 0.15915493667125701904296875;
    float _1471 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1463);
    bool _1473 = _1431 >= 0.0;
    bool _1475 = isnan(_1431);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = _1469 * 6.283185482025146484375;
    float _1485 = sin(_1483);
    if (_1453)
    {
        _1443 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1487 = _1443;
    float _1489 = fma(_1465, _1447, _1471);
    int _1491 = _1481 ? 0 : 1;
    int _1493 = as_type<int>(_1487);
    if (_1453)
    {
        out.m_49.x = 0.0;
    }
    if (_1453)
    {
        float _1495 = _1487 * 5.0;
        _1493 = as_type<int>(_1495);
    }
    int _1497 = _1493;
    int _1499 = ~_1491;
    int _1501 = _1499 + 1;
    int _1503 = _1501 + 1;
    float _1505 = _1469 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    int _1509 = _1503;
    if (!_1467)
    {
        int _1511 = ~_1491;
        int _1513 = _1511 + 1;
        _1509 = _1513;
    }
    int _1515 = _1509;
    if (_1453)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5343 = as_type<float>(_1497);
        out.gl_Position.z = _5343;
    }
    float _1517 = float(_1515);
    if (_1453)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1519 = -_795;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1523 = -_1021;
    float _1525 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = -_1055;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1531 = _1521 * _1521;
    float _1533 = _611 + _607;
    float _1535 = float(_1461);
    float _1537 = _611 + (-0.5);
    float _1539 = fma(_1525, _1525, _1531);
    float _1541 = _1533 + (-1.0);
    float _1543 = -_1383;
    float _1545 = _1201 + _1543;
    float _1547 = _1535 * _1517;
    float _1549 = fma(_1529, _1529, _1539);
    float _1551 = _1489 * 0.15915493667125701904296875;
    float _1553 = _1547 * (-2.0);
    float _1555 = -_1379;
    float _1557 = _1213 + _1555;
    float _1559 = _1545 * _1545;
    float _1561 = rsqrt(_1549);
    float _1563 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1565 = fma(_1553, _1323, _1323);
    float _1567 = fma(_1557, _1557, _1559);
    float _1569 = -_1393;
    float _1571 = _1239 + _1569;
    float _1573 = fma(_1563, _1553, _1563);
    float _1575 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1565);
    float _1577 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1579 = fma(_1571, _1571, _1567);
    float _1581 = _1551 * 6.283185482025146484375;
    float _1583 = sin(_1581);
    float _1585 = fma(_1573, _1447, _1575);
    float _1587 = _1585 * 0.15915493667125701904296875;
    float _1589 = _1525 * _1561;
    float _1591 = _1529 * _1561;
    float _1593 = _1521 * _1561;
    float _1595 = sqrt(_1579);
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1599 = _1589 * _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = _1591 * _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1607 = -_1599;
    float _1609 = fma(_1591, _1605, _1607);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1613 = _1593 * _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1617 = -_1603;
    float _1619 = fma(_1593, _1615, _1617);
    float _1621 = _1551 * 6.283185482025146484375;
    float _1623 = cos(_1621);
    float _1625 = _1609 * _1609;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = -_1613;
    float _1631 = fma(_1589, _1627, _1629);
    float _1633 = _1485 * _1583;
    float _1635 = fma(_1619, _1619, _1625);
    float _1637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1639 = _1587 * 6.283185482025146484375;
    float _1641 = cos(_1639);
    float _1643 = fma(_1631, _1631, _1635);
    float _1645 = _1317 * _1595;
    float _1647 = _1645 * _1577;
    float _1649 = _1587 * 6.283185482025146484375;
    float _1651 = sin(_1649);
    float _1653 = _1507 * _1623;
    float _1655 = _1485 * _1623;
    float _1657 = _1637 * _1647;
    float _1659 = rsqrt(_1643);
    float _1661 = _1623 * _1641;
    float _1663 = _1485 * _1641;
    float _1665 = _1507 * _1641;
    float _1667 = _1357 * _1645;
    float _1669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1671 = _1583 * _1641;
    float _1673 = fma(_1651, _1653, _1633);
    float _1675 = fma(_1651, _1633, _1653);
    float _1677 = _1507 * _1583;
    float _1679 = _1669 * _1667;
    float _1681 = _1665 * _1657;
    float _1683 = -_1657;
    float _1685 = _1651 * _1683;
    float _1687 = -_1655;
    float _1689 = fma(_1651, _1677, _1687);
    float _1691 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1693 = _1691 * 0.5;
    float _1695 = _1619 * _1659;
    float _1697 = _1609 * _1659;
    float _1699 = fma(_1673, _1679, _1681);
    float _1701 = -_1677;
    float _1703 = fma(_1651, _1655, _1701);
    float _1705 = _1593 * _1695;
    float _1707 = _1631 * _1659;
    float _1709 = _1663 * _1657;
    float _1711 = fma(_1661, _1679, _1685);
    float _1713 = _1591 * _1697;
    float _1715 = fma(_1689, _1693, _1699);
    float _1717 = -_1705;
    float _1719 = fma(_1589, _1697, _1717);
    float _1721 = fma(_1703, _1679, _1709);
    float _1723 = -_1713;
    float _1725 = fma(_1593, _1707, _1723);
    float _1727 = fma(_1671, _1693, _1711);
    float _1729 = _1719 * _1715;
    float _1731 = fma(_1675, _1693, _1721);
    float _1733 = _1725 * _1715;
    float _1735 = _1589 * _1707;
    float _1737 = fma(_1707, _1727, _1729);
    float _1739 = fma(_1695, _1727, _1733);
    float _1741 = -_1735;
    float _1743 = fma(_1591, _1695, _1741);
    float _1745 = fma(_1591, _1731, _1737);
    float _1747 = fma(_1589, _1731, _1739);
    float _1749 = _1743 * _1715;
    float _1751 = _1055 + _1745;
    float _1753 = _1021 + _1747;
    float _1755 = fma(_1697, _1727, _1749);
    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1759 = _1751 + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1763 = _1753 + _1761;
    float _1765 = fma(_1593, _1731, _1755);
    float _1767 = _1759 * _1759;
    float _1769 = _795 + _1765;
    float _1771 = fma(_1763, _1763, _1767);
    float _1773 = sqrt(_1771);
    bool _1775 = _1773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = _1765;
    float _1779 = _1749;
    float _1781 = _1731;
    float _1783 = _1759;
    float _1785 = _1771;
    if (!_1775)
    {
        _1777 = _1753;
    }
    float _1787 = _1777;
    float _1789 = _1787;
    if (!_1775)
    {
        _1779 = _1751;
    }
    float _1791 = _1779;
    float _1793 = _1791;
    if (!_1775)
    {
        _1781 = _1769;
    }
    float _1795 = _1781;
    bool _1797 = !_1775;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1805 = _1773 + _1803;
        float _1807 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1809 = rsqrt(_1771);
        float _1811 = _1805 * _1801;
        float _1813 = _1811 * 0.15915493667125701904296875;
        float _1815 = _1813 * 6.283185482025146484375;
        float _1817 = cos(_1815);
        float _1819 = _1813 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1817 + (-1.0);
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1827 = fma(_1821, _1807, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = fma(_1769, _1817, _1825);
        float _1831 = _1809 * _1827;
        float _1833 = fma(_1763, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1835 = fma(_1759, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1799 = _1829;
        _1789 = _1833;
        _1793 = _1835;
    }
    float _1837 = _1799;
    float _1839 = _1789;
    float _1841 = _1793;
    float _1843 = -_795;
    float _1845 = _1843 + _1837;
    float _1847 = -_1021;
    float _1849 = _1847 + _1839;
    float _1851 = -_1055;
    float _1853 = _1851 + _1841;
    float _1855 = _1845 * _1845;
    float _1857 = fma(_1849, _1849, _1855);
    float _1859 = fma(_1853, _1853, _1857);
    float _1861 = sqrt(_1859);
    bool _1863 = _1861 > 0.0;
    bool _1865 = !_1863;
    float _1867 = _1837;
    float _1869 = _1839;
    float _1871 = _1841;
    float _1873 = _1845;
    if (!_1865)
    {
        float _1875 = _203 * _203;
        float _1877 = rsqrt(_1859);
        float _1879 = fma(_201, _201, _1875);
        float _1881 = fma(_205, _205, _1879);
        float _1883 = sqrt(_1881);
        float _1885 = _1849 * _1877;
        float _1887 = _1845 * _1877;
        float _1889 = _1853 * _1877;
        bool _1891 = _1883 > 0.0;
        bool _1893 = !_1891;
        _1873 = _1887;
        _1783 = _1881;
        if (!_1893)
        {
            float _1895 = rsqrt(_1881);
            float _1897 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1899 = _203 * _1895;
            float _1901 = _201 * _1895;
            float _1903 = _1887 * _1899;
            float _1905 = _205 * _1895;
            float _1907 = fma(_1885, _1901, _1903);
            float _1909 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1911 = fma(_1889, _1905, _1907);
            float _1913 = _1911 * _1909;
            float _1915 = fma(_201, _1913, _1839);
            float _1917 = fma(_203, _1913, _1837);
            float _1919 = fma(_205, _1913, _1841);
            _1867 = _1917;
            _1869 = _1915;
            _1871 = _1919;
            _1873 = _1907;
            _1783 = _1895;
        }
    }
    float _1921 = _1867;
    float _1923 = _1869;
    float _1925 = _1871;
    float _1927 = _1873;
    float _1929 = _1783;
    float _1931 = -_1383;
    float _1933 = _1931 + _1921;
    float _1935 = -_1379;
    float _1937 = _1935 + _1923;
    float _1939 = -_1393;
    float _1941 = _1939 + _1925;
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1945 = _1933 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1953 = _1941 + _1951;
    float _1955 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1957 = _1945 * _1945;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1961 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1955);
    float _1963 = fma(_1949, _1949, _1957);
    float _1965 = fma(_1953, _1953, _1963);
    float _1967 = rsqrt(_1965);
    float _1969 = sqrt(_1965);
    float _1971 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1973 = _1949 * _1971;
    float _1975 = _1953 * _1971;
    float _1977 = _1973 * _1973;
    float _1979 = _1975 * _1975;
    float _1981 = _1977 + _1979;
    float _1983 = sqrt(_1981);
    bool _1985 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1989 = _1983 + _1987;
    float _1991 = _1953;
    float _1993 = _1981;
    float _1995 = _1989;
    float _1997 = _1945;
    float _1999 = _1929;
    if (_1985)
    {
        float _2001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1991 = _2001;
    }
    float _2003 = _1991;
    if (_1985)
    {
        float _2005 = rsqrt(_1981);
        _1993 = _2005;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    if (_1985)
    {
        float _2011 = _1989 * _2003;
        _1995 = _2011;
    }
    float _2013 = _1995;
    if (_1985)
    {
        float _2015 = _2013 * 0.15915493667125701904296875;
        _1381 = _2015;
    }
    float _2017 = _1381;
    float _2019 = _2003;
    float _2021 = _2017;
    if (_1985)
    {
        float _2023 = _2017 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        _2019 = _2025;
    }
    float _2027 = _2019;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2031 = precise::max(0.0, _2029);
    float _2033 = _1927;
    float _2035 = _2031;
    if (_1985)
    {
        float _2037 = _2017 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        _2033 = _2039;
    }
    float _2041 = _2033;
    float _2043 = -_1971;
    float _2045 = -_2031;
    float _2047 = fma(_1945, _2043, _2045);
    if (!_1985)
    {
        _1997 = _1975;
    }
    float _2049 = _1997;
    float _2051 = _2049;
    if (_1985)
    {
        float _2053 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2035 = _2053;
    }
    float _2055 = _2035;
    float _2057 = _2027;
    float _2059 = _2055;
    if (_1985)
    {
        float _2061 = fma(_2027, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1999 = _2061;
    }
    float _2063 = _1999;
    float _2065 = _2063;
    if (!_1985)
    {
        _2057 = _1973;
    }
    float _2067 = _2057;
    float _2069 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2071 = _2067;
    float _2073 = _2041;
    if (_1985)
    {
        float _2075 = _2041 + (-1.0);
        _2059 = _2075;
    }
    float _2077 = _2059;
    if (_1985)
    {
        float _2079 = _2007 * _2063;
        _1785 = _2079;
    }
    float _2081 = _1785;
    if (!_1985)
    {
        _2065 = _2047;
    }
    float _2083 = _2065;
    float _2085 = floor(_2069);
    float _2087 = _2083;
    if (_1985)
    {
        float _2089 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2089;
    }
    float _2091 = _2021;
    if (_1985)
    {
        float _2093 = _1973 * _2081;
        _2071 = _2093;
    }
    float _2095 = _2071;
    if (!_1985)
    {
        _2009 = _1977;
    }
    float _2097 = _2009;
    float _2099 = _2097;
    if (_1985)
    {
        float _2101 = _1975 * _2081;
        _2051 = _2101;
    }
    float _2103 = _2051;
    if (_1985)
    {
        float _2105 = fma(_2047, _2041, _2091);
        _2087 = _2105;
    }
    float _2107 = _2087;
    if (_1985)
    {
        float _2109 = _2095 * _2095;
        _2099 = _2109;
    }
    float _2111 = _2099;
    float _2113 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1985)
    {
        _2073 = _1979;
    }
    float _2115 = _2073;
    float _2117 = _2115;
    if (_1985)
    {
        float _2119 = _2103 * _2103;
        _2117 = _2119;
    }
    float _2121 = _2117;
    float _2123 = fma(_2107, _2107, _2111);
    float _2125 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2127 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2129 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2113);
    float _2131 = _2123 + _2121;
    float _2133 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2135 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2137 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2129);
    float _2139 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1961);
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2143 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2141);
    float _2145 = precise::clamp(_2143, 0.0, 1.0);
    float _2147 = rsqrt(_2131);
    float _2149 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2133);
    float _2151 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2135);
    float _2153 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2155 = -_2145;
    float _2157 = _2155 + 1.0;
    float _2159 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2161 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2151);
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2165 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2167 = floor(_2125);
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2171 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2163);
    float _2173 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2175 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2171);
    float _2177 = _2147 * _2095;
    float _2179 = abs(_2157);
    float _2181 = log2(_2179);
    float _2183 = _2147 * _2103;
    float _2185 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2187 = _2147 * _2107;
    float _2189 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2191 = -_2173;
    float _2193 = fma(_2191, _1959, 1.0);
    float _2195 = -_2189;
    float _2197 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2195);
    float _2199 = 1.0 / _2185;
    float _2201 = -_2167;
    float _2203 = _2125 + _2201;
    float _2205 = _2187 + 1.0;
    float _2207 = -_2183;
    float _2209 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2197);
    float _2211 = -_2085;
    float _2213 = _2069 + _2211;
    float _2215 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2217 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2219 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2221 = fma(_2209, -0.5, 0.5);
    float _2223 = log2(_2193);
    float _2225 = fma(_2209, 0.5, 0.5);
    float _2227 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2215);
    float _2229 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2217);
    float _2231 = fma(_2225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2227);
    float _2235 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2229);
    float _2237 = exp2(_2219);
    float _2239 = fma(_2225, _2231, -0.212114393711090087890625);
    float _2241 = sqrt(_2221);
    float _2243 = _2223 * 0.693147182464599609375;
    float _2245 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = -_2187;
    float _2249 = fma(_2237, _2205, _2247);
    float _2251 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2233);
    float _2253 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2235);
    float _2255 = fma(_2225, _2239, 1.570728778839111328125);
    float _2257 = fma(_2249, 0.5, 0.5);
    float _2259 = _2251 * _2199;
    float _2261 = _2253 * _2199;
    float _2263 = _2241 * 0.636619746685028076171875;
    float _2265 = fma(_2259, 0.5, 0.5);
    float _2267 = fma(_2261, -0.5, 0.5);
    float _2269 = -_2255;
    float _2271 = fma(_2263, _2269, 1.0);
    float2 _6539 = float2(_2213, _2203);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).x;
    float3 _6550 = float3(_2265, _2267, _2245);
    float _2275 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6550, float3(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6550, float3(0.0), isnan(_6550)), level(0.0)).x;
    float3 _6561 = float3(_2265, _2267, _2245);
    float4 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6561, float3(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6561, float3(0.0), isnan(_6561)), level(0.0)).xyzw;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = _2278.w;
    float2 _6577 = float2(_2271, _2257);
    float3 _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6577, float2(0.0), isnan(_6577)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6577, float2(0.0), isnan(_6577)), level(0.0)).xyz;
    float _2292 = _2290.x;
    float _2294 = _2290.y;
    float _2296 = _2290.z;
    float _2298 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2300 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2302 = _1665 * _1719;
    float _2304 = _1689 * _1743;
    float _2306 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2298);
    float _2308 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2300);
    bool _2310 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2312 = isnan(0.5);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2318 = _2314 || _2316;
    float _2320 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2322 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2306);
    float _2324 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2308);
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2328 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2330 = _1665 * _1743;
    float _2332 = 1.0 / _2326;
    float _2334 = _2328 + _2326;
    float _2336 = _1665 * _1725;
    float _2338 = _1673 * _1743;
    float _2340 = -_1651;
    float _2342 = fma(_2340, _1697, _2330);
    float _2344 = -_1651;
    float _2346 = fma(_2344, _1695, _2336);
    float _2348 = fma(_1661, _1697, _2338);
    float _2350 = -_1651;
    float _2352 = fma(_2350, _1707, _2302);
    float _2354 = _2334 * _2332;
    float _2356 = _2354 * 0.5;
    float _2358 = _1673 * _1725;
    float _2360 = _1689 * _1725;
    float _2362 = _1673 * _1719;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2366 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2364);
    float _2368 = _1689 * _1719;
    float _2370 = fma(_1661, _1695, _2358);
    float _2372 = fma(_1671, _1695, _2360);
    float _2374 = fma(_1661, _1707, _2362);
    float _2376 = fma(_1671, _1707, _2368);
    float _2378 = 1.0 / _2366;
    float _2380 = fma(_1703, _1593, _2348);
    float _2382 = fma(_1671, _1697, _2304);
    float _2384 = fma(_1703, _1589, _2370);
    float _2386 = fma(_1675, _1589, _2372);
    float _2388 = fma(_1663, _1593, _2342);
    float _2390 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2392 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2394 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2392);
    float _2396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2398 = _2378 * _2396;
    float _2400 = abs(_2398);
    float _2402 = log2(_2400);
    bool _2404 = _2398 <= 8000.0;
    bool _2406 = isnan(_2398);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2418 = exp2(_2416);
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = fma(_2422, -2.0, 3.0);
    float _2426 = _2422 * _2422;
    float _2428 = _2426 * _2424;
    float _2430 = -_2428;
    float _2432 = _2430 + 1.0;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2428);
    float _2436 = fma(_1663, _1589, _2346);
    float _2438 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2440 = fma(_1663, _1591, _2352);
    float _2442 = fma(_1675, _1593, _2382);
    float _2444 = in.m_76.x;
    float _2446 = _2438 * _2436;
    float _2448 = _2438 * _2440;
    float _2450 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2452 = _2438 * _2388;
    float _2454 = fma(_1703, _1591, _2374);
    float _2456 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2394);
    float _2458 = fma(_1675, _1591, _2376);
    float _2460 = fma(_2320, _2380, _2452);
    float _2462 = exp2(_2450);
    float _2464 = fma(_2320, _2384, _2446);
    float _2466 = fma(_2320, _2454, _2448);
    float _2468 = _2456 + _2185;
    float _2470 = _2251 + _2185;
    float _2472 = _2185 * 0.5;
    float _2474 = _2414 * _2434;
    float _2476 = _2394;
    float _2478 = _2414;
    float _2480 = _2185;
    float _2482 = _2456;
    if (_2318)
    {
        _2476 = 1.0;
    }
    float _2484 = _2476;
    float _2486 = _2468 * 0.5;
    float _2488 = _2470 * 0.5;
    float _2490 = fma(_2253, -0.5, _2472);
    float _2492 = _2484;
    if (_2318)
    {
        _2478 = 1.0;
    }
    float _2494 = _2478;
    float _2496 = _2494;
    float _2498 = _2286;
    float _2500 = _2284;
    if (!_2318)
    {
        float _2502 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2504 = _2502 * 0.15915493667125701904296875;
        float _2506 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2510 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2508;
        float _2512 = _2504 * 6.283185482025146484375;
        float _2514 = cos(_2512);
        float _2516 = _2506 * 0.15915493667125701904296875;
        float _2518 = _2504 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        float _2522 = 1.0 / _2514;
        float _2524 = _2516 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = _2520 * _2522;
        float _2530 = _2516 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2526 * _2528;
        float _2536 = 1.0 / _2510;
        float _2538 = 1.0 / _2534;
        float _2540 = _2532 * _2538;
        float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2544 = fma(_2398, _2540, _2542);
        float _2546 = _2544 * _2536;
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        _2496 = _2548;
    }
    float _2550 = _2496;
    if (!_2318)
    {
        float _2552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2558 = _2554 * 6.283185482025146484375;
        float _2560 = cos(_2558);
        float _2562 = _2556 * 0.15915493667125701904296875;
        float _2564 = _2554 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = 1.0 / _2560;
        float _2570 = _2562 * 6.283185482025146484375;
        float _2572 = cos(_2570);
        float _2574 = _2566 * _2568;
        float _2576 = _2562 * 6.283185482025146484375;
        float _2578 = sin(_2576);
        float _2580 = _2572 * _2574;
        float _2582 = 1.0 / _2580;
        float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2586 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2584;
        float _2588 = 1.0 / _2586;
        float _2590 = _2578 * _2582;
        float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2594 = fma(_2398, _2590, _2592);
        float _2596 = _2594 * _2588;
        float _2598 = precise::clamp(_2596, 0.0, 1.0);
        float _2600 = -_2598;
        float _2602 = _2600 + 1.0;
        _2492 = _2602;
    }
    float _2604 = _2492;
    float _2606 = -_2462;
    float _2608 = _2606 + 1.0;
    float _2610 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = -_2273;
    float _2614 = _2612 + 1.0;
    float _2616 = _2386 + _2464;
    float _2618 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2620 = _2614 * _2610;
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    out.gl_Position.x = _2251;
    out.gl_Position.y = _2253;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2185;
    float _2624 = _2442 + _2460;
    float _2626 = _2618 * _2275;
    float _2628 = -_2618;
    float _2630 = _2628 + 1.0;
    float _2632 = _2458 + _2466;
    out.m_78.x = _2488;
    out.m_78.y = _2490;
    out.m_78.z = _2486;
    out.m_78.w = _2185;
    float _2634 = _2296 * _2626;
    bool _2636 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2638 = isnan(_1969);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2644 = _2640 || _2642;
    out.m_80.x = _2616;
    out.m_80.y = _2624;
    out.m_80.z = _2632;
    float _2646 = -_2622;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2650 = _2286 * _2626;
    float _2652 = _2648 * _2444;
    float _2654 = fma(_2292, _2650, _2280);
    float _2656 = _2286 * _2630;
    float _2658 = fma(_2294, _2650, _2282);
    float _2660 = _2652 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2662 = fma(_2286, _2634, _2284);
    float _2664 = _2550 * _2604;
    float _2666 = _2650;
    float _2668 = _2664;
    if (!_2644)
    {
        _2498 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2670 = _2498;
    out.m_82.x = _2660;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2674 = _2670;
    float _2676 = _2670;
    if (!_2644)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2678 = _2500;
    out.m_84.x = _2654;
    out.m_84.y = _2658;
    out.m_84.z = _2662;
    out.m_84.w = _2656;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2644)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2684 = _2480;
    float _2686 = _2684;
    float _2688 = _2684;
    if (!_2644)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2690 = _2482;
    float _2692 = _2690;
    float _2694 = _2690;
    if (!_2644)
    {
        _2666 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2696 = _2666;
    float _2698 = _2696;
    float _2700 = _2696;
    if (!_2644)
    {
        _2668 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2702 = _2668;
    bool _2704 = !_2644;
    float _2706 = _2702;
    float _2708 = _2702;
    if (!_2704)
    {
        bool _2710 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2712 = isnan(_1969);
        bool _2714 = _2710 || _2712;
        bool _2716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2718 = _2714 || _2716;
        if (!_2718)
        {
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2722 = _1969 + _2720;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2726 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2724;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2732 = 1.0 / _2726;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2750 = _2722 * _2732;
            float _2752 = precise::clamp(_2750, 0.0, 1.0);
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2758 = fma(_2752, _2730, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2760 = fma(_2752, _2756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2762 = fma(_2752, _2736, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2764 = fma(_2752, _2740, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2766 = fma(_2752, _2744, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2768 = fma(_2752, _2748, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2682 = _2762;
            _2700 = _2766;
            _2676 = _2758;
            _2694 = _2764;
            _2688 = _2760;
            _2708 = _2768;
            _2770 = true;
        }
        else
        {
            bool _2772 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2774 = isnan(_1969);
            bool _2776 = _2772 || _2774;
            bool _2778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2780 = _2776 || _2778;
            if (!_2780)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2782 = _2674;
            _2676 = _2782;
            if (!_2780)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2784 = _2680;
            _2682 = _2784;
            if (!_2780)
            {
                _2686 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2786 = _2686;
            _2688 = _2786;
            if (!_2780)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2788 = _2692;
            _2694 = _2788;
            if (!_2780)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2790 = _2698;
            _2700 = _2790;
            if (!_2780)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2792 = _2706;
            bool _2794 = !_2780;
            _2708 = _2792;
            if (!_2794)
            {
                bool _2796 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2798 = isnan(_1969);
                bool _2800 = _2796 || _2798;
                bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2804 = _2800 || _2802;
                if (!_2804)
                {
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2808 = _1969 + _2806;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2810;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2818 = 1.0 / _2812;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2836 = _2808 * _2818;
                    float _2838 = precise::clamp(_2836, 0.0, 1.0);
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2682 = _2848;
                    _2700 = _2852;
                    _2676 = _2844;
                    _2694 = _2850;
                    _2688 = _2846;
                    _2708 = _2854;
                    _2770 = true;
                }
                else
                {
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2688 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2770 = false;
    float _2856 = _2682;
    float _2858 = _2700;
    float _2860 = _2676;
    float _2862 = _2694;
    float _2864 = _2688;
    float _2866 = _2708;
    float _2868 = fma(_2624, -0.5, 0.5);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    float _2872 = -_2856;
    float _2874 = _2872 + _2858;
    float _2876 = -_2860;
    float _2878 = _2876 + _2862;
    out.m_86.x = 0.0;
    float _2880 = fma(_2870, _2874, _2856);
    float _2882 = -_2864;
    float _2884 = _2882 + _2866;
    float _2886 = fma(_2870, _2878, _2860);
    float _2888 = _2880 * 0.586610972881317138671875;
    bool _2890 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2892 = fma(_2870, _2884, _2864);
    float _2894 = _2672 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2896 = fma(_2886, 0.298911988735198974609375, _2888);
    bool _2898 = _2550 > 0.0;
    bool _2900 = isnan(_2550);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = fma(_2892, 0.114477999508380889892578125, _2896);
    out.m_49.x = _2894;
    bool _2910 = _2604 <= 0.0;
    bool _2912 = !_2906;
    bool _2914 = _2910 || _2912;
    float _2916 = -_2908;
    float _2918 = _2886 + _2916;
    float _2920 = -_2908;
    float _2922 = _2892 + _2920;
    float _2924 = fma(_2918, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    float _2926 = -_2908;
    float _2928 = _2880 + _2926;
    float _2930 = fma(_2922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    float _2932 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    bool _2934 = !_2890;
    if (!_2934)
    {
        float _2936 = -_1933;
        float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2940 = -_1937;
        float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2944 = -_1941;
        float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2948 = _2938 * _2938;
        float _2950 = fma(_2942, _2942, _2948);
        float _2952 = fma(_2946, _2946, _2950);
        float _2954 = sqrt(_2952);
        float _2956 = rsqrt(_2952);
        float _2958 = -_2954;
        float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2962 = _2960 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = _2942 * _2956;
        float _2968 = _2938 * _2956;
        float _2970 = abs(_2964);
        float _2972 = log2(_2970);
        float _2974 = _2946 * _2956;
        float _2976 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2978 = _2624 * _2968;
        float _2980 = -_2968;
        float _2982 = -_2976;
        float _2984 = fma(_2980, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2982);
        float _2986 = fma(_2616, _2966, _2978);
        float _2988 = -_2974;
        float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2984);
        float _2992 = fma(_2632, _2974, _2986);
        float _2994 = precise::clamp(_2992, 0.0, 1.0);
        float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2998 = _2990 + _2996;
        float _3000 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3002 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3004 = precise::clamp(_3002, 0.0, 1.0);
        float _3006 = exp2(_3000);
        float _3008 = _3006 * _3004;
        float _3010 = _2994 * _3008;
        float _3012 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3016 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3012;
        out.m_86.y = _3014;
        out.m_86.z = _3016;
    }
    out.m_88.x = _2924;
    out.m_88.y = _2932;
    out.m_88.z = _2930;
    if (!_2914)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3018 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3018;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2770 = false;
    bool _603 = false;
    bool _429 = false;
    bool _323 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3074 = as_type<float>(_121);
        out.gl_Position.z = _3074;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_51.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_53.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3146 = as_type<float>(_161);
        out.gl_Position.z = _3146;
    }
    if (_151)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_60.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _145;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _249;
    float _275 = _265 * _253;
    float _277 = -_265;
    float _279 = _277 + 1.0;
    float _281 = _233 * _273;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _287 * _275;
    float _293 = _289 * _275;
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _291);
    float _297 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _293);
    float _299 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _295);
    float _301 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _297);
    bool _303 = !_271;
    float _321;
    if (!_303)
    {
        float _305 = in.m_60.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        _321 = _145;
    }
    _323 = false;
    float _325 = _321;
    float _327 = in.m_62.x;
    float _329 = in.m_62.y;
    bool _331 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _333 = isnan(_325);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _347 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _349 = isnan(_325);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _325 + _363;
    float _367 = -_341;
    float _369 = _367 + 1.0;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _373 = 1.0 / _345;
    float _375 = _357 * _369;
    float _377 = -_357;
    float _379 = _377 + 1.0;
    float _381 = _301 * _329;
    float _383 = _299 * _327;
    float _385 = _361 * _373;
    float _387 = fma(_385, _365, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _389 = _387 * _375;
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[115].x, _389);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _399 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[116].x, _391);
    float _401 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _399 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _401;
    out.m_64.y = _403;
    out.m_64.z = _405;
    out.m_64.w = _407;
    bool _409 = !_371;
    float _427;
    if (!_409)
    {
        float _411 = in.m_60.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _145;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _461 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _463 = isnan(_431);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _439;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _479;
    bool _483 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _485 = isnan(_431);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _471 * _477;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _503 = 1.0 / _455;
    float _505 = _493 * _499;
    float _507 = -_493;
    float _509 = _507 + 1.0;
    float _511 = 1.0 / _459;
    float _513 = _481 * _473;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _519 = fma(_513, _435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _521 = _517 * _503;
    bool _523 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _525 = isnan(_431);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _541 = _431 + _539;
    float _543 = _519 * _505;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _547 = _431 + _545;
    float _549 = -_533;
    float _551 = _549 + 1.0;
    float _553 = fma(_521, _541, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _555 = _537 * _511;
    float _557 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[131].x, _543);
    float _559 = _451 * _551;
    float _561 = fma(_555, _547, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _563 = fma(_553, _495, _557);
    float _565 = fma(_561, _559, _563);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _573 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[134].x, _565);
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _573 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _575;
    out.m_66.y = _577;
    out.m_66.z = _579;
    out.m_66.w = _581;
    bool _583 = !_501;
    float _601;
    if (!_583)
    {
        float _585 = in.m_60.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        _601 = _145;
    }
    _603 = false;
    float _605 = _601;
    float _607 = in.m_60.x;
    float _609 = in.m_60.y;
    float _611 = in.m_60.z;
    float _613 = in.m_60.w;
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _627 = _625 != 0;
    float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _635 = 1.0 / _633;
    float _637 = _607 * 2.0;
    bool _639 = _607 > 0.5;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _643 = _613 > 0.5;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _649 = -_189;
    int _651 = _639 ? as_type<int>(_649) : as_type<int>(_189);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _659 = _657 != 0;
    float _661 = 1.0 / _647;
    bool _663 = !_619;
    float _665 = _663 ? _189 : as_type<float>(_651);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _675 = _673 != 0;
    float _677 = _609 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _679 = in.m_46.x;
    float _681 = in.m_46.y;
    float _683 = in.m_46.z;
    bool _685 = _609 > 0.5;
    float _687 = fma(_677, -2.0, _667);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _693 = -_199;
    int _695 = _685 ? as_type<int>(_693) : as_type<int>(_199);
    float _697 = 1.0 / _655;
    bool _699 = !_623;
    float _701 = _699 ? _199 : as_type<float>(_695);
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = _607 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _709 = 1.0 / _691;
    float _711 = -_641;
    float _713 = fma(_707, 2.0, _711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _731 = _721 * _697;
    float _733 = _681 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _735 = _681 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _737 = _681 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _739 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[4].x, _733);
    float _741 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[5].x, _735);
    float _743 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[6].x, _737);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _749 = 1.0 / _725;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _763 = _753 * _661;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _769 = _717 * _709;
    float _771 = 1.0 / _747;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _773;
    float _777 = -_189;
    int _779 = _685 ? as_type<int>(_777) : as_type<int>(_189);
    float _781 = _767 * _635;
    bool _783 = _611 > 0.5;
    float _785 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[5].z, _741);
    float _787 = 1.0 / _729;
    float _789 = _775 * _749;
    float _791 = -_189;
    int _793 = _783 ? as_type<int>(_791) : as_type<int>(_189);
    float _795 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _797 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _799 = isnan(_605);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    bool _809 = !_659;
    float _811 = _809 ? _189 : as_type<float>(_793);
    float _813 = _761 * _771;
    float _815 = _611 * 2.0;
    float _817 = _609 + _611;
    float _819 = floor(_637);
    bool _821 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _823 = isnan(_605);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _817 + (-1.0);
    bool _835 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _837 = isnan(_605);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = _757 * _787;
    float _849 = -_831;
    float _851 = _849 + 1.0;
    float _853 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = floor(_815);
    bool _857 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _859 = isnan(_605);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _845 * _851;
    float _871 = -_199;
    int _873 = _783 ? as_type<int>(_871) : as_type<int>(_199);
    float _875 = -_845;
    float _877 = _875 + 1.0;
    float _879 = -_867;
    float _881 = _879 + 1.0;
    bool _883 = _819 > 0.0;
    float _885 = _609 + _607;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _889 = _885 + (-1.0);
    bool _891 = !_671;
    float _893 = _891 ? _189 : as_type<float>(_779);
    bool _895 = _855 > 0.0;
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _899 = _855 >= 0.0;
    bool _901 = isnan(_855);
    bool _903 = _899 || _901;
    bool _905 = isnan(0.0);
    bool _907 = _903 || _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _911 = _605 + _909;
    bool _913 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _915 = isnan(_605);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _893 + 0.5;
    int _927 = _907 ? 0 : 1;
    float _929 = fma(_763, _911, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _931 = _819 >= 0.0;
    bool _933 = isnan(_819);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = -_923;
    float _943 = _941 + 1.0;
    float _945 = _923 * _881;
    bool _947 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _949 = isnan(_605);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _961 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[6].z, _743);
    float _963 = _807 * _943;
    float _965 = -_807;
    float _967 = _965 + 1.0;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _971 = _605 + _969;
    bool _973 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _975 = isnan(_605);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = -_957;
    float _987 = _985 + 1.0;
    float _989 = _957 * _967;
    float _991 = fma(_781, _971, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _995 = _605 + _993;
    bool _997 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _999 = isnan(_605);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = _983 * _987;
    float _1011 = -_983;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_769, _995, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1019 = _605 + _1017;
    float _1021 = _959 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1023 = _1007 * _1013;
    float _1025 = -_1007;
    float _1027 = _1025 + 1.0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1031 = _605 + _1029;
    float _1033 = fma(_731, _1019, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1035 = _1019;
    float _1037 = _877;
    float _1039 = _789;
    if (!_705)
    {
        _1035 = _611;
    }
    float _1041 = _1035;
    float _1043 = _831 * _1027;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1047 = _605 + _1045;
    float _1049 = fma(_847, _1031, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1051 = _1041;
    if (_705)
    {
        _1051 = _609;
    }
    float _1053 = _1051;
    float _1055 = _961 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1057 = fma(_813, _1047, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1059 = ~_927;
    int _1061 = _1059 + 1;
    int _1063 = _1061 + 1;
    float _1065 = _929 * _869;
    int _1067 = _1063;
    if (!_895)
    {
        int _1069 = ~_927;
        int _1071 = _1069 + 1;
        _1067 = _1071;
    }
    int _1073 = _1067;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1077 = _605 + _1075;
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1081 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1065);
    float _1083 = -_133;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[76].x, _713);
    float _1087 = fma(_789, _1077, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1089 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[83].w, _887);
    bool _1091 = !_675;
    float _1093 = _1091 ? _199 : as_type<float>(_873);
    float _1095 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1097 = _665 + 0.5;
    float _1099 = fma(_991, _1043, _1081);
    if (!_705)
    {
        _1037 = _609;
    }
    float _1101 = _1037;
    float _1103 = fma(_1095, _1097, _1085);
    float _1105 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _687);
    float _1107 = _1101;
    if (!_705)
    {
        _1039 = _611;
    }
    float _1109 = _1039;
    float _1111 = fma(_1015, _1023, _1099);
    float _1113 = _1109;
    if (_705)
    {
        _1107 = _607;
    }
    float _1115 = _1107;
    float _1117 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_705)
    {
        _1113 = _609;
    }
    float _1119 = _1113;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    float _1135 = _701 + (-0.5);
    float _1137 = fma(_1033, _1009, _1111);
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1141 = -_1117;
    float _1143 = -_1105;
    float _1145 = fma(_1141, _1135, _1143);
    float _1147 = _629 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1153 = fma(_1049, _989, _1137);
    float _1155 = _811 + 0.5;
    float _1157 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1149);
    float _1159 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1161 = _939 ? 0 : 1;
    float _1163 = fma(_1057, _963, _1153);
    float _1165 = -_1121;
    float _1167 = fma(_1159, 2.0, _1165);
    int _1169 = ~_1161;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = -_1093;
    float _1177 = _1175 + 0.5;
    int _1179 = _1173;
    if (!_883)
    {
        int _1181 = ~_1161;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -_133;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1167);
    float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1193 = -_199;
    int _1195 = _643 ? as_type<int>(_1193) : as_type<int>(_199);
    float _1197 = fma(_1147, _1155, _1189);
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1201 = _795 + _1199;
    float _1203 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1207 = fma(_1087, _945, _1163);
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1213 = _1021 + _1211;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1217 = !_627;
    float _1219 = _1217 ? _199 : as_type<float>(_1195);
    float _1221 = fma(_1139, -2.0, _1205);
    float _1223 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1209);
    float _1225 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1215);
    float _1227 = _925 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1229 = _1219 + (-0.5);
    float _1231 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1221);
    float _1233 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1223);
    float _1235 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1055 + _1237;
    float _1241 = -_1203;
    float _1243 = -_1231;
    float _1245 = fma(_1241, _1229, _1243);
    float _1247 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1249 = -_1233;
    float _1251 = _1249 + 1.0;
    float _1253 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1157);
    float _1255 = _1227 * _1191;
    float _1257 = -_1235;
    float _1259 = _1257 + 1.0;
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1225);
    float _1263 = _1201 * _1201;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1267 = -_1251;
    float _1269 = fma(_665, _1267, _1103);
    float _1271 = -_1253;
    float _1273 = _1271 + 1.0;
    bool _1275 = !_1125;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1281 = log2(_1279);
    float _1283 = fma(_1219, _1259, _1245);
    float _1285 = fma(_1213, _1213, _1263);
    bool _1287 = _1261 >= 0.0;
    float _1289 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1265);
    float _1291 = -_1273;
    float _1293 = fma(_811, _1291, _1197);
    int _1295 = abs(_1277);
    float _1297 = fma(_1239, _1239, _1285);
    float _1299 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1289);
    float _1301 = float(_1073);
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1305 = float(_1295);
    float _1307 = -_1299;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1207);
    float _1313 = _1305 * _1301;
    float _1315 = fma(_701, _1309, _1145);
    float _1317 = rsqrt(_1297);
    float _1319 = in.m_68.x;
    float _1321 = in.m_68.y;
    float _1323 = in.m_68.z;
    float _1325 = _1309;
    int _1327 = _1295;
    if (_1287)
    {
        _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1329 = _1325;
    float _1331 = _1281 * _133;
    bool _1333 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1335 = isnan(0.0);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1341 = _1337 || _1339;
    out.m_70.x = _1269;
    out.m_70.y = _1315;
    out.m_70.z = _1293;
    out.m_70.w = _1283;
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    if (_1287)
    {
        float _1353 = _1329 * 5.0;
        _1327 = as_type<int>(_1353);
    }
    int _1355 = _1327;
    float _1357 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1359 = exp2(_1331);
    float _1361 = _1247 * _1303;
    out.m_72.x = _1311;
    float _1363 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_74.x = _1255;
    out.m_74.y = _1361;
    float _1365 = _1363 * _1317;
    bool _1367 = !_1133;
    int _1369 = _1367 ? 0 : 1;
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5120 = as_type<float>(_1355);
        out.gl_Position.z = _5120;
    }
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1373 = 1.0 + _1371;
    bool _1375 = !_1129;
    int _1377 = _1375 ? 0 : 1;
    float _1379 = _1213 * _1365;
    float _1381 = _1379;
    if (_1287)
    {
        out.m_49.x = 0.0;
    }
    float _1383 = _1201 * _1365;
    if (_1287)
    {
        return out;
    }
    float _1385 = -_1383;
    float _1387 = _795 + _1385;
    float _1389 = -_1379;
    float _1391 = _1021 + _1389;
    float _1393 = _1239 * _1365;
    float _1395 = 1.0 / _1373;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1399 = _1387 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1403 = _1391 + _1401;
    float _1405 = _609 * 2.0;
    int _1407 = abs(_1377);
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1411 = -_1393;
    float _1413 = _1055 + _1411;
    float _1415 = -_1359;
    float _1417 = _1415 + 1.0;
    float _1419 = float(_1407);
    float _1421 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1409);
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1413 + _1423;
    float _1427 = float(_1185);
    float _1429 = _1313 * (-2.0);
    float _1431 = floor(_1405);
    float _1433 = _1341 ? _1417 : 0.0;
    float _1435 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1421);
    float _1437 = _607 + (-0.5);
    float _1439 = fma(_1429, _1319, _1319);
    float _1441 = _1419 * _1427;
    float _1443 = _1427;
    if (_1351)
    {
        float _1445 = _1433 * _1395;
        _155 = _1445;
    }
    float _1447 = _155;
    float _1449 = fma(_897, _1429, _897);
    float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    bool _1453 = _1435 >= 0.0;
    float _1455 = _1441 * (-2.0);
    float _1457 = _609 + (-0.5);
    float _1459 = fma(_1449, _1447, _1451);
    int _1461 = abs(_1369);
    float _1463 = fma(_1455, _1321, _1321);
    float _1465 = fma(_853, _1455, _853);
    bool _1467 = _1431 > 0.0;
    float _1469 = _1459 * 0.15915493667125701904296875;
    float _1471 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1463);
    bool _1473 = _1431 >= 0.0;
    bool _1475 = isnan(_1431);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = _1469 * 6.283185482025146484375;
    float _1485 = sin(_1483);
    if (_1453)
    {
        _1443 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1487 = _1443;
    float _1489 = fma(_1465, _1447, _1471);
    int _1491 = _1481 ? 0 : 1;
    int _1493 = as_type<int>(_1487);
    if (_1453)
    {
        out.m_49.x = 0.0;
    }
    if (_1453)
    {
        float _1495 = _1487 * 5.0;
        _1493 = as_type<int>(_1495);
    }
    int _1497 = _1493;
    int _1499 = ~_1491;
    int _1501 = _1499 + 1;
    int _1503 = _1501 + 1;
    float _1505 = _1469 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    int _1509 = _1503;
    if (!_1467)
    {
        int _1511 = ~_1491;
        int _1513 = _1511 + 1;
        _1509 = _1513;
    }
    int _1515 = _1509;
    if (_1453)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5343 = as_type<float>(_1497);
        out.gl_Position.z = _5343;
    }
    float _1517 = float(_1515);
    if (_1453)
    {
        return out;
    }
    float _1519 = -_795;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1523 = -_1021;
    float _1525 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = -_1055;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1531 = _1521 * _1521;
    float _1533 = _611 + _607;
    float _1535 = float(_1461);
    float _1537 = _611 + (-0.5);
    float _1539 = fma(_1525, _1525, _1531);
    float _1541 = _1533 + (-1.0);
    float _1543 = -_1383;
    float _1545 = _1201 + _1543;
    float _1547 = _1535 * _1517;
    float _1549 = fma(_1529, _1529, _1539);
    float _1551 = _1489 * 0.15915493667125701904296875;
    float _1553 = _1547 * (-2.0);
    float _1555 = -_1379;
    float _1557 = _1213 + _1555;
    float _1559 = _1545 * _1545;
    float _1561 = rsqrt(_1549);
    float _1563 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1565 = fma(_1553, _1323, _1323);
    float _1567 = fma(_1557, _1557, _1559);
    float _1569 = -_1393;
    float _1571 = _1239 + _1569;
    float _1573 = fma(_1563, _1553, _1563);
    float _1575 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1565);
    float _1577 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1579 = fma(_1571, _1571, _1567);
    float _1581 = _1551 * 6.283185482025146484375;
    float _1583 = sin(_1581);
    float _1585 = fma(_1573, _1447, _1575);
    float _1587 = _1585 * 0.15915493667125701904296875;
    float _1589 = _1525 * _1561;
    float _1591 = _1529 * _1561;
    float _1593 = _1521 * _1561;
    float _1595 = sqrt(_1579);
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1599 = _1589 * _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = _1591 * _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1607 = -_1599;
    float _1609 = fma(_1591, _1605, _1607);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1613 = _1593 * _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1617 = -_1603;
    float _1619 = fma(_1593, _1615, _1617);
    float _1621 = _1551 * 6.283185482025146484375;
    float _1623 = cos(_1621);
    float _1625 = _1609 * _1609;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = -_1613;
    float _1631 = fma(_1589, _1627, _1629);
    float _1633 = _1485 * _1583;
    float _1635 = fma(_1619, _1619, _1625);
    float _1637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1639 = _1587 * 6.283185482025146484375;
    float _1641 = cos(_1639);
    float _1643 = fma(_1631, _1631, _1635);
    float _1645 = _1317 * _1595;
    float _1647 = _1645 * _1577;
    float _1649 = _1587 * 6.283185482025146484375;
    float _1651 = sin(_1649);
    float _1653 = _1507 * _1623;
    float _1655 = _1485 * _1623;
    float _1657 = _1637 * _1647;
    float _1659 = rsqrt(_1643);
    float _1661 = _1623 * _1641;
    float _1663 = _1485 * _1641;
    float _1665 = _1507 * _1641;
    float _1667 = _1357 * _1645;
    float _1669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1671 = _1583 * _1641;
    float _1673 = fma(_1651, _1653, _1633);
    float _1675 = fma(_1651, _1633, _1653);
    float _1677 = _1507 * _1583;
    float _1679 = _1669 * _1667;
    float _1681 = _1665 * _1657;
    float _1683 = -_1657;
    float _1685 = _1651 * _1683;
    float _1687 = -_1655;
    float _1689 = fma(_1651, _1677, _1687);
    float _1691 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1693 = _1691 * 0.5;
    float _1695 = _1619 * _1659;
    float _1697 = _1609 * _1659;
    float _1699 = fma(_1673, _1679, _1681);
    float _1701 = -_1677;
    float _1703 = fma(_1651, _1655, _1701);
    float _1705 = _1593 * _1695;
    float _1707 = _1631 * _1659;
    float _1709 = _1663 * _1657;
    float _1711 = fma(_1661, _1679, _1685);
    float _1713 = _1591 * _1697;
    float _1715 = fma(_1689, _1693, _1699);
    float _1717 = -_1705;
    float _1719 = fma(_1589, _1697, _1717);
    float _1721 = fma(_1703, _1679, _1709);
    float _1723 = -_1713;
    float _1725 = fma(_1593, _1707, _1723);
    float _1727 = fma(_1671, _1693, _1711);
    float _1729 = _1719 * _1715;
    float _1731 = fma(_1675, _1693, _1721);
    float _1733 = _1725 * _1715;
    float _1735 = _1589 * _1707;
    float _1737 = fma(_1707, _1727, _1729);
    float _1739 = fma(_1695, _1727, _1733);
    float _1741 = -_1735;
    float _1743 = fma(_1591, _1695, _1741);
    float _1745 = fma(_1591, _1731, _1737);
    float _1747 = fma(_1589, _1731, _1739);
    float _1749 = _1743 * _1715;
    float _1751 = _1055 + _1745;
    float _1753 = _1021 + _1747;
    float _1755 = fma(_1697, _1727, _1749);
    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1759 = _1751 + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1763 = _1753 + _1761;
    float _1765 = fma(_1593, _1731, _1755);
    float _1767 = _1759 * _1759;
    float _1769 = _795 + _1765;
    float _1771 = fma(_1763, _1763, _1767);
    float _1773 = sqrt(_1771);
    bool _1775 = _1773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = _1765;
    float _1779 = _1749;
    float _1781 = _1731;
    float _1783 = _1759;
    float _1785 = _1771;
    if (!_1775)
    {
        _1777 = _1753;
    }
    float _1787 = _1777;
    float _1789 = _1787;
    if (!_1775)
    {
        _1779 = _1751;
    }
    float _1791 = _1779;
    float _1793 = _1791;
    if (!_1775)
    {
        _1781 = _1769;
    }
    float _1795 = _1781;
    bool _1797 = !_1775;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1805 = _1773 + _1803;
        float _1807 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1809 = rsqrt(_1771);
        float _1811 = _1805 * _1801;
        float _1813 = _1811 * 0.15915493667125701904296875;
        float _1815 = _1813 * 6.283185482025146484375;
        float _1817 = cos(_1815);
        float _1819 = _1813 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1817 + (-1.0);
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1827 = fma(_1821, _1807, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = fma(_1769, _1817, _1825);
        float _1831 = _1809 * _1827;
        float _1833 = fma(_1763, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1835 = fma(_1759, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1799 = _1829;
        _1789 = _1833;
        _1793 = _1835;
    }
    float _1837 = _1799;
    float _1839 = _1789;
    float _1841 = _1793;
    float _1843 = -_795;
    float _1845 = _1843 + _1837;
    float _1847 = -_1021;
    float _1849 = _1847 + _1839;
    float _1851 = -_1055;
    float _1853 = _1851 + _1841;
    float _1855 = _1845 * _1845;
    float _1857 = fma(_1849, _1849, _1855);
    float _1859 = fma(_1853, _1853, _1857);
    float _1861 = sqrt(_1859);
    bool _1863 = _1861 > 0.0;
    bool _1865 = !_1863;
    float _1867 = _1837;
    float _1869 = _1839;
    float _1871 = _1841;
    float _1873 = _1845;
    if (!_1865)
    {
        float _1875 = _203 * _203;
        float _1877 = rsqrt(_1859);
        float _1879 = fma(_201, _201, _1875);
        float _1881 = fma(_205, _205, _1879);
        float _1883 = sqrt(_1881);
        float _1885 = _1849 * _1877;
        float _1887 = _1845 * _1877;
        float _1889 = _1853 * _1877;
        bool _1891 = _1883 > 0.0;
        bool _1893 = !_1891;
        _1873 = _1887;
        _1783 = _1881;
        if (!_1893)
        {
            float _1895 = rsqrt(_1881);
            float _1897 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1899 = _203 * _1895;
            float _1901 = _201 * _1895;
            float _1903 = _1887 * _1899;
            float _1905 = _205 * _1895;
            float _1907 = fma(_1885, _1901, _1903);
            float _1909 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1911 = fma(_1889, _1905, _1907);
            float _1913 = _1911 * _1909;
            float _1915 = fma(_201, _1913, _1839);
            float _1917 = fma(_203, _1913, _1837);
            float _1919 = fma(_205, _1913, _1841);
            _1867 = _1917;
            _1869 = _1915;
            _1871 = _1919;
            _1873 = _1907;
            _1783 = _1895;
        }
    }
    float _1921 = _1867;
    float _1923 = _1869;
    float _1925 = _1871;
    float _1927 = _1873;
    float _1929 = _1783;
    float _1931 = -_1383;
    float _1933 = _1931 + _1921;
    float _1935 = -_1379;
    float _1937 = _1935 + _1923;
    float _1939 = -_1393;
    float _1941 = _1939 + _1925;
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1945 = _1933 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1953 = _1941 + _1951;
    float _1955 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1957 = _1945 * _1945;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1961 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1955);
    float _1963 = fma(_1949, _1949, _1957);
    float _1965 = fma(_1953, _1953, _1963);
    float _1967 = rsqrt(_1965);
    float _1969 = sqrt(_1965);
    float _1971 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1973 = _1949 * _1971;
    float _1975 = _1953 * _1971;
    float _1977 = _1973 * _1973;
    float _1979 = _1975 * _1975;
    float _1981 = _1977 + _1979;
    float _1983 = sqrt(_1981);
    bool _1985 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1989 = _1983 + _1987;
    float _1991 = _1953;
    float _1993 = _1981;
    float _1995 = _1989;
    float _1997 = _1945;
    float _1999 = _1929;
    if (_1985)
    {
        float _2001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1991 = _2001;
    }
    float _2003 = _1991;
    if (_1985)
    {
        float _2005 = rsqrt(_1981);
        _1993 = _2005;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    if (_1985)
    {
        float _2011 = _1989 * _2003;
        _1995 = _2011;
    }
    float _2013 = _1995;
    if (_1985)
    {
        float _2015 = _2013 * 0.15915493667125701904296875;
        _1381 = _2015;
    }
    float _2017 = _1381;
    float _2019 = _2003;
    float _2021 = _2017;
    if (_1985)
    {
        float _2023 = _2017 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        _2019 = _2025;
    }
    float _2027 = _2019;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2031 = precise::max(0.0, _2029);
    float _2033 = _1927;
    float _2035 = _2031;
    if (_1985)
    {
        float _2037 = _2017 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        _2033 = _2039;
    }
    float _2041 = _2033;
    float _2043 = -_1971;
    float _2045 = -_2031;
    float _2047 = fma(_1945, _2043, _2045);
    if (!_1985)
    {
        _1997 = _1975;
    }
    float _2049 = _1997;
    float _2051 = _2049;
    if (_1985)
    {
        float _2053 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2035 = _2053;
    }
    float _2055 = _2035;
    float _2057 = _2027;
    float _2059 = _2055;
    if (_1985)
    {
        float _2061 = fma(_2027, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1999 = _2061;
    }
    float _2063 = _1999;
    float _2065 = _2063;
    if (!_1985)
    {
        _2057 = _1973;
    }
    float _2067 = _2057;
    float _2069 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2071 = _2067;
    float _2073 = _2041;
    if (_1985)
    {
        float _2075 = _2041 + (-1.0);
        _2059 = _2075;
    }
    float _2077 = _2059;
    if (_1985)
    {
        float _2079 = _2007 * _2063;
        _1785 = _2079;
    }
    float _2081 = _1785;
    if (!_1985)
    {
        _2065 = _2047;
    }
    float _2083 = _2065;
    float _2085 = floor(_2069);
    float _2087 = _2083;
    if (_1985)
    {
        float _2089 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2089;
    }
    float _2091 = _2021;
    if (_1985)
    {
        float _2093 = _1973 * _2081;
        _2071 = _2093;
    }
    float _2095 = _2071;
    if (!_1985)
    {
        _2009 = _1977;
    }
    float _2097 = _2009;
    float _2099 = _2097;
    if (_1985)
    {
        float _2101 = _1975 * _2081;
        _2051 = _2101;
    }
    float _2103 = _2051;
    if (_1985)
    {
        float _2105 = fma(_2047, _2041, _2091);
        _2087 = _2105;
    }
    float _2107 = _2087;
    if (_1985)
    {
        float _2109 = _2095 * _2095;
        _2099 = _2109;
    }
    float _2111 = _2099;
    float _2113 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1985)
    {
        _2073 = _1979;
    }
    float _2115 = _2073;
    float _2117 = _2115;
    if (_1985)
    {
        float _2119 = _2103 * _2103;
        _2117 = _2119;
    }
    float _2121 = _2117;
    float _2123 = fma(_2107, _2107, _2111);
    float _2125 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2127 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2129 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2113);
    float _2131 = _2123 + _2121;
    float _2133 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2135 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2137 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2129);
    float _2139 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1961);
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2143 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2141);
    float _2145 = precise::clamp(_2143, 0.0, 1.0);
    float _2147 = rsqrt(_2131);
    float _2149 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2133);
    float _2151 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2135);
    float _2153 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2155 = -_2145;
    float _2157 = _2155 + 1.0;
    float _2159 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2161 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2151);
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2165 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2167 = floor(_2125);
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2171 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2163);
    float _2173 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2175 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2171);
    float _2177 = _2147 * _2095;
    float _2179 = abs(_2157);
    float _2181 = log2(_2179);
    float _2183 = _2147 * _2103;
    float _2185 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2187 = _2147 * _2107;
    float _2189 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2191 = -_2173;
    float _2193 = fma(_2191, _1959, 1.0);
    float _2195 = -_2189;
    float _2197 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2195);
    float _2199 = 1.0 / _2185;
    float _2201 = -_2167;
    float _2203 = _2125 + _2201;
    float _2205 = _2187 + 1.0;
    float _2207 = -_2183;
    float _2209 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2197);
    float _2211 = -_2085;
    float _2213 = _2069 + _2211;
    float _2215 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2217 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2219 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2221 = fma(_2209, -0.5, 0.5);
    float _2223 = log2(_2193);
    float _2225 = fma(_2209, 0.5, 0.5);
    float _2227 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2215);
    float _2229 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2217);
    float _2231 = fma(_2225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2227);
    float _2235 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2229);
    float _2237 = exp2(_2219);
    float _2239 = fma(_2225, _2231, -0.212114393711090087890625);
    float _2241 = sqrt(_2221);
    float _2243 = _2223 * 0.693147182464599609375;
    float _2245 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = -_2187;
    float _2249 = fma(_2237, _2205, _2247);
    float _2251 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2233);
    float _2253 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2235);
    float _2255 = fma(_2225, _2239, 1.570728778839111328125);
    float _2257 = fma(_2249, 0.5, 0.5);
    float _2259 = _2251 * _2199;
    float _2261 = _2253 * _2199;
    float _2263 = _2241 * 0.636619746685028076171875;
    float _2265 = fma(_2259, 0.5, 0.5);
    float _2267 = fma(_2261, -0.5, 0.5);
    float _2269 = -_2255;
    float _2271 = fma(_2263, _2269, 1.0);
    float2 _6539 = float2(_2213, _2203);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).x;
    float3 _6550 = float3(_2265, _2267, _2245);
    float _2275 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6550, float3(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6550, float3(0.0), isnan(_6550)), level(0.0)).x;
    float3 _6561 = float3(_2265, _2267, _2245);
    float4 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6561, float3(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6561, float3(0.0), isnan(_6561)), level(0.0)).xyzw;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = _2278.w;
    float2 _6577 = float2(_2271, _2257);
    float3 _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6577, float2(0.0), isnan(_6577)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6577, float2(0.0), isnan(_6577)), level(0.0)).xyz;
    float _2292 = _2290.x;
    float _2294 = _2290.y;
    float _2296 = _2290.z;
    float _2298 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2300 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2302 = _1665 * _1719;
    float _2304 = _1689 * _1743;
    float _2306 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2298);
    float _2308 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2300);
    bool _2310 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2312 = isnan(0.5);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2318 = _2314 || _2316;
    float _2320 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2322 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2306);
    float _2324 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2308);
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2328 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2330 = _1665 * _1743;
    float _2332 = 1.0 / _2326;
    float _2334 = _2328 + _2326;
    float _2336 = _1665 * _1725;
    float _2338 = _1673 * _1743;
    float _2340 = -_1651;
    float _2342 = fma(_2340, _1697, _2330);
    float _2344 = -_1651;
    float _2346 = fma(_2344, _1695, _2336);
    float _2348 = fma(_1661, _1697, _2338);
    float _2350 = -_1651;
    float _2352 = fma(_2350, _1707, _2302);
    float _2354 = _2334 * _2332;
    float _2356 = _2354 * 0.5;
    float _2358 = _1673 * _1725;
    float _2360 = _1689 * _1725;
    float _2362 = _1673 * _1719;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2366 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2364);
    float _2368 = _1689 * _1719;
    float _2370 = fma(_1661, _1695, _2358);
    float _2372 = fma(_1671, _1695, _2360);
    float _2374 = fma(_1661, _1707, _2362);
    float _2376 = fma(_1671, _1707, _2368);
    float _2378 = 1.0 / _2366;
    float _2380 = fma(_1703, _1593, _2348);
    float _2382 = fma(_1671, _1697, _2304);
    float _2384 = fma(_1703, _1589, _2370);
    float _2386 = fma(_1675, _1589, _2372);
    float _2388 = fma(_1663, _1593, _2342);
    float _2390 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2392 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2394 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2392);
    float _2396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2398 = _2378 * _2396;
    float _2400 = abs(_2398);
    float _2402 = log2(_2400);
    bool _2404 = _2398 <= 8000.0;
    bool _2406 = isnan(_2398);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2418 = exp2(_2416);
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = fma(_2422, -2.0, 3.0);
    float _2426 = _2422 * _2422;
    float _2428 = _2426 * _2424;
    float _2430 = -_2428;
    float _2432 = _2430 + 1.0;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2428);
    float _2436 = fma(_1663, _1589, _2346);
    float _2438 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2440 = fma(_1663, _1591, _2352);
    float _2442 = fma(_1675, _1593, _2382);
    float _2444 = in.m_76.x;
    float _2446 = _2438 * _2436;
    float _2448 = _2438 * _2440;
    float _2450 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2452 = _2438 * _2388;
    float _2454 = fma(_1703, _1591, _2374);
    float _2456 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2394);
    float _2458 = fma(_1675, _1591, _2376);
    float _2460 = fma(_2320, _2380, _2452);
    float _2462 = exp2(_2450);
    float _2464 = fma(_2320, _2384, _2446);
    float _2466 = fma(_2320, _2454, _2448);
    float _2468 = _2456 + _2185;
    float _2470 = _2251 + _2185;
    float _2472 = _2185 * 0.5;
    float _2474 = _2414 * _2434;
    float _2476 = _2394;
    float _2478 = _2414;
    float _2480 = _2185;
    float _2482 = _2456;
    if (_2318)
    {
        _2476 = 1.0;
    }
    float _2484 = _2476;
    float _2486 = _2468 * 0.5;
    float _2488 = _2470 * 0.5;
    float _2490 = fma(_2253, -0.5, _2472);
    float _2492 = _2484;
    if (_2318)
    {
        _2478 = 1.0;
    }
    float _2494 = _2478;
    float _2496 = _2494;
    float _2498 = _2286;
    float _2500 = _2284;
    if (!_2318)
    {
        float _2502 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2504 = _2502 * 0.15915493667125701904296875;
        float _2506 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2510 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2508;
        float _2512 = _2504 * 6.283185482025146484375;
        float _2514 = cos(_2512);
        float _2516 = _2506 * 0.15915493667125701904296875;
        float _2518 = _2504 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        float _2522 = 1.0 / _2514;
        float _2524 = _2516 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = _2520 * _2522;
        float _2530 = _2516 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2526 * _2528;
        float _2536 = 1.0 / _2510;
        float _2538 = 1.0 / _2534;
        float _2540 = _2532 * _2538;
        float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2544 = fma(_2398, _2540, _2542);
        float _2546 = _2544 * _2536;
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        _2496 = _2548;
    }
    float _2550 = _2496;
    if (!_2318)
    {
        float _2552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2558 = _2554 * 6.283185482025146484375;
        float _2560 = cos(_2558);
        float _2562 = _2556 * 0.15915493667125701904296875;
        float _2564 = _2554 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = 1.0 / _2560;
        float _2570 = _2562 * 6.283185482025146484375;
        float _2572 = cos(_2570);
        float _2574 = _2566 * _2568;
        float _2576 = _2562 * 6.283185482025146484375;
        float _2578 = sin(_2576);
        float _2580 = _2572 * _2574;
        float _2582 = 1.0 / _2580;
        float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2586 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2584;
        float _2588 = 1.0 / _2586;
        float _2590 = _2578 * _2582;
        float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2594 = fma(_2398, _2590, _2592);
        float _2596 = _2594 * _2588;
        float _2598 = precise::clamp(_2596, 0.0, 1.0);
        float _2600 = -_2598;
        float _2602 = _2600 + 1.0;
        _2492 = _2602;
    }
    float _2604 = _2492;
    float _2606 = -_2462;
    float _2608 = _2606 + 1.0;
    float _2610 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = -_2273;
    float _2614 = _2612 + 1.0;
    float _2616 = _2386 + _2464;
    float _2618 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2620 = _2614 * _2610;
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    out.gl_Position.x = _2251;
    out.gl_Position.y = _2253;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2185;
    float _2624 = _2442 + _2460;
    float _2626 = _2618 * _2275;
    float _2628 = -_2618;
    float _2630 = _2628 + 1.0;
    float _2632 = _2458 + _2466;
    out.m_78.x = _2488;
    out.m_78.y = _2490;
    out.m_78.z = _2486;
    out.m_78.w = _2185;
    float _2634 = _2296 * _2626;
    bool _2636 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2638 = isnan(_1969);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2644 = _2640 || _2642;
    out.m_80.x = _2616;
    out.m_80.y = _2624;
    out.m_80.z = _2632;
    float _2646 = -_2622;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2650 = _2286 * _2626;
    float _2652 = _2648 * _2444;
    float _2654 = fma(_2292, _2650, _2280);
    float _2656 = _2286 * _2630;
    float _2658 = fma(_2294, _2650, _2282);
    float _2660 = _2652 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2662 = fma(_2286, _2634, _2284);
    float _2664 = _2550 * _2604;
    float _2666 = _2650;
    float _2668 = _2664;
    if (!_2644)
    {
        _2498 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2670 = _2498;
    out.m_82.x = _2660;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2674 = _2670;
    float _2676 = _2670;
    if (!_2644)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2678 = _2500;
    out.m_84.x = _2654;
    out.m_84.y = _2658;
    out.m_84.z = _2662;
    out.m_84.w = _2656;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2644)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2684 = _2480;
    float _2686 = _2684;
    float _2688 = _2684;
    if (!_2644)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2690 = _2482;
    float _2692 = _2690;
    float _2694 = _2690;
    if (!_2644)
    {
        _2666 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2696 = _2666;
    float _2698 = _2696;
    float _2700 = _2696;
    if (!_2644)
    {
        _2668 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2702 = _2668;
    bool _2704 = !_2644;
    float _2706 = _2702;
    float _2708 = _2702;
    if (!_2704)
    {
        bool _2710 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2712 = isnan(_1969);
        bool _2714 = _2710 || _2712;
        bool _2716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2718 = _2714 || _2716;
        if (!_2718)
        {
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2722 = _1969 + _2720;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2726 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2724;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2732 = 1.0 / _2726;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2750 = _2722 * _2732;
            float _2752 = precise::clamp(_2750, 0.0, 1.0);
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2758 = fma(_2752, _2730, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2760 = fma(_2752, _2756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2762 = fma(_2752, _2736, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2764 = fma(_2752, _2740, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2766 = fma(_2752, _2744, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2768 = fma(_2752, _2748, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2682 = _2762;
            _2700 = _2766;
            _2676 = _2758;
            _2694 = _2764;
            _2688 = _2760;
            _2708 = _2768;
            _2770 = true;
        }
        else
        {
            bool _2772 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2774 = isnan(_1969);
            bool _2776 = _2772 || _2774;
            bool _2778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2780 = _2776 || _2778;
            if (!_2780)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2782 = _2674;
            _2676 = _2782;
            if (!_2780)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2784 = _2680;
            _2682 = _2784;
            if (!_2780)
            {
                _2686 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2786 = _2686;
            _2688 = _2786;
            if (!_2780)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2788 = _2692;
            _2694 = _2788;
            if (!_2780)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2790 = _2698;
            _2700 = _2790;
            if (!_2780)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2792 = _2706;
            bool _2794 = !_2780;
            _2708 = _2792;
            if (!_2794)
            {
                bool _2796 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2798 = isnan(_1969);
                bool _2800 = _2796 || _2798;
                bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2804 = _2800 || _2802;
                if (!_2804)
                {
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2808 = _1969 + _2806;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2810;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2818 = 1.0 / _2812;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2836 = _2808 * _2818;
                    float _2838 = precise::clamp(_2836, 0.0, 1.0);
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2682 = _2848;
                    _2700 = _2852;
                    _2676 = _2844;
                    _2694 = _2850;
                    _2688 = _2846;
                    _2708 = _2854;
                    _2770 = true;
                }
                else
                {
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2688 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2770 = false;
    float _2856 = _2682;
    float _2858 = _2700;
    float _2860 = _2676;
    float _2862 = _2694;
    float _2864 = _2688;
    float _2866 = _2708;
    float _2868 = fma(_2624, -0.5, 0.5);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    float _2872 = -_2856;
    float _2874 = _2872 + _2858;
    float _2876 = -_2860;
    float _2878 = _2876 + _2862;
    out.m_86.x = 0.0;
    float _2880 = fma(_2870, _2874, _2856);
    float _2882 = -_2864;
    float _2884 = _2882 + _2866;
    float _2886 = fma(_2870, _2878, _2860);
    float _2888 = _2880 * 0.586610972881317138671875;
    bool _2890 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2892 = fma(_2870, _2884, _2864);
    float _2894 = _2672 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2896 = fma(_2886, 0.298911988735198974609375, _2888);
    bool _2898 = _2550 > 0.0;
    bool _2900 = isnan(_2550);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = fma(_2892, 0.114477999508380889892578125, _2896);
    out.m_49.x = _2894;
    bool _2910 = _2604 <= 0.0;
    bool _2912 = !_2906;
    bool _2914 = _2910 || _2912;
    float _2916 = -_2908;
    float _2918 = _2886 + _2916;
    float _2920 = -_2908;
    float _2922 = _2892 + _2920;
    float _2924 = fma(_2918, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    float _2926 = -_2908;
    float _2928 = _2880 + _2926;
    float _2930 = fma(_2922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    float _2932 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    bool _2934 = !_2890;
    if (!_2934)
    {
        float _2936 = -_1933;
        float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2940 = -_1937;
        float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2944 = -_1941;
        float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2948 = _2938 * _2938;
        float _2950 = fma(_2942, _2942, _2948);
        float _2952 = fma(_2946, _2946, _2950);
        float _2954 = sqrt(_2952);
        float _2956 = rsqrt(_2952);
        float _2958 = -_2954;
        float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2962 = _2960 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = _2942 * _2956;
        float _2968 = _2938 * _2956;
        float _2970 = abs(_2964);
        float _2972 = log2(_2970);
        float _2974 = _2946 * _2956;
        float _2976 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2978 = _2624 * _2968;
        float _2980 = -_2968;
        float _2982 = -_2976;
        float _2984 = fma(_2980, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2982);
        float _2986 = fma(_2616, _2966, _2978);
        float _2988 = -_2974;
        float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2984);
        float _2992 = fma(_2632, _2974, _2986);
        float _2994 = precise::clamp(_2992, 0.0, 1.0);
        float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2998 = _2990 + _2996;
        float _3000 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3002 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3004 = precise::clamp(_3002, 0.0, 1.0);
        float _3006 = exp2(_3000);
        float _3008 = _3006 * _3004;
        float _3010 = _2994 * _3008;
        float _3012 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3016 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3012;
        out.m_86.y = _3014;
        out.m_86.z = _3016;
    }
    out.m_88.x = _2924;
    out.m_88.y = _2932;
    out.m_88.z = _2930;
    if (!_2914)
    {
        return out;
    }
    float _3018 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3018;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2770 = false;
    bool _603 = false;
    bool _429 = false;
    bool _323 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3074 = as_type<float>(_121);
        out.gl_Position.z = _3074;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_53.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3146 = as_type<float>(_161);
        out.gl_Position.z = _3146;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_60.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _145;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _249;
    float _275 = _265 * _253;
    float _277 = -_265;
    float _279 = _277 + 1.0;
    float _281 = _233 * _273;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _287 * _275;
    float _293 = _289 * _275;
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _291);
    float _297 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _293);
    float _299 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _295);
    float _301 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _297);
    bool _303 = !_271;
    float _321;
    if (!_303)
    {
        float _305 = in.m_60.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        _321 = _145;
    }
    _323 = false;
    float _325 = _321;
    float _327 = in.m_62.x;
    float _329 = in.m_62.y;
    bool _331 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _333 = isnan(_325);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _347 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _349 = isnan(_325);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _325 + _363;
    float _367 = -_341;
    float _369 = _367 + 1.0;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _373 = 1.0 / _345;
    float _375 = _357 * _369;
    float _377 = -_357;
    float _379 = _377 + 1.0;
    float _381 = _301 * _329;
    float _383 = _299 * _327;
    float _385 = _361 * _373;
    float _387 = fma(_385, _365, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _389 = _387 * _375;
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[115].x, _389);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _399 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[116].x, _391);
    float _401 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _399 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _401;
    out.m_64.y = _403;
    out.m_64.z = _405;
    out.m_64.w = _407;
    bool _409 = !_371;
    float _427;
    if (!_409)
    {
        float _411 = in.m_60.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _145;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _461 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _463 = isnan(_431);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _439;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _479;
    bool _483 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _485 = isnan(_431);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _471 * _477;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _503 = 1.0 / _455;
    float _505 = _493 * _499;
    float _507 = -_493;
    float _509 = _507 + 1.0;
    float _511 = 1.0 / _459;
    float _513 = _481 * _473;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _519 = fma(_513, _435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _521 = _517 * _503;
    bool _523 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _525 = isnan(_431);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _541 = _431 + _539;
    float _543 = _519 * _505;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _547 = _431 + _545;
    float _549 = -_533;
    float _551 = _549 + 1.0;
    float _553 = fma(_521, _541, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _555 = _537 * _511;
    float _557 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[131].x, _543);
    float _559 = _451 * _551;
    float _561 = fma(_555, _547, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _563 = fma(_553, _495, _557);
    float _565 = fma(_561, _559, _563);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _573 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[134].x, _565);
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _573 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _575;
    out.m_66.y = _577;
    out.m_66.z = _579;
    out.m_66.w = _581;
    bool _583 = !_501;
    float _601;
    if (!_583)
    {
        float _585 = in.m_60.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        _601 = _145;
    }
    _603 = false;
    float _605 = _601;
    float _607 = in.m_60.x;
    float _609 = in.m_60.y;
    float _611 = in.m_60.z;
    float _613 = in.m_60.w;
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _627 = _625 != 0;
    float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _635 = 1.0 / _633;
    float _637 = _607 * 2.0;
    bool _639 = _607 > 0.5;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _643 = _613 > 0.5;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _649 = -_189;
    int _651 = _639 ? as_type<int>(_649) : as_type<int>(_189);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _659 = _657 != 0;
    float _661 = 1.0 / _647;
    bool _663 = !_619;
    float _665 = _663 ? _189 : as_type<float>(_651);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _675 = _673 != 0;
    float _677 = _609 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _679 = in.m_46.x;
    float _681 = in.m_46.y;
    float _683 = in.m_46.z;
    bool _685 = _609 > 0.5;
    float _687 = fma(_677, -2.0, _667);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _693 = -_199;
    int _695 = _685 ? as_type<int>(_693) : as_type<int>(_199);
    float _697 = 1.0 / _655;
    bool _699 = !_623;
    float _701 = _699 ? _199 : as_type<float>(_695);
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = _607 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _709 = 1.0 / _691;
    float _711 = -_641;
    float _713 = fma(_707, 2.0, _711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _731 = _721 * _697;
    float _733 = _681 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _735 = _681 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _737 = _681 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _739 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[4].x, _733);
    float _741 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[5].x, _735);
    float _743 = fma(_679, (*spvDescriptorSet0.vp_c10)._m0[6].x, _737);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _749 = 1.0 / _725;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _763 = _753 * _661;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _769 = _717 * _709;
    float _771 = 1.0 / _747;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _773;
    float _777 = -_189;
    int _779 = _685 ? as_type<int>(_777) : as_type<int>(_189);
    float _781 = _767 * _635;
    bool _783 = _611 > 0.5;
    float _785 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[5].z, _741);
    float _787 = 1.0 / _729;
    float _789 = _775 * _749;
    float _791 = -_189;
    int _793 = _783 ? as_type<int>(_791) : as_type<int>(_189);
    float _795 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _797 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _799 = isnan(_605);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    bool _809 = !_659;
    float _811 = _809 ? _189 : as_type<float>(_793);
    float _813 = _761 * _771;
    float _815 = _611 * 2.0;
    float _817 = _609 + _611;
    float _819 = floor(_637);
    bool _821 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _823 = isnan(_605);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _817 + (-1.0);
    bool _835 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _837 = isnan(_605);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = _757 * _787;
    float _849 = -_831;
    float _851 = _849 + 1.0;
    float _853 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = floor(_815);
    bool _857 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _859 = isnan(_605);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _845 * _851;
    float _871 = -_199;
    int _873 = _783 ? as_type<int>(_871) : as_type<int>(_199);
    float _875 = -_845;
    float _877 = _875 + 1.0;
    float _879 = -_867;
    float _881 = _879 + 1.0;
    bool _883 = _819 > 0.0;
    float _885 = _609 + _607;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _889 = _885 + (-1.0);
    bool _891 = !_671;
    float _893 = _891 ? _189 : as_type<float>(_779);
    bool _895 = _855 > 0.0;
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _899 = _855 >= 0.0;
    bool _901 = isnan(_855);
    bool _903 = _899 || _901;
    bool _905 = isnan(0.0);
    bool _907 = _903 || _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _911 = _605 + _909;
    bool _913 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _915 = isnan(_605);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _893 + 0.5;
    int _927 = _907 ? 0 : 1;
    float _929 = fma(_763, _911, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _931 = _819 >= 0.0;
    bool _933 = isnan(_819);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = -_923;
    float _943 = _941 + 1.0;
    float _945 = _923 * _881;
    bool _947 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _949 = isnan(_605);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _961 = fma(_683, (*spvDescriptorSet0.vp_c10)._m0[6].z, _743);
    float _963 = _807 * _943;
    float _965 = -_807;
    float _967 = _965 + 1.0;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _971 = _605 + _969;
    bool _973 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _975 = isnan(_605);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = -_957;
    float _987 = _985 + 1.0;
    float _989 = _957 * _967;
    float _991 = fma(_781, _971, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _995 = _605 + _993;
    bool _997 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _999 = isnan(_605);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = _983 * _987;
    float _1011 = -_983;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_769, _995, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1019 = _605 + _1017;
    float _1021 = _959 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1023 = _1007 * _1013;
    float _1025 = -_1007;
    float _1027 = _1025 + 1.0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1031 = _605 + _1029;
    float _1033 = fma(_731, _1019, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1035 = _1019;
    float _1037 = _877;
    float _1039 = _789;
    if (!_705)
    {
        _1035 = _611;
    }
    float _1041 = _1035;
    float _1043 = _831 * _1027;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1047 = _605 + _1045;
    float _1049 = fma(_847, _1031, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1051 = _1041;
    if (_705)
    {
        _1051 = _609;
    }
    float _1053 = _1051;
    float _1055 = _961 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1057 = fma(_813, _1047, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1059 = ~_927;
    int _1061 = _1059 + 1;
    int _1063 = _1061 + 1;
    float _1065 = _929 * _869;
    int _1067 = _1063;
    if (!_895)
    {
        int _1069 = ~_927;
        int _1071 = _1069 + 1;
        _1067 = _1071;
    }
    int _1073 = _1067;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1077 = _605 + _1075;
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1081 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1065);
    float _1083 = -_133;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[76].x, _713);
    float _1087 = fma(_789, _1077, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1089 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[83].w, _887);
    bool _1091 = !_675;
    float _1093 = _1091 ? _199 : as_type<float>(_873);
    float _1095 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1097 = _665 + 0.5;
    float _1099 = fma(_991, _1043, _1081);
    if (!_705)
    {
        _1037 = _609;
    }
    float _1101 = _1037;
    float _1103 = fma(_1095, _1097, _1085);
    float _1105 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _687);
    float _1107 = _1101;
    if (!_705)
    {
        _1039 = _611;
    }
    float _1109 = _1039;
    float _1111 = fma(_1015, _1023, _1099);
    float _1113 = _1109;
    if (_705)
    {
        _1107 = _607;
    }
    float _1115 = _1107;
    float _1117 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_705)
    {
        _1113 = _609;
    }
    float _1119 = _1113;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    float _1135 = _701 + (-0.5);
    float _1137 = fma(_1033, _1009, _1111);
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1141 = -_1117;
    float _1143 = -_1105;
    float _1145 = fma(_1141, _1135, _1143);
    float _1147 = _629 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1153 = fma(_1049, _989, _1137);
    float _1155 = _811 + 0.5;
    float _1157 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1149);
    float _1159 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1161 = _939 ? 0 : 1;
    float _1163 = fma(_1057, _963, _1153);
    float _1165 = -_1121;
    float _1167 = fma(_1159, 2.0, _1165);
    int _1169 = ~_1161;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = -_1093;
    float _1177 = _1175 + 0.5;
    int _1179 = _1173;
    if (!_883)
    {
        int _1181 = ~_1161;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -_133;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1167);
    float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1193 = -_199;
    int _1195 = _643 ? as_type<int>(_1193) : as_type<int>(_199);
    float _1197 = fma(_1147, _1155, _1189);
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1201 = _795 + _1199;
    float _1203 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1207 = fma(_1087, _945, _1163);
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1213 = _1021 + _1211;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1217 = !_627;
    float _1219 = _1217 ? _199 : as_type<float>(_1195);
    float _1221 = fma(_1139, -2.0, _1205);
    float _1223 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1209);
    float _1225 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1215);
    float _1227 = _925 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1229 = _1219 + (-0.5);
    float _1231 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1221);
    float _1233 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1223);
    float _1235 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1055 + _1237;
    float _1241 = -_1203;
    float _1243 = -_1231;
    float _1245 = fma(_1241, _1229, _1243);
    float _1247 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1249 = -_1233;
    float _1251 = _1249 + 1.0;
    float _1253 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1157);
    float _1255 = _1227 * _1191;
    float _1257 = -_1235;
    float _1259 = _1257 + 1.0;
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1225);
    float _1263 = _1201 * _1201;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1267 = -_1251;
    float _1269 = fma(_665, _1267, _1103);
    float _1271 = -_1253;
    float _1273 = _1271 + 1.0;
    bool _1275 = !_1125;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1281 = log2(_1279);
    float _1283 = fma(_1219, _1259, _1245);
    float _1285 = fma(_1213, _1213, _1263);
    bool _1287 = _1261 >= 0.0;
    float _1289 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1265);
    float _1291 = -_1273;
    float _1293 = fma(_811, _1291, _1197);
    int _1295 = abs(_1277);
    float _1297 = fma(_1239, _1239, _1285);
    float _1299 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1289);
    float _1301 = float(_1073);
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1305 = float(_1295);
    float _1307 = -_1299;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1207);
    float _1313 = _1305 * _1301;
    float _1315 = fma(_701, _1309, _1145);
    float _1317 = rsqrt(_1297);
    float _1319 = in.m_68.x;
    float _1321 = in.m_68.y;
    float _1323 = in.m_68.z;
    float _1325 = _1309;
    int _1327 = _1295;
    if (_1287)
    {
        _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1329 = _1325;
    float _1331 = _1281 * _133;
    bool _1333 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1335 = isnan(0.0);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1341 = _1337 || _1339;
    out.m_70.x = _1269;
    out.m_70.y = _1315;
    out.m_70.z = _1293;
    out.m_70.w = _1283;
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    if (_1287)
    {
        float _1353 = _1329 * 5.0;
        _1327 = as_type<int>(_1353);
    }
    int _1355 = _1327;
    float _1357 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1359 = exp2(_1331);
    float _1361 = _1247 * _1303;
    out.m_72.x = _1311;
    float _1363 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_74.x = _1255;
    out.m_74.y = _1361;
    float _1365 = _1363 * _1317;
    bool _1367 = !_1133;
    int _1369 = _1367 ? 0 : 1;
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5120 = as_type<float>(_1355);
        out.gl_Position.z = _5120;
    }
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1373 = 1.0 + _1371;
    bool _1375 = !_1129;
    int _1377 = _1375 ? 0 : 1;
    float _1379 = _1213 * _1365;
    float _1381 = _1379;
    if (_1287)
    {
        out.m_49.x = 0.0;
    }
    float _1383 = _1201 * _1365;
    if (_1287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1385 = -_1383;
    float _1387 = _795 + _1385;
    float _1389 = -_1379;
    float _1391 = _1021 + _1389;
    float _1393 = _1239 * _1365;
    float _1395 = 1.0 / _1373;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1399 = _1387 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1403 = _1391 + _1401;
    float _1405 = _609 * 2.0;
    int _1407 = abs(_1377);
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1411 = -_1393;
    float _1413 = _1055 + _1411;
    float _1415 = -_1359;
    float _1417 = _1415 + 1.0;
    float _1419 = float(_1407);
    float _1421 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1409);
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1413 + _1423;
    float _1427 = float(_1185);
    float _1429 = _1313 * (-2.0);
    float _1431 = floor(_1405);
    float _1433 = _1341 ? _1417 : 0.0;
    float _1435 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1421);
    float _1437 = _607 + (-0.5);
    float _1439 = fma(_1429, _1319, _1319);
    float _1441 = _1419 * _1427;
    float _1443 = _1427;
    if (_1351)
    {
        float _1445 = _1433 * _1395;
        _155 = _1445;
    }
    float _1447 = _155;
    float _1449 = fma(_897, _1429, _897);
    float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    bool _1453 = _1435 >= 0.0;
    float _1455 = _1441 * (-2.0);
    float _1457 = _609 + (-0.5);
    float _1459 = fma(_1449, _1447, _1451);
    int _1461 = abs(_1369);
    float _1463 = fma(_1455, _1321, _1321);
    float _1465 = fma(_853, _1455, _853);
    bool _1467 = _1431 > 0.0;
    float _1469 = _1459 * 0.15915493667125701904296875;
    float _1471 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1463);
    bool _1473 = _1431 >= 0.0;
    bool _1475 = isnan(_1431);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = _1469 * 6.283185482025146484375;
    float _1485 = sin(_1483);
    if (_1453)
    {
        _1443 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1487 = _1443;
    float _1489 = fma(_1465, _1447, _1471);
    int _1491 = _1481 ? 0 : 1;
    int _1493 = as_type<int>(_1487);
    if (_1453)
    {
        out.m_49.x = 0.0;
    }
    if (_1453)
    {
        float _1495 = _1487 * 5.0;
        _1493 = as_type<int>(_1495);
    }
    int _1497 = _1493;
    int _1499 = ~_1491;
    int _1501 = _1499 + 1;
    int _1503 = _1501 + 1;
    float _1505 = _1469 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    int _1509 = _1503;
    if (!_1467)
    {
        int _1511 = ~_1491;
        int _1513 = _1511 + 1;
        _1509 = _1513;
    }
    int _1515 = _1509;
    if (_1453)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5343 = as_type<float>(_1497);
        out.gl_Position.z = _5343;
    }
    float _1517 = float(_1515);
    if (_1453)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1519 = -_795;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1523 = -_1021;
    float _1525 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = -_1055;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1531 = _1521 * _1521;
    float _1533 = _611 + _607;
    float _1535 = float(_1461);
    float _1537 = _611 + (-0.5);
    float _1539 = fma(_1525, _1525, _1531);
    float _1541 = _1533 + (-1.0);
    float _1543 = -_1383;
    float _1545 = _1201 + _1543;
    float _1547 = _1535 * _1517;
    float _1549 = fma(_1529, _1529, _1539);
    float _1551 = _1489 * 0.15915493667125701904296875;
    float _1553 = _1547 * (-2.0);
    float _1555 = -_1379;
    float _1557 = _1213 + _1555;
    float _1559 = _1545 * _1545;
    float _1561 = rsqrt(_1549);
    float _1563 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1565 = fma(_1553, _1323, _1323);
    float _1567 = fma(_1557, _1557, _1559);
    float _1569 = -_1393;
    float _1571 = _1239 + _1569;
    float _1573 = fma(_1563, _1553, _1563);
    float _1575 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1565);
    float _1577 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1579 = fma(_1571, _1571, _1567);
    float _1581 = _1551 * 6.283185482025146484375;
    float _1583 = sin(_1581);
    float _1585 = fma(_1573, _1447, _1575);
    float _1587 = _1585 * 0.15915493667125701904296875;
    float _1589 = _1525 * _1561;
    float _1591 = _1529 * _1561;
    float _1593 = _1521 * _1561;
    float _1595 = sqrt(_1579);
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1599 = _1589 * _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = _1591 * _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1607 = -_1599;
    float _1609 = fma(_1591, _1605, _1607);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1613 = _1593 * _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1617 = -_1603;
    float _1619 = fma(_1593, _1615, _1617);
    float _1621 = _1551 * 6.283185482025146484375;
    float _1623 = cos(_1621);
    float _1625 = _1609 * _1609;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = -_1613;
    float _1631 = fma(_1589, _1627, _1629);
    float _1633 = _1485 * _1583;
    float _1635 = fma(_1619, _1619, _1625);
    float _1637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1639 = _1587 * 6.283185482025146484375;
    float _1641 = cos(_1639);
    float _1643 = fma(_1631, _1631, _1635);
    float _1645 = _1317 * _1595;
    float _1647 = _1645 * _1577;
    float _1649 = _1587 * 6.283185482025146484375;
    float _1651 = sin(_1649);
    float _1653 = _1507 * _1623;
    float _1655 = _1485 * _1623;
    float _1657 = _1637 * _1647;
    float _1659 = rsqrt(_1643);
    float _1661 = _1623 * _1641;
    float _1663 = _1485 * _1641;
    float _1665 = _1507 * _1641;
    float _1667 = _1357 * _1645;
    float _1669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1671 = _1583 * _1641;
    float _1673 = fma(_1651, _1653, _1633);
    float _1675 = fma(_1651, _1633, _1653);
    float _1677 = _1507 * _1583;
    float _1679 = _1669 * _1667;
    float _1681 = _1665 * _1657;
    float _1683 = -_1657;
    float _1685 = _1651 * _1683;
    float _1687 = -_1655;
    float _1689 = fma(_1651, _1677, _1687);
    float _1691 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1693 = _1691 * 0.5;
    float _1695 = _1619 * _1659;
    float _1697 = _1609 * _1659;
    float _1699 = fma(_1673, _1679, _1681);
    float _1701 = -_1677;
    float _1703 = fma(_1651, _1655, _1701);
    float _1705 = _1593 * _1695;
    float _1707 = _1631 * _1659;
    float _1709 = _1663 * _1657;
    float _1711 = fma(_1661, _1679, _1685);
    float _1713 = _1591 * _1697;
    float _1715 = fma(_1689, _1693, _1699);
    float _1717 = -_1705;
    float _1719 = fma(_1589, _1697, _1717);
    float _1721 = fma(_1703, _1679, _1709);
    float _1723 = -_1713;
    float _1725 = fma(_1593, _1707, _1723);
    float _1727 = fma(_1671, _1693, _1711);
    float _1729 = _1719 * _1715;
    float _1731 = fma(_1675, _1693, _1721);
    float _1733 = _1725 * _1715;
    float _1735 = _1589 * _1707;
    float _1737 = fma(_1707, _1727, _1729);
    float _1739 = fma(_1695, _1727, _1733);
    float _1741 = -_1735;
    float _1743 = fma(_1591, _1695, _1741);
    float _1745 = fma(_1591, _1731, _1737);
    float _1747 = fma(_1589, _1731, _1739);
    float _1749 = _1743 * _1715;
    float _1751 = _1055 + _1745;
    float _1753 = _1021 + _1747;
    float _1755 = fma(_1697, _1727, _1749);
    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1759 = _1751 + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1763 = _1753 + _1761;
    float _1765 = fma(_1593, _1731, _1755);
    float _1767 = _1759 * _1759;
    float _1769 = _795 + _1765;
    float _1771 = fma(_1763, _1763, _1767);
    float _1773 = sqrt(_1771);
    bool _1775 = _1773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = _1765;
    float _1779 = _1749;
    float _1781 = _1731;
    float _1783 = _1759;
    float _1785 = _1771;
    if (!_1775)
    {
        _1777 = _1753;
    }
    float _1787 = _1777;
    float _1789 = _1787;
    if (!_1775)
    {
        _1779 = _1751;
    }
    float _1791 = _1779;
    float _1793 = _1791;
    if (!_1775)
    {
        _1781 = _1769;
    }
    float _1795 = _1781;
    bool _1797 = !_1775;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1805 = _1773 + _1803;
        float _1807 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1809 = rsqrt(_1771);
        float _1811 = _1805 * _1801;
        float _1813 = _1811 * 0.15915493667125701904296875;
        float _1815 = _1813 * 6.283185482025146484375;
        float _1817 = cos(_1815);
        float _1819 = _1813 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1817 + (-1.0);
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1827 = fma(_1821, _1807, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = fma(_1769, _1817, _1825);
        float _1831 = _1809 * _1827;
        float _1833 = fma(_1763, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1835 = fma(_1759, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1799 = _1829;
        _1789 = _1833;
        _1793 = _1835;
    }
    float _1837 = _1799;
    float _1839 = _1789;
    float _1841 = _1793;
    float _1843 = -_795;
    float _1845 = _1843 + _1837;
    float _1847 = -_1021;
    float _1849 = _1847 + _1839;
    float _1851 = -_1055;
    float _1853 = _1851 + _1841;
    float _1855 = _1845 * _1845;
    float _1857 = fma(_1849, _1849, _1855);
    float _1859 = fma(_1853, _1853, _1857);
    float _1861 = sqrt(_1859);
    bool _1863 = _1861 > 0.0;
    bool _1865 = !_1863;
    float _1867 = _1837;
    float _1869 = _1839;
    float _1871 = _1841;
    float _1873 = _1845;
    if (!_1865)
    {
        float _1875 = _203 * _203;
        float _1877 = rsqrt(_1859);
        float _1879 = fma(_201, _201, _1875);
        float _1881 = fma(_205, _205, _1879);
        float _1883 = sqrt(_1881);
        float _1885 = _1849 * _1877;
        float _1887 = _1845 * _1877;
        float _1889 = _1853 * _1877;
        bool _1891 = _1883 > 0.0;
        bool _1893 = !_1891;
        _1873 = _1887;
        _1783 = _1881;
        if (!_1893)
        {
            float _1895 = rsqrt(_1881);
            float _1897 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1899 = _203 * _1895;
            float _1901 = _201 * _1895;
            float _1903 = _1887 * _1899;
            float _1905 = _205 * _1895;
            float _1907 = fma(_1885, _1901, _1903);
            float _1909 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1911 = fma(_1889, _1905, _1907);
            float _1913 = _1911 * _1909;
            float _1915 = fma(_201, _1913, _1839);
            float _1917 = fma(_203, _1913, _1837);
            float _1919 = fma(_205, _1913, _1841);
            _1867 = _1917;
            _1869 = _1915;
            _1871 = _1919;
            _1873 = _1907;
            _1783 = _1895;
        }
    }
    float _1921 = _1867;
    float _1923 = _1869;
    float _1925 = _1871;
    float _1927 = _1873;
    float _1929 = _1783;
    float _1931 = -_1383;
    float _1933 = _1931 + _1921;
    float _1935 = -_1379;
    float _1937 = _1935 + _1923;
    float _1939 = -_1393;
    float _1941 = _1939 + _1925;
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1945 = _1933 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1953 = _1941 + _1951;
    float _1955 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1957 = _1945 * _1945;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1961 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1955);
    float _1963 = fma(_1949, _1949, _1957);
    float _1965 = fma(_1953, _1953, _1963);
    float _1967 = rsqrt(_1965);
    float _1969 = sqrt(_1965);
    float _1971 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1973 = _1949 * _1971;
    float _1975 = _1953 * _1971;
    float _1977 = _1973 * _1973;
    float _1979 = _1975 * _1975;
    float _1981 = _1977 + _1979;
    float _1983 = sqrt(_1981);
    bool _1985 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1989 = _1983 + _1987;
    float _1991 = _1953;
    float _1993 = _1981;
    float _1995 = _1989;
    float _1997 = _1945;
    float _1999 = _1929;
    if (_1985)
    {
        float _2001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1991 = _2001;
    }
    float _2003 = _1991;
    if (_1985)
    {
        float _2005 = rsqrt(_1981);
        _1993 = _2005;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    if (_1985)
    {
        float _2011 = _1989 * _2003;
        _1995 = _2011;
    }
    float _2013 = _1995;
    if (_1985)
    {
        float _2015 = _2013 * 0.15915493667125701904296875;
        _1381 = _2015;
    }
    float _2017 = _1381;
    float _2019 = _2003;
    float _2021 = _2017;
    if (_1985)
    {
        float _2023 = _2017 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        _2019 = _2025;
    }
    float _2027 = _2019;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2031 = precise::max(0.0, _2029);
    float _2033 = _1927;
    float _2035 = _2031;
    if (_1985)
    {
        float _2037 = _2017 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        _2033 = _2039;
    }
    float _2041 = _2033;
    float _2043 = -_1971;
    float _2045 = -_2031;
    float _2047 = fma(_1945, _2043, _2045);
    if (!_1985)
    {
        _1997 = _1975;
    }
    float _2049 = _1997;
    float _2051 = _2049;
    if (_1985)
    {
        float _2053 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2035 = _2053;
    }
    float _2055 = _2035;
    float _2057 = _2027;
    float _2059 = _2055;
    if (_1985)
    {
        float _2061 = fma(_2027, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1999 = _2061;
    }
    float _2063 = _1999;
    float _2065 = _2063;
    if (!_1985)
    {
        _2057 = _1973;
    }
    float _2067 = _2057;
    float _2069 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2071 = _2067;
    float _2073 = _2041;
    if (_1985)
    {
        float _2075 = _2041 + (-1.0);
        _2059 = _2075;
    }
    float _2077 = _2059;
    if (_1985)
    {
        float _2079 = _2007 * _2063;
        _1785 = _2079;
    }
    float _2081 = _1785;
    if (!_1985)
    {
        _2065 = _2047;
    }
    float _2083 = _2065;
    float _2085 = floor(_2069);
    float _2087 = _2083;
    if (_1985)
    {
        float _2089 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2089;
    }
    float _2091 = _2021;
    if (_1985)
    {
        float _2093 = _1973 * _2081;
        _2071 = _2093;
    }
    float _2095 = _2071;
    if (!_1985)
    {
        _2009 = _1977;
    }
    float _2097 = _2009;
    float _2099 = _2097;
    if (_1985)
    {
        float _2101 = _1975 * _2081;
        _2051 = _2101;
    }
    float _2103 = _2051;
    if (_1985)
    {
        float _2105 = fma(_2047, _2041, _2091);
        _2087 = _2105;
    }
    float _2107 = _2087;
    if (_1985)
    {
        float _2109 = _2095 * _2095;
        _2099 = _2109;
    }
    float _2111 = _2099;
    float _2113 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1985)
    {
        _2073 = _1979;
    }
    float _2115 = _2073;
    float _2117 = _2115;
    if (_1985)
    {
        float _2119 = _2103 * _2103;
        _2117 = _2119;
    }
    float _2121 = _2117;
    float _2123 = fma(_2107, _2107, _2111);
    float _2125 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2127 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2129 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2113);
    float _2131 = _2123 + _2121;
    float _2133 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2135 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2137 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2129);
    float _2139 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1961);
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2143 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2141);
    float _2145 = precise::clamp(_2143, 0.0, 1.0);
    float _2147 = rsqrt(_2131);
    float _2149 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2133);
    float _2151 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2135);
    float _2153 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2155 = -_2145;
    float _2157 = _2155 + 1.0;
    float _2159 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2161 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2151);
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2165 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2167 = floor(_2125);
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2171 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2163);
    float _2173 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2175 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2171);
    float _2177 = _2147 * _2095;
    float _2179 = abs(_2157);
    float _2181 = log2(_2179);
    float _2183 = _2147 * _2103;
    float _2185 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2187 = _2147 * _2107;
    float _2189 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2191 = -_2173;
    float _2193 = fma(_2191, _1959, 1.0);
    float _2195 = -_2189;
    float _2197 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2195);
    float _2199 = 1.0 / _2185;
    float _2201 = -_2167;
    float _2203 = _2125 + _2201;
    float _2205 = _2187 + 1.0;
    float _2207 = -_2183;
    float _2209 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2197);
    float _2211 = -_2085;
    float _2213 = _2069 + _2211;
    float _2215 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2217 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2219 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2221 = fma(_2209, -0.5, 0.5);
    float _2223 = log2(_2193);
    float _2225 = fma(_2209, 0.5, 0.5);
    float _2227 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2215);
    float _2229 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2217);
    float _2231 = fma(_2225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2227);
    float _2235 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2229);
    float _2237 = exp2(_2219);
    float _2239 = fma(_2225, _2231, -0.212114393711090087890625);
    float _2241 = sqrt(_2221);
    float _2243 = _2223 * 0.693147182464599609375;
    float _2245 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = -_2187;
    float _2249 = fma(_2237, _2205, _2247);
    float _2251 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2233);
    float _2253 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2235);
    float _2255 = fma(_2225, _2239, 1.570728778839111328125);
    float _2257 = fma(_2249, 0.5, 0.5);
    float _2259 = _2251 * _2199;
    float _2261 = _2253 * _2199;
    float _2263 = _2241 * 0.636619746685028076171875;
    float _2265 = fma(_2259, 0.5, 0.5);
    float _2267 = fma(_2261, -0.5, 0.5);
    float _2269 = -_2255;
    float _2271 = fma(_2263, _2269, 1.0);
    float2 _6539 = float2(_2213, _2203);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).x;
    float3 _6550 = float3(_2265, _2267, _2245);
    float _2275 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6550, float3(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6550, float3(0.0), isnan(_6550)), level(0.0)).x;
    float3 _6561 = float3(_2265, _2267, _2245);
    float4 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6561, float3(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6561, float3(0.0), isnan(_6561)), level(0.0)).xyzw;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = _2278.w;
    float2 _6577 = float2(_2271, _2257);
    float3 _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6577, float2(0.0), isnan(_6577)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6577, float2(0.0), isnan(_6577)), level(0.0)).xyz;
    float _2292 = _2290.x;
    float _2294 = _2290.y;
    float _2296 = _2290.z;
    float _2298 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2300 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2302 = _1665 * _1719;
    float _2304 = _1689 * _1743;
    float _2306 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2298);
    float _2308 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2300);
    bool _2310 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2312 = isnan(0.5);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2318 = _2314 || _2316;
    float _2320 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2322 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2306);
    float _2324 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2308);
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2328 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2330 = _1665 * _1743;
    float _2332 = 1.0 / _2326;
    float _2334 = _2328 + _2326;
    float _2336 = _1665 * _1725;
    float _2338 = _1673 * _1743;
    float _2340 = -_1651;
    float _2342 = fma(_2340, _1697, _2330);
    float _2344 = -_1651;
    float _2346 = fma(_2344, _1695, _2336);
    float _2348 = fma(_1661, _1697, _2338);
    float _2350 = -_1651;
    float _2352 = fma(_2350, _1707, _2302);
    float _2354 = _2334 * _2332;
    float _2356 = _2354 * 0.5;
    float _2358 = _1673 * _1725;
    float _2360 = _1689 * _1725;
    float _2362 = _1673 * _1719;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2366 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2364);
    float _2368 = _1689 * _1719;
    float _2370 = fma(_1661, _1695, _2358);
    float _2372 = fma(_1671, _1695, _2360);
    float _2374 = fma(_1661, _1707, _2362);
    float _2376 = fma(_1671, _1707, _2368);
    float _2378 = 1.0 / _2366;
    float _2380 = fma(_1703, _1593, _2348);
    float _2382 = fma(_1671, _1697, _2304);
    float _2384 = fma(_1703, _1589, _2370);
    float _2386 = fma(_1675, _1589, _2372);
    float _2388 = fma(_1663, _1593, _2342);
    float _2390 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2392 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2394 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2392);
    float _2396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2398 = _2378 * _2396;
    float _2400 = abs(_2398);
    float _2402 = log2(_2400);
    bool _2404 = _2398 <= 8000.0;
    bool _2406 = isnan(_2398);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2418 = exp2(_2416);
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = fma(_2422, -2.0, 3.0);
    float _2426 = _2422 * _2422;
    float _2428 = _2426 * _2424;
    float _2430 = -_2428;
    float _2432 = _2430 + 1.0;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2428);
    float _2436 = fma(_1663, _1589, _2346);
    float _2438 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2440 = fma(_1663, _1591, _2352);
    float _2442 = fma(_1675, _1593, _2382);
    float _2444 = in.m_76.x;
    float _2446 = _2438 * _2436;
    float _2448 = _2438 * _2440;
    float _2450 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2452 = _2438 * _2388;
    float _2454 = fma(_1703, _1591, _2374);
    float _2456 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2394);
    float _2458 = fma(_1675, _1591, _2376);
    float _2460 = fma(_2320, _2380, _2452);
    float _2462 = exp2(_2450);
    float _2464 = fma(_2320, _2384, _2446);
    float _2466 = fma(_2320, _2454, _2448);
    float _2468 = _2456 + _2185;
    float _2470 = _2251 + _2185;
    float _2472 = _2185 * 0.5;
    float _2474 = _2414 * _2434;
    float _2476 = _2394;
    float _2478 = _2414;
    float _2480 = _2185;
    float _2482 = _2456;
    if (_2318)
    {
        _2476 = 1.0;
    }
    float _2484 = _2476;
    float _2486 = _2468 * 0.5;
    float _2488 = _2470 * 0.5;
    float _2490 = fma(_2253, -0.5, _2472);
    float _2492 = _2484;
    if (_2318)
    {
        _2478 = 1.0;
    }
    float _2494 = _2478;
    float _2496 = _2494;
    float _2498 = _2286;
    float _2500 = _2284;
    if (!_2318)
    {
        float _2502 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2504 = _2502 * 0.15915493667125701904296875;
        float _2506 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2510 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2508;
        float _2512 = _2504 * 6.283185482025146484375;
        float _2514 = cos(_2512);
        float _2516 = _2506 * 0.15915493667125701904296875;
        float _2518 = _2504 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        float _2522 = 1.0 / _2514;
        float _2524 = _2516 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = _2520 * _2522;
        float _2530 = _2516 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2526 * _2528;
        float _2536 = 1.0 / _2510;
        float _2538 = 1.0 / _2534;
        float _2540 = _2532 * _2538;
        float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2544 = fma(_2398, _2540, _2542);
        float _2546 = _2544 * _2536;
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        _2496 = _2548;
    }
    float _2550 = _2496;
    if (!_2318)
    {
        float _2552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2558 = _2554 * 6.283185482025146484375;
        float _2560 = cos(_2558);
        float _2562 = _2556 * 0.15915493667125701904296875;
        float _2564 = _2554 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = 1.0 / _2560;
        float _2570 = _2562 * 6.283185482025146484375;
        float _2572 = cos(_2570);
        float _2574 = _2566 * _2568;
        float _2576 = _2562 * 6.283185482025146484375;
        float _2578 = sin(_2576);
        float _2580 = _2572 * _2574;
        float _2582 = 1.0 / _2580;
        float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2586 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2584;
        float _2588 = 1.0 / _2586;
        float _2590 = _2578 * _2582;
        float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2594 = fma(_2398, _2590, _2592);
        float _2596 = _2594 * _2588;
        float _2598 = precise::clamp(_2596, 0.0, 1.0);
        float _2600 = -_2598;
        float _2602 = _2600 + 1.0;
        _2492 = _2602;
    }
    float _2604 = _2492;
    float _2606 = -_2462;
    float _2608 = _2606 + 1.0;
    float _2610 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = -_2273;
    float _2614 = _2612 + 1.0;
    float _2616 = _2386 + _2464;
    float _2618 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2620 = _2614 * _2610;
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    out.gl_Position.x = _2251;
    out.gl_Position.y = _2253;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2185;
    float _2624 = _2442 + _2460;
    float _2626 = _2618 * _2275;
    float _2628 = -_2618;
    float _2630 = _2628 + 1.0;
    float _2632 = _2458 + _2466;
    out.m_78.x = _2488;
    out.m_78.y = _2490;
    out.m_78.z = _2486;
    out.m_78.w = _2185;
    float _2634 = _2296 * _2626;
    bool _2636 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2638 = isnan(_1969);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2644 = _2640 || _2642;
    out.m_80.x = _2616;
    out.m_80.y = _2624;
    out.m_80.z = _2632;
    float _2646 = -_2622;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2650 = _2286 * _2626;
    float _2652 = _2648 * _2444;
    float _2654 = fma(_2292, _2650, _2280);
    float _2656 = _2286 * _2630;
    float _2658 = fma(_2294, _2650, _2282);
    float _2660 = _2652 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2662 = fma(_2286, _2634, _2284);
    float _2664 = _2550 * _2604;
    float _2666 = _2650;
    float _2668 = _2664;
    if (!_2644)
    {
        _2498 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2670 = _2498;
    out.m_82.x = _2660;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2674 = _2670;
    float _2676 = _2670;
    if (!_2644)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2678 = _2500;
    out.m_84.x = _2654;
    out.m_84.y = _2658;
    out.m_84.z = _2662;
    out.m_84.w = _2656;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2644)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2684 = _2480;
    float _2686 = _2684;
    float _2688 = _2684;
    if (!_2644)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2690 = _2482;
    float _2692 = _2690;
    float _2694 = _2690;
    if (!_2644)
    {
        _2666 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2696 = _2666;
    float _2698 = _2696;
    float _2700 = _2696;
    if (!_2644)
    {
        _2668 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2702 = _2668;
    bool _2704 = !_2644;
    float _2706 = _2702;
    float _2708 = _2702;
    if (!_2704)
    {
        bool _2710 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2712 = isnan(_1969);
        bool _2714 = _2710 || _2712;
        bool _2716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2718 = _2714 || _2716;
        if (!_2718)
        {
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2722 = _1969 + _2720;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2726 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2724;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2732 = 1.0 / _2726;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2750 = _2722 * _2732;
            float _2752 = precise::clamp(_2750, 0.0, 1.0);
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2758 = fma(_2752, _2730, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2760 = fma(_2752, _2756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2762 = fma(_2752, _2736, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2764 = fma(_2752, _2740, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2766 = fma(_2752, _2744, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2768 = fma(_2752, _2748, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2682 = _2762;
            _2700 = _2766;
            _2676 = _2758;
            _2694 = _2764;
            _2688 = _2760;
            _2708 = _2768;
            _2770 = true;
        }
        else
        {
            bool _2772 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2774 = isnan(_1969);
            bool _2776 = _2772 || _2774;
            bool _2778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2780 = _2776 || _2778;
            if (!_2780)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2782 = _2674;
            _2676 = _2782;
            if (!_2780)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2784 = _2680;
            _2682 = _2784;
            if (!_2780)
            {
                _2686 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2786 = _2686;
            _2688 = _2786;
            if (!_2780)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2788 = _2692;
            _2694 = _2788;
            if (!_2780)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2790 = _2698;
            _2700 = _2790;
            if (!_2780)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2792 = _2706;
            bool _2794 = !_2780;
            _2708 = _2792;
            if (!_2794)
            {
                bool _2796 = _1969 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2798 = isnan(_1969);
                bool _2800 = _2796 || _2798;
                bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2804 = _2800 || _2802;
                if (!_2804)
                {
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2808 = _1969 + _2806;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2810;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2818 = 1.0 / _2812;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2836 = _2808 * _2818;
                    float _2838 = precise::clamp(_2836, 0.0, 1.0);
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2682 = _2848;
                    _2700 = _2852;
                    _2676 = _2844;
                    _2694 = _2850;
                    _2688 = _2846;
                    _2708 = _2854;
                    _2770 = true;
                }
                else
                {
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2688 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2770 = false;
    float _2856 = _2682;
    float _2858 = _2700;
    float _2860 = _2676;
    float _2862 = _2694;
    float _2864 = _2688;
    float _2866 = _2708;
    float _2868 = fma(_2624, -0.5, 0.5);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    float _2872 = -_2856;
    float _2874 = _2872 + _2858;
    float _2876 = -_2860;
    float _2878 = _2876 + _2862;
    out.m_86.x = 0.0;
    float _2880 = fma(_2870, _2874, _2856);
    float _2882 = -_2864;
    float _2884 = _2882 + _2866;
    float _2886 = fma(_2870, _2878, _2860);
    float _2888 = _2880 * 0.586610972881317138671875;
    bool _2890 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2892 = fma(_2870, _2884, _2864);
    float _2894 = _2672 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2896 = fma(_2886, 0.298911988735198974609375, _2888);
    bool _2898 = _2550 > 0.0;
    bool _2900 = isnan(_2550);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = fma(_2892, 0.114477999508380889892578125, _2896);
    out.m_49.x = _2894;
    bool _2910 = _2604 <= 0.0;
    bool _2912 = !_2906;
    bool _2914 = _2910 || _2912;
    float _2916 = -_2908;
    float _2918 = _2886 + _2916;
    float _2920 = -_2908;
    float _2922 = _2892 + _2920;
    float _2924 = fma(_2918, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    float _2926 = -_2908;
    float _2928 = _2880 + _2926;
    float _2930 = fma(_2922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    float _2932 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2908);
    bool _2934 = !_2890;
    if (!_2934)
    {
        float _2936 = -_1933;
        float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2940 = -_1937;
        float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2944 = -_1941;
        float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2948 = _2938 * _2938;
        float _2950 = fma(_2942, _2942, _2948);
        float _2952 = fma(_2946, _2946, _2950);
        float _2954 = sqrt(_2952);
        float _2956 = rsqrt(_2952);
        float _2958 = -_2954;
        float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2962 = _2960 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = _2942 * _2956;
        float _2968 = _2938 * _2956;
        float _2970 = abs(_2964);
        float _2972 = log2(_2970);
        float _2974 = _2946 * _2956;
        float _2976 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2978 = _2624 * _2968;
        float _2980 = -_2968;
        float _2982 = -_2976;
        float _2984 = fma(_2980, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2982);
        float _2986 = fma(_2616, _2966, _2978);
        float _2988 = -_2974;
        float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2984);
        float _2992 = fma(_2632, _2974, _2986);
        float _2994 = precise::clamp(_2992, 0.0, 1.0);
        float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2998 = _2990 + _2996;
        float _3000 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3002 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3004 = precise::clamp(_3002, 0.0, 1.0);
        float _3006 = exp2(_3000);
        float _3008 = _3006 * _3004;
        float _3010 = _2994 * _3008;
        float _3012 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3016 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3012;
        out.m_86.y = _3014;
        out.m_86.z = _3016;
    }
    out.m_88.x = _2924;
    out.m_88.y = _2932;
    out.m_88.z = _2930;
    if (!_2914)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3018 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3018;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

