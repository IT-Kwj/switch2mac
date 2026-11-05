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
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_58 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3573 = false;
    bool _2748 = false;
    bool _989 = false;
    bool _819 = false;
    bool _599 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3858 = as_type<float>(_125);
        out.gl_Position.z = _3858;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_109);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _119;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3926 = as_type<float>(_161);
        out.gl_Position.z = _3926;
    }
    if (_155)
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
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    float _193 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _199 = !_173;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _209 = _205;
    float _227;
    if (!_207)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    bool _247 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _249 = isnan(_237);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _237 + _271;
    float _275 = 1.0 / _265;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _261;
    float _281 = 1.0 / _269;
    float _283 = _273 * _275;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _241 * _279;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_257;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = _245 * _281;
    bool _323 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_237);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _333 * _337;
    float _353 = -_333;
    float _355 = _353 + 1.0;
    float _357 = fma(_341, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_319, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _295 * _355;
    float _365 = fma(_349, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_295;
    float _369 = _367 + 1.0;
    float _371 = _357 * _363;
    float _373 = _359 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_381, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_361, _351, _383);
    float _393 = fma(_365, _351, _385);
    float _395 = fma(_387, _315, _391);
    float _397 = fma(_389, _315, _393);
    float _399 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_277;
    float _421;
    if (!_403)
    {
        float _405 = in.m_60.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_109);
        float _427 = 1.0 / _425;
        float _429 = _143 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_62.x;
    float _435 = in.m_62.y;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _431 + _437;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _431 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _467 = isnan(_431);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    bool _477 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _479 = isnan(_431);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = 1.0 / _463;
    float _491 = -_487;
    float _493 = _491 + 1.0;
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _497 = 1.0 / _459;
    float _499 = _475 * _493;
    float _501 = -_475;
    float _503 = _501 + 1.0;
    float _505 = _401 * _435;
    float _507 = _455 * _489;
    float _509 = _399 * _433;
    float _511 = _439 * _497;
    float _513 = -_451;
    float _515 = _513 + 1.0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _517;
    float _521 = _487 * _515;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _527;
    float _531 = fma(_519, _511, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _533 = fma(_525, _511, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _535 = fma(_529, _511, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _537 = _531 * _499;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _543 = _533 * _499;
    float _545 = _535 * _499;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _555 = fma(_541, _507, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _557 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _543);
    float _559 = fma(_549, _507, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _561 = fma(_553, _507, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _563 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _537);
    float _565 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _545);
    float _567 = fma(_559, _521, _557);
    float _569 = fma(_555, _521, _563);
    float _571 = fma(_561, _521, _565);
    float _573 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].x, _567);
    float _575 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].y, _569);
    float _577 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].z, _571);
    bool _579 = !_495;
    float _597;
    if (!_579)
    {
        float _581 = in.m_60.x;
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _585 = _581 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_109);
        float _603 = 1.0 / _601;
        float _605 = _143 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _607 + _609;
    float _613 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_607);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _617;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _645 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _647 = isnan(_607);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _659 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _661 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = 1.0 / _625;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = _621 * _639;
    bool _673 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _675 = isnan(_607);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = 1.0 / _643;
    float _687 = -_637;
    float _689 = _687 + 1.0;
    float _691 = fma(_671, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _697 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _699 = isnan(_607);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_683;
    float _711 = _709 + 1.0;
    float _713 = _683 * _689;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _719 = 1.0 / _695;
    float _721 = -_707;
    float _723 = _721 + 1.0;
    float _725 = _655 * _711;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _727;
    float _731 = _717 * _665;
    float _733 = _637 * _723;
    float _735 = _691 * _725;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _739 = _607 + _737;
    float _741 = -_655;
    float _743 = _741 + 1.0;
    bool _745 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _747 = isnan(_607);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = _729 * _685;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _765 = _607 + _763;
    float _767 = fma(_731, _739, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _769 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[115].x, _735);
    float _771 = -_755;
    float _773 = _771 + 1.0;
    float _775 = _761 * _719;
    float _777 = fma(_757, _765, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _781 = _607 + _779;
    float _783 = fma(_767, _713, _769);
    float _785 = _707 * _773;
    float _787 = fma(_775, _781, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _789 = fma(_777, _733, _783);
    float _791 = fma(_787, _785, _789);
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[119].x, _791);
    float _795 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _661;
    out.m_64.y = _663;
    out.m_64.z = _667;
    out.m_64.w = _795;
    bool _797 = !_669;
    float _799 = _783;
    float _817;
    if (!_797)
    {
        float _801 = in.m_60.x;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _809 = _807 * _803;
        float _811 = floor(_809);
        float _813 = -_811;
        float _815 = _809 + _813;
        _817 = _815;
        _819 = true;
    }
    else
    {
        float _821 = float(_109);
        float _823 = 1.0 / _821;
        float _825 = _143 * _823;
        _817 = _825;
    }
    _819 = false;
    float _827 = _817;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _831 = _827 + _829;
    bool _833 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _835 = isnan(_827);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _827 + _845;
    bool _849 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _851 = isnan(_827);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _869 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _871 = isnan(_827);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_843;
    float _883 = _881 + 1.0;
    float _885 = 1.0 / _867;
    float _887 = _879 * _883;
    float _889 = -_879;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _893;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _899 = 1.0 / _863;
    float _901 = _859 * _891;
    float _903 = -_859;
    float _905 = _903 + 1.0;
    float _907 = _831 * _899;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = fma(_895, _907, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _919 = fma(_911, _907, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _921 = fma(_915, _907, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _923 = _847 * _885;
    float _925 = _917 * _901;
    float _927 = _919 * _901;
    float _929 = _921 * _901;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _943 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].x, _925);
    float _945 = fma(_933, _923, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _947 = fma(_937, _923, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _949 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].y, _927);
    float _951 = fma(_941, _923, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _953 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].z, _929);
    float _955 = fma(_945, _887, _943);
    float _957 = fma(_947, _887, _949);
    float _959 = fma(_951, _887, _953);
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].x, _955);
    float _963 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].y, _957);
    float _965 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].z, _959);
    bool _967 = !_897;
    float _969 = _961;
    float _987;
    if (!_967)
    {
        float _971 = in.m_60.x;
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _975 = _971 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _979 = _977 * _973;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _985;
        _989 = true;
    }
    else
    {
        float _991 = float(_109);
        float _993 = 1.0 / _991;
        float _995 = _143 * _993;
        _987 = _995;
    }
    _989 = false;
    float _997 = _987;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1001 = int(_999);
    float _1003 = float(_109);
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1007 = _1005 != 0;
    float _1009 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1011 = int(_1009);
    bool _1013 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1015 = isnan(_997);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1027 = float(_1001);
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1031 = int(_1029);
    if (_1007)
    {
        float _1033 = in.m_60.x;
        _799 = _1033;
    }
    float _1035 = _799;
    float _1037 = _1035;
    if (!_1007)
    {
        float _1039 = in.m_60.y;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = float(uint(_1011));
    float _1045 = 1.0 / _1027;
    int _1047 = ~_1011;
    int _1049 = _1047 + 1;
    float _1051 = float(_1011);
    bool _1053 = _1011 == 0;
    float _1055 = 1.0 / _1043;
    float _1057 = float(uint(_1031));
    float _1059 = _143 * _1045;
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1063 = int(_1061);
    int _1065 = as_type<int>(_1055) + (-2);
    float _1067 = trunc(_1059);
    int _1069 = int(_1067);
    int _1071 = ~_1011;
    int _1073 = _1071 + 1;
    float _1075 = float(_1063);
    float _1077 = 1.0 / _1057;
    float _1079 = float(uint(_1069));
    float _1081 = 1.0 / _1075;
    float _1083 = as_type<float>(_1065) * _1079;
    float _1085 = trunc(_1083);
    float _1087 = precise::max(_1085, 0.0);
    uint _1090 = uint(_1087);
    int _1092 = as_type<int>(_1077) + (-2);
    float _1094 = _143 * _1081;
    float _1096 = 1.0 / _1003;
    int _1098 = _1073 * int(_1090);
    int _1100 = _1098 + _1069;
    float _1102 = trunc(_1094);
    int _1104 = int(_1102);
    float _1106 = float(uint(_1100));
    float _1108 = in.m_60.x;
    float _1110 = in.m_60.y;
    float _1112 = in.m_60.z;
    float _1114 = in.m_60.w;
    float _1116 = as_type<float>(_1065) * _1106;
    float _1118 = _1106;
    if (_1007)
    {
        _1118 = 1.0;
    }
    float _1120 = _1118;
    float _1122 = _1120;
    if (!_1007)
    {
        _1122 = 7.345489978790283203125;
    }
    float _1124 = _1122;
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = _1124 * _1108;
    int _1134 = int(_1090) + int(_1130);
    float _1136 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1138 = float(_1069);
    float _1140 = floor(_1132);
    float _1142 = _1124;
    float _1144 = _1112;
    if (_1007)
    {
        _1142 = 1.0;
    }
    float _1146 = _1142;
    int _1148 = _1049 * _1134;
    int _1150 = _1148 + _1069;
    float _1152 = _1146;
    if (!_1007)
    {
        _1152 = 1.2345600128173828125;
    }
    float _1154 = _1152;
    float _1156 = fma(_1136, -2.0, _1025);
    bool _1158 = _1138 >= _1051;
    bool _1160 = isnan(_1138);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1051);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    bool _1170 = uint(_1150) >= uint(_1011);
    float _1172 = _1041 * _1154;
    float _1174 = trunc(_1168);
    int _1176 = int(_1174);
    bool _1178 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1180 = isnan(_997);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    bool _1190 = !_1170;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = ~_1134;
    int _1196 = _1194 + _1192;
    int _1198 = _1196 + 1;
    float _1200 = floor(_1172);
    float _1202 = float(uint(_1104));
    float _1204 = -_1140;
    float _1206 = _1132 + _1204;
    int _1208 = _1011 * _1198;
    int _1210 = _1208 + _1069;
    int _1212 = _1011 + (-1);
    float _1214 = as_type<float>(_1092) * _1202;
    int _1216 = ~_1176;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    bool _1222 = !_1053;
    int _1224 = _1222 ? _1210 : (-1);
    float _1226 = trunc(_1214);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    int _1232 = _1224 * _1220;
    float _1234 = -_1200;
    float _1236 = _1172 + _1234;
    int _1238 = ~_1031;
    int _1240 = _1238 + 1;
    int _1242 = _1176 * _1212;
    int _1244 = _1242 + _1232;
    float _1246 = _143 * _1096;
    float _1248 = _1206 * _1051;
    float _1250 = _1246 * _1051;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1262 = _1260 != 0;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1266 = _1264 != 0;
    int _1268 = _1240 * int(_1230);
    int _1270 = _1268 + _1104;
    float _1272 = trunc(_1248);
    int _1274 = int(_1272);
    bool _1276 = !_1258;
    int _1278 = _1276 ? 0 : 1;
    bool _1280 = !_1254;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = float(uint(_1270));
    bool _1286 = !_1266;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = trunc(_1250);
    int _1292 = int(_1290);
    int _1294 = abs(_1278);
    float _1296 = as_type<float>(_1092) * _1284;
    int _1298 = abs(_1288);
    int _1300 = abs(_1282);
    int _1302 = _1244 * _1294;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1306 = _1304 != 0;
    float _1308 = trunc(_1296);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    bool _1314 = !_1262;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = _1274 * _1298;
    int _1320 = _1318 + _1069;
    bool _1322 = !_1306;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = abs(_1316);
    int _1328 = ~_1031;
    int _1330 = _1328 + 1;
    int _1332 = _1292 * _1300;
    int _1334 = _1332 + _1302;
    int _1336 = abs(_1324);
    float _1338 = float(_1031);
    int _1340 = _1320 * _1326;
    int _1342 = _1340 + _1334;
    float _1344 = float(_1104);
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1348 = _1346 != 0;
    int _1350 = _1274 * _1336;
    int _1352 = _1350 + _1342;
    int _1354 = int(_1230) + int(_1312);
    float _1356 = _1236 * _1338;
    float _1358 = float(uint(_1352));
    bool _1360 = _1344 >= _1338;
    bool _1362 = isnan(_1344);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan(_1338);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    int _1372 = _1330 * _1354;
    int _1374 = _1372 + _1104;
    float _1376 = trunc(_1356);
    int _1378 = int(_1376);
    float _1380 = as_type<float>(_1065) * _1358;
    float _1382 = _1246 * _1338;
    int _1384 = _1031 + (-1);
    bool _1386 = uint(_1374) >= uint(_1031);
    bool _1388 = !_1348;
    int _1390 = _1388 ? 0 : 1;
    float _1392 = trunc(_1370);
    int _1394 = int(_1392);
    bool _1396 = !_1386;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1414 = _1412 != 0;
    int _1416 = ~_1354;
    int _1418 = _1416 + _1398;
    int _1420 = _1418 + 1;
    int _1422 = ~_1011;
    int _1424 = _1422 + 1;
    float _1426 = trunc(_1380);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    int _1432 = abs(_1390);
    int _1434 = _1031 * _1420;
    int _1436 = _1434 + _1104;
    bool _1438 = _1031 == 0;
    int _1440 = _1378 * _1432;
    int _1442 = _1440 + _1104;
    bool _1444 = !_1438;
    int _1446 = _1444 ? _1436 : (-1);
    float _1448 = trunc(_1382);
    int _1450 = int(_1448);
    int _1452 = ~_1394;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    bool _1458 = _1011 == 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1462 = _1460 != 0;
    int _1464 = _1446 * _1456;
    bool _1466 = !_1406;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = _1424 * int(_1430);
    int _1472 = _1470 + _1352;
    int _1474 = _1394 * _1384;
    int _1476 = _1474 + _1464;
    bool _1478 = !_1402;
    int _1480 = _1478 ? 0 : 1;
    float _1482 = float(uint(_1472));
    int _1484 = abs(_1468);
    bool _1486 = !_1410;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = as_type<float>(_1065) * _1482;
    int _1492 = abs(_1480);
    bool _1494 = !_1414;
    int _1496 = _1494 ? 0 : 1;
    float _1498 = trunc(_1490);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = abs(_1488);
    int _1506 = _1476 * _1484;
    int _1508 = abs(_1496);
    int _1510 = _1450 * _1492;
    int _1512 = _1510 + _1506;
    float _1514 = float(uint(_1320));
    int _1516 = _1442 * _1504;
    int _1518 = _1516 + _1512;
    float _1520 = float(uint(_1442));
    float _1522 = as_type<float>(_1065) * _1514;
    int _1524 = ~_1011;
    int _1526 = _1524 + 1;
    int _1528 = _1378 * _1508;
    int _1530 = _1528 + _1518;
    int _1532 = 0;
    if (_1462)
    {
        _1532 = 0;
    }
    int _1534 = _1532;
    float _1536 = as_type<float>(_1092) * _1520;
    int _1538 = int(_1430) + int(_1502);
    float _1540 = trunc(_1522);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    float _1546 = float(uint(_1530));
    int _1548 = ~_1031;
    int _1550 = _1548 + 1;
    int _1552 = _1526 * _1538;
    int _1554 = _1552 + _1352;
    int _1556 = _1534;
    if (!_1462)
    {
        _1556 = 1;
    }
    int _1558 = _1556;
    float _1560 = trunc(_1536);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = as_type<float>(_1092) * _1546;
    bool _1568 = _1108 > 0.5;
    bool _1570 = uint(_1554) >= uint(_1011);
    float _1572 = -_201;
    int _1574 = _1568 ? as_type<int>(_1572) : as_type<int>(_201);
    float _1576 = trunc(_1566);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    bool _1582 = !_1570;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = _1526 * int(_1544);
    int _1588 = _1586 + _1320;
    int _1590 = ~_1031;
    int _1592 = _1590 + 1;
    int _1594 = ~_1538;
    int _1596 = _1594 + _1584;
    int _1598 = _1596 + 1;
    float _1600 = float(uint(_1588));
    int _1602 = _1550 * int(_1564);
    int _1604 = _1602 + _1442;
    bool _1606 = _1110 > 0.5;
    int _1608 = _1011 * _1598;
    int _1610 = _1608 + _1352;
    float _1612 = as_type<float>(_1065) * _1600;
    float _1614 = float(uint(_1604));
    bool _1616 = !_1458;
    int _1618 = _1616 ? _1610 : (-1);
    int _1620 = _1592 * int(_1580);
    int _1622 = _1620 + _1530;
    int _1624 = ~_1011;
    int _1626 = _1624 + 1;
    float _1628 = as_type<float>(_1092) * _1614;
    int _1630 = _1618 & 3;
    bool _1632 = _1630 != 0;
    float _1634 = trunc(_1612);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = float(uint(_1622));
    bool _1642 = uint(_1630) > 1u;
    int _1644 = _1618 & 3;
    bool _1646 = _1644 != 0;
    float _1648 = as_type<float>(_1092) * _1640;
    bool _1650 = uint(_1630) >= 2u;
    float _1652 = trunc(_1628);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    int _1658 = _1646 ? 0 : 1;
    bool _1660 = _1114 > 0.5;
    int _1662 = ~_1658;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = trunc(_1648);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    int _1674 = _1666;
    if (!_1642)
    {
        int _1676 = ~_1658;
        int _1678 = _1676 + 1;
        _1674 = _1678;
    }
    int _1680 = _1674;
    bool _1682 = _1630 != 3;
    int _1684 = int(_1544) + int(_1638);
    int _1686 = ~_1031;
    int _1688 = _1686 + 1;
    int _1690 = _1650 ? 0 : 1;
    int _1692 = _1626 * _1684;
    int _1694 = _1692 + _1320;
    int _1696 = int(_1564) + int(_1656);
    int _1698 = int(_1580) + int(_1672);
    int _1700 = ~_1031;
    int _1702 = _1700 + 1;
    int _1704 = ~_1690;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    bool _1710 = uint(_1694) >= uint(_1011);
    int _1712 = _1688 * _1696;
    int _1714 = _1712 + _1442;
    int _1716 = _1708;
    if (_1682)
    {
        int _1718 = ~_1690;
        int _1720 = _1718 + 1;
        _1716 = _1720;
    }
    int _1722 = _1716;
    bool _1724 = !_1710;
    int _1726 = _1724 ? 0 : (-1);
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1730 = _1728 != 0;
    int _1732 = _1702 * _1698;
    int _1734 = _1732 + _1530;
    bool _1736 = uint(_1714) >= uint(_1031);
    bool _1738 = !_1730;
    int _1740 = _1738 ? 0 : 1;
    bool _1742 = !_1736;
    int _1744 = _1742 ? 0 : (-1);
    int _1746 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1748 = _1746 != 0;
    bool _1750 = uint(_1734) >= uint(_1031);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1756 = in.m_48.x;
    float _1758 = in.m_48.y;
    float _1760 = in.m_48.z;
    bool _1762 = !_1748;
    float _1764 = _1762 ? _201 : as_type<float>(_1574);
    float _1766 = 1.0 / _1754;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1770 = _1768 != 0;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1776 = -_205;
    int _1778 = _1606 ? as_type<int>(_1776) : as_type<int>(_205);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1782 = _1112 > 0.5;
    bool _1784 = !_1770;
    float _1786 = _1784 ? _205 : as_type<float>(_1778);
    float _1788 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1790 = 1.0 / _1774;
    bool _1792 = !_1750;
    int _1794 = _1792 ? 0 : (-1);
    float _1796 = -_1780;
    float _1798 = fma(_1788, 2.0, _1796);
    bool _1800 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1802 = isnan(_997);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = -_201;
    int _1814 = _1782 ? as_type<int>(_1812) : as_type<int>(_201);
    float _1816 = -_143;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1822 = _1820 != 0;
    float _1824 = -_1810;
    float _1826 = _1824 + 1.0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1830 = _1828 != 0;
    float _1832 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1836 = _1834 != 0;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1838;
    float _1842 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1844 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1850 = _1840 * _1766;
    float _1852 = _1188 * _1826;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1856 = _997 + _1854;
    float _1858 = -_1188;
    float _1860 = _1858 + 1.0;
    float _1862 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1832);
    float _1864 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1842);
    float _1866 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1844);
    float _1868 = _1848 * _1790;
    bool _1870 = !_1836;
    float _1872 = _1870 ? _201 : as_type<float>(_1814);
    float _1874 = fma(_1850, _1856, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1876 = _1023 * _1860;
    bool _1878 = _1558 != 1;
    float _1880 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1862);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1884 = _997 + _1882;
    float _1886 = _1874 * _1876;
    float _1888 = _1764 + 0.5;
    float _1890 = -_1023;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1864);
    float _1896 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1866);
    float _1898 = fma(_1868, _1884, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1900 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1818);
    float _1902 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1886);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1906 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    float _1908 = _1868;
    float _1910 = _1844;
    if (!_1878)
    {
        _1908 = _1110;
    }
    float _1912 = _1908;
    float _1914 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1904);
    float _1916 = _1912;
    if (!_1878)
    {
        _1910 = _1110;
    }
    float _1918 = _1910;
    float _1920 = _1786 + (-0.5);
    float _1922 = _1918;
    float _1924 = _1920;
    if (_1878)
    {
        _1916 = _1108;
    }
    float _1926 = _1916;
    float _1928 = fma(_1898, _1852, _1902);
    if (_1878)
    {
        _1922 = _1108;
    }
    float _1930 = _1922;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1934 = -_1920;
    float _1936 = -_1906;
    float _1938 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1936);
    int _1940 = ~_1698;
    int _1942 = _1940 + _1794;
    int _1944 = _1942 + 1;
    float _1946 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1932);
    if (!_1878)
    {
        _1924 = _1112;
    }
    float _1948 = _1924;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1952 = _1948;
    if (_1878)
    {
        _1144 = _1110;
    }
    float _1954 = _1144;
    int _1956 = _1031 * _1944;
    int _1958 = _1956 + _1530;
    if (_1878)
    {
        _1952 = _1110;
    }
    float _1960 = _1952;
    float _1962 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1950);
    int _1964 = _1618 >> 31;
    float _1966 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1968 = !_1438;
    int _1970 = _1968 ? _1958 : (-1);
    float _1972 = _1894 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1974 = _1964 & 3;
    float _1976 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1928);
    int _1978 = _1970 >> 31;
    float _1980 = _1880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1982 = _1618 + _1974;
    float _1984 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1914);
    int _1986 = _1978 & 3;
    float _1988 = _1896 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1990 = _1982 >> 2;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1994 = _1980 + _1992;
    int _1996 = _1970 + _1986;
    float _1998 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1946);
    float _2000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2002 = _1988 + _2000;
    bool _2004 = !_1632;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1962);
    int _2010 = _1970 & 3;
    bool _2012 = _2010 != 0;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2016 = _1990 << 4;
    int _2018 = _2016 + 368;
    float _2020 = _1872 + 0.5;
    int _2022 = _1970 & 3;
    bool _2024 = _2022 != 0;
    float _2026 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2014);
    int _2028 = _1996 >> 2;
    float _2030 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2032 = _2012 ? 0 : 1;
    uint _2034 = uint(int(uint(_2018) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    int _2042 = int(_2034) + 1;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    int _2046 = _2042 & 3;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[int(_2044)][_2046];
    bool _2050 = uint(_2022) > 1u;
    float _2052 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2026);
    int _2054 = _2028 << 4;
    int _2056 = _2054 + 512;
    float _2058 = -_1984;
    float _2060 = _2058 + 1.0;
    float _2062 = -_2052;
    float _2064 = _2062 + 1.0;
    uint _2066 = uint(int(uint(_2056) >> uint(2)));
    uint _2068 = uint(int(uint(int(_2066)) >> uint(2)));
    int _2070 = int(_2066) & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    int _2074 = int(_2066) + 1;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    int _2078 = _2074 & 3;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[int(_2076)][_2078];
    int _2082 = ~_2032;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2090 = !_2024;
    int _2092 = _2090 ? 0 : 1;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2096 = _1630 != 3;
    float _2098 = -_2088;
    float _2100 = fma(_1966, 2.0, _2098);
    int _2102 = _2086;
    if (!_2050)
    {
        int _2104 = ~_2032;
        int _2106 = _2104 + 1;
        _2102 = _2106;
    }
    int _2108 = _2102;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2112 = _1972 + _2110;
    int _2114 = _2018 + 8;
    uint _2116 = uint(int(uint(_2114) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = fma(_2030, -2.0, _2094);
    bool _2134 = uint(_2022) >= 2u;
    float _2136 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2138 = -_143;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2100);
    float _2142 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2132);
    int _2144 = _2134 ? 0 : 1;
    float _2146 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2136);
    int _2148 = _2056 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = ~_1684;
    int _2168 = _2166 + _1726;
    int _2170 = _2168 + 1;
    float _2172 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2140);
    float _2174 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2146);
    bool _2176 = !_2096;
    int _2178 = _2176 ? 0 : (-1);
    bool _2180 = _2022 != 3;
    int _2182 = _1011 * _2170;
    int _2184 = _2182 + _1320;
    int _2186 = abs(_1680);
    int _2188 = abs(_2108);
    int _2190 = ~_2144;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    int _2196 = abs(_2006);
    int _2198 = ~_2188;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2194;
    if (_2180)
    {
        int _2206 = ~_2144;
        int _2208 = _2206 + 1;
        _2204 = _2208;
    }
    int _2210 = _2204;
    int _2212 = ~_2186;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = abs(_2092);
    int _2220 = abs(_1722);
    int _2222 = _2216 * as_type<int>(_2048);
    bool _2224 = _2022 != 3;
    int _2226 = _2202 * as_type<int>(_2080);
    int _2228 = ~_2196;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    int _2234 = abs(_2210);
    int _2236 = _2232 * as_type<int>(_2040);
    int _2238 = _2236 + _2222;
    int _2240 = ~_2218;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    int _2246 = ~_2220;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    int _2252 = abs(_2178);
    int _2254 = _2244 * as_type<int>(_2072);
    int _2256 = _2254 + _2226;
    bool _2258 = !_2224;
    int _2260 = _2258 ? 0 : (-1);
    int _2262 = _2250 * as_type<int>(_2122);
    int _2264 = _2262 + _2238;
    int _2266 = ~_2252;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = ~_2234;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = abs(_2260);
    int _2280 = _2270 * as_type<int>(_2130);
    int _2282 = _2280 + _2264;
    bool _2284 = !_1830;
    int _2286 = _2284 ? 0 : 1;
    int _2288 = _2276 * as_type<int>(_2156);
    int _2290 = _2288 + _2256;
    int _2292 = ~_1696;
    int _2294 = _2292 + _1744;
    int _2296 = _2294 + 1;
    float _2298 = -_205;
    int _2300 = _1660 ? as_type<int>(_2298) : as_type<int>(_205);
    int _2302 = abs(_1740);
    int _2304 = abs(_2286);
    int _2306 = ~_2278;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    bool _2312 = !_1822;
    float _2314 = _2312 ? _205 : as_type<float>(_2300);
    int _2316 = _1031 * _2296;
    int _2318 = _2316 + _1442;
    int _2320 = ~_2302;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _2310 * as_type<int>(_2164);
    int _2328 = _2326 + _2290;
    int _2330 = ~_2304;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    float _2336 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2338 = !_1458;
    int _2340 = _2338 ? _2184 : (-1);
    int _2342 = _2282 * _2324;
    bool _2344 = !_1438;
    int _2346 = _2344 ? _2318 : (-1);
    int _2348 = _2328 * _2334;
    bool _2350 = _2174 >= 0.0;
    int _2352 = _2340 * _2302;
    int _2354 = _2352 + _2342;
    float _2356 = _2314 + (-0.5);
    int _2358 = _2346 * _2304;
    int _2360 = _2358 + _2348;
    float _2362 = _2112 * _2112;
    float _2364 = -_1998;
    float _2366 = _2364 + 1.0;
    float _2368 = -_2356;
    float _2370 = -_2142;
    float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2370);
    float _2374 = -_2008;
    float _2376 = _2374 + 1.0;
    float _2378 = fma(_1994, _1994, _2362);
    float _2380 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = fma(_2314, _2064, _2372);
    float _2384 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2386 = fma(_2002, _2002, _2378);
    if (_2350)
    {
        _969 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2388 = _969;
    float _2390 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2392 = -_2060;
    float _2394 = fma(_1764, _2392, _1900);
    float _2396 = rsqrt(_2386);
    float _2398 = fma(_1786, _2366, _1938);
    float _2400 = -_2376;
    float _2402 = fma(_1872, _2400, _2172);
    float _2404 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2410 = as_type<int>(_2388);
    if (_2350)
    {
        float _2412 = _2388 * 5.0;
        _2410 = as_type<int>(_2412);
    }
    int _2414 = _2410;
    float _2416 = float(_2354);
    out.m_66.x = _2394;
    out.m_66.y = _2398;
    out.m_66.z = _2402;
    out.m_66.w = _2382;
    float _2418 = float(_2360);
    out.m_68.x = _2404;
    out.m_68.y = _2406;
    out.m_68.z = _2408;
    out.m_68.w = _2336;
    float _2420 = _2112 * _2396;
    if (_2350)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7330 = as_type<float>(_2414);
        out.gl_Position.z = _7330;
    }
    float _2422 = _1994 * _2396;
    out.m_70.x = _2416;
    out.m_70.y = _2418;
    if (_2350)
    {
        out.m_51.x = 0.0;
    }
    if (_2350)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2424 = -_2420;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _2428 = _2002 * _2396;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1980);
    float _2434 = -_2420;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2112);
    float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2440 = _2426 + _2438;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2432 + _2446;
    float _2450 = -_2422;
    float _2452 = fma(_2450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1994);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2458 = _2444 + _2456;
    float _2460 = _2436 * _2436;
    float _2462 = -_2428;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2002);
    float _2466 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2454);
    float _2468 = fma(_2452, _2452, _2460);
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2466);
    float _2472 = fma(_2464, _2464, _2468);
    bool _2474 = _2470 >= 0.0;
    float _2476 = sqrt(_2472);
    float _2478 = _2470;
    if (_2474)
    {
        _2478 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2480 = _2478;
    int _2482 = as_type<int>(_2480);
    if (_2474)
    {
        out.m_51.x = 0.0;
    }
    float _2484 = _2396 * _2476;
    if (_2474)
    {
        float _2486 = _2480 * 5.0;
        _2482 = as_type<int>(_2486);
    }
    int _2488 = _2482;
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7469 = as_type<float>(_2488);
        out.gl_Position.z = _7469;
    }
    if (_2474)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2490 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2492 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _2496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _2498 = _2484 * _2490;
    float _2500 = _2484 * _2492;
    float _2502 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2504 = _2502 * 0.5;
    float _2506 = _2494 * _2498;
    float _2508 = _2496 * _2500;
    float _2510 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2512 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2514 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2510);
    float _2518 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2512);
    float _2520 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2522 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2516);
    float _2524 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2518);
    float _2526 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    float _2528 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2530 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2532 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2534 = _1980 + _2528;
    float _2536 = _1988 + _2530;
    float _2538 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2540 = _1972 + _2532;
    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2544 = _2534 + _2542;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2548 = _2536 + _2546;
    float _2550 = fma(_2538, _2538, 1.0);
    float _2552 = _2544 * _2544;
    float _2554 = _2548 * _2548;
    float _2556 = rsqrt(_2550);
    float _2558 = _2552 + _2554;
    float _2560 = sqrt(_2558);
    bool _2562 = _2560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2564 = _2532;
    float _2566 = _2526;
    float _2568 = _2552;
    float _2570 = _2534;
    if (!_2562)
    {
        _2564 = _2552;
    }
    float _2572 = _2564;
    float _2574 = _2572;
    if (!_2562)
    {
        _2566 = _2554;
    }
    float _2576 = _2566;
    float _2578 = _2576;
    if (!_2562)
    {
        _209 = _2536;
    }
    float _2580 = _209;
    float _2582 = _2580;
    if (!_2562)
    {
        _2568 = _2540;
    }
    float _2584 = _2568;
    bool _2586 = !_2562;
    float _2588 = _2584;
    if (!_2586)
    {
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2594 = _2560 + _2592;
        float _2596 = rsqrt(_2558);
        float _2598 = _2594 * _2590;
        float _2600 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2602 = _2598 * 0.15915493667125701904296875;
        float _2604 = _2602 * 6.283185482025146484375;
        float _2606 = sin(_2604);
        float _2608 = _2602 * 6.283185482025146484375;
        float _2610 = cos(_2608);
        float _2612 = fma(_2606, _2600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2614 = _2596 * _2612;
        float _2616 = _2610 + (-1.0);
        float _2618 = fma(_2544, _2614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2620 = fma(_2548, _2614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2626 = _2618 + _2624;
        float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2630 = _2620 + _2628;
        float _2632 = fma(_2540, _2610, _2622);
        float _2634 = _2626 * _2626;
        float _2636 = _2630 * _2630;
        _2588 = _2632;
        _2574 = _2634;
        _2578 = _2636;
        _2570 = _2618;
        _2582 = _2620;
    }
    float _2638 = _2588;
    float _2640 = _2574;
    float _2642 = _2578;
    float _2644 = _2570;
    float _2646 = _2582;
    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2650 = _2638 + _2648;
    float _2652 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2654 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2656 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2658 = fma(_2650, _2650, _2640);
    float _2660 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2662 = _2538 * _2556;
    float _2664 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2652);
    float _2666 = _2658 + _2642;
    float _2668 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2660);
    float _2670 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2672 = _2662 * _2670;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2676 = _2662 * _2674;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2680 = _2662 * _2678;
    float _2682 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2654);
    float _2684 = sqrt(_2666);
    float _2686 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2672);
    float _2688 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2676);
    float _2690 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2680);
    float _2692 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2694 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2696 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_72.x = _2686;
    out.m_72.y = _2688;
    out.m_72.z = _2690;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _2698 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2700 = isnan(_2684);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2706 = _2702 || _2704;
    out.m_76.x = _2694;
    out.m_76.y = _2692;
    out.m_76.z = _2696;
    float _2708 = _2682;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    float _2712 = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    if (!_2706)
    {
        _2708 = 1.0;
    }
    float _2714 = _2708;
    bool _2716 = !_2706;
    float _2718 = _2714;
    if (!_2716)
    {
        bool _2720 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2722 = isnan(_2684);
        bool _2724 = _2720 || _2722;
        bool _2726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2728 = _2724 || _2726;
        if (!_2728)
        {
            float _2730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2732 = _2684 + _2730;
            float _2734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2734;
            float _2738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2742 = 1.0 / _2736;
            float _2744 = _2732 * _2742;
            float _2746 = fma(_2744, _2740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2718 = _2746;
            _2748 = true;
        }
        else
        {
            bool _2750 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2752 = isnan(_2684);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2758 = _2754 || _2756;
            if (!_2758)
            {
                float _2760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2762 = _2684 + _2760;
                float _2764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2766 = _2764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2770 = _2768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2772 = 1.0 / _2766;
                float _2774 = _2762 * _2772;
                float _2776 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2718 = _2776;
                _2748 = true;
            }
            else
            {
                _2718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2748 = false;
    float _2778 = _2718;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2782 = _2638 + _2780;
    float _2784 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2786 = _2644 + _2784;
    float _2788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2790 = _2646 + _2788;
    float _2792 = fma(_2782, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2794 = fma(_2786, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2796 = fma(_2790, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2798 = -_1972;
    float _2800 = _2798 + _2792;
    float _2802 = -_1980;
    float _2804 = _2802 + _2794;
    float _2806 = -_1988;
    float _2808 = _2806 + _2796;
    float _2810 = _2800 * _2800;
    float _2812 = fma(_2804, _2804, _2810);
    float _2814 = fma(_2808, _2808, _2812);
    float _2816 = sqrt(_2814);
    bool _2818 = _2816 > 0.0;
    bool _2820 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2824 = _2820 || _2822;
    bool _2826 = isnan(0.5);
    bool _2828 = _2824 || _2826;
    float _2830 = _2778;
    float _2832 = _2794;
    if (!_2818)
    {
        _2710 = _2794;
    }
    float _2834 = _2710;
    float _2836 = _2834;
    if (!_2818)
    {
        _2830 = _2792;
    }
    float _2838 = _2830;
    float _2840 = _2838;
    float _2842 = _2838;
    if (!_2818)
    {
        _2712 = _2796;
    }
    float _2844 = _2712;
    bool _2846 = !_2818;
    float _2848 = _2844;
    float _2850 = _2844;
    if (!_2846)
    {
        float _2852 = _195 * _195;
        float _2854 = fma(_193, _193, _2852);
        float _2856 = rsqrt(_2814);
        float _2858 = fma(_197, _197, _2854);
        float _2860 = sqrt(_2858);
        float _2862 = _2804 * _2856;
        float _2864 = _2800 * _2856;
        float _2866 = _2808 * _2856;
        bool _2868 = _2860 > 0.0;
        float _2870 = _2860;
        if (!_2868)
        {
            _2870 = _2794;
        }
        float _2872 = _2870;
        _2836 = _2872;
        if (!_2868)
        {
            _2840 = _2792;
        }
        float _2874 = _2840;
        _2842 = _2874;
        if (!_2868)
        {
            _2848 = _2796;
        }
        float _2876 = _2848;
        bool _2878 = !_2868;
        _2850 = _2876;
        if (!_2878)
        {
            float _2880 = rsqrt(_2858);
            float _2882 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2884 = _195 * _2880;
            float _2886 = _193 * _2880;
            float _2888 = _197 * _2880;
            float _2890 = _2864 * _2884;
            float _2892 = fma(_2862, _2886, _2890);
            float _2894 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2896 = fma(_2866, _2888, _2892);
            float _2898 = _2896 * _2894;
            float _2900 = fma(_193, _2898, _2794);
            float _2902 = fma(_195, _2898, _2792);
            float _2904 = fma(_197, _2898, _2796);
            _2836 = _2900;
            _2842 = _2902;
            _2850 = _2904;
        }
    }
    float _2906 = _2836;
    float _2908 = _2842;
    float _2910 = _2850;
    float _2912 = -_2422;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2916 = -_2420;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    float _2920 = -_2428;
    float _2922 = fma(_2920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2910);
    float _2924 = _2918;
    float _2926 = _2914;
    float _2928 = _2922;
    float _2930 = _2908;
    if (!_2828)
    {
        float _2932 = _2440 * _2440;
        float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2936 = -_1972;
        float _2938 = _2936 + _2908;
        float _2940 = fma(_2448, _2448, _2932);
        float _2942 = fma(_2458, _2458, _2940);
        float _2944 = 1.0 / _2484;
        float _2946 = sqrt(_2942);
        float _2948 = precise::min(_2946, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2950 = _2948 * _2934;
        float _2952 = -_1980;
        float _2954 = _2952 + _2906;
        float _2956 = -_1988;
        float _2958 = _2956 + _2910;
        float _2960 = _2950 * _2944;
        float _2962 = fma(_2954, _2960, _2432);
        float _2964 = fma(_2938, _2960, _2426);
        float _2966 = fma(_2958, _2960, _2444);
        _2924 = _2964;
        _2926 = _2962;
        _2928 = _2966;
    }
    float _2968 = _2924;
    float _2970 = _2926;
    float _2972 = _2928;
    float _2974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2976 = _2968 + _2974;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2980 = _2970 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2984 = _2972 + _2982;
    float _2986 = _2976 * _2976;
    float _2988 = fma(_2980, _2980, _2986);
    float _2990 = fma(_2984, _2984, _2988);
    float _2992 = rsqrt(_2990);
    float _2994 = sqrt(_2990);
    float _2996 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2998 = _2980 * _2996;
    float _3000 = _2984 * _2996;
    float _3002 = _2998 * _2998;
    float _3004 = _3000 * _3000;
    float _3006 = _3002 + _3004;
    float _3008 = sqrt(_3006);
    bool _3010 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3014 = _3008 + _3012;
    float _3016 = _2992;
    float _3018 = _3014;
    float _3020 = _2976;
    float _3022 = _2996;
    float _3024 = _3002;
    if (_3010)
    {
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3016 = _3026;
    }
    float _3028 = _3016;
    if (_3010)
    {
        float _3030 = rsqrt(_3006);
        _2930 = _3030;
    }
    float _3032 = _2930;
    float _3034 = _3032;
    if (_3010)
    {
        float _3036 = _3014 * _3028;
        _3018 = _3036;
    }
    float _3038 = _3018;
    float _3040 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3010)
    {
        float _3042 = _3038 * 0.15915493667125701904296875;
        _2832 = _3042;
    }
    float _3044 = _2832;
    float _3046 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3040);
    float _3048 = _3028;
    if (_3010)
    {
        float _3050 = _3044 * 6.283185482025146484375;
        float _3052 = sin(_3050);
        _3048 = _3052;
    }
    float _3054 = _3048;
    float _3056 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3058 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3046);
    float _3060 = precise::max(0.0, _3056);
    float _3062 = _2984;
    float _3064 = _3060;
    if (_3010)
    {
        float _3066 = _3044 * 6.283185482025146484375;
        float _3068 = cos(_3066);
        _3062 = _3068;
    }
    float _3070 = _3062;
    float _3072 = _3058 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3074 = -_2996;
    float _3076 = -_3060;
    float _3078 = fma(_2976, _3074, _3076);
    float _3080 = _3078;
    if (_3010)
    {
        float _3082 = _3078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3064 = _3082;
    }
    float _3084 = _3064;
    float _3086 = _3084;
    float _3088 = _3054;
    if (_3010)
    {
        float _3090 = fma(_3054, _3084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3086 = _3090;
    }
    float _3092 = _3086;
    float _3094 = _3092;
    if (!_3010)
    {
        _3088 = _3000;
    }
    float _3096 = _3088;
    float _3098 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3100 = _3096;
    if (_3010)
    {
        float _3102 = _3070 + (-1.0);
        _3020 = _3102;
    }
    float _3104 = _3020;
    float _3106 = _3104;
    if (_3010)
    {
        float _3108 = _3032 * _3092;
        _3022 = _3108;
    }
    float _3110 = _3022;
    if (!_3010)
    {
        _3034 = _2998;
    }
    float _3112 = _3034;
    float _3114 = _3112;
    if (_3010)
    {
        float _3116 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3106 = _3116;
    }
    float _3118 = _3106;
    if (_3010)
    {
        float _3120 = _2998 * _3110;
        _3114 = _3120;
    }
    float _3122 = _3114;
    if (_3010)
    {
        float _3124 = _3000 * _3110;
        _3100 = _3124;
    }
    float _3126 = _3100;
    if (!_3010)
    {
        _3094 = _3004;
    }
    float _3128 = _3094;
    float _3130 = _3128;
    if (_3010)
    {
        float _3132 = fma(_3078, _3070, _3118);
        _3080 = _3132;
    }
    float _3134 = _3080;
    if (_3010)
    {
        float _3136 = _3122 * _3122;
        _3024 = _3136;
    }
    float _3138 = _3024;
    if (_3010)
    {
        float _3140 = _3126 * _3126;
        _3130 = _3140;
    }
    float _3142 = _3130;
    float _3144 = floor(_3098);
    float _3146 = fma(_3134, _3134, _3138);
    float _3148 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3150 = _3146 + _3142;
    float _3152 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3148);
    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3156 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3154);
    float _3158 = precise::clamp(_3156, 0.0, 1.0);
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3162 = rsqrt(_3150);
    float _3164 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3152);
    float _3166 = -_3158;
    float _3168 = _3166 + 1.0;
    float _3170 = _3164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3172 = -_3144;
    float _3174 = _3098 + _3172;
    float _3176 = abs(_3168);
    float _3178 = log2(_3176);
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3182 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3184 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3186 = -_3180;
    float _3188 = fma(_3186, _3160, 1.0);
    float _3190 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3192 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3182);
    float _3194 = _3162 * _3134;
    float _3196 = _3162 * _3122;
    float _3198 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3190);
    float _3200 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3192);
    float _3202 = _3162 * _3126;
    float _3204 = floor(_3184);
    float _3206 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3198);
    float _3208 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3210 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3212 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3214 = _3206 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3216 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3218 = -_3210;
    float _3220 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3218);
    float _3222 = log2(_3188);
    float _3224 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3216);
    float _3226 = -_3202;
    float _3228 = fma(_3226, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3220);
    float _3230 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3224);
    float _3232 = fma(_3228, -0.5, 0.5);
    float _3234 = -_3204;
    float _3236 = _3184 + _3234;
    float _3238 = exp2(_3212);
    float _3240 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3230);
    float _3242 = fma(_3228, 0.5, 0.5);
    float _3244 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3246 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3248 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3244);
    float _3250 = 1.0 / _3240;
    float _3252 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3246);
    float _3254 = fma(_3242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3256 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3248);
    float _3258 = _3222 * 0.693147182464599609375;
    float _3260 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3252);
    float _3262 = fma(_3242, _3254, -0.212114393711090087890625);
    float _3264 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3256);
    float _3266 = sqrt(_3232);
    float _3268 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3260);
    float2 _8794 = float2(_3236, _3174);
    float _3270 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8794, float2(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8794, float2(0.0), isnan(_8794)), level(0.0)).x;
    float _3272 = fma(_3242, _3262, 1.570728778839111328125);
    float _3274 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3276 = _3264 * _3250;
    float _3278 = _3194 + 1.0;
    float _3280 = -_3194;
    float _3282 = fma(_3238, _3278, _3280);
    float _3284 = _3268 * _3250;
    float _3286 = fma(_3276, 0.5, 0.5);
    float _3288 = _3266 * 0.636619746685028076171875;
    float _3290 = fma(_3282, 0.5, 0.5);
    float _3292 = fma(_3284, -0.5, 0.5);
    float _3294 = -_3272;
    float _3296 = fma(_3288, _3294, 1.0);
    float3 _8841 = float3(_3286, _3292, _3274);
    float _3298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8841, float3(0.0), isnan(_8841)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8841, float3(0.0), isnan(_8841)), level(0.0)).x;
    float3 _8852 = float3(_3286, _3292, _3274);
    float4 _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8852, float3(0.0), isnan(_8852)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8852, float3(0.0), isnan(_8852)), level(0.0)).xyzw;
    float _3303 = _3301.x;
    float _3305 = _3301.y;
    float _3307 = _3301.z;
    float _3309 = _3301.w;
    float2 _8868 = float2(_3296, _3290);
    float3 _3313 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8868, float2(0.0), isnan(_8868)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8868, float2(0.0), isnan(_8868)), level(0.0)).xyz;
    float _3315 = _3313.x;
    float _3317 = _3313.y;
    float _3319 = _3313.z;
    float _3321 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3323 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_78.x = _2970;
    out.m_78.y = _2968;
    out.m_78.z = _2972;
    bool _3325 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3327 = isnan(_2994);
    bool _3329 = _3325 || _3327;
    bool _3331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3333 = _3329 || _3331;
    float _3335 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3321);
    float _3337 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3323);
    float _3339 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3335);
    float _3341 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3337);
    float _3343 = _3339 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3345 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3347 = 1.0 / _3343;
    float _3349 = _3345 + _3343;
    float _3351 = _3349 * _3347;
    float _3353 = _3351 * 0.5;
    float _3355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3357 = fma(_3353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3355);
    float _3359 = 1.0 / _3357;
    float _3361 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3365 = _3359 * _3363;
    float _3367 = abs(_3365);
    float _3369 = log2(_3367);
    bool _3371 = _3365 <= 8000.0;
    bool _3373 = isnan(_3365);
    bool _3375 = _3371 || _3373;
    bool _3377 = isnan(8000.0);
    bool _3379 = _3375 || _3377;
    float _3381 = float(_3379);
    float _3383 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3385 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3387 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3385);
    float _3389 = exp2(_3383);
    float _3391 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3387);
    float _3393 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3391);
    out.gl_Position.x = _3264;
    out.gl_Position.y = _3268;
    out.gl_Position.z = _3393;
    out.gl_Position.w = _3240;
    float _3395 = fma(_3389, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = exp2(_3361);
    float _3401 = fma(_3397, -2.0, 3.0);
    float _3403 = _3397 * _3397;
    float _3405 = _3403 * _3401;
    float _3407 = _3268;
    float _3409 = _3393;
    if (!_3333)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3411 = _3407;
    float _3413 = in.m_80.x;
    float _3415 = -_3405;
    float _3417 = _3415 + 1.0;
    float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3405);
    float _3421 = _3393 + _3240;
    float _3423 = -_3399;
    float _3425 = _3423 + 1.0;
    float _3427 = _3411;
    float _3429 = _3411;
    if (!_3333)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3431 = _3409;
    float _3433 = _3381 * _3419;
    float _3435 = _3421 * 0.5;
    float _3437 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3439 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3441 = -_3437;
    float _3443 = _3441 + 1.0;
    out.m_82.z = _3435;
    out.m_82.w = _3240;
    float _3445 = -_3270;
    float _3447 = _3445 + 1.0;
    float _3449 = _3447 * _3439;
    float _3451 = precise::clamp(_3449, 0.0, 1.0);
    float _3453 = -_3451;
    float _3455 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3457 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3459 = _3443;
    float _3461 = _3437;
    float _3463 = _3303;
    float _3465 = _3431;
    float _3467 = _3431;
    if (!_3333)
    {
        _3457 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3469 = _3457;
    float _3471 = _3455 * _3413;
    float _3473 = _3471 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3475 = _3437 * _3298;
    float _3477 = _3309 * _3443;
    out.m_84.x = _3473;
    float _3479 = _3469;
    float _3481 = _3469;
    if (!_3333)
    {
        _3459 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3483 = _3459;
    float _3485 = _3309 * _3475;
    float _3487 = _3319 * _3475;
    float _3489 = _3483;
    float _3491 = _3483;
    if (!_3333)
    {
        _3461 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3493 = _3461;
    float _3495 = fma(_3315, _3485, _3303);
    float _3497 = fma(_3317, _3485, _3305);
    float _3499 = fma(_3309, _3487, _3307);
    float _3501 = _3493;
    float _3503 = _3493;
    if (!_3333)
    {
        _3463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3505 = _3463;
    out.m_86.x = _3495;
    out.m_86.y = _3497;
    out.m_86.z = _3499;
    out.m_86.w = _3477;
    bool _3507 = !_3333;
    float _3509 = _3505;
    float _3511 = _3505;
    if (!_3507)
    {
        bool _3513 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3515 = isnan(_2994);
        bool _3517 = _3513 || _3515;
        bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3521 = _3517 || _3519;
        if (!_3521)
        {
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3525 = _2994 + _3523;
            float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3529 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3527;
            float _3531 = 1.0 / _3529;
            float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3553 = _3525 * _3531;
            float _3555 = precise::clamp(_3553, 0.0, 1.0);
            float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3561 = fma(_3555, _3535, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3563 = fma(_3555, _3559, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3565 = fma(_3555, _3539, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3567 = fma(_3555, _3543, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3569 = fma(_3555, _3547, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3571 = fma(_3555, _3551, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3511 = _3561;
            _3481 = _3569;
            _3429 = _3563;
            _3491 = _3567;
            _3467 = _3565;
            _3503 = _3571;
            _3573 = true;
        }
        else
        {
            bool _3575 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3577 = isnan(_2994);
            bool _3579 = _3575 || _3577;
            bool _3581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3583 = _3579 || _3581;
            if (!_3583)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3585 = _3427;
            _3429 = _3585;
            if (!_3583)
            {
                _3509 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3587 = _3509;
            _3511 = _3587;
            if (!_3583)
            {
                _3465 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3589 = _3465;
            _3467 = _3589;
            if (!_3583)
            {
                _3489 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3591 = _3489;
            _3491 = _3591;
            if (!_3583)
            {
                _3479 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3593 = _3479;
            _3481 = _3593;
            if (!_3583)
            {
                _3501 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3595 = _3501;
            bool _3597 = !_3583;
            _3503 = _3595;
            if (!_3597)
            {
                bool _3599 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3601 = isnan(_2994);
                bool _3603 = _3599 || _3601;
                bool _3605 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3607 = _3603 || _3605;
                if (!_3607)
                {
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3611 = _2994 + _3609;
                    float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3615 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3613;
                    float _3617 = 1.0 / _3615;
                    float _3619 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3621 = _3619 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3629 = _3627 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3639 = _3611 * _3617;
                    float _3641 = precise::clamp(_3639, 0.0, 1.0);
                    float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3647 = fma(_3641, _3621, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3649 = fma(_3641, _3645, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3651 = fma(_3641, _3625, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3653 = fma(_3641, _3629, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3655 = fma(_3641, _3633, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3657 = fma(_3641, _3637, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3511 = _3647;
                    _3481 = _3655;
                    _3429 = _3649;
                    _3491 = _3653;
                    _3467 = _3651;
                    _3503 = _3657;
                    _3573 = true;
                }
                else
                {
                    _3511 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3481 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3491 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3467 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3503 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3573 = false;
    float _3659 = _3511;
    float _3661 = _3481;
    float _3663 = _3429;
    float _3665 = _3491;
    float _3667 = _3467;
    float _3669 = _3503;
    float _3671 = fma(_2692, -0.5, 0.5);
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = -_3659;
    float _3677 = _3675 + _3661;
    float _3679 = -_3663;
    float _3681 = _3679 + _3665;
    float _3683 = -_3667;
    float _3685 = _3683 + _3669;
    bool _3687 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3689 = fma(_3673, _3677, _3659);
    float _3691 = fma(_3673, _3681, _3663);
    float _3693 = fma(_3673, _3685, _3667);
    float _3695 = _3689 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _3697 = fma(_3691, 0.298911988735198974609375, _3695);
    float _3699 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3701 = fma(_3693, 0.114477999508380889892578125, _3697);
    out.m_51.x = _3699;
    float _3703 = -_3701;
    float _3705 = _3691 + _3703;
    float _3707 = -_3701;
    float _3709 = _3689 + _3707;
    float _3711 = -_3701;
    float _3713 = _3693 + _3711;
    float _3715 = fma(_3705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    float _3717 = fma(_3709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    float _3719 = fma(_3713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    out.m_90.x = _3715;
    out.m_90.y = _3717;
    out.m_90.z = _3719;
    if (!_3687)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3721 = -_2968;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3725 = -_2970;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3729 = -_2972;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3733 = _3723 * _3723;
    float _3735 = fma(_3727, _3727, _3733);
    float _3737 = fma(_3731, _3731, _3735);
    float _3739 = sqrt(_3737);
    float _3741 = rsqrt(_3737);
    float _3743 = -_3739;
    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3747 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3749 = precise::clamp(_3747, 0.0, 1.0);
    float _3751 = _3727 * _3741;
    float _3753 = _3723 * _3741;
    float _3755 = abs(_3749);
    float _3757 = log2(_3755);
    float _3759 = _3731 * _3741;
    float _3761 = _3751 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3763 = _2692 * _3753;
    float _3765 = -_3753;
    float _3767 = -_3761;
    float _3769 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3767);
    float _3771 = fma(_2694, _3751, _3763);
    float _3773 = -_3759;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3769);
    float _3777 = fma(_2696, _3759, _3771);
    float _3779 = precise::clamp(_3777, 0.0, 1.0);
    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3783 = _3775 + _3781;
    float _3785 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3787 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3789 = precise::clamp(_3787, 0.0, 1.0);
    float _3791 = exp2(_3785);
    float _3793 = _3791 * _3789;
    float _3795 = _3779 * _3793;
    float _3797 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3799 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3801 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3797;
    out.m_88.y = _3799;
    out.m_88.z = _3801;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3573 = false;
    bool _2748 = false;
    bool _989 = false;
    bool _819 = false;
    bool _599 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3858 = as_type<float>(_125);
        out.gl_Position.z = _3858;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_109);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _119;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3926 = as_type<float>(_161);
        out.gl_Position.z = _3926;
    }
    if (_155)
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
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    float _193 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _199 = !_173;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _209 = _205;
    float _227;
    if (!_207)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    bool _247 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _249 = isnan(_237);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _237 + _271;
    float _275 = 1.0 / _265;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _261;
    float _281 = 1.0 / _269;
    float _283 = _273 * _275;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _241 * _279;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_257;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = _245 * _281;
    bool _323 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_237);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _333 * _337;
    float _353 = -_333;
    float _355 = _353 + 1.0;
    float _357 = fma(_341, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_319, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _295 * _355;
    float _365 = fma(_349, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_295;
    float _369 = _367 + 1.0;
    float _371 = _357 * _363;
    float _373 = _359 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_381, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_361, _351, _383);
    float _393 = fma(_365, _351, _385);
    float _395 = fma(_387, _315, _391);
    float _397 = fma(_389, _315, _393);
    float _399 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_277;
    float _421;
    if (!_403)
    {
        float _405 = in.m_60.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_109);
        float _427 = 1.0 / _425;
        float _429 = _143 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_62.x;
    float _435 = in.m_62.y;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _431 + _437;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _431 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _467 = isnan(_431);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    bool _477 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _479 = isnan(_431);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = 1.0 / _463;
    float _491 = -_487;
    float _493 = _491 + 1.0;
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _497 = 1.0 / _459;
    float _499 = _475 * _493;
    float _501 = -_475;
    float _503 = _501 + 1.0;
    float _505 = _401 * _435;
    float _507 = _455 * _489;
    float _509 = _399 * _433;
    float _511 = _439 * _497;
    float _513 = -_451;
    float _515 = _513 + 1.0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _517;
    float _521 = _487 * _515;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _527;
    float _531 = fma(_519, _511, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _533 = fma(_525, _511, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _535 = fma(_529, _511, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _537 = _531 * _499;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _543 = _533 * _499;
    float _545 = _535 * _499;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _555 = fma(_541, _507, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _557 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _543);
    float _559 = fma(_549, _507, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _561 = fma(_553, _507, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _563 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _537);
    float _565 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _545);
    float _567 = fma(_559, _521, _557);
    float _569 = fma(_555, _521, _563);
    float _571 = fma(_561, _521, _565);
    float _573 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].x, _567);
    float _575 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].y, _569);
    float _577 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].z, _571);
    bool _579 = !_495;
    float _597;
    if (!_579)
    {
        float _581 = in.m_60.x;
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _585 = _581 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_109);
        float _603 = 1.0 / _601;
        float _605 = _143 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _607 + _609;
    float _613 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_607);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _617;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _645 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _647 = isnan(_607);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _659 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _661 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = 1.0 / _625;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = _621 * _639;
    bool _673 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _675 = isnan(_607);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = 1.0 / _643;
    float _687 = -_637;
    float _689 = _687 + 1.0;
    float _691 = fma(_671, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _697 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _699 = isnan(_607);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_683;
    float _711 = _709 + 1.0;
    float _713 = _683 * _689;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _719 = 1.0 / _695;
    float _721 = -_707;
    float _723 = _721 + 1.0;
    float _725 = _655 * _711;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _727;
    float _731 = _717 * _665;
    float _733 = _637 * _723;
    float _735 = _691 * _725;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _739 = _607 + _737;
    float _741 = -_655;
    float _743 = _741 + 1.0;
    bool _745 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _747 = isnan(_607);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = _729 * _685;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _765 = _607 + _763;
    float _767 = fma(_731, _739, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _769 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[115].x, _735);
    float _771 = -_755;
    float _773 = _771 + 1.0;
    float _775 = _761 * _719;
    float _777 = fma(_757, _765, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _781 = _607 + _779;
    float _783 = fma(_767, _713, _769);
    float _785 = _707 * _773;
    float _787 = fma(_775, _781, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _789 = fma(_777, _733, _783);
    float _791 = fma(_787, _785, _789);
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[119].x, _791);
    float _795 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _661;
    out.m_64.y = _663;
    out.m_64.z = _667;
    out.m_64.w = _795;
    bool _797 = !_669;
    float _799 = _783;
    float _817;
    if (!_797)
    {
        float _801 = in.m_60.x;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _809 = _807 * _803;
        float _811 = floor(_809);
        float _813 = -_811;
        float _815 = _809 + _813;
        _817 = _815;
        _819 = true;
    }
    else
    {
        float _821 = float(_109);
        float _823 = 1.0 / _821;
        float _825 = _143 * _823;
        _817 = _825;
    }
    _819 = false;
    float _827 = _817;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _831 = _827 + _829;
    bool _833 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _835 = isnan(_827);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _827 + _845;
    bool _849 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _851 = isnan(_827);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _869 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _871 = isnan(_827);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_843;
    float _883 = _881 + 1.0;
    float _885 = 1.0 / _867;
    float _887 = _879 * _883;
    float _889 = -_879;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _893;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _899 = 1.0 / _863;
    float _901 = _859 * _891;
    float _903 = -_859;
    float _905 = _903 + 1.0;
    float _907 = _831 * _899;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = fma(_895, _907, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _919 = fma(_911, _907, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _921 = fma(_915, _907, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _923 = _847 * _885;
    float _925 = _917 * _901;
    float _927 = _919 * _901;
    float _929 = _921 * _901;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _943 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].x, _925);
    float _945 = fma(_933, _923, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _947 = fma(_937, _923, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _949 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].y, _927);
    float _951 = fma(_941, _923, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _953 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].z, _929);
    float _955 = fma(_945, _887, _943);
    float _957 = fma(_947, _887, _949);
    float _959 = fma(_951, _887, _953);
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].x, _955);
    float _963 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].y, _957);
    float _965 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].z, _959);
    bool _967 = !_897;
    float _969 = _961;
    float _987;
    if (!_967)
    {
        float _971 = in.m_60.x;
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _975 = _971 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _979 = _977 * _973;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _985;
        _989 = true;
    }
    else
    {
        float _991 = float(_109);
        float _993 = 1.0 / _991;
        float _995 = _143 * _993;
        _987 = _995;
    }
    _989 = false;
    float _997 = _987;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1001 = int(_999);
    float _1003 = float(_109);
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1007 = _1005 != 0;
    float _1009 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1011 = int(_1009);
    bool _1013 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1015 = isnan(_997);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1027 = float(_1001);
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1031 = int(_1029);
    if (_1007)
    {
        float _1033 = in.m_60.x;
        _799 = _1033;
    }
    float _1035 = _799;
    float _1037 = _1035;
    if (!_1007)
    {
        float _1039 = in.m_60.y;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = float(uint(_1011));
    float _1045 = 1.0 / _1027;
    int _1047 = ~_1011;
    int _1049 = _1047 + 1;
    float _1051 = float(_1011);
    bool _1053 = _1011 == 0;
    float _1055 = 1.0 / _1043;
    float _1057 = float(uint(_1031));
    float _1059 = _143 * _1045;
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1063 = int(_1061);
    int _1065 = as_type<int>(_1055) + (-2);
    float _1067 = trunc(_1059);
    int _1069 = int(_1067);
    int _1071 = ~_1011;
    int _1073 = _1071 + 1;
    float _1075 = float(_1063);
    float _1077 = 1.0 / _1057;
    float _1079 = float(uint(_1069));
    float _1081 = 1.0 / _1075;
    float _1083 = as_type<float>(_1065) * _1079;
    float _1085 = trunc(_1083);
    float _1087 = precise::max(_1085, 0.0);
    uint _1090 = uint(_1087);
    int _1092 = as_type<int>(_1077) + (-2);
    float _1094 = _143 * _1081;
    float _1096 = 1.0 / _1003;
    int _1098 = _1073 * int(_1090);
    int _1100 = _1098 + _1069;
    float _1102 = trunc(_1094);
    int _1104 = int(_1102);
    float _1106 = float(uint(_1100));
    float _1108 = in.m_60.x;
    float _1110 = in.m_60.y;
    float _1112 = in.m_60.z;
    float _1114 = in.m_60.w;
    float _1116 = as_type<float>(_1065) * _1106;
    float _1118 = _1106;
    if (_1007)
    {
        _1118 = 1.0;
    }
    float _1120 = _1118;
    float _1122 = _1120;
    if (!_1007)
    {
        _1122 = 7.345489978790283203125;
    }
    float _1124 = _1122;
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = _1124 * _1108;
    int _1134 = int(_1090) + int(_1130);
    float _1136 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1138 = float(_1069);
    float _1140 = floor(_1132);
    float _1142 = _1124;
    float _1144 = _1112;
    if (_1007)
    {
        _1142 = 1.0;
    }
    float _1146 = _1142;
    int _1148 = _1049 * _1134;
    int _1150 = _1148 + _1069;
    float _1152 = _1146;
    if (!_1007)
    {
        _1152 = 1.2345600128173828125;
    }
    float _1154 = _1152;
    float _1156 = fma(_1136, -2.0, _1025);
    bool _1158 = _1138 >= _1051;
    bool _1160 = isnan(_1138);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1051);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    bool _1170 = uint(_1150) >= uint(_1011);
    float _1172 = _1041 * _1154;
    float _1174 = trunc(_1168);
    int _1176 = int(_1174);
    bool _1178 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1180 = isnan(_997);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    bool _1190 = !_1170;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = ~_1134;
    int _1196 = _1194 + _1192;
    int _1198 = _1196 + 1;
    float _1200 = floor(_1172);
    float _1202 = float(uint(_1104));
    float _1204 = -_1140;
    float _1206 = _1132 + _1204;
    int _1208 = _1011 * _1198;
    int _1210 = _1208 + _1069;
    int _1212 = _1011 + (-1);
    float _1214 = as_type<float>(_1092) * _1202;
    int _1216 = ~_1176;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    bool _1222 = !_1053;
    int _1224 = _1222 ? _1210 : (-1);
    float _1226 = trunc(_1214);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    int _1232 = _1224 * _1220;
    float _1234 = -_1200;
    float _1236 = _1172 + _1234;
    int _1238 = ~_1031;
    int _1240 = _1238 + 1;
    int _1242 = _1176 * _1212;
    int _1244 = _1242 + _1232;
    float _1246 = _143 * _1096;
    float _1248 = _1206 * _1051;
    float _1250 = _1246 * _1051;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1262 = _1260 != 0;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1266 = _1264 != 0;
    int _1268 = _1240 * int(_1230);
    int _1270 = _1268 + _1104;
    float _1272 = trunc(_1248);
    int _1274 = int(_1272);
    bool _1276 = !_1258;
    int _1278 = _1276 ? 0 : 1;
    bool _1280 = !_1254;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = float(uint(_1270));
    bool _1286 = !_1266;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = trunc(_1250);
    int _1292 = int(_1290);
    int _1294 = abs(_1278);
    float _1296 = as_type<float>(_1092) * _1284;
    int _1298 = abs(_1288);
    int _1300 = abs(_1282);
    int _1302 = _1244 * _1294;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1306 = _1304 != 0;
    float _1308 = trunc(_1296);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    bool _1314 = !_1262;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = _1274 * _1298;
    int _1320 = _1318 + _1069;
    bool _1322 = !_1306;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = abs(_1316);
    int _1328 = ~_1031;
    int _1330 = _1328 + 1;
    int _1332 = _1292 * _1300;
    int _1334 = _1332 + _1302;
    int _1336 = abs(_1324);
    float _1338 = float(_1031);
    int _1340 = _1320 * _1326;
    int _1342 = _1340 + _1334;
    float _1344 = float(_1104);
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1348 = _1346 != 0;
    int _1350 = _1274 * _1336;
    int _1352 = _1350 + _1342;
    int _1354 = int(_1230) + int(_1312);
    float _1356 = _1236 * _1338;
    float _1358 = float(uint(_1352));
    bool _1360 = _1344 >= _1338;
    bool _1362 = isnan(_1344);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan(_1338);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    int _1372 = _1330 * _1354;
    int _1374 = _1372 + _1104;
    float _1376 = trunc(_1356);
    int _1378 = int(_1376);
    float _1380 = as_type<float>(_1065) * _1358;
    float _1382 = _1246 * _1338;
    int _1384 = _1031 + (-1);
    bool _1386 = uint(_1374) >= uint(_1031);
    bool _1388 = !_1348;
    int _1390 = _1388 ? 0 : 1;
    float _1392 = trunc(_1370);
    int _1394 = int(_1392);
    bool _1396 = !_1386;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1414 = _1412 != 0;
    int _1416 = ~_1354;
    int _1418 = _1416 + _1398;
    int _1420 = _1418 + 1;
    int _1422 = ~_1011;
    int _1424 = _1422 + 1;
    float _1426 = trunc(_1380);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    int _1432 = abs(_1390);
    int _1434 = _1031 * _1420;
    int _1436 = _1434 + _1104;
    bool _1438 = _1031 == 0;
    int _1440 = _1378 * _1432;
    int _1442 = _1440 + _1104;
    bool _1444 = !_1438;
    int _1446 = _1444 ? _1436 : (-1);
    float _1448 = trunc(_1382);
    int _1450 = int(_1448);
    int _1452 = ~_1394;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    bool _1458 = _1011 == 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1462 = _1460 != 0;
    int _1464 = _1446 * _1456;
    bool _1466 = !_1406;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = _1424 * int(_1430);
    int _1472 = _1470 + _1352;
    int _1474 = _1394 * _1384;
    int _1476 = _1474 + _1464;
    bool _1478 = !_1402;
    int _1480 = _1478 ? 0 : 1;
    float _1482 = float(uint(_1472));
    int _1484 = abs(_1468);
    bool _1486 = !_1410;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = as_type<float>(_1065) * _1482;
    int _1492 = abs(_1480);
    bool _1494 = !_1414;
    int _1496 = _1494 ? 0 : 1;
    float _1498 = trunc(_1490);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = abs(_1488);
    int _1506 = _1476 * _1484;
    int _1508 = abs(_1496);
    int _1510 = _1450 * _1492;
    int _1512 = _1510 + _1506;
    float _1514 = float(uint(_1320));
    int _1516 = _1442 * _1504;
    int _1518 = _1516 + _1512;
    float _1520 = float(uint(_1442));
    float _1522 = as_type<float>(_1065) * _1514;
    int _1524 = ~_1011;
    int _1526 = _1524 + 1;
    int _1528 = _1378 * _1508;
    int _1530 = _1528 + _1518;
    int _1532 = 0;
    if (_1462)
    {
        _1532 = 0;
    }
    int _1534 = _1532;
    float _1536 = as_type<float>(_1092) * _1520;
    int _1538 = int(_1430) + int(_1502);
    float _1540 = trunc(_1522);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    float _1546 = float(uint(_1530));
    int _1548 = ~_1031;
    int _1550 = _1548 + 1;
    int _1552 = _1526 * _1538;
    int _1554 = _1552 + _1352;
    int _1556 = _1534;
    if (!_1462)
    {
        _1556 = 1;
    }
    int _1558 = _1556;
    float _1560 = trunc(_1536);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = as_type<float>(_1092) * _1546;
    bool _1568 = _1108 > 0.5;
    bool _1570 = uint(_1554) >= uint(_1011);
    float _1572 = -_201;
    int _1574 = _1568 ? as_type<int>(_1572) : as_type<int>(_201);
    float _1576 = trunc(_1566);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    bool _1582 = !_1570;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = _1526 * int(_1544);
    int _1588 = _1586 + _1320;
    int _1590 = ~_1031;
    int _1592 = _1590 + 1;
    int _1594 = ~_1538;
    int _1596 = _1594 + _1584;
    int _1598 = _1596 + 1;
    float _1600 = float(uint(_1588));
    int _1602 = _1550 * int(_1564);
    int _1604 = _1602 + _1442;
    bool _1606 = _1110 > 0.5;
    int _1608 = _1011 * _1598;
    int _1610 = _1608 + _1352;
    float _1612 = as_type<float>(_1065) * _1600;
    float _1614 = float(uint(_1604));
    bool _1616 = !_1458;
    int _1618 = _1616 ? _1610 : (-1);
    int _1620 = _1592 * int(_1580);
    int _1622 = _1620 + _1530;
    int _1624 = ~_1011;
    int _1626 = _1624 + 1;
    float _1628 = as_type<float>(_1092) * _1614;
    int _1630 = _1618 & 3;
    bool _1632 = _1630 != 0;
    float _1634 = trunc(_1612);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = float(uint(_1622));
    bool _1642 = uint(_1630) > 1u;
    int _1644 = _1618 & 3;
    bool _1646 = _1644 != 0;
    float _1648 = as_type<float>(_1092) * _1640;
    bool _1650 = uint(_1630) >= 2u;
    float _1652 = trunc(_1628);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    int _1658 = _1646 ? 0 : 1;
    bool _1660 = _1114 > 0.5;
    int _1662 = ~_1658;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = trunc(_1648);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    int _1674 = _1666;
    if (!_1642)
    {
        int _1676 = ~_1658;
        int _1678 = _1676 + 1;
        _1674 = _1678;
    }
    int _1680 = _1674;
    bool _1682 = _1630 != 3;
    int _1684 = int(_1544) + int(_1638);
    int _1686 = ~_1031;
    int _1688 = _1686 + 1;
    int _1690 = _1650 ? 0 : 1;
    int _1692 = _1626 * _1684;
    int _1694 = _1692 + _1320;
    int _1696 = int(_1564) + int(_1656);
    int _1698 = int(_1580) + int(_1672);
    int _1700 = ~_1031;
    int _1702 = _1700 + 1;
    int _1704 = ~_1690;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    bool _1710 = uint(_1694) >= uint(_1011);
    int _1712 = _1688 * _1696;
    int _1714 = _1712 + _1442;
    int _1716 = _1708;
    if (_1682)
    {
        int _1718 = ~_1690;
        int _1720 = _1718 + 1;
        _1716 = _1720;
    }
    int _1722 = _1716;
    bool _1724 = !_1710;
    int _1726 = _1724 ? 0 : (-1);
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1730 = _1728 != 0;
    int _1732 = _1702 * _1698;
    int _1734 = _1732 + _1530;
    bool _1736 = uint(_1714) >= uint(_1031);
    bool _1738 = !_1730;
    int _1740 = _1738 ? 0 : 1;
    bool _1742 = !_1736;
    int _1744 = _1742 ? 0 : (-1);
    int _1746 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1748 = _1746 != 0;
    bool _1750 = uint(_1734) >= uint(_1031);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1756 = in.m_48.x;
    float _1758 = in.m_48.y;
    float _1760 = in.m_48.z;
    bool _1762 = !_1748;
    float _1764 = _1762 ? _201 : as_type<float>(_1574);
    float _1766 = 1.0 / _1754;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1770 = _1768 != 0;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1776 = -_205;
    int _1778 = _1606 ? as_type<int>(_1776) : as_type<int>(_205);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1782 = _1112 > 0.5;
    bool _1784 = !_1770;
    float _1786 = _1784 ? _205 : as_type<float>(_1778);
    float _1788 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1790 = 1.0 / _1774;
    bool _1792 = !_1750;
    int _1794 = _1792 ? 0 : (-1);
    float _1796 = -_1780;
    float _1798 = fma(_1788, 2.0, _1796);
    bool _1800 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1802 = isnan(_997);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = -_201;
    int _1814 = _1782 ? as_type<int>(_1812) : as_type<int>(_201);
    float _1816 = -_143;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1822 = _1820 != 0;
    float _1824 = -_1810;
    float _1826 = _1824 + 1.0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1830 = _1828 != 0;
    float _1832 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1836 = _1834 != 0;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1838;
    float _1842 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1844 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1850 = _1840 * _1766;
    float _1852 = _1188 * _1826;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1856 = _997 + _1854;
    float _1858 = -_1188;
    float _1860 = _1858 + 1.0;
    float _1862 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1832);
    float _1864 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1842);
    float _1866 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1844);
    float _1868 = _1848 * _1790;
    bool _1870 = !_1836;
    float _1872 = _1870 ? _201 : as_type<float>(_1814);
    float _1874 = fma(_1850, _1856, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1876 = _1023 * _1860;
    bool _1878 = _1558 != 1;
    float _1880 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1862);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1884 = _997 + _1882;
    float _1886 = _1874 * _1876;
    float _1888 = _1764 + 0.5;
    float _1890 = -_1023;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1864);
    float _1896 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1866);
    float _1898 = fma(_1868, _1884, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1900 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1818);
    float _1902 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1886);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1906 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    float _1908 = _1868;
    float _1910 = _1844;
    if (!_1878)
    {
        _1908 = _1110;
    }
    float _1912 = _1908;
    float _1914 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1904);
    float _1916 = _1912;
    if (!_1878)
    {
        _1910 = _1110;
    }
    float _1918 = _1910;
    float _1920 = _1786 + (-0.5);
    float _1922 = _1918;
    float _1924 = _1920;
    if (_1878)
    {
        _1916 = _1108;
    }
    float _1926 = _1916;
    float _1928 = fma(_1898, _1852, _1902);
    if (_1878)
    {
        _1922 = _1108;
    }
    float _1930 = _1922;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1934 = -_1920;
    float _1936 = -_1906;
    float _1938 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1936);
    int _1940 = ~_1698;
    int _1942 = _1940 + _1794;
    int _1944 = _1942 + 1;
    float _1946 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1932);
    if (!_1878)
    {
        _1924 = _1112;
    }
    float _1948 = _1924;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1952 = _1948;
    if (_1878)
    {
        _1144 = _1110;
    }
    float _1954 = _1144;
    int _1956 = _1031 * _1944;
    int _1958 = _1956 + _1530;
    if (_1878)
    {
        _1952 = _1110;
    }
    float _1960 = _1952;
    float _1962 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1950);
    int _1964 = _1618 >> 31;
    float _1966 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1968 = !_1438;
    int _1970 = _1968 ? _1958 : (-1);
    float _1972 = _1894 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1974 = _1964 & 3;
    float _1976 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1928);
    int _1978 = _1970 >> 31;
    float _1980 = _1880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1982 = _1618 + _1974;
    float _1984 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1914);
    int _1986 = _1978 & 3;
    float _1988 = _1896 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1990 = _1982 >> 2;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1994 = _1980 + _1992;
    int _1996 = _1970 + _1986;
    float _1998 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1946);
    float _2000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2002 = _1988 + _2000;
    bool _2004 = !_1632;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1962);
    int _2010 = _1970 & 3;
    bool _2012 = _2010 != 0;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2016 = _1990 << 4;
    int _2018 = _2016 + 368;
    float _2020 = _1872 + 0.5;
    int _2022 = _1970 & 3;
    bool _2024 = _2022 != 0;
    float _2026 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2014);
    int _2028 = _1996 >> 2;
    float _2030 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2032 = _2012 ? 0 : 1;
    uint _2034 = uint(int(uint(_2018) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    int _2042 = int(_2034) + 1;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    int _2046 = _2042 & 3;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[int(_2044)][_2046];
    bool _2050 = uint(_2022) > 1u;
    float _2052 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2026);
    int _2054 = _2028 << 4;
    int _2056 = _2054 + 512;
    float _2058 = -_1984;
    float _2060 = _2058 + 1.0;
    float _2062 = -_2052;
    float _2064 = _2062 + 1.0;
    uint _2066 = uint(int(uint(_2056) >> uint(2)));
    uint _2068 = uint(int(uint(int(_2066)) >> uint(2)));
    int _2070 = int(_2066) & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    int _2074 = int(_2066) + 1;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    int _2078 = _2074 & 3;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[int(_2076)][_2078];
    int _2082 = ~_2032;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2090 = !_2024;
    int _2092 = _2090 ? 0 : 1;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2096 = _1630 != 3;
    float _2098 = -_2088;
    float _2100 = fma(_1966, 2.0, _2098);
    int _2102 = _2086;
    if (!_2050)
    {
        int _2104 = ~_2032;
        int _2106 = _2104 + 1;
        _2102 = _2106;
    }
    int _2108 = _2102;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2112 = _1972 + _2110;
    int _2114 = _2018 + 8;
    uint _2116 = uint(int(uint(_2114) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = fma(_2030, -2.0, _2094);
    bool _2134 = uint(_2022) >= 2u;
    float _2136 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2138 = -_143;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2100);
    float _2142 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2132);
    int _2144 = _2134 ? 0 : 1;
    float _2146 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2136);
    int _2148 = _2056 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = ~_1684;
    int _2168 = _2166 + _1726;
    int _2170 = _2168 + 1;
    float _2172 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2140);
    float _2174 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2146);
    bool _2176 = !_2096;
    int _2178 = _2176 ? 0 : (-1);
    bool _2180 = _2022 != 3;
    int _2182 = _1011 * _2170;
    int _2184 = _2182 + _1320;
    int _2186 = abs(_1680);
    int _2188 = abs(_2108);
    int _2190 = ~_2144;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    int _2196 = abs(_2006);
    int _2198 = ~_2188;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2194;
    if (_2180)
    {
        int _2206 = ~_2144;
        int _2208 = _2206 + 1;
        _2204 = _2208;
    }
    int _2210 = _2204;
    int _2212 = ~_2186;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = abs(_2092);
    int _2220 = abs(_1722);
    int _2222 = _2216 * as_type<int>(_2048);
    bool _2224 = _2022 != 3;
    int _2226 = _2202 * as_type<int>(_2080);
    int _2228 = ~_2196;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    int _2234 = abs(_2210);
    int _2236 = _2232 * as_type<int>(_2040);
    int _2238 = _2236 + _2222;
    int _2240 = ~_2218;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    int _2246 = ~_2220;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    int _2252 = abs(_2178);
    int _2254 = _2244 * as_type<int>(_2072);
    int _2256 = _2254 + _2226;
    bool _2258 = !_2224;
    int _2260 = _2258 ? 0 : (-1);
    int _2262 = _2250 * as_type<int>(_2122);
    int _2264 = _2262 + _2238;
    int _2266 = ~_2252;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = ~_2234;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = abs(_2260);
    int _2280 = _2270 * as_type<int>(_2130);
    int _2282 = _2280 + _2264;
    bool _2284 = !_1830;
    int _2286 = _2284 ? 0 : 1;
    int _2288 = _2276 * as_type<int>(_2156);
    int _2290 = _2288 + _2256;
    int _2292 = ~_1696;
    int _2294 = _2292 + _1744;
    int _2296 = _2294 + 1;
    float _2298 = -_205;
    int _2300 = _1660 ? as_type<int>(_2298) : as_type<int>(_205);
    int _2302 = abs(_1740);
    int _2304 = abs(_2286);
    int _2306 = ~_2278;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    bool _2312 = !_1822;
    float _2314 = _2312 ? _205 : as_type<float>(_2300);
    int _2316 = _1031 * _2296;
    int _2318 = _2316 + _1442;
    int _2320 = ~_2302;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _2310 * as_type<int>(_2164);
    int _2328 = _2326 + _2290;
    int _2330 = ~_2304;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    float _2336 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2338 = !_1458;
    int _2340 = _2338 ? _2184 : (-1);
    int _2342 = _2282 * _2324;
    bool _2344 = !_1438;
    int _2346 = _2344 ? _2318 : (-1);
    int _2348 = _2328 * _2334;
    bool _2350 = _2174 >= 0.0;
    int _2352 = _2340 * _2302;
    int _2354 = _2352 + _2342;
    float _2356 = _2314 + (-0.5);
    int _2358 = _2346 * _2304;
    int _2360 = _2358 + _2348;
    float _2362 = _2112 * _2112;
    float _2364 = -_1998;
    float _2366 = _2364 + 1.0;
    float _2368 = -_2356;
    float _2370 = -_2142;
    float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2370);
    float _2374 = -_2008;
    float _2376 = _2374 + 1.0;
    float _2378 = fma(_1994, _1994, _2362);
    float _2380 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = fma(_2314, _2064, _2372);
    float _2384 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2386 = fma(_2002, _2002, _2378);
    if (_2350)
    {
        _969 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2388 = _969;
    float _2390 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2392 = -_2060;
    float _2394 = fma(_1764, _2392, _1900);
    float _2396 = rsqrt(_2386);
    float _2398 = fma(_1786, _2366, _1938);
    float _2400 = -_2376;
    float _2402 = fma(_1872, _2400, _2172);
    float _2404 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2410 = as_type<int>(_2388);
    if (_2350)
    {
        float _2412 = _2388 * 5.0;
        _2410 = as_type<int>(_2412);
    }
    int _2414 = _2410;
    float _2416 = float(_2354);
    out.m_66.x = _2394;
    out.m_66.y = _2398;
    out.m_66.z = _2402;
    out.m_66.w = _2382;
    float _2418 = float(_2360);
    out.m_68.x = _2404;
    out.m_68.y = _2406;
    out.m_68.z = _2408;
    out.m_68.w = _2336;
    float _2420 = _2112 * _2396;
    if (_2350)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7330 = as_type<float>(_2414);
        out.gl_Position.z = _7330;
    }
    float _2422 = _1994 * _2396;
    out.m_70.x = _2416;
    out.m_70.y = _2418;
    if (_2350)
    {
        out.m_51.x = 0.0;
    }
    if (_2350)
    {
        return out;
    }
    float _2424 = -_2420;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _2428 = _2002 * _2396;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1980);
    float _2434 = -_2420;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2112);
    float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2440 = _2426 + _2438;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2432 + _2446;
    float _2450 = -_2422;
    float _2452 = fma(_2450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1994);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2458 = _2444 + _2456;
    float _2460 = _2436 * _2436;
    float _2462 = -_2428;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2002);
    float _2466 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2454);
    float _2468 = fma(_2452, _2452, _2460);
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2466);
    float _2472 = fma(_2464, _2464, _2468);
    bool _2474 = _2470 >= 0.0;
    float _2476 = sqrt(_2472);
    float _2478 = _2470;
    if (_2474)
    {
        _2478 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2480 = _2478;
    int _2482 = as_type<int>(_2480);
    if (_2474)
    {
        out.m_51.x = 0.0;
    }
    float _2484 = _2396 * _2476;
    if (_2474)
    {
        float _2486 = _2480 * 5.0;
        _2482 = as_type<int>(_2486);
    }
    int _2488 = _2482;
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7469 = as_type<float>(_2488);
        out.gl_Position.z = _7469;
    }
    if (_2474)
    {
        return out;
    }
    float _2490 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2492 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _2496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _2498 = _2484 * _2490;
    float _2500 = _2484 * _2492;
    float _2502 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2504 = _2502 * 0.5;
    float _2506 = _2494 * _2498;
    float _2508 = _2496 * _2500;
    float _2510 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2512 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2514 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2510);
    float _2518 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2512);
    float _2520 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2522 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2516);
    float _2524 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2518);
    float _2526 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    float _2528 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2530 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2532 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2534 = _1980 + _2528;
    float _2536 = _1988 + _2530;
    float _2538 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2540 = _1972 + _2532;
    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2544 = _2534 + _2542;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2548 = _2536 + _2546;
    float _2550 = fma(_2538, _2538, 1.0);
    float _2552 = _2544 * _2544;
    float _2554 = _2548 * _2548;
    float _2556 = rsqrt(_2550);
    float _2558 = _2552 + _2554;
    float _2560 = sqrt(_2558);
    bool _2562 = _2560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2564 = _2532;
    float _2566 = _2526;
    float _2568 = _2552;
    float _2570 = _2534;
    if (!_2562)
    {
        _2564 = _2552;
    }
    float _2572 = _2564;
    float _2574 = _2572;
    if (!_2562)
    {
        _2566 = _2554;
    }
    float _2576 = _2566;
    float _2578 = _2576;
    if (!_2562)
    {
        _209 = _2536;
    }
    float _2580 = _209;
    float _2582 = _2580;
    if (!_2562)
    {
        _2568 = _2540;
    }
    float _2584 = _2568;
    bool _2586 = !_2562;
    float _2588 = _2584;
    if (!_2586)
    {
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2594 = _2560 + _2592;
        float _2596 = rsqrt(_2558);
        float _2598 = _2594 * _2590;
        float _2600 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2602 = _2598 * 0.15915493667125701904296875;
        float _2604 = _2602 * 6.283185482025146484375;
        float _2606 = sin(_2604);
        float _2608 = _2602 * 6.283185482025146484375;
        float _2610 = cos(_2608);
        float _2612 = fma(_2606, _2600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2614 = _2596 * _2612;
        float _2616 = _2610 + (-1.0);
        float _2618 = fma(_2544, _2614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2620 = fma(_2548, _2614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2626 = _2618 + _2624;
        float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2630 = _2620 + _2628;
        float _2632 = fma(_2540, _2610, _2622);
        float _2634 = _2626 * _2626;
        float _2636 = _2630 * _2630;
        _2588 = _2632;
        _2574 = _2634;
        _2578 = _2636;
        _2570 = _2618;
        _2582 = _2620;
    }
    float _2638 = _2588;
    float _2640 = _2574;
    float _2642 = _2578;
    float _2644 = _2570;
    float _2646 = _2582;
    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2650 = _2638 + _2648;
    float _2652 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2654 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2656 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2658 = fma(_2650, _2650, _2640);
    float _2660 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2662 = _2538 * _2556;
    float _2664 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2652);
    float _2666 = _2658 + _2642;
    float _2668 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2660);
    float _2670 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2672 = _2662 * _2670;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2676 = _2662 * _2674;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2680 = _2662 * _2678;
    float _2682 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2654);
    float _2684 = sqrt(_2666);
    float _2686 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2672);
    float _2688 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2676);
    float _2690 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2680);
    float _2692 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2694 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2696 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_72.x = _2686;
    out.m_72.y = _2688;
    out.m_72.z = _2690;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _2698 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2700 = isnan(_2684);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2706 = _2702 || _2704;
    out.m_76.x = _2694;
    out.m_76.y = _2692;
    out.m_76.z = _2696;
    float _2708 = _2682;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    float _2712 = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    if (!_2706)
    {
        _2708 = 1.0;
    }
    float _2714 = _2708;
    bool _2716 = !_2706;
    float _2718 = _2714;
    if (!_2716)
    {
        bool _2720 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2722 = isnan(_2684);
        bool _2724 = _2720 || _2722;
        bool _2726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2728 = _2724 || _2726;
        if (!_2728)
        {
            float _2730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2732 = _2684 + _2730;
            float _2734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2734;
            float _2738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2742 = 1.0 / _2736;
            float _2744 = _2732 * _2742;
            float _2746 = fma(_2744, _2740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2718 = _2746;
            _2748 = true;
        }
        else
        {
            bool _2750 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2752 = isnan(_2684);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2758 = _2754 || _2756;
            if (!_2758)
            {
                float _2760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2762 = _2684 + _2760;
                float _2764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2766 = _2764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2770 = _2768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2772 = 1.0 / _2766;
                float _2774 = _2762 * _2772;
                float _2776 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2718 = _2776;
                _2748 = true;
            }
            else
            {
                _2718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2748 = false;
    float _2778 = _2718;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2782 = _2638 + _2780;
    float _2784 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2786 = _2644 + _2784;
    float _2788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2790 = _2646 + _2788;
    float _2792 = fma(_2782, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2794 = fma(_2786, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2796 = fma(_2790, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2798 = -_1972;
    float _2800 = _2798 + _2792;
    float _2802 = -_1980;
    float _2804 = _2802 + _2794;
    float _2806 = -_1988;
    float _2808 = _2806 + _2796;
    float _2810 = _2800 * _2800;
    float _2812 = fma(_2804, _2804, _2810);
    float _2814 = fma(_2808, _2808, _2812);
    float _2816 = sqrt(_2814);
    bool _2818 = _2816 > 0.0;
    bool _2820 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2824 = _2820 || _2822;
    bool _2826 = isnan(0.5);
    bool _2828 = _2824 || _2826;
    float _2830 = _2778;
    float _2832 = _2794;
    if (!_2818)
    {
        _2710 = _2794;
    }
    float _2834 = _2710;
    float _2836 = _2834;
    if (!_2818)
    {
        _2830 = _2792;
    }
    float _2838 = _2830;
    float _2840 = _2838;
    float _2842 = _2838;
    if (!_2818)
    {
        _2712 = _2796;
    }
    float _2844 = _2712;
    bool _2846 = !_2818;
    float _2848 = _2844;
    float _2850 = _2844;
    if (!_2846)
    {
        float _2852 = _195 * _195;
        float _2854 = fma(_193, _193, _2852);
        float _2856 = rsqrt(_2814);
        float _2858 = fma(_197, _197, _2854);
        float _2860 = sqrt(_2858);
        float _2862 = _2804 * _2856;
        float _2864 = _2800 * _2856;
        float _2866 = _2808 * _2856;
        bool _2868 = _2860 > 0.0;
        float _2870 = _2860;
        if (!_2868)
        {
            _2870 = _2794;
        }
        float _2872 = _2870;
        _2836 = _2872;
        if (!_2868)
        {
            _2840 = _2792;
        }
        float _2874 = _2840;
        _2842 = _2874;
        if (!_2868)
        {
            _2848 = _2796;
        }
        float _2876 = _2848;
        bool _2878 = !_2868;
        _2850 = _2876;
        if (!_2878)
        {
            float _2880 = rsqrt(_2858);
            float _2882 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2884 = _195 * _2880;
            float _2886 = _193 * _2880;
            float _2888 = _197 * _2880;
            float _2890 = _2864 * _2884;
            float _2892 = fma(_2862, _2886, _2890);
            float _2894 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2896 = fma(_2866, _2888, _2892);
            float _2898 = _2896 * _2894;
            float _2900 = fma(_193, _2898, _2794);
            float _2902 = fma(_195, _2898, _2792);
            float _2904 = fma(_197, _2898, _2796);
            _2836 = _2900;
            _2842 = _2902;
            _2850 = _2904;
        }
    }
    float _2906 = _2836;
    float _2908 = _2842;
    float _2910 = _2850;
    float _2912 = -_2422;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2916 = -_2420;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    float _2920 = -_2428;
    float _2922 = fma(_2920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2910);
    float _2924 = _2918;
    float _2926 = _2914;
    float _2928 = _2922;
    float _2930 = _2908;
    if (!_2828)
    {
        float _2932 = _2440 * _2440;
        float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2936 = -_1972;
        float _2938 = _2936 + _2908;
        float _2940 = fma(_2448, _2448, _2932);
        float _2942 = fma(_2458, _2458, _2940);
        float _2944 = 1.0 / _2484;
        float _2946 = sqrt(_2942);
        float _2948 = precise::min(_2946, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2950 = _2948 * _2934;
        float _2952 = -_1980;
        float _2954 = _2952 + _2906;
        float _2956 = -_1988;
        float _2958 = _2956 + _2910;
        float _2960 = _2950 * _2944;
        float _2962 = fma(_2954, _2960, _2432);
        float _2964 = fma(_2938, _2960, _2426);
        float _2966 = fma(_2958, _2960, _2444);
        _2924 = _2964;
        _2926 = _2962;
        _2928 = _2966;
    }
    float _2968 = _2924;
    float _2970 = _2926;
    float _2972 = _2928;
    float _2974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2976 = _2968 + _2974;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2980 = _2970 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2984 = _2972 + _2982;
    float _2986 = _2976 * _2976;
    float _2988 = fma(_2980, _2980, _2986);
    float _2990 = fma(_2984, _2984, _2988);
    float _2992 = rsqrt(_2990);
    float _2994 = sqrt(_2990);
    float _2996 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2998 = _2980 * _2996;
    float _3000 = _2984 * _2996;
    float _3002 = _2998 * _2998;
    float _3004 = _3000 * _3000;
    float _3006 = _3002 + _3004;
    float _3008 = sqrt(_3006);
    bool _3010 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3014 = _3008 + _3012;
    float _3016 = _2992;
    float _3018 = _3014;
    float _3020 = _2976;
    float _3022 = _2996;
    float _3024 = _3002;
    if (_3010)
    {
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3016 = _3026;
    }
    float _3028 = _3016;
    if (_3010)
    {
        float _3030 = rsqrt(_3006);
        _2930 = _3030;
    }
    float _3032 = _2930;
    float _3034 = _3032;
    if (_3010)
    {
        float _3036 = _3014 * _3028;
        _3018 = _3036;
    }
    float _3038 = _3018;
    float _3040 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3010)
    {
        float _3042 = _3038 * 0.15915493667125701904296875;
        _2832 = _3042;
    }
    float _3044 = _2832;
    float _3046 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3040);
    float _3048 = _3028;
    if (_3010)
    {
        float _3050 = _3044 * 6.283185482025146484375;
        float _3052 = sin(_3050);
        _3048 = _3052;
    }
    float _3054 = _3048;
    float _3056 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3058 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3046);
    float _3060 = precise::max(0.0, _3056);
    float _3062 = _2984;
    float _3064 = _3060;
    if (_3010)
    {
        float _3066 = _3044 * 6.283185482025146484375;
        float _3068 = cos(_3066);
        _3062 = _3068;
    }
    float _3070 = _3062;
    float _3072 = _3058 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3074 = -_2996;
    float _3076 = -_3060;
    float _3078 = fma(_2976, _3074, _3076);
    float _3080 = _3078;
    if (_3010)
    {
        float _3082 = _3078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3064 = _3082;
    }
    float _3084 = _3064;
    float _3086 = _3084;
    float _3088 = _3054;
    if (_3010)
    {
        float _3090 = fma(_3054, _3084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3086 = _3090;
    }
    float _3092 = _3086;
    float _3094 = _3092;
    if (!_3010)
    {
        _3088 = _3000;
    }
    float _3096 = _3088;
    float _3098 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3100 = _3096;
    if (_3010)
    {
        float _3102 = _3070 + (-1.0);
        _3020 = _3102;
    }
    float _3104 = _3020;
    float _3106 = _3104;
    if (_3010)
    {
        float _3108 = _3032 * _3092;
        _3022 = _3108;
    }
    float _3110 = _3022;
    if (!_3010)
    {
        _3034 = _2998;
    }
    float _3112 = _3034;
    float _3114 = _3112;
    if (_3010)
    {
        float _3116 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3106 = _3116;
    }
    float _3118 = _3106;
    if (_3010)
    {
        float _3120 = _2998 * _3110;
        _3114 = _3120;
    }
    float _3122 = _3114;
    if (_3010)
    {
        float _3124 = _3000 * _3110;
        _3100 = _3124;
    }
    float _3126 = _3100;
    if (!_3010)
    {
        _3094 = _3004;
    }
    float _3128 = _3094;
    float _3130 = _3128;
    if (_3010)
    {
        float _3132 = fma(_3078, _3070, _3118);
        _3080 = _3132;
    }
    float _3134 = _3080;
    if (_3010)
    {
        float _3136 = _3122 * _3122;
        _3024 = _3136;
    }
    float _3138 = _3024;
    if (_3010)
    {
        float _3140 = _3126 * _3126;
        _3130 = _3140;
    }
    float _3142 = _3130;
    float _3144 = floor(_3098);
    float _3146 = fma(_3134, _3134, _3138);
    float _3148 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3150 = _3146 + _3142;
    float _3152 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3148);
    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3156 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3154);
    float _3158 = precise::clamp(_3156, 0.0, 1.0);
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3162 = rsqrt(_3150);
    float _3164 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3152);
    float _3166 = -_3158;
    float _3168 = _3166 + 1.0;
    float _3170 = _3164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3172 = -_3144;
    float _3174 = _3098 + _3172;
    float _3176 = abs(_3168);
    float _3178 = log2(_3176);
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3182 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3184 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3186 = -_3180;
    float _3188 = fma(_3186, _3160, 1.0);
    float _3190 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3192 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3182);
    float _3194 = _3162 * _3134;
    float _3196 = _3162 * _3122;
    float _3198 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3190);
    float _3200 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3192);
    float _3202 = _3162 * _3126;
    float _3204 = floor(_3184);
    float _3206 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3198);
    float _3208 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3210 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3212 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3214 = _3206 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3216 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3218 = -_3210;
    float _3220 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3218);
    float _3222 = log2(_3188);
    float _3224 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3216);
    float _3226 = -_3202;
    float _3228 = fma(_3226, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3220);
    float _3230 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3224);
    float _3232 = fma(_3228, -0.5, 0.5);
    float _3234 = -_3204;
    float _3236 = _3184 + _3234;
    float _3238 = exp2(_3212);
    float _3240 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3230);
    float _3242 = fma(_3228, 0.5, 0.5);
    float _3244 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3246 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3248 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3244);
    float _3250 = 1.0 / _3240;
    float _3252 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3246);
    float _3254 = fma(_3242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3256 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3248);
    float _3258 = _3222 * 0.693147182464599609375;
    float _3260 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3252);
    float _3262 = fma(_3242, _3254, -0.212114393711090087890625);
    float _3264 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3256);
    float _3266 = sqrt(_3232);
    float _3268 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3260);
    float2 _8794 = float2(_3236, _3174);
    float _3270 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8794, float2(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8794, float2(0.0), isnan(_8794)), level(0.0)).x;
    float _3272 = fma(_3242, _3262, 1.570728778839111328125);
    float _3274 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3276 = _3264 * _3250;
    float _3278 = _3194 + 1.0;
    float _3280 = -_3194;
    float _3282 = fma(_3238, _3278, _3280);
    float _3284 = _3268 * _3250;
    float _3286 = fma(_3276, 0.5, 0.5);
    float _3288 = _3266 * 0.636619746685028076171875;
    float _3290 = fma(_3282, 0.5, 0.5);
    float _3292 = fma(_3284, -0.5, 0.5);
    float _3294 = -_3272;
    float _3296 = fma(_3288, _3294, 1.0);
    float3 _8841 = float3(_3286, _3292, _3274);
    float _3298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8841, float3(0.0), isnan(_8841)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8841, float3(0.0), isnan(_8841)), level(0.0)).x;
    float3 _8852 = float3(_3286, _3292, _3274);
    float4 _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8852, float3(0.0), isnan(_8852)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8852, float3(0.0), isnan(_8852)), level(0.0)).xyzw;
    float _3303 = _3301.x;
    float _3305 = _3301.y;
    float _3307 = _3301.z;
    float _3309 = _3301.w;
    float2 _8868 = float2(_3296, _3290);
    float3 _3313 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8868, float2(0.0), isnan(_8868)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8868, float2(0.0), isnan(_8868)), level(0.0)).xyz;
    float _3315 = _3313.x;
    float _3317 = _3313.y;
    float _3319 = _3313.z;
    float _3321 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3323 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_78.x = _2970;
    out.m_78.y = _2968;
    out.m_78.z = _2972;
    bool _3325 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3327 = isnan(_2994);
    bool _3329 = _3325 || _3327;
    bool _3331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3333 = _3329 || _3331;
    float _3335 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3321);
    float _3337 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3323);
    float _3339 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3335);
    float _3341 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3337);
    float _3343 = _3339 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3345 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3347 = 1.0 / _3343;
    float _3349 = _3345 + _3343;
    float _3351 = _3349 * _3347;
    float _3353 = _3351 * 0.5;
    float _3355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3357 = fma(_3353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3355);
    float _3359 = 1.0 / _3357;
    float _3361 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3365 = _3359 * _3363;
    float _3367 = abs(_3365);
    float _3369 = log2(_3367);
    bool _3371 = _3365 <= 8000.0;
    bool _3373 = isnan(_3365);
    bool _3375 = _3371 || _3373;
    bool _3377 = isnan(8000.0);
    bool _3379 = _3375 || _3377;
    float _3381 = float(_3379);
    float _3383 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3385 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3387 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3385);
    float _3389 = exp2(_3383);
    float _3391 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3387);
    float _3393 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3391);
    out.gl_Position.x = _3264;
    out.gl_Position.y = _3268;
    out.gl_Position.z = _3393;
    out.gl_Position.w = _3240;
    float _3395 = fma(_3389, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = exp2(_3361);
    float _3401 = fma(_3397, -2.0, 3.0);
    float _3403 = _3397 * _3397;
    float _3405 = _3403 * _3401;
    float _3407 = _3268;
    float _3409 = _3393;
    if (!_3333)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3411 = _3407;
    float _3413 = in.m_80.x;
    float _3415 = -_3405;
    float _3417 = _3415 + 1.0;
    float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3405);
    float _3421 = _3393 + _3240;
    float _3423 = -_3399;
    float _3425 = _3423 + 1.0;
    float _3427 = _3411;
    float _3429 = _3411;
    if (!_3333)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3431 = _3409;
    float _3433 = _3381 * _3419;
    float _3435 = _3421 * 0.5;
    float _3437 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3439 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3441 = -_3437;
    float _3443 = _3441 + 1.0;
    out.m_82.z = _3435;
    out.m_82.w = _3240;
    float _3445 = -_3270;
    float _3447 = _3445 + 1.0;
    float _3449 = _3447 * _3439;
    float _3451 = precise::clamp(_3449, 0.0, 1.0);
    float _3453 = -_3451;
    float _3455 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3457 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3459 = _3443;
    float _3461 = _3437;
    float _3463 = _3303;
    float _3465 = _3431;
    float _3467 = _3431;
    if (!_3333)
    {
        _3457 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3469 = _3457;
    float _3471 = _3455 * _3413;
    float _3473 = _3471 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3475 = _3437 * _3298;
    float _3477 = _3309 * _3443;
    out.m_84.x = _3473;
    float _3479 = _3469;
    float _3481 = _3469;
    if (!_3333)
    {
        _3459 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3483 = _3459;
    float _3485 = _3309 * _3475;
    float _3487 = _3319 * _3475;
    float _3489 = _3483;
    float _3491 = _3483;
    if (!_3333)
    {
        _3461 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3493 = _3461;
    float _3495 = fma(_3315, _3485, _3303);
    float _3497 = fma(_3317, _3485, _3305);
    float _3499 = fma(_3309, _3487, _3307);
    float _3501 = _3493;
    float _3503 = _3493;
    if (!_3333)
    {
        _3463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3505 = _3463;
    out.m_86.x = _3495;
    out.m_86.y = _3497;
    out.m_86.z = _3499;
    out.m_86.w = _3477;
    bool _3507 = !_3333;
    float _3509 = _3505;
    float _3511 = _3505;
    if (!_3507)
    {
        bool _3513 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3515 = isnan(_2994);
        bool _3517 = _3513 || _3515;
        bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3521 = _3517 || _3519;
        if (!_3521)
        {
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3525 = _2994 + _3523;
            float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3529 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3527;
            float _3531 = 1.0 / _3529;
            float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3553 = _3525 * _3531;
            float _3555 = precise::clamp(_3553, 0.0, 1.0);
            float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3561 = fma(_3555, _3535, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3563 = fma(_3555, _3559, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3565 = fma(_3555, _3539, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3567 = fma(_3555, _3543, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3569 = fma(_3555, _3547, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3571 = fma(_3555, _3551, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3511 = _3561;
            _3481 = _3569;
            _3429 = _3563;
            _3491 = _3567;
            _3467 = _3565;
            _3503 = _3571;
            _3573 = true;
        }
        else
        {
            bool _3575 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3577 = isnan(_2994);
            bool _3579 = _3575 || _3577;
            bool _3581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3583 = _3579 || _3581;
            if (!_3583)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3585 = _3427;
            _3429 = _3585;
            if (!_3583)
            {
                _3509 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3587 = _3509;
            _3511 = _3587;
            if (!_3583)
            {
                _3465 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3589 = _3465;
            _3467 = _3589;
            if (!_3583)
            {
                _3489 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3591 = _3489;
            _3491 = _3591;
            if (!_3583)
            {
                _3479 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3593 = _3479;
            _3481 = _3593;
            if (!_3583)
            {
                _3501 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3595 = _3501;
            bool _3597 = !_3583;
            _3503 = _3595;
            if (!_3597)
            {
                bool _3599 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3601 = isnan(_2994);
                bool _3603 = _3599 || _3601;
                bool _3605 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3607 = _3603 || _3605;
                if (!_3607)
                {
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3611 = _2994 + _3609;
                    float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3615 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3613;
                    float _3617 = 1.0 / _3615;
                    float _3619 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3621 = _3619 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3629 = _3627 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3639 = _3611 * _3617;
                    float _3641 = precise::clamp(_3639, 0.0, 1.0);
                    float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3647 = fma(_3641, _3621, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3649 = fma(_3641, _3645, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3651 = fma(_3641, _3625, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3653 = fma(_3641, _3629, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3655 = fma(_3641, _3633, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3657 = fma(_3641, _3637, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3511 = _3647;
                    _3481 = _3655;
                    _3429 = _3649;
                    _3491 = _3653;
                    _3467 = _3651;
                    _3503 = _3657;
                    _3573 = true;
                }
                else
                {
                    _3511 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3481 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3491 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3467 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3503 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3573 = false;
    float _3659 = _3511;
    float _3661 = _3481;
    float _3663 = _3429;
    float _3665 = _3491;
    float _3667 = _3467;
    float _3669 = _3503;
    float _3671 = fma(_2692, -0.5, 0.5);
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = -_3659;
    float _3677 = _3675 + _3661;
    float _3679 = -_3663;
    float _3681 = _3679 + _3665;
    float _3683 = -_3667;
    float _3685 = _3683 + _3669;
    bool _3687 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3689 = fma(_3673, _3677, _3659);
    float _3691 = fma(_3673, _3681, _3663);
    float _3693 = fma(_3673, _3685, _3667);
    float _3695 = _3689 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _3697 = fma(_3691, 0.298911988735198974609375, _3695);
    float _3699 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3701 = fma(_3693, 0.114477999508380889892578125, _3697);
    out.m_51.x = _3699;
    float _3703 = -_3701;
    float _3705 = _3691 + _3703;
    float _3707 = -_3701;
    float _3709 = _3689 + _3707;
    float _3711 = -_3701;
    float _3713 = _3693 + _3711;
    float _3715 = fma(_3705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    float _3717 = fma(_3709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    float _3719 = fma(_3713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    out.m_90.x = _3715;
    out.m_90.y = _3717;
    out.m_90.z = _3719;
    if (!_3687)
    {
        return out;
    }
    float _3721 = -_2968;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3725 = -_2970;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3729 = -_2972;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3733 = _3723 * _3723;
    float _3735 = fma(_3727, _3727, _3733);
    float _3737 = fma(_3731, _3731, _3735);
    float _3739 = sqrt(_3737);
    float _3741 = rsqrt(_3737);
    float _3743 = -_3739;
    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3747 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3749 = precise::clamp(_3747, 0.0, 1.0);
    float _3751 = _3727 * _3741;
    float _3753 = _3723 * _3741;
    float _3755 = abs(_3749);
    float _3757 = log2(_3755);
    float _3759 = _3731 * _3741;
    float _3761 = _3751 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3763 = _2692 * _3753;
    float _3765 = -_3753;
    float _3767 = -_3761;
    float _3769 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3767);
    float _3771 = fma(_2694, _3751, _3763);
    float _3773 = -_3759;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3769);
    float _3777 = fma(_2696, _3759, _3771);
    float _3779 = precise::clamp(_3777, 0.0, 1.0);
    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3783 = _3775 + _3781;
    float _3785 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3787 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3789 = precise::clamp(_3787, 0.0, 1.0);
    float _3791 = exp2(_3785);
    float _3793 = _3791 * _3789;
    float _3795 = _3779 * _3793;
    float _3797 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3799 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3801 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3797;
    out.m_88.y = _3799;
    out.m_88.z = _3801;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3573 = false;
    bool _2748 = false;
    bool _989 = false;
    bool _819 = false;
    bool _599 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3858 = as_type<float>(_125);
        out.gl_Position.z = _3858;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_109);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    if (_155)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _119;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3926 = as_type<float>(_161);
        out.gl_Position.z = _3926;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _187 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    float _193 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _199 = !_173;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _209 = _205;
    float _227;
    if (!_207)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    bool _247 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _249 = isnan(_237);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _237 + _271;
    float _275 = 1.0 / _265;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _261;
    float _281 = 1.0 / _269;
    float _283 = _273 * _275;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _241 * _279;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_257;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = _245 * _281;
    bool _323 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_237);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _333 * _337;
    float _353 = -_333;
    float _355 = _353 + 1.0;
    float _357 = fma(_341, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_319, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _295 * _355;
    float _365 = fma(_349, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_295;
    float _369 = _367 + 1.0;
    float _371 = _357 * _363;
    float _373 = _359 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_381, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_361, _351, _383);
    float _393 = fma(_365, _351, _385);
    float _395 = fma(_387, _315, _391);
    float _397 = fma(_389, _315, _393);
    float _399 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_277;
    float _421;
    if (!_403)
    {
        float _405 = in.m_60.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].x, _143);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_109);
        float _427 = 1.0 / _425;
        float _429 = _143 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_62.x;
    float _435 = in.m_62.y;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _431 + _437;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _431 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _467 = isnan(_431);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    bool _477 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _479 = isnan(_431);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = 1.0 / _463;
    float _491 = -_487;
    float _493 = _491 + 1.0;
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _497 = 1.0 / _459;
    float _499 = _475 * _493;
    float _501 = -_475;
    float _503 = _501 + 1.0;
    float _505 = _401 * _435;
    float _507 = _455 * _489;
    float _509 = _399 * _433;
    float _511 = _439 * _497;
    float _513 = -_451;
    float _515 = _513 + 1.0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _517;
    float _521 = _487 * _515;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _527;
    float _531 = fma(_519, _511, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _533 = fma(_525, _511, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _535 = fma(_529, _511, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _537 = _531 * _499;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _543 = _533 * _499;
    float _545 = _535 * _499;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _555 = fma(_541, _507, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _557 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _543);
    float _559 = fma(_549, _507, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _561 = fma(_553, _507, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _563 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _537);
    float _565 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _545);
    float _567 = fma(_559, _521, _557);
    float _569 = fma(_555, _521, _563);
    float _571 = fma(_561, _521, _565);
    float _573 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].x, _567);
    float _575 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].y, _569);
    float _577 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[109].z, _571);
    bool _579 = !_495;
    float _597;
    if (!_579)
    {
        float _581 = in.m_60.x;
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _585 = _581 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_109);
        float _603 = 1.0 / _601;
        float _605 = _143 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _607 + _609;
    float _613 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_607);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _617;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _645 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _647 = isnan(_607);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _659 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _661 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = 1.0 / _625;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = _621 * _639;
    bool _673 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _675 = isnan(_607);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = 1.0 / _643;
    float _687 = -_637;
    float _689 = _687 + 1.0;
    float _691 = fma(_671, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _697 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _699 = isnan(_607);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_683;
    float _711 = _709 + 1.0;
    float _713 = _683 * _689;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _719 = 1.0 / _695;
    float _721 = -_707;
    float _723 = _721 + 1.0;
    float _725 = _655 * _711;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _727;
    float _731 = _717 * _665;
    float _733 = _637 * _723;
    float _735 = _691 * _725;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _739 = _607 + _737;
    float _741 = -_655;
    float _743 = _741 + 1.0;
    bool _745 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _747 = isnan(_607);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = _729 * _685;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _765 = _607 + _763;
    float _767 = fma(_731, _739, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _769 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[115].x, _735);
    float _771 = -_755;
    float _773 = _771 + 1.0;
    float _775 = _761 * _719;
    float _777 = fma(_757, _765, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _781 = _607 + _779;
    float _783 = fma(_767, _713, _769);
    float _785 = _707 * _773;
    float _787 = fma(_775, _781, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _789 = fma(_777, _733, _783);
    float _791 = fma(_787, _785, _789);
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[119].x, _791);
    float _795 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _661;
    out.m_64.y = _663;
    out.m_64.z = _667;
    out.m_64.w = _795;
    bool _797 = !_669;
    float _799 = _783;
    float _817;
    if (!_797)
    {
        float _801 = in.m_60.x;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _805 = _801 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[11].z, _143);
        float _809 = _807 * _803;
        float _811 = floor(_809);
        float _813 = -_811;
        float _815 = _809 + _813;
        _817 = _815;
        _819 = true;
    }
    else
    {
        float _821 = float(_109);
        float _823 = 1.0 / _821;
        float _825 = _143 * _823;
        _817 = _825;
    }
    _819 = false;
    float _827 = _817;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _831 = _827 + _829;
    bool _833 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _835 = isnan(_827);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _827 + _845;
    bool _849 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _851 = isnan(_827);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _869 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _871 = isnan(_827);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_843;
    float _883 = _881 + 1.0;
    float _885 = 1.0 / _867;
    float _887 = _879 * _883;
    float _889 = -_879;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _893;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _899 = 1.0 / _863;
    float _901 = _859 * _891;
    float _903 = -_859;
    float _905 = _903 + 1.0;
    float _907 = _831 * _899;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = fma(_895, _907, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _919 = fma(_911, _907, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _921 = fma(_915, _907, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _923 = _847 * _885;
    float _925 = _917 * _901;
    float _927 = _919 * _901;
    float _929 = _921 * _901;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _943 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].x, _925);
    float _945 = fma(_933, _923, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _947 = fma(_937, _923, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _949 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].y, _927);
    float _951 = fma(_941, _923, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _953 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[123].z, _929);
    float _955 = fma(_945, _887, _943);
    float _957 = fma(_947, _887, _949);
    float _959 = fma(_951, _887, _953);
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].x, _955);
    float _963 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].y, _957);
    float _965 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].z, _959);
    bool _967 = !_897;
    float _969 = _961;
    float _987;
    if (!_967)
    {
        float _971 = in.m_60.x;
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _975 = _971 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _979 = _977 * _973;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _985;
        _989 = true;
    }
    else
    {
        float _991 = float(_109);
        float _993 = 1.0 / _991;
        float _995 = _143 * _993;
        _987 = _995;
    }
    _989 = false;
    float _997 = _987;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1001 = int(_999);
    float _1003 = float(_109);
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1007 = _1005 != 0;
    float _1009 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1011 = int(_1009);
    bool _1013 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1015 = isnan(_997);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1027 = float(_1001);
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1031 = int(_1029);
    if (_1007)
    {
        float _1033 = in.m_60.x;
        _799 = _1033;
    }
    float _1035 = _799;
    float _1037 = _1035;
    if (!_1007)
    {
        float _1039 = in.m_60.y;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = float(uint(_1011));
    float _1045 = 1.0 / _1027;
    int _1047 = ~_1011;
    int _1049 = _1047 + 1;
    float _1051 = float(_1011);
    bool _1053 = _1011 == 0;
    float _1055 = 1.0 / _1043;
    float _1057 = float(uint(_1031));
    float _1059 = _143 * _1045;
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1063 = int(_1061);
    int _1065 = as_type<int>(_1055) + (-2);
    float _1067 = trunc(_1059);
    int _1069 = int(_1067);
    int _1071 = ~_1011;
    int _1073 = _1071 + 1;
    float _1075 = float(_1063);
    float _1077 = 1.0 / _1057;
    float _1079 = float(uint(_1069));
    float _1081 = 1.0 / _1075;
    float _1083 = as_type<float>(_1065) * _1079;
    float _1085 = trunc(_1083);
    float _1087 = precise::max(_1085, 0.0);
    uint _1090 = uint(_1087);
    int _1092 = as_type<int>(_1077) + (-2);
    float _1094 = _143 * _1081;
    float _1096 = 1.0 / _1003;
    int _1098 = _1073 * int(_1090);
    int _1100 = _1098 + _1069;
    float _1102 = trunc(_1094);
    int _1104 = int(_1102);
    float _1106 = float(uint(_1100));
    float _1108 = in.m_60.x;
    float _1110 = in.m_60.y;
    float _1112 = in.m_60.z;
    float _1114 = in.m_60.w;
    float _1116 = as_type<float>(_1065) * _1106;
    float _1118 = _1106;
    if (_1007)
    {
        _1118 = 1.0;
    }
    float _1120 = _1118;
    float _1122 = _1120;
    if (!_1007)
    {
        _1122 = 7.345489978790283203125;
    }
    float _1124 = _1122;
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = _1124 * _1108;
    int _1134 = int(_1090) + int(_1130);
    float _1136 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1138 = float(_1069);
    float _1140 = floor(_1132);
    float _1142 = _1124;
    float _1144 = _1112;
    if (_1007)
    {
        _1142 = 1.0;
    }
    float _1146 = _1142;
    int _1148 = _1049 * _1134;
    int _1150 = _1148 + _1069;
    float _1152 = _1146;
    if (!_1007)
    {
        _1152 = 1.2345600128173828125;
    }
    float _1154 = _1152;
    float _1156 = fma(_1136, -2.0, _1025);
    bool _1158 = _1138 >= _1051;
    bool _1160 = isnan(_1138);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1051);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    bool _1170 = uint(_1150) >= uint(_1011);
    float _1172 = _1041 * _1154;
    float _1174 = trunc(_1168);
    int _1176 = int(_1174);
    bool _1178 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1180 = isnan(_997);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    bool _1190 = !_1170;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = ~_1134;
    int _1196 = _1194 + _1192;
    int _1198 = _1196 + 1;
    float _1200 = floor(_1172);
    float _1202 = float(uint(_1104));
    float _1204 = -_1140;
    float _1206 = _1132 + _1204;
    int _1208 = _1011 * _1198;
    int _1210 = _1208 + _1069;
    int _1212 = _1011 + (-1);
    float _1214 = as_type<float>(_1092) * _1202;
    int _1216 = ~_1176;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    bool _1222 = !_1053;
    int _1224 = _1222 ? _1210 : (-1);
    float _1226 = trunc(_1214);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    int _1232 = _1224 * _1220;
    float _1234 = -_1200;
    float _1236 = _1172 + _1234;
    int _1238 = ~_1031;
    int _1240 = _1238 + 1;
    int _1242 = _1176 * _1212;
    int _1244 = _1242 + _1232;
    float _1246 = _143 * _1096;
    float _1248 = _1206 * _1051;
    float _1250 = _1246 * _1051;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1262 = _1260 != 0;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1266 = _1264 != 0;
    int _1268 = _1240 * int(_1230);
    int _1270 = _1268 + _1104;
    float _1272 = trunc(_1248);
    int _1274 = int(_1272);
    bool _1276 = !_1258;
    int _1278 = _1276 ? 0 : 1;
    bool _1280 = !_1254;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = float(uint(_1270));
    bool _1286 = !_1266;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = trunc(_1250);
    int _1292 = int(_1290);
    int _1294 = abs(_1278);
    float _1296 = as_type<float>(_1092) * _1284;
    int _1298 = abs(_1288);
    int _1300 = abs(_1282);
    int _1302 = _1244 * _1294;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1306 = _1304 != 0;
    float _1308 = trunc(_1296);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    bool _1314 = !_1262;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = _1274 * _1298;
    int _1320 = _1318 + _1069;
    bool _1322 = !_1306;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = abs(_1316);
    int _1328 = ~_1031;
    int _1330 = _1328 + 1;
    int _1332 = _1292 * _1300;
    int _1334 = _1332 + _1302;
    int _1336 = abs(_1324);
    float _1338 = float(_1031);
    int _1340 = _1320 * _1326;
    int _1342 = _1340 + _1334;
    float _1344 = float(_1104);
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1348 = _1346 != 0;
    int _1350 = _1274 * _1336;
    int _1352 = _1350 + _1342;
    int _1354 = int(_1230) + int(_1312);
    float _1356 = _1236 * _1338;
    float _1358 = float(uint(_1352));
    bool _1360 = _1344 >= _1338;
    bool _1362 = isnan(_1344);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan(_1338);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    int _1372 = _1330 * _1354;
    int _1374 = _1372 + _1104;
    float _1376 = trunc(_1356);
    int _1378 = int(_1376);
    float _1380 = as_type<float>(_1065) * _1358;
    float _1382 = _1246 * _1338;
    int _1384 = _1031 + (-1);
    bool _1386 = uint(_1374) >= uint(_1031);
    bool _1388 = !_1348;
    int _1390 = _1388 ? 0 : 1;
    float _1392 = trunc(_1370);
    int _1394 = int(_1392);
    bool _1396 = !_1386;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1406 = _1404 != 0;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1414 = _1412 != 0;
    int _1416 = ~_1354;
    int _1418 = _1416 + _1398;
    int _1420 = _1418 + 1;
    int _1422 = ~_1011;
    int _1424 = _1422 + 1;
    float _1426 = trunc(_1380);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    int _1432 = abs(_1390);
    int _1434 = _1031 * _1420;
    int _1436 = _1434 + _1104;
    bool _1438 = _1031 == 0;
    int _1440 = _1378 * _1432;
    int _1442 = _1440 + _1104;
    bool _1444 = !_1438;
    int _1446 = _1444 ? _1436 : (-1);
    float _1448 = trunc(_1382);
    int _1450 = int(_1448);
    int _1452 = ~_1394;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    bool _1458 = _1011 == 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1462 = _1460 != 0;
    int _1464 = _1446 * _1456;
    bool _1466 = !_1406;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = _1424 * int(_1430);
    int _1472 = _1470 + _1352;
    int _1474 = _1394 * _1384;
    int _1476 = _1474 + _1464;
    bool _1478 = !_1402;
    int _1480 = _1478 ? 0 : 1;
    float _1482 = float(uint(_1472));
    int _1484 = abs(_1468);
    bool _1486 = !_1410;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = as_type<float>(_1065) * _1482;
    int _1492 = abs(_1480);
    bool _1494 = !_1414;
    int _1496 = _1494 ? 0 : 1;
    float _1498 = trunc(_1490);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = abs(_1488);
    int _1506 = _1476 * _1484;
    int _1508 = abs(_1496);
    int _1510 = _1450 * _1492;
    int _1512 = _1510 + _1506;
    float _1514 = float(uint(_1320));
    int _1516 = _1442 * _1504;
    int _1518 = _1516 + _1512;
    float _1520 = float(uint(_1442));
    float _1522 = as_type<float>(_1065) * _1514;
    int _1524 = ~_1011;
    int _1526 = _1524 + 1;
    int _1528 = _1378 * _1508;
    int _1530 = _1528 + _1518;
    int _1532 = 0;
    if (_1462)
    {
        _1532 = 0;
    }
    int _1534 = _1532;
    float _1536 = as_type<float>(_1092) * _1520;
    int _1538 = int(_1430) + int(_1502);
    float _1540 = trunc(_1522);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    float _1546 = float(uint(_1530));
    int _1548 = ~_1031;
    int _1550 = _1548 + 1;
    int _1552 = _1526 * _1538;
    int _1554 = _1552 + _1352;
    int _1556 = _1534;
    if (!_1462)
    {
        _1556 = 1;
    }
    int _1558 = _1556;
    float _1560 = trunc(_1536);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = as_type<float>(_1092) * _1546;
    bool _1568 = _1108 > 0.5;
    bool _1570 = uint(_1554) >= uint(_1011);
    float _1572 = -_201;
    int _1574 = _1568 ? as_type<int>(_1572) : as_type<int>(_201);
    float _1576 = trunc(_1566);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    bool _1582 = !_1570;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = _1526 * int(_1544);
    int _1588 = _1586 + _1320;
    int _1590 = ~_1031;
    int _1592 = _1590 + 1;
    int _1594 = ~_1538;
    int _1596 = _1594 + _1584;
    int _1598 = _1596 + 1;
    float _1600 = float(uint(_1588));
    int _1602 = _1550 * int(_1564);
    int _1604 = _1602 + _1442;
    bool _1606 = _1110 > 0.5;
    int _1608 = _1011 * _1598;
    int _1610 = _1608 + _1352;
    float _1612 = as_type<float>(_1065) * _1600;
    float _1614 = float(uint(_1604));
    bool _1616 = !_1458;
    int _1618 = _1616 ? _1610 : (-1);
    int _1620 = _1592 * int(_1580);
    int _1622 = _1620 + _1530;
    int _1624 = ~_1011;
    int _1626 = _1624 + 1;
    float _1628 = as_type<float>(_1092) * _1614;
    int _1630 = _1618 & 3;
    bool _1632 = _1630 != 0;
    float _1634 = trunc(_1612);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = float(uint(_1622));
    bool _1642 = uint(_1630) > 1u;
    int _1644 = _1618 & 3;
    bool _1646 = _1644 != 0;
    float _1648 = as_type<float>(_1092) * _1640;
    bool _1650 = uint(_1630) >= 2u;
    float _1652 = trunc(_1628);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    int _1658 = _1646 ? 0 : 1;
    bool _1660 = _1114 > 0.5;
    int _1662 = ~_1658;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = trunc(_1648);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    int _1674 = _1666;
    if (!_1642)
    {
        int _1676 = ~_1658;
        int _1678 = _1676 + 1;
        _1674 = _1678;
    }
    int _1680 = _1674;
    bool _1682 = _1630 != 3;
    int _1684 = int(_1544) + int(_1638);
    int _1686 = ~_1031;
    int _1688 = _1686 + 1;
    int _1690 = _1650 ? 0 : 1;
    int _1692 = _1626 * _1684;
    int _1694 = _1692 + _1320;
    int _1696 = int(_1564) + int(_1656);
    int _1698 = int(_1580) + int(_1672);
    int _1700 = ~_1031;
    int _1702 = _1700 + 1;
    int _1704 = ~_1690;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    bool _1710 = uint(_1694) >= uint(_1011);
    int _1712 = _1688 * _1696;
    int _1714 = _1712 + _1442;
    int _1716 = _1708;
    if (_1682)
    {
        int _1718 = ~_1690;
        int _1720 = _1718 + 1;
        _1716 = _1720;
    }
    int _1722 = _1716;
    bool _1724 = !_1710;
    int _1726 = _1724 ? 0 : (-1);
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1730 = _1728 != 0;
    int _1732 = _1702 * _1698;
    int _1734 = _1732 + _1530;
    bool _1736 = uint(_1714) >= uint(_1031);
    bool _1738 = !_1730;
    int _1740 = _1738 ? 0 : 1;
    bool _1742 = !_1736;
    int _1744 = _1742 ? 0 : (-1);
    int _1746 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1748 = _1746 != 0;
    bool _1750 = uint(_1734) >= uint(_1031);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1756 = in.m_48.x;
    float _1758 = in.m_48.y;
    float _1760 = in.m_48.z;
    bool _1762 = !_1748;
    float _1764 = _1762 ? _201 : as_type<float>(_1574);
    float _1766 = 1.0 / _1754;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1770 = _1768 != 0;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1776 = -_205;
    int _1778 = _1606 ? as_type<int>(_1776) : as_type<int>(_205);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1782 = _1112 > 0.5;
    bool _1784 = !_1770;
    float _1786 = _1784 ? _205 : as_type<float>(_1778);
    float _1788 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1790 = 1.0 / _1774;
    bool _1792 = !_1750;
    int _1794 = _1792 ? 0 : (-1);
    float _1796 = -_1780;
    float _1798 = fma(_1788, 2.0, _1796);
    bool _1800 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1802 = isnan(_997);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = -_201;
    int _1814 = _1782 ? as_type<int>(_1812) : as_type<int>(_201);
    float _1816 = -_143;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1822 = _1820 != 0;
    float _1824 = -_1810;
    float _1826 = _1824 + 1.0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1830 = _1828 != 0;
    float _1832 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1836 = _1834 != 0;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1838;
    float _1842 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1844 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1850 = _1840 * _1766;
    float _1852 = _1188 * _1826;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1856 = _997 + _1854;
    float _1858 = -_1188;
    float _1860 = _1858 + 1.0;
    float _1862 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1832);
    float _1864 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1842);
    float _1866 = fma(_1756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1844);
    float _1868 = _1848 * _1790;
    bool _1870 = !_1836;
    float _1872 = _1870 ? _201 : as_type<float>(_1814);
    float _1874 = fma(_1850, _1856, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1876 = _1023 * _1860;
    bool _1878 = _1558 != 1;
    float _1880 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1862);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1884 = _997 + _1882;
    float _1886 = _1874 * _1876;
    float _1888 = _1764 + 0.5;
    float _1890 = -_1023;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1864);
    float _1896 = fma(_1760, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1866);
    float _1898 = fma(_1868, _1884, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1900 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1818);
    float _1902 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1886);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1906 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    float _1908 = _1868;
    float _1910 = _1844;
    if (!_1878)
    {
        _1908 = _1110;
    }
    float _1912 = _1908;
    float _1914 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1904);
    float _1916 = _1912;
    if (!_1878)
    {
        _1910 = _1110;
    }
    float _1918 = _1910;
    float _1920 = _1786 + (-0.5);
    float _1922 = _1918;
    float _1924 = _1920;
    if (_1878)
    {
        _1916 = _1108;
    }
    float _1926 = _1916;
    float _1928 = fma(_1898, _1852, _1902);
    if (_1878)
    {
        _1922 = _1108;
    }
    float _1930 = _1922;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1934 = -_1920;
    float _1936 = -_1906;
    float _1938 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1936);
    int _1940 = ~_1698;
    int _1942 = _1940 + _1794;
    int _1944 = _1942 + 1;
    float _1946 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1932);
    if (!_1878)
    {
        _1924 = _1112;
    }
    float _1948 = _1924;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1952 = _1948;
    if (_1878)
    {
        _1144 = _1110;
    }
    float _1954 = _1144;
    int _1956 = _1031 * _1944;
    int _1958 = _1956 + _1530;
    if (_1878)
    {
        _1952 = _1110;
    }
    float _1960 = _1952;
    float _1962 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1950);
    int _1964 = _1618 >> 31;
    float _1966 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1968 = !_1438;
    int _1970 = _1968 ? _1958 : (-1);
    float _1972 = _1894 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1974 = _1964 & 3;
    float _1976 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1928);
    int _1978 = _1970 >> 31;
    float _1980 = _1880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1982 = _1618 + _1974;
    float _1984 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1914);
    int _1986 = _1978 & 3;
    float _1988 = _1896 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1990 = _1982 >> 2;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1994 = _1980 + _1992;
    int _1996 = _1970 + _1986;
    float _1998 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1946);
    float _2000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2002 = _1988 + _2000;
    bool _2004 = !_1632;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1962);
    int _2010 = _1970 & 3;
    bool _2012 = _2010 != 0;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2016 = _1990 << 4;
    int _2018 = _2016 + 368;
    float _2020 = _1872 + 0.5;
    int _2022 = _1970 & 3;
    bool _2024 = _2022 != 0;
    float _2026 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2014);
    int _2028 = _1996 >> 2;
    float _2030 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2032 = _2012 ? 0 : 1;
    uint _2034 = uint(int(uint(_2018) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    int _2042 = int(_2034) + 1;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    int _2046 = _2042 & 3;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[int(_2044)][_2046];
    bool _2050 = uint(_2022) > 1u;
    float _2052 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2026);
    int _2054 = _2028 << 4;
    int _2056 = _2054 + 512;
    float _2058 = -_1984;
    float _2060 = _2058 + 1.0;
    float _2062 = -_2052;
    float _2064 = _2062 + 1.0;
    uint _2066 = uint(int(uint(_2056) >> uint(2)));
    uint _2068 = uint(int(uint(int(_2066)) >> uint(2)));
    int _2070 = int(_2066) & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    int _2074 = int(_2066) + 1;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    int _2078 = _2074 & 3;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[int(_2076)][_2078];
    int _2082 = ~_2032;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2090 = !_2024;
    int _2092 = _2090 ? 0 : 1;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2096 = _1630 != 3;
    float _2098 = -_2088;
    float _2100 = fma(_1966, 2.0, _2098);
    int _2102 = _2086;
    if (!_2050)
    {
        int _2104 = ~_2032;
        int _2106 = _2104 + 1;
        _2102 = _2106;
    }
    int _2108 = _2102;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2112 = _1972 + _2110;
    int _2114 = _2018 + 8;
    uint _2116 = uint(int(uint(_2114) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = fma(_2030, -2.0, _2094);
    bool _2134 = uint(_2022) >= 2u;
    float _2136 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2138 = -_143;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2100);
    float _2142 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2132);
    int _2144 = _2134 ? 0 : 1;
    float _2146 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2136);
    int _2148 = _2056 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = ~_1684;
    int _2168 = _2166 + _1726;
    int _2170 = _2168 + 1;
    float _2172 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2140);
    float _2174 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2146);
    bool _2176 = !_2096;
    int _2178 = _2176 ? 0 : (-1);
    bool _2180 = _2022 != 3;
    int _2182 = _1011 * _2170;
    int _2184 = _2182 + _1320;
    int _2186 = abs(_1680);
    int _2188 = abs(_2108);
    int _2190 = ~_2144;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    int _2196 = abs(_2006);
    int _2198 = ~_2188;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2194;
    if (_2180)
    {
        int _2206 = ~_2144;
        int _2208 = _2206 + 1;
        _2204 = _2208;
    }
    int _2210 = _2204;
    int _2212 = ~_2186;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = abs(_2092);
    int _2220 = abs(_1722);
    int _2222 = _2216 * as_type<int>(_2048);
    bool _2224 = _2022 != 3;
    int _2226 = _2202 * as_type<int>(_2080);
    int _2228 = ~_2196;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    int _2234 = abs(_2210);
    int _2236 = _2232 * as_type<int>(_2040);
    int _2238 = _2236 + _2222;
    int _2240 = ~_2218;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    int _2246 = ~_2220;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    int _2252 = abs(_2178);
    int _2254 = _2244 * as_type<int>(_2072);
    int _2256 = _2254 + _2226;
    bool _2258 = !_2224;
    int _2260 = _2258 ? 0 : (-1);
    int _2262 = _2250 * as_type<int>(_2122);
    int _2264 = _2262 + _2238;
    int _2266 = ~_2252;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = ~_2234;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = abs(_2260);
    int _2280 = _2270 * as_type<int>(_2130);
    int _2282 = _2280 + _2264;
    bool _2284 = !_1830;
    int _2286 = _2284 ? 0 : 1;
    int _2288 = _2276 * as_type<int>(_2156);
    int _2290 = _2288 + _2256;
    int _2292 = ~_1696;
    int _2294 = _2292 + _1744;
    int _2296 = _2294 + 1;
    float _2298 = -_205;
    int _2300 = _1660 ? as_type<int>(_2298) : as_type<int>(_205);
    int _2302 = abs(_1740);
    int _2304 = abs(_2286);
    int _2306 = ~_2278;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    bool _2312 = !_1822;
    float _2314 = _2312 ? _205 : as_type<float>(_2300);
    int _2316 = _1031 * _2296;
    int _2318 = _2316 + _1442;
    int _2320 = ~_2302;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _2310 * as_type<int>(_2164);
    int _2328 = _2326 + _2290;
    int _2330 = ~_2304;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    float _2336 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2338 = !_1458;
    int _2340 = _2338 ? _2184 : (-1);
    int _2342 = _2282 * _2324;
    bool _2344 = !_1438;
    int _2346 = _2344 ? _2318 : (-1);
    int _2348 = _2328 * _2334;
    bool _2350 = _2174 >= 0.0;
    int _2352 = _2340 * _2302;
    int _2354 = _2352 + _2342;
    float _2356 = _2314 + (-0.5);
    int _2358 = _2346 * _2304;
    int _2360 = _2358 + _2348;
    float _2362 = _2112 * _2112;
    float _2364 = -_1998;
    float _2366 = _2364 + 1.0;
    float _2368 = -_2356;
    float _2370 = -_2142;
    float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2370);
    float _2374 = -_2008;
    float _2376 = _2374 + 1.0;
    float _2378 = fma(_1994, _1994, _2362);
    float _2380 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = fma(_2314, _2064, _2372);
    float _2384 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2386 = fma(_2002, _2002, _2378);
    if (_2350)
    {
        _969 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2388 = _969;
    float _2390 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2392 = -_2060;
    float _2394 = fma(_1764, _2392, _1900);
    float _2396 = rsqrt(_2386);
    float _2398 = fma(_1786, _2366, _1938);
    float _2400 = -_2376;
    float _2402 = fma(_1872, _2400, _2172);
    float _2404 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2410 = as_type<int>(_2388);
    if (_2350)
    {
        float _2412 = _2388 * 5.0;
        _2410 = as_type<int>(_2412);
    }
    int _2414 = _2410;
    float _2416 = float(_2354);
    out.m_66.x = _2394;
    out.m_66.y = _2398;
    out.m_66.z = _2402;
    out.m_66.w = _2382;
    float _2418 = float(_2360);
    out.m_68.x = _2404;
    out.m_68.y = _2406;
    out.m_68.z = _2408;
    out.m_68.w = _2336;
    float _2420 = _2112 * _2396;
    if (_2350)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7330 = as_type<float>(_2414);
        out.gl_Position.z = _7330;
    }
    float _2422 = _1994 * _2396;
    out.m_70.x = _2416;
    out.m_70.y = _2418;
    if (_2350)
    {
        out.m_51.x = 0.0;
    }
    if (_2350)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2424 = -_2420;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _2428 = _2002 * _2396;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1980);
    float _2434 = -_2420;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2112);
    float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2440 = _2426 + _2438;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2432 + _2446;
    float _2450 = -_2422;
    float _2452 = fma(_2450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1994);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2458 = _2444 + _2456;
    float _2460 = _2436 * _2436;
    float _2462 = -_2428;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2002);
    float _2466 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2454);
    float _2468 = fma(_2452, _2452, _2460);
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2466);
    float _2472 = fma(_2464, _2464, _2468);
    bool _2474 = _2470 >= 0.0;
    float _2476 = sqrt(_2472);
    float _2478 = _2470;
    if (_2474)
    {
        _2478 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2480 = _2478;
    int _2482 = as_type<int>(_2480);
    if (_2474)
    {
        out.m_51.x = 0.0;
    }
    float _2484 = _2396 * _2476;
    if (_2474)
    {
        float _2486 = _2480 * 5.0;
        _2482 = as_type<int>(_2486);
    }
    int _2488 = _2482;
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7469 = as_type<float>(_2488);
        out.gl_Position.z = _7469;
    }
    if (_2474)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2490 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2492 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _2496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _2498 = _2484 * _2490;
    float _2500 = _2484 * _2492;
    float _2502 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2504 = _2502 * 0.5;
    float _2506 = _2494 * _2498;
    float _2508 = _2496 * _2500;
    float _2510 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2512 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2514 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2510);
    float _2518 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2512);
    float _2520 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2522 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2516);
    float _2524 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2518);
    float _2526 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    float _2528 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2530 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2532 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2534 = _1980 + _2528;
    float _2536 = _1988 + _2530;
    float _2538 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2540 = _1972 + _2532;
    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2544 = _2534 + _2542;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2548 = _2536 + _2546;
    float _2550 = fma(_2538, _2538, 1.0);
    float _2552 = _2544 * _2544;
    float _2554 = _2548 * _2548;
    float _2556 = rsqrt(_2550);
    float _2558 = _2552 + _2554;
    float _2560 = sqrt(_2558);
    bool _2562 = _2560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2564 = _2532;
    float _2566 = _2526;
    float _2568 = _2552;
    float _2570 = _2534;
    if (!_2562)
    {
        _2564 = _2552;
    }
    float _2572 = _2564;
    float _2574 = _2572;
    if (!_2562)
    {
        _2566 = _2554;
    }
    float _2576 = _2566;
    float _2578 = _2576;
    if (!_2562)
    {
        _209 = _2536;
    }
    float _2580 = _209;
    float _2582 = _2580;
    if (!_2562)
    {
        _2568 = _2540;
    }
    float _2584 = _2568;
    bool _2586 = !_2562;
    float _2588 = _2584;
    if (!_2586)
    {
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2594 = _2560 + _2592;
        float _2596 = rsqrt(_2558);
        float _2598 = _2594 * _2590;
        float _2600 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2602 = _2598 * 0.15915493667125701904296875;
        float _2604 = _2602 * 6.283185482025146484375;
        float _2606 = sin(_2604);
        float _2608 = _2602 * 6.283185482025146484375;
        float _2610 = cos(_2608);
        float _2612 = fma(_2606, _2600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2614 = _2596 * _2612;
        float _2616 = _2610 + (-1.0);
        float _2618 = fma(_2544, _2614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2620 = fma(_2548, _2614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2626 = _2618 + _2624;
        float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2630 = _2620 + _2628;
        float _2632 = fma(_2540, _2610, _2622);
        float _2634 = _2626 * _2626;
        float _2636 = _2630 * _2630;
        _2588 = _2632;
        _2574 = _2634;
        _2578 = _2636;
        _2570 = _2618;
        _2582 = _2620;
    }
    float _2638 = _2588;
    float _2640 = _2574;
    float _2642 = _2578;
    float _2644 = _2570;
    float _2646 = _2582;
    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2650 = _2638 + _2648;
    float _2652 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2654 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2656 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2658 = fma(_2650, _2650, _2640);
    float _2660 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2662 = _2538 * _2556;
    float _2664 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2652);
    float _2666 = _2658 + _2642;
    float _2668 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2660);
    float _2670 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2672 = _2662 * _2670;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2676 = _2662 * _2674;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2680 = _2662 * _2678;
    float _2682 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2654);
    float _2684 = sqrt(_2666);
    float _2686 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2672);
    float _2688 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2676);
    float _2690 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2680);
    float _2692 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2694 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2696 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_72.x = _2686;
    out.m_72.y = _2688;
    out.m_72.z = _2690;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _2698 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2700 = isnan(_2684);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2706 = _2702 || _2704;
    out.m_76.x = _2694;
    out.m_76.y = _2692;
    out.m_76.z = _2696;
    float _2708 = _2682;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    float _2712 = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    if (!_2706)
    {
        _2708 = 1.0;
    }
    float _2714 = _2708;
    bool _2716 = !_2706;
    float _2718 = _2714;
    if (!_2716)
    {
        bool _2720 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2722 = isnan(_2684);
        bool _2724 = _2720 || _2722;
        bool _2726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2728 = _2724 || _2726;
        if (!_2728)
        {
            float _2730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2732 = _2684 + _2730;
            float _2734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2734;
            float _2738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2742 = 1.0 / _2736;
            float _2744 = _2732 * _2742;
            float _2746 = fma(_2744, _2740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2718 = _2746;
            _2748 = true;
        }
        else
        {
            bool _2750 = _2684 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2752 = isnan(_2684);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2758 = _2754 || _2756;
            if (!_2758)
            {
                float _2760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2762 = _2684 + _2760;
                float _2764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2766 = _2764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2770 = _2768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2772 = 1.0 / _2766;
                float _2774 = _2762 * _2772;
                float _2776 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2718 = _2776;
                _2748 = true;
            }
            else
            {
                _2718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2748 = false;
    float _2778 = _2718;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2782 = _2638 + _2780;
    float _2784 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2786 = _2644 + _2784;
    float _2788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2790 = _2646 + _2788;
    float _2792 = fma(_2782, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2794 = fma(_2786, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2796 = fma(_2790, _2778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2798 = -_1972;
    float _2800 = _2798 + _2792;
    float _2802 = -_1980;
    float _2804 = _2802 + _2794;
    float _2806 = -_1988;
    float _2808 = _2806 + _2796;
    float _2810 = _2800 * _2800;
    float _2812 = fma(_2804, _2804, _2810);
    float _2814 = fma(_2808, _2808, _2812);
    float _2816 = sqrt(_2814);
    bool _2818 = _2816 > 0.0;
    bool _2820 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2824 = _2820 || _2822;
    bool _2826 = isnan(0.5);
    bool _2828 = _2824 || _2826;
    float _2830 = _2778;
    float _2832 = _2794;
    if (!_2818)
    {
        _2710 = _2794;
    }
    float _2834 = _2710;
    float _2836 = _2834;
    if (!_2818)
    {
        _2830 = _2792;
    }
    float _2838 = _2830;
    float _2840 = _2838;
    float _2842 = _2838;
    if (!_2818)
    {
        _2712 = _2796;
    }
    float _2844 = _2712;
    bool _2846 = !_2818;
    float _2848 = _2844;
    float _2850 = _2844;
    if (!_2846)
    {
        float _2852 = _195 * _195;
        float _2854 = fma(_193, _193, _2852);
        float _2856 = rsqrt(_2814);
        float _2858 = fma(_197, _197, _2854);
        float _2860 = sqrt(_2858);
        float _2862 = _2804 * _2856;
        float _2864 = _2800 * _2856;
        float _2866 = _2808 * _2856;
        bool _2868 = _2860 > 0.0;
        float _2870 = _2860;
        if (!_2868)
        {
            _2870 = _2794;
        }
        float _2872 = _2870;
        _2836 = _2872;
        if (!_2868)
        {
            _2840 = _2792;
        }
        float _2874 = _2840;
        _2842 = _2874;
        if (!_2868)
        {
            _2848 = _2796;
        }
        float _2876 = _2848;
        bool _2878 = !_2868;
        _2850 = _2876;
        if (!_2878)
        {
            float _2880 = rsqrt(_2858);
            float _2882 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2884 = _195 * _2880;
            float _2886 = _193 * _2880;
            float _2888 = _197 * _2880;
            float _2890 = _2864 * _2884;
            float _2892 = fma(_2862, _2886, _2890);
            float _2894 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2896 = fma(_2866, _2888, _2892);
            float _2898 = _2896 * _2894;
            float _2900 = fma(_193, _2898, _2794);
            float _2902 = fma(_195, _2898, _2792);
            float _2904 = fma(_197, _2898, _2796);
            _2836 = _2900;
            _2842 = _2902;
            _2850 = _2904;
        }
    }
    float _2906 = _2836;
    float _2908 = _2842;
    float _2910 = _2850;
    float _2912 = -_2422;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2916 = -_2420;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    float _2920 = -_2428;
    float _2922 = fma(_2920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2910);
    float _2924 = _2918;
    float _2926 = _2914;
    float _2928 = _2922;
    float _2930 = _2908;
    if (!_2828)
    {
        float _2932 = _2440 * _2440;
        float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2936 = -_1972;
        float _2938 = _2936 + _2908;
        float _2940 = fma(_2448, _2448, _2932);
        float _2942 = fma(_2458, _2458, _2940);
        float _2944 = 1.0 / _2484;
        float _2946 = sqrt(_2942);
        float _2948 = precise::min(_2946, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2950 = _2948 * _2934;
        float _2952 = -_1980;
        float _2954 = _2952 + _2906;
        float _2956 = -_1988;
        float _2958 = _2956 + _2910;
        float _2960 = _2950 * _2944;
        float _2962 = fma(_2954, _2960, _2432);
        float _2964 = fma(_2938, _2960, _2426);
        float _2966 = fma(_2958, _2960, _2444);
        _2924 = _2964;
        _2926 = _2962;
        _2928 = _2966;
    }
    float _2968 = _2924;
    float _2970 = _2926;
    float _2972 = _2928;
    float _2974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2976 = _2968 + _2974;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2980 = _2970 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2984 = _2972 + _2982;
    float _2986 = _2976 * _2976;
    float _2988 = fma(_2980, _2980, _2986);
    float _2990 = fma(_2984, _2984, _2988);
    float _2992 = rsqrt(_2990);
    float _2994 = sqrt(_2990);
    float _2996 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2998 = _2980 * _2996;
    float _3000 = _2984 * _2996;
    float _3002 = _2998 * _2998;
    float _3004 = _3000 * _3000;
    float _3006 = _3002 + _3004;
    float _3008 = sqrt(_3006);
    bool _3010 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3014 = _3008 + _3012;
    float _3016 = _2992;
    float _3018 = _3014;
    float _3020 = _2976;
    float _3022 = _2996;
    float _3024 = _3002;
    if (_3010)
    {
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3016 = _3026;
    }
    float _3028 = _3016;
    if (_3010)
    {
        float _3030 = rsqrt(_3006);
        _2930 = _3030;
    }
    float _3032 = _2930;
    float _3034 = _3032;
    if (_3010)
    {
        float _3036 = _3014 * _3028;
        _3018 = _3036;
    }
    float _3038 = _3018;
    float _3040 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3010)
    {
        float _3042 = _3038 * 0.15915493667125701904296875;
        _2832 = _3042;
    }
    float _3044 = _2832;
    float _3046 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3040);
    float _3048 = _3028;
    if (_3010)
    {
        float _3050 = _3044 * 6.283185482025146484375;
        float _3052 = sin(_3050);
        _3048 = _3052;
    }
    float _3054 = _3048;
    float _3056 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3058 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3046);
    float _3060 = precise::max(0.0, _3056);
    float _3062 = _2984;
    float _3064 = _3060;
    if (_3010)
    {
        float _3066 = _3044 * 6.283185482025146484375;
        float _3068 = cos(_3066);
        _3062 = _3068;
    }
    float _3070 = _3062;
    float _3072 = _3058 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3074 = -_2996;
    float _3076 = -_3060;
    float _3078 = fma(_2976, _3074, _3076);
    float _3080 = _3078;
    if (_3010)
    {
        float _3082 = _3078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3064 = _3082;
    }
    float _3084 = _3064;
    float _3086 = _3084;
    float _3088 = _3054;
    if (_3010)
    {
        float _3090 = fma(_3054, _3084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3086 = _3090;
    }
    float _3092 = _3086;
    float _3094 = _3092;
    if (!_3010)
    {
        _3088 = _3000;
    }
    float _3096 = _3088;
    float _3098 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3100 = _3096;
    if (_3010)
    {
        float _3102 = _3070 + (-1.0);
        _3020 = _3102;
    }
    float _3104 = _3020;
    float _3106 = _3104;
    if (_3010)
    {
        float _3108 = _3032 * _3092;
        _3022 = _3108;
    }
    float _3110 = _3022;
    if (!_3010)
    {
        _3034 = _2998;
    }
    float _3112 = _3034;
    float _3114 = _3112;
    if (_3010)
    {
        float _3116 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3106 = _3116;
    }
    float _3118 = _3106;
    if (_3010)
    {
        float _3120 = _2998 * _3110;
        _3114 = _3120;
    }
    float _3122 = _3114;
    if (_3010)
    {
        float _3124 = _3000 * _3110;
        _3100 = _3124;
    }
    float _3126 = _3100;
    if (!_3010)
    {
        _3094 = _3004;
    }
    float _3128 = _3094;
    float _3130 = _3128;
    if (_3010)
    {
        float _3132 = fma(_3078, _3070, _3118);
        _3080 = _3132;
    }
    float _3134 = _3080;
    if (_3010)
    {
        float _3136 = _3122 * _3122;
        _3024 = _3136;
    }
    float _3138 = _3024;
    if (_3010)
    {
        float _3140 = _3126 * _3126;
        _3130 = _3140;
    }
    float _3142 = _3130;
    float _3144 = floor(_3098);
    float _3146 = fma(_3134, _3134, _3138);
    float _3148 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3150 = _3146 + _3142;
    float _3152 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3148);
    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3156 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3154);
    float _3158 = precise::clamp(_3156, 0.0, 1.0);
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3162 = rsqrt(_3150);
    float _3164 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3152);
    float _3166 = -_3158;
    float _3168 = _3166 + 1.0;
    float _3170 = _3164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3172 = -_3144;
    float _3174 = _3098 + _3172;
    float _3176 = abs(_3168);
    float _3178 = log2(_3176);
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3182 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3184 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3186 = -_3180;
    float _3188 = fma(_3186, _3160, 1.0);
    float _3190 = _2968 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3192 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3182);
    float _3194 = _3162 * _3134;
    float _3196 = _3162 * _3122;
    float _3198 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3190);
    float _3200 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3192);
    float _3202 = _3162 * _3126;
    float _3204 = floor(_3184);
    float _3206 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3198);
    float _3208 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3210 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3212 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3214 = _3206 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3216 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3218 = -_3210;
    float _3220 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3218);
    float _3222 = log2(_3188);
    float _3224 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3216);
    float _3226 = -_3202;
    float _3228 = fma(_3226, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3220);
    float _3230 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3224);
    float _3232 = fma(_3228, -0.5, 0.5);
    float _3234 = -_3204;
    float _3236 = _3184 + _3234;
    float _3238 = exp2(_3212);
    float _3240 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3230);
    float _3242 = fma(_3228, 0.5, 0.5);
    float _3244 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3246 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3248 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3244);
    float _3250 = 1.0 / _3240;
    float _3252 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3246);
    float _3254 = fma(_3242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3256 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3248);
    float _3258 = _3222 * 0.693147182464599609375;
    float _3260 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3252);
    float _3262 = fma(_3242, _3254, -0.212114393711090087890625);
    float _3264 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3256);
    float _3266 = sqrt(_3232);
    float _3268 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3260);
    float2 _8794 = float2(_3236, _3174);
    float _3270 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8794, float2(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8794, float2(0.0), isnan(_8794)), level(0.0)).x;
    float _3272 = fma(_3242, _3262, 1.570728778839111328125);
    float _3274 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3276 = _3264 * _3250;
    float _3278 = _3194 + 1.0;
    float _3280 = -_3194;
    float _3282 = fma(_3238, _3278, _3280);
    float _3284 = _3268 * _3250;
    float _3286 = fma(_3276, 0.5, 0.5);
    float _3288 = _3266 * 0.636619746685028076171875;
    float _3290 = fma(_3282, 0.5, 0.5);
    float _3292 = fma(_3284, -0.5, 0.5);
    float _3294 = -_3272;
    float _3296 = fma(_3288, _3294, 1.0);
    float3 _8841 = float3(_3286, _3292, _3274);
    float _3298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8841, float3(0.0), isnan(_8841)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8841, float3(0.0), isnan(_8841)), level(0.0)).x;
    float3 _8852 = float3(_3286, _3292, _3274);
    float4 _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8852, float3(0.0), isnan(_8852)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8852, float3(0.0), isnan(_8852)), level(0.0)).xyzw;
    float _3303 = _3301.x;
    float _3305 = _3301.y;
    float _3307 = _3301.z;
    float _3309 = _3301.w;
    float2 _8868 = float2(_3296, _3290);
    float3 _3313 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8868, float2(0.0), isnan(_8868)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8868, float2(0.0), isnan(_8868)), level(0.0)).xyz;
    float _3315 = _3313.x;
    float _3317 = _3313.y;
    float _3319 = _3313.z;
    float _3321 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3323 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_78.x = _2970;
    out.m_78.y = _2968;
    out.m_78.z = _2972;
    bool _3325 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3327 = isnan(_2994);
    bool _3329 = _3325 || _3327;
    bool _3331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3333 = _3329 || _3331;
    float _3335 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3321);
    float _3337 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3323);
    float _3339 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3335);
    float _3341 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3337);
    float _3343 = _3339 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3345 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3347 = 1.0 / _3343;
    float _3349 = _3345 + _3343;
    float _3351 = _3349 * _3347;
    float _3353 = _3351 * 0.5;
    float _3355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3357 = fma(_3353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3355);
    float _3359 = 1.0 / _3357;
    float _3361 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3365 = _3359 * _3363;
    float _3367 = abs(_3365);
    float _3369 = log2(_3367);
    bool _3371 = _3365 <= 8000.0;
    bool _3373 = isnan(_3365);
    bool _3375 = _3371 || _3373;
    bool _3377 = isnan(8000.0);
    bool _3379 = _3375 || _3377;
    float _3381 = float(_3379);
    float _3383 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3385 = _3208 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3387 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3385);
    float _3389 = exp2(_3383);
    float _3391 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3387);
    float _3393 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3391);
    out.gl_Position.x = _3264;
    out.gl_Position.y = _3268;
    out.gl_Position.z = _3393;
    out.gl_Position.w = _3240;
    float _3395 = fma(_3389, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = exp2(_3361);
    float _3401 = fma(_3397, -2.0, 3.0);
    float _3403 = _3397 * _3397;
    float _3405 = _3403 * _3401;
    float _3407 = _3268;
    float _3409 = _3393;
    if (!_3333)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3411 = _3407;
    float _3413 = in.m_80.x;
    float _3415 = -_3405;
    float _3417 = _3415 + 1.0;
    float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3405);
    float _3421 = _3393 + _3240;
    float _3423 = -_3399;
    float _3425 = _3423 + 1.0;
    float _3427 = _3411;
    float _3429 = _3411;
    if (!_3333)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3431 = _3409;
    float _3433 = _3381 * _3419;
    float _3435 = _3421 * 0.5;
    float _3437 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3439 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3441 = -_3437;
    float _3443 = _3441 + 1.0;
    out.m_82.z = _3435;
    out.m_82.w = _3240;
    float _3445 = -_3270;
    float _3447 = _3445 + 1.0;
    float _3449 = _3447 * _3439;
    float _3451 = precise::clamp(_3449, 0.0, 1.0);
    float _3453 = -_3451;
    float _3455 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3457 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3459 = _3443;
    float _3461 = _3437;
    float _3463 = _3303;
    float _3465 = _3431;
    float _3467 = _3431;
    if (!_3333)
    {
        _3457 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3469 = _3457;
    float _3471 = _3455 * _3413;
    float _3473 = _3471 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3475 = _3437 * _3298;
    float _3477 = _3309 * _3443;
    out.m_84.x = _3473;
    float _3479 = _3469;
    float _3481 = _3469;
    if (!_3333)
    {
        _3459 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3483 = _3459;
    float _3485 = _3309 * _3475;
    float _3487 = _3319 * _3475;
    float _3489 = _3483;
    float _3491 = _3483;
    if (!_3333)
    {
        _3461 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3493 = _3461;
    float _3495 = fma(_3315, _3485, _3303);
    float _3497 = fma(_3317, _3485, _3305);
    float _3499 = fma(_3309, _3487, _3307);
    float _3501 = _3493;
    float _3503 = _3493;
    if (!_3333)
    {
        _3463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3505 = _3463;
    out.m_86.x = _3495;
    out.m_86.y = _3497;
    out.m_86.z = _3499;
    out.m_86.w = _3477;
    bool _3507 = !_3333;
    float _3509 = _3505;
    float _3511 = _3505;
    if (!_3507)
    {
        bool _3513 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3515 = isnan(_2994);
        bool _3517 = _3513 || _3515;
        bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3521 = _3517 || _3519;
        if (!_3521)
        {
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3525 = _2994 + _3523;
            float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3529 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3527;
            float _3531 = 1.0 / _3529;
            float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3553 = _3525 * _3531;
            float _3555 = precise::clamp(_3553, 0.0, 1.0);
            float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3561 = fma(_3555, _3535, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3563 = fma(_3555, _3559, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3565 = fma(_3555, _3539, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3567 = fma(_3555, _3543, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3569 = fma(_3555, _3547, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3571 = fma(_3555, _3551, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3511 = _3561;
            _3481 = _3569;
            _3429 = _3563;
            _3491 = _3567;
            _3467 = _3565;
            _3503 = _3571;
            _3573 = true;
        }
        else
        {
            bool _3575 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3577 = isnan(_2994);
            bool _3579 = _3575 || _3577;
            bool _3581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3583 = _3579 || _3581;
            if (!_3583)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3585 = _3427;
            _3429 = _3585;
            if (!_3583)
            {
                _3509 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3587 = _3509;
            _3511 = _3587;
            if (!_3583)
            {
                _3465 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3589 = _3465;
            _3467 = _3589;
            if (!_3583)
            {
                _3489 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3591 = _3489;
            _3491 = _3591;
            if (!_3583)
            {
                _3479 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3593 = _3479;
            _3481 = _3593;
            if (!_3583)
            {
                _3501 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3595 = _3501;
            bool _3597 = !_3583;
            _3503 = _3595;
            if (!_3597)
            {
                bool _3599 = _2994 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3601 = isnan(_2994);
                bool _3603 = _3599 || _3601;
                bool _3605 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3607 = _3603 || _3605;
                if (!_3607)
                {
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3611 = _2994 + _3609;
                    float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3615 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3613;
                    float _3617 = 1.0 / _3615;
                    float _3619 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3621 = _3619 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3629 = _3627 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3639 = _3611 * _3617;
                    float _3641 = precise::clamp(_3639, 0.0, 1.0);
                    float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3647 = fma(_3641, _3621, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3649 = fma(_3641, _3645, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3651 = fma(_3641, _3625, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3653 = fma(_3641, _3629, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3655 = fma(_3641, _3633, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3657 = fma(_3641, _3637, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3511 = _3647;
                    _3481 = _3655;
                    _3429 = _3649;
                    _3491 = _3653;
                    _3467 = _3651;
                    _3503 = _3657;
                    _3573 = true;
                }
                else
                {
                    _3511 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3481 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3491 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3467 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3503 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3573 = false;
    float _3659 = _3511;
    float _3661 = _3481;
    float _3663 = _3429;
    float _3665 = _3491;
    float _3667 = _3467;
    float _3669 = _3503;
    float _3671 = fma(_2692, -0.5, 0.5);
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = -_3659;
    float _3677 = _3675 + _3661;
    float _3679 = -_3663;
    float _3681 = _3679 + _3665;
    float _3683 = -_3667;
    float _3685 = _3683 + _3669;
    bool _3687 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3689 = fma(_3673, _3677, _3659);
    float _3691 = fma(_3673, _3681, _3663);
    float _3693 = fma(_3673, _3685, _3667);
    float _3695 = _3689 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _3697 = fma(_3691, 0.298911988735198974609375, _3695);
    float _3699 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3701 = fma(_3693, 0.114477999508380889892578125, _3697);
    out.m_51.x = _3699;
    float _3703 = -_3701;
    float _3705 = _3691 + _3703;
    float _3707 = -_3701;
    float _3709 = _3689 + _3707;
    float _3711 = -_3701;
    float _3713 = _3693 + _3711;
    float _3715 = fma(_3705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    float _3717 = fma(_3709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    float _3719 = fma(_3713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3701);
    out.m_90.x = _3715;
    out.m_90.y = _3717;
    out.m_90.z = _3719;
    if (!_3687)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3721 = -_2968;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3725 = -_2970;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3729 = -_2972;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3733 = _3723 * _3723;
    float _3735 = fma(_3727, _3727, _3733);
    float _3737 = fma(_3731, _3731, _3735);
    float _3739 = sqrt(_3737);
    float _3741 = rsqrt(_3737);
    float _3743 = -_3739;
    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3747 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3749 = precise::clamp(_3747, 0.0, 1.0);
    float _3751 = _3727 * _3741;
    float _3753 = _3723 * _3741;
    float _3755 = abs(_3749);
    float _3757 = log2(_3755);
    float _3759 = _3731 * _3741;
    float _3761 = _3751 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3763 = _2692 * _3753;
    float _3765 = -_3753;
    float _3767 = -_3761;
    float _3769 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3767);
    float _3771 = fma(_2694, _3751, _3763);
    float _3773 = -_3759;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3769);
    float _3777 = fma(_2696, _3759, _3771);
    float _3779 = precise::clamp(_3777, 0.0, 1.0);
    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3783 = _3775 + _3781;
    float _3785 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3787 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3789 = precise::clamp(_3787, 0.0, 1.0);
    float _3791 = exp2(_3785);
    float _3793 = _3791 * _3789;
    float _3795 = _3779 * _3793;
    float _3797 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3799 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3801 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3797;
    out.m_88.y = _3799;
    out.m_88.z = _3801;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

