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
    float4 m_62 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3511 = false;
    bool _987 = false;
    bool _817 = false;
    bool _597 = false;
    bool _421 = false;
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
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3810 = as_type<float>(_123);
        out.gl_Position.z = _3810;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_107);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3878 = as_type<float>(_159);
        out.gl_Position.z = _3878;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _187 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _189 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    float _191 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    bool _197 = !_171;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_175;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_177;
    float _207 = _191;
    float _225;
    if (!_205)
    {
        float _209 = in.m_58.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_107);
        float _231 = 1.0 / _229;
        float _233 = _141 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _235 + _269;
    float _273 = 1.0 / _263;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _277 = 1.0 / _259;
    float _279 = 1.0 / _267;
    float _281 = _271 * _273;
    bool _283 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_235);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = _239 * _277;
    bool _297 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_235);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -_255;
    float _311 = _309 + 1.0;
    float _313 = _307 * _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _243 * _279;
    bool _321 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _323 = isnan(_235);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _331 * _335;
    float _351 = -_331;
    float _353 = _351 + 1.0;
    float _355 = fma(_339, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_343, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_317, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = _293 * _353;
    float _363 = fma(_347, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = -_293;
    float _367 = _365 + 1.0;
    float _369 = _355 * _361;
    float _371 = _357 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _383 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_359, _349, _381);
    float _391 = fma(_363, _349, _383);
    float _393 = fma(_385, _313, _389);
    float _395 = fma(_387, _313, _391);
    float _397 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    bool _401 = !_275;
    float _419;
    if (!_401)
    {
        float _403 = in.m_58.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_107);
        float _425 = 1.0 / _423;
        float _427 = _141 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_60.x;
    float _433 = in.m_60.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    bool _439 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = isnan(_429);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _453 = _429 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _465 = isnan(_429);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _477 = isnan(_429);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _461;
    float _489 = -_485;
    float _491 = _489 + 1.0;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _495 = 1.0 / _457;
    float _497 = _473 * _491;
    float _499 = -_473;
    float _501 = _499 + 1.0;
    float _503 = _399 * _433;
    float _505 = _453 * _487;
    float _507 = _397 * _431;
    float _509 = _437 * _495;
    float _511 = -_449;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = _485 * _513;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _525;
    float _529 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _531 = fma(_523, _509, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_527, _509, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _535 = _529 * _497;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _541 = _531 * _497;
    float _543 = _533 * _497;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _553 = fma(_539, _505, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _555 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _541);
    float _557 = fma(_547, _505, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _559 = fma(_551, _505, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _561 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _535);
    float _563 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _543);
    float _565 = fma(_557, _519, _555);
    float _567 = fma(_553, _519, _561);
    float _569 = fma(_559, _519, _563);
    float _571 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].x, _565);
    float _573 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].y, _567);
    float _575 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].z, _569);
    bool _577 = !_493;
    float _595;
    if (!_577)
    {
        float _579 = in.m_58.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_107);
        float _601 = 1.0 / _599;
        float _603 = _141 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _609 = _605 + _607;
    float _611 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = isnan(_605);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _615;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _643 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _645 = isnan(_605);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _657 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _659 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = 1.0 / _623;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _669 = _619 * _637;
    bool _671 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _673 = isnan(_605);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _641;
    float _685 = -_635;
    float _687 = _685 + 1.0;
    float _689 = fma(_669, _609, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _695 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _697 = isnan(_605);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -_681;
    float _709 = _707 + 1.0;
    float _711 = _681 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _717 = 1.0 / _693;
    float _719 = -_705;
    float _721 = _719 + 1.0;
    float _723 = _653 * _709;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = _715 * _663;
    float _731 = _635 * _721;
    float _733 = _689 * _723;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _605 + _735;
    float _739 = -_653;
    float _741 = _739 + 1.0;
    bool _743 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _745 = isnan(_605);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _727 * _683;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _763 = _605 + _761;
    float _765 = fma(_729, _737, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _769 = -_753;
    float _771 = _769 + 1.0;
    float _773 = _759 * _717;
    float _775 = fma(_755, _763, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _779 = _605 + _777;
    float _781 = fma(_765, _711, _767);
    float _783 = _705 * _771;
    float _785 = fma(_773, _779, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _787 = fma(_775, _731, _781);
    float _789 = fma(_785, _783, _787);
    float _791 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[119].x, _789);
    float _793 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _659;
    out.m_62.y = _661;
    out.m_62.z = _665;
    out.m_62.w = _793;
    bool _795 = !_667;
    float _797 = _781;
    float _815;
    if (!_795)
    {
        float _799 = in.m_58.x;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _803 = _799 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[11].z, _141);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _815 = _813;
        _817 = true;
    }
    else
    {
        float _819 = float(_107);
        float _821 = 1.0 / _819;
        float _823 = _141 * _821;
        _815 = _823;
    }
    _817 = false;
    float _825 = _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _829 = _825 + _827;
    bool _831 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _845 = _825 + _843;
    bool _847 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _849 = isnan(_825);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _867 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _869 = isnan(_825);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -_841;
    float _881 = _879 + 1.0;
    float _883 = 1.0 / _865;
    float _885 = _877 * _881;
    float _887 = -_877;
    float _889 = _887 + 1.0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _891;
    bool _895 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _897 = 1.0 / _861;
    float _899 = _857 * _889;
    float _901 = -_857;
    float _903 = _901 + 1.0;
    float _905 = _829 * _897;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _911;
    float _915 = fma(_893, _905, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _917 = fma(_909, _905, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _919 = fma(_913, _905, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _921 = _845 * _883;
    float _923 = _915 * _899;
    float _925 = _917 * _899;
    float _927 = _919 * _899;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _941 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].x, _923);
    float _943 = fma(_931, _921, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _945 = fma(_935, _921, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _947 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].y, _925);
    float _949 = fma(_939, _921, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _951 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].z, _927);
    float _953 = fma(_943, _885, _941);
    float _955 = fma(_945, _885, _947);
    float _957 = fma(_949, _885, _951);
    float _959 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].x, _953);
    float _961 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].y, _955);
    float _963 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].z, _957);
    bool _965 = !_895;
    float _967 = _959;
    float _985;
    if (!_965)
    {
        float _969 = in.m_58.x;
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = _969 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _977 = _975 * _971;
        float _979 = floor(_977);
        float _981 = -_979;
        float _983 = _977 + _981;
        _985 = _983;
        _987 = true;
    }
    else
    {
        float _989 = float(_107);
        float _991 = 1.0 / _989;
        float _993 = _141 * _991;
        _985 = _993;
    }
    _987 = false;
    float _995 = _985;
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _999 = int(_997);
    float _1001 = float(_107);
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1005 = _1003 != 0;
    float _1007 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1009 = int(_1007);
    bool _1011 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1013 = isnan(_995);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1025 = float(_999);
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1029 = int(_1027);
    if (_1005)
    {
        float _1031 = in.m_58.x;
        _797 = _1031;
    }
    float _1033 = _797;
    float _1035 = _1033;
    if (!_1005)
    {
        float _1037 = in.m_58.y;
        _1035 = _1037;
    }
    float _1039 = _1035;
    float _1041 = float(uint(_1009));
    float _1043 = 1.0 / _1025;
    int _1045 = ~_1009;
    int _1047 = _1045 + 1;
    float _1049 = float(_1009);
    bool _1051 = _1009 == 0;
    float _1053 = 1.0 / _1041;
    float _1055 = float(uint(_1029));
    float _1057 = _141 * _1043;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1061 = int(_1059);
    int _1063 = as_type<int>(_1053) + (-2);
    float _1065 = trunc(_1057);
    int _1067 = int(_1065);
    int _1069 = ~_1009;
    int _1071 = _1069 + 1;
    float _1073 = float(_1061);
    float _1075 = 1.0 / _1055;
    float _1077 = float(uint(_1067));
    float _1079 = 1.0 / _1073;
    float _1081 = as_type<float>(_1063) * _1077;
    float _1083 = trunc(_1081);
    float _1085 = precise::max(_1083, 0.0);
    uint _1088 = uint(_1085);
    int _1090 = as_type<int>(_1075) + (-2);
    float _1092 = _141 * _1079;
    float _1094 = 1.0 / _1001;
    int _1096 = _1071 * int(_1088);
    int _1098 = _1096 + _1067;
    float _1100 = trunc(_1092);
    int _1102 = int(_1100);
    float _1104 = float(uint(_1098));
    float _1106 = in.m_58.x;
    float _1108 = in.m_58.y;
    float _1110 = in.m_58.z;
    float _1112 = in.m_58.w;
    float _1114 = as_type<float>(_1063) * _1104;
    float _1116 = _1104;
    if (_1005)
    {
        _1116 = 1.0;
    }
    float _1118 = _1116;
    float _1120 = _1118;
    if (!_1005)
    {
        _1120 = 7.345489978790283203125;
    }
    float _1122 = _1120;
    float _1124 = trunc(_1114);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    float _1130 = _1122 * _1106;
    int _1132 = int(_1088) + int(_1128);
    float _1134 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1136 = float(_1067);
    float _1138 = floor(_1130);
    float _1140 = _1122;
    float _1142 = _1110;
    if (_1005)
    {
        _1140 = 1.0;
    }
    float _1144 = _1140;
    int _1146 = _1047 * _1132;
    int _1148 = _1146 + _1067;
    float _1150 = _1144;
    if (!_1005)
    {
        _1150 = 1.2345600128173828125;
    }
    float _1152 = _1150;
    float _1154 = fma(_1134, -2.0, _1023);
    bool _1156 = _1136 >= _1049;
    bool _1158 = isnan(_1136);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(_1049);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    bool _1168 = uint(_1148) >= uint(_1009);
    float _1170 = _1039 * _1152;
    float _1172 = trunc(_1166);
    int _1174 = int(_1172);
    bool _1176 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1178 = isnan(_995);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    bool _1188 = !_1168;
    int _1190 = _1188 ? 0 : (-1);
    int _1192 = ~_1132;
    int _1194 = _1192 + _1190;
    int _1196 = _1194 + 1;
    float _1198 = floor(_1170);
    float _1200 = float(uint(_1102));
    float _1202 = -_1138;
    float _1204 = _1130 + _1202;
    int _1206 = _1009 * _1196;
    int _1208 = _1206 + _1067;
    int _1210 = _1009 + (-1);
    float _1212 = as_type<float>(_1090) * _1200;
    int _1214 = ~_1174;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    bool _1220 = !_1051;
    int _1222 = _1220 ? _1208 : (-1);
    float _1224 = trunc(_1212);
    float _1226 = precise::max(_1224, 0.0);
    uint _1228 = uint(_1226);
    int _1230 = _1222 * _1218;
    float _1232 = -_1198;
    float _1234 = _1170 + _1232;
    int _1236 = ~_1029;
    int _1238 = _1236 + 1;
    int _1240 = _1174 * _1210;
    int _1242 = _1240 + _1230;
    float _1244 = _141 * _1094;
    float _1246 = _1204 * _1049;
    float _1248 = _1244 * _1049;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1264 = _1262 != 0;
    int _1266 = _1238 * int(_1228);
    int _1268 = _1266 + _1102;
    float _1270 = trunc(_1246);
    int _1272 = int(_1270);
    bool _1274 = !_1256;
    int _1276 = _1274 ? 0 : 1;
    bool _1278 = !_1252;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = float(uint(_1268));
    bool _1284 = !_1264;
    int _1286 = _1284 ? 0 : 1;
    float _1288 = trunc(_1248);
    int _1290 = int(_1288);
    int _1292 = abs(_1276);
    float _1294 = as_type<float>(_1090) * _1282;
    int _1296 = abs(_1286);
    int _1298 = abs(_1280);
    int _1300 = _1242 * _1292;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1304 = _1302 != 0;
    float _1306 = trunc(_1294);
    float _1308 = precise::max(_1306, 0.0);
    uint _1310 = uint(_1308);
    bool _1312 = !_1260;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _1272 * _1296;
    int _1318 = _1316 + _1067;
    bool _1320 = !_1304;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = abs(_1314);
    int _1326 = ~_1029;
    int _1328 = _1326 + 1;
    int _1330 = _1290 * _1298;
    int _1332 = _1330 + _1300;
    int _1334 = abs(_1322);
    float _1336 = float(_1029);
    int _1338 = _1318 * _1324;
    int _1340 = _1338 + _1332;
    float _1342 = float(_1102);
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1346 = _1344 != 0;
    int _1348 = _1272 * _1334;
    int _1350 = _1348 + _1340;
    int _1352 = int(_1228) + int(_1310);
    float _1354 = _1234 * _1336;
    float _1356 = float(uint(_1350));
    bool _1358 = _1342 >= _1336;
    bool _1360 = isnan(_1342);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan(_1336);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    int _1370 = _1328 * _1352;
    int _1372 = _1370 + _1102;
    float _1374 = trunc(_1354);
    int _1376 = int(_1374);
    float _1378 = as_type<float>(_1063) * _1356;
    float _1380 = _1244 * _1336;
    int _1382 = _1029 + (-1);
    bool _1384 = uint(_1372) >= uint(_1029);
    bool _1386 = !_1346;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = trunc(_1368);
    int _1392 = int(_1390);
    bool _1394 = !_1384;
    int _1396 = _1394 ? 0 : (-1);
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1412 = _1410 != 0;
    int _1414 = ~_1352;
    int _1416 = _1414 + _1396;
    int _1418 = _1416 + 1;
    int _1420 = ~_1009;
    int _1422 = _1420 + 1;
    float _1424 = trunc(_1378);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = abs(_1388);
    int _1432 = _1029 * _1418;
    int _1434 = _1432 + _1102;
    bool _1436 = _1029 == 0;
    int _1438 = _1376 * _1430;
    int _1440 = _1438 + _1102;
    bool _1442 = !_1436;
    int _1444 = _1442 ? _1434 : (-1);
    float _1446 = trunc(_1380);
    int _1448 = int(_1446);
    int _1450 = ~_1392;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    bool _1456 = _1009 == 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1460 = _1458 != 0;
    int _1462 = _1444 * _1454;
    bool _1464 = !_1404;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1422 * int(_1428);
    int _1470 = _1468 + _1350;
    int _1472 = _1392 * _1382;
    int _1474 = _1472 + _1462;
    bool _1476 = !_1400;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = float(uint(_1470));
    int _1482 = abs(_1466);
    bool _1484 = !_1408;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = as_type<float>(_1063) * _1480;
    int _1490 = abs(_1478);
    bool _1492 = !_1412;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = trunc(_1488);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = abs(_1486);
    int _1504 = _1474 * _1482;
    int _1506 = abs(_1494);
    int _1508 = _1448 * _1490;
    int _1510 = _1508 + _1504;
    float _1512 = float(uint(_1318));
    int _1514 = _1440 * _1502;
    int _1516 = _1514 + _1510;
    float _1518 = float(uint(_1440));
    float _1520 = as_type<float>(_1063) * _1512;
    int _1522 = ~_1009;
    int _1524 = _1522 + 1;
    int _1526 = _1376 * _1506;
    int _1528 = _1526 + _1516;
    int _1530 = 0;
    if (_1460)
    {
        _1530 = 0;
    }
    int _1532 = _1530;
    float _1534 = as_type<float>(_1090) * _1518;
    int _1536 = int(_1428) + int(_1500);
    float _1538 = trunc(_1520);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = float(uint(_1528));
    int _1546 = ~_1029;
    int _1548 = _1546 + 1;
    int _1550 = _1524 * _1536;
    int _1552 = _1550 + _1350;
    int _1554 = _1532;
    if (!_1460)
    {
        _1554 = 1;
    }
    int _1556 = _1554;
    float _1558 = trunc(_1534);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    float _1564 = as_type<float>(_1090) * _1544;
    bool _1566 = _1106 > 0.5;
    bool _1568 = uint(_1552) >= uint(_1009);
    float _1570 = -_199;
    int _1572 = _1566 ? as_type<int>(_1570) : as_type<int>(_199);
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    bool _1580 = !_1568;
    int _1582 = _1580 ? 0 : (-1);
    int _1584 = _1524 * int(_1542);
    int _1586 = _1584 + _1318;
    int _1588 = ~_1029;
    int _1590 = _1588 + 1;
    int _1592 = ~_1536;
    int _1594 = _1592 + _1582;
    int _1596 = _1594 + 1;
    float _1598 = float(uint(_1586));
    int _1600 = _1548 * int(_1562);
    int _1602 = _1600 + _1440;
    bool _1604 = _1108 > 0.5;
    int _1606 = _1009 * _1596;
    int _1608 = _1606 + _1350;
    float _1610 = as_type<float>(_1063) * _1598;
    float _1612 = float(uint(_1602));
    bool _1614 = !_1456;
    int _1616 = _1614 ? _1608 : (-1);
    int _1618 = _1590 * int(_1578);
    int _1620 = _1618 + _1528;
    int _1622 = ~_1009;
    int _1624 = _1622 + 1;
    float _1626 = as_type<float>(_1090) * _1612;
    int _1628 = _1616 & 3;
    bool _1630 = _1628 != 0;
    float _1632 = trunc(_1610);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = float(uint(_1620));
    bool _1640 = uint(_1628) > 1u;
    int _1642 = _1616 & 3;
    bool _1644 = _1642 != 0;
    float _1646 = as_type<float>(_1090) * _1638;
    bool _1648 = uint(_1628) >= 2u;
    float _1650 = trunc(_1626);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    int _1656 = _1644 ? 0 : 1;
    bool _1658 = _1112 > 0.5;
    int _1660 = ~_1656;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    float _1666 = trunc(_1646);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = _1664;
    if (!_1640)
    {
        int _1674 = ~_1656;
        int _1676 = _1674 + 1;
        _1672 = _1676;
    }
    int _1678 = _1672;
    bool _1680 = _1628 != 3;
    int _1682 = int(_1542) + int(_1636);
    int _1684 = ~_1029;
    int _1686 = _1684 + 1;
    int _1688 = _1648 ? 0 : 1;
    int _1690 = _1624 * _1682;
    int _1692 = _1690 + _1318;
    int _1694 = int(_1562) + int(_1654);
    int _1696 = int(_1578) + int(_1670);
    int _1698 = ~_1029;
    int _1700 = _1698 + 1;
    int _1702 = ~_1688;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = uint(_1692) >= uint(_1009);
    int _1710 = _1686 * _1694;
    int _1712 = _1710 + _1440;
    int _1714 = _1706;
    if (_1680)
    {
        int _1716 = ~_1688;
        int _1718 = _1716 + 1;
        _1714 = _1718;
    }
    int _1720 = _1714;
    bool _1722 = !_1708;
    int _1724 = _1722 ? 0 : (-1);
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1728 = _1726 != 0;
    int _1730 = _1700 * _1696;
    int _1732 = _1730 + _1528;
    bool _1734 = uint(_1712) >= uint(_1029);
    bool _1736 = !_1728;
    int _1738 = _1736 ? 0 : 1;
    bool _1740 = !_1734;
    int _1742 = _1740 ? 0 : (-1);
    int _1744 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1746 = _1744 != 0;
    bool _1748 = uint(_1732) >= uint(_1029);
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1754 = in.m_46.x;
    float _1756 = in.m_46.y;
    float _1758 = in.m_46.z;
    bool _1760 = !_1746;
    float _1762 = _1760 ? _199 : as_type<float>(_1572);
    float _1764 = 1.0 / _1752;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1768 = _1766 != 0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1774 = -_203;
    int _1776 = _1604 ? as_type<int>(_1774) : as_type<int>(_203);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1780 = _1110 > 0.5;
    bool _1782 = !_1768;
    float _1784 = _1782 ? _203 : as_type<float>(_1776);
    float _1786 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1788 = 1.0 / _1772;
    bool _1790 = !_1748;
    int _1792 = _1790 ? 0 : (-1);
    float _1794 = -_1778;
    float _1796 = fma(_1786, 2.0, _1794);
    bool _1798 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1800 = isnan(_995);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -_199;
    int _1812 = _1780 ? as_type<int>(_1810) : as_type<int>(_199);
    float _1814 = -_141;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1796);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1820 = _1818 != 0;
    float _1822 = -_1808;
    float _1824 = _1822 + 1.0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1828 = _1826 != 0;
    float _1830 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1834 = _1832 != 0;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1836;
    float _1840 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1842 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1848 = _1838 * _1764;
    float _1850 = _1186 * _1824;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1854 = _995 + _1852;
    float _1856 = -_1186;
    float _1858 = _1856 + 1.0;
    float _1860 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1830);
    float _1862 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1840);
    float _1864 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1842);
    float _1866 = _1846 * _1788;
    bool _1868 = !_1834;
    float _1870 = _1868 ? _199 : as_type<float>(_1812);
    float _1872 = fma(_1848, _1854, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1874 = _1021 * _1858;
    bool _1876 = _1556 != 1;
    float _1878 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1860);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1882 = _995 + _1880;
    float _1884 = _1872 * _1874;
    float _1886 = _1762 + 0.5;
    float _1888 = -_1021;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1862);
    float _1894 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1864);
    float _1896 = fma(_1866, _1882, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1816);
    float _1900 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1884);
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1904 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1154);
    float _1906 = _1866;
    float _1908 = _1842;
    if (!_1876)
    {
        _1906 = _1108;
    }
    float _1910 = _1906;
    float _1912 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1902);
    float _1914 = _1910;
    if (!_1876)
    {
        _1908 = _1108;
    }
    float _1916 = _1908;
    float _1918 = _1784 + (-0.5);
    float _1920 = _1916;
    float _1922 = _1918;
    if (_1876)
    {
        _1914 = _1106;
    }
    float _1924 = _1914;
    float _1926 = fma(_1896, _1850, _1900);
    if (_1876)
    {
        _1920 = _1106;
    }
    float _1928 = _1920;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1932 = -_1918;
    float _1934 = -_1904;
    float _1936 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1934);
    int _1938 = ~_1696;
    int _1940 = _1938 + _1792;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1930);
    if (!_1876)
    {
        _1922 = _1110;
    }
    float _1946 = _1922;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1950 = _1946;
    if (_1876)
    {
        _1142 = _1108;
    }
    float _1952 = _1142;
    int _1954 = _1029 * _1942;
    int _1956 = _1954 + _1528;
    if (_1876)
    {
        _1950 = _1108;
    }
    float _1958 = _1950;
    float _1960 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1948);
    int _1962 = _1616 >> 31;
    float _1964 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1966 = !_1436;
    int _1968 = _1966 ? _1956 : (-1);
    float _1970 = _1892 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1972 = _1962 & 3;
    float _1974 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1926);
    int _1976 = _1968 >> 31;
    float _1978 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1980 = _1616 + _1972;
    float _1982 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1912);
    int _1984 = _1976 & 3;
    float _1986 = _1894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1988 = _1980 >> 2;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1978 + _1990;
    int _1994 = _1968 + _1984;
    float _1996 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1944);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2000 = _1986 + _1998;
    bool _2002 = !_1630;
    int _2004 = _2002 ? 0 : 1;
    float _2006 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1960);
    int _2008 = _1968 & 3;
    bool _2010 = _2008 != 0;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2014 = _1988 << 4;
    int _2016 = _2014 + 368;
    float _2018 = _1870 + 0.5;
    int _2020 = _1968 & 3;
    bool _2022 = _2020 != 0;
    float _2024 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2012);
    int _2026 = _1994 >> 2;
    float _2028 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2030 = _2010 ? 0 : 1;
    uint _2032 = uint(int(uint(_2016) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    bool _2048 = uint(_2020) > 1u;
    float _2050 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2024);
    int _2052 = _2026 << 4;
    int _2054 = _2052 + 512;
    float _2056 = -_1982;
    float _2058 = _2056 + 1.0;
    float _2060 = -_2050;
    float _2062 = _2060 + 1.0;
    int _2064 = ~_2030;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    uint _2070 = uint(int(uint(_2054) >> uint(2)));
    uint _2072 = uint(int(uint(int(_2070)) >> uint(2)));
    int _2074 = int(_2070) & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = int(_2070) + 1;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    int _2082 = _2078 & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2088 = !_2022;
    int _2090 = _2088 ? 0 : 1;
    bool _2092 = _1628 != 3;
    float _2094 = -_2086;
    float _2096 = fma(_1964, 2.0, _2094);
    int _2098 = _2068;
    if (!_2048)
    {
        int _2100 = ~_2030;
        int _2102 = _2100 + 1;
        _2098 = _2102;
    }
    int _2104 = _2098;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2108 = _1970 + _2106;
    int _2110 = _2016 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2130 = uint(_2020) >= 2u;
    float _2132 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2134 = -_141;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2096);
    float _2138 = fma(_2028, -2.0, _2128);
    int _2140 = ~_1682;
    int _2142 = _2140 + _1724;
    int _2144 = _2142 + 1;
    float _2146 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2132);
    int _2148 = _2054 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    float _2166 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2138);
    int _2168 = _2130 ? 0 : 1;
    float _2170 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2146);
    bool _2172 = !_2092;
    int _2174 = _2172 ? 0 : (-1);
    int _2176 = _1009 * _2144;
    int _2178 = _2176 + _1318;
    bool _2180 = _2020 != 3;
    float _2182 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2136);
    int _2184 = abs(_1678);
    int _2186 = abs(_2104);
    int _2188 = ~_2168;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    int _2194 = abs(_2004);
    int _2196 = ~_2186;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    int _2202 = _2192;
    if (_2180)
    {
        int _2204 = ~_2168;
        int _2206 = _2204 + 1;
        _2202 = _2206;
    }
    int _2208 = _2202;
    int _2210 = ~_2184;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = abs(_2090);
    int _2218 = abs(_1720);
    int _2220 = _2214 * as_type<int>(_2046);
    bool _2222 = _2020 != 3;
    int _2224 = _2200 * as_type<int>(_2084);
    int _2226 = ~_2194;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    int _2232 = abs(_2208);
    int _2234 = _2230 * as_type<int>(_2038);
    int _2236 = _2234 + _2220;
    int _2238 = ~_2216;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = ~_2218;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = abs(_2174);
    int _2252 = _2242 * as_type<int>(_2076);
    int _2254 = _2252 + _2224;
    bool _2256 = !_2222;
    int _2258 = _2256 ? 0 : (-1);
    int _2260 = _2248 * as_type<int>(_2118);
    int _2262 = _2260 + _2236;
    int _2264 = ~_2250;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = abs(_2258);
    int _2272 = ~_2232;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = _2268 * as_type<int>(_2126);
    int _2280 = _2278 + _2262;
    bool _2282 = !_1828;
    int _2284 = _2282 ? 0 : 1;
    int _2286 = ~_1694;
    int _2288 = _2286 + _1742;
    int _2290 = _2288 + 1;
    int _2292 = _2276 * as_type<int>(_2156);
    int _2294 = _2292 + _2254;
    float _2296 = -_203;
    int _2298 = _1658 ? as_type<int>(_2296) : as_type<int>(_203);
    int _2300 = abs(_2284);
    int _2302 = ~_2270;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    bool _2308 = !_1820;
    float _2310 = _2308 ? _203 : as_type<float>(_2298);
    int _2312 = _1029 * _2290;
    int _2314 = _2312 + _1440;
    int _2316 = ~_2300;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _2306 * as_type<int>(_2164);
    int _2324 = _2322 + _2294;
    int _2326 = abs(_1738);
    float _2328 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2330 = !_1436;
    int _2332 = _2330 ? _2314 : (-1);
    int _2334 = _2324 * _2320;
    int _2336 = ~_2326;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    bool _2342 = !_1456;
    int _2344 = _2342 ? _2178 : (-1);
    int _2346 = _2332 * _2300;
    int _2348 = _2346 + _2334;
    float _2350 = _2108 * _2108;
    int _2352 = _2280 * _2340;
    bool _2354 = _2170 >= 0.0;
    float _2356 = _2310 + (-0.5);
    float _2358 = fma(_1992, _1992, _2350);
    int _2360 = _2344 * _2326;
    int _2362 = _2360 + _2352;
    float _2364 = -_1996;
    float _2366 = _2364 + 1.0;
    float _2368 = -_2356;
    float _2370 = -_2166;
    float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2370);
    float _2374 = fma(_2000, _2000, _2358);
    float _2376 = -_2006;
    float _2378 = _2376 + 1.0;
    float _2380 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = fma(_2310, _2062, _2372);
    float _2384 = _959 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2386 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2388 = rsqrt(_2374);
    if (_2354)
    {
        _967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2390 = _967;
    float _2392 = fma(_1784, _2366, _1936);
    float _2394 = -_2058;
    float _2396 = fma(_1762, _2394, _1898);
    float _2398 = -_2378;
    float _2400 = fma(_1870, _2398, _2182);
    float _2402 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2404 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2408 = as_type<int>(_2390);
    float _2410 = _2400;
    if (_2354)
    {
        float _2412 = _2390 * 5.0;
        _2408 = as_type<int>(_2412);
    }
    int _2414 = _2408;
    float _2416 = float(_2362);
    out.m_64.x = _2396;
    out.m_64.y = _2392;
    out.m_64.z = _2400;
    out.m_64.w = _2382;
    float _2418 = float(_2348);
    out.m_66.x = _2402;
    out.m_66.y = _2404;
    out.m_66.z = _2406;
    out.m_66.w = _2328;
    float _2420 = _2108 * _2388;
    float _2422 = _1992 * _2388;
    if (_2354)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7286 = as_type<float>(_2414);
        out.gl_Position.z = _7286;
    }
    out.m_68.x = _2416;
    out.m_68.y = _2418;
    if (_2354)
    {
        out.m_49.x = 0.0;
    }
    if (_2354)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2424 = -_2420;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1970);
    float _2428 = _2000 * _2388;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1978);
    float _2434 = -_2420;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2108);
    float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2440 = _2426 + _2438;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1986);
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2432 + _2446;
    float _2450 = -_2422;
    float _2452 = fma(_2450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1992);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2458 = _2444 + _2456;
    float _2460 = _2436 * _2436;
    float _2462 = -_2428;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2000);
    float _2466 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2454);
    float _2468 = fma(_2452, _2452, _2460);
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2466);
    float _2472 = fma(_2464, _2464, _2468);
    bool _2474 = _2470 >= 0.0;
    float _2476 = sqrt(_2472);
    float _2478 = _2432;
    if (_2474)
    {
        _2410 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2480 = _2410;
    int _2482 = as_type<int>(_2480);
    if (_2474)
    {
        out.m_49.x = 0.0;
    }
    float _2484 = _2388 * _2476;
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
        float _7422 = as_type<float>(_2488);
        out.gl_Position.z = _7422;
    }
    if (_2474)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2490 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2492 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2498 = _2484 * _2490;
    float _2500 = _2484 * _2492;
    float _2502 = _2494 * _2498;
    float _2504 = _2496 * _2500;
    float _2506 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2508 = _2506 * 0.5;
    float _2510 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2512 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2514 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2510);
    float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2512);
    float _2520 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2522 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    float _2524 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2518);
    float _2526 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    float _2528 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2530 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2532 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2534 = _1986 + _2528;
    float _2536 = _1978 + _2530;
    float _2538 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2540 = _1970 + _2532;
    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2544 = _2534 + _2542;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2548 = _2536 + _2546;
    float _2550 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2538);
    float _2552 = _2544 * _2544;
    float _2554 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2550);
    float _2556 = fma(_2548, _2548, _2552);
    float _2558 = sqrt(_2556);
    bool _2560 = _2558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2562 = _2532;
    float _2564 = _2526;
    float _2566 = _2550;
    if (!_2560)
    {
        _2562 = _2536;
    }
    float _2568 = _2562;
    float _2570 = _2568;
    if (!_2560)
    {
        _2564 = _2534;
    }
    float _2572 = _2564;
    float _2574 = _2572;
    if (!_2560)
    {
        _2566 = _2540;
    }
    float _2576 = _2566;
    bool _2578 = !_2560;
    float _2580 = _2576;
    if (!_2578)
    {
        float _2582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2586 = _2558 + _2584;
        float _2588 = rsqrt(_2556);
        float _2590 = _2586 * _2582;
        float _2592 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2594 = _2590 * 0.15915493667125701904296875;
        float _2596 = _2594 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = _2594 * 6.283185482025146484375;
        float _2602 = sin(_2600);
        float _2604 = _2598 + (-1.0);
        float _2606 = fma(_2602, _2592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2608 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2610 = _2588 * _2606;
        float _2612 = fma(_2540, _2598, _2608);
        float _2614 = fma(_2548, _2610, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2616 = fma(_2544, _2610, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2580 = _2612;
        _2570 = _2614;
        _2574 = _2616;
    }
    float _2618 = _2580;
    float _2620 = _2570;
    float _2622 = _2574;
    float _2624 = -_1970;
    float _2626 = _2624 + _2618;
    float _2628 = -_1978;
    float _2630 = _2628 + _2620;
    float _2632 = _2554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2634 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2636 = _2626 * _2626;
    float _2638 = -_1986;
    float _2640 = _2638 + _2622;
    float _2642 = 1.0 / _2632;
    float _2644 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2634);
    float _2646 = fma(_2630, _2630, _2636);
    float _2648 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2644);
    float _2650 = fma(_2640, _2640, _2646);
    bool _2652 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2654 = isnan(0.5);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2660 = _2656 || _2658;
    float _2662 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2664 = sqrt(_2650);
    bool _2666 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2668 = isnan(0.5);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2674 = _2670 || _2672;
    float _2676 = _2662 + _2632;
    float _2678 = _2676 * _2642;
    float _2680 = _2678 * 0.5;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2684 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2682);
    float _2686 = 1.0 / _2684;
    bool _2688 = _2664 > 0.0;
    float _2690 = _2664;
    float _2692 = _2632;
    float _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2688)
    {
        _2690 = _2620;
    }
    float _2696 = _2690;
    float _2698 = _2696;
    if (!_2688)
    {
        _2692 = _2618;
    }
    float _2700 = _2692;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2688)
    {
        _2694 = _2622;
    }
    float _2706 = _2694;
    bool _2708 = !_2688;
    float _2710 = _2706;
    if (!_2708)
    {
        float _2712 = _193 * _193;
        float _2714 = fma(_191, _191, _2712);
        float _2716 = rsqrt(_2650);
        float _2718 = fma(_195, _195, _2714);
        float _2720 = sqrt(_2718);
        float _2722 = _2630 * _2716;
        float _2724 = _2626 * _2716;
        float _2726 = _2640 * _2716;
        bool _2728 = _2720 > 0.0;
        float _2730 = _2716;
        float _2732 = _2720;
        if (!_2728)
        {
            _2730 = _2620;
        }
        float _2734 = _2730;
        _2698 = _2734;
        if (!_2728)
        {
            _2702 = _2618;
        }
        float _2736 = _2702;
        _2704 = _2736;
        if (!_2728)
        {
            _2732 = _2622;
        }
        float _2738 = _2732;
        bool _2740 = !_2728;
        _2710 = _2738;
        if (!_2740)
        {
            float _2742 = rsqrt(_2718);
            float _2744 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2746 = _193 * _2742;
            float _2748 = _191 * _2742;
            float _2750 = _2724 * _2746;
            float _2752 = _195 * _2742;
            float _2754 = fma(_2722, _2748, _2750);
            float _2756 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2758 = fma(_2726, _2752, _2754);
            float _2760 = _2758 * _2756;
            float _2762 = fma(_191, _2760, _2620);
            float _2764 = fma(_193, _2760, _2618);
            float _2766 = fma(_195, _2760, _2622);
            _2710 = _2766;
            _2698 = _2762;
            _2704 = _2764;
        }
    }
    float _2768 = _2710;
    float _2770 = _2698;
    float _2772 = _2704;
    float _2774 = -_2428;
    float _2776 = fma(_2774, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2768);
    float _2778 = -_2422;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2770);
    float _2782 = -_2420;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2772);
    float _2786 = _2784;
    float _2788 = _2780;
    float _2790 = _2776;
    float _2792 = _2770;
    float _2794 = _2772;
    float _2796 = _2768;
    if (_2674)
    {
        _207 = 1.0;
    }
    float _2798 = _207;
    float _2800 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2802 = _2686 * _2800;
    float _2804 = _2798;
    if (!_2660)
    {
        float _2806 = _2440 * _2440;
        float _2808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2810 = -_1986;
        float _2812 = _2810 + _2768;
        float _2814 = fma(_2448, _2448, _2806);
        float _2816 = -_1978;
        float _2818 = _2816 + _2770;
        float _2820 = fma(_2458, _2458, _2814);
        float _2822 = 1.0 / _2484;
        float _2824 = sqrt(_2820);
        float _2826 = precise::min(_2824, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2828 = _2826 * _2808;
        float _2830 = -_1970;
        float _2832 = _2830 + _2772;
        float _2834 = _2828 * _2822;
        float _2836 = fma(_2832, _2834, _2426);
        float _2838 = fma(_2818, _2834, _2432);
        float _2840 = fma(_2812, _2834, _2444);
        _2786 = _2836;
        _2788 = _2838;
        _2790 = _2840;
    }
    float _2842 = _2786;
    float _2844 = _2788;
    float _2846 = _2790;
    if (!_2674)
    {
        float _2848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2850 = _2848 * 0.15915493667125701904296875;
        float _2852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2854 = _2850 * 6.283185482025146484375;
        float _2856 = cos(_2854);
        float _2858 = _2852 * 0.15915493667125701904296875;
        float _2860 = _2850 * 6.283185482025146484375;
        float _2862 = sin(_2860);
        float _2864 = 1.0 / _2856;
        float _2866 = _2858 * 6.283185482025146484375;
        float _2868 = cos(_2866);
        float _2870 = _2862 * _2864;
        float _2872 = _2858 * 6.283185482025146484375;
        float _2874 = sin(_2872);
        float _2876 = _2868 * _2870;
        float _2878 = 1.0 / _2876;
        float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2882 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2880;
        float _2884 = 1.0 / _2882;
        float _2886 = _2874 * _2878;
        float _2888 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2890 = fma(_2802, _2886, _2888);
        float _2892 = _2890 * _2884;
        float _2894 = precise::clamp(_2892, 0.0, 1.0);
        _2804 = _2894;
    }
    float _2896 = _2804;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2900 = _2842 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2904 = _2844 + _2902;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2908 = _2846 + _2906;
    float _2910 = _2900 * _2900;
    float _2912 = fma(_2904, _2904, _2910);
    float _2914 = fma(_2908, _2908, _2912);
    float _2916 = rsqrt(_2914);
    float _2918 = sqrt(_2914);
    float _2920 = _2916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2922 = _2904 * _2920;
    float _2924 = _2908 * _2920;
    float _2926 = _2922 * _2922;
    float _2928 = _2924 * _2924;
    float _2930 = _2926 + _2928;
    float _2932 = sqrt(_2930);
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2938 = _2932 + _2936;
    float _2940 = _2908;
    float _2942 = _2930;
    float _2944 = _2938;
    float _2946 = _2900;
    float _2948 = _2926;
    if (_2934)
    {
        float _2950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _2950;
    }
    float _2952 = _2940;
    if (_2934)
    {
        float _2954 = rsqrt(_2930);
        _2942 = _2954;
    }
    float _2956 = _2942;
    if (_2934)
    {
        float _2958 = _2938 * _2952;
        _2944 = _2958;
    }
    float _2960 = _2944;
    if (_2934)
    {
        float _2962 = _2960 * 0.15915493667125701904296875;
        _2792 = _2962;
    }
    float _2964 = _2792;
    float _2966 = _2916;
    if (_2934)
    {
        float _2968 = _2964 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        _2966 = _2970;
    }
    float _2972 = _2966;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2976 = precise::max(0.0, _2974);
    float _2978 = _2910;
    float _2980 = _2976;
    if (_2934)
    {
        float _2982 = _2964 * 6.283185482025146484375;
        float _2984 = cos(_2982);
        _2978 = _2984;
    }
    float _2986 = _2978;
    float _2988 = -_2920;
    float _2990 = -_2976;
    float _2992 = fma(_2900, _2988, _2990);
    if (!_2934)
    {
        _2946 = _2924;
    }
    float _2994 = _2946;
    float _2996 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2998 = _2994;
    if (_2934)
    {
        float _3000 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2980 = _3000;
    }
    float _3002 = _2980;
    float _3004 = _2972;
    float _3006 = _3002;
    if (_2934)
    {
        float _3008 = fma(_2972, _3002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3004 = _3008;
    }
    float _3010 = _3004;
    float _3012 = _3010;
    if (!_2934)
    {
        _3006 = _2992;
    }
    float _3014 = _3006;
    float _3016 = _3014;
    if (_2934)
    {
        float _3018 = _2986 + (-1.0);
        _2478 = _3018;
    }
    float _3020 = _2478;
    float _3022 = _3020;
    if (_2934)
    {
        float _3024 = _2956 * _3010;
        _2794 = _3024;
    }
    float _3026 = _2794;
    if (!_2934)
    {
        _3012 = _2922;
    }
    float _3028 = _3012;
    float _3030 = _3028;
    if (_2934)
    {
        float _3032 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2796 = _3032;
    }
    float _3034 = _2796;
    if (_2934)
    {
        float _3036 = _2922 * _3026;
        _3030 = _3036;
    }
    float _3038 = _3030;
    if (_2934)
    {
        float _3040 = _2924 * _3026;
        _2998 = _3040;
    }
    float _3042 = _2998;
    if (!_2934)
    {
        _3022 = _2928;
    }
    float _3044 = _3022;
    float _3046 = _3044;
    if (_2934)
    {
        float _3048 = fma(_2992, _2986, _3034);
        _3016 = _3048;
    }
    float _3050 = _3016;
    if (_2934)
    {
        float _3052 = _3038 * _3038;
        _2948 = _3052;
    }
    float _3054 = _2948;
    if (_2934)
    {
        float _3056 = _3042 * _3042;
        _3046 = _3056;
    }
    float _3058 = _3046;
    float _3060 = floor(_2996);
    float _3062 = fma(_3050, _3050, _3054);
    float _3064 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3068 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3066);
    float _3070 = precise::clamp(_3068, 0.0, 1.0);
    float _3072 = _3062 + _3058;
    float _3074 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3064);
    float _3076 = -_3070;
    float _3078 = _3076 + 1.0;
    float _3080 = rsqrt(_3072);
    float _3082 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3074);
    float _3084 = _3082 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3088 = abs(_3078);
    float _3090 = log2(_3088);
    float _3092 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3094 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3096 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3098 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3100 = -_3092;
    float _3102 = fma(_3100, _3086, 1.0);
    float _3104 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3106 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3096);
    float _3108 = _3080 * _3050;
    float _3110 = _3080 * _3038;
    float _3112 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3104);
    float _3114 = _3080 * _3042;
    float _3116 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3106);
    float _3118 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3120 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3112);
    float _3122 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3098);
    float _3124 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3126 = -_3118;
    float _3128 = fma(_3108, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3126);
    float _3130 = _3120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3132 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3122);
    float _3134 = floor(_3094);
    float _3136 = -_3114;
    float _3138 = fma(_3136, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3128);
    float _3140 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3142 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3144 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3146 = fma(_3138, -0.5, 0.5);
    float _3148 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3140);
    float _3150 = -_3060;
    float _3152 = _2996 + _3150;
    float _3154 = fma(_3138, 0.5, 0.5);
    float _3156 = log2(_3102);
    float _3158 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3148);
    float _3160 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3162 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3164 = _3108 + 1.0;
    float _3166 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3158);
    float _3168 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3160);
    float _3170 = exp2(_3144);
    float _3172 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3162);
    float _3174 = -_3134;
    float _3176 = _3094 + _3174;
    float _3178 = fma(_3154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3180 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3168);
    float _3182 = fma(_3154, _3178, -0.212114393711090087890625);
    float _3184 = 1.0 / _3166;
    float _3186 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3172);
    float _3188 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3180);
    float _3190 = fma(_3154, _3182, 1.570728778839111328125);
    float _3192 = _3156 * 0.693147182464599609375;
    float _3194 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3186);
    float _3196 = sqrt(_3146);
    float2 _8584 = float2(_3152, _3176);
    float _3198 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8584, float2(0.0), isnan(_8584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8584, float2(0.0), isnan(_8584)), level(0.0)).x;
    float _3200 = -_3108;
    float _3202 = fma(_3170, _3164, _3200);
    float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3206 = fma(_3202, 0.5, 0.5);
    float _3208 = _3188 * _3184;
    float _3210 = _3194 * _3184;
    float _3212 = fma(_3208, 0.5, 0.5);
    float _3214 = fma(_3210, -0.5, 0.5);
    float _3216 = _3196 * 0.636619746685028076171875;
    float3 _8620 = float3(_3212, _3214, _3204);
    float _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8620, float3(0.0), isnan(_8620)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8620, float3(0.0), isnan(_8620)), level(0.0)).x;
    float _3220 = -_3190;
    float _3222 = fma(_3216, _3220, 1.0);
    float3 _8636 = float3(_3212, _3214, _3204);
    float4 _3225 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8636, float3(0.0), isnan(_8636)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8636, float3(0.0), isnan(_8636)), level(0.0)).xyzw;
    float _3227 = _3225.x;
    float _3229 = _3225.y;
    float _3231 = _3225.z;
    float _3233 = _3225.w;
    float2 _8652 = float2(_3222, _3206);
    float3 _3237 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8652, float2(0.0), isnan(_8652)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8652, float2(0.0), isnan(_8652)), level(0.0)).xyz;
    float _3239 = _3237.x;
    float _3241 = _3237.y;
    float _3243 = _3237.z;
    float _3245 = abs(_2802);
    float _3247 = log2(_3245);
    float _3249 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3251 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3253 = fma(_3249, _3249, 1.0);
    out.m_70.x = _2844;
    out.m_70.y = _2842;
    out.m_70.z = _2846;
    bool _3255 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3257 = isnan(_2918);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3263 = _3259 || _3261;
    float _3265 = rsqrt(_3253);
    float _3267 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3269 = exp2(_3267);
    float _3271 = fma(_3269, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3273 = precise::clamp(_3271, 0.0, 1.0);
    float _3275 = fma(_3273, -2.0, 3.0);
    float _3277 = _3273 * _3273;
    float _3279 = _3277 * _3275;
    float _3281 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3283 = _3249 * _3265;
    float _3285 = -_3279;
    float _3287 = _3285 + 1.0;
    float _3289 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3281);
    float _3291 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3293 = _3283 * _3291;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3297 = _3283 * _3295;
    float _3299 = fma(_3287, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3279);
    float _3301 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3303 = _3283 * _3301;
    float _3305 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3293);
    float _3307 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3297);
    float _3309 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3303);
    float _3311 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3313 = in.m_72.x;
    float _3315 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3289);
    float _3317 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3319 = exp2(_3311);
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3321 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3315);
    float _3323 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3317);
    out.m_76.x = _3305;
    out.m_76.y = _3307;
    out.m_76.z = _3309;
    float _3325 = _3321 + _3166;
    bool _3327 = _2802 <= 8000.0;
    bool _3329 = isnan(_2802);
    bool _3331 = _3327 || _3329;
    bool _3333 = isnan(8000.0);
    bool _3335 = _3331 || _3333;
    float _3337 = float(_3335);
    float _3339 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3341 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3343 = -_3319;
    float _3345 = _3343 + 1.0;
    float _3347 = _3337 * _3299;
    float _3349 = _3325 * 0.5;
    float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3353 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3339);
    float _3355 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3357 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3341);
    out.gl_Position.x = _3188;
    out.gl_Position.y = _3194;
    out.gl_Position.z = _3321;
    out.gl_Position.w = _3166;
    float _3359 = _2896 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3361 = _3347;
    float _3363 = _3323;
    float _3365 = _3357;
    float _3367 = _3353;
    float _3369 = _3166;
    if (!_3263)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3371 = _3361;
    out.m_78.z = _3349;
    out.m_78.w = _3166;
    float _3373 = _3353 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3375 = _3357 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3377 = _3323 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3379 = _3371;
    float _3381 = _3371;
    if (!_3263)
    {
        _3363 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3383 = _3363;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3263)
    {
        _3365 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3389 = _3365;
    out.m_80.x = _3373;
    out.m_80.y = _3375;
    out.m_80.z = _3377;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3263)
    {
        _3367 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3395 = _3367;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3263)
    {
        _3369 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3401 = _3369;
    float _3403 = -_3198;
    float _3405 = _3403 + 1.0;
    float _3407 = _3405 * _3355;
    float _3409 = precise::clamp(_3407, 0.0, 1.0);
    float _3411 = -_3409;
    float _3413 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3415 = _3413 * _3313;
    float _3417 = _3351 * _3218;
    float _3419 = -_3351;
    float _3421 = _3419 + 1.0;
    float _3423 = _3415 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3425 = _3233 * _3417;
    out.m_82.x = _3423;
    float _3427 = _3243 * _3417;
    float _3429 = fma(_3239, _3425, _3227);
    float _3431 = fma(_3241, _3425, _3229);
    float _3433 = _3233 * _3421;
    float _3435 = fma(_3233, _3427, _3231);
    float _3437 = _3425;
    float _3439 = _3401;
    float _3441 = _3401;
    if (!_3263)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3443 = _3437;
    out.m_84.x = _3429;
    out.m_84.y = _3431;
    out.m_84.z = _3435;
    out.m_84.w = _3433;
    bool _3445 = !_3263;
    float _3447 = _3443;
    float _3449 = _3443;
    if (!_3445)
    {
        bool _3451 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3453 = isnan(_2918);
        bool _3455 = _3451 || _3453;
        bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3459 = _3455 || _3457;
        if (!_3459)
        {
            float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3463 = _2918 + _3461;
            float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3467 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3465;
            float _3469 = 1.0 / _3467;
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3491 = _3463 * _3469;
            float _3493 = precise::clamp(_3491, 0.0, 1.0);
            float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3499 = fma(_3493, _3473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3501 = fma(_3493, _3497, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3503 = fma(_3493, _3477, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3505 = fma(_3493, _3481, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3507 = fma(_3493, _3485, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3509 = fma(_3493, _3489, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3387 = _3499;
            _3441 = _3507;
            _3381 = _3501;
            _3399 = _3505;
            _3393 = _3503;
            _3449 = _3509;
            _3511 = true;
        }
        else
        {
            bool _3513 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3515 = isnan(_2918);
            bool _3517 = _3513 || _3515;
            bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3521 = _3517 || _3519;
            if (!_3521)
            {
                _3379 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3523 = _3379;
            _3381 = _3523;
            if (!_3521)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3525 = _3385;
            _3387 = _3525;
            if (!_3521)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3527 = _3391;
            _3393 = _3527;
            if (!_3521)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3529 = _3397;
            _3399 = _3529;
            if (!_3521)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3531 = _3439;
            _3441 = _3531;
            if (!_3521)
            {
                _3447 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3533 = _3447;
            bool _3535 = !_3521;
            _3449 = _3533;
            if (!_3535)
            {
                bool _3537 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3539 = isnan(_2918);
                bool _3541 = _3537 || _3539;
                bool _3543 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3545 = _3541 || _3543;
                if (!_3545)
                {
                    float _3547 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3549 = _2918 + _3547;
                    float _3551 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3553 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3551;
                    float _3555 = 1.0 / _3553;
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3577 = _3549 * _3555;
                    float _3579 = precise::clamp(_3577, 0.0, 1.0);
                    float _3581 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3583 = _3581 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3585 = fma(_3579, _3559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3587 = fma(_3579, _3583, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3589 = fma(_3579, _3563, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3591 = fma(_3579, _3567, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3593 = fma(_3579, _3571, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3595 = fma(_3579, _3575, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3387 = _3585;
                    _3441 = _3593;
                    _3381 = _3587;
                    _3399 = _3591;
                    _3393 = _3589;
                    _3449 = _3595;
                    _3511 = true;
                }
                else
                {
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3381 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3449 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3511 = false;
    float _3597 = _3387;
    float _3599 = _3441;
    float _3601 = _3381;
    float _3603 = _3399;
    float _3605 = _3393;
    float _3607 = _3449;
    float _3609 = fma(_3375, -0.5, 0.5);
    float _3611 = precise::clamp(_3609, 0.0, 1.0);
    float _3613 = -_3597;
    float _3615 = _3613 + _3599;
    float _3617 = _3359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3619 = -_3601;
    float _3621 = _3619 + _3603;
    out.m_86.x = 0.0;
    float _3623 = fma(_3611, _3615, _3597);
    float _3625 = fma(_3611, _3621, _3601);
    out.m_49.x = _3617;
    float _3627 = -_3605;
    float _3629 = _3627 + _3607;
    float _3631 = _3623 * 0.586610972881317138671875;
    bool _3633 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3635 = fma(_3611, _3629, _3605);
    float _3637 = fma(_3625, 0.298911988735198974609375, _3631);
    bool _3639 = _2896 > 0.0;
    bool _3641 = isnan(_2896);
    bool _3643 = _3639 || _3641;
    bool _3645 = isnan(0.0);
    bool _3647 = _3643 || _3645;
    float _3649 = fma(_3635, 0.114477999508380889892578125, _3637);
    float _3651 = -_3649;
    float _3653 = _3625 + _3651;
    float _3655 = -_3649;
    float _3657 = _3623 + _3655;
    float _3659 = -_3649;
    float _3661 = _3635 + _3659;
    float _3663 = fma(_3653, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    float _3665 = fma(_3657, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    float _3667 = fma(_3661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    bool _3669 = !_3633;
    if (!_3669)
    {
        float _3671 = -_2842;
        float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3675 = -_2844;
        float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3679 = -_2846;
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3683 = _3673 * _3673;
        float _3685 = fma(_3677, _3677, _3683);
        float _3687 = fma(_3681, _3681, _3685);
        float _3689 = sqrt(_3687);
        float _3691 = rsqrt(_3687);
        float _3693 = -_3689;
        float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3697 = _3695 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3699 = precise::clamp(_3697, 0.0, 1.0);
        float _3701 = _3677 * _3691;
        float _3703 = _3673 * _3691;
        float _3705 = abs(_3699);
        float _3707 = log2(_3705);
        float _3709 = _3681 * _3691;
        float _3711 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3713 = _3375 * _3703;
        float _3715 = -_3703;
        float _3717 = -_3711;
        float _3719 = fma(_3715, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3717);
        float _3721 = fma(_3373, _3701, _3713);
        float _3723 = -_3709;
        float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3719);
        float _3727 = fma(_3377, _3709, _3721);
        float _3729 = precise::clamp(_3727, 0.0, 1.0);
        float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3733 = _3725 + _3731;
        float _3735 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3737 = _3733 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3739 = precise::clamp(_3737, 0.0, 1.0);
        float _3741 = exp2(_3735);
        float _3743 = _3741 * _3739;
        float _3745 = _3729 * _3743;
        float _3747 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3749 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3751 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3747;
        out.m_86.y = _3749;
        out.m_86.z = _3751;
    }
    out.m_88.x = _3663;
    out.m_88.y = _3665;
    out.m_88.z = _3667;
    if (_3647)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3753 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3753;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3511 = false;
    bool _987 = false;
    bool _817 = false;
    bool _597 = false;
    bool _421 = false;
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
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3810 = as_type<float>(_123);
        out.gl_Position.z = _3810;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_107);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3878 = as_type<float>(_159);
        out.gl_Position.z = _3878;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _187 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _189 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    float _191 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    bool _197 = !_171;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_175;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_177;
    float _207 = _191;
    float _225;
    if (!_205)
    {
        float _209 = in.m_58.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_107);
        float _231 = 1.0 / _229;
        float _233 = _141 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _235 + _269;
    float _273 = 1.0 / _263;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _277 = 1.0 / _259;
    float _279 = 1.0 / _267;
    float _281 = _271 * _273;
    bool _283 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_235);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = _239 * _277;
    bool _297 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_235);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -_255;
    float _311 = _309 + 1.0;
    float _313 = _307 * _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _243 * _279;
    bool _321 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _323 = isnan(_235);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _331 * _335;
    float _351 = -_331;
    float _353 = _351 + 1.0;
    float _355 = fma(_339, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_343, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_317, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = _293 * _353;
    float _363 = fma(_347, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = -_293;
    float _367 = _365 + 1.0;
    float _369 = _355 * _361;
    float _371 = _357 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _383 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_359, _349, _381);
    float _391 = fma(_363, _349, _383);
    float _393 = fma(_385, _313, _389);
    float _395 = fma(_387, _313, _391);
    float _397 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    bool _401 = !_275;
    float _419;
    if (!_401)
    {
        float _403 = in.m_58.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_107);
        float _425 = 1.0 / _423;
        float _427 = _141 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_60.x;
    float _433 = in.m_60.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    bool _439 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = isnan(_429);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _453 = _429 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _465 = isnan(_429);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _477 = isnan(_429);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _461;
    float _489 = -_485;
    float _491 = _489 + 1.0;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _495 = 1.0 / _457;
    float _497 = _473 * _491;
    float _499 = -_473;
    float _501 = _499 + 1.0;
    float _503 = _399 * _433;
    float _505 = _453 * _487;
    float _507 = _397 * _431;
    float _509 = _437 * _495;
    float _511 = -_449;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = _485 * _513;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _525;
    float _529 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _531 = fma(_523, _509, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_527, _509, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _535 = _529 * _497;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _541 = _531 * _497;
    float _543 = _533 * _497;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _553 = fma(_539, _505, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _555 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _541);
    float _557 = fma(_547, _505, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _559 = fma(_551, _505, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _561 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _535);
    float _563 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _543);
    float _565 = fma(_557, _519, _555);
    float _567 = fma(_553, _519, _561);
    float _569 = fma(_559, _519, _563);
    float _571 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].x, _565);
    float _573 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].y, _567);
    float _575 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].z, _569);
    bool _577 = !_493;
    float _595;
    if (!_577)
    {
        float _579 = in.m_58.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_107);
        float _601 = 1.0 / _599;
        float _603 = _141 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _609 = _605 + _607;
    float _611 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = isnan(_605);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _615;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _643 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _645 = isnan(_605);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _657 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _659 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = 1.0 / _623;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _669 = _619 * _637;
    bool _671 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _673 = isnan(_605);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _641;
    float _685 = -_635;
    float _687 = _685 + 1.0;
    float _689 = fma(_669, _609, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _695 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _697 = isnan(_605);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -_681;
    float _709 = _707 + 1.0;
    float _711 = _681 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _717 = 1.0 / _693;
    float _719 = -_705;
    float _721 = _719 + 1.0;
    float _723 = _653 * _709;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = _715 * _663;
    float _731 = _635 * _721;
    float _733 = _689 * _723;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _605 + _735;
    float _739 = -_653;
    float _741 = _739 + 1.0;
    bool _743 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _745 = isnan(_605);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _727 * _683;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _763 = _605 + _761;
    float _765 = fma(_729, _737, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _769 = -_753;
    float _771 = _769 + 1.0;
    float _773 = _759 * _717;
    float _775 = fma(_755, _763, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _779 = _605 + _777;
    float _781 = fma(_765, _711, _767);
    float _783 = _705 * _771;
    float _785 = fma(_773, _779, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _787 = fma(_775, _731, _781);
    float _789 = fma(_785, _783, _787);
    float _791 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[119].x, _789);
    float _793 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _659;
    out.m_62.y = _661;
    out.m_62.z = _665;
    out.m_62.w = _793;
    bool _795 = !_667;
    float _797 = _781;
    float _815;
    if (!_795)
    {
        float _799 = in.m_58.x;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _803 = _799 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[11].z, _141);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _815 = _813;
        _817 = true;
    }
    else
    {
        float _819 = float(_107);
        float _821 = 1.0 / _819;
        float _823 = _141 * _821;
        _815 = _823;
    }
    _817 = false;
    float _825 = _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _829 = _825 + _827;
    bool _831 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _845 = _825 + _843;
    bool _847 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _849 = isnan(_825);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _867 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _869 = isnan(_825);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -_841;
    float _881 = _879 + 1.0;
    float _883 = 1.0 / _865;
    float _885 = _877 * _881;
    float _887 = -_877;
    float _889 = _887 + 1.0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _891;
    bool _895 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _897 = 1.0 / _861;
    float _899 = _857 * _889;
    float _901 = -_857;
    float _903 = _901 + 1.0;
    float _905 = _829 * _897;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _911;
    float _915 = fma(_893, _905, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _917 = fma(_909, _905, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _919 = fma(_913, _905, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _921 = _845 * _883;
    float _923 = _915 * _899;
    float _925 = _917 * _899;
    float _927 = _919 * _899;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _941 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].x, _923);
    float _943 = fma(_931, _921, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _945 = fma(_935, _921, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _947 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].y, _925);
    float _949 = fma(_939, _921, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _951 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].z, _927);
    float _953 = fma(_943, _885, _941);
    float _955 = fma(_945, _885, _947);
    float _957 = fma(_949, _885, _951);
    float _959 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].x, _953);
    float _961 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].y, _955);
    float _963 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].z, _957);
    bool _965 = !_895;
    float _967 = _959;
    float _985;
    if (!_965)
    {
        float _969 = in.m_58.x;
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = _969 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _977 = _975 * _971;
        float _979 = floor(_977);
        float _981 = -_979;
        float _983 = _977 + _981;
        _985 = _983;
        _987 = true;
    }
    else
    {
        float _989 = float(_107);
        float _991 = 1.0 / _989;
        float _993 = _141 * _991;
        _985 = _993;
    }
    _987 = false;
    float _995 = _985;
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _999 = int(_997);
    float _1001 = float(_107);
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1005 = _1003 != 0;
    float _1007 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1009 = int(_1007);
    bool _1011 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1013 = isnan(_995);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1025 = float(_999);
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1029 = int(_1027);
    if (_1005)
    {
        float _1031 = in.m_58.x;
        _797 = _1031;
    }
    float _1033 = _797;
    float _1035 = _1033;
    if (!_1005)
    {
        float _1037 = in.m_58.y;
        _1035 = _1037;
    }
    float _1039 = _1035;
    float _1041 = float(uint(_1009));
    float _1043 = 1.0 / _1025;
    int _1045 = ~_1009;
    int _1047 = _1045 + 1;
    float _1049 = float(_1009);
    bool _1051 = _1009 == 0;
    float _1053 = 1.0 / _1041;
    float _1055 = float(uint(_1029));
    float _1057 = _141 * _1043;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1061 = int(_1059);
    int _1063 = as_type<int>(_1053) + (-2);
    float _1065 = trunc(_1057);
    int _1067 = int(_1065);
    int _1069 = ~_1009;
    int _1071 = _1069 + 1;
    float _1073 = float(_1061);
    float _1075 = 1.0 / _1055;
    float _1077 = float(uint(_1067));
    float _1079 = 1.0 / _1073;
    float _1081 = as_type<float>(_1063) * _1077;
    float _1083 = trunc(_1081);
    float _1085 = precise::max(_1083, 0.0);
    uint _1088 = uint(_1085);
    int _1090 = as_type<int>(_1075) + (-2);
    float _1092 = _141 * _1079;
    float _1094 = 1.0 / _1001;
    int _1096 = _1071 * int(_1088);
    int _1098 = _1096 + _1067;
    float _1100 = trunc(_1092);
    int _1102 = int(_1100);
    float _1104 = float(uint(_1098));
    float _1106 = in.m_58.x;
    float _1108 = in.m_58.y;
    float _1110 = in.m_58.z;
    float _1112 = in.m_58.w;
    float _1114 = as_type<float>(_1063) * _1104;
    float _1116 = _1104;
    if (_1005)
    {
        _1116 = 1.0;
    }
    float _1118 = _1116;
    float _1120 = _1118;
    if (!_1005)
    {
        _1120 = 7.345489978790283203125;
    }
    float _1122 = _1120;
    float _1124 = trunc(_1114);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    float _1130 = _1122 * _1106;
    int _1132 = int(_1088) + int(_1128);
    float _1134 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1136 = float(_1067);
    float _1138 = floor(_1130);
    float _1140 = _1122;
    float _1142 = _1110;
    if (_1005)
    {
        _1140 = 1.0;
    }
    float _1144 = _1140;
    int _1146 = _1047 * _1132;
    int _1148 = _1146 + _1067;
    float _1150 = _1144;
    if (!_1005)
    {
        _1150 = 1.2345600128173828125;
    }
    float _1152 = _1150;
    float _1154 = fma(_1134, -2.0, _1023);
    bool _1156 = _1136 >= _1049;
    bool _1158 = isnan(_1136);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(_1049);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    bool _1168 = uint(_1148) >= uint(_1009);
    float _1170 = _1039 * _1152;
    float _1172 = trunc(_1166);
    int _1174 = int(_1172);
    bool _1176 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1178 = isnan(_995);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    bool _1188 = !_1168;
    int _1190 = _1188 ? 0 : (-1);
    int _1192 = ~_1132;
    int _1194 = _1192 + _1190;
    int _1196 = _1194 + 1;
    float _1198 = floor(_1170);
    float _1200 = float(uint(_1102));
    float _1202 = -_1138;
    float _1204 = _1130 + _1202;
    int _1206 = _1009 * _1196;
    int _1208 = _1206 + _1067;
    int _1210 = _1009 + (-1);
    float _1212 = as_type<float>(_1090) * _1200;
    int _1214 = ~_1174;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    bool _1220 = !_1051;
    int _1222 = _1220 ? _1208 : (-1);
    float _1224 = trunc(_1212);
    float _1226 = precise::max(_1224, 0.0);
    uint _1228 = uint(_1226);
    int _1230 = _1222 * _1218;
    float _1232 = -_1198;
    float _1234 = _1170 + _1232;
    int _1236 = ~_1029;
    int _1238 = _1236 + 1;
    int _1240 = _1174 * _1210;
    int _1242 = _1240 + _1230;
    float _1244 = _141 * _1094;
    float _1246 = _1204 * _1049;
    float _1248 = _1244 * _1049;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1264 = _1262 != 0;
    int _1266 = _1238 * int(_1228);
    int _1268 = _1266 + _1102;
    float _1270 = trunc(_1246);
    int _1272 = int(_1270);
    bool _1274 = !_1256;
    int _1276 = _1274 ? 0 : 1;
    bool _1278 = !_1252;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = float(uint(_1268));
    bool _1284 = !_1264;
    int _1286 = _1284 ? 0 : 1;
    float _1288 = trunc(_1248);
    int _1290 = int(_1288);
    int _1292 = abs(_1276);
    float _1294 = as_type<float>(_1090) * _1282;
    int _1296 = abs(_1286);
    int _1298 = abs(_1280);
    int _1300 = _1242 * _1292;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1304 = _1302 != 0;
    float _1306 = trunc(_1294);
    float _1308 = precise::max(_1306, 0.0);
    uint _1310 = uint(_1308);
    bool _1312 = !_1260;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _1272 * _1296;
    int _1318 = _1316 + _1067;
    bool _1320 = !_1304;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = abs(_1314);
    int _1326 = ~_1029;
    int _1328 = _1326 + 1;
    int _1330 = _1290 * _1298;
    int _1332 = _1330 + _1300;
    int _1334 = abs(_1322);
    float _1336 = float(_1029);
    int _1338 = _1318 * _1324;
    int _1340 = _1338 + _1332;
    float _1342 = float(_1102);
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1346 = _1344 != 0;
    int _1348 = _1272 * _1334;
    int _1350 = _1348 + _1340;
    int _1352 = int(_1228) + int(_1310);
    float _1354 = _1234 * _1336;
    float _1356 = float(uint(_1350));
    bool _1358 = _1342 >= _1336;
    bool _1360 = isnan(_1342);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan(_1336);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    int _1370 = _1328 * _1352;
    int _1372 = _1370 + _1102;
    float _1374 = trunc(_1354);
    int _1376 = int(_1374);
    float _1378 = as_type<float>(_1063) * _1356;
    float _1380 = _1244 * _1336;
    int _1382 = _1029 + (-1);
    bool _1384 = uint(_1372) >= uint(_1029);
    bool _1386 = !_1346;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = trunc(_1368);
    int _1392 = int(_1390);
    bool _1394 = !_1384;
    int _1396 = _1394 ? 0 : (-1);
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1412 = _1410 != 0;
    int _1414 = ~_1352;
    int _1416 = _1414 + _1396;
    int _1418 = _1416 + 1;
    int _1420 = ~_1009;
    int _1422 = _1420 + 1;
    float _1424 = trunc(_1378);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = abs(_1388);
    int _1432 = _1029 * _1418;
    int _1434 = _1432 + _1102;
    bool _1436 = _1029 == 0;
    int _1438 = _1376 * _1430;
    int _1440 = _1438 + _1102;
    bool _1442 = !_1436;
    int _1444 = _1442 ? _1434 : (-1);
    float _1446 = trunc(_1380);
    int _1448 = int(_1446);
    int _1450 = ~_1392;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    bool _1456 = _1009 == 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1460 = _1458 != 0;
    int _1462 = _1444 * _1454;
    bool _1464 = !_1404;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1422 * int(_1428);
    int _1470 = _1468 + _1350;
    int _1472 = _1392 * _1382;
    int _1474 = _1472 + _1462;
    bool _1476 = !_1400;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = float(uint(_1470));
    int _1482 = abs(_1466);
    bool _1484 = !_1408;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = as_type<float>(_1063) * _1480;
    int _1490 = abs(_1478);
    bool _1492 = !_1412;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = trunc(_1488);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = abs(_1486);
    int _1504 = _1474 * _1482;
    int _1506 = abs(_1494);
    int _1508 = _1448 * _1490;
    int _1510 = _1508 + _1504;
    float _1512 = float(uint(_1318));
    int _1514 = _1440 * _1502;
    int _1516 = _1514 + _1510;
    float _1518 = float(uint(_1440));
    float _1520 = as_type<float>(_1063) * _1512;
    int _1522 = ~_1009;
    int _1524 = _1522 + 1;
    int _1526 = _1376 * _1506;
    int _1528 = _1526 + _1516;
    int _1530 = 0;
    if (_1460)
    {
        _1530 = 0;
    }
    int _1532 = _1530;
    float _1534 = as_type<float>(_1090) * _1518;
    int _1536 = int(_1428) + int(_1500);
    float _1538 = trunc(_1520);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = float(uint(_1528));
    int _1546 = ~_1029;
    int _1548 = _1546 + 1;
    int _1550 = _1524 * _1536;
    int _1552 = _1550 + _1350;
    int _1554 = _1532;
    if (!_1460)
    {
        _1554 = 1;
    }
    int _1556 = _1554;
    float _1558 = trunc(_1534);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    float _1564 = as_type<float>(_1090) * _1544;
    bool _1566 = _1106 > 0.5;
    bool _1568 = uint(_1552) >= uint(_1009);
    float _1570 = -_199;
    int _1572 = _1566 ? as_type<int>(_1570) : as_type<int>(_199);
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    bool _1580 = !_1568;
    int _1582 = _1580 ? 0 : (-1);
    int _1584 = _1524 * int(_1542);
    int _1586 = _1584 + _1318;
    int _1588 = ~_1029;
    int _1590 = _1588 + 1;
    int _1592 = ~_1536;
    int _1594 = _1592 + _1582;
    int _1596 = _1594 + 1;
    float _1598 = float(uint(_1586));
    int _1600 = _1548 * int(_1562);
    int _1602 = _1600 + _1440;
    bool _1604 = _1108 > 0.5;
    int _1606 = _1009 * _1596;
    int _1608 = _1606 + _1350;
    float _1610 = as_type<float>(_1063) * _1598;
    float _1612 = float(uint(_1602));
    bool _1614 = !_1456;
    int _1616 = _1614 ? _1608 : (-1);
    int _1618 = _1590 * int(_1578);
    int _1620 = _1618 + _1528;
    int _1622 = ~_1009;
    int _1624 = _1622 + 1;
    float _1626 = as_type<float>(_1090) * _1612;
    int _1628 = _1616 & 3;
    bool _1630 = _1628 != 0;
    float _1632 = trunc(_1610);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = float(uint(_1620));
    bool _1640 = uint(_1628) > 1u;
    int _1642 = _1616 & 3;
    bool _1644 = _1642 != 0;
    float _1646 = as_type<float>(_1090) * _1638;
    bool _1648 = uint(_1628) >= 2u;
    float _1650 = trunc(_1626);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    int _1656 = _1644 ? 0 : 1;
    bool _1658 = _1112 > 0.5;
    int _1660 = ~_1656;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    float _1666 = trunc(_1646);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = _1664;
    if (!_1640)
    {
        int _1674 = ~_1656;
        int _1676 = _1674 + 1;
        _1672 = _1676;
    }
    int _1678 = _1672;
    bool _1680 = _1628 != 3;
    int _1682 = int(_1542) + int(_1636);
    int _1684 = ~_1029;
    int _1686 = _1684 + 1;
    int _1688 = _1648 ? 0 : 1;
    int _1690 = _1624 * _1682;
    int _1692 = _1690 + _1318;
    int _1694 = int(_1562) + int(_1654);
    int _1696 = int(_1578) + int(_1670);
    int _1698 = ~_1029;
    int _1700 = _1698 + 1;
    int _1702 = ~_1688;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = uint(_1692) >= uint(_1009);
    int _1710 = _1686 * _1694;
    int _1712 = _1710 + _1440;
    int _1714 = _1706;
    if (_1680)
    {
        int _1716 = ~_1688;
        int _1718 = _1716 + 1;
        _1714 = _1718;
    }
    int _1720 = _1714;
    bool _1722 = !_1708;
    int _1724 = _1722 ? 0 : (-1);
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1728 = _1726 != 0;
    int _1730 = _1700 * _1696;
    int _1732 = _1730 + _1528;
    bool _1734 = uint(_1712) >= uint(_1029);
    bool _1736 = !_1728;
    int _1738 = _1736 ? 0 : 1;
    bool _1740 = !_1734;
    int _1742 = _1740 ? 0 : (-1);
    int _1744 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1746 = _1744 != 0;
    bool _1748 = uint(_1732) >= uint(_1029);
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1754 = in.m_46.x;
    float _1756 = in.m_46.y;
    float _1758 = in.m_46.z;
    bool _1760 = !_1746;
    float _1762 = _1760 ? _199 : as_type<float>(_1572);
    float _1764 = 1.0 / _1752;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1768 = _1766 != 0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1774 = -_203;
    int _1776 = _1604 ? as_type<int>(_1774) : as_type<int>(_203);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1780 = _1110 > 0.5;
    bool _1782 = !_1768;
    float _1784 = _1782 ? _203 : as_type<float>(_1776);
    float _1786 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1788 = 1.0 / _1772;
    bool _1790 = !_1748;
    int _1792 = _1790 ? 0 : (-1);
    float _1794 = -_1778;
    float _1796 = fma(_1786, 2.0, _1794);
    bool _1798 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1800 = isnan(_995);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -_199;
    int _1812 = _1780 ? as_type<int>(_1810) : as_type<int>(_199);
    float _1814 = -_141;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1796);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1820 = _1818 != 0;
    float _1822 = -_1808;
    float _1824 = _1822 + 1.0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1828 = _1826 != 0;
    float _1830 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1834 = _1832 != 0;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1836;
    float _1840 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1842 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1848 = _1838 * _1764;
    float _1850 = _1186 * _1824;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1854 = _995 + _1852;
    float _1856 = -_1186;
    float _1858 = _1856 + 1.0;
    float _1860 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1830);
    float _1862 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1840);
    float _1864 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1842);
    float _1866 = _1846 * _1788;
    bool _1868 = !_1834;
    float _1870 = _1868 ? _199 : as_type<float>(_1812);
    float _1872 = fma(_1848, _1854, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1874 = _1021 * _1858;
    bool _1876 = _1556 != 1;
    float _1878 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1860);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1882 = _995 + _1880;
    float _1884 = _1872 * _1874;
    float _1886 = _1762 + 0.5;
    float _1888 = -_1021;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1862);
    float _1894 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1864);
    float _1896 = fma(_1866, _1882, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1816);
    float _1900 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1884);
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1904 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1154);
    float _1906 = _1866;
    float _1908 = _1842;
    if (!_1876)
    {
        _1906 = _1108;
    }
    float _1910 = _1906;
    float _1912 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1902);
    float _1914 = _1910;
    if (!_1876)
    {
        _1908 = _1108;
    }
    float _1916 = _1908;
    float _1918 = _1784 + (-0.5);
    float _1920 = _1916;
    float _1922 = _1918;
    if (_1876)
    {
        _1914 = _1106;
    }
    float _1924 = _1914;
    float _1926 = fma(_1896, _1850, _1900);
    if (_1876)
    {
        _1920 = _1106;
    }
    float _1928 = _1920;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1932 = -_1918;
    float _1934 = -_1904;
    float _1936 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1934);
    int _1938 = ~_1696;
    int _1940 = _1938 + _1792;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1930);
    if (!_1876)
    {
        _1922 = _1110;
    }
    float _1946 = _1922;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1950 = _1946;
    if (_1876)
    {
        _1142 = _1108;
    }
    float _1952 = _1142;
    int _1954 = _1029 * _1942;
    int _1956 = _1954 + _1528;
    if (_1876)
    {
        _1950 = _1108;
    }
    float _1958 = _1950;
    float _1960 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1948);
    int _1962 = _1616 >> 31;
    float _1964 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1966 = !_1436;
    int _1968 = _1966 ? _1956 : (-1);
    float _1970 = _1892 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1972 = _1962 & 3;
    float _1974 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1926);
    int _1976 = _1968 >> 31;
    float _1978 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1980 = _1616 + _1972;
    float _1982 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1912);
    int _1984 = _1976 & 3;
    float _1986 = _1894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1988 = _1980 >> 2;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1978 + _1990;
    int _1994 = _1968 + _1984;
    float _1996 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1944);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2000 = _1986 + _1998;
    bool _2002 = !_1630;
    int _2004 = _2002 ? 0 : 1;
    float _2006 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1960);
    int _2008 = _1968 & 3;
    bool _2010 = _2008 != 0;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2014 = _1988 << 4;
    int _2016 = _2014 + 368;
    float _2018 = _1870 + 0.5;
    int _2020 = _1968 & 3;
    bool _2022 = _2020 != 0;
    float _2024 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2012);
    int _2026 = _1994 >> 2;
    float _2028 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2030 = _2010 ? 0 : 1;
    uint _2032 = uint(int(uint(_2016) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    bool _2048 = uint(_2020) > 1u;
    float _2050 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2024);
    int _2052 = _2026 << 4;
    int _2054 = _2052 + 512;
    float _2056 = -_1982;
    float _2058 = _2056 + 1.0;
    float _2060 = -_2050;
    float _2062 = _2060 + 1.0;
    int _2064 = ~_2030;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    uint _2070 = uint(int(uint(_2054) >> uint(2)));
    uint _2072 = uint(int(uint(int(_2070)) >> uint(2)));
    int _2074 = int(_2070) & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = int(_2070) + 1;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    int _2082 = _2078 & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2088 = !_2022;
    int _2090 = _2088 ? 0 : 1;
    bool _2092 = _1628 != 3;
    float _2094 = -_2086;
    float _2096 = fma(_1964, 2.0, _2094);
    int _2098 = _2068;
    if (!_2048)
    {
        int _2100 = ~_2030;
        int _2102 = _2100 + 1;
        _2098 = _2102;
    }
    int _2104 = _2098;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2108 = _1970 + _2106;
    int _2110 = _2016 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2130 = uint(_2020) >= 2u;
    float _2132 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2134 = -_141;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2096);
    float _2138 = fma(_2028, -2.0, _2128);
    int _2140 = ~_1682;
    int _2142 = _2140 + _1724;
    int _2144 = _2142 + 1;
    float _2146 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2132);
    int _2148 = _2054 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    float _2166 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2138);
    int _2168 = _2130 ? 0 : 1;
    float _2170 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2146);
    bool _2172 = !_2092;
    int _2174 = _2172 ? 0 : (-1);
    int _2176 = _1009 * _2144;
    int _2178 = _2176 + _1318;
    bool _2180 = _2020 != 3;
    float _2182 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2136);
    int _2184 = abs(_1678);
    int _2186 = abs(_2104);
    int _2188 = ~_2168;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    int _2194 = abs(_2004);
    int _2196 = ~_2186;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    int _2202 = _2192;
    if (_2180)
    {
        int _2204 = ~_2168;
        int _2206 = _2204 + 1;
        _2202 = _2206;
    }
    int _2208 = _2202;
    int _2210 = ~_2184;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = abs(_2090);
    int _2218 = abs(_1720);
    int _2220 = _2214 * as_type<int>(_2046);
    bool _2222 = _2020 != 3;
    int _2224 = _2200 * as_type<int>(_2084);
    int _2226 = ~_2194;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    int _2232 = abs(_2208);
    int _2234 = _2230 * as_type<int>(_2038);
    int _2236 = _2234 + _2220;
    int _2238 = ~_2216;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = ~_2218;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = abs(_2174);
    int _2252 = _2242 * as_type<int>(_2076);
    int _2254 = _2252 + _2224;
    bool _2256 = !_2222;
    int _2258 = _2256 ? 0 : (-1);
    int _2260 = _2248 * as_type<int>(_2118);
    int _2262 = _2260 + _2236;
    int _2264 = ~_2250;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = abs(_2258);
    int _2272 = ~_2232;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = _2268 * as_type<int>(_2126);
    int _2280 = _2278 + _2262;
    bool _2282 = !_1828;
    int _2284 = _2282 ? 0 : 1;
    int _2286 = ~_1694;
    int _2288 = _2286 + _1742;
    int _2290 = _2288 + 1;
    int _2292 = _2276 * as_type<int>(_2156);
    int _2294 = _2292 + _2254;
    float _2296 = -_203;
    int _2298 = _1658 ? as_type<int>(_2296) : as_type<int>(_203);
    int _2300 = abs(_2284);
    int _2302 = ~_2270;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    bool _2308 = !_1820;
    float _2310 = _2308 ? _203 : as_type<float>(_2298);
    int _2312 = _1029 * _2290;
    int _2314 = _2312 + _1440;
    int _2316 = ~_2300;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _2306 * as_type<int>(_2164);
    int _2324 = _2322 + _2294;
    int _2326 = abs(_1738);
    float _2328 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2330 = !_1436;
    int _2332 = _2330 ? _2314 : (-1);
    int _2334 = _2324 * _2320;
    int _2336 = ~_2326;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    bool _2342 = !_1456;
    int _2344 = _2342 ? _2178 : (-1);
    int _2346 = _2332 * _2300;
    int _2348 = _2346 + _2334;
    float _2350 = _2108 * _2108;
    int _2352 = _2280 * _2340;
    bool _2354 = _2170 >= 0.0;
    float _2356 = _2310 + (-0.5);
    float _2358 = fma(_1992, _1992, _2350);
    int _2360 = _2344 * _2326;
    int _2362 = _2360 + _2352;
    float _2364 = -_1996;
    float _2366 = _2364 + 1.0;
    float _2368 = -_2356;
    float _2370 = -_2166;
    float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2370);
    float _2374 = fma(_2000, _2000, _2358);
    float _2376 = -_2006;
    float _2378 = _2376 + 1.0;
    float _2380 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = fma(_2310, _2062, _2372);
    float _2384 = _959 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2386 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2388 = rsqrt(_2374);
    if (_2354)
    {
        _967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2390 = _967;
    float _2392 = fma(_1784, _2366, _1936);
    float _2394 = -_2058;
    float _2396 = fma(_1762, _2394, _1898);
    float _2398 = -_2378;
    float _2400 = fma(_1870, _2398, _2182);
    float _2402 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2404 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2408 = as_type<int>(_2390);
    float _2410 = _2400;
    if (_2354)
    {
        float _2412 = _2390 * 5.0;
        _2408 = as_type<int>(_2412);
    }
    int _2414 = _2408;
    float _2416 = float(_2362);
    out.m_64.x = _2396;
    out.m_64.y = _2392;
    out.m_64.z = _2400;
    out.m_64.w = _2382;
    float _2418 = float(_2348);
    out.m_66.x = _2402;
    out.m_66.y = _2404;
    out.m_66.z = _2406;
    out.m_66.w = _2328;
    float _2420 = _2108 * _2388;
    float _2422 = _1992 * _2388;
    if (_2354)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7286 = as_type<float>(_2414);
        out.gl_Position.z = _7286;
    }
    out.m_68.x = _2416;
    out.m_68.y = _2418;
    if (_2354)
    {
        out.m_49.x = 0.0;
    }
    if (_2354)
    {
        return out;
    }
    float _2424 = -_2420;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1970);
    float _2428 = _2000 * _2388;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1978);
    float _2434 = -_2420;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2108);
    float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2440 = _2426 + _2438;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1986);
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2432 + _2446;
    float _2450 = -_2422;
    float _2452 = fma(_2450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1992);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2458 = _2444 + _2456;
    float _2460 = _2436 * _2436;
    float _2462 = -_2428;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2000);
    float _2466 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2454);
    float _2468 = fma(_2452, _2452, _2460);
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2466);
    float _2472 = fma(_2464, _2464, _2468);
    bool _2474 = _2470 >= 0.0;
    float _2476 = sqrt(_2472);
    float _2478 = _2432;
    if (_2474)
    {
        _2410 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2480 = _2410;
    int _2482 = as_type<int>(_2480);
    if (_2474)
    {
        out.m_49.x = 0.0;
    }
    float _2484 = _2388 * _2476;
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
        float _7422 = as_type<float>(_2488);
        out.gl_Position.z = _7422;
    }
    if (_2474)
    {
        return out;
    }
    float _2490 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2492 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2498 = _2484 * _2490;
    float _2500 = _2484 * _2492;
    float _2502 = _2494 * _2498;
    float _2504 = _2496 * _2500;
    float _2506 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2508 = _2506 * 0.5;
    float _2510 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2512 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2514 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2510);
    float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2512);
    float _2520 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2522 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    float _2524 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2518);
    float _2526 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    float _2528 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2530 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2532 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2534 = _1986 + _2528;
    float _2536 = _1978 + _2530;
    float _2538 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2540 = _1970 + _2532;
    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2544 = _2534 + _2542;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2548 = _2536 + _2546;
    float _2550 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2538);
    float _2552 = _2544 * _2544;
    float _2554 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2550);
    float _2556 = fma(_2548, _2548, _2552);
    float _2558 = sqrt(_2556);
    bool _2560 = _2558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2562 = _2532;
    float _2564 = _2526;
    float _2566 = _2550;
    if (!_2560)
    {
        _2562 = _2536;
    }
    float _2568 = _2562;
    float _2570 = _2568;
    if (!_2560)
    {
        _2564 = _2534;
    }
    float _2572 = _2564;
    float _2574 = _2572;
    if (!_2560)
    {
        _2566 = _2540;
    }
    float _2576 = _2566;
    bool _2578 = !_2560;
    float _2580 = _2576;
    if (!_2578)
    {
        float _2582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2586 = _2558 + _2584;
        float _2588 = rsqrt(_2556);
        float _2590 = _2586 * _2582;
        float _2592 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2594 = _2590 * 0.15915493667125701904296875;
        float _2596 = _2594 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = _2594 * 6.283185482025146484375;
        float _2602 = sin(_2600);
        float _2604 = _2598 + (-1.0);
        float _2606 = fma(_2602, _2592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2608 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2610 = _2588 * _2606;
        float _2612 = fma(_2540, _2598, _2608);
        float _2614 = fma(_2548, _2610, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2616 = fma(_2544, _2610, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2580 = _2612;
        _2570 = _2614;
        _2574 = _2616;
    }
    float _2618 = _2580;
    float _2620 = _2570;
    float _2622 = _2574;
    float _2624 = -_1970;
    float _2626 = _2624 + _2618;
    float _2628 = -_1978;
    float _2630 = _2628 + _2620;
    float _2632 = _2554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2634 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2636 = _2626 * _2626;
    float _2638 = -_1986;
    float _2640 = _2638 + _2622;
    float _2642 = 1.0 / _2632;
    float _2644 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2634);
    float _2646 = fma(_2630, _2630, _2636);
    float _2648 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2644);
    float _2650 = fma(_2640, _2640, _2646);
    bool _2652 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2654 = isnan(0.5);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2660 = _2656 || _2658;
    float _2662 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2664 = sqrt(_2650);
    bool _2666 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2668 = isnan(0.5);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2674 = _2670 || _2672;
    float _2676 = _2662 + _2632;
    float _2678 = _2676 * _2642;
    float _2680 = _2678 * 0.5;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2684 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2682);
    float _2686 = 1.0 / _2684;
    bool _2688 = _2664 > 0.0;
    float _2690 = _2664;
    float _2692 = _2632;
    float _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2688)
    {
        _2690 = _2620;
    }
    float _2696 = _2690;
    float _2698 = _2696;
    if (!_2688)
    {
        _2692 = _2618;
    }
    float _2700 = _2692;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2688)
    {
        _2694 = _2622;
    }
    float _2706 = _2694;
    bool _2708 = !_2688;
    float _2710 = _2706;
    if (!_2708)
    {
        float _2712 = _193 * _193;
        float _2714 = fma(_191, _191, _2712);
        float _2716 = rsqrt(_2650);
        float _2718 = fma(_195, _195, _2714);
        float _2720 = sqrt(_2718);
        float _2722 = _2630 * _2716;
        float _2724 = _2626 * _2716;
        float _2726 = _2640 * _2716;
        bool _2728 = _2720 > 0.0;
        float _2730 = _2716;
        float _2732 = _2720;
        if (!_2728)
        {
            _2730 = _2620;
        }
        float _2734 = _2730;
        _2698 = _2734;
        if (!_2728)
        {
            _2702 = _2618;
        }
        float _2736 = _2702;
        _2704 = _2736;
        if (!_2728)
        {
            _2732 = _2622;
        }
        float _2738 = _2732;
        bool _2740 = !_2728;
        _2710 = _2738;
        if (!_2740)
        {
            float _2742 = rsqrt(_2718);
            float _2744 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2746 = _193 * _2742;
            float _2748 = _191 * _2742;
            float _2750 = _2724 * _2746;
            float _2752 = _195 * _2742;
            float _2754 = fma(_2722, _2748, _2750);
            float _2756 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2758 = fma(_2726, _2752, _2754);
            float _2760 = _2758 * _2756;
            float _2762 = fma(_191, _2760, _2620);
            float _2764 = fma(_193, _2760, _2618);
            float _2766 = fma(_195, _2760, _2622);
            _2710 = _2766;
            _2698 = _2762;
            _2704 = _2764;
        }
    }
    float _2768 = _2710;
    float _2770 = _2698;
    float _2772 = _2704;
    float _2774 = -_2428;
    float _2776 = fma(_2774, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2768);
    float _2778 = -_2422;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2770);
    float _2782 = -_2420;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2772);
    float _2786 = _2784;
    float _2788 = _2780;
    float _2790 = _2776;
    float _2792 = _2770;
    float _2794 = _2772;
    float _2796 = _2768;
    if (_2674)
    {
        _207 = 1.0;
    }
    float _2798 = _207;
    float _2800 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2802 = _2686 * _2800;
    float _2804 = _2798;
    if (!_2660)
    {
        float _2806 = _2440 * _2440;
        float _2808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2810 = -_1986;
        float _2812 = _2810 + _2768;
        float _2814 = fma(_2448, _2448, _2806);
        float _2816 = -_1978;
        float _2818 = _2816 + _2770;
        float _2820 = fma(_2458, _2458, _2814);
        float _2822 = 1.0 / _2484;
        float _2824 = sqrt(_2820);
        float _2826 = precise::min(_2824, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2828 = _2826 * _2808;
        float _2830 = -_1970;
        float _2832 = _2830 + _2772;
        float _2834 = _2828 * _2822;
        float _2836 = fma(_2832, _2834, _2426);
        float _2838 = fma(_2818, _2834, _2432);
        float _2840 = fma(_2812, _2834, _2444);
        _2786 = _2836;
        _2788 = _2838;
        _2790 = _2840;
    }
    float _2842 = _2786;
    float _2844 = _2788;
    float _2846 = _2790;
    if (!_2674)
    {
        float _2848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2850 = _2848 * 0.15915493667125701904296875;
        float _2852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2854 = _2850 * 6.283185482025146484375;
        float _2856 = cos(_2854);
        float _2858 = _2852 * 0.15915493667125701904296875;
        float _2860 = _2850 * 6.283185482025146484375;
        float _2862 = sin(_2860);
        float _2864 = 1.0 / _2856;
        float _2866 = _2858 * 6.283185482025146484375;
        float _2868 = cos(_2866);
        float _2870 = _2862 * _2864;
        float _2872 = _2858 * 6.283185482025146484375;
        float _2874 = sin(_2872);
        float _2876 = _2868 * _2870;
        float _2878 = 1.0 / _2876;
        float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2882 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2880;
        float _2884 = 1.0 / _2882;
        float _2886 = _2874 * _2878;
        float _2888 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2890 = fma(_2802, _2886, _2888);
        float _2892 = _2890 * _2884;
        float _2894 = precise::clamp(_2892, 0.0, 1.0);
        _2804 = _2894;
    }
    float _2896 = _2804;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2900 = _2842 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2904 = _2844 + _2902;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2908 = _2846 + _2906;
    float _2910 = _2900 * _2900;
    float _2912 = fma(_2904, _2904, _2910);
    float _2914 = fma(_2908, _2908, _2912);
    float _2916 = rsqrt(_2914);
    float _2918 = sqrt(_2914);
    float _2920 = _2916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2922 = _2904 * _2920;
    float _2924 = _2908 * _2920;
    float _2926 = _2922 * _2922;
    float _2928 = _2924 * _2924;
    float _2930 = _2926 + _2928;
    float _2932 = sqrt(_2930);
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2938 = _2932 + _2936;
    float _2940 = _2908;
    float _2942 = _2930;
    float _2944 = _2938;
    float _2946 = _2900;
    float _2948 = _2926;
    if (_2934)
    {
        float _2950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _2950;
    }
    float _2952 = _2940;
    if (_2934)
    {
        float _2954 = rsqrt(_2930);
        _2942 = _2954;
    }
    float _2956 = _2942;
    if (_2934)
    {
        float _2958 = _2938 * _2952;
        _2944 = _2958;
    }
    float _2960 = _2944;
    if (_2934)
    {
        float _2962 = _2960 * 0.15915493667125701904296875;
        _2792 = _2962;
    }
    float _2964 = _2792;
    float _2966 = _2916;
    if (_2934)
    {
        float _2968 = _2964 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        _2966 = _2970;
    }
    float _2972 = _2966;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2976 = precise::max(0.0, _2974);
    float _2978 = _2910;
    float _2980 = _2976;
    if (_2934)
    {
        float _2982 = _2964 * 6.283185482025146484375;
        float _2984 = cos(_2982);
        _2978 = _2984;
    }
    float _2986 = _2978;
    float _2988 = -_2920;
    float _2990 = -_2976;
    float _2992 = fma(_2900, _2988, _2990);
    if (!_2934)
    {
        _2946 = _2924;
    }
    float _2994 = _2946;
    float _2996 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2998 = _2994;
    if (_2934)
    {
        float _3000 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2980 = _3000;
    }
    float _3002 = _2980;
    float _3004 = _2972;
    float _3006 = _3002;
    if (_2934)
    {
        float _3008 = fma(_2972, _3002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3004 = _3008;
    }
    float _3010 = _3004;
    float _3012 = _3010;
    if (!_2934)
    {
        _3006 = _2992;
    }
    float _3014 = _3006;
    float _3016 = _3014;
    if (_2934)
    {
        float _3018 = _2986 + (-1.0);
        _2478 = _3018;
    }
    float _3020 = _2478;
    float _3022 = _3020;
    if (_2934)
    {
        float _3024 = _2956 * _3010;
        _2794 = _3024;
    }
    float _3026 = _2794;
    if (!_2934)
    {
        _3012 = _2922;
    }
    float _3028 = _3012;
    float _3030 = _3028;
    if (_2934)
    {
        float _3032 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2796 = _3032;
    }
    float _3034 = _2796;
    if (_2934)
    {
        float _3036 = _2922 * _3026;
        _3030 = _3036;
    }
    float _3038 = _3030;
    if (_2934)
    {
        float _3040 = _2924 * _3026;
        _2998 = _3040;
    }
    float _3042 = _2998;
    if (!_2934)
    {
        _3022 = _2928;
    }
    float _3044 = _3022;
    float _3046 = _3044;
    if (_2934)
    {
        float _3048 = fma(_2992, _2986, _3034);
        _3016 = _3048;
    }
    float _3050 = _3016;
    if (_2934)
    {
        float _3052 = _3038 * _3038;
        _2948 = _3052;
    }
    float _3054 = _2948;
    if (_2934)
    {
        float _3056 = _3042 * _3042;
        _3046 = _3056;
    }
    float _3058 = _3046;
    float _3060 = floor(_2996);
    float _3062 = fma(_3050, _3050, _3054);
    float _3064 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3068 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3066);
    float _3070 = precise::clamp(_3068, 0.0, 1.0);
    float _3072 = _3062 + _3058;
    float _3074 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3064);
    float _3076 = -_3070;
    float _3078 = _3076 + 1.0;
    float _3080 = rsqrt(_3072);
    float _3082 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3074);
    float _3084 = _3082 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3088 = abs(_3078);
    float _3090 = log2(_3088);
    float _3092 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3094 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3096 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3098 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3100 = -_3092;
    float _3102 = fma(_3100, _3086, 1.0);
    float _3104 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3106 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3096);
    float _3108 = _3080 * _3050;
    float _3110 = _3080 * _3038;
    float _3112 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3104);
    float _3114 = _3080 * _3042;
    float _3116 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3106);
    float _3118 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3120 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3112);
    float _3122 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3098);
    float _3124 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3126 = -_3118;
    float _3128 = fma(_3108, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3126);
    float _3130 = _3120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3132 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3122);
    float _3134 = floor(_3094);
    float _3136 = -_3114;
    float _3138 = fma(_3136, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3128);
    float _3140 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3142 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3144 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3146 = fma(_3138, -0.5, 0.5);
    float _3148 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3140);
    float _3150 = -_3060;
    float _3152 = _2996 + _3150;
    float _3154 = fma(_3138, 0.5, 0.5);
    float _3156 = log2(_3102);
    float _3158 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3148);
    float _3160 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3162 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3164 = _3108 + 1.0;
    float _3166 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3158);
    float _3168 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3160);
    float _3170 = exp2(_3144);
    float _3172 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3162);
    float _3174 = -_3134;
    float _3176 = _3094 + _3174;
    float _3178 = fma(_3154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3180 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3168);
    float _3182 = fma(_3154, _3178, -0.212114393711090087890625);
    float _3184 = 1.0 / _3166;
    float _3186 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3172);
    float _3188 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3180);
    float _3190 = fma(_3154, _3182, 1.570728778839111328125);
    float _3192 = _3156 * 0.693147182464599609375;
    float _3194 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3186);
    float _3196 = sqrt(_3146);
    float2 _8584 = float2(_3152, _3176);
    float _3198 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8584, float2(0.0), isnan(_8584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8584, float2(0.0), isnan(_8584)), level(0.0)).x;
    float _3200 = -_3108;
    float _3202 = fma(_3170, _3164, _3200);
    float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3206 = fma(_3202, 0.5, 0.5);
    float _3208 = _3188 * _3184;
    float _3210 = _3194 * _3184;
    float _3212 = fma(_3208, 0.5, 0.5);
    float _3214 = fma(_3210, -0.5, 0.5);
    float _3216 = _3196 * 0.636619746685028076171875;
    float3 _8620 = float3(_3212, _3214, _3204);
    float _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8620, float3(0.0), isnan(_8620)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8620, float3(0.0), isnan(_8620)), level(0.0)).x;
    float _3220 = -_3190;
    float _3222 = fma(_3216, _3220, 1.0);
    float3 _8636 = float3(_3212, _3214, _3204);
    float4 _3225 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8636, float3(0.0), isnan(_8636)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8636, float3(0.0), isnan(_8636)), level(0.0)).xyzw;
    float _3227 = _3225.x;
    float _3229 = _3225.y;
    float _3231 = _3225.z;
    float _3233 = _3225.w;
    float2 _8652 = float2(_3222, _3206);
    float3 _3237 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8652, float2(0.0), isnan(_8652)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8652, float2(0.0), isnan(_8652)), level(0.0)).xyz;
    float _3239 = _3237.x;
    float _3241 = _3237.y;
    float _3243 = _3237.z;
    float _3245 = abs(_2802);
    float _3247 = log2(_3245);
    float _3249 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3251 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3253 = fma(_3249, _3249, 1.0);
    out.m_70.x = _2844;
    out.m_70.y = _2842;
    out.m_70.z = _2846;
    bool _3255 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3257 = isnan(_2918);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3263 = _3259 || _3261;
    float _3265 = rsqrt(_3253);
    float _3267 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3269 = exp2(_3267);
    float _3271 = fma(_3269, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3273 = precise::clamp(_3271, 0.0, 1.0);
    float _3275 = fma(_3273, -2.0, 3.0);
    float _3277 = _3273 * _3273;
    float _3279 = _3277 * _3275;
    float _3281 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3283 = _3249 * _3265;
    float _3285 = -_3279;
    float _3287 = _3285 + 1.0;
    float _3289 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3281);
    float _3291 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3293 = _3283 * _3291;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3297 = _3283 * _3295;
    float _3299 = fma(_3287, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3279);
    float _3301 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3303 = _3283 * _3301;
    float _3305 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3293);
    float _3307 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3297);
    float _3309 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3303);
    float _3311 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3313 = in.m_72.x;
    float _3315 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3289);
    float _3317 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3319 = exp2(_3311);
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3321 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3315);
    float _3323 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3317);
    out.m_76.x = _3305;
    out.m_76.y = _3307;
    out.m_76.z = _3309;
    float _3325 = _3321 + _3166;
    bool _3327 = _2802 <= 8000.0;
    bool _3329 = isnan(_2802);
    bool _3331 = _3327 || _3329;
    bool _3333 = isnan(8000.0);
    bool _3335 = _3331 || _3333;
    float _3337 = float(_3335);
    float _3339 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3341 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3343 = -_3319;
    float _3345 = _3343 + 1.0;
    float _3347 = _3337 * _3299;
    float _3349 = _3325 * 0.5;
    float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3353 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3339);
    float _3355 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3357 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3341);
    out.gl_Position.x = _3188;
    out.gl_Position.y = _3194;
    out.gl_Position.z = _3321;
    out.gl_Position.w = _3166;
    float _3359 = _2896 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3361 = _3347;
    float _3363 = _3323;
    float _3365 = _3357;
    float _3367 = _3353;
    float _3369 = _3166;
    if (!_3263)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3371 = _3361;
    out.m_78.z = _3349;
    out.m_78.w = _3166;
    float _3373 = _3353 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3375 = _3357 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3377 = _3323 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3379 = _3371;
    float _3381 = _3371;
    if (!_3263)
    {
        _3363 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3383 = _3363;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3263)
    {
        _3365 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3389 = _3365;
    out.m_80.x = _3373;
    out.m_80.y = _3375;
    out.m_80.z = _3377;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3263)
    {
        _3367 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3395 = _3367;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3263)
    {
        _3369 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3401 = _3369;
    float _3403 = -_3198;
    float _3405 = _3403 + 1.0;
    float _3407 = _3405 * _3355;
    float _3409 = precise::clamp(_3407, 0.0, 1.0);
    float _3411 = -_3409;
    float _3413 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3415 = _3413 * _3313;
    float _3417 = _3351 * _3218;
    float _3419 = -_3351;
    float _3421 = _3419 + 1.0;
    float _3423 = _3415 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3425 = _3233 * _3417;
    out.m_82.x = _3423;
    float _3427 = _3243 * _3417;
    float _3429 = fma(_3239, _3425, _3227);
    float _3431 = fma(_3241, _3425, _3229);
    float _3433 = _3233 * _3421;
    float _3435 = fma(_3233, _3427, _3231);
    float _3437 = _3425;
    float _3439 = _3401;
    float _3441 = _3401;
    if (!_3263)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3443 = _3437;
    out.m_84.x = _3429;
    out.m_84.y = _3431;
    out.m_84.z = _3435;
    out.m_84.w = _3433;
    bool _3445 = !_3263;
    float _3447 = _3443;
    float _3449 = _3443;
    if (!_3445)
    {
        bool _3451 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3453 = isnan(_2918);
        bool _3455 = _3451 || _3453;
        bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3459 = _3455 || _3457;
        if (!_3459)
        {
            float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3463 = _2918 + _3461;
            float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3467 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3465;
            float _3469 = 1.0 / _3467;
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3491 = _3463 * _3469;
            float _3493 = precise::clamp(_3491, 0.0, 1.0);
            float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3499 = fma(_3493, _3473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3501 = fma(_3493, _3497, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3503 = fma(_3493, _3477, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3505 = fma(_3493, _3481, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3507 = fma(_3493, _3485, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3509 = fma(_3493, _3489, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3387 = _3499;
            _3441 = _3507;
            _3381 = _3501;
            _3399 = _3505;
            _3393 = _3503;
            _3449 = _3509;
            _3511 = true;
        }
        else
        {
            bool _3513 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3515 = isnan(_2918);
            bool _3517 = _3513 || _3515;
            bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3521 = _3517 || _3519;
            if (!_3521)
            {
                _3379 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3523 = _3379;
            _3381 = _3523;
            if (!_3521)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3525 = _3385;
            _3387 = _3525;
            if (!_3521)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3527 = _3391;
            _3393 = _3527;
            if (!_3521)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3529 = _3397;
            _3399 = _3529;
            if (!_3521)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3531 = _3439;
            _3441 = _3531;
            if (!_3521)
            {
                _3447 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3533 = _3447;
            bool _3535 = !_3521;
            _3449 = _3533;
            if (!_3535)
            {
                bool _3537 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3539 = isnan(_2918);
                bool _3541 = _3537 || _3539;
                bool _3543 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3545 = _3541 || _3543;
                if (!_3545)
                {
                    float _3547 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3549 = _2918 + _3547;
                    float _3551 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3553 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3551;
                    float _3555 = 1.0 / _3553;
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3577 = _3549 * _3555;
                    float _3579 = precise::clamp(_3577, 0.0, 1.0);
                    float _3581 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3583 = _3581 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3585 = fma(_3579, _3559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3587 = fma(_3579, _3583, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3589 = fma(_3579, _3563, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3591 = fma(_3579, _3567, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3593 = fma(_3579, _3571, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3595 = fma(_3579, _3575, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3387 = _3585;
                    _3441 = _3593;
                    _3381 = _3587;
                    _3399 = _3591;
                    _3393 = _3589;
                    _3449 = _3595;
                    _3511 = true;
                }
                else
                {
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3381 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3449 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3511 = false;
    float _3597 = _3387;
    float _3599 = _3441;
    float _3601 = _3381;
    float _3603 = _3399;
    float _3605 = _3393;
    float _3607 = _3449;
    float _3609 = fma(_3375, -0.5, 0.5);
    float _3611 = precise::clamp(_3609, 0.0, 1.0);
    float _3613 = -_3597;
    float _3615 = _3613 + _3599;
    float _3617 = _3359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3619 = -_3601;
    float _3621 = _3619 + _3603;
    out.m_86.x = 0.0;
    float _3623 = fma(_3611, _3615, _3597);
    float _3625 = fma(_3611, _3621, _3601);
    out.m_49.x = _3617;
    float _3627 = -_3605;
    float _3629 = _3627 + _3607;
    float _3631 = _3623 * 0.586610972881317138671875;
    bool _3633 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3635 = fma(_3611, _3629, _3605);
    float _3637 = fma(_3625, 0.298911988735198974609375, _3631);
    bool _3639 = _2896 > 0.0;
    bool _3641 = isnan(_2896);
    bool _3643 = _3639 || _3641;
    bool _3645 = isnan(0.0);
    bool _3647 = _3643 || _3645;
    float _3649 = fma(_3635, 0.114477999508380889892578125, _3637);
    float _3651 = -_3649;
    float _3653 = _3625 + _3651;
    float _3655 = -_3649;
    float _3657 = _3623 + _3655;
    float _3659 = -_3649;
    float _3661 = _3635 + _3659;
    float _3663 = fma(_3653, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    float _3665 = fma(_3657, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    float _3667 = fma(_3661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    bool _3669 = !_3633;
    if (!_3669)
    {
        float _3671 = -_2842;
        float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3675 = -_2844;
        float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3679 = -_2846;
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3683 = _3673 * _3673;
        float _3685 = fma(_3677, _3677, _3683);
        float _3687 = fma(_3681, _3681, _3685);
        float _3689 = sqrt(_3687);
        float _3691 = rsqrt(_3687);
        float _3693 = -_3689;
        float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3697 = _3695 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3699 = precise::clamp(_3697, 0.0, 1.0);
        float _3701 = _3677 * _3691;
        float _3703 = _3673 * _3691;
        float _3705 = abs(_3699);
        float _3707 = log2(_3705);
        float _3709 = _3681 * _3691;
        float _3711 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3713 = _3375 * _3703;
        float _3715 = -_3703;
        float _3717 = -_3711;
        float _3719 = fma(_3715, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3717);
        float _3721 = fma(_3373, _3701, _3713);
        float _3723 = -_3709;
        float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3719);
        float _3727 = fma(_3377, _3709, _3721);
        float _3729 = precise::clamp(_3727, 0.0, 1.0);
        float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3733 = _3725 + _3731;
        float _3735 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3737 = _3733 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3739 = precise::clamp(_3737, 0.0, 1.0);
        float _3741 = exp2(_3735);
        float _3743 = _3741 * _3739;
        float _3745 = _3729 * _3743;
        float _3747 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3749 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3751 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3747;
        out.m_86.y = _3749;
        out.m_86.z = _3751;
    }
    out.m_88.x = _3663;
    out.m_88.y = _3665;
    out.m_88.z = _3667;
    if (_3647)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3753 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3753;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3511 = false;
    bool _987 = false;
    bool _817 = false;
    bool _597 = false;
    bool _421 = false;
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
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3810 = as_type<float>(_123);
        out.gl_Position.z = _3810;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_107);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    if (_153)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _125 = as_type<int>(_157);
    }
    int _159 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3878 = as_type<float>(_159);
        out.gl_Position.z = _3878;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _187 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _189 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    float _191 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    bool _197 = !_171;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_175;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_177;
    float _207 = _191;
    float _225;
    if (!_205)
    {
        float _209 = in.m_58.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_107);
        float _231 = 1.0 / _229;
        float _233 = _141 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _235 + _269;
    float _273 = 1.0 / _263;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _277 = 1.0 / _259;
    float _279 = 1.0 / _267;
    float _281 = _271 * _273;
    bool _283 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_235);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = _239 * _277;
    bool _297 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_235);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -_255;
    float _311 = _309 + 1.0;
    float _313 = _307 * _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _243 * _279;
    bool _321 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _323 = isnan(_235);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_307;
    float _335 = _333 + 1.0;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _331 * _335;
    float _351 = -_331;
    float _353 = _351 + 1.0;
    float _355 = fma(_339, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_343, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_317, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = _293 * _353;
    float _363 = fma(_347, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = -_293;
    float _367 = _365 + 1.0;
    float _369 = _355 * _361;
    float _371 = _357 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _383 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_359, _349, _381);
    float _391 = fma(_363, _349, _383);
    float _393 = fma(_385, _313, _389);
    float _395 = fma(_387, _313, _391);
    float _397 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    bool _401 = !_275;
    float _419;
    if (!_401)
    {
        float _403 = in.m_58.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_107);
        float _425 = 1.0 / _423;
        float _427 = _141 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_60.x;
    float _433 = in.m_60.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    bool _439 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = isnan(_429);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _453 = _429 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _465 = isnan(_429);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _477 = isnan(_429);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _461;
    float _489 = -_485;
    float _491 = _489 + 1.0;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _495 = 1.0 / _457;
    float _497 = _473 * _491;
    float _499 = -_473;
    float _501 = _499 + 1.0;
    float _503 = _399 * _433;
    float _505 = _453 * _487;
    float _507 = _397 * _431;
    float _509 = _437 * _495;
    float _511 = -_449;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = _485 * _513;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _525;
    float _529 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _531 = fma(_523, _509, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_527, _509, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _535 = _529 * _497;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _541 = _531 * _497;
    float _543 = _533 * _497;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _553 = fma(_539, _505, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _555 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _541);
    float _557 = fma(_547, _505, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _559 = fma(_551, _505, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _561 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _535);
    float _563 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _543);
    float _565 = fma(_557, _519, _555);
    float _567 = fma(_553, _519, _561);
    float _569 = fma(_559, _519, _563);
    float _571 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].x, _565);
    float _573 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].y, _567);
    float _575 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[109].z, _569);
    bool _577 = !_493;
    float _595;
    if (!_577)
    {
        float _579 = in.m_58.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_107);
        float _601 = 1.0 / _599;
        float _603 = _141 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _609 = _605 + _607;
    float _611 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = isnan(_605);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _615;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _643 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _645 = isnan(_605);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _657 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _659 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = 1.0 / _623;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _669 = _619 * _637;
    bool _671 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _673 = isnan(_605);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _641;
    float _685 = -_635;
    float _687 = _685 + 1.0;
    float _689 = fma(_669, _609, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _695 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _697 = isnan(_605);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -_681;
    float _709 = _707 + 1.0;
    float _711 = _681 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _717 = 1.0 / _693;
    float _719 = -_705;
    float _721 = _719 + 1.0;
    float _723 = _653 * _709;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = _715 * _663;
    float _731 = _635 * _721;
    float _733 = _689 * _723;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _737 = _605 + _735;
    float _739 = -_653;
    float _741 = _739 + 1.0;
    bool _743 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _745 = isnan(_605);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _727 * _683;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _763 = _605 + _761;
    float _765 = fma(_729, _737, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _769 = -_753;
    float _771 = _769 + 1.0;
    float _773 = _759 * _717;
    float _775 = fma(_755, _763, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _779 = _605 + _777;
    float _781 = fma(_765, _711, _767);
    float _783 = _705 * _771;
    float _785 = fma(_773, _779, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _787 = fma(_775, _731, _781);
    float _789 = fma(_785, _783, _787);
    float _791 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[119].x, _789);
    float _793 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _659;
    out.m_62.y = _661;
    out.m_62.z = _665;
    out.m_62.w = _793;
    bool _795 = !_667;
    float _797 = _781;
    float _815;
    if (!_795)
    {
        float _799 = in.m_58.x;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _803 = _799 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[11].z, _141);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _815 = _813;
        _817 = true;
    }
    else
    {
        float _819 = float(_107);
        float _821 = 1.0 / _819;
        float _823 = _141 * _821;
        _815 = _823;
    }
    _817 = false;
    float _825 = _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _829 = _825 + _827;
    bool _831 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _845 = _825 + _843;
    bool _847 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _849 = isnan(_825);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _867 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _869 = isnan(_825);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -_841;
    float _881 = _879 + 1.0;
    float _883 = 1.0 / _865;
    float _885 = _877 * _881;
    float _887 = -_877;
    float _889 = _887 + 1.0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _891;
    bool _895 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _897 = 1.0 / _861;
    float _899 = _857 * _889;
    float _901 = -_857;
    float _903 = _901 + 1.0;
    float _905 = _829 * _897;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _911;
    float _915 = fma(_893, _905, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _917 = fma(_909, _905, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _919 = fma(_913, _905, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _921 = _845 * _883;
    float _923 = _915 * _899;
    float _925 = _917 * _899;
    float _927 = _919 * _899;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _941 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].x, _923);
    float _943 = fma(_931, _921, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _945 = fma(_935, _921, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _947 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].y, _925);
    float _949 = fma(_939, _921, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _951 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[123].z, _927);
    float _953 = fma(_943, _885, _941);
    float _955 = fma(_945, _885, _947);
    float _957 = fma(_949, _885, _951);
    float _959 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].x, _953);
    float _961 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].y, _955);
    float _963 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[125].z, _957);
    bool _965 = !_895;
    float _967 = _959;
    float _985;
    if (!_965)
    {
        float _969 = in.m_58.x;
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = _969 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _977 = _975 * _971;
        float _979 = floor(_977);
        float _981 = -_979;
        float _983 = _977 + _981;
        _985 = _983;
        _987 = true;
    }
    else
    {
        float _989 = float(_107);
        float _991 = 1.0 / _989;
        float _993 = _141 * _991;
        _985 = _993;
    }
    _987 = false;
    float _995 = _985;
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _999 = int(_997);
    float _1001 = float(_107);
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1005 = _1003 != 0;
    float _1007 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1009 = int(_1007);
    bool _1011 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1013 = isnan(_995);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1025 = float(_999);
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1029 = int(_1027);
    if (_1005)
    {
        float _1031 = in.m_58.x;
        _797 = _1031;
    }
    float _1033 = _797;
    float _1035 = _1033;
    if (!_1005)
    {
        float _1037 = in.m_58.y;
        _1035 = _1037;
    }
    float _1039 = _1035;
    float _1041 = float(uint(_1009));
    float _1043 = 1.0 / _1025;
    int _1045 = ~_1009;
    int _1047 = _1045 + 1;
    float _1049 = float(_1009);
    bool _1051 = _1009 == 0;
    float _1053 = 1.0 / _1041;
    float _1055 = float(uint(_1029));
    float _1057 = _141 * _1043;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1061 = int(_1059);
    int _1063 = as_type<int>(_1053) + (-2);
    float _1065 = trunc(_1057);
    int _1067 = int(_1065);
    int _1069 = ~_1009;
    int _1071 = _1069 + 1;
    float _1073 = float(_1061);
    float _1075 = 1.0 / _1055;
    float _1077 = float(uint(_1067));
    float _1079 = 1.0 / _1073;
    float _1081 = as_type<float>(_1063) * _1077;
    float _1083 = trunc(_1081);
    float _1085 = precise::max(_1083, 0.0);
    uint _1088 = uint(_1085);
    int _1090 = as_type<int>(_1075) + (-2);
    float _1092 = _141 * _1079;
    float _1094 = 1.0 / _1001;
    int _1096 = _1071 * int(_1088);
    int _1098 = _1096 + _1067;
    float _1100 = trunc(_1092);
    int _1102 = int(_1100);
    float _1104 = float(uint(_1098));
    float _1106 = in.m_58.x;
    float _1108 = in.m_58.y;
    float _1110 = in.m_58.z;
    float _1112 = in.m_58.w;
    float _1114 = as_type<float>(_1063) * _1104;
    float _1116 = _1104;
    if (_1005)
    {
        _1116 = 1.0;
    }
    float _1118 = _1116;
    float _1120 = _1118;
    if (!_1005)
    {
        _1120 = 7.345489978790283203125;
    }
    float _1122 = _1120;
    float _1124 = trunc(_1114);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    float _1130 = _1122 * _1106;
    int _1132 = int(_1088) + int(_1128);
    float _1134 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1136 = float(_1067);
    float _1138 = floor(_1130);
    float _1140 = _1122;
    float _1142 = _1110;
    if (_1005)
    {
        _1140 = 1.0;
    }
    float _1144 = _1140;
    int _1146 = _1047 * _1132;
    int _1148 = _1146 + _1067;
    float _1150 = _1144;
    if (!_1005)
    {
        _1150 = 1.2345600128173828125;
    }
    float _1152 = _1150;
    float _1154 = fma(_1134, -2.0, _1023);
    bool _1156 = _1136 >= _1049;
    bool _1158 = isnan(_1136);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(_1049);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    bool _1168 = uint(_1148) >= uint(_1009);
    float _1170 = _1039 * _1152;
    float _1172 = trunc(_1166);
    int _1174 = int(_1172);
    bool _1176 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1178 = isnan(_995);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    bool _1188 = !_1168;
    int _1190 = _1188 ? 0 : (-1);
    int _1192 = ~_1132;
    int _1194 = _1192 + _1190;
    int _1196 = _1194 + 1;
    float _1198 = floor(_1170);
    float _1200 = float(uint(_1102));
    float _1202 = -_1138;
    float _1204 = _1130 + _1202;
    int _1206 = _1009 * _1196;
    int _1208 = _1206 + _1067;
    int _1210 = _1009 + (-1);
    float _1212 = as_type<float>(_1090) * _1200;
    int _1214 = ~_1174;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    bool _1220 = !_1051;
    int _1222 = _1220 ? _1208 : (-1);
    float _1224 = trunc(_1212);
    float _1226 = precise::max(_1224, 0.0);
    uint _1228 = uint(_1226);
    int _1230 = _1222 * _1218;
    float _1232 = -_1198;
    float _1234 = _1170 + _1232;
    int _1236 = ~_1029;
    int _1238 = _1236 + 1;
    int _1240 = _1174 * _1210;
    int _1242 = _1240 + _1230;
    float _1244 = _141 * _1094;
    float _1246 = _1204 * _1049;
    float _1248 = _1244 * _1049;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1264 = _1262 != 0;
    int _1266 = _1238 * int(_1228);
    int _1268 = _1266 + _1102;
    float _1270 = trunc(_1246);
    int _1272 = int(_1270);
    bool _1274 = !_1256;
    int _1276 = _1274 ? 0 : 1;
    bool _1278 = !_1252;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = float(uint(_1268));
    bool _1284 = !_1264;
    int _1286 = _1284 ? 0 : 1;
    float _1288 = trunc(_1248);
    int _1290 = int(_1288);
    int _1292 = abs(_1276);
    float _1294 = as_type<float>(_1090) * _1282;
    int _1296 = abs(_1286);
    int _1298 = abs(_1280);
    int _1300 = _1242 * _1292;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1304 = _1302 != 0;
    float _1306 = trunc(_1294);
    float _1308 = precise::max(_1306, 0.0);
    uint _1310 = uint(_1308);
    bool _1312 = !_1260;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _1272 * _1296;
    int _1318 = _1316 + _1067;
    bool _1320 = !_1304;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = abs(_1314);
    int _1326 = ~_1029;
    int _1328 = _1326 + 1;
    int _1330 = _1290 * _1298;
    int _1332 = _1330 + _1300;
    int _1334 = abs(_1322);
    float _1336 = float(_1029);
    int _1338 = _1318 * _1324;
    int _1340 = _1338 + _1332;
    float _1342 = float(_1102);
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1346 = _1344 != 0;
    int _1348 = _1272 * _1334;
    int _1350 = _1348 + _1340;
    int _1352 = int(_1228) + int(_1310);
    float _1354 = _1234 * _1336;
    float _1356 = float(uint(_1350));
    bool _1358 = _1342 >= _1336;
    bool _1360 = isnan(_1342);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan(_1336);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    int _1370 = _1328 * _1352;
    int _1372 = _1370 + _1102;
    float _1374 = trunc(_1354);
    int _1376 = int(_1374);
    float _1378 = as_type<float>(_1063) * _1356;
    float _1380 = _1244 * _1336;
    int _1382 = _1029 + (-1);
    bool _1384 = uint(_1372) >= uint(_1029);
    bool _1386 = !_1346;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = trunc(_1368);
    int _1392 = int(_1390);
    bool _1394 = !_1384;
    int _1396 = _1394 ? 0 : (-1);
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1412 = _1410 != 0;
    int _1414 = ~_1352;
    int _1416 = _1414 + _1396;
    int _1418 = _1416 + 1;
    int _1420 = ~_1009;
    int _1422 = _1420 + 1;
    float _1424 = trunc(_1378);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = abs(_1388);
    int _1432 = _1029 * _1418;
    int _1434 = _1432 + _1102;
    bool _1436 = _1029 == 0;
    int _1438 = _1376 * _1430;
    int _1440 = _1438 + _1102;
    bool _1442 = !_1436;
    int _1444 = _1442 ? _1434 : (-1);
    float _1446 = trunc(_1380);
    int _1448 = int(_1446);
    int _1450 = ~_1392;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    bool _1456 = _1009 == 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1460 = _1458 != 0;
    int _1462 = _1444 * _1454;
    bool _1464 = !_1404;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1422 * int(_1428);
    int _1470 = _1468 + _1350;
    int _1472 = _1392 * _1382;
    int _1474 = _1472 + _1462;
    bool _1476 = !_1400;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = float(uint(_1470));
    int _1482 = abs(_1466);
    bool _1484 = !_1408;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = as_type<float>(_1063) * _1480;
    int _1490 = abs(_1478);
    bool _1492 = !_1412;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = trunc(_1488);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = abs(_1486);
    int _1504 = _1474 * _1482;
    int _1506 = abs(_1494);
    int _1508 = _1448 * _1490;
    int _1510 = _1508 + _1504;
    float _1512 = float(uint(_1318));
    int _1514 = _1440 * _1502;
    int _1516 = _1514 + _1510;
    float _1518 = float(uint(_1440));
    float _1520 = as_type<float>(_1063) * _1512;
    int _1522 = ~_1009;
    int _1524 = _1522 + 1;
    int _1526 = _1376 * _1506;
    int _1528 = _1526 + _1516;
    int _1530 = 0;
    if (_1460)
    {
        _1530 = 0;
    }
    int _1532 = _1530;
    float _1534 = as_type<float>(_1090) * _1518;
    int _1536 = int(_1428) + int(_1500);
    float _1538 = trunc(_1520);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = float(uint(_1528));
    int _1546 = ~_1029;
    int _1548 = _1546 + 1;
    int _1550 = _1524 * _1536;
    int _1552 = _1550 + _1350;
    int _1554 = _1532;
    if (!_1460)
    {
        _1554 = 1;
    }
    int _1556 = _1554;
    float _1558 = trunc(_1534);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    float _1564 = as_type<float>(_1090) * _1544;
    bool _1566 = _1106 > 0.5;
    bool _1568 = uint(_1552) >= uint(_1009);
    float _1570 = -_199;
    int _1572 = _1566 ? as_type<int>(_1570) : as_type<int>(_199);
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    bool _1580 = !_1568;
    int _1582 = _1580 ? 0 : (-1);
    int _1584 = _1524 * int(_1542);
    int _1586 = _1584 + _1318;
    int _1588 = ~_1029;
    int _1590 = _1588 + 1;
    int _1592 = ~_1536;
    int _1594 = _1592 + _1582;
    int _1596 = _1594 + 1;
    float _1598 = float(uint(_1586));
    int _1600 = _1548 * int(_1562);
    int _1602 = _1600 + _1440;
    bool _1604 = _1108 > 0.5;
    int _1606 = _1009 * _1596;
    int _1608 = _1606 + _1350;
    float _1610 = as_type<float>(_1063) * _1598;
    float _1612 = float(uint(_1602));
    bool _1614 = !_1456;
    int _1616 = _1614 ? _1608 : (-1);
    int _1618 = _1590 * int(_1578);
    int _1620 = _1618 + _1528;
    int _1622 = ~_1009;
    int _1624 = _1622 + 1;
    float _1626 = as_type<float>(_1090) * _1612;
    int _1628 = _1616 & 3;
    bool _1630 = _1628 != 0;
    float _1632 = trunc(_1610);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = float(uint(_1620));
    bool _1640 = uint(_1628) > 1u;
    int _1642 = _1616 & 3;
    bool _1644 = _1642 != 0;
    float _1646 = as_type<float>(_1090) * _1638;
    bool _1648 = uint(_1628) >= 2u;
    float _1650 = trunc(_1626);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    int _1656 = _1644 ? 0 : 1;
    bool _1658 = _1112 > 0.5;
    int _1660 = ~_1656;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    float _1666 = trunc(_1646);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = _1664;
    if (!_1640)
    {
        int _1674 = ~_1656;
        int _1676 = _1674 + 1;
        _1672 = _1676;
    }
    int _1678 = _1672;
    bool _1680 = _1628 != 3;
    int _1682 = int(_1542) + int(_1636);
    int _1684 = ~_1029;
    int _1686 = _1684 + 1;
    int _1688 = _1648 ? 0 : 1;
    int _1690 = _1624 * _1682;
    int _1692 = _1690 + _1318;
    int _1694 = int(_1562) + int(_1654);
    int _1696 = int(_1578) + int(_1670);
    int _1698 = ~_1029;
    int _1700 = _1698 + 1;
    int _1702 = ~_1688;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = uint(_1692) >= uint(_1009);
    int _1710 = _1686 * _1694;
    int _1712 = _1710 + _1440;
    int _1714 = _1706;
    if (_1680)
    {
        int _1716 = ~_1688;
        int _1718 = _1716 + 1;
        _1714 = _1718;
    }
    int _1720 = _1714;
    bool _1722 = !_1708;
    int _1724 = _1722 ? 0 : (-1);
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1728 = _1726 != 0;
    int _1730 = _1700 * _1696;
    int _1732 = _1730 + _1528;
    bool _1734 = uint(_1712) >= uint(_1029);
    bool _1736 = !_1728;
    int _1738 = _1736 ? 0 : 1;
    bool _1740 = !_1734;
    int _1742 = _1740 ? 0 : (-1);
    int _1744 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1746 = _1744 != 0;
    bool _1748 = uint(_1732) >= uint(_1029);
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1754 = in.m_46.x;
    float _1756 = in.m_46.y;
    float _1758 = in.m_46.z;
    bool _1760 = !_1746;
    float _1762 = _1760 ? _199 : as_type<float>(_1572);
    float _1764 = 1.0 / _1752;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1768 = _1766 != 0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1774 = -_203;
    int _1776 = _1604 ? as_type<int>(_1774) : as_type<int>(_203);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1780 = _1110 > 0.5;
    bool _1782 = !_1768;
    float _1784 = _1782 ? _203 : as_type<float>(_1776);
    float _1786 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1788 = 1.0 / _1772;
    bool _1790 = !_1748;
    int _1792 = _1790 ? 0 : (-1);
    float _1794 = -_1778;
    float _1796 = fma(_1786, 2.0, _1794);
    bool _1798 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1800 = isnan(_995);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -_199;
    int _1812 = _1780 ? as_type<int>(_1810) : as_type<int>(_199);
    float _1814 = -_141;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1796);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1820 = _1818 != 0;
    float _1822 = -_1808;
    float _1824 = _1822 + 1.0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1828 = _1826 != 0;
    float _1830 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1834 = _1832 != 0;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1836;
    float _1840 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1842 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1848 = _1838 * _1764;
    float _1850 = _1186 * _1824;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1854 = _995 + _1852;
    float _1856 = -_1186;
    float _1858 = _1856 + 1.0;
    float _1860 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1830);
    float _1862 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1840);
    float _1864 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1842);
    float _1866 = _1846 * _1788;
    bool _1868 = !_1834;
    float _1870 = _1868 ? _199 : as_type<float>(_1812);
    float _1872 = fma(_1848, _1854, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1874 = _1021 * _1858;
    bool _1876 = _1556 != 1;
    float _1878 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1860);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1882 = _995 + _1880;
    float _1884 = _1872 * _1874;
    float _1886 = _1762 + 0.5;
    float _1888 = -_1021;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1862);
    float _1894 = fma(_1758, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1864);
    float _1896 = fma(_1866, _1882, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1816);
    float _1900 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1884);
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1904 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1154);
    float _1906 = _1866;
    float _1908 = _1842;
    if (!_1876)
    {
        _1906 = _1108;
    }
    float _1910 = _1906;
    float _1912 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1902);
    float _1914 = _1910;
    if (!_1876)
    {
        _1908 = _1108;
    }
    float _1916 = _1908;
    float _1918 = _1784 + (-0.5);
    float _1920 = _1916;
    float _1922 = _1918;
    if (_1876)
    {
        _1914 = _1106;
    }
    float _1924 = _1914;
    float _1926 = fma(_1896, _1850, _1900);
    if (_1876)
    {
        _1920 = _1106;
    }
    float _1928 = _1920;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1932 = -_1918;
    float _1934 = -_1904;
    float _1936 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1934);
    int _1938 = ~_1696;
    int _1940 = _1938 + _1792;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1930);
    if (!_1876)
    {
        _1922 = _1110;
    }
    float _1946 = _1922;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1950 = _1946;
    if (_1876)
    {
        _1142 = _1108;
    }
    float _1952 = _1142;
    int _1954 = _1029 * _1942;
    int _1956 = _1954 + _1528;
    if (_1876)
    {
        _1950 = _1108;
    }
    float _1958 = _1950;
    float _1960 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1948);
    int _1962 = _1616 >> 31;
    float _1964 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1966 = !_1436;
    int _1968 = _1966 ? _1956 : (-1);
    float _1970 = _1892 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1972 = _1962 & 3;
    float _1974 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1926);
    int _1976 = _1968 >> 31;
    float _1978 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1980 = _1616 + _1972;
    float _1982 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1912);
    int _1984 = _1976 & 3;
    float _1986 = _1894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1988 = _1980 >> 2;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1978 + _1990;
    int _1994 = _1968 + _1984;
    float _1996 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1944);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2000 = _1986 + _1998;
    bool _2002 = !_1630;
    int _2004 = _2002 ? 0 : 1;
    float _2006 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1960);
    int _2008 = _1968 & 3;
    bool _2010 = _2008 != 0;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2014 = _1988 << 4;
    int _2016 = _2014 + 368;
    float _2018 = _1870 + 0.5;
    int _2020 = _1968 & 3;
    bool _2022 = _2020 != 0;
    float _2024 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2012);
    int _2026 = _1994 >> 2;
    float _2028 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2030 = _2010 ? 0 : 1;
    uint _2032 = uint(int(uint(_2016) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    bool _2048 = uint(_2020) > 1u;
    float _2050 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2024);
    int _2052 = _2026 << 4;
    int _2054 = _2052 + 512;
    float _2056 = -_1982;
    float _2058 = _2056 + 1.0;
    float _2060 = -_2050;
    float _2062 = _2060 + 1.0;
    int _2064 = ~_2030;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    uint _2070 = uint(int(uint(_2054) >> uint(2)));
    uint _2072 = uint(int(uint(int(_2070)) >> uint(2)));
    int _2074 = int(_2070) & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = int(_2070) + 1;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    int _2082 = _2078 & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2088 = !_2022;
    int _2090 = _2088 ? 0 : 1;
    bool _2092 = _1628 != 3;
    float _2094 = -_2086;
    float _2096 = fma(_1964, 2.0, _2094);
    int _2098 = _2068;
    if (!_2048)
    {
        int _2100 = ~_2030;
        int _2102 = _2100 + 1;
        _2098 = _2102;
    }
    int _2104 = _2098;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2108 = _1970 + _2106;
    int _2110 = _2016 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2130 = uint(_2020) >= 2u;
    float _2132 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2134 = -_141;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2096);
    float _2138 = fma(_2028, -2.0, _2128);
    int _2140 = ~_1682;
    int _2142 = _2140 + _1724;
    int _2144 = _2142 + 1;
    float _2146 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2132);
    int _2148 = _2054 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    float _2166 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2138);
    int _2168 = _2130 ? 0 : 1;
    float _2170 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2146);
    bool _2172 = !_2092;
    int _2174 = _2172 ? 0 : (-1);
    int _2176 = _1009 * _2144;
    int _2178 = _2176 + _1318;
    bool _2180 = _2020 != 3;
    float _2182 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2136);
    int _2184 = abs(_1678);
    int _2186 = abs(_2104);
    int _2188 = ~_2168;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    int _2194 = abs(_2004);
    int _2196 = ~_2186;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    int _2202 = _2192;
    if (_2180)
    {
        int _2204 = ~_2168;
        int _2206 = _2204 + 1;
        _2202 = _2206;
    }
    int _2208 = _2202;
    int _2210 = ~_2184;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = abs(_2090);
    int _2218 = abs(_1720);
    int _2220 = _2214 * as_type<int>(_2046);
    bool _2222 = _2020 != 3;
    int _2224 = _2200 * as_type<int>(_2084);
    int _2226 = ~_2194;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    int _2232 = abs(_2208);
    int _2234 = _2230 * as_type<int>(_2038);
    int _2236 = _2234 + _2220;
    int _2238 = ~_2216;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = ~_2218;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = abs(_2174);
    int _2252 = _2242 * as_type<int>(_2076);
    int _2254 = _2252 + _2224;
    bool _2256 = !_2222;
    int _2258 = _2256 ? 0 : (-1);
    int _2260 = _2248 * as_type<int>(_2118);
    int _2262 = _2260 + _2236;
    int _2264 = ~_2250;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = abs(_2258);
    int _2272 = ~_2232;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = _2268 * as_type<int>(_2126);
    int _2280 = _2278 + _2262;
    bool _2282 = !_1828;
    int _2284 = _2282 ? 0 : 1;
    int _2286 = ~_1694;
    int _2288 = _2286 + _1742;
    int _2290 = _2288 + 1;
    int _2292 = _2276 * as_type<int>(_2156);
    int _2294 = _2292 + _2254;
    float _2296 = -_203;
    int _2298 = _1658 ? as_type<int>(_2296) : as_type<int>(_203);
    int _2300 = abs(_2284);
    int _2302 = ~_2270;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    bool _2308 = !_1820;
    float _2310 = _2308 ? _203 : as_type<float>(_2298);
    int _2312 = _1029 * _2290;
    int _2314 = _2312 + _1440;
    int _2316 = ~_2300;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _2306 * as_type<int>(_2164);
    int _2324 = _2322 + _2294;
    int _2326 = abs(_1738);
    float _2328 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2330 = !_1436;
    int _2332 = _2330 ? _2314 : (-1);
    int _2334 = _2324 * _2320;
    int _2336 = ~_2326;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    bool _2342 = !_1456;
    int _2344 = _2342 ? _2178 : (-1);
    int _2346 = _2332 * _2300;
    int _2348 = _2346 + _2334;
    float _2350 = _2108 * _2108;
    int _2352 = _2280 * _2340;
    bool _2354 = _2170 >= 0.0;
    float _2356 = _2310 + (-0.5);
    float _2358 = fma(_1992, _1992, _2350);
    int _2360 = _2344 * _2326;
    int _2362 = _2360 + _2352;
    float _2364 = -_1996;
    float _2366 = _2364 + 1.0;
    float _2368 = -_2356;
    float _2370 = -_2166;
    float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2370);
    float _2374 = fma(_2000, _2000, _2358);
    float _2376 = -_2006;
    float _2378 = _2376 + 1.0;
    float _2380 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = fma(_2310, _2062, _2372);
    float _2384 = _959 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2386 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2388 = rsqrt(_2374);
    if (_2354)
    {
        _967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2390 = _967;
    float _2392 = fma(_1784, _2366, _1936);
    float _2394 = -_2058;
    float _2396 = fma(_1762, _2394, _1898);
    float _2398 = -_2378;
    float _2400 = fma(_1870, _2398, _2182);
    float _2402 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2404 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2408 = as_type<int>(_2390);
    float _2410 = _2400;
    if (_2354)
    {
        float _2412 = _2390 * 5.0;
        _2408 = as_type<int>(_2412);
    }
    int _2414 = _2408;
    float _2416 = float(_2362);
    out.m_64.x = _2396;
    out.m_64.y = _2392;
    out.m_64.z = _2400;
    out.m_64.w = _2382;
    float _2418 = float(_2348);
    out.m_66.x = _2402;
    out.m_66.y = _2404;
    out.m_66.z = _2406;
    out.m_66.w = _2328;
    float _2420 = _2108 * _2388;
    float _2422 = _1992 * _2388;
    if (_2354)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7286 = as_type<float>(_2414);
        out.gl_Position.z = _7286;
    }
    out.m_68.x = _2416;
    out.m_68.y = _2418;
    if (_2354)
    {
        out.m_49.x = 0.0;
    }
    if (_2354)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2424 = -_2420;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1970);
    float _2428 = _2000 * _2388;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1978);
    float _2434 = -_2420;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2108);
    float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2440 = _2426 + _2438;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1986);
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2432 + _2446;
    float _2450 = -_2422;
    float _2452 = fma(_2450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1992);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2458 = _2444 + _2456;
    float _2460 = _2436 * _2436;
    float _2462 = -_2428;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2000);
    float _2466 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2454);
    float _2468 = fma(_2452, _2452, _2460);
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2466);
    float _2472 = fma(_2464, _2464, _2468);
    bool _2474 = _2470 >= 0.0;
    float _2476 = sqrt(_2472);
    float _2478 = _2432;
    if (_2474)
    {
        _2410 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2480 = _2410;
    int _2482 = as_type<int>(_2480);
    if (_2474)
    {
        out.m_49.x = 0.0;
    }
    float _2484 = _2388 * _2476;
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
        float _7422 = as_type<float>(_2488);
        out.gl_Position.z = _7422;
    }
    if (_2474)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2490 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2492 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2498 = _2484 * _2490;
    float _2500 = _2484 * _2492;
    float _2502 = _2494 * _2498;
    float _2504 = _2496 * _2500;
    float _2506 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2508 = _2506 * 0.5;
    float _2510 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2512 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2514 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2510);
    float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2512);
    float _2520 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2522 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    float _2524 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2518);
    float _2526 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    float _2528 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2530 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2532 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2534 = _1986 + _2528;
    float _2536 = _1978 + _2530;
    float _2538 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2540 = _1970 + _2532;
    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2544 = _2534 + _2542;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2548 = _2536 + _2546;
    float _2550 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2538);
    float _2552 = _2544 * _2544;
    float _2554 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2550);
    float _2556 = fma(_2548, _2548, _2552);
    float _2558 = sqrt(_2556);
    bool _2560 = _2558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2562 = _2532;
    float _2564 = _2526;
    float _2566 = _2550;
    if (!_2560)
    {
        _2562 = _2536;
    }
    float _2568 = _2562;
    float _2570 = _2568;
    if (!_2560)
    {
        _2564 = _2534;
    }
    float _2572 = _2564;
    float _2574 = _2572;
    if (!_2560)
    {
        _2566 = _2540;
    }
    float _2576 = _2566;
    bool _2578 = !_2560;
    float _2580 = _2576;
    if (!_2578)
    {
        float _2582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2586 = _2558 + _2584;
        float _2588 = rsqrt(_2556);
        float _2590 = _2586 * _2582;
        float _2592 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2594 = _2590 * 0.15915493667125701904296875;
        float _2596 = _2594 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = _2594 * 6.283185482025146484375;
        float _2602 = sin(_2600);
        float _2604 = _2598 + (-1.0);
        float _2606 = fma(_2602, _2592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2608 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2610 = _2588 * _2606;
        float _2612 = fma(_2540, _2598, _2608);
        float _2614 = fma(_2548, _2610, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2616 = fma(_2544, _2610, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2580 = _2612;
        _2570 = _2614;
        _2574 = _2616;
    }
    float _2618 = _2580;
    float _2620 = _2570;
    float _2622 = _2574;
    float _2624 = -_1970;
    float _2626 = _2624 + _2618;
    float _2628 = -_1978;
    float _2630 = _2628 + _2620;
    float _2632 = _2554 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2634 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2636 = _2626 * _2626;
    float _2638 = -_1986;
    float _2640 = _2638 + _2622;
    float _2642 = 1.0 / _2632;
    float _2644 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2634);
    float _2646 = fma(_2630, _2630, _2636);
    float _2648 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2644);
    float _2650 = fma(_2640, _2640, _2646);
    bool _2652 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2654 = isnan(0.5);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2660 = _2656 || _2658;
    float _2662 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2664 = sqrt(_2650);
    bool _2666 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2668 = isnan(0.5);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2674 = _2670 || _2672;
    float _2676 = _2662 + _2632;
    float _2678 = _2676 * _2642;
    float _2680 = _2678 * 0.5;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2684 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2682);
    float _2686 = 1.0 / _2684;
    bool _2688 = _2664 > 0.0;
    float _2690 = _2664;
    float _2692 = _2632;
    float _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2688)
    {
        _2690 = _2620;
    }
    float _2696 = _2690;
    float _2698 = _2696;
    if (!_2688)
    {
        _2692 = _2618;
    }
    float _2700 = _2692;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2688)
    {
        _2694 = _2622;
    }
    float _2706 = _2694;
    bool _2708 = !_2688;
    float _2710 = _2706;
    if (!_2708)
    {
        float _2712 = _193 * _193;
        float _2714 = fma(_191, _191, _2712);
        float _2716 = rsqrt(_2650);
        float _2718 = fma(_195, _195, _2714);
        float _2720 = sqrt(_2718);
        float _2722 = _2630 * _2716;
        float _2724 = _2626 * _2716;
        float _2726 = _2640 * _2716;
        bool _2728 = _2720 > 0.0;
        float _2730 = _2716;
        float _2732 = _2720;
        if (!_2728)
        {
            _2730 = _2620;
        }
        float _2734 = _2730;
        _2698 = _2734;
        if (!_2728)
        {
            _2702 = _2618;
        }
        float _2736 = _2702;
        _2704 = _2736;
        if (!_2728)
        {
            _2732 = _2622;
        }
        float _2738 = _2732;
        bool _2740 = !_2728;
        _2710 = _2738;
        if (!_2740)
        {
            float _2742 = rsqrt(_2718);
            float _2744 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2746 = _193 * _2742;
            float _2748 = _191 * _2742;
            float _2750 = _2724 * _2746;
            float _2752 = _195 * _2742;
            float _2754 = fma(_2722, _2748, _2750);
            float _2756 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2758 = fma(_2726, _2752, _2754);
            float _2760 = _2758 * _2756;
            float _2762 = fma(_191, _2760, _2620);
            float _2764 = fma(_193, _2760, _2618);
            float _2766 = fma(_195, _2760, _2622);
            _2710 = _2766;
            _2698 = _2762;
            _2704 = _2764;
        }
    }
    float _2768 = _2710;
    float _2770 = _2698;
    float _2772 = _2704;
    float _2774 = -_2428;
    float _2776 = fma(_2774, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2768);
    float _2778 = -_2422;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2770);
    float _2782 = -_2420;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2772);
    float _2786 = _2784;
    float _2788 = _2780;
    float _2790 = _2776;
    float _2792 = _2770;
    float _2794 = _2772;
    float _2796 = _2768;
    if (_2674)
    {
        _207 = 1.0;
    }
    float _2798 = _207;
    float _2800 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2802 = _2686 * _2800;
    float _2804 = _2798;
    if (!_2660)
    {
        float _2806 = _2440 * _2440;
        float _2808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2810 = -_1986;
        float _2812 = _2810 + _2768;
        float _2814 = fma(_2448, _2448, _2806);
        float _2816 = -_1978;
        float _2818 = _2816 + _2770;
        float _2820 = fma(_2458, _2458, _2814);
        float _2822 = 1.0 / _2484;
        float _2824 = sqrt(_2820);
        float _2826 = precise::min(_2824, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2828 = _2826 * _2808;
        float _2830 = -_1970;
        float _2832 = _2830 + _2772;
        float _2834 = _2828 * _2822;
        float _2836 = fma(_2832, _2834, _2426);
        float _2838 = fma(_2818, _2834, _2432);
        float _2840 = fma(_2812, _2834, _2444);
        _2786 = _2836;
        _2788 = _2838;
        _2790 = _2840;
    }
    float _2842 = _2786;
    float _2844 = _2788;
    float _2846 = _2790;
    if (!_2674)
    {
        float _2848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2850 = _2848 * 0.15915493667125701904296875;
        float _2852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2854 = _2850 * 6.283185482025146484375;
        float _2856 = cos(_2854);
        float _2858 = _2852 * 0.15915493667125701904296875;
        float _2860 = _2850 * 6.283185482025146484375;
        float _2862 = sin(_2860);
        float _2864 = 1.0 / _2856;
        float _2866 = _2858 * 6.283185482025146484375;
        float _2868 = cos(_2866);
        float _2870 = _2862 * _2864;
        float _2872 = _2858 * 6.283185482025146484375;
        float _2874 = sin(_2872);
        float _2876 = _2868 * _2870;
        float _2878 = 1.0 / _2876;
        float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2882 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2880;
        float _2884 = 1.0 / _2882;
        float _2886 = _2874 * _2878;
        float _2888 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2890 = fma(_2802, _2886, _2888);
        float _2892 = _2890 * _2884;
        float _2894 = precise::clamp(_2892, 0.0, 1.0);
        _2804 = _2894;
    }
    float _2896 = _2804;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2900 = _2842 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2904 = _2844 + _2902;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2908 = _2846 + _2906;
    float _2910 = _2900 * _2900;
    float _2912 = fma(_2904, _2904, _2910);
    float _2914 = fma(_2908, _2908, _2912);
    float _2916 = rsqrt(_2914);
    float _2918 = sqrt(_2914);
    float _2920 = _2916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2922 = _2904 * _2920;
    float _2924 = _2908 * _2920;
    float _2926 = _2922 * _2922;
    float _2928 = _2924 * _2924;
    float _2930 = _2926 + _2928;
    float _2932 = sqrt(_2930);
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2938 = _2932 + _2936;
    float _2940 = _2908;
    float _2942 = _2930;
    float _2944 = _2938;
    float _2946 = _2900;
    float _2948 = _2926;
    if (_2934)
    {
        float _2950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _2950;
    }
    float _2952 = _2940;
    if (_2934)
    {
        float _2954 = rsqrt(_2930);
        _2942 = _2954;
    }
    float _2956 = _2942;
    if (_2934)
    {
        float _2958 = _2938 * _2952;
        _2944 = _2958;
    }
    float _2960 = _2944;
    if (_2934)
    {
        float _2962 = _2960 * 0.15915493667125701904296875;
        _2792 = _2962;
    }
    float _2964 = _2792;
    float _2966 = _2916;
    if (_2934)
    {
        float _2968 = _2964 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        _2966 = _2970;
    }
    float _2972 = _2966;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2976 = precise::max(0.0, _2974);
    float _2978 = _2910;
    float _2980 = _2976;
    if (_2934)
    {
        float _2982 = _2964 * 6.283185482025146484375;
        float _2984 = cos(_2982);
        _2978 = _2984;
    }
    float _2986 = _2978;
    float _2988 = -_2920;
    float _2990 = -_2976;
    float _2992 = fma(_2900, _2988, _2990);
    if (!_2934)
    {
        _2946 = _2924;
    }
    float _2994 = _2946;
    float _2996 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2998 = _2994;
    if (_2934)
    {
        float _3000 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2980 = _3000;
    }
    float _3002 = _2980;
    float _3004 = _2972;
    float _3006 = _3002;
    if (_2934)
    {
        float _3008 = fma(_2972, _3002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3004 = _3008;
    }
    float _3010 = _3004;
    float _3012 = _3010;
    if (!_2934)
    {
        _3006 = _2992;
    }
    float _3014 = _3006;
    float _3016 = _3014;
    if (_2934)
    {
        float _3018 = _2986 + (-1.0);
        _2478 = _3018;
    }
    float _3020 = _2478;
    float _3022 = _3020;
    if (_2934)
    {
        float _3024 = _2956 * _3010;
        _2794 = _3024;
    }
    float _3026 = _2794;
    if (!_2934)
    {
        _3012 = _2922;
    }
    float _3028 = _3012;
    float _3030 = _3028;
    if (_2934)
    {
        float _3032 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2796 = _3032;
    }
    float _3034 = _2796;
    if (_2934)
    {
        float _3036 = _2922 * _3026;
        _3030 = _3036;
    }
    float _3038 = _3030;
    if (_2934)
    {
        float _3040 = _2924 * _3026;
        _2998 = _3040;
    }
    float _3042 = _2998;
    if (!_2934)
    {
        _3022 = _2928;
    }
    float _3044 = _3022;
    float _3046 = _3044;
    if (_2934)
    {
        float _3048 = fma(_2992, _2986, _3034);
        _3016 = _3048;
    }
    float _3050 = _3016;
    if (_2934)
    {
        float _3052 = _3038 * _3038;
        _2948 = _3052;
    }
    float _3054 = _2948;
    if (_2934)
    {
        float _3056 = _3042 * _3042;
        _3046 = _3056;
    }
    float _3058 = _3046;
    float _3060 = floor(_2996);
    float _3062 = fma(_3050, _3050, _3054);
    float _3064 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3068 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3066);
    float _3070 = precise::clamp(_3068, 0.0, 1.0);
    float _3072 = _3062 + _3058;
    float _3074 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3064);
    float _3076 = -_3070;
    float _3078 = _3076 + 1.0;
    float _3080 = rsqrt(_3072);
    float _3082 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3074);
    float _3084 = _3082 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3088 = abs(_3078);
    float _3090 = log2(_3088);
    float _3092 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3094 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3096 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3098 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3100 = -_3092;
    float _3102 = fma(_3100, _3086, 1.0);
    float _3104 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3106 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3096);
    float _3108 = _3080 * _3050;
    float _3110 = _3080 * _3038;
    float _3112 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3104);
    float _3114 = _3080 * _3042;
    float _3116 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3106);
    float _3118 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3120 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3112);
    float _3122 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3098);
    float _3124 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3126 = -_3118;
    float _3128 = fma(_3108, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3126);
    float _3130 = _3120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3132 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3122);
    float _3134 = floor(_3094);
    float _3136 = -_3114;
    float _3138 = fma(_3136, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3128);
    float _3140 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3142 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3144 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3146 = fma(_3138, -0.5, 0.5);
    float _3148 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3140);
    float _3150 = -_3060;
    float _3152 = _2996 + _3150;
    float _3154 = fma(_3138, 0.5, 0.5);
    float _3156 = log2(_3102);
    float _3158 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3148);
    float _3160 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3162 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3164 = _3108 + 1.0;
    float _3166 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3158);
    float _3168 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3160);
    float _3170 = exp2(_3144);
    float _3172 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3162);
    float _3174 = -_3134;
    float _3176 = _3094 + _3174;
    float _3178 = fma(_3154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3180 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3168);
    float _3182 = fma(_3154, _3178, -0.212114393711090087890625);
    float _3184 = 1.0 / _3166;
    float _3186 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3172);
    float _3188 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3180);
    float _3190 = fma(_3154, _3182, 1.570728778839111328125);
    float _3192 = _3156 * 0.693147182464599609375;
    float _3194 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3186);
    float _3196 = sqrt(_3146);
    float2 _8584 = float2(_3152, _3176);
    float _3198 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8584, float2(0.0), isnan(_8584)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8584, float2(0.0), isnan(_8584)), level(0.0)).x;
    float _3200 = -_3108;
    float _3202 = fma(_3170, _3164, _3200);
    float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3206 = fma(_3202, 0.5, 0.5);
    float _3208 = _3188 * _3184;
    float _3210 = _3194 * _3184;
    float _3212 = fma(_3208, 0.5, 0.5);
    float _3214 = fma(_3210, -0.5, 0.5);
    float _3216 = _3196 * 0.636619746685028076171875;
    float3 _8620 = float3(_3212, _3214, _3204);
    float _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8620, float3(0.0), isnan(_8620)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8620, float3(0.0), isnan(_8620)), level(0.0)).x;
    float _3220 = -_3190;
    float _3222 = fma(_3216, _3220, 1.0);
    float3 _8636 = float3(_3212, _3214, _3204);
    float4 _3225 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8636, float3(0.0), isnan(_8636)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8636, float3(0.0), isnan(_8636)), level(0.0)).xyzw;
    float _3227 = _3225.x;
    float _3229 = _3225.y;
    float _3231 = _3225.z;
    float _3233 = _3225.w;
    float2 _8652 = float2(_3222, _3206);
    float3 _3237 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8652, float2(0.0), isnan(_8652)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8652, float2(0.0), isnan(_8652)), level(0.0)).xyz;
    float _3239 = _3237.x;
    float _3241 = _3237.y;
    float _3243 = _3237.z;
    float _3245 = abs(_2802);
    float _3247 = log2(_3245);
    float _3249 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3251 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3253 = fma(_3249, _3249, 1.0);
    out.m_70.x = _2844;
    out.m_70.y = _2842;
    out.m_70.z = _2846;
    bool _3255 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3257 = isnan(_2918);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3263 = _3259 || _3261;
    float _3265 = rsqrt(_3253);
    float _3267 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3269 = exp2(_3267);
    float _3271 = fma(_3269, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3273 = precise::clamp(_3271, 0.0, 1.0);
    float _3275 = fma(_3273, -2.0, 3.0);
    float _3277 = _3273 * _3273;
    float _3279 = _3277 * _3275;
    float _3281 = _3130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3283 = _3249 * _3265;
    float _3285 = -_3279;
    float _3287 = _3285 + 1.0;
    float _3289 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3281);
    float _3291 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3293 = _3283 * _3291;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3297 = _3283 * _3295;
    float _3299 = fma(_3287, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3279);
    float _3301 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3303 = _3283 * _3301;
    float _3305 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3293);
    float _3307 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3297);
    float _3309 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3303);
    float _3311 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3313 = in.m_72.x;
    float _3315 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3289);
    float _3317 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3319 = exp2(_3311);
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3321 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3315);
    float _3323 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3317);
    out.m_76.x = _3305;
    out.m_76.y = _3307;
    out.m_76.z = _3309;
    float _3325 = _3321 + _3166;
    bool _3327 = _2802 <= 8000.0;
    bool _3329 = isnan(_2802);
    bool _3331 = _3327 || _3329;
    bool _3333 = isnan(8000.0);
    bool _3335 = _3331 || _3333;
    float _3337 = float(_3335);
    float _3339 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3341 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3343 = -_3319;
    float _3345 = _3343 + 1.0;
    float _3347 = _3337 * _3299;
    float _3349 = _3325 * 0.5;
    float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3353 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3339);
    float _3355 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3357 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3341);
    out.gl_Position.x = _3188;
    out.gl_Position.y = _3194;
    out.gl_Position.z = _3321;
    out.gl_Position.w = _3166;
    float _3359 = _2896 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3361 = _3347;
    float _3363 = _3323;
    float _3365 = _3357;
    float _3367 = _3353;
    float _3369 = _3166;
    if (!_3263)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3371 = _3361;
    out.m_78.z = _3349;
    out.m_78.w = _3166;
    float _3373 = _3353 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3375 = _3357 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3377 = _3323 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3379 = _3371;
    float _3381 = _3371;
    if (!_3263)
    {
        _3363 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3383 = _3363;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3263)
    {
        _3365 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3389 = _3365;
    out.m_80.x = _3373;
    out.m_80.y = _3375;
    out.m_80.z = _3377;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3263)
    {
        _3367 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3395 = _3367;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3263)
    {
        _3369 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3401 = _3369;
    float _3403 = -_3198;
    float _3405 = _3403 + 1.0;
    float _3407 = _3405 * _3355;
    float _3409 = precise::clamp(_3407, 0.0, 1.0);
    float _3411 = -_3409;
    float _3413 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3415 = _3413 * _3313;
    float _3417 = _3351 * _3218;
    float _3419 = -_3351;
    float _3421 = _3419 + 1.0;
    float _3423 = _3415 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3425 = _3233 * _3417;
    out.m_82.x = _3423;
    float _3427 = _3243 * _3417;
    float _3429 = fma(_3239, _3425, _3227);
    float _3431 = fma(_3241, _3425, _3229);
    float _3433 = _3233 * _3421;
    float _3435 = fma(_3233, _3427, _3231);
    float _3437 = _3425;
    float _3439 = _3401;
    float _3441 = _3401;
    if (!_3263)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3443 = _3437;
    out.m_84.x = _3429;
    out.m_84.y = _3431;
    out.m_84.z = _3435;
    out.m_84.w = _3433;
    bool _3445 = !_3263;
    float _3447 = _3443;
    float _3449 = _3443;
    if (!_3445)
    {
        bool _3451 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3453 = isnan(_2918);
        bool _3455 = _3451 || _3453;
        bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3459 = _3455 || _3457;
        if (!_3459)
        {
            float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3463 = _2918 + _3461;
            float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3467 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3465;
            float _3469 = 1.0 / _3467;
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3491 = _3463 * _3469;
            float _3493 = precise::clamp(_3491, 0.0, 1.0);
            float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3499 = fma(_3493, _3473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3501 = fma(_3493, _3497, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3503 = fma(_3493, _3477, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3505 = fma(_3493, _3481, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3507 = fma(_3493, _3485, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3509 = fma(_3493, _3489, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3387 = _3499;
            _3441 = _3507;
            _3381 = _3501;
            _3399 = _3505;
            _3393 = _3503;
            _3449 = _3509;
            _3511 = true;
        }
        else
        {
            bool _3513 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3515 = isnan(_2918);
            bool _3517 = _3513 || _3515;
            bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3521 = _3517 || _3519;
            if (!_3521)
            {
                _3379 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3523 = _3379;
            _3381 = _3523;
            if (!_3521)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3525 = _3385;
            _3387 = _3525;
            if (!_3521)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3527 = _3391;
            _3393 = _3527;
            if (!_3521)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3529 = _3397;
            _3399 = _3529;
            if (!_3521)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3531 = _3439;
            _3441 = _3531;
            if (!_3521)
            {
                _3447 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3533 = _3447;
            bool _3535 = !_3521;
            _3449 = _3533;
            if (!_3535)
            {
                bool _3537 = _2918 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3539 = isnan(_2918);
                bool _3541 = _3537 || _3539;
                bool _3543 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3545 = _3541 || _3543;
                if (!_3545)
                {
                    float _3547 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3549 = _2918 + _3547;
                    float _3551 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3553 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3551;
                    float _3555 = 1.0 / _3553;
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3577 = _3549 * _3555;
                    float _3579 = precise::clamp(_3577, 0.0, 1.0);
                    float _3581 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3583 = _3581 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3585 = fma(_3579, _3559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3587 = fma(_3579, _3583, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3589 = fma(_3579, _3563, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3591 = fma(_3579, _3567, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3593 = fma(_3579, _3571, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3595 = fma(_3579, _3575, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3387 = _3585;
                    _3441 = _3593;
                    _3381 = _3587;
                    _3399 = _3591;
                    _3393 = _3589;
                    _3449 = _3595;
                    _3511 = true;
                }
                else
                {
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3381 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3449 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3511 = false;
    float _3597 = _3387;
    float _3599 = _3441;
    float _3601 = _3381;
    float _3603 = _3399;
    float _3605 = _3393;
    float _3607 = _3449;
    float _3609 = fma(_3375, -0.5, 0.5);
    float _3611 = precise::clamp(_3609, 0.0, 1.0);
    float _3613 = -_3597;
    float _3615 = _3613 + _3599;
    float _3617 = _3359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3619 = -_3601;
    float _3621 = _3619 + _3603;
    out.m_86.x = 0.0;
    float _3623 = fma(_3611, _3615, _3597);
    float _3625 = fma(_3611, _3621, _3601);
    out.m_49.x = _3617;
    float _3627 = -_3605;
    float _3629 = _3627 + _3607;
    float _3631 = _3623 * 0.586610972881317138671875;
    bool _3633 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3635 = fma(_3611, _3629, _3605);
    float _3637 = fma(_3625, 0.298911988735198974609375, _3631);
    bool _3639 = _2896 > 0.0;
    bool _3641 = isnan(_2896);
    bool _3643 = _3639 || _3641;
    bool _3645 = isnan(0.0);
    bool _3647 = _3643 || _3645;
    float _3649 = fma(_3635, 0.114477999508380889892578125, _3637);
    float _3651 = -_3649;
    float _3653 = _3625 + _3651;
    float _3655 = -_3649;
    float _3657 = _3623 + _3655;
    float _3659 = -_3649;
    float _3661 = _3635 + _3659;
    float _3663 = fma(_3653, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    float _3665 = fma(_3657, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    float _3667 = fma(_3661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3649);
    bool _3669 = !_3633;
    if (!_3669)
    {
        float _3671 = -_2842;
        float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3675 = -_2844;
        float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3679 = -_2846;
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3683 = _3673 * _3673;
        float _3685 = fma(_3677, _3677, _3683);
        float _3687 = fma(_3681, _3681, _3685);
        float _3689 = sqrt(_3687);
        float _3691 = rsqrt(_3687);
        float _3693 = -_3689;
        float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3697 = _3695 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3699 = precise::clamp(_3697, 0.0, 1.0);
        float _3701 = _3677 * _3691;
        float _3703 = _3673 * _3691;
        float _3705 = abs(_3699);
        float _3707 = log2(_3705);
        float _3709 = _3681 * _3691;
        float _3711 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3713 = _3375 * _3703;
        float _3715 = -_3703;
        float _3717 = -_3711;
        float _3719 = fma(_3715, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3717);
        float _3721 = fma(_3373, _3701, _3713);
        float _3723 = -_3709;
        float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3719);
        float _3727 = fma(_3377, _3709, _3721);
        float _3729 = precise::clamp(_3727, 0.0, 1.0);
        float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3733 = _3725 + _3731;
        float _3735 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3737 = _3733 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3739 = precise::clamp(_3737, 0.0, 1.0);
        float _3741 = exp2(_3735);
        float _3743 = _3741 * _3739;
        float _3745 = _3729 * _3743;
        float _3747 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3749 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3751 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3747;
        out.m_86.y = _3749;
        out.m_86.z = _3751;
    }
    out.m_88.x = _3663;
    out.m_88.y = _3665;
    out.m_88.z = _3667;
    if (_3647)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3753 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3753;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

