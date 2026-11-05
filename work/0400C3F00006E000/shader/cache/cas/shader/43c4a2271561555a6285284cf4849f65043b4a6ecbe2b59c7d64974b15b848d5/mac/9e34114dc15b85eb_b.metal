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
    float4 m_62 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_66 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 m_88 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2644 = false;
    bool _803 = false;
    bool _689 = false;
    bool _509 = false;
    bool _333 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2942 = as_type<float>(_127);
        out.gl_Position.z = _2942;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    int _161 = 0;
    if (_155)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3012 = as_type<float>(_165);
        out.gl_Position.z = _3012;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_181;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _201 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_177;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_183;
    float _229;
    if (!_211)
    {
        float _213 = in.m_58.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_111);
        float _235 = 1.0 / _233;
        float _237 = _143 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _267 = 1.0 / _259;
    float _269 = _243 * _267;
    bool _271 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_239);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = _281 * _263;
    float _293 = fma(_285, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_289, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = _293 * _291;
    float _303 = _295 * _291;
    float _305 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_265;
    float _331;
    if (!_313)
    {
        float _315 = in.m_58.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _323 = _321 * _317;
        float _325 = floor(_323);
        float _327 = -_325;
        float _329 = _323 + _327;
        _331 = _329;
        _333 = true;
    }
    else
    {
        float _335 = float(_111);
        float _337 = 1.0 / _335;
        float _339 = _143 * _337;
        _331 = _339;
    }
    _333 = false;
    float _341 = _331;
    float _343 = in.m_60.x;
    float _345 = in.m_60.y;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _349 = _341 + _347;
    bool _351 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _353 = isnan(_341);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _371 = -_361;
    float _373 = _371 + 1.0;
    float _375 = 1.0 / _365;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = 1.0 / _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _381;
    float _385 = _311 * _345;
    float _387 = _349 * _375;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _391 = _341 + _389;
    bool _393 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_341);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _405;
    bool _409 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _411 = isnan(_341);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = fma(_383, _387, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _423 = _309 * _343;
    float _425 = fma(_407, _387, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _427 = _391 * _379;
    float _429 = _419 * _373;
    float _431 = -_419;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = _403 * _433;
    float _441 = fma(_437, _387, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _443 = -_403;
    float _445 = _443 + 1.0;
    float _447 = _421 * _439;
    float _449 = _441 * _439;
    float _451 = _425 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _465 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _449);
    float _467 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _447);
    float _469 = fma(_455, _427, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _471 = fma(_459, _427, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _473 = fma(_463, _427, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _451);
    float _477 = fma(_469, _429, _465);
    float _479 = fma(_471, _429, _467);
    float _481 = fma(_473, _429, _475);
    float _483 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].x, _477);
    float _485 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].y, _479);
    float _487 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].z, _481);
    bool _489 = !_377;
    float _507;
    if (!_489)
    {
        float _491 = in.m_58.x;
        float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _495 = _491 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _499 = _497 * _493;
        float _501 = floor(_499);
        float _503 = -_501;
        float _505 = _499 + _503;
        _507 = _505;
        _509 = true;
    }
    else
    {
        float _511 = float(_111);
        float _513 = 1.0 / _511;
        float _515 = _143 * _513;
        _507 = _515;
    }
    _509 = false;
    float _517 = _507;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _517 + _519;
    float _523 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _533 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _535 = isnan(_517);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_517);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _527;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _563;
    float _567 = -_543;
    float _569 = _567 + 1.0;
    bool _571 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _573 = isnan(_517);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _587 = 1.0 / _531;
    float _589 = 1.0 / _547;
    float _591 = _565 * _561;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _597 = _559 * _569;
    float _599 = -_559;
    float _601 = _599 + 1.0;
    float _603 = fma(_591, _521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _605;
    float _609 = _581 * _601;
    float _611 = _595 * _587;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _517 + _613;
    bool _617 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _619 = isnan(_517);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _603 * _609;
    float _631 = -_581;
    float _633 = _631 + 1.0;
    float _635 = fma(_611, _615, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _639 = _517 + _637;
    float _641 = _607 * _589;
    float _643 = -_627;
    float _645 = _643 + 1.0;
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _649 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_641, _639, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _653 = _543 * _645;
    float _655 = fma(_635, _597, _647);
    float _657 = fma(_651, _653, _655);
    float _659 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _661 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[118].x, _657);
    float _663 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _661 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _663;
    out.m_62.y = _649;
    out.m_62.z = _665;
    out.m_62.w = _667;
    bool _669 = !_585;
    float _687;
    if (!_669)
    {
        float _671 = in.m_58.x;
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _675 = _671 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        float _691 = float(_111);
        float _693 = 1.0 / _691;
        float _695 = _143 * _693;
        _687 = _695;
    }
    _689 = false;
    float _697 = _687;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = _697 + _699;
    bool _703 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _705 = isnan(_697);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _715;
    bool _719 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _721 = isnan(_697);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = 1.0 / _717;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _733;
    bool _737 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _739;
    float _743 = _701 * _731;
    float _745 = -_713;
    float _747 = _745 + 1.0;
    float _749 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _751 = fma(_741, _743, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _753;
    float _757 = _729 * _747;
    float _759 = -_729;
    float _761 = _759 + 1.0;
    float _763 = fma(_755, _743, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _765 = _749 * _757;
    float _767 = _763 * _757;
    float _769 = _751 * _757;
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].x, _765);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].y, _767);
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].z, _769);
    float _777 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].x, _771);
    float _779 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].y, _773);
    float _781 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].z, _775);
    bool _783 = !_737;
    float _801;
    if (!_783)
    {
        float _785 = in.m_58.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        float _805 = float(_111);
        float _807 = 1.0 / _805;
        float _809 = _143 * _807;
        _801 = _809;
    }
    _803 = false;
    float _811 = _801;
    float _813 = in.m_58.z;
    float _815 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _817 = log2(_815);
    float _819 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _821 = in.m_58.x;
    float _823 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _827 = _825 != 0;
    float _829 = in.m_58.y;
    float _831 = _817 * _143;
    float _833 = exp2(_831);
    float _835 = _813 * 2.0;
    float _837 = _821 * 2.0;
    float _839 = floor(_835);
    float _841 = _829 * 2.0;
    float _843 = floor(_837);
    float _845 = -_833;
    float _847 = _845 + 1.0;
    bool _849 = _839 > 0.0;
    float _851 = floor(_841);
    bool _853 = _839 >= 0.0;
    bool _855 = isnan(_839);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _839;
    float _865 = _821;
    if (_827)
    {
        _863 = _829;
    }
    float _867 = _863;
    float _869 = _861 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _871 = _829 > 0.5;
    int _873 = ~as_type<int>(_869);
    int _875 = _873 + 1;
    int _877 = _875 + 1;
    float _879 = -_209;
    int _881 = _871 ? as_type<int>(_879) : as_type<int>(_209);
    int _883 = _877;
    float _885 = _869;
    float _887 = _867;
    if (!_849)
    {
        int _889 = ~as_type<int>(_869);
        int _891 = _889 + 1;
        _883 = _891;
    }
    int _893 = _883;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _897 = _895 != 0;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _909 = _907 != 0;
    bool _911 = _813 > 0.5;
    if (_827)
    {
        _885 = _821;
    }
    float _913 = _885;
    bool _915 = !_905;
    float _917 = _915 ? _209 : as_type<float>(_881);
    bool _919 = _843 > 0.0;
    float _921 = _913;
    if (!_827)
    {
        _921 = _813;
    }
    float _923 = _921;
    if (!_827)
    {
        _887 = _821;
    }
    float _925 = _887;
    bool _927 = _843 >= 0.0;
    bool _929 = isnan(_843);
    bool _931 = _927 || _929;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    float _937 = _923 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _939 = -_193;
    int _941 = _911 ? as_type<int>(_939) : as_type<int>(_193);
    int _943 = _935 ? 0 : 1;
    bool _945 = !_909;
    float _947 = _945 ? _193 : as_type<float>(_941);
    bool _949 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(0.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    bool _959 = _851 >= 0.0;
    bool _961 = isnan(_851);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    int _969 = ~_943;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    int _975 = _973;
    if (!_919)
    {
        int _977 = ~_943;
        int _979 = _977 + 1;
        _975 = _979;
    }
    int _981 = _975;
    float _983 = _957 ? _847 : 0.0;
    float _985 = _821 + _829;
    int _987 = _967 ? 0 : 1;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _991 = _989 != 0;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _999 = _997 != 0;
    bool _1001 = !_991;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1007 = _851 > 0.0;
    float _1009 = _985 + (-1.0);
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1013 = _925 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1015 = -_1005;
    float _1017 = fma(_937, 2.0, _1015);
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1021 = in.m_64.x;
    float _1023 = in.m_64.y;
    float _1025 = in.m_64.z;
    float _1027 = fma(_1013, -2.0, _1011);
    int _1029 = abs(_1003);
    int _1031 = ~_987;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    int _1037 = _1035;
    if (!_1007)
    {
        int _1039 = ~_987;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1047 = float(_893);
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1051 = 1.0 + _1049;
    float _1053 = float(_1029);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1057 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(1.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = 1.0 / _1051;
    bool _1069 = !_995;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = _1053 * _1047;
    float _1075 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1045);
    float _1077 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1055);
    int _1079 = abs(_1071);
    float _1081 = _821 + (-0.5);
    float _1083 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1075);
    float _1085 = -_143;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1017);
    float _1089 = _1073 * (-2.0);
    float _1091 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1077);
    bool _1093 = !_999;
    int _1095 = _1093 ? 0 : 1;
    float _1097 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1027);
    float _1099 = fma(_1089, _1021, _1021);
    float _1101 = float(_981);
    float _1103 = fma(_1019, _1089, _1019);
    float _1105 = float(_1079);
    float _1107 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1099);
    int _1109 = abs(_1095);
    if (_1065)
    {
        float _1111 = _983 * _1067;
        _145 = _1111;
    }
    float _1113 = _145;
    float _1115 = float(_1043);
    float _1117 = _1105 * _1101;
    float _1119 = _829 + _813;
    float _1121 = fma(_1103, _1113, _1107);
    float _1123 = _1117 * (-2.0);
    float _1125 = float(_1109);
    float _1127 = _1119 + (-1.0);
    float _1129 = _829 + (-0.5);
    float _1131 = _1121 * 0.15915493667125701904296875;
    float _1133 = -_209;
    int _1135 = _911 ? as_type<int>(_1133) : as_type<int>(_209);
    float _1137 = _1125 * _1115;
    float _1139 = fma(_1123, _1023, _1023);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1143 = _821 + _813;
    float _1145 = _1137 * (-2.0);
    float _1147 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1139);
    float _1149 = fma(_1141, _1123, _1141);
    float _1151 = _1143 + (-1.0);
    float _1153 = _813 + (-0.5);
    float _1155 = fma(_1149, _1113, _1147);
    float _1157 = fma(_1145, _1025, _1025);
    float _1159 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1161 = _1131 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1155 * 0.15915493667125701904296875;
    float _1167 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1157);
    float _1169 = fma(_1159, _1145, _1159);
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1173 = in.m_46.x;
    float _1175 = in.m_46.y;
    float _1177 = in.m_46.z;
    bool _1179 = !_901;
    float _1181 = _1179 ? _209 : as_type<float>(_1135);
    float _1183 = fma(_1169, _1113, _1167);
    float _1185 = _1165 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = _819 * _1171;
    float _1191 = _1183 * 0.15915493667125701904296875;
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1195 = _1165 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = _823 * _1193;
    float _1201 = _1131 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = _1163 * _1187;
    float _1207 = _1191 * 6.283185482025146484375;
    float _1209 = cos(_1207);
    float _1211 = _1163 * _1197;
    float _1213 = _1191 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = _1203 * _1187;
    float _1219 = _1203 * _1197;
    float _1221 = _1163 * _1209;
    float _1223 = _1203 * _1209;
    float _1225 = _1197 * _1209;
    float _1227 = _1187 * _1209;
    float _1229 = _1221 * _1199;
    float _1231 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1223 * _1199;
    float _1235 = fma(_1215, _1211, _1217);
    float _1237 = -_1205;
    float _1239 = fma(_1215, _1219, _1237);
    float _1241 = -_1219;
    float _1243 = fma(_1215, _1205, _1241);
    float _1245 = -_1199;
    float _1247 = _1215 * _1245;
    float _1249 = fma(_1235, _1189, _1229);
    float _1251 = fma(_1215, _1217, _1211);
    float _1253 = fma(_1239, _1189, _1233);
    float _1255 = fma(_1225, _1189, _1247);
    float _1257 = fma(_1243, _1231, _1249);
    float _1259 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1261 = fma(_1251, _1231, _1253);
    float _1263 = fma(_1227, _1231, _1255);
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1267 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1259);
    float _1269 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1273 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1265);
    float _1275 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1267);
    float _1277 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1269);
    float _1279 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1271);
    float _1281 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1273);
    float _1283 = _1275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1285 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1277);
    float _1287 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1291 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1297 = _1283 + _1289;
    float _1299 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1291);
    float _1301 = -_193;
    float _1303 = _871 ? _1301 : _193;
    float _1305 = _1293 + _1295;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1309 = _1297 + _1307;
    float _1311 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1299);
    bool _1313 = !_897;
    float _1315 = _1313 ? _193 : _1303;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1319 = _1305 + _1317;
    float _1321 = _1309 * _1309;
    float _1323 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1325 = fma(_1319, _1319, _1321);
    float _1327 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1329 = sqrt(_1325);
    float _1331 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1327);
    float _1333 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1331);
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = _1323 + _1335;
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = _1311;
    float _1343 = _1303;
    float _1345 = _1177;
    float _1347 = _1325;
    float _1349 = _1309;
    float _1351 = _1337;
    if (!_1339)
    {
        _1341 = _1305;
    }
    float _1353 = _1341;
    float _1355 = _1353;
    if (!_1339)
    {
        _1343 = _1297;
    }
    float _1357 = _1343;
    float _1359 = _1357;
    if (!_1339)
    {
        _1345 = _1337;
    }
    float _1361 = _1345;
    bool _1363 = !_1339;
    float _1365 = _1361;
    if (!_1363)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1371 = _1329 + _1369;
        float _1373 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = rsqrt(_1325);
        float _1377 = _1371 * _1367;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1379 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        float _1389 = fma(_1383, _1373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = _1375 * _1389;
        float _1393 = _1387 + (-1.0);
        float _1395 = fma(_1319, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1309, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1399 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1401 = fma(_1337, _1387, _1399);
        _1365 = _1401;
        _1355 = _1395;
        _1359 = _1397;
        _1347 = _1375;
    }
    float _1403 = _1365;
    float _1405 = _1355;
    float _1407 = _1359;
    float _1409 = _1347;
    float _1411 = -_1323;
    float _1413 = _1411 + _1403;
    float _1415 = -_1293;
    float _1417 = _1415 + _1405;
    float _1419 = -_1283;
    float _1421 = _1419 + _1407;
    float _1423 = _1413 * _1413;
    bool _1425 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1427 = isnan(0.5);
    bool _1429 = _1425 || _1427;
    bool _1431 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1433 = _1429 || _1431;
    float _1435 = fma(_1417, _1417, _1423);
    float _1437 = fma(_1421, _1421, _1435);
    float _1439 = sqrt(_1437);
    bool _1441 = _1439 > 0.0;
    float _1443 = _1409;
    float _1445 = _1439;
    float _1447 = _1437;
    float _1449 = _1407;
    float _1451 = _1405;
    float _1453 = _1403;
    if (!_1441)
    {
        _1443 = _1405;
    }
    float _1455 = _1443;
    float _1457 = _1455;
    float _1459 = _1455;
    if (!_1441)
    {
        _1445 = _1403;
    }
    float _1461 = _1445;
    float _1463 = _1461;
    if (!_1441)
    {
        _1349 = _1407;
    }
    float _1465 = _1349;
    bool _1467 = !_1441;
    float _1469 = _1465;
    if (!_1467)
    {
        float _1471 = _201 * _201;
        float _1473 = fma(_203, _203, _1471);
        float _1475 = fma(_205, _205, _1473);
        float _1477 = rsqrt(_1437);
        float _1479 = sqrt(_1475);
        float _1481 = _1417 * _1477;
        float _1483 = _1413 * _1477;
        float _1485 = _1421 * _1477;
        bool _1487 = _1479 > 0.0;
        float _1489 = _1477;
        float _1491 = _1479;
        _1351 = _1485;
        if (!_1487)
        {
            _1457 = _1405;
        }
        float _1493 = _1457;
        _1459 = _1493;
        if (!_1487)
        {
            _1489 = _1403;
        }
        float _1495 = _1489;
        _1463 = _1495;
        if (!_1487)
        {
            _1491 = _1407;
        }
        float _1497 = _1491;
        bool _1499 = !_1487;
        _1469 = _1497;
        if (!_1499)
        {
            float _1501 = rsqrt(_1475);
            float _1503 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1505 = _201 * _1501;
            float _1507 = _203 * _1501;
            float _1509 = _205 * _1501;
            float _1511 = _1483 * _1505;
            float _1513 = fma(_1481, _1507, _1511);
            float _1515 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1517 = fma(_1485, _1509, _1513);
            float _1519 = _1517 * _1515;
            float _1521 = fma(_203, _1519, _1405);
            float _1523 = fma(_201, _1519, _1403);
            float _1525 = fma(_205, _1519, _1407);
            _1459 = _1521;
            _1463 = _1523;
            _1469 = _1525;
            _1447 = _1503;
        }
    }
    float _1527 = _1459;
    float _1529 = _1463;
    float _1531 = _1469;
    float _1533 = _1447;
    float _1535 = _1351;
    float _1537 = _1531;
    float _1539 = _1535;
    if (_1433)
    {
        _1449 = _1527;
    }
    float _1541 = _1449;
    float _1543 = _1541;
    if (_1433)
    {
        _1451 = _1529;
    }
    float _1545 = _1451;
    float _1547 = _1545;
    if (_1433)
    {
        _1453 = _1531;
    }
    float _1549 = _1453;
    float _1551 = _1549;
    if (!_1433)
    {
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1555 = _1323 + _1553;
        float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1559 = _1293 + _1557;
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1563 = -_1323;
        float _1565 = _1563 + _1529;
        float _1567 = _1555 * _1555;
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1571 = _1283 + _1569;
        float _1573 = -_1283;
        float _1575 = _1573 + _1531;
        float _1577 = fma(_1559, _1559, _1567);
        float _1579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1581 = fma(_1571, _1571, _1577);
        float _1583 = sqrt(_1581);
        float _1585 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1587 = precise::min(_1583, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1589 = _1587 * _1579;
        float _1591 = -_1293;
        float _1593 = _1591 + _1527;
        float _1595 = _1585 * _1589;
        float _1597 = fma(_1593, _1595, _1293);
        float _1599 = fma(_1565, _1595, _1323);
        float _1601 = fma(_1575, _1595, _1283);
        _1547 = _1599;
        _1543 = _1597;
        _1551 = _1601;
        _1537 = _1575;
    }
    float _1603 = _1547;
    float _1605 = _1543;
    float _1607 = _1551;
    float _1609 = _1537;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1603 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1605 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1607 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1627 = fma(_1617, _1617, _1623);
    float _1629 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1625);
    float _1631 = fma(_1621, _1621, _1627);
    float _1633 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1629);
    float _1635 = rsqrt(_1631);
    float _1637 = sqrt(_1631);
    float _1639 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1641 = _1617 * _1639;
    float _1643 = _1621 * _1639;
    float _1645 = _1641 * _1641;
    float _1647 = _1643 * _1643;
    float _1649 = _1645 + _1647;
    float _1651 = sqrt(_1649);
    bool _1653 = _1651 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1657 = _1651 + _1655;
    float _1659 = _1609;
    float _1661 = _1649;
    float _1663 = _1657;
    float _1665 = _1613;
    float _1667 = _1641;
    float _1669 = _1643;
    if (_1653)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1671;
    }
    float _1673 = _1659;
    if (_1653)
    {
        float _1675 = rsqrt(_1649);
        _1661 = _1675;
    }
    float _1677 = _1661;
    if (_1653)
    {
        float _1679 = _1657 * _1673;
        _1663 = _1679;
    }
    float _1681 = _1663;
    if (_1653)
    {
        float _1683 = _1681 * 0.15915493667125701904296875;
        _1539 = _1683;
    }
    float _1685 = _1539;
    float _1687 = _1533;
    if (_1653)
    {
        float _1689 = _1685 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1527;
    float _1701 = _1697;
    if (_1653)
    {
        float _1703 = _1685 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        _1699 = _1705;
    }
    float _1707 = _1699;
    float _1709 = -_1639;
    float _1711 = -_1697;
    float _1713 = fma(_1613, _1709, _1711);
    float _1715 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1717 = _1713;
    if (_1653)
    {
        float _1719 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1719;
    }
    float _1721 = _1701;
    float _1723 = _1693;
    float _1725 = _1721;
    if (_1653)
    {
        float _1727 = fma(_1693, _1721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1723 = _1727;
    }
    float _1729 = _1723;
    float _1731 = _1729;
    float _1733 = _1707;
    if (_1653)
    {
        float _1735 = _1707 + (-1.0);
        _1665 = _1735;
    }
    float _1737 = _1665;
    if (_1653)
    {
        float _1739 = _1677 * _1729;
        _1731 = _1739;
    }
    float _1741 = _1731;
    if (_1653)
    {
        float _1743 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1743;
    }
    float _1745 = _1725;
    float _1747 = _1745;
    if (_1653)
    {
        float _1749 = _1641 * _1741;
        _1667 = _1749;
    }
    float _1751 = _1667;
    if (_1653)
    {
        float _1753 = _1643 * _1741;
        _1669 = _1753;
    }
    float _1755 = _1669;
    if (_1653)
    {
        float _1757 = fma(_1713, _1707, _1745);
        _1717 = _1757;
    }
    float _1759 = _1717;
    if (!_1653)
    {
        _1747 = _1645;
    }
    float _1761 = _1747;
    float _1763 = _1761;
    if (_1653)
    {
        float _1765 = _1751 * _1751;
        _1763 = _1765;
    }
    float _1767 = _1763;
    if (!_1653)
    {
        _1733 = _1647;
    }
    float _1769 = _1733;
    float _1771 = _1769;
    if (_1653)
    {
        float _1773 = _1755 * _1755;
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1779 = fma(_1759, _1759, _1767);
    float _1781 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1783 = floor(_1777);
    float _1785 = _1779 + _1775;
    float _1787 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1781);
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1791 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1789);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1787);
    float _1799 = -_1793;
    float _1801 = _1799 + 1.0;
    float _1803 = rsqrt(_1785);
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1807 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1809 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1795);
    float _1811 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1813 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1809);
    float _1815 = abs(_1801);
    float _1817 = log2(_1815);
    float _1819 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1821 = -_1811;
    float _1823 = fma(_1821, _1805, 1.0);
    float _1825 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1783;
    float _1831 = _1777 + _1829;
    float _1833 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1825);
    float _1835 = _1803 * _1751;
    float _1837 = _1803 * _1759;
    float _1839 = _1803 * _1755;
    float _1841 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = floor(_1819);
    float _1849 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = -_1843;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1859 = -_1839;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1863 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    float _1865 = exp2(_1855);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1861, -0.5, 0.5);
    float _1871 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1863);
    float _1873 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1857);
    float _1875 = fma(_1861, 0.5, 0.5);
    float _1877 = _1837 + 1.0;
    float _1879 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1871);
    float _1881 = log2(_1823);
    float _1883 = -_1847;
    float _1885 = _1819 + _1883;
    float _1887 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1889 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1873);
    float _1891 = fma(_1875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1893 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1887);
    float _1895 = 1.0 / _1879;
    float _1897 = -_1837;
    float _1899 = fma(_1865, _1877, _1897);
    float _1901 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1889);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1893);
    float _1905 = fma(_1875, _1891, -0.212114393711090087890625);
    float _1907 = sqrt(_1869);
    float _1909 = _1881 * 0.693147182464599609375;
    float2 _5780 = float2(_1831, _1885);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5780, float2(0.0), isnan(_5780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5780, float2(0.0), isnan(_5780)), level(0.0)).x;
    float _1913 = fma(_1875, _1905, 1.570728778839111328125);
    float _1915 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1917 = _1901 * _1895;
    float _1919 = _1903 * _1895;
    float _1921 = fma(_1899, 0.5, 0.5);
    float _1923 = fma(_1917, 0.5, 0.5);
    float _1925 = fma(_1919, -0.5, 0.5);
    float _1927 = _1907 * 0.636619746685028076171875;
    float3 _5814 = float3(_1923, _1925, _1915);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5814, float3(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5814, float3(0.0), isnan(_5814)), level(0.0)).x;
    float _1931 = -_1913;
    float _1933 = fma(_1927, _1931, 1.0);
    float3 _5830 = float3(_1923, _1925, _1915);
    float4 _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5830, float3(0.0), isnan(_5830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5830, float3(0.0), isnan(_5830)), level(0.0)).xyzw;
    float _1938 = _1936.x;
    float _1940 = _1936.y;
    float _1942 = _1936.z;
    float _1944 = _1936.w;
    float2 _5846 = float2(_1933, _1921);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5846, float2(0.0), isnan(_5846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5846, float2(0.0), isnan(_5846)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = in.m_58.w;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1960 = _1958 != 0;
    float _1962 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1968 = _1966 != 0;
    float _1970 = -_1091;
    float _1972 = _1970 + 1.0;
    bool _1974 = _821 > 0.5;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1980 = -_1083;
    float _1982 = _1980 + 1.0;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1986 = _1984 != 0;
    float _1988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    float _1994 = -_1315;
    float _1996 = _1994 + 0.5;
    float _1998 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2000 = _779 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2002 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2004 = _1923;
    float _2006 = _1925;
    bool _2008 = _1986;
    float _2010 = _1996;
    float _2012 = _1879;
    float _2014 = _1903;
    if (_1968)
    {
        float _2016 = _821 * 3.1415927410125732421875;
        _865 = _2016;
    }
    float _2018 = _865;
    float _2020 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2022 = 1.0 / _1978;
    float _2024 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2026 = _2018;
    if (_1968)
    {
        float _2028 = _2018 * 0.15915493667125701904296875;
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2020);
    if (_1960)
    {
        float _2034 = _1956 * 3.1415927410125732421875;
        _2004 = _2034;
    }
    float _2036 = _2004;
    bool _2038 = _1956 > 0.5;
    out.m_66.x = _1605;
    out.m_66.y = _1603;
    out.m_66.z = _1607;
    float _2040 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2032);
    bool _2042 = _2038;
    if (_1960)
    {
        float _2044 = _2036 * 0.15915493667125701904296875;
        _2006 = _2044;
    }
    float _2046 = _2006;
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2048;
    float _2052 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2054 = _2030;
    if (_1968)
    {
        float _2056 = _2030 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = in.m_68.x;
    float _2064 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2052);
    float _2066 = _2050 * _2022;
    bool _2068 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2070 = isnan(_811);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    float _2080 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2064);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2084 = _811 + _2082;
    bool _2086 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2088 = isnan(_811);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2094 = _2090 || _2092;
    float _2096 = float(_2094);
    float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2100 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2102 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1962);
    float _2104 = -_2078;
    float _2106 = _2104 + 1.0;
    float _2108 = fma(_2066, _2084, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2110 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2102);
    float _2112 = _2096 * _2106;
    float _2114 = 1.0 / _2100;
    float _2116 = -_193;
    int _2118 = _2038 ? as_type<int>(_2116) : as_type<int>(_193);
    float _2120 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2122 = _2108 * _2112;
    bool _2124 = !_1986;
    float _2126 = _2124 ? _193 : as_type<float>(_2118);
    float _2128 = _2120 + _2100;
    float _2130 = _2046;
    if (_1960)
    {
        float _2132 = _2046 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    if (_1968)
    {
        bool _2138 = _2060 > 0.5;
        _2008 = _2138;
    }
    bool _2140 = _2008;
    float _2142 = -_2096;
    float _2144 = _2142 + 1.0;
    float _2146 = -_2126;
    float _2148 = _2146 + 0.5;
    float _2150 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2152 = _2128 * _2114;
    float _2154 = _2152 * 0.5;
    float _2156 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2122);
    float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2160 = _2150 * _1988;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2162);
    float _2166 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2168 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2170 = _917 + 0.5;
    float _2172 = _2154;
    if (_1960)
    {
        bool _2174 = _2136 > 0.5;
        _2042 = _2174;
    }
    bool _2176 = _2042;
    float _2178 = _947 + (-0.5);
    float _2180 = 1.0 / _2164;
    if (!_1960)
    {
        _2172 = _209;
    }
    float _2182 = _2172;
    float _2184 = fma(_2166, _2170, _1087);
    float _2186 = _2182;
    if (_1960)
    {
        float _2188 = -_209;
        float _2190 = _2176 ? _2188 : _209;
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = -_2168;
    float _2196 = -_1097;
    float _2198 = fma(_2194, _2178, _2196);
    float _2200 = -_209;
    int _2202 = _1974 ? as_type<int>(_2200) : as_type<int>(_209);
    float _2204 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2156);
    bool _2206 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2208 = isnan(0.5);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2214 = _2210 || _2212;
    float _2216 = _2192 + 0.5;
    bool _2218 = !_1992;
    float _2220 = _2218 ? _209 : as_type<float>(_2202);
    float _2222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2224 = fma(_947, _1972, _2198);
    float _2226 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2228 = -_1982;
    float _2230 = fma(_917, _2228, _2184);
    float _2232 = _2220 + 0.5;
    float _2234 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2236 = _2226 * _2158;
    float _2238 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2240 = _2180 * _2238;
    float _2242 = _1181 + 0.5;
    float _2244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2246 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2248 = _2242;
    if (!_1968)
    {
        _2010 = _193;
    }
    float _2250 = _2010;
    float _2252 = _2204 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2254 = _2250;
    if (_1968)
    {
        float _2256 = -_193;
        float _2258 = _2140 ? _2256 : _193;
        _2254 = _2258;
    }
    float _2260 = _2254;
    float _2262 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2264 = _2246 * _2222;
    float _2266 = abs(_2240);
    float _2268 = log2(_2266);
    float _2270 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2272 = _2260;
    if (!_2214)
    {
        _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2274 = _2248;
    out.m_70.x = _2230;
    out.m_70.y = _2224;
    float _2276 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2278 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2280 = isnan(_1637);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2286 = _2282 || _2284;
    out.m_72.w = _2160;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2290 = _2234 * _2244;
    float _2292 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2294 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2296 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2300 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2302 = _2268;
    if (_2214)
    {
        _2302 = 1.0;
    }
    float _2304 = _2302;
    float _2306 = _2270 * _2288;
    float _2308 = _2288;
    float _2310 = _2304;
    if (!_2214)
    {
        float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2314 = _2274 + _2312;
        _2308 = _2314;
    }
    float _2316 = _2308;
    float _2318 = -_2260;
    float _2320 = _2318 + 0.5;
    float _2322 = exp2(_2296);
    float _2324 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2326 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2330 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _2264;
    out.m_72.y = _2290;
    out.m_72.z = _2306;
    float _2334 = _2328 * _2298;
    float _2336 = _2324;
    if (!_2214)
    {
        float _2338 = 1.0 / _2316;
        _2272 = _2338;
    }
    float _2340 = _2272;
    if (!_2214)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2344 = _2240 + _2342;
        _2336 = _2344;
    }
    float _2346 = _2336;
    out.m_74.x = _2326;
    out.m_74.y = _2024;
    out.m_74.z = _2332;
    out.m_74.w = _2252;
    bool _2348 = _2240 <= 8000.0;
    bool _2350 = isnan(_2240);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(8000.0);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    out.m_76.x = _2236;
    out.m_76.y = _2334;
    float _2360 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2362 = precise::clamp(_2360, 0.0, 1.0);
    float _2364 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2366 = -_1215;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2330);
    float _2370 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2372 = exp2(_2002);
    float _2374 = -_1215;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2378 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2368);
    float _2380 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2376);
    float _2382 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2384 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2386 = fma(_2262, _2262, 1.0);
    float _2388 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2382);
    float _2390 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2384);
    float _2392 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2394 = fma(_2362, -2.0, 3.0);
    float _2396 = _2362 * _2362;
    float _2398 = rsqrt(_2386);
    float _2400 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2370);
    float _2402 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2294);
    float _2404 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2392);
    float _2406 = _2396 * _2394;
    float _2408 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2390);
    float _2410 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2300);
    float _2412 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2414 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2400);
    float _2416 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2402);
    float _2418 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2404);
    float _2420 = -_2406;
    float _2422 = _2420 + 1.0;
    float _2424 = -_1215;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2428 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2430 = _2262 * _2378;
    float _2432 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2406);
    float _2434 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2426);
    float _2436 = _2262 * _2398;
    float _2438 = fma(_2412, _2428, _2430);
    out.m_78.x = _2428;
    out.m_78.y = _2408;
    out.m_78.z = _2410;
    float _2440 = _2262 * _2380;
    float _2442 = _2358 * _2432;
    float _2444 = -_2372;
    float _2446 = _2444 + 1.0;
    float _2448 = -_2414;
    float _2450 = _2436 * _2448;
    float _2452 = fma(_2412, _2408, _2440);
    float _2454 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2458 = fma(_2398, _2378, _2450);
    float _2460 = -_2416;
    float _2462 = _2436 * _2460;
    float _2464 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2040);
    float _2466 = _1879 * 0.5;
    float _2468 = _2262 * _2434;
    float _2470 = fma(_2398, _2380, _2462);
    float _2472 = _1901 + _1879;
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1903;
    out.gl_Position.z = _2464;
    out.gl_Position.w = _1879;
    float _2474 = fma(_2412, _2410, _2468);
    float _2476 = _2414 + _2438;
    float _2478 = _2416 + _2452;
    float _2480 = _2464 + _1879;
    float _2482 = _2418 + _2474;
    float _2484 = _2472 * 0.5;
    float _2486 = _2480 * 0.5;
    float _2488 = fma(_1903, -0.5, _2466);
    out.m_80.x = _2476;
    out.m_80.y = _2478;
    out.m_80.z = _2482;
    float _2490 = -_2418;
    float _2492 = _2436 * _2490;
    float _2494 = _2464;
    float _2496 = _2458;
    if (!_2214)
    {
        float _2498 = _2346 * _2340;
        float _2500 = precise::clamp(_2498, 0.0, 1.0);
        _2310 = _2500;
    }
    float _2502 = _2310;
    float _2504 = -_2456;
    float _2506 = _2504 + 1.0;
    out.m_82.x = _2484;
    out.m_82.y = _2488;
    out.m_82.z = _2486;
    out.m_82.w = _1879;
    float _2508 = fma(_2398, _2434, _2492);
    float _2510 = _2506;
    if (!_2286)
    {
        _2012 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2012;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2286)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2494;
    out.m_84.x = _2458;
    out.m_84.y = _2470;
    out.m_84.z = _2508;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2286)
    {
        _2014 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2014;
    float _2526 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2528 = _2524;
    float _2530 = _2524;
    if (!_2286)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2532 = _2496;
    float _2534 = -_1911;
    float _2536 = _2534 + 1.0;
    float _2538 = _2536 * _2454;
    float _2540 = precise::clamp(_2538, 0.0, 1.0);
    float _2542 = -_2540;
    float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2546 = _2544 * _2062;
    float _2548 = _2456 * _1929;
    float _2550 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2552 = _1944 * _2548;
    float _2554 = _1944 * _2506;
    out.m_86.x = _2550;
    float _2556 = _2552;
    float _2558 = _2532;
    float _2560 = _2532;
    if (!_2286)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2562 = _2510;
    float _2564 = _1954 * _2548;
    float _2566 = fma(_1950, _2552, _1938);
    float _2568 = fma(_1952, _2552, _1940);
    float _2570 = _2562;
    float _2572 = _2562;
    if (!_2286)
    {
        _2556 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2574 = _2556;
    float _2576 = fma(_1944, _2564, _1942);
    out.m_88.x = _2566;
    out.m_88.y = _2568;
    out.m_88.z = _2576;
    out.m_88.w = _2554;
    bool _2578 = !_2286;
    float _2580 = _2574;
    float _2582 = _2574;
    if (!_2578)
    {
        bool _2584 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2586 = isnan(_1637);
        bool _2588 = _2584 || _2586;
        bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2592 = _2588 || _2590;
        if (!_2592)
        {
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2596 = _1637 + _2594;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2600 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2598;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2606 = 1.0 / _2600;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2624 = _2596 * _2606;
            float _2626 = precise::clamp(_2624, 0.0, 1.0);
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2632 = fma(_2626, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2634 = fma(_2626, _2630, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2636 = fma(_2626, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2638 = fma(_2626, _2614, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2640 = fma(_2626, _2618, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2642 = fma(_2626, _2622, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2516 = _2636;
            _2572 = _2640;
            _2560 = _2632;
            _2530 = _2638;
            _2522 = _2634;
            _2582 = _2642;
            _2644 = true;
        }
        else
        {
            bool _2646 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2648 = isnan(_1637);
            bool _2650 = _2646 || _2648;
            bool _2652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2654 = _2650 || _2652;
            if (!_2654)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2656 = _2558;
            _2560 = _2656;
            if (!_2654)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2658 = _2514;
            _2516 = _2658;
            if (!_2654)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2660 = _2520;
            _2522 = _2660;
            if (!_2654)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2662 = _2528;
            _2530 = _2662;
            if (!_2654)
            {
                _2570 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2664 = _2570;
            _2572 = _2664;
            if (!_2654)
            {
                _2580 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2666 = _2580;
            bool _2668 = !_2654;
            _2582 = _2666;
            if (!_2668)
            {
                bool _2670 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2672 = isnan(_1637);
                bool _2674 = _2670 || _2672;
                bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2678 = _2674 || _2676;
                if (!_2678)
                {
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2682 = _1637 + _2680;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2686 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2684;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2692 = 1.0 / _2686;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2710 = _2682 * _2692;
                    float _2712 = precise::clamp(_2710, 0.0, 1.0);
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2718 = fma(_2712, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2720 = fma(_2712, _2716, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2722 = fma(_2712, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2724 = fma(_2712, _2700, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2726 = fma(_2712, _2704, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2728 = fma(_2712, _2708, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2516 = _2722;
                    _2572 = _2726;
                    _2560 = _2718;
                    _2530 = _2724;
                    _2522 = _2720;
                    _2582 = _2728;
                    _2644 = true;
                }
                else
                {
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2572 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2582 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2644 = false;
    float _2730 = _2516;
    float _2732 = _2572;
    float _2734 = _2560;
    float _2736 = _2530;
    float _2738 = _2522;
    float _2740 = _2582;
    float _2742 = _2526 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2744 = fma(_2478, -0.5, 0.5);
    float _2746 = precise::clamp(_2744, 0.0, 1.0);
    float _2748 = -_2730;
    float _2750 = _2748 + _2732;
    float _2752 = -_2734;
    float _2754 = _2752 + _2736;
    out.m_49.x = _2742;
    float _2756 = fma(_2746, _2750, _2730);
    float _2758 = -_2738;
    float _2760 = _2758 + _2740;
    float _2762 = fma(_2746, _2754, _2734);
    float _2764 = _2756 * 0.586610972881317138671875;
    bool _2766 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2768 = fma(_2746, _2760, _2738);
    out.m_90.x = 0.0;
    float _2770 = fma(_2762, 0.298911988735198974609375, _2764);
    bool _2772 = _2502 > 0.0;
    bool _2774 = isnan(_2502);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = fma(_2768, 0.114477999508380889892578125, _2770);
    float _2784 = -_2782;
    float _2786 = _2762 + _2784;
    float _2788 = -_2782;
    float _2790 = _2756 + _2788;
    float _2792 = -_2782;
    float _2794 = _2768 + _2792;
    float _2796 = fma(_2786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2800 = fma(_2794, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    bool _2802 = !_2766;
    if (!_2802)
    {
        float _2804 = -_1603;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2808 = -_1605;
        float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2812 = -_1607;
        float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2816 = _2806 * _2806;
        float _2818 = fma(_2810, _2810, _2816);
        float _2820 = fma(_2814, _2814, _2818);
        float _2822 = sqrt(_2820);
        float _2824 = rsqrt(_2820);
        float _2826 = -_2822;
        float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2832 = precise::clamp(_2830, 0.0, 1.0);
        float _2834 = _2810 * _2824;
        float _2836 = _2806 * _2824;
        float _2838 = abs(_2832);
        float _2840 = log2(_2838);
        float _2842 = _2814 * _2824;
        float _2844 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2846 = _2478 * _2836;
        float _2848 = -_2836;
        float _2850 = -_2844;
        float _2852 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2850);
        float _2854 = fma(_2476, _2834, _2846);
        float _2856 = -_2842;
        float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2852);
        float _2860 = fma(_2482, _2842, _2854);
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2866 = _2858 + _2864;
        float _2868 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2870 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = exp2(_2868);
        float _2876 = _2874 * _2872;
        float _2878 = _2862 * _2876;
        float _2880 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2880;
        out.m_90.y = _2882;
        out.m_90.z = _2884;
    }
    out.m_92.x = _2796;
    out.m_92.y = _2798;
    out.m_92.z = _2800;
    if (_2780)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2886;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2644 = false;
    bool _803 = false;
    bool _689 = false;
    bool _509 = false;
    bool _333 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2942 = as_type<float>(_127);
        out.gl_Position.z = _2942;
    }
    if (!_115)
    {
        return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    int _161 = 0;
    if (_155)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3012 = as_type<float>(_165);
        out.gl_Position.z = _3012;
    }
    if (_155)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_181;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _201 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_177;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_183;
    float _229;
    if (!_211)
    {
        float _213 = in.m_58.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_111);
        float _235 = 1.0 / _233;
        float _237 = _143 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _267 = 1.0 / _259;
    float _269 = _243 * _267;
    bool _271 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_239);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = _281 * _263;
    float _293 = fma(_285, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_289, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = _293 * _291;
    float _303 = _295 * _291;
    float _305 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_265;
    float _331;
    if (!_313)
    {
        float _315 = in.m_58.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _323 = _321 * _317;
        float _325 = floor(_323);
        float _327 = -_325;
        float _329 = _323 + _327;
        _331 = _329;
        _333 = true;
    }
    else
    {
        float _335 = float(_111);
        float _337 = 1.0 / _335;
        float _339 = _143 * _337;
        _331 = _339;
    }
    _333 = false;
    float _341 = _331;
    float _343 = in.m_60.x;
    float _345 = in.m_60.y;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _349 = _341 + _347;
    bool _351 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _353 = isnan(_341);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _371 = -_361;
    float _373 = _371 + 1.0;
    float _375 = 1.0 / _365;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = 1.0 / _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _381;
    float _385 = _311 * _345;
    float _387 = _349 * _375;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _391 = _341 + _389;
    bool _393 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_341);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _405;
    bool _409 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _411 = isnan(_341);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = fma(_383, _387, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _423 = _309 * _343;
    float _425 = fma(_407, _387, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _427 = _391 * _379;
    float _429 = _419 * _373;
    float _431 = -_419;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = _403 * _433;
    float _441 = fma(_437, _387, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _443 = -_403;
    float _445 = _443 + 1.0;
    float _447 = _421 * _439;
    float _449 = _441 * _439;
    float _451 = _425 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _465 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _449);
    float _467 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _447);
    float _469 = fma(_455, _427, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _471 = fma(_459, _427, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _473 = fma(_463, _427, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _451);
    float _477 = fma(_469, _429, _465);
    float _479 = fma(_471, _429, _467);
    float _481 = fma(_473, _429, _475);
    float _483 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].x, _477);
    float _485 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].y, _479);
    float _487 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].z, _481);
    bool _489 = !_377;
    float _507;
    if (!_489)
    {
        float _491 = in.m_58.x;
        float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _495 = _491 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _499 = _497 * _493;
        float _501 = floor(_499);
        float _503 = -_501;
        float _505 = _499 + _503;
        _507 = _505;
        _509 = true;
    }
    else
    {
        float _511 = float(_111);
        float _513 = 1.0 / _511;
        float _515 = _143 * _513;
        _507 = _515;
    }
    _509 = false;
    float _517 = _507;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _517 + _519;
    float _523 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _533 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _535 = isnan(_517);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_517);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _527;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _563;
    float _567 = -_543;
    float _569 = _567 + 1.0;
    bool _571 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _573 = isnan(_517);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _587 = 1.0 / _531;
    float _589 = 1.0 / _547;
    float _591 = _565 * _561;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _597 = _559 * _569;
    float _599 = -_559;
    float _601 = _599 + 1.0;
    float _603 = fma(_591, _521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _605;
    float _609 = _581 * _601;
    float _611 = _595 * _587;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _517 + _613;
    bool _617 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _619 = isnan(_517);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _603 * _609;
    float _631 = -_581;
    float _633 = _631 + 1.0;
    float _635 = fma(_611, _615, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _639 = _517 + _637;
    float _641 = _607 * _589;
    float _643 = -_627;
    float _645 = _643 + 1.0;
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _649 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_641, _639, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _653 = _543 * _645;
    float _655 = fma(_635, _597, _647);
    float _657 = fma(_651, _653, _655);
    float _659 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _661 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[118].x, _657);
    float _663 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _661 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _663;
    out.m_62.y = _649;
    out.m_62.z = _665;
    out.m_62.w = _667;
    bool _669 = !_585;
    float _687;
    if (!_669)
    {
        float _671 = in.m_58.x;
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _675 = _671 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        float _691 = float(_111);
        float _693 = 1.0 / _691;
        float _695 = _143 * _693;
        _687 = _695;
    }
    _689 = false;
    float _697 = _687;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = _697 + _699;
    bool _703 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _705 = isnan(_697);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _715;
    bool _719 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _721 = isnan(_697);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = 1.0 / _717;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _733;
    bool _737 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _739;
    float _743 = _701 * _731;
    float _745 = -_713;
    float _747 = _745 + 1.0;
    float _749 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _751 = fma(_741, _743, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _753;
    float _757 = _729 * _747;
    float _759 = -_729;
    float _761 = _759 + 1.0;
    float _763 = fma(_755, _743, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _765 = _749 * _757;
    float _767 = _763 * _757;
    float _769 = _751 * _757;
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].x, _765);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].y, _767);
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].z, _769);
    float _777 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].x, _771);
    float _779 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].y, _773);
    float _781 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].z, _775);
    bool _783 = !_737;
    float _801;
    if (!_783)
    {
        float _785 = in.m_58.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        float _805 = float(_111);
        float _807 = 1.0 / _805;
        float _809 = _143 * _807;
        _801 = _809;
    }
    _803 = false;
    float _811 = _801;
    float _813 = in.m_58.z;
    float _815 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _817 = log2(_815);
    float _819 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _821 = in.m_58.x;
    float _823 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _827 = _825 != 0;
    float _829 = in.m_58.y;
    float _831 = _817 * _143;
    float _833 = exp2(_831);
    float _835 = _813 * 2.0;
    float _837 = _821 * 2.0;
    float _839 = floor(_835);
    float _841 = _829 * 2.0;
    float _843 = floor(_837);
    float _845 = -_833;
    float _847 = _845 + 1.0;
    bool _849 = _839 > 0.0;
    float _851 = floor(_841);
    bool _853 = _839 >= 0.0;
    bool _855 = isnan(_839);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _839;
    float _865 = _821;
    if (_827)
    {
        _863 = _829;
    }
    float _867 = _863;
    float _869 = _861 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _871 = _829 > 0.5;
    int _873 = ~as_type<int>(_869);
    int _875 = _873 + 1;
    int _877 = _875 + 1;
    float _879 = -_209;
    int _881 = _871 ? as_type<int>(_879) : as_type<int>(_209);
    int _883 = _877;
    float _885 = _869;
    float _887 = _867;
    if (!_849)
    {
        int _889 = ~as_type<int>(_869);
        int _891 = _889 + 1;
        _883 = _891;
    }
    int _893 = _883;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _897 = _895 != 0;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _909 = _907 != 0;
    bool _911 = _813 > 0.5;
    if (_827)
    {
        _885 = _821;
    }
    float _913 = _885;
    bool _915 = !_905;
    float _917 = _915 ? _209 : as_type<float>(_881);
    bool _919 = _843 > 0.0;
    float _921 = _913;
    if (!_827)
    {
        _921 = _813;
    }
    float _923 = _921;
    if (!_827)
    {
        _887 = _821;
    }
    float _925 = _887;
    bool _927 = _843 >= 0.0;
    bool _929 = isnan(_843);
    bool _931 = _927 || _929;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    float _937 = _923 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _939 = -_193;
    int _941 = _911 ? as_type<int>(_939) : as_type<int>(_193);
    int _943 = _935 ? 0 : 1;
    bool _945 = !_909;
    float _947 = _945 ? _193 : as_type<float>(_941);
    bool _949 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(0.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    bool _959 = _851 >= 0.0;
    bool _961 = isnan(_851);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    int _969 = ~_943;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    int _975 = _973;
    if (!_919)
    {
        int _977 = ~_943;
        int _979 = _977 + 1;
        _975 = _979;
    }
    int _981 = _975;
    float _983 = _957 ? _847 : 0.0;
    float _985 = _821 + _829;
    int _987 = _967 ? 0 : 1;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _991 = _989 != 0;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _999 = _997 != 0;
    bool _1001 = !_991;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1007 = _851 > 0.0;
    float _1009 = _985 + (-1.0);
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1013 = _925 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1015 = -_1005;
    float _1017 = fma(_937, 2.0, _1015);
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1021 = in.m_64.x;
    float _1023 = in.m_64.y;
    float _1025 = in.m_64.z;
    float _1027 = fma(_1013, -2.0, _1011);
    int _1029 = abs(_1003);
    int _1031 = ~_987;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    int _1037 = _1035;
    if (!_1007)
    {
        int _1039 = ~_987;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1047 = float(_893);
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1051 = 1.0 + _1049;
    float _1053 = float(_1029);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1057 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(1.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = 1.0 / _1051;
    bool _1069 = !_995;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = _1053 * _1047;
    float _1075 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1045);
    float _1077 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1055);
    int _1079 = abs(_1071);
    float _1081 = _821 + (-0.5);
    float _1083 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1075);
    float _1085 = -_143;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1017);
    float _1089 = _1073 * (-2.0);
    float _1091 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1077);
    bool _1093 = !_999;
    int _1095 = _1093 ? 0 : 1;
    float _1097 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1027);
    float _1099 = fma(_1089, _1021, _1021);
    float _1101 = float(_981);
    float _1103 = fma(_1019, _1089, _1019);
    float _1105 = float(_1079);
    float _1107 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1099);
    int _1109 = abs(_1095);
    if (_1065)
    {
        float _1111 = _983 * _1067;
        _145 = _1111;
    }
    float _1113 = _145;
    float _1115 = float(_1043);
    float _1117 = _1105 * _1101;
    float _1119 = _829 + _813;
    float _1121 = fma(_1103, _1113, _1107);
    float _1123 = _1117 * (-2.0);
    float _1125 = float(_1109);
    float _1127 = _1119 + (-1.0);
    float _1129 = _829 + (-0.5);
    float _1131 = _1121 * 0.15915493667125701904296875;
    float _1133 = -_209;
    int _1135 = _911 ? as_type<int>(_1133) : as_type<int>(_209);
    float _1137 = _1125 * _1115;
    float _1139 = fma(_1123, _1023, _1023);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1143 = _821 + _813;
    float _1145 = _1137 * (-2.0);
    float _1147 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1139);
    float _1149 = fma(_1141, _1123, _1141);
    float _1151 = _1143 + (-1.0);
    float _1153 = _813 + (-0.5);
    float _1155 = fma(_1149, _1113, _1147);
    float _1157 = fma(_1145, _1025, _1025);
    float _1159 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1161 = _1131 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1155 * 0.15915493667125701904296875;
    float _1167 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1157);
    float _1169 = fma(_1159, _1145, _1159);
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1173 = in.m_46.x;
    float _1175 = in.m_46.y;
    float _1177 = in.m_46.z;
    bool _1179 = !_901;
    float _1181 = _1179 ? _209 : as_type<float>(_1135);
    float _1183 = fma(_1169, _1113, _1167);
    float _1185 = _1165 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = _819 * _1171;
    float _1191 = _1183 * 0.15915493667125701904296875;
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1195 = _1165 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = _823 * _1193;
    float _1201 = _1131 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = _1163 * _1187;
    float _1207 = _1191 * 6.283185482025146484375;
    float _1209 = cos(_1207);
    float _1211 = _1163 * _1197;
    float _1213 = _1191 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = _1203 * _1187;
    float _1219 = _1203 * _1197;
    float _1221 = _1163 * _1209;
    float _1223 = _1203 * _1209;
    float _1225 = _1197 * _1209;
    float _1227 = _1187 * _1209;
    float _1229 = _1221 * _1199;
    float _1231 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1223 * _1199;
    float _1235 = fma(_1215, _1211, _1217);
    float _1237 = -_1205;
    float _1239 = fma(_1215, _1219, _1237);
    float _1241 = -_1219;
    float _1243 = fma(_1215, _1205, _1241);
    float _1245 = -_1199;
    float _1247 = _1215 * _1245;
    float _1249 = fma(_1235, _1189, _1229);
    float _1251 = fma(_1215, _1217, _1211);
    float _1253 = fma(_1239, _1189, _1233);
    float _1255 = fma(_1225, _1189, _1247);
    float _1257 = fma(_1243, _1231, _1249);
    float _1259 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1261 = fma(_1251, _1231, _1253);
    float _1263 = fma(_1227, _1231, _1255);
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1267 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1259);
    float _1269 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1273 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1265);
    float _1275 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1267);
    float _1277 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1269);
    float _1279 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1271);
    float _1281 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1273);
    float _1283 = _1275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1285 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1277);
    float _1287 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1291 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1297 = _1283 + _1289;
    float _1299 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1291);
    float _1301 = -_193;
    float _1303 = _871 ? _1301 : _193;
    float _1305 = _1293 + _1295;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1309 = _1297 + _1307;
    float _1311 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1299);
    bool _1313 = !_897;
    float _1315 = _1313 ? _193 : _1303;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1319 = _1305 + _1317;
    float _1321 = _1309 * _1309;
    float _1323 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1325 = fma(_1319, _1319, _1321);
    float _1327 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1329 = sqrt(_1325);
    float _1331 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1327);
    float _1333 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1331);
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = _1323 + _1335;
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = _1311;
    float _1343 = _1303;
    float _1345 = _1177;
    float _1347 = _1325;
    float _1349 = _1309;
    float _1351 = _1337;
    if (!_1339)
    {
        _1341 = _1305;
    }
    float _1353 = _1341;
    float _1355 = _1353;
    if (!_1339)
    {
        _1343 = _1297;
    }
    float _1357 = _1343;
    float _1359 = _1357;
    if (!_1339)
    {
        _1345 = _1337;
    }
    float _1361 = _1345;
    bool _1363 = !_1339;
    float _1365 = _1361;
    if (!_1363)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1371 = _1329 + _1369;
        float _1373 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = rsqrt(_1325);
        float _1377 = _1371 * _1367;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1379 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        float _1389 = fma(_1383, _1373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = _1375 * _1389;
        float _1393 = _1387 + (-1.0);
        float _1395 = fma(_1319, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1309, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1399 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1401 = fma(_1337, _1387, _1399);
        _1365 = _1401;
        _1355 = _1395;
        _1359 = _1397;
        _1347 = _1375;
    }
    float _1403 = _1365;
    float _1405 = _1355;
    float _1407 = _1359;
    float _1409 = _1347;
    float _1411 = -_1323;
    float _1413 = _1411 + _1403;
    float _1415 = -_1293;
    float _1417 = _1415 + _1405;
    float _1419 = -_1283;
    float _1421 = _1419 + _1407;
    float _1423 = _1413 * _1413;
    bool _1425 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1427 = isnan(0.5);
    bool _1429 = _1425 || _1427;
    bool _1431 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1433 = _1429 || _1431;
    float _1435 = fma(_1417, _1417, _1423);
    float _1437 = fma(_1421, _1421, _1435);
    float _1439 = sqrt(_1437);
    bool _1441 = _1439 > 0.0;
    float _1443 = _1409;
    float _1445 = _1439;
    float _1447 = _1437;
    float _1449 = _1407;
    float _1451 = _1405;
    float _1453 = _1403;
    if (!_1441)
    {
        _1443 = _1405;
    }
    float _1455 = _1443;
    float _1457 = _1455;
    float _1459 = _1455;
    if (!_1441)
    {
        _1445 = _1403;
    }
    float _1461 = _1445;
    float _1463 = _1461;
    if (!_1441)
    {
        _1349 = _1407;
    }
    float _1465 = _1349;
    bool _1467 = !_1441;
    float _1469 = _1465;
    if (!_1467)
    {
        float _1471 = _201 * _201;
        float _1473 = fma(_203, _203, _1471);
        float _1475 = fma(_205, _205, _1473);
        float _1477 = rsqrt(_1437);
        float _1479 = sqrt(_1475);
        float _1481 = _1417 * _1477;
        float _1483 = _1413 * _1477;
        float _1485 = _1421 * _1477;
        bool _1487 = _1479 > 0.0;
        float _1489 = _1477;
        float _1491 = _1479;
        _1351 = _1485;
        if (!_1487)
        {
            _1457 = _1405;
        }
        float _1493 = _1457;
        _1459 = _1493;
        if (!_1487)
        {
            _1489 = _1403;
        }
        float _1495 = _1489;
        _1463 = _1495;
        if (!_1487)
        {
            _1491 = _1407;
        }
        float _1497 = _1491;
        bool _1499 = !_1487;
        _1469 = _1497;
        if (!_1499)
        {
            float _1501 = rsqrt(_1475);
            float _1503 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1505 = _201 * _1501;
            float _1507 = _203 * _1501;
            float _1509 = _205 * _1501;
            float _1511 = _1483 * _1505;
            float _1513 = fma(_1481, _1507, _1511);
            float _1515 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1517 = fma(_1485, _1509, _1513);
            float _1519 = _1517 * _1515;
            float _1521 = fma(_203, _1519, _1405);
            float _1523 = fma(_201, _1519, _1403);
            float _1525 = fma(_205, _1519, _1407);
            _1459 = _1521;
            _1463 = _1523;
            _1469 = _1525;
            _1447 = _1503;
        }
    }
    float _1527 = _1459;
    float _1529 = _1463;
    float _1531 = _1469;
    float _1533 = _1447;
    float _1535 = _1351;
    float _1537 = _1531;
    float _1539 = _1535;
    if (_1433)
    {
        _1449 = _1527;
    }
    float _1541 = _1449;
    float _1543 = _1541;
    if (_1433)
    {
        _1451 = _1529;
    }
    float _1545 = _1451;
    float _1547 = _1545;
    if (_1433)
    {
        _1453 = _1531;
    }
    float _1549 = _1453;
    float _1551 = _1549;
    if (!_1433)
    {
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1555 = _1323 + _1553;
        float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1559 = _1293 + _1557;
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1563 = -_1323;
        float _1565 = _1563 + _1529;
        float _1567 = _1555 * _1555;
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1571 = _1283 + _1569;
        float _1573 = -_1283;
        float _1575 = _1573 + _1531;
        float _1577 = fma(_1559, _1559, _1567);
        float _1579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1581 = fma(_1571, _1571, _1577);
        float _1583 = sqrt(_1581);
        float _1585 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1587 = precise::min(_1583, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1589 = _1587 * _1579;
        float _1591 = -_1293;
        float _1593 = _1591 + _1527;
        float _1595 = _1585 * _1589;
        float _1597 = fma(_1593, _1595, _1293);
        float _1599 = fma(_1565, _1595, _1323);
        float _1601 = fma(_1575, _1595, _1283);
        _1547 = _1599;
        _1543 = _1597;
        _1551 = _1601;
        _1537 = _1575;
    }
    float _1603 = _1547;
    float _1605 = _1543;
    float _1607 = _1551;
    float _1609 = _1537;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1603 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1605 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1607 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1627 = fma(_1617, _1617, _1623);
    float _1629 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1625);
    float _1631 = fma(_1621, _1621, _1627);
    float _1633 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1629);
    float _1635 = rsqrt(_1631);
    float _1637 = sqrt(_1631);
    float _1639 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1641 = _1617 * _1639;
    float _1643 = _1621 * _1639;
    float _1645 = _1641 * _1641;
    float _1647 = _1643 * _1643;
    float _1649 = _1645 + _1647;
    float _1651 = sqrt(_1649);
    bool _1653 = _1651 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1657 = _1651 + _1655;
    float _1659 = _1609;
    float _1661 = _1649;
    float _1663 = _1657;
    float _1665 = _1613;
    float _1667 = _1641;
    float _1669 = _1643;
    if (_1653)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1671;
    }
    float _1673 = _1659;
    if (_1653)
    {
        float _1675 = rsqrt(_1649);
        _1661 = _1675;
    }
    float _1677 = _1661;
    if (_1653)
    {
        float _1679 = _1657 * _1673;
        _1663 = _1679;
    }
    float _1681 = _1663;
    if (_1653)
    {
        float _1683 = _1681 * 0.15915493667125701904296875;
        _1539 = _1683;
    }
    float _1685 = _1539;
    float _1687 = _1533;
    if (_1653)
    {
        float _1689 = _1685 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1527;
    float _1701 = _1697;
    if (_1653)
    {
        float _1703 = _1685 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        _1699 = _1705;
    }
    float _1707 = _1699;
    float _1709 = -_1639;
    float _1711 = -_1697;
    float _1713 = fma(_1613, _1709, _1711);
    float _1715 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1717 = _1713;
    if (_1653)
    {
        float _1719 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1719;
    }
    float _1721 = _1701;
    float _1723 = _1693;
    float _1725 = _1721;
    if (_1653)
    {
        float _1727 = fma(_1693, _1721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1723 = _1727;
    }
    float _1729 = _1723;
    float _1731 = _1729;
    float _1733 = _1707;
    if (_1653)
    {
        float _1735 = _1707 + (-1.0);
        _1665 = _1735;
    }
    float _1737 = _1665;
    if (_1653)
    {
        float _1739 = _1677 * _1729;
        _1731 = _1739;
    }
    float _1741 = _1731;
    if (_1653)
    {
        float _1743 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1743;
    }
    float _1745 = _1725;
    float _1747 = _1745;
    if (_1653)
    {
        float _1749 = _1641 * _1741;
        _1667 = _1749;
    }
    float _1751 = _1667;
    if (_1653)
    {
        float _1753 = _1643 * _1741;
        _1669 = _1753;
    }
    float _1755 = _1669;
    if (_1653)
    {
        float _1757 = fma(_1713, _1707, _1745);
        _1717 = _1757;
    }
    float _1759 = _1717;
    if (!_1653)
    {
        _1747 = _1645;
    }
    float _1761 = _1747;
    float _1763 = _1761;
    if (_1653)
    {
        float _1765 = _1751 * _1751;
        _1763 = _1765;
    }
    float _1767 = _1763;
    if (!_1653)
    {
        _1733 = _1647;
    }
    float _1769 = _1733;
    float _1771 = _1769;
    if (_1653)
    {
        float _1773 = _1755 * _1755;
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1779 = fma(_1759, _1759, _1767);
    float _1781 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1783 = floor(_1777);
    float _1785 = _1779 + _1775;
    float _1787 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1781);
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1791 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1789);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1787);
    float _1799 = -_1793;
    float _1801 = _1799 + 1.0;
    float _1803 = rsqrt(_1785);
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1807 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1809 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1795);
    float _1811 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1813 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1809);
    float _1815 = abs(_1801);
    float _1817 = log2(_1815);
    float _1819 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1821 = -_1811;
    float _1823 = fma(_1821, _1805, 1.0);
    float _1825 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1783;
    float _1831 = _1777 + _1829;
    float _1833 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1825);
    float _1835 = _1803 * _1751;
    float _1837 = _1803 * _1759;
    float _1839 = _1803 * _1755;
    float _1841 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = floor(_1819);
    float _1849 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = -_1843;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1859 = -_1839;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1863 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    float _1865 = exp2(_1855);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1861, -0.5, 0.5);
    float _1871 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1863);
    float _1873 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1857);
    float _1875 = fma(_1861, 0.5, 0.5);
    float _1877 = _1837 + 1.0;
    float _1879 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1871);
    float _1881 = log2(_1823);
    float _1883 = -_1847;
    float _1885 = _1819 + _1883;
    float _1887 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1889 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1873);
    float _1891 = fma(_1875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1893 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1887);
    float _1895 = 1.0 / _1879;
    float _1897 = -_1837;
    float _1899 = fma(_1865, _1877, _1897);
    float _1901 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1889);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1893);
    float _1905 = fma(_1875, _1891, -0.212114393711090087890625);
    float _1907 = sqrt(_1869);
    float _1909 = _1881 * 0.693147182464599609375;
    float2 _5780 = float2(_1831, _1885);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5780, float2(0.0), isnan(_5780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5780, float2(0.0), isnan(_5780)), level(0.0)).x;
    float _1913 = fma(_1875, _1905, 1.570728778839111328125);
    float _1915 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1917 = _1901 * _1895;
    float _1919 = _1903 * _1895;
    float _1921 = fma(_1899, 0.5, 0.5);
    float _1923 = fma(_1917, 0.5, 0.5);
    float _1925 = fma(_1919, -0.5, 0.5);
    float _1927 = _1907 * 0.636619746685028076171875;
    float3 _5814 = float3(_1923, _1925, _1915);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5814, float3(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5814, float3(0.0), isnan(_5814)), level(0.0)).x;
    float _1931 = -_1913;
    float _1933 = fma(_1927, _1931, 1.0);
    float3 _5830 = float3(_1923, _1925, _1915);
    float4 _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5830, float3(0.0), isnan(_5830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5830, float3(0.0), isnan(_5830)), level(0.0)).xyzw;
    float _1938 = _1936.x;
    float _1940 = _1936.y;
    float _1942 = _1936.z;
    float _1944 = _1936.w;
    float2 _5846 = float2(_1933, _1921);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5846, float2(0.0), isnan(_5846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5846, float2(0.0), isnan(_5846)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = in.m_58.w;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1960 = _1958 != 0;
    float _1962 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1968 = _1966 != 0;
    float _1970 = -_1091;
    float _1972 = _1970 + 1.0;
    bool _1974 = _821 > 0.5;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1980 = -_1083;
    float _1982 = _1980 + 1.0;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1986 = _1984 != 0;
    float _1988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    float _1994 = -_1315;
    float _1996 = _1994 + 0.5;
    float _1998 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2000 = _779 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2002 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2004 = _1923;
    float _2006 = _1925;
    bool _2008 = _1986;
    float _2010 = _1996;
    float _2012 = _1879;
    float _2014 = _1903;
    if (_1968)
    {
        float _2016 = _821 * 3.1415927410125732421875;
        _865 = _2016;
    }
    float _2018 = _865;
    float _2020 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2022 = 1.0 / _1978;
    float _2024 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2026 = _2018;
    if (_1968)
    {
        float _2028 = _2018 * 0.15915493667125701904296875;
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2020);
    if (_1960)
    {
        float _2034 = _1956 * 3.1415927410125732421875;
        _2004 = _2034;
    }
    float _2036 = _2004;
    bool _2038 = _1956 > 0.5;
    out.m_66.x = _1605;
    out.m_66.y = _1603;
    out.m_66.z = _1607;
    float _2040 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2032);
    bool _2042 = _2038;
    if (_1960)
    {
        float _2044 = _2036 * 0.15915493667125701904296875;
        _2006 = _2044;
    }
    float _2046 = _2006;
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2048;
    float _2052 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2054 = _2030;
    if (_1968)
    {
        float _2056 = _2030 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = in.m_68.x;
    float _2064 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2052);
    float _2066 = _2050 * _2022;
    bool _2068 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2070 = isnan(_811);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    float _2080 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2064);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2084 = _811 + _2082;
    bool _2086 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2088 = isnan(_811);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2094 = _2090 || _2092;
    float _2096 = float(_2094);
    float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2100 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2102 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1962);
    float _2104 = -_2078;
    float _2106 = _2104 + 1.0;
    float _2108 = fma(_2066, _2084, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2110 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2102);
    float _2112 = _2096 * _2106;
    float _2114 = 1.0 / _2100;
    float _2116 = -_193;
    int _2118 = _2038 ? as_type<int>(_2116) : as_type<int>(_193);
    float _2120 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2122 = _2108 * _2112;
    bool _2124 = !_1986;
    float _2126 = _2124 ? _193 : as_type<float>(_2118);
    float _2128 = _2120 + _2100;
    float _2130 = _2046;
    if (_1960)
    {
        float _2132 = _2046 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    if (_1968)
    {
        bool _2138 = _2060 > 0.5;
        _2008 = _2138;
    }
    bool _2140 = _2008;
    float _2142 = -_2096;
    float _2144 = _2142 + 1.0;
    float _2146 = -_2126;
    float _2148 = _2146 + 0.5;
    float _2150 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2152 = _2128 * _2114;
    float _2154 = _2152 * 0.5;
    float _2156 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2122);
    float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2160 = _2150 * _1988;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2162);
    float _2166 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2168 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2170 = _917 + 0.5;
    float _2172 = _2154;
    if (_1960)
    {
        bool _2174 = _2136 > 0.5;
        _2042 = _2174;
    }
    bool _2176 = _2042;
    float _2178 = _947 + (-0.5);
    float _2180 = 1.0 / _2164;
    if (!_1960)
    {
        _2172 = _209;
    }
    float _2182 = _2172;
    float _2184 = fma(_2166, _2170, _1087);
    float _2186 = _2182;
    if (_1960)
    {
        float _2188 = -_209;
        float _2190 = _2176 ? _2188 : _209;
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = -_2168;
    float _2196 = -_1097;
    float _2198 = fma(_2194, _2178, _2196);
    float _2200 = -_209;
    int _2202 = _1974 ? as_type<int>(_2200) : as_type<int>(_209);
    float _2204 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2156);
    bool _2206 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2208 = isnan(0.5);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2214 = _2210 || _2212;
    float _2216 = _2192 + 0.5;
    bool _2218 = !_1992;
    float _2220 = _2218 ? _209 : as_type<float>(_2202);
    float _2222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2224 = fma(_947, _1972, _2198);
    float _2226 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2228 = -_1982;
    float _2230 = fma(_917, _2228, _2184);
    float _2232 = _2220 + 0.5;
    float _2234 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2236 = _2226 * _2158;
    float _2238 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2240 = _2180 * _2238;
    float _2242 = _1181 + 0.5;
    float _2244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2246 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2248 = _2242;
    if (!_1968)
    {
        _2010 = _193;
    }
    float _2250 = _2010;
    float _2252 = _2204 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2254 = _2250;
    if (_1968)
    {
        float _2256 = -_193;
        float _2258 = _2140 ? _2256 : _193;
        _2254 = _2258;
    }
    float _2260 = _2254;
    float _2262 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2264 = _2246 * _2222;
    float _2266 = abs(_2240);
    float _2268 = log2(_2266);
    float _2270 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2272 = _2260;
    if (!_2214)
    {
        _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2274 = _2248;
    out.m_70.x = _2230;
    out.m_70.y = _2224;
    float _2276 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2278 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2280 = isnan(_1637);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2286 = _2282 || _2284;
    out.m_72.w = _2160;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2290 = _2234 * _2244;
    float _2292 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2294 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2296 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2300 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2302 = _2268;
    if (_2214)
    {
        _2302 = 1.0;
    }
    float _2304 = _2302;
    float _2306 = _2270 * _2288;
    float _2308 = _2288;
    float _2310 = _2304;
    if (!_2214)
    {
        float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2314 = _2274 + _2312;
        _2308 = _2314;
    }
    float _2316 = _2308;
    float _2318 = -_2260;
    float _2320 = _2318 + 0.5;
    float _2322 = exp2(_2296);
    float _2324 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2326 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2330 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _2264;
    out.m_72.y = _2290;
    out.m_72.z = _2306;
    float _2334 = _2328 * _2298;
    float _2336 = _2324;
    if (!_2214)
    {
        float _2338 = 1.0 / _2316;
        _2272 = _2338;
    }
    float _2340 = _2272;
    if (!_2214)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2344 = _2240 + _2342;
        _2336 = _2344;
    }
    float _2346 = _2336;
    out.m_74.x = _2326;
    out.m_74.y = _2024;
    out.m_74.z = _2332;
    out.m_74.w = _2252;
    bool _2348 = _2240 <= 8000.0;
    bool _2350 = isnan(_2240);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(8000.0);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    out.m_76.x = _2236;
    out.m_76.y = _2334;
    float _2360 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2362 = precise::clamp(_2360, 0.0, 1.0);
    float _2364 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2366 = -_1215;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2330);
    float _2370 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2372 = exp2(_2002);
    float _2374 = -_1215;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2378 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2368);
    float _2380 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2376);
    float _2382 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2384 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2386 = fma(_2262, _2262, 1.0);
    float _2388 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2382);
    float _2390 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2384);
    float _2392 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2394 = fma(_2362, -2.0, 3.0);
    float _2396 = _2362 * _2362;
    float _2398 = rsqrt(_2386);
    float _2400 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2370);
    float _2402 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2294);
    float _2404 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2392);
    float _2406 = _2396 * _2394;
    float _2408 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2390);
    float _2410 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2300);
    float _2412 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2414 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2400);
    float _2416 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2402);
    float _2418 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2404);
    float _2420 = -_2406;
    float _2422 = _2420 + 1.0;
    float _2424 = -_1215;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2428 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2430 = _2262 * _2378;
    float _2432 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2406);
    float _2434 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2426);
    float _2436 = _2262 * _2398;
    float _2438 = fma(_2412, _2428, _2430);
    out.m_78.x = _2428;
    out.m_78.y = _2408;
    out.m_78.z = _2410;
    float _2440 = _2262 * _2380;
    float _2442 = _2358 * _2432;
    float _2444 = -_2372;
    float _2446 = _2444 + 1.0;
    float _2448 = -_2414;
    float _2450 = _2436 * _2448;
    float _2452 = fma(_2412, _2408, _2440);
    float _2454 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2458 = fma(_2398, _2378, _2450);
    float _2460 = -_2416;
    float _2462 = _2436 * _2460;
    float _2464 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2040);
    float _2466 = _1879 * 0.5;
    float _2468 = _2262 * _2434;
    float _2470 = fma(_2398, _2380, _2462);
    float _2472 = _1901 + _1879;
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1903;
    out.gl_Position.z = _2464;
    out.gl_Position.w = _1879;
    float _2474 = fma(_2412, _2410, _2468);
    float _2476 = _2414 + _2438;
    float _2478 = _2416 + _2452;
    float _2480 = _2464 + _1879;
    float _2482 = _2418 + _2474;
    float _2484 = _2472 * 0.5;
    float _2486 = _2480 * 0.5;
    float _2488 = fma(_1903, -0.5, _2466);
    out.m_80.x = _2476;
    out.m_80.y = _2478;
    out.m_80.z = _2482;
    float _2490 = -_2418;
    float _2492 = _2436 * _2490;
    float _2494 = _2464;
    float _2496 = _2458;
    if (!_2214)
    {
        float _2498 = _2346 * _2340;
        float _2500 = precise::clamp(_2498, 0.0, 1.0);
        _2310 = _2500;
    }
    float _2502 = _2310;
    float _2504 = -_2456;
    float _2506 = _2504 + 1.0;
    out.m_82.x = _2484;
    out.m_82.y = _2488;
    out.m_82.z = _2486;
    out.m_82.w = _1879;
    float _2508 = fma(_2398, _2434, _2492);
    float _2510 = _2506;
    if (!_2286)
    {
        _2012 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2012;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2286)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2494;
    out.m_84.x = _2458;
    out.m_84.y = _2470;
    out.m_84.z = _2508;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2286)
    {
        _2014 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2014;
    float _2526 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2528 = _2524;
    float _2530 = _2524;
    if (!_2286)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2532 = _2496;
    float _2534 = -_1911;
    float _2536 = _2534 + 1.0;
    float _2538 = _2536 * _2454;
    float _2540 = precise::clamp(_2538, 0.0, 1.0);
    float _2542 = -_2540;
    float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2546 = _2544 * _2062;
    float _2548 = _2456 * _1929;
    float _2550 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2552 = _1944 * _2548;
    float _2554 = _1944 * _2506;
    out.m_86.x = _2550;
    float _2556 = _2552;
    float _2558 = _2532;
    float _2560 = _2532;
    if (!_2286)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2562 = _2510;
    float _2564 = _1954 * _2548;
    float _2566 = fma(_1950, _2552, _1938);
    float _2568 = fma(_1952, _2552, _1940);
    float _2570 = _2562;
    float _2572 = _2562;
    if (!_2286)
    {
        _2556 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2574 = _2556;
    float _2576 = fma(_1944, _2564, _1942);
    out.m_88.x = _2566;
    out.m_88.y = _2568;
    out.m_88.z = _2576;
    out.m_88.w = _2554;
    bool _2578 = !_2286;
    float _2580 = _2574;
    float _2582 = _2574;
    if (!_2578)
    {
        bool _2584 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2586 = isnan(_1637);
        bool _2588 = _2584 || _2586;
        bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2592 = _2588 || _2590;
        if (!_2592)
        {
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2596 = _1637 + _2594;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2600 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2598;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2606 = 1.0 / _2600;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2624 = _2596 * _2606;
            float _2626 = precise::clamp(_2624, 0.0, 1.0);
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2632 = fma(_2626, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2634 = fma(_2626, _2630, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2636 = fma(_2626, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2638 = fma(_2626, _2614, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2640 = fma(_2626, _2618, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2642 = fma(_2626, _2622, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2516 = _2636;
            _2572 = _2640;
            _2560 = _2632;
            _2530 = _2638;
            _2522 = _2634;
            _2582 = _2642;
            _2644 = true;
        }
        else
        {
            bool _2646 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2648 = isnan(_1637);
            bool _2650 = _2646 || _2648;
            bool _2652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2654 = _2650 || _2652;
            if (!_2654)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2656 = _2558;
            _2560 = _2656;
            if (!_2654)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2658 = _2514;
            _2516 = _2658;
            if (!_2654)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2660 = _2520;
            _2522 = _2660;
            if (!_2654)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2662 = _2528;
            _2530 = _2662;
            if (!_2654)
            {
                _2570 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2664 = _2570;
            _2572 = _2664;
            if (!_2654)
            {
                _2580 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2666 = _2580;
            bool _2668 = !_2654;
            _2582 = _2666;
            if (!_2668)
            {
                bool _2670 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2672 = isnan(_1637);
                bool _2674 = _2670 || _2672;
                bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2678 = _2674 || _2676;
                if (!_2678)
                {
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2682 = _1637 + _2680;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2686 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2684;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2692 = 1.0 / _2686;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2710 = _2682 * _2692;
                    float _2712 = precise::clamp(_2710, 0.0, 1.0);
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2718 = fma(_2712, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2720 = fma(_2712, _2716, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2722 = fma(_2712, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2724 = fma(_2712, _2700, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2726 = fma(_2712, _2704, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2728 = fma(_2712, _2708, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2516 = _2722;
                    _2572 = _2726;
                    _2560 = _2718;
                    _2530 = _2724;
                    _2522 = _2720;
                    _2582 = _2728;
                    _2644 = true;
                }
                else
                {
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2572 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2582 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2644 = false;
    float _2730 = _2516;
    float _2732 = _2572;
    float _2734 = _2560;
    float _2736 = _2530;
    float _2738 = _2522;
    float _2740 = _2582;
    float _2742 = _2526 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2744 = fma(_2478, -0.5, 0.5);
    float _2746 = precise::clamp(_2744, 0.0, 1.0);
    float _2748 = -_2730;
    float _2750 = _2748 + _2732;
    float _2752 = -_2734;
    float _2754 = _2752 + _2736;
    out.m_49.x = _2742;
    float _2756 = fma(_2746, _2750, _2730);
    float _2758 = -_2738;
    float _2760 = _2758 + _2740;
    float _2762 = fma(_2746, _2754, _2734);
    float _2764 = _2756 * 0.586610972881317138671875;
    bool _2766 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2768 = fma(_2746, _2760, _2738);
    out.m_90.x = 0.0;
    float _2770 = fma(_2762, 0.298911988735198974609375, _2764);
    bool _2772 = _2502 > 0.0;
    bool _2774 = isnan(_2502);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = fma(_2768, 0.114477999508380889892578125, _2770);
    float _2784 = -_2782;
    float _2786 = _2762 + _2784;
    float _2788 = -_2782;
    float _2790 = _2756 + _2788;
    float _2792 = -_2782;
    float _2794 = _2768 + _2792;
    float _2796 = fma(_2786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2800 = fma(_2794, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    bool _2802 = !_2766;
    if (!_2802)
    {
        float _2804 = -_1603;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2808 = -_1605;
        float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2812 = -_1607;
        float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2816 = _2806 * _2806;
        float _2818 = fma(_2810, _2810, _2816);
        float _2820 = fma(_2814, _2814, _2818);
        float _2822 = sqrt(_2820);
        float _2824 = rsqrt(_2820);
        float _2826 = -_2822;
        float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2832 = precise::clamp(_2830, 0.0, 1.0);
        float _2834 = _2810 * _2824;
        float _2836 = _2806 * _2824;
        float _2838 = abs(_2832);
        float _2840 = log2(_2838);
        float _2842 = _2814 * _2824;
        float _2844 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2846 = _2478 * _2836;
        float _2848 = -_2836;
        float _2850 = -_2844;
        float _2852 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2850);
        float _2854 = fma(_2476, _2834, _2846);
        float _2856 = -_2842;
        float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2852);
        float _2860 = fma(_2482, _2842, _2854);
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2866 = _2858 + _2864;
        float _2868 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2870 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = exp2(_2868);
        float _2876 = _2874 * _2872;
        float _2878 = _2862 * _2876;
        float _2880 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2880;
        out.m_90.y = _2882;
        out.m_90.z = _2884;
    }
    out.m_92.x = _2796;
    out.m_92.y = _2798;
    out.m_92.z = _2800;
    if (_2780)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2886;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2644 = false;
    bool _803 = false;
    bool _689 = false;
    bool _509 = false;
    bool _333 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2942 = as_type<float>(_127);
        out.gl_Position.z = _2942;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    int _161 = 0;
    if (_155)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3012 = as_type<float>(_165);
        out.gl_Position.z = _3012;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_181;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _201 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_177;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_183;
    float _229;
    if (!_211)
    {
        float _213 = in.m_58.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_111);
        float _235 = 1.0 / _233;
        float _237 = _143 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _267 = 1.0 / _259;
    float _269 = _243 * _267;
    bool _271 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_239);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = _281 * _263;
    float _293 = fma(_285, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_289, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = _293 * _291;
    float _303 = _295 * _291;
    float _305 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_265;
    float _331;
    if (!_313)
    {
        float _315 = in.m_58.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _323 = _321 * _317;
        float _325 = floor(_323);
        float _327 = -_325;
        float _329 = _323 + _327;
        _331 = _329;
        _333 = true;
    }
    else
    {
        float _335 = float(_111);
        float _337 = 1.0 / _335;
        float _339 = _143 * _337;
        _331 = _339;
    }
    _333 = false;
    float _341 = _331;
    float _343 = in.m_60.x;
    float _345 = in.m_60.y;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _349 = _341 + _347;
    bool _351 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _353 = isnan(_341);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _371 = -_361;
    float _373 = _371 + 1.0;
    float _375 = 1.0 / _365;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = 1.0 / _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _381;
    float _385 = _311 * _345;
    float _387 = _349 * _375;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _391 = _341 + _389;
    bool _393 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_341);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _405;
    bool _409 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _411 = isnan(_341);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = fma(_383, _387, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _423 = _309 * _343;
    float _425 = fma(_407, _387, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _427 = _391 * _379;
    float _429 = _419 * _373;
    float _431 = -_419;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = _403 * _433;
    float _441 = fma(_437, _387, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _443 = -_403;
    float _445 = _443 + 1.0;
    float _447 = _421 * _439;
    float _449 = _441 * _439;
    float _451 = _425 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _465 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _449);
    float _467 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _447);
    float _469 = fma(_455, _427, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _471 = fma(_459, _427, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _473 = fma(_463, _427, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _451);
    float _477 = fma(_469, _429, _465);
    float _479 = fma(_471, _429, _467);
    float _481 = fma(_473, _429, _475);
    float _483 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].x, _477);
    float _485 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].y, _479);
    float _487 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[109].z, _481);
    bool _489 = !_377;
    float _507;
    if (!_489)
    {
        float _491 = in.m_58.x;
        float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _495 = _491 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _499 = _497 * _493;
        float _501 = floor(_499);
        float _503 = -_501;
        float _505 = _499 + _503;
        _507 = _505;
        _509 = true;
    }
    else
    {
        float _511 = float(_111);
        float _513 = 1.0 / _511;
        float _515 = _143 * _513;
        _507 = _515;
    }
    _509 = false;
    float _517 = _507;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _517 + _519;
    float _523 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _533 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _535 = isnan(_517);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_517);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _527;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _563;
    float _567 = -_543;
    float _569 = _567 + 1.0;
    bool _571 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _573 = isnan(_517);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _587 = 1.0 / _531;
    float _589 = 1.0 / _547;
    float _591 = _565 * _561;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _597 = _559 * _569;
    float _599 = -_559;
    float _601 = _599 + 1.0;
    float _603 = fma(_591, _521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _605;
    float _609 = _581 * _601;
    float _611 = _595 * _587;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _517 + _613;
    bool _617 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _619 = isnan(_517);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _603 * _609;
    float _631 = -_581;
    float _633 = _631 + 1.0;
    float _635 = fma(_611, _615, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _639 = _517 + _637;
    float _641 = _607 * _589;
    float _643 = -_627;
    float _645 = _643 + 1.0;
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _629);
    float _649 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_641, _639, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _653 = _543 * _645;
    float _655 = fma(_635, _597, _647);
    float _657 = fma(_651, _653, _655);
    float _659 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _661 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[118].x, _657);
    float _663 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _661 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _663;
    out.m_62.y = _649;
    out.m_62.z = _665;
    out.m_62.w = _667;
    bool _669 = !_585;
    float _687;
    if (!_669)
    {
        float _671 = in.m_58.x;
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _675 = _671 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        float _691 = float(_111);
        float _693 = 1.0 / _691;
        float _695 = _143 * _693;
        _687 = _695;
    }
    _689 = false;
    float _697 = _687;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = _697 + _699;
    bool _703 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _705 = isnan(_697);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _715;
    bool _719 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _721 = isnan(_697);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = 1.0 / _717;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _733;
    bool _737 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _739;
    float _743 = _701 * _731;
    float _745 = -_713;
    float _747 = _745 + 1.0;
    float _749 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _751 = fma(_741, _743, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _753;
    float _757 = _729 * _747;
    float _759 = -_729;
    float _761 = _759 + 1.0;
    float _763 = fma(_755, _743, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _765 = _749 * _757;
    float _767 = _763 * _757;
    float _769 = _751 * _757;
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].x, _765);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].y, _767);
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[123].z, _769);
    float _777 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].x, _771);
    float _779 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].y, _773);
    float _781 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[124].z, _775);
    bool _783 = !_737;
    float _801;
    if (!_783)
    {
        float _785 = in.m_58.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        float _805 = float(_111);
        float _807 = 1.0 / _805;
        float _809 = _143 * _807;
        _801 = _809;
    }
    _803 = false;
    float _811 = _801;
    float _813 = in.m_58.z;
    float _815 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _817 = log2(_815);
    float _819 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _821 = in.m_58.x;
    float _823 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _827 = _825 != 0;
    float _829 = in.m_58.y;
    float _831 = _817 * _143;
    float _833 = exp2(_831);
    float _835 = _813 * 2.0;
    float _837 = _821 * 2.0;
    float _839 = floor(_835);
    float _841 = _829 * 2.0;
    float _843 = floor(_837);
    float _845 = -_833;
    float _847 = _845 + 1.0;
    bool _849 = _839 > 0.0;
    float _851 = floor(_841);
    bool _853 = _839 >= 0.0;
    bool _855 = isnan(_839);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _839;
    float _865 = _821;
    if (_827)
    {
        _863 = _829;
    }
    float _867 = _863;
    float _869 = _861 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _871 = _829 > 0.5;
    int _873 = ~as_type<int>(_869);
    int _875 = _873 + 1;
    int _877 = _875 + 1;
    float _879 = -_209;
    int _881 = _871 ? as_type<int>(_879) : as_type<int>(_209);
    int _883 = _877;
    float _885 = _869;
    float _887 = _867;
    if (!_849)
    {
        int _889 = ~as_type<int>(_869);
        int _891 = _889 + 1;
        _883 = _891;
    }
    int _893 = _883;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _897 = _895 != 0;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _909 = _907 != 0;
    bool _911 = _813 > 0.5;
    if (_827)
    {
        _885 = _821;
    }
    float _913 = _885;
    bool _915 = !_905;
    float _917 = _915 ? _209 : as_type<float>(_881);
    bool _919 = _843 > 0.0;
    float _921 = _913;
    if (!_827)
    {
        _921 = _813;
    }
    float _923 = _921;
    if (!_827)
    {
        _887 = _821;
    }
    float _925 = _887;
    bool _927 = _843 >= 0.0;
    bool _929 = isnan(_843);
    bool _931 = _927 || _929;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    float _937 = _923 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _939 = -_193;
    int _941 = _911 ? as_type<int>(_939) : as_type<int>(_193);
    int _943 = _935 ? 0 : 1;
    bool _945 = !_909;
    float _947 = _945 ? _193 : as_type<float>(_941);
    bool _949 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(0.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    bool _959 = _851 >= 0.0;
    bool _961 = isnan(_851);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    int _969 = ~_943;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    int _975 = _973;
    if (!_919)
    {
        int _977 = ~_943;
        int _979 = _977 + 1;
        _975 = _979;
    }
    int _981 = _975;
    float _983 = _957 ? _847 : 0.0;
    float _985 = _821 + _829;
    int _987 = _967 ? 0 : 1;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _991 = _989 != 0;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _999 = _997 != 0;
    bool _1001 = !_991;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1007 = _851 > 0.0;
    float _1009 = _985 + (-1.0);
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1013 = _925 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1015 = -_1005;
    float _1017 = fma(_937, 2.0, _1015);
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1021 = in.m_64.x;
    float _1023 = in.m_64.y;
    float _1025 = in.m_64.z;
    float _1027 = fma(_1013, -2.0, _1011);
    int _1029 = abs(_1003);
    int _1031 = ~_987;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    int _1037 = _1035;
    if (!_1007)
    {
        int _1039 = ~_987;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1047 = float(_893);
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1051 = 1.0 + _1049;
    float _1053 = float(_1029);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1057 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(1.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = 1.0 / _1051;
    bool _1069 = !_995;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = _1053 * _1047;
    float _1075 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1045);
    float _1077 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1055);
    int _1079 = abs(_1071);
    float _1081 = _821 + (-0.5);
    float _1083 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1075);
    float _1085 = -_143;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1017);
    float _1089 = _1073 * (-2.0);
    float _1091 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1077);
    bool _1093 = !_999;
    int _1095 = _1093 ? 0 : 1;
    float _1097 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1027);
    float _1099 = fma(_1089, _1021, _1021);
    float _1101 = float(_981);
    float _1103 = fma(_1019, _1089, _1019);
    float _1105 = float(_1079);
    float _1107 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1099);
    int _1109 = abs(_1095);
    if (_1065)
    {
        float _1111 = _983 * _1067;
        _145 = _1111;
    }
    float _1113 = _145;
    float _1115 = float(_1043);
    float _1117 = _1105 * _1101;
    float _1119 = _829 + _813;
    float _1121 = fma(_1103, _1113, _1107);
    float _1123 = _1117 * (-2.0);
    float _1125 = float(_1109);
    float _1127 = _1119 + (-1.0);
    float _1129 = _829 + (-0.5);
    float _1131 = _1121 * 0.15915493667125701904296875;
    float _1133 = -_209;
    int _1135 = _911 ? as_type<int>(_1133) : as_type<int>(_209);
    float _1137 = _1125 * _1115;
    float _1139 = fma(_1123, _1023, _1023);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1143 = _821 + _813;
    float _1145 = _1137 * (-2.0);
    float _1147 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1139);
    float _1149 = fma(_1141, _1123, _1141);
    float _1151 = _1143 + (-1.0);
    float _1153 = _813 + (-0.5);
    float _1155 = fma(_1149, _1113, _1147);
    float _1157 = fma(_1145, _1025, _1025);
    float _1159 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1161 = _1131 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1155 * 0.15915493667125701904296875;
    float _1167 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1157);
    float _1169 = fma(_1159, _1145, _1159);
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1173 = in.m_46.x;
    float _1175 = in.m_46.y;
    float _1177 = in.m_46.z;
    bool _1179 = !_901;
    float _1181 = _1179 ? _209 : as_type<float>(_1135);
    float _1183 = fma(_1169, _1113, _1167);
    float _1185 = _1165 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = _819 * _1171;
    float _1191 = _1183 * 0.15915493667125701904296875;
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1195 = _1165 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = _823 * _1193;
    float _1201 = _1131 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = _1163 * _1187;
    float _1207 = _1191 * 6.283185482025146484375;
    float _1209 = cos(_1207);
    float _1211 = _1163 * _1197;
    float _1213 = _1191 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = _1203 * _1187;
    float _1219 = _1203 * _1197;
    float _1221 = _1163 * _1209;
    float _1223 = _1203 * _1209;
    float _1225 = _1197 * _1209;
    float _1227 = _1187 * _1209;
    float _1229 = _1221 * _1199;
    float _1231 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1223 * _1199;
    float _1235 = fma(_1215, _1211, _1217);
    float _1237 = -_1205;
    float _1239 = fma(_1215, _1219, _1237);
    float _1241 = -_1219;
    float _1243 = fma(_1215, _1205, _1241);
    float _1245 = -_1199;
    float _1247 = _1215 * _1245;
    float _1249 = fma(_1235, _1189, _1229);
    float _1251 = fma(_1215, _1217, _1211);
    float _1253 = fma(_1239, _1189, _1233);
    float _1255 = fma(_1225, _1189, _1247);
    float _1257 = fma(_1243, _1231, _1249);
    float _1259 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1261 = fma(_1251, _1231, _1253);
    float _1263 = fma(_1227, _1231, _1255);
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1267 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1259);
    float _1269 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1273 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1265);
    float _1275 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1267);
    float _1277 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1269);
    float _1279 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1271);
    float _1281 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1273);
    float _1283 = _1275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1285 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1277);
    float _1287 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1291 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1297 = _1283 + _1289;
    float _1299 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1291);
    float _1301 = -_193;
    float _1303 = _871 ? _1301 : _193;
    float _1305 = _1293 + _1295;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1309 = _1297 + _1307;
    float _1311 = fma(_1177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1299);
    bool _1313 = !_897;
    float _1315 = _1313 ? _193 : _1303;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1319 = _1305 + _1317;
    float _1321 = _1309 * _1309;
    float _1323 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1325 = fma(_1319, _1319, _1321);
    float _1327 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1329 = sqrt(_1325);
    float _1331 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1327);
    float _1333 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1331);
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = _1323 + _1335;
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = _1311;
    float _1343 = _1303;
    float _1345 = _1177;
    float _1347 = _1325;
    float _1349 = _1309;
    float _1351 = _1337;
    if (!_1339)
    {
        _1341 = _1305;
    }
    float _1353 = _1341;
    float _1355 = _1353;
    if (!_1339)
    {
        _1343 = _1297;
    }
    float _1357 = _1343;
    float _1359 = _1357;
    if (!_1339)
    {
        _1345 = _1337;
    }
    float _1361 = _1345;
    bool _1363 = !_1339;
    float _1365 = _1361;
    if (!_1363)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1371 = _1329 + _1369;
        float _1373 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = rsqrt(_1325);
        float _1377 = _1371 * _1367;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1379 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        float _1389 = fma(_1383, _1373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = _1375 * _1389;
        float _1393 = _1387 + (-1.0);
        float _1395 = fma(_1319, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1309, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1399 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1401 = fma(_1337, _1387, _1399);
        _1365 = _1401;
        _1355 = _1395;
        _1359 = _1397;
        _1347 = _1375;
    }
    float _1403 = _1365;
    float _1405 = _1355;
    float _1407 = _1359;
    float _1409 = _1347;
    float _1411 = -_1323;
    float _1413 = _1411 + _1403;
    float _1415 = -_1293;
    float _1417 = _1415 + _1405;
    float _1419 = -_1283;
    float _1421 = _1419 + _1407;
    float _1423 = _1413 * _1413;
    bool _1425 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1427 = isnan(0.5);
    bool _1429 = _1425 || _1427;
    bool _1431 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1433 = _1429 || _1431;
    float _1435 = fma(_1417, _1417, _1423);
    float _1437 = fma(_1421, _1421, _1435);
    float _1439 = sqrt(_1437);
    bool _1441 = _1439 > 0.0;
    float _1443 = _1409;
    float _1445 = _1439;
    float _1447 = _1437;
    float _1449 = _1407;
    float _1451 = _1405;
    float _1453 = _1403;
    if (!_1441)
    {
        _1443 = _1405;
    }
    float _1455 = _1443;
    float _1457 = _1455;
    float _1459 = _1455;
    if (!_1441)
    {
        _1445 = _1403;
    }
    float _1461 = _1445;
    float _1463 = _1461;
    if (!_1441)
    {
        _1349 = _1407;
    }
    float _1465 = _1349;
    bool _1467 = !_1441;
    float _1469 = _1465;
    if (!_1467)
    {
        float _1471 = _201 * _201;
        float _1473 = fma(_203, _203, _1471);
        float _1475 = fma(_205, _205, _1473);
        float _1477 = rsqrt(_1437);
        float _1479 = sqrt(_1475);
        float _1481 = _1417 * _1477;
        float _1483 = _1413 * _1477;
        float _1485 = _1421 * _1477;
        bool _1487 = _1479 > 0.0;
        float _1489 = _1477;
        float _1491 = _1479;
        _1351 = _1485;
        if (!_1487)
        {
            _1457 = _1405;
        }
        float _1493 = _1457;
        _1459 = _1493;
        if (!_1487)
        {
            _1489 = _1403;
        }
        float _1495 = _1489;
        _1463 = _1495;
        if (!_1487)
        {
            _1491 = _1407;
        }
        float _1497 = _1491;
        bool _1499 = !_1487;
        _1469 = _1497;
        if (!_1499)
        {
            float _1501 = rsqrt(_1475);
            float _1503 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1505 = _201 * _1501;
            float _1507 = _203 * _1501;
            float _1509 = _205 * _1501;
            float _1511 = _1483 * _1505;
            float _1513 = fma(_1481, _1507, _1511);
            float _1515 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1517 = fma(_1485, _1509, _1513);
            float _1519 = _1517 * _1515;
            float _1521 = fma(_203, _1519, _1405);
            float _1523 = fma(_201, _1519, _1403);
            float _1525 = fma(_205, _1519, _1407);
            _1459 = _1521;
            _1463 = _1523;
            _1469 = _1525;
            _1447 = _1503;
        }
    }
    float _1527 = _1459;
    float _1529 = _1463;
    float _1531 = _1469;
    float _1533 = _1447;
    float _1535 = _1351;
    float _1537 = _1531;
    float _1539 = _1535;
    if (_1433)
    {
        _1449 = _1527;
    }
    float _1541 = _1449;
    float _1543 = _1541;
    if (_1433)
    {
        _1451 = _1529;
    }
    float _1545 = _1451;
    float _1547 = _1545;
    if (_1433)
    {
        _1453 = _1531;
    }
    float _1549 = _1453;
    float _1551 = _1549;
    if (!_1433)
    {
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1555 = _1323 + _1553;
        float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1559 = _1293 + _1557;
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1563 = -_1323;
        float _1565 = _1563 + _1529;
        float _1567 = _1555 * _1555;
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1571 = _1283 + _1569;
        float _1573 = -_1283;
        float _1575 = _1573 + _1531;
        float _1577 = fma(_1559, _1559, _1567);
        float _1579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1581 = fma(_1571, _1571, _1577);
        float _1583 = sqrt(_1581);
        float _1585 = _1561 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1587 = precise::min(_1583, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1589 = _1587 * _1579;
        float _1591 = -_1293;
        float _1593 = _1591 + _1527;
        float _1595 = _1585 * _1589;
        float _1597 = fma(_1593, _1595, _1293);
        float _1599 = fma(_1565, _1595, _1323);
        float _1601 = fma(_1575, _1595, _1283);
        _1547 = _1599;
        _1543 = _1597;
        _1551 = _1601;
        _1537 = _1575;
    }
    float _1603 = _1547;
    float _1605 = _1543;
    float _1607 = _1551;
    float _1609 = _1537;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1603 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1605 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1607 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1627 = fma(_1617, _1617, _1623);
    float _1629 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1625);
    float _1631 = fma(_1621, _1621, _1627);
    float _1633 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1629);
    float _1635 = rsqrt(_1631);
    float _1637 = sqrt(_1631);
    float _1639 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1641 = _1617 * _1639;
    float _1643 = _1621 * _1639;
    float _1645 = _1641 * _1641;
    float _1647 = _1643 * _1643;
    float _1649 = _1645 + _1647;
    float _1651 = sqrt(_1649);
    bool _1653 = _1651 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1657 = _1651 + _1655;
    float _1659 = _1609;
    float _1661 = _1649;
    float _1663 = _1657;
    float _1665 = _1613;
    float _1667 = _1641;
    float _1669 = _1643;
    if (_1653)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1671;
    }
    float _1673 = _1659;
    if (_1653)
    {
        float _1675 = rsqrt(_1649);
        _1661 = _1675;
    }
    float _1677 = _1661;
    if (_1653)
    {
        float _1679 = _1657 * _1673;
        _1663 = _1679;
    }
    float _1681 = _1663;
    if (_1653)
    {
        float _1683 = _1681 * 0.15915493667125701904296875;
        _1539 = _1683;
    }
    float _1685 = _1539;
    float _1687 = _1533;
    if (_1653)
    {
        float _1689 = _1685 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1527;
    float _1701 = _1697;
    if (_1653)
    {
        float _1703 = _1685 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        _1699 = _1705;
    }
    float _1707 = _1699;
    float _1709 = -_1639;
    float _1711 = -_1697;
    float _1713 = fma(_1613, _1709, _1711);
    float _1715 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1717 = _1713;
    if (_1653)
    {
        float _1719 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1719;
    }
    float _1721 = _1701;
    float _1723 = _1693;
    float _1725 = _1721;
    if (_1653)
    {
        float _1727 = fma(_1693, _1721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1723 = _1727;
    }
    float _1729 = _1723;
    float _1731 = _1729;
    float _1733 = _1707;
    if (_1653)
    {
        float _1735 = _1707 + (-1.0);
        _1665 = _1735;
    }
    float _1737 = _1665;
    if (_1653)
    {
        float _1739 = _1677 * _1729;
        _1731 = _1739;
    }
    float _1741 = _1731;
    if (_1653)
    {
        float _1743 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1743;
    }
    float _1745 = _1725;
    float _1747 = _1745;
    if (_1653)
    {
        float _1749 = _1641 * _1741;
        _1667 = _1749;
    }
    float _1751 = _1667;
    if (_1653)
    {
        float _1753 = _1643 * _1741;
        _1669 = _1753;
    }
    float _1755 = _1669;
    if (_1653)
    {
        float _1757 = fma(_1713, _1707, _1745);
        _1717 = _1757;
    }
    float _1759 = _1717;
    if (!_1653)
    {
        _1747 = _1645;
    }
    float _1761 = _1747;
    float _1763 = _1761;
    if (_1653)
    {
        float _1765 = _1751 * _1751;
        _1763 = _1765;
    }
    float _1767 = _1763;
    if (!_1653)
    {
        _1733 = _1647;
    }
    float _1769 = _1733;
    float _1771 = _1769;
    if (_1653)
    {
        float _1773 = _1755 * _1755;
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1779 = fma(_1759, _1759, _1767);
    float _1781 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1783 = floor(_1777);
    float _1785 = _1779 + _1775;
    float _1787 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1781);
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1791 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1789);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1787);
    float _1799 = -_1793;
    float _1801 = _1799 + 1.0;
    float _1803 = rsqrt(_1785);
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1807 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1809 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1795);
    float _1811 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1813 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1809);
    float _1815 = abs(_1801);
    float _1817 = log2(_1815);
    float _1819 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1821 = -_1811;
    float _1823 = fma(_1821, _1805, 1.0);
    float _1825 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1783;
    float _1831 = _1777 + _1829;
    float _1833 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1825);
    float _1835 = _1803 * _1751;
    float _1837 = _1803 * _1759;
    float _1839 = _1803 * _1755;
    float _1841 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = floor(_1819);
    float _1849 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = -_1843;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1859 = -_1839;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1863 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    float _1865 = exp2(_1855);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1861, -0.5, 0.5);
    float _1871 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1863);
    float _1873 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1857);
    float _1875 = fma(_1861, 0.5, 0.5);
    float _1877 = _1837 + 1.0;
    float _1879 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1871);
    float _1881 = log2(_1823);
    float _1883 = -_1847;
    float _1885 = _1819 + _1883;
    float _1887 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1889 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1873);
    float _1891 = fma(_1875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1893 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1887);
    float _1895 = 1.0 / _1879;
    float _1897 = -_1837;
    float _1899 = fma(_1865, _1877, _1897);
    float _1901 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1889);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1893);
    float _1905 = fma(_1875, _1891, -0.212114393711090087890625);
    float _1907 = sqrt(_1869);
    float _1909 = _1881 * 0.693147182464599609375;
    float2 _5780 = float2(_1831, _1885);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5780, float2(0.0), isnan(_5780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5780, float2(0.0), isnan(_5780)), level(0.0)).x;
    float _1913 = fma(_1875, _1905, 1.570728778839111328125);
    float _1915 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1917 = _1901 * _1895;
    float _1919 = _1903 * _1895;
    float _1921 = fma(_1899, 0.5, 0.5);
    float _1923 = fma(_1917, 0.5, 0.5);
    float _1925 = fma(_1919, -0.5, 0.5);
    float _1927 = _1907 * 0.636619746685028076171875;
    float3 _5814 = float3(_1923, _1925, _1915);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5814, float3(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5814, float3(0.0), isnan(_5814)), level(0.0)).x;
    float _1931 = -_1913;
    float _1933 = fma(_1927, _1931, 1.0);
    float3 _5830 = float3(_1923, _1925, _1915);
    float4 _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5830, float3(0.0), isnan(_5830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5830, float3(0.0), isnan(_5830)), level(0.0)).xyzw;
    float _1938 = _1936.x;
    float _1940 = _1936.y;
    float _1942 = _1936.z;
    float _1944 = _1936.w;
    float2 _5846 = float2(_1933, _1921);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5846, float2(0.0), isnan(_5846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5846, float2(0.0), isnan(_5846)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = in.m_58.w;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1960 = _1958 != 0;
    float _1962 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1968 = _1966 != 0;
    float _1970 = -_1091;
    float _1972 = _1970 + 1.0;
    bool _1974 = _821 > 0.5;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1980 = -_1083;
    float _1982 = _1980 + 1.0;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1986 = _1984 != 0;
    float _1988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    float _1994 = -_1315;
    float _1996 = _1994 + 0.5;
    float _1998 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2000 = _779 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2002 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2004 = _1923;
    float _2006 = _1925;
    bool _2008 = _1986;
    float _2010 = _1996;
    float _2012 = _1879;
    float _2014 = _1903;
    if (_1968)
    {
        float _2016 = _821 * 3.1415927410125732421875;
        _865 = _2016;
    }
    float _2018 = _865;
    float _2020 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2022 = 1.0 / _1978;
    float _2024 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2026 = _2018;
    if (_1968)
    {
        float _2028 = _2018 * 0.15915493667125701904296875;
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2020);
    if (_1960)
    {
        float _2034 = _1956 * 3.1415927410125732421875;
        _2004 = _2034;
    }
    float _2036 = _2004;
    bool _2038 = _1956 > 0.5;
    out.m_66.x = _1605;
    out.m_66.y = _1603;
    out.m_66.z = _1607;
    float _2040 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2032);
    bool _2042 = _2038;
    if (_1960)
    {
        float _2044 = _2036 * 0.15915493667125701904296875;
        _2006 = _2044;
    }
    float _2046 = _2006;
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2048;
    float _2052 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2054 = _2030;
    if (_1968)
    {
        float _2056 = _2030 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = in.m_68.x;
    float _2064 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2052);
    float _2066 = _2050 * _2022;
    bool _2068 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2070 = isnan(_811);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    float _2080 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2064);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2084 = _811 + _2082;
    bool _2086 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2088 = isnan(_811);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2094 = _2090 || _2092;
    float _2096 = float(_2094);
    float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2100 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2102 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1962);
    float _2104 = -_2078;
    float _2106 = _2104 + 1.0;
    float _2108 = fma(_2066, _2084, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2110 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2102);
    float _2112 = _2096 * _2106;
    float _2114 = 1.0 / _2100;
    float _2116 = -_193;
    int _2118 = _2038 ? as_type<int>(_2116) : as_type<int>(_193);
    float _2120 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2122 = _2108 * _2112;
    bool _2124 = !_1986;
    float _2126 = _2124 ? _193 : as_type<float>(_2118);
    float _2128 = _2120 + _2100;
    float _2130 = _2046;
    if (_1960)
    {
        float _2132 = _2046 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        _2130 = _2134;
    }
    float _2136 = _2130;
    if (_1968)
    {
        bool _2138 = _2060 > 0.5;
        _2008 = _2138;
    }
    bool _2140 = _2008;
    float _2142 = -_2096;
    float _2144 = _2142 + 1.0;
    float _2146 = -_2126;
    float _2148 = _2146 + 0.5;
    float _2150 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2152 = _2128 * _2114;
    float _2154 = _2152 * 0.5;
    float _2156 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2122);
    float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2160 = _2150 * _1988;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2162);
    float _2166 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2168 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2170 = _917 + 0.5;
    float _2172 = _2154;
    if (_1960)
    {
        bool _2174 = _2136 > 0.5;
        _2042 = _2174;
    }
    bool _2176 = _2042;
    float _2178 = _947 + (-0.5);
    float _2180 = 1.0 / _2164;
    if (!_1960)
    {
        _2172 = _209;
    }
    float _2182 = _2172;
    float _2184 = fma(_2166, _2170, _1087);
    float _2186 = _2182;
    if (_1960)
    {
        float _2188 = -_209;
        float _2190 = _2176 ? _2188 : _209;
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = -_2168;
    float _2196 = -_1097;
    float _2198 = fma(_2194, _2178, _2196);
    float _2200 = -_209;
    int _2202 = _1974 ? as_type<int>(_2200) : as_type<int>(_209);
    float _2204 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2156);
    bool _2206 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2208 = isnan(0.5);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2214 = _2210 || _2212;
    float _2216 = _2192 + 0.5;
    bool _2218 = !_1992;
    float _2220 = _2218 ? _209 : as_type<float>(_2202);
    float _2222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2224 = fma(_947, _1972, _2198);
    float _2226 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2228 = -_1982;
    float _2230 = fma(_917, _2228, _2184);
    float _2232 = _2220 + 0.5;
    float _2234 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2236 = _2226 * _2158;
    float _2238 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2240 = _2180 * _2238;
    float _2242 = _1181 + 0.5;
    float _2244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2246 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2248 = _2242;
    if (!_1968)
    {
        _2010 = _193;
    }
    float _2250 = _2010;
    float _2252 = _2204 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2254 = _2250;
    if (_1968)
    {
        float _2256 = -_193;
        float _2258 = _2140 ? _2256 : _193;
        _2254 = _2258;
    }
    float _2260 = _2254;
    float _2262 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2264 = _2246 * _2222;
    float _2266 = abs(_2240);
    float _2268 = log2(_2266);
    float _2270 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2272 = _2260;
    if (!_2214)
    {
        _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2274 = _2248;
    out.m_70.x = _2230;
    out.m_70.y = _2224;
    float _2276 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2278 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2280 = isnan(_1637);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2286 = _2282 || _2284;
    out.m_72.w = _2160;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2290 = _2234 * _2244;
    float _2292 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2294 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2296 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2300 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2302 = _2268;
    if (_2214)
    {
        _2302 = 1.0;
    }
    float _2304 = _2302;
    float _2306 = _2270 * _2288;
    float _2308 = _2288;
    float _2310 = _2304;
    if (!_2214)
    {
        float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2314 = _2274 + _2312;
        _2308 = _2314;
    }
    float _2316 = _2308;
    float _2318 = -_2260;
    float _2320 = _2318 + 0.5;
    float _2322 = exp2(_2296);
    float _2324 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2326 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2330 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _2264;
    out.m_72.y = _2290;
    out.m_72.z = _2306;
    float _2334 = _2328 * _2298;
    float _2336 = _2324;
    if (!_2214)
    {
        float _2338 = 1.0 / _2316;
        _2272 = _2338;
    }
    float _2340 = _2272;
    if (!_2214)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2344 = _2240 + _2342;
        _2336 = _2344;
    }
    float _2346 = _2336;
    out.m_74.x = _2326;
    out.m_74.y = _2024;
    out.m_74.z = _2332;
    out.m_74.w = _2252;
    bool _2348 = _2240 <= 8000.0;
    bool _2350 = isnan(_2240);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(8000.0);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    out.m_76.x = _2236;
    out.m_76.y = _2334;
    float _2360 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2362 = precise::clamp(_2360, 0.0, 1.0);
    float _2364 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2366 = -_1215;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2330);
    float _2370 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2372 = exp2(_2002);
    float _2374 = -_1215;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2378 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2368);
    float _2380 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2376);
    float _2382 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2384 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2386 = fma(_2262, _2262, 1.0);
    float _2388 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2382);
    float _2390 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2384);
    float _2392 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2394 = fma(_2362, -2.0, 3.0);
    float _2396 = _2362 * _2362;
    float _2398 = rsqrt(_2386);
    float _2400 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2370);
    float _2402 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2294);
    float _2404 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2392);
    float _2406 = _2396 * _2394;
    float _2408 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2390);
    float _2410 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2300);
    float _2412 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2414 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2400);
    float _2416 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2402);
    float _2418 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2404);
    float _2420 = -_2406;
    float _2422 = _2420 + 1.0;
    float _2424 = -_1215;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2428 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2430 = _2262 * _2378;
    float _2432 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2406);
    float _2434 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2426);
    float _2436 = _2262 * _2398;
    float _2438 = fma(_2412, _2428, _2430);
    out.m_78.x = _2428;
    out.m_78.y = _2408;
    out.m_78.z = _2410;
    float _2440 = _2262 * _2380;
    float _2442 = _2358 * _2432;
    float _2444 = -_2372;
    float _2446 = _2444 + 1.0;
    float _2448 = -_2414;
    float _2450 = _2436 * _2448;
    float _2452 = fma(_2412, _2408, _2440);
    float _2454 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2458 = fma(_2398, _2378, _2450);
    float _2460 = -_2416;
    float _2462 = _2436 * _2460;
    float _2464 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2040);
    float _2466 = _1879 * 0.5;
    float _2468 = _2262 * _2434;
    float _2470 = fma(_2398, _2380, _2462);
    float _2472 = _1901 + _1879;
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1903;
    out.gl_Position.z = _2464;
    out.gl_Position.w = _1879;
    float _2474 = fma(_2412, _2410, _2468);
    float _2476 = _2414 + _2438;
    float _2478 = _2416 + _2452;
    float _2480 = _2464 + _1879;
    float _2482 = _2418 + _2474;
    float _2484 = _2472 * 0.5;
    float _2486 = _2480 * 0.5;
    float _2488 = fma(_1903, -0.5, _2466);
    out.m_80.x = _2476;
    out.m_80.y = _2478;
    out.m_80.z = _2482;
    float _2490 = -_2418;
    float _2492 = _2436 * _2490;
    float _2494 = _2464;
    float _2496 = _2458;
    if (!_2214)
    {
        float _2498 = _2346 * _2340;
        float _2500 = precise::clamp(_2498, 0.0, 1.0);
        _2310 = _2500;
    }
    float _2502 = _2310;
    float _2504 = -_2456;
    float _2506 = _2504 + 1.0;
    out.m_82.x = _2484;
    out.m_82.y = _2488;
    out.m_82.z = _2486;
    out.m_82.w = _1879;
    float _2508 = fma(_2398, _2434, _2492);
    float _2510 = _2506;
    if (!_2286)
    {
        _2012 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2012;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2286)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2494;
    out.m_84.x = _2458;
    out.m_84.y = _2470;
    out.m_84.z = _2508;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2286)
    {
        _2014 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2014;
    float _2526 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2528 = _2524;
    float _2530 = _2524;
    if (!_2286)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2532 = _2496;
    float _2534 = -_1911;
    float _2536 = _2534 + 1.0;
    float _2538 = _2536 * _2454;
    float _2540 = precise::clamp(_2538, 0.0, 1.0);
    float _2542 = -_2540;
    float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2546 = _2544 * _2062;
    float _2548 = _2456 * _1929;
    float _2550 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2552 = _1944 * _2548;
    float _2554 = _1944 * _2506;
    out.m_86.x = _2550;
    float _2556 = _2552;
    float _2558 = _2532;
    float _2560 = _2532;
    if (!_2286)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2562 = _2510;
    float _2564 = _1954 * _2548;
    float _2566 = fma(_1950, _2552, _1938);
    float _2568 = fma(_1952, _2552, _1940);
    float _2570 = _2562;
    float _2572 = _2562;
    if (!_2286)
    {
        _2556 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2574 = _2556;
    float _2576 = fma(_1944, _2564, _1942);
    out.m_88.x = _2566;
    out.m_88.y = _2568;
    out.m_88.z = _2576;
    out.m_88.w = _2554;
    bool _2578 = !_2286;
    float _2580 = _2574;
    float _2582 = _2574;
    if (!_2578)
    {
        bool _2584 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2586 = isnan(_1637);
        bool _2588 = _2584 || _2586;
        bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2592 = _2588 || _2590;
        if (!_2592)
        {
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2596 = _1637 + _2594;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2600 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2598;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2606 = 1.0 / _2600;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2624 = _2596 * _2606;
            float _2626 = precise::clamp(_2624, 0.0, 1.0);
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2632 = fma(_2626, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2634 = fma(_2626, _2630, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2636 = fma(_2626, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2638 = fma(_2626, _2614, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2640 = fma(_2626, _2618, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2642 = fma(_2626, _2622, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2516 = _2636;
            _2572 = _2640;
            _2560 = _2632;
            _2530 = _2638;
            _2522 = _2634;
            _2582 = _2642;
            _2644 = true;
        }
        else
        {
            bool _2646 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2648 = isnan(_1637);
            bool _2650 = _2646 || _2648;
            bool _2652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2654 = _2650 || _2652;
            if (!_2654)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2656 = _2558;
            _2560 = _2656;
            if (!_2654)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2658 = _2514;
            _2516 = _2658;
            if (!_2654)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2660 = _2520;
            _2522 = _2660;
            if (!_2654)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2662 = _2528;
            _2530 = _2662;
            if (!_2654)
            {
                _2570 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2664 = _2570;
            _2572 = _2664;
            if (!_2654)
            {
                _2580 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2666 = _2580;
            bool _2668 = !_2654;
            _2582 = _2666;
            if (!_2668)
            {
                bool _2670 = _1637 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2672 = isnan(_1637);
                bool _2674 = _2670 || _2672;
                bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2678 = _2674 || _2676;
                if (!_2678)
                {
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2682 = _1637 + _2680;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2686 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2684;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2692 = 1.0 / _2686;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2710 = _2682 * _2692;
                    float _2712 = precise::clamp(_2710, 0.0, 1.0);
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2718 = fma(_2712, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2720 = fma(_2712, _2716, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2722 = fma(_2712, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2724 = fma(_2712, _2700, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2726 = fma(_2712, _2704, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2728 = fma(_2712, _2708, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2516 = _2722;
                    _2572 = _2726;
                    _2560 = _2718;
                    _2530 = _2724;
                    _2522 = _2720;
                    _2582 = _2728;
                    _2644 = true;
                }
                else
                {
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2572 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2582 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2644 = false;
    float _2730 = _2516;
    float _2732 = _2572;
    float _2734 = _2560;
    float _2736 = _2530;
    float _2738 = _2522;
    float _2740 = _2582;
    float _2742 = _2526 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2744 = fma(_2478, -0.5, 0.5);
    float _2746 = precise::clamp(_2744, 0.0, 1.0);
    float _2748 = -_2730;
    float _2750 = _2748 + _2732;
    float _2752 = -_2734;
    float _2754 = _2752 + _2736;
    out.m_49.x = _2742;
    float _2756 = fma(_2746, _2750, _2730);
    float _2758 = -_2738;
    float _2760 = _2758 + _2740;
    float _2762 = fma(_2746, _2754, _2734);
    float _2764 = _2756 * 0.586610972881317138671875;
    bool _2766 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2768 = fma(_2746, _2760, _2738);
    out.m_90.x = 0.0;
    float _2770 = fma(_2762, 0.298911988735198974609375, _2764);
    bool _2772 = _2502 > 0.0;
    bool _2774 = isnan(_2502);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = fma(_2768, 0.114477999508380889892578125, _2770);
    float _2784 = -_2782;
    float _2786 = _2762 + _2784;
    float _2788 = -_2782;
    float _2790 = _2756 + _2788;
    float _2792 = -_2782;
    float _2794 = _2768 + _2792;
    float _2796 = fma(_2786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2800 = fma(_2794, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    bool _2802 = !_2766;
    if (!_2802)
    {
        float _2804 = -_1603;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2808 = -_1605;
        float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2812 = -_1607;
        float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2816 = _2806 * _2806;
        float _2818 = fma(_2810, _2810, _2816);
        float _2820 = fma(_2814, _2814, _2818);
        float _2822 = sqrt(_2820);
        float _2824 = rsqrt(_2820);
        float _2826 = -_2822;
        float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2832 = precise::clamp(_2830, 0.0, 1.0);
        float _2834 = _2810 * _2824;
        float _2836 = _2806 * _2824;
        float _2838 = abs(_2832);
        float _2840 = log2(_2838);
        float _2842 = _2814 * _2824;
        float _2844 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2846 = _2478 * _2836;
        float _2848 = -_2836;
        float _2850 = -_2844;
        float _2852 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2850);
        float _2854 = fma(_2476, _2834, _2846);
        float _2856 = -_2842;
        float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2852);
        float _2860 = fma(_2482, _2842, _2854);
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2866 = _2858 + _2864;
        float _2868 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2870 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = exp2(_2868);
        float _2876 = _2874 * _2872;
        float _2878 = _2862 * _2876;
        float _2880 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2880;
        out.m_90.y = _2882;
        out.m_90.z = _2884;
    }
    out.m_92.x = _2796;
    out.m_92.y = _2798;
    out.m_92.z = _2800;
    if (_2780)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2886;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

