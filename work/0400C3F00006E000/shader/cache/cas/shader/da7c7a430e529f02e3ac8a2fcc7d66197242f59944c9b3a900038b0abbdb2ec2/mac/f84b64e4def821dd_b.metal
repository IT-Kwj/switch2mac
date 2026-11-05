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
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3889 = false;
    bool _643 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4188 = as_type<float>(_129);
        out.gl_Position.z = _4188;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_51.w;
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
        float _151 = float(_113);
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
        out.m_49.x = 0.0;
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
        float _4258 = as_type<float>(_167);
        out.gl_Position.z = _4258;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_56.x;
    float _173 = in.m_56.y;
    float _175 = in.m_56.z;
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_175, _181, _217);
    float _225 = fma(_171, _189, _219);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _225);
    bool _231 = !_203;
    float _233 = _183;
    float _235 = _187;
    float _237 = _223;
    float _239 = _227;
    float _257;
    if (!_231)
    {
        float _241 = in.m_64.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_113);
        float _263 = 1.0 / _261;
        float _265 = _147 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    bool _277 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_267);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _267 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _295;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _299;
    float _313 = _303 * _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _271 * _309;
    bool _329 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_267);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -_287;
    float _343 = _341 + 1.0;
    bool _345 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _347 = isnan(_267);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _339 * _343;
    float _359 = _275 * _311;
    float _361 = -_339;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = _355 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -_355;
    float _381 = _379 + 1.0;
    float _383 = fma(_367, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_377, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = _325 * _381;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -_325;
    float _395 = _393 + 1.0;
    float _397 = _385 * _387;
    float _399 = _383 * _387;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_391, _313, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _409 = fma(_371, _313, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _417 = fma(_403, _359, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_405, _373, _407);
    float _421 = fma(_413, _359, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_409, _373, _415);
    float _425 = fma(_417, _357, _419);
    float _427 = fma(_421, _357, _423);
    float _429 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_305;
    float _451;
    if (!_433)
    {
        float _435 = in.m_64.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_113);
        float _457 = 1.0 / _455;
        float _459 = _147 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_461);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _491 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _493 = isnan(_461);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _469;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _505;
    float _509 = -_485;
    float _511 = _509 + 1.0;
    bool _513 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_461);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _527 = 1.0 / _473;
    float _529 = 1.0 / _489;
    float _531 = _507 * _503;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = _501 * _511;
    float _539 = -_501;
    float _541 = _539 + 1.0;
    float _543 = fma(_531, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = _523 * _541;
    float _551 = _535 * _527;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _461 + _553;
    bool _557 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_461);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _543 * _549;
    float _571 = -_523;
    float _573 = _571 + 1.0;
    float _575 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _461 + _577;
    float _581 = _547 * _529;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _589 = fma(_581, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _485 * _585;
    float _593 = fma(_575, _537, _587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _597 = fma(_589, _591, _593);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _601 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = in.m_66.x;
    float _611 = in.m_66.y;
    float _613 = _603 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _607;
    out.m_68.y = _601;
    out.m_68.z = _615;
    out.m_68.w = _613;
    float _617 = _431 * _611;
    float _619 = _429 * _609;
    bool _621 = !_525;
    float _623 = _541;
    float _641;
    if (!_621)
    {
        float _625 = in.m_64.x;
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_113);
        float _647 = 1.0 / _645;
        float _649 = _147 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _655 = int(_653);
    float _657 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _665 = int(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _671 = float(_655);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _675 = int(_673);
    if (_661)
    {
        float _677 = in.m_64.x;
        _623 = _677;
    }
    float _679 = _623;
    float _681 = _679;
    if (!_661)
    {
        float _683 = in.m_64.y;
        _681 = _683;
    }
    float _685 = _681;
    float _687 = float(_665);
    float _689 = 1.0 / _671;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _693 = int(_691);
    float _695 = float(uint(_675));
    int _697 = ~_675;
    int _699 = _697 + 1;
    bool _701 = _675 == 0;
    float _703 = 1.0 / _687;
    float _705 = _689 * _147;
    float _707 = 1.0 / _695;
    float _709 = float(uint(_693));
    int _711 = ~_693;
    int _713 = _711 + 1;
    int _715 = ~_693;
    int _717 = _715 + 1;
    float _719 = trunc(_705);
    int _721 = int(_719);
    float _723 = _703 * _147;
    float _725 = 1.0 / _709;
    int _727 = as_type<int>(_707) + (-2);
    float _729 = in.m_64.x;
    float _731 = in.m_64.y;
    float _733 = in.m_64.z;
    float _735 = in.m_64.w;
    float _737 = trunc(_723);
    int _739 = int(_737);
    float _741 = float(uint(_721));
    float _743 = as_type<float>(_727) * _741;
    float _745 = _741;
    if (_661)
    {
        _745 = 1.0;
    }
    float _747 = _745;
    float _749 = 1.0 / _669;
    int _751 = as_type<int>(_725) + (-2);
    float _753 = _747;
    if (!_661)
    {
        _753 = 7.345489978790283203125;
    }
    float _755 = _753;
    float _757 = trunc(_743);
    float _759 = precise::max(_757, 0.0);
    uint _762 = uint(_759);
    float _764 = float(uint(_739));
    float _766 = float(_739);
    float _768 = as_type<float>(_751) * _764;
    float _770 = _755 * _729;
    float _772 = trunc(_768);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    int _778 = _699 * int(_762);
    int _780 = _778 + _721;
    float _782 = float(_113);
    float _784 = float(uint(_780));
    float _786 = floor(_770);
    int _788 = ~_675;
    int _790 = _788 + 1;
    float _792 = as_type<float>(_727) * _784;
    int _794 = _713 * int(_776);
    int _796 = _794 + _739;
    float _798 = _784;
    if (_661)
    {
        _798 = 1.0;
    }
    float _800 = _798;
    float _802 = _800;
    if (!_661)
    {
        _802 = 1.2345600128173828125;
    }
    float _804 = _802;
    float _806 = 1.0 / _782;
    float _808 = float(uint(_796));
    float _810 = _804 * _685;
    float _812 = float(_721);
    float _814 = as_type<float>(_751) * _808;
    float _816 = float(_675);
    float _818 = trunc(_792);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = -_786;
    float _826 = _770 + _824;
    bool _828 = _812 >= _816;
    bool _830 = isnan(_812);
    bool _832 = _828 || _830;
    bool _834 = isnan(_816);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = trunc(_814);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = int(_762) + int(_822);
    float _848 = floor(_810);
    int _850 = _790 * _846;
    int _852 = _850 + _721;
    float _854 = _826 * _816;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _858 = _856 != 0;
    int _860 = int(_776) + int(_844);
    float _862 = trunc(_838);
    int _864 = int(_862);
    bool _866 = uint(_852) >= uint(_675);
    bool _868 = !_858;
    int _870 = _868 ? 0 : 1;
    int _872 = _717 * _860;
    int _874 = _872 + _739;
    bool _876 = !_866;
    int _878 = _876 ? 0 : (-1);
    float _880 = -_848;
    float _882 = _810 + _880;
    float _884 = trunc(_854);
    int _886 = int(_884);
    int _888 = ~_846;
    int _890 = _888 + _878;
    int _892 = _890 + 1;
    float _894 = _806 * _147;
    int _896 = abs(_870);
    bool _898 = uint(_874) >= uint(_693);
    int _900 = _675 * _892;
    int _902 = _900 + _721;
    int _904 = ~_864;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _920 = _918 != 0;
    bool _922 = !_701;
    int _924 = _922 ? _902 : (-1);
    bool _926 = !_898;
    int _928 = _926 ? 0 : (-1);
    int _930 = _886 * _896;
    int _932 = _930 + _721;
    float _934 = _816 * _894;
    float _936 = float(_693);
    int _938 = _924 * _908;
    bool _940 = !_912;
    int _942 = _940 ? 0 : 1;
    int _944 = ~_860;
    int _946 = _944 + _928;
    int _948 = _946 + 1;
    float _950 = trunc(_934);
    int _952 = int(_950);
    bool _954 = _766 >= _936;
    bool _956 = isnan(_766);
    bool _958 = _954 || _956;
    bool _960 = isnan(_936);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = _936 * _894;
    bool _968 = !_916;
    int _970 = _968 ? 0 : 1;
    int _972 = _693 * _948;
    int _974 = _972 + _739;
    int _976 = _675 + (-1);
    int _978 = abs(_942);
    float _980 = trunc(_964);
    int _982 = int(_980);
    int _984 = abs(_970);
    int _986 = _864 * _976;
    int _988 = _986 + _938;
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    int _994 = _988 * _984;
    int _996 = abs(_992);
    float _998 = _882 * _936;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1002 = _1000 != 0;
    int _1004 = _952 * _978;
    int _1006 = _1004 + _994;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1010 = _1008 != 0;
    bool _1012 = !_1002;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = trunc(_998);
    int _1018 = int(_1016);
    bool _1020 = !_1010;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _932 * _996;
    int _1026 = _1024 + _1006;
    bool _1028 = _693 == 0;
    int _1030 = abs(_1014);
    int _1032 = abs(_1022);
    int _1034 = ~_982;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    bool _1040 = !_1028;
    int _1042 = _1040 ? _974 : (-1);
    int _1044 = _886 * _1032;
    int _1046 = _1044 + _1026;
    int _1048 = _693 + (-1);
    float _1050 = trunc(_966);
    int _1052 = int(_1050);
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1068 = _1066 != 0;
    int _1070 = _1042 * _1038;
    float _1072 = float(uint(_1046));
    int _1074 = _1018 * _1030;
    int _1076 = _1074 + _739;
    bool _1078 = _675 == 0;
    int _1080 = _982 * _1048;
    int _1082 = _1080 + _1070;
    bool _1084 = !_1060;
    int _1086 = _1084 ? 0 : 1;
    float _1088 = as_type<float>(_727) * _1072;
    bool _1090 = !_1056;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = !_1064;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = trunc(_1088);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = abs(_1086);
    int _1106 = abs(_1092);
    bool _1108 = !_1068;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _1082 * _1104;
    int _1114 = abs(_1096);
    int _1116 = abs(_1110);
    int _1118 = _1052 * _1106;
    int _1120 = _1118 + _1112;
    int _1122 = ~_675;
    int _1124 = _1122 + 1;
    int _1126 = _1076 * _1114;
    int _1128 = _1126 + _1120;
    float _1130 = float(uint(_932));
    int _1132 = ~_693;
    int _1134 = _1132 + 1;
    int _1136 = _1018 * _1116;
    int _1138 = _1136 + _1128;
    float _1140 = as_type<float>(_727) * _1130;
    int _1142 = ~_675;
    int _1144 = _1142 + 1;
    float _1146 = float(uint(_1138));
    int _1148 = _1124 * int(_1102);
    int _1150 = _1148 + _1046;
    float _1152 = float(uint(_1076));
    float _1154 = trunc(_1140);
    float _1156 = precise::max(_1154, 0.0);
    uint _1158 = uint(_1156);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1162 = _1160 != 0;
    float _1164 = as_type<float>(_751) * _1146;
    float _1166 = float(uint(_1150));
    float _1168 = as_type<float>(_751) * _1152;
    float _1170 = trunc(_1164);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = as_type<float>(_727) * _1166;
    int _1178 = _984;
    if (_1162)
    {
        _1178 = 0;
    }
    int _1180 = _1178;
    float _1182 = trunc(_1176);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    int _1188 = ~_675;
    int _1190 = _1188 + 1;
    int _1192 = _1134 * int(_1174);
    int _1194 = _1192 + _1138;
    float _1196 = trunc(_1168);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    float _1202 = float(uint(_1194));
    int _1204 = int(_1102) + int(_1186);
    int _1206 = _1144 * int(_1158);
    int _1208 = _1206 + _932;
    float _1210 = as_type<float>(_751) * _1202;
    int _1212 = ~_693;
    int _1214 = _1212 + 1;
    float _1216 = float(uint(_1208));
    int _1218 = _1190 * _1204;
    int _1220 = _1218 + _1046;
    float _1222 = trunc(_1210);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = ~_693;
    int _1230 = _1228 + 1;
    float _1232 = as_type<float>(_727) * _1216;
    bool _1234 = uint(_1220) >= uint(_675);
    int _1236 = _1230 * int(_1200);
    int _1238 = _1236 + _1076;
    bool _1240 = !_1234;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = trunc(_1232);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = float(uint(_1238));
    int _1252 = ~_1204;
    int _1254 = _1252 + _1242;
    int _1256 = _1254 + 1;
    int _1258 = ~_693;
    int _1260 = _1258 + 1;
    float _1262 = as_type<float>(_751) * _1250;
    int _1264 = int(_1174) + int(_1226);
    int _1266 = _675 * _1256;
    int _1268 = _1266 + _1046;
    float _1270 = trunc(_1262);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    bool _1276 = !_1078;
    int _1278 = _1276 ? _1268 : (-1);
    int _1280 = _1260 * _1264;
    int _1282 = _1280 + _1138;
    int _1284 = int(_1158) + int(_1248);
    int _1286 = _1278 & 3;
    bool _1288 = _1286 != 0;
    int _1290 = _1278 & 3;
    bool _1292 = _1290 != 0;
    bool _1294 = uint(_1282) >= uint(_693);
    int _1296 = _1288 ? 0 : 1;
    bool _1298 = uint(_1290) > 1u;
    bool _1300 = uint(_1290) >= 2u;
    bool _1302 = !_1294;
    int _1304 = _1302 ? 0 : (-1);
    int _1306 = _1300 ? 0 : 1;
    bool _1308 = _1290 != 3;
    int _1310 = ~_1264;
    int _1312 = _1310 + _1304;
    int _1314 = _1312 + 1;
    int _1316 = ~_1296;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _1320;
    int _1324 = _1180;
    if (!_1298)
    {
        int _1326 = ~_1296;
        int _1328 = _1326 + 1;
        _1322 = _1328;
    }
    int _1330 = _1322;
    int _1332 = _693 * _1314;
    int _1334 = _1332 + _1138;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1338 = _1336 != 0;
    int _1340 = ~_675;
    int _1342 = _1340 + 1;
    bool _1344 = !_1338;
    int _1346 = _1344 ? 0 : 1;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1350 = _1348 != 0;
    int _1352 = _1342 * _1284;
    int _1354 = _1352 + _932;
    bool _1356 = !_1028;
    int _1358 = _1356 ? _1334 : (-1);
    int _1360 = ~_1306;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    int _1366 = _1364;
    if (_1308)
    {
        int _1368 = ~_1306;
        int _1370 = _1368 + 1;
        _1366 = _1370;
    }
    int _1372 = _1366;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1376 = _1374 != 0;
    int _1378 = _1358 & 3;
    bool _1380 = _1378 != 0;
    bool _1382 = uint(_1354) >= uint(_675);
    bool _1384 = !_1376;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = in.m_46.x;
    float _1390 = in.m_46.y;
    float _1392 = in.m_46.z;
    bool _1394 = uint(_1378) > 1u;
    bool _1396 = !_1382;
    int _1398 = _1396 ? 0 : (-1);
    if (!_1350)
    {
        _1324 = 1;
    }
    int _1400 = _1324;
    int _1402 = int(_1200) + int(_1274);
    int _1404 = _1358 & 3;
    bool _1406 = _1404 != 0;
    bool _1408 = _1378 != 3;
    int _1410 = _1214 * _1402;
    int _1412 = _1410 + _1076;
    int _1414 = ~_1284;
    int _1416 = _1414 + _1398;
    int _1418 = _1416 + 1;
    int _1420 = _1406 ? 0 : 1;
    bool _1422 = uint(_1378) >= 2u;
    int _1424 = _675 * _1418;
    int _1426 = _1424 + _932;
    int _1428 = ~_1420;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    int _1434 = _1422 ? 0 : 1;
    int _1436 = _1432;
    if (!_1394)
    {
        int _1438 = ~_1420;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = _185 * _1390;
    bool _1446 = uint(_1412) >= uint(_693);
    float _1448 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1450 = log2(_1448);
    bool _1452 = !_1078;
    int _1454 = _1452 ? _1426 : (-1);
    float _1456 = _179 * _1390;
    bool _1458 = _735 > 0.5;
    float _1460 = _191 * _1390;
    bool _1462 = _729 > 0.5;
    float _1464 = fma(_177, _1388, _1456);
    int _1466 = ~_1434;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    float _1472 = _731 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1474 = fma(_189, _1388, _1460);
    int _1476 = _1470;
    if (_1408)
    {
        int _1478 = ~_1434;
        int _1480 = _1478 + 1;
        _1476 = _1480;
    }
    int _1482 = _1476;
    float _1484 = _729 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1486 = !_1292;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = fma(_183, _1388, _1444);
    bool _1492 = !_1446;
    int _1494 = _1492 ? 0 : (-1);
    float _1496 = _1450 * _147;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1500 = _1498 != 0;
    float _1502 = fma(_181, _1392, _1464);
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1506 = _1504 != 0;
    float _1508 = fma(_187, _1392, _1490);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1512 = _1510 != 0;
    float _1514 = exp2(_1496);
    float _1516 = -_207;
    int _1518 = _1462 ? as_type<int>(_1516) : as_type<int>(_207);
    float _1520 = fma(_193, _1392, _1474);
    int _1522 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1524 = _1522 != 0;
    float _1526 = _729 * 2.0;
    bool _1528 = !_1524;
    float _1530 = _1528 ? _207 : as_type<float>(_1518);
    bool _1532 = _733 > 0.5;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1536 = floor(_1526);
    float _1538 = -_207;
    int _1540 = _1532 ? as_type<int>(_1538) : as_type<int>(_207);
    float _1542 = fma(_1472, -2.0, _1534);
    bool _1544 = _1400 != 1;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1548 = -_1546;
    float _1550 = fma(_1484, 2.0, _1548);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1558 = _1484;
    float _1560 = _1552;
    if (!_1544)
    {
        _233 = _731;
    }
    float _1562 = _233;
    float _1564 = _1562;
    if (!_1544)
    {
        _1558 = _733;
    }
    float _1566 = _1558;
    float _1568 = _1566;
    if (_1544)
    {
        _1564 = _729;
    }
    float _1570 = _1564;
    if (_1544)
    {
        _1568 = _731;
    }
    float _1572 = _1568;
    if (!_1544)
    {
        _235 = _731;
    }
    float _1574 = _235;
    float _1576 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1552);
    float _1578 = _1574;
    if (_1544)
    {
        _1578 = _729;
    }
    float _1580 = _1578;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1554);
    float _1584 = -_1514;
    float _1586 = _1584 + 1.0;
    if (!_1544)
    {
        _1560 = _733;
    }
    float _1588 = _1560;
    float _1590 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1576);
    float _1592 = _1588;
    if (_1544)
    {
        _1592 = _731;
    }
    float _1594 = _1592;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1598 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1600 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1608 = _1604 || _1606;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1612 = -_1596;
    float _1614 = fma(_1598, 2.0, _1612);
    int _1616 = _1278 >> 31;
    float _1618 = fma(_1610, -2.0, _1556);
    int _1620 = _1358 >> 31;
    float _1622 = -_147;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1614);
    int _1626 = _1616 & 3;
    float _1628 = _1608 ? _1586 : 0.0;
    bool _1630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1632 = isnan(1.0);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1638 = _1634 || _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1642 = 1.0 + _1640;
    int _1644 = _1278 + _1626;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1648 = _1620 & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1652 = _731 * 2.0;
    float _1654 = 1.0 / _1642;
    int _1656 = _1358 + _1648;
    float _1658 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1646);
    int _1660 = _1644 >> 2;
    float _1662 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1650);
    int _1664 = _1656 >> 2;
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1542);
    int _1668 = _1660 << 4;
    int _1670 = _1668 + 368;
    float _1672 = -_147;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1550);
    int _1676 = _1664 << 4;
    int _1678 = _1676 + 512;
    float _1680 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1658);
    uint _1682 = uint(int(uint(_1670) >> uint(2)));
    uint _1684 = uint(int(uint(int(_1682)) >> uint(2)));
    int _1686 = int(_1682) & 3;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[int(_1684)][_1686];
    int _1690 = int(_1682) + 1;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    int _1694 = _1690 & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    float _1698 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    float _1700 = floor(_1652);
    float _1702 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1582);
    float _1704 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1618);
    int _1706 = as_type<int>(_1698);
    if (_1638)
    {
        float _1708 = _1628 * _1654;
        _149 = _1708;
    }
    float _1710 = _149;
    float _1712 = _729 + _731;
    bool _1714 = !_1380;
    int _1716 = _1714 ? 0 : 1;
    float _1718 = -_1702;
    float _1720 = _1718 + 1.0;
    bool _1722 = _1536 > 0.0;
    uint _1724 = uint(int(uint(_1678) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    bool _1740 = _1536 >= 0.0;
    bool _1742 = isnan(_1536);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.0);
    bool _1748 = _1744 || _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1750;
    float _1754 = _1712 + (-1.0);
    int _1756 = _1748 ? 0 : 1;
    float _1758 = _1752 * _749;
    bool _1760 = _1700 >= 0.0;
    bool _1762 = isnan(_1700);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    int _1770 = _1670 + 8;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[int(_1782)][_1784];
    float _1788 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1790 = ~_1402;
    int _1792 = _1790 + _1494;
    int _1794 = _1792 + 1;
    int _1796 = _1768 ? 0 : 1;
    bool _1798 = _1700 > 0.0;
    float _1800 = _733 + _731;
    int _1802 = _1678 + 8;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
    int _1808 = int(_1804) & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    int _1812 = int(_1804) + 1;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    int _1816 = _1812 & 3;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[int(_1814)][_1816];
    int _1820 = ~_1756;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = _693 * _1794;
    int _1828 = _1826 + _1076;
    float _1830 = _1800 + (-1.0);
    int _1832 = _1824;
    if (!_1722)
    {
        int _1834 = ~_1756;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    bool _1840 = _1290 != 3;
    float _1842 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1844 = abs(_1330);
    int _1846 = abs(_1442);
    float _1848 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1850 = int(_1848);
    int _1852 = ~_1796;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    int _1858 = _1856;
    if (!_1798)
    {
        int _1860 = ~_1796;
        int _1862 = _1860 + 1;
        _1858 = _1862;
    }
    int _1864 = _1858;
    int _1866 = ~_1844;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = _1378 != 3;
    int _1874 = abs(_1488);
    int _1876 = _1870 * as_type<int>(_1696);
    int _1878 = abs(_1716);
    int _1880 = abs(_1372);
    int _1882 = ~_1846;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    int _1888 = ~_1874;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = ~_1878;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = _1886 * as_type<int>(_1738);
    int _1902 = _1892 * as_type<int>(_1688);
    int _1904 = _1902 + _1876;
    bool _1906 = !_1840;
    int _1908 = _1906 ? 0 : (-1);
    int _1910 = _1898 * as_type<int>(_1730);
    int _1912 = _1910 + _1900;
    int _1914 = abs(_1482);
    float _1916 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1918 = int(_1916);
    int _1920 = ~_1880;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = abs(_1908);
    int _1928 = _1924 * as_type<int>(_1778);
    int _1930 = _1928 + _1904;
    float _1932 = in.m_60.w;
    int _1934 = ~_1914;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = ~_1926;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = float(uint(_1850));
    int _1948 = _1938 * as_type<int>(_1810);
    int _1950 = _1948 + _1912;
    bool _1952 = !_1872;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = _1944 * as_type<int>(_1786);
    int _1958 = _1956 + _1930;
    int _1960 = abs(_1346);
    float _1962 = 1.0 / _1946;
    float _1964 = _733 * 2.0;
    int _1966 = abs(_1954);
    float _1968 = in.m_58.w;
    float _1970 = float(uint(_1918));
    float _1972 = floor(_1964);
    int _1974 = abs(_1386);
    int _1976 = abs(_1850);
    float _1978 = _1508 + _1932;
    int _1980 = ~_1960;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = 1.0 / _1970;
    int _1988 = ~_1966;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = abs(_1918);
    int _1996 = _1958 * _1984;
    bool _1998 = !_1028;
    int _2000 = _1998 ? _1828 : (-1);
    int _2002 = _1992 * as_type<int>(_1818);
    int _2004 = _2002 + _1950;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2008 = _2006 != 0;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2012 = _2010 != 0;
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2016 = _2014 != 0;
    int _2018 = _1454 * _1960;
    int _2020 = _2018 + _1996;
    float _2022 = float(uint(_1976));
    int _2024 = ~_1974;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _1502 + _1968;
    float _2032 = 1.0 / _2022;
    int _2034 = as_type<int>(_1962) + (-2);
    int _2036 = _2004 * _2028;
    float _2038 = float(uint(_1994));
    float _2040 = float(uint(_2020));
    int _2042 = _2000 * _1974;
    int _2044 = _2042 + _2036;
    bool _2046 = !_2012;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2052 = _651 + _2050;
    bool _2054 = _1972 >= 0.0;
    bool _2056 = isnan(_1972);
    bool _2058 = _2054 || _2056;
    bool _2060 = isnan(0.0);
    bool _2062 = _2058 || _2060;
    float _2064 = 1.0 / _2038;
    float _2066 = as_type<float>(_2034) * _2040;
    int _2068 = as_type<int>(_1986) + (-2);
    float _2070 = fma(_1758, _2052, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2072 = _2062 ? 0 : 1;
    float _2074 = float(uint(_2044));
    bool _2076 = _1972 > 0.0;
    float _2078 = trunc(_2066);
    float _2080 = precise::max(_2078, 0.0);
    uint _2082 = uint(_2080);
    int _2084 = abs(_2020);
    float _2086 = as_type<float>(_2068) * _2074;
    int _2088 = as_type<int>(_2032) + (-2);
    float _2090 = float(uint(_2084));
    int _2092 = abs(_2044);
    float _2094 = trunc(_2086);
    float _2096 = precise::max(_2094, 0.0);
    uint _2098 = uint(_2096);
    int _2100 = as_type<int>(_2064) + (-2);
    float _2102 = as_type<float>(_2088) * _2090;
    float _2104 = float(uint(_2092));
    int _2106 = ~_1850;
    int _2108 = _2106 + 1;
    int _2110 = ~_1918;
    int _2112 = _2110 + 1;
    float _2114 = trunc(_2102);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = as_type<float>(_2100) * _2104;
    int _2122 = _2108 * int(_2082);
    int _2124 = _2122 + _2020;
    int _2126 = ~_1976;
    int _2128 = _2126 + 1;
    int _2130 = ~_1994;
    int _2132 = _2130 + 1;
    float _2134 = float(uint(_2124));
    float _2136 = trunc(_2120);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    int _2142 = _2112 * int(_2098);
    int _2144 = _2142 + _2044;
    bool _2146 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2148 = isnan(_651);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = as_type<float>(_2034) * _2134;
    bool _2160 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2162 = isnan(_651);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = float(uint(_2144));
    int _2174 = _2128 * int(_2118);
    int _2176 = _2174 + _2084;
    float _2178 = -_2156;
    float _2180 = _2178 + 1.0;
    float _2182 = trunc(_2158);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    int _2188 = abs(_2048);
    float _2190 = as_type<float>(_2068) * _2172;
    float _2192 = float(uint(_2176));
    float _2194 = in.m_62.w;
    float _2196 = _2170 * _2180;
    int _2198 = _2132 * int(_2140);
    int _2200 = _2198 + _2092;
    float _2202 = -_2170;
    float _2204 = _2202 + 1.0;
    float _2206 = as_type<float>(_2088) * _2192;
    float _2208 = _2070 * _2196;
    float _2210 = trunc(_2190);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = float(uint(_2200));
    float _2218 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2208);
    float _2220 = float(_1838);
    float _2222 = as_type<float>(_2100) * _2216;
    float _2224 = trunc(_2206);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    int _2230 = ~_1850;
    int _2232 = _2230 + 1;
    float _2234 = float(_2188);
    int _2236 = int(_2082) + int(_2186);
    int _2238 = ~_2072;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = trunc(_2222);
    float _2246 = precise::max(_2244, 0.0);
    uint _2248 = uint(_2246);
    int _2250 = _2242;
    if (!_2076)
    {
        int _2252 = ~_2072;
        int _2254 = _2252 + 1;
        _2250 = _2254;
    }
    int _2256 = _2250;
    float _2258 = _1520 + _2194;
    float _2260 = _2234 * _2220;
    int _2262 = _2232 * _2236;
    int _2264 = _2262 + _2020;
    float _2266 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2218);
    int _2268 = int(_2098) + int(_2214);
    bool _2270 = !_2008;
    int _2272 = _2270 ? 0 : 1;
    int _2274 = ~_1918;
    int _2276 = _2274 + 1;
    bool _2278 = uint(_2264) >= uint(_1850);
    int _2280 = _2276 * _2268;
    int _2282 = _2280 + _2044;
    int _2284 = int(_2118) + int(_2228);
    int _2286 = abs(_2272);
    int _2288 = int(_2140) + int(_2248);
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2292 = ~_1976;
    int _2294 = _2292 + 1;
    int _2296 = ~_1994;
    int _2298 = _2296 + 1;
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2302 = _2294 * _2284;
    int _2304 = _2302 + _2084;
    float _2306 = float(_2256);
    float _2308 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2310 = float(_2286);
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2314 = !_2278;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2320 = uint(_2282) >= uint(_1918);
    int _2322 = _2298 * _2288;
    int _2324 = _2322 + _2092;
    float _2326 = _2310 * _2306;
    bool _2328 = !_1512;
    float _2330 = _2328 ? _207 : as_type<float>(_1540);
    float _2332 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2334 = !_2320;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2340 = uint(_2304) >= uint(_1976);
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2344 = _1978 + _2342;
    bool _2346 = uint(_2324) >= uint(_1994);
    float _2348 = _2326 * (-2.0);
    int _2350 = ~_2236;
    int _2352 = _2350 + _2316;
    int _2354 = _2352 + 1;
    out.m_70.x = _2332;
    out.m_70.y = _2338;
    out.m_70.z = _2300;
    out.m_70.w = _2308;
    int _2356 = ~_2268;
    int _2358 = _2356 + _2336;
    int _2360 = _2358 + 1;
    float _2362 = fma(_1788, _2348, _1788);
    bool _2364 = !_2340;
    int _2366 = _2364 ? 0 : (-1);
    float _2368 = in.m_72.x;
    float _2370 = in.m_72.y;
    float _2372 = in.m_72.z;
    bool _2374 = !_2346;
    int _2376 = _2374 ? 0 : (-1);
    int _2378 = _1918 * _2360;
    int _2380 = _2378 + _2044;
    bool _2382 = _1850 == 0;
    bool _2384 = _1850 == 0;
    int _2386 = ~_2366;
    int _2388 = _2284 + _2386;
    int _2390 = _2388 + 1;
    int _2392 = ~_2376;
    int _2394 = _2288 + _2392;
    int _2396 = _2394 + 1;
    float _2398 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2400 = _2020 ^ _1850;
    int _2402 = _1850 * _2354;
    int _2404 = _2402 + _2020;
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2408 = _2030 + _2406;
    uint _2410 = uint(int(uint(_2400) >> uint(31)));
    float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2398);
    bool _2414 = !_2382;
    int _2416 = _2414 ? _2404 : (-1);
    float _2418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2420 = ~int(_2410);
    int _2422 = _2420 + 1;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2426 = _2258 + _2424;
    bool _2428 = _1918 == 0;
    int _2430 = _2390 ^ _2422;
    float _2432 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2412);
    float _2434 = float(_2416);
    float _2436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2438 = ~_2422;
    int _2440 = _2438 + _2430;
    int _2442 = _2440 + 1;
    bool _2444 = !_2428;
    int _2446 = _2444 ? _2380 : (-1);
    bool _2448 = _2432 >= 0.0;
    float _2450 = fma(_2348, _2368, _2368);
    bool _2452 = !_2384;
    int _2454 = _2452 ? _2442 : (-1);
    float _2456 = _2260 * (-2.0);
    int _2458 = _2044 ^ _1918;
    float _2460 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2462 = _1918 == 0;
    float _2464 = _729 + (-0.5);
    uint _2466 = uint(int(uint(_2458) >> uint(31)));
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2470 = fma(_2456, _2370, _2370);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    int _2474 = ~int(_2466);
    int _2476 = _2474 + 1;
    float _2478 = fma(_2460, _2434, _1674);
    float _2480 = _1530 + 0.5;
    float _2482 = fma(_1842, _2456, _1842);
    int _2484 = _2396 ^ _2476;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2488 = float(_2446);
    float _2490 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2492 = ~_2476;
    int _2494 = _2492 + _2484;
    int _2496 = _2494 + 1;
    float _2498 = _2330 + 0.5;
    float _2500 = fma(_2460, _2480, _2478);
    float _2502 = fma(_2490, _2488, _1624);
    bool _2504 = !_2462;
    int _2506 = _2504 ? _2496 : (-1);
    float _2508 = _2344 * _2344;
    bool _2510 = _731 > 0.5;
    float _2512 = fma(_2490, _2498, _2502);
    float _2514 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2516 = -_211;
    int _2518 = _1458 ? as_type<int>(_2516) : as_type<int>(_211);
    float _2520 = fma(_2362, _1710, _2472);
    float _2522 = -_211;
    int _2524 = _2510 ? as_type<int>(_2522) : as_type<int>(_211);
    float _2526 = _2500;
    if (_2448)
    {
        out.m_49.x = 0.0;
    }
    bool _2528 = !_1500;
    float _2530 = _2528 ? _211 : as_type<float>(_2518);
    float _2532 = -_1680;
    float _2534 = _2532 + 1.0;
    bool _2536 = !_1506;
    float _2538 = _2536 ? _211 : as_type<float>(_2524);
    float _2540 = fma(_2408, _2408, _2508);
    float _2542 = float(_2506);
    float _2544 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2546 = float(_2454);
    float _2548 = fma(_2426, _2426, _2540);
    float _2550 = -_2534;
    float _2552 = fma(_1530, _2550, _2500);
    float _2554 = -_1704;
    float _2556 = fma(_2544, _2542, _2554);
    float _2558 = _2538 + (-0.5);
    float _2560 = rsqrt(_2548);
    float _2562 = -_1666;
    float _2564 = fma(_2514, _2546, _2562);
    float _2566 = _2530 + (-0.5);
    if (_2448)
    {
        _2526 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2568 = _2526;
    float _2570 = -_2514;
    float _2572 = fma(_2570, _2558, _2564);
    float _2574 = -_1590;
    float _2576 = _2574 + 1.0;
    float _2578 = -_1698;
    float _2580 = _2578 + 1.0;
    float _2582 = -_2544;
    float _2584 = fma(_2582, _2566, _2556);
    float _2586 = -_2576;
    float _2588 = fma(_2330, _2586, _2512);
    float _2590 = fma(_2538, _2580, _2572);
    if (_2448)
    {
        float _2592 = _2568 * 5.0;
        _1706 = as_type<int>(_2592);
    }
    int _2594 = _1706;
    float _2596 = fma(_2530, _1720, _2584);
    float _2598 = _657 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2600 = !_2016;
    int _2602 = _2600 ? 0 : 1;
    float _2604 = _731 + (-0.5);
    if (_2448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7754 = as_type<float>(_2594);
        out.gl_Position.z = _7754;
    }
    float _2606 = _2598 * _2560;
    int _2608 = abs(_2602);
    out.m_74.x = _2552;
    out.m_74.y = _2590;
    out.m_74.z = _2588;
    out.m_74.w = _2596;
    float _2610 = _2408 * _2606;
    float _2612 = _2344 * _2606;
    if (_2448)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2614 = -_2612;
    float _2616 = _1978 + _2614;
    float _2618 = _2426 * _2606;
    float _2620 = -_2610;
    float _2622 = _2030 + _2620;
    float _2624 = float(_1864);
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2628 = _2616 + _2626;
    float _2630 = -_2618;
    float _2632 = _2258 + _2630;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2622 + _2634;
    float _2638 = -_2612;
    float _2640 = _2344 + _2638;
    float _2642 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2644 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2646 = _2632 + _2644;
    float _2648 = float(_2608);
    float _2650 = fma(_2604, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2470);
    float _2652 = fma(_2636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2642);
    float _2654 = -_2610;
    float _2656 = _2408 + _2654;
    float _2658 = _2640 * _2640;
    float _2660 = fma(_2482, _1710, _2650);
    float _2662 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2652);
    float _2664 = _733 + _729;
    float _2666 = _2648 * _2624;
    float _2668 = fma(_2656, _2656, _2658);
    float _2670 = -_2618;
    float _2672 = _2426 + _2670;
    bool _2674 = _2662 >= 0.0;
    float _2676 = _2660 * 0.15915493667125701904296875;
    float _2678 = _2664 + (-1.0);
    float _2680 = _2666 * (-2.0);
    float _2682 = _2520 * 0.15915493667125701904296875;
    float _2684 = fma(_2672, _2672, _2668);
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2688 = _2676 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = _733 + (-0.5);
    float _2694 = fma(_2680, _2372, _2372);
    float _2696 = fma(_2686, _2680, _2686);
    float _2698 = _2656;
    int _2700 = as_type<int>(_2692);
    if (_2674)
    {
        _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2702 = _2698;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2694);
    float _2706 = _2682 * 6.283185482025146484375;
    float _2708 = sin(_2706);
    if (_2674)
    {
        out.m_49.x = 0.0;
    }
    if (_2674)
    {
        float _2710 = _2702 * 5.0;
        _2700 = as_type<int>(_2710);
    }
    int _2712 = _2700;
    float _2714 = fma(_2696, _1710, _2704);
    if (_2674)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7945 = as_type<float>(_2712);
        out.gl_Position.z = _7945;
    }
    float _2716 = _2682 * 6.283185482025146484375;
    float _2718 = cos(_2716);
    float _2720 = _2714 * 0.15915493667125701904296875;
    float _2722 = sqrt(_2684);
    float _2724 = _2676 * 6.283185482025146484375;
    float _2726 = cos(_2724);
    if (_2674)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2728 = _2720 * 6.283185482025146484375;
    float _2730 = cos(_2728);
    float _2732 = _2560 * _2722;
    float _2734 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2738 = _2708 * _2690;
    float _2740 = _657 * _2732;
    float _2742 = _2732 * _2734;
    float _2744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2746 = _2720 * 6.283185482025146484375;
    float _2748 = sin(_2746);
    float _2750 = _2718 * _2690;
    float _2752 = _2736 * _2742;
    float _2754 = _2718 * _2726;
    float _2756 = _2708 * _2726;
    float _2758 = _2744 * _2740;
    float _2760 = _2718 * _2730;
    float _2762 = _2726 * _2730;
    float _2764 = _2708 * _2730;
    float _2766 = _2690 * _2730;
    float _2768 = _2760 * _2752;
    float _2770 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2772 = _2770 * 0.5;
    float _2774 = fma(_2748, _2754, _2738);
    float _2776 = -_2756;
    float _2778 = fma(_2748, _2750, _2776);
    float _2780 = -_2752;
    float _2782 = _2748 * _2780;
    float _2784 = -_2750;
    float _2786 = fma(_2748, _2756, _2784);
    float _2788 = fma(_2774, _2758, _2768);
    float _2790 = _2764 * _2752;
    float _2792 = fma(_2762, _2758, _2782);
    float _2794 = fma(_2748, _2738, _2754);
    float _2796 = fma(_2778, _2772, _2788);
    float _2798 = fma(_2786, _2758, _2790);
    float _2800 = fma(_2766, _2772, _2792);
    float _2802 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2804 = fma(_2794, _2772, _2798);
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2808 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2802);
    float _2810 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2806);
    float _2812 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2808);
    float _2814 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2810);
    float _2816 = _2812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2818 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2820 = _2814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2822 = _2258 + _2816;
    float _2824 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2818);
    float _2826 = _2030 + _2820;
    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2830 = _2822 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2834 = _2826 + _2832;
    float _2836 = _2830 * _2830;
    float _2838 = fma(_2834, _2834, _2836);
    float _2840 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2842 = sqrt(_2838);
    float _2844 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2840);
    float _2846 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2824);
    float _2848 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2844);
    float _2850 = _2848 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2852 = _1978 + _2850;
    bool _2854 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = _2850;
    float _2858 = _2824;
    float _2860 = _2826;
    if (!_2854)
    {
        _2856 = _2826;
    }
    float _2862 = _2856;
    float _2864 = _2862;
    if (!_2854)
    {
        _2858 = _2822;
    }
    float _2866 = _2858;
    float _2868 = _2866;
    if (!_2854)
    {
        _2860 = _2852;
    }
    float _2870 = _2860;
    bool _2872 = !_2854;
    float _2874 = _2870;
    if (!_2872)
    {
        float _2876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2880 = _2842 + _2878;
        float _2882 = rsqrt(_2838);
        float _2884 = _2880 * _2876;
        float _2886 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2888 = _2884 * 0.15915493667125701904296875;
        float _2890 = _2888 * 6.283185482025146484375;
        float _2892 = cos(_2890);
        float _2894 = _2888 * 6.283185482025146484375;
        float _2896 = sin(_2894);
        float _2898 = _2892 + (-1.0);
        float _2900 = fma(_2896, _2886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2902 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2904 = _2882 * _2900;
        float _2906 = fma(_2852, _2892, _2902);
        float _2908 = fma(_2834, _2904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2910 = fma(_2830, _2904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2874 = _2906;
        _2864 = _2908;
        _2868 = _2910;
    }
    float _2912 = _2874;
    float _2914 = _2864;
    float _2916 = _2868;
    float _2918 = -_1978;
    float _2920 = _2918 + _2912;
    float _2922 = -_2030;
    float _2924 = _2922 + _2914;
    float _2926 = -_2258;
    float _2928 = _2926 + _2916;
    float _2930 = _2846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2932 = _2920 * _2920;
    float _2934 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2936 = 1.0 / _2930;
    float _2938 = fma(_2924, _2924, _2932);
    float _2940 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2934);
    bool _2942 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2944 = isnan(0.5);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2950 = _2946 || _2948;
    float _2952 = fma(_2928, _2928, _2938);
    float _2954 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2940);
    bool _2956 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2958 = isnan(0.5);
    bool _2960 = _2956 || _2958;
    bool _2962 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2964 = _2960 || _2962;
    float _2966 = sqrt(_2952);
    float _2968 = _2954 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2970 = _2968 + _2930;
    float _2972 = _2970 * _2936;
    float _2974 = _2972 * 0.5;
    bool _2976 = _2966 > 0.0;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2980 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2978);
    float _2982 = 1.0 / _2980;
    float _2984 = _2930;
    float _2986 = _2974;
    float _2988 = _2936;
    if (!_2976)
    {
        _2984 = _2914;
    }
    float _2990 = _2984;
    float _2992 = _2990;
    if (!_2976)
    {
        _2986 = _2912;
    }
    float _2994 = _2986;
    float _2996 = _2994;
    if (!_2976)
    {
        _2988 = _2916;
    }
    float _2998 = _2988;
    bool _3000 = !_2976;
    float _3002 = _2998;
    float _3004 = _2998;
    if (!_3000)
    {
        float _3006 = _227 * _227;
        float _3008 = rsqrt(_2952);
        float _3010 = fma(_223, _223, _3006);
        float _3012 = fma(_229, _229, _3010);
        float _3014 = sqrt(_3012);
        float _3016 = _2924 * _3008;
        float _3018 = _2920 * _3008;
        float _3020 = _2928 * _3008;
        bool _3022 = _3014 > 0.0;
        float _3024 = _3014;
        float _3026 = _3010;
        if (!_3022)
        {
            _3024 = _2914;
        }
        float _3028 = _3024;
        _2992 = _3028;
        if (!_3022)
        {
            _3026 = _2912;
        }
        float _3030 = _3026;
        _2996 = _3030;
        if (!_3022)
        {
            _3002 = _2916;
        }
        float _3032 = _3002;
        bool _3034 = !_3022;
        _3004 = _3032;
        if (!_3034)
        {
            float _3036 = rsqrt(_3012);
            float _3038 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3040 = _227 * _3036;
            float _3042 = _223 * _3036;
            float _3044 = _3018 * _3040;
            float _3046 = _229 * _3036;
            float _3048 = fma(_3016, _3042, _3044);
            float _3050 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3052 = fma(_3020, _3046, _3048);
            float _3054 = _3052 * _3050;
            float _3056 = fma(_223, _3054, _2914);
            float _3058 = fma(_227, _3054, _2912);
            float _3060 = fma(_229, _3054, _2916);
            _2992 = _3056;
            _2996 = _3058;
            _3004 = _3060;
        }
    }
    float _3062 = _2992;
    float _3064 = _2996;
    float _3066 = _3004;
    float _3068 = -_2610;
    float _3070 = _3068 + _3062;
    float _3072 = -_2612;
    float _3074 = _3072 + _3064;
    float _3076 = -_2618;
    float _3078 = _3076 + _3066;
    float _3080 = _3074;
    float _3082 = _3070;
    float _3084 = _3078;
    float _3086 = _3064;
    if (_2964)
    {
        _237 = 1.0;
    }
    float _3088 = _237;
    float _3090 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3092 = _2982 * _3090;
    float _3094 = _3088;
    if (!_2950)
    {
        float _3096 = _2628 * _2628;
        float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3100 = -_2258;
        float _3102 = _3100 + _3066;
        float _3104 = -_1978;
        float _3106 = _3104 + _3064;
        float _3108 = fma(_2636, _2636, _3096);
        float _3110 = fma(_2646, _2646, _3108);
        float _3112 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3114 = sqrt(_3110);
        float _3116 = 1.0 / _2732;
        float _3118 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3120 = precise::min(_3114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3122 = _3120 * _3098;
        float _3124 = _3122 * _3116;
        float _3126 = -_2030;
        float _3128 = _3126 + _3062;
        float _3130 = _3118 * _3124;
        float _3132 = _3102 * _3124;
        float _3134 = fma(_3106, _3130, _2616);
        float _3136 = fma(_3128, _3130, _2622);
        float _3138 = fma(_3118, _3132, _2632);
        _3080 = _3134;
        _3082 = _3136;
        _3084 = _3138;
        _239 = _3124;
    }
    float _3140 = _3080;
    float _3142 = _3082;
    float _3144 = _3084;
    float _3146 = _239;
    float _3148 = _3146;
    if (!_2964)
    {
        float _3150 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3152 = _3150 * 0.15915493667125701904296875;
        float _3154 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3158 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3156;
        float _3160 = _3152 * 6.283185482025146484375;
        float _3162 = cos(_3160);
        float _3164 = _3154 * 0.15915493667125701904296875;
        float _3166 = _3152 * 6.283185482025146484375;
        float _3168 = sin(_3166);
        float _3170 = 1.0 / _3162;
        float _3172 = _3164 * 6.283185482025146484375;
        float _3174 = cos(_3172);
        float _3176 = _3168 * _3170;
        float _3178 = _3164 * 6.283185482025146484375;
        float _3180 = sin(_3178);
        float _3182 = _3174 * _3176;
        float _3184 = 1.0 / _3158;
        float _3186 = 1.0 / _3182;
        float _3188 = _3180 * _3186;
        float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3192 = fma(_3092, _3188, _3190);
        float _3194 = _3192 * _3184;
        float _3196 = precise::clamp(_3194, 0.0, 1.0);
        _3148 = _3164;
        _3086 = _3152;
        _3094 = _3196;
    }
    float _3198 = _3148;
    float _3200 = _3086;
    float _3202 = _3094;
    float _3204 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3206 = _3140 + _3204;
    float _3208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3210 = _3142 + _3208;
    float _3212 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3214 = _3144 + _3212;
    float _3216 = _3206 * _3206;
    float _3218 = fma(_3210, _3210, _3216);
    float _3220 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3222 = fma(_3214, _3214, _3218);
    float _3224 = rsqrt(_3222);
    float _3226 = sqrt(_3222);
    float _3228 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3230 = _3210 * _3228;
    float _3232 = _3214 * _3228;
    float _3234 = _3230 * _3230;
    float _3236 = _3232 * _3232;
    float _3238 = _3234 + _3236;
    float _3240 = sqrt(_3238);
    bool _3242 = _3240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3246 = _3240 + _3244;
    float _3248 = _3224;
    float _3250 = _3246;
    float _3252 = _3198;
    float _3254 = _3206;
    float _3256 = _3238;
    if (_3242)
    {
        float _3258 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3248 = _3258;
    }
    float _3260 = _3248;
    float _3262 = _3260;
    if (_3242)
    {
        float _3264 = _3246 * _3260;
        _3250 = _3264;
    }
    float _3266 = _3250;
    if (_3242)
    {
        float _3268 = rsqrt(_3238);
        _3262 = _3268;
    }
    float _3270 = _3262;
    float _3272 = _3270;
    if (_3242)
    {
        float _3274 = _3266 * 0.15915493667125701904296875;
        _3252 = _3274;
    }
    float _3276 = _3252;
    float _3278 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3280 = _3214;
    float _3282 = _3276;
    if (_3242)
    {
        float _3284 = _3276 * 6.283185482025146484375;
        float _3286 = sin(_3284);
        _3280 = _3286;
    }
    float _3288 = _3280;
    float _3290 = precise::max(0.0, _3278);
    float _3292 = _3200;
    float _3294 = _3290;
    if (_3242)
    {
        float _3296 = _3276 * 6.283185482025146484375;
        float _3298 = cos(_3296);
        _3292 = _3298;
    }
    float _3300 = _3292;
    float _3302 = -_3228;
    float _3304 = -_3290;
    float _3306 = fma(_3206, _3302, _3304);
    if (_3242)
    {
        float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3254 = _3308;
    }
    float _3310 = _3254;
    float _3312 = _3288;
    float _3314 = _3310;
    if (_3242)
    {
        float _3316 = fma(_3288, _3310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3312 = _3316;
    }
    float _3318 = _3312;
    float _3320 = _3318;
    if (!_3242)
    {
        _3282 = _3230;
    }
    float _3322 = _3282;
    float _3324 = _3322;
    if (_3242)
    {
        float _3326 = _3270 * _3318;
        _3314 = _3326;
    }
    float _3328 = _3314;
    if (!_3242)
    {
        _3272 = _3306;
    }
    float _3330 = _3272;
    float _3332 = _3330;
    float _3334 = _3300;
    if (_3242)
    {
        float _3336 = _3300 + (-1.0);
        _3294 = _3336;
    }
    float _3338 = _3294;
    float _3340 = _3338;
    if (_3242)
    {
        float _3342 = _3230 * _3328;
        _3324 = _3342;
    }
    float _3344 = _3324;
    if (!_3242)
    {
        _3320 = _3234;
    }
    float _3346 = _3320;
    float _3348 = _3346;
    if (_3242)
    {
        float _3350 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3256 = _3350;
    }
    float _3352 = _3256;
    if (!_3242)
    {
        _3340 = _3232;
    }
    float _3354 = _3340;
    float _3356 = _3354;
    if (_3242)
    {
        float _3358 = _3344 * _3344;
        _3348 = _3358;
    }
    float _3360 = _3348;
    if (_3242)
    {
        float _3362 = _3232 * _3328;
        _3356 = _3362;
    }
    float _3364 = _3356;
    if (_3242)
    {
        float _3366 = fma(_3306, _3300, _3352);
        _3332 = _3366;
    }
    float _3368 = _3332;
    if (!_3242)
    {
        _3334 = _3236;
    }
    float _3370 = _3334;
    float _3372 = floor(_3220);
    float _3374 = _3370;
    if (_3242)
    {
        float _3376 = _3364 * _3364;
        _3374 = _3376;
    }
    float _3378 = _3374;
    float _3380 = fma(_3368, _3368, _3360);
    float _3382 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3384 = _3380 + _3378;
    float _3386 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3382);
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3390 = fma(_3226, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3388);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = rsqrt(_3384);
    float _3396 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3386);
    float _3398 = -_3392;
    float _3400 = _3398 + 1.0;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3404 = _3396 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3406 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3408 = fma(_2632, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3410 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3412 = _3404 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3414 = abs(_3400);
    float _3416 = log2(_3414);
    float _3418 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3406);
    float _3420 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3410);
    float _3422 = -_3412;
    float _3424 = fma(_3422, _3402, 1.0);
    float _3426 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3428 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3418);
    float _3430 = _3394 * _3344;
    float _3432 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3420);
    float _3434 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3426);
    float _3436 = _3394 * _3368;
    float _3438 = _3394 * _3364;
    float _3440 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3442 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3434);
    float _3444 = _3432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3446 = floor(_3408);
    float _3448 = -_3440;
    float _3450 = fma(_3436, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3448);
    float _3452 = _3442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3454 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3456 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3458 = -_3438;
    float _3460 = fma(_3458, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3450);
    float _3462 = -_3372;
    float _3464 = _3220 + _3462;
    float _3466 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3454);
    float _3468 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3470 = exp2(_3456);
    float _3472 = fma(_3460, -0.5, 0.5);
    float _3474 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3466);
    float _3476 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3478 = fma(_3460, 0.5, 0.5);
    float _3480 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3474);
    float _3482 = -_3446;
    float _3484 = _3408 + _3482;
    float _3486 = log2(_3424);
    float _3488 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3476);
    float _3490 = _3436 + 1.0;
    float _3492 = fma(_3478, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3494 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3488);
    float _3496 = fma(_3478, _3492, -0.212114393711090087890625);
    float _3498 = 1.0 / _3480;
    float _3500 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3502 = sqrt(_3472);
    float _3504 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3500);
    float _3506 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3494);
    float _3508 = _3486 * 0.693147182464599609375;
    float2 _9211 = float2(_3464, _3484);
    float _3510 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9211, float2(0.0), isnan(_9211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9211, float2(0.0), isnan(_9211)), level(0.0)).x;
    float _3512 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3504);
    float _3514 = fma(_3478, _3496, 1.570728778839111328125);
    float _3516 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3518 = _3506 * _3498;
    float _3520 = -_3436;
    float _3522 = fma(_3470, _3490, _3520);
    float _3524 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3512);
    float _3526 = fma(_3518, 0.5, 0.5);
    float _3528 = fma(_3522, 0.5, 0.5);
    float _3530 = _3524 * _3498;
    float _3532 = _3502 * 0.636619746685028076171875;
    float _3534 = fma(_3530, -0.5, 0.5);
    float _3536 = -_3514;
    float _3538 = fma(_3532, _3536, 1.0);
    float3 _9266 = float3(_3526, _3534, _3516);
    float _3540 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9266, float3(0.0), isnan(_9266)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9266, float3(0.0), isnan(_9266)), level(0.0)).x;
    float3 _9277 = float3(_3526, _3534, _3516);
    float4 _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9277, float3(0.0), isnan(_9277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9277, float3(0.0), isnan(_9277)), level(0.0)).xyzw;
    float _3545 = _3543.x;
    float _3547 = _3543.y;
    float _3549 = _3543.z;
    float _3551 = _3543.w;
    float2 _9293 = float2(_3538, _3528);
    float3 _3555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9293, float2(0.0), isnan(_9293)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9293, float2(0.0), isnan(_9293)), level(0.0)).xyz;
    float _3557 = _3555.x;
    float _3559 = _3555.y;
    float _3561 = _3555.z;
    float _3563 = abs(_3092);
    float _3565 = log2(_3563);
    float _3567 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3569 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3571 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3573 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3575 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3567);
    float _3577 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3579 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3569);
    float _3581 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3571);
    float _3583 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3585 = -_2748;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3577);
    float _3589 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3591 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3593 = -_2748;
    float _3595 = fma(_3593, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3583);
    float _3597 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3573);
    float _3599 = -_2748;
    float _3601 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3589);
    float _3603 = _3565 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3605 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3607 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3591);
    float _3609 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3601);
    float _3611 = exp2(_3603);
    float _3613 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3605);
    float _3615 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3587);
    float _3617 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3595);
    float _3619 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3613);
    float _3621 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3607);
    float _3623 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3625 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3597);
    float _3627 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3575);
    float _3629 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = fma(_3623, _3623, 1.0);
    float _3633 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_76.x = _3142;
    out.m_76.y = _3140;
    out.m_76.z = _3144;
    bool _3635 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3637 = isnan(_3226);
    bool _3639 = _3635 || _3637;
    bool _3641 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3643 = _3639 || _3641;
    float _3645 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3647 = precise::clamp(_3645, 0.0, 1.0);
    float _3649 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3579);
    float _3651 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3581);
    float _3653 = rsqrt(_3631);
    float _3655 = fma(_3647, -2.0, 3.0);
    float _3657 = _3647 * _3647;
    float _3659 = _3623 * _3617;
    out.m_78.x = _3627;
    out.m_78.y = _3649;
    out.m_78.z = _3651;
    float _3661 = _3623 * _3615;
    float _3663 = _3657 * _3655;
    float _3665 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3667 = exp2(_3629);
    float _3669 = fma(_3633, _3649, _3659);
    float _3671 = -_3663;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3665);
    float _3677 = fma(_3633, _3627, _3661);
    float _3679 = fma(_3673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3663);
    float _3681 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    bool _3683 = _3092 <= 8000.0;
    bool _3685 = isnan(_3092);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan(8000.0);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = in.m_80.x;
    float _3697 = _3623 * _3653;
    float _3699 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3681);
    float _3701 = _3693 * _3679;
    float _3703 = -_3619;
    float _3705 = _3697 * _3703;
    float _3707 = -_3621;
    float _3709 = _3697 * _3707;
    float _3711 = -_3667;
    float _3713 = _3711 + 1.0;
    float _3715 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3717 = -_3625;
    float _3719 = _3697 * _3717;
    float _3721 = _3621 + _3669;
    float _3723 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3725 = fma(_3653, _3615, _3705);
    float _3727 = _3623 * _3609;
    float _3729 = fma(_3653, _3617, _3709);
    float _3731 = fma(_3653, _3609, _3719);
    out.gl_Position.x = _3506;
    out.gl_Position.y = _3524;
    out.gl_Position.z = _3699;
    out.gl_Position.w = _3480;
    float _3733 = _3699 + _3480;
    float _3735 = fma(_3633, _3651, _3727);
    out.m_82.x = _3725;
    out.m_82.y = _3729;
    out.m_82.z = _3731;
    float _3737 = _3733 * 0.5;
    float _3739 = _3619 + _3677;
    float _3741 = _3625 + _3735;
    out.m_84.z = _3737;
    out.m_84.w = _3480;
    out.m_86.x = _3739;
    out.m_86.y = _3721;
    out.m_86.z = _3741;
    float _3743 = _3480;
    float _3745 = _3699;
    float _3747 = _3524;
    if (!_3643)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3749 = _3743;
    float _3751 = _3749;
    float _3753 = _3749;
    if (!_3643)
    {
        _3745 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3755 = _3745;
    float _3757 = _3755;
    float _3759 = _3755;
    if (!_3643)
    {
        _3747 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3761 = _3747;
    float _3763 = -_3510;
    float _3765 = _3763 + 1.0;
    float _3767 = _3765 * _3715;
    float _3769 = precise::clamp(_3767, 0.0, 1.0);
    float _3771 = -_3769;
    float _3773 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3775 = _3773 * _3695;
    float _3777 = _3775 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3779 = _3723 * _3540;
    float _3781 = -_3723;
    float _3783 = _3781 + 1.0;
    out.m_88.x = _3777;
    float _3785 = _3551 * _3779;
    float _3787 = _3561 * _3779;
    float _3789 = _3551 * _3783;
    float _3791 = _3779;
    float _3793 = _3547;
    float _3795 = _3545;
    float _3797 = _3761;
    float _3799 = _3761;
    if (!_3643)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3801 = _3791;
    float _3803 = fma(_3557, _3785, _3545);
    float _3805 = fma(_3559, _3785, _3547);
    float _3807 = fma(_3551, _3787, _3549);
    float _3809 = _3202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3811 = _3801;
    float _3813 = _3801;
    if (!_3643)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3815 = _3793;
    float _3817 = _3815;
    float _3819 = _3815;
    if (!_3643)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3795;
    out.m_90.x = _3803;
    out.m_90.y = _3805;
    out.m_90.z = _3807;
    out.m_90.w = _3789;
    bool _3823 = !_3643;
    float _3825 = _3821;
    float _3827 = _3821;
    if (!_3823)
    {
        bool _3829 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3831 = isnan(_3226);
        bool _3833 = _3829 || _3831;
        bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3837 = _3833 || _3835;
        if (!_3837)
        {
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3841 = _3226 + _3839;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3843;
            float _3847 = 1.0 / _3845;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3869 = _3841 * _3847;
            float _3871 = precise::clamp(_3869, 0.0, 1.0);
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3877 = fma(_3871, _3851, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3827 = _3879;
            _3799 = _3885;
            _3819 = _3877;
            _3759 = _3883;
            _3753 = _3881;
            _3813 = _3887;
            _3889 = true;
        }
        else
        {
            bool _3891 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3893 = isnan(_3226);
            bool _3895 = _3891 || _3893;
            bool _3897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3899 = _3895 || _3897;
            if (!_3899)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3901 = _3817;
            _3819 = _3901;
            if (!_3899)
            {
                _3825 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3903 = _3825;
            _3827 = _3903;
            if (!_3899)
            {
                _3751 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3905 = _3751;
            _3753 = _3905;
            if (!_3899)
            {
                _3757 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3907 = _3757;
            _3759 = _3907;
            if (!_3899)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3909 = _3797;
            _3799 = _3909;
            if (!_3899)
            {
                _3811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3911 = _3811;
            bool _3913 = !_3899;
            _3813 = _3911;
            if (!_3913)
            {
                bool _3915 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3917 = isnan(_3226);
                bool _3919 = _3915 || _3917;
                bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3923 = _3919 || _3921;
                if (!_3923)
                {
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3927 = _3226 + _3925;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3931 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3929;
                    float _3933 = 1.0 / _3931;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3955 = _3927 * _3933;
                    float _3957 = precise::clamp(_3955, 0.0, 1.0);
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3963 = fma(_3957, _3937, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3965 = fma(_3957, _3961, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3967 = fma(_3957, _3941, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3969 = fma(_3957, _3945, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3971 = fma(_3957, _3949, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3973 = fma(_3957, _3953, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3827 = _3965;
                    _3799 = _3971;
                    _3819 = _3963;
                    _3759 = _3969;
                    _3753 = _3967;
                    _3813 = _3973;
                    _3889 = true;
                }
                else
                {
                    _3827 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3759 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3753 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3889 = false;
    float _3975 = _3827;
    float _3977 = _3799;
    float _3979 = _3819;
    float _3981 = _3759;
    float _3983 = _3753;
    float _3985 = _3813;
    float _3987 = fma(_3721, -0.5, 0.5);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -_3975;
    float _3993 = _3991 + _3977;
    float _3995 = -_3979;
    float _3997 = _3995 + _3981;
    out.m_92.x = 0.0;
    float _3999 = fma(_3989, _3993, _3975);
    float _4001 = -_3983;
    float _4003 = _4001 + _3985;
    float _4005 = fma(_3989, _3997, _3979);
    float _4007 = _3999 * 0.586610972881317138671875;
    bool _4009 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4011 = fma(_3989, _4003, _3983);
    float _4013 = _3809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4015 = fma(_4005, 0.298911988735198974609375, _4007);
    bool _4017 = _3202 > 0.0;
    bool _4019 = isnan(_3202);
    bool _4021 = _4017 || _4019;
    bool _4023 = isnan(0.0);
    bool _4025 = _4021 || _4023;
    float _4027 = fma(_4011, 0.114477999508380889892578125, _4015);
    out.m_49.x = _4013;
    float _4029 = -_4027;
    float _4031 = _4005 + _4029;
    float _4033 = -_4027;
    float _4035 = _3999 + _4033;
    float _4037 = -_4027;
    float _4039 = _4011 + _4037;
    float _4041 = fma(_4031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4043 = fma(_4035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4045 = fma(_4039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    bool _4047 = !_4009;
    if (!_4047)
    {
        float _4049 = -_3140;
        float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4053 = -_3142;
        float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4057 = -_3144;
        float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4061 = _4051 * _4051;
        float _4063 = fma(_4055, _4055, _4061);
        float _4065 = fma(_4059, _4059, _4063);
        float _4067 = sqrt(_4065);
        float _4069 = rsqrt(_4065);
        float _4071 = -_4067;
        float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4077 = precise::clamp(_4075, 0.0, 1.0);
        float _4079 = _4055 * _4069;
        float _4081 = _4051 * _4069;
        float _4083 = abs(_4077);
        float _4085 = log2(_4083);
        float _4087 = _4059 * _4069;
        float _4089 = _4079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4091 = _3721 * _4081;
        float _4093 = -_4081;
        float _4095 = -_4089;
        float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4095);
        float _4099 = fma(_3739, _4079, _4091);
        float _4101 = -_4087;
        float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4097);
        float _4105 = fma(_3741, _4087, _4099);
        float _4107 = precise::clamp(_4105, 0.0, 1.0);
        float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4111 = _4103 + _4109;
        float _4113 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4117 = precise::clamp(_4115, 0.0, 1.0);
        float _4119 = exp2(_4113);
        float _4121 = _4119 * _4117;
        float _4123 = _4107 * _4121;
        float _4125 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4129 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4125;
        out.m_92.y = _4127;
        out.m_92.z = _4129;
    }
    out.m_94.x = _4041;
    out.m_94.y = _4043;
    out.m_94.z = _4045;
    if (_4025)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4131 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4131;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3889 = false;
    bool _643 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4188 = as_type<float>(_129);
        out.gl_Position.z = _4188;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_51.w;
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
        float _151 = float(_113);
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
        out.m_49.x = 0.0;
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
        float _4258 = as_type<float>(_167);
        out.gl_Position.z = _4258;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_56.x;
    float _173 = in.m_56.y;
    float _175 = in.m_56.z;
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_175, _181, _217);
    float _225 = fma(_171, _189, _219);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _225);
    bool _231 = !_203;
    float _233 = _183;
    float _235 = _187;
    float _237 = _223;
    float _239 = _227;
    float _257;
    if (!_231)
    {
        float _241 = in.m_64.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_113);
        float _263 = 1.0 / _261;
        float _265 = _147 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    bool _277 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_267);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _267 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _295;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _299;
    float _313 = _303 * _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _271 * _309;
    bool _329 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_267);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -_287;
    float _343 = _341 + 1.0;
    bool _345 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _347 = isnan(_267);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _339 * _343;
    float _359 = _275 * _311;
    float _361 = -_339;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = _355 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -_355;
    float _381 = _379 + 1.0;
    float _383 = fma(_367, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_377, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = _325 * _381;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -_325;
    float _395 = _393 + 1.0;
    float _397 = _385 * _387;
    float _399 = _383 * _387;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_391, _313, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _409 = fma(_371, _313, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _417 = fma(_403, _359, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_405, _373, _407);
    float _421 = fma(_413, _359, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_409, _373, _415);
    float _425 = fma(_417, _357, _419);
    float _427 = fma(_421, _357, _423);
    float _429 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_305;
    float _451;
    if (!_433)
    {
        float _435 = in.m_64.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_113);
        float _457 = 1.0 / _455;
        float _459 = _147 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_461);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _491 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _493 = isnan(_461);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _469;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _505;
    float _509 = -_485;
    float _511 = _509 + 1.0;
    bool _513 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_461);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _527 = 1.0 / _473;
    float _529 = 1.0 / _489;
    float _531 = _507 * _503;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = _501 * _511;
    float _539 = -_501;
    float _541 = _539 + 1.0;
    float _543 = fma(_531, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = _523 * _541;
    float _551 = _535 * _527;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _461 + _553;
    bool _557 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_461);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _543 * _549;
    float _571 = -_523;
    float _573 = _571 + 1.0;
    float _575 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _461 + _577;
    float _581 = _547 * _529;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _589 = fma(_581, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _485 * _585;
    float _593 = fma(_575, _537, _587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _597 = fma(_589, _591, _593);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _601 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = in.m_66.x;
    float _611 = in.m_66.y;
    float _613 = _603 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _607;
    out.m_68.y = _601;
    out.m_68.z = _615;
    out.m_68.w = _613;
    float _617 = _431 * _611;
    float _619 = _429 * _609;
    bool _621 = !_525;
    float _623 = _541;
    float _641;
    if (!_621)
    {
        float _625 = in.m_64.x;
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_113);
        float _647 = 1.0 / _645;
        float _649 = _147 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _655 = int(_653);
    float _657 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _665 = int(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _671 = float(_655);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _675 = int(_673);
    if (_661)
    {
        float _677 = in.m_64.x;
        _623 = _677;
    }
    float _679 = _623;
    float _681 = _679;
    if (!_661)
    {
        float _683 = in.m_64.y;
        _681 = _683;
    }
    float _685 = _681;
    float _687 = float(_665);
    float _689 = 1.0 / _671;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _693 = int(_691);
    float _695 = float(uint(_675));
    int _697 = ~_675;
    int _699 = _697 + 1;
    bool _701 = _675 == 0;
    float _703 = 1.0 / _687;
    float _705 = _689 * _147;
    float _707 = 1.0 / _695;
    float _709 = float(uint(_693));
    int _711 = ~_693;
    int _713 = _711 + 1;
    int _715 = ~_693;
    int _717 = _715 + 1;
    float _719 = trunc(_705);
    int _721 = int(_719);
    float _723 = _703 * _147;
    float _725 = 1.0 / _709;
    int _727 = as_type<int>(_707) + (-2);
    float _729 = in.m_64.x;
    float _731 = in.m_64.y;
    float _733 = in.m_64.z;
    float _735 = in.m_64.w;
    float _737 = trunc(_723);
    int _739 = int(_737);
    float _741 = float(uint(_721));
    float _743 = as_type<float>(_727) * _741;
    float _745 = _741;
    if (_661)
    {
        _745 = 1.0;
    }
    float _747 = _745;
    float _749 = 1.0 / _669;
    int _751 = as_type<int>(_725) + (-2);
    float _753 = _747;
    if (!_661)
    {
        _753 = 7.345489978790283203125;
    }
    float _755 = _753;
    float _757 = trunc(_743);
    float _759 = precise::max(_757, 0.0);
    uint _762 = uint(_759);
    float _764 = float(uint(_739));
    float _766 = float(_739);
    float _768 = as_type<float>(_751) * _764;
    float _770 = _755 * _729;
    float _772 = trunc(_768);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    int _778 = _699 * int(_762);
    int _780 = _778 + _721;
    float _782 = float(_113);
    float _784 = float(uint(_780));
    float _786 = floor(_770);
    int _788 = ~_675;
    int _790 = _788 + 1;
    float _792 = as_type<float>(_727) * _784;
    int _794 = _713 * int(_776);
    int _796 = _794 + _739;
    float _798 = _784;
    if (_661)
    {
        _798 = 1.0;
    }
    float _800 = _798;
    float _802 = _800;
    if (!_661)
    {
        _802 = 1.2345600128173828125;
    }
    float _804 = _802;
    float _806 = 1.0 / _782;
    float _808 = float(uint(_796));
    float _810 = _804 * _685;
    float _812 = float(_721);
    float _814 = as_type<float>(_751) * _808;
    float _816 = float(_675);
    float _818 = trunc(_792);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = -_786;
    float _826 = _770 + _824;
    bool _828 = _812 >= _816;
    bool _830 = isnan(_812);
    bool _832 = _828 || _830;
    bool _834 = isnan(_816);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = trunc(_814);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = int(_762) + int(_822);
    float _848 = floor(_810);
    int _850 = _790 * _846;
    int _852 = _850 + _721;
    float _854 = _826 * _816;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _858 = _856 != 0;
    int _860 = int(_776) + int(_844);
    float _862 = trunc(_838);
    int _864 = int(_862);
    bool _866 = uint(_852) >= uint(_675);
    bool _868 = !_858;
    int _870 = _868 ? 0 : 1;
    int _872 = _717 * _860;
    int _874 = _872 + _739;
    bool _876 = !_866;
    int _878 = _876 ? 0 : (-1);
    float _880 = -_848;
    float _882 = _810 + _880;
    float _884 = trunc(_854);
    int _886 = int(_884);
    int _888 = ~_846;
    int _890 = _888 + _878;
    int _892 = _890 + 1;
    float _894 = _806 * _147;
    int _896 = abs(_870);
    bool _898 = uint(_874) >= uint(_693);
    int _900 = _675 * _892;
    int _902 = _900 + _721;
    int _904 = ~_864;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _920 = _918 != 0;
    bool _922 = !_701;
    int _924 = _922 ? _902 : (-1);
    bool _926 = !_898;
    int _928 = _926 ? 0 : (-1);
    int _930 = _886 * _896;
    int _932 = _930 + _721;
    float _934 = _816 * _894;
    float _936 = float(_693);
    int _938 = _924 * _908;
    bool _940 = !_912;
    int _942 = _940 ? 0 : 1;
    int _944 = ~_860;
    int _946 = _944 + _928;
    int _948 = _946 + 1;
    float _950 = trunc(_934);
    int _952 = int(_950);
    bool _954 = _766 >= _936;
    bool _956 = isnan(_766);
    bool _958 = _954 || _956;
    bool _960 = isnan(_936);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = _936 * _894;
    bool _968 = !_916;
    int _970 = _968 ? 0 : 1;
    int _972 = _693 * _948;
    int _974 = _972 + _739;
    int _976 = _675 + (-1);
    int _978 = abs(_942);
    float _980 = trunc(_964);
    int _982 = int(_980);
    int _984 = abs(_970);
    int _986 = _864 * _976;
    int _988 = _986 + _938;
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    int _994 = _988 * _984;
    int _996 = abs(_992);
    float _998 = _882 * _936;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1002 = _1000 != 0;
    int _1004 = _952 * _978;
    int _1006 = _1004 + _994;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1010 = _1008 != 0;
    bool _1012 = !_1002;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = trunc(_998);
    int _1018 = int(_1016);
    bool _1020 = !_1010;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _932 * _996;
    int _1026 = _1024 + _1006;
    bool _1028 = _693 == 0;
    int _1030 = abs(_1014);
    int _1032 = abs(_1022);
    int _1034 = ~_982;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    bool _1040 = !_1028;
    int _1042 = _1040 ? _974 : (-1);
    int _1044 = _886 * _1032;
    int _1046 = _1044 + _1026;
    int _1048 = _693 + (-1);
    float _1050 = trunc(_966);
    int _1052 = int(_1050);
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1068 = _1066 != 0;
    int _1070 = _1042 * _1038;
    float _1072 = float(uint(_1046));
    int _1074 = _1018 * _1030;
    int _1076 = _1074 + _739;
    bool _1078 = _675 == 0;
    int _1080 = _982 * _1048;
    int _1082 = _1080 + _1070;
    bool _1084 = !_1060;
    int _1086 = _1084 ? 0 : 1;
    float _1088 = as_type<float>(_727) * _1072;
    bool _1090 = !_1056;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = !_1064;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = trunc(_1088);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = abs(_1086);
    int _1106 = abs(_1092);
    bool _1108 = !_1068;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _1082 * _1104;
    int _1114 = abs(_1096);
    int _1116 = abs(_1110);
    int _1118 = _1052 * _1106;
    int _1120 = _1118 + _1112;
    int _1122 = ~_675;
    int _1124 = _1122 + 1;
    int _1126 = _1076 * _1114;
    int _1128 = _1126 + _1120;
    float _1130 = float(uint(_932));
    int _1132 = ~_693;
    int _1134 = _1132 + 1;
    int _1136 = _1018 * _1116;
    int _1138 = _1136 + _1128;
    float _1140 = as_type<float>(_727) * _1130;
    int _1142 = ~_675;
    int _1144 = _1142 + 1;
    float _1146 = float(uint(_1138));
    int _1148 = _1124 * int(_1102);
    int _1150 = _1148 + _1046;
    float _1152 = float(uint(_1076));
    float _1154 = trunc(_1140);
    float _1156 = precise::max(_1154, 0.0);
    uint _1158 = uint(_1156);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1162 = _1160 != 0;
    float _1164 = as_type<float>(_751) * _1146;
    float _1166 = float(uint(_1150));
    float _1168 = as_type<float>(_751) * _1152;
    float _1170 = trunc(_1164);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = as_type<float>(_727) * _1166;
    int _1178 = _984;
    if (_1162)
    {
        _1178 = 0;
    }
    int _1180 = _1178;
    float _1182 = trunc(_1176);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    int _1188 = ~_675;
    int _1190 = _1188 + 1;
    int _1192 = _1134 * int(_1174);
    int _1194 = _1192 + _1138;
    float _1196 = trunc(_1168);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    float _1202 = float(uint(_1194));
    int _1204 = int(_1102) + int(_1186);
    int _1206 = _1144 * int(_1158);
    int _1208 = _1206 + _932;
    float _1210 = as_type<float>(_751) * _1202;
    int _1212 = ~_693;
    int _1214 = _1212 + 1;
    float _1216 = float(uint(_1208));
    int _1218 = _1190 * _1204;
    int _1220 = _1218 + _1046;
    float _1222 = trunc(_1210);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = ~_693;
    int _1230 = _1228 + 1;
    float _1232 = as_type<float>(_727) * _1216;
    bool _1234 = uint(_1220) >= uint(_675);
    int _1236 = _1230 * int(_1200);
    int _1238 = _1236 + _1076;
    bool _1240 = !_1234;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = trunc(_1232);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = float(uint(_1238));
    int _1252 = ~_1204;
    int _1254 = _1252 + _1242;
    int _1256 = _1254 + 1;
    int _1258 = ~_693;
    int _1260 = _1258 + 1;
    float _1262 = as_type<float>(_751) * _1250;
    int _1264 = int(_1174) + int(_1226);
    int _1266 = _675 * _1256;
    int _1268 = _1266 + _1046;
    float _1270 = trunc(_1262);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    bool _1276 = !_1078;
    int _1278 = _1276 ? _1268 : (-1);
    int _1280 = _1260 * _1264;
    int _1282 = _1280 + _1138;
    int _1284 = int(_1158) + int(_1248);
    int _1286 = _1278 & 3;
    bool _1288 = _1286 != 0;
    int _1290 = _1278 & 3;
    bool _1292 = _1290 != 0;
    bool _1294 = uint(_1282) >= uint(_693);
    int _1296 = _1288 ? 0 : 1;
    bool _1298 = uint(_1290) > 1u;
    bool _1300 = uint(_1290) >= 2u;
    bool _1302 = !_1294;
    int _1304 = _1302 ? 0 : (-1);
    int _1306 = _1300 ? 0 : 1;
    bool _1308 = _1290 != 3;
    int _1310 = ~_1264;
    int _1312 = _1310 + _1304;
    int _1314 = _1312 + 1;
    int _1316 = ~_1296;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _1320;
    int _1324 = _1180;
    if (!_1298)
    {
        int _1326 = ~_1296;
        int _1328 = _1326 + 1;
        _1322 = _1328;
    }
    int _1330 = _1322;
    int _1332 = _693 * _1314;
    int _1334 = _1332 + _1138;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1338 = _1336 != 0;
    int _1340 = ~_675;
    int _1342 = _1340 + 1;
    bool _1344 = !_1338;
    int _1346 = _1344 ? 0 : 1;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1350 = _1348 != 0;
    int _1352 = _1342 * _1284;
    int _1354 = _1352 + _932;
    bool _1356 = !_1028;
    int _1358 = _1356 ? _1334 : (-1);
    int _1360 = ~_1306;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    int _1366 = _1364;
    if (_1308)
    {
        int _1368 = ~_1306;
        int _1370 = _1368 + 1;
        _1366 = _1370;
    }
    int _1372 = _1366;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1376 = _1374 != 0;
    int _1378 = _1358 & 3;
    bool _1380 = _1378 != 0;
    bool _1382 = uint(_1354) >= uint(_675);
    bool _1384 = !_1376;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = in.m_46.x;
    float _1390 = in.m_46.y;
    float _1392 = in.m_46.z;
    bool _1394 = uint(_1378) > 1u;
    bool _1396 = !_1382;
    int _1398 = _1396 ? 0 : (-1);
    if (!_1350)
    {
        _1324 = 1;
    }
    int _1400 = _1324;
    int _1402 = int(_1200) + int(_1274);
    int _1404 = _1358 & 3;
    bool _1406 = _1404 != 0;
    bool _1408 = _1378 != 3;
    int _1410 = _1214 * _1402;
    int _1412 = _1410 + _1076;
    int _1414 = ~_1284;
    int _1416 = _1414 + _1398;
    int _1418 = _1416 + 1;
    int _1420 = _1406 ? 0 : 1;
    bool _1422 = uint(_1378) >= 2u;
    int _1424 = _675 * _1418;
    int _1426 = _1424 + _932;
    int _1428 = ~_1420;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    int _1434 = _1422 ? 0 : 1;
    int _1436 = _1432;
    if (!_1394)
    {
        int _1438 = ~_1420;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = _185 * _1390;
    bool _1446 = uint(_1412) >= uint(_693);
    float _1448 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1450 = log2(_1448);
    bool _1452 = !_1078;
    int _1454 = _1452 ? _1426 : (-1);
    float _1456 = _179 * _1390;
    bool _1458 = _735 > 0.5;
    float _1460 = _191 * _1390;
    bool _1462 = _729 > 0.5;
    float _1464 = fma(_177, _1388, _1456);
    int _1466 = ~_1434;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    float _1472 = _731 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1474 = fma(_189, _1388, _1460);
    int _1476 = _1470;
    if (_1408)
    {
        int _1478 = ~_1434;
        int _1480 = _1478 + 1;
        _1476 = _1480;
    }
    int _1482 = _1476;
    float _1484 = _729 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1486 = !_1292;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = fma(_183, _1388, _1444);
    bool _1492 = !_1446;
    int _1494 = _1492 ? 0 : (-1);
    float _1496 = _1450 * _147;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1500 = _1498 != 0;
    float _1502 = fma(_181, _1392, _1464);
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1506 = _1504 != 0;
    float _1508 = fma(_187, _1392, _1490);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1512 = _1510 != 0;
    float _1514 = exp2(_1496);
    float _1516 = -_207;
    int _1518 = _1462 ? as_type<int>(_1516) : as_type<int>(_207);
    float _1520 = fma(_193, _1392, _1474);
    int _1522 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1524 = _1522 != 0;
    float _1526 = _729 * 2.0;
    bool _1528 = !_1524;
    float _1530 = _1528 ? _207 : as_type<float>(_1518);
    bool _1532 = _733 > 0.5;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1536 = floor(_1526);
    float _1538 = -_207;
    int _1540 = _1532 ? as_type<int>(_1538) : as_type<int>(_207);
    float _1542 = fma(_1472, -2.0, _1534);
    bool _1544 = _1400 != 1;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1548 = -_1546;
    float _1550 = fma(_1484, 2.0, _1548);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1558 = _1484;
    float _1560 = _1552;
    if (!_1544)
    {
        _233 = _731;
    }
    float _1562 = _233;
    float _1564 = _1562;
    if (!_1544)
    {
        _1558 = _733;
    }
    float _1566 = _1558;
    float _1568 = _1566;
    if (_1544)
    {
        _1564 = _729;
    }
    float _1570 = _1564;
    if (_1544)
    {
        _1568 = _731;
    }
    float _1572 = _1568;
    if (!_1544)
    {
        _235 = _731;
    }
    float _1574 = _235;
    float _1576 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1552);
    float _1578 = _1574;
    if (_1544)
    {
        _1578 = _729;
    }
    float _1580 = _1578;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1554);
    float _1584 = -_1514;
    float _1586 = _1584 + 1.0;
    if (!_1544)
    {
        _1560 = _733;
    }
    float _1588 = _1560;
    float _1590 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1576);
    float _1592 = _1588;
    if (_1544)
    {
        _1592 = _731;
    }
    float _1594 = _1592;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1598 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1600 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1608 = _1604 || _1606;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1612 = -_1596;
    float _1614 = fma(_1598, 2.0, _1612);
    int _1616 = _1278 >> 31;
    float _1618 = fma(_1610, -2.0, _1556);
    int _1620 = _1358 >> 31;
    float _1622 = -_147;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1614);
    int _1626 = _1616 & 3;
    float _1628 = _1608 ? _1586 : 0.0;
    bool _1630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1632 = isnan(1.0);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1638 = _1634 || _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1642 = 1.0 + _1640;
    int _1644 = _1278 + _1626;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1648 = _1620 & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1652 = _731 * 2.0;
    float _1654 = 1.0 / _1642;
    int _1656 = _1358 + _1648;
    float _1658 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1646);
    int _1660 = _1644 >> 2;
    float _1662 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1650);
    int _1664 = _1656 >> 2;
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1542);
    int _1668 = _1660 << 4;
    int _1670 = _1668 + 368;
    float _1672 = -_147;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1550);
    int _1676 = _1664 << 4;
    int _1678 = _1676 + 512;
    float _1680 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1658);
    uint _1682 = uint(int(uint(_1670) >> uint(2)));
    uint _1684 = uint(int(uint(int(_1682)) >> uint(2)));
    int _1686 = int(_1682) & 3;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[int(_1684)][_1686];
    int _1690 = int(_1682) + 1;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    int _1694 = _1690 & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    float _1698 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    float _1700 = floor(_1652);
    float _1702 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1582);
    float _1704 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1618);
    int _1706 = as_type<int>(_1698);
    if (_1638)
    {
        float _1708 = _1628 * _1654;
        _149 = _1708;
    }
    float _1710 = _149;
    float _1712 = _729 + _731;
    bool _1714 = !_1380;
    int _1716 = _1714 ? 0 : 1;
    float _1718 = -_1702;
    float _1720 = _1718 + 1.0;
    bool _1722 = _1536 > 0.0;
    uint _1724 = uint(int(uint(_1678) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    bool _1740 = _1536 >= 0.0;
    bool _1742 = isnan(_1536);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.0);
    bool _1748 = _1744 || _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1750;
    float _1754 = _1712 + (-1.0);
    int _1756 = _1748 ? 0 : 1;
    float _1758 = _1752 * _749;
    bool _1760 = _1700 >= 0.0;
    bool _1762 = isnan(_1700);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    int _1770 = _1670 + 8;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[int(_1782)][_1784];
    float _1788 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1790 = ~_1402;
    int _1792 = _1790 + _1494;
    int _1794 = _1792 + 1;
    int _1796 = _1768 ? 0 : 1;
    bool _1798 = _1700 > 0.0;
    float _1800 = _733 + _731;
    int _1802 = _1678 + 8;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
    int _1808 = int(_1804) & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    int _1812 = int(_1804) + 1;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    int _1816 = _1812 & 3;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[int(_1814)][_1816];
    int _1820 = ~_1756;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = _693 * _1794;
    int _1828 = _1826 + _1076;
    float _1830 = _1800 + (-1.0);
    int _1832 = _1824;
    if (!_1722)
    {
        int _1834 = ~_1756;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    bool _1840 = _1290 != 3;
    float _1842 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1844 = abs(_1330);
    int _1846 = abs(_1442);
    float _1848 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1850 = int(_1848);
    int _1852 = ~_1796;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    int _1858 = _1856;
    if (!_1798)
    {
        int _1860 = ~_1796;
        int _1862 = _1860 + 1;
        _1858 = _1862;
    }
    int _1864 = _1858;
    int _1866 = ~_1844;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = _1378 != 3;
    int _1874 = abs(_1488);
    int _1876 = _1870 * as_type<int>(_1696);
    int _1878 = abs(_1716);
    int _1880 = abs(_1372);
    int _1882 = ~_1846;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    int _1888 = ~_1874;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = ~_1878;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = _1886 * as_type<int>(_1738);
    int _1902 = _1892 * as_type<int>(_1688);
    int _1904 = _1902 + _1876;
    bool _1906 = !_1840;
    int _1908 = _1906 ? 0 : (-1);
    int _1910 = _1898 * as_type<int>(_1730);
    int _1912 = _1910 + _1900;
    int _1914 = abs(_1482);
    float _1916 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1918 = int(_1916);
    int _1920 = ~_1880;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = abs(_1908);
    int _1928 = _1924 * as_type<int>(_1778);
    int _1930 = _1928 + _1904;
    float _1932 = in.m_60.w;
    int _1934 = ~_1914;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = ~_1926;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = float(uint(_1850));
    int _1948 = _1938 * as_type<int>(_1810);
    int _1950 = _1948 + _1912;
    bool _1952 = !_1872;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = _1944 * as_type<int>(_1786);
    int _1958 = _1956 + _1930;
    int _1960 = abs(_1346);
    float _1962 = 1.0 / _1946;
    float _1964 = _733 * 2.0;
    int _1966 = abs(_1954);
    float _1968 = in.m_58.w;
    float _1970 = float(uint(_1918));
    float _1972 = floor(_1964);
    int _1974 = abs(_1386);
    int _1976 = abs(_1850);
    float _1978 = _1508 + _1932;
    int _1980 = ~_1960;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = 1.0 / _1970;
    int _1988 = ~_1966;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = abs(_1918);
    int _1996 = _1958 * _1984;
    bool _1998 = !_1028;
    int _2000 = _1998 ? _1828 : (-1);
    int _2002 = _1992 * as_type<int>(_1818);
    int _2004 = _2002 + _1950;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2008 = _2006 != 0;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2012 = _2010 != 0;
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2016 = _2014 != 0;
    int _2018 = _1454 * _1960;
    int _2020 = _2018 + _1996;
    float _2022 = float(uint(_1976));
    int _2024 = ~_1974;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _1502 + _1968;
    float _2032 = 1.0 / _2022;
    int _2034 = as_type<int>(_1962) + (-2);
    int _2036 = _2004 * _2028;
    float _2038 = float(uint(_1994));
    float _2040 = float(uint(_2020));
    int _2042 = _2000 * _1974;
    int _2044 = _2042 + _2036;
    bool _2046 = !_2012;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2052 = _651 + _2050;
    bool _2054 = _1972 >= 0.0;
    bool _2056 = isnan(_1972);
    bool _2058 = _2054 || _2056;
    bool _2060 = isnan(0.0);
    bool _2062 = _2058 || _2060;
    float _2064 = 1.0 / _2038;
    float _2066 = as_type<float>(_2034) * _2040;
    int _2068 = as_type<int>(_1986) + (-2);
    float _2070 = fma(_1758, _2052, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2072 = _2062 ? 0 : 1;
    float _2074 = float(uint(_2044));
    bool _2076 = _1972 > 0.0;
    float _2078 = trunc(_2066);
    float _2080 = precise::max(_2078, 0.0);
    uint _2082 = uint(_2080);
    int _2084 = abs(_2020);
    float _2086 = as_type<float>(_2068) * _2074;
    int _2088 = as_type<int>(_2032) + (-2);
    float _2090 = float(uint(_2084));
    int _2092 = abs(_2044);
    float _2094 = trunc(_2086);
    float _2096 = precise::max(_2094, 0.0);
    uint _2098 = uint(_2096);
    int _2100 = as_type<int>(_2064) + (-2);
    float _2102 = as_type<float>(_2088) * _2090;
    float _2104 = float(uint(_2092));
    int _2106 = ~_1850;
    int _2108 = _2106 + 1;
    int _2110 = ~_1918;
    int _2112 = _2110 + 1;
    float _2114 = trunc(_2102);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = as_type<float>(_2100) * _2104;
    int _2122 = _2108 * int(_2082);
    int _2124 = _2122 + _2020;
    int _2126 = ~_1976;
    int _2128 = _2126 + 1;
    int _2130 = ~_1994;
    int _2132 = _2130 + 1;
    float _2134 = float(uint(_2124));
    float _2136 = trunc(_2120);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    int _2142 = _2112 * int(_2098);
    int _2144 = _2142 + _2044;
    bool _2146 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2148 = isnan(_651);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = as_type<float>(_2034) * _2134;
    bool _2160 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2162 = isnan(_651);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = float(uint(_2144));
    int _2174 = _2128 * int(_2118);
    int _2176 = _2174 + _2084;
    float _2178 = -_2156;
    float _2180 = _2178 + 1.0;
    float _2182 = trunc(_2158);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    int _2188 = abs(_2048);
    float _2190 = as_type<float>(_2068) * _2172;
    float _2192 = float(uint(_2176));
    float _2194 = in.m_62.w;
    float _2196 = _2170 * _2180;
    int _2198 = _2132 * int(_2140);
    int _2200 = _2198 + _2092;
    float _2202 = -_2170;
    float _2204 = _2202 + 1.0;
    float _2206 = as_type<float>(_2088) * _2192;
    float _2208 = _2070 * _2196;
    float _2210 = trunc(_2190);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = float(uint(_2200));
    float _2218 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2208);
    float _2220 = float(_1838);
    float _2222 = as_type<float>(_2100) * _2216;
    float _2224 = trunc(_2206);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    int _2230 = ~_1850;
    int _2232 = _2230 + 1;
    float _2234 = float(_2188);
    int _2236 = int(_2082) + int(_2186);
    int _2238 = ~_2072;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = trunc(_2222);
    float _2246 = precise::max(_2244, 0.0);
    uint _2248 = uint(_2246);
    int _2250 = _2242;
    if (!_2076)
    {
        int _2252 = ~_2072;
        int _2254 = _2252 + 1;
        _2250 = _2254;
    }
    int _2256 = _2250;
    float _2258 = _1520 + _2194;
    float _2260 = _2234 * _2220;
    int _2262 = _2232 * _2236;
    int _2264 = _2262 + _2020;
    float _2266 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2218);
    int _2268 = int(_2098) + int(_2214);
    bool _2270 = !_2008;
    int _2272 = _2270 ? 0 : 1;
    int _2274 = ~_1918;
    int _2276 = _2274 + 1;
    bool _2278 = uint(_2264) >= uint(_1850);
    int _2280 = _2276 * _2268;
    int _2282 = _2280 + _2044;
    int _2284 = int(_2118) + int(_2228);
    int _2286 = abs(_2272);
    int _2288 = int(_2140) + int(_2248);
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2292 = ~_1976;
    int _2294 = _2292 + 1;
    int _2296 = ~_1994;
    int _2298 = _2296 + 1;
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2302 = _2294 * _2284;
    int _2304 = _2302 + _2084;
    float _2306 = float(_2256);
    float _2308 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2310 = float(_2286);
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2314 = !_2278;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2320 = uint(_2282) >= uint(_1918);
    int _2322 = _2298 * _2288;
    int _2324 = _2322 + _2092;
    float _2326 = _2310 * _2306;
    bool _2328 = !_1512;
    float _2330 = _2328 ? _207 : as_type<float>(_1540);
    float _2332 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2334 = !_2320;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2340 = uint(_2304) >= uint(_1976);
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2344 = _1978 + _2342;
    bool _2346 = uint(_2324) >= uint(_1994);
    float _2348 = _2326 * (-2.0);
    int _2350 = ~_2236;
    int _2352 = _2350 + _2316;
    int _2354 = _2352 + 1;
    out.m_70.x = _2332;
    out.m_70.y = _2338;
    out.m_70.z = _2300;
    out.m_70.w = _2308;
    int _2356 = ~_2268;
    int _2358 = _2356 + _2336;
    int _2360 = _2358 + 1;
    float _2362 = fma(_1788, _2348, _1788);
    bool _2364 = !_2340;
    int _2366 = _2364 ? 0 : (-1);
    float _2368 = in.m_72.x;
    float _2370 = in.m_72.y;
    float _2372 = in.m_72.z;
    bool _2374 = !_2346;
    int _2376 = _2374 ? 0 : (-1);
    int _2378 = _1918 * _2360;
    int _2380 = _2378 + _2044;
    bool _2382 = _1850 == 0;
    bool _2384 = _1850 == 0;
    int _2386 = ~_2366;
    int _2388 = _2284 + _2386;
    int _2390 = _2388 + 1;
    int _2392 = ~_2376;
    int _2394 = _2288 + _2392;
    int _2396 = _2394 + 1;
    float _2398 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2400 = _2020 ^ _1850;
    int _2402 = _1850 * _2354;
    int _2404 = _2402 + _2020;
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2408 = _2030 + _2406;
    uint _2410 = uint(int(uint(_2400) >> uint(31)));
    float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2398);
    bool _2414 = !_2382;
    int _2416 = _2414 ? _2404 : (-1);
    float _2418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2420 = ~int(_2410);
    int _2422 = _2420 + 1;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2426 = _2258 + _2424;
    bool _2428 = _1918 == 0;
    int _2430 = _2390 ^ _2422;
    float _2432 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2412);
    float _2434 = float(_2416);
    float _2436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2438 = ~_2422;
    int _2440 = _2438 + _2430;
    int _2442 = _2440 + 1;
    bool _2444 = !_2428;
    int _2446 = _2444 ? _2380 : (-1);
    bool _2448 = _2432 >= 0.0;
    float _2450 = fma(_2348, _2368, _2368);
    bool _2452 = !_2384;
    int _2454 = _2452 ? _2442 : (-1);
    float _2456 = _2260 * (-2.0);
    int _2458 = _2044 ^ _1918;
    float _2460 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2462 = _1918 == 0;
    float _2464 = _729 + (-0.5);
    uint _2466 = uint(int(uint(_2458) >> uint(31)));
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2470 = fma(_2456, _2370, _2370);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    int _2474 = ~int(_2466);
    int _2476 = _2474 + 1;
    float _2478 = fma(_2460, _2434, _1674);
    float _2480 = _1530 + 0.5;
    float _2482 = fma(_1842, _2456, _1842);
    int _2484 = _2396 ^ _2476;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2488 = float(_2446);
    float _2490 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2492 = ~_2476;
    int _2494 = _2492 + _2484;
    int _2496 = _2494 + 1;
    float _2498 = _2330 + 0.5;
    float _2500 = fma(_2460, _2480, _2478);
    float _2502 = fma(_2490, _2488, _1624);
    bool _2504 = !_2462;
    int _2506 = _2504 ? _2496 : (-1);
    float _2508 = _2344 * _2344;
    bool _2510 = _731 > 0.5;
    float _2512 = fma(_2490, _2498, _2502);
    float _2514 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2516 = -_211;
    int _2518 = _1458 ? as_type<int>(_2516) : as_type<int>(_211);
    float _2520 = fma(_2362, _1710, _2472);
    float _2522 = -_211;
    int _2524 = _2510 ? as_type<int>(_2522) : as_type<int>(_211);
    float _2526 = _2500;
    if (_2448)
    {
        out.m_49.x = 0.0;
    }
    bool _2528 = !_1500;
    float _2530 = _2528 ? _211 : as_type<float>(_2518);
    float _2532 = -_1680;
    float _2534 = _2532 + 1.0;
    bool _2536 = !_1506;
    float _2538 = _2536 ? _211 : as_type<float>(_2524);
    float _2540 = fma(_2408, _2408, _2508);
    float _2542 = float(_2506);
    float _2544 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2546 = float(_2454);
    float _2548 = fma(_2426, _2426, _2540);
    float _2550 = -_2534;
    float _2552 = fma(_1530, _2550, _2500);
    float _2554 = -_1704;
    float _2556 = fma(_2544, _2542, _2554);
    float _2558 = _2538 + (-0.5);
    float _2560 = rsqrt(_2548);
    float _2562 = -_1666;
    float _2564 = fma(_2514, _2546, _2562);
    float _2566 = _2530 + (-0.5);
    if (_2448)
    {
        _2526 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2568 = _2526;
    float _2570 = -_2514;
    float _2572 = fma(_2570, _2558, _2564);
    float _2574 = -_1590;
    float _2576 = _2574 + 1.0;
    float _2578 = -_1698;
    float _2580 = _2578 + 1.0;
    float _2582 = -_2544;
    float _2584 = fma(_2582, _2566, _2556);
    float _2586 = -_2576;
    float _2588 = fma(_2330, _2586, _2512);
    float _2590 = fma(_2538, _2580, _2572);
    if (_2448)
    {
        float _2592 = _2568 * 5.0;
        _1706 = as_type<int>(_2592);
    }
    int _2594 = _1706;
    float _2596 = fma(_2530, _1720, _2584);
    float _2598 = _657 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2600 = !_2016;
    int _2602 = _2600 ? 0 : 1;
    float _2604 = _731 + (-0.5);
    if (_2448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7754 = as_type<float>(_2594);
        out.gl_Position.z = _7754;
    }
    float _2606 = _2598 * _2560;
    int _2608 = abs(_2602);
    out.m_74.x = _2552;
    out.m_74.y = _2590;
    out.m_74.z = _2588;
    out.m_74.w = _2596;
    float _2610 = _2408 * _2606;
    float _2612 = _2344 * _2606;
    if (_2448)
    {
        return out;
    }
    float _2614 = -_2612;
    float _2616 = _1978 + _2614;
    float _2618 = _2426 * _2606;
    float _2620 = -_2610;
    float _2622 = _2030 + _2620;
    float _2624 = float(_1864);
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2628 = _2616 + _2626;
    float _2630 = -_2618;
    float _2632 = _2258 + _2630;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2622 + _2634;
    float _2638 = -_2612;
    float _2640 = _2344 + _2638;
    float _2642 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2644 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2646 = _2632 + _2644;
    float _2648 = float(_2608);
    float _2650 = fma(_2604, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2470);
    float _2652 = fma(_2636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2642);
    float _2654 = -_2610;
    float _2656 = _2408 + _2654;
    float _2658 = _2640 * _2640;
    float _2660 = fma(_2482, _1710, _2650);
    float _2662 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2652);
    float _2664 = _733 + _729;
    float _2666 = _2648 * _2624;
    float _2668 = fma(_2656, _2656, _2658);
    float _2670 = -_2618;
    float _2672 = _2426 + _2670;
    bool _2674 = _2662 >= 0.0;
    float _2676 = _2660 * 0.15915493667125701904296875;
    float _2678 = _2664 + (-1.0);
    float _2680 = _2666 * (-2.0);
    float _2682 = _2520 * 0.15915493667125701904296875;
    float _2684 = fma(_2672, _2672, _2668);
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2688 = _2676 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = _733 + (-0.5);
    float _2694 = fma(_2680, _2372, _2372);
    float _2696 = fma(_2686, _2680, _2686);
    float _2698 = _2656;
    int _2700 = as_type<int>(_2692);
    if (_2674)
    {
        _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2702 = _2698;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2694);
    float _2706 = _2682 * 6.283185482025146484375;
    float _2708 = sin(_2706);
    if (_2674)
    {
        out.m_49.x = 0.0;
    }
    if (_2674)
    {
        float _2710 = _2702 * 5.0;
        _2700 = as_type<int>(_2710);
    }
    int _2712 = _2700;
    float _2714 = fma(_2696, _1710, _2704);
    if (_2674)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7945 = as_type<float>(_2712);
        out.gl_Position.z = _7945;
    }
    float _2716 = _2682 * 6.283185482025146484375;
    float _2718 = cos(_2716);
    float _2720 = _2714 * 0.15915493667125701904296875;
    float _2722 = sqrt(_2684);
    float _2724 = _2676 * 6.283185482025146484375;
    float _2726 = cos(_2724);
    if (_2674)
    {
        return out;
    }
    float _2728 = _2720 * 6.283185482025146484375;
    float _2730 = cos(_2728);
    float _2732 = _2560 * _2722;
    float _2734 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2738 = _2708 * _2690;
    float _2740 = _657 * _2732;
    float _2742 = _2732 * _2734;
    float _2744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2746 = _2720 * 6.283185482025146484375;
    float _2748 = sin(_2746);
    float _2750 = _2718 * _2690;
    float _2752 = _2736 * _2742;
    float _2754 = _2718 * _2726;
    float _2756 = _2708 * _2726;
    float _2758 = _2744 * _2740;
    float _2760 = _2718 * _2730;
    float _2762 = _2726 * _2730;
    float _2764 = _2708 * _2730;
    float _2766 = _2690 * _2730;
    float _2768 = _2760 * _2752;
    float _2770 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2772 = _2770 * 0.5;
    float _2774 = fma(_2748, _2754, _2738);
    float _2776 = -_2756;
    float _2778 = fma(_2748, _2750, _2776);
    float _2780 = -_2752;
    float _2782 = _2748 * _2780;
    float _2784 = -_2750;
    float _2786 = fma(_2748, _2756, _2784);
    float _2788 = fma(_2774, _2758, _2768);
    float _2790 = _2764 * _2752;
    float _2792 = fma(_2762, _2758, _2782);
    float _2794 = fma(_2748, _2738, _2754);
    float _2796 = fma(_2778, _2772, _2788);
    float _2798 = fma(_2786, _2758, _2790);
    float _2800 = fma(_2766, _2772, _2792);
    float _2802 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2804 = fma(_2794, _2772, _2798);
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2808 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2802);
    float _2810 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2806);
    float _2812 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2808);
    float _2814 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2810);
    float _2816 = _2812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2818 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2820 = _2814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2822 = _2258 + _2816;
    float _2824 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2818);
    float _2826 = _2030 + _2820;
    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2830 = _2822 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2834 = _2826 + _2832;
    float _2836 = _2830 * _2830;
    float _2838 = fma(_2834, _2834, _2836);
    float _2840 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2842 = sqrt(_2838);
    float _2844 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2840);
    float _2846 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2824);
    float _2848 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2844);
    float _2850 = _2848 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2852 = _1978 + _2850;
    bool _2854 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = _2850;
    float _2858 = _2824;
    float _2860 = _2826;
    if (!_2854)
    {
        _2856 = _2826;
    }
    float _2862 = _2856;
    float _2864 = _2862;
    if (!_2854)
    {
        _2858 = _2822;
    }
    float _2866 = _2858;
    float _2868 = _2866;
    if (!_2854)
    {
        _2860 = _2852;
    }
    float _2870 = _2860;
    bool _2872 = !_2854;
    float _2874 = _2870;
    if (!_2872)
    {
        float _2876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2880 = _2842 + _2878;
        float _2882 = rsqrt(_2838);
        float _2884 = _2880 * _2876;
        float _2886 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2888 = _2884 * 0.15915493667125701904296875;
        float _2890 = _2888 * 6.283185482025146484375;
        float _2892 = cos(_2890);
        float _2894 = _2888 * 6.283185482025146484375;
        float _2896 = sin(_2894);
        float _2898 = _2892 + (-1.0);
        float _2900 = fma(_2896, _2886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2902 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2904 = _2882 * _2900;
        float _2906 = fma(_2852, _2892, _2902);
        float _2908 = fma(_2834, _2904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2910 = fma(_2830, _2904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2874 = _2906;
        _2864 = _2908;
        _2868 = _2910;
    }
    float _2912 = _2874;
    float _2914 = _2864;
    float _2916 = _2868;
    float _2918 = -_1978;
    float _2920 = _2918 + _2912;
    float _2922 = -_2030;
    float _2924 = _2922 + _2914;
    float _2926 = -_2258;
    float _2928 = _2926 + _2916;
    float _2930 = _2846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2932 = _2920 * _2920;
    float _2934 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2936 = 1.0 / _2930;
    float _2938 = fma(_2924, _2924, _2932);
    float _2940 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2934);
    bool _2942 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2944 = isnan(0.5);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2950 = _2946 || _2948;
    float _2952 = fma(_2928, _2928, _2938);
    float _2954 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2940);
    bool _2956 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2958 = isnan(0.5);
    bool _2960 = _2956 || _2958;
    bool _2962 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2964 = _2960 || _2962;
    float _2966 = sqrt(_2952);
    float _2968 = _2954 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2970 = _2968 + _2930;
    float _2972 = _2970 * _2936;
    float _2974 = _2972 * 0.5;
    bool _2976 = _2966 > 0.0;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2980 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2978);
    float _2982 = 1.0 / _2980;
    float _2984 = _2930;
    float _2986 = _2974;
    float _2988 = _2936;
    if (!_2976)
    {
        _2984 = _2914;
    }
    float _2990 = _2984;
    float _2992 = _2990;
    if (!_2976)
    {
        _2986 = _2912;
    }
    float _2994 = _2986;
    float _2996 = _2994;
    if (!_2976)
    {
        _2988 = _2916;
    }
    float _2998 = _2988;
    bool _3000 = !_2976;
    float _3002 = _2998;
    float _3004 = _2998;
    if (!_3000)
    {
        float _3006 = _227 * _227;
        float _3008 = rsqrt(_2952);
        float _3010 = fma(_223, _223, _3006);
        float _3012 = fma(_229, _229, _3010);
        float _3014 = sqrt(_3012);
        float _3016 = _2924 * _3008;
        float _3018 = _2920 * _3008;
        float _3020 = _2928 * _3008;
        bool _3022 = _3014 > 0.0;
        float _3024 = _3014;
        float _3026 = _3010;
        if (!_3022)
        {
            _3024 = _2914;
        }
        float _3028 = _3024;
        _2992 = _3028;
        if (!_3022)
        {
            _3026 = _2912;
        }
        float _3030 = _3026;
        _2996 = _3030;
        if (!_3022)
        {
            _3002 = _2916;
        }
        float _3032 = _3002;
        bool _3034 = !_3022;
        _3004 = _3032;
        if (!_3034)
        {
            float _3036 = rsqrt(_3012);
            float _3038 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3040 = _227 * _3036;
            float _3042 = _223 * _3036;
            float _3044 = _3018 * _3040;
            float _3046 = _229 * _3036;
            float _3048 = fma(_3016, _3042, _3044);
            float _3050 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3052 = fma(_3020, _3046, _3048);
            float _3054 = _3052 * _3050;
            float _3056 = fma(_223, _3054, _2914);
            float _3058 = fma(_227, _3054, _2912);
            float _3060 = fma(_229, _3054, _2916);
            _2992 = _3056;
            _2996 = _3058;
            _3004 = _3060;
        }
    }
    float _3062 = _2992;
    float _3064 = _2996;
    float _3066 = _3004;
    float _3068 = -_2610;
    float _3070 = _3068 + _3062;
    float _3072 = -_2612;
    float _3074 = _3072 + _3064;
    float _3076 = -_2618;
    float _3078 = _3076 + _3066;
    float _3080 = _3074;
    float _3082 = _3070;
    float _3084 = _3078;
    float _3086 = _3064;
    if (_2964)
    {
        _237 = 1.0;
    }
    float _3088 = _237;
    float _3090 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3092 = _2982 * _3090;
    float _3094 = _3088;
    if (!_2950)
    {
        float _3096 = _2628 * _2628;
        float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3100 = -_2258;
        float _3102 = _3100 + _3066;
        float _3104 = -_1978;
        float _3106 = _3104 + _3064;
        float _3108 = fma(_2636, _2636, _3096);
        float _3110 = fma(_2646, _2646, _3108);
        float _3112 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3114 = sqrt(_3110);
        float _3116 = 1.0 / _2732;
        float _3118 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3120 = precise::min(_3114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3122 = _3120 * _3098;
        float _3124 = _3122 * _3116;
        float _3126 = -_2030;
        float _3128 = _3126 + _3062;
        float _3130 = _3118 * _3124;
        float _3132 = _3102 * _3124;
        float _3134 = fma(_3106, _3130, _2616);
        float _3136 = fma(_3128, _3130, _2622);
        float _3138 = fma(_3118, _3132, _2632);
        _3080 = _3134;
        _3082 = _3136;
        _3084 = _3138;
        _239 = _3124;
    }
    float _3140 = _3080;
    float _3142 = _3082;
    float _3144 = _3084;
    float _3146 = _239;
    float _3148 = _3146;
    if (!_2964)
    {
        float _3150 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3152 = _3150 * 0.15915493667125701904296875;
        float _3154 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3158 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3156;
        float _3160 = _3152 * 6.283185482025146484375;
        float _3162 = cos(_3160);
        float _3164 = _3154 * 0.15915493667125701904296875;
        float _3166 = _3152 * 6.283185482025146484375;
        float _3168 = sin(_3166);
        float _3170 = 1.0 / _3162;
        float _3172 = _3164 * 6.283185482025146484375;
        float _3174 = cos(_3172);
        float _3176 = _3168 * _3170;
        float _3178 = _3164 * 6.283185482025146484375;
        float _3180 = sin(_3178);
        float _3182 = _3174 * _3176;
        float _3184 = 1.0 / _3158;
        float _3186 = 1.0 / _3182;
        float _3188 = _3180 * _3186;
        float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3192 = fma(_3092, _3188, _3190);
        float _3194 = _3192 * _3184;
        float _3196 = precise::clamp(_3194, 0.0, 1.0);
        _3148 = _3164;
        _3086 = _3152;
        _3094 = _3196;
    }
    float _3198 = _3148;
    float _3200 = _3086;
    float _3202 = _3094;
    float _3204 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3206 = _3140 + _3204;
    float _3208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3210 = _3142 + _3208;
    float _3212 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3214 = _3144 + _3212;
    float _3216 = _3206 * _3206;
    float _3218 = fma(_3210, _3210, _3216);
    float _3220 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3222 = fma(_3214, _3214, _3218);
    float _3224 = rsqrt(_3222);
    float _3226 = sqrt(_3222);
    float _3228 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3230 = _3210 * _3228;
    float _3232 = _3214 * _3228;
    float _3234 = _3230 * _3230;
    float _3236 = _3232 * _3232;
    float _3238 = _3234 + _3236;
    float _3240 = sqrt(_3238);
    bool _3242 = _3240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3246 = _3240 + _3244;
    float _3248 = _3224;
    float _3250 = _3246;
    float _3252 = _3198;
    float _3254 = _3206;
    float _3256 = _3238;
    if (_3242)
    {
        float _3258 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3248 = _3258;
    }
    float _3260 = _3248;
    float _3262 = _3260;
    if (_3242)
    {
        float _3264 = _3246 * _3260;
        _3250 = _3264;
    }
    float _3266 = _3250;
    if (_3242)
    {
        float _3268 = rsqrt(_3238);
        _3262 = _3268;
    }
    float _3270 = _3262;
    float _3272 = _3270;
    if (_3242)
    {
        float _3274 = _3266 * 0.15915493667125701904296875;
        _3252 = _3274;
    }
    float _3276 = _3252;
    float _3278 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3280 = _3214;
    float _3282 = _3276;
    if (_3242)
    {
        float _3284 = _3276 * 6.283185482025146484375;
        float _3286 = sin(_3284);
        _3280 = _3286;
    }
    float _3288 = _3280;
    float _3290 = precise::max(0.0, _3278);
    float _3292 = _3200;
    float _3294 = _3290;
    if (_3242)
    {
        float _3296 = _3276 * 6.283185482025146484375;
        float _3298 = cos(_3296);
        _3292 = _3298;
    }
    float _3300 = _3292;
    float _3302 = -_3228;
    float _3304 = -_3290;
    float _3306 = fma(_3206, _3302, _3304);
    if (_3242)
    {
        float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3254 = _3308;
    }
    float _3310 = _3254;
    float _3312 = _3288;
    float _3314 = _3310;
    if (_3242)
    {
        float _3316 = fma(_3288, _3310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3312 = _3316;
    }
    float _3318 = _3312;
    float _3320 = _3318;
    if (!_3242)
    {
        _3282 = _3230;
    }
    float _3322 = _3282;
    float _3324 = _3322;
    if (_3242)
    {
        float _3326 = _3270 * _3318;
        _3314 = _3326;
    }
    float _3328 = _3314;
    if (!_3242)
    {
        _3272 = _3306;
    }
    float _3330 = _3272;
    float _3332 = _3330;
    float _3334 = _3300;
    if (_3242)
    {
        float _3336 = _3300 + (-1.0);
        _3294 = _3336;
    }
    float _3338 = _3294;
    float _3340 = _3338;
    if (_3242)
    {
        float _3342 = _3230 * _3328;
        _3324 = _3342;
    }
    float _3344 = _3324;
    if (!_3242)
    {
        _3320 = _3234;
    }
    float _3346 = _3320;
    float _3348 = _3346;
    if (_3242)
    {
        float _3350 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3256 = _3350;
    }
    float _3352 = _3256;
    if (!_3242)
    {
        _3340 = _3232;
    }
    float _3354 = _3340;
    float _3356 = _3354;
    if (_3242)
    {
        float _3358 = _3344 * _3344;
        _3348 = _3358;
    }
    float _3360 = _3348;
    if (_3242)
    {
        float _3362 = _3232 * _3328;
        _3356 = _3362;
    }
    float _3364 = _3356;
    if (_3242)
    {
        float _3366 = fma(_3306, _3300, _3352);
        _3332 = _3366;
    }
    float _3368 = _3332;
    if (!_3242)
    {
        _3334 = _3236;
    }
    float _3370 = _3334;
    float _3372 = floor(_3220);
    float _3374 = _3370;
    if (_3242)
    {
        float _3376 = _3364 * _3364;
        _3374 = _3376;
    }
    float _3378 = _3374;
    float _3380 = fma(_3368, _3368, _3360);
    float _3382 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3384 = _3380 + _3378;
    float _3386 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3382);
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3390 = fma(_3226, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3388);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = rsqrt(_3384);
    float _3396 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3386);
    float _3398 = -_3392;
    float _3400 = _3398 + 1.0;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3404 = _3396 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3406 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3408 = fma(_2632, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3410 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3412 = _3404 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3414 = abs(_3400);
    float _3416 = log2(_3414);
    float _3418 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3406);
    float _3420 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3410);
    float _3422 = -_3412;
    float _3424 = fma(_3422, _3402, 1.0);
    float _3426 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3428 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3418);
    float _3430 = _3394 * _3344;
    float _3432 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3420);
    float _3434 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3426);
    float _3436 = _3394 * _3368;
    float _3438 = _3394 * _3364;
    float _3440 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3442 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3434);
    float _3444 = _3432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3446 = floor(_3408);
    float _3448 = -_3440;
    float _3450 = fma(_3436, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3448);
    float _3452 = _3442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3454 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3456 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3458 = -_3438;
    float _3460 = fma(_3458, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3450);
    float _3462 = -_3372;
    float _3464 = _3220 + _3462;
    float _3466 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3454);
    float _3468 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3470 = exp2(_3456);
    float _3472 = fma(_3460, -0.5, 0.5);
    float _3474 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3466);
    float _3476 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3478 = fma(_3460, 0.5, 0.5);
    float _3480 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3474);
    float _3482 = -_3446;
    float _3484 = _3408 + _3482;
    float _3486 = log2(_3424);
    float _3488 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3476);
    float _3490 = _3436 + 1.0;
    float _3492 = fma(_3478, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3494 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3488);
    float _3496 = fma(_3478, _3492, -0.212114393711090087890625);
    float _3498 = 1.0 / _3480;
    float _3500 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3502 = sqrt(_3472);
    float _3504 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3500);
    float _3506 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3494);
    float _3508 = _3486 * 0.693147182464599609375;
    float2 _9211 = float2(_3464, _3484);
    float _3510 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9211, float2(0.0), isnan(_9211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9211, float2(0.0), isnan(_9211)), level(0.0)).x;
    float _3512 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3504);
    float _3514 = fma(_3478, _3496, 1.570728778839111328125);
    float _3516 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3518 = _3506 * _3498;
    float _3520 = -_3436;
    float _3522 = fma(_3470, _3490, _3520);
    float _3524 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3512);
    float _3526 = fma(_3518, 0.5, 0.5);
    float _3528 = fma(_3522, 0.5, 0.5);
    float _3530 = _3524 * _3498;
    float _3532 = _3502 * 0.636619746685028076171875;
    float _3534 = fma(_3530, -0.5, 0.5);
    float _3536 = -_3514;
    float _3538 = fma(_3532, _3536, 1.0);
    float3 _9266 = float3(_3526, _3534, _3516);
    float _3540 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9266, float3(0.0), isnan(_9266)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9266, float3(0.0), isnan(_9266)), level(0.0)).x;
    float3 _9277 = float3(_3526, _3534, _3516);
    float4 _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9277, float3(0.0), isnan(_9277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9277, float3(0.0), isnan(_9277)), level(0.0)).xyzw;
    float _3545 = _3543.x;
    float _3547 = _3543.y;
    float _3549 = _3543.z;
    float _3551 = _3543.w;
    float2 _9293 = float2(_3538, _3528);
    float3 _3555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9293, float2(0.0), isnan(_9293)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9293, float2(0.0), isnan(_9293)), level(0.0)).xyz;
    float _3557 = _3555.x;
    float _3559 = _3555.y;
    float _3561 = _3555.z;
    float _3563 = abs(_3092);
    float _3565 = log2(_3563);
    float _3567 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3569 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3571 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3573 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3575 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3567);
    float _3577 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3579 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3569);
    float _3581 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3571);
    float _3583 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3585 = -_2748;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3577);
    float _3589 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3591 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3593 = -_2748;
    float _3595 = fma(_3593, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3583);
    float _3597 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3573);
    float _3599 = -_2748;
    float _3601 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3589);
    float _3603 = _3565 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3605 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3607 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3591);
    float _3609 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3601);
    float _3611 = exp2(_3603);
    float _3613 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3605);
    float _3615 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3587);
    float _3617 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3595);
    float _3619 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3613);
    float _3621 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3607);
    float _3623 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3625 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3597);
    float _3627 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3575);
    float _3629 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = fma(_3623, _3623, 1.0);
    float _3633 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_76.x = _3142;
    out.m_76.y = _3140;
    out.m_76.z = _3144;
    bool _3635 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3637 = isnan(_3226);
    bool _3639 = _3635 || _3637;
    bool _3641 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3643 = _3639 || _3641;
    float _3645 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3647 = precise::clamp(_3645, 0.0, 1.0);
    float _3649 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3579);
    float _3651 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3581);
    float _3653 = rsqrt(_3631);
    float _3655 = fma(_3647, -2.0, 3.0);
    float _3657 = _3647 * _3647;
    float _3659 = _3623 * _3617;
    out.m_78.x = _3627;
    out.m_78.y = _3649;
    out.m_78.z = _3651;
    float _3661 = _3623 * _3615;
    float _3663 = _3657 * _3655;
    float _3665 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3667 = exp2(_3629);
    float _3669 = fma(_3633, _3649, _3659);
    float _3671 = -_3663;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3665);
    float _3677 = fma(_3633, _3627, _3661);
    float _3679 = fma(_3673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3663);
    float _3681 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    bool _3683 = _3092 <= 8000.0;
    bool _3685 = isnan(_3092);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan(8000.0);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = in.m_80.x;
    float _3697 = _3623 * _3653;
    float _3699 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3681);
    float _3701 = _3693 * _3679;
    float _3703 = -_3619;
    float _3705 = _3697 * _3703;
    float _3707 = -_3621;
    float _3709 = _3697 * _3707;
    float _3711 = -_3667;
    float _3713 = _3711 + 1.0;
    float _3715 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3717 = -_3625;
    float _3719 = _3697 * _3717;
    float _3721 = _3621 + _3669;
    float _3723 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3725 = fma(_3653, _3615, _3705);
    float _3727 = _3623 * _3609;
    float _3729 = fma(_3653, _3617, _3709);
    float _3731 = fma(_3653, _3609, _3719);
    out.gl_Position.x = _3506;
    out.gl_Position.y = _3524;
    out.gl_Position.z = _3699;
    out.gl_Position.w = _3480;
    float _3733 = _3699 + _3480;
    float _3735 = fma(_3633, _3651, _3727);
    out.m_82.x = _3725;
    out.m_82.y = _3729;
    out.m_82.z = _3731;
    float _3737 = _3733 * 0.5;
    float _3739 = _3619 + _3677;
    float _3741 = _3625 + _3735;
    out.m_84.z = _3737;
    out.m_84.w = _3480;
    out.m_86.x = _3739;
    out.m_86.y = _3721;
    out.m_86.z = _3741;
    float _3743 = _3480;
    float _3745 = _3699;
    float _3747 = _3524;
    if (!_3643)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3749 = _3743;
    float _3751 = _3749;
    float _3753 = _3749;
    if (!_3643)
    {
        _3745 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3755 = _3745;
    float _3757 = _3755;
    float _3759 = _3755;
    if (!_3643)
    {
        _3747 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3761 = _3747;
    float _3763 = -_3510;
    float _3765 = _3763 + 1.0;
    float _3767 = _3765 * _3715;
    float _3769 = precise::clamp(_3767, 0.0, 1.0);
    float _3771 = -_3769;
    float _3773 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3775 = _3773 * _3695;
    float _3777 = _3775 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3779 = _3723 * _3540;
    float _3781 = -_3723;
    float _3783 = _3781 + 1.0;
    out.m_88.x = _3777;
    float _3785 = _3551 * _3779;
    float _3787 = _3561 * _3779;
    float _3789 = _3551 * _3783;
    float _3791 = _3779;
    float _3793 = _3547;
    float _3795 = _3545;
    float _3797 = _3761;
    float _3799 = _3761;
    if (!_3643)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3801 = _3791;
    float _3803 = fma(_3557, _3785, _3545);
    float _3805 = fma(_3559, _3785, _3547);
    float _3807 = fma(_3551, _3787, _3549);
    float _3809 = _3202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3811 = _3801;
    float _3813 = _3801;
    if (!_3643)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3815 = _3793;
    float _3817 = _3815;
    float _3819 = _3815;
    if (!_3643)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3795;
    out.m_90.x = _3803;
    out.m_90.y = _3805;
    out.m_90.z = _3807;
    out.m_90.w = _3789;
    bool _3823 = !_3643;
    float _3825 = _3821;
    float _3827 = _3821;
    if (!_3823)
    {
        bool _3829 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3831 = isnan(_3226);
        bool _3833 = _3829 || _3831;
        bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3837 = _3833 || _3835;
        if (!_3837)
        {
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3841 = _3226 + _3839;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3843;
            float _3847 = 1.0 / _3845;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3869 = _3841 * _3847;
            float _3871 = precise::clamp(_3869, 0.0, 1.0);
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3877 = fma(_3871, _3851, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3827 = _3879;
            _3799 = _3885;
            _3819 = _3877;
            _3759 = _3883;
            _3753 = _3881;
            _3813 = _3887;
            _3889 = true;
        }
        else
        {
            bool _3891 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3893 = isnan(_3226);
            bool _3895 = _3891 || _3893;
            bool _3897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3899 = _3895 || _3897;
            if (!_3899)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3901 = _3817;
            _3819 = _3901;
            if (!_3899)
            {
                _3825 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3903 = _3825;
            _3827 = _3903;
            if (!_3899)
            {
                _3751 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3905 = _3751;
            _3753 = _3905;
            if (!_3899)
            {
                _3757 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3907 = _3757;
            _3759 = _3907;
            if (!_3899)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3909 = _3797;
            _3799 = _3909;
            if (!_3899)
            {
                _3811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3911 = _3811;
            bool _3913 = !_3899;
            _3813 = _3911;
            if (!_3913)
            {
                bool _3915 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3917 = isnan(_3226);
                bool _3919 = _3915 || _3917;
                bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3923 = _3919 || _3921;
                if (!_3923)
                {
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3927 = _3226 + _3925;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3931 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3929;
                    float _3933 = 1.0 / _3931;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3955 = _3927 * _3933;
                    float _3957 = precise::clamp(_3955, 0.0, 1.0);
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3963 = fma(_3957, _3937, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3965 = fma(_3957, _3961, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3967 = fma(_3957, _3941, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3969 = fma(_3957, _3945, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3971 = fma(_3957, _3949, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3973 = fma(_3957, _3953, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3827 = _3965;
                    _3799 = _3971;
                    _3819 = _3963;
                    _3759 = _3969;
                    _3753 = _3967;
                    _3813 = _3973;
                    _3889 = true;
                }
                else
                {
                    _3827 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3759 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3753 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3889 = false;
    float _3975 = _3827;
    float _3977 = _3799;
    float _3979 = _3819;
    float _3981 = _3759;
    float _3983 = _3753;
    float _3985 = _3813;
    float _3987 = fma(_3721, -0.5, 0.5);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -_3975;
    float _3993 = _3991 + _3977;
    float _3995 = -_3979;
    float _3997 = _3995 + _3981;
    out.m_92.x = 0.0;
    float _3999 = fma(_3989, _3993, _3975);
    float _4001 = -_3983;
    float _4003 = _4001 + _3985;
    float _4005 = fma(_3989, _3997, _3979);
    float _4007 = _3999 * 0.586610972881317138671875;
    bool _4009 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4011 = fma(_3989, _4003, _3983);
    float _4013 = _3809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4015 = fma(_4005, 0.298911988735198974609375, _4007);
    bool _4017 = _3202 > 0.0;
    bool _4019 = isnan(_3202);
    bool _4021 = _4017 || _4019;
    bool _4023 = isnan(0.0);
    bool _4025 = _4021 || _4023;
    float _4027 = fma(_4011, 0.114477999508380889892578125, _4015);
    out.m_49.x = _4013;
    float _4029 = -_4027;
    float _4031 = _4005 + _4029;
    float _4033 = -_4027;
    float _4035 = _3999 + _4033;
    float _4037 = -_4027;
    float _4039 = _4011 + _4037;
    float _4041 = fma(_4031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4043 = fma(_4035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4045 = fma(_4039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    bool _4047 = !_4009;
    if (!_4047)
    {
        float _4049 = -_3140;
        float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4053 = -_3142;
        float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4057 = -_3144;
        float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4061 = _4051 * _4051;
        float _4063 = fma(_4055, _4055, _4061);
        float _4065 = fma(_4059, _4059, _4063);
        float _4067 = sqrt(_4065);
        float _4069 = rsqrt(_4065);
        float _4071 = -_4067;
        float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4077 = precise::clamp(_4075, 0.0, 1.0);
        float _4079 = _4055 * _4069;
        float _4081 = _4051 * _4069;
        float _4083 = abs(_4077);
        float _4085 = log2(_4083);
        float _4087 = _4059 * _4069;
        float _4089 = _4079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4091 = _3721 * _4081;
        float _4093 = -_4081;
        float _4095 = -_4089;
        float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4095);
        float _4099 = fma(_3739, _4079, _4091);
        float _4101 = -_4087;
        float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4097);
        float _4105 = fma(_3741, _4087, _4099);
        float _4107 = precise::clamp(_4105, 0.0, 1.0);
        float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4111 = _4103 + _4109;
        float _4113 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4117 = precise::clamp(_4115, 0.0, 1.0);
        float _4119 = exp2(_4113);
        float _4121 = _4119 * _4117;
        float _4123 = _4107 * _4121;
        float _4125 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4129 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4125;
        out.m_92.y = _4127;
        out.m_92.z = _4129;
    }
    out.m_94.x = _4041;
    out.m_94.y = _4043;
    out.m_94.z = _4045;
    if (_4025)
    {
        return out;
    }
    float _4131 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4131;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3889 = false;
    bool _643 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4188 = as_type<float>(_129);
        out.gl_Position.z = _4188;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_51.w;
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
        float _151 = float(_113);
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
        out.m_49.x = 0.0;
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
        float _4258 = as_type<float>(_167);
        out.gl_Position.z = _4258;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_56.x;
    float _173 = in.m_56.y;
    float _175 = in.m_56.z;
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_175, _181, _217);
    float _225 = fma(_171, _189, _219);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _225);
    bool _231 = !_203;
    float _233 = _183;
    float _235 = _187;
    float _237 = _223;
    float _239 = _227;
    float _257;
    if (!_231)
    {
        float _241 = in.m_64.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_113);
        float _263 = 1.0 / _261;
        float _265 = _147 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    bool _277 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_267);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _267 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _295;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _299;
    float _313 = _303 * _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _271 * _309;
    bool _329 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_267);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -_287;
    float _343 = _341 + 1.0;
    bool _345 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _347 = isnan(_267);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _339 * _343;
    float _359 = _275 * _311;
    float _361 = -_339;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = _355 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -_355;
    float _381 = _379 + 1.0;
    float _383 = fma(_367, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_377, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = _325 * _381;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -_325;
    float _395 = _393 + 1.0;
    float _397 = _385 * _387;
    float _399 = _383 * _387;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_391, _313, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _409 = fma(_371, _313, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _417 = fma(_403, _359, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_405, _373, _407);
    float _421 = fma(_413, _359, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_409, _373, _415);
    float _425 = fma(_417, _357, _419);
    float _427 = fma(_421, _357, _423);
    float _429 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_305;
    float _451;
    if (!_433)
    {
        float _435 = in.m_64.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_113);
        float _457 = 1.0 / _455;
        float _459 = _147 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_461);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _491 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _493 = isnan(_461);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _469;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _505;
    float _509 = -_485;
    float _511 = _509 + 1.0;
    bool _513 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_461);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _527 = 1.0 / _473;
    float _529 = 1.0 / _489;
    float _531 = _507 * _503;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = _501 * _511;
    float _539 = -_501;
    float _541 = _539 + 1.0;
    float _543 = fma(_531, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = _523 * _541;
    float _551 = _535 * _527;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _461 + _553;
    bool _557 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_461);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _543 * _549;
    float _571 = -_523;
    float _573 = _571 + 1.0;
    float _575 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _461 + _577;
    float _581 = _547 * _529;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _589 = fma(_581, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _485 * _585;
    float _593 = fma(_575, _537, _587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _597 = fma(_589, _591, _593);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _601 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = in.m_66.x;
    float _611 = in.m_66.y;
    float _613 = _603 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _607;
    out.m_68.y = _601;
    out.m_68.z = _615;
    out.m_68.w = _613;
    float _617 = _431 * _611;
    float _619 = _429 * _609;
    bool _621 = !_525;
    float _623 = _541;
    float _641;
    if (!_621)
    {
        float _625 = in.m_64.x;
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_113);
        float _647 = 1.0 / _645;
        float _649 = _147 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _655 = int(_653);
    float _657 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _665 = int(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _671 = float(_655);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _675 = int(_673);
    if (_661)
    {
        float _677 = in.m_64.x;
        _623 = _677;
    }
    float _679 = _623;
    float _681 = _679;
    if (!_661)
    {
        float _683 = in.m_64.y;
        _681 = _683;
    }
    float _685 = _681;
    float _687 = float(_665);
    float _689 = 1.0 / _671;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _693 = int(_691);
    float _695 = float(uint(_675));
    int _697 = ~_675;
    int _699 = _697 + 1;
    bool _701 = _675 == 0;
    float _703 = 1.0 / _687;
    float _705 = _689 * _147;
    float _707 = 1.0 / _695;
    float _709 = float(uint(_693));
    int _711 = ~_693;
    int _713 = _711 + 1;
    int _715 = ~_693;
    int _717 = _715 + 1;
    float _719 = trunc(_705);
    int _721 = int(_719);
    float _723 = _703 * _147;
    float _725 = 1.0 / _709;
    int _727 = as_type<int>(_707) + (-2);
    float _729 = in.m_64.x;
    float _731 = in.m_64.y;
    float _733 = in.m_64.z;
    float _735 = in.m_64.w;
    float _737 = trunc(_723);
    int _739 = int(_737);
    float _741 = float(uint(_721));
    float _743 = as_type<float>(_727) * _741;
    float _745 = _741;
    if (_661)
    {
        _745 = 1.0;
    }
    float _747 = _745;
    float _749 = 1.0 / _669;
    int _751 = as_type<int>(_725) + (-2);
    float _753 = _747;
    if (!_661)
    {
        _753 = 7.345489978790283203125;
    }
    float _755 = _753;
    float _757 = trunc(_743);
    float _759 = precise::max(_757, 0.0);
    uint _762 = uint(_759);
    float _764 = float(uint(_739));
    float _766 = float(_739);
    float _768 = as_type<float>(_751) * _764;
    float _770 = _755 * _729;
    float _772 = trunc(_768);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    int _778 = _699 * int(_762);
    int _780 = _778 + _721;
    float _782 = float(_113);
    float _784 = float(uint(_780));
    float _786 = floor(_770);
    int _788 = ~_675;
    int _790 = _788 + 1;
    float _792 = as_type<float>(_727) * _784;
    int _794 = _713 * int(_776);
    int _796 = _794 + _739;
    float _798 = _784;
    if (_661)
    {
        _798 = 1.0;
    }
    float _800 = _798;
    float _802 = _800;
    if (!_661)
    {
        _802 = 1.2345600128173828125;
    }
    float _804 = _802;
    float _806 = 1.0 / _782;
    float _808 = float(uint(_796));
    float _810 = _804 * _685;
    float _812 = float(_721);
    float _814 = as_type<float>(_751) * _808;
    float _816 = float(_675);
    float _818 = trunc(_792);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = -_786;
    float _826 = _770 + _824;
    bool _828 = _812 >= _816;
    bool _830 = isnan(_812);
    bool _832 = _828 || _830;
    bool _834 = isnan(_816);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = trunc(_814);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = int(_762) + int(_822);
    float _848 = floor(_810);
    int _850 = _790 * _846;
    int _852 = _850 + _721;
    float _854 = _826 * _816;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _858 = _856 != 0;
    int _860 = int(_776) + int(_844);
    float _862 = trunc(_838);
    int _864 = int(_862);
    bool _866 = uint(_852) >= uint(_675);
    bool _868 = !_858;
    int _870 = _868 ? 0 : 1;
    int _872 = _717 * _860;
    int _874 = _872 + _739;
    bool _876 = !_866;
    int _878 = _876 ? 0 : (-1);
    float _880 = -_848;
    float _882 = _810 + _880;
    float _884 = trunc(_854);
    int _886 = int(_884);
    int _888 = ~_846;
    int _890 = _888 + _878;
    int _892 = _890 + 1;
    float _894 = _806 * _147;
    int _896 = abs(_870);
    bool _898 = uint(_874) >= uint(_693);
    int _900 = _675 * _892;
    int _902 = _900 + _721;
    int _904 = ~_864;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _920 = _918 != 0;
    bool _922 = !_701;
    int _924 = _922 ? _902 : (-1);
    bool _926 = !_898;
    int _928 = _926 ? 0 : (-1);
    int _930 = _886 * _896;
    int _932 = _930 + _721;
    float _934 = _816 * _894;
    float _936 = float(_693);
    int _938 = _924 * _908;
    bool _940 = !_912;
    int _942 = _940 ? 0 : 1;
    int _944 = ~_860;
    int _946 = _944 + _928;
    int _948 = _946 + 1;
    float _950 = trunc(_934);
    int _952 = int(_950);
    bool _954 = _766 >= _936;
    bool _956 = isnan(_766);
    bool _958 = _954 || _956;
    bool _960 = isnan(_936);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = _936 * _894;
    bool _968 = !_916;
    int _970 = _968 ? 0 : 1;
    int _972 = _693 * _948;
    int _974 = _972 + _739;
    int _976 = _675 + (-1);
    int _978 = abs(_942);
    float _980 = trunc(_964);
    int _982 = int(_980);
    int _984 = abs(_970);
    int _986 = _864 * _976;
    int _988 = _986 + _938;
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    int _994 = _988 * _984;
    int _996 = abs(_992);
    float _998 = _882 * _936;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1002 = _1000 != 0;
    int _1004 = _952 * _978;
    int _1006 = _1004 + _994;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1010 = _1008 != 0;
    bool _1012 = !_1002;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = trunc(_998);
    int _1018 = int(_1016);
    bool _1020 = !_1010;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _932 * _996;
    int _1026 = _1024 + _1006;
    bool _1028 = _693 == 0;
    int _1030 = abs(_1014);
    int _1032 = abs(_1022);
    int _1034 = ~_982;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    bool _1040 = !_1028;
    int _1042 = _1040 ? _974 : (-1);
    int _1044 = _886 * _1032;
    int _1046 = _1044 + _1026;
    int _1048 = _693 + (-1);
    float _1050 = trunc(_966);
    int _1052 = int(_1050);
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1068 = _1066 != 0;
    int _1070 = _1042 * _1038;
    float _1072 = float(uint(_1046));
    int _1074 = _1018 * _1030;
    int _1076 = _1074 + _739;
    bool _1078 = _675 == 0;
    int _1080 = _982 * _1048;
    int _1082 = _1080 + _1070;
    bool _1084 = !_1060;
    int _1086 = _1084 ? 0 : 1;
    float _1088 = as_type<float>(_727) * _1072;
    bool _1090 = !_1056;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = !_1064;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = trunc(_1088);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = abs(_1086);
    int _1106 = abs(_1092);
    bool _1108 = !_1068;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _1082 * _1104;
    int _1114 = abs(_1096);
    int _1116 = abs(_1110);
    int _1118 = _1052 * _1106;
    int _1120 = _1118 + _1112;
    int _1122 = ~_675;
    int _1124 = _1122 + 1;
    int _1126 = _1076 * _1114;
    int _1128 = _1126 + _1120;
    float _1130 = float(uint(_932));
    int _1132 = ~_693;
    int _1134 = _1132 + 1;
    int _1136 = _1018 * _1116;
    int _1138 = _1136 + _1128;
    float _1140 = as_type<float>(_727) * _1130;
    int _1142 = ~_675;
    int _1144 = _1142 + 1;
    float _1146 = float(uint(_1138));
    int _1148 = _1124 * int(_1102);
    int _1150 = _1148 + _1046;
    float _1152 = float(uint(_1076));
    float _1154 = trunc(_1140);
    float _1156 = precise::max(_1154, 0.0);
    uint _1158 = uint(_1156);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1162 = _1160 != 0;
    float _1164 = as_type<float>(_751) * _1146;
    float _1166 = float(uint(_1150));
    float _1168 = as_type<float>(_751) * _1152;
    float _1170 = trunc(_1164);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = as_type<float>(_727) * _1166;
    int _1178 = _984;
    if (_1162)
    {
        _1178 = 0;
    }
    int _1180 = _1178;
    float _1182 = trunc(_1176);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    int _1188 = ~_675;
    int _1190 = _1188 + 1;
    int _1192 = _1134 * int(_1174);
    int _1194 = _1192 + _1138;
    float _1196 = trunc(_1168);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    float _1202 = float(uint(_1194));
    int _1204 = int(_1102) + int(_1186);
    int _1206 = _1144 * int(_1158);
    int _1208 = _1206 + _932;
    float _1210 = as_type<float>(_751) * _1202;
    int _1212 = ~_693;
    int _1214 = _1212 + 1;
    float _1216 = float(uint(_1208));
    int _1218 = _1190 * _1204;
    int _1220 = _1218 + _1046;
    float _1222 = trunc(_1210);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = ~_693;
    int _1230 = _1228 + 1;
    float _1232 = as_type<float>(_727) * _1216;
    bool _1234 = uint(_1220) >= uint(_675);
    int _1236 = _1230 * int(_1200);
    int _1238 = _1236 + _1076;
    bool _1240 = !_1234;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = trunc(_1232);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = float(uint(_1238));
    int _1252 = ~_1204;
    int _1254 = _1252 + _1242;
    int _1256 = _1254 + 1;
    int _1258 = ~_693;
    int _1260 = _1258 + 1;
    float _1262 = as_type<float>(_751) * _1250;
    int _1264 = int(_1174) + int(_1226);
    int _1266 = _675 * _1256;
    int _1268 = _1266 + _1046;
    float _1270 = trunc(_1262);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    bool _1276 = !_1078;
    int _1278 = _1276 ? _1268 : (-1);
    int _1280 = _1260 * _1264;
    int _1282 = _1280 + _1138;
    int _1284 = int(_1158) + int(_1248);
    int _1286 = _1278 & 3;
    bool _1288 = _1286 != 0;
    int _1290 = _1278 & 3;
    bool _1292 = _1290 != 0;
    bool _1294 = uint(_1282) >= uint(_693);
    int _1296 = _1288 ? 0 : 1;
    bool _1298 = uint(_1290) > 1u;
    bool _1300 = uint(_1290) >= 2u;
    bool _1302 = !_1294;
    int _1304 = _1302 ? 0 : (-1);
    int _1306 = _1300 ? 0 : 1;
    bool _1308 = _1290 != 3;
    int _1310 = ~_1264;
    int _1312 = _1310 + _1304;
    int _1314 = _1312 + 1;
    int _1316 = ~_1296;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _1320;
    int _1324 = _1180;
    if (!_1298)
    {
        int _1326 = ~_1296;
        int _1328 = _1326 + 1;
        _1322 = _1328;
    }
    int _1330 = _1322;
    int _1332 = _693 * _1314;
    int _1334 = _1332 + _1138;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1338 = _1336 != 0;
    int _1340 = ~_675;
    int _1342 = _1340 + 1;
    bool _1344 = !_1338;
    int _1346 = _1344 ? 0 : 1;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1350 = _1348 != 0;
    int _1352 = _1342 * _1284;
    int _1354 = _1352 + _932;
    bool _1356 = !_1028;
    int _1358 = _1356 ? _1334 : (-1);
    int _1360 = ~_1306;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    int _1366 = _1364;
    if (_1308)
    {
        int _1368 = ~_1306;
        int _1370 = _1368 + 1;
        _1366 = _1370;
    }
    int _1372 = _1366;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1376 = _1374 != 0;
    int _1378 = _1358 & 3;
    bool _1380 = _1378 != 0;
    bool _1382 = uint(_1354) >= uint(_675);
    bool _1384 = !_1376;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = in.m_46.x;
    float _1390 = in.m_46.y;
    float _1392 = in.m_46.z;
    bool _1394 = uint(_1378) > 1u;
    bool _1396 = !_1382;
    int _1398 = _1396 ? 0 : (-1);
    if (!_1350)
    {
        _1324 = 1;
    }
    int _1400 = _1324;
    int _1402 = int(_1200) + int(_1274);
    int _1404 = _1358 & 3;
    bool _1406 = _1404 != 0;
    bool _1408 = _1378 != 3;
    int _1410 = _1214 * _1402;
    int _1412 = _1410 + _1076;
    int _1414 = ~_1284;
    int _1416 = _1414 + _1398;
    int _1418 = _1416 + 1;
    int _1420 = _1406 ? 0 : 1;
    bool _1422 = uint(_1378) >= 2u;
    int _1424 = _675 * _1418;
    int _1426 = _1424 + _932;
    int _1428 = ~_1420;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    int _1434 = _1422 ? 0 : 1;
    int _1436 = _1432;
    if (!_1394)
    {
        int _1438 = ~_1420;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = _185 * _1390;
    bool _1446 = uint(_1412) >= uint(_693);
    float _1448 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1450 = log2(_1448);
    bool _1452 = !_1078;
    int _1454 = _1452 ? _1426 : (-1);
    float _1456 = _179 * _1390;
    bool _1458 = _735 > 0.5;
    float _1460 = _191 * _1390;
    bool _1462 = _729 > 0.5;
    float _1464 = fma(_177, _1388, _1456);
    int _1466 = ~_1434;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    float _1472 = _731 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1474 = fma(_189, _1388, _1460);
    int _1476 = _1470;
    if (_1408)
    {
        int _1478 = ~_1434;
        int _1480 = _1478 + 1;
        _1476 = _1480;
    }
    int _1482 = _1476;
    float _1484 = _729 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1486 = !_1292;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = fma(_183, _1388, _1444);
    bool _1492 = !_1446;
    int _1494 = _1492 ? 0 : (-1);
    float _1496 = _1450 * _147;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1500 = _1498 != 0;
    float _1502 = fma(_181, _1392, _1464);
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1506 = _1504 != 0;
    float _1508 = fma(_187, _1392, _1490);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1512 = _1510 != 0;
    float _1514 = exp2(_1496);
    float _1516 = -_207;
    int _1518 = _1462 ? as_type<int>(_1516) : as_type<int>(_207);
    float _1520 = fma(_193, _1392, _1474);
    int _1522 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1524 = _1522 != 0;
    float _1526 = _729 * 2.0;
    bool _1528 = !_1524;
    float _1530 = _1528 ? _207 : as_type<float>(_1518);
    bool _1532 = _733 > 0.5;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1536 = floor(_1526);
    float _1538 = -_207;
    int _1540 = _1532 ? as_type<int>(_1538) : as_type<int>(_207);
    float _1542 = fma(_1472, -2.0, _1534);
    bool _1544 = _1400 != 1;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1548 = -_1546;
    float _1550 = fma(_1484, 2.0, _1548);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1558 = _1484;
    float _1560 = _1552;
    if (!_1544)
    {
        _233 = _731;
    }
    float _1562 = _233;
    float _1564 = _1562;
    if (!_1544)
    {
        _1558 = _733;
    }
    float _1566 = _1558;
    float _1568 = _1566;
    if (_1544)
    {
        _1564 = _729;
    }
    float _1570 = _1564;
    if (_1544)
    {
        _1568 = _731;
    }
    float _1572 = _1568;
    if (!_1544)
    {
        _235 = _731;
    }
    float _1574 = _235;
    float _1576 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1552);
    float _1578 = _1574;
    if (_1544)
    {
        _1578 = _729;
    }
    float _1580 = _1578;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1554);
    float _1584 = -_1514;
    float _1586 = _1584 + 1.0;
    if (!_1544)
    {
        _1560 = _733;
    }
    float _1588 = _1560;
    float _1590 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1576);
    float _1592 = _1588;
    if (_1544)
    {
        _1592 = _731;
    }
    float _1594 = _1592;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1598 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1600 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1608 = _1604 || _1606;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1612 = -_1596;
    float _1614 = fma(_1598, 2.0, _1612);
    int _1616 = _1278 >> 31;
    float _1618 = fma(_1610, -2.0, _1556);
    int _1620 = _1358 >> 31;
    float _1622 = -_147;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1614);
    int _1626 = _1616 & 3;
    float _1628 = _1608 ? _1586 : 0.0;
    bool _1630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1632 = isnan(1.0);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1638 = _1634 || _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1642 = 1.0 + _1640;
    int _1644 = _1278 + _1626;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1648 = _1620 & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1652 = _731 * 2.0;
    float _1654 = 1.0 / _1642;
    int _1656 = _1358 + _1648;
    float _1658 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1646);
    int _1660 = _1644 >> 2;
    float _1662 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1650);
    int _1664 = _1656 >> 2;
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1542);
    int _1668 = _1660 << 4;
    int _1670 = _1668 + 368;
    float _1672 = -_147;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1550);
    int _1676 = _1664 << 4;
    int _1678 = _1676 + 512;
    float _1680 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1658);
    uint _1682 = uint(int(uint(_1670) >> uint(2)));
    uint _1684 = uint(int(uint(int(_1682)) >> uint(2)));
    int _1686 = int(_1682) & 3;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[int(_1684)][_1686];
    int _1690 = int(_1682) + 1;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    int _1694 = _1690 & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    float _1698 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    float _1700 = floor(_1652);
    float _1702 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1582);
    float _1704 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1618);
    int _1706 = as_type<int>(_1698);
    if (_1638)
    {
        float _1708 = _1628 * _1654;
        _149 = _1708;
    }
    float _1710 = _149;
    float _1712 = _729 + _731;
    bool _1714 = !_1380;
    int _1716 = _1714 ? 0 : 1;
    float _1718 = -_1702;
    float _1720 = _1718 + 1.0;
    bool _1722 = _1536 > 0.0;
    uint _1724 = uint(int(uint(_1678) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    bool _1740 = _1536 >= 0.0;
    bool _1742 = isnan(_1536);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.0);
    bool _1748 = _1744 || _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1750;
    float _1754 = _1712 + (-1.0);
    int _1756 = _1748 ? 0 : 1;
    float _1758 = _1752 * _749;
    bool _1760 = _1700 >= 0.0;
    bool _1762 = isnan(_1700);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    int _1770 = _1670 + 8;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[int(_1782)][_1784];
    float _1788 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1790 = ~_1402;
    int _1792 = _1790 + _1494;
    int _1794 = _1792 + 1;
    int _1796 = _1768 ? 0 : 1;
    bool _1798 = _1700 > 0.0;
    float _1800 = _733 + _731;
    int _1802 = _1678 + 8;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
    int _1808 = int(_1804) & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    int _1812 = int(_1804) + 1;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    int _1816 = _1812 & 3;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[int(_1814)][_1816];
    int _1820 = ~_1756;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = _693 * _1794;
    int _1828 = _1826 + _1076;
    float _1830 = _1800 + (-1.0);
    int _1832 = _1824;
    if (!_1722)
    {
        int _1834 = ~_1756;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    bool _1840 = _1290 != 3;
    float _1842 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1844 = abs(_1330);
    int _1846 = abs(_1442);
    float _1848 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1850 = int(_1848);
    int _1852 = ~_1796;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    int _1858 = _1856;
    if (!_1798)
    {
        int _1860 = ~_1796;
        int _1862 = _1860 + 1;
        _1858 = _1862;
    }
    int _1864 = _1858;
    int _1866 = ~_1844;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = _1378 != 3;
    int _1874 = abs(_1488);
    int _1876 = _1870 * as_type<int>(_1696);
    int _1878 = abs(_1716);
    int _1880 = abs(_1372);
    int _1882 = ~_1846;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    int _1888 = ~_1874;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = ~_1878;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = _1886 * as_type<int>(_1738);
    int _1902 = _1892 * as_type<int>(_1688);
    int _1904 = _1902 + _1876;
    bool _1906 = !_1840;
    int _1908 = _1906 ? 0 : (-1);
    int _1910 = _1898 * as_type<int>(_1730);
    int _1912 = _1910 + _1900;
    int _1914 = abs(_1482);
    float _1916 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1918 = int(_1916);
    int _1920 = ~_1880;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = abs(_1908);
    int _1928 = _1924 * as_type<int>(_1778);
    int _1930 = _1928 + _1904;
    float _1932 = in.m_60.w;
    int _1934 = ~_1914;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = ~_1926;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = float(uint(_1850));
    int _1948 = _1938 * as_type<int>(_1810);
    int _1950 = _1948 + _1912;
    bool _1952 = !_1872;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = _1944 * as_type<int>(_1786);
    int _1958 = _1956 + _1930;
    int _1960 = abs(_1346);
    float _1962 = 1.0 / _1946;
    float _1964 = _733 * 2.0;
    int _1966 = abs(_1954);
    float _1968 = in.m_58.w;
    float _1970 = float(uint(_1918));
    float _1972 = floor(_1964);
    int _1974 = abs(_1386);
    int _1976 = abs(_1850);
    float _1978 = _1508 + _1932;
    int _1980 = ~_1960;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = 1.0 / _1970;
    int _1988 = ~_1966;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = abs(_1918);
    int _1996 = _1958 * _1984;
    bool _1998 = !_1028;
    int _2000 = _1998 ? _1828 : (-1);
    int _2002 = _1992 * as_type<int>(_1818);
    int _2004 = _2002 + _1950;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2008 = _2006 != 0;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2012 = _2010 != 0;
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2016 = _2014 != 0;
    int _2018 = _1454 * _1960;
    int _2020 = _2018 + _1996;
    float _2022 = float(uint(_1976));
    int _2024 = ~_1974;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _1502 + _1968;
    float _2032 = 1.0 / _2022;
    int _2034 = as_type<int>(_1962) + (-2);
    int _2036 = _2004 * _2028;
    float _2038 = float(uint(_1994));
    float _2040 = float(uint(_2020));
    int _2042 = _2000 * _1974;
    int _2044 = _2042 + _2036;
    bool _2046 = !_2012;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2052 = _651 + _2050;
    bool _2054 = _1972 >= 0.0;
    bool _2056 = isnan(_1972);
    bool _2058 = _2054 || _2056;
    bool _2060 = isnan(0.0);
    bool _2062 = _2058 || _2060;
    float _2064 = 1.0 / _2038;
    float _2066 = as_type<float>(_2034) * _2040;
    int _2068 = as_type<int>(_1986) + (-2);
    float _2070 = fma(_1758, _2052, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2072 = _2062 ? 0 : 1;
    float _2074 = float(uint(_2044));
    bool _2076 = _1972 > 0.0;
    float _2078 = trunc(_2066);
    float _2080 = precise::max(_2078, 0.0);
    uint _2082 = uint(_2080);
    int _2084 = abs(_2020);
    float _2086 = as_type<float>(_2068) * _2074;
    int _2088 = as_type<int>(_2032) + (-2);
    float _2090 = float(uint(_2084));
    int _2092 = abs(_2044);
    float _2094 = trunc(_2086);
    float _2096 = precise::max(_2094, 0.0);
    uint _2098 = uint(_2096);
    int _2100 = as_type<int>(_2064) + (-2);
    float _2102 = as_type<float>(_2088) * _2090;
    float _2104 = float(uint(_2092));
    int _2106 = ~_1850;
    int _2108 = _2106 + 1;
    int _2110 = ~_1918;
    int _2112 = _2110 + 1;
    float _2114 = trunc(_2102);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = as_type<float>(_2100) * _2104;
    int _2122 = _2108 * int(_2082);
    int _2124 = _2122 + _2020;
    int _2126 = ~_1976;
    int _2128 = _2126 + 1;
    int _2130 = ~_1994;
    int _2132 = _2130 + 1;
    float _2134 = float(uint(_2124));
    float _2136 = trunc(_2120);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    int _2142 = _2112 * int(_2098);
    int _2144 = _2142 + _2044;
    bool _2146 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2148 = isnan(_651);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = as_type<float>(_2034) * _2134;
    bool _2160 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2162 = isnan(_651);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = float(uint(_2144));
    int _2174 = _2128 * int(_2118);
    int _2176 = _2174 + _2084;
    float _2178 = -_2156;
    float _2180 = _2178 + 1.0;
    float _2182 = trunc(_2158);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    int _2188 = abs(_2048);
    float _2190 = as_type<float>(_2068) * _2172;
    float _2192 = float(uint(_2176));
    float _2194 = in.m_62.w;
    float _2196 = _2170 * _2180;
    int _2198 = _2132 * int(_2140);
    int _2200 = _2198 + _2092;
    float _2202 = -_2170;
    float _2204 = _2202 + 1.0;
    float _2206 = as_type<float>(_2088) * _2192;
    float _2208 = _2070 * _2196;
    float _2210 = trunc(_2190);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = float(uint(_2200));
    float _2218 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2208);
    float _2220 = float(_1838);
    float _2222 = as_type<float>(_2100) * _2216;
    float _2224 = trunc(_2206);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    int _2230 = ~_1850;
    int _2232 = _2230 + 1;
    float _2234 = float(_2188);
    int _2236 = int(_2082) + int(_2186);
    int _2238 = ~_2072;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = trunc(_2222);
    float _2246 = precise::max(_2244, 0.0);
    uint _2248 = uint(_2246);
    int _2250 = _2242;
    if (!_2076)
    {
        int _2252 = ~_2072;
        int _2254 = _2252 + 1;
        _2250 = _2254;
    }
    int _2256 = _2250;
    float _2258 = _1520 + _2194;
    float _2260 = _2234 * _2220;
    int _2262 = _2232 * _2236;
    int _2264 = _2262 + _2020;
    float _2266 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2218);
    int _2268 = int(_2098) + int(_2214);
    bool _2270 = !_2008;
    int _2272 = _2270 ? 0 : 1;
    int _2274 = ~_1918;
    int _2276 = _2274 + 1;
    bool _2278 = uint(_2264) >= uint(_1850);
    int _2280 = _2276 * _2268;
    int _2282 = _2280 + _2044;
    int _2284 = int(_2118) + int(_2228);
    int _2286 = abs(_2272);
    int _2288 = int(_2140) + int(_2248);
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2292 = ~_1976;
    int _2294 = _2292 + 1;
    int _2296 = ~_1994;
    int _2298 = _2296 + 1;
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2302 = _2294 * _2284;
    int _2304 = _2302 + _2084;
    float _2306 = float(_2256);
    float _2308 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2310 = float(_2286);
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2314 = !_2278;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2320 = uint(_2282) >= uint(_1918);
    int _2322 = _2298 * _2288;
    int _2324 = _2322 + _2092;
    float _2326 = _2310 * _2306;
    bool _2328 = !_1512;
    float _2330 = _2328 ? _207 : as_type<float>(_1540);
    float _2332 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2334 = !_2320;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2340 = uint(_2304) >= uint(_1976);
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2344 = _1978 + _2342;
    bool _2346 = uint(_2324) >= uint(_1994);
    float _2348 = _2326 * (-2.0);
    int _2350 = ~_2236;
    int _2352 = _2350 + _2316;
    int _2354 = _2352 + 1;
    out.m_70.x = _2332;
    out.m_70.y = _2338;
    out.m_70.z = _2300;
    out.m_70.w = _2308;
    int _2356 = ~_2268;
    int _2358 = _2356 + _2336;
    int _2360 = _2358 + 1;
    float _2362 = fma(_1788, _2348, _1788);
    bool _2364 = !_2340;
    int _2366 = _2364 ? 0 : (-1);
    float _2368 = in.m_72.x;
    float _2370 = in.m_72.y;
    float _2372 = in.m_72.z;
    bool _2374 = !_2346;
    int _2376 = _2374 ? 0 : (-1);
    int _2378 = _1918 * _2360;
    int _2380 = _2378 + _2044;
    bool _2382 = _1850 == 0;
    bool _2384 = _1850 == 0;
    int _2386 = ~_2366;
    int _2388 = _2284 + _2386;
    int _2390 = _2388 + 1;
    int _2392 = ~_2376;
    int _2394 = _2288 + _2392;
    int _2396 = _2394 + 1;
    float _2398 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2400 = _2020 ^ _1850;
    int _2402 = _1850 * _2354;
    int _2404 = _2402 + _2020;
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2408 = _2030 + _2406;
    uint _2410 = uint(int(uint(_2400) >> uint(31)));
    float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2398);
    bool _2414 = !_2382;
    int _2416 = _2414 ? _2404 : (-1);
    float _2418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2420 = ~int(_2410);
    int _2422 = _2420 + 1;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2426 = _2258 + _2424;
    bool _2428 = _1918 == 0;
    int _2430 = _2390 ^ _2422;
    float _2432 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2412);
    float _2434 = float(_2416);
    float _2436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2438 = ~_2422;
    int _2440 = _2438 + _2430;
    int _2442 = _2440 + 1;
    bool _2444 = !_2428;
    int _2446 = _2444 ? _2380 : (-1);
    bool _2448 = _2432 >= 0.0;
    float _2450 = fma(_2348, _2368, _2368);
    bool _2452 = !_2384;
    int _2454 = _2452 ? _2442 : (-1);
    float _2456 = _2260 * (-2.0);
    int _2458 = _2044 ^ _1918;
    float _2460 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2462 = _1918 == 0;
    float _2464 = _729 + (-0.5);
    uint _2466 = uint(int(uint(_2458) >> uint(31)));
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2470 = fma(_2456, _2370, _2370);
    float _2472 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    int _2474 = ~int(_2466);
    int _2476 = _2474 + 1;
    float _2478 = fma(_2460, _2434, _1674);
    float _2480 = _1530 + 0.5;
    float _2482 = fma(_1842, _2456, _1842);
    int _2484 = _2396 ^ _2476;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2488 = float(_2446);
    float _2490 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2492 = ~_2476;
    int _2494 = _2492 + _2484;
    int _2496 = _2494 + 1;
    float _2498 = _2330 + 0.5;
    float _2500 = fma(_2460, _2480, _2478);
    float _2502 = fma(_2490, _2488, _1624);
    bool _2504 = !_2462;
    int _2506 = _2504 ? _2496 : (-1);
    float _2508 = _2344 * _2344;
    bool _2510 = _731 > 0.5;
    float _2512 = fma(_2490, _2498, _2502);
    float _2514 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2516 = -_211;
    int _2518 = _1458 ? as_type<int>(_2516) : as_type<int>(_211);
    float _2520 = fma(_2362, _1710, _2472);
    float _2522 = -_211;
    int _2524 = _2510 ? as_type<int>(_2522) : as_type<int>(_211);
    float _2526 = _2500;
    if (_2448)
    {
        out.m_49.x = 0.0;
    }
    bool _2528 = !_1500;
    float _2530 = _2528 ? _211 : as_type<float>(_2518);
    float _2532 = -_1680;
    float _2534 = _2532 + 1.0;
    bool _2536 = !_1506;
    float _2538 = _2536 ? _211 : as_type<float>(_2524);
    float _2540 = fma(_2408, _2408, _2508);
    float _2542 = float(_2506);
    float _2544 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2546 = float(_2454);
    float _2548 = fma(_2426, _2426, _2540);
    float _2550 = -_2534;
    float _2552 = fma(_1530, _2550, _2500);
    float _2554 = -_1704;
    float _2556 = fma(_2544, _2542, _2554);
    float _2558 = _2538 + (-0.5);
    float _2560 = rsqrt(_2548);
    float _2562 = -_1666;
    float _2564 = fma(_2514, _2546, _2562);
    float _2566 = _2530 + (-0.5);
    if (_2448)
    {
        _2526 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2568 = _2526;
    float _2570 = -_2514;
    float _2572 = fma(_2570, _2558, _2564);
    float _2574 = -_1590;
    float _2576 = _2574 + 1.0;
    float _2578 = -_1698;
    float _2580 = _2578 + 1.0;
    float _2582 = -_2544;
    float _2584 = fma(_2582, _2566, _2556);
    float _2586 = -_2576;
    float _2588 = fma(_2330, _2586, _2512);
    float _2590 = fma(_2538, _2580, _2572);
    if (_2448)
    {
        float _2592 = _2568 * 5.0;
        _1706 = as_type<int>(_2592);
    }
    int _2594 = _1706;
    float _2596 = fma(_2530, _1720, _2584);
    float _2598 = _657 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2600 = !_2016;
    int _2602 = _2600 ? 0 : 1;
    float _2604 = _731 + (-0.5);
    if (_2448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7754 = as_type<float>(_2594);
        out.gl_Position.z = _7754;
    }
    float _2606 = _2598 * _2560;
    int _2608 = abs(_2602);
    out.m_74.x = _2552;
    out.m_74.y = _2590;
    out.m_74.z = _2588;
    out.m_74.w = _2596;
    float _2610 = _2408 * _2606;
    float _2612 = _2344 * _2606;
    if (_2448)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2614 = -_2612;
    float _2616 = _1978 + _2614;
    float _2618 = _2426 * _2606;
    float _2620 = -_2610;
    float _2622 = _2030 + _2620;
    float _2624 = float(_1864);
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2628 = _2616 + _2626;
    float _2630 = -_2618;
    float _2632 = _2258 + _2630;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2622 + _2634;
    float _2638 = -_2612;
    float _2640 = _2344 + _2638;
    float _2642 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2644 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2646 = _2632 + _2644;
    float _2648 = float(_2608);
    float _2650 = fma(_2604, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2470);
    float _2652 = fma(_2636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2642);
    float _2654 = -_2610;
    float _2656 = _2408 + _2654;
    float _2658 = _2640 * _2640;
    float _2660 = fma(_2482, _1710, _2650);
    float _2662 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2652);
    float _2664 = _733 + _729;
    float _2666 = _2648 * _2624;
    float _2668 = fma(_2656, _2656, _2658);
    float _2670 = -_2618;
    float _2672 = _2426 + _2670;
    bool _2674 = _2662 >= 0.0;
    float _2676 = _2660 * 0.15915493667125701904296875;
    float _2678 = _2664 + (-1.0);
    float _2680 = _2666 * (-2.0);
    float _2682 = _2520 * 0.15915493667125701904296875;
    float _2684 = fma(_2672, _2672, _2668);
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2688 = _2676 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = _733 + (-0.5);
    float _2694 = fma(_2680, _2372, _2372);
    float _2696 = fma(_2686, _2680, _2686);
    float _2698 = _2656;
    int _2700 = as_type<int>(_2692);
    if (_2674)
    {
        _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2702 = _2698;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2694);
    float _2706 = _2682 * 6.283185482025146484375;
    float _2708 = sin(_2706);
    if (_2674)
    {
        out.m_49.x = 0.0;
    }
    if (_2674)
    {
        float _2710 = _2702 * 5.0;
        _2700 = as_type<int>(_2710);
    }
    int _2712 = _2700;
    float _2714 = fma(_2696, _1710, _2704);
    if (_2674)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7945 = as_type<float>(_2712);
        out.gl_Position.z = _7945;
    }
    float _2716 = _2682 * 6.283185482025146484375;
    float _2718 = cos(_2716);
    float _2720 = _2714 * 0.15915493667125701904296875;
    float _2722 = sqrt(_2684);
    float _2724 = _2676 * 6.283185482025146484375;
    float _2726 = cos(_2724);
    if (_2674)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2728 = _2720 * 6.283185482025146484375;
    float _2730 = cos(_2728);
    float _2732 = _2560 * _2722;
    float _2734 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2738 = _2708 * _2690;
    float _2740 = _657 * _2732;
    float _2742 = _2732 * _2734;
    float _2744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2746 = _2720 * 6.283185482025146484375;
    float _2748 = sin(_2746);
    float _2750 = _2718 * _2690;
    float _2752 = _2736 * _2742;
    float _2754 = _2718 * _2726;
    float _2756 = _2708 * _2726;
    float _2758 = _2744 * _2740;
    float _2760 = _2718 * _2730;
    float _2762 = _2726 * _2730;
    float _2764 = _2708 * _2730;
    float _2766 = _2690 * _2730;
    float _2768 = _2760 * _2752;
    float _2770 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2772 = _2770 * 0.5;
    float _2774 = fma(_2748, _2754, _2738);
    float _2776 = -_2756;
    float _2778 = fma(_2748, _2750, _2776);
    float _2780 = -_2752;
    float _2782 = _2748 * _2780;
    float _2784 = -_2750;
    float _2786 = fma(_2748, _2756, _2784);
    float _2788 = fma(_2774, _2758, _2768);
    float _2790 = _2764 * _2752;
    float _2792 = fma(_2762, _2758, _2782);
    float _2794 = fma(_2748, _2738, _2754);
    float _2796 = fma(_2778, _2772, _2788);
    float _2798 = fma(_2786, _2758, _2790);
    float _2800 = fma(_2766, _2772, _2792);
    float _2802 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2804 = fma(_2794, _2772, _2798);
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2808 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2802);
    float _2810 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2806);
    float _2812 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2808);
    float _2814 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2810);
    float _2816 = _2812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2818 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2820 = _2814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2822 = _2258 + _2816;
    float _2824 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2818);
    float _2826 = _2030 + _2820;
    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2830 = _2822 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2834 = _2826 + _2832;
    float _2836 = _2830 * _2830;
    float _2838 = fma(_2834, _2834, _2836);
    float _2840 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2842 = sqrt(_2838);
    float _2844 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2840);
    float _2846 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2824);
    float _2848 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2844);
    float _2850 = _2848 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2852 = _1978 + _2850;
    bool _2854 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = _2850;
    float _2858 = _2824;
    float _2860 = _2826;
    if (!_2854)
    {
        _2856 = _2826;
    }
    float _2862 = _2856;
    float _2864 = _2862;
    if (!_2854)
    {
        _2858 = _2822;
    }
    float _2866 = _2858;
    float _2868 = _2866;
    if (!_2854)
    {
        _2860 = _2852;
    }
    float _2870 = _2860;
    bool _2872 = !_2854;
    float _2874 = _2870;
    if (!_2872)
    {
        float _2876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2880 = _2842 + _2878;
        float _2882 = rsqrt(_2838);
        float _2884 = _2880 * _2876;
        float _2886 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2888 = _2884 * 0.15915493667125701904296875;
        float _2890 = _2888 * 6.283185482025146484375;
        float _2892 = cos(_2890);
        float _2894 = _2888 * 6.283185482025146484375;
        float _2896 = sin(_2894);
        float _2898 = _2892 + (-1.0);
        float _2900 = fma(_2896, _2886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2902 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2904 = _2882 * _2900;
        float _2906 = fma(_2852, _2892, _2902);
        float _2908 = fma(_2834, _2904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2910 = fma(_2830, _2904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2874 = _2906;
        _2864 = _2908;
        _2868 = _2910;
    }
    float _2912 = _2874;
    float _2914 = _2864;
    float _2916 = _2868;
    float _2918 = -_1978;
    float _2920 = _2918 + _2912;
    float _2922 = -_2030;
    float _2924 = _2922 + _2914;
    float _2926 = -_2258;
    float _2928 = _2926 + _2916;
    float _2930 = _2846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2932 = _2920 * _2920;
    float _2934 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2936 = 1.0 / _2930;
    float _2938 = fma(_2924, _2924, _2932);
    float _2940 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2934);
    bool _2942 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2944 = isnan(0.5);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2950 = _2946 || _2948;
    float _2952 = fma(_2928, _2928, _2938);
    float _2954 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2940);
    bool _2956 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2958 = isnan(0.5);
    bool _2960 = _2956 || _2958;
    bool _2962 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2964 = _2960 || _2962;
    float _2966 = sqrt(_2952);
    float _2968 = _2954 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2970 = _2968 + _2930;
    float _2972 = _2970 * _2936;
    float _2974 = _2972 * 0.5;
    bool _2976 = _2966 > 0.0;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2980 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2978);
    float _2982 = 1.0 / _2980;
    float _2984 = _2930;
    float _2986 = _2974;
    float _2988 = _2936;
    if (!_2976)
    {
        _2984 = _2914;
    }
    float _2990 = _2984;
    float _2992 = _2990;
    if (!_2976)
    {
        _2986 = _2912;
    }
    float _2994 = _2986;
    float _2996 = _2994;
    if (!_2976)
    {
        _2988 = _2916;
    }
    float _2998 = _2988;
    bool _3000 = !_2976;
    float _3002 = _2998;
    float _3004 = _2998;
    if (!_3000)
    {
        float _3006 = _227 * _227;
        float _3008 = rsqrt(_2952);
        float _3010 = fma(_223, _223, _3006);
        float _3012 = fma(_229, _229, _3010);
        float _3014 = sqrt(_3012);
        float _3016 = _2924 * _3008;
        float _3018 = _2920 * _3008;
        float _3020 = _2928 * _3008;
        bool _3022 = _3014 > 0.0;
        float _3024 = _3014;
        float _3026 = _3010;
        if (!_3022)
        {
            _3024 = _2914;
        }
        float _3028 = _3024;
        _2992 = _3028;
        if (!_3022)
        {
            _3026 = _2912;
        }
        float _3030 = _3026;
        _2996 = _3030;
        if (!_3022)
        {
            _3002 = _2916;
        }
        float _3032 = _3002;
        bool _3034 = !_3022;
        _3004 = _3032;
        if (!_3034)
        {
            float _3036 = rsqrt(_3012);
            float _3038 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3040 = _227 * _3036;
            float _3042 = _223 * _3036;
            float _3044 = _3018 * _3040;
            float _3046 = _229 * _3036;
            float _3048 = fma(_3016, _3042, _3044);
            float _3050 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3052 = fma(_3020, _3046, _3048);
            float _3054 = _3052 * _3050;
            float _3056 = fma(_223, _3054, _2914);
            float _3058 = fma(_227, _3054, _2912);
            float _3060 = fma(_229, _3054, _2916);
            _2992 = _3056;
            _2996 = _3058;
            _3004 = _3060;
        }
    }
    float _3062 = _2992;
    float _3064 = _2996;
    float _3066 = _3004;
    float _3068 = -_2610;
    float _3070 = _3068 + _3062;
    float _3072 = -_2612;
    float _3074 = _3072 + _3064;
    float _3076 = -_2618;
    float _3078 = _3076 + _3066;
    float _3080 = _3074;
    float _3082 = _3070;
    float _3084 = _3078;
    float _3086 = _3064;
    if (_2964)
    {
        _237 = 1.0;
    }
    float _3088 = _237;
    float _3090 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3092 = _2982 * _3090;
    float _3094 = _3088;
    if (!_2950)
    {
        float _3096 = _2628 * _2628;
        float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3100 = -_2258;
        float _3102 = _3100 + _3066;
        float _3104 = -_1978;
        float _3106 = _3104 + _3064;
        float _3108 = fma(_2636, _2636, _3096);
        float _3110 = fma(_2646, _2646, _3108);
        float _3112 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3114 = sqrt(_3110);
        float _3116 = 1.0 / _2732;
        float _3118 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3120 = precise::min(_3114, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3122 = _3120 * _3098;
        float _3124 = _3122 * _3116;
        float _3126 = -_2030;
        float _3128 = _3126 + _3062;
        float _3130 = _3118 * _3124;
        float _3132 = _3102 * _3124;
        float _3134 = fma(_3106, _3130, _2616);
        float _3136 = fma(_3128, _3130, _2622);
        float _3138 = fma(_3118, _3132, _2632);
        _3080 = _3134;
        _3082 = _3136;
        _3084 = _3138;
        _239 = _3124;
    }
    float _3140 = _3080;
    float _3142 = _3082;
    float _3144 = _3084;
    float _3146 = _239;
    float _3148 = _3146;
    if (!_2964)
    {
        float _3150 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3152 = _3150 * 0.15915493667125701904296875;
        float _3154 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3158 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3156;
        float _3160 = _3152 * 6.283185482025146484375;
        float _3162 = cos(_3160);
        float _3164 = _3154 * 0.15915493667125701904296875;
        float _3166 = _3152 * 6.283185482025146484375;
        float _3168 = sin(_3166);
        float _3170 = 1.0 / _3162;
        float _3172 = _3164 * 6.283185482025146484375;
        float _3174 = cos(_3172);
        float _3176 = _3168 * _3170;
        float _3178 = _3164 * 6.283185482025146484375;
        float _3180 = sin(_3178);
        float _3182 = _3174 * _3176;
        float _3184 = 1.0 / _3158;
        float _3186 = 1.0 / _3182;
        float _3188 = _3180 * _3186;
        float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3192 = fma(_3092, _3188, _3190);
        float _3194 = _3192 * _3184;
        float _3196 = precise::clamp(_3194, 0.0, 1.0);
        _3148 = _3164;
        _3086 = _3152;
        _3094 = _3196;
    }
    float _3198 = _3148;
    float _3200 = _3086;
    float _3202 = _3094;
    float _3204 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3206 = _3140 + _3204;
    float _3208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3210 = _3142 + _3208;
    float _3212 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3214 = _3144 + _3212;
    float _3216 = _3206 * _3206;
    float _3218 = fma(_3210, _3210, _3216);
    float _3220 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3222 = fma(_3214, _3214, _3218);
    float _3224 = rsqrt(_3222);
    float _3226 = sqrt(_3222);
    float _3228 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3230 = _3210 * _3228;
    float _3232 = _3214 * _3228;
    float _3234 = _3230 * _3230;
    float _3236 = _3232 * _3232;
    float _3238 = _3234 + _3236;
    float _3240 = sqrt(_3238);
    bool _3242 = _3240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3246 = _3240 + _3244;
    float _3248 = _3224;
    float _3250 = _3246;
    float _3252 = _3198;
    float _3254 = _3206;
    float _3256 = _3238;
    if (_3242)
    {
        float _3258 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3248 = _3258;
    }
    float _3260 = _3248;
    float _3262 = _3260;
    if (_3242)
    {
        float _3264 = _3246 * _3260;
        _3250 = _3264;
    }
    float _3266 = _3250;
    if (_3242)
    {
        float _3268 = rsqrt(_3238);
        _3262 = _3268;
    }
    float _3270 = _3262;
    float _3272 = _3270;
    if (_3242)
    {
        float _3274 = _3266 * 0.15915493667125701904296875;
        _3252 = _3274;
    }
    float _3276 = _3252;
    float _3278 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3280 = _3214;
    float _3282 = _3276;
    if (_3242)
    {
        float _3284 = _3276 * 6.283185482025146484375;
        float _3286 = sin(_3284);
        _3280 = _3286;
    }
    float _3288 = _3280;
    float _3290 = precise::max(0.0, _3278);
    float _3292 = _3200;
    float _3294 = _3290;
    if (_3242)
    {
        float _3296 = _3276 * 6.283185482025146484375;
        float _3298 = cos(_3296);
        _3292 = _3298;
    }
    float _3300 = _3292;
    float _3302 = -_3228;
    float _3304 = -_3290;
    float _3306 = fma(_3206, _3302, _3304);
    if (_3242)
    {
        float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3254 = _3308;
    }
    float _3310 = _3254;
    float _3312 = _3288;
    float _3314 = _3310;
    if (_3242)
    {
        float _3316 = fma(_3288, _3310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3312 = _3316;
    }
    float _3318 = _3312;
    float _3320 = _3318;
    if (!_3242)
    {
        _3282 = _3230;
    }
    float _3322 = _3282;
    float _3324 = _3322;
    if (_3242)
    {
        float _3326 = _3270 * _3318;
        _3314 = _3326;
    }
    float _3328 = _3314;
    if (!_3242)
    {
        _3272 = _3306;
    }
    float _3330 = _3272;
    float _3332 = _3330;
    float _3334 = _3300;
    if (_3242)
    {
        float _3336 = _3300 + (-1.0);
        _3294 = _3336;
    }
    float _3338 = _3294;
    float _3340 = _3338;
    if (_3242)
    {
        float _3342 = _3230 * _3328;
        _3324 = _3342;
    }
    float _3344 = _3324;
    if (!_3242)
    {
        _3320 = _3234;
    }
    float _3346 = _3320;
    float _3348 = _3346;
    if (_3242)
    {
        float _3350 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3256 = _3350;
    }
    float _3352 = _3256;
    if (!_3242)
    {
        _3340 = _3232;
    }
    float _3354 = _3340;
    float _3356 = _3354;
    if (_3242)
    {
        float _3358 = _3344 * _3344;
        _3348 = _3358;
    }
    float _3360 = _3348;
    if (_3242)
    {
        float _3362 = _3232 * _3328;
        _3356 = _3362;
    }
    float _3364 = _3356;
    if (_3242)
    {
        float _3366 = fma(_3306, _3300, _3352);
        _3332 = _3366;
    }
    float _3368 = _3332;
    if (!_3242)
    {
        _3334 = _3236;
    }
    float _3370 = _3334;
    float _3372 = floor(_3220);
    float _3374 = _3370;
    if (_3242)
    {
        float _3376 = _3364 * _3364;
        _3374 = _3376;
    }
    float _3378 = _3374;
    float _3380 = fma(_3368, _3368, _3360);
    float _3382 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3384 = _3380 + _3378;
    float _3386 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3382);
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3390 = fma(_3226, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3388);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = rsqrt(_3384);
    float _3396 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3386);
    float _3398 = -_3392;
    float _3400 = _3398 + 1.0;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3404 = _3396 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3406 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3408 = fma(_2632, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3410 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3412 = _3404 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3414 = abs(_3400);
    float _3416 = log2(_3414);
    float _3418 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3406);
    float _3420 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3410);
    float _3422 = -_3412;
    float _3424 = fma(_3422, _3402, 1.0);
    float _3426 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3428 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3418);
    float _3430 = _3394 * _3344;
    float _3432 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3420);
    float _3434 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3426);
    float _3436 = _3394 * _3368;
    float _3438 = _3394 * _3364;
    float _3440 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3442 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3434);
    float _3444 = _3432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3446 = floor(_3408);
    float _3448 = -_3440;
    float _3450 = fma(_3436, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3448);
    float _3452 = _3442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3454 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3456 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3458 = -_3438;
    float _3460 = fma(_3458, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3450);
    float _3462 = -_3372;
    float _3464 = _3220 + _3462;
    float _3466 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3454);
    float _3468 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3470 = exp2(_3456);
    float _3472 = fma(_3460, -0.5, 0.5);
    float _3474 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3466);
    float _3476 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3478 = fma(_3460, 0.5, 0.5);
    float _3480 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3474);
    float _3482 = -_3446;
    float _3484 = _3408 + _3482;
    float _3486 = log2(_3424);
    float _3488 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3476);
    float _3490 = _3436 + 1.0;
    float _3492 = fma(_3478, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3494 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3488);
    float _3496 = fma(_3478, _3492, -0.212114393711090087890625);
    float _3498 = 1.0 / _3480;
    float _3500 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3502 = sqrt(_3472);
    float _3504 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3500);
    float _3506 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3494);
    float _3508 = _3486 * 0.693147182464599609375;
    float2 _9211 = float2(_3464, _3484);
    float _3510 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9211, float2(0.0), isnan(_9211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9211, float2(0.0), isnan(_9211)), level(0.0)).x;
    float _3512 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3504);
    float _3514 = fma(_3478, _3496, 1.570728778839111328125);
    float _3516 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3518 = _3506 * _3498;
    float _3520 = -_3436;
    float _3522 = fma(_3470, _3490, _3520);
    float _3524 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3512);
    float _3526 = fma(_3518, 0.5, 0.5);
    float _3528 = fma(_3522, 0.5, 0.5);
    float _3530 = _3524 * _3498;
    float _3532 = _3502 * 0.636619746685028076171875;
    float _3534 = fma(_3530, -0.5, 0.5);
    float _3536 = -_3514;
    float _3538 = fma(_3532, _3536, 1.0);
    float3 _9266 = float3(_3526, _3534, _3516);
    float _3540 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9266, float3(0.0), isnan(_9266)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9266, float3(0.0), isnan(_9266)), level(0.0)).x;
    float3 _9277 = float3(_3526, _3534, _3516);
    float4 _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9277, float3(0.0), isnan(_9277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9277, float3(0.0), isnan(_9277)), level(0.0)).xyzw;
    float _3545 = _3543.x;
    float _3547 = _3543.y;
    float _3549 = _3543.z;
    float _3551 = _3543.w;
    float2 _9293 = float2(_3538, _3528);
    float3 _3555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9293, float2(0.0), isnan(_9293)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9293, float2(0.0), isnan(_9293)), level(0.0)).xyz;
    float _3557 = _3555.x;
    float _3559 = _3555.y;
    float _3561 = _3555.z;
    float _3563 = abs(_3092);
    float _3565 = log2(_3563);
    float _3567 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3569 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3571 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3573 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3575 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3567);
    float _3577 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3579 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3569);
    float _3581 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3571);
    float _3583 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3585 = -_2748;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3577);
    float _3589 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3591 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3593 = -_2748;
    float _3595 = fma(_3593, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3583);
    float _3597 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3573);
    float _3599 = -_2748;
    float _3601 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3589);
    float _3603 = _3565 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3605 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3607 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3591);
    float _3609 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3601);
    float _3611 = exp2(_3603);
    float _3613 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3605);
    float _3615 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3587);
    float _3617 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3595);
    float _3619 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3613);
    float _3621 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3607);
    float _3623 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3625 = fma(_2794, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3597);
    float _3627 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3575);
    float _3629 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3631 = fma(_3623, _3623, 1.0);
    float _3633 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_76.x = _3142;
    out.m_76.y = _3140;
    out.m_76.z = _3144;
    bool _3635 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3637 = isnan(_3226);
    bool _3639 = _3635 || _3637;
    bool _3641 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3643 = _3639 || _3641;
    float _3645 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3647 = precise::clamp(_3645, 0.0, 1.0);
    float _3649 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3579);
    float _3651 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3581);
    float _3653 = rsqrt(_3631);
    float _3655 = fma(_3647, -2.0, 3.0);
    float _3657 = _3647 * _3647;
    float _3659 = _3623 * _3617;
    out.m_78.x = _3627;
    out.m_78.y = _3649;
    out.m_78.z = _3651;
    float _3661 = _3623 * _3615;
    float _3663 = _3657 * _3655;
    float _3665 = _3444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3667 = exp2(_3629);
    float _3669 = fma(_3633, _3649, _3659);
    float _3671 = -_3663;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3452, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3665);
    float _3677 = fma(_3633, _3627, _3661);
    float _3679 = fma(_3673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3663);
    float _3681 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    bool _3683 = _3092 <= 8000.0;
    bool _3685 = isnan(_3092);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan(8000.0);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = in.m_80.x;
    float _3697 = _3623 * _3653;
    float _3699 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3681);
    float _3701 = _3693 * _3679;
    float _3703 = -_3619;
    float _3705 = _3697 * _3703;
    float _3707 = -_3621;
    float _3709 = _3697 * _3707;
    float _3711 = -_3667;
    float _3713 = _3711 + 1.0;
    float _3715 = _3701 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3717 = -_3625;
    float _3719 = _3697 * _3717;
    float _3721 = _3621 + _3669;
    float _3723 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3725 = fma(_3653, _3615, _3705);
    float _3727 = _3623 * _3609;
    float _3729 = fma(_3653, _3617, _3709);
    float _3731 = fma(_3653, _3609, _3719);
    out.gl_Position.x = _3506;
    out.gl_Position.y = _3524;
    out.gl_Position.z = _3699;
    out.gl_Position.w = _3480;
    float _3733 = _3699 + _3480;
    float _3735 = fma(_3633, _3651, _3727);
    out.m_82.x = _3725;
    out.m_82.y = _3729;
    out.m_82.z = _3731;
    float _3737 = _3733 * 0.5;
    float _3739 = _3619 + _3677;
    float _3741 = _3625 + _3735;
    out.m_84.z = _3737;
    out.m_84.w = _3480;
    out.m_86.x = _3739;
    out.m_86.y = _3721;
    out.m_86.z = _3741;
    float _3743 = _3480;
    float _3745 = _3699;
    float _3747 = _3524;
    if (!_3643)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3749 = _3743;
    float _3751 = _3749;
    float _3753 = _3749;
    if (!_3643)
    {
        _3745 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3755 = _3745;
    float _3757 = _3755;
    float _3759 = _3755;
    if (!_3643)
    {
        _3747 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3761 = _3747;
    float _3763 = -_3510;
    float _3765 = _3763 + 1.0;
    float _3767 = _3765 * _3715;
    float _3769 = precise::clamp(_3767, 0.0, 1.0);
    float _3771 = -_3769;
    float _3773 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3775 = _3773 * _3695;
    float _3777 = _3775 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3779 = _3723 * _3540;
    float _3781 = -_3723;
    float _3783 = _3781 + 1.0;
    out.m_88.x = _3777;
    float _3785 = _3551 * _3779;
    float _3787 = _3561 * _3779;
    float _3789 = _3551 * _3783;
    float _3791 = _3779;
    float _3793 = _3547;
    float _3795 = _3545;
    float _3797 = _3761;
    float _3799 = _3761;
    if (!_3643)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3801 = _3791;
    float _3803 = fma(_3557, _3785, _3545);
    float _3805 = fma(_3559, _3785, _3547);
    float _3807 = fma(_3551, _3787, _3549);
    float _3809 = _3202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3811 = _3801;
    float _3813 = _3801;
    if (!_3643)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3815 = _3793;
    float _3817 = _3815;
    float _3819 = _3815;
    if (!_3643)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3795;
    out.m_90.x = _3803;
    out.m_90.y = _3805;
    out.m_90.z = _3807;
    out.m_90.w = _3789;
    bool _3823 = !_3643;
    float _3825 = _3821;
    float _3827 = _3821;
    if (!_3823)
    {
        bool _3829 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3831 = isnan(_3226);
        bool _3833 = _3829 || _3831;
        bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3837 = _3833 || _3835;
        if (!_3837)
        {
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3841 = _3226 + _3839;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3843;
            float _3847 = 1.0 / _3845;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3869 = _3841 * _3847;
            float _3871 = precise::clamp(_3869, 0.0, 1.0);
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3877 = fma(_3871, _3851, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3827 = _3879;
            _3799 = _3885;
            _3819 = _3877;
            _3759 = _3883;
            _3753 = _3881;
            _3813 = _3887;
            _3889 = true;
        }
        else
        {
            bool _3891 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3893 = isnan(_3226);
            bool _3895 = _3891 || _3893;
            bool _3897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3899 = _3895 || _3897;
            if (!_3899)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3901 = _3817;
            _3819 = _3901;
            if (!_3899)
            {
                _3825 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3903 = _3825;
            _3827 = _3903;
            if (!_3899)
            {
                _3751 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3905 = _3751;
            _3753 = _3905;
            if (!_3899)
            {
                _3757 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3907 = _3757;
            _3759 = _3907;
            if (!_3899)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3909 = _3797;
            _3799 = _3909;
            if (!_3899)
            {
                _3811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3911 = _3811;
            bool _3913 = !_3899;
            _3813 = _3911;
            if (!_3913)
            {
                bool _3915 = _3226 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3917 = isnan(_3226);
                bool _3919 = _3915 || _3917;
                bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3923 = _3919 || _3921;
                if (!_3923)
                {
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3927 = _3226 + _3925;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3931 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3929;
                    float _3933 = 1.0 / _3931;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3955 = _3927 * _3933;
                    float _3957 = precise::clamp(_3955, 0.0, 1.0);
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3963 = fma(_3957, _3937, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3965 = fma(_3957, _3961, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3967 = fma(_3957, _3941, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3969 = fma(_3957, _3945, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3971 = fma(_3957, _3949, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3973 = fma(_3957, _3953, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3827 = _3965;
                    _3799 = _3971;
                    _3819 = _3963;
                    _3759 = _3969;
                    _3753 = _3967;
                    _3813 = _3973;
                    _3889 = true;
                }
                else
                {
                    _3827 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3759 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3753 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3889 = false;
    float _3975 = _3827;
    float _3977 = _3799;
    float _3979 = _3819;
    float _3981 = _3759;
    float _3983 = _3753;
    float _3985 = _3813;
    float _3987 = fma(_3721, -0.5, 0.5);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -_3975;
    float _3993 = _3991 + _3977;
    float _3995 = -_3979;
    float _3997 = _3995 + _3981;
    out.m_92.x = 0.0;
    float _3999 = fma(_3989, _3993, _3975);
    float _4001 = -_3983;
    float _4003 = _4001 + _3985;
    float _4005 = fma(_3989, _3997, _3979);
    float _4007 = _3999 * 0.586610972881317138671875;
    bool _4009 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4011 = fma(_3989, _4003, _3983);
    float _4013 = _3809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4015 = fma(_4005, 0.298911988735198974609375, _4007);
    bool _4017 = _3202 > 0.0;
    bool _4019 = isnan(_3202);
    bool _4021 = _4017 || _4019;
    bool _4023 = isnan(0.0);
    bool _4025 = _4021 || _4023;
    float _4027 = fma(_4011, 0.114477999508380889892578125, _4015);
    out.m_49.x = _4013;
    float _4029 = -_4027;
    float _4031 = _4005 + _4029;
    float _4033 = -_4027;
    float _4035 = _3999 + _4033;
    float _4037 = -_4027;
    float _4039 = _4011 + _4037;
    float _4041 = fma(_4031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4043 = fma(_4035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4045 = fma(_4039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    bool _4047 = !_4009;
    if (!_4047)
    {
        float _4049 = -_3140;
        float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4053 = -_3142;
        float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4057 = -_3144;
        float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4061 = _4051 * _4051;
        float _4063 = fma(_4055, _4055, _4061);
        float _4065 = fma(_4059, _4059, _4063);
        float _4067 = sqrt(_4065);
        float _4069 = rsqrt(_4065);
        float _4071 = -_4067;
        float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4077 = precise::clamp(_4075, 0.0, 1.0);
        float _4079 = _4055 * _4069;
        float _4081 = _4051 * _4069;
        float _4083 = abs(_4077);
        float _4085 = log2(_4083);
        float _4087 = _4059 * _4069;
        float _4089 = _4079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4091 = _3721 * _4081;
        float _4093 = -_4081;
        float _4095 = -_4089;
        float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4095);
        float _4099 = fma(_3739, _4079, _4091);
        float _4101 = -_4087;
        float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4097);
        float _4105 = fma(_3741, _4087, _4099);
        float _4107 = precise::clamp(_4105, 0.0, 1.0);
        float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4111 = _4103 + _4109;
        float _4113 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4117 = precise::clamp(_4115, 0.0, 1.0);
        float _4119 = exp2(_4113);
        float _4121 = _4119 * _4117;
        float _4123 = _4107 * _4121;
        float _4125 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4129 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4125;
        out.m_92.y = _4127;
        out.m_92.z = _4129;
    }
    out.m_94.x = _4041;
    out.m_94.y = _4043;
    out.m_94.z = _4045;
    if (_4025)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4131 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4131;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

