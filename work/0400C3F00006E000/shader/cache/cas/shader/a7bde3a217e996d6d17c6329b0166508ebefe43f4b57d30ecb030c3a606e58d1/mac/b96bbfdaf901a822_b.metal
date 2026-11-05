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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
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
    float4 m_62 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_74 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2685 = false;
    bool _471 = false;
    bool _363 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3001 = as_type<float>(_139);
        out.gl_Position.z = _3001;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    float _165 = _121 * _161;
    float _167 = _165;
    if (_159)
    {
        float _169 = _163 * 5.0;
        _141 = as_type<int>(_169);
    }
    int _171 = _141;
    out.m_51.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_171);
        out.gl_Position.z = _3064;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _165;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _215 + _233;
    bool _237 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _239 = isnan(_215);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -_231;
    float _259 = _257 + 1.0;
    float _261 = 1.0 / _255;
    bool _263 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _265 = isnan(_215);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = _247 * _259;
    float _277 = -_247;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = _273 * _279;
    float _285 = 1.0 / _251;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = -_273;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _299 = _235 * _261;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = fma(_297, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = _219 * _285;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = fma(_289, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = fma(_313, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _319 * _283;
    float _325 = _321 * _283;
    float _327 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _329 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _331 = fma(_307, _275, _327);
    float _333 = fma(_305, _275, _329);
    float _335 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].x, _331);
    float _337 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].y, _333);
    float _339 = _335 * _315;
    float _341 = _337 * _317;
    bool _343 = !_281;
    float _361;
    if (!_343)
    {
        float _345 = in.m_58.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        _361 = _165;
    }
    _363 = false;
    float _365 = _361;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _365 + _367;
    bool _371 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _383;
    bool _387 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _389 = isnan(_365);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_381;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _403;
    float _407 = 1.0 / _385;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = _397 * _401;
    float _413 = -_397;
    float _415 = _413 + 1.0;
    float _417 = _369 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _419;
    float _423 = fma(_405, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _425;
    float _429 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = _423 * _411;
    float _433 = fma(_427, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _429 * _411;
    float _437 = _433 * _411;
    float _439 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _431);
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _437);
    float _443 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _435);
    float _445 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].x, _439);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].y, _441);
    float _449 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].z, _443);
    bool _451 = !_409;
    float _469;
    if (!_451)
    {
        float _453 = in.m_58.x;
        float _455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _461 = _459 * _455;
        float _463 = floor(_461);
        float _465 = -_463;
        float _467 = _461 + _465;
        _469 = _467;
        _471 = true;
    }
    else
    {
        _469 = _165;
    }
    _471 = false;
    float _473 = _469;
    bool _475 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = isnan(_473);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _493 = isnan(_473);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _509 = _473 + _507;
    float _511 = -_485;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _517 = 1.0 / _489;
    float _519 = _501 * _513;
    float _521 = -_501;
    float _523 = _521 + 1.0;
    float _525 = _505 * _517;
    float _527 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _529 = fma(_525, _509, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _529 * _519;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _535);
    float _541 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _543 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[116].x, _539);
    float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _545;
    out.m_62.y = _537;
    out.m_62.z = _533;
    out.m_62.w = _547;
    bool _549 = !_515;
    if (!_549)
    {
        float _551 = in.m_58.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _167 = _565;
    }
    float _567 = _167;
    float _569 = in.m_46.x;
    float _571 = in.m_46.y;
    float _573 = in.m_46.z;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _577 = int(_575);
    float _579 = in.m_64.x;
    float _581 = in.m_64.y;
    float _583 = in.m_64.z;
    float _585 = in.m_64.w;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _589 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = in.m_66.x;
    float _593 = in.m_66.y;
    float _595 = in.m_66.z;
    float _597 = in.m_66.w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _601 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _603 = int(_601);
    float _605 = _589 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _607 = in.m_58.x;
    float _609 = in.m_58.y;
    float _611 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _613 = in.m_68.x;
    float _615 = in.m_68.y;
    float _617 = in.m_68.z;
    float _619 = in.m_68.w;
    float _621 = float(_577);
    float _623 = in.m_58.z;
    float _625 = 1.0 / _621;
    float _627 = float(_603);
    float _629 = _571 * _581;
    float _631 = _627 * _121;
    float _633 = fma(_569, _579, _629);
    float _635 = _571 * _593;
    float _637 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _639 = log2(_637);
    float _641 = _607 * 2.0;
    float _643 = fma(_569, _591, _635);
    float _645 = _609 * 2.0;
    float _647 = fma(_573, _583, _633);
    float _649 = -_587;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[77].x, _649);
    float _653 = _571 * _615;
    float _655 = floor(_641);
    float _657 = fma(_573, _595, _643);
    float _659 = _623 * 2.0;
    float _661 = fma(_569, _613, _653);
    float _663 = _609 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _665 = _609 + _607;
    float _667 = fma(_573, _617, _661);
    float _669 = floor(_645);
    float _671 = fma(_663, -2.0, _599);
    float _673 = _609 + _623;
    float _675 = _665 + (-1.0);
    float _677 = _657 + _597;
    float _679 = _673 + (-1.0);
    float _681 = _667 + _619;
    float _683 = floor(_659);
    float _685 = _639 * _121;
    bool _687 = _655 > 0.0;
    float _689 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _691 = _655 >= 0.0;
    bool _693 = isnan(_655);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _677 + _703;
    float _707 = exp2(_685);
    float _709 = _647 + _585;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _721 = _719 != 0;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _727 = _709 + _725;
    bool _729 = _669 > 0.0;
    float _731 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[78].w, _723);
    bool _733 = !_713;
    int _735 = _733 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _739 = _683 >= 0.0;
    bool _741 = isnan(_683);
    bool _743 = _739 || _741;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    float _749 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _731);
    bool _751 = !_717;
    int _753 = _751 ? 0 : 1;
    float _755 = _727 * _727;
    bool _757 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = _625 * _121;
    float _769 = -_707;
    float _771 = _769 + 1.0;
    int _773 = _699 ? 0 : 1;
    float _775 = fma(_705, _705, _755);
    bool _777 = _683 > 0.0;
    float _779 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[78].z, _737);
    bool _781 = _669 >= 0.0;
    bool _783 = isnan(_669);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _793 = _681 + _791;
    int _795 = _747 ? 0 : 1;
    float _797 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _779);
    bool _799 = !_721;
    int _801 = _799 ? 0 : 1;
    float _803 = -_121;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _807 = _765 ? _771 : 0.0;
    float _809 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _671);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _821 = _819 != 0;
    int _823 = ~_795;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _827;
    float _831 = _677;
    if (!_777)
    {
        int _833 = ~_795;
        int _835 = _833 + 1;
        _829 = _835;
    }
    int _837 = _829;
    bool _839 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(1.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    bool _853 = !_813;
    int _855 = _853 ? 0 : 1;
    float _857 = in.m_70.x;
    float _859 = in.m_70.y;
    float _861 = in.m_70.z;
    bool _863 = !_817;
    int _865 = _863 ? 0 : 1;
    float _867 = 1.0 / _851;
    int _869 = _789 ? 0 : 1;
    int _871 = abs(_865);
    int _873 = abs(_855);
    float _875 = fma(_793, _793, _775);
    int _877 = ~_773;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = float(_873);
    float _885 = float(_837);
    int _887 = _881;
    if (_847)
    {
        float _889 = _807 * _867;
        _131 = _889;
    }
    float _891 = _131;
    float _893 = sqrt(_875);
    if (!_687)
    {
        int _895 = ~_773;
        int _897 = _895 + 1;
        _887 = _897;
    }
    int _899 = _887;
    float _901 = _883 * _885;
    float _903 = float(_899);
    float _905 = rsqrt(_875);
    float _907 = float(_871);
    int _909 = ~_869;
    int _911 = _909 + 1;
    int _913 = _911 + 1;
    int _915 = _913;
    if (!_729)
    {
        int _917 = ~_869;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    float _923 = _901 * (-2.0);
    float _925 = _907 * _903;
    float _927 = _893 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _929 = _607 + (-0.5);
    float _931 = fma(_923, _857, _857);
    float _933 = _925 * (-2.0);
    bool _935 = !_821;
    int _937 = _935 ? 0 : 1;
    float _939 = fma(_701, _923, _701);
    float _941 = precise::min(_605, _927);
    float _943 = fma(_933, _859, _859);
    int _945 = abs(_937);
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[196].x, _931);
    float _949 = _609 + (-0.5);
    float _951 = _905 * _941;
    float _953 = float(_921);
    float _955 = fma(_939, _891, _947);
    float _957 = float(_945);
    float _959 = _727 * _951;
    float _961 = _705 * _951;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].y, _943);
    float _965 = fma(_689, _933, _689);
    float _967 = -_959;
    float _969 = _727 + _967;
    float _971 = -_961;
    float _973 = _705 + _971;
    float _975 = _957 * _953;
    float _977 = _955 * 0.15915493667125701904296875;
    float _979 = _969 * _969;
    float _981 = fma(_965, _891, _963);
    float _983 = _793 * _951;
    float _985 = fma(_973, _973, _979);
    float _987 = _623 + _607;
    float _989 = _975 * (-2.0);
    float _991 = -_983;
    float _993 = _793 + _991;
    float _995 = _623 + (-0.5);
    float _997 = _987 + (-1.0);
    float _999 = fma(_989, _861, _861);
    float _1001 = fma(_993, _993, _985);
    float _1003 = _981 * 0.15915493667125701904296875;
    float _1005 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].z, _999);
    float _1009 = _977 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1015 = fma(_1005, _989, _1005);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1019 = fma(_1015, _891, _1007);
    float _1021 = sqrt(_1001);
    float _1023 = _1019 * 0.15915493667125701904296875;
    float _1025 = _1003 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = _1003 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = _905 * _1021;
    float _1035 = _611 * _1033;
    float _1037 = _589 * _1033;
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = _977 * 6.283185482025146484375;
    float _1045 = sin(_1043);
    float _1047 = _1011 * _1027;
    float _1049 = _1035 * _1017;
    float _1051 = _1037 * _1013;
    float _1053 = _1023 * 6.283185482025146484375;
    float _1055 = cos(_1053);
    float _1057 = _1011 * _1031;
    float _1059 = _1023 * 6.283185482025146484375;
    float _1061 = sin(_1059);
    float _1063 = _1045 * _1027;
    float _1065 = _1045 * _1031;
    float _1067 = _1011 * _1055;
    float _1069 = _1045 * _1055;
    float _1071 = _1031 * _1055;
    float _1073 = _1027 * _1055;
    float _1075 = _1067 * _1049;
    float _1077 = fma(_1061, _1057, _1063);
    float _1079 = -_1065;
    float _1081 = fma(_1061, _1047, _1079);
    float _1083 = -_1049;
    float _1085 = _1061 * _1083;
    float _1087 = -_1047;
    float _1089 = fma(_1061, _1065, _1087);
    float _1091 = fma(_1077, _1051, _1075);
    float _1093 = _1069 * _1049;
    float _1095 = fma(_1071, _1051, _1085);
    float _1097 = fma(_1061, _1063, _1057);
    float _1099 = fma(_1081, _1041, _1091);
    float _1101 = fma(_1089, _1051, _1093);
    float _1103 = fma(_1073, _1041, _1095);
    float _1105 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_1097, _1041, _1101);
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1111);
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1113);
    float _1119 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1123 = _681 + _1119;
    float _1125 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1127 = _677 + _1121;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1131 = _1123 + _1129;
    float _1133 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1137 = _1127 + _1135;
    float _1139 = _1131 * _1131;
    float _1141 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1143 = fma(_1137, _1137, _1139);
    float _1145 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = sqrt(_1143);
    float _1149 = _709 + _1145;
    bool _1151 = _1147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1153 = _1099;
    float _1155 = _1139;
    float _1157 = _1103;
    float _1159 = _973;
    if (!_1151)
    {
        _1153 = _1127;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (!_1151)
    {
        _1155 = _1123;
    }
    float _1165 = _1155;
    float _1167 = _1165;
    if (!_1151)
    {
        _1157 = _1149;
    }
    float _1169 = _1157;
    bool _1171 = !_1151;
    float _1173 = _1169;
    if (!_1171)
    {
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1179 = _1147 + _1177;
        float _1181 = rsqrt(_1143);
        float _1183 = _1179 * _1175;
        float _1185 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = _1183 * 0.15915493667125701904296875;
        float _1189 = _1187 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = _1187 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = fma(_1191, _1185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1199 = _1181 * _1197;
        float _1201 = _1195 + (-1.0);
        float _1203 = fma(_1137, _1199, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1205 = fma(_1131, _1199, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1207 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = fma(_1149, _1195, _1207);
        _1173 = _1209;
        _1163 = _1203;
        _1167 = _1205;
    }
    float _1211 = _1173;
    float _1213 = _1163;
    float _1215 = _1167;
    float _1217 = -_959;
    float _1219 = _1217 + _1211;
    float _1221 = -_961;
    float _1223 = _1221 + _1213;
    float _1225 = -_983;
    float _1227 = _1225 + _1215;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1231 = _1219 + _1229;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1223 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1227 + _1237;
    float _1241 = -_961;
    float _1243 = _677 + _1241;
    float _1245 = _1231 * _1231;
    float _1247 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1249 = -_983;
    float _1251 = _681 + _1249;
    float _1253 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1255 = fma(_1235, _1235, _1245);
    float _1257 = precise::max(0.0, _1247);
    float _1259 = fma(_1239, _1239, _1255);
    float _1261 = rsqrt(_1259);
    float _1263 = sqrt(_1259);
    float _1265 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1267 = _1235 * _1265;
    float _1269 = _1239 * _1265;
    float _1271 = -_1265;
    float _1273 = -_1257;
    float _1275 = fma(_1231, _1271, _1273);
    float _1277 = _1267 * _1267;
    float _1279 = _1269 * _1269;
    float _1281 = _1277 + _1279;
    float _1283 = sqrt(_1281);
    bool _1285 = _1283 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1287 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = _1283 + _1287;
    float _1291 = _589;
    float _1293 = _1231;
    float _1295 = _1289;
    float _1297 = _1267;
    float _1299 = _1269;
    float _1301 = _1277;
    float _1303 = _1275;
    if (_1285)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1291 = _1305;
    }
    float _1307 = _1291;
    if (_1285)
    {
        float _1309 = _1275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1309;
    }
    float _1311 = _1293;
    float _1313 = _1311;
    if (!_1285)
    {
        _831 = _1279;
    }
    float _1315 = _831;
    float _1317 = _1307;
    float _1319 = _1315;
    if (_1285)
    {
        float _1321 = _1289 * _1307;
        _1295 = _1321;
    }
    float _1323 = _1295;
    if (_1285)
    {
        float _1325 = rsqrt(_1281);
        _1317 = _1325;
    }
    float _1327 = _1317;
    float _1329 = _1327;
    if (_1285)
    {
        float _1331 = _1323 * 0.15915493667125701904296875;
        _1159 = _1331;
    }
    float _1333 = _1159;
    float _1335 = _1007;
    if (_1285)
    {
        float _1337 = _1333 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        _1335 = _1339;
    }
    float _1341 = _1335;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1345 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1343);
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    float _1349 = _1323;
    if (_1285)
    {
        float _1351 = _1333 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = -_1347;
    float _1359 = _1357 + 1.0;
    float _1361 = _1341;
    if (_1285)
    {
        float _1363 = fma(_1341, _1311, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1369 = abs(_1359);
    float _1371 = log2(_1369);
    float _1373 = _1365;
    if (_1285)
    {
        float _1375 = _1327 * _1365;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1285)
    {
        float _1379 = _1355 + (-1.0);
        _1313 = _1379;
    }
    float _1381 = _1313;
    if (_1285)
    {
        float _1383 = _1267 * _1377;
        _1297 = _1383;
    }
    float _1385 = _1297;
    if (_1285)
    {
        float _1387 = _1269 * _1377;
        _1299 = _1387;
    }
    float _1389 = _1299;
    if (_1285)
    {
        float _1391 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1391;
    }
    float _1393 = _1329;
    if (_1285)
    {
        float _1395 = _1385 * _1385;
        _1301 = _1395;
    }
    float _1397 = _1301;
    if (_1285)
    {
        float _1399 = _1389 * _1389;
        _1319 = _1399;
    }
    float _1401 = _1319;
    float _1403 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1285)
    {
        float _1405 = fma(_1275, _1355, _1393);
        _1303 = _1405;
    }
    float _1407 = _1303;
    float _1409 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1411 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1413 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1415 = fma(_1407, _1407, _1397);
    float _1417 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1409);
    float _1419 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1367);
    float _1421 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1413);
    float _1423 = _1415 + _1401;
    float _1425 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1417);
    float _1427 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1421);
    float _1431 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1433 = rsqrt(_1423);
    float _1435 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1437 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1253);
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1441 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1445 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1447 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1437);
    float _1449 = floor(_1403);
    float _1451 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1443);
    float _1453 = -_1445;
    float _1455 = fma(_1453, _1441, 1.0);
    float _1457 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1459 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1461 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1451);
    float _1463 = _1433 * _1385;
    float _1465 = _1433 * _1407;
    float _1467 = _1433 * _1389;
    float _1469 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1461);
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1473 = floor(_1411);
    float _1475 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = -_1471;
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1477);
    float _1481 = -_1449;
    float _1483 = _1403 + _1481;
    float _1485 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1487 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1489 = -_1467;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1479);
    float _1493 = log2(_1455);
    float _1495 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1485);
    float _1497 = fma(_1491, -0.5, 0.5);
    float _1499 = fma(_1491, 0.5, 0.5);
    float _1501 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1503 = exp2(_1459);
    float _1505 = -_1473;
    float _1507 = _1411 + _1505;
    float _1509 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1487);
    float _1511 = _1465 + 1.0;
    float _1513 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1501);
    float _1515 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1509);
    float _1517 = 1.0 / _1469;
    float _1519 = fma(_1499, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1521 = fma(_1499, _1519, -0.212114393711090087890625);
    float _1523 = sqrt(_1497);
    float _1525 = -_1465;
    float _1527 = fma(_1503, _1511, _1525);
    float _1529 = _1493 * 0.693147182464599609375;
    float _1531 = fma(_1499, _1521, 1.570728778839111328125);
    float _1533 = fma(_1527, 0.5, 0.5);
    float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = _1513 * _1517;
    float _1539 = _1515 * _1517;
    float2 _5204 = float2(_1483, _1507);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5204, float2(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5204, float2(0.0), isnan(_5204)), level(0.0)).x;
    float _1543 = fma(_1539, -0.5, 0.5);
    float _1545 = _1523 * 0.636619746685028076171875;
    float _1547 = fma(_1537, 0.5, 0.5);
    float _1549 = -_1531;
    float _1551 = fma(_1545, _1549, 1.0);
    float3 _5227 = float3(_1547, _1543, _1535);
    float _1553 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).x;
    float3 _5238 = float3(_1547, _1543, _1535);
    float4 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5238, float3(0.0), isnan(_5238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5238, float3(0.0), isnan(_5238)), level(0.0)).xyzw;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = _1556.w;
    float2 _5254 = float2(_1551, _1533);
    float3 _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5254, float2(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5254, float2(0.0), isnan(_5254)), level(0.0)).xyz;
    float _1570 = _1568.x;
    float _1572 = _1568.y;
    float _1574 = _1568.z;
    float _1576 = float(uint(_603));
    float _1578 = trunc(_767);
    int _1580 = int(_1578);
    int _1582 = ~_603;
    int _1584 = _1582 + 1;
    float _1586 = _631 * _161;
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1590 = _1588 != 0;
    float _1592 = -_749;
    float _1594 = _1592 + 1.0;
    bool _1596 = _607 > 0.5;
    float _1598 = -_959;
    float _1600 = _709 + _1598;
    bool _1602 = _609 > 0.5;
    float _1604 = 1.0 / _1576;
    out.m_72.w = _941;
    int _1606 = abs(_753);
    float _1608 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1612 = _1610 != 0;
    out.m_74.x = _1243;
    out.m_74.y = _1600;
    out.m_74.z = _1251;
    float _1614 = trunc(_1586);
    int _1616 = int(_1614);
    float _1618 = float(uint(_1580));
    float _1620 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1622 = !_1612;
    float _1624 = _1622 ? 7.345489978790283203125 : 1.0;
    out.m_76.x = _1037;
    float _1626 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1608);
    float _1628 = -_1061;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1620);
    int _1632 = as_type<int>(_1604) + (-2);
    float _1634 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    out.m_78.x = _1223;
    out.m_78.y = _1219;
    out.m_78.z = _1227;
    float _1636 = as_type<float>(_1632) * _1618;
    float _1638 = trunc(_1636);
    float _1640 = precise::max(_1638, 0.0);
    uint _1643 = uint(_1640);
    int _1645 = ~_603;
    int _1647 = _1645 + 1;
    int _1649 = _1584 * int(_1643);
    int _1651 = _1649 + _1580;
    float _1653 = float(uint(_1651));
    float _1655 = as_type<float>(_1632) * _1653;
    float _1657 = trunc(_1655);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    float _1663 = _1624 * _607;
    float _1665 = floor(_1663);
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1671 = int(_1643) + int(_1661);
    float _1673 = float(_1580);
    float _1675 = 1.0 / _1669;
    int _1677 = _1647 * _1671;
    int _1679 = _1677 + _1580;
    bool _1681 = _1673 >= _627;
    bool _1683 = isnan(_1673);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan(_627);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    bool _1693 = uint(_1679) >= uint(_603);
    float _1695 = -_1665;
    float _1697 = _1663 + _1695;
    float _1699 = trunc(_1691);
    int _1701 = int(_1699);
    bool _1703 = !_1693;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = _1697 * _627;
    int _1709 = ~_1671;
    int _1711 = _1709 + _1705;
    int _1713 = _1711 + 1;
    float _1715 = trunc(_1707);
    int _1717 = int(_1715);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1721 = _1719 != 0;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1727 = _603 * _1713;
    int _1729 = _1727 + _1580;
    bool _1731 = !_1721;
    int _1733 = _1731 ? 0 : 1;
    bool _1735 = _603 == 0;
    float _1737 = 1.0 / _1725;
    int _1739 = ~_1701;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    bool _1745 = !_1735;
    int _1747 = _1745 ? _1729 : (-1);
    int _1749 = abs(_1733);
    int _1751 = _1747 * _1743;
    int _1753 = _603 + (-1);
    int _1755 = _1717 * _1749;
    int _1757 = _1755 + _1580;
    bool _1759 = !_1590;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1767 = abs(_735);
    int _1769 = _1701 * _1753;
    int _1771 = _1769 + _1751;
    int _1773 = abs(_801);
    float _1775 = 1.0 / _1765;
    int _1777 = abs(_1761);
    int _1779 = _1771 * _1606;
    int _1781 = _1616 * _1767;
    int _1783 = _1781 + _1779;
    int _1785 = _1757 * _1773;
    int _1787 = _1785 + _1783;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1795 = _1793 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1797;
    int _1801 = _1717 * _1777;
    int _1803 = _1801 + _1787;
    float _1805 = _1791 * _1675;
    float _1807 = _1795 * _1737;
    float _1809 = _1799 * _1775;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1813 = _567 + _1811;
    float _1815 = float(uint(_1803));
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1819 = _567 + _1817;
    bool _1821 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1823 = isnan(_567);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = fma(_1809, _1813, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1835 = ~_603;
    int _1837 = _1835 + 1;
    float _1839 = as_type<float>(_1632) * _1815;
    bool _1841 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1843 = isnan(_567);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = -_1831;
    float _1855 = _1853 + 1.0;
    bool _1857 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1859 = isnan(_567);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    float _1869 = fma(_1805, _1819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1873 = _567 + _1871;
    float _1875 = trunc(_1839);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = -_1851;
    float _1883 = _1881 + 1.0;
    float _1885 = _1851 * _1855;
    bool _1887 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1889 = isnan(_567);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = fma(_1807, _1873, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1901 = _1867 * _1883;
    float _1903 = -_1867;
    float _1905 = _1903 + 1.0;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1909 = _1907 != 0;
    float _1911 = -_187;
    int _1913 = _1596 ? as_type<int>(_1911) : as_type<int>(_187);
    float _1915 = _1897 * _1905;
    float _1917 = float(uint(_1757));
    bool _1919 = !_1909;
    float _1921 = _1919 ? _187 : as_type<float>(_1913);
    float _1923 = _1869 * _1915;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1927 = _1925 != 0;
    int _1929 = _1837 * int(_1879);
    int _1931 = _1929 + _1803;
    float _1933 = as_type<float>(_1632) * _1917;
    float _1935 = -_191;
    int _1937 = _1602 ? as_type<int>(_1935) : as_type<int>(_191);
    float _1939 = _1921 + 0.5;
    float _1941 = float(uint(_1931));
    bool _1943 = !_1927;
    float _1945 = _1943 ? _191 : as_type<float>(_1937);
    float _1947 = -_1897;
    float _1949 = _1947 + 1.0;
    float _1951 = trunc(_1933);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    float _1957 = as_type<float>(_1632) * _1941;
    float _1959 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[80].x, _805);
    float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1923);
    float _1963 = _1945 + (-0.5);
    int _1965 = ~_603;
    int _1967 = _1965 + 1;
    float _1969 = fma(_1899, _1901, _1961);
    float _1971 = trunc(_1957);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    float _1977 = -_1963;
    float _1979 = -_809;
    float _1981 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1979);
    float _1983 = -_797;
    float _1985 = _1983 + 1.0;
    float _1987 = fma(_1833, _1885, _1969);
    int _1989 = ~_603;
    int _1991 = _1989 + 1;
    float _1993 = fma(_1945, _1594, _1981);
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1997 = _1995 != 0;
    float _1999 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2001 = _1967 * int(_1955);
    int _2003 = _2001 + _1757;
    float _2005 = -_1985;
    float _2007 = fma(_1921, _2005, _1959);
    float _2009 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1999);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2013 = float(uint(_2003));
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2017 = int(_1879) + int(_1975);
    float _2019 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1987);
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2023 = as_type<float>(_1632) * _2013;
    out.m_80.x = _2007;
    out.m_80.y = _1993;
    int _2025 = _1991 * _2017;
    int _2027 = _2025 + _1803;
    float _2029 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2009);
    float _2031 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2033 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2035 = trunc(_2023);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    bool _2041 = uint(_2027) >= uint(_603);
    float _2043 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2033);
    bool _2045 = !_2041;
    int _2047 = _2045 ? 0 : (-1);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2053 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2055 = ~_2017;
    int _2057 = _2055 + _2047;
    int _2059 = _2057 + 1;
    float _2061 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2043);
    int _2065 = ~_603;
    int _2067 = _2065 + 1;
    out.m_82.x = _2049;
    out.m_82.y = _2051;
    out.m_82.z = _2053;
    out.m_82.w = _2031;
    int _2069 = _603 * _2059;
    int _2071 = _2069 + _1803;
    float _2073 = 1.0 / _2061;
    float _2075 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2077 = int(_1955) + int(_2039);
    float _2079 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2081 = _2075 + _2061;
    float _2083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2085 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2087 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2089 = -_1061;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2083);
    bool _2093 = !_1735;
    int _2095 = _2093 ? _2071 : (-1);
    float _2097 = _2081 * _2073;
    float _2099 = _2097 * 0.5;
    int _2101 = _2067 * _2077;
    int _2103 = _2101 + _1757;
    float _2105 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2091);
    int _2107 = _2095 >> 31;
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    float _2113 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2085);
    bool _2115 = uint(_2103) >= uint(_603);
    float _2117 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1630);
    int _2119 = _2107 & 3;
    float _2121 = 1.0 / _2111;
    float _2123 = -_1061;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2087);
    float _2127 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2129 = _2095 + _2119;
    float _2131 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2133 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2135 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2125);
    int _2137 = _2129 >> 2;
    float _2139 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2131);
    float _2141 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2133);
    float _2143 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2145 = _2137 << 4;
    int _2147 = _2145 + 368;
    float _2149 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2151 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2127);
    float _2153 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2143);
    uint _2155 = uint(int(uint(_2147) >> uint(2)));
    uint _2157 = uint(int(uint(int(_2155)) >> uint(2)));
    int _2159 = int(_2155) & 3;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[int(_2157)][_2159];
    int _2163 = int(_2155) + 1;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    int _2167 = _2163 & 3;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[int(_2165)][_2167];
    float _2171 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2079);
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2175 = _2121 * _2173;
    float _2177 = _2149 * _2105;
    float _2179 = _2149 * _2117;
    float _2181 = _2149 * _2135;
    int _2183 = _2095 & 3;
    bool _2185 = _2183 != 0;
    float _2187 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2139);
    int _2189 = _2095 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2113);
    int _2195 = _2147 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    uint _2199 = uint(int(uint(int(_2197)) >> uint(2)));
    int _2201 = int(_2197) & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    int _2205 = int(_2197) + 1;
    uint _2207 = uint(int(uint(_2205) >> uint(2)));
    int _2209 = _2205 & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    bool _2213 = uint(_2183) > 1u;
    float _2215 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2141);
    float _2217 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2219 = _2191 ? 0 : 1;
    float _2221 = abs(_2175);
    float _2223 = log2(_2221);
    float _2225 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2153);
    float _2227 = fma(_2217, _2187, _2177);
    int _2229 = ~_2219;
    int _2231 = _2229 + 1;
    int _2233 = _2231 + 1;
    float _2235 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2151);
    float _2237 = fma(_2217, _2193, _2179);
    bool _2239 = !_2115;
    int _2241 = _2239 ? 0 : (-1);
    float _2243 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2171);
    float _2245 = -_1541;
    float _2247 = _2245 + 1.0;
    int _2249 = _2233;
    float _2251 = _2211;
    float _2253 = _1626;
    float _2255 = _2225;
    float _2257 = _2175;
    if (!_2213)
    {
        int _2259 = ~_2219;
        int _2261 = _2259 + 1;
        _2249 = _2261;
    }
    int _2263 = _2249;
    float _2265 = in.m_84.x;
    bool _2267 = _2183 != 3;
    float _2269 = fma(_2217, _2215, _2181);
    bool _2271 = !_2185;
    int _2273 = _2271 ? 0 : 1;
    int _2275 = abs(_2263);
    float _2277 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2279 = uint(_2183) >= 2u;
    float _2281 = _2243 + _2269;
    int _2283 = abs(_2273);
    float _2285 = exp2(_2277);
    int _2287 = _2279 ? 0 : 1;
    int _2289 = ~_2275;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_2287;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    bool _2301 = _2183 != 3;
    int _2303 = _2299;
    if (_2267)
    {
        int _2305 = ~_2287;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    int _2311 = ~_2283;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2293 * as_type<int>(_2169);
    bool _2319 = !_2301;
    int _2321 = _2319 ? 0 : (-1);
    int _2323 = abs(_2309);
    int _2325 = _2315 * as_type<int>(_2161);
    int _2327 = _2325 + _2317;
    int _2329 = abs(_2321);
    bool _2331 = !_1997;
    int _2333 = _2331 ? 0 : 1;
    int _2335 = ~_2077;
    int _2337 = _2335 + _2241;
    int _2339 = _2337 + 1;
    bool _2341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2349 = _2345 || _2347;
    int _2351 = ~_2323;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = _603 * _2339;
    int _2359 = _2357 + _1757;
    int _2361 = abs(_2333);
    int _2363 = _2355 * as_type<int>(_2203);
    int _2365 = _2363 + _2327;
    int _2367 = ~_2329;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    float _2373 = fma(_2285, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    int _2377 = _2371 * as_type<int>(_2211);
    int _2379 = _2377 + _2365;
    float _2381 = as_type<float>(_2361);
    if (!_2349)
    {
        _2251 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2383 = _2251;
    float _2385 = fma(_2375, -2.0, 3.0);
    float _2387 = _2375 * _2375;
    int _2389 = ~_2361;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    float _2395 = _2383;
    if (!_2349)
    {
        float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2399 = _2175 + _2397;
        _2253 = _2399;
    }
    float _2401 = _2253;
    if (!_2349)
    {
        float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2405 = _2383 + _2403;
        _2395 = _2405;
    }
    float _2407 = _2395;
    float _2409 = _2387 * _2385;
    bool _2411 = !_1735;
    int _2413 = _2411 ? _2359 : (-1);
    int _2415 = _2379 * _2393;
    float _2417 = _1439;
    if (!_2349)
    {
        float _2419 = 1.0 / _2407;
        _2417 = _2419;
    }
    float _2421 = _2417;
    float _2423 = -_2409;
    float _2425 = _2423 + 1.0;
    bool _2427 = _2175 <= 8000.0;
    bool _2429 = isnan(_2175);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(8000.0);
    bool _2435 = _2431 || _2433;
    float _2437 = float(_2435);
    int _2439 = _2413 * _2361;
    int _2441 = _2439 + _2415;
    float _2443 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1634);
    float _2445 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2409);
    float _2447 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2449 = _2443;
    if (_2349)
    {
        _2381 = 1.0;
    }
    float _2451 = _2381;
    float _2453 = _2443 + _1469;
    float _2455 = _2437 * _2445;
    float _2457 = float(_2441);
    float _2459 = _2225 + _2237;
    float _2461 = _1513 + _1469;
    float _2463 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2465 = exp2(_2447);
    float _2467 = _1469 * 0.5;
    float _2469 = _2451;
    if (!_2349)
    {
        float _2471 = _2401 * _2421;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        _2469 = _2473;
    }
    float _2475 = _2469;
    if (!_2349)
    {
        _2255 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2477 = _2255;
    float _2479 = _2247 * _2463;
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = _2453 * 0.5;
    float _2485 = _2461 * 0.5;
    float _2487 = fma(_1515, -0.5, _2467);
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _2443;
    out.gl_Position.w = _1469;
    float _2489 = -_2481;
    float _2491 = fma(_2489, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2493 = _2235 + _2227;
    float _2495 = _1469;
    float _2497 = _2487;
    if (!_2349)
    {
        float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2501 = _2175 + _2499;
        _2257 = _2501;
    }
    float _2503 = _2257;
    out.m_86.x = _2485;
    out.m_86.y = _2487;
    out.m_86.z = _2483;
    out.m_86.w = _1469;
    float _2505 = _2491 * _2265;
    float _2507 = -_2465;
    float _2509 = _2507 + 1.0;
    bool _2511 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2513 = isnan(_1263);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2519 = _2515 || _2517;
    out.m_88.x = _2457;
    float _2521 = _2505 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2523 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_90.x = _2493;
    out.m_90.y = _2459;
    out.m_90.z = _2281;
    float _2525 = _2503;
    if (!_2349)
    {
        float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2529 = _2477 + _2527;
        _2449 = _2529;
    }
    float _2531 = _2449;
    float _2533 = _2523 * _1553;
    out.m_92.x = _2521;
    float _2535 = -_2523;
    float _2537 = _2535 + 1.0;
    float _2539 = _2485;
    float _2541 = _2533;
    if (!_2349)
    {
        float _2543 = 1.0 / _2531;
        _2539 = _2543;
    }
    float _2545 = _2539;
    float _2547 = _1564 * _2533;
    float _2549 = _1574 * _2533;
    if (_2349)
    {
        _2541 = 1.0;
    }
    float _2551 = _2541;
    float _2553 = _1564 * _2537;
    float _2555 = fma(_1570, _2547, _1558);
    float _2557 = fma(_1572, _2547, _1560);
    float _2559 = _2551;
    float _2561 = _2557;
    float _2563 = _2555;
    if (!_2519)
    {
        _2495 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2565 = _2495;
    float _2567 = fma(_1564, _2549, _1562);
    float _2569 = _2567;
    float _2571 = _2565;
    float _2573 = _2565;
    if (!_2519)
    {
        _2497 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2497;
    out.m_94.x = _2555;
    out.m_94.y = _2557;
    out.m_94.z = _2567;
    out.m_94.w = _2553;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2349)
    {
        float _2581 = _2503 * _2545;
        float _2583 = precise::clamp(_2581, 0.0, 1.0);
        _2525 = _2583;
    }
    float _2585 = _2525;
    if (!_2349)
    {
        float _2587 = -_2585;
        float _2589 = _2587 + 1.0;
        _2559 = _2589;
    }
    float _2591 = _2559;
    float _2593 = _2475 * _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2597 = _2593;
    if (!_2519)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2599 = _2597;
    float _2601 = _2599;
    float _2603 = _2599;
    if (!_2519)
    {
        _2569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2605 = _2569;
    float _2607 = _2605;
    float _2609 = _2605;
    if (!_2519)
    {
        _2561 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2611 = _2561;
    float _2613 = _2611;
    float _2615 = _2611;
    if (!_2519)
    {
        _2563 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2617 = _2563;
    bool _2619 = !_2519;
    float _2621 = _2617;
    float _2623 = _2617;
    if (!_2619)
    {
        bool _2625 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2627 = isnan(_1263);
        bool _2629 = _2625 || _2627;
        bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2633 = _2629 || _2631;
        if (!_2633)
        {
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2637 = _1263 + _2635;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2639;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2647 = 1.0 / _2641;
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2665 = _2637 * _2647;
            float _2667 = precise::clamp(_2665, 0.0, 1.0);
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2673 = fma(_2667, _2645, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2675 = fma(_2667, _2671, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2677 = fma(_2667, _2651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2679 = fma(_2667, _2655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2681 = fma(_2667, _2659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2683 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2603 = _2677;
            _2615 = _2681;
            _2573 = _2673;
            _2609 = _2679;
            _2579 = _2675;
            _2623 = _2683;
            _2685 = true;
        }
        else
        {
            bool _2687 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2689 = isnan(_1263);
            bool _2691 = _2687 || _2689;
            bool _2693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2695 = _2691 || _2693;
            if (!_2695)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2697 = _2571;
            _2573 = _2697;
            if (!_2695)
            {
                _2601 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2699 = _2601;
            _2603 = _2699;
            if (!_2695)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2701 = _2577;
            _2579 = _2701;
            if (!_2695)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2703 = _2607;
            _2609 = _2703;
            if (!_2695)
            {
                _2613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2705 = _2613;
            _2615 = _2705;
            if (!_2695)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2707 = _2621;
            bool _2709 = !_2695;
            _2623 = _2707;
            if (!_2709)
            {
                bool _2711 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2713 = isnan(_1263);
                bool _2715 = _2711 || _2713;
                bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2719 = _2715 || _2717;
                if (!_2719)
                {
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2723 = _1263 + _2721;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2725;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2733 = 1.0 / _2727;
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2751 = _2723 * _2733;
                    float _2753 = precise::clamp(_2751, 0.0, 1.0);
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2759 = fma(_2753, _2731, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2761 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2763 = fma(_2753, _2737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2765 = fma(_2753, _2741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2767 = fma(_2753, _2745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2769 = fma(_2753, _2749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2603 = _2763;
                    _2615 = _2767;
                    _2573 = _2759;
                    _2609 = _2765;
                    _2579 = _2761;
                    _2623 = _2769;
                    _2685 = true;
                }
                else
                {
                    _2603 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2685 = false;
    float _2771 = _2603;
    float _2773 = _2615;
    float _2775 = _2573;
    float _2777 = _2609;
    float _2779 = _2579;
    float _2781 = _2623;
    float _2783 = fma(_2459, -0.5, 0.5);
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = -_2771;
    float _2789 = _2787 + _2773;
    float _2791 = _2595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2793 = -_2775;
    float _2795 = _2793 + _2777;
    float _2797 = fma(_2785, _2789, _2771);
    out.m_96.x = 0.0;
    float _2799 = -_2779;
    float _2801 = _2799 + _2781;
    float _2803 = fma(_2785, _2795, _2775);
    float _2805 = _2797 * 0.586610972881317138671875;
    out.m_53.x = _2791;
    bool _2807 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2809 = fma(_2785, _2801, _2779);
    float _2811 = fma(_2803, 0.298911988735198974609375, _2805);
    bool _2813 = _2475 > 0.0;
    bool _2815 = isnan(_2475);
    bool _2817 = _2813 || _2815;
    bool _2819 = isnan(0.0);
    bool _2821 = _2817 || _2819;
    float _2823 = fma(_2809, 0.114477999508380889892578125, _2811);
    bool _2825 = _2591 <= 0.0;
    bool _2827 = !_2821;
    bool _2829 = _2825 || _2827;
    float _2831 = -_2823;
    float _2833 = _2803 + _2831;
    float _2835 = -_2823;
    float _2837 = _2797 + _2835;
    float _2839 = -_2823;
    float _2841 = _2809 + _2839;
    float _2843 = fma(_2833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    float _2845 = fma(_2837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    float _2847 = fma(_2841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    bool _2849 = !_2807;
    if (!_2849)
    {
        float _2851 = -_1219;
        float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2855 = -_1223;
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2859 = -_1227;
        float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2863 = _2853 * _2853;
        float _2865 = fma(_2857, _2857, _2863);
        float _2867 = fma(_2861, _2861, _2865);
        float _2869 = sqrt(_2867);
        float _2871 = rsqrt(_2867);
        float _2873 = -_2869;
        float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2877 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2879 = precise::clamp(_2877, 0.0, 1.0);
        float _2881 = _2857 * _2871;
        float _2883 = _2853 * _2871;
        float _2885 = abs(_2879);
        float _2887 = log2(_2885);
        float _2889 = _2861 * _2871;
        float _2891 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2893 = _2459 * _2883;
        float _2895 = -_2883;
        float _2897 = -_2891;
        float _2899 = fma(_2895, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2897);
        float _2901 = fma(_2493, _2881, _2893);
        float _2903 = -_2889;
        float _2905 = fma(_2903, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2899);
        float _2907 = fma(_2281, _2889, _2901);
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2913 = _2905 + _2911;
        float _2915 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2917 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        float _2921 = exp2(_2915);
        float _2923 = _2921 * _2919;
        float _2925 = _2909 * _2923;
        float _2927 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2929 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2931 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2927;
        out.m_96.y = _2929;
        out.m_96.z = _2931;
    }
    out.m_72.x = _2843;
    out.m_72.y = _2845;
    out.m_72.z = _2847;
    if (!_2829)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2933 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2933;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2685 = false;
    bool _471 = false;
    bool _363 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3001 = as_type<float>(_139);
        out.gl_Position.z = _3001;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    float _165 = _121 * _161;
    float _167 = _165;
    if (_159)
    {
        float _169 = _163 * 5.0;
        _141 = as_type<int>(_169);
    }
    int _171 = _141;
    out.m_51.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_171);
        out.gl_Position.z = _3064;
    }
    if (_159)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _165;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _215 + _233;
    bool _237 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _239 = isnan(_215);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -_231;
    float _259 = _257 + 1.0;
    float _261 = 1.0 / _255;
    bool _263 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _265 = isnan(_215);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = _247 * _259;
    float _277 = -_247;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = _273 * _279;
    float _285 = 1.0 / _251;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = -_273;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _299 = _235 * _261;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = fma(_297, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = _219 * _285;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = fma(_289, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = fma(_313, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _319 * _283;
    float _325 = _321 * _283;
    float _327 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _329 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _331 = fma(_307, _275, _327);
    float _333 = fma(_305, _275, _329);
    float _335 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].x, _331);
    float _337 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].y, _333);
    float _339 = _335 * _315;
    float _341 = _337 * _317;
    bool _343 = !_281;
    float _361;
    if (!_343)
    {
        float _345 = in.m_58.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        _361 = _165;
    }
    _363 = false;
    float _365 = _361;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _365 + _367;
    bool _371 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _383;
    bool _387 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _389 = isnan(_365);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_381;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _403;
    float _407 = 1.0 / _385;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = _397 * _401;
    float _413 = -_397;
    float _415 = _413 + 1.0;
    float _417 = _369 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _419;
    float _423 = fma(_405, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _425;
    float _429 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = _423 * _411;
    float _433 = fma(_427, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _429 * _411;
    float _437 = _433 * _411;
    float _439 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _431);
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _437);
    float _443 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _435);
    float _445 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].x, _439);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].y, _441);
    float _449 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].z, _443);
    bool _451 = !_409;
    float _469;
    if (!_451)
    {
        float _453 = in.m_58.x;
        float _455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _461 = _459 * _455;
        float _463 = floor(_461);
        float _465 = -_463;
        float _467 = _461 + _465;
        _469 = _467;
        _471 = true;
    }
    else
    {
        _469 = _165;
    }
    _471 = false;
    float _473 = _469;
    bool _475 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = isnan(_473);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _493 = isnan(_473);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _509 = _473 + _507;
    float _511 = -_485;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _517 = 1.0 / _489;
    float _519 = _501 * _513;
    float _521 = -_501;
    float _523 = _521 + 1.0;
    float _525 = _505 * _517;
    float _527 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _529 = fma(_525, _509, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _529 * _519;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _535);
    float _541 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _543 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[116].x, _539);
    float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _545;
    out.m_62.y = _537;
    out.m_62.z = _533;
    out.m_62.w = _547;
    bool _549 = !_515;
    if (!_549)
    {
        float _551 = in.m_58.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _167 = _565;
    }
    float _567 = _167;
    float _569 = in.m_46.x;
    float _571 = in.m_46.y;
    float _573 = in.m_46.z;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _577 = int(_575);
    float _579 = in.m_64.x;
    float _581 = in.m_64.y;
    float _583 = in.m_64.z;
    float _585 = in.m_64.w;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _589 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = in.m_66.x;
    float _593 = in.m_66.y;
    float _595 = in.m_66.z;
    float _597 = in.m_66.w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _601 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _603 = int(_601);
    float _605 = _589 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _607 = in.m_58.x;
    float _609 = in.m_58.y;
    float _611 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _613 = in.m_68.x;
    float _615 = in.m_68.y;
    float _617 = in.m_68.z;
    float _619 = in.m_68.w;
    float _621 = float(_577);
    float _623 = in.m_58.z;
    float _625 = 1.0 / _621;
    float _627 = float(_603);
    float _629 = _571 * _581;
    float _631 = _627 * _121;
    float _633 = fma(_569, _579, _629);
    float _635 = _571 * _593;
    float _637 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _639 = log2(_637);
    float _641 = _607 * 2.0;
    float _643 = fma(_569, _591, _635);
    float _645 = _609 * 2.0;
    float _647 = fma(_573, _583, _633);
    float _649 = -_587;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[77].x, _649);
    float _653 = _571 * _615;
    float _655 = floor(_641);
    float _657 = fma(_573, _595, _643);
    float _659 = _623 * 2.0;
    float _661 = fma(_569, _613, _653);
    float _663 = _609 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _665 = _609 + _607;
    float _667 = fma(_573, _617, _661);
    float _669 = floor(_645);
    float _671 = fma(_663, -2.0, _599);
    float _673 = _609 + _623;
    float _675 = _665 + (-1.0);
    float _677 = _657 + _597;
    float _679 = _673 + (-1.0);
    float _681 = _667 + _619;
    float _683 = floor(_659);
    float _685 = _639 * _121;
    bool _687 = _655 > 0.0;
    float _689 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _691 = _655 >= 0.0;
    bool _693 = isnan(_655);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _677 + _703;
    float _707 = exp2(_685);
    float _709 = _647 + _585;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _721 = _719 != 0;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _727 = _709 + _725;
    bool _729 = _669 > 0.0;
    float _731 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[78].w, _723);
    bool _733 = !_713;
    int _735 = _733 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _739 = _683 >= 0.0;
    bool _741 = isnan(_683);
    bool _743 = _739 || _741;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    float _749 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _731);
    bool _751 = !_717;
    int _753 = _751 ? 0 : 1;
    float _755 = _727 * _727;
    bool _757 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = _625 * _121;
    float _769 = -_707;
    float _771 = _769 + 1.0;
    int _773 = _699 ? 0 : 1;
    float _775 = fma(_705, _705, _755);
    bool _777 = _683 > 0.0;
    float _779 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[78].z, _737);
    bool _781 = _669 >= 0.0;
    bool _783 = isnan(_669);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _793 = _681 + _791;
    int _795 = _747 ? 0 : 1;
    float _797 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _779);
    bool _799 = !_721;
    int _801 = _799 ? 0 : 1;
    float _803 = -_121;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _807 = _765 ? _771 : 0.0;
    float _809 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _671);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _821 = _819 != 0;
    int _823 = ~_795;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _827;
    float _831 = _677;
    if (!_777)
    {
        int _833 = ~_795;
        int _835 = _833 + 1;
        _829 = _835;
    }
    int _837 = _829;
    bool _839 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(1.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    bool _853 = !_813;
    int _855 = _853 ? 0 : 1;
    float _857 = in.m_70.x;
    float _859 = in.m_70.y;
    float _861 = in.m_70.z;
    bool _863 = !_817;
    int _865 = _863 ? 0 : 1;
    float _867 = 1.0 / _851;
    int _869 = _789 ? 0 : 1;
    int _871 = abs(_865);
    int _873 = abs(_855);
    float _875 = fma(_793, _793, _775);
    int _877 = ~_773;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = float(_873);
    float _885 = float(_837);
    int _887 = _881;
    if (_847)
    {
        float _889 = _807 * _867;
        _131 = _889;
    }
    float _891 = _131;
    float _893 = sqrt(_875);
    if (!_687)
    {
        int _895 = ~_773;
        int _897 = _895 + 1;
        _887 = _897;
    }
    int _899 = _887;
    float _901 = _883 * _885;
    float _903 = float(_899);
    float _905 = rsqrt(_875);
    float _907 = float(_871);
    int _909 = ~_869;
    int _911 = _909 + 1;
    int _913 = _911 + 1;
    int _915 = _913;
    if (!_729)
    {
        int _917 = ~_869;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    float _923 = _901 * (-2.0);
    float _925 = _907 * _903;
    float _927 = _893 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _929 = _607 + (-0.5);
    float _931 = fma(_923, _857, _857);
    float _933 = _925 * (-2.0);
    bool _935 = !_821;
    int _937 = _935 ? 0 : 1;
    float _939 = fma(_701, _923, _701);
    float _941 = precise::min(_605, _927);
    float _943 = fma(_933, _859, _859);
    int _945 = abs(_937);
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[196].x, _931);
    float _949 = _609 + (-0.5);
    float _951 = _905 * _941;
    float _953 = float(_921);
    float _955 = fma(_939, _891, _947);
    float _957 = float(_945);
    float _959 = _727 * _951;
    float _961 = _705 * _951;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].y, _943);
    float _965 = fma(_689, _933, _689);
    float _967 = -_959;
    float _969 = _727 + _967;
    float _971 = -_961;
    float _973 = _705 + _971;
    float _975 = _957 * _953;
    float _977 = _955 * 0.15915493667125701904296875;
    float _979 = _969 * _969;
    float _981 = fma(_965, _891, _963);
    float _983 = _793 * _951;
    float _985 = fma(_973, _973, _979);
    float _987 = _623 + _607;
    float _989 = _975 * (-2.0);
    float _991 = -_983;
    float _993 = _793 + _991;
    float _995 = _623 + (-0.5);
    float _997 = _987 + (-1.0);
    float _999 = fma(_989, _861, _861);
    float _1001 = fma(_993, _993, _985);
    float _1003 = _981 * 0.15915493667125701904296875;
    float _1005 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].z, _999);
    float _1009 = _977 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1015 = fma(_1005, _989, _1005);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1019 = fma(_1015, _891, _1007);
    float _1021 = sqrt(_1001);
    float _1023 = _1019 * 0.15915493667125701904296875;
    float _1025 = _1003 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = _1003 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = _905 * _1021;
    float _1035 = _611 * _1033;
    float _1037 = _589 * _1033;
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = _977 * 6.283185482025146484375;
    float _1045 = sin(_1043);
    float _1047 = _1011 * _1027;
    float _1049 = _1035 * _1017;
    float _1051 = _1037 * _1013;
    float _1053 = _1023 * 6.283185482025146484375;
    float _1055 = cos(_1053);
    float _1057 = _1011 * _1031;
    float _1059 = _1023 * 6.283185482025146484375;
    float _1061 = sin(_1059);
    float _1063 = _1045 * _1027;
    float _1065 = _1045 * _1031;
    float _1067 = _1011 * _1055;
    float _1069 = _1045 * _1055;
    float _1071 = _1031 * _1055;
    float _1073 = _1027 * _1055;
    float _1075 = _1067 * _1049;
    float _1077 = fma(_1061, _1057, _1063);
    float _1079 = -_1065;
    float _1081 = fma(_1061, _1047, _1079);
    float _1083 = -_1049;
    float _1085 = _1061 * _1083;
    float _1087 = -_1047;
    float _1089 = fma(_1061, _1065, _1087);
    float _1091 = fma(_1077, _1051, _1075);
    float _1093 = _1069 * _1049;
    float _1095 = fma(_1071, _1051, _1085);
    float _1097 = fma(_1061, _1063, _1057);
    float _1099 = fma(_1081, _1041, _1091);
    float _1101 = fma(_1089, _1051, _1093);
    float _1103 = fma(_1073, _1041, _1095);
    float _1105 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_1097, _1041, _1101);
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1111);
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1113);
    float _1119 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1123 = _681 + _1119;
    float _1125 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1127 = _677 + _1121;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1131 = _1123 + _1129;
    float _1133 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1137 = _1127 + _1135;
    float _1139 = _1131 * _1131;
    float _1141 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1143 = fma(_1137, _1137, _1139);
    float _1145 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = sqrt(_1143);
    float _1149 = _709 + _1145;
    bool _1151 = _1147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1153 = _1099;
    float _1155 = _1139;
    float _1157 = _1103;
    float _1159 = _973;
    if (!_1151)
    {
        _1153 = _1127;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (!_1151)
    {
        _1155 = _1123;
    }
    float _1165 = _1155;
    float _1167 = _1165;
    if (!_1151)
    {
        _1157 = _1149;
    }
    float _1169 = _1157;
    bool _1171 = !_1151;
    float _1173 = _1169;
    if (!_1171)
    {
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1179 = _1147 + _1177;
        float _1181 = rsqrt(_1143);
        float _1183 = _1179 * _1175;
        float _1185 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = _1183 * 0.15915493667125701904296875;
        float _1189 = _1187 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = _1187 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = fma(_1191, _1185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1199 = _1181 * _1197;
        float _1201 = _1195 + (-1.0);
        float _1203 = fma(_1137, _1199, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1205 = fma(_1131, _1199, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1207 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = fma(_1149, _1195, _1207);
        _1173 = _1209;
        _1163 = _1203;
        _1167 = _1205;
    }
    float _1211 = _1173;
    float _1213 = _1163;
    float _1215 = _1167;
    float _1217 = -_959;
    float _1219 = _1217 + _1211;
    float _1221 = -_961;
    float _1223 = _1221 + _1213;
    float _1225 = -_983;
    float _1227 = _1225 + _1215;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1231 = _1219 + _1229;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1223 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1227 + _1237;
    float _1241 = -_961;
    float _1243 = _677 + _1241;
    float _1245 = _1231 * _1231;
    float _1247 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1249 = -_983;
    float _1251 = _681 + _1249;
    float _1253 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1255 = fma(_1235, _1235, _1245);
    float _1257 = precise::max(0.0, _1247);
    float _1259 = fma(_1239, _1239, _1255);
    float _1261 = rsqrt(_1259);
    float _1263 = sqrt(_1259);
    float _1265 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1267 = _1235 * _1265;
    float _1269 = _1239 * _1265;
    float _1271 = -_1265;
    float _1273 = -_1257;
    float _1275 = fma(_1231, _1271, _1273);
    float _1277 = _1267 * _1267;
    float _1279 = _1269 * _1269;
    float _1281 = _1277 + _1279;
    float _1283 = sqrt(_1281);
    bool _1285 = _1283 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1287 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = _1283 + _1287;
    float _1291 = _589;
    float _1293 = _1231;
    float _1295 = _1289;
    float _1297 = _1267;
    float _1299 = _1269;
    float _1301 = _1277;
    float _1303 = _1275;
    if (_1285)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1291 = _1305;
    }
    float _1307 = _1291;
    if (_1285)
    {
        float _1309 = _1275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1309;
    }
    float _1311 = _1293;
    float _1313 = _1311;
    if (!_1285)
    {
        _831 = _1279;
    }
    float _1315 = _831;
    float _1317 = _1307;
    float _1319 = _1315;
    if (_1285)
    {
        float _1321 = _1289 * _1307;
        _1295 = _1321;
    }
    float _1323 = _1295;
    if (_1285)
    {
        float _1325 = rsqrt(_1281);
        _1317 = _1325;
    }
    float _1327 = _1317;
    float _1329 = _1327;
    if (_1285)
    {
        float _1331 = _1323 * 0.15915493667125701904296875;
        _1159 = _1331;
    }
    float _1333 = _1159;
    float _1335 = _1007;
    if (_1285)
    {
        float _1337 = _1333 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        _1335 = _1339;
    }
    float _1341 = _1335;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1345 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1343);
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    float _1349 = _1323;
    if (_1285)
    {
        float _1351 = _1333 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = -_1347;
    float _1359 = _1357 + 1.0;
    float _1361 = _1341;
    if (_1285)
    {
        float _1363 = fma(_1341, _1311, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1369 = abs(_1359);
    float _1371 = log2(_1369);
    float _1373 = _1365;
    if (_1285)
    {
        float _1375 = _1327 * _1365;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1285)
    {
        float _1379 = _1355 + (-1.0);
        _1313 = _1379;
    }
    float _1381 = _1313;
    if (_1285)
    {
        float _1383 = _1267 * _1377;
        _1297 = _1383;
    }
    float _1385 = _1297;
    if (_1285)
    {
        float _1387 = _1269 * _1377;
        _1299 = _1387;
    }
    float _1389 = _1299;
    if (_1285)
    {
        float _1391 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1391;
    }
    float _1393 = _1329;
    if (_1285)
    {
        float _1395 = _1385 * _1385;
        _1301 = _1395;
    }
    float _1397 = _1301;
    if (_1285)
    {
        float _1399 = _1389 * _1389;
        _1319 = _1399;
    }
    float _1401 = _1319;
    float _1403 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1285)
    {
        float _1405 = fma(_1275, _1355, _1393);
        _1303 = _1405;
    }
    float _1407 = _1303;
    float _1409 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1411 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1413 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1415 = fma(_1407, _1407, _1397);
    float _1417 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1409);
    float _1419 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1367);
    float _1421 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1413);
    float _1423 = _1415 + _1401;
    float _1425 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1417);
    float _1427 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1421);
    float _1431 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1433 = rsqrt(_1423);
    float _1435 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1437 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1253);
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1441 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1445 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1447 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1437);
    float _1449 = floor(_1403);
    float _1451 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1443);
    float _1453 = -_1445;
    float _1455 = fma(_1453, _1441, 1.0);
    float _1457 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1459 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1461 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1451);
    float _1463 = _1433 * _1385;
    float _1465 = _1433 * _1407;
    float _1467 = _1433 * _1389;
    float _1469 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1461);
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1473 = floor(_1411);
    float _1475 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = -_1471;
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1477);
    float _1481 = -_1449;
    float _1483 = _1403 + _1481;
    float _1485 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1487 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1489 = -_1467;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1479);
    float _1493 = log2(_1455);
    float _1495 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1485);
    float _1497 = fma(_1491, -0.5, 0.5);
    float _1499 = fma(_1491, 0.5, 0.5);
    float _1501 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1503 = exp2(_1459);
    float _1505 = -_1473;
    float _1507 = _1411 + _1505;
    float _1509 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1487);
    float _1511 = _1465 + 1.0;
    float _1513 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1501);
    float _1515 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1509);
    float _1517 = 1.0 / _1469;
    float _1519 = fma(_1499, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1521 = fma(_1499, _1519, -0.212114393711090087890625);
    float _1523 = sqrt(_1497);
    float _1525 = -_1465;
    float _1527 = fma(_1503, _1511, _1525);
    float _1529 = _1493 * 0.693147182464599609375;
    float _1531 = fma(_1499, _1521, 1.570728778839111328125);
    float _1533 = fma(_1527, 0.5, 0.5);
    float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = _1513 * _1517;
    float _1539 = _1515 * _1517;
    float2 _5204 = float2(_1483, _1507);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5204, float2(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5204, float2(0.0), isnan(_5204)), level(0.0)).x;
    float _1543 = fma(_1539, -0.5, 0.5);
    float _1545 = _1523 * 0.636619746685028076171875;
    float _1547 = fma(_1537, 0.5, 0.5);
    float _1549 = -_1531;
    float _1551 = fma(_1545, _1549, 1.0);
    float3 _5227 = float3(_1547, _1543, _1535);
    float _1553 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).x;
    float3 _5238 = float3(_1547, _1543, _1535);
    float4 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5238, float3(0.0), isnan(_5238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5238, float3(0.0), isnan(_5238)), level(0.0)).xyzw;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = _1556.w;
    float2 _5254 = float2(_1551, _1533);
    float3 _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5254, float2(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5254, float2(0.0), isnan(_5254)), level(0.0)).xyz;
    float _1570 = _1568.x;
    float _1572 = _1568.y;
    float _1574 = _1568.z;
    float _1576 = float(uint(_603));
    float _1578 = trunc(_767);
    int _1580 = int(_1578);
    int _1582 = ~_603;
    int _1584 = _1582 + 1;
    float _1586 = _631 * _161;
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1590 = _1588 != 0;
    float _1592 = -_749;
    float _1594 = _1592 + 1.0;
    bool _1596 = _607 > 0.5;
    float _1598 = -_959;
    float _1600 = _709 + _1598;
    bool _1602 = _609 > 0.5;
    float _1604 = 1.0 / _1576;
    out.m_72.w = _941;
    int _1606 = abs(_753);
    float _1608 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1612 = _1610 != 0;
    out.m_74.x = _1243;
    out.m_74.y = _1600;
    out.m_74.z = _1251;
    float _1614 = trunc(_1586);
    int _1616 = int(_1614);
    float _1618 = float(uint(_1580));
    float _1620 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1622 = !_1612;
    float _1624 = _1622 ? 7.345489978790283203125 : 1.0;
    out.m_76.x = _1037;
    float _1626 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1608);
    float _1628 = -_1061;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1620);
    int _1632 = as_type<int>(_1604) + (-2);
    float _1634 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    out.m_78.x = _1223;
    out.m_78.y = _1219;
    out.m_78.z = _1227;
    float _1636 = as_type<float>(_1632) * _1618;
    float _1638 = trunc(_1636);
    float _1640 = precise::max(_1638, 0.0);
    uint _1643 = uint(_1640);
    int _1645 = ~_603;
    int _1647 = _1645 + 1;
    int _1649 = _1584 * int(_1643);
    int _1651 = _1649 + _1580;
    float _1653 = float(uint(_1651));
    float _1655 = as_type<float>(_1632) * _1653;
    float _1657 = trunc(_1655);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    float _1663 = _1624 * _607;
    float _1665 = floor(_1663);
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1671 = int(_1643) + int(_1661);
    float _1673 = float(_1580);
    float _1675 = 1.0 / _1669;
    int _1677 = _1647 * _1671;
    int _1679 = _1677 + _1580;
    bool _1681 = _1673 >= _627;
    bool _1683 = isnan(_1673);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan(_627);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    bool _1693 = uint(_1679) >= uint(_603);
    float _1695 = -_1665;
    float _1697 = _1663 + _1695;
    float _1699 = trunc(_1691);
    int _1701 = int(_1699);
    bool _1703 = !_1693;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = _1697 * _627;
    int _1709 = ~_1671;
    int _1711 = _1709 + _1705;
    int _1713 = _1711 + 1;
    float _1715 = trunc(_1707);
    int _1717 = int(_1715);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1721 = _1719 != 0;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1727 = _603 * _1713;
    int _1729 = _1727 + _1580;
    bool _1731 = !_1721;
    int _1733 = _1731 ? 0 : 1;
    bool _1735 = _603 == 0;
    float _1737 = 1.0 / _1725;
    int _1739 = ~_1701;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    bool _1745 = !_1735;
    int _1747 = _1745 ? _1729 : (-1);
    int _1749 = abs(_1733);
    int _1751 = _1747 * _1743;
    int _1753 = _603 + (-1);
    int _1755 = _1717 * _1749;
    int _1757 = _1755 + _1580;
    bool _1759 = !_1590;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1767 = abs(_735);
    int _1769 = _1701 * _1753;
    int _1771 = _1769 + _1751;
    int _1773 = abs(_801);
    float _1775 = 1.0 / _1765;
    int _1777 = abs(_1761);
    int _1779 = _1771 * _1606;
    int _1781 = _1616 * _1767;
    int _1783 = _1781 + _1779;
    int _1785 = _1757 * _1773;
    int _1787 = _1785 + _1783;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1795 = _1793 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1797;
    int _1801 = _1717 * _1777;
    int _1803 = _1801 + _1787;
    float _1805 = _1791 * _1675;
    float _1807 = _1795 * _1737;
    float _1809 = _1799 * _1775;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1813 = _567 + _1811;
    float _1815 = float(uint(_1803));
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1819 = _567 + _1817;
    bool _1821 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1823 = isnan(_567);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = fma(_1809, _1813, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1835 = ~_603;
    int _1837 = _1835 + 1;
    float _1839 = as_type<float>(_1632) * _1815;
    bool _1841 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1843 = isnan(_567);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = -_1831;
    float _1855 = _1853 + 1.0;
    bool _1857 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1859 = isnan(_567);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    float _1869 = fma(_1805, _1819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1873 = _567 + _1871;
    float _1875 = trunc(_1839);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = -_1851;
    float _1883 = _1881 + 1.0;
    float _1885 = _1851 * _1855;
    bool _1887 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1889 = isnan(_567);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = fma(_1807, _1873, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1901 = _1867 * _1883;
    float _1903 = -_1867;
    float _1905 = _1903 + 1.0;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1909 = _1907 != 0;
    float _1911 = -_187;
    int _1913 = _1596 ? as_type<int>(_1911) : as_type<int>(_187);
    float _1915 = _1897 * _1905;
    float _1917 = float(uint(_1757));
    bool _1919 = !_1909;
    float _1921 = _1919 ? _187 : as_type<float>(_1913);
    float _1923 = _1869 * _1915;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1927 = _1925 != 0;
    int _1929 = _1837 * int(_1879);
    int _1931 = _1929 + _1803;
    float _1933 = as_type<float>(_1632) * _1917;
    float _1935 = -_191;
    int _1937 = _1602 ? as_type<int>(_1935) : as_type<int>(_191);
    float _1939 = _1921 + 0.5;
    float _1941 = float(uint(_1931));
    bool _1943 = !_1927;
    float _1945 = _1943 ? _191 : as_type<float>(_1937);
    float _1947 = -_1897;
    float _1949 = _1947 + 1.0;
    float _1951 = trunc(_1933);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    float _1957 = as_type<float>(_1632) * _1941;
    float _1959 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[80].x, _805);
    float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1923);
    float _1963 = _1945 + (-0.5);
    int _1965 = ~_603;
    int _1967 = _1965 + 1;
    float _1969 = fma(_1899, _1901, _1961);
    float _1971 = trunc(_1957);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    float _1977 = -_1963;
    float _1979 = -_809;
    float _1981 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1979);
    float _1983 = -_797;
    float _1985 = _1983 + 1.0;
    float _1987 = fma(_1833, _1885, _1969);
    int _1989 = ~_603;
    int _1991 = _1989 + 1;
    float _1993 = fma(_1945, _1594, _1981);
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1997 = _1995 != 0;
    float _1999 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2001 = _1967 * int(_1955);
    int _2003 = _2001 + _1757;
    float _2005 = -_1985;
    float _2007 = fma(_1921, _2005, _1959);
    float _2009 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1999);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2013 = float(uint(_2003));
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2017 = int(_1879) + int(_1975);
    float _2019 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1987);
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2023 = as_type<float>(_1632) * _2013;
    out.m_80.x = _2007;
    out.m_80.y = _1993;
    int _2025 = _1991 * _2017;
    int _2027 = _2025 + _1803;
    float _2029 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2009);
    float _2031 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2033 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2035 = trunc(_2023);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    bool _2041 = uint(_2027) >= uint(_603);
    float _2043 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2033);
    bool _2045 = !_2041;
    int _2047 = _2045 ? 0 : (-1);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2053 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2055 = ~_2017;
    int _2057 = _2055 + _2047;
    int _2059 = _2057 + 1;
    float _2061 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2043);
    int _2065 = ~_603;
    int _2067 = _2065 + 1;
    out.m_82.x = _2049;
    out.m_82.y = _2051;
    out.m_82.z = _2053;
    out.m_82.w = _2031;
    int _2069 = _603 * _2059;
    int _2071 = _2069 + _1803;
    float _2073 = 1.0 / _2061;
    float _2075 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2077 = int(_1955) + int(_2039);
    float _2079 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2081 = _2075 + _2061;
    float _2083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2085 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2087 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2089 = -_1061;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2083);
    bool _2093 = !_1735;
    int _2095 = _2093 ? _2071 : (-1);
    float _2097 = _2081 * _2073;
    float _2099 = _2097 * 0.5;
    int _2101 = _2067 * _2077;
    int _2103 = _2101 + _1757;
    float _2105 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2091);
    int _2107 = _2095 >> 31;
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    float _2113 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2085);
    bool _2115 = uint(_2103) >= uint(_603);
    float _2117 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1630);
    int _2119 = _2107 & 3;
    float _2121 = 1.0 / _2111;
    float _2123 = -_1061;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2087);
    float _2127 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2129 = _2095 + _2119;
    float _2131 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2133 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2135 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2125);
    int _2137 = _2129 >> 2;
    float _2139 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2131);
    float _2141 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2133);
    float _2143 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2145 = _2137 << 4;
    int _2147 = _2145 + 368;
    float _2149 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2151 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2127);
    float _2153 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2143);
    uint _2155 = uint(int(uint(_2147) >> uint(2)));
    uint _2157 = uint(int(uint(int(_2155)) >> uint(2)));
    int _2159 = int(_2155) & 3;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[int(_2157)][_2159];
    int _2163 = int(_2155) + 1;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    int _2167 = _2163 & 3;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[int(_2165)][_2167];
    float _2171 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2079);
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2175 = _2121 * _2173;
    float _2177 = _2149 * _2105;
    float _2179 = _2149 * _2117;
    float _2181 = _2149 * _2135;
    int _2183 = _2095 & 3;
    bool _2185 = _2183 != 0;
    float _2187 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2139);
    int _2189 = _2095 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2113);
    int _2195 = _2147 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    uint _2199 = uint(int(uint(int(_2197)) >> uint(2)));
    int _2201 = int(_2197) & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    int _2205 = int(_2197) + 1;
    uint _2207 = uint(int(uint(_2205) >> uint(2)));
    int _2209 = _2205 & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    bool _2213 = uint(_2183) > 1u;
    float _2215 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2141);
    float _2217 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2219 = _2191 ? 0 : 1;
    float _2221 = abs(_2175);
    float _2223 = log2(_2221);
    float _2225 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2153);
    float _2227 = fma(_2217, _2187, _2177);
    int _2229 = ~_2219;
    int _2231 = _2229 + 1;
    int _2233 = _2231 + 1;
    float _2235 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2151);
    float _2237 = fma(_2217, _2193, _2179);
    bool _2239 = !_2115;
    int _2241 = _2239 ? 0 : (-1);
    float _2243 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2171);
    float _2245 = -_1541;
    float _2247 = _2245 + 1.0;
    int _2249 = _2233;
    float _2251 = _2211;
    float _2253 = _1626;
    float _2255 = _2225;
    float _2257 = _2175;
    if (!_2213)
    {
        int _2259 = ~_2219;
        int _2261 = _2259 + 1;
        _2249 = _2261;
    }
    int _2263 = _2249;
    float _2265 = in.m_84.x;
    bool _2267 = _2183 != 3;
    float _2269 = fma(_2217, _2215, _2181);
    bool _2271 = !_2185;
    int _2273 = _2271 ? 0 : 1;
    int _2275 = abs(_2263);
    float _2277 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2279 = uint(_2183) >= 2u;
    float _2281 = _2243 + _2269;
    int _2283 = abs(_2273);
    float _2285 = exp2(_2277);
    int _2287 = _2279 ? 0 : 1;
    int _2289 = ~_2275;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_2287;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    bool _2301 = _2183 != 3;
    int _2303 = _2299;
    if (_2267)
    {
        int _2305 = ~_2287;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    int _2311 = ~_2283;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2293 * as_type<int>(_2169);
    bool _2319 = !_2301;
    int _2321 = _2319 ? 0 : (-1);
    int _2323 = abs(_2309);
    int _2325 = _2315 * as_type<int>(_2161);
    int _2327 = _2325 + _2317;
    int _2329 = abs(_2321);
    bool _2331 = !_1997;
    int _2333 = _2331 ? 0 : 1;
    int _2335 = ~_2077;
    int _2337 = _2335 + _2241;
    int _2339 = _2337 + 1;
    bool _2341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2349 = _2345 || _2347;
    int _2351 = ~_2323;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = _603 * _2339;
    int _2359 = _2357 + _1757;
    int _2361 = abs(_2333);
    int _2363 = _2355 * as_type<int>(_2203);
    int _2365 = _2363 + _2327;
    int _2367 = ~_2329;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    float _2373 = fma(_2285, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    int _2377 = _2371 * as_type<int>(_2211);
    int _2379 = _2377 + _2365;
    float _2381 = as_type<float>(_2361);
    if (!_2349)
    {
        _2251 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2383 = _2251;
    float _2385 = fma(_2375, -2.0, 3.0);
    float _2387 = _2375 * _2375;
    int _2389 = ~_2361;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    float _2395 = _2383;
    if (!_2349)
    {
        float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2399 = _2175 + _2397;
        _2253 = _2399;
    }
    float _2401 = _2253;
    if (!_2349)
    {
        float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2405 = _2383 + _2403;
        _2395 = _2405;
    }
    float _2407 = _2395;
    float _2409 = _2387 * _2385;
    bool _2411 = !_1735;
    int _2413 = _2411 ? _2359 : (-1);
    int _2415 = _2379 * _2393;
    float _2417 = _1439;
    if (!_2349)
    {
        float _2419 = 1.0 / _2407;
        _2417 = _2419;
    }
    float _2421 = _2417;
    float _2423 = -_2409;
    float _2425 = _2423 + 1.0;
    bool _2427 = _2175 <= 8000.0;
    bool _2429 = isnan(_2175);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(8000.0);
    bool _2435 = _2431 || _2433;
    float _2437 = float(_2435);
    int _2439 = _2413 * _2361;
    int _2441 = _2439 + _2415;
    float _2443 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1634);
    float _2445 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2409);
    float _2447 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2449 = _2443;
    if (_2349)
    {
        _2381 = 1.0;
    }
    float _2451 = _2381;
    float _2453 = _2443 + _1469;
    float _2455 = _2437 * _2445;
    float _2457 = float(_2441);
    float _2459 = _2225 + _2237;
    float _2461 = _1513 + _1469;
    float _2463 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2465 = exp2(_2447);
    float _2467 = _1469 * 0.5;
    float _2469 = _2451;
    if (!_2349)
    {
        float _2471 = _2401 * _2421;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        _2469 = _2473;
    }
    float _2475 = _2469;
    if (!_2349)
    {
        _2255 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2477 = _2255;
    float _2479 = _2247 * _2463;
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = _2453 * 0.5;
    float _2485 = _2461 * 0.5;
    float _2487 = fma(_1515, -0.5, _2467);
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _2443;
    out.gl_Position.w = _1469;
    float _2489 = -_2481;
    float _2491 = fma(_2489, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2493 = _2235 + _2227;
    float _2495 = _1469;
    float _2497 = _2487;
    if (!_2349)
    {
        float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2501 = _2175 + _2499;
        _2257 = _2501;
    }
    float _2503 = _2257;
    out.m_86.x = _2485;
    out.m_86.y = _2487;
    out.m_86.z = _2483;
    out.m_86.w = _1469;
    float _2505 = _2491 * _2265;
    float _2507 = -_2465;
    float _2509 = _2507 + 1.0;
    bool _2511 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2513 = isnan(_1263);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2519 = _2515 || _2517;
    out.m_88.x = _2457;
    float _2521 = _2505 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2523 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_90.x = _2493;
    out.m_90.y = _2459;
    out.m_90.z = _2281;
    float _2525 = _2503;
    if (!_2349)
    {
        float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2529 = _2477 + _2527;
        _2449 = _2529;
    }
    float _2531 = _2449;
    float _2533 = _2523 * _1553;
    out.m_92.x = _2521;
    float _2535 = -_2523;
    float _2537 = _2535 + 1.0;
    float _2539 = _2485;
    float _2541 = _2533;
    if (!_2349)
    {
        float _2543 = 1.0 / _2531;
        _2539 = _2543;
    }
    float _2545 = _2539;
    float _2547 = _1564 * _2533;
    float _2549 = _1574 * _2533;
    if (_2349)
    {
        _2541 = 1.0;
    }
    float _2551 = _2541;
    float _2553 = _1564 * _2537;
    float _2555 = fma(_1570, _2547, _1558);
    float _2557 = fma(_1572, _2547, _1560);
    float _2559 = _2551;
    float _2561 = _2557;
    float _2563 = _2555;
    if (!_2519)
    {
        _2495 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2565 = _2495;
    float _2567 = fma(_1564, _2549, _1562);
    float _2569 = _2567;
    float _2571 = _2565;
    float _2573 = _2565;
    if (!_2519)
    {
        _2497 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2497;
    out.m_94.x = _2555;
    out.m_94.y = _2557;
    out.m_94.z = _2567;
    out.m_94.w = _2553;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2349)
    {
        float _2581 = _2503 * _2545;
        float _2583 = precise::clamp(_2581, 0.0, 1.0);
        _2525 = _2583;
    }
    float _2585 = _2525;
    if (!_2349)
    {
        float _2587 = -_2585;
        float _2589 = _2587 + 1.0;
        _2559 = _2589;
    }
    float _2591 = _2559;
    float _2593 = _2475 * _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2597 = _2593;
    if (!_2519)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2599 = _2597;
    float _2601 = _2599;
    float _2603 = _2599;
    if (!_2519)
    {
        _2569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2605 = _2569;
    float _2607 = _2605;
    float _2609 = _2605;
    if (!_2519)
    {
        _2561 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2611 = _2561;
    float _2613 = _2611;
    float _2615 = _2611;
    if (!_2519)
    {
        _2563 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2617 = _2563;
    bool _2619 = !_2519;
    float _2621 = _2617;
    float _2623 = _2617;
    if (!_2619)
    {
        bool _2625 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2627 = isnan(_1263);
        bool _2629 = _2625 || _2627;
        bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2633 = _2629 || _2631;
        if (!_2633)
        {
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2637 = _1263 + _2635;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2639;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2647 = 1.0 / _2641;
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2665 = _2637 * _2647;
            float _2667 = precise::clamp(_2665, 0.0, 1.0);
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2673 = fma(_2667, _2645, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2675 = fma(_2667, _2671, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2677 = fma(_2667, _2651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2679 = fma(_2667, _2655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2681 = fma(_2667, _2659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2683 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2603 = _2677;
            _2615 = _2681;
            _2573 = _2673;
            _2609 = _2679;
            _2579 = _2675;
            _2623 = _2683;
            _2685 = true;
        }
        else
        {
            bool _2687 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2689 = isnan(_1263);
            bool _2691 = _2687 || _2689;
            bool _2693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2695 = _2691 || _2693;
            if (!_2695)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2697 = _2571;
            _2573 = _2697;
            if (!_2695)
            {
                _2601 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2699 = _2601;
            _2603 = _2699;
            if (!_2695)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2701 = _2577;
            _2579 = _2701;
            if (!_2695)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2703 = _2607;
            _2609 = _2703;
            if (!_2695)
            {
                _2613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2705 = _2613;
            _2615 = _2705;
            if (!_2695)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2707 = _2621;
            bool _2709 = !_2695;
            _2623 = _2707;
            if (!_2709)
            {
                bool _2711 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2713 = isnan(_1263);
                bool _2715 = _2711 || _2713;
                bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2719 = _2715 || _2717;
                if (!_2719)
                {
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2723 = _1263 + _2721;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2725;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2733 = 1.0 / _2727;
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2751 = _2723 * _2733;
                    float _2753 = precise::clamp(_2751, 0.0, 1.0);
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2759 = fma(_2753, _2731, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2761 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2763 = fma(_2753, _2737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2765 = fma(_2753, _2741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2767 = fma(_2753, _2745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2769 = fma(_2753, _2749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2603 = _2763;
                    _2615 = _2767;
                    _2573 = _2759;
                    _2609 = _2765;
                    _2579 = _2761;
                    _2623 = _2769;
                    _2685 = true;
                }
                else
                {
                    _2603 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2685 = false;
    float _2771 = _2603;
    float _2773 = _2615;
    float _2775 = _2573;
    float _2777 = _2609;
    float _2779 = _2579;
    float _2781 = _2623;
    float _2783 = fma(_2459, -0.5, 0.5);
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = -_2771;
    float _2789 = _2787 + _2773;
    float _2791 = _2595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2793 = -_2775;
    float _2795 = _2793 + _2777;
    float _2797 = fma(_2785, _2789, _2771);
    out.m_96.x = 0.0;
    float _2799 = -_2779;
    float _2801 = _2799 + _2781;
    float _2803 = fma(_2785, _2795, _2775);
    float _2805 = _2797 * 0.586610972881317138671875;
    out.m_53.x = _2791;
    bool _2807 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2809 = fma(_2785, _2801, _2779);
    float _2811 = fma(_2803, 0.298911988735198974609375, _2805);
    bool _2813 = _2475 > 0.0;
    bool _2815 = isnan(_2475);
    bool _2817 = _2813 || _2815;
    bool _2819 = isnan(0.0);
    bool _2821 = _2817 || _2819;
    float _2823 = fma(_2809, 0.114477999508380889892578125, _2811);
    bool _2825 = _2591 <= 0.0;
    bool _2827 = !_2821;
    bool _2829 = _2825 || _2827;
    float _2831 = -_2823;
    float _2833 = _2803 + _2831;
    float _2835 = -_2823;
    float _2837 = _2797 + _2835;
    float _2839 = -_2823;
    float _2841 = _2809 + _2839;
    float _2843 = fma(_2833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    float _2845 = fma(_2837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    float _2847 = fma(_2841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    bool _2849 = !_2807;
    if (!_2849)
    {
        float _2851 = -_1219;
        float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2855 = -_1223;
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2859 = -_1227;
        float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2863 = _2853 * _2853;
        float _2865 = fma(_2857, _2857, _2863);
        float _2867 = fma(_2861, _2861, _2865);
        float _2869 = sqrt(_2867);
        float _2871 = rsqrt(_2867);
        float _2873 = -_2869;
        float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2877 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2879 = precise::clamp(_2877, 0.0, 1.0);
        float _2881 = _2857 * _2871;
        float _2883 = _2853 * _2871;
        float _2885 = abs(_2879);
        float _2887 = log2(_2885);
        float _2889 = _2861 * _2871;
        float _2891 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2893 = _2459 * _2883;
        float _2895 = -_2883;
        float _2897 = -_2891;
        float _2899 = fma(_2895, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2897);
        float _2901 = fma(_2493, _2881, _2893);
        float _2903 = -_2889;
        float _2905 = fma(_2903, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2899);
        float _2907 = fma(_2281, _2889, _2901);
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2913 = _2905 + _2911;
        float _2915 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2917 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        float _2921 = exp2(_2915);
        float _2923 = _2921 * _2919;
        float _2925 = _2909 * _2923;
        float _2927 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2929 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2931 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2927;
        out.m_96.y = _2929;
        out.m_96.z = _2931;
    }
    out.m_72.x = _2843;
    out.m_72.y = _2845;
    out.m_72.z = _2847;
    if (!_2829)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2933 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2933;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2685 = false;
    bool _471 = false;
    bool _363 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3001 = as_type<float>(_139);
        out.gl_Position.z = _3001;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    float _165 = _121 * _161;
    float _167 = _165;
    if (_159)
    {
        float _169 = _163 * 5.0;
        _141 = as_type<int>(_169);
    }
    int _171 = _141;
    out.m_51.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_171);
        out.gl_Position.z = _3064;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _165;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _215 + _233;
    bool _237 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _239 = isnan(_215);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -_231;
    float _259 = _257 + 1.0;
    float _261 = 1.0 / _255;
    bool _263 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _265 = isnan(_215);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = _247 * _259;
    float _277 = -_247;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = _273 * _279;
    float _285 = 1.0 / _251;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = -_273;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _299 = _235 * _261;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = fma(_297, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = _219 * _285;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = fma(_289, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = fma(_313, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _319 * _283;
    float _325 = _321 * _283;
    float _327 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _329 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _331 = fma(_307, _275, _327);
    float _333 = fma(_305, _275, _329);
    float _335 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].x, _331);
    float _337 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[145].y, _333);
    float _339 = _335 * _315;
    float _341 = _337 * _317;
    bool _343 = !_281;
    float _361;
    if (!_343)
    {
        float _345 = in.m_58.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        _361 = _165;
    }
    _363 = false;
    float _365 = _361;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _365 + _367;
    bool _371 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _383;
    bool _387 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _389 = isnan(_365);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_381;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _403;
    float _407 = 1.0 / _385;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = _397 * _401;
    float _413 = -_397;
    float _415 = _413 + 1.0;
    float _417 = _369 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _419;
    float _423 = fma(_405, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _425;
    float _429 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = _423 * _411;
    float _433 = fma(_427, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _429 * _411;
    float _437 = _433 * _411;
    float _439 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _431);
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _437);
    float _443 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _435);
    float _445 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].x, _439);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].y, _441);
    float _449 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].z, _443);
    bool _451 = !_409;
    float _469;
    if (!_451)
    {
        float _453 = in.m_58.x;
        float _455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _461 = _459 * _455;
        float _463 = floor(_461);
        float _465 = -_463;
        float _467 = _461 + _465;
        _469 = _467;
        _471 = true;
    }
    else
    {
        _469 = _165;
    }
    _471 = false;
    float _473 = _469;
    bool _475 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = isnan(_473);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _493 = isnan(_473);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _509 = _473 + _507;
    float _511 = -_485;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _517 = 1.0 / _489;
    float _519 = _501 * _513;
    float _521 = -_501;
    float _523 = _521 + 1.0;
    float _525 = _505 * _517;
    float _527 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _529 = fma(_525, _509, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _529 * _519;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _535);
    float _541 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _543 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[116].x, _539);
    float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _545;
    out.m_62.y = _537;
    out.m_62.z = _533;
    out.m_62.w = _547;
    bool _549 = !_515;
    if (!_549)
    {
        float _551 = in.m_58.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _167 = _565;
    }
    float _567 = _167;
    float _569 = in.m_46.x;
    float _571 = in.m_46.y;
    float _573 = in.m_46.z;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _577 = int(_575);
    float _579 = in.m_64.x;
    float _581 = in.m_64.y;
    float _583 = in.m_64.z;
    float _585 = in.m_64.w;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _589 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = in.m_66.x;
    float _593 = in.m_66.y;
    float _595 = in.m_66.z;
    float _597 = in.m_66.w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _601 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _603 = int(_601);
    float _605 = _589 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _607 = in.m_58.x;
    float _609 = in.m_58.y;
    float _611 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _613 = in.m_68.x;
    float _615 = in.m_68.y;
    float _617 = in.m_68.z;
    float _619 = in.m_68.w;
    float _621 = float(_577);
    float _623 = in.m_58.z;
    float _625 = 1.0 / _621;
    float _627 = float(_603);
    float _629 = _571 * _581;
    float _631 = _627 * _121;
    float _633 = fma(_569, _579, _629);
    float _635 = _571 * _593;
    float _637 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _639 = log2(_637);
    float _641 = _607 * 2.0;
    float _643 = fma(_569, _591, _635);
    float _645 = _609 * 2.0;
    float _647 = fma(_573, _583, _633);
    float _649 = -_587;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[77].x, _649);
    float _653 = _571 * _615;
    float _655 = floor(_641);
    float _657 = fma(_573, _595, _643);
    float _659 = _623 * 2.0;
    float _661 = fma(_569, _613, _653);
    float _663 = _609 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _665 = _609 + _607;
    float _667 = fma(_573, _617, _661);
    float _669 = floor(_645);
    float _671 = fma(_663, -2.0, _599);
    float _673 = _609 + _623;
    float _675 = _665 + (-1.0);
    float _677 = _657 + _597;
    float _679 = _673 + (-1.0);
    float _681 = _667 + _619;
    float _683 = floor(_659);
    float _685 = _639 * _121;
    bool _687 = _655 > 0.0;
    float _689 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _691 = _655 >= 0.0;
    bool _693 = isnan(_655);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _677 + _703;
    float _707 = exp2(_685);
    float _709 = _647 + _585;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _721 = _719 != 0;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _727 = _709 + _725;
    bool _729 = _669 > 0.0;
    float _731 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[78].w, _723);
    bool _733 = !_713;
    int _735 = _733 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _739 = _683 >= 0.0;
    bool _741 = isnan(_683);
    bool _743 = _739 || _741;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    float _749 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _731);
    bool _751 = !_717;
    int _753 = _751 ? 0 : 1;
    float _755 = _727 * _727;
    bool _757 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = _625 * _121;
    float _769 = -_707;
    float _771 = _769 + 1.0;
    int _773 = _699 ? 0 : 1;
    float _775 = fma(_705, _705, _755);
    bool _777 = _683 > 0.0;
    float _779 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[78].z, _737);
    bool _781 = _669 >= 0.0;
    bool _783 = isnan(_669);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _793 = _681 + _791;
    int _795 = _747 ? 0 : 1;
    float _797 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _779);
    bool _799 = !_721;
    int _801 = _799 ? 0 : 1;
    float _803 = -_121;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _807 = _765 ? _771 : 0.0;
    float _809 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _671);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _821 = _819 != 0;
    int _823 = ~_795;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _827;
    float _831 = _677;
    if (!_777)
    {
        int _833 = ~_795;
        int _835 = _833 + 1;
        _829 = _835;
    }
    int _837 = _829;
    bool _839 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(1.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    bool _853 = !_813;
    int _855 = _853 ? 0 : 1;
    float _857 = in.m_70.x;
    float _859 = in.m_70.y;
    float _861 = in.m_70.z;
    bool _863 = !_817;
    int _865 = _863 ? 0 : 1;
    float _867 = 1.0 / _851;
    int _869 = _789 ? 0 : 1;
    int _871 = abs(_865);
    int _873 = abs(_855);
    float _875 = fma(_793, _793, _775);
    int _877 = ~_773;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = float(_873);
    float _885 = float(_837);
    int _887 = _881;
    if (_847)
    {
        float _889 = _807 * _867;
        _131 = _889;
    }
    float _891 = _131;
    float _893 = sqrt(_875);
    if (!_687)
    {
        int _895 = ~_773;
        int _897 = _895 + 1;
        _887 = _897;
    }
    int _899 = _887;
    float _901 = _883 * _885;
    float _903 = float(_899);
    float _905 = rsqrt(_875);
    float _907 = float(_871);
    int _909 = ~_869;
    int _911 = _909 + 1;
    int _913 = _911 + 1;
    int _915 = _913;
    if (!_729)
    {
        int _917 = ~_869;
        int _919 = _917 + 1;
        _915 = _919;
    }
    int _921 = _915;
    float _923 = _901 * (-2.0);
    float _925 = _907 * _903;
    float _927 = _893 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _929 = _607 + (-0.5);
    float _931 = fma(_923, _857, _857);
    float _933 = _925 * (-2.0);
    bool _935 = !_821;
    int _937 = _935 ? 0 : 1;
    float _939 = fma(_701, _923, _701);
    float _941 = precise::min(_605, _927);
    float _943 = fma(_933, _859, _859);
    int _945 = abs(_937);
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[196].x, _931);
    float _949 = _609 + (-0.5);
    float _951 = _905 * _941;
    float _953 = float(_921);
    float _955 = fma(_939, _891, _947);
    float _957 = float(_945);
    float _959 = _727 * _951;
    float _961 = _705 * _951;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].y, _943);
    float _965 = fma(_689, _933, _689);
    float _967 = -_959;
    float _969 = _727 + _967;
    float _971 = -_961;
    float _973 = _705 + _971;
    float _975 = _957 * _953;
    float _977 = _955 * 0.15915493667125701904296875;
    float _979 = _969 * _969;
    float _981 = fma(_965, _891, _963);
    float _983 = _793 * _951;
    float _985 = fma(_973, _973, _979);
    float _987 = _623 + _607;
    float _989 = _975 * (-2.0);
    float _991 = -_983;
    float _993 = _793 + _991;
    float _995 = _623 + (-0.5);
    float _997 = _987 + (-1.0);
    float _999 = fma(_989, _861, _861);
    float _1001 = fma(_993, _993, _985);
    float _1003 = _981 * 0.15915493667125701904296875;
    float _1005 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].z, _999);
    float _1009 = _977 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1015 = fma(_1005, _989, _1005);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1019 = fma(_1015, _891, _1007);
    float _1021 = sqrt(_1001);
    float _1023 = _1019 * 0.15915493667125701904296875;
    float _1025 = _1003 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = _1003 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = _905 * _1021;
    float _1035 = _611 * _1033;
    float _1037 = _589 * _1033;
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = _977 * 6.283185482025146484375;
    float _1045 = sin(_1043);
    float _1047 = _1011 * _1027;
    float _1049 = _1035 * _1017;
    float _1051 = _1037 * _1013;
    float _1053 = _1023 * 6.283185482025146484375;
    float _1055 = cos(_1053);
    float _1057 = _1011 * _1031;
    float _1059 = _1023 * 6.283185482025146484375;
    float _1061 = sin(_1059);
    float _1063 = _1045 * _1027;
    float _1065 = _1045 * _1031;
    float _1067 = _1011 * _1055;
    float _1069 = _1045 * _1055;
    float _1071 = _1031 * _1055;
    float _1073 = _1027 * _1055;
    float _1075 = _1067 * _1049;
    float _1077 = fma(_1061, _1057, _1063);
    float _1079 = -_1065;
    float _1081 = fma(_1061, _1047, _1079);
    float _1083 = -_1049;
    float _1085 = _1061 * _1083;
    float _1087 = -_1047;
    float _1089 = fma(_1061, _1065, _1087);
    float _1091 = fma(_1077, _1051, _1075);
    float _1093 = _1069 * _1049;
    float _1095 = fma(_1071, _1051, _1085);
    float _1097 = fma(_1061, _1063, _1057);
    float _1099 = fma(_1081, _1041, _1091);
    float _1101 = fma(_1089, _1051, _1093);
    float _1103 = fma(_1073, _1041, _1095);
    float _1105 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_1097, _1041, _1101);
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1111);
    float _1117 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1113);
    float _1119 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1123 = _681 + _1119;
    float _1125 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1127 = _677 + _1121;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1131 = _1123 + _1129;
    float _1133 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1125);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1137 = _1127 + _1135;
    float _1139 = _1131 * _1131;
    float _1141 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1143 = fma(_1137, _1137, _1139);
    float _1145 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = sqrt(_1143);
    float _1149 = _709 + _1145;
    bool _1151 = _1147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1153 = _1099;
    float _1155 = _1139;
    float _1157 = _1103;
    float _1159 = _973;
    if (!_1151)
    {
        _1153 = _1127;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (!_1151)
    {
        _1155 = _1123;
    }
    float _1165 = _1155;
    float _1167 = _1165;
    if (!_1151)
    {
        _1157 = _1149;
    }
    float _1169 = _1157;
    bool _1171 = !_1151;
    float _1173 = _1169;
    if (!_1171)
    {
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1179 = _1147 + _1177;
        float _1181 = rsqrt(_1143);
        float _1183 = _1179 * _1175;
        float _1185 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = _1183 * 0.15915493667125701904296875;
        float _1189 = _1187 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = _1187 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = fma(_1191, _1185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1199 = _1181 * _1197;
        float _1201 = _1195 + (-1.0);
        float _1203 = fma(_1137, _1199, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1205 = fma(_1131, _1199, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1207 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = fma(_1149, _1195, _1207);
        _1173 = _1209;
        _1163 = _1203;
        _1167 = _1205;
    }
    float _1211 = _1173;
    float _1213 = _1163;
    float _1215 = _1167;
    float _1217 = -_959;
    float _1219 = _1217 + _1211;
    float _1221 = -_961;
    float _1223 = _1221 + _1213;
    float _1225 = -_983;
    float _1227 = _1225 + _1215;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1231 = _1219 + _1229;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1223 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1227 + _1237;
    float _1241 = -_961;
    float _1243 = _677 + _1241;
    float _1245 = _1231 * _1231;
    float _1247 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1249 = -_983;
    float _1251 = _681 + _1249;
    float _1253 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1255 = fma(_1235, _1235, _1245);
    float _1257 = precise::max(0.0, _1247);
    float _1259 = fma(_1239, _1239, _1255);
    float _1261 = rsqrt(_1259);
    float _1263 = sqrt(_1259);
    float _1265 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1267 = _1235 * _1265;
    float _1269 = _1239 * _1265;
    float _1271 = -_1265;
    float _1273 = -_1257;
    float _1275 = fma(_1231, _1271, _1273);
    float _1277 = _1267 * _1267;
    float _1279 = _1269 * _1269;
    float _1281 = _1277 + _1279;
    float _1283 = sqrt(_1281);
    bool _1285 = _1283 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1287 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = _1283 + _1287;
    float _1291 = _589;
    float _1293 = _1231;
    float _1295 = _1289;
    float _1297 = _1267;
    float _1299 = _1269;
    float _1301 = _1277;
    float _1303 = _1275;
    if (_1285)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1291 = _1305;
    }
    float _1307 = _1291;
    if (_1285)
    {
        float _1309 = _1275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1309;
    }
    float _1311 = _1293;
    float _1313 = _1311;
    if (!_1285)
    {
        _831 = _1279;
    }
    float _1315 = _831;
    float _1317 = _1307;
    float _1319 = _1315;
    if (_1285)
    {
        float _1321 = _1289 * _1307;
        _1295 = _1321;
    }
    float _1323 = _1295;
    if (_1285)
    {
        float _1325 = rsqrt(_1281);
        _1317 = _1325;
    }
    float _1327 = _1317;
    float _1329 = _1327;
    if (_1285)
    {
        float _1331 = _1323 * 0.15915493667125701904296875;
        _1159 = _1331;
    }
    float _1333 = _1159;
    float _1335 = _1007;
    if (_1285)
    {
        float _1337 = _1333 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        _1335 = _1339;
    }
    float _1341 = _1335;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1345 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1343);
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    float _1349 = _1323;
    if (_1285)
    {
        float _1351 = _1333 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = -_1347;
    float _1359 = _1357 + 1.0;
    float _1361 = _1341;
    if (_1285)
    {
        float _1363 = fma(_1341, _1311, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1369 = abs(_1359);
    float _1371 = log2(_1369);
    float _1373 = _1365;
    if (_1285)
    {
        float _1375 = _1327 * _1365;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1285)
    {
        float _1379 = _1355 + (-1.0);
        _1313 = _1379;
    }
    float _1381 = _1313;
    if (_1285)
    {
        float _1383 = _1267 * _1377;
        _1297 = _1383;
    }
    float _1385 = _1297;
    if (_1285)
    {
        float _1387 = _1269 * _1377;
        _1299 = _1387;
    }
    float _1389 = _1299;
    if (_1285)
    {
        float _1391 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1391;
    }
    float _1393 = _1329;
    if (_1285)
    {
        float _1395 = _1385 * _1385;
        _1301 = _1395;
    }
    float _1397 = _1301;
    if (_1285)
    {
        float _1399 = _1389 * _1389;
        _1319 = _1399;
    }
    float _1401 = _1319;
    float _1403 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1285)
    {
        float _1405 = fma(_1275, _1355, _1393);
        _1303 = _1405;
    }
    float _1407 = _1303;
    float _1409 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1411 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1413 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1415 = fma(_1407, _1407, _1397);
    float _1417 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1409);
    float _1419 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1367);
    float _1421 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1413);
    float _1423 = _1415 + _1401;
    float _1425 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1417);
    float _1427 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1421);
    float _1431 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1433 = rsqrt(_1423);
    float _1435 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1437 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1253);
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1441 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1445 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1447 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1437);
    float _1449 = floor(_1403);
    float _1451 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1443);
    float _1453 = -_1445;
    float _1455 = fma(_1453, _1441, 1.0);
    float _1457 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1459 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1461 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1451);
    float _1463 = _1433 * _1385;
    float _1465 = _1433 * _1407;
    float _1467 = _1433 * _1389;
    float _1469 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1461);
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1473 = floor(_1411);
    float _1475 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = -_1471;
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1477);
    float _1481 = -_1449;
    float _1483 = _1403 + _1481;
    float _1485 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1487 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1489 = -_1467;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1479);
    float _1493 = log2(_1455);
    float _1495 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1485);
    float _1497 = fma(_1491, -0.5, 0.5);
    float _1499 = fma(_1491, 0.5, 0.5);
    float _1501 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1503 = exp2(_1459);
    float _1505 = -_1473;
    float _1507 = _1411 + _1505;
    float _1509 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1487);
    float _1511 = _1465 + 1.0;
    float _1513 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1501);
    float _1515 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1509);
    float _1517 = 1.0 / _1469;
    float _1519 = fma(_1499, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1521 = fma(_1499, _1519, -0.212114393711090087890625);
    float _1523 = sqrt(_1497);
    float _1525 = -_1465;
    float _1527 = fma(_1503, _1511, _1525);
    float _1529 = _1493 * 0.693147182464599609375;
    float _1531 = fma(_1499, _1521, 1.570728778839111328125);
    float _1533 = fma(_1527, 0.5, 0.5);
    float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = _1513 * _1517;
    float _1539 = _1515 * _1517;
    float2 _5204 = float2(_1483, _1507);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5204, float2(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5204, float2(0.0), isnan(_5204)), level(0.0)).x;
    float _1543 = fma(_1539, -0.5, 0.5);
    float _1545 = _1523 * 0.636619746685028076171875;
    float _1547 = fma(_1537, 0.5, 0.5);
    float _1549 = -_1531;
    float _1551 = fma(_1545, _1549, 1.0);
    float3 _5227 = float3(_1547, _1543, _1535);
    float _1553 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).x;
    float3 _5238 = float3(_1547, _1543, _1535);
    float4 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5238, float3(0.0), isnan(_5238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5238, float3(0.0), isnan(_5238)), level(0.0)).xyzw;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = _1556.w;
    float2 _5254 = float2(_1551, _1533);
    float3 _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5254, float2(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5254, float2(0.0), isnan(_5254)), level(0.0)).xyz;
    float _1570 = _1568.x;
    float _1572 = _1568.y;
    float _1574 = _1568.z;
    float _1576 = float(uint(_603));
    float _1578 = trunc(_767);
    int _1580 = int(_1578);
    int _1582 = ~_603;
    int _1584 = _1582 + 1;
    float _1586 = _631 * _161;
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1590 = _1588 != 0;
    float _1592 = -_749;
    float _1594 = _1592 + 1.0;
    bool _1596 = _607 > 0.5;
    float _1598 = -_959;
    float _1600 = _709 + _1598;
    bool _1602 = _609 > 0.5;
    float _1604 = 1.0 / _1576;
    out.m_72.w = _941;
    int _1606 = abs(_753);
    float _1608 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1612 = _1610 != 0;
    out.m_74.x = _1243;
    out.m_74.y = _1600;
    out.m_74.z = _1251;
    float _1614 = trunc(_1586);
    int _1616 = int(_1614);
    float _1618 = float(uint(_1580));
    float _1620 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1622 = !_1612;
    float _1624 = _1622 ? 7.345489978790283203125 : 1.0;
    out.m_76.x = _1037;
    float _1626 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1608);
    float _1628 = -_1061;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1620);
    int _1632 = as_type<int>(_1604) + (-2);
    float _1634 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    out.m_78.x = _1223;
    out.m_78.y = _1219;
    out.m_78.z = _1227;
    float _1636 = as_type<float>(_1632) * _1618;
    float _1638 = trunc(_1636);
    float _1640 = precise::max(_1638, 0.0);
    uint _1643 = uint(_1640);
    int _1645 = ~_603;
    int _1647 = _1645 + 1;
    int _1649 = _1584 * int(_1643);
    int _1651 = _1649 + _1580;
    float _1653 = float(uint(_1651));
    float _1655 = as_type<float>(_1632) * _1653;
    float _1657 = trunc(_1655);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    float _1663 = _1624 * _607;
    float _1665 = floor(_1663);
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1671 = int(_1643) + int(_1661);
    float _1673 = float(_1580);
    float _1675 = 1.0 / _1669;
    int _1677 = _1647 * _1671;
    int _1679 = _1677 + _1580;
    bool _1681 = _1673 >= _627;
    bool _1683 = isnan(_1673);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan(_627);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    bool _1693 = uint(_1679) >= uint(_603);
    float _1695 = -_1665;
    float _1697 = _1663 + _1695;
    float _1699 = trunc(_1691);
    int _1701 = int(_1699);
    bool _1703 = !_1693;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = _1697 * _627;
    int _1709 = ~_1671;
    int _1711 = _1709 + _1705;
    int _1713 = _1711 + 1;
    float _1715 = trunc(_1707);
    int _1717 = int(_1715);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1721 = _1719 != 0;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1727 = _603 * _1713;
    int _1729 = _1727 + _1580;
    bool _1731 = !_1721;
    int _1733 = _1731 ? 0 : 1;
    bool _1735 = _603 == 0;
    float _1737 = 1.0 / _1725;
    int _1739 = ~_1701;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    bool _1745 = !_1735;
    int _1747 = _1745 ? _1729 : (-1);
    int _1749 = abs(_1733);
    int _1751 = _1747 * _1743;
    int _1753 = _603 + (-1);
    int _1755 = _1717 * _1749;
    int _1757 = _1755 + _1580;
    bool _1759 = !_1590;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1767 = abs(_735);
    int _1769 = _1701 * _1753;
    int _1771 = _1769 + _1751;
    int _1773 = abs(_801);
    float _1775 = 1.0 / _1765;
    int _1777 = abs(_1761);
    int _1779 = _1771 * _1606;
    int _1781 = _1616 * _1767;
    int _1783 = _1781 + _1779;
    int _1785 = _1757 * _1773;
    int _1787 = _1785 + _1783;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1795 = _1793 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1797;
    int _1801 = _1717 * _1777;
    int _1803 = _1801 + _1787;
    float _1805 = _1791 * _1675;
    float _1807 = _1795 * _1737;
    float _1809 = _1799 * _1775;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1813 = _567 + _1811;
    float _1815 = float(uint(_1803));
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1819 = _567 + _1817;
    bool _1821 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1823 = isnan(_567);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = fma(_1809, _1813, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1835 = ~_603;
    int _1837 = _1835 + 1;
    float _1839 = as_type<float>(_1632) * _1815;
    bool _1841 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1843 = isnan(_567);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = -_1831;
    float _1855 = _1853 + 1.0;
    bool _1857 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1859 = isnan(_567);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1865 = _1861 || _1863;
    float _1867 = float(_1865);
    float _1869 = fma(_1805, _1819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1873 = _567 + _1871;
    float _1875 = trunc(_1839);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = -_1851;
    float _1883 = _1881 + 1.0;
    float _1885 = _1851 * _1855;
    bool _1887 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1889 = isnan(_567);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = fma(_1807, _1873, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1901 = _1867 * _1883;
    float _1903 = -_1867;
    float _1905 = _1903 + 1.0;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1909 = _1907 != 0;
    float _1911 = -_187;
    int _1913 = _1596 ? as_type<int>(_1911) : as_type<int>(_187);
    float _1915 = _1897 * _1905;
    float _1917 = float(uint(_1757));
    bool _1919 = !_1909;
    float _1921 = _1919 ? _187 : as_type<float>(_1913);
    float _1923 = _1869 * _1915;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1927 = _1925 != 0;
    int _1929 = _1837 * int(_1879);
    int _1931 = _1929 + _1803;
    float _1933 = as_type<float>(_1632) * _1917;
    float _1935 = -_191;
    int _1937 = _1602 ? as_type<int>(_1935) : as_type<int>(_191);
    float _1939 = _1921 + 0.5;
    float _1941 = float(uint(_1931));
    bool _1943 = !_1927;
    float _1945 = _1943 ? _191 : as_type<float>(_1937);
    float _1947 = -_1897;
    float _1949 = _1947 + 1.0;
    float _1951 = trunc(_1933);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    float _1957 = as_type<float>(_1632) * _1941;
    float _1959 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[80].x, _805);
    float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1923);
    float _1963 = _1945 + (-0.5);
    int _1965 = ~_603;
    int _1967 = _1965 + 1;
    float _1969 = fma(_1899, _1901, _1961);
    float _1971 = trunc(_1957);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    float _1977 = -_1963;
    float _1979 = -_809;
    float _1981 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1979);
    float _1983 = -_797;
    float _1985 = _1983 + 1.0;
    float _1987 = fma(_1833, _1885, _1969);
    int _1989 = ~_603;
    int _1991 = _1989 + 1;
    float _1993 = fma(_1945, _1594, _1981);
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1997 = _1995 != 0;
    float _1999 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2001 = _1967 * int(_1955);
    int _2003 = _2001 + _1757;
    float _2005 = -_1985;
    float _2007 = fma(_1921, _2005, _1959);
    float _2009 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1999);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2013 = float(uint(_2003));
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2017 = int(_1879) + int(_1975);
    float _2019 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1987);
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2023 = as_type<float>(_1632) * _2013;
    out.m_80.x = _2007;
    out.m_80.y = _1993;
    int _2025 = _1991 * _2017;
    int _2027 = _2025 + _1803;
    float _2029 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2009);
    float _2031 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2033 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2035 = trunc(_2023);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    bool _2041 = uint(_2027) >= uint(_603);
    float _2043 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2033);
    bool _2045 = !_2041;
    int _2047 = _2045 ? 0 : (-1);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2053 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2055 = ~_2017;
    int _2057 = _2055 + _2047;
    int _2059 = _2057 + 1;
    float _2061 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2043);
    int _2065 = ~_603;
    int _2067 = _2065 + 1;
    out.m_82.x = _2049;
    out.m_82.y = _2051;
    out.m_82.z = _2053;
    out.m_82.w = _2031;
    int _2069 = _603 * _2059;
    int _2071 = _2069 + _1803;
    float _2073 = 1.0 / _2061;
    float _2075 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2077 = int(_1955) + int(_2039);
    float _2079 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2081 = _2075 + _2061;
    float _2083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2085 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2087 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2089 = -_1061;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2083);
    bool _2093 = !_1735;
    int _2095 = _2093 ? _2071 : (-1);
    float _2097 = _2081 * _2073;
    float _2099 = _2097 * 0.5;
    int _2101 = _2067 * _2077;
    int _2103 = _2101 + _1757;
    float _2105 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2091);
    int _2107 = _2095 >> 31;
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    float _2113 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2085);
    bool _2115 = uint(_2103) >= uint(_603);
    float _2117 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1630);
    int _2119 = _2107 & 3;
    float _2121 = 1.0 / _2111;
    float _2123 = -_1061;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2087);
    float _2127 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2129 = _2095 + _2119;
    float _2131 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2133 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2135 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2125);
    int _2137 = _2129 >> 2;
    float _2139 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2131);
    float _2141 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2133);
    float _2143 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2145 = _2137 << 4;
    int _2147 = _2145 + 368;
    float _2149 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2151 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2127);
    float _2153 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2143);
    uint _2155 = uint(int(uint(_2147) >> uint(2)));
    uint _2157 = uint(int(uint(int(_2155)) >> uint(2)));
    int _2159 = int(_2155) & 3;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[int(_2157)][_2159];
    int _2163 = int(_2155) + 1;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    int _2167 = _2163 & 3;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[int(_2165)][_2167];
    float _2171 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2079);
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2175 = _2121 * _2173;
    float _2177 = _2149 * _2105;
    float _2179 = _2149 * _2117;
    float _2181 = _2149 * _2135;
    int _2183 = _2095 & 3;
    bool _2185 = _2183 != 0;
    float _2187 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2139);
    int _2189 = _2095 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2113);
    int _2195 = _2147 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    uint _2199 = uint(int(uint(int(_2197)) >> uint(2)));
    int _2201 = int(_2197) & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    int _2205 = int(_2197) + 1;
    uint _2207 = uint(int(uint(_2205) >> uint(2)));
    int _2209 = _2205 & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    bool _2213 = uint(_2183) > 1u;
    float _2215 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2141);
    float _2217 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2219 = _2191 ? 0 : 1;
    float _2221 = abs(_2175);
    float _2223 = log2(_2221);
    float _2225 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2153);
    float _2227 = fma(_2217, _2187, _2177);
    int _2229 = ~_2219;
    int _2231 = _2229 + 1;
    int _2233 = _2231 + 1;
    float _2235 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2151);
    float _2237 = fma(_2217, _2193, _2179);
    bool _2239 = !_2115;
    int _2241 = _2239 ? 0 : (-1);
    float _2243 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2171);
    float _2245 = -_1541;
    float _2247 = _2245 + 1.0;
    int _2249 = _2233;
    float _2251 = _2211;
    float _2253 = _1626;
    float _2255 = _2225;
    float _2257 = _2175;
    if (!_2213)
    {
        int _2259 = ~_2219;
        int _2261 = _2259 + 1;
        _2249 = _2261;
    }
    int _2263 = _2249;
    float _2265 = in.m_84.x;
    bool _2267 = _2183 != 3;
    float _2269 = fma(_2217, _2215, _2181);
    bool _2271 = !_2185;
    int _2273 = _2271 ? 0 : 1;
    int _2275 = abs(_2263);
    float _2277 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2279 = uint(_2183) >= 2u;
    float _2281 = _2243 + _2269;
    int _2283 = abs(_2273);
    float _2285 = exp2(_2277);
    int _2287 = _2279 ? 0 : 1;
    int _2289 = ~_2275;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_2287;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    bool _2301 = _2183 != 3;
    int _2303 = _2299;
    if (_2267)
    {
        int _2305 = ~_2287;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    int _2311 = ~_2283;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2293 * as_type<int>(_2169);
    bool _2319 = !_2301;
    int _2321 = _2319 ? 0 : (-1);
    int _2323 = abs(_2309);
    int _2325 = _2315 * as_type<int>(_2161);
    int _2327 = _2325 + _2317;
    int _2329 = abs(_2321);
    bool _2331 = !_1997;
    int _2333 = _2331 ? 0 : 1;
    int _2335 = ~_2077;
    int _2337 = _2335 + _2241;
    int _2339 = _2337 + 1;
    bool _2341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2349 = _2345 || _2347;
    int _2351 = ~_2323;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = _603 * _2339;
    int _2359 = _2357 + _1757;
    int _2361 = abs(_2333);
    int _2363 = _2355 * as_type<int>(_2203);
    int _2365 = _2363 + _2327;
    int _2367 = ~_2329;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    float _2373 = fma(_2285, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    int _2377 = _2371 * as_type<int>(_2211);
    int _2379 = _2377 + _2365;
    float _2381 = as_type<float>(_2361);
    if (!_2349)
    {
        _2251 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2383 = _2251;
    float _2385 = fma(_2375, -2.0, 3.0);
    float _2387 = _2375 * _2375;
    int _2389 = ~_2361;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    float _2395 = _2383;
    if (!_2349)
    {
        float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2399 = _2175 + _2397;
        _2253 = _2399;
    }
    float _2401 = _2253;
    if (!_2349)
    {
        float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2405 = _2383 + _2403;
        _2395 = _2405;
    }
    float _2407 = _2395;
    float _2409 = _2387 * _2385;
    bool _2411 = !_1735;
    int _2413 = _2411 ? _2359 : (-1);
    int _2415 = _2379 * _2393;
    float _2417 = _1439;
    if (!_2349)
    {
        float _2419 = 1.0 / _2407;
        _2417 = _2419;
    }
    float _2421 = _2417;
    float _2423 = -_2409;
    float _2425 = _2423 + 1.0;
    bool _2427 = _2175 <= 8000.0;
    bool _2429 = isnan(_2175);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(8000.0);
    bool _2435 = _2431 || _2433;
    float _2437 = float(_2435);
    int _2439 = _2413 * _2361;
    int _2441 = _2439 + _2415;
    float _2443 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1634);
    float _2445 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2409);
    float _2447 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2449 = _2443;
    if (_2349)
    {
        _2381 = 1.0;
    }
    float _2451 = _2381;
    float _2453 = _2443 + _1469;
    float _2455 = _2437 * _2445;
    float _2457 = float(_2441);
    float _2459 = _2225 + _2237;
    float _2461 = _1513 + _1469;
    float _2463 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2465 = exp2(_2447);
    float _2467 = _1469 * 0.5;
    float _2469 = _2451;
    if (!_2349)
    {
        float _2471 = _2401 * _2421;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        _2469 = _2473;
    }
    float _2475 = _2469;
    if (!_2349)
    {
        _2255 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2477 = _2255;
    float _2479 = _2247 * _2463;
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = _2453 * 0.5;
    float _2485 = _2461 * 0.5;
    float _2487 = fma(_1515, -0.5, _2467);
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _2443;
    out.gl_Position.w = _1469;
    float _2489 = -_2481;
    float _2491 = fma(_2489, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2493 = _2235 + _2227;
    float _2495 = _1469;
    float _2497 = _2487;
    if (!_2349)
    {
        float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2501 = _2175 + _2499;
        _2257 = _2501;
    }
    float _2503 = _2257;
    out.m_86.x = _2485;
    out.m_86.y = _2487;
    out.m_86.z = _2483;
    out.m_86.w = _1469;
    float _2505 = _2491 * _2265;
    float _2507 = -_2465;
    float _2509 = _2507 + 1.0;
    bool _2511 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2513 = isnan(_1263);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2519 = _2515 || _2517;
    out.m_88.x = _2457;
    float _2521 = _2505 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2523 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_90.x = _2493;
    out.m_90.y = _2459;
    out.m_90.z = _2281;
    float _2525 = _2503;
    if (!_2349)
    {
        float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2529 = _2477 + _2527;
        _2449 = _2529;
    }
    float _2531 = _2449;
    float _2533 = _2523 * _1553;
    out.m_92.x = _2521;
    float _2535 = -_2523;
    float _2537 = _2535 + 1.0;
    float _2539 = _2485;
    float _2541 = _2533;
    if (!_2349)
    {
        float _2543 = 1.0 / _2531;
        _2539 = _2543;
    }
    float _2545 = _2539;
    float _2547 = _1564 * _2533;
    float _2549 = _1574 * _2533;
    if (_2349)
    {
        _2541 = 1.0;
    }
    float _2551 = _2541;
    float _2553 = _1564 * _2537;
    float _2555 = fma(_1570, _2547, _1558);
    float _2557 = fma(_1572, _2547, _1560);
    float _2559 = _2551;
    float _2561 = _2557;
    float _2563 = _2555;
    if (!_2519)
    {
        _2495 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2565 = _2495;
    float _2567 = fma(_1564, _2549, _1562);
    float _2569 = _2567;
    float _2571 = _2565;
    float _2573 = _2565;
    if (!_2519)
    {
        _2497 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2497;
    out.m_94.x = _2555;
    out.m_94.y = _2557;
    out.m_94.z = _2567;
    out.m_94.w = _2553;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2349)
    {
        float _2581 = _2503 * _2545;
        float _2583 = precise::clamp(_2581, 0.0, 1.0);
        _2525 = _2583;
    }
    float _2585 = _2525;
    if (!_2349)
    {
        float _2587 = -_2585;
        float _2589 = _2587 + 1.0;
        _2559 = _2589;
    }
    float _2591 = _2559;
    float _2593 = _2475 * _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2597 = _2593;
    if (!_2519)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2599 = _2597;
    float _2601 = _2599;
    float _2603 = _2599;
    if (!_2519)
    {
        _2569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2605 = _2569;
    float _2607 = _2605;
    float _2609 = _2605;
    if (!_2519)
    {
        _2561 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2611 = _2561;
    float _2613 = _2611;
    float _2615 = _2611;
    if (!_2519)
    {
        _2563 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2617 = _2563;
    bool _2619 = !_2519;
    float _2621 = _2617;
    float _2623 = _2617;
    if (!_2619)
    {
        bool _2625 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2627 = isnan(_1263);
        bool _2629 = _2625 || _2627;
        bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2633 = _2629 || _2631;
        if (!_2633)
        {
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2637 = _1263 + _2635;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2639;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2647 = 1.0 / _2641;
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2665 = _2637 * _2647;
            float _2667 = precise::clamp(_2665, 0.0, 1.0);
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2673 = fma(_2667, _2645, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2675 = fma(_2667, _2671, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2677 = fma(_2667, _2651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2679 = fma(_2667, _2655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2681 = fma(_2667, _2659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2683 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2603 = _2677;
            _2615 = _2681;
            _2573 = _2673;
            _2609 = _2679;
            _2579 = _2675;
            _2623 = _2683;
            _2685 = true;
        }
        else
        {
            bool _2687 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2689 = isnan(_1263);
            bool _2691 = _2687 || _2689;
            bool _2693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2695 = _2691 || _2693;
            if (!_2695)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2697 = _2571;
            _2573 = _2697;
            if (!_2695)
            {
                _2601 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2699 = _2601;
            _2603 = _2699;
            if (!_2695)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2701 = _2577;
            _2579 = _2701;
            if (!_2695)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2703 = _2607;
            _2609 = _2703;
            if (!_2695)
            {
                _2613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2705 = _2613;
            _2615 = _2705;
            if (!_2695)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2707 = _2621;
            bool _2709 = !_2695;
            _2623 = _2707;
            if (!_2709)
            {
                bool _2711 = _1263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2713 = isnan(_1263);
                bool _2715 = _2711 || _2713;
                bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2719 = _2715 || _2717;
                if (!_2719)
                {
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2723 = _1263 + _2721;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2725;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2733 = 1.0 / _2727;
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2751 = _2723 * _2733;
                    float _2753 = precise::clamp(_2751, 0.0, 1.0);
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2759 = fma(_2753, _2731, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2761 = fma(_2753, _2757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2763 = fma(_2753, _2737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2765 = fma(_2753, _2741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2767 = fma(_2753, _2745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2769 = fma(_2753, _2749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2603 = _2763;
                    _2615 = _2767;
                    _2573 = _2759;
                    _2609 = _2765;
                    _2579 = _2761;
                    _2623 = _2769;
                    _2685 = true;
                }
                else
                {
                    _2603 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2685 = false;
    float _2771 = _2603;
    float _2773 = _2615;
    float _2775 = _2573;
    float _2777 = _2609;
    float _2779 = _2579;
    float _2781 = _2623;
    float _2783 = fma(_2459, -0.5, 0.5);
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = -_2771;
    float _2789 = _2787 + _2773;
    float _2791 = _2595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2793 = -_2775;
    float _2795 = _2793 + _2777;
    float _2797 = fma(_2785, _2789, _2771);
    out.m_96.x = 0.0;
    float _2799 = -_2779;
    float _2801 = _2799 + _2781;
    float _2803 = fma(_2785, _2795, _2775);
    float _2805 = _2797 * 0.586610972881317138671875;
    out.m_53.x = _2791;
    bool _2807 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2809 = fma(_2785, _2801, _2779);
    float _2811 = fma(_2803, 0.298911988735198974609375, _2805);
    bool _2813 = _2475 > 0.0;
    bool _2815 = isnan(_2475);
    bool _2817 = _2813 || _2815;
    bool _2819 = isnan(0.0);
    bool _2821 = _2817 || _2819;
    float _2823 = fma(_2809, 0.114477999508380889892578125, _2811);
    bool _2825 = _2591 <= 0.0;
    bool _2827 = !_2821;
    bool _2829 = _2825 || _2827;
    float _2831 = -_2823;
    float _2833 = _2803 + _2831;
    float _2835 = -_2823;
    float _2837 = _2797 + _2835;
    float _2839 = -_2823;
    float _2841 = _2809 + _2839;
    float _2843 = fma(_2833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    float _2845 = fma(_2837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    float _2847 = fma(_2841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2823);
    bool _2849 = !_2807;
    if (!_2849)
    {
        float _2851 = -_1219;
        float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2855 = -_1223;
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2859 = -_1227;
        float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2863 = _2853 * _2853;
        float _2865 = fma(_2857, _2857, _2863);
        float _2867 = fma(_2861, _2861, _2865);
        float _2869 = sqrt(_2867);
        float _2871 = rsqrt(_2867);
        float _2873 = -_2869;
        float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2877 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2879 = precise::clamp(_2877, 0.0, 1.0);
        float _2881 = _2857 * _2871;
        float _2883 = _2853 * _2871;
        float _2885 = abs(_2879);
        float _2887 = log2(_2885);
        float _2889 = _2861 * _2871;
        float _2891 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2893 = _2459 * _2883;
        float _2895 = -_2883;
        float _2897 = -_2891;
        float _2899 = fma(_2895, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2897);
        float _2901 = fma(_2493, _2881, _2893);
        float _2903 = -_2889;
        float _2905 = fma(_2903, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2899);
        float _2907 = fma(_2281, _2889, _2901);
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2913 = _2905 + _2911;
        float _2915 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2917 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        float _2921 = exp2(_2915);
        float _2923 = _2921 * _2919;
        float _2925 = _2909 * _2923;
        float _2927 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2929 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2931 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2927;
        out.m_96.y = _2929;
        out.m_96.z = _2931;
    }
    out.m_72.x = _2843;
    out.m_72.y = _2845;
    out.m_72.z = _2847;
    if (!_2829)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2933 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2933;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

