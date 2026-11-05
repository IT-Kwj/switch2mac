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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_92 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_70 [[user(locn13)]];
    float4 m_84 [[user(locn14)]];
    float4 m_90 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_56 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3711 = false;
    bool _969 = false;
    bool _801 = false;
    bool _581 = false;
    bool _413 = false;
    bool _257 = false;
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
    float _127 = _125;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4016 = as_type<float>(_133);
        out.gl_Position.z = _4016;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_51.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_49.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4084 = as_type<float>(_169);
        out.gl_Position.z = _4084;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    float _179 = in.m_58.x;
    float _181 = in.m_58.y;
    float _183 = in.m_58.z;
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_177, _183, _219);
    float _227 = fma(_173, _191, _221);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _227);
    bool _233 = !_205;
    float _235 = _225;
    float _237 = _231;
    float _255;
    if (!_233)
    {
        float _239 = in.m_64.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_117);
        float _261 = 1.0 / _259;
        float _263 = _151 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    bool _271 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_265);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _265 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -_281;
    float _297 = _295 + 1.0;
    float _299 = in.m_66.x;
    float _301 = in.m_66.y;
    bool _303 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_265);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _289;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _293;
    float _321 = _269 * _315;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = _333 * _297;
    float _345 = -_333;
    float _347 = _345 + 1.0;
    float _349 = _285 * _319;
    float _351 = fma(_337, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _353 = fma(_341, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _313 * _347;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = -_313;
    float _367 = _365 + 1.0;
    float _369 = _351 * _355;
    float _371 = _353 * _355;
    float _373 = fma(_359, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = fma(_363, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _381 = fma(_373, _343, _377);
    float _383 = fma(_375, _343, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].x, _381);
    float _387 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].y, _383);
    float _389 = _385 * _299;
    float _391 = _387 * _301;
    bool _393 = !_317;
    float _411;
    if (!_393)
    {
        float _395 = in.m_64.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_117);
        float _417 = 1.0 / _415;
        float _419 = _151 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = _421 + _423;
    bool _427 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _429 = isnan(_421);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _421 + _439;
    bool _443 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _445 = isnan(_421);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_421);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -_437;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _461;
    float _481 = _473 * _477;
    float _483 = -_473;
    float _485 = _483 + 1.0;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    bool _491 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _493 = 1.0 / _457;
    float _495 = _453 * _485;
    float _497 = -_453;
    float _499 = _497 + 1.0;
    float _501 = _441 * _479;
    float _503 = _425 * _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    float _513 = fma(_489, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _515 = fma(_507, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _517 = fma(_511, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _519 = _513 * _495;
    float _521 = _515 * _495;
    float _523 = _517 * _495;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].x, _519);
    float _539 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].y, _521);
    float _541 = fma(_527, _501, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_531, _501, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _545 = fma(_535, _501, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _549 = fma(_541, _481, _537);
    float _551 = fma(_543, _481, _539);
    float _553 = fma(_545, _481, _547);
    float _555 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].x, _549);
    float _557 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].y, _551);
    float _559 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].z, _553);
    bool _561 = !_491;
    float _579;
    if (!_561)
    {
        float _563 = in.m_64.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_117);
        float _585 = 1.0 / _583;
        float _587 = _151 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _593 = _589 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _603;
    bool _607 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _609 = isnan(_589);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = 1.0 / _597;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _625 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_589);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    bool _637 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _639 = 1.0 / _601;
    float _641 = _605 * _619;
    bool _643 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_589);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = 1.0 / _623;
    float _657 = -_617;
    float _659 = _657 + 1.0;
    float _661 = fma(_641, _593, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _667 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _669 = isnan(_589);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -_653;
    float _681 = _679 + 1.0;
    float _683 = _653 * _659;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = 1.0 / _665;
    float _691 = -_677;
    float _693 = _691 + 1.0;
    float _695 = _635 * _681;
    float _697 = _687 * _639;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _699;
    float _703 = _617 * _693;
    float _705 = _661 * _695;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _589 + _707;
    float _711 = -_635;
    float _713 = _711 + 1.0;
    bool _715 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _717 = isnan(_589);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _701 * _655;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _735 = _589 + _733;
    float _737 = fma(_697, _709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _739 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = _731 * _689;
    float _747 = fma(_727, _735, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _751 = _589 + _749;
    float _753 = fma(_737, _683, _739);
    float _755 = _677 * _743;
    float _757 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _759 = fma(_745, _751, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _761 = fma(_747, _703, _753);
    float _763 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = fma(_759, _755, _761);
    float _767 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[119].x, _765);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _763;
    out.m_68.y = _773;
    out.m_68.z = _775;
    out.m_68.w = _777;
    bool _779 = !_637;
    float _781 = _689;
    float _799;
    if (!_779)
    {
        float _783 = in.m_64.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_117);
        float _805 = 1.0 / _803;
        float _807 = _151 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _809 + _811;
    bool _815 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = isnan(_809);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _809 + _827;
    bool _831 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _833 = isnan(_809);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _851 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _853 = isnan(_809);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_825;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _849;
    float _869 = _861 * _865;
    float _871 = -_861;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _875;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _881 = 1.0 / _845;
    float _883 = _841 * _873;
    float _885 = -_841;
    float _887 = _885 + 1.0;
    float _889 = _829 * _867;
    float _891 = _813 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = fma(_877, _891, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _903 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _905 = fma(_899, _891, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _907 = _901 * _883;
    float _909 = _903 * _883;
    float _911 = _905 * _883;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].x, _907);
    float _927 = fma(_915, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_919, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _931 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].y, _909);
    float _933 = fma(_923, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _935 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].z, _911);
    float _937 = fma(_927, _869, _925);
    float _939 = fma(_929, _869, _931);
    float _941 = fma(_933, _869, _935);
    float _943 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].x, _937);
    float _945 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].y, _939);
    float _947 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].z, _941);
    bool _949 = !_879;
    float _967;
    if (!_949)
    {
        float _951 = in.m_64.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[11].w, _151);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        float _971 = float(_117);
        float _973 = 1.0 / _971;
        float _975 = _151 * _973;
        _967 = _975;
    }
    _969 = false;
    float _977 = _967;
    float _979 = in.m_46.x;
    float _981 = in.m_46.y;
    float _983 = in.m_46.z;
    float _985 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _987 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = in.m_60.w;
    float _991 = _985 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _999 = _997 != 0;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1003 = _1001 != 0;
    float _1005 = in.m_58.w;
    float _1007 = in.m_62.w;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1023 = _1021 != 0;
    bool _1025 = !_999;
    int _1027 = _1025 ? 0 : 1;
    bool _1029 = !_995;
    int _1031 = _1029 ? 0 : 1;
    bool _1033 = !_1003;
    int _1035 = _1033 ? 0 : 1;
    bool _1037 = !_1015;
    int _1039 = _1037 ? 0 : 1;
    bool _1041 = !_1011;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = _187 * _981;
    float _1047 = _181 * _981;
    float _1049 = _193 * _981;
    float _1051 = fma(_185, _979, _1045);
    float _1053 = fma(_179, _979, _1047);
    float _1055 = fma(_191, _979, _1049);
    bool _1057 = !_1023;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = fma(_189, _983, _1051);
    float _1063 = fma(_183, _983, _1053);
    float _1065 = fma(_195, _983, _1055);
    float _1067 = _1061 + _989;
    float _1069 = _1063 + _1005;
    float _1071 = _1065 + _1007;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1067 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1079 = _1069 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1083 = _1071 + _1081;
    float _1085 = -_1067;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1089 = _1075 * _1075;
    float _1091 = -_1069;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = -_1071;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1087 * _1087;
    float _1101 = fma(_1079, _1079, _1089);
    float _1103 = fma(_1093, _1093, _1099);
    float _1105 = fma(_1083, _1083, _1101);
    float _1107 = fma(_1097, _1097, _1103);
    float _1109 = sqrt(_1105);
    float _1111 = rsqrt(_1105);
    float _1113 = _1109 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1115 = rsqrt(_1107);
    float _1117 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1119 = precise::min(_991, _1113);
    float _1121 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1117);
    float _1123 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1125 = _1111 * _1119;
    float _1127 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1121);
    float _1129 = _1075 * _1125;
    float _1131 = _1079 * _1125;
    float _1133 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1123);
    float _1135 = _1093 * _1115;
    float _1137 = -_1129;
    float _1139 = _1075 + _1137;
    float _1141 = -_1131;
    float _1143 = _1079 + _1141;
    float _1145 = _1083 * _1125;
    float _1147 = _1097 * _1115;
    float _1149 = _1139 * _1139;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1153 = _1135 * _1151;
    float _1155 = _1087 * _1115;
    float _1157 = -_1145;
    float _1159 = _1083 + _1157;
    float _1161 = fma(_1143, _1143, _1149);
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1165 = _1147 * _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1169 = -_1153;
    float _1171 = fma(_1147, _1167, _1169);
    float _1173 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1133);
    float _1175 = rsqrt(_1127);
    float _1177 = fma(_1159, _1159, _1161);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1181 = -_1165;
    float _1183 = fma(_1155, _1179, _1181);
    float _1185 = _1171 * _1171;
    float _1187 = fma(_1183, _1183, _1185);
    float _1189 = sqrt(_1177);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1193 = _1155 * _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1197 = -_1193;
    float _1199 = fma(_1135, _1195, _1197);
    float _1201 = rsqrt(_1173);
    float _1203 = fma(_1199, _1199, _1187);
    float _1205 = _213 * _1175;
    bool _1207 = !_1019;
    float _1209 = _1207 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1205);
    float _1213 = rsqrt(_1203);
    float _1215 = _1111 * _1189;
    float _1217 = _987 * _1215;
    float _1219 = _985 * _1215;
    float _1221 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = _1221 * 0.5;
    float _1225 = _209 * _1201;
    float _1227 = _1217 * _1211;
    float _1229 = -_1131;
    float _1231 = _1069 + _1229;
    float _1233 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1225);
    float _1235 = _1183 * _1213;
    float _1237 = _1171 * _1213;
    float _1239 = _1199 * _1213;
    float _1241 = _1219 * _1233;
    float _1243 = _1155 * _1235;
    float _1245 = _1147 * _1237;
    float _1247 = _1135 * _1239;
    float _1249 = -_1243;
    float _1251 = fma(_1135, _1237, _1249);
    float _1253 = -_1245;
    float _1255 = fma(_1155, _1239, _1253);
    float _1257 = -_1247;
    float _1259 = fma(_1147, _1235, _1257);
    float _1261 = _1227 * _1251;
    float _1263 = _1227 * _1255;
    float _1265 = fma(_1241, _1239, _1261);
    float _1267 = fma(_1241, _1235, _1263);
    float _1269 = fma(_1223, _1147, _1265);
    float _1271 = fma(_1223, _1135, _1267);
    float _1273 = -_1129;
    float _1275 = _1067 + _1273;
    float _1277 = _1071 + _1269;
    float _1279 = _1069 + _1271;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1283 = _1277 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1287 = _1279 + _1285;
    float _1289 = _1283 * _1283;
    float _1291 = fma(_1287, _1287, _1289);
    float _1293 = _1227 * _1259;
    float _1295 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1297 = sqrt(_1291);
    float _1299 = fma(_1241, _1237, _1293);
    float _1301 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1295);
    float _1303 = fma(_1223, _1155, _1299);
    float _1305 = -_1145;
    float _1307 = _1071 + _1305;
    float _1309 = _1067 + _1303;
    float _1311 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1301);
    bool _1313 = _1297 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = _1303;
    float _1317 = _1293;
    float _1319 = _1279;
    float _1321 = _1145;
    float _1323 = _1209;
    if (!_1313)
    {
        _1315 = _1279;
    }
    float _1325 = _1315;
    float _1327 = _1325;
    if (!_1313)
    {
        _1317 = _1277;
    }
    float _1329 = _1317;
    float _1331 = _1329;
    if (!_1313)
    {
        _1319 = _1309;
    }
    float _1333 = _1319;
    bool _1335 = !_1313;
    float _1337 = _1333;
    if (!_1335)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1343 = _1297 + _1341;
        float _1345 = rsqrt(_1291);
        float _1347 = _1343 * _1339;
        float _1349 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = _1347 * 0.15915493667125701904296875;
        float _1353 = _1351 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = _1351 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 + (-1.0);
        float _1363 = fma(_1359, _1349, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1365 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = _1345 * _1363;
        float _1369 = fma(_1309, _1355, _1365);
        float _1371 = fma(_1287, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1283, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1337 = _1369;
        _1327 = _1371;
        _1331 = _1373;
    }
    float _1375 = _1337;
    float _1377 = _1327;
    float _1379 = _1331;
    float _1381 = -_1067;
    float _1383 = _1381 + _1375;
    float _1385 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1387 = -_1069;
    float _1389 = _1387 + _1377;
    float _1391 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1393 = _1383 * _1383;
    float _1395 = -_1071;
    float _1397 = _1395 + _1379;
    float _1399 = 1.0 / _1385;
    float _1401 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1391);
    float _1403 = fma(_1389, _1389, _1393);
    float _1405 = -_1129;
    float _1407 = _1405 + _1375;
    float _1409 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1411 = fma(_1397, _1397, _1403);
    float _1413 = -_1145;
    float _1415 = _1413 + _1379;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1419 = sqrt(_1411);
    bool _1421 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1423 = isnan(0.5);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1429 = _1425 || _1427;
    float _1431 = _1417 + _1385;
    bool _1433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1435 = isnan(0.5);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1441 = _1437 || _1439;
    float _1443 = _1431 * _1399;
    float _1445 = _1443 * 0.5;
    float _1447 = -_1131;
    float _1449 = _1447 + _1377;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1453 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1451);
    bool _1455 = _1419 > 0.0;
    float _1457 = 1.0 / _1453;
    float _1459 = _1419;
    float _1461 = _1445;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1465 = _1407;
    if (!_1455)
    {
        _1459 = _1449;
    }
    float _1467 = _1459;
    float _1469 = _1467;
    if (!_1455)
    {
        _1461 = _1407;
    }
    float _1471 = _1461;
    float _1473 = _1471;
    if (!_1455)
    {
        _1463 = _1415;
    }
    float _1475 = _1463;
    bool _1477 = !_1455;
    float _1479 = _1475;
    float _1481 = _1475;
    if (!_1477)
    {
        float _1483 = _229 * _229;
        float _1485 = fma(_225, _225, _1483);
        float _1487 = fma(_231, _231, _1485);
        float _1489 = rsqrt(_1411);
        float _1491 = sqrt(_1487);
        float _1493 = _1389 * _1489;
        float _1495 = _1383 * _1489;
        float _1497 = _1397 * _1489;
        bool _1499 = _1491 > 0.0;
        float _1501 = _1489;
        float _1503 = _1491;
        _781 = _1495;
        if (!_1499)
        {
            _1501 = _1449;
        }
        float _1505 = _1501;
        _1469 = _1505;
        if (!_1499)
        {
            _1503 = _1407;
        }
        float _1507 = _1503;
        _1473 = _1507;
        if (!_1499)
        {
            _1479 = _1415;
        }
        float _1509 = _1479;
        bool _1511 = !_1499;
        _1481 = _1509;
        if (!_1511)
        {
            float _1513 = rsqrt(_1487);
            float _1515 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1517 = _229 * _1513;
            float _1519 = _225 * _1513;
            float _1521 = _1495 * _1517;
            float _1523 = _231 * _1513;
            float _1525 = fma(_1493, _1519, _1521);
            float _1527 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1529 = fma(_1497, _1523, _1525);
            float _1531 = _1529 * _1527;
            float _1533 = fma(_225, _1531, _1449);
            float _1535 = fma(_229, _1531, _1407);
            float _1537 = fma(_231, _1531, _1415);
            _1469 = _1533;
            _1473 = _1535;
            _1481 = _1537;
        }
    }
    float _1539 = _1469;
    float _1541 = _1473;
    float _1543 = _1481;
    float _1545 = _781;
    float _1547 = _1541;
    float _1549 = _1539;
    float _1551 = _1543;
    float _1553 = _1545;
    if (_1441)
    {
        _235 = 1.0;
    }
    float _1555 = _235;
    float _1557 = _1555;
    if (!_1429)
    {
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1561 = _1275 + _1559;
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1565 = _1231 + _1563;
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1569 = _1561 * _1561;
        float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1573 = _1307 + _1571;
        float _1575 = fma(_1565, _1565, _1569);
        float _1577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1579 = fma(_1573, _1573, _1575);
        float _1581 = sqrt(_1579);
        float _1583 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1585 = precise::min(_1581, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1577;
        float _1589 = -_1231;
        float _1591 = _1589 + _1539;
        float _1593 = _1583 * _1587;
        float _1595 = -_1275;
        float _1597 = _1595 + _1541;
        float _1599 = -_1307;
        float _1601 = _1599 + _1543;
        float _1603 = fma(_1591, _1593, _1231);
        float _1605 = fma(_1597, _1593, _1275);
        float _1607 = fma(_1601, _1593, _1307);
        _1547 = _1605;
        _1549 = _1603;
        _1551 = _1607;
        _237 = _1601;
    }
    float _1609 = _1547;
    float _1611 = _1549;
    float _1613 = _1551;
    float _1615 = _237;
    float _1617 = _1615;
    if (_1441)
    {
        _1553 = 1.0;
    }
    float _1619 = _1553;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1623 = _1457 * _1621;
    float _1625 = _1619;
    if (!_1441)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1633;
        float _1637 = _1629 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = _1631 * 0.15915493667125701904296875;
        float _1643 = _1629 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        float _1647 = 1.0 / _1639;
        float _1649 = _1641 * 6.283185482025146484375;
        float _1651 = cos(_1649);
        float _1653 = _1645 * _1647;
        float _1655 = _1641 * 6.283185482025146484375;
        float _1657 = sin(_1655);
        float _1659 = _1651 * _1653;
        float _1661 = 1.0 / _1635;
        float _1663 = 1.0 / _1659;
        float _1665 = _1657 * _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1623, _1665, _1667);
        float _1671 = _1669 * _1661;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1321 = _1641;
        _1617 = _1661;
        _1557 = _1673;
    }
    float _1675 = _1321;
    float _1677 = _1617;
    float _1679 = _1557;
    float _1681 = _1675;
    float _1683 = _1677;
    if (!_1441)
    {
        float _1685 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1687 = _1685 * 0.15915493667125701904296875;
        float _1689 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1691 = _1687 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1689 * 0.15915493667125701904296875;
        float _1697 = _1687 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = 1.0 / _1693;
        float _1703 = _1695 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = _1695 * 6.283185482025146484375;
        float _1711 = sin(_1709);
        float _1713 = _1705 * _1707;
        float _1715 = 1.0 / _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1717;
        float _1721 = 1.0 / _1719;
        float _1723 = _1711 * _1715;
        float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1727 = fma(_1623, _1723, _1725);
        float _1729 = _1727 * _1721;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        float _1733 = -_1731;
        float _1735 = _1733 + 1.0;
        _1465 = _1723;
        _1681 = _1693;
        _1683 = _1713;
        _1625 = _1735;
    }
    float _1737 = _1465;
    float _1739 = _1681;
    float _1741 = _1683;
    float _1743 = _1625;
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1747 = _1609 + _1745;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1751 = _1611 + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1755 = _1613 + _1753;
    float _1757 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1759 = _1747 * _1747;
    float _1761 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1757);
    float _1763 = fma(_1751, _1751, _1759);
    float _1765 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1767 = fma(_1755, _1755, _1763);
    float _1769 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1771 = rsqrt(_1767);
    float _1773 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1775 = _1751 * _1773;
    float _1777 = _1755 * _1773;
    float _1779 = _1775 * _1775;
    float _1781 = _1777 * _1777;
    float _1783 = _1779 + _1781;
    float _1785 = sqrt(_1783);
    bool _1787 = _1785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1791 = _1785 + _1789;
    float _1793 = _1771;
    float _1795 = _1741;
    float _1797 = _1791;
    float _1799 = _1737;
    float _1801 = _1773;
    float _1803 = _1783;
    if (_1787)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1793 = _1805;
    }
    float _1807 = _1793;
    if (_1787)
    {
        float _1809 = rsqrt(_1783);
        _1795 = _1809;
    }
    float _1811 = _1795;
    float _1813 = _1807;
    float _1815 = _1811;
    if (_1787)
    {
        float _1817 = _1791 * _1807;
        _1797 = _1817;
    }
    float _1819 = _1797;
    if (_1787)
    {
        float _1821 = _1819 * 0.15915493667125701904296875;
        _1799 = _1821;
    }
    float _1823 = _1799;
    float _1825 = _1755;
    float _1827 = _1823;
    if (_1787)
    {
        float _1829 = _1823 * 6.283185482025146484375;
        float _1831 = sin(_1829);
        _1825 = _1831;
    }
    float _1833 = _1825;
    float _1835 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1837 = precise::max(0.0, _1835);
    float _1839 = _1739;
    if (_1787)
    {
        float _1841 = _1823 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = -_1773;
    float _1849 = -_1837;
    float _1851 = fma(_1747, _1847, _1849);
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1855 = _1851;
    if (_1787)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1813 = _1857;
    }
    float _1859 = _1813;
    float _1861 = _1859;
    if (!_1787)
    {
        _1827 = _1777;
    }
    float _1863 = _1827;
    float _1865 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1867 = _1863;
    if (_1787)
    {
        float _1869 = fma(_1833, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1861 = _1869;
    }
    float _1871 = _1861;
    float _1873 = floor(_1865);
    float _1875 = _1871;
    if (_1787)
    {
        float _1877 = _1845 + (-1.0);
        _1853 = _1877;
    }
    float _1879 = _1853;
    if (_1787)
    {
        float _1881 = _1811 * _1871;
        _1801 = _1881;
    }
    float _1883 = _1801;
    if (!_1787)
    {
        _1815 = _1775;
    }
    float _1885 = _1815;
    float _1887 = _1885;
    if (_1787)
    {
        float _1889 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1803 = _1889;
    }
    float _1891 = _1803;
    float _1893 = _1891;
    if (_1787)
    {
        float _1895 = _1775 * _1883;
        _1887 = _1895;
    }
    float _1897 = _1887;
    if (!_1787)
    {
        _1875 = _1779;
    }
    float _1899 = _1875;
    float _1901 = _1899;
    if (_1787)
    {
        float _1903 = _1777 * _1883;
        _1867 = _1903;
    }
    float _1905 = _1867;
    if (_1787)
    {
        float _1907 = fma(_1851, _1845, _1891);
        _1855 = _1907;
    }
    float _1909 = _1855;
    if (_1787)
    {
        float _1911 = _1897 * _1897;
        _1901 = _1911;
    }
    float _1913 = _1901;
    if (!_1787)
    {
        _1893 = _1781;
    }
    float _1915 = _1893;
    float _1917 = _1915;
    if (_1787)
    {
        float _1919 = _1905 * _1905;
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = sqrt(_1767);
    float _1925 = fma(_1909, _1909, _1913);
    float _1927 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1929 = -_1873;
    float _1931 = _1865 + _1929;
    float _1933 = _1925 + _1921;
    float _1935 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1927);
    float _1939 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1941 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1943 = rsqrt(_1933);
    float _1945 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1937);
    float _1947 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1939);
    float _1949 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1941);
    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1953 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1951);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1947);
    float _1959 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1963 = -_1955;
    float _1965 = _1963 + 1.0;
    float _1967 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1971 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1975 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1969);
    float _1979 = abs(_1965);
    float _1981 = log2(_1979);
    float _1983 = _1943 * _1897;
    float _1985 = _1943 * _1905;
    float _1987 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1977);
    float _1989 = -_1975;
    float _1991 = fma(_1989, _1973, 1.0);
    float _1993 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1995 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1997 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1987);
    float _1999 = _1943 * _1909;
    float _2001 = floor(_1971);
    float _2003 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2005 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1995);
    float _2007 = -_1993;
    float _2009 = fma(_1999, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2007);
    float _2011 = _1999 + 1.0;
    float _2013 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2015 = -_1985;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2009);
    float _2019 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2021 = 1.0 / _1997;
    float _2023 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2003);
    float _2025 = fma(_2017, -0.5, 0.5);
    float _2027 = fma(_2017, 0.5, 0.5);
    float _2029 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2013);
    float _2031 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2023);
    float _2033 = -_2001;
    float _2035 = _1971 + _2033;
    float _2037 = exp2(_2019);
    float _2039 = fma(_2027, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2041 = fma(_2027, _2039, -0.212114393711090087890625);
    float _2043 = sqrt(_2025);
    float _2045 = fma(_2027, _2041, 1.570728778839111328125);
    float _2047 = _2029 * _2021;
    float _2049 = fma(_2047, 0.5, 0.5);
    float _2051 = log2(_1991);
    float _2053 = -_1999;
    float _2055 = fma(_2037, _2011, _2053);
    float _2057 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2031);
    float _2059 = _2057 * _2021;
    float _2061 = _2043 * 0.636619746685028076171875;
    float _2063 = fma(_2059, -0.5, 0.5);
    float _2065 = -_2045;
    float _2067 = fma(_2061, _2065, 1.0);
    float _2069 = fma(_2055, 0.5, 0.5);
    float _2071 = _2051 * 0.693147182464599609375;
    float2 _7055 = float2(_1931, _2035);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7055, float2(0.0), isnan(_7055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7055, float2(0.0), isnan(_7055)), level(0.0)).x;
    float _2075 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _7070 = float3(_2049, _2063, _2075);
    float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7070, float3(0.0), isnan(_7070)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7070, float3(0.0), isnan(_7070)), level(0.0)).x;
    float3 _7081 = float3(_2049, _2063, _2075);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7081, float3(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7081, float3(0.0), isnan(_7081)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float2 _7097 = float2(_2067, _2069);
    float3 _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7097, float2(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7097, float2(0.0), isnan(_7097)), level(0.0)).xyz;
    float _2094 = _2092.x;
    float _2096 = _2092.y;
    float _2098 = _2092.z;
    float _2100 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _2102 = int(_2100);
    float _2104 = in.m_64.x;
    float _2106 = in.m_64.y;
    float _2108 = in.m_64.z;
    float _2110 = in.m_64.w;
    float _2112 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2116 = _2114 != 0;
    out.m_70.x = _1231;
    out.m_70.y = _1275;
    out.m_70.z = _1307;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2120 = _2118 != 0;
    float _2122 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2124 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2126 = int(_2124);
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2130 = _2128 != 0;
    out.m_72.w = _1119;
    float _2132 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_74.x = _1235;
    out.m_74.y = _1237;
    out.m_74.z = _1239;
    float _2134 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2136 = int(_2134);
    float _2138 = float(_2102);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2144 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2146 = int(_2144);
    float _2148 = float(_2126);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2152 = _2150 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2154 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2156 = _2110 > 0.5;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2162 = _2160 != 0;
    float _2164 = 1.0 / _2138;
    float _2166 = float(uint(_2136));
    float _2168 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2170 = _2106 > 0.5;
    float _2172 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2132);
    float _2174 = -_213;
    int _2176 = _2156 ? as_type<int>(_2174) : as_type<int>(_213);
    float _2178 = -_2158;
    float _2180 = fma(_2168, 2.0, _2178);
    float _2182 = 1.0 / _2148;
    float _2184 = float(uint(_2146));
    float _2186 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2172);
    bool _2188 = !_2120;
    float _2190 = _2188 ? _213 : as_type<float>(_2176);
    out.m_76.x = _1219;
    int _2192 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2194 = _2192 != 0;
    float _2196 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2198 = _151 * _2164;
    float _2200 = 1.0 / _2166;
    int _2202 = ~_2136;
    int _2204 = _2202 + 1;
    out.gl_Position.x = _2029;
    out.gl_Position.y = _2057;
    out.gl_Position.z = _2196;
    out.gl_Position.w = _1997;
    int _2206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2208 = _2206 != 0;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2212 = _2210 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2216 = _2214 != 0;
    out.m_78.x = _1611;
    out.m_78.y = _1609;
    out.m_78.z = _1613;
    float _2218 = _151 * _2182;
    float _2220 = trunc(_2198);
    int _2222 = int(_2220);
    float _2224 = -_213;
    int _2226 = _2170 ? as_type<int>(_2224) : as_type<int>(_213);
    bool _2228 = _2104 > 0.5;
    bool _2230 = !_2130;
    float _2232 = _2230 ? _213 : as_type<float>(_2226);
    float _2234 = -_209;
    int _2236 = _2228 ? as_type<int>(_2234) : as_type<int>(_209);
    float _2238 = 1.0 / _2184;
    int _2240 = as_type<int>(_2200) + (-2);
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2244 = _2242 != 0;
    int _2246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2248 = _2246 != 0;
    int _2250 = ~_2146;
    int _2252 = _2250 + 1;
    float _2254 = trunc(_2218);
    int _2256 = int(_2254);
    bool _2258 = !_2194;
    float _2260 = _2258 ? _209 : as_type<float>(_2236);
    float _2262 = float(uint(_2222));
    bool _2264 = _2108 > 0.5;
    float _2266 = _2260 + 0.5;
    int _2268 = abs(_1027);
    float _2270 = as_type<float>(_2240) * _2262;
    int _2272 = as_type<int>(_2238) + (-2);
    float _2274 = 1.0 / _2142;
    float _2276 = -_209;
    int _2278 = _2264 ? as_type<int>(_2276) : as_type<int>(_209);
    float _2280 = _2238;
    float _2282 = _2108;
    float _2284 = _1997;
    float _2286 = _2196;
    float _2288 = _2057;
    if (_2162)
    {
        float _2290 = in.m_64.x;
        _2280 = _2290;
    }
    float _2292 = _2280;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2296 = _2294 != 0;
    float _2298 = _2292;
    if (!_2162)
    {
        float _2300 = in.m_64.y;
        _2298 = _2300;
    }
    float _2302 = _2298;
    float _2304 = float(uint(_2256));
    float _2306 = trunc(_2270);
    float _2308 = precise::max(_2306, 0.0);
    uint _2311 = uint(_2308);
    int _2313 = abs(_1039);
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2321 = _2319 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2323 = as_type<float>(_2272) * _2304;
    float _2325 = 1.0 / _2212;
    float _2327 = _2317 * _2274;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2331 = fma(_2154, -2.0, _2329);
    float _2333 = trunc(_2323);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    int _2339 = _2204 * int(_2311);
    int _2341 = _2339 + _2222;
    float _2343 = float(uint(_2341));
    float _2345 = 1.0 / _2152;
    float _2347 = _2321 * _2325;
    float _2349 = as_type<float>(_2240) * _2343;
    bool _2351 = !_2216;
    float _2353 = _2351 ? _209 : as_type<float>(_2278);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2357 = _977 + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2359;
    int _2363 = _2252 * int(_2337);
    int _2365 = _2363 + _2256;
    float _2367 = fma(_2327, _2357, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2369 = trunc(_2349);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = float(uint(_2365));
    float _2377 = as_type<float>(_2365);
    if (_2162)
    {
        _2377 = 1.0;
    }
    float _2379 = _2377;
    float _2381 = _2361 * _2345;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2385 = _977 + _2383;
    float _2387 = as_type<float>(_2272) * _2375;
    float _2389 = _2379;
    float _2391 = _2385;
    if (!_2162)
    {
        _2389 = 7.345489978790283203125;
    }
    float _2393 = _2389;
    float _2395 = exp2(_2122);
    float _2397 = fma(_2347, _2385, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2162)
    {
        _2391 = 1.0;
    }
    float _2399 = _2391;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2403 = _977 + _2401;
    float _2405 = _2393 * _2104;
    float _2407 = _2399;
    if (!_2162)
    {
        _2407 = 1.2345600128173828125;
    }
    float _2409 = _2407;
    int _2411 = ~_2136;
    int _2413 = _2411 + 1;
    float _2415 = trunc(_2387);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    int _2421 = int(_2311) + int(_2373);
    float _2423 = _2409 * _2302;
    float _2425 = float(_2136);
    float _2427 = fma(_2381, _2403, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2429 = ~_2146;
    int _2431 = _2429 + 1;
    int _2433 = _2413 * _2421;
    int _2435 = _2433 + _2222;
    bool _2437 = !_2244;
    int _2439 = _2437 ? 0 : 1;
    float _2441 = floor(_2405);
    float _2443 = float(_117);
    float _2445 = -_2395;
    float _2447 = _2445 + 1.0;
    bool _2449 = uint(_2435) >= uint(_2136);
    float _2451 = float(_2222);
    float _2453 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2455 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2457 = isnan(_977);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    int _2467 = int(_2337) + int(_2419);
    float _2469 = 1.0 / _2443;
    bool _2471 = _2451 >= _2425;
    bool _2473 = isnan(_2451);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(_2425);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = -_2465;
    float _2485 = _2483 + 1.0;
    bool _2487 = !_2449;
    int _2489 = _2487 ? 0 : (-1);
    int _2491 = _2431 * _2467;
    int _2493 = _2491 + _2256;
    float _2495 = -_2441;
    float _2497 = _2405 + _2495;
    bool _2499 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2501 = isnan(_977);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2507 = _2503 || _2505;
    float _2509 = float(_2507);
    float _2511 = trunc(_2481);
    int _2513 = int(_2511);
    int _2515 = ~_2421;
    int _2517 = _2515 + _2489;
    int _2519 = _2517 + 1;
    bool _2521 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2523 = isnan(_977);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2529 = _2525 || _2527;
    float _2531 = float(_2529);
    float _2533 = _2509 * _2485;
    bool _2535 = uint(_2493) >= uint(_2146);
    int _2537 = _2493;
    if (_2162)
    {
        _2537 = 0;
    }
    int _2539 = _2537;
    float _2541 = _151 * _2469;
    float _2543 = -_2509;
    float _2545 = _2543 + 1.0;
    bool _2547 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2549 = isnan(_977);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2555 = _2551 || _2553;
    float _2557 = float(_2555);
    int _2559 = _2539;
    if (!_2162)
    {
        _2559 = 1;
    }
    int _2561 = _2559;
    float _2563 = _2531 * _2545;
    float _2565 = -_2531;
    float _2567 = _2565 + 1.0;
    int _2569 = _2136 * _2519;
    int _2571 = _2569 + _2222;
    bool _2573 = _2136 == 0;
    float _2575 = _2541 * _2425;
    float _2577 = _2557 * _2567;
    int _2579 = ~_2513;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = _2497 * _2425;
    bool _2587 = !_2535;
    int _2589 = _2587 ? 0 : (-1);
    bool _2591 = !_2573;
    int _2593 = _2591 ? _2571 : (-1);
    float _2595 = trunc(_2575);
    int _2597 = int(_2595);
    bool _2599 = _2561 != 1;
    float _2601 = _2367 * _2577;
    float _2603 = -_151;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2180);
    int _2607 = _2593 * _2583;
    float _2609 = float(_2146);
    float _2611 = float(_2256);
    float _2613 = floor(_2423);
    int _2615 = _2136 + (-1);
    float _2617 = _2541 * _2609;
    bool _2619 = _2611 >= _2609;
    bool _2621 = isnan(_2611);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan(_2609);
    bool _2627 = _2623 || _2625;
    float _2629 = float(_2627);
    float _2631 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2605);
    int _2633 = abs(_1031);
    int _2635 = _2513 * _2615;
    int _2637 = _2635 + _2607;
    float _2639 = trunc(_2629);
    int _2641 = int(_2639);
    int _2643 = abs(_2439);
    int _2645 = ~_2467;
    int _2647 = _2645 + _2589;
    int _2649 = _2647 + 1;
    float _2651 = trunc(_2585);
    int _2653 = int(_2651);
    float _2655 = -_2613;
    float _2657 = _2423 + _2655;
    int _2659 = _2637 * _2268;
    float _2661 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2331);
    int _2663 = _2146 * _2649;
    int _2665 = _2663 + _2256;
    float _2667 = _2657 * _2609;
    int _2669 = _2597 * _2633;
    int _2671 = _2669 + _2659;
    bool _2673 = !_2116;
    int _2675 = _2673 ? 0 : 1;
    float _2677 = trunc(_2617);
    int _2679 = int(_2677);
    bool _2681 = _2146 == 0;
    float _2683 = _2232 + (-0.5);
    int _2685 = abs(_1035);
    int _2687 = abs(_2675);
    int _2689 = ~_2641;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2653 * _2643;
    int _2697 = _2695 + _2222;
    bool _2699 = !_2681;
    int _2701 = _2699 ? _2665 : (-1);
    float _2703 = trunc(_2667);
    int _2705 = int(_2703);
    int _2707 = _2146 + (-1);
    int _2709 = _2701 * _2693;
    float _2711 = -_2683;
    float _2713 = -_2661;
    float _2715 = fma(_2711, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2713);
    int _2717 = _2697 * _2685;
    int _2719 = _2717 + _2671;
    int _2721 = abs(_1043);
    int _2723 = _2641 * _2707;
    int _2725 = _2723 + _2709;
    int _2727 = _2653 * _2687;
    int _2729 = _2727 + _2719;
    float _2731 = -_2557;
    float _2733 = _2731 + 1.0;
    bool _2735 = !_2296;
    int _2737 = _2735 ? 0 : 1;
    int _2739 = _2725 * _2313;
    float _2741 = float(uint(_2729));
    float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2601);
    int _2745 = _2679 * _2721;
    int _2747 = _2745 + _2739;
    int _2749 = abs(_2737);
    float _2751 = as_type<float>(_2240) * _2741;
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2755 = _2741;
    if (!_2599)
    {
        _2755 = _2106;
    }
    float _2757 = _2755;
    float _2759 = trunc(_2751);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    int _2765 = _2705 * _2749;
    int _2767 = _2765 + _2256;
    int _2769 = abs(as_type<int>(_1209));
    float _2771 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2753);
    float _2773 = _2757;
    if (!_2599)
    {
        _1323 = _2106;
    }
    float _2775 = _1323;
    float _2777 = _2775;
    if (_2599)
    {
        _2777 = _2104;
    }
    float _2779 = _2777;
    float _2781 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2771);
    if (_2599)
    {
        _2773 = _2104;
    }
    float _2783 = _2773;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2787 = ~_2136;
    int _2789 = _2787 + 1;
    int _2791 = _2767 * _2769;
    int _2793 = _2791 + _2747;
    int _2795 = abs(_1059);
    float _2797 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2785);
    int _2799 = _2789 * int(_2763);
    int _2801 = _2799 + _2729;
    float _2803 = _2785;
    if (!_2599)
    {
        _2803 = _2108;
    }
    float _2805 = _2803;
    int _2807 = _2705 * _2795;
    int _2809 = _2807 + _2793;
    float _2811 = _2805;
    if (_2599)
    {
        _2811 = _2106;
    }
    float _2813 = _2811;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2817 = float(uint(_2801));
    float _2819 = fma(_2397, _2563, _2743);
    float _2821 = float(uint(_2809));
    float _2823 = fma(_2813, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2815);
    float _2825 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2827 = as_type<float>(_2240) * _2817;
    float _2829 = as_type<float>(_2272) * _2821;
    float _2831 = float(uint(_2697));
    float _2833 = fma(_2427, _2533, _2819);
    if (_2599)
    {
        _2282 = _2106;
    }
    float _2835 = _2282;
    float _2837 = trunc(_2829);
    float _2839 = precise::max(_2837, 0.0);
    uint _2841 = uint(_2839);
    float _2843 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2845 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2797);
    int _2847 = ~_2146;
    int _2849 = _2847 + 1;
    float _2851 = -_2843;
    float _2853 = fma(_2825, 2.0, _2851);
    float _2855 = as_type<float>(_2240) * _2831;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2859 = trunc(_2827);
    float _2861 = precise::max(_2859, 0.0);
    uint _2863 = uint(_2861);
    float _2865 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2867 = -_151;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2853);
    float _2871 = float(uint(_2767));
    float _2873 = fma(_2865, -2.0, _2857);
    float _2875 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2833);
    float _2877 = trunc(_2855);
    float _2879 = precise::max(_2877, 0.0);
    uint _2881 = uint(_2879);
    int _2883 = _2849 * int(_2841);
    int _2885 = _2883 + _2809;
    int _2887 = ~_2136;
    int _2889 = _2887 + 1;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2893 = ~_2136;
    int _2895 = _2893 + 1;
    float _2897 = -_2845;
    float _2899 = _2897 + 1.0;
    float _2901 = -_2073;
    float _2903 = _2901 + 1.0;
    float _2905 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2891);
    int _2907 = int(_2763) + int(_2863);
    float _2909 = as_type<float>(_2272) * _2871;
    float _2911 = float(uint(_2885));
    float _2913 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2905);
    float _2915 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2823);
    float _2917 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2873);
    float _2919 = as_type<float>(_2272) * _2911;
    float _2921 = trunc(_2909);
    float _2923 = precise::max(_2921, 0.0);
    uint _2925 = uint(_2923);
    int _2927 = _2889 * _2907;
    int _2929 = _2927 + _2729;
    float _2931 = _2353 + 0.5;
    int _2933 = _2895 * int(_2881);
    int _2935 = _2933 + _2697;
    int _2937 = ~_2146;
    int _2939 = _2937 + 1;
    float _2941 = -_2913;
    float _2943 = _2941 + 1.0;
    bool _2945 = uint(_2929) >= uint(_2136);
    float _2947 = _2190 + (-0.5);
    float _2949 = float(uint(_2935));
    float _2951 = fma(_2931, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2869);
    bool _2953 = !_2945;
    int _2955 = _2953 ? 0 : (-1);
    float _2957 = trunc(_2919);
    float _2959 = precise::max(_2957, 0.0);
    uint _2961 = uint(_2959);
    float _2963 = -_2781;
    float _2965 = _2963 + 1.0;
    float _2967 = -_2943;
    float _2969 = fma(_2353, _2967, _2951);
    int _2971 = ~_2907;
    int _2973 = _2971 + _2955;
    int _2975 = _2973 + 1;
    float _2977 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2979 = _2939 * int(_2925);
    int _2981 = _2979 + _2767;
    float _2983 = -_2965;
    float _2985 = fma(_2260, _2983, _2631);
    float _2987 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2989 = _2136 * _2975;
    int _2991 = _2989 + _2729;
    int _2993 = ~_2146;
    int _2995 = _2993 + 1;
    float _2997 = as_type<float>(_2240) * _2949;
    float _2999 = float(uint(_2981));
    float _3001 = fma(_2232, _2899, _2715);
    bool _3003 = !_2573;
    int _3005 = _3003 ? _2991 : (-1);
    float _3007 = -_2947;
    float _3009 = -_2917;
    float _3011 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3009);
    float _3013 = trunc(_2997);
    float _3015 = precise::max(_3013, 0.0);
    uint _3017 = uint(_3015);
    float _3019 = as_type<float>(_2272) * _2999;
    int _3021 = int(_2841) + int(_2961);
    float _3023 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3025 = _3005 & 3;
    bool _3027 = _3025 != 0;
    float _3029 = _2987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3031 = _3005 & 3;
    bool _3033 = _3031 != 0;
    int _3035 = _2995 * _3021;
    int _3037 = _3035 + _2809;
    bool _3039 = uint(_3025) > 1u;
    float _3041 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3043 = _3033 ? 0 : 1;
    float _3045 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3047 = uint(_3037) >= uint(_2146);
    float _3049 = -_2915;
    float _3051 = _3049 + 1.0;
    float _3053 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3055 = trunc(_3019);
    float _3057 = precise::max(_3055, 0.0);
    uint _3059 = uint(_3057);
    bool _3061 = !_3047;
    int _3063 = _3061 ? 0 : (-1);
    float _3065 = fma(_2190, _3051, _3011);
    int _3067 = ~_3043;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    out.m_80.x = _3041;
    out.m_80.y = _3029;
    out.m_80.z = _3045;
    out.m_80.w = _3053;
    int _3073 = ~_3021;
    int _3075 = _3073 + _3063;
    int _3077 = _3075 + 1;
    float _3079 = _2453 * _2077;
    int _3081 = _3071;
    if (!_3039)
    {
        int _3083 = ~_3043;
        int _3085 = _3083 + 1;
        _3081 = _3085;
    }
    int _3087 = _3081;
    out.m_82.x = _2985;
    out.m_82.y = _3001;
    out.m_82.z = _2969;
    out.m_82.w = _3065;
    bool _3089 = _3025 != 3;
    int _3091 = _2146 * _3077;
    int _3093 = _3091 + _2809;
    int _3095 = _3005 >> 31;
    float _3097 = abs(_1623);
    float _3099 = log2(_3097);
    bool _3101 = uint(_3025) >= 2u;
    int _3103 = int(_2881) + int(_3017);
    int _3105 = _3101 ? 0 : 1;
    float _3107 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3109 = ~_2136;
    int _3111 = _3109 + 1;
    int _3113 = _3095 & 3;
    float _3115 = fma(_3107, _3107, 1.0);
    float _3117 = _3107 * _1259;
    int _3119 = _3005 + _3113;
    float _3121 = rsqrt(_3115);
    bool _3123 = !_2681;
    int _3125 = _3123 ? _3093 : (-1);
    int _3127 = _3111 * _3103;
    int _3129 = _3127 + _2697;
    int _3131 = ~_2146;
    int _3133 = _3131 + 1;
    float _3135 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3137 = ~_3105;
    int _3139 = _3137 + 1;
    int _3141 = _3139 + 1;
    float _3143 = fma(_2112, _1237, _3117);
    int _3145 = _3119 >> 2;
    int _3147 = _3141;
    if (_3089)
    {
        int _3149 = ~_3105;
        int _3151 = _3149 + 1;
        _3147 = _3151;
    }
    int _3153 = _3147;
    float _3155 = exp2(_3135);
    int _3157 = _3125 >> 31;
    int _3159 = int(_2925) + int(_3059);
    int _3161 = _3145 << 4;
    int _3163 = _3161 + 368;
    float _3165 = _3107 * _3121;
    int _3167 = _3157 & 3;
    bool _3169 = uint(_3129) >= uint(_2136);
    int _3171 = _3133 * _3159;
    int _3173 = _3171 + _2767;
    int _3175 = _3125 + _3167;
    uint _3177 = uint(int(uint(_3163) >> uint(2)));
    uint _3179 = uint(int(uint(int(_3177)) >> uint(2)));
    int _3181 = int(_3177) & 3;
    float _3183 = (*spvDescriptorSet0.vp_c9)._m0[int(_3179)][_3181];
    int _3185 = int(_3177) + 1;
    uint _3187 = uint(int(uint(_3185) >> uint(2)));
    int _3189 = _3185 & 3;
    float _3191 = (*spvDescriptorSet0.vp_c9)._m0[int(_3187)][_3189];
    float _3193 = -_1135;
    float _3195 = _3165 * _3193;
    float _3197 = -_1155;
    float _3199 = _3165 * _3197;
    int _3201 = _3175 >> 2;
    bool _3203 = uint(_3173) >= uint(_2146);
    float _3205 = -_1147;
    float _3207 = _3165 * _3205;
    int _3209 = _3201 << 4;
    int _3211 = _3209 + 512;
    float _3213 = fma(_3121, _1255, _3195);
    float _3215 = fma(_3121, _1259, _3199);
    float _3217 = fma(_3121, _1251, _3207);
    float _3219 = _3107 * _1255;
    float _3221 = _3107 * _1251;
    uint _3223 = uint(int(uint(_3211) >> uint(2)));
    uint _3225 = uint(int(uint(int(_3223)) >> uint(2)));
    int _3227 = int(_3223) & 3;
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[int(_3225)][_3227];
    int _3231 = int(_3223) + 1;
    uint _3233 = uint(int(uint(_3231) >> uint(2)));
    int _3235 = _3231 & 3;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[int(_3233)][_3235];
    float _3239 = fma(_2112, _1235, _3219);
    float _3241 = fma(_2112, _1239, _3221);
    bool _3243 = !_3169;
    int _3245 = _3243 ? 0 : (-1);
    float _3247 = fma(_3155, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3249 = precise::clamp(_3247, 0.0, 1.0);
    bool _3251 = !_3203;
    int _3253 = _3251 ? 0 : (-1);
    out.m_84.x = _3213;
    out.m_84.y = _3215;
    out.m_84.z = _3217;
    int _3255 = ~_3103;
    int _3257 = _3255 + _3245;
    int _3259 = _3257 + 1;
    int _3261 = _3163 + 8;
    uint _3263 = uint(int(uint(_3261) >> uint(2)));
    uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
    int _3267 = int(_3263) & 3;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[int(_3265)][_3267];
    int _3271 = int(_3263) + 1;
    uint _3273 = uint(int(uint(_3271) >> uint(2)));
    int _3275 = _3271 & 3;
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[int(_3273)][_3275];
    int _3279 = _3125 & 3;
    bool _3281 = _3279 != 0;
    float _3283 = _3249 * _3249;
    int _3285 = _2136 * _3259;
    int _3287 = _3285 + _2697;
    int _3289 = _3125 & 3;
    bool _3291 = _3289 != 0;
    int _3293 = ~_3159;
    int _3295 = _3293 + _3253;
    int _3297 = _3295 + 1;
    float _3299 = fma(_3249, -2.0, 3.0);
    bool _3301 = _1623 <= 8000.0;
    bool _3303 = isnan(_1623);
    bool _3305 = _3301 || _3303;
    bool _3307 = isnan(8000.0);
    bool _3309 = _3305 || _3307;
    float _3311 = float(_3309);
    int _3313 = _3211 + 8;
    uint _3315 = uint(int(uint(_3313) >> uint(2)));
    uint _3317 = uint(int(uint(int(_3315)) >> uint(2)));
    int _3319 = int(_3315) & 3;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[int(_3317)][_3319];
    int _3323 = int(_3315) + 1;
    uint _3325 = uint(int(uint(_3323) >> uint(2)));
    int _3327 = _3323 & 3;
    float _3329 = (*spvDescriptorSet0.vp_c9)._m0[int(_3325)][_3327];
    int _3331 = _3281 ? 0 : 1;
    float _3333 = _3283 * _3299;
    bool _3335 = uint(_3289) > 1u;
    int _3337 = _2146 * _3297;
    int _3339 = _3337 + _2767;
    int _3341 = abs(_3087);
    int _3343 = ~_3331;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = ~_3341;
    int _3351 = _3349 + 1;
    int _3353 = _3351 + 1;
    bool _3355 = !_2573;
    int _3357 = _3355 ? _3287 : (-1);
    bool _3359 = !_2681;
    int _3361 = _3359 ? _3339 : (-1);
    int _3363 = _3347;
    if (!_3335)
    {
        int _3365 = ~_3331;
        int _3367 = _3365 + 1;
        _3363 = _3367;
    }
    int _3369 = _3363;
    int _3371 = _3353 * as_type<int>(_3191);
    bool _3373 = !_3027;
    int _3375 = _3373 ? 0 : 1;
    int _3377 = abs(_3369);
    bool _3379 = !_3291;
    int _3381 = _3379 ? 0 : 1;
    int _3383 = abs(_3375);
    bool _3385 = _3289 != 3;
    int _3387 = abs(_3381);
    bool _3389 = uint(_3289) >= 2u;
    int _3391 = ~_3377;
    int _3393 = _3391 + 1;
    int _3395 = _3393 + 1;
    int _3397 = abs(_3153);
    int _3399 = ~_3383;
    int _3401 = _3399 + 1;
    int _3403 = _3401 + 1;
    int _3405 = _3395 * as_type<int>(_3237);
    int _3407 = _3389 ? 0 : 1;
    int _3409 = ~_3397;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = _3403 * as_type<int>(_3183);
    int _3417 = _3415 + _3371;
    int _3419 = ~_3387;
    int _3421 = _3419 + 1;
    int _3423 = _3421 + 1;
    bool _3425 = _3025 != 3;
    int _3427 = _3413 * as_type<int>(_3269);
    int _3429 = _3427 + _3417;
    int _3431 = ~_3407;
    int _3433 = _3431 + 1;
    int _3435 = _3433 + 1;
    int _3437 = _3423 * as_type<int>(_3229);
    int _3439 = _3437 + _3405;
    int _3441 = _3435;
    if (_3385)
    {
        int _3443 = ~_3407;
        int _3445 = _3443 + 1;
        _3441 = _3445;
    }
    int _3447 = _3441;
    bool _3449 = _3289 != 3;
    bool _3451 = !_3425;
    int _3453 = _3451 ? 0 : (-1);
    int _3455 = abs(_3447);
    bool _3457 = !_2208;
    int _3459 = _3457 ? 0 : 1;
    bool _3461 = !_3449;
    int _3463 = _3461 ? 0 : (-1);
    int _3465 = abs(_3453);
    int _3467 = abs(_3459);
    int _3469 = abs(_3463);
    int _3471 = ~_3455;
    int _3473 = _3471 + 1;
    int _3475 = _3473 + 1;
    bool _3477 = !_2248;
    int _3479 = _3477 ? 0 : 1;
    int _3481 = _3475 * as_type<int>(_3321);
    int _3483 = _3481 + _3439;
    int _3485 = ~_3465;
    int _3487 = _3485 + 1;
    int _3489 = _3487 + 1;
    int _3491 = abs(_3479);
    int _3493 = ~_3469;
    int _3495 = _3493 + 1;
    int _3497 = _3495 + 1;
    int _3499 = _3489 * as_type<int>(_3277);
    int _3501 = _3499 + _3429;
    float _3503 = -_3333;
    float _3505 = _3503 + 1.0;
    float _3507 = in.m_86.x;
    int _3509 = ~_3467;
    int _3511 = _3509 + 1;
    int _3513 = _3511 + 1;
    int _3515 = _3497 * as_type<int>(_3329);
    int _3517 = _3515 + _3483;
    int _3519 = ~_3491;
    int _3521 = _3519 + 1;
    int _3523 = _3521 + 1;
    float _3525 = fma(_3505, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3333);
    float _3527 = _2196 + _1997;
    int _3529 = _3501 * _3513;
    int _3531 = _3517 * _3523;
    float _3533 = _3311 * _3525;
    float _3535 = _1997 * 0.5;
    int _3537 = _3357 * _3467;
    int _3539 = _3537 + _3529;
    float _3541 = _3527 * 0.5;
    int _3543 = _3361 * _3491;
    int _3545 = _3543 + _3531;
    float _3547 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3549 = _2029 + _1997;
    float _3551 = fma(_2057, -0.5, _3535);
    float _3553 = _1135 + _3239;
    float _3555 = _2903 * _3547;
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = _3549 * 0.5;
    float _3561 = _2098 * _3079;
    float _3563 = -_2453;
    float _3565 = _3563 + 1.0;
    float _3567 = -_3557;
    float _3569 = fma(_3567, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3571 = float(_3545);
    out.m_88.x = _3559;
    out.m_88.y = _3551;
    out.m_88.z = _3541;
    out.m_88.w = _1997;
    float _3573 = _1155 + _3143;
    float _3575 = _3569 * _3507;
    float _3577 = _1147 + _3241;
    bool _3579 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3581 = isnan(_1923);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3587 = _3583 || _3585;
    float _3589 = _3575 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3591 = float(_3539);
    out.m_90.x = _3553;
    out.m_90.y = _3573;
    out.m_90.z = _3577;
    out.m_92.x = _3589;
    float _3593 = _2088 * _3079;
    float _3595 = _2088 * _3565;
    float _3597 = fma(_2088, _3561, _2086);
    float _3599 = _1679 * _1743;
    float _3601 = fma(_2094, _3593, _2082);
    float _3603 = fma(_2096, _3593, _2084);
    out.m_94.x = _3591;
    out.m_94.y = _3571;
    float _3605 = _3599 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3607 = _3599;
    float _3609 = _3571;
    float _3611 = _3591;
    if (!_3587)
    {
        _2284 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3613 = _2284;
    out.m_96.x = _3601;
    out.m_96.y = _3603;
    out.m_96.z = _3597;
    out.m_96.w = _3595;
    float _3615 = _3613;
    float _3617 = _3613;
    if (!_3587)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3619 = _2286;
    float _3621 = _3619;
    float _3623 = _3619;
    if (!_3587)
    {
        _2288 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3625 = _2288;
    float _3627 = _3625;
    float _3629 = _3625;
    if (!_3587)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3631 = _3607;
    float _3633 = _3631;
    float _3635 = _3631;
    if (!_3587)
    {
        _3609 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3637 = _3609;
    float _3639 = _3637;
    float _3641 = _3637;
    if (!_3587)
    {
        _3611 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3643 = _3611;
    bool _3645 = !_3587;
    float _3647 = _3643;
    float _3649 = _3643;
    if (!_3645)
    {
        bool _3651 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3653 = isnan(_1923);
        bool _3655 = _3651 || _3653;
        bool _3657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3659 = _3655 || _3657;
        if (!_3659)
        {
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3663 = _1923 + _3661;
            float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3665;
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3673 = 1.0 / _3667;
            float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3691 = _3663 * _3673;
            float _3693 = precise::clamp(_3691, 0.0, 1.0);
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3699 = fma(_3693, _3671, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3701 = fma(_3693, _3697, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3703 = fma(_3693, _3677, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3705 = fma(_3693, _3681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3707 = fma(_3693, _3685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3709 = fma(_3693, _3689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3649 = _3703;
            _3629 = _3707;
            _3641 = _3699;
            _3623 = _3705;
            _3617 = _3701;
            _3635 = _3709;
            _3711 = true;
        }
        else
        {
            bool _3713 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3715 = isnan(_1923);
            bool _3717 = _3713 || _3715;
            bool _3719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3721 = _3717 || _3719;
            if (!_3721)
            {
                _3639 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3723 = _3639;
            _3641 = _3723;
            if (!_3721)
            {
                _3647 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3725 = _3647;
            _3649 = _3725;
            if (!_3721)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3727 = _3615;
            _3617 = _3727;
            if (!_3721)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3729 = _3621;
            _3623 = _3729;
            if (!_3721)
            {
                _3627 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3731 = _3627;
            _3629 = _3731;
            if (!_3721)
            {
                _3633 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3733 = _3633;
            bool _3735 = !_3721;
            _3635 = _3733;
            if (!_3735)
            {
                bool _3737 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3739 = isnan(_1923);
                bool _3741 = _3737 || _3739;
                bool _3743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3745 = _3741 || _3743;
                if (!_3745)
                {
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3749 = _1923 + _3747;
                    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3751;
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3759 = 1.0 / _3753;
                    float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3767 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3777 = _3749 * _3759;
                    float _3779 = precise::clamp(_3777, 0.0, 1.0);
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3783 = _3781 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3785 = fma(_3779, _3757, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3787 = fma(_3779, _3783, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3789 = fma(_3779, _3763, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3791 = fma(_3779, _3767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3793 = fma(_3779, _3771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3795 = fma(_3779, _3775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3649 = _3789;
                    _3629 = _3793;
                    _3641 = _3785;
                    _3623 = _3791;
                    _3617 = _3787;
                    _3635 = _3795;
                    _3711 = true;
                }
                else
                {
                    _3649 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3629 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3641 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3635 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3711 = false;
    float _3797 = _3649;
    float _3799 = _3629;
    float _3801 = _3641;
    float _3803 = _3623;
    float _3805 = _3617;
    float _3807 = _3635;
    float _3809 = _3605 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3811 = fma(_3573, -0.5, 0.5);
    float _3813 = precise::clamp(_3811, 0.0, 1.0);
    float _3815 = -_3797;
    float _3817 = _3815 + _3799;
    float _3819 = -_3801;
    float _3821 = _3819 + _3803;
    out.m_98.x = 0.0;
    float _3823 = fma(_3813, _3817, _3797);
    float _3825 = -_3805;
    float _3827 = _3825 + _3807;
    float _3829 = fma(_3813, _3821, _3801);
    float _3831 = _3823 * 0.586610972881317138671875;
    bool _3833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3835 = fma(_3813, _3827, _3805);
    out.m_49.x = _3809;
    float _3837 = fma(_3829, 0.298911988735198974609375, _3831);
    bool _3839 = _1679 > 0.0;
    bool _3841 = isnan(_1679);
    bool _3843 = _3839 || _3841;
    bool _3845 = isnan(0.0);
    bool _3847 = _3843 || _3845;
    float _3849 = fma(_3835, 0.114477999508380889892578125, _3837);
    bool _3851 = _1743 <= 0.0;
    bool _3853 = !_3847;
    bool _3855 = _3851 || _3853;
    float _3857 = -_3849;
    float _3859 = _3829 + _3857;
    float _3861 = -_3849;
    float _3863 = _3823 + _3861;
    float _3865 = -_3849;
    float _3867 = _3835 + _3865;
    float _3869 = fma(_3859, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    float _3871 = fma(_3863, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    float _3873 = fma(_3867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    bool _3875 = !_3833;
    if (!_3875)
    {
        float _3877 = -_1609;
        float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3881 = -_1611;
        float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3885 = -_1613;
        float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3889 = _3879 * _3879;
        float _3891 = fma(_3883, _3883, _3889);
        float _3893 = fma(_3887, _3887, _3891);
        float _3895 = sqrt(_3893);
        float _3897 = rsqrt(_3893);
        float _3899 = -_3895;
        float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3903 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3905 = precise::clamp(_3903, 0.0, 1.0);
        float _3907 = _3883 * _3897;
        float _3909 = _3879 * _3897;
        float _3911 = abs(_3905);
        float _3913 = log2(_3911);
        float _3915 = _3887 * _3897;
        float _3917 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3919 = _3573 * _3909;
        float _3921 = -_3909;
        float _3923 = -_3917;
        float _3925 = fma(_3921, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3923);
        float _3927 = fma(_3553, _3907, _3919);
        float _3929 = -_3915;
        float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3925);
        float _3933 = fma(_3577, _3915, _3927);
        float _3935 = precise::clamp(_3933, 0.0, 1.0);
        float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3939 = _3931 + _3937;
        float _3941 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3943 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3945 = precise::clamp(_3943, 0.0, 1.0);
        float _3947 = exp2(_3941);
        float _3949 = _3947 * _3945;
        float _3951 = _3935 * _3949;
        float _3953 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3955 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3957 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3953;
        out.m_98.y = _3955;
        out.m_98.z = _3957;
    }
    out.m_72.x = _3869;
    out.m_72.y = _3871;
    out.m_72.z = _3873;
    if (!_3855)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3959 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3959;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3711 = false;
    bool _969 = false;
    bool _801 = false;
    bool _581 = false;
    bool _413 = false;
    bool _257 = false;
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
    float _127 = _125;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4016 = as_type<float>(_133);
        out.gl_Position.z = _4016;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_51.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_49.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4084 = as_type<float>(_169);
        out.gl_Position.z = _4084;
    }
    if (_163)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    float _179 = in.m_58.x;
    float _181 = in.m_58.y;
    float _183 = in.m_58.z;
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_177, _183, _219);
    float _227 = fma(_173, _191, _221);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _227);
    bool _233 = !_205;
    float _235 = _225;
    float _237 = _231;
    float _255;
    if (!_233)
    {
        float _239 = in.m_64.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_117);
        float _261 = 1.0 / _259;
        float _263 = _151 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    bool _271 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_265);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _265 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -_281;
    float _297 = _295 + 1.0;
    float _299 = in.m_66.x;
    float _301 = in.m_66.y;
    bool _303 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_265);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _289;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _293;
    float _321 = _269 * _315;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = _333 * _297;
    float _345 = -_333;
    float _347 = _345 + 1.0;
    float _349 = _285 * _319;
    float _351 = fma(_337, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _353 = fma(_341, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _313 * _347;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = -_313;
    float _367 = _365 + 1.0;
    float _369 = _351 * _355;
    float _371 = _353 * _355;
    float _373 = fma(_359, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = fma(_363, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _381 = fma(_373, _343, _377);
    float _383 = fma(_375, _343, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].x, _381);
    float _387 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].y, _383);
    float _389 = _385 * _299;
    float _391 = _387 * _301;
    bool _393 = !_317;
    float _411;
    if (!_393)
    {
        float _395 = in.m_64.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_117);
        float _417 = 1.0 / _415;
        float _419 = _151 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = _421 + _423;
    bool _427 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _429 = isnan(_421);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _421 + _439;
    bool _443 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _445 = isnan(_421);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_421);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -_437;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _461;
    float _481 = _473 * _477;
    float _483 = -_473;
    float _485 = _483 + 1.0;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    bool _491 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _493 = 1.0 / _457;
    float _495 = _453 * _485;
    float _497 = -_453;
    float _499 = _497 + 1.0;
    float _501 = _441 * _479;
    float _503 = _425 * _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    float _513 = fma(_489, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _515 = fma(_507, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _517 = fma(_511, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _519 = _513 * _495;
    float _521 = _515 * _495;
    float _523 = _517 * _495;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].x, _519);
    float _539 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].y, _521);
    float _541 = fma(_527, _501, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_531, _501, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _545 = fma(_535, _501, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _549 = fma(_541, _481, _537);
    float _551 = fma(_543, _481, _539);
    float _553 = fma(_545, _481, _547);
    float _555 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].x, _549);
    float _557 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].y, _551);
    float _559 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].z, _553);
    bool _561 = !_491;
    float _579;
    if (!_561)
    {
        float _563 = in.m_64.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_117);
        float _585 = 1.0 / _583;
        float _587 = _151 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _593 = _589 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _603;
    bool _607 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _609 = isnan(_589);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = 1.0 / _597;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _625 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_589);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    bool _637 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _639 = 1.0 / _601;
    float _641 = _605 * _619;
    bool _643 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_589);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = 1.0 / _623;
    float _657 = -_617;
    float _659 = _657 + 1.0;
    float _661 = fma(_641, _593, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _667 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _669 = isnan(_589);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -_653;
    float _681 = _679 + 1.0;
    float _683 = _653 * _659;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = 1.0 / _665;
    float _691 = -_677;
    float _693 = _691 + 1.0;
    float _695 = _635 * _681;
    float _697 = _687 * _639;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _699;
    float _703 = _617 * _693;
    float _705 = _661 * _695;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _589 + _707;
    float _711 = -_635;
    float _713 = _711 + 1.0;
    bool _715 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _717 = isnan(_589);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _701 * _655;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _735 = _589 + _733;
    float _737 = fma(_697, _709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _739 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = _731 * _689;
    float _747 = fma(_727, _735, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _751 = _589 + _749;
    float _753 = fma(_737, _683, _739);
    float _755 = _677 * _743;
    float _757 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _759 = fma(_745, _751, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _761 = fma(_747, _703, _753);
    float _763 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = fma(_759, _755, _761);
    float _767 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[119].x, _765);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _763;
    out.m_68.y = _773;
    out.m_68.z = _775;
    out.m_68.w = _777;
    bool _779 = !_637;
    float _781 = _689;
    float _799;
    if (!_779)
    {
        float _783 = in.m_64.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_117);
        float _805 = 1.0 / _803;
        float _807 = _151 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _809 + _811;
    bool _815 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = isnan(_809);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _809 + _827;
    bool _831 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _833 = isnan(_809);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _851 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _853 = isnan(_809);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_825;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _849;
    float _869 = _861 * _865;
    float _871 = -_861;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _875;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _881 = 1.0 / _845;
    float _883 = _841 * _873;
    float _885 = -_841;
    float _887 = _885 + 1.0;
    float _889 = _829 * _867;
    float _891 = _813 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = fma(_877, _891, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _903 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _905 = fma(_899, _891, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _907 = _901 * _883;
    float _909 = _903 * _883;
    float _911 = _905 * _883;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].x, _907);
    float _927 = fma(_915, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_919, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _931 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].y, _909);
    float _933 = fma(_923, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _935 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].z, _911);
    float _937 = fma(_927, _869, _925);
    float _939 = fma(_929, _869, _931);
    float _941 = fma(_933, _869, _935);
    float _943 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].x, _937);
    float _945 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].y, _939);
    float _947 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].z, _941);
    bool _949 = !_879;
    float _967;
    if (!_949)
    {
        float _951 = in.m_64.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[11].w, _151);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        float _971 = float(_117);
        float _973 = 1.0 / _971;
        float _975 = _151 * _973;
        _967 = _975;
    }
    _969 = false;
    float _977 = _967;
    float _979 = in.m_46.x;
    float _981 = in.m_46.y;
    float _983 = in.m_46.z;
    float _985 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _987 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = in.m_60.w;
    float _991 = _985 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _999 = _997 != 0;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1003 = _1001 != 0;
    float _1005 = in.m_58.w;
    float _1007 = in.m_62.w;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1023 = _1021 != 0;
    bool _1025 = !_999;
    int _1027 = _1025 ? 0 : 1;
    bool _1029 = !_995;
    int _1031 = _1029 ? 0 : 1;
    bool _1033 = !_1003;
    int _1035 = _1033 ? 0 : 1;
    bool _1037 = !_1015;
    int _1039 = _1037 ? 0 : 1;
    bool _1041 = !_1011;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = _187 * _981;
    float _1047 = _181 * _981;
    float _1049 = _193 * _981;
    float _1051 = fma(_185, _979, _1045);
    float _1053 = fma(_179, _979, _1047);
    float _1055 = fma(_191, _979, _1049);
    bool _1057 = !_1023;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = fma(_189, _983, _1051);
    float _1063 = fma(_183, _983, _1053);
    float _1065 = fma(_195, _983, _1055);
    float _1067 = _1061 + _989;
    float _1069 = _1063 + _1005;
    float _1071 = _1065 + _1007;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1067 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1079 = _1069 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1083 = _1071 + _1081;
    float _1085 = -_1067;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1089 = _1075 * _1075;
    float _1091 = -_1069;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = -_1071;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1087 * _1087;
    float _1101 = fma(_1079, _1079, _1089);
    float _1103 = fma(_1093, _1093, _1099);
    float _1105 = fma(_1083, _1083, _1101);
    float _1107 = fma(_1097, _1097, _1103);
    float _1109 = sqrt(_1105);
    float _1111 = rsqrt(_1105);
    float _1113 = _1109 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1115 = rsqrt(_1107);
    float _1117 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1119 = precise::min(_991, _1113);
    float _1121 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1117);
    float _1123 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1125 = _1111 * _1119;
    float _1127 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1121);
    float _1129 = _1075 * _1125;
    float _1131 = _1079 * _1125;
    float _1133 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1123);
    float _1135 = _1093 * _1115;
    float _1137 = -_1129;
    float _1139 = _1075 + _1137;
    float _1141 = -_1131;
    float _1143 = _1079 + _1141;
    float _1145 = _1083 * _1125;
    float _1147 = _1097 * _1115;
    float _1149 = _1139 * _1139;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1153 = _1135 * _1151;
    float _1155 = _1087 * _1115;
    float _1157 = -_1145;
    float _1159 = _1083 + _1157;
    float _1161 = fma(_1143, _1143, _1149);
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1165 = _1147 * _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1169 = -_1153;
    float _1171 = fma(_1147, _1167, _1169);
    float _1173 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1133);
    float _1175 = rsqrt(_1127);
    float _1177 = fma(_1159, _1159, _1161);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1181 = -_1165;
    float _1183 = fma(_1155, _1179, _1181);
    float _1185 = _1171 * _1171;
    float _1187 = fma(_1183, _1183, _1185);
    float _1189 = sqrt(_1177);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1193 = _1155 * _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1197 = -_1193;
    float _1199 = fma(_1135, _1195, _1197);
    float _1201 = rsqrt(_1173);
    float _1203 = fma(_1199, _1199, _1187);
    float _1205 = _213 * _1175;
    bool _1207 = !_1019;
    float _1209 = _1207 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1205);
    float _1213 = rsqrt(_1203);
    float _1215 = _1111 * _1189;
    float _1217 = _987 * _1215;
    float _1219 = _985 * _1215;
    float _1221 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = _1221 * 0.5;
    float _1225 = _209 * _1201;
    float _1227 = _1217 * _1211;
    float _1229 = -_1131;
    float _1231 = _1069 + _1229;
    float _1233 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1225);
    float _1235 = _1183 * _1213;
    float _1237 = _1171 * _1213;
    float _1239 = _1199 * _1213;
    float _1241 = _1219 * _1233;
    float _1243 = _1155 * _1235;
    float _1245 = _1147 * _1237;
    float _1247 = _1135 * _1239;
    float _1249 = -_1243;
    float _1251 = fma(_1135, _1237, _1249);
    float _1253 = -_1245;
    float _1255 = fma(_1155, _1239, _1253);
    float _1257 = -_1247;
    float _1259 = fma(_1147, _1235, _1257);
    float _1261 = _1227 * _1251;
    float _1263 = _1227 * _1255;
    float _1265 = fma(_1241, _1239, _1261);
    float _1267 = fma(_1241, _1235, _1263);
    float _1269 = fma(_1223, _1147, _1265);
    float _1271 = fma(_1223, _1135, _1267);
    float _1273 = -_1129;
    float _1275 = _1067 + _1273;
    float _1277 = _1071 + _1269;
    float _1279 = _1069 + _1271;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1283 = _1277 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1287 = _1279 + _1285;
    float _1289 = _1283 * _1283;
    float _1291 = fma(_1287, _1287, _1289);
    float _1293 = _1227 * _1259;
    float _1295 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1297 = sqrt(_1291);
    float _1299 = fma(_1241, _1237, _1293);
    float _1301 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1295);
    float _1303 = fma(_1223, _1155, _1299);
    float _1305 = -_1145;
    float _1307 = _1071 + _1305;
    float _1309 = _1067 + _1303;
    float _1311 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1301);
    bool _1313 = _1297 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = _1303;
    float _1317 = _1293;
    float _1319 = _1279;
    float _1321 = _1145;
    float _1323 = _1209;
    if (!_1313)
    {
        _1315 = _1279;
    }
    float _1325 = _1315;
    float _1327 = _1325;
    if (!_1313)
    {
        _1317 = _1277;
    }
    float _1329 = _1317;
    float _1331 = _1329;
    if (!_1313)
    {
        _1319 = _1309;
    }
    float _1333 = _1319;
    bool _1335 = !_1313;
    float _1337 = _1333;
    if (!_1335)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1343 = _1297 + _1341;
        float _1345 = rsqrt(_1291);
        float _1347 = _1343 * _1339;
        float _1349 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = _1347 * 0.15915493667125701904296875;
        float _1353 = _1351 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = _1351 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 + (-1.0);
        float _1363 = fma(_1359, _1349, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1365 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = _1345 * _1363;
        float _1369 = fma(_1309, _1355, _1365);
        float _1371 = fma(_1287, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1283, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1337 = _1369;
        _1327 = _1371;
        _1331 = _1373;
    }
    float _1375 = _1337;
    float _1377 = _1327;
    float _1379 = _1331;
    float _1381 = -_1067;
    float _1383 = _1381 + _1375;
    float _1385 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1387 = -_1069;
    float _1389 = _1387 + _1377;
    float _1391 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1393 = _1383 * _1383;
    float _1395 = -_1071;
    float _1397 = _1395 + _1379;
    float _1399 = 1.0 / _1385;
    float _1401 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1391);
    float _1403 = fma(_1389, _1389, _1393);
    float _1405 = -_1129;
    float _1407 = _1405 + _1375;
    float _1409 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1411 = fma(_1397, _1397, _1403);
    float _1413 = -_1145;
    float _1415 = _1413 + _1379;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1419 = sqrt(_1411);
    bool _1421 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1423 = isnan(0.5);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1429 = _1425 || _1427;
    float _1431 = _1417 + _1385;
    bool _1433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1435 = isnan(0.5);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1441 = _1437 || _1439;
    float _1443 = _1431 * _1399;
    float _1445 = _1443 * 0.5;
    float _1447 = -_1131;
    float _1449 = _1447 + _1377;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1453 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1451);
    bool _1455 = _1419 > 0.0;
    float _1457 = 1.0 / _1453;
    float _1459 = _1419;
    float _1461 = _1445;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1465 = _1407;
    if (!_1455)
    {
        _1459 = _1449;
    }
    float _1467 = _1459;
    float _1469 = _1467;
    if (!_1455)
    {
        _1461 = _1407;
    }
    float _1471 = _1461;
    float _1473 = _1471;
    if (!_1455)
    {
        _1463 = _1415;
    }
    float _1475 = _1463;
    bool _1477 = !_1455;
    float _1479 = _1475;
    float _1481 = _1475;
    if (!_1477)
    {
        float _1483 = _229 * _229;
        float _1485 = fma(_225, _225, _1483);
        float _1487 = fma(_231, _231, _1485);
        float _1489 = rsqrt(_1411);
        float _1491 = sqrt(_1487);
        float _1493 = _1389 * _1489;
        float _1495 = _1383 * _1489;
        float _1497 = _1397 * _1489;
        bool _1499 = _1491 > 0.0;
        float _1501 = _1489;
        float _1503 = _1491;
        _781 = _1495;
        if (!_1499)
        {
            _1501 = _1449;
        }
        float _1505 = _1501;
        _1469 = _1505;
        if (!_1499)
        {
            _1503 = _1407;
        }
        float _1507 = _1503;
        _1473 = _1507;
        if (!_1499)
        {
            _1479 = _1415;
        }
        float _1509 = _1479;
        bool _1511 = !_1499;
        _1481 = _1509;
        if (!_1511)
        {
            float _1513 = rsqrt(_1487);
            float _1515 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1517 = _229 * _1513;
            float _1519 = _225 * _1513;
            float _1521 = _1495 * _1517;
            float _1523 = _231 * _1513;
            float _1525 = fma(_1493, _1519, _1521);
            float _1527 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1529 = fma(_1497, _1523, _1525);
            float _1531 = _1529 * _1527;
            float _1533 = fma(_225, _1531, _1449);
            float _1535 = fma(_229, _1531, _1407);
            float _1537 = fma(_231, _1531, _1415);
            _1469 = _1533;
            _1473 = _1535;
            _1481 = _1537;
        }
    }
    float _1539 = _1469;
    float _1541 = _1473;
    float _1543 = _1481;
    float _1545 = _781;
    float _1547 = _1541;
    float _1549 = _1539;
    float _1551 = _1543;
    float _1553 = _1545;
    if (_1441)
    {
        _235 = 1.0;
    }
    float _1555 = _235;
    float _1557 = _1555;
    if (!_1429)
    {
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1561 = _1275 + _1559;
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1565 = _1231 + _1563;
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1569 = _1561 * _1561;
        float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1573 = _1307 + _1571;
        float _1575 = fma(_1565, _1565, _1569);
        float _1577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1579 = fma(_1573, _1573, _1575);
        float _1581 = sqrt(_1579);
        float _1583 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1585 = precise::min(_1581, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1577;
        float _1589 = -_1231;
        float _1591 = _1589 + _1539;
        float _1593 = _1583 * _1587;
        float _1595 = -_1275;
        float _1597 = _1595 + _1541;
        float _1599 = -_1307;
        float _1601 = _1599 + _1543;
        float _1603 = fma(_1591, _1593, _1231);
        float _1605 = fma(_1597, _1593, _1275);
        float _1607 = fma(_1601, _1593, _1307);
        _1547 = _1605;
        _1549 = _1603;
        _1551 = _1607;
        _237 = _1601;
    }
    float _1609 = _1547;
    float _1611 = _1549;
    float _1613 = _1551;
    float _1615 = _237;
    float _1617 = _1615;
    if (_1441)
    {
        _1553 = 1.0;
    }
    float _1619 = _1553;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1623 = _1457 * _1621;
    float _1625 = _1619;
    if (!_1441)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1633;
        float _1637 = _1629 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = _1631 * 0.15915493667125701904296875;
        float _1643 = _1629 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        float _1647 = 1.0 / _1639;
        float _1649 = _1641 * 6.283185482025146484375;
        float _1651 = cos(_1649);
        float _1653 = _1645 * _1647;
        float _1655 = _1641 * 6.283185482025146484375;
        float _1657 = sin(_1655);
        float _1659 = _1651 * _1653;
        float _1661 = 1.0 / _1635;
        float _1663 = 1.0 / _1659;
        float _1665 = _1657 * _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1623, _1665, _1667);
        float _1671 = _1669 * _1661;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1321 = _1641;
        _1617 = _1661;
        _1557 = _1673;
    }
    float _1675 = _1321;
    float _1677 = _1617;
    float _1679 = _1557;
    float _1681 = _1675;
    float _1683 = _1677;
    if (!_1441)
    {
        float _1685 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1687 = _1685 * 0.15915493667125701904296875;
        float _1689 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1691 = _1687 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1689 * 0.15915493667125701904296875;
        float _1697 = _1687 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = 1.0 / _1693;
        float _1703 = _1695 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = _1695 * 6.283185482025146484375;
        float _1711 = sin(_1709);
        float _1713 = _1705 * _1707;
        float _1715 = 1.0 / _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1717;
        float _1721 = 1.0 / _1719;
        float _1723 = _1711 * _1715;
        float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1727 = fma(_1623, _1723, _1725);
        float _1729 = _1727 * _1721;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        float _1733 = -_1731;
        float _1735 = _1733 + 1.0;
        _1465 = _1723;
        _1681 = _1693;
        _1683 = _1713;
        _1625 = _1735;
    }
    float _1737 = _1465;
    float _1739 = _1681;
    float _1741 = _1683;
    float _1743 = _1625;
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1747 = _1609 + _1745;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1751 = _1611 + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1755 = _1613 + _1753;
    float _1757 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1759 = _1747 * _1747;
    float _1761 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1757);
    float _1763 = fma(_1751, _1751, _1759);
    float _1765 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1767 = fma(_1755, _1755, _1763);
    float _1769 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1771 = rsqrt(_1767);
    float _1773 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1775 = _1751 * _1773;
    float _1777 = _1755 * _1773;
    float _1779 = _1775 * _1775;
    float _1781 = _1777 * _1777;
    float _1783 = _1779 + _1781;
    float _1785 = sqrt(_1783);
    bool _1787 = _1785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1791 = _1785 + _1789;
    float _1793 = _1771;
    float _1795 = _1741;
    float _1797 = _1791;
    float _1799 = _1737;
    float _1801 = _1773;
    float _1803 = _1783;
    if (_1787)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1793 = _1805;
    }
    float _1807 = _1793;
    if (_1787)
    {
        float _1809 = rsqrt(_1783);
        _1795 = _1809;
    }
    float _1811 = _1795;
    float _1813 = _1807;
    float _1815 = _1811;
    if (_1787)
    {
        float _1817 = _1791 * _1807;
        _1797 = _1817;
    }
    float _1819 = _1797;
    if (_1787)
    {
        float _1821 = _1819 * 0.15915493667125701904296875;
        _1799 = _1821;
    }
    float _1823 = _1799;
    float _1825 = _1755;
    float _1827 = _1823;
    if (_1787)
    {
        float _1829 = _1823 * 6.283185482025146484375;
        float _1831 = sin(_1829);
        _1825 = _1831;
    }
    float _1833 = _1825;
    float _1835 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1837 = precise::max(0.0, _1835);
    float _1839 = _1739;
    if (_1787)
    {
        float _1841 = _1823 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = -_1773;
    float _1849 = -_1837;
    float _1851 = fma(_1747, _1847, _1849);
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1855 = _1851;
    if (_1787)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1813 = _1857;
    }
    float _1859 = _1813;
    float _1861 = _1859;
    if (!_1787)
    {
        _1827 = _1777;
    }
    float _1863 = _1827;
    float _1865 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1867 = _1863;
    if (_1787)
    {
        float _1869 = fma(_1833, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1861 = _1869;
    }
    float _1871 = _1861;
    float _1873 = floor(_1865);
    float _1875 = _1871;
    if (_1787)
    {
        float _1877 = _1845 + (-1.0);
        _1853 = _1877;
    }
    float _1879 = _1853;
    if (_1787)
    {
        float _1881 = _1811 * _1871;
        _1801 = _1881;
    }
    float _1883 = _1801;
    if (!_1787)
    {
        _1815 = _1775;
    }
    float _1885 = _1815;
    float _1887 = _1885;
    if (_1787)
    {
        float _1889 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1803 = _1889;
    }
    float _1891 = _1803;
    float _1893 = _1891;
    if (_1787)
    {
        float _1895 = _1775 * _1883;
        _1887 = _1895;
    }
    float _1897 = _1887;
    if (!_1787)
    {
        _1875 = _1779;
    }
    float _1899 = _1875;
    float _1901 = _1899;
    if (_1787)
    {
        float _1903 = _1777 * _1883;
        _1867 = _1903;
    }
    float _1905 = _1867;
    if (_1787)
    {
        float _1907 = fma(_1851, _1845, _1891);
        _1855 = _1907;
    }
    float _1909 = _1855;
    if (_1787)
    {
        float _1911 = _1897 * _1897;
        _1901 = _1911;
    }
    float _1913 = _1901;
    if (!_1787)
    {
        _1893 = _1781;
    }
    float _1915 = _1893;
    float _1917 = _1915;
    if (_1787)
    {
        float _1919 = _1905 * _1905;
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = sqrt(_1767);
    float _1925 = fma(_1909, _1909, _1913);
    float _1927 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1929 = -_1873;
    float _1931 = _1865 + _1929;
    float _1933 = _1925 + _1921;
    float _1935 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1927);
    float _1939 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1941 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1943 = rsqrt(_1933);
    float _1945 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1937);
    float _1947 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1939);
    float _1949 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1941);
    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1953 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1951);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1947);
    float _1959 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1963 = -_1955;
    float _1965 = _1963 + 1.0;
    float _1967 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1971 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1975 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1969);
    float _1979 = abs(_1965);
    float _1981 = log2(_1979);
    float _1983 = _1943 * _1897;
    float _1985 = _1943 * _1905;
    float _1987 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1977);
    float _1989 = -_1975;
    float _1991 = fma(_1989, _1973, 1.0);
    float _1993 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1995 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1997 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1987);
    float _1999 = _1943 * _1909;
    float _2001 = floor(_1971);
    float _2003 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2005 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1995);
    float _2007 = -_1993;
    float _2009 = fma(_1999, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2007);
    float _2011 = _1999 + 1.0;
    float _2013 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2015 = -_1985;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2009);
    float _2019 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2021 = 1.0 / _1997;
    float _2023 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2003);
    float _2025 = fma(_2017, -0.5, 0.5);
    float _2027 = fma(_2017, 0.5, 0.5);
    float _2029 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2013);
    float _2031 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2023);
    float _2033 = -_2001;
    float _2035 = _1971 + _2033;
    float _2037 = exp2(_2019);
    float _2039 = fma(_2027, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2041 = fma(_2027, _2039, -0.212114393711090087890625);
    float _2043 = sqrt(_2025);
    float _2045 = fma(_2027, _2041, 1.570728778839111328125);
    float _2047 = _2029 * _2021;
    float _2049 = fma(_2047, 0.5, 0.5);
    float _2051 = log2(_1991);
    float _2053 = -_1999;
    float _2055 = fma(_2037, _2011, _2053);
    float _2057 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2031);
    float _2059 = _2057 * _2021;
    float _2061 = _2043 * 0.636619746685028076171875;
    float _2063 = fma(_2059, -0.5, 0.5);
    float _2065 = -_2045;
    float _2067 = fma(_2061, _2065, 1.0);
    float _2069 = fma(_2055, 0.5, 0.5);
    float _2071 = _2051 * 0.693147182464599609375;
    float2 _7055 = float2(_1931, _2035);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7055, float2(0.0), isnan(_7055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7055, float2(0.0), isnan(_7055)), level(0.0)).x;
    float _2075 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _7070 = float3(_2049, _2063, _2075);
    float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7070, float3(0.0), isnan(_7070)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7070, float3(0.0), isnan(_7070)), level(0.0)).x;
    float3 _7081 = float3(_2049, _2063, _2075);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7081, float3(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7081, float3(0.0), isnan(_7081)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float2 _7097 = float2(_2067, _2069);
    float3 _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7097, float2(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7097, float2(0.0), isnan(_7097)), level(0.0)).xyz;
    float _2094 = _2092.x;
    float _2096 = _2092.y;
    float _2098 = _2092.z;
    float _2100 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _2102 = int(_2100);
    float _2104 = in.m_64.x;
    float _2106 = in.m_64.y;
    float _2108 = in.m_64.z;
    float _2110 = in.m_64.w;
    float _2112 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2116 = _2114 != 0;
    out.m_70.x = _1231;
    out.m_70.y = _1275;
    out.m_70.z = _1307;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2120 = _2118 != 0;
    float _2122 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2124 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2126 = int(_2124);
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2130 = _2128 != 0;
    out.m_72.w = _1119;
    float _2132 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_74.x = _1235;
    out.m_74.y = _1237;
    out.m_74.z = _1239;
    float _2134 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2136 = int(_2134);
    float _2138 = float(_2102);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2144 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2146 = int(_2144);
    float _2148 = float(_2126);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2152 = _2150 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2154 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2156 = _2110 > 0.5;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2162 = _2160 != 0;
    float _2164 = 1.0 / _2138;
    float _2166 = float(uint(_2136));
    float _2168 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2170 = _2106 > 0.5;
    float _2172 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2132);
    float _2174 = -_213;
    int _2176 = _2156 ? as_type<int>(_2174) : as_type<int>(_213);
    float _2178 = -_2158;
    float _2180 = fma(_2168, 2.0, _2178);
    float _2182 = 1.0 / _2148;
    float _2184 = float(uint(_2146));
    float _2186 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2172);
    bool _2188 = !_2120;
    float _2190 = _2188 ? _213 : as_type<float>(_2176);
    out.m_76.x = _1219;
    int _2192 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2194 = _2192 != 0;
    float _2196 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2198 = _151 * _2164;
    float _2200 = 1.0 / _2166;
    int _2202 = ~_2136;
    int _2204 = _2202 + 1;
    out.gl_Position.x = _2029;
    out.gl_Position.y = _2057;
    out.gl_Position.z = _2196;
    out.gl_Position.w = _1997;
    int _2206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2208 = _2206 != 0;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2212 = _2210 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2216 = _2214 != 0;
    out.m_78.x = _1611;
    out.m_78.y = _1609;
    out.m_78.z = _1613;
    float _2218 = _151 * _2182;
    float _2220 = trunc(_2198);
    int _2222 = int(_2220);
    float _2224 = -_213;
    int _2226 = _2170 ? as_type<int>(_2224) : as_type<int>(_213);
    bool _2228 = _2104 > 0.5;
    bool _2230 = !_2130;
    float _2232 = _2230 ? _213 : as_type<float>(_2226);
    float _2234 = -_209;
    int _2236 = _2228 ? as_type<int>(_2234) : as_type<int>(_209);
    float _2238 = 1.0 / _2184;
    int _2240 = as_type<int>(_2200) + (-2);
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2244 = _2242 != 0;
    int _2246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2248 = _2246 != 0;
    int _2250 = ~_2146;
    int _2252 = _2250 + 1;
    float _2254 = trunc(_2218);
    int _2256 = int(_2254);
    bool _2258 = !_2194;
    float _2260 = _2258 ? _209 : as_type<float>(_2236);
    float _2262 = float(uint(_2222));
    bool _2264 = _2108 > 0.5;
    float _2266 = _2260 + 0.5;
    int _2268 = abs(_1027);
    float _2270 = as_type<float>(_2240) * _2262;
    int _2272 = as_type<int>(_2238) + (-2);
    float _2274 = 1.0 / _2142;
    float _2276 = -_209;
    int _2278 = _2264 ? as_type<int>(_2276) : as_type<int>(_209);
    float _2280 = _2238;
    float _2282 = _2108;
    float _2284 = _1997;
    float _2286 = _2196;
    float _2288 = _2057;
    if (_2162)
    {
        float _2290 = in.m_64.x;
        _2280 = _2290;
    }
    float _2292 = _2280;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2296 = _2294 != 0;
    float _2298 = _2292;
    if (!_2162)
    {
        float _2300 = in.m_64.y;
        _2298 = _2300;
    }
    float _2302 = _2298;
    float _2304 = float(uint(_2256));
    float _2306 = trunc(_2270);
    float _2308 = precise::max(_2306, 0.0);
    uint _2311 = uint(_2308);
    int _2313 = abs(_1039);
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2321 = _2319 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2323 = as_type<float>(_2272) * _2304;
    float _2325 = 1.0 / _2212;
    float _2327 = _2317 * _2274;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2331 = fma(_2154, -2.0, _2329);
    float _2333 = trunc(_2323);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    int _2339 = _2204 * int(_2311);
    int _2341 = _2339 + _2222;
    float _2343 = float(uint(_2341));
    float _2345 = 1.0 / _2152;
    float _2347 = _2321 * _2325;
    float _2349 = as_type<float>(_2240) * _2343;
    bool _2351 = !_2216;
    float _2353 = _2351 ? _209 : as_type<float>(_2278);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2357 = _977 + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2359;
    int _2363 = _2252 * int(_2337);
    int _2365 = _2363 + _2256;
    float _2367 = fma(_2327, _2357, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2369 = trunc(_2349);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = float(uint(_2365));
    float _2377 = as_type<float>(_2365);
    if (_2162)
    {
        _2377 = 1.0;
    }
    float _2379 = _2377;
    float _2381 = _2361 * _2345;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2385 = _977 + _2383;
    float _2387 = as_type<float>(_2272) * _2375;
    float _2389 = _2379;
    float _2391 = _2385;
    if (!_2162)
    {
        _2389 = 7.345489978790283203125;
    }
    float _2393 = _2389;
    float _2395 = exp2(_2122);
    float _2397 = fma(_2347, _2385, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2162)
    {
        _2391 = 1.0;
    }
    float _2399 = _2391;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2403 = _977 + _2401;
    float _2405 = _2393 * _2104;
    float _2407 = _2399;
    if (!_2162)
    {
        _2407 = 1.2345600128173828125;
    }
    float _2409 = _2407;
    int _2411 = ~_2136;
    int _2413 = _2411 + 1;
    float _2415 = trunc(_2387);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    int _2421 = int(_2311) + int(_2373);
    float _2423 = _2409 * _2302;
    float _2425 = float(_2136);
    float _2427 = fma(_2381, _2403, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2429 = ~_2146;
    int _2431 = _2429 + 1;
    int _2433 = _2413 * _2421;
    int _2435 = _2433 + _2222;
    bool _2437 = !_2244;
    int _2439 = _2437 ? 0 : 1;
    float _2441 = floor(_2405);
    float _2443 = float(_117);
    float _2445 = -_2395;
    float _2447 = _2445 + 1.0;
    bool _2449 = uint(_2435) >= uint(_2136);
    float _2451 = float(_2222);
    float _2453 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2455 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2457 = isnan(_977);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    int _2467 = int(_2337) + int(_2419);
    float _2469 = 1.0 / _2443;
    bool _2471 = _2451 >= _2425;
    bool _2473 = isnan(_2451);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(_2425);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = -_2465;
    float _2485 = _2483 + 1.0;
    bool _2487 = !_2449;
    int _2489 = _2487 ? 0 : (-1);
    int _2491 = _2431 * _2467;
    int _2493 = _2491 + _2256;
    float _2495 = -_2441;
    float _2497 = _2405 + _2495;
    bool _2499 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2501 = isnan(_977);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2507 = _2503 || _2505;
    float _2509 = float(_2507);
    float _2511 = trunc(_2481);
    int _2513 = int(_2511);
    int _2515 = ~_2421;
    int _2517 = _2515 + _2489;
    int _2519 = _2517 + 1;
    bool _2521 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2523 = isnan(_977);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2529 = _2525 || _2527;
    float _2531 = float(_2529);
    float _2533 = _2509 * _2485;
    bool _2535 = uint(_2493) >= uint(_2146);
    int _2537 = _2493;
    if (_2162)
    {
        _2537 = 0;
    }
    int _2539 = _2537;
    float _2541 = _151 * _2469;
    float _2543 = -_2509;
    float _2545 = _2543 + 1.0;
    bool _2547 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2549 = isnan(_977);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2555 = _2551 || _2553;
    float _2557 = float(_2555);
    int _2559 = _2539;
    if (!_2162)
    {
        _2559 = 1;
    }
    int _2561 = _2559;
    float _2563 = _2531 * _2545;
    float _2565 = -_2531;
    float _2567 = _2565 + 1.0;
    int _2569 = _2136 * _2519;
    int _2571 = _2569 + _2222;
    bool _2573 = _2136 == 0;
    float _2575 = _2541 * _2425;
    float _2577 = _2557 * _2567;
    int _2579 = ~_2513;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = _2497 * _2425;
    bool _2587 = !_2535;
    int _2589 = _2587 ? 0 : (-1);
    bool _2591 = !_2573;
    int _2593 = _2591 ? _2571 : (-1);
    float _2595 = trunc(_2575);
    int _2597 = int(_2595);
    bool _2599 = _2561 != 1;
    float _2601 = _2367 * _2577;
    float _2603 = -_151;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2180);
    int _2607 = _2593 * _2583;
    float _2609 = float(_2146);
    float _2611 = float(_2256);
    float _2613 = floor(_2423);
    int _2615 = _2136 + (-1);
    float _2617 = _2541 * _2609;
    bool _2619 = _2611 >= _2609;
    bool _2621 = isnan(_2611);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan(_2609);
    bool _2627 = _2623 || _2625;
    float _2629 = float(_2627);
    float _2631 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2605);
    int _2633 = abs(_1031);
    int _2635 = _2513 * _2615;
    int _2637 = _2635 + _2607;
    float _2639 = trunc(_2629);
    int _2641 = int(_2639);
    int _2643 = abs(_2439);
    int _2645 = ~_2467;
    int _2647 = _2645 + _2589;
    int _2649 = _2647 + 1;
    float _2651 = trunc(_2585);
    int _2653 = int(_2651);
    float _2655 = -_2613;
    float _2657 = _2423 + _2655;
    int _2659 = _2637 * _2268;
    float _2661 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2331);
    int _2663 = _2146 * _2649;
    int _2665 = _2663 + _2256;
    float _2667 = _2657 * _2609;
    int _2669 = _2597 * _2633;
    int _2671 = _2669 + _2659;
    bool _2673 = !_2116;
    int _2675 = _2673 ? 0 : 1;
    float _2677 = trunc(_2617);
    int _2679 = int(_2677);
    bool _2681 = _2146 == 0;
    float _2683 = _2232 + (-0.5);
    int _2685 = abs(_1035);
    int _2687 = abs(_2675);
    int _2689 = ~_2641;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2653 * _2643;
    int _2697 = _2695 + _2222;
    bool _2699 = !_2681;
    int _2701 = _2699 ? _2665 : (-1);
    float _2703 = trunc(_2667);
    int _2705 = int(_2703);
    int _2707 = _2146 + (-1);
    int _2709 = _2701 * _2693;
    float _2711 = -_2683;
    float _2713 = -_2661;
    float _2715 = fma(_2711, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2713);
    int _2717 = _2697 * _2685;
    int _2719 = _2717 + _2671;
    int _2721 = abs(_1043);
    int _2723 = _2641 * _2707;
    int _2725 = _2723 + _2709;
    int _2727 = _2653 * _2687;
    int _2729 = _2727 + _2719;
    float _2731 = -_2557;
    float _2733 = _2731 + 1.0;
    bool _2735 = !_2296;
    int _2737 = _2735 ? 0 : 1;
    int _2739 = _2725 * _2313;
    float _2741 = float(uint(_2729));
    float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2601);
    int _2745 = _2679 * _2721;
    int _2747 = _2745 + _2739;
    int _2749 = abs(_2737);
    float _2751 = as_type<float>(_2240) * _2741;
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2755 = _2741;
    if (!_2599)
    {
        _2755 = _2106;
    }
    float _2757 = _2755;
    float _2759 = trunc(_2751);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    int _2765 = _2705 * _2749;
    int _2767 = _2765 + _2256;
    int _2769 = abs(as_type<int>(_1209));
    float _2771 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2753);
    float _2773 = _2757;
    if (!_2599)
    {
        _1323 = _2106;
    }
    float _2775 = _1323;
    float _2777 = _2775;
    if (_2599)
    {
        _2777 = _2104;
    }
    float _2779 = _2777;
    float _2781 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2771);
    if (_2599)
    {
        _2773 = _2104;
    }
    float _2783 = _2773;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2787 = ~_2136;
    int _2789 = _2787 + 1;
    int _2791 = _2767 * _2769;
    int _2793 = _2791 + _2747;
    int _2795 = abs(_1059);
    float _2797 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2785);
    int _2799 = _2789 * int(_2763);
    int _2801 = _2799 + _2729;
    float _2803 = _2785;
    if (!_2599)
    {
        _2803 = _2108;
    }
    float _2805 = _2803;
    int _2807 = _2705 * _2795;
    int _2809 = _2807 + _2793;
    float _2811 = _2805;
    if (_2599)
    {
        _2811 = _2106;
    }
    float _2813 = _2811;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2817 = float(uint(_2801));
    float _2819 = fma(_2397, _2563, _2743);
    float _2821 = float(uint(_2809));
    float _2823 = fma(_2813, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2815);
    float _2825 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2827 = as_type<float>(_2240) * _2817;
    float _2829 = as_type<float>(_2272) * _2821;
    float _2831 = float(uint(_2697));
    float _2833 = fma(_2427, _2533, _2819);
    if (_2599)
    {
        _2282 = _2106;
    }
    float _2835 = _2282;
    float _2837 = trunc(_2829);
    float _2839 = precise::max(_2837, 0.0);
    uint _2841 = uint(_2839);
    float _2843 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2845 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2797);
    int _2847 = ~_2146;
    int _2849 = _2847 + 1;
    float _2851 = -_2843;
    float _2853 = fma(_2825, 2.0, _2851);
    float _2855 = as_type<float>(_2240) * _2831;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2859 = trunc(_2827);
    float _2861 = precise::max(_2859, 0.0);
    uint _2863 = uint(_2861);
    float _2865 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2867 = -_151;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2853);
    float _2871 = float(uint(_2767));
    float _2873 = fma(_2865, -2.0, _2857);
    float _2875 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2833);
    float _2877 = trunc(_2855);
    float _2879 = precise::max(_2877, 0.0);
    uint _2881 = uint(_2879);
    int _2883 = _2849 * int(_2841);
    int _2885 = _2883 + _2809;
    int _2887 = ~_2136;
    int _2889 = _2887 + 1;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2893 = ~_2136;
    int _2895 = _2893 + 1;
    float _2897 = -_2845;
    float _2899 = _2897 + 1.0;
    float _2901 = -_2073;
    float _2903 = _2901 + 1.0;
    float _2905 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2891);
    int _2907 = int(_2763) + int(_2863);
    float _2909 = as_type<float>(_2272) * _2871;
    float _2911 = float(uint(_2885));
    float _2913 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2905);
    float _2915 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2823);
    float _2917 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2873);
    float _2919 = as_type<float>(_2272) * _2911;
    float _2921 = trunc(_2909);
    float _2923 = precise::max(_2921, 0.0);
    uint _2925 = uint(_2923);
    int _2927 = _2889 * _2907;
    int _2929 = _2927 + _2729;
    float _2931 = _2353 + 0.5;
    int _2933 = _2895 * int(_2881);
    int _2935 = _2933 + _2697;
    int _2937 = ~_2146;
    int _2939 = _2937 + 1;
    float _2941 = -_2913;
    float _2943 = _2941 + 1.0;
    bool _2945 = uint(_2929) >= uint(_2136);
    float _2947 = _2190 + (-0.5);
    float _2949 = float(uint(_2935));
    float _2951 = fma(_2931, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2869);
    bool _2953 = !_2945;
    int _2955 = _2953 ? 0 : (-1);
    float _2957 = trunc(_2919);
    float _2959 = precise::max(_2957, 0.0);
    uint _2961 = uint(_2959);
    float _2963 = -_2781;
    float _2965 = _2963 + 1.0;
    float _2967 = -_2943;
    float _2969 = fma(_2353, _2967, _2951);
    int _2971 = ~_2907;
    int _2973 = _2971 + _2955;
    int _2975 = _2973 + 1;
    float _2977 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2979 = _2939 * int(_2925);
    int _2981 = _2979 + _2767;
    float _2983 = -_2965;
    float _2985 = fma(_2260, _2983, _2631);
    float _2987 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2989 = _2136 * _2975;
    int _2991 = _2989 + _2729;
    int _2993 = ~_2146;
    int _2995 = _2993 + 1;
    float _2997 = as_type<float>(_2240) * _2949;
    float _2999 = float(uint(_2981));
    float _3001 = fma(_2232, _2899, _2715);
    bool _3003 = !_2573;
    int _3005 = _3003 ? _2991 : (-1);
    float _3007 = -_2947;
    float _3009 = -_2917;
    float _3011 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3009);
    float _3013 = trunc(_2997);
    float _3015 = precise::max(_3013, 0.0);
    uint _3017 = uint(_3015);
    float _3019 = as_type<float>(_2272) * _2999;
    int _3021 = int(_2841) + int(_2961);
    float _3023 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3025 = _3005 & 3;
    bool _3027 = _3025 != 0;
    float _3029 = _2987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3031 = _3005 & 3;
    bool _3033 = _3031 != 0;
    int _3035 = _2995 * _3021;
    int _3037 = _3035 + _2809;
    bool _3039 = uint(_3025) > 1u;
    float _3041 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3043 = _3033 ? 0 : 1;
    float _3045 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3047 = uint(_3037) >= uint(_2146);
    float _3049 = -_2915;
    float _3051 = _3049 + 1.0;
    float _3053 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3055 = trunc(_3019);
    float _3057 = precise::max(_3055, 0.0);
    uint _3059 = uint(_3057);
    bool _3061 = !_3047;
    int _3063 = _3061 ? 0 : (-1);
    float _3065 = fma(_2190, _3051, _3011);
    int _3067 = ~_3043;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    out.m_80.x = _3041;
    out.m_80.y = _3029;
    out.m_80.z = _3045;
    out.m_80.w = _3053;
    int _3073 = ~_3021;
    int _3075 = _3073 + _3063;
    int _3077 = _3075 + 1;
    float _3079 = _2453 * _2077;
    int _3081 = _3071;
    if (!_3039)
    {
        int _3083 = ~_3043;
        int _3085 = _3083 + 1;
        _3081 = _3085;
    }
    int _3087 = _3081;
    out.m_82.x = _2985;
    out.m_82.y = _3001;
    out.m_82.z = _2969;
    out.m_82.w = _3065;
    bool _3089 = _3025 != 3;
    int _3091 = _2146 * _3077;
    int _3093 = _3091 + _2809;
    int _3095 = _3005 >> 31;
    float _3097 = abs(_1623);
    float _3099 = log2(_3097);
    bool _3101 = uint(_3025) >= 2u;
    int _3103 = int(_2881) + int(_3017);
    int _3105 = _3101 ? 0 : 1;
    float _3107 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3109 = ~_2136;
    int _3111 = _3109 + 1;
    int _3113 = _3095 & 3;
    float _3115 = fma(_3107, _3107, 1.0);
    float _3117 = _3107 * _1259;
    int _3119 = _3005 + _3113;
    float _3121 = rsqrt(_3115);
    bool _3123 = !_2681;
    int _3125 = _3123 ? _3093 : (-1);
    int _3127 = _3111 * _3103;
    int _3129 = _3127 + _2697;
    int _3131 = ~_2146;
    int _3133 = _3131 + 1;
    float _3135 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3137 = ~_3105;
    int _3139 = _3137 + 1;
    int _3141 = _3139 + 1;
    float _3143 = fma(_2112, _1237, _3117);
    int _3145 = _3119 >> 2;
    int _3147 = _3141;
    if (_3089)
    {
        int _3149 = ~_3105;
        int _3151 = _3149 + 1;
        _3147 = _3151;
    }
    int _3153 = _3147;
    float _3155 = exp2(_3135);
    int _3157 = _3125 >> 31;
    int _3159 = int(_2925) + int(_3059);
    int _3161 = _3145 << 4;
    int _3163 = _3161 + 368;
    float _3165 = _3107 * _3121;
    int _3167 = _3157 & 3;
    bool _3169 = uint(_3129) >= uint(_2136);
    int _3171 = _3133 * _3159;
    int _3173 = _3171 + _2767;
    int _3175 = _3125 + _3167;
    uint _3177 = uint(int(uint(_3163) >> uint(2)));
    uint _3179 = uint(int(uint(int(_3177)) >> uint(2)));
    int _3181 = int(_3177) & 3;
    float _3183 = (*spvDescriptorSet0.vp_c9)._m0[int(_3179)][_3181];
    int _3185 = int(_3177) + 1;
    uint _3187 = uint(int(uint(_3185) >> uint(2)));
    int _3189 = _3185 & 3;
    float _3191 = (*spvDescriptorSet0.vp_c9)._m0[int(_3187)][_3189];
    float _3193 = -_1135;
    float _3195 = _3165 * _3193;
    float _3197 = -_1155;
    float _3199 = _3165 * _3197;
    int _3201 = _3175 >> 2;
    bool _3203 = uint(_3173) >= uint(_2146);
    float _3205 = -_1147;
    float _3207 = _3165 * _3205;
    int _3209 = _3201 << 4;
    int _3211 = _3209 + 512;
    float _3213 = fma(_3121, _1255, _3195);
    float _3215 = fma(_3121, _1259, _3199);
    float _3217 = fma(_3121, _1251, _3207);
    float _3219 = _3107 * _1255;
    float _3221 = _3107 * _1251;
    uint _3223 = uint(int(uint(_3211) >> uint(2)));
    uint _3225 = uint(int(uint(int(_3223)) >> uint(2)));
    int _3227 = int(_3223) & 3;
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[int(_3225)][_3227];
    int _3231 = int(_3223) + 1;
    uint _3233 = uint(int(uint(_3231) >> uint(2)));
    int _3235 = _3231 & 3;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[int(_3233)][_3235];
    float _3239 = fma(_2112, _1235, _3219);
    float _3241 = fma(_2112, _1239, _3221);
    bool _3243 = !_3169;
    int _3245 = _3243 ? 0 : (-1);
    float _3247 = fma(_3155, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3249 = precise::clamp(_3247, 0.0, 1.0);
    bool _3251 = !_3203;
    int _3253 = _3251 ? 0 : (-1);
    out.m_84.x = _3213;
    out.m_84.y = _3215;
    out.m_84.z = _3217;
    int _3255 = ~_3103;
    int _3257 = _3255 + _3245;
    int _3259 = _3257 + 1;
    int _3261 = _3163 + 8;
    uint _3263 = uint(int(uint(_3261) >> uint(2)));
    uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
    int _3267 = int(_3263) & 3;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[int(_3265)][_3267];
    int _3271 = int(_3263) + 1;
    uint _3273 = uint(int(uint(_3271) >> uint(2)));
    int _3275 = _3271 & 3;
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[int(_3273)][_3275];
    int _3279 = _3125 & 3;
    bool _3281 = _3279 != 0;
    float _3283 = _3249 * _3249;
    int _3285 = _2136 * _3259;
    int _3287 = _3285 + _2697;
    int _3289 = _3125 & 3;
    bool _3291 = _3289 != 0;
    int _3293 = ~_3159;
    int _3295 = _3293 + _3253;
    int _3297 = _3295 + 1;
    float _3299 = fma(_3249, -2.0, 3.0);
    bool _3301 = _1623 <= 8000.0;
    bool _3303 = isnan(_1623);
    bool _3305 = _3301 || _3303;
    bool _3307 = isnan(8000.0);
    bool _3309 = _3305 || _3307;
    float _3311 = float(_3309);
    int _3313 = _3211 + 8;
    uint _3315 = uint(int(uint(_3313) >> uint(2)));
    uint _3317 = uint(int(uint(int(_3315)) >> uint(2)));
    int _3319 = int(_3315) & 3;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[int(_3317)][_3319];
    int _3323 = int(_3315) + 1;
    uint _3325 = uint(int(uint(_3323) >> uint(2)));
    int _3327 = _3323 & 3;
    float _3329 = (*spvDescriptorSet0.vp_c9)._m0[int(_3325)][_3327];
    int _3331 = _3281 ? 0 : 1;
    float _3333 = _3283 * _3299;
    bool _3335 = uint(_3289) > 1u;
    int _3337 = _2146 * _3297;
    int _3339 = _3337 + _2767;
    int _3341 = abs(_3087);
    int _3343 = ~_3331;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = ~_3341;
    int _3351 = _3349 + 1;
    int _3353 = _3351 + 1;
    bool _3355 = !_2573;
    int _3357 = _3355 ? _3287 : (-1);
    bool _3359 = !_2681;
    int _3361 = _3359 ? _3339 : (-1);
    int _3363 = _3347;
    if (!_3335)
    {
        int _3365 = ~_3331;
        int _3367 = _3365 + 1;
        _3363 = _3367;
    }
    int _3369 = _3363;
    int _3371 = _3353 * as_type<int>(_3191);
    bool _3373 = !_3027;
    int _3375 = _3373 ? 0 : 1;
    int _3377 = abs(_3369);
    bool _3379 = !_3291;
    int _3381 = _3379 ? 0 : 1;
    int _3383 = abs(_3375);
    bool _3385 = _3289 != 3;
    int _3387 = abs(_3381);
    bool _3389 = uint(_3289) >= 2u;
    int _3391 = ~_3377;
    int _3393 = _3391 + 1;
    int _3395 = _3393 + 1;
    int _3397 = abs(_3153);
    int _3399 = ~_3383;
    int _3401 = _3399 + 1;
    int _3403 = _3401 + 1;
    int _3405 = _3395 * as_type<int>(_3237);
    int _3407 = _3389 ? 0 : 1;
    int _3409 = ~_3397;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = _3403 * as_type<int>(_3183);
    int _3417 = _3415 + _3371;
    int _3419 = ~_3387;
    int _3421 = _3419 + 1;
    int _3423 = _3421 + 1;
    bool _3425 = _3025 != 3;
    int _3427 = _3413 * as_type<int>(_3269);
    int _3429 = _3427 + _3417;
    int _3431 = ~_3407;
    int _3433 = _3431 + 1;
    int _3435 = _3433 + 1;
    int _3437 = _3423 * as_type<int>(_3229);
    int _3439 = _3437 + _3405;
    int _3441 = _3435;
    if (_3385)
    {
        int _3443 = ~_3407;
        int _3445 = _3443 + 1;
        _3441 = _3445;
    }
    int _3447 = _3441;
    bool _3449 = _3289 != 3;
    bool _3451 = !_3425;
    int _3453 = _3451 ? 0 : (-1);
    int _3455 = abs(_3447);
    bool _3457 = !_2208;
    int _3459 = _3457 ? 0 : 1;
    bool _3461 = !_3449;
    int _3463 = _3461 ? 0 : (-1);
    int _3465 = abs(_3453);
    int _3467 = abs(_3459);
    int _3469 = abs(_3463);
    int _3471 = ~_3455;
    int _3473 = _3471 + 1;
    int _3475 = _3473 + 1;
    bool _3477 = !_2248;
    int _3479 = _3477 ? 0 : 1;
    int _3481 = _3475 * as_type<int>(_3321);
    int _3483 = _3481 + _3439;
    int _3485 = ~_3465;
    int _3487 = _3485 + 1;
    int _3489 = _3487 + 1;
    int _3491 = abs(_3479);
    int _3493 = ~_3469;
    int _3495 = _3493 + 1;
    int _3497 = _3495 + 1;
    int _3499 = _3489 * as_type<int>(_3277);
    int _3501 = _3499 + _3429;
    float _3503 = -_3333;
    float _3505 = _3503 + 1.0;
    float _3507 = in.m_86.x;
    int _3509 = ~_3467;
    int _3511 = _3509 + 1;
    int _3513 = _3511 + 1;
    int _3515 = _3497 * as_type<int>(_3329);
    int _3517 = _3515 + _3483;
    int _3519 = ~_3491;
    int _3521 = _3519 + 1;
    int _3523 = _3521 + 1;
    float _3525 = fma(_3505, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3333);
    float _3527 = _2196 + _1997;
    int _3529 = _3501 * _3513;
    int _3531 = _3517 * _3523;
    float _3533 = _3311 * _3525;
    float _3535 = _1997 * 0.5;
    int _3537 = _3357 * _3467;
    int _3539 = _3537 + _3529;
    float _3541 = _3527 * 0.5;
    int _3543 = _3361 * _3491;
    int _3545 = _3543 + _3531;
    float _3547 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3549 = _2029 + _1997;
    float _3551 = fma(_2057, -0.5, _3535);
    float _3553 = _1135 + _3239;
    float _3555 = _2903 * _3547;
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = _3549 * 0.5;
    float _3561 = _2098 * _3079;
    float _3563 = -_2453;
    float _3565 = _3563 + 1.0;
    float _3567 = -_3557;
    float _3569 = fma(_3567, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3571 = float(_3545);
    out.m_88.x = _3559;
    out.m_88.y = _3551;
    out.m_88.z = _3541;
    out.m_88.w = _1997;
    float _3573 = _1155 + _3143;
    float _3575 = _3569 * _3507;
    float _3577 = _1147 + _3241;
    bool _3579 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3581 = isnan(_1923);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3587 = _3583 || _3585;
    float _3589 = _3575 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3591 = float(_3539);
    out.m_90.x = _3553;
    out.m_90.y = _3573;
    out.m_90.z = _3577;
    out.m_92.x = _3589;
    float _3593 = _2088 * _3079;
    float _3595 = _2088 * _3565;
    float _3597 = fma(_2088, _3561, _2086);
    float _3599 = _1679 * _1743;
    float _3601 = fma(_2094, _3593, _2082);
    float _3603 = fma(_2096, _3593, _2084);
    out.m_94.x = _3591;
    out.m_94.y = _3571;
    float _3605 = _3599 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3607 = _3599;
    float _3609 = _3571;
    float _3611 = _3591;
    if (!_3587)
    {
        _2284 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3613 = _2284;
    out.m_96.x = _3601;
    out.m_96.y = _3603;
    out.m_96.z = _3597;
    out.m_96.w = _3595;
    float _3615 = _3613;
    float _3617 = _3613;
    if (!_3587)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3619 = _2286;
    float _3621 = _3619;
    float _3623 = _3619;
    if (!_3587)
    {
        _2288 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3625 = _2288;
    float _3627 = _3625;
    float _3629 = _3625;
    if (!_3587)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3631 = _3607;
    float _3633 = _3631;
    float _3635 = _3631;
    if (!_3587)
    {
        _3609 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3637 = _3609;
    float _3639 = _3637;
    float _3641 = _3637;
    if (!_3587)
    {
        _3611 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3643 = _3611;
    bool _3645 = !_3587;
    float _3647 = _3643;
    float _3649 = _3643;
    if (!_3645)
    {
        bool _3651 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3653 = isnan(_1923);
        bool _3655 = _3651 || _3653;
        bool _3657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3659 = _3655 || _3657;
        if (!_3659)
        {
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3663 = _1923 + _3661;
            float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3665;
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3673 = 1.0 / _3667;
            float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3691 = _3663 * _3673;
            float _3693 = precise::clamp(_3691, 0.0, 1.0);
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3699 = fma(_3693, _3671, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3701 = fma(_3693, _3697, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3703 = fma(_3693, _3677, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3705 = fma(_3693, _3681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3707 = fma(_3693, _3685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3709 = fma(_3693, _3689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3649 = _3703;
            _3629 = _3707;
            _3641 = _3699;
            _3623 = _3705;
            _3617 = _3701;
            _3635 = _3709;
            _3711 = true;
        }
        else
        {
            bool _3713 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3715 = isnan(_1923);
            bool _3717 = _3713 || _3715;
            bool _3719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3721 = _3717 || _3719;
            if (!_3721)
            {
                _3639 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3723 = _3639;
            _3641 = _3723;
            if (!_3721)
            {
                _3647 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3725 = _3647;
            _3649 = _3725;
            if (!_3721)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3727 = _3615;
            _3617 = _3727;
            if (!_3721)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3729 = _3621;
            _3623 = _3729;
            if (!_3721)
            {
                _3627 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3731 = _3627;
            _3629 = _3731;
            if (!_3721)
            {
                _3633 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3733 = _3633;
            bool _3735 = !_3721;
            _3635 = _3733;
            if (!_3735)
            {
                bool _3737 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3739 = isnan(_1923);
                bool _3741 = _3737 || _3739;
                bool _3743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3745 = _3741 || _3743;
                if (!_3745)
                {
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3749 = _1923 + _3747;
                    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3751;
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3759 = 1.0 / _3753;
                    float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3767 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3777 = _3749 * _3759;
                    float _3779 = precise::clamp(_3777, 0.0, 1.0);
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3783 = _3781 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3785 = fma(_3779, _3757, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3787 = fma(_3779, _3783, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3789 = fma(_3779, _3763, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3791 = fma(_3779, _3767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3793 = fma(_3779, _3771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3795 = fma(_3779, _3775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3649 = _3789;
                    _3629 = _3793;
                    _3641 = _3785;
                    _3623 = _3791;
                    _3617 = _3787;
                    _3635 = _3795;
                    _3711 = true;
                }
                else
                {
                    _3649 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3629 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3641 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3635 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3711 = false;
    float _3797 = _3649;
    float _3799 = _3629;
    float _3801 = _3641;
    float _3803 = _3623;
    float _3805 = _3617;
    float _3807 = _3635;
    float _3809 = _3605 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3811 = fma(_3573, -0.5, 0.5);
    float _3813 = precise::clamp(_3811, 0.0, 1.0);
    float _3815 = -_3797;
    float _3817 = _3815 + _3799;
    float _3819 = -_3801;
    float _3821 = _3819 + _3803;
    out.m_98.x = 0.0;
    float _3823 = fma(_3813, _3817, _3797);
    float _3825 = -_3805;
    float _3827 = _3825 + _3807;
    float _3829 = fma(_3813, _3821, _3801);
    float _3831 = _3823 * 0.586610972881317138671875;
    bool _3833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3835 = fma(_3813, _3827, _3805);
    out.m_49.x = _3809;
    float _3837 = fma(_3829, 0.298911988735198974609375, _3831);
    bool _3839 = _1679 > 0.0;
    bool _3841 = isnan(_1679);
    bool _3843 = _3839 || _3841;
    bool _3845 = isnan(0.0);
    bool _3847 = _3843 || _3845;
    float _3849 = fma(_3835, 0.114477999508380889892578125, _3837);
    bool _3851 = _1743 <= 0.0;
    bool _3853 = !_3847;
    bool _3855 = _3851 || _3853;
    float _3857 = -_3849;
    float _3859 = _3829 + _3857;
    float _3861 = -_3849;
    float _3863 = _3823 + _3861;
    float _3865 = -_3849;
    float _3867 = _3835 + _3865;
    float _3869 = fma(_3859, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    float _3871 = fma(_3863, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    float _3873 = fma(_3867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    bool _3875 = !_3833;
    if (!_3875)
    {
        float _3877 = -_1609;
        float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3881 = -_1611;
        float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3885 = -_1613;
        float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3889 = _3879 * _3879;
        float _3891 = fma(_3883, _3883, _3889);
        float _3893 = fma(_3887, _3887, _3891);
        float _3895 = sqrt(_3893);
        float _3897 = rsqrt(_3893);
        float _3899 = -_3895;
        float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3903 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3905 = precise::clamp(_3903, 0.0, 1.0);
        float _3907 = _3883 * _3897;
        float _3909 = _3879 * _3897;
        float _3911 = abs(_3905);
        float _3913 = log2(_3911);
        float _3915 = _3887 * _3897;
        float _3917 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3919 = _3573 * _3909;
        float _3921 = -_3909;
        float _3923 = -_3917;
        float _3925 = fma(_3921, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3923);
        float _3927 = fma(_3553, _3907, _3919);
        float _3929 = -_3915;
        float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3925);
        float _3933 = fma(_3577, _3915, _3927);
        float _3935 = precise::clamp(_3933, 0.0, 1.0);
        float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3939 = _3931 + _3937;
        float _3941 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3943 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3945 = precise::clamp(_3943, 0.0, 1.0);
        float _3947 = exp2(_3941);
        float _3949 = _3947 * _3945;
        float _3951 = _3935 * _3949;
        float _3953 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3955 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3957 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3953;
        out.m_98.y = _3955;
        out.m_98.z = _3957;
    }
    out.m_72.x = _3869;
    out.m_72.y = _3871;
    out.m_72.z = _3873;
    if (!_3855)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3959 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3959;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3711 = false;
    bool _969 = false;
    bool _801 = false;
    bool _581 = false;
    bool _413 = false;
    bool _257 = false;
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
    float _127 = _125;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4016 = as_type<float>(_133);
        out.gl_Position.z = _4016;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_51.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_49.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4084 = as_type<float>(_169);
        out.gl_Position.z = _4084;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    float _179 = in.m_58.x;
    float _181 = in.m_58.y;
    float _183 = in.m_58.z;
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_177, _183, _219);
    float _227 = fma(_173, _191, _221);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _227);
    bool _233 = !_205;
    float _235 = _225;
    float _237 = _231;
    float _255;
    if (!_233)
    {
        float _239 = in.m_64.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_117);
        float _261 = 1.0 / _259;
        float _263 = _151 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    bool _271 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_265);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _265 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -_281;
    float _297 = _295 + 1.0;
    float _299 = in.m_66.x;
    float _301 = in.m_66.y;
    bool _303 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_265);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _289;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _293;
    float _321 = _269 * _315;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = _333 * _297;
    float _345 = -_333;
    float _347 = _345 + 1.0;
    float _349 = _285 * _319;
    float _351 = fma(_337, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _353 = fma(_341, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _313 * _347;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = -_313;
    float _367 = _365 + 1.0;
    float _369 = _351 * _355;
    float _371 = _353 * _355;
    float _373 = fma(_359, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = fma(_363, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _381 = fma(_373, _343, _377);
    float _383 = fma(_375, _343, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].x, _381);
    float _387 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].y, _383);
    float _389 = _385 * _299;
    float _391 = _387 * _301;
    bool _393 = !_317;
    float _411;
    if (!_393)
    {
        float _395 = in.m_64.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_117);
        float _417 = 1.0 / _415;
        float _419 = _151 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = _421 + _423;
    bool _427 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _429 = isnan(_421);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _421 + _439;
    bool _443 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _445 = isnan(_421);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_421);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -_437;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _461;
    float _481 = _473 * _477;
    float _483 = -_473;
    float _485 = _483 + 1.0;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _487;
    bool _491 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _493 = 1.0 / _457;
    float _495 = _453 * _485;
    float _497 = -_453;
    float _499 = _497 + 1.0;
    float _501 = _441 * _479;
    float _503 = _425 * _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    float _513 = fma(_489, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _515 = fma(_507, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _517 = fma(_511, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _519 = _513 * _495;
    float _521 = _515 * _495;
    float _523 = _517 * _495;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].x, _519);
    float _539 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].y, _521);
    float _541 = fma(_527, _501, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_531, _501, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _545 = fma(_535, _501, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _549 = fma(_541, _481, _537);
    float _551 = fma(_543, _481, _539);
    float _553 = fma(_545, _481, _547);
    float _555 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].x, _549);
    float _557 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].y, _551);
    float _559 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[109].z, _553);
    bool _561 = !_491;
    float _579;
    if (!_561)
    {
        float _563 = in.m_64.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_117);
        float _585 = 1.0 / _583;
        float _587 = _151 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _593 = _589 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _603;
    bool _607 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _609 = isnan(_589);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = 1.0 / _597;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _625 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_589);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    bool _637 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _639 = 1.0 / _601;
    float _641 = _605 * _619;
    bool _643 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_589);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = 1.0 / _623;
    float _657 = -_617;
    float _659 = _657 + 1.0;
    float _661 = fma(_641, _593, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _667 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _669 = isnan(_589);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -_653;
    float _681 = _679 + 1.0;
    float _683 = _653 * _659;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = 1.0 / _665;
    float _691 = -_677;
    float _693 = _691 + 1.0;
    float _695 = _635 * _681;
    float _697 = _687 * _639;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _699;
    float _703 = _617 * _693;
    float _705 = _661 * _695;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _589 + _707;
    float _711 = -_635;
    float _713 = _711 + 1.0;
    bool _715 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _717 = isnan(_589);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _701 * _655;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _735 = _589 + _733;
    float _737 = fma(_697, _709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _739 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = _731 * _689;
    float _747 = fma(_727, _735, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _751 = _589 + _749;
    float _753 = fma(_737, _683, _739);
    float _755 = _677 * _743;
    float _757 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _759 = fma(_745, _751, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _761 = fma(_747, _703, _753);
    float _763 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = fma(_759, _755, _761);
    float _767 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[119].x, _765);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _763;
    out.m_68.y = _773;
    out.m_68.z = _775;
    out.m_68.w = _777;
    bool _779 = !_637;
    float _781 = _689;
    float _799;
    if (!_779)
    {
        float _783 = in.m_64.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_117);
        float _805 = 1.0 / _803;
        float _807 = _151 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _809 + _811;
    bool _815 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = isnan(_809);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _809 + _827;
    bool _831 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _833 = isnan(_809);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _851 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _853 = isnan(_809);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_825;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _849;
    float _869 = _861 * _865;
    float _871 = -_861;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _875;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _881 = 1.0 / _845;
    float _883 = _841 * _873;
    float _885 = -_841;
    float _887 = _885 + 1.0;
    float _889 = _829 * _867;
    float _891 = _813 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = fma(_877, _891, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _903 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _905 = fma(_899, _891, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _907 = _901 * _883;
    float _909 = _903 * _883;
    float _911 = _905 * _883;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].x, _907);
    float _927 = fma(_915, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_919, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _931 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].y, _909);
    float _933 = fma(_923, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _935 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].z, _911);
    float _937 = fma(_927, _869, _925);
    float _939 = fma(_929, _869, _931);
    float _941 = fma(_933, _869, _935);
    float _943 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].x, _937);
    float _945 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].y, _939);
    float _947 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].z, _941);
    bool _949 = !_879;
    float _967;
    if (!_949)
    {
        float _951 = in.m_64.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[11].w, _151);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        float _971 = float(_117);
        float _973 = 1.0 / _971;
        float _975 = _151 * _973;
        _967 = _975;
    }
    _969 = false;
    float _977 = _967;
    float _979 = in.m_46.x;
    float _981 = in.m_46.y;
    float _983 = in.m_46.z;
    float _985 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _987 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = in.m_60.w;
    float _991 = _985 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _999 = _997 != 0;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1003 = _1001 != 0;
    float _1005 = in.m_58.w;
    float _1007 = in.m_62.w;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1023 = _1021 != 0;
    bool _1025 = !_999;
    int _1027 = _1025 ? 0 : 1;
    bool _1029 = !_995;
    int _1031 = _1029 ? 0 : 1;
    bool _1033 = !_1003;
    int _1035 = _1033 ? 0 : 1;
    bool _1037 = !_1015;
    int _1039 = _1037 ? 0 : 1;
    bool _1041 = !_1011;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = _187 * _981;
    float _1047 = _181 * _981;
    float _1049 = _193 * _981;
    float _1051 = fma(_185, _979, _1045);
    float _1053 = fma(_179, _979, _1047);
    float _1055 = fma(_191, _979, _1049);
    bool _1057 = !_1023;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = fma(_189, _983, _1051);
    float _1063 = fma(_183, _983, _1053);
    float _1065 = fma(_195, _983, _1055);
    float _1067 = _1061 + _989;
    float _1069 = _1063 + _1005;
    float _1071 = _1065 + _1007;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1067 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1079 = _1069 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1083 = _1071 + _1081;
    float _1085 = -_1067;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1089 = _1075 * _1075;
    float _1091 = -_1069;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = -_1071;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1087 * _1087;
    float _1101 = fma(_1079, _1079, _1089);
    float _1103 = fma(_1093, _1093, _1099);
    float _1105 = fma(_1083, _1083, _1101);
    float _1107 = fma(_1097, _1097, _1103);
    float _1109 = sqrt(_1105);
    float _1111 = rsqrt(_1105);
    float _1113 = _1109 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1115 = rsqrt(_1107);
    float _1117 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1119 = precise::min(_991, _1113);
    float _1121 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1117);
    float _1123 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1125 = _1111 * _1119;
    float _1127 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1121);
    float _1129 = _1075 * _1125;
    float _1131 = _1079 * _1125;
    float _1133 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1123);
    float _1135 = _1093 * _1115;
    float _1137 = -_1129;
    float _1139 = _1075 + _1137;
    float _1141 = -_1131;
    float _1143 = _1079 + _1141;
    float _1145 = _1083 * _1125;
    float _1147 = _1097 * _1115;
    float _1149 = _1139 * _1139;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1153 = _1135 * _1151;
    float _1155 = _1087 * _1115;
    float _1157 = -_1145;
    float _1159 = _1083 + _1157;
    float _1161 = fma(_1143, _1143, _1149);
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1165 = _1147 * _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1169 = -_1153;
    float _1171 = fma(_1147, _1167, _1169);
    float _1173 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1133);
    float _1175 = rsqrt(_1127);
    float _1177 = fma(_1159, _1159, _1161);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1181 = -_1165;
    float _1183 = fma(_1155, _1179, _1181);
    float _1185 = _1171 * _1171;
    float _1187 = fma(_1183, _1183, _1185);
    float _1189 = sqrt(_1177);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1193 = _1155 * _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1197 = -_1193;
    float _1199 = fma(_1135, _1195, _1197);
    float _1201 = rsqrt(_1173);
    float _1203 = fma(_1199, _1199, _1187);
    float _1205 = _213 * _1175;
    bool _1207 = !_1019;
    float _1209 = _1207 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1205);
    float _1213 = rsqrt(_1203);
    float _1215 = _1111 * _1189;
    float _1217 = _987 * _1215;
    float _1219 = _985 * _1215;
    float _1221 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = _1221 * 0.5;
    float _1225 = _209 * _1201;
    float _1227 = _1217 * _1211;
    float _1229 = -_1131;
    float _1231 = _1069 + _1229;
    float _1233 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1225);
    float _1235 = _1183 * _1213;
    float _1237 = _1171 * _1213;
    float _1239 = _1199 * _1213;
    float _1241 = _1219 * _1233;
    float _1243 = _1155 * _1235;
    float _1245 = _1147 * _1237;
    float _1247 = _1135 * _1239;
    float _1249 = -_1243;
    float _1251 = fma(_1135, _1237, _1249);
    float _1253 = -_1245;
    float _1255 = fma(_1155, _1239, _1253);
    float _1257 = -_1247;
    float _1259 = fma(_1147, _1235, _1257);
    float _1261 = _1227 * _1251;
    float _1263 = _1227 * _1255;
    float _1265 = fma(_1241, _1239, _1261);
    float _1267 = fma(_1241, _1235, _1263);
    float _1269 = fma(_1223, _1147, _1265);
    float _1271 = fma(_1223, _1135, _1267);
    float _1273 = -_1129;
    float _1275 = _1067 + _1273;
    float _1277 = _1071 + _1269;
    float _1279 = _1069 + _1271;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1283 = _1277 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1287 = _1279 + _1285;
    float _1289 = _1283 * _1283;
    float _1291 = fma(_1287, _1287, _1289);
    float _1293 = _1227 * _1259;
    float _1295 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1297 = sqrt(_1291);
    float _1299 = fma(_1241, _1237, _1293);
    float _1301 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1295);
    float _1303 = fma(_1223, _1155, _1299);
    float _1305 = -_1145;
    float _1307 = _1071 + _1305;
    float _1309 = _1067 + _1303;
    float _1311 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1301);
    bool _1313 = _1297 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = _1303;
    float _1317 = _1293;
    float _1319 = _1279;
    float _1321 = _1145;
    float _1323 = _1209;
    if (!_1313)
    {
        _1315 = _1279;
    }
    float _1325 = _1315;
    float _1327 = _1325;
    if (!_1313)
    {
        _1317 = _1277;
    }
    float _1329 = _1317;
    float _1331 = _1329;
    if (!_1313)
    {
        _1319 = _1309;
    }
    float _1333 = _1319;
    bool _1335 = !_1313;
    float _1337 = _1333;
    if (!_1335)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1343 = _1297 + _1341;
        float _1345 = rsqrt(_1291);
        float _1347 = _1343 * _1339;
        float _1349 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = _1347 * 0.15915493667125701904296875;
        float _1353 = _1351 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = _1351 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 + (-1.0);
        float _1363 = fma(_1359, _1349, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1365 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = _1345 * _1363;
        float _1369 = fma(_1309, _1355, _1365);
        float _1371 = fma(_1287, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1283, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1337 = _1369;
        _1327 = _1371;
        _1331 = _1373;
    }
    float _1375 = _1337;
    float _1377 = _1327;
    float _1379 = _1331;
    float _1381 = -_1067;
    float _1383 = _1381 + _1375;
    float _1385 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1387 = -_1069;
    float _1389 = _1387 + _1377;
    float _1391 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1393 = _1383 * _1383;
    float _1395 = -_1071;
    float _1397 = _1395 + _1379;
    float _1399 = 1.0 / _1385;
    float _1401 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1391);
    float _1403 = fma(_1389, _1389, _1393);
    float _1405 = -_1129;
    float _1407 = _1405 + _1375;
    float _1409 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1411 = fma(_1397, _1397, _1403);
    float _1413 = -_1145;
    float _1415 = _1413 + _1379;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1419 = sqrt(_1411);
    bool _1421 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1423 = isnan(0.5);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1429 = _1425 || _1427;
    float _1431 = _1417 + _1385;
    bool _1433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1435 = isnan(0.5);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1441 = _1437 || _1439;
    float _1443 = _1431 * _1399;
    float _1445 = _1443 * 0.5;
    float _1447 = -_1131;
    float _1449 = _1447 + _1377;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1453 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1451);
    bool _1455 = _1419 > 0.0;
    float _1457 = 1.0 / _1453;
    float _1459 = _1419;
    float _1461 = _1445;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1465 = _1407;
    if (!_1455)
    {
        _1459 = _1449;
    }
    float _1467 = _1459;
    float _1469 = _1467;
    if (!_1455)
    {
        _1461 = _1407;
    }
    float _1471 = _1461;
    float _1473 = _1471;
    if (!_1455)
    {
        _1463 = _1415;
    }
    float _1475 = _1463;
    bool _1477 = !_1455;
    float _1479 = _1475;
    float _1481 = _1475;
    if (!_1477)
    {
        float _1483 = _229 * _229;
        float _1485 = fma(_225, _225, _1483);
        float _1487 = fma(_231, _231, _1485);
        float _1489 = rsqrt(_1411);
        float _1491 = sqrt(_1487);
        float _1493 = _1389 * _1489;
        float _1495 = _1383 * _1489;
        float _1497 = _1397 * _1489;
        bool _1499 = _1491 > 0.0;
        float _1501 = _1489;
        float _1503 = _1491;
        _781 = _1495;
        if (!_1499)
        {
            _1501 = _1449;
        }
        float _1505 = _1501;
        _1469 = _1505;
        if (!_1499)
        {
            _1503 = _1407;
        }
        float _1507 = _1503;
        _1473 = _1507;
        if (!_1499)
        {
            _1479 = _1415;
        }
        float _1509 = _1479;
        bool _1511 = !_1499;
        _1481 = _1509;
        if (!_1511)
        {
            float _1513 = rsqrt(_1487);
            float _1515 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1517 = _229 * _1513;
            float _1519 = _225 * _1513;
            float _1521 = _1495 * _1517;
            float _1523 = _231 * _1513;
            float _1525 = fma(_1493, _1519, _1521);
            float _1527 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1529 = fma(_1497, _1523, _1525);
            float _1531 = _1529 * _1527;
            float _1533 = fma(_225, _1531, _1449);
            float _1535 = fma(_229, _1531, _1407);
            float _1537 = fma(_231, _1531, _1415);
            _1469 = _1533;
            _1473 = _1535;
            _1481 = _1537;
        }
    }
    float _1539 = _1469;
    float _1541 = _1473;
    float _1543 = _1481;
    float _1545 = _781;
    float _1547 = _1541;
    float _1549 = _1539;
    float _1551 = _1543;
    float _1553 = _1545;
    if (_1441)
    {
        _235 = 1.0;
    }
    float _1555 = _235;
    float _1557 = _1555;
    if (!_1429)
    {
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1561 = _1275 + _1559;
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1565 = _1231 + _1563;
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1569 = _1561 * _1561;
        float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1573 = _1307 + _1571;
        float _1575 = fma(_1565, _1565, _1569);
        float _1577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1579 = fma(_1573, _1573, _1575);
        float _1581 = sqrt(_1579);
        float _1583 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1585 = precise::min(_1581, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1577;
        float _1589 = -_1231;
        float _1591 = _1589 + _1539;
        float _1593 = _1583 * _1587;
        float _1595 = -_1275;
        float _1597 = _1595 + _1541;
        float _1599 = -_1307;
        float _1601 = _1599 + _1543;
        float _1603 = fma(_1591, _1593, _1231);
        float _1605 = fma(_1597, _1593, _1275);
        float _1607 = fma(_1601, _1593, _1307);
        _1547 = _1605;
        _1549 = _1603;
        _1551 = _1607;
        _237 = _1601;
    }
    float _1609 = _1547;
    float _1611 = _1549;
    float _1613 = _1551;
    float _1615 = _237;
    float _1617 = _1615;
    if (_1441)
    {
        _1553 = 1.0;
    }
    float _1619 = _1553;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1623 = _1457 * _1621;
    float _1625 = _1619;
    if (!_1441)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1633;
        float _1637 = _1629 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = _1631 * 0.15915493667125701904296875;
        float _1643 = _1629 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        float _1647 = 1.0 / _1639;
        float _1649 = _1641 * 6.283185482025146484375;
        float _1651 = cos(_1649);
        float _1653 = _1645 * _1647;
        float _1655 = _1641 * 6.283185482025146484375;
        float _1657 = sin(_1655);
        float _1659 = _1651 * _1653;
        float _1661 = 1.0 / _1635;
        float _1663 = 1.0 / _1659;
        float _1665 = _1657 * _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1623, _1665, _1667);
        float _1671 = _1669 * _1661;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1321 = _1641;
        _1617 = _1661;
        _1557 = _1673;
    }
    float _1675 = _1321;
    float _1677 = _1617;
    float _1679 = _1557;
    float _1681 = _1675;
    float _1683 = _1677;
    if (!_1441)
    {
        float _1685 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1687 = _1685 * 0.15915493667125701904296875;
        float _1689 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1691 = _1687 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1689 * 0.15915493667125701904296875;
        float _1697 = _1687 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = 1.0 / _1693;
        float _1703 = _1695 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = _1695 * 6.283185482025146484375;
        float _1711 = sin(_1709);
        float _1713 = _1705 * _1707;
        float _1715 = 1.0 / _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1717;
        float _1721 = 1.0 / _1719;
        float _1723 = _1711 * _1715;
        float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1727 = fma(_1623, _1723, _1725);
        float _1729 = _1727 * _1721;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        float _1733 = -_1731;
        float _1735 = _1733 + 1.0;
        _1465 = _1723;
        _1681 = _1693;
        _1683 = _1713;
        _1625 = _1735;
    }
    float _1737 = _1465;
    float _1739 = _1681;
    float _1741 = _1683;
    float _1743 = _1625;
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1747 = _1609 + _1745;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1751 = _1611 + _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1755 = _1613 + _1753;
    float _1757 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1759 = _1747 * _1747;
    float _1761 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1757);
    float _1763 = fma(_1751, _1751, _1759);
    float _1765 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1767 = fma(_1755, _1755, _1763);
    float _1769 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1771 = rsqrt(_1767);
    float _1773 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1775 = _1751 * _1773;
    float _1777 = _1755 * _1773;
    float _1779 = _1775 * _1775;
    float _1781 = _1777 * _1777;
    float _1783 = _1779 + _1781;
    float _1785 = sqrt(_1783);
    bool _1787 = _1785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1791 = _1785 + _1789;
    float _1793 = _1771;
    float _1795 = _1741;
    float _1797 = _1791;
    float _1799 = _1737;
    float _1801 = _1773;
    float _1803 = _1783;
    if (_1787)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1793 = _1805;
    }
    float _1807 = _1793;
    if (_1787)
    {
        float _1809 = rsqrt(_1783);
        _1795 = _1809;
    }
    float _1811 = _1795;
    float _1813 = _1807;
    float _1815 = _1811;
    if (_1787)
    {
        float _1817 = _1791 * _1807;
        _1797 = _1817;
    }
    float _1819 = _1797;
    if (_1787)
    {
        float _1821 = _1819 * 0.15915493667125701904296875;
        _1799 = _1821;
    }
    float _1823 = _1799;
    float _1825 = _1755;
    float _1827 = _1823;
    if (_1787)
    {
        float _1829 = _1823 * 6.283185482025146484375;
        float _1831 = sin(_1829);
        _1825 = _1831;
    }
    float _1833 = _1825;
    float _1835 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1837 = precise::max(0.0, _1835);
    float _1839 = _1739;
    if (_1787)
    {
        float _1841 = _1823 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = -_1773;
    float _1849 = -_1837;
    float _1851 = fma(_1747, _1847, _1849);
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1855 = _1851;
    if (_1787)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1813 = _1857;
    }
    float _1859 = _1813;
    float _1861 = _1859;
    if (!_1787)
    {
        _1827 = _1777;
    }
    float _1863 = _1827;
    float _1865 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1867 = _1863;
    if (_1787)
    {
        float _1869 = fma(_1833, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1861 = _1869;
    }
    float _1871 = _1861;
    float _1873 = floor(_1865);
    float _1875 = _1871;
    if (_1787)
    {
        float _1877 = _1845 + (-1.0);
        _1853 = _1877;
    }
    float _1879 = _1853;
    if (_1787)
    {
        float _1881 = _1811 * _1871;
        _1801 = _1881;
    }
    float _1883 = _1801;
    if (!_1787)
    {
        _1815 = _1775;
    }
    float _1885 = _1815;
    float _1887 = _1885;
    if (_1787)
    {
        float _1889 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1803 = _1889;
    }
    float _1891 = _1803;
    float _1893 = _1891;
    if (_1787)
    {
        float _1895 = _1775 * _1883;
        _1887 = _1895;
    }
    float _1897 = _1887;
    if (!_1787)
    {
        _1875 = _1779;
    }
    float _1899 = _1875;
    float _1901 = _1899;
    if (_1787)
    {
        float _1903 = _1777 * _1883;
        _1867 = _1903;
    }
    float _1905 = _1867;
    if (_1787)
    {
        float _1907 = fma(_1851, _1845, _1891);
        _1855 = _1907;
    }
    float _1909 = _1855;
    if (_1787)
    {
        float _1911 = _1897 * _1897;
        _1901 = _1911;
    }
    float _1913 = _1901;
    if (!_1787)
    {
        _1893 = _1781;
    }
    float _1915 = _1893;
    float _1917 = _1915;
    if (_1787)
    {
        float _1919 = _1905 * _1905;
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = sqrt(_1767);
    float _1925 = fma(_1909, _1909, _1913);
    float _1927 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1929 = -_1873;
    float _1931 = _1865 + _1929;
    float _1933 = _1925 + _1921;
    float _1935 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1927);
    float _1939 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1941 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1943 = rsqrt(_1933);
    float _1945 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1937);
    float _1947 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1939);
    float _1949 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1941);
    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1953 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1951);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1947);
    float _1959 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1963 = -_1955;
    float _1965 = _1963 + 1.0;
    float _1967 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1971 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1975 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1969);
    float _1979 = abs(_1965);
    float _1981 = log2(_1979);
    float _1983 = _1943 * _1897;
    float _1985 = _1943 * _1905;
    float _1987 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1977);
    float _1989 = -_1975;
    float _1991 = fma(_1989, _1973, 1.0);
    float _1993 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1995 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1997 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1987);
    float _1999 = _1943 * _1909;
    float _2001 = floor(_1971);
    float _2003 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2005 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1995);
    float _2007 = -_1993;
    float _2009 = fma(_1999, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2007);
    float _2011 = _1999 + 1.0;
    float _2013 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2015 = -_1985;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2009);
    float _2019 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2021 = 1.0 / _1997;
    float _2023 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2003);
    float _2025 = fma(_2017, -0.5, 0.5);
    float _2027 = fma(_2017, 0.5, 0.5);
    float _2029 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2013);
    float _2031 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2023);
    float _2033 = -_2001;
    float _2035 = _1971 + _2033;
    float _2037 = exp2(_2019);
    float _2039 = fma(_2027, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2041 = fma(_2027, _2039, -0.212114393711090087890625);
    float _2043 = sqrt(_2025);
    float _2045 = fma(_2027, _2041, 1.570728778839111328125);
    float _2047 = _2029 * _2021;
    float _2049 = fma(_2047, 0.5, 0.5);
    float _2051 = log2(_1991);
    float _2053 = -_1999;
    float _2055 = fma(_2037, _2011, _2053);
    float _2057 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2031);
    float _2059 = _2057 * _2021;
    float _2061 = _2043 * 0.636619746685028076171875;
    float _2063 = fma(_2059, -0.5, 0.5);
    float _2065 = -_2045;
    float _2067 = fma(_2061, _2065, 1.0);
    float _2069 = fma(_2055, 0.5, 0.5);
    float _2071 = _2051 * 0.693147182464599609375;
    float2 _7055 = float2(_1931, _2035);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7055, float2(0.0), isnan(_7055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7055, float2(0.0), isnan(_7055)), level(0.0)).x;
    float _2075 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _7070 = float3(_2049, _2063, _2075);
    float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7070, float3(0.0), isnan(_7070)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7070, float3(0.0), isnan(_7070)), level(0.0)).x;
    float3 _7081 = float3(_2049, _2063, _2075);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7081, float3(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7081, float3(0.0), isnan(_7081)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float2 _7097 = float2(_2067, _2069);
    float3 _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7097, float2(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7097, float2(0.0), isnan(_7097)), level(0.0)).xyz;
    float _2094 = _2092.x;
    float _2096 = _2092.y;
    float _2098 = _2092.z;
    float _2100 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _2102 = int(_2100);
    float _2104 = in.m_64.x;
    float _2106 = in.m_64.y;
    float _2108 = in.m_64.z;
    float _2110 = in.m_64.w;
    float _2112 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2116 = _2114 != 0;
    out.m_70.x = _1231;
    out.m_70.y = _1275;
    out.m_70.z = _1307;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2120 = _2118 != 0;
    float _2122 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2124 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2126 = int(_2124);
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2130 = _2128 != 0;
    out.m_72.w = _1119;
    float _2132 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_74.x = _1235;
    out.m_74.y = _1237;
    out.m_74.z = _1239;
    float _2134 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2136 = int(_2134);
    float _2138 = float(_2102);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2144 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2146 = int(_2144);
    float _2148 = float(_2126);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2152 = _2150 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2154 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2156 = _2110 > 0.5;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2162 = _2160 != 0;
    float _2164 = 1.0 / _2138;
    float _2166 = float(uint(_2136));
    float _2168 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2170 = _2106 > 0.5;
    float _2172 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2132);
    float _2174 = -_213;
    int _2176 = _2156 ? as_type<int>(_2174) : as_type<int>(_213);
    float _2178 = -_2158;
    float _2180 = fma(_2168, 2.0, _2178);
    float _2182 = 1.0 / _2148;
    float _2184 = float(uint(_2146));
    float _2186 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2172);
    bool _2188 = !_2120;
    float _2190 = _2188 ? _213 : as_type<float>(_2176);
    out.m_76.x = _1219;
    int _2192 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2194 = _2192 != 0;
    float _2196 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2198 = _151 * _2164;
    float _2200 = 1.0 / _2166;
    int _2202 = ~_2136;
    int _2204 = _2202 + 1;
    out.gl_Position.x = _2029;
    out.gl_Position.y = _2057;
    out.gl_Position.z = _2196;
    out.gl_Position.w = _1997;
    int _2206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2208 = _2206 != 0;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2212 = _2210 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2216 = _2214 != 0;
    out.m_78.x = _1611;
    out.m_78.y = _1609;
    out.m_78.z = _1613;
    float _2218 = _151 * _2182;
    float _2220 = trunc(_2198);
    int _2222 = int(_2220);
    float _2224 = -_213;
    int _2226 = _2170 ? as_type<int>(_2224) : as_type<int>(_213);
    bool _2228 = _2104 > 0.5;
    bool _2230 = !_2130;
    float _2232 = _2230 ? _213 : as_type<float>(_2226);
    float _2234 = -_209;
    int _2236 = _2228 ? as_type<int>(_2234) : as_type<int>(_209);
    float _2238 = 1.0 / _2184;
    int _2240 = as_type<int>(_2200) + (-2);
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2244 = _2242 != 0;
    int _2246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2248 = _2246 != 0;
    int _2250 = ~_2146;
    int _2252 = _2250 + 1;
    float _2254 = trunc(_2218);
    int _2256 = int(_2254);
    bool _2258 = !_2194;
    float _2260 = _2258 ? _209 : as_type<float>(_2236);
    float _2262 = float(uint(_2222));
    bool _2264 = _2108 > 0.5;
    float _2266 = _2260 + 0.5;
    int _2268 = abs(_1027);
    float _2270 = as_type<float>(_2240) * _2262;
    int _2272 = as_type<int>(_2238) + (-2);
    float _2274 = 1.0 / _2142;
    float _2276 = -_209;
    int _2278 = _2264 ? as_type<int>(_2276) : as_type<int>(_209);
    float _2280 = _2238;
    float _2282 = _2108;
    float _2284 = _1997;
    float _2286 = _2196;
    float _2288 = _2057;
    if (_2162)
    {
        float _2290 = in.m_64.x;
        _2280 = _2290;
    }
    float _2292 = _2280;
    int _2294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2296 = _2294 != 0;
    float _2298 = _2292;
    if (!_2162)
    {
        float _2300 = in.m_64.y;
        _2298 = _2300;
    }
    float _2302 = _2298;
    float _2304 = float(uint(_2256));
    float _2306 = trunc(_2270);
    float _2308 = precise::max(_2306, 0.0);
    uint _2311 = uint(_2308);
    int _2313 = abs(_1039);
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2321 = _2319 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2323 = as_type<float>(_2272) * _2304;
    float _2325 = 1.0 / _2212;
    float _2327 = _2317 * _2274;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2331 = fma(_2154, -2.0, _2329);
    float _2333 = trunc(_2323);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    int _2339 = _2204 * int(_2311);
    int _2341 = _2339 + _2222;
    float _2343 = float(uint(_2341));
    float _2345 = 1.0 / _2152;
    float _2347 = _2321 * _2325;
    float _2349 = as_type<float>(_2240) * _2343;
    bool _2351 = !_2216;
    float _2353 = _2351 ? _209 : as_type<float>(_2278);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2357 = _977 + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2359;
    int _2363 = _2252 * int(_2337);
    int _2365 = _2363 + _2256;
    float _2367 = fma(_2327, _2357, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2369 = trunc(_2349);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = float(uint(_2365));
    float _2377 = as_type<float>(_2365);
    if (_2162)
    {
        _2377 = 1.0;
    }
    float _2379 = _2377;
    float _2381 = _2361 * _2345;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2385 = _977 + _2383;
    float _2387 = as_type<float>(_2272) * _2375;
    float _2389 = _2379;
    float _2391 = _2385;
    if (!_2162)
    {
        _2389 = 7.345489978790283203125;
    }
    float _2393 = _2389;
    float _2395 = exp2(_2122);
    float _2397 = fma(_2347, _2385, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2162)
    {
        _2391 = 1.0;
    }
    float _2399 = _2391;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2403 = _977 + _2401;
    float _2405 = _2393 * _2104;
    float _2407 = _2399;
    if (!_2162)
    {
        _2407 = 1.2345600128173828125;
    }
    float _2409 = _2407;
    int _2411 = ~_2136;
    int _2413 = _2411 + 1;
    float _2415 = trunc(_2387);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    int _2421 = int(_2311) + int(_2373);
    float _2423 = _2409 * _2302;
    float _2425 = float(_2136);
    float _2427 = fma(_2381, _2403, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2429 = ~_2146;
    int _2431 = _2429 + 1;
    int _2433 = _2413 * _2421;
    int _2435 = _2433 + _2222;
    bool _2437 = !_2244;
    int _2439 = _2437 ? 0 : 1;
    float _2441 = floor(_2405);
    float _2443 = float(_117);
    float _2445 = -_2395;
    float _2447 = _2445 + 1.0;
    bool _2449 = uint(_2435) >= uint(_2136);
    float _2451 = float(_2222);
    float _2453 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2455 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2457 = isnan(_977);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    int _2467 = int(_2337) + int(_2419);
    float _2469 = 1.0 / _2443;
    bool _2471 = _2451 >= _2425;
    bool _2473 = isnan(_2451);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(_2425);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = -_2465;
    float _2485 = _2483 + 1.0;
    bool _2487 = !_2449;
    int _2489 = _2487 ? 0 : (-1);
    int _2491 = _2431 * _2467;
    int _2493 = _2491 + _2256;
    float _2495 = -_2441;
    float _2497 = _2405 + _2495;
    bool _2499 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2501 = isnan(_977);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2507 = _2503 || _2505;
    float _2509 = float(_2507);
    float _2511 = trunc(_2481);
    int _2513 = int(_2511);
    int _2515 = ~_2421;
    int _2517 = _2515 + _2489;
    int _2519 = _2517 + 1;
    bool _2521 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2523 = isnan(_977);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2529 = _2525 || _2527;
    float _2531 = float(_2529);
    float _2533 = _2509 * _2485;
    bool _2535 = uint(_2493) >= uint(_2146);
    int _2537 = _2493;
    if (_2162)
    {
        _2537 = 0;
    }
    int _2539 = _2537;
    float _2541 = _151 * _2469;
    float _2543 = -_2509;
    float _2545 = _2543 + 1.0;
    bool _2547 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2549 = isnan(_977);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2555 = _2551 || _2553;
    float _2557 = float(_2555);
    int _2559 = _2539;
    if (!_2162)
    {
        _2559 = 1;
    }
    int _2561 = _2559;
    float _2563 = _2531 * _2545;
    float _2565 = -_2531;
    float _2567 = _2565 + 1.0;
    int _2569 = _2136 * _2519;
    int _2571 = _2569 + _2222;
    bool _2573 = _2136 == 0;
    float _2575 = _2541 * _2425;
    float _2577 = _2557 * _2567;
    int _2579 = ~_2513;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = _2497 * _2425;
    bool _2587 = !_2535;
    int _2589 = _2587 ? 0 : (-1);
    bool _2591 = !_2573;
    int _2593 = _2591 ? _2571 : (-1);
    float _2595 = trunc(_2575);
    int _2597 = int(_2595);
    bool _2599 = _2561 != 1;
    float _2601 = _2367 * _2577;
    float _2603 = -_151;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2180);
    int _2607 = _2593 * _2583;
    float _2609 = float(_2146);
    float _2611 = float(_2256);
    float _2613 = floor(_2423);
    int _2615 = _2136 + (-1);
    float _2617 = _2541 * _2609;
    bool _2619 = _2611 >= _2609;
    bool _2621 = isnan(_2611);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan(_2609);
    bool _2627 = _2623 || _2625;
    float _2629 = float(_2627);
    float _2631 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2605);
    int _2633 = abs(_1031);
    int _2635 = _2513 * _2615;
    int _2637 = _2635 + _2607;
    float _2639 = trunc(_2629);
    int _2641 = int(_2639);
    int _2643 = abs(_2439);
    int _2645 = ~_2467;
    int _2647 = _2645 + _2589;
    int _2649 = _2647 + 1;
    float _2651 = trunc(_2585);
    int _2653 = int(_2651);
    float _2655 = -_2613;
    float _2657 = _2423 + _2655;
    int _2659 = _2637 * _2268;
    float _2661 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2331);
    int _2663 = _2146 * _2649;
    int _2665 = _2663 + _2256;
    float _2667 = _2657 * _2609;
    int _2669 = _2597 * _2633;
    int _2671 = _2669 + _2659;
    bool _2673 = !_2116;
    int _2675 = _2673 ? 0 : 1;
    float _2677 = trunc(_2617);
    int _2679 = int(_2677);
    bool _2681 = _2146 == 0;
    float _2683 = _2232 + (-0.5);
    int _2685 = abs(_1035);
    int _2687 = abs(_2675);
    int _2689 = ~_2641;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2653 * _2643;
    int _2697 = _2695 + _2222;
    bool _2699 = !_2681;
    int _2701 = _2699 ? _2665 : (-1);
    float _2703 = trunc(_2667);
    int _2705 = int(_2703);
    int _2707 = _2146 + (-1);
    int _2709 = _2701 * _2693;
    float _2711 = -_2683;
    float _2713 = -_2661;
    float _2715 = fma(_2711, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2713);
    int _2717 = _2697 * _2685;
    int _2719 = _2717 + _2671;
    int _2721 = abs(_1043);
    int _2723 = _2641 * _2707;
    int _2725 = _2723 + _2709;
    int _2727 = _2653 * _2687;
    int _2729 = _2727 + _2719;
    float _2731 = -_2557;
    float _2733 = _2731 + 1.0;
    bool _2735 = !_2296;
    int _2737 = _2735 ? 0 : 1;
    int _2739 = _2725 * _2313;
    float _2741 = float(uint(_2729));
    float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2601);
    int _2745 = _2679 * _2721;
    int _2747 = _2745 + _2739;
    int _2749 = abs(_2737);
    float _2751 = as_type<float>(_2240) * _2741;
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2755 = _2741;
    if (!_2599)
    {
        _2755 = _2106;
    }
    float _2757 = _2755;
    float _2759 = trunc(_2751);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    int _2765 = _2705 * _2749;
    int _2767 = _2765 + _2256;
    int _2769 = abs(as_type<int>(_1209));
    float _2771 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2753);
    float _2773 = _2757;
    if (!_2599)
    {
        _1323 = _2106;
    }
    float _2775 = _1323;
    float _2777 = _2775;
    if (_2599)
    {
        _2777 = _2104;
    }
    float _2779 = _2777;
    float _2781 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2771);
    if (_2599)
    {
        _2773 = _2104;
    }
    float _2783 = _2773;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2787 = ~_2136;
    int _2789 = _2787 + 1;
    int _2791 = _2767 * _2769;
    int _2793 = _2791 + _2747;
    int _2795 = abs(_1059);
    float _2797 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2785);
    int _2799 = _2789 * int(_2763);
    int _2801 = _2799 + _2729;
    float _2803 = _2785;
    if (!_2599)
    {
        _2803 = _2108;
    }
    float _2805 = _2803;
    int _2807 = _2705 * _2795;
    int _2809 = _2807 + _2793;
    float _2811 = _2805;
    if (_2599)
    {
        _2811 = _2106;
    }
    float _2813 = _2811;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2817 = float(uint(_2801));
    float _2819 = fma(_2397, _2563, _2743);
    float _2821 = float(uint(_2809));
    float _2823 = fma(_2813, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2815);
    float _2825 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2827 = as_type<float>(_2240) * _2817;
    float _2829 = as_type<float>(_2272) * _2821;
    float _2831 = float(uint(_2697));
    float _2833 = fma(_2427, _2533, _2819);
    if (_2599)
    {
        _2282 = _2106;
    }
    float _2835 = _2282;
    float _2837 = trunc(_2829);
    float _2839 = precise::max(_2837, 0.0);
    uint _2841 = uint(_2839);
    float _2843 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2845 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2797);
    int _2847 = ~_2146;
    int _2849 = _2847 + 1;
    float _2851 = -_2843;
    float _2853 = fma(_2825, 2.0, _2851);
    float _2855 = as_type<float>(_2240) * _2831;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2859 = trunc(_2827);
    float _2861 = precise::max(_2859, 0.0);
    uint _2863 = uint(_2861);
    float _2865 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2867 = -_151;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2853);
    float _2871 = float(uint(_2767));
    float _2873 = fma(_2865, -2.0, _2857);
    float _2875 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2833);
    float _2877 = trunc(_2855);
    float _2879 = precise::max(_2877, 0.0);
    uint _2881 = uint(_2879);
    int _2883 = _2849 * int(_2841);
    int _2885 = _2883 + _2809;
    int _2887 = ~_2136;
    int _2889 = _2887 + 1;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2893 = ~_2136;
    int _2895 = _2893 + 1;
    float _2897 = -_2845;
    float _2899 = _2897 + 1.0;
    float _2901 = -_2073;
    float _2903 = _2901 + 1.0;
    float _2905 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2891);
    int _2907 = int(_2763) + int(_2863);
    float _2909 = as_type<float>(_2272) * _2871;
    float _2911 = float(uint(_2885));
    float _2913 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2905);
    float _2915 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2823);
    float _2917 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2873);
    float _2919 = as_type<float>(_2272) * _2911;
    float _2921 = trunc(_2909);
    float _2923 = precise::max(_2921, 0.0);
    uint _2925 = uint(_2923);
    int _2927 = _2889 * _2907;
    int _2929 = _2927 + _2729;
    float _2931 = _2353 + 0.5;
    int _2933 = _2895 * int(_2881);
    int _2935 = _2933 + _2697;
    int _2937 = ~_2146;
    int _2939 = _2937 + 1;
    float _2941 = -_2913;
    float _2943 = _2941 + 1.0;
    bool _2945 = uint(_2929) >= uint(_2136);
    float _2947 = _2190 + (-0.5);
    float _2949 = float(uint(_2935));
    float _2951 = fma(_2931, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2869);
    bool _2953 = !_2945;
    int _2955 = _2953 ? 0 : (-1);
    float _2957 = trunc(_2919);
    float _2959 = precise::max(_2957, 0.0);
    uint _2961 = uint(_2959);
    float _2963 = -_2781;
    float _2965 = _2963 + 1.0;
    float _2967 = -_2943;
    float _2969 = fma(_2353, _2967, _2951);
    int _2971 = ~_2907;
    int _2973 = _2971 + _2955;
    int _2975 = _2973 + 1;
    float _2977 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2979 = _2939 * int(_2925);
    int _2981 = _2979 + _2767;
    float _2983 = -_2965;
    float _2985 = fma(_2260, _2983, _2631);
    float _2987 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2989 = _2136 * _2975;
    int _2991 = _2989 + _2729;
    int _2993 = ~_2146;
    int _2995 = _2993 + 1;
    float _2997 = as_type<float>(_2240) * _2949;
    float _2999 = float(uint(_2981));
    float _3001 = fma(_2232, _2899, _2715);
    bool _3003 = !_2573;
    int _3005 = _3003 ? _2991 : (-1);
    float _3007 = -_2947;
    float _3009 = -_2917;
    float _3011 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3009);
    float _3013 = trunc(_2997);
    float _3015 = precise::max(_3013, 0.0);
    uint _3017 = uint(_3015);
    float _3019 = as_type<float>(_2272) * _2999;
    int _3021 = int(_2841) + int(_2961);
    float _3023 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3025 = _3005 & 3;
    bool _3027 = _3025 != 0;
    float _3029 = _2987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3031 = _3005 & 3;
    bool _3033 = _3031 != 0;
    int _3035 = _2995 * _3021;
    int _3037 = _3035 + _2809;
    bool _3039 = uint(_3025) > 1u;
    float _3041 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3043 = _3033 ? 0 : 1;
    float _3045 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3047 = uint(_3037) >= uint(_2146);
    float _3049 = -_2915;
    float _3051 = _3049 + 1.0;
    float _3053 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3055 = trunc(_3019);
    float _3057 = precise::max(_3055, 0.0);
    uint _3059 = uint(_3057);
    bool _3061 = !_3047;
    int _3063 = _3061 ? 0 : (-1);
    float _3065 = fma(_2190, _3051, _3011);
    int _3067 = ~_3043;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    out.m_80.x = _3041;
    out.m_80.y = _3029;
    out.m_80.z = _3045;
    out.m_80.w = _3053;
    int _3073 = ~_3021;
    int _3075 = _3073 + _3063;
    int _3077 = _3075 + 1;
    float _3079 = _2453 * _2077;
    int _3081 = _3071;
    if (!_3039)
    {
        int _3083 = ~_3043;
        int _3085 = _3083 + 1;
        _3081 = _3085;
    }
    int _3087 = _3081;
    out.m_82.x = _2985;
    out.m_82.y = _3001;
    out.m_82.z = _2969;
    out.m_82.w = _3065;
    bool _3089 = _3025 != 3;
    int _3091 = _2146 * _3077;
    int _3093 = _3091 + _2809;
    int _3095 = _3005 >> 31;
    float _3097 = abs(_1623);
    float _3099 = log2(_3097);
    bool _3101 = uint(_3025) >= 2u;
    int _3103 = int(_2881) + int(_3017);
    int _3105 = _3101 ? 0 : 1;
    float _3107 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3109 = ~_2136;
    int _3111 = _3109 + 1;
    int _3113 = _3095 & 3;
    float _3115 = fma(_3107, _3107, 1.0);
    float _3117 = _3107 * _1259;
    int _3119 = _3005 + _3113;
    float _3121 = rsqrt(_3115);
    bool _3123 = !_2681;
    int _3125 = _3123 ? _3093 : (-1);
    int _3127 = _3111 * _3103;
    int _3129 = _3127 + _2697;
    int _3131 = ~_2146;
    int _3133 = _3131 + 1;
    float _3135 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3137 = ~_3105;
    int _3139 = _3137 + 1;
    int _3141 = _3139 + 1;
    float _3143 = fma(_2112, _1237, _3117);
    int _3145 = _3119 >> 2;
    int _3147 = _3141;
    if (_3089)
    {
        int _3149 = ~_3105;
        int _3151 = _3149 + 1;
        _3147 = _3151;
    }
    int _3153 = _3147;
    float _3155 = exp2(_3135);
    int _3157 = _3125 >> 31;
    int _3159 = int(_2925) + int(_3059);
    int _3161 = _3145 << 4;
    int _3163 = _3161 + 368;
    float _3165 = _3107 * _3121;
    int _3167 = _3157 & 3;
    bool _3169 = uint(_3129) >= uint(_2136);
    int _3171 = _3133 * _3159;
    int _3173 = _3171 + _2767;
    int _3175 = _3125 + _3167;
    uint _3177 = uint(int(uint(_3163) >> uint(2)));
    uint _3179 = uint(int(uint(int(_3177)) >> uint(2)));
    int _3181 = int(_3177) & 3;
    float _3183 = (*spvDescriptorSet0.vp_c9)._m0[int(_3179)][_3181];
    int _3185 = int(_3177) + 1;
    uint _3187 = uint(int(uint(_3185) >> uint(2)));
    int _3189 = _3185 & 3;
    float _3191 = (*spvDescriptorSet0.vp_c9)._m0[int(_3187)][_3189];
    float _3193 = -_1135;
    float _3195 = _3165 * _3193;
    float _3197 = -_1155;
    float _3199 = _3165 * _3197;
    int _3201 = _3175 >> 2;
    bool _3203 = uint(_3173) >= uint(_2146);
    float _3205 = -_1147;
    float _3207 = _3165 * _3205;
    int _3209 = _3201 << 4;
    int _3211 = _3209 + 512;
    float _3213 = fma(_3121, _1255, _3195);
    float _3215 = fma(_3121, _1259, _3199);
    float _3217 = fma(_3121, _1251, _3207);
    float _3219 = _3107 * _1255;
    float _3221 = _3107 * _1251;
    uint _3223 = uint(int(uint(_3211) >> uint(2)));
    uint _3225 = uint(int(uint(int(_3223)) >> uint(2)));
    int _3227 = int(_3223) & 3;
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[int(_3225)][_3227];
    int _3231 = int(_3223) + 1;
    uint _3233 = uint(int(uint(_3231) >> uint(2)));
    int _3235 = _3231 & 3;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[int(_3233)][_3235];
    float _3239 = fma(_2112, _1235, _3219);
    float _3241 = fma(_2112, _1239, _3221);
    bool _3243 = !_3169;
    int _3245 = _3243 ? 0 : (-1);
    float _3247 = fma(_3155, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3249 = precise::clamp(_3247, 0.0, 1.0);
    bool _3251 = !_3203;
    int _3253 = _3251 ? 0 : (-1);
    out.m_84.x = _3213;
    out.m_84.y = _3215;
    out.m_84.z = _3217;
    int _3255 = ~_3103;
    int _3257 = _3255 + _3245;
    int _3259 = _3257 + 1;
    int _3261 = _3163 + 8;
    uint _3263 = uint(int(uint(_3261) >> uint(2)));
    uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
    int _3267 = int(_3263) & 3;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[int(_3265)][_3267];
    int _3271 = int(_3263) + 1;
    uint _3273 = uint(int(uint(_3271) >> uint(2)));
    int _3275 = _3271 & 3;
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[int(_3273)][_3275];
    int _3279 = _3125 & 3;
    bool _3281 = _3279 != 0;
    float _3283 = _3249 * _3249;
    int _3285 = _2136 * _3259;
    int _3287 = _3285 + _2697;
    int _3289 = _3125 & 3;
    bool _3291 = _3289 != 0;
    int _3293 = ~_3159;
    int _3295 = _3293 + _3253;
    int _3297 = _3295 + 1;
    float _3299 = fma(_3249, -2.0, 3.0);
    bool _3301 = _1623 <= 8000.0;
    bool _3303 = isnan(_1623);
    bool _3305 = _3301 || _3303;
    bool _3307 = isnan(8000.0);
    bool _3309 = _3305 || _3307;
    float _3311 = float(_3309);
    int _3313 = _3211 + 8;
    uint _3315 = uint(int(uint(_3313) >> uint(2)));
    uint _3317 = uint(int(uint(int(_3315)) >> uint(2)));
    int _3319 = int(_3315) & 3;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[int(_3317)][_3319];
    int _3323 = int(_3315) + 1;
    uint _3325 = uint(int(uint(_3323) >> uint(2)));
    int _3327 = _3323 & 3;
    float _3329 = (*spvDescriptorSet0.vp_c9)._m0[int(_3325)][_3327];
    int _3331 = _3281 ? 0 : 1;
    float _3333 = _3283 * _3299;
    bool _3335 = uint(_3289) > 1u;
    int _3337 = _2146 * _3297;
    int _3339 = _3337 + _2767;
    int _3341 = abs(_3087);
    int _3343 = ~_3331;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = ~_3341;
    int _3351 = _3349 + 1;
    int _3353 = _3351 + 1;
    bool _3355 = !_2573;
    int _3357 = _3355 ? _3287 : (-1);
    bool _3359 = !_2681;
    int _3361 = _3359 ? _3339 : (-1);
    int _3363 = _3347;
    if (!_3335)
    {
        int _3365 = ~_3331;
        int _3367 = _3365 + 1;
        _3363 = _3367;
    }
    int _3369 = _3363;
    int _3371 = _3353 * as_type<int>(_3191);
    bool _3373 = !_3027;
    int _3375 = _3373 ? 0 : 1;
    int _3377 = abs(_3369);
    bool _3379 = !_3291;
    int _3381 = _3379 ? 0 : 1;
    int _3383 = abs(_3375);
    bool _3385 = _3289 != 3;
    int _3387 = abs(_3381);
    bool _3389 = uint(_3289) >= 2u;
    int _3391 = ~_3377;
    int _3393 = _3391 + 1;
    int _3395 = _3393 + 1;
    int _3397 = abs(_3153);
    int _3399 = ~_3383;
    int _3401 = _3399 + 1;
    int _3403 = _3401 + 1;
    int _3405 = _3395 * as_type<int>(_3237);
    int _3407 = _3389 ? 0 : 1;
    int _3409 = ~_3397;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = _3403 * as_type<int>(_3183);
    int _3417 = _3415 + _3371;
    int _3419 = ~_3387;
    int _3421 = _3419 + 1;
    int _3423 = _3421 + 1;
    bool _3425 = _3025 != 3;
    int _3427 = _3413 * as_type<int>(_3269);
    int _3429 = _3427 + _3417;
    int _3431 = ~_3407;
    int _3433 = _3431 + 1;
    int _3435 = _3433 + 1;
    int _3437 = _3423 * as_type<int>(_3229);
    int _3439 = _3437 + _3405;
    int _3441 = _3435;
    if (_3385)
    {
        int _3443 = ~_3407;
        int _3445 = _3443 + 1;
        _3441 = _3445;
    }
    int _3447 = _3441;
    bool _3449 = _3289 != 3;
    bool _3451 = !_3425;
    int _3453 = _3451 ? 0 : (-1);
    int _3455 = abs(_3447);
    bool _3457 = !_2208;
    int _3459 = _3457 ? 0 : 1;
    bool _3461 = !_3449;
    int _3463 = _3461 ? 0 : (-1);
    int _3465 = abs(_3453);
    int _3467 = abs(_3459);
    int _3469 = abs(_3463);
    int _3471 = ~_3455;
    int _3473 = _3471 + 1;
    int _3475 = _3473 + 1;
    bool _3477 = !_2248;
    int _3479 = _3477 ? 0 : 1;
    int _3481 = _3475 * as_type<int>(_3321);
    int _3483 = _3481 + _3439;
    int _3485 = ~_3465;
    int _3487 = _3485 + 1;
    int _3489 = _3487 + 1;
    int _3491 = abs(_3479);
    int _3493 = ~_3469;
    int _3495 = _3493 + 1;
    int _3497 = _3495 + 1;
    int _3499 = _3489 * as_type<int>(_3277);
    int _3501 = _3499 + _3429;
    float _3503 = -_3333;
    float _3505 = _3503 + 1.0;
    float _3507 = in.m_86.x;
    int _3509 = ~_3467;
    int _3511 = _3509 + 1;
    int _3513 = _3511 + 1;
    int _3515 = _3497 * as_type<int>(_3329);
    int _3517 = _3515 + _3483;
    int _3519 = ~_3491;
    int _3521 = _3519 + 1;
    int _3523 = _3521 + 1;
    float _3525 = fma(_3505, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3333);
    float _3527 = _2196 + _1997;
    int _3529 = _3501 * _3513;
    int _3531 = _3517 * _3523;
    float _3533 = _3311 * _3525;
    float _3535 = _1997 * 0.5;
    int _3537 = _3357 * _3467;
    int _3539 = _3537 + _3529;
    float _3541 = _3527 * 0.5;
    int _3543 = _3361 * _3491;
    int _3545 = _3543 + _3531;
    float _3547 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3549 = _2029 + _1997;
    float _3551 = fma(_2057, -0.5, _3535);
    float _3553 = _1135 + _3239;
    float _3555 = _2903 * _3547;
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = _3549 * 0.5;
    float _3561 = _2098 * _3079;
    float _3563 = -_2453;
    float _3565 = _3563 + 1.0;
    float _3567 = -_3557;
    float _3569 = fma(_3567, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3571 = float(_3545);
    out.m_88.x = _3559;
    out.m_88.y = _3551;
    out.m_88.z = _3541;
    out.m_88.w = _1997;
    float _3573 = _1155 + _3143;
    float _3575 = _3569 * _3507;
    float _3577 = _1147 + _3241;
    bool _3579 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3581 = isnan(_1923);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3587 = _3583 || _3585;
    float _3589 = _3575 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3591 = float(_3539);
    out.m_90.x = _3553;
    out.m_90.y = _3573;
    out.m_90.z = _3577;
    out.m_92.x = _3589;
    float _3593 = _2088 * _3079;
    float _3595 = _2088 * _3565;
    float _3597 = fma(_2088, _3561, _2086);
    float _3599 = _1679 * _1743;
    float _3601 = fma(_2094, _3593, _2082);
    float _3603 = fma(_2096, _3593, _2084);
    out.m_94.x = _3591;
    out.m_94.y = _3571;
    float _3605 = _3599 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3607 = _3599;
    float _3609 = _3571;
    float _3611 = _3591;
    if (!_3587)
    {
        _2284 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3613 = _2284;
    out.m_96.x = _3601;
    out.m_96.y = _3603;
    out.m_96.z = _3597;
    out.m_96.w = _3595;
    float _3615 = _3613;
    float _3617 = _3613;
    if (!_3587)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3619 = _2286;
    float _3621 = _3619;
    float _3623 = _3619;
    if (!_3587)
    {
        _2288 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3625 = _2288;
    float _3627 = _3625;
    float _3629 = _3625;
    if (!_3587)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3631 = _3607;
    float _3633 = _3631;
    float _3635 = _3631;
    if (!_3587)
    {
        _3609 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3637 = _3609;
    float _3639 = _3637;
    float _3641 = _3637;
    if (!_3587)
    {
        _3611 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3643 = _3611;
    bool _3645 = !_3587;
    float _3647 = _3643;
    float _3649 = _3643;
    if (!_3645)
    {
        bool _3651 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3653 = isnan(_1923);
        bool _3655 = _3651 || _3653;
        bool _3657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3659 = _3655 || _3657;
        if (!_3659)
        {
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3663 = _1923 + _3661;
            float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3665;
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3673 = 1.0 / _3667;
            float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3691 = _3663 * _3673;
            float _3693 = precise::clamp(_3691, 0.0, 1.0);
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3699 = fma(_3693, _3671, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3701 = fma(_3693, _3697, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3703 = fma(_3693, _3677, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3705 = fma(_3693, _3681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3707 = fma(_3693, _3685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3709 = fma(_3693, _3689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3649 = _3703;
            _3629 = _3707;
            _3641 = _3699;
            _3623 = _3705;
            _3617 = _3701;
            _3635 = _3709;
            _3711 = true;
        }
        else
        {
            bool _3713 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3715 = isnan(_1923);
            bool _3717 = _3713 || _3715;
            bool _3719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3721 = _3717 || _3719;
            if (!_3721)
            {
                _3639 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3723 = _3639;
            _3641 = _3723;
            if (!_3721)
            {
                _3647 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3725 = _3647;
            _3649 = _3725;
            if (!_3721)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3727 = _3615;
            _3617 = _3727;
            if (!_3721)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3729 = _3621;
            _3623 = _3729;
            if (!_3721)
            {
                _3627 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3731 = _3627;
            _3629 = _3731;
            if (!_3721)
            {
                _3633 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3733 = _3633;
            bool _3735 = !_3721;
            _3635 = _3733;
            if (!_3735)
            {
                bool _3737 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3739 = isnan(_1923);
                bool _3741 = _3737 || _3739;
                bool _3743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3745 = _3741 || _3743;
                if (!_3745)
                {
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3749 = _1923 + _3747;
                    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3751;
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3759 = 1.0 / _3753;
                    float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3767 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3777 = _3749 * _3759;
                    float _3779 = precise::clamp(_3777, 0.0, 1.0);
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3783 = _3781 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3785 = fma(_3779, _3757, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3787 = fma(_3779, _3783, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3789 = fma(_3779, _3763, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3791 = fma(_3779, _3767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3793 = fma(_3779, _3771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3795 = fma(_3779, _3775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3649 = _3789;
                    _3629 = _3793;
                    _3641 = _3785;
                    _3623 = _3791;
                    _3617 = _3787;
                    _3635 = _3795;
                    _3711 = true;
                }
                else
                {
                    _3649 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3629 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3641 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3635 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3711 = false;
    float _3797 = _3649;
    float _3799 = _3629;
    float _3801 = _3641;
    float _3803 = _3623;
    float _3805 = _3617;
    float _3807 = _3635;
    float _3809 = _3605 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3811 = fma(_3573, -0.5, 0.5);
    float _3813 = precise::clamp(_3811, 0.0, 1.0);
    float _3815 = -_3797;
    float _3817 = _3815 + _3799;
    float _3819 = -_3801;
    float _3821 = _3819 + _3803;
    out.m_98.x = 0.0;
    float _3823 = fma(_3813, _3817, _3797);
    float _3825 = -_3805;
    float _3827 = _3825 + _3807;
    float _3829 = fma(_3813, _3821, _3801);
    float _3831 = _3823 * 0.586610972881317138671875;
    bool _3833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3835 = fma(_3813, _3827, _3805);
    out.m_49.x = _3809;
    float _3837 = fma(_3829, 0.298911988735198974609375, _3831);
    bool _3839 = _1679 > 0.0;
    bool _3841 = isnan(_1679);
    bool _3843 = _3839 || _3841;
    bool _3845 = isnan(0.0);
    bool _3847 = _3843 || _3845;
    float _3849 = fma(_3835, 0.114477999508380889892578125, _3837);
    bool _3851 = _1743 <= 0.0;
    bool _3853 = !_3847;
    bool _3855 = _3851 || _3853;
    float _3857 = -_3849;
    float _3859 = _3829 + _3857;
    float _3861 = -_3849;
    float _3863 = _3823 + _3861;
    float _3865 = -_3849;
    float _3867 = _3835 + _3865;
    float _3869 = fma(_3859, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    float _3871 = fma(_3863, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    float _3873 = fma(_3867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3849);
    bool _3875 = !_3833;
    if (!_3875)
    {
        float _3877 = -_1609;
        float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3881 = -_1611;
        float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3885 = -_1613;
        float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3889 = _3879 * _3879;
        float _3891 = fma(_3883, _3883, _3889);
        float _3893 = fma(_3887, _3887, _3891);
        float _3895 = sqrt(_3893);
        float _3897 = rsqrt(_3893);
        float _3899 = -_3895;
        float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3903 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3905 = precise::clamp(_3903, 0.0, 1.0);
        float _3907 = _3883 * _3897;
        float _3909 = _3879 * _3897;
        float _3911 = abs(_3905);
        float _3913 = log2(_3911);
        float _3915 = _3887 * _3897;
        float _3917 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3919 = _3573 * _3909;
        float _3921 = -_3909;
        float _3923 = -_3917;
        float _3925 = fma(_3921, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3923);
        float _3927 = fma(_3553, _3907, _3919);
        float _3929 = -_3915;
        float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3925);
        float _3933 = fma(_3577, _3915, _3927);
        float _3935 = precise::clamp(_3933, 0.0, 1.0);
        float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3939 = _3931 + _3937;
        float _3941 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3943 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3945 = precise::clamp(_3943, 0.0, 1.0);
        float _3947 = exp2(_3941);
        float _3949 = _3947 * _3945;
        float _3951 = _3935 * _3949;
        float _3953 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3955 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3957 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3953;
        out.m_98.y = _3955;
        out.m_98.z = _3957;
    }
    out.m_72.x = _3869;
    out.m_72.y = _3871;
    out.m_72.z = _3873;
    if (!_3855)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3959 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3959;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

