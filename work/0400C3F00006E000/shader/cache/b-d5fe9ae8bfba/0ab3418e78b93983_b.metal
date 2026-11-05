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
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_98 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4933 = false;
    bool _677 = false;
    bool _495 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5243 = as_type<float>(_145);
        out.gl_Position.z = _5243;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5306 = as_type<float>(_177);
        out.gl_Position.z = _5306;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_211;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _183 * _189;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _219);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    bool _229 = !_207;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_181, _199, _225);
    float _235 = fma(_185, _191, _223);
    float _237 = fma(_185, _197, _227);
    float _239 = fma(_185, _203, _233);
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = 1.0 / _279;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _297 = 1.0 / _287;
    float _299 = 1.0 / _283;
    float _301 = _271 * _293;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _263 + _303;
    float _307 = 1.0 / _291;
    float _309 = _267 * _297;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_321;
    float _325 = _323 + 1.0;
    float _327 = _275 * _299;
    bool _329 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_263);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_263);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _339 * _325;
    bool _355 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_263);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _305 * _307;
    float _369 = -_339;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    bool _381 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_263);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = _351 * _371;
    float _395 = -_351;
    float _397 = _395 + 1.0;
    float _399 = fma(_375, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_379, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = _365 * _397;
    float _409 = -_365;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = -_391;
    float _419 = _417 + 1.0;
    float _421 = fma(_405, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = _391 * _411;
    float _425 = fma(_415, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    float _435 = _399 * _423;
    float _437 = _401 * _423;
    float _439 = fma(_429, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_433, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _435);
    float _445 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _437);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _455 = fma(_421, _407, _443);
    float _457 = fma(_425, _407, _445);
    float _459 = fma(_449, _367, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _461 = fma(_453, _367, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _463 = fma(_439, _393, _455);
    float _465 = fma(_441, _393, _457);
    float _467 = fma(_459, _353, _463);
    float _469 = fma(_461, _353, _465);
    float _471 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[147].x, _467);
    float _473 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[147].y, _469);
    bool _475 = !_295;
    float _493;
    if (!_475)
    {
        float _477 = in.m_66.x;
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _481 = _477 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        _493 = _171;
    }
    _495 = false;
    float _497 = _493;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _497 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _511 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_497);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _527 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _529 = isnan(_497);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = 1.0 / _505;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _541;
    float _545 = -_521;
    float _547 = _545 + 1.0;
    bool _549 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _551 = isnan(_497);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _563 = 1.0 / _509;
    float _565 = 1.0 / _525;
    float _567 = _543 * _539;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = _537 * _547;
    float _575 = -_537;
    float _577 = _575 + 1.0;
    float _579 = fma(_567, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _581;
    float _585 = _559 * _577;
    float _587 = _571 * _563;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _591 = _497 + _589;
    bool _593 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = isnan(_497);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _579 * _585;
    float _607 = -_559;
    float _609 = _607 + 1.0;
    float _611 = fma(_587, _591, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _615 = _497 + _613;
    float _617 = _583 * _565;
    float _619 = -_603;
    float _621 = _619 + 1.0;
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _605);
    float _625 = fma(_617, _615, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _627 = _521 * _621;
    float _629 = fma(_611, _573, _623);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _633 = fma(_625, _627, _629);
    float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[118].x, _633);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _641 = in.m_68.x;
    float _643 = in.m_68.y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _635;
    out.m_70.y = _649;
    out.m_70.z = _651;
    out.m_70.w = _647;
    float _653 = _473 * _643;
    float _655 = _471 * _641;
    bool _657 = !_561;
    float _675;
    if (!_657)
    {
        float _659 = in.m_66.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _171;
    }
    _677 = false;
    float _679 = _675;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _683 = _679 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _689 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _691 = isnan(_679);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _707 = isnan(_679);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _717;
    bool _721 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _723 = isnan(_679);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = 1.0 / _687;
    float _735 = -_699;
    float _737 = _735 + 1.0;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _741 = 1.0 / _703;
    float _743 = _719 * _733;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _749 = -_731;
    float _751 = _749 + 1.0;
    float _753 = fma(_743, _683, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _755 = _715 * _737;
    float _757 = -_715;
    float _759 = _757 + 1.0;
    float _761 = _699 * _751;
    float _763 = _747 * _741;
    float _765 = _753 * _755;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _769 = _679 + _767;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[131].x, _765);
    float _773 = fma(_763, _769, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _777 = fma(_773, _761, _771);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _785 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[133].x, _777);
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _785 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _781;
    out.m_72.y = _787;
    out.m_72.z = _789;
    out.m_72.w = _791;
    bool _793 = !_739;
    float _795 = _789;
    float _797 = _791;
    if (!_793)
    {
        float _799 = in.m_66.x;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _803 = _799 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _173 = _813;
    }
    float _815 = _173;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _819 = int(_817);
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _823 = _821 != 0;
    float _825 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _827 = int(_825);
    float _829 = float(_819);
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _833 = int(_831);
    if (_823)
    {
        _795 = 1.0;
    }
    float _835 = _795;
    float _837 = _835;
    if (_823)
    {
        _797 = 1.0;
    }
    float _839 = _797;
    int _841 = 0;
    float _843 = _839;
    if (_823)
    {
        _841 = 0;
    }
    int _845 = _841;
    float _847 = float(_827);
    float _849 = 1.0 / _829;
    float _851 = 1.0 / _847;
    float _853 = float(uint(_833));
    int _855 = ~_833;
    int _857 = _855 + 1;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _861 = int(_859);
    float _863 = _849 * _127;
    float _865 = _849;
    float _867 = _847;
    int _869 = _845;
    if (_823)
    {
        float _871 = in.m_66.x;
        float _873 = in.m_66.y;
        _865 = _871;
        _867 = _873;
    }
    float _875 = _865;
    float _877 = _867;
    float _879 = _851 * _127;
    float _881 = 1.0 / _853;
    float _883 = float(uint(_861));
    float _885 = trunc(_863);
    int _887 = int(_885);
    float _889 = 1.0 / _883;
    int _891 = as_type<int>(_881) + (-2);
    float _893 = 0.0;
    float _895 = _875;
    float _897 = _877;
    if (_823)
    {
        _893 = _877;
    }
    float _899 = _893;
    float _901 = trunc(_879);
    int _903 = int(_901);
    float _905 = float(uint(_887));
    float _907 = as_type<float>(_891) * _905;
    float _909 = _905;
    float _911 = _899;
    if (_823)
    {
        _909 = _875;
    }
    float _913 = _909;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _917 = int(_915);
    int _919 = as_type<int>(_889) + (-2);
    float _921 = 0.0;
    float _923 = _913;
    if (_823)
    {
        _921 = _913;
    }
    float _925 = _921;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _929 = int(_927);
    float _931 = float(uint(_903));
    float _933 = as_type<float>(_919) * _931;
    int _935 = as_type<int>(_931);
    float _937 = _925;
    if (_823)
    {
        _935 = 0;
    }
    int _939 = _935;
    float _941 = trunc(_907);
    float _943 = precise::max(_941, 0.0);
    uint _946 = uint(_943);
    float _948 = float(uint(_917));
    float _950 = 1.0 / _948;
    float _952 = float(_929);
    float _954 = trunc(_933);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = 1.0 / _952;
    float _962 = _952;
    int _964 = _939;
    if (_823)
    {
        _962 = _913;
    }
    float _966 = _962;
    float _968 = _966;
    if (!_823)
    {
        float _970 = in.m_66.x;
        float _972 = in.m_66.y;
        float _974 = in.m_66.z;
        float _976 = _970 * 3.1415927410125732421875;
        float _978 = _976 * 0.15915493667125701904296875;
        float _980 = _972 * 3.1415927410125732421875;
        float _982 = _980 * 0.15915493667125701904296875;
        float _984 = _978 * 6.283185482025146484375;
        float _986 = sin(_984);
        float _988 = _982 * 6.283185482025146484375;
        float _990 = sin(_988);
        _837 = 7.345489978790283203125;
        _895 = _970;
        _843 = 5.839270114898681640625;
        _968 = _974;
        _923 = _972;
        _897 = _972;
        _964 = 1;
        _937 = _986;
        _911 = _990;
        _869 = 2;
    }
    float _992 = _837;
    float _994 = _895;
    float _996 = _843;
    float _998 = _968;
    float _1000 = _923;
    float _1002 = _897;
    int _1004 = _964;
    float _1006 = _937;
    float _1008 = _911;
    int _1010 = _869;
    int _1012 = _857 * int(_946);
    int _1014 = _1012 + _887;
    float _1016 = in.m_66.z;
    float _1018 = in.m_66.w;
    int _1020 = ~_861;
    int _1022 = _1020 + 1;
    float _1024 = _992 * _994;
    float _1026 = _996 * _998;
    float _1028 = float(uint(_1014));
    float _1030 = _992 * _1000;
    int _1032 = _1022 * int(_958);
    int _1034 = _1032 + _903;
    float _1036 = floor(_1024);
    int _1038 = as_type<int>(_950) + (-2);
    float _1040 = as_type<float>(_891) * _1028;
    float _1042 = _960 * _127;
    float _1044 = float(uint(_1034));
    float _1046 = in.m_60.w;
    float _1048 = float(_833);
    float _1050 = floor(_1026);
    float _1052 = as_type<float>(_919) * _1044;
    float _1054 = float(_887);
    bool _1056 = _1002 > 0.5;
    bool _1058 = _1054 >= _1048;
    bool _1060 = isnan(_1054);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(_1048);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = trunc(_1042);
    int _1072 = int(_1070);
    bool _1074 = _1018 > 0.5;
    float _1076 = -_1036;
    float _1078 = _1024 + _1076;
    bool _1080 = _1016 > 0.5;
    float _1082 = _1078 * _1048;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1086 = _1084 != 0;
    float _1088 = trunc(_1052);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = -_1050;
    float _1096 = _1026 + _1094;
    int _1098 = ~_861;
    int _1100 = _1098 + 1;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1112 = _1110 != 0;
    float _1114 = -_217;
    int _1116 = _1080 ? as_type<int>(_1114) : as_type<int>(_217);
    float _1118 = trunc(_1040);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = float(uint(_1072));
    int _1126 = int(_1074);
    int _1128 = _1080 ? 2 : 0;
    int _1130 = _1126 | _1128;
    int _1132 = _1086 ? 4 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1104 ? 8 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1108 ? 16 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1112 ? 32 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = _1056 ? 64 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = _1150 & 64;
    float _1154 = as_type<float>(_1038) * _1124;
    float _1156 = -_231;
    int _1158 = _1056 ? as_type<int>(_1156) : as_type<int>(_231);
    float _1160 = trunc(_1068);
    int _1162 = int(_1160);
    int _1164 = int(_958) + int(_1092);
    bool _1166 = !_1112;
    float _1168 = _1166 ? _217 : as_type<float>(_1116);
    float _1170 = float(_861);
    bool _1172 = !_1086;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = trunc(_1154);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = !_1108;
    float _1184 = _1182 ? _231 : as_type<float>(_1158);
    int _1186 = int(_946) + int(_1122);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1198 = _1196 != 0;
    int _1200 = _1100 * _1164;
    int _1202 = _1200 + _903;
    int _1204 = ~_833;
    int _1206 = _1204 + 1;
    float _1208 = floor(_1030);
    float _1210 = float(_903);
    bool _1212 = !_1194;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = _1206 * _1186;
    int _1218 = _1216 + _887;
    bool _1220 = uint(_1202) >= uint(_861);
    float _1222 = _1096 * _1170;
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1230 = log2(_1228);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    bool _1236 = uint(_1218) >= uint(_833);
    bool _1238 = _1210 >= _1170;
    bool _1240 = isnan(_1210);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(_1170);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    bool _1250 = !_1198;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1222);
    int _1256 = int(_1254);
    bool _1258 = !_1234;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = -_1208;
    float _1264 = _1030 + _1262;
    bool _1266 = !_1220;
    int _1268 = _1266 ? 0 : (-1);
    bool _1270 = !_1236;
    int _1272 = _1270 ? 0 : (-1);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1284 = _1282 != 0;
    float _1286 = trunc(_1082);
    int _1288 = int(_1286);
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1292 = _1290 != 0;
    int _1294 = ~_917;
    int _1296 = _1294 + 1;
    int _1298 = ~_1164;
    int _1300 = _1298 + _1268;
    int _1302 = _1300 + 1;
    int _1304 = ~_1186;
    int _1306 = _1304 + _1272;
    int _1308 = _1306 + 1;
    float _1310 = trunc(_1248);
    int _1312 = int(_1310);
    int _1314 = abs(_1174);
    int _1316 = _1296 * int(_1180);
    int _1318 = _1316 + _1072;
    bool _1320 = !_1292;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _861 * _1302;
    int _1326 = _1324 + _903;
    bool _1328 = _833 == 0;
    int _1330 = abs(_1322);
    int _1332 = _1288 * _1314;
    int _1334 = _1332 + _887;
    float _1336 = float(uint(_1318));
    int _1338 = _833 * _1308;
    int _1340 = _1338 + _887;
    bool _1342 = !_1280;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _1256 * _1330;
    int _1348 = _1346 + _903;
    float _1350 = _167 * _127;
    bool _1352 = !_1276;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = _1152 != 0;
    float _1358 = _1048 * _1350;
    bool _1360 = _861 == 0;
    float _1362 = as_type<float>(_1038) * _1336;
    int _1364 = ~_1162;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = _1170 * _1350;
    bool _1372 = !_1328;
    int _1374 = _1372 ? _1340 : (-1);
    float _1376 = trunc(_1358);
    int _1378 = int(_1376);
    int _1380 = ~_1312;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    bool _1386 = !_1360;
    int _1388 = _1386 ? _1326 : (-1);
    int _1390 = _1374 * _1368;
    int _1392 = _833 + (-1);
    int _1394 = _861 + (-1);
    float _1396 = trunc(_1362);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    int _1402 = _1388 * _1384;
    int _1404 = abs(_1344);
    int _1406 = _1162 * _1392;
    int _1408 = _1406 + _1390;
    int _1410 = abs(_1214);
    int _1412 = _1312 * _1394;
    int _1414 = _1412 + _1402;
    int _1416 = abs(_1226);
    int _1418 = _1408 * _1410;
    float _1420 = trunc(_1370);
    int _1422 = int(_1420);
    int _1424 = ~_917;
    int _1426 = _1424 + 1;
    int _1428 = _1414 * _1404;
    int _1430 = abs(_1252);
    int _1432 = _1378 * _1416;
    int _1434 = _1432 + _1418;
    int _1436 = abs(_1260);
    int _1438 = int(_1180) + int(_1400);
    int _1440 = _1334 * _1430;
    int _1442 = _1440 + _1434;
    int _1444 = abs(_1354);
    int _1446 = _1426 * _1438;
    int _1448 = _1446 + _1072;
    float _1450 = -_217;
    int _1452 = _1074 ? as_type<int>(_1450) : as_type<int>(_217);
    int _1454 = _1288 * _1436;
    int _1456 = _1454 + _1442;
    bool _1458 = !_1284;
    int _1460 = _1458 ? 0 : 1;
    int _1462 = _1422 * _1444;
    int _1464 = _1462 + _1428;
    bool _1466 = uint(_1448) >= uint(_917);
    float _1468 = float(uint(_1456));
    float _1470 = float(_917);
    float _1472 = -_231;
    int _1474 = _1080 ? as_type<int>(_1472) : as_type<int>(_231);
    float _1476 = float(_1072);
    float _1478 = _1470 * _1350;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1482 = _1480 != 0;
    float _1484 = _1264 * _1470;
    int _1486 = abs(_1460);
    float _1488 = as_type<float>(_891) * _1468;
    bool _1490 = _1476 >= _1470;
    bool _1492 = isnan(_1476);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(_1470);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = trunc(_1478);
    int _1504 = int(_1502);
    bool _1506 = !_1482;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = _1348 * _1486;
    int _1512 = _1510 + _1464;
    bool _1514 = !_1104;
    float _1516 = _1514 ? _217 : as_type<float>(_1452);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1520 = _1518 != 0;
    int _1522 = abs(_1508);
    float _1524 = trunc(_1488);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    bool _1530 = !_1466;
    int _1532 = _1530 ? 0 : (-1);
    bool _1534 = !_1520;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1552 = _1550 != 0;
    int _1554 = ~_1438;
    int _1556 = _1554 + _1532;
    int _1558 = _1556 + 1;
    float _1560 = trunc(_1500);
    int _1562 = int(_1560);
    bool _1564 = !_1544;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1570 = _1568 != 0;
    int _1572 = _1256 * _1522;
    int _1574 = _1572 + _1512;
    int _1576 = ~_833;
    int _1578 = _1576 + 1;
    int _1580 = _917 * _1558;
    int _1582 = _1580 + _1072;
    bool _1584 = !_1540;
    int _1586 = _1584 ? 0 : 1;
    float _1588 = trunc(_1484);
    int _1590 = int(_1588);
    float _1592 = float(uint(_1574));
    int _1594 = _1578 * int(_1528);
    int _1596 = _1594 + _1456;
    bool _1598 = _917 == 0;
    int _1600 = abs(_1566);
    float _1602 = as_type<float>(_919) * _1592;
    float _1604 = float(uint(_1596));
    float _1606 = _1592;
    float _1608 = as_type<float>(_1528);
    float _1610 = _1362;
    float _1612 = as_type<float>(_1010);
    if (_1570)
    {
        float _1614 = in.m_66.w;
        _1606 = _1614;
    }
    float _1616 = _1606;
    int _1618 = ~_1562;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    float _1624 = trunc(_1602);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    bool _1630 = !_1598;
    int _1632 = _1630 ? _1582 : (-1);
    float _1634 = as_type<float>(_891) * _1604;
    int _1636 = abs(_1536);
    int _1638 = abs(_1586);
    int _1640 = _1632 * _1622;
    int _1642 = _917 + (-1);
    float _1644 = trunc(_1634);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = _1590 * _1636;
    int _1652 = _1650 + _1072;
    bool _1654 = !_1548;
    int _1656 = _1654 ? 0 : 1;
    int _1658 = _1562 * _1642;
    int _1660 = _1658 + _1640;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1664 = _1662 != 0;
    int _1666 = _1660 * _1600;
    int _1668 = ~_861;
    int _1670 = _1668 + 1;
    int _1672 = ~_833;
    int _1674 = _1672 + 1;
    int _1676 = _1504 * _1638;
    int _1678 = _1676 + _1666;
    int _1680 = abs(_1656);
    int _1682 = _1670 * int(_1628);
    int _1684 = _1682 + _1574;
    float _1686 = as_type<float>(_1666);
    if (_1570)
    {
        float _1688 = _1616 * 3.1415927410125732421875;
        _1686 = _1688;
    }
    float _1690 = _1686;
    int _1692 = int(_1528) + int(_1648);
    int _1694 = _1652 * _1680;
    int _1696 = _1694 + _1678;
    float _1698 = float(uint(_1684));
    if (_1570)
    {
        float _1700 = _1690 * 0.15915493667125701904296875;
        _1608 = _1700;
    }
    float _1702 = _1608;
    bool _1704 = !_1552;
    int _1706 = _1704 ? 0 : 1;
    int _1708 = _1674 * _1692;
    int _1710 = _1708 + _1456;
    float _1712 = _1616;
    if (_1664)
    {
        float _1714 = in.m_66.x;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = as_type<float>(_919) * _1698;
    int _1720 = abs(_1706);
    float _1722 = _1702;
    if (_1570)
    {
        float _1724 = _1702 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        _1722 = _1726;
    }
    float _1728 = _1722;
    bool _1730 = uint(_1710) >= uint(_833);
    bool _1732 = !_1730;
    int _1734 = _1732 ? 0 : (-1);
    float _1736 = float(uint(_1334));
    float _1738 = trunc(_1718);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1746 = _1744 != 0;
    int _1748 = _1590 * _1720;
    int _1750 = _1748 + _1696;
    int _1752 = ~_1692;
    int _1754 = _1752 + _1734;
    int _1756 = _1754 + 1;
    float _1758 = as_type<float>(_891) * _1736;
    bool _1760 = !_1746;
    float _1762 = _1760 ? _231 : as_type<float>(_1474);
    float _1764 = float(uint(_1750));
    int _1766 = _833 * _1756;
    int _1768 = _1766 + _1456;
    bool _1770 = _833 == 0;
    float _1772 = trunc(_1758);
    float _1774 = precise::max(_1772, 0.0);
    uint _1776 = uint(_1774);
    bool _1778 = _1746;
    float _1780 = _1764;
    if (_1570)
    {
        bool _1782 = _1728 > 0.5;
        _1778 = _1782;
    }
    bool _1784 = _1778;
    bool _1786 = !_1770;
    int _1788 = _1786 ? _1768 : (-1);
    float _1790 = 0.0;
    if (!_1570)
    {
        _1790 = _231;
    }
    float _1792 = _1790;
    int _1794 = int(_1628) + int(_1742);
    float _1796 = as_type<float>(_1038) * _1764;
    int _1798 = ~_833;
    int _1800 = _1798 + 1;
    float _1802 = _1792;
    if (_1664)
    {
        float _1804 = _1716 * 3.1415927410125732421875;
        _1780 = _1804;
    }
    float _1806 = _1780;
    float _1808 = _1806;
    if (_1570)
    {
        float _1810 = -_231;
        float _1812 = _1784 ? _1810 : _231;
        _1802 = _1812;
    }
    float _1814 = _1802;
    float _1816 = trunc(_1796);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = _1788 & 3;
    bool _1824 = _1822 != 0;
    if (_1664)
    {
        float _1826 = _1806 * 0.15915493667125701904296875;
        _1808 = _1826;
    }
    float _1828 = _1808;
    int _1830 = _1788 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = _1824 ? 0 : 1;
    float _1836 = _1828;
    if (_1664)
    {
        float _1838 = _1828 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        _1836 = _1840;
    }
    float _1842 = _1836;
    bool _1844 = uint(_1830) > 1u;
    int _1846 = _1800 * int(_1776);
    int _1848 = _1846 + _1334;
    float _1850 = float(uint(_1348));
    int _1852 = ~_917;
    int _1854 = _1852 + 1;
    int _1856 = ~_861;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_919) * _1850;
    float _1862 = float(uint(_1848));
    int _1864 = _1854 * int(_1820);
    int _1866 = _1864 + _1750;
    int _1868 = ~_1834;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = ~_861;
    int _1876 = _1874 + 1;
    float _1878 = as_type<float>(_891) * _1862;
    int _1880 = _1872;
    if (!_1844)
    {
        int _1882 = ~_1834;
        int _1884 = _1882 + 1;
        _1880 = _1884;
    }
    int _1886 = _1880;
    int _1888 = _1858 * _1794;
    int _1890 = _1888 + _1574;
    float _1892 = -_217;
    int _1894 = _1356 ? as_type<int>(_1892) : as_type<int>(_217);
    float _1896 = trunc(_1860);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    float _1902 = float(uint(_1866));
    bool _1904 = uint(_1830) >= 2u;
    bool _1906 = uint(_1890) >= uint(_861);
    float _1908 = as_type<float>(_1038) * _1902;
    int _1910 = _1904 ? 0 : 1;
    float _1912 = trunc(_1878);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    bool _1918 = _1830 != 3;
    bool _1920 = !_1906;
    int _1922 = _1920 ? 0 : (-1);
    bool _1924 = _1918;
    if (!_1664)
    {
        _1610 = _217;
    }
    float _1926 = _1610;
    int _1928 = ~_1794;
    int _1930 = _1928 + _1922;
    int _1932 = _1930 + 1;
    float _1934 = trunc(_1908);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    int _1940 = _1876 * int(_1900);
    int _1942 = _1940 + _1348;
    int _1944 = ~_1910;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    int _1950 = _861 * _1932;
    int _1952 = _1950 + _1574;
    int _1954 = _1948;
    float _1956 = _1926;
    float _1958 = 2.8025969286496341418474591665798e-45;
    if (_1918)
    {
        int _1960 = ~_1910;
        int _1962 = _1960 + 1;
        _1954 = _1962;
    }
    int _1964 = _1954;
    if (_1664)
    {
        bool _1966 = _1842 > 0.5;
        _1924 = _1966;
    }
    bool _1968 = _1924;
    bool _1970 = !_1360;
    int _1972 = _1970 ? _1952 : (-1);
    float _1974 = float(uint(_1942));
    int _1976 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1978 = _1976 != 0;
    if (_1664)
    {
        float _1980 = -_217;
        float _1982 = _1968 ? _1980 : _217;
        _1956 = _1982;
    }
    float _1984 = _1956;
    float _1986 = as_type<float>(_919) * _1974;
    int _1988 = _1972 & 3;
    bool _1990 = _1988 != 0;
    int _1992 = int(_1820) + int(_1938);
    bool _1994 = !_1978;
    float _1996 = _1994 ? _217 : as_type<float>(_1894);
    float _1998 = trunc(_1986);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    int _2004 = int(_1776) + int(_1916);
    bool _2006 = uint(_1988) > 1u;
    int _2008 = ~_917;
    int _2010 = _2008 + 1;
    int _2012 = _1972 & 3;
    bool _2014 = _2012 != 0;
    int _2016 = ~_833;
    int _2018 = _2016 + 1;
    int _2020 = _2010 * _1992;
    int _2022 = _2020 + _1750;
    int _2024 = _2014 ? 0 : 1;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2028 = _2026 != 0;
    int _2030 = _2018 * _2004;
    int _2032 = _2030 + _1334;
    float _2034 = float(uint(_1652));
    bool _2036 = !_2028;
    int _2038 = _2036 ? 0 : 1;
    bool _2040 = uint(_2022) >= uint(_917);
    float _2042 = as_type<float>(_1038) * _2034;
    int _2044 = ~_2024;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    int _2050 = _2048;
    if (!_2006)
    {
        int _2052 = ~_2024;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    float _2058 = trunc(_2042);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    bool _2064 = uint(_2032) >= uint(_833);
    bool _2066 = !_2040;
    int _2068 = _2066 ? 0 : (-1);
    bool _2070 = _1988 != 3;
    bool _2072 = !_2064;
    int _2074 = _2072 ? 0 : (-1);
    bool _2076 = uint(_1988) >= 2u;
    int _2078 = ~_1992;
    int _2080 = _2078 + _2068;
    int _2082 = _2080 + 1;
    int _2084 = ~_861;
    int _2086 = _2084 + 1;
    int _2088 = int(_1900) + int(_2002);
    int _2090 = _917 * _2082;
    int _2092 = _2090 + _1750;
    int _2094 = ~_917;
    int _2096 = _2094 + 1;
    int _2098 = _2076 ? 0 : 1;
    int _2100 = _2086 * _2088;
    int _2102 = _2100 + _1348;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2106 = _2104 != 0;
    int _2108 = ~_2098;
    int _2110 = _2108 + 1;
    int _2112 = _2110 + 1;
    int _2114 = _2112;
    float _2116 = as_type<float>(_2096);
    if (_2070)
    {
        int _2118 = ~_2098;
        int _2120 = _2118 + 1;
        _2114 = _2120;
    }
    int _2122 = _2114;
    int _2124 = _2096 * int(_2062);
    int _2126 = _2124 + _1652;
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2130 = _2128 != 0;
    bool _2132 = !_2106;
    int _2134 = _2132 ? 0 : 1;
    bool _2136 = uint(_2102) >= uint(_861);
    bool _2138 = !_1598;
    int _2140 = _2138 ? _2092 : (-1);
    bool _2142 = !_2130;
    int _2144 = _2142 ? 0 : 1;
    bool _2146 = !_2136;
    int _2148 = _2146 ? 0 : (-1);
    int _2150 = _2140 & 3;
    bool _2152 = _2150 != 0;
    int _2154 = _2140 & 3;
    bool _2156 = _2154 != 0;
    float _2158 = float(uint(_2126));
    int _2160 = _2152 ? 0 : 1;
    bool _2162 = uint(_2154) > 1u;
    float _2164 = as_type<float>(_1038) * _2158;
    int _2166 = ~_2160;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    float _2172 = trunc(_2164);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2184 = _2170;
    if (!_2162)
    {
        int _2186 = ~_2160;
        int _2188 = _2186 + 1;
        _2184 = _2188;
    }
    int _2190 = _2184;
    bool _2192 = uint(_2154) >= 2u;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2196 = ~_917;
    int _2198 = _2196 + 1;
    int _2200 = _2192 ? 0 : 1;
    bool _2202 = _2154 != 3;
    int _2204 = int(_2062) + int(_2176);
    int _2206 = ~_2200;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = _2198 * _2204;
    int _2214 = _2212 + _1652;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2218 = _2210;
    if (_2202)
    {
        int _2220 = ~_2200;
        int _2222 = _2220 + 1;
        _2218 = _2222;
    }
    int _2224 = _2218;
    bool _2226 = uint(_2214) >= uint(_917);
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2230 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2216);
    bool _2232 = !_2226;
    int _2234 = _2232 ? 0 : (-1);
    bool _2236 = _994 > 0.5;
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2242 = -_231;
    int _2244 = _2236 ? as_type<int>(_2242) : as_type<int>(_231);
    bool _2246 = _1004 != 1;
    float _2248 = 1.0 / _2240;
    float _2250 = in.m_46.x;
    float _2252 = in.m_46.y;
    float _2254 = in.m_46.z;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2260 = abs(_2056);
    int _2262 = abs(_2122);
    float _2264 = 1.0 / _2258;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2270 = ~_2004;
    int _2272 = _2270 + _2074;
    int _2274 = _2272 + 1;
    float _2276 = 0.0;
    int _2278 = _2260;
    if (!_2246)
    {
        _2276 = _1002;
    }
    float _2280 = _2276;
    float _2282 = _2280;
    if (_2246)
    {
        _2282 = _994;
    }
    float _2284 = _2282;
    int _2286 = _833 * _2274;
    int _2288 = _2286 + _1334;
    float _2290 = 0.0;
    if (!_2246)
    {
        _2290 = _1002;
    }
    float _2292 = _2290;
    float _2294 = 1.0 / _2268;
    float _2296 = _2292;
    if (!_2246)
    {
        _2116 = _1016;
    }
    float _2298 = _2116;
    float _2300 = 0.0;
    float _2302 = _2298;
    if (!_2246)
    {
        _2300 = _1016;
    }
    float _2304 = _2300;
    float _2306 = _2304;
    if (_2246)
    {
        _2296 = _994;
    }
    float _2308 = _2296;
    if (_2246)
    {
        _2302 = _1002;
    }
    float _2310 = _2302;
    float _2312 = _189 * _2252;
    float _2314 = _195 * _2252;
    float _2316 = _201 * _2252;
    float _2318 = _994 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2320 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2180);
    float _2322 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2324 = -_2178;
    float _2326 = fma(_2318, 2.0, _2324);
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2330 = fma(_2322, -2.0, _2182);
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2334 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2328);
    float _2336 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_2246)
    {
        _2306 = _1002;
    }
    float _2338 = _2306;
    float _2340 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2342 = _1010 != 2;
    float _2344 = fma(_2336, -2.0, _2332);
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2348 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2350 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2346);
    float _2352 = _1230 * _127;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2356 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2360 = -_2354;
    float _2362 = fma(_2340, 2.0, _2360);
    float _2364 = exp2(_2352);
    if (_2342)
    {
        _1612 = _994;
    }
    float _2366 = _1612;
    float _2368 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2358);
    float _2370 = _2366;
    if (_2342)
    {
        _1958 = _1002;
    }
    float _2372 = _1958;
    float _2374 = -_127;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2362);
    float _2378 = _2372;
    if (!_2342)
    {
        _2370 = _1016;
    }
    float _2380 = _2370;
    float _2382 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2320);
    if (!_2342)
    {
        _2378 = _994;
    }
    float _2384 = _2378;
    float _2386 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2334);
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2390 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2392 = _2390 != 0;
    float _2394 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2398 = -_2194;
    float _2400 = fma(_2388, 2.0, _2398);
    bool _2402 = !_2392;
    float _2404 = _2402 ? _231 : as_type<float>(_2244);
    float _2406 = -_2364;
    float _2408 = _2406 + 1.0;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2412 = fma(_2356, -2.0, _2396);
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2418 = -_2410;
    float _2420 = fma(_2348, 2.0, _2418);
    float _2422 = fma(_2394, -2.0, _2228);
    bool _2424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2426 = isnan(0.0);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2432 = _2428 || _2430;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2436 = _2434 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2440 = _2432 ? _2408 : 0.0;
    float _2442 = 1.0 / _2436;
    bool _2444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2446 = isnan(1.0);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2452 = _2448 || _2450;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2458 = 1.0 + _2456;
    float _2460 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2438);
    float _2462 = -_127;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2420);
    float _2466 = -_127;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2326);
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2472 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2454);
    float _2474 = _994 * 2.0;
    float _2476 = 1.0 / _2458;
    float _2478 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2230);
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2472);
    float _2484 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2330);
    float _2486 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2344);
    float _2488 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2480);
    float _2490 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2350);
    float _2492 = floor(_2474);
    float _2494 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2368);
    float _2496 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2488);
    float _2498 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2412);
    float _2500 = -_127;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2400);
    float _2504 = fma(_193, _2250, _2314);
    float _2506 = fma(_199, _2250, _2316);
    float _2508 = 1.0 / _2416;
    float _2510 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2422);
    if (_2452)
    {
        float _2512 = _2440 * _2476;
        _137 = _2512;
    }
    float _2514 = _137;
    float _2516 = _1002 * 2.0;
    float _2518 = fma(_187, _2250, _2312);
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2524 = fma(_203, _2254, _2506);
    float _2526 = fma(_197, _2254, _2504);
    bool _2528 = _2492 >= 0.0;
    bool _2530 = isnan(_2492);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    float _2538 = floor(_2516);
    float _2540 = fma(_191, _2254, _2518);
    float _2542 = _1016 * 2.0;
    int _2544 = _2536 ? 0 : 1;
    float _2546 = -_2470;
    float _2548 = _2546 + 1.0;
    bool _2550 = _2492 > 0.0;
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2552;
    float _2556 = 1.0 / _2522;
    int _2558 = ~_2544;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = -_2494;
    float _2566 = _2564 + 1.0;
    float _2568 = _2554 * _2248;
    float _2570 = -_2482;
    float _2572 = _2570 + 1.0;
    bool _2574 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2576 = isnan(_815);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2582 = _2578 || _2580;
    float _2584 = float(_2582);
    float _2586 = -_2496;
    float _2588 = _2586 + 1.0;
    bool _2590 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2592 = isnan(_815);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2598 = _2594 || _2596;
    float _2600 = float(_2598);
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2602;
    int _2606 = _2562;
    if (!_2550)
    {
        int _2608 = ~_2544;
        int _2610 = _2608 + 1;
        _2606 = _2610;
    }
    int _2612 = _2606;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2618 = _2538 >= 0.0;
    bool _2620 = isnan(_2538);
    bool _2622 = _2618 || _2620;
    bool _2624 = isnan(0.0);
    bool _2626 = _2622 || _2624;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2632 = _2616 * _2556;
    int _2634 = _2626 ? 0 : 1;
    float _2636 = _2630 * _2442;
    bool _2638 = _2538 > 0.0;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2640;
    float _2644 = floor(_2542);
    int _2646 = ~_2088;
    int _2648 = _2646 + _2148;
    int _2650 = _2648 + 1;
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2656 = _2604 * _2508;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2660 = _815 + _2658;
    int _2662 = _861 * _2650;
    int _2664 = _2662 + _1348;
    int _2666 = ~_2634;
    int _2668 = _2666 + 1;
    int _2670 = _2668 + 1;
    float _2672 = 1.0 / _2654;
    bool _2674 = !_1832;
    int _2676 = _2674 ? 0 : 1;
    float _2678 = fma(_2568, _2660, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2680 = _2670;
    if (!_2638)
    {
        int _2682 = ~_2634;
        int _2684 = _2682 + 1;
        _2680 = _2684;
    }
    int _2686 = _2680;
    float _2688 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2690 = _2688 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2692 = !_1360;
    int _2694 = _2692 ? _2664 : (-1);
    float _2696 = -_2584;
    float _2698 = _2696 + 1.0;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2702 = _2700 != 0;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2706 = _2704 != 0;
    int _2708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2710 = _2708 != 0;
    float _2712 = _2690 * _2264;
    bool _2714 = _2644 >= 0.0;
    bool _2716 = isnan(_2644);
    bool _2718 = _2714 || _2716;
    bool _2720 = isnan(0.0);
    bool _2722 = _2718 || _2720;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2726 = _815 + _2724;
    bool _2728 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2730 = isnan(_815);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2740;
    bool _2744 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2746 = isnan(_815);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2752 = _2748 || _2750;
    float _2754 = float(_2752);
    float _2756 = fma(_2632, _2726, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2758 = _2722 ? 0 : 1;
    float _2760 = _2642 * _2672;
    bool _2762 = _2644 > 0.0;
    float _2764 = _2738 * _2698;
    float _2766 = -_2738;
    float _2768 = _2766 + 1.0;
    bool _2770 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2772 = isnan(_815);
    bool _2774 = _2770 || _2772;
    bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2778 = _2774 || _2776;
    float _2780 = float(_2778);
    float _2782 = -_2754;
    float _2784 = _2782 + 1.0;
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2788 = _815 + _2786;
    float _2790 = _2754 * _2768;
    bool _2792 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2794 = isnan(_815);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2800 = _2796 || _2798;
    float _2802 = float(_2800);
    float _2804 = _2780 * _2784;
    float _2806 = fma(_2656, _2788, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2810 = _815 + _2808;
    float _2812 = in.m_62.w;
    float _2814 = -_2780;
    float _2816 = _2814 + 1.0;
    bool _2818 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2820 = isnan(_815);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = fma(_2636, _2810, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2832 = -_2802;
    float _2834 = _2832 + 1.0;
    int _2836 = _1972 >> 31;
    float _2838 = _2802 * _2816;
    float _2840 = -_2828;
    float _2842 = _2840 + 1.0;
    float _2844 = in.m_64.w;
    float _2846 = _2828 * _2834;
    float _2848 = _2742 * _2294;
    bool _2850 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2852 = isnan(_815);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2864 = _815 + _2862;
    int _2866 = _2836 & 3;
    float _2868 = -_2600;
    float _2870 = _2868 + 1.0;
    float _2872 = _2600 * _2842;
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _815 + _2874;
    float _2878 = fma(_2848, _2864, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2880 = _1972 + _2866;
    float _2882 = _2860 * _2870;
    float _2884 = fma(_2712, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2886 = -_2860;
    float _2888 = _2886 + 1.0;
    int _2890 = _2880 >> 2;
    float _2892 = _2678 * _2882;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2896 = _815 + _2894;
    float _2898 = _1002 + _994;
    int _2900 = _2890 << 4;
    int _2902 = _2900 + 656;
    float _2904 = fma(_2888, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2892);
    float _2906 = fma(_2760, _2896, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2908 = _2526 + _2812;
    float _2910 = _2540 + _1046;
    float _2912 = fma(_2756, _2872, _2904);
    uint _2914 = uint(int(uint(_2902) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2932 = _2908 + _2930;
    float _2934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2936 = _2910 + _2934;
    int _2938 = ~_2758;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = _2524 + _2844;
    float _2946 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2948 = _2942;
    float _2950 = _2790;
    if (!_2762)
    {
        int _2952 = ~_2758;
        int _2954 = _2952 + 1;
        _2948 = _2954;
    }
    int _2956 = _2948;
    float _2958 = fma(_2806, _2846, _2912);
    bool _2960 = !_1990;
    int _2962 = _2960 ? 0 : 1;
    float _2964 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2946);
    bool _2966 = _1988 != 3;
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2970 = _2944 + _2968;
    float _2972 = _994 + _1016;
    float _2974 = _994 + (-0.5);
    bool _2976 = !_2966;
    int _2978 = _2976 ? 0 : (-1);
    float _2980 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2964);
    float _2982 = fma(_2830, _2838, _2958);
    int _2984 = _2902 + 8;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    float _3002 = _2898 + (-1.0);
    bool _3004 = _2980 >= 0.0;
    float _3006 = _1814 + 0.5;
    float _3008 = fma(_2878, _2804, _2982);
    float _3010 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3012 = _1002 + _1016;
    float _3014 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2464);
    float _3016 = _1002 + (-0.5);
    float _3018 = _2404 + 0.5;
    float _3020 = _1984 + (-0.5);
    float _3022 = fma(_2884, _2790, _3008);
    float _3024 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2468);
    float _3026 = -_3020;
    float _3028 = -_2486;
    float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3028);
    int _3032 = ~_2260;
    int _3034 = _3032 + 1;
    int _3036 = _3034 + 1;
    float _3038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3004)
    {
        _2950 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3040 = _2950;
    float _3042 = fma(_2906, _2764, _3022);
    int _3044 = abs(_2962);
    float _3046 = -_2382;
    float _3048 = _3046 + 1.0;
    if (_3004)
    {
        float _3050 = _3040 * 5.0;
        _2278 = as_type<int>(_3050);
    }
    int _3052 = _2278;
    bool _3054 = !_2702;
    int _3056 = _3054 ? 0 : 1;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3060 = -_3048;
    float _3062 = fma(_3060, _1814, _3014);
    float _3064 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_3004)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9506 = as_type<float>(_3052);
        out.gl_Position.z = _9506;
    }
    int _3066 = abs(_3056);
    float _3068 = fma(_2584, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3042);
    int _3070 = _3036 * as_type<int>(_2928);
    float _3072 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3074 = int(_3072);
    float _3076 = -_2386;
    float _3078 = _3076 + 1.0;
    float _3080 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3082 = ~_3044;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = _1996 + (-0.5);
    float _3090 = fma(_3078, _1984, _3030);
    int _3092 = ~_2204;
    int _3094 = _3092 + _2234;
    int _3096 = _3094 + 1;
    float _3098 = _1762 + 0.5;
    int _3100 = _3086 * as_type<int>(_2920);
    int _3102 = _3100 + _3070;
    float _3104 = _2932 * _2932;
    float _3106 = fma(_3080, _3098, _2376);
    int _3108 = ~_2262;
    int _3110 = _3108 + 1;
    int _3112 = _3110 + 1;
    out.m_74.x = _3062;
    out.m_74.y = _3090;
    int _3114 = abs(_2978);
    float _3116 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3118 = abs(_3074);
    int _3120 = _3112 * as_type<int>(_2992);
    int _3122 = _3120 + _3102;
    float _3124 = float(uint(_3074));
    float _3126 = -_3088;
    float _3128 = -_2484;
    float _3130 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3128);
    int _3132 = abs(_2134);
    int _3134 = _917 * _3096;
    int _3136 = _3134 + _1652;
    int _3138 = ~_3114;
    int _3140 = _3138 + 1;
    int _3142 = _3140 + 1;
    float _3144 = fma(_2936, _2936, _3104);
    float _3146 = 1.0 / _3124;
    int _3148 = ~_3132;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = _1516 + (-0.5);
    float _3156 = fma(_2970, _2970, _3144);
    int _3158 = _3142 * as_type<int>(_3000);
    int _3160 = _3158 + _3122;
    int _3162 = _2140 >> 31;
    float _3164 = -_3116;
    float _3166 = -_2498;
    float _3168 = fma(_3164, _3154, _3166);
    float _3170 = float(uint(_3118));
    float _3172 = rsqrt(_3156);
    int _3174 = _3160 * _3152;
    int _3176 = _1788 >> 31;
    out.m_76.x = _3068;
    int _3178 = _3162 & 3;
    int _3180 = _2694 * _3132;
    int _3182 = _3180 + _3174;
    int _3184 = _3176 & 3;
    if (_3004)
    {
        out.m_53.x = 0.0;
    }
    float _3186 = 1.0 / _3170;
    int _3188 = as_type<int>(_3146) + (-2);
    float _3190 = float(uint(_3182));
    int _3192 = _1788 + _3184;
    float _3194 = _3064 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3196 = _2140 + _3178;
    float _3198 = as_type<float>(_3188) * _3190;
    float _3200 = float(_2956);
    float _3202 = _3194 * _3172;
    int _3204 = _3192 >> 2;
    float _3206 = in.m_78.x;
    float _3208 = in.m_78.y;
    float _3210 = in.m_78.z;
    int _3212 = abs(_3182);
    float _3214 = _2932 * _3202;
    float _3216 = trunc(_3198);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    float _3222 = _2936 * _3202;
    int _3224 = as_type<int>(_3186) + (-2);
    float _3226 = -_3214;
    float _3228 = _2932 + _3226;
    int _3230 = _3204 << 4;
    int _3232 = _3230 + 368;
    float _3234 = -_3222;
    float _3236 = _2936 + _3234;
    int _3238 = _3196 >> 2;
    float _3240 = _3228 * _3228;
    uint _3242 = uint(int(uint(_3232) >> uint(2)));
    uint _3244 = uint(int(uint(int(_3242)) >> uint(2)));
    int _3246 = int(_3242) & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    int _3250 = int(_3242) + 1;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    int _3254 = _3250 & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    float _3258 = float(uint(_3212));
    float _3260 = fma(_3236, _3236, _3240);
    int _3262 = ~_3074;
    int _3264 = _3262 + 1;
    float _3266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3268 = _3238 << 4;
    int _3270 = _3268 + 800;
    float _3272 = as_type<float>(_3224) * _3258;
    float _3274 = float(_3066);
    int _3276 = _3264 * int(_3220);
    int _3278 = _3276 + _3182;
    uint _3280 = uint(int(uint(_3270) >> uint(2)));
    uint _3282 = uint(int(uint(int(_3280)) >> uint(2)));
    int _3284 = int(_3280) & 3;
    float _3286 = (*spvDescriptorSet0.vp_c9)._m0[int(_3282)][_3284];
    int _3288 = int(_3280) + 1;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    int _3292 = _3288 & 3;
    float _3294 = (*spvDescriptorSet0.vp_c9)._m0[int(_3290)][_3292];
    int _3296 = abs(_2676);
    float _3298 = _3274 * _3200;
    float _3300 = -_2478;
    float _3302 = _3300 + 1.0;
    float _3304 = float(uint(_3278));
    float _3306 = trunc(_3272);
    float _3308 = precise::max(_3306, 0.0);
    uint _3310 = uint(_3308);
    float _3312 = -_2490;
    float _3314 = _3312 + 1.0;
    float _3316 = fma(_1996, _3302, _3130);
    float _3318 = _2970 * _3202;
    float _3320 = as_type<float>(_3188) * _3304;
    float _3322 = -_2548;
    float _3324 = fma(_2404, _3322, _3024);
    float _3326 = -_3314;
    float _3328 = fma(_1762, _3326, _3106);
    float _3330 = fma(_1516, _2566, _3168);
    float _3332 = _3298 * (-2.0);
    int _3334 = ~_3118;
    int _3336 = _3334 + 1;
    float _3338 = trunc(_3320);
    float _3340 = precise::max(_3338, 0.0);
    uint _3342 = uint(_3340);
    int _3344 = abs(_2038);
    float _3346 = fma(_3332, _3206, _3206);
    out.m_80.x = _3324;
    out.m_80.y = _3316;
    out.m_80.z = _3328;
    out.m_80.w = _3330;
    int _3348 = abs(_2144);
    float _3350 = -_3318;
    float _3352 = _2970 + _3350;
    int _3354 = _3336 * int(_3310);
    int _3356 = _3354 + _3212;
    float _3358 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3346);
    bool _3360 = _833 == 0;
    int _3362 = _3232 + 8;
    uint _3364 = uint(int(uint(_3362) >> uint(2)));
    uint _3366 = uint(int(uint(int(_3364)) >> uint(2)));
    int _3368 = int(_3364) & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    int _3372 = int(_3364) + 1;
    uint _3374 = uint(int(uint(_3372) >> uint(2)));
    int _3376 = _3372 & 3;
    float _3378 = (*spvDescriptorSet0.vp_c9)._m0[int(_3374)][_3376];
    float _3380 = float(_2612);
    float _3382 = fma(_3010, _3332, _3010);
    bool _3384 = !_3360;
    int _3386 = _3384 ? _2288 : (-1);
    float _3388 = fma(_3352, _3352, _3260);
    float _3390 = fma(_3382, _2514, _3358);
    int _3392 = int(_3220) + int(_3342);
    int _3394 = _3270 + 8;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c9)._m0[int(_3406)][_3408];
    float _3412 = float(uint(_3356));
    int _3414 = abs(_1886);
    int _3416 = abs(_2190);
    float _3418 = as_type<float>(_3224) * _3412;
    int _3420 = ~_3074;
    int _3422 = _3420 + 1;
    int _3424 = ~_3414;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    float _3430 = trunc(_3418);
    float _3432 = precise::max(_3430, 0.0);
    uint _3434 = uint(_3432);
    bool _3436 = !_2156;
    int _3438 = _3436 ? 0 : 1;
    int _3440 = _3422 * _3392;
    int _3442 = _3440 + _3182;
    bool _3444 = _1830 != 3;
    int _3446 = _3428 * as_type<int>(_3256);
    int _3448 = ~_3416;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    bool _3454 = !_3444;
    int _3456 = _3454 ? 0 : (-1);
    bool _3458 = uint(_3442) >= uint(_3074);
    int _3460 = _3452 * as_type<int>(_3294);
    int _3462 = abs(_3438);
    int _3464 = ~_3118;
    int _3466 = _3464 + 1;
    int _3468 = int(_3310) + int(_3434);
    int _3470 = ~_3296;
    int _3472 = _3470 + 1;
    int _3474 = _3472 + 1;
    bool _3476 = !_3458;
    int _3478 = _3476 ? 0 : (-1);
    int _3480 = _3466 * _3468;
    int _3482 = _3480 + _3212;
    bool _3484 = _2154 != 3;
    int _3486 = _3474 * as_type<int>(_3248);
    int _3488 = _3486 + _3446;
    int _3490 = ~_3392;
    int _3492 = _3490 + _3478;
    int _3494 = _3492 + 1;
    int _3496 = ~_3462;
    int _3498 = _3496 + 1;
    int _3500 = _3498 + 1;
    int _3502 = abs(_2224);
    int _3504 = _3074 * _3494;
    int _3506 = _3504 + _3182;
    bool _3508 = !_3484;
    int _3510 = _3508 ? 0 : (-1);
    int _3512 = _3500 * as_type<int>(_3286);
    int _3514 = _3512 + _3460;
    int _3516 = abs(_1964);
    float _3518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3520 = uint(_3482) >= uint(_3118);
    int _3522 = ~_3502;
    int _3524 = _3522 + 1;
    int _3526 = _3524 + 1;
    int _3528 = _3182 ^ _3074;
    int _3530 = ~_3516;
    int _3532 = _3530 + 1;
    int _3534 = _3532 + 1;
    int _3536 = _3526 * as_type<int>(_3402);
    int _3538 = _3536 + _3514;
    bool _3540 = !_3520;
    int _3542 = _3540 ? 0 : (-1);
    int _3544 = abs(_3456);
    int _3546 = _3534 * as_type<int>(_3370);
    int _3548 = _3546 + _3488;
    uint _3550 = uint(int(uint(_3528) >> uint(31)));
    int _3552 = abs(_3510);
    int _3554 = ~_3542;
    int _3556 = _3468 + _3554;
    int _3558 = _3556 + 1;
    int _3560 = ~_3544;
    int _3562 = _3560 + 1;
    int _3564 = _3562 + 1;
    int _3566 = ~int(_3550);
    int _3568 = _3566 + 1;
    int _3570 = _3564 * as_type<int>(_3378);
    int _3572 = _3570 + _3548;
    int _3574 = ~_3552;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    bool _3580 = _3074 == 0;
    int _3582 = _3558 ^ _3568;
    int _3584 = _3578 * as_type<int>(_3410);
    int _3586 = _3584 + _3538;
    int _3588 = ~_3344;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = _3518 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3596 = ~_3348;
    int _3598 = _3596 + 1;
    int _3600 = _3598 + 1;
    bool _3602 = !_3580;
    int _3604 = _3602 ? _3506 : (-1);
    int _3606 = _3572 * _3592;
    bool _3608 = _3074 == 0;
    int _3610 = _3586 * _3600;
    int _3612 = ~_3568;
    int _3614 = _3612 + _3582;
    int _3616 = _3614 + 1;
    int _3618 = _3386 * _3344;
    int _3620 = _3618 + _3606;
    float _3622 = float(_3604);
    float _3624 = _1168 + (-0.5);
    bool _3626 = !_3608;
    int _3628 = _3626 ? _3616 : (-1);
    bool _3630 = !_2706;
    int _3632 = _3630 ? 0 : 1;
    float _3634 = fma(_3594, _3622, _2502);
    float _3636 = float(_3628);
    float _3638 = _3266 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3640 = !_1598;
    int _3642 = _3640 ? _3136 : (-1);
    int _3644 = abs(_3632);
    float _3646 = -_2510;
    float _3648 = fma(_3638, _3636, _3646);
    float _3650 = _1184 + 0.5;
    int _3652 = _3642 * _3348;
    int _3654 = _3652 + _3610;
    float _3656 = float(_3620);
    float _3658 = -_3638;
    float _3660 = fma(_3658, _3624, _3648);
    float _3662 = fma(_3594, _3650, _3634);
    float _3664 = float(_3654);
    float _3666 = -_2572;
    float _3668 = fma(_1184, _3666, _3662);
    float _3670 = fma(_1168, _2588, _3660);
    float _3672 = float(_3644);
    out.m_82.x = _3656;
    out.m_82.w = _3664;
    float _3674 = _3672 * _3380;
    bool _3676 = !_2710;
    int _3678 = _3676 ? 0 : 1;
    out.m_84.x = _3668;
    out.m_84.y = _3670;
    float _3680 = _3210;
    if (_3004)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3682 = -_3214;
    float _3684 = _2908 + _3682;
    float _3686 = -_3222;
    float _3688 = _2910 + _3686;
    float _3690 = -_3318;
    float _3692 = _2944 + _3690;
    int _3694 = abs(_3678);
    float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3698 = _3684 + _3696;
    float _3700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3702 = _3688 + _3700;
    float _3704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3706 = _3692 + _3704;
    float _3708 = _3012 + (-1.0);
    float _3710 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3712 = float(_2686);
    float _3714 = _2972 + (-1.0);
    float _3716 = fma(_3708, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3718 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3710);
    float _3720 = float(_3694);
    float _3722 = _3674 * (-2.0);
    float _3724 = _3390 * 0.15915493667125701904296875;
    float _3726 = fma(_3706, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3718);
    float _3728 = sqrt(_3388);
    float _3730 = fma(_3722, _3208, _3208);
    float _3732 = fma(_3716, _3722, _3716);
    float _3734 = _3720 * _3712;
    bool _3736 = _3726 >= 0.0;
    float _3738 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3730);
    float _3740 = _3734 * (-2.0);
    float _3742 = _3724 * 6.283185482025146484375;
    float _3744 = sin(_3742);
    float _3746 = fma(_3732, _2514, _3738);
    float _3748 = _1016 + (-0.5);
    float _3750 = fma(_3714, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3752 = fma(_3740, _3210, _3210);
    float _3754 = _3746 * 0.15915493667125701904296875;
    float _3756 = fma(_3750, _3740, _3750);
    float _3758 = _3724 * 6.283185482025146484375;
    float _3760 = cos(_3758);
    float _3762 = _3706;
    float _3764 = _3688;
    if (_3736)
    {
        _3680 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3766 = _3680;
    float _3768 = fma(_3748, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3752);
    int _3770 = as_type<int>(_3766);
    if (_3736)
    {
        out.m_53.x = 0.0;
    }
    if (_3736)
    {
        float _3772 = _3766 * 5.0;
        _3770 = as_type<int>(_3772);
    }
    int _3774 = _3770;
    float _3776 = fma(_3756, _2514, _3768);
    float _3778 = _3754 * 6.283185482025146484375;
    float _3780 = sin(_3778);
    if (_3736)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10536 = as_type<float>(_3774);
        out.gl_Position.z = _10536;
    }
    float _3782 = _3776 * 0.15915493667125701904296875;
    float _3784 = _3754 * 6.283185482025146484375;
    float _3786 = cos(_3784);
    if (_3736)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3788 = _3782 * 6.283185482025146484375;
    float _3790 = cos(_3788);
    float _3792 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3794 = _3172 * _3728;
    float _3796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3798 = _3760 * _3786;
    float _3800 = _3744 * _3786;
    float _3802 = _3794 * _3792;
    float _3804 = _3064 * _3794;
    float _3806 = _3782 * 6.283185482025146484375;
    float _3808 = sin(_3806);
    float _3810 = _3760 * _3780;
    float _3812 = _3796 * _3802;
    float _3814 = _3744 * _3780;
    float _3816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _3818 = _3760 * _3790;
    float _3820 = _3744 * _3790;
    float _3822 = _3816 * _3804;
    float _3824 = _3786 * _3790;
    float _3826 = _3818 * _3812;
    float _3828 = _3780 * _3790;
    float _3830 = _3794 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3832 = _3830 * 0.5;
    float _3834 = fma(_3808, _3798, _3814);
    float _3836 = -_3800;
    float _3838 = fma(_3808, _3810, _3836);
    float _3840 = -_3812;
    float _3842 = _3808 * _3840;
    float _3844 = -_3810;
    float _3846 = fma(_3808, _3800, _3844);
    float _3848 = fma(_3834, _3822, _3826);
    float _3850 = _3820 * _3812;
    float _3852 = fma(_3824, _3822, _3842);
    float _3854 = fma(_3808, _3814, _3798);
    float _3856 = fma(_3838, _3832, _3848);
    float _3858 = fma(_3846, _3822, _3850);
    float _3860 = fma(_3828, _3832, _3852);
    float _3862 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3864 = fma(_3854, _3832, _3858);
    float _3866 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3868 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3870 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3862);
    float _3872 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3866);
    float _3874 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3868);
    float _3876 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3870);
    float _3878 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3872);
    float _3880 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3874);
    float _3882 = _3876 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3884 = _3878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3886 = _3684 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3888 = _2944 + _3882;
    float _3890 = _2910 + _3884;
    float _3892 = fma(_3688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3886);
    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3896 = _3888 + _3894;
    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3900 = _3890 + _3898;
    float _3902 = fma(_3692, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3892);
    float _3904 = _3896 * _3896;
    float _3906 = fma(_3900, _3900, _3904);
    float _3908 = _3880 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3910 = sqrt(_3906);
    float _3912 = _2908 + _3908;
    bool _3914 = _3910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3916 = _3892;
    float _3918 = _3880;
    float _3920 = _3908;
    if (!_3914)
    {
        _3916 = _3890;
    }
    float _3922 = _3916;
    float _3924 = _3922;
    if (!_3914)
    {
        _3918 = _3888;
    }
    float _3926 = _3918;
    float _3928 = _3926;
    if (!_3914)
    {
        _3920 = _3912;
    }
    float _3930 = _3920;
    bool _3932 = !_3914;
    float _3934 = _3930;
    if (!_3932)
    {
        float _3936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3940 = _3910 + _3938;
        float _3942 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3944 = rsqrt(_3906);
        float _3946 = _3940 * _3936;
        float _3948 = _3946 * 0.15915493667125701904296875;
        float _3950 = _3948 * 6.283185482025146484375;
        float _3952 = cos(_3950);
        float _3954 = _3948 * 6.283185482025146484375;
        float _3956 = sin(_3954);
        float _3958 = _3952 + (-1.0);
        float _3960 = fma(_3956, _3942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3962 = _3958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3964 = _3944 * _3960;
        float _3966 = fma(_3912, _3952, _3962);
        float _3968 = fma(_3900, _3964, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3970 = fma(_3896, _3964, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3934 = _3966;
        _3924 = _3968;
        _3928 = _3970;
    }
    float _3972 = _3934;
    float _3974 = _3924;
    float _3976 = _3928;
    float _3978 = -_2908;
    float _3980 = _3978 + _3972;
    float _3982 = -_2910;
    float _3984 = _3982 + _3974;
    float _3986 = -_2944;
    float _3988 = _3986 + _3976;
    float _3990 = _3902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3992 = _3980 * _3980;
    float _3994 = _3684 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3996 = 1.0 / _3990;
    float _3998 = fma(_3984, _3984, _3992);
    bool _4000 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4002 = isnan(0.5);
    bool _4004 = _4000 || _4002;
    bool _4006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4008 = _4004 || _4006;
    bool _4010 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4012 = isnan(0.5);
    bool _4014 = _4010 || _4012;
    bool _4016 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4018 = _4014 || _4016;
    float _4020 = fma(_3988, _3988, _3998);
    float _4022 = fma(_3688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3994);
    float _4024 = sqrt(_4020);
    float _4026 = fma(_3692, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4022);
    float _4028 = _4026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4030 = _4028 + _3990;
    float _4032 = _4030 * _3996;
    float _4034 = _4032 * 0.5;
    bool _4036 = _4024 > 0.0;
    float _4038 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4040 = fma(_4034, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4038);
    float _4042 = 1.0 / _4040;
    bool _4044 = !_4036;
    float _4046 = _3974;
    float _4048 = _3972;
    float _4050 = _3976;
    float _4052 = _3984;
    float _4054 = _3990;
    if (!_4044)
    {
        float _4056 = _237 * _237;
        float _4058 = rsqrt(_4020);
        float _4060 = fma(_235, _235, _4056);
        float _4062 = fma(_239, _239, _4060);
        float _4064 = sqrt(_4062);
        float _4066 = _3984 * _4058;
        float _4068 = _3980 * _4058;
        float _4070 = _3988 * _4058;
        bool _4072 = _4064 > 0.0;
        bool _4074 = !_4072;
        _4054 = _4064;
        if (!_4074)
        {
            float _4076 = rsqrt(_4062);
            float _4078 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4080 = _237 * _4076;
            float _4082 = _235 * _4076;
            float _4084 = _4068 * _4080;
            float _4086 = _239 * _4076;
            float _4088 = fma(_4066, _4082, _4084);
            float _4090 = _4078 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4092 = fma(_4070, _4086, _4088);
            float _4094 = _4092 * _4090;
            float _4096 = fma(_235, _4094, _3974);
            float _4098 = fma(_237, _4094, _3972);
            float _4100 = fma(_239, _4094, _3976);
            _4046 = _4096;
            _4048 = _4098;
            _4050 = _4100;
            _4052 = _4094;
            _4054 = _4086;
        }
    }
    float _4102 = _4046;
    float _4104 = _4048;
    float _4106 = _4050;
    float _4108 = _4052;
    float _4110 = _4054;
    float _4112 = -_3222;
    float _4114 = _4112 + _4102;
    float _4116 = -_3214;
    float _4118 = _4116 + _4104;
    float _4120 = -_3318;
    float _4122 = _4120 + _4106;
    float _4124 = _4110;
    float _4126 = _4118;
    float _4128 = _4114;
    float _4130 = _4122;
    float _4132 = _4108;
    if (_4018)
    {
        _4124 = 1.0;
    }
    float _4134 = _4124;
    float _4136 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4138 = _4042 * _4136;
    float _4140 = _4134;
    if (!_4008)
    {
        float _4142 = _3698 * _3698;
        float _4144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4146 = -_2944;
        float _4148 = _4146 + _4106;
        float _4150 = -_2908;
        float _4152 = _4150 + _4104;
        float _4154 = fma(_3702, _3702, _4142);
        float _4156 = -_2910;
        float _4158 = _4156 + _4102;
        float _4160 = fma(_3706, _3706, _4154);
        float _4162 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4164 = sqrt(_4160);
        float _4166 = 1.0 / _3794;
        float _4168 = _4162 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4170 = precise::min(_4164, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4172 = _4170 * _4144;
        float _4174 = _4172 * _4166;
        float _4176 = _4168 * _4174;
        float _4178 = _4148 * _4174;
        float _4180 = fma(_4152, _4176, _3684);
        float _4182 = fma(_4158, _4176, _3688);
        float _4184 = fma(_4168, _4178, _3692);
        _4126 = _4180;
        _4128 = _4182;
        _4130 = _4184;
        _3762 = _4176;
    }
    float _4186 = _4126;
    float _4188 = _4128;
    float _4190 = _4130;
    float _4192 = _3762;
    float _4194 = _4192;
    if (!_4018)
    {
        float _4196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4198 = _4196 * 0.15915493667125701904296875;
        float _4200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4202 = _4198 * 6.283185482025146484375;
        float _4204 = cos(_4202);
        float _4206 = _4200 * 0.15915493667125701904296875;
        float _4208 = _4198 * 6.283185482025146484375;
        float _4210 = sin(_4208);
        float _4212 = 1.0 / _4204;
        float _4214 = _4206 * 6.283185482025146484375;
        float _4216 = cos(_4214);
        float _4218 = _4210 * _4212;
        float _4220 = _4206 * 6.283185482025146484375;
        float _4222 = sin(_4220);
        float _4224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4226 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4224;
        float _4228 = _4216 * _4218;
        float _4230 = 1.0 / _4226;
        float _4232 = 1.0 / _4228;
        float _4234 = _4222 * _4232;
        float _4236 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4238 = fma(_4138, _4234, _4236);
        float _4240 = _4238 * _4230;
        float _4242 = precise::clamp(_4240, 0.0, 1.0);
        _4194 = _4198;
        _4140 = _4242;
    }
    float _4244 = _4194;
    float _4246 = _4140;
    float _4248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4250 = _4186 + _4248;
    float _4252 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4254 = _4188 + _4252;
    float _4256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4258 = _4190 + _4256;
    float _4260 = _4250 * _4250;
    float _4262 = fma(_4254, _4254, _4260);
    float _4264 = fma(_4258, _4258, _4262);
    float _4266 = rsqrt(_4264);
    float _4268 = sqrt(_4264);
    float _4270 = _4266 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4272 = _4254 * _4270;
    float _4274 = _4258 * _4270;
    float _4276 = _4272 * _4272;
    float _4278 = _4274 * _4274;
    float _4280 = _4276 + _4278;
    float _4282 = sqrt(_4280);
    bool _4284 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4286 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4288 = _4282 + _4286;
    float _4290 = _4258;
    float _4292 = _4280;
    float _4294 = _4288;
    float _4296 = _4244;
    if (_4284)
    {
        float _4298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4290 = _4298;
    }
    float _4300 = _4290;
    if (_4284)
    {
        float _4302 = rsqrt(_4280);
        _4292 = _4302;
    }
    float _4304 = _4292;
    float _4306 = _4304;
    if (_4284)
    {
        float _4308 = _4288 * _4300;
        _4294 = _4308;
    }
    float _4310 = _4294;
    if (_4284)
    {
        float _4312 = _4310 * 0.15915493667125701904296875;
        _4296 = _4312;
    }
    float _4314 = _4296;
    float _4316 = _4300;
    float _4318 = _4314;
    if (_4284)
    {
        float _4320 = _4314 * 6.283185482025146484375;
        float _4322 = sin(_4320);
        _4316 = _4322;
    }
    float _4324 = _4316;
    float _4326 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4328 = precise::max(0.0, _4326);
    float _4330 = _4260;
    float _4332 = _4328;
    if (_4284)
    {
        float _4334 = _4314 * 6.283185482025146484375;
        float _4336 = cos(_4334);
        _4330 = _4336;
    }
    float _4338 = _4330;
    float _4340 = -_4270;
    float _4342 = -_4328;
    float _4344 = fma(_4250, _4340, _4342);
    float _4346 = _4344;
    if (_4284)
    {
        float _4348 = _4344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4332 = _4348;
    }
    float _4350 = _4332;
    float _4352 = fma(_3688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4354 = _4350;
    if (!_4284)
    {
        _3764 = _4278;
    }
    float _4356 = _3764;
    float _4358 = _4324;
    float _4360 = _4356;
    if (_4284)
    {
        float _4362 = fma(_4324, _4350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4358 = _4362;
    }
    float _4364 = _4358;
    float _4366 = floor(_4352);
    float _4368 = _4364;
    if (_4284)
    {
        float _4370 = _4338 + (-1.0);
        _4354 = _4370;
    }
    float _4372 = _4354;
    float _4374 = _4372;
    if (_4284)
    {
        float _4376 = _4304 * _4364;
        _4132 = _4376;
    }
    float _4378 = _4132;
    if (!_4284)
    {
        _4368 = _4272;
    }
    float _4380 = _4368;
    float _4382 = _4380;
    if (_4284)
    {
        float _4384 = _4372 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4318 = _4384;
    }
    float _4386 = _4318;
    if (_4284)
    {
        float _4388 = _4272 * _4378;
        _4382 = _4388;
    }
    float _4390 = _4382;
    if (!_4284)
    {
        _4374 = _4274;
    }
    float _4392 = _4374;
    float _4394 = _4392;
    if (_4284)
    {
        float _4396 = _4274 * _4378;
        _4394 = _4396;
    }
    float _4398 = _4394;
    if (!_4284)
    {
        _4306 = _4276;
    }
    float _4400 = _4306;
    float _4402 = _4400;
    if (_4284)
    {
        float _4404 = fma(_4344, _4338, _4386);
        _4346 = _4404;
    }
    float _4406 = _4346;
    if (_4284)
    {
        float _4408 = _4390 * _4390;
        _4402 = _4408;
    }
    float _4410 = _4402;
    if (_4284)
    {
        float _4412 = _4398 * _4398;
        _4360 = _4412;
    }
    float _4414 = _4360;
    float _4416 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4418 = fma(_4406, _4406, _4410);
    float _4420 = _4418 + _4414;
    float _4422 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4416);
    float _4424 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4426 = fma(_4268, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4424);
    float _4428 = precise::clamp(_4426, 0.0, 1.0);
    float _4430 = rsqrt(_4420);
    float _4432 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4422);
    float _4434 = -_4428;
    float _4436 = _4434 + 1.0;
    float _4438 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4440 = _4432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4442 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4444 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4446 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4448 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4450 = abs(_4436);
    float _4452 = log2(_4450);
    float _4454 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4444);
    float _4456 = -_4446;
    float _4458 = fma(_4456, _4438, 1.0);
    float _4460 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4462 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4448);
    float _4464 = _4430 * _4398;
    float _4466 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4454);
    float _4468 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4460);
    float _4470 = _4430 * _4390;
    float _4472 = _4430 * _4406;
    float _4474 = _4466 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4476 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4468);
    float _4478 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4480 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4462);
    float _4482 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4484 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4486 = -_4478;
    float _4488 = fma(_4472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4486);
    float _4490 = floor(_4442);
    float _4492 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4494 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4482);
    float _4496 = -_4464;
    float _4498 = fma(_4496, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4488);
    float _4500 = _4480 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4502 = _4472 + 1.0;
    float _4504 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4494);
    float _4506 = fma(_4498, -0.5, 0.5);
    float _4508 = log2(_4458);
    float _4510 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4512 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4504);
    float _4514 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4510);
    float _4516 = 1.0 / _4512;
    float _4518 = -_4366;
    float _4520 = _4352 + _4518;
    float _4522 = fma(_4498, 0.5, 0.5);
    float _4524 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4526 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4514);
    float _4528 = -_4490;
    float _4530 = _4442 + _4528;
    float _4532 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4524);
    float _4534 = exp2(_4492);
    float _4536 = fma(_4522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4538 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4526);
    float _4540 = sqrt(_4506);
    float _4542 = fma(_4522, _4536, -0.212114393711090087890625);
    float2 _11745 = float2(_4520, _4530);
    float _4544 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11745, float2(0.0), isnan(_11745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11745, float2(0.0), isnan(_11745)), level(0.0)).x;
    float _4546 = fma(_4522, _4542, 1.570728778839111328125);
    float _4548 = -_4472;
    float _4550 = fma(_4534, _4502, _4548);
    float _4552 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4532);
    float _4554 = _4538 * _4516;
    float _4556 = fma(_4550, 0.5, 0.5);
    float _4558 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4552);
    float _4560 = _4508 * 0.693147182464599609375;
    float _4562 = fma(_4554, 0.5, 0.5);
    float _4564 = _4540 * 0.636619746685028076171875;
    float _4566 = _4558 * _4516;
    float _4568 = _4560 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4570 = -_4546;
    float _4572 = fma(_4564, _4570, 1.0);
    float _4574 = fma(_4566, -0.5, 0.5);
    float3 _11803 = float3(_4562, _4574, _4568);
    float _4576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11803, float3(0.0), isnan(_11803)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11803, float3(0.0), isnan(_11803)), level(0.0)).x;
    float3 _11814 = float3(_4562, _4574, _4568);
    float4 _4579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11814, float3(0.0), isnan(_11814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11814, float3(0.0), isnan(_11814)), level(0.0)).xyzw;
    float _4581 = _4579.x;
    float _4583 = _4579.y;
    float _4585 = _4579.z;
    float _4587 = _4579.w;
    float2 _11830 = float2(_4572, _4556);
    float3 _4591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11830, float2(0.0), isnan(_11830)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11830, float2(0.0), isnan(_11830)), level(0.0)).xyz;
    float _4593 = _4591.x;
    float _4595 = _4591.y;
    float _4597 = _4591.z;
    float _4599 = abs(_4138);
    float _4601 = log2(_4599);
    float _4603 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4605 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4607 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4609 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4611 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4603);
    float _4613 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4605);
    float _4615 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4607);
    float _4617 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4619 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4621 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4623 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4625 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4627 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4629 = -_3808;
    float _4631 = fma(_4629, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4609);
    float _4633 = -_3808;
    float _4635 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4623);
    float _4637 = _4601 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4639 = -_3808;
    float _4641 = fma(_4639, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4617);
    float _4643 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4619);
    float _4645 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4621);
    float _4647 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4625);
    float _4649 = fma(_4627, _4627, 1.0);
    float _4651 = exp2(_4637);
    float _4653 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4641);
    float _4655 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4631);
    float _4657 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4635);
    float _4659 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4611);
    float _4661 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4613);
    float _4663 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4615);
    float _4665 = rsqrt(_4649);
    float _4667 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4669 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4671 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4643);
    float _4673 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4645);
    float _4675 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4647);
    float _4677 = _4627 * _4655;
    out.m_86.x = _4659;
    out.m_86.y = _4661;
    out.m_86.z = _4663;
    float _4679 = fma(_4651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4681 = precise::clamp(_4679, 0.0, 1.0);
    float _4683 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4685 = exp2(_4669);
    float _4687 = fma(_4667, _4659, _4677);
    bool _4689 = _4138 <= 8000.0;
    bool _4691 = isnan(_4138);
    bool _4693 = _4689 || _4691;
    bool _4695 = isnan(8000.0);
    bool _4697 = _4693 || _4695;
    float _4699 = float(_4697);
    float _4701 = fma(_4681, -2.0, 3.0);
    float _4703 = _4681 * _4681;
    float _4705 = _4627 * _4665;
    float _4707 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4683);
    bool _4709 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4711 = isnan(_4268);
    bool _4713 = _4709 || _4711;
    bool _4715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4717 = _4713 || _4715;
    float _4719 = _4703 * _4701;
    float _4721 = _4627 * _4657;
    float _4723 = _4627 * _4653;
    float _4725 = -_4671;
    float _4727 = _4705 * _4725;
    float _4729 = -_4719;
    float _4731 = _4729 + 1.0;
    float _4733 = fma(_4667, _4661, _4721);
    float _4735 = -_4675;
    float _4737 = _4705 * _4735;
    float _4739 = fma(_4731, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4719);
    float _4741 = -_4673;
    float _4743 = _4705 * _4741;
    float _4745 = fma(_4665, _4653, _4737);
    float _4747 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4707);
    float _4749 = in.m_88.x;
    float _4751 = fma(_4665, _4655, _4727);
    float _4753 = _4699 * _4739;
    float _4755 = fma(_4665, _4657, _4743);
    float _4757 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4747);
    float _4759 = _4512 * 0.5;
    float _4761 = -_4685;
    float _4763 = _4761 + 1.0;
    float _4765 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4767 = _4757 + _4512;
    float _4769 = _4538 + _4512;
    float _4771 = fma(_4558, -0.5, _4759);
    float _4773 = _4763 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4775 = _4767 * 0.5;
    float _4777 = _4769 * 0.5;
    out.gl_Position.x = _4538;
    out.gl_Position.y = _4558;
    out.gl_Position.z = _4757;
    out.gl_Position.w = _4512;
    float _4779 = fma(_4667, _4663, _4723);
    float _4781 = _4671 + _4687;
    float _4783 = _4673 + _4733;
    out.m_90.x = _4777;
    out.m_90.y = _4771;
    out.m_90.z = _4775;
    out.m_90.w = _4512;
    float _4785 = _4675 + _4779;
    out.m_92.x = _4751;
    out.m_92.y = _4755;
    out.m_92.z = _4745;
    out.m_94.x = _4781;
    out.m_94.y = _4783;
    out.m_94.z = _4785;
    float _4787 = -_4773;
    float _4789 = _4787 + 1.0;
    float _4791 = _4512;
    float _4793 = _4757;
    float _4795 = _4558;
    float _4797 = _4789;
    if (!_4717)
    {
        _4791 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4799 = _4791;
    float _4801 = _4799;
    float _4803 = _4799;
    if (!_4717)
    {
        _4793 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4805 = _4793;
    float _4807 = _4805;
    float _4809 = _4805;
    if (!_4717)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4811 = _4795;
    float _4813 = -_4544;
    float _4815 = _4813 + 1.0;
    float _4817 = _4815 * _4765;
    float _4819 = precise::clamp(_4817, 0.0, 1.0);
    float _4821 = -_4819;
    float _4823 = fma(_4821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4825 = _4823 * _4749;
    float _4827 = _4825 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4827;
    float _4829 = _4773 * _4576;
    float _4831 = _4587 * _4789;
    float _4833 = _4583;
    float _4835 = _4581;
    float _4837 = _4811;
    float _4839 = _4811;
    if (!_4717)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4841 = _4797;
    float _4843 = _4587 * _4829;
    float _4845 = _4597 * _4829;
    float _4847 = fma(_4593, _4843, _4581);
    float _4849 = fma(_4595, _4843, _4583);
    float _4851 = fma(_4587, _4845, _4585);
    float _4853 = _4246 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4855 = _4841;
    float _4857 = _4841;
    if (!_4717)
    {
        _4833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4859 = _4833;
    float _4861 = _4859;
    float _4863 = _4859;
    if (!_4717)
    {
        _4835 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4865 = _4835;
    out.m_98.x = _4847;
    out.m_98.y = _4849;
    out.m_98.z = _4851;
    out.m_98.w = _4831;
    bool _4867 = !_4717;
    float _4869 = _4865;
    float _4871 = _4865;
    if (!_4867)
    {
        bool _4873 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4875 = isnan(_4268);
        bool _4877 = _4873 || _4875;
        bool _4879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4881 = _4877 || _4879;
        if (!_4881)
        {
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4885 = _4268 + _4883;
            float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4889 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4887;
            float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4895 = 1.0 / _4889;
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4903 = _4901 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4905 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4907 = _4905 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4909 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4913 = _4885 * _4895;
            float _4915 = precise::clamp(_4913, 0.0, 1.0);
            float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4919 = _4917 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4921 = fma(_4915, _4893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4923 = fma(_4915, _4919, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4925 = fma(_4915, _4899, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4927 = fma(_4915, _4903, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4929 = fma(_4915, _4907, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4931 = fma(_4915, _4911, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4871 = _4925;
            _4839 = _4929;
            _4863 = _4921;
            _4809 = _4927;
            _4803 = _4923;
            _4857 = _4931;
            _4933 = true;
        }
        else
        {
            bool _4935 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4937 = isnan(_4268);
            bool _4939 = _4935 || _4937;
            bool _4941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4943 = _4939 || _4941;
            if (!_4943)
            {
                _4861 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4945 = _4861;
            _4863 = _4945;
            if (!_4943)
            {
                _4869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4947 = _4869;
            _4871 = _4947;
            if (!_4943)
            {
                _4801 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4949 = _4801;
            _4803 = _4949;
            if (!_4943)
            {
                _4807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4951 = _4807;
            _4809 = _4951;
            if (!_4943)
            {
                _4837 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4953 = _4837;
            _4839 = _4953;
            if (!_4943)
            {
                _4855 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4955 = _4855;
            bool _4957 = !_4943;
            _4857 = _4955;
            if (!_4957)
            {
                bool _4959 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4961 = isnan(_4268);
                bool _4963 = _4959 || _4961;
                bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4967 = _4963 || _4965;
                if (!_4967)
                {
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4971 = _4268 + _4969;
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4975 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4973;
                    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4981 = 1.0 / _4975;
                    float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4991 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4999 = _4971 * _4981;
                    float _5001 = precise::clamp(_4999, 0.0, 1.0);
                    float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5005 = _5003 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5007 = fma(_5001, _4979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5009 = fma(_5001, _5005, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5011 = fma(_5001, _4985, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5013 = fma(_5001, _4989, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5015 = fma(_5001, _4993, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5017 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4871 = _5011;
                    _4839 = _5015;
                    _4863 = _5007;
                    _4809 = _5013;
                    _4803 = _5009;
                    _4857 = _5017;
                    _4933 = true;
                }
                else
                {
                    _4871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4839 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4863 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4803 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4857 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4933 = false;
    float _5019 = _4871;
    float _5021 = _4839;
    float _5023 = _4863;
    float _5025 = _4809;
    float _5027 = _4803;
    float _5029 = _4857;
    float _5031 = _4853 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5033 = fma(_4783, -0.5, 0.5);
    float _5035 = precise::clamp(_5033, 0.0, 1.0);
    float _5037 = -_5019;
    float _5039 = _5037 + _5021;
    float _5041 = -_5023;
    float _5043 = _5041 + _5025;
    out.m_100.x = 0.0;
    float _5045 = fma(_5035, _5039, _5019);
    float _5047 = -_5027;
    float _5049 = _5047 + _5029;
    float _5051 = fma(_5035, _5043, _5023);
    float _5053 = _5045 * 0.586610972881317138671875;
    bool _5055 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5057 = fma(_5035, _5049, _5027);
    out.m_53.x = _5031;
    float _5059 = fma(_5051, 0.298911988735198974609375, _5053);
    bool _5061 = _4246 > 0.0;
    bool _5063 = isnan(_4246);
    bool _5065 = _5061 || _5063;
    bool _5067 = isnan(0.0);
    bool _5069 = _5065 || _5067;
    float _5071 = fma(_5057, 0.114477999508380889892578125, _5059);
    float _5073 = -_5071;
    float _5075 = _5051 + _5073;
    float _5077 = -_5071;
    float _5079 = _5045 + _5077;
    float _5081 = -_5071;
    float _5083 = _5057 + _5081;
    float _5085 = fma(_5075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    float _5087 = fma(_5079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    float _5089 = fma(_5083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    bool _5091 = !_5055;
    if (!_5091)
    {
        float _5093 = -_4186;
        float _5095 = _5093 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5097 = -_4188;
        float _5099 = _5097 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5101 = -_4190;
        float _5103 = _5101 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5105 = _5095 * _5095;
        float _5107 = fma(_5099, _5099, _5105);
        float _5109 = fma(_5103, _5103, _5107);
        float _5111 = sqrt(_5109);
        float _5113 = rsqrt(_5109);
        float _5115 = -_5111;
        float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5119 = _5117 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5121 = precise::clamp(_5119, 0.0, 1.0);
        float _5123 = _5099 * _5113;
        float _5125 = _5095 * _5113;
        float _5127 = abs(_5121);
        float _5129 = log2(_5127);
        float _5131 = _5103 * _5113;
        float _5133 = _5123 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5135 = _4783 * _5125;
        float _5137 = -_5125;
        float _5139 = -_5133;
        float _5141 = fma(_5137, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5139);
        float _5143 = fma(_4781, _5123, _5135);
        float _5145 = -_5131;
        float _5147 = fma(_5145, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5141);
        float _5149 = fma(_4785, _5131, _5143);
        float _5151 = precise::clamp(_5149, 0.0, 1.0);
        float _5153 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5155 = _5147 + _5153;
        float _5157 = _5129 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5159 = _5155 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5161 = precise::clamp(_5159, 0.0, 1.0);
        float _5163 = exp2(_5157);
        float _5165 = _5163 * _5161;
        float _5167 = _5151 * _5165;
        float _5169 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5171 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5173 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5169;
        out.m_100.y = _5171;
        out.m_100.z = _5173;
    }
    out.m_102.x = _5085;
    out.m_102.y = _5087;
    out.m_102.z = _5089;
    if (_5069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5175 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5175;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4933 = false;
    bool _677 = false;
    bool _495 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5243 = as_type<float>(_145);
        out.gl_Position.z = _5243;
    }
    if (!_131)
    {
        return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5306 = as_type<float>(_177);
        out.gl_Position.z = _5306;
    }
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_211;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _183 * _189;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _219);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    bool _229 = !_207;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_181, _199, _225);
    float _235 = fma(_185, _191, _223);
    float _237 = fma(_185, _197, _227);
    float _239 = fma(_185, _203, _233);
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = 1.0 / _279;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _297 = 1.0 / _287;
    float _299 = 1.0 / _283;
    float _301 = _271 * _293;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _263 + _303;
    float _307 = 1.0 / _291;
    float _309 = _267 * _297;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_321;
    float _325 = _323 + 1.0;
    float _327 = _275 * _299;
    bool _329 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_263);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_263);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _339 * _325;
    bool _355 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_263);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _305 * _307;
    float _369 = -_339;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    bool _381 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_263);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = _351 * _371;
    float _395 = -_351;
    float _397 = _395 + 1.0;
    float _399 = fma(_375, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_379, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = _365 * _397;
    float _409 = -_365;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = -_391;
    float _419 = _417 + 1.0;
    float _421 = fma(_405, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = _391 * _411;
    float _425 = fma(_415, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    float _435 = _399 * _423;
    float _437 = _401 * _423;
    float _439 = fma(_429, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_433, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _435);
    float _445 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _437);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _455 = fma(_421, _407, _443);
    float _457 = fma(_425, _407, _445);
    float _459 = fma(_449, _367, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _461 = fma(_453, _367, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _463 = fma(_439, _393, _455);
    float _465 = fma(_441, _393, _457);
    float _467 = fma(_459, _353, _463);
    float _469 = fma(_461, _353, _465);
    float _471 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[147].x, _467);
    float _473 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[147].y, _469);
    bool _475 = !_295;
    float _493;
    if (!_475)
    {
        float _477 = in.m_66.x;
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _481 = _477 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        _493 = _171;
    }
    _495 = false;
    float _497 = _493;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _497 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _511 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_497);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _527 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _529 = isnan(_497);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = 1.0 / _505;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _541;
    float _545 = -_521;
    float _547 = _545 + 1.0;
    bool _549 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _551 = isnan(_497);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _563 = 1.0 / _509;
    float _565 = 1.0 / _525;
    float _567 = _543 * _539;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = _537 * _547;
    float _575 = -_537;
    float _577 = _575 + 1.0;
    float _579 = fma(_567, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _581;
    float _585 = _559 * _577;
    float _587 = _571 * _563;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _591 = _497 + _589;
    bool _593 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = isnan(_497);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _579 * _585;
    float _607 = -_559;
    float _609 = _607 + 1.0;
    float _611 = fma(_587, _591, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _615 = _497 + _613;
    float _617 = _583 * _565;
    float _619 = -_603;
    float _621 = _619 + 1.0;
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _605);
    float _625 = fma(_617, _615, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _627 = _521 * _621;
    float _629 = fma(_611, _573, _623);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _633 = fma(_625, _627, _629);
    float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[118].x, _633);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _641 = in.m_68.x;
    float _643 = in.m_68.y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _635;
    out.m_70.y = _649;
    out.m_70.z = _651;
    out.m_70.w = _647;
    float _653 = _473 * _643;
    float _655 = _471 * _641;
    bool _657 = !_561;
    float _675;
    if (!_657)
    {
        float _659 = in.m_66.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _171;
    }
    _677 = false;
    float _679 = _675;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _683 = _679 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _689 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _691 = isnan(_679);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _707 = isnan(_679);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _717;
    bool _721 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _723 = isnan(_679);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = 1.0 / _687;
    float _735 = -_699;
    float _737 = _735 + 1.0;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _741 = 1.0 / _703;
    float _743 = _719 * _733;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _749 = -_731;
    float _751 = _749 + 1.0;
    float _753 = fma(_743, _683, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _755 = _715 * _737;
    float _757 = -_715;
    float _759 = _757 + 1.0;
    float _761 = _699 * _751;
    float _763 = _747 * _741;
    float _765 = _753 * _755;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _769 = _679 + _767;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[131].x, _765);
    float _773 = fma(_763, _769, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _777 = fma(_773, _761, _771);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _785 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[133].x, _777);
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _785 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _781;
    out.m_72.y = _787;
    out.m_72.z = _789;
    out.m_72.w = _791;
    bool _793 = !_739;
    float _795 = _789;
    float _797 = _791;
    if (!_793)
    {
        float _799 = in.m_66.x;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _803 = _799 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _173 = _813;
    }
    float _815 = _173;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _819 = int(_817);
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _823 = _821 != 0;
    float _825 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _827 = int(_825);
    float _829 = float(_819);
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _833 = int(_831);
    if (_823)
    {
        _795 = 1.0;
    }
    float _835 = _795;
    float _837 = _835;
    if (_823)
    {
        _797 = 1.0;
    }
    float _839 = _797;
    int _841 = 0;
    float _843 = _839;
    if (_823)
    {
        _841 = 0;
    }
    int _845 = _841;
    float _847 = float(_827);
    float _849 = 1.0 / _829;
    float _851 = 1.0 / _847;
    float _853 = float(uint(_833));
    int _855 = ~_833;
    int _857 = _855 + 1;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _861 = int(_859);
    float _863 = _849 * _127;
    float _865 = _849;
    float _867 = _847;
    int _869 = _845;
    if (_823)
    {
        float _871 = in.m_66.x;
        float _873 = in.m_66.y;
        _865 = _871;
        _867 = _873;
    }
    float _875 = _865;
    float _877 = _867;
    float _879 = _851 * _127;
    float _881 = 1.0 / _853;
    float _883 = float(uint(_861));
    float _885 = trunc(_863);
    int _887 = int(_885);
    float _889 = 1.0 / _883;
    int _891 = as_type<int>(_881) + (-2);
    float _893 = 0.0;
    float _895 = _875;
    float _897 = _877;
    if (_823)
    {
        _893 = _877;
    }
    float _899 = _893;
    float _901 = trunc(_879);
    int _903 = int(_901);
    float _905 = float(uint(_887));
    float _907 = as_type<float>(_891) * _905;
    float _909 = _905;
    float _911 = _899;
    if (_823)
    {
        _909 = _875;
    }
    float _913 = _909;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _917 = int(_915);
    int _919 = as_type<int>(_889) + (-2);
    float _921 = 0.0;
    float _923 = _913;
    if (_823)
    {
        _921 = _913;
    }
    float _925 = _921;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _929 = int(_927);
    float _931 = float(uint(_903));
    float _933 = as_type<float>(_919) * _931;
    int _935 = as_type<int>(_931);
    float _937 = _925;
    if (_823)
    {
        _935 = 0;
    }
    int _939 = _935;
    float _941 = trunc(_907);
    float _943 = precise::max(_941, 0.0);
    uint _946 = uint(_943);
    float _948 = float(uint(_917));
    float _950 = 1.0 / _948;
    float _952 = float(_929);
    float _954 = trunc(_933);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = 1.0 / _952;
    float _962 = _952;
    int _964 = _939;
    if (_823)
    {
        _962 = _913;
    }
    float _966 = _962;
    float _968 = _966;
    if (!_823)
    {
        float _970 = in.m_66.x;
        float _972 = in.m_66.y;
        float _974 = in.m_66.z;
        float _976 = _970 * 3.1415927410125732421875;
        float _978 = _976 * 0.15915493667125701904296875;
        float _980 = _972 * 3.1415927410125732421875;
        float _982 = _980 * 0.15915493667125701904296875;
        float _984 = _978 * 6.283185482025146484375;
        float _986 = sin(_984);
        float _988 = _982 * 6.283185482025146484375;
        float _990 = sin(_988);
        _837 = 7.345489978790283203125;
        _895 = _970;
        _843 = 5.839270114898681640625;
        _968 = _974;
        _923 = _972;
        _897 = _972;
        _964 = 1;
        _937 = _986;
        _911 = _990;
        _869 = 2;
    }
    float _992 = _837;
    float _994 = _895;
    float _996 = _843;
    float _998 = _968;
    float _1000 = _923;
    float _1002 = _897;
    int _1004 = _964;
    float _1006 = _937;
    float _1008 = _911;
    int _1010 = _869;
    int _1012 = _857 * int(_946);
    int _1014 = _1012 + _887;
    float _1016 = in.m_66.z;
    float _1018 = in.m_66.w;
    int _1020 = ~_861;
    int _1022 = _1020 + 1;
    float _1024 = _992 * _994;
    float _1026 = _996 * _998;
    float _1028 = float(uint(_1014));
    float _1030 = _992 * _1000;
    int _1032 = _1022 * int(_958);
    int _1034 = _1032 + _903;
    float _1036 = floor(_1024);
    int _1038 = as_type<int>(_950) + (-2);
    float _1040 = as_type<float>(_891) * _1028;
    float _1042 = _960 * _127;
    float _1044 = float(uint(_1034));
    float _1046 = in.m_60.w;
    float _1048 = float(_833);
    float _1050 = floor(_1026);
    float _1052 = as_type<float>(_919) * _1044;
    float _1054 = float(_887);
    bool _1056 = _1002 > 0.5;
    bool _1058 = _1054 >= _1048;
    bool _1060 = isnan(_1054);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(_1048);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = trunc(_1042);
    int _1072 = int(_1070);
    bool _1074 = _1018 > 0.5;
    float _1076 = -_1036;
    float _1078 = _1024 + _1076;
    bool _1080 = _1016 > 0.5;
    float _1082 = _1078 * _1048;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1086 = _1084 != 0;
    float _1088 = trunc(_1052);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = -_1050;
    float _1096 = _1026 + _1094;
    int _1098 = ~_861;
    int _1100 = _1098 + 1;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1112 = _1110 != 0;
    float _1114 = -_217;
    int _1116 = _1080 ? as_type<int>(_1114) : as_type<int>(_217);
    float _1118 = trunc(_1040);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = float(uint(_1072));
    int _1126 = int(_1074);
    int _1128 = _1080 ? 2 : 0;
    int _1130 = _1126 | _1128;
    int _1132 = _1086 ? 4 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1104 ? 8 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1108 ? 16 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1112 ? 32 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = _1056 ? 64 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = _1150 & 64;
    float _1154 = as_type<float>(_1038) * _1124;
    float _1156 = -_231;
    int _1158 = _1056 ? as_type<int>(_1156) : as_type<int>(_231);
    float _1160 = trunc(_1068);
    int _1162 = int(_1160);
    int _1164 = int(_958) + int(_1092);
    bool _1166 = !_1112;
    float _1168 = _1166 ? _217 : as_type<float>(_1116);
    float _1170 = float(_861);
    bool _1172 = !_1086;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = trunc(_1154);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = !_1108;
    float _1184 = _1182 ? _231 : as_type<float>(_1158);
    int _1186 = int(_946) + int(_1122);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1198 = _1196 != 0;
    int _1200 = _1100 * _1164;
    int _1202 = _1200 + _903;
    int _1204 = ~_833;
    int _1206 = _1204 + 1;
    float _1208 = floor(_1030);
    float _1210 = float(_903);
    bool _1212 = !_1194;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = _1206 * _1186;
    int _1218 = _1216 + _887;
    bool _1220 = uint(_1202) >= uint(_861);
    float _1222 = _1096 * _1170;
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1230 = log2(_1228);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    bool _1236 = uint(_1218) >= uint(_833);
    bool _1238 = _1210 >= _1170;
    bool _1240 = isnan(_1210);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(_1170);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    bool _1250 = !_1198;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1222);
    int _1256 = int(_1254);
    bool _1258 = !_1234;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = -_1208;
    float _1264 = _1030 + _1262;
    bool _1266 = !_1220;
    int _1268 = _1266 ? 0 : (-1);
    bool _1270 = !_1236;
    int _1272 = _1270 ? 0 : (-1);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1284 = _1282 != 0;
    float _1286 = trunc(_1082);
    int _1288 = int(_1286);
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1292 = _1290 != 0;
    int _1294 = ~_917;
    int _1296 = _1294 + 1;
    int _1298 = ~_1164;
    int _1300 = _1298 + _1268;
    int _1302 = _1300 + 1;
    int _1304 = ~_1186;
    int _1306 = _1304 + _1272;
    int _1308 = _1306 + 1;
    float _1310 = trunc(_1248);
    int _1312 = int(_1310);
    int _1314 = abs(_1174);
    int _1316 = _1296 * int(_1180);
    int _1318 = _1316 + _1072;
    bool _1320 = !_1292;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _861 * _1302;
    int _1326 = _1324 + _903;
    bool _1328 = _833 == 0;
    int _1330 = abs(_1322);
    int _1332 = _1288 * _1314;
    int _1334 = _1332 + _887;
    float _1336 = float(uint(_1318));
    int _1338 = _833 * _1308;
    int _1340 = _1338 + _887;
    bool _1342 = !_1280;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _1256 * _1330;
    int _1348 = _1346 + _903;
    float _1350 = _167 * _127;
    bool _1352 = !_1276;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = _1152 != 0;
    float _1358 = _1048 * _1350;
    bool _1360 = _861 == 0;
    float _1362 = as_type<float>(_1038) * _1336;
    int _1364 = ~_1162;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = _1170 * _1350;
    bool _1372 = !_1328;
    int _1374 = _1372 ? _1340 : (-1);
    float _1376 = trunc(_1358);
    int _1378 = int(_1376);
    int _1380 = ~_1312;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    bool _1386 = !_1360;
    int _1388 = _1386 ? _1326 : (-1);
    int _1390 = _1374 * _1368;
    int _1392 = _833 + (-1);
    int _1394 = _861 + (-1);
    float _1396 = trunc(_1362);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    int _1402 = _1388 * _1384;
    int _1404 = abs(_1344);
    int _1406 = _1162 * _1392;
    int _1408 = _1406 + _1390;
    int _1410 = abs(_1214);
    int _1412 = _1312 * _1394;
    int _1414 = _1412 + _1402;
    int _1416 = abs(_1226);
    int _1418 = _1408 * _1410;
    float _1420 = trunc(_1370);
    int _1422 = int(_1420);
    int _1424 = ~_917;
    int _1426 = _1424 + 1;
    int _1428 = _1414 * _1404;
    int _1430 = abs(_1252);
    int _1432 = _1378 * _1416;
    int _1434 = _1432 + _1418;
    int _1436 = abs(_1260);
    int _1438 = int(_1180) + int(_1400);
    int _1440 = _1334 * _1430;
    int _1442 = _1440 + _1434;
    int _1444 = abs(_1354);
    int _1446 = _1426 * _1438;
    int _1448 = _1446 + _1072;
    float _1450 = -_217;
    int _1452 = _1074 ? as_type<int>(_1450) : as_type<int>(_217);
    int _1454 = _1288 * _1436;
    int _1456 = _1454 + _1442;
    bool _1458 = !_1284;
    int _1460 = _1458 ? 0 : 1;
    int _1462 = _1422 * _1444;
    int _1464 = _1462 + _1428;
    bool _1466 = uint(_1448) >= uint(_917);
    float _1468 = float(uint(_1456));
    float _1470 = float(_917);
    float _1472 = -_231;
    int _1474 = _1080 ? as_type<int>(_1472) : as_type<int>(_231);
    float _1476 = float(_1072);
    float _1478 = _1470 * _1350;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1482 = _1480 != 0;
    float _1484 = _1264 * _1470;
    int _1486 = abs(_1460);
    float _1488 = as_type<float>(_891) * _1468;
    bool _1490 = _1476 >= _1470;
    bool _1492 = isnan(_1476);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(_1470);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = trunc(_1478);
    int _1504 = int(_1502);
    bool _1506 = !_1482;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = _1348 * _1486;
    int _1512 = _1510 + _1464;
    bool _1514 = !_1104;
    float _1516 = _1514 ? _217 : as_type<float>(_1452);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1520 = _1518 != 0;
    int _1522 = abs(_1508);
    float _1524 = trunc(_1488);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    bool _1530 = !_1466;
    int _1532 = _1530 ? 0 : (-1);
    bool _1534 = !_1520;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1552 = _1550 != 0;
    int _1554 = ~_1438;
    int _1556 = _1554 + _1532;
    int _1558 = _1556 + 1;
    float _1560 = trunc(_1500);
    int _1562 = int(_1560);
    bool _1564 = !_1544;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1570 = _1568 != 0;
    int _1572 = _1256 * _1522;
    int _1574 = _1572 + _1512;
    int _1576 = ~_833;
    int _1578 = _1576 + 1;
    int _1580 = _917 * _1558;
    int _1582 = _1580 + _1072;
    bool _1584 = !_1540;
    int _1586 = _1584 ? 0 : 1;
    float _1588 = trunc(_1484);
    int _1590 = int(_1588);
    float _1592 = float(uint(_1574));
    int _1594 = _1578 * int(_1528);
    int _1596 = _1594 + _1456;
    bool _1598 = _917 == 0;
    int _1600 = abs(_1566);
    float _1602 = as_type<float>(_919) * _1592;
    float _1604 = float(uint(_1596));
    float _1606 = _1592;
    float _1608 = as_type<float>(_1528);
    float _1610 = _1362;
    float _1612 = as_type<float>(_1010);
    if (_1570)
    {
        float _1614 = in.m_66.w;
        _1606 = _1614;
    }
    float _1616 = _1606;
    int _1618 = ~_1562;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    float _1624 = trunc(_1602);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    bool _1630 = !_1598;
    int _1632 = _1630 ? _1582 : (-1);
    float _1634 = as_type<float>(_891) * _1604;
    int _1636 = abs(_1536);
    int _1638 = abs(_1586);
    int _1640 = _1632 * _1622;
    int _1642 = _917 + (-1);
    float _1644 = trunc(_1634);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = _1590 * _1636;
    int _1652 = _1650 + _1072;
    bool _1654 = !_1548;
    int _1656 = _1654 ? 0 : 1;
    int _1658 = _1562 * _1642;
    int _1660 = _1658 + _1640;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1664 = _1662 != 0;
    int _1666 = _1660 * _1600;
    int _1668 = ~_861;
    int _1670 = _1668 + 1;
    int _1672 = ~_833;
    int _1674 = _1672 + 1;
    int _1676 = _1504 * _1638;
    int _1678 = _1676 + _1666;
    int _1680 = abs(_1656);
    int _1682 = _1670 * int(_1628);
    int _1684 = _1682 + _1574;
    float _1686 = as_type<float>(_1666);
    if (_1570)
    {
        float _1688 = _1616 * 3.1415927410125732421875;
        _1686 = _1688;
    }
    float _1690 = _1686;
    int _1692 = int(_1528) + int(_1648);
    int _1694 = _1652 * _1680;
    int _1696 = _1694 + _1678;
    float _1698 = float(uint(_1684));
    if (_1570)
    {
        float _1700 = _1690 * 0.15915493667125701904296875;
        _1608 = _1700;
    }
    float _1702 = _1608;
    bool _1704 = !_1552;
    int _1706 = _1704 ? 0 : 1;
    int _1708 = _1674 * _1692;
    int _1710 = _1708 + _1456;
    float _1712 = _1616;
    if (_1664)
    {
        float _1714 = in.m_66.x;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = as_type<float>(_919) * _1698;
    int _1720 = abs(_1706);
    float _1722 = _1702;
    if (_1570)
    {
        float _1724 = _1702 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        _1722 = _1726;
    }
    float _1728 = _1722;
    bool _1730 = uint(_1710) >= uint(_833);
    bool _1732 = !_1730;
    int _1734 = _1732 ? 0 : (-1);
    float _1736 = float(uint(_1334));
    float _1738 = trunc(_1718);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1746 = _1744 != 0;
    int _1748 = _1590 * _1720;
    int _1750 = _1748 + _1696;
    int _1752 = ~_1692;
    int _1754 = _1752 + _1734;
    int _1756 = _1754 + 1;
    float _1758 = as_type<float>(_891) * _1736;
    bool _1760 = !_1746;
    float _1762 = _1760 ? _231 : as_type<float>(_1474);
    float _1764 = float(uint(_1750));
    int _1766 = _833 * _1756;
    int _1768 = _1766 + _1456;
    bool _1770 = _833 == 0;
    float _1772 = trunc(_1758);
    float _1774 = precise::max(_1772, 0.0);
    uint _1776 = uint(_1774);
    bool _1778 = _1746;
    float _1780 = _1764;
    if (_1570)
    {
        bool _1782 = _1728 > 0.5;
        _1778 = _1782;
    }
    bool _1784 = _1778;
    bool _1786 = !_1770;
    int _1788 = _1786 ? _1768 : (-1);
    float _1790 = 0.0;
    if (!_1570)
    {
        _1790 = _231;
    }
    float _1792 = _1790;
    int _1794 = int(_1628) + int(_1742);
    float _1796 = as_type<float>(_1038) * _1764;
    int _1798 = ~_833;
    int _1800 = _1798 + 1;
    float _1802 = _1792;
    if (_1664)
    {
        float _1804 = _1716 * 3.1415927410125732421875;
        _1780 = _1804;
    }
    float _1806 = _1780;
    float _1808 = _1806;
    if (_1570)
    {
        float _1810 = -_231;
        float _1812 = _1784 ? _1810 : _231;
        _1802 = _1812;
    }
    float _1814 = _1802;
    float _1816 = trunc(_1796);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = _1788 & 3;
    bool _1824 = _1822 != 0;
    if (_1664)
    {
        float _1826 = _1806 * 0.15915493667125701904296875;
        _1808 = _1826;
    }
    float _1828 = _1808;
    int _1830 = _1788 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = _1824 ? 0 : 1;
    float _1836 = _1828;
    if (_1664)
    {
        float _1838 = _1828 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        _1836 = _1840;
    }
    float _1842 = _1836;
    bool _1844 = uint(_1830) > 1u;
    int _1846 = _1800 * int(_1776);
    int _1848 = _1846 + _1334;
    float _1850 = float(uint(_1348));
    int _1852 = ~_917;
    int _1854 = _1852 + 1;
    int _1856 = ~_861;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_919) * _1850;
    float _1862 = float(uint(_1848));
    int _1864 = _1854 * int(_1820);
    int _1866 = _1864 + _1750;
    int _1868 = ~_1834;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = ~_861;
    int _1876 = _1874 + 1;
    float _1878 = as_type<float>(_891) * _1862;
    int _1880 = _1872;
    if (!_1844)
    {
        int _1882 = ~_1834;
        int _1884 = _1882 + 1;
        _1880 = _1884;
    }
    int _1886 = _1880;
    int _1888 = _1858 * _1794;
    int _1890 = _1888 + _1574;
    float _1892 = -_217;
    int _1894 = _1356 ? as_type<int>(_1892) : as_type<int>(_217);
    float _1896 = trunc(_1860);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    float _1902 = float(uint(_1866));
    bool _1904 = uint(_1830) >= 2u;
    bool _1906 = uint(_1890) >= uint(_861);
    float _1908 = as_type<float>(_1038) * _1902;
    int _1910 = _1904 ? 0 : 1;
    float _1912 = trunc(_1878);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    bool _1918 = _1830 != 3;
    bool _1920 = !_1906;
    int _1922 = _1920 ? 0 : (-1);
    bool _1924 = _1918;
    if (!_1664)
    {
        _1610 = _217;
    }
    float _1926 = _1610;
    int _1928 = ~_1794;
    int _1930 = _1928 + _1922;
    int _1932 = _1930 + 1;
    float _1934 = trunc(_1908);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    int _1940 = _1876 * int(_1900);
    int _1942 = _1940 + _1348;
    int _1944 = ~_1910;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    int _1950 = _861 * _1932;
    int _1952 = _1950 + _1574;
    int _1954 = _1948;
    float _1956 = _1926;
    float _1958 = 2.8025969286496341418474591665798e-45;
    if (_1918)
    {
        int _1960 = ~_1910;
        int _1962 = _1960 + 1;
        _1954 = _1962;
    }
    int _1964 = _1954;
    if (_1664)
    {
        bool _1966 = _1842 > 0.5;
        _1924 = _1966;
    }
    bool _1968 = _1924;
    bool _1970 = !_1360;
    int _1972 = _1970 ? _1952 : (-1);
    float _1974 = float(uint(_1942));
    int _1976 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1978 = _1976 != 0;
    if (_1664)
    {
        float _1980 = -_217;
        float _1982 = _1968 ? _1980 : _217;
        _1956 = _1982;
    }
    float _1984 = _1956;
    float _1986 = as_type<float>(_919) * _1974;
    int _1988 = _1972 & 3;
    bool _1990 = _1988 != 0;
    int _1992 = int(_1820) + int(_1938);
    bool _1994 = !_1978;
    float _1996 = _1994 ? _217 : as_type<float>(_1894);
    float _1998 = trunc(_1986);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    int _2004 = int(_1776) + int(_1916);
    bool _2006 = uint(_1988) > 1u;
    int _2008 = ~_917;
    int _2010 = _2008 + 1;
    int _2012 = _1972 & 3;
    bool _2014 = _2012 != 0;
    int _2016 = ~_833;
    int _2018 = _2016 + 1;
    int _2020 = _2010 * _1992;
    int _2022 = _2020 + _1750;
    int _2024 = _2014 ? 0 : 1;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2028 = _2026 != 0;
    int _2030 = _2018 * _2004;
    int _2032 = _2030 + _1334;
    float _2034 = float(uint(_1652));
    bool _2036 = !_2028;
    int _2038 = _2036 ? 0 : 1;
    bool _2040 = uint(_2022) >= uint(_917);
    float _2042 = as_type<float>(_1038) * _2034;
    int _2044 = ~_2024;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    int _2050 = _2048;
    if (!_2006)
    {
        int _2052 = ~_2024;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    float _2058 = trunc(_2042);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    bool _2064 = uint(_2032) >= uint(_833);
    bool _2066 = !_2040;
    int _2068 = _2066 ? 0 : (-1);
    bool _2070 = _1988 != 3;
    bool _2072 = !_2064;
    int _2074 = _2072 ? 0 : (-1);
    bool _2076 = uint(_1988) >= 2u;
    int _2078 = ~_1992;
    int _2080 = _2078 + _2068;
    int _2082 = _2080 + 1;
    int _2084 = ~_861;
    int _2086 = _2084 + 1;
    int _2088 = int(_1900) + int(_2002);
    int _2090 = _917 * _2082;
    int _2092 = _2090 + _1750;
    int _2094 = ~_917;
    int _2096 = _2094 + 1;
    int _2098 = _2076 ? 0 : 1;
    int _2100 = _2086 * _2088;
    int _2102 = _2100 + _1348;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2106 = _2104 != 0;
    int _2108 = ~_2098;
    int _2110 = _2108 + 1;
    int _2112 = _2110 + 1;
    int _2114 = _2112;
    float _2116 = as_type<float>(_2096);
    if (_2070)
    {
        int _2118 = ~_2098;
        int _2120 = _2118 + 1;
        _2114 = _2120;
    }
    int _2122 = _2114;
    int _2124 = _2096 * int(_2062);
    int _2126 = _2124 + _1652;
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2130 = _2128 != 0;
    bool _2132 = !_2106;
    int _2134 = _2132 ? 0 : 1;
    bool _2136 = uint(_2102) >= uint(_861);
    bool _2138 = !_1598;
    int _2140 = _2138 ? _2092 : (-1);
    bool _2142 = !_2130;
    int _2144 = _2142 ? 0 : 1;
    bool _2146 = !_2136;
    int _2148 = _2146 ? 0 : (-1);
    int _2150 = _2140 & 3;
    bool _2152 = _2150 != 0;
    int _2154 = _2140 & 3;
    bool _2156 = _2154 != 0;
    float _2158 = float(uint(_2126));
    int _2160 = _2152 ? 0 : 1;
    bool _2162 = uint(_2154) > 1u;
    float _2164 = as_type<float>(_1038) * _2158;
    int _2166 = ~_2160;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    float _2172 = trunc(_2164);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2184 = _2170;
    if (!_2162)
    {
        int _2186 = ~_2160;
        int _2188 = _2186 + 1;
        _2184 = _2188;
    }
    int _2190 = _2184;
    bool _2192 = uint(_2154) >= 2u;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2196 = ~_917;
    int _2198 = _2196 + 1;
    int _2200 = _2192 ? 0 : 1;
    bool _2202 = _2154 != 3;
    int _2204 = int(_2062) + int(_2176);
    int _2206 = ~_2200;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = _2198 * _2204;
    int _2214 = _2212 + _1652;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2218 = _2210;
    if (_2202)
    {
        int _2220 = ~_2200;
        int _2222 = _2220 + 1;
        _2218 = _2222;
    }
    int _2224 = _2218;
    bool _2226 = uint(_2214) >= uint(_917);
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2230 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2216);
    bool _2232 = !_2226;
    int _2234 = _2232 ? 0 : (-1);
    bool _2236 = _994 > 0.5;
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2242 = -_231;
    int _2244 = _2236 ? as_type<int>(_2242) : as_type<int>(_231);
    bool _2246 = _1004 != 1;
    float _2248 = 1.0 / _2240;
    float _2250 = in.m_46.x;
    float _2252 = in.m_46.y;
    float _2254 = in.m_46.z;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2260 = abs(_2056);
    int _2262 = abs(_2122);
    float _2264 = 1.0 / _2258;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2270 = ~_2004;
    int _2272 = _2270 + _2074;
    int _2274 = _2272 + 1;
    float _2276 = 0.0;
    int _2278 = _2260;
    if (!_2246)
    {
        _2276 = _1002;
    }
    float _2280 = _2276;
    float _2282 = _2280;
    if (_2246)
    {
        _2282 = _994;
    }
    float _2284 = _2282;
    int _2286 = _833 * _2274;
    int _2288 = _2286 + _1334;
    float _2290 = 0.0;
    if (!_2246)
    {
        _2290 = _1002;
    }
    float _2292 = _2290;
    float _2294 = 1.0 / _2268;
    float _2296 = _2292;
    if (!_2246)
    {
        _2116 = _1016;
    }
    float _2298 = _2116;
    float _2300 = 0.0;
    float _2302 = _2298;
    if (!_2246)
    {
        _2300 = _1016;
    }
    float _2304 = _2300;
    float _2306 = _2304;
    if (_2246)
    {
        _2296 = _994;
    }
    float _2308 = _2296;
    if (_2246)
    {
        _2302 = _1002;
    }
    float _2310 = _2302;
    float _2312 = _189 * _2252;
    float _2314 = _195 * _2252;
    float _2316 = _201 * _2252;
    float _2318 = _994 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2320 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2180);
    float _2322 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2324 = -_2178;
    float _2326 = fma(_2318, 2.0, _2324);
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2330 = fma(_2322, -2.0, _2182);
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2334 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2328);
    float _2336 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_2246)
    {
        _2306 = _1002;
    }
    float _2338 = _2306;
    float _2340 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2342 = _1010 != 2;
    float _2344 = fma(_2336, -2.0, _2332);
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2348 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2350 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2346);
    float _2352 = _1230 * _127;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2356 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2360 = -_2354;
    float _2362 = fma(_2340, 2.0, _2360);
    float _2364 = exp2(_2352);
    if (_2342)
    {
        _1612 = _994;
    }
    float _2366 = _1612;
    float _2368 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2358);
    float _2370 = _2366;
    if (_2342)
    {
        _1958 = _1002;
    }
    float _2372 = _1958;
    float _2374 = -_127;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2362);
    float _2378 = _2372;
    if (!_2342)
    {
        _2370 = _1016;
    }
    float _2380 = _2370;
    float _2382 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2320);
    if (!_2342)
    {
        _2378 = _994;
    }
    float _2384 = _2378;
    float _2386 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2334);
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2390 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2392 = _2390 != 0;
    float _2394 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2398 = -_2194;
    float _2400 = fma(_2388, 2.0, _2398);
    bool _2402 = !_2392;
    float _2404 = _2402 ? _231 : as_type<float>(_2244);
    float _2406 = -_2364;
    float _2408 = _2406 + 1.0;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2412 = fma(_2356, -2.0, _2396);
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2418 = -_2410;
    float _2420 = fma(_2348, 2.0, _2418);
    float _2422 = fma(_2394, -2.0, _2228);
    bool _2424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2426 = isnan(0.0);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2432 = _2428 || _2430;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2436 = _2434 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2440 = _2432 ? _2408 : 0.0;
    float _2442 = 1.0 / _2436;
    bool _2444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2446 = isnan(1.0);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2452 = _2448 || _2450;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2458 = 1.0 + _2456;
    float _2460 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2438);
    float _2462 = -_127;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2420);
    float _2466 = -_127;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2326);
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2472 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2454);
    float _2474 = _994 * 2.0;
    float _2476 = 1.0 / _2458;
    float _2478 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2230);
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2472);
    float _2484 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2330);
    float _2486 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2344);
    float _2488 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2480);
    float _2490 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2350);
    float _2492 = floor(_2474);
    float _2494 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2368);
    float _2496 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2488);
    float _2498 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2412);
    float _2500 = -_127;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2400);
    float _2504 = fma(_193, _2250, _2314);
    float _2506 = fma(_199, _2250, _2316);
    float _2508 = 1.0 / _2416;
    float _2510 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2422);
    if (_2452)
    {
        float _2512 = _2440 * _2476;
        _137 = _2512;
    }
    float _2514 = _137;
    float _2516 = _1002 * 2.0;
    float _2518 = fma(_187, _2250, _2312);
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2524 = fma(_203, _2254, _2506);
    float _2526 = fma(_197, _2254, _2504);
    bool _2528 = _2492 >= 0.0;
    bool _2530 = isnan(_2492);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    float _2538 = floor(_2516);
    float _2540 = fma(_191, _2254, _2518);
    float _2542 = _1016 * 2.0;
    int _2544 = _2536 ? 0 : 1;
    float _2546 = -_2470;
    float _2548 = _2546 + 1.0;
    bool _2550 = _2492 > 0.0;
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2552;
    float _2556 = 1.0 / _2522;
    int _2558 = ~_2544;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = -_2494;
    float _2566 = _2564 + 1.0;
    float _2568 = _2554 * _2248;
    float _2570 = -_2482;
    float _2572 = _2570 + 1.0;
    bool _2574 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2576 = isnan(_815);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2582 = _2578 || _2580;
    float _2584 = float(_2582);
    float _2586 = -_2496;
    float _2588 = _2586 + 1.0;
    bool _2590 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2592 = isnan(_815);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2598 = _2594 || _2596;
    float _2600 = float(_2598);
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2602;
    int _2606 = _2562;
    if (!_2550)
    {
        int _2608 = ~_2544;
        int _2610 = _2608 + 1;
        _2606 = _2610;
    }
    int _2612 = _2606;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2618 = _2538 >= 0.0;
    bool _2620 = isnan(_2538);
    bool _2622 = _2618 || _2620;
    bool _2624 = isnan(0.0);
    bool _2626 = _2622 || _2624;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2632 = _2616 * _2556;
    int _2634 = _2626 ? 0 : 1;
    float _2636 = _2630 * _2442;
    bool _2638 = _2538 > 0.0;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2640;
    float _2644 = floor(_2542);
    int _2646 = ~_2088;
    int _2648 = _2646 + _2148;
    int _2650 = _2648 + 1;
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2656 = _2604 * _2508;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2660 = _815 + _2658;
    int _2662 = _861 * _2650;
    int _2664 = _2662 + _1348;
    int _2666 = ~_2634;
    int _2668 = _2666 + 1;
    int _2670 = _2668 + 1;
    float _2672 = 1.0 / _2654;
    bool _2674 = !_1832;
    int _2676 = _2674 ? 0 : 1;
    float _2678 = fma(_2568, _2660, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2680 = _2670;
    if (!_2638)
    {
        int _2682 = ~_2634;
        int _2684 = _2682 + 1;
        _2680 = _2684;
    }
    int _2686 = _2680;
    float _2688 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2690 = _2688 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2692 = !_1360;
    int _2694 = _2692 ? _2664 : (-1);
    float _2696 = -_2584;
    float _2698 = _2696 + 1.0;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2702 = _2700 != 0;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2706 = _2704 != 0;
    int _2708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2710 = _2708 != 0;
    float _2712 = _2690 * _2264;
    bool _2714 = _2644 >= 0.0;
    bool _2716 = isnan(_2644);
    bool _2718 = _2714 || _2716;
    bool _2720 = isnan(0.0);
    bool _2722 = _2718 || _2720;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2726 = _815 + _2724;
    bool _2728 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2730 = isnan(_815);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2740;
    bool _2744 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2746 = isnan(_815);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2752 = _2748 || _2750;
    float _2754 = float(_2752);
    float _2756 = fma(_2632, _2726, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2758 = _2722 ? 0 : 1;
    float _2760 = _2642 * _2672;
    bool _2762 = _2644 > 0.0;
    float _2764 = _2738 * _2698;
    float _2766 = -_2738;
    float _2768 = _2766 + 1.0;
    bool _2770 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2772 = isnan(_815);
    bool _2774 = _2770 || _2772;
    bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2778 = _2774 || _2776;
    float _2780 = float(_2778);
    float _2782 = -_2754;
    float _2784 = _2782 + 1.0;
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2788 = _815 + _2786;
    float _2790 = _2754 * _2768;
    bool _2792 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2794 = isnan(_815);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2800 = _2796 || _2798;
    float _2802 = float(_2800);
    float _2804 = _2780 * _2784;
    float _2806 = fma(_2656, _2788, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2810 = _815 + _2808;
    float _2812 = in.m_62.w;
    float _2814 = -_2780;
    float _2816 = _2814 + 1.0;
    bool _2818 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2820 = isnan(_815);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = fma(_2636, _2810, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2832 = -_2802;
    float _2834 = _2832 + 1.0;
    int _2836 = _1972 >> 31;
    float _2838 = _2802 * _2816;
    float _2840 = -_2828;
    float _2842 = _2840 + 1.0;
    float _2844 = in.m_64.w;
    float _2846 = _2828 * _2834;
    float _2848 = _2742 * _2294;
    bool _2850 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2852 = isnan(_815);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2864 = _815 + _2862;
    int _2866 = _2836 & 3;
    float _2868 = -_2600;
    float _2870 = _2868 + 1.0;
    float _2872 = _2600 * _2842;
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _815 + _2874;
    float _2878 = fma(_2848, _2864, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2880 = _1972 + _2866;
    float _2882 = _2860 * _2870;
    float _2884 = fma(_2712, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2886 = -_2860;
    float _2888 = _2886 + 1.0;
    int _2890 = _2880 >> 2;
    float _2892 = _2678 * _2882;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2896 = _815 + _2894;
    float _2898 = _1002 + _994;
    int _2900 = _2890 << 4;
    int _2902 = _2900 + 656;
    float _2904 = fma(_2888, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2892);
    float _2906 = fma(_2760, _2896, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2908 = _2526 + _2812;
    float _2910 = _2540 + _1046;
    float _2912 = fma(_2756, _2872, _2904);
    uint _2914 = uint(int(uint(_2902) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2932 = _2908 + _2930;
    float _2934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2936 = _2910 + _2934;
    int _2938 = ~_2758;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = _2524 + _2844;
    float _2946 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2948 = _2942;
    float _2950 = _2790;
    if (!_2762)
    {
        int _2952 = ~_2758;
        int _2954 = _2952 + 1;
        _2948 = _2954;
    }
    int _2956 = _2948;
    float _2958 = fma(_2806, _2846, _2912);
    bool _2960 = !_1990;
    int _2962 = _2960 ? 0 : 1;
    float _2964 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2946);
    bool _2966 = _1988 != 3;
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2970 = _2944 + _2968;
    float _2972 = _994 + _1016;
    float _2974 = _994 + (-0.5);
    bool _2976 = !_2966;
    int _2978 = _2976 ? 0 : (-1);
    float _2980 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2964);
    float _2982 = fma(_2830, _2838, _2958);
    int _2984 = _2902 + 8;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    float _3002 = _2898 + (-1.0);
    bool _3004 = _2980 >= 0.0;
    float _3006 = _1814 + 0.5;
    float _3008 = fma(_2878, _2804, _2982);
    float _3010 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3012 = _1002 + _1016;
    float _3014 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2464);
    float _3016 = _1002 + (-0.5);
    float _3018 = _2404 + 0.5;
    float _3020 = _1984 + (-0.5);
    float _3022 = fma(_2884, _2790, _3008);
    float _3024 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2468);
    float _3026 = -_3020;
    float _3028 = -_2486;
    float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3028);
    int _3032 = ~_2260;
    int _3034 = _3032 + 1;
    int _3036 = _3034 + 1;
    float _3038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3004)
    {
        _2950 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3040 = _2950;
    float _3042 = fma(_2906, _2764, _3022);
    int _3044 = abs(_2962);
    float _3046 = -_2382;
    float _3048 = _3046 + 1.0;
    if (_3004)
    {
        float _3050 = _3040 * 5.0;
        _2278 = as_type<int>(_3050);
    }
    int _3052 = _2278;
    bool _3054 = !_2702;
    int _3056 = _3054 ? 0 : 1;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3060 = -_3048;
    float _3062 = fma(_3060, _1814, _3014);
    float _3064 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_3004)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9506 = as_type<float>(_3052);
        out.gl_Position.z = _9506;
    }
    int _3066 = abs(_3056);
    float _3068 = fma(_2584, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3042);
    int _3070 = _3036 * as_type<int>(_2928);
    float _3072 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3074 = int(_3072);
    float _3076 = -_2386;
    float _3078 = _3076 + 1.0;
    float _3080 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3082 = ~_3044;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = _1996 + (-0.5);
    float _3090 = fma(_3078, _1984, _3030);
    int _3092 = ~_2204;
    int _3094 = _3092 + _2234;
    int _3096 = _3094 + 1;
    float _3098 = _1762 + 0.5;
    int _3100 = _3086 * as_type<int>(_2920);
    int _3102 = _3100 + _3070;
    float _3104 = _2932 * _2932;
    float _3106 = fma(_3080, _3098, _2376);
    int _3108 = ~_2262;
    int _3110 = _3108 + 1;
    int _3112 = _3110 + 1;
    out.m_74.x = _3062;
    out.m_74.y = _3090;
    int _3114 = abs(_2978);
    float _3116 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3118 = abs(_3074);
    int _3120 = _3112 * as_type<int>(_2992);
    int _3122 = _3120 + _3102;
    float _3124 = float(uint(_3074));
    float _3126 = -_3088;
    float _3128 = -_2484;
    float _3130 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3128);
    int _3132 = abs(_2134);
    int _3134 = _917 * _3096;
    int _3136 = _3134 + _1652;
    int _3138 = ~_3114;
    int _3140 = _3138 + 1;
    int _3142 = _3140 + 1;
    float _3144 = fma(_2936, _2936, _3104);
    float _3146 = 1.0 / _3124;
    int _3148 = ~_3132;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = _1516 + (-0.5);
    float _3156 = fma(_2970, _2970, _3144);
    int _3158 = _3142 * as_type<int>(_3000);
    int _3160 = _3158 + _3122;
    int _3162 = _2140 >> 31;
    float _3164 = -_3116;
    float _3166 = -_2498;
    float _3168 = fma(_3164, _3154, _3166);
    float _3170 = float(uint(_3118));
    float _3172 = rsqrt(_3156);
    int _3174 = _3160 * _3152;
    int _3176 = _1788 >> 31;
    out.m_76.x = _3068;
    int _3178 = _3162 & 3;
    int _3180 = _2694 * _3132;
    int _3182 = _3180 + _3174;
    int _3184 = _3176 & 3;
    if (_3004)
    {
        out.m_53.x = 0.0;
    }
    float _3186 = 1.0 / _3170;
    int _3188 = as_type<int>(_3146) + (-2);
    float _3190 = float(uint(_3182));
    int _3192 = _1788 + _3184;
    float _3194 = _3064 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3196 = _2140 + _3178;
    float _3198 = as_type<float>(_3188) * _3190;
    float _3200 = float(_2956);
    float _3202 = _3194 * _3172;
    int _3204 = _3192 >> 2;
    float _3206 = in.m_78.x;
    float _3208 = in.m_78.y;
    float _3210 = in.m_78.z;
    int _3212 = abs(_3182);
    float _3214 = _2932 * _3202;
    float _3216 = trunc(_3198);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    float _3222 = _2936 * _3202;
    int _3224 = as_type<int>(_3186) + (-2);
    float _3226 = -_3214;
    float _3228 = _2932 + _3226;
    int _3230 = _3204 << 4;
    int _3232 = _3230 + 368;
    float _3234 = -_3222;
    float _3236 = _2936 + _3234;
    int _3238 = _3196 >> 2;
    float _3240 = _3228 * _3228;
    uint _3242 = uint(int(uint(_3232) >> uint(2)));
    uint _3244 = uint(int(uint(int(_3242)) >> uint(2)));
    int _3246 = int(_3242) & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    int _3250 = int(_3242) + 1;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    int _3254 = _3250 & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    float _3258 = float(uint(_3212));
    float _3260 = fma(_3236, _3236, _3240);
    int _3262 = ~_3074;
    int _3264 = _3262 + 1;
    float _3266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3268 = _3238 << 4;
    int _3270 = _3268 + 800;
    float _3272 = as_type<float>(_3224) * _3258;
    float _3274 = float(_3066);
    int _3276 = _3264 * int(_3220);
    int _3278 = _3276 + _3182;
    uint _3280 = uint(int(uint(_3270) >> uint(2)));
    uint _3282 = uint(int(uint(int(_3280)) >> uint(2)));
    int _3284 = int(_3280) & 3;
    float _3286 = (*spvDescriptorSet0.vp_c9)._m0[int(_3282)][_3284];
    int _3288 = int(_3280) + 1;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    int _3292 = _3288 & 3;
    float _3294 = (*spvDescriptorSet0.vp_c9)._m0[int(_3290)][_3292];
    int _3296 = abs(_2676);
    float _3298 = _3274 * _3200;
    float _3300 = -_2478;
    float _3302 = _3300 + 1.0;
    float _3304 = float(uint(_3278));
    float _3306 = trunc(_3272);
    float _3308 = precise::max(_3306, 0.0);
    uint _3310 = uint(_3308);
    float _3312 = -_2490;
    float _3314 = _3312 + 1.0;
    float _3316 = fma(_1996, _3302, _3130);
    float _3318 = _2970 * _3202;
    float _3320 = as_type<float>(_3188) * _3304;
    float _3322 = -_2548;
    float _3324 = fma(_2404, _3322, _3024);
    float _3326 = -_3314;
    float _3328 = fma(_1762, _3326, _3106);
    float _3330 = fma(_1516, _2566, _3168);
    float _3332 = _3298 * (-2.0);
    int _3334 = ~_3118;
    int _3336 = _3334 + 1;
    float _3338 = trunc(_3320);
    float _3340 = precise::max(_3338, 0.0);
    uint _3342 = uint(_3340);
    int _3344 = abs(_2038);
    float _3346 = fma(_3332, _3206, _3206);
    out.m_80.x = _3324;
    out.m_80.y = _3316;
    out.m_80.z = _3328;
    out.m_80.w = _3330;
    int _3348 = abs(_2144);
    float _3350 = -_3318;
    float _3352 = _2970 + _3350;
    int _3354 = _3336 * int(_3310);
    int _3356 = _3354 + _3212;
    float _3358 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3346);
    bool _3360 = _833 == 0;
    int _3362 = _3232 + 8;
    uint _3364 = uint(int(uint(_3362) >> uint(2)));
    uint _3366 = uint(int(uint(int(_3364)) >> uint(2)));
    int _3368 = int(_3364) & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    int _3372 = int(_3364) + 1;
    uint _3374 = uint(int(uint(_3372) >> uint(2)));
    int _3376 = _3372 & 3;
    float _3378 = (*spvDescriptorSet0.vp_c9)._m0[int(_3374)][_3376];
    float _3380 = float(_2612);
    float _3382 = fma(_3010, _3332, _3010);
    bool _3384 = !_3360;
    int _3386 = _3384 ? _2288 : (-1);
    float _3388 = fma(_3352, _3352, _3260);
    float _3390 = fma(_3382, _2514, _3358);
    int _3392 = int(_3220) + int(_3342);
    int _3394 = _3270 + 8;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c9)._m0[int(_3406)][_3408];
    float _3412 = float(uint(_3356));
    int _3414 = abs(_1886);
    int _3416 = abs(_2190);
    float _3418 = as_type<float>(_3224) * _3412;
    int _3420 = ~_3074;
    int _3422 = _3420 + 1;
    int _3424 = ~_3414;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    float _3430 = trunc(_3418);
    float _3432 = precise::max(_3430, 0.0);
    uint _3434 = uint(_3432);
    bool _3436 = !_2156;
    int _3438 = _3436 ? 0 : 1;
    int _3440 = _3422 * _3392;
    int _3442 = _3440 + _3182;
    bool _3444 = _1830 != 3;
    int _3446 = _3428 * as_type<int>(_3256);
    int _3448 = ~_3416;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    bool _3454 = !_3444;
    int _3456 = _3454 ? 0 : (-1);
    bool _3458 = uint(_3442) >= uint(_3074);
    int _3460 = _3452 * as_type<int>(_3294);
    int _3462 = abs(_3438);
    int _3464 = ~_3118;
    int _3466 = _3464 + 1;
    int _3468 = int(_3310) + int(_3434);
    int _3470 = ~_3296;
    int _3472 = _3470 + 1;
    int _3474 = _3472 + 1;
    bool _3476 = !_3458;
    int _3478 = _3476 ? 0 : (-1);
    int _3480 = _3466 * _3468;
    int _3482 = _3480 + _3212;
    bool _3484 = _2154 != 3;
    int _3486 = _3474 * as_type<int>(_3248);
    int _3488 = _3486 + _3446;
    int _3490 = ~_3392;
    int _3492 = _3490 + _3478;
    int _3494 = _3492 + 1;
    int _3496 = ~_3462;
    int _3498 = _3496 + 1;
    int _3500 = _3498 + 1;
    int _3502 = abs(_2224);
    int _3504 = _3074 * _3494;
    int _3506 = _3504 + _3182;
    bool _3508 = !_3484;
    int _3510 = _3508 ? 0 : (-1);
    int _3512 = _3500 * as_type<int>(_3286);
    int _3514 = _3512 + _3460;
    int _3516 = abs(_1964);
    float _3518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3520 = uint(_3482) >= uint(_3118);
    int _3522 = ~_3502;
    int _3524 = _3522 + 1;
    int _3526 = _3524 + 1;
    int _3528 = _3182 ^ _3074;
    int _3530 = ~_3516;
    int _3532 = _3530 + 1;
    int _3534 = _3532 + 1;
    int _3536 = _3526 * as_type<int>(_3402);
    int _3538 = _3536 + _3514;
    bool _3540 = !_3520;
    int _3542 = _3540 ? 0 : (-1);
    int _3544 = abs(_3456);
    int _3546 = _3534 * as_type<int>(_3370);
    int _3548 = _3546 + _3488;
    uint _3550 = uint(int(uint(_3528) >> uint(31)));
    int _3552 = abs(_3510);
    int _3554 = ~_3542;
    int _3556 = _3468 + _3554;
    int _3558 = _3556 + 1;
    int _3560 = ~_3544;
    int _3562 = _3560 + 1;
    int _3564 = _3562 + 1;
    int _3566 = ~int(_3550);
    int _3568 = _3566 + 1;
    int _3570 = _3564 * as_type<int>(_3378);
    int _3572 = _3570 + _3548;
    int _3574 = ~_3552;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    bool _3580 = _3074 == 0;
    int _3582 = _3558 ^ _3568;
    int _3584 = _3578 * as_type<int>(_3410);
    int _3586 = _3584 + _3538;
    int _3588 = ~_3344;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = _3518 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3596 = ~_3348;
    int _3598 = _3596 + 1;
    int _3600 = _3598 + 1;
    bool _3602 = !_3580;
    int _3604 = _3602 ? _3506 : (-1);
    int _3606 = _3572 * _3592;
    bool _3608 = _3074 == 0;
    int _3610 = _3586 * _3600;
    int _3612 = ~_3568;
    int _3614 = _3612 + _3582;
    int _3616 = _3614 + 1;
    int _3618 = _3386 * _3344;
    int _3620 = _3618 + _3606;
    float _3622 = float(_3604);
    float _3624 = _1168 + (-0.5);
    bool _3626 = !_3608;
    int _3628 = _3626 ? _3616 : (-1);
    bool _3630 = !_2706;
    int _3632 = _3630 ? 0 : 1;
    float _3634 = fma(_3594, _3622, _2502);
    float _3636 = float(_3628);
    float _3638 = _3266 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3640 = !_1598;
    int _3642 = _3640 ? _3136 : (-1);
    int _3644 = abs(_3632);
    float _3646 = -_2510;
    float _3648 = fma(_3638, _3636, _3646);
    float _3650 = _1184 + 0.5;
    int _3652 = _3642 * _3348;
    int _3654 = _3652 + _3610;
    float _3656 = float(_3620);
    float _3658 = -_3638;
    float _3660 = fma(_3658, _3624, _3648);
    float _3662 = fma(_3594, _3650, _3634);
    float _3664 = float(_3654);
    float _3666 = -_2572;
    float _3668 = fma(_1184, _3666, _3662);
    float _3670 = fma(_1168, _2588, _3660);
    float _3672 = float(_3644);
    out.m_82.x = _3656;
    out.m_82.w = _3664;
    float _3674 = _3672 * _3380;
    bool _3676 = !_2710;
    int _3678 = _3676 ? 0 : 1;
    out.m_84.x = _3668;
    out.m_84.y = _3670;
    float _3680 = _3210;
    if (_3004)
    {
        return out;
    }
    float _3682 = -_3214;
    float _3684 = _2908 + _3682;
    float _3686 = -_3222;
    float _3688 = _2910 + _3686;
    float _3690 = -_3318;
    float _3692 = _2944 + _3690;
    int _3694 = abs(_3678);
    float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3698 = _3684 + _3696;
    float _3700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3702 = _3688 + _3700;
    float _3704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3706 = _3692 + _3704;
    float _3708 = _3012 + (-1.0);
    float _3710 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3712 = float(_2686);
    float _3714 = _2972 + (-1.0);
    float _3716 = fma(_3708, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3718 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3710);
    float _3720 = float(_3694);
    float _3722 = _3674 * (-2.0);
    float _3724 = _3390 * 0.15915493667125701904296875;
    float _3726 = fma(_3706, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3718);
    float _3728 = sqrt(_3388);
    float _3730 = fma(_3722, _3208, _3208);
    float _3732 = fma(_3716, _3722, _3716);
    float _3734 = _3720 * _3712;
    bool _3736 = _3726 >= 0.0;
    float _3738 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3730);
    float _3740 = _3734 * (-2.0);
    float _3742 = _3724 * 6.283185482025146484375;
    float _3744 = sin(_3742);
    float _3746 = fma(_3732, _2514, _3738);
    float _3748 = _1016 + (-0.5);
    float _3750 = fma(_3714, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3752 = fma(_3740, _3210, _3210);
    float _3754 = _3746 * 0.15915493667125701904296875;
    float _3756 = fma(_3750, _3740, _3750);
    float _3758 = _3724 * 6.283185482025146484375;
    float _3760 = cos(_3758);
    float _3762 = _3706;
    float _3764 = _3688;
    if (_3736)
    {
        _3680 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3766 = _3680;
    float _3768 = fma(_3748, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3752);
    int _3770 = as_type<int>(_3766);
    if (_3736)
    {
        out.m_53.x = 0.0;
    }
    if (_3736)
    {
        float _3772 = _3766 * 5.0;
        _3770 = as_type<int>(_3772);
    }
    int _3774 = _3770;
    float _3776 = fma(_3756, _2514, _3768);
    float _3778 = _3754 * 6.283185482025146484375;
    float _3780 = sin(_3778);
    if (_3736)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10536 = as_type<float>(_3774);
        out.gl_Position.z = _10536;
    }
    float _3782 = _3776 * 0.15915493667125701904296875;
    float _3784 = _3754 * 6.283185482025146484375;
    float _3786 = cos(_3784);
    if (_3736)
    {
        return out;
    }
    float _3788 = _3782 * 6.283185482025146484375;
    float _3790 = cos(_3788);
    float _3792 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3794 = _3172 * _3728;
    float _3796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3798 = _3760 * _3786;
    float _3800 = _3744 * _3786;
    float _3802 = _3794 * _3792;
    float _3804 = _3064 * _3794;
    float _3806 = _3782 * 6.283185482025146484375;
    float _3808 = sin(_3806);
    float _3810 = _3760 * _3780;
    float _3812 = _3796 * _3802;
    float _3814 = _3744 * _3780;
    float _3816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _3818 = _3760 * _3790;
    float _3820 = _3744 * _3790;
    float _3822 = _3816 * _3804;
    float _3824 = _3786 * _3790;
    float _3826 = _3818 * _3812;
    float _3828 = _3780 * _3790;
    float _3830 = _3794 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3832 = _3830 * 0.5;
    float _3834 = fma(_3808, _3798, _3814);
    float _3836 = -_3800;
    float _3838 = fma(_3808, _3810, _3836);
    float _3840 = -_3812;
    float _3842 = _3808 * _3840;
    float _3844 = -_3810;
    float _3846 = fma(_3808, _3800, _3844);
    float _3848 = fma(_3834, _3822, _3826);
    float _3850 = _3820 * _3812;
    float _3852 = fma(_3824, _3822, _3842);
    float _3854 = fma(_3808, _3814, _3798);
    float _3856 = fma(_3838, _3832, _3848);
    float _3858 = fma(_3846, _3822, _3850);
    float _3860 = fma(_3828, _3832, _3852);
    float _3862 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3864 = fma(_3854, _3832, _3858);
    float _3866 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3868 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3870 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3862);
    float _3872 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3866);
    float _3874 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3868);
    float _3876 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3870);
    float _3878 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3872);
    float _3880 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3874);
    float _3882 = _3876 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3884 = _3878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3886 = _3684 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3888 = _2944 + _3882;
    float _3890 = _2910 + _3884;
    float _3892 = fma(_3688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3886);
    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3896 = _3888 + _3894;
    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3900 = _3890 + _3898;
    float _3902 = fma(_3692, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3892);
    float _3904 = _3896 * _3896;
    float _3906 = fma(_3900, _3900, _3904);
    float _3908 = _3880 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3910 = sqrt(_3906);
    float _3912 = _2908 + _3908;
    bool _3914 = _3910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3916 = _3892;
    float _3918 = _3880;
    float _3920 = _3908;
    if (!_3914)
    {
        _3916 = _3890;
    }
    float _3922 = _3916;
    float _3924 = _3922;
    if (!_3914)
    {
        _3918 = _3888;
    }
    float _3926 = _3918;
    float _3928 = _3926;
    if (!_3914)
    {
        _3920 = _3912;
    }
    float _3930 = _3920;
    bool _3932 = !_3914;
    float _3934 = _3930;
    if (!_3932)
    {
        float _3936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3940 = _3910 + _3938;
        float _3942 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3944 = rsqrt(_3906);
        float _3946 = _3940 * _3936;
        float _3948 = _3946 * 0.15915493667125701904296875;
        float _3950 = _3948 * 6.283185482025146484375;
        float _3952 = cos(_3950);
        float _3954 = _3948 * 6.283185482025146484375;
        float _3956 = sin(_3954);
        float _3958 = _3952 + (-1.0);
        float _3960 = fma(_3956, _3942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3962 = _3958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3964 = _3944 * _3960;
        float _3966 = fma(_3912, _3952, _3962);
        float _3968 = fma(_3900, _3964, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3970 = fma(_3896, _3964, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3934 = _3966;
        _3924 = _3968;
        _3928 = _3970;
    }
    float _3972 = _3934;
    float _3974 = _3924;
    float _3976 = _3928;
    float _3978 = -_2908;
    float _3980 = _3978 + _3972;
    float _3982 = -_2910;
    float _3984 = _3982 + _3974;
    float _3986 = -_2944;
    float _3988 = _3986 + _3976;
    float _3990 = _3902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3992 = _3980 * _3980;
    float _3994 = _3684 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3996 = 1.0 / _3990;
    float _3998 = fma(_3984, _3984, _3992);
    bool _4000 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4002 = isnan(0.5);
    bool _4004 = _4000 || _4002;
    bool _4006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4008 = _4004 || _4006;
    bool _4010 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4012 = isnan(0.5);
    bool _4014 = _4010 || _4012;
    bool _4016 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4018 = _4014 || _4016;
    float _4020 = fma(_3988, _3988, _3998);
    float _4022 = fma(_3688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3994);
    float _4024 = sqrt(_4020);
    float _4026 = fma(_3692, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4022);
    float _4028 = _4026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4030 = _4028 + _3990;
    float _4032 = _4030 * _3996;
    float _4034 = _4032 * 0.5;
    bool _4036 = _4024 > 0.0;
    float _4038 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4040 = fma(_4034, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4038);
    float _4042 = 1.0 / _4040;
    bool _4044 = !_4036;
    float _4046 = _3974;
    float _4048 = _3972;
    float _4050 = _3976;
    float _4052 = _3984;
    float _4054 = _3990;
    if (!_4044)
    {
        float _4056 = _237 * _237;
        float _4058 = rsqrt(_4020);
        float _4060 = fma(_235, _235, _4056);
        float _4062 = fma(_239, _239, _4060);
        float _4064 = sqrt(_4062);
        float _4066 = _3984 * _4058;
        float _4068 = _3980 * _4058;
        float _4070 = _3988 * _4058;
        bool _4072 = _4064 > 0.0;
        bool _4074 = !_4072;
        _4054 = _4064;
        if (!_4074)
        {
            float _4076 = rsqrt(_4062);
            float _4078 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4080 = _237 * _4076;
            float _4082 = _235 * _4076;
            float _4084 = _4068 * _4080;
            float _4086 = _239 * _4076;
            float _4088 = fma(_4066, _4082, _4084);
            float _4090 = _4078 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4092 = fma(_4070, _4086, _4088);
            float _4094 = _4092 * _4090;
            float _4096 = fma(_235, _4094, _3974);
            float _4098 = fma(_237, _4094, _3972);
            float _4100 = fma(_239, _4094, _3976);
            _4046 = _4096;
            _4048 = _4098;
            _4050 = _4100;
            _4052 = _4094;
            _4054 = _4086;
        }
    }
    float _4102 = _4046;
    float _4104 = _4048;
    float _4106 = _4050;
    float _4108 = _4052;
    float _4110 = _4054;
    float _4112 = -_3222;
    float _4114 = _4112 + _4102;
    float _4116 = -_3214;
    float _4118 = _4116 + _4104;
    float _4120 = -_3318;
    float _4122 = _4120 + _4106;
    float _4124 = _4110;
    float _4126 = _4118;
    float _4128 = _4114;
    float _4130 = _4122;
    float _4132 = _4108;
    if (_4018)
    {
        _4124 = 1.0;
    }
    float _4134 = _4124;
    float _4136 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4138 = _4042 * _4136;
    float _4140 = _4134;
    if (!_4008)
    {
        float _4142 = _3698 * _3698;
        float _4144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4146 = -_2944;
        float _4148 = _4146 + _4106;
        float _4150 = -_2908;
        float _4152 = _4150 + _4104;
        float _4154 = fma(_3702, _3702, _4142);
        float _4156 = -_2910;
        float _4158 = _4156 + _4102;
        float _4160 = fma(_3706, _3706, _4154);
        float _4162 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4164 = sqrt(_4160);
        float _4166 = 1.0 / _3794;
        float _4168 = _4162 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4170 = precise::min(_4164, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4172 = _4170 * _4144;
        float _4174 = _4172 * _4166;
        float _4176 = _4168 * _4174;
        float _4178 = _4148 * _4174;
        float _4180 = fma(_4152, _4176, _3684);
        float _4182 = fma(_4158, _4176, _3688);
        float _4184 = fma(_4168, _4178, _3692);
        _4126 = _4180;
        _4128 = _4182;
        _4130 = _4184;
        _3762 = _4176;
    }
    float _4186 = _4126;
    float _4188 = _4128;
    float _4190 = _4130;
    float _4192 = _3762;
    float _4194 = _4192;
    if (!_4018)
    {
        float _4196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4198 = _4196 * 0.15915493667125701904296875;
        float _4200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4202 = _4198 * 6.283185482025146484375;
        float _4204 = cos(_4202);
        float _4206 = _4200 * 0.15915493667125701904296875;
        float _4208 = _4198 * 6.283185482025146484375;
        float _4210 = sin(_4208);
        float _4212 = 1.0 / _4204;
        float _4214 = _4206 * 6.283185482025146484375;
        float _4216 = cos(_4214);
        float _4218 = _4210 * _4212;
        float _4220 = _4206 * 6.283185482025146484375;
        float _4222 = sin(_4220);
        float _4224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4226 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4224;
        float _4228 = _4216 * _4218;
        float _4230 = 1.0 / _4226;
        float _4232 = 1.0 / _4228;
        float _4234 = _4222 * _4232;
        float _4236 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4238 = fma(_4138, _4234, _4236);
        float _4240 = _4238 * _4230;
        float _4242 = precise::clamp(_4240, 0.0, 1.0);
        _4194 = _4198;
        _4140 = _4242;
    }
    float _4244 = _4194;
    float _4246 = _4140;
    float _4248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4250 = _4186 + _4248;
    float _4252 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4254 = _4188 + _4252;
    float _4256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4258 = _4190 + _4256;
    float _4260 = _4250 * _4250;
    float _4262 = fma(_4254, _4254, _4260);
    float _4264 = fma(_4258, _4258, _4262);
    float _4266 = rsqrt(_4264);
    float _4268 = sqrt(_4264);
    float _4270 = _4266 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4272 = _4254 * _4270;
    float _4274 = _4258 * _4270;
    float _4276 = _4272 * _4272;
    float _4278 = _4274 * _4274;
    float _4280 = _4276 + _4278;
    float _4282 = sqrt(_4280);
    bool _4284 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4286 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4288 = _4282 + _4286;
    float _4290 = _4258;
    float _4292 = _4280;
    float _4294 = _4288;
    float _4296 = _4244;
    if (_4284)
    {
        float _4298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4290 = _4298;
    }
    float _4300 = _4290;
    if (_4284)
    {
        float _4302 = rsqrt(_4280);
        _4292 = _4302;
    }
    float _4304 = _4292;
    float _4306 = _4304;
    if (_4284)
    {
        float _4308 = _4288 * _4300;
        _4294 = _4308;
    }
    float _4310 = _4294;
    if (_4284)
    {
        float _4312 = _4310 * 0.15915493667125701904296875;
        _4296 = _4312;
    }
    float _4314 = _4296;
    float _4316 = _4300;
    float _4318 = _4314;
    if (_4284)
    {
        float _4320 = _4314 * 6.283185482025146484375;
        float _4322 = sin(_4320);
        _4316 = _4322;
    }
    float _4324 = _4316;
    float _4326 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4328 = precise::max(0.0, _4326);
    float _4330 = _4260;
    float _4332 = _4328;
    if (_4284)
    {
        float _4334 = _4314 * 6.283185482025146484375;
        float _4336 = cos(_4334);
        _4330 = _4336;
    }
    float _4338 = _4330;
    float _4340 = -_4270;
    float _4342 = -_4328;
    float _4344 = fma(_4250, _4340, _4342);
    float _4346 = _4344;
    if (_4284)
    {
        float _4348 = _4344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4332 = _4348;
    }
    float _4350 = _4332;
    float _4352 = fma(_3688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4354 = _4350;
    if (!_4284)
    {
        _3764 = _4278;
    }
    float _4356 = _3764;
    float _4358 = _4324;
    float _4360 = _4356;
    if (_4284)
    {
        float _4362 = fma(_4324, _4350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4358 = _4362;
    }
    float _4364 = _4358;
    float _4366 = floor(_4352);
    float _4368 = _4364;
    if (_4284)
    {
        float _4370 = _4338 + (-1.0);
        _4354 = _4370;
    }
    float _4372 = _4354;
    float _4374 = _4372;
    if (_4284)
    {
        float _4376 = _4304 * _4364;
        _4132 = _4376;
    }
    float _4378 = _4132;
    if (!_4284)
    {
        _4368 = _4272;
    }
    float _4380 = _4368;
    float _4382 = _4380;
    if (_4284)
    {
        float _4384 = _4372 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4318 = _4384;
    }
    float _4386 = _4318;
    if (_4284)
    {
        float _4388 = _4272 * _4378;
        _4382 = _4388;
    }
    float _4390 = _4382;
    if (!_4284)
    {
        _4374 = _4274;
    }
    float _4392 = _4374;
    float _4394 = _4392;
    if (_4284)
    {
        float _4396 = _4274 * _4378;
        _4394 = _4396;
    }
    float _4398 = _4394;
    if (!_4284)
    {
        _4306 = _4276;
    }
    float _4400 = _4306;
    float _4402 = _4400;
    if (_4284)
    {
        float _4404 = fma(_4344, _4338, _4386);
        _4346 = _4404;
    }
    float _4406 = _4346;
    if (_4284)
    {
        float _4408 = _4390 * _4390;
        _4402 = _4408;
    }
    float _4410 = _4402;
    if (_4284)
    {
        float _4412 = _4398 * _4398;
        _4360 = _4412;
    }
    float _4414 = _4360;
    float _4416 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4418 = fma(_4406, _4406, _4410);
    float _4420 = _4418 + _4414;
    float _4422 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4416);
    float _4424 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4426 = fma(_4268, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4424);
    float _4428 = precise::clamp(_4426, 0.0, 1.0);
    float _4430 = rsqrt(_4420);
    float _4432 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4422);
    float _4434 = -_4428;
    float _4436 = _4434 + 1.0;
    float _4438 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4440 = _4432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4442 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4444 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4446 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4448 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4450 = abs(_4436);
    float _4452 = log2(_4450);
    float _4454 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4444);
    float _4456 = -_4446;
    float _4458 = fma(_4456, _4438, 1.0);
    float _4460 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4462 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4448);
    float _4464 = _4430 * _4398;
    float _4466 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4454);
    float _4468 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4460);
    float _4470 = _4430 * _4390;
    float _4472 = _4430 * _4406;
    float _4474 = _4466 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4476 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4468);
    float _4478 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4480 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4462);
    float _4482 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4484 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4486 = -_4478;
    float _4488 = fma(_4472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4486);
    float _4490 = floor(_4442);
    float _4492 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4494 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4482);
    float _4496 = -_4464;
    float _4498 = fma(_4496, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4488);
    float _4500 = _4480 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4502 = _4472 + 1.0;
    float _4504 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4494);
    float _4506 = fma(_4498, -0.5, 0.5);
    float _4508 = log2(_4458);
    float _4510 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4512 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4504);
    float _4514 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4510);
    float _4516 = 1.0 / _4512;
    float _4518 = -_4366;
    float _4520 = _4352 + _4518;
    float _4522 = fma(_4498, 0.5, 0.5);
    float _4524 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4526 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4514);
    float _4528 = -_4490;
    float _4530 = _4442 + _4528;
    float _4532 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4524);
    float _4534 = exp2(_4492);
    float _4536 = fma(_4522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4538 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4526);
    float _4540 = sqrt(_4506);
    float _4542 = fma(_4522, _4536, -0.212114393711090087890625);
    float2 _11745 = float2(_4520, _4530);
    float _4544 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11745, float2(0.0), isnan(_11745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11745, float2(0.0), isnan(_11745)), level(0.0)).x;
    float _4546 = fma(_4522, _4542, 1.570728778839111328125);
    float _4548 = -_4472;
    float _4550 = fma(_4534, _4502, _4548);
    float _4552 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4532);
    float _4554 = _4538 * _4516;
    float _4556 = fma(_4550, 0.5, 0.5);
    float _4558 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4552);
    float _4560 = _4508 * 0.693147182464599609375;
    float _4562 = fma(_4554, 0.5, 0.5);
    float _4564 = _4540 * 0.636619746685028076171875;
    float _4566 = _4558 * _4516;
    float _4568 = _4560 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4570 = -_4546;
    float _4572 = fma(_4564, _4570, 1.0);
    float _4574 = fma(_4566, -0.5, 0.5);
    float3 _11803 = float3(_4562, _4574, _4568);
    float _4576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11803, float3(0.0), isnan(_11803)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11803, float3(0.0), isnan(_11803)), level(0.0)).x;
    float3 _11814 = float3(_4562, _4574, _4568);
    float4 _4579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11814, float3(0.0), isnan(_11814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11814, float3(0.0), isnan(_11814)), level(0.0)).xyzw;
    float _4581 = _4579.x;
    float _4583 = _4579.y;
    float _4585 = _4579.z;
    float _4587 = _4579.w;
    float2 _11830 = float2(_4572, _4556);
    float3 _4591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11830, float2(0.0), isnan(_11830)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11830, float2(0.0), isnan(_11830)), level(0.0)).xyz;
    float _4593 = _4591.x;
    float _4595 = _4591.y;
    float _4597 = _4591.z;
    float _4599 = abs(_4138);
    float _4601 = log2(_4599);
    float _4603 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4605 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4607 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4609 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4611 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4603);
    float _4613 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4605);
    float _4615 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4607);
    float _4617 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4619 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4621 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4623 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4625 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4627 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4629 = -_3808;
    float _4631 = fma(_4629, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4609);
    float _4633 = -_3808;
    float _4635 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4623);
    float _4637 = _4601 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4639 = -_3808;
    float _4641 = fma(_4639, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4617);
    float _4643 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4619);
    float _4645 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4621);
    float _4647 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4625);
    float _4649 = fma(_4627, _4627, 1.0);
    float _4651 = exp2(_4637);
    float _4653 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4641);
    float _4655 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4631);
    float _4657 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4635);
    float _4659 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4611);
    float _4661 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4613);
    float _4663 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4615);
    float _4665 = rsqrt(_4649);
    float _4667 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4669 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4671 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4643);
    float _4673 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4645);
    float _4675 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4647);
    float _4677 = _4627 * _4655;
    out.m_86.x = _4659;
    out.m_86.y = _4661;
    out.m_86.z = _4663;
    float _4679 = fma(_4651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4681 = precise::clamp(_4679, 0.0, 1.0);
    float _4683 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4685 = exp2(_4669);
    float _4687 = fma(_4667, _4659, _4677);
    bool _4689 = _4138 <= 8000.0;
    bool _4691 = isnan(_4138);
    bool _4693 = _4689 || _4691;
    bool _4695 = isnan(8000.0);
    bool _4697 = _4693 || _4695;
    float _4699 = float(_4697);
    float _4701 = fma(_4681, -2.0, 3.0);
    float _4703 = _4681 * _4681;
    float _4705 = _4627 * _4665;
    float _4707 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4683);
    bool _4709 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4711 = isnan(_4268);
    bool _4713 = _4709 || _4711;
    bool _4715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4717 = _4713 || _4715;
    float _4719 = _4703 * _4701;
    float _4721 = _4627 * _4657;
    float _4723 = _4627 * _4653;
    float _4725 = -_4671;
    float _4727 = _4705 * _4725;
    float _4729 = -_4719;
    float _4731 = _4729 + 1.0;
    float _4733 = fma(_4667, _4661, _4721);
    float _4735 = -_4675;
    float _4737 = _4705 * _4735;
    float _4739 = fma(_4731, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4719);
    float _4741 = -_4673;
    float _4743 = _4705 * _4741;
    float _4745 = fma(_4665, _4653, _4737);
    float _4747 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4707);
    float _4749 = in.m_88.x;
    float _4751 = fma(_4665, _4655, _4727);
    float _4753 = _4699 * _4739;
    float _4755 = fma(_4665, _4657, _4743);
    float _4757 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4747);
    float _4759 = _4512 * 0.5;
    float _4761 = -_4685;
    float _4763 = _4761 + 1.0;
    float _4765 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4767 = _4757 + _4512;
    float _4769 = _4538 + _4512;
    float _4771 = fma(_4558, -0.5, _4759);
    float _4773 = _4763 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4775 = _4767 * 0.5;
    float _4777 = _4769 * 0.5;
    out.gl_Position.x = _4538;
    out.gl_Position.y = _4558;
    out.gl_Position.z = _4757;
    out.gl_Position.w = _4512;
    float _4779 = fma(_4667, _4663, _4723);
    float _4781 = _4671 + _4687;
    float _4783 = _4673 + _4733;
    out.m_90.x = _4777;
    out.m_90.y = _4771;
    out.m_90.z = _4775;
    out.m_90.w = _4512;
    float _4785 = _4675 + _4779;
    out.m_92.x = _4751;
    out.m_92.y = _4755;
    out.m_92.z = _4745;
    out.m_94.x = _4781;
    out.m_94.y = _4783;
    out.m_94.z = _4785;
    float _4787 = -_4773;
    float _4789 = _4787 + 1.0;
    float _4791 = _4512;
    float _4793 = _4757;
    float _4795 = _4558;
    float _4797 = _4789;
    if (!_4717)
    {
        _4791 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4799 = _4791;
    float _4801 = _4799;
    float _4803 = _4799;
    if (!_4717)
    {
        _4793 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4805 = _4793;
    float _4807 = _4805;
    float _4809 = _4805;
    if (!_4717)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4811 = _4795;
    float _4813 = -_4544;
    float _4815 = _4813 + 1.0;
    float _4817 = _4815 * _4765;
    float _4819 = precise::clamp(_4817, 0.0, 1.0);
    float _4821 = -_4819;
    float _4823 = fma(_4821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4825 = _4823 * _4749;
    float _4827 = _4825 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4827;
    float _4829 = _4773 * _4576;
    float _4831 = _4587 * _4789;
    float _4833 = _4583;
    float _4835 = _4581;
    float _4837 = _4811;
    float _4839 = _4811;
    if (!_4717)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4841 = _4797;
    float _4843 = _4587 * _4829;
    float _4845 = _4597 * _4829;
    float _4847 = fma(_4593, _4843, _4581);
    float _4849 = fma(_4595, _4843, _4583);
    float _4851 = fma(_4587, _4845, _4585);
    float _4853 = _4246 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4855 = _4841;
    float _4857 = _4841;
    if (!_4717)
    {
        _4833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4859 = _4833;
    float _4861 = _4859;
    float _4863 = _4859;
    if (!_4717)
    {
        _4835 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4865 = _4835;
    out.m_98.x = _4847;
    out.m_98.y = _4849;
    out.m_98.z = _4851;
    out.m_98.w = _4831;
    bool _4867 = !_4717;
    float _4869 = _4865;
    float _4871 = _4865;
    if (!_4867)
    {
        bool _4873 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4875 = isnan(_4268);
        bool _4877 = _4873 || _4875;
        bool _4879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4881 = _4877 || _4879;
        if (!_4881)
        {
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4885 = _4268 + _4883;
            float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4889 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4887;
            float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4895 = 1.0 / _4889;
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4903 = _4901 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4905 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4907 = _4905 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4909 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4913 = _4885 * _4895;
            float _4915 = precise::clamp(_4913, 0.0, 1.0);
            float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4919 = _4917 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4921 = fma(_4915, _4893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4923 = fma(_4915, _4919, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4925 = fma(_4915, _4899, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4927 = fma(_4915, _4903, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4929 = fma(_4915, _4907, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4931 = fma(_4915, _4911, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4871 = _4925;
            _4839 = _4929;
            _4863 = _4921;
            _4809 = _4927;
            _4803 = _4923;
            _4857 = _4931;
            _4933 = true;
        }
        else
        {
            bool _4935 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4937 = isnan(_4268);
            bool _4939 = _4935 || _4937;
            bool _4941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4943 = _4939 || _4941;
            if (!_4943)
            {
                _4861 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4945 = _4861;
            _4863 = _4945;
            if (!_4943)
            {
                _4869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4947 = _4869;
            _4871 = _4947;
            if (!_4943)
            {
                _4801 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4949 = _4801;
            _4803 = _4949;
            if (!_4943)
            {
                _4807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4951 = _4807;
            _4809 = _4951;
            if (!_4943)
            {
                _4837 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4953 = _4837;
            _4839 = _4953;
            if (!_4943)
            {
                _4855 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4955 = _4855;
            bool _4957 = !_4943;
            _4857 = _4955;
            if (!_4957)
            {
                bool _4959 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4961 = isnan(_4268);
                bool _4963 = _4959 || _4961;
                bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4967 = _4963 || _4965;
                if (!_4967)
                {
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4971 = _4268 + _4969;
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4975 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4973;
                    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4981 = 1.0 / _4975;
                    float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4991 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4999 = _4971 * _4981;
                    float _5001 = precise::clamp(_4999, 0.0, 1.0);
                    float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5005 = _5003 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5007 = fma(_5001, _4979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5009 = fma(_5001, _5005, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5011 = fma(_5001, _4985, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5013 = fma(_5001, _4989, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5015 = fma(_5001, _4993, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5017 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4871 = _5011;
                    _4839 = _5015;
                    _4863 = _5007;
                    _4809 = _5013;
                    _4803 = _5009;
                    _4857 = _5017;
                    _4933 = true;
                }
                else
                {
                    _4871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4839 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4863 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4803 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4857 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4933 = false;
    float _5019 = _4871;
    float _5021 = _4839;
    float _5023 = _4863;
    float _5025 = _4809;
    float _5027 = _4803;
    float _5029 = _4857;
    float _5031 = _4853 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5033 = fma(_4783, -0.5, 0.5);
    float _5035 = precise::clamp(_5033, 0.0, 1.0);
    float _5037 = -_5019;
    float _5039 = _5037 + _5021;
    float _5041 = -_5023;
    float _5043 = _5041 + _5025;
    out.m_100.x = 0.0;
    float _5045 = fma(_5035, _5039, _5019);
    float _5047 = -_5027;
    float _5049 = _5047 + _5029;
    float _5051 = fma(_5035, _5043, _5023);
    float _5053 = _5045 * 0.586610972881317138671875;
    bool _5055 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5057 = fma(_5035, _5049, _5027);
    out.m_53.x = _5031;
    float _5059 = fma(_5051, 0.298911988735198974609375, _5053);
    bool _5061 = _4246 > 0.0;
    bool _5063 = isnan(_4246);
    bool _5065 = _5061 || _5063;
    bool _5067 = isnan(0.0);
    bool _5069 = _5065 || _5067;
    float _5071 = fma(_5057, 0.114477999508380889892578125, _5059);
    float _5073 = -_5071;
    float _5075 = _5051 + _5073;
    float _5077 = -_5071;
    float _5079 = _5045 + _5077;
    float _5081 = -_5071;
    float _5083 = _5057 + _5081;
    float _5085 = fma(_5075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    float _5087 = fma(_5079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    float _5089 = fma(_5083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    bool _5091 = !_5055;
    if (!_5091)
    {
        float _5093 = -_4186;
        float _5095 = _5093 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5097 = -_4188;
        float _5099 = _5097 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5101 = -_4190;
        float _5103 = _5101 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5105 = _5095 * _5095;
        float _5107 = fma(_5099, _5099, _5105);
        float _5109 = fma(_5103, _5103, _5107);
        float _5111 = sqrt(_5109);
        float _5113 = rsqrt(_5109);
        float _5115 = -_5111;
        float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5119 = _5117 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5121 = precise::clamp(_5119, 0.0, 1.0);
        float _5123 = _5099 * _5113;
        float _5125 = _5095 * _5113;
        float _5127 = abs(_5121);
        float _5129 = log2(_5127);
        float _5131 = _5103 * _5113;
        float _5133 = _5123 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5135 = _4783 * _5125;
        float _5137 = -_5125;
        float _5139 = -_5133;
        float _5141 = fma(_5137, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5139);
        float _5143 = fma(_4781, _5123, _5135);
        float _5145 = -_5131;
        float _5147 = fma(_5145, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5141);
        float _5149 = fma(_4785, _5131, _5143);
        float _5151 = precise::clamp(_5149, 0.0, 1.0);
        float _5153 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5155 = _5147 + _5153;
        float _5157 = _5129 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5159 = _5155 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5161 = precise::clamp(_5159, 0.0, 1.0);
        float _5163 = exp2(_5157);
        float _5165 = _5163 * _5161;
        float _5167 = _5151 * _5165;
        float _5169 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5171 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5173 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5169;
        out.m_100.y = _5171;
        out.m_100.z = _5173;
    }
    out.m_102.x = _5085;
    out.m_102.y = _5087;
    out.m_102.z = _5089;
    if (_5069)
    {
        return out;
    }
    float _5175 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5175;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4933 = false;
    bool _677 = false;
    bool _495 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5243 = as_type<float>(_145);
        out.gl_Position.z = _5243;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5306 = as_type<float>(_177);
        out.gl_Position.z = _5306;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_211;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _183 * _189;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _219);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    bool _229 = !_207;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_181, _199, _225);
    float _235 = fma(_185, _191, _223);
    float _237 = fma(_185, _197, _227);
    float _239 = fma(_185, _203, _233);
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = 1.0 / _279;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _297 = 1.0 / _287;
    float _299 = 1.0 / _283;
    float _301 = _271 * _293;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _263 + _303;
    float _307 = 1.0 / _291;
    float _309 = _267 * _297;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_321;
    float _325 = _323 + 1.0;
    float _327 = _275 * _299;
    bool _329 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_263);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_263);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _339 * _325;
    bool _355 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_263);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _305 * _307;
    float _369 = -_339;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    bool _381 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_263);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = _351 * _371;
    float _395 = -_351;
    float _397 = _395 + 1.0;
    float _399 = fma(_375, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_379, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = _365 * _397;
    float _409 = -_365;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = -_391;
    float _419 = _417 + 1.0;
    float _421 = fma(_405, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = _391 * _411;
    float _425 = fma(_415, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    float _435 = _399 * _423;
    float _437 = _401 * _423;
    float _439 = fma(_429, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_433, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _435);
    float _445 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _437);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _455 = fma(_421, _407, _443);
    float _457 = fma(_425, _407, _445);
    float _459 = fma(_449, _367, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _461 = fma(_453, _367, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _463 = fma(_439, _393, _455);
    float _465 = fma(_441, _393, _457);
    float _467 = fma(_459, _353, _463);
    float _469 = fma(_461, _353, _465);
    float _471 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[147].x, _467);
    float _473 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[147].y, _469);
    bool _475 = !_295;
    float _493;
    if (!_475)
    {
        float _477 = in.m_66.x;
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _481 = _477 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        _493 = _171;
    }
    _495 = false;
    float _497 = _493;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _497 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _511 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_497);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _527 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _529 = isnan(_497);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = 1.0 / _505;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _541;
    float _545 = -_521;
    float _547 = _545 + 1.0;
    bool _549 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _551 = isnan(_497);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _563 = 1.0 / _509;
    float _565 = 1.0 / _525;
    float _567 = _543 * _539;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = _537 * _547;
    float _575 = -_537;
    float _577 = _575 + 1.0;
    float _579 = fma(_567, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _581;
    float _585 = _559 * _577;
    float _587 = _571 * _563;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _591 = _497 + _589;
    bool _593 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _595 = isnan(_497);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _579 * _585;
    float _607 = -_559;
    float _609 = _607 + 1.0;
    float _611 = fma(_587, _591, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _615 = _497 + _613;
    float _617 = _583 * _565;
    float _619 = -_603;
    float _621 = _619 + 1.0;
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _605);
    float _625 = fma(_617, _615, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _627 = _521 * _621;
    float _629 = fma(_611, _573, _623);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _633 = fma(_625, _627, _629);
    float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[118].x, _633);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _641 = in.m_68.x;
    float _643 = in.m_68.y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _635;
    out.m_70.y = _649;
    out.m_70.z = _651;
    out.m_70.w = _647;
    float _653 = _473 * _643;
    float _655 = _471 * _641;
    bool _657 = !_561;
    float _675;
    if (!_657)
    {
        float _659 = in.m_66.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _171;
    }
    _677 = false;
    float _679 = _675;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _683 = _679 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _689 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _691 = isnan(_679);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _707 = isnan(_679);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _717;
    bool _721 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _723 = isnan(_679);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = 1.0 / _687;
    float _735 = -_699;
    float _737 = _735 + 1.0;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _741 = 1.0 / _703;
    float _743 = _719 * _733;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _749 = -_731;
    float _751 = _749 + 1.0;
    float _753 = fma(_743, _683, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _755 = _715 * _737;
    float _757 = -_715;
    float _759 = _757 + 1.0;
    float _761 = _699 * _751;
    float _763 = _747 * _741;
    float _765 = _753 * _755;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _769 = _679 + _767;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[131].x, _765);
    float _773 = fma(_763, _769, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _777 = fma(_773, _761, _771);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _785 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[133].x, _777);
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _785 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _781;
    out.m_72.y = _787;
    out.m_72.z = _789;
    out.m_72.w = _791;
    bool _793 = !_739;
    float _795 = _789;
    float _797 = _791;
    if (!_793)
    {
        float _799 = in.m_66.x;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _803 = _799 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _173 = _813;
    }
    float _815 = _173;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _819 = int(_817);
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _823 = _821 != 0;
    float _825 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _827 = int(_825);
    float _829 = float(_819);
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _833 = int(_831);
    if (_823)
    {
        _795 = 1.0;
    }
    float _835 = _795;
    float _837 = _835;
    if (_823)
    {
        _797 = 1.0;
    }
    float _839 = _797;
    int _841 = 0;
    float _843 = _839;
    if (_823)
    {
        _841 = 0;
    }
    int _845 = _841;
    float _847 = float(_827);
    float _849 = 1.0 / _829;
    float _851 = 1.0 / _847;
    float _853 = float(uint(_833));
    int _855 = ~_833;
    int _857 = _855 + 1;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _861 = int(_859);
    float _863 = _849 * _127;
    float _865 = _849;
    float _867 = _847;
    int _869 = _845;
    if (_823)
    {
        float _871 = in.m_66.x;
        float _873 = in.m_66.y;
        _865 = _871;
        _867 = _873;
    }
    float _875 = _865;
    float _877 = _867;
    float _879 = _851 * _127;
    float _881 = 1.0 / _853;
    float _883 = float(uint(_861));
    float _885 = trunc(_863);
    int _887 = int(_885);
    float _889 = 1.0 / _883;
    int _891 = as_type<int>(_881) + (-2);
    float _893 = 0.0;
    float _895 = _875;
    float _897 = _877;
    if (_823)
    {
        _893 = _877;
    }
    float _899 = _893;
    float _901 = trunc(_879);
    int _903 = int(_901);
    float _905 = float(uint(_887));
    float _907 = as_type<float>(_891) * _905;
    float _909 = _905;
    float _911 = _899;
    if (_823)
    {
        _909 = _875;
    }
    float _913 = _909;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _917 = int(_915);
    int _919 = as_type<int>(_889) + (-2);
    float _921 = 0.0;
    float _923 = _913;
    if (_823)
    {
        _921 = _913;
    }
    float _925 = _921;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _929 = int(_927);
    float _931 = float(uint(_903));
    float _933 = as_type<float>(_919) * _931;
    int _935 = as_type<int>(_931);
    float _937 = _925;
    if (_823)
    {
        _935 = 0;
    }
    int _939 = _935;
    float _941 = trunc(_907);
    float _943 = precise::max(_941, 0.0);
    uint _946 = uint(_943);
    float _948 = float(uint(_917));
    float _950 = 1.0 / _948;
    float _952 = float(_929);
    float _954 = trunc(_933);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = 1.0 / _952;
    float _962 = _952;
    int _964 = _939;
    if (_823)
    {
        _962 = _913;
    }
    float _966 = _962;
    float _968 = _966;
    if (!_823)
    {
        float _970 = in.m_66.x;
        float _972 = in.m_66.y;
        float _974 = in.m_66.z;
        float _976 = _970 * 3.1415927410125732421875;
        float _978 = _976 * 0.15915493667125701904296875;
        float _980 = _972 * 3.1415927410125732421875;
        float _982 = _980 * 0.15915493667125701904296875;
        float _984 = _978 * 6.283185482025146484375;
        float _986 = sin(_984);
        float _988 = _982 * 6.283185482025146484375;
        float _990 = sin(_988);
        _837 = 7.345489978790283203125;
        _895 = _970;
        _843 = 5.839270114898681640625;
        _968 = _974;
        _923 = _972;
        _897 = _972;
        _964 = 1;
        _937 = _986;
        _911 = _990;
        _869 = 2;
    }
    float _992 = _837;
    float _994 = _895;
    float _996 = _843;
    float _998 = _968;
    float _1000 = _923;
    float _1002 = _897;
    int _1004 = _964;
    float _1006 = _937;
    float _1008 = _911;
    int _1010 = _869;
    int _1012 = _857 * int(_946);
    int _1014 = _1012 + _887;
    float _1016 = in.m_66.z;
    float _1018 = in.m_66.w;
    int _1020 = ~_861;
    int _1022 = _1020 + 1;
    float _1024 = _992 * _994;
    float _1026 = _996 * _998;
    float _1028 = float(uint(_1014));
    float _1030 = _992 * _1000;
    int _1032 = _1022 * int(_958);
    int _1034 = _1032 + _903;
    float _1036 = floor(_1024);
    int _1038 = as_type<int>(_950) + (-2);
    float _1040 = as_type<float>(_891) * _1028;
    float _1042 = _960 * _127;
    float _1044 = float(uint(_1034));
    float _1046 = in.m_60.w;
    float _1048 = float(_833);
    float _1050 = floor(_1026);
    float _1052 = as_type<float>(_919) * _1044;
    float _1054 = float(_887);
    bool _1056 = _1002 > 0.5;
    bool _1058 = _1054 >= _1048;
    bool _1060 = isnan(_1054);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(_1048);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = trunc(_1042);
    int _1072 = int(_1070);
    bool _1074 = _1018 > 0.5;
    float _1076 = -_1036;
    float _1078 = _1024 + _1076;
    bool _1080 = _1016 > 0.5;
    float _1082 = _1078 * _1048;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1086 = _1084 != 0;
    float _1088 = trunc(_1052);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = -_1050;
    float _1096 = _1026 + _1094;
    int _1098 = ~_861;
    int _1100 = _1098 + 1;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1112 = _1110 != 0;
    float _1114 = -_217;
    int _1116 = _1080 ? as_type<int>(_1114) : as_type<int>(_217);
    float _1118 = trunc(_1040);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = float(uint(_1072));
    int _1126 = int(_1074);
    int _1128 = _1080 ? 2 : 0;
    int _1130 = _1126 | _1128;
    int _1132 = _1086 ? 4 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1104 ? 8 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1108 ? 16 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1112 ? 32 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = _1056 ? 64 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = _1150 & 64;
    float _1154 = as_type<float>(_1038) * _1124;
    float _1156 = -_231;
    int _1158 = _1056 ? as_type<int>(_1156) : as_type<int>(_231);
    float _1160 = trunc(_1068);
    int _1162 = int(_1160);
    int _1164 = int(_958) + int(_1092);
    bool _1166 = !_1112;
    float _1168 = _1166 ? _217 : as_type<float>(_1116);
    float _1170 = float(_861);
    bool _1172 = !_1086;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = trunc(_1154);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = !_1108;
    float _1184 = _1182 ? _231 : as_type<float>(_1158);
    int _1186 = int(_946) + int(_1122);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1198 = _1196 != 0;
    int _1200 = _1100 * _1164;
    int _1202 = _1200 + _903;
    int _1204 = ~_833;
    int _1206 = _1204 + 1;
    float _1208 = floor(_1030);
    float _1210 = float(_903);
    bool _1212 = !_1194;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = _1206 * _1186;
    int _1218 = _1216 + _887;
    bool _1220 = uint(_1202) >= uint(_861);
    float _1222 = _1096 * _1170;
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1230 = log2(_1228);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    bool _1236 = uint(_1218) >= uint(_833);
    bool _1238 = _1210 >= _1170;
    bool _1240 = isnan(_1210);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(_1170);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    bool _1250 = !_1198;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1222);
    int _1256 = int(_1254);
    bool _1258 = !_1234;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = -_1208;
    float _1264 = _1030 + _1262;
    bool _1266 = !_1220;
    int _1268 = _1266 ? 0 : (-1);
    bool _1270 = !_1236;
    int _1272 = _1270 ? 0 : (-1);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1284 = _1282 != 0;
    float _1286 = trunc(_1082);
    int _1288 = int(_1286);
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1292 = _1290 != 0;
    int _1294 = ~_917;
    int _1296 = _1294 + 1;
    int _1298 = ~_1164;
    int _1300 = _1298 + _1268;
    int _1302 = _1300 + 1;
    int _1304 = ~_1186;
    int _1306 = _1304 + _1272;
    int _1308 = _1306 + 1;
    float _1310 = trunc(_1248);
    int _1312 = int(_1310);
    int _1314 = abs(_1174);
    int _1316 = _1296 * int(_1180);
    int _1318 = _1316 + _1072;
    bool _1320 = !_1292;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _861 * _1302;
    int _1326 = _1324 + _903;
    bool _1328 = _833 == 0;
    int _1330 = abs(_1322);
    int _1332 = _1288 * _1314;
    int _1334 = _1332 + _887;
    float _1336 = float(uint(_1318));
    int _1338 = _833 * _1308;
    int _1340 = _1338 + _887;
    bool _1342 = !_1280;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _1256 * _1330;
    int _1348 = _1346 + _903;
    float _1350 = _167 * _127;
    bool _1352 = !_1276;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = _1152 != 0;
    float _1358 = _1048 * _1350;
    bool _1360 = _861 == 0;
    float _1362 = as_type<float>(_1038) * _1336;
    int _1364 = ~_1162;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = _1170 * _1350;
    bool _1372 = !_1328;
    int _1374 = _1372 ? _1340 : (-1);
    float _1376 = trunc(_1358);
    int _1378 = int(_1376);
    int _1380 = ~_1312;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    bool _1386 = !_1360;
    int _1388 = _1386 ? _1326 : (-1);
    int _1390 = _1374 * _1368;
    int _1392 = _833 + (-1);
    int _1394 = _861 + (-1);
    float _1396 = trunc(_1362);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    int _1402 = _1388 * _1384;
    int _1404 = abs(_1344);
    int _1406 = _1162 * _1392;
    int _1408 = _1406 + _1390;
    int _1410 = abs(_1214);
    int _1412 = _1312 * _1394;
    int _1414 = _1412 + _1402;
    int _1416 = abs(_1226);
    int _1418 = _1408 * _1410;
    float _1420 = trunc(_1370);
    int _1422 = int(_1420);
    int _1424 = ~_917;
    int _1426 = _1424 + 1;
    int _1428 = _1414 * _1404;
    int _1430 = abs(_1252);
    int _1432 = _1378 * _1416;
    int _1434 = _1432 + _1418;
    int _1436 = abs(_1260);
    int _1438 = int(_1180) + int(_1400);
    int _1440 = _1334 * _1430;
    int _1442 = _1440 + _1434;
    int _1444 = abs(_1354);
    int _1446 = _1426 * _1438;
    int _1448 = _1446 + _1072;
    float _1450 = -_217;
    int _1452 = _1074 ? as_type<int>(_1450) : as_type<int>(_217);
    int _1454 = _1288 * _1436;
    int _1456 = _1454 + _1442;
    bool _1458 = !_1284;
    int _1460 = _1458 ? 0 : 1;
    int _1462 = _1422 * _1444;
    int _1464 = _1462 + _1428;
    bool _1466 = uint(_1448) >= uint(_917);
    float _1468 = float(uint(_1456));
    float _1470 = float(_917);
    float _1472 = -_231;
    int _1474 = _1080 ? as_type<int>(_1472) : as_type<int>(_231);
    float _1476 = float(_1072);
    float _1478 = _1470 * _1350;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1482 = _1480 != 0;
    float _1484 = _1264 * _1470;
    int _1486 = abs(_1460);
    float _1488 = as_type<float>(_891) * _1468;
    bool _1490 = _1476 >= _1470;
    bool _1492 = isnan(_1476);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(_1470);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = trunc(_1478);
    int _1504 = int(_1502);
    bool _1506 = !_1482;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = _1348 * _1486;
    int _1512 = _1510 + _1464;
    bool _1514 = !_1104;
    float _1516 = _1514 ? _217 : as_type<float>(_1452);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1520 = _1518 != 0;
    int _1522 = abs(_1508);
    float _1524 = trunc(_1488);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    bool _1530 = !_1466;
    int _1532 = _1530 ? 0 : (-1);
    bool _1534 = !_1520;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1552 = _1550 != 0;
    int _1554 = ~_1438;
    int _1556 = _1554 + _1532;
    int _1558 = _1556 + 1;
    float _1560 = trunc(_1500);
    int _1562 = int(_1560);
    bool _1564 = !_1544;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1570 = _1568 != 0;
    int _1572 = _1256 * _1522;
    int _1574 = _1572 + _1512;
    int _1576 = ~_833;
    int _1578 = _1576 + 1;
    int _1580 = _917 * _1558;
    int _1582 = _1580 + _1072;
    bool _1584 = !_1540;
    int _1586 = _1584 ? 0 : 1;
    float _1588 = trunc(_1484);
    int _1590 = int(_1588);
    float _1592 = float(uint(_1574));
    int _1594 = _1578 * int(_1528);
    int _1596 = _1594 + _1456;
    bool _1598 = _917 == 0;
    int _1600 = abs(_1566);
    float _1602 = as_type<float>(_919) * _1592;
    float _1604 = float(uint(_1596));
    float _1606 = _1592;
    float _1608 = as_type<float>(_1528);
    float _1610 = _1362;
    float _1612 = as_type<float>(_1010);
    if (_1570)
    {
        float _1614 = in.m_66.w;
        _1606 = _1614;
    }
    float _1616 = _1606;
    int _1618 = ~_1562;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    float _1624 = trunc(_1602);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    bool _1630 = !_1598;
    int _1632 = _1630 ? _1582 : (-1);
    float _1634 = as_type<float>(_891) * _1604;
    int _1636 = abs(_1536);
    int _1638 = abs(_1586);
    int _1640 = _1632 * _1622;
    int _1642 = _917 + (-1);
    float _1644 = trunc(_1634);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = _1590 * _1636;
    int _1652 = _1650 + _1072;
    bool _1654 = !_1548;
    int _1656 = _1654 ? 0 : 1;
    int _1658 = _1562 * _1642;
    int _1660 = _1658 + _1640;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1664 = _1662 != 0;
    int _1666 = _1660 * _1600;
    int _1668 = ~_861;
    int _1670 = _1668 + 1;
    int _1672 = ~_833;
    int _1674 = _1672 + 1;
    int _1676 = _1504 * _1638;
    int _1678 = _1676 + _1666;
    int _1680 = abs(_1656);
    int _1682 = _1670 * int(_1628);
    int _1684 = _1682 + _1574;
    float _1686 = as_type<float>(_1666);
    if (_1570)
    {
        float _1688 = _1616 * 3.1415927410125732421875;
        _1686 = _1688;
    }
    float _1690 = _1686;
    int _1692 = int(_1528) + int(_1648);
    int _1694 = _1652 * _1680;
    int _1696 = _1694 + _1678;
    float _1698 = float(uint(_1684));
    if (_1570)
    {
        float _1700 = _1690 * 0.15915493667125701904296875;
        _1608 = _1700;
    }
    float _1702 = _1608;
    bool _1704 = !_1552;
    int _1706 = _1704 ? 0 : 1;
    int _1708 = _1674 * _1692;
    int _1710 = _1708 + _1456;
    float _1712 = _1616;
    if (_1664)
    {
        float _1714 = in.m_66.x;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = as_type<float>(_919) * _1698;
    int _1720 = abs(_1706);
    float _1722 = _1702;
    if (_1570)
    {
        float _1724 = _1702 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        _1722 = _1726;
    }
    float _1728 = _1722;
    bool _1730 = uint(_1710) >= uint(_833);
    bool _1732 = !_1730;
    int _1734 = _1732 ? 0 : (-1);
    float _1736 = float(uint(_1334));
    float _1738 = trunc(_1718);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1746 = _1744 != 0;
    int _1748 = _1590 * _1720;
    int _1750 = _1748 + _1696;
    int _1752 = ~_1692;
    int _1754 = _1752 + _1734;
    int _1756 = _1754 + 1;
    float _1758 = as_type<float>(_891) * _1736;
    bool _1760 = !_1746;
    float _1762 = _1760 ? _231 : as_type<float>(_1474);
    float _1764 = float(uint(_1750));
    int _1766 = _833 * _1756;
    int _1768 = _1766 + _1456;
    bool _1770 = _833 == 0;
    float _1772 = trunc(_1758);
    float _1774 = precise::max(_1772, 0.0);
    uint _1776 = uint(_1774);
    bool _1778 = _1746;
    float _1780 = _1764;
    if (_1570)
    {
        bool _1782 = _1728 > 0.5;
        _1778 = _1782;
    }
    bool _1784 = _1778;
    bool _1786 = !_1770;
    int _1788 = _1786 ? _1768 : (-1);
    float _1790 = 0.0;
    if (!_1570)
    {
        _1790 = _231;
    }
    float _1792 = _1790;
    int _1794 = int(_1628) + int(_1742);
    float _1796 = as_type<float>(_1038) * _1764;
    int _1798 = ~_833;
    int _1800 = _1798 + 1;
    float _1802 = _1792;
    if (_1664)
    {
        float _1804 = _1716 * 3.1415927410125732421875;
        _1780 = _1804;
    }
    float _1806 = _1780;
    float _1808 = _1806;
    if (_1570)
    {
        float _1810 = -_231;
        float _1812 = _1784 ? _1810 : _231;
        _1802 = _1812;
    }
    float _1814 = _1802;
    float _1816 = trunc(_1796);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = _1788 & 3;
    bool _1824 = _1822 != 0;
    if (_1664)
    {
        float _1826 = _1806 * 0.15915493667125701904296875;
        _1808 = _1826;
    }
    float _1828 = _1808;
    int _1830 = _1788 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = _1824 ? 0 : 1;
    float _1836 = _1828;
    if (_1664)
    {
        float _1838 = _1828 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        _1836 = _1840;
    }
    float _1842 = _1836;
    bool _1844 = uint(_1830) > 1u;
    int _1846 = _1800 * int(_1776);
    int _1848 = _1846 + _1334;
    float _1850 = float(uint(_1348));
    int _1852 = ~_917;
    int _1854 = _1852 + 1;
    int _1856 = ~_861;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_919) * _1850;
    float _1862 = float(uint(_1848));
    int _1864 = _1854 * int(_1820);
    int _1866 = _1864 + _1750;
    int _1868 = ~_1834;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = ~_861;
    int _1876 = _1874 + 1;
    float _1878 = as_type<float>(_891) * _1862;
    int _1880 = _1872;
    if (!_1844)
    {
        int _1882 = ~_1834;
        int _1884 = _1882 + 1;
        _1880 = _1884;
    }
    int _1886 = _1880;
    int _1888 = _1858 * _1794;
    int _1890 = _1888 + _1574;
    float _1892 = -_217;
    int _1894 = _1356 ? as_type<int>(_1892) : as_type<int>(_217);
    float _1896 = trunc(_1860);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    float _1902 = float(uint(_1866));
    bool _1904 = uint(_1830) >= 2u;
    bool _1906 = uint(_1890) >= uint(_861);
    float _1908 = as_type<float>(_1038) * _1902;
    int _1910 = _1904 ? 0 : 1;
    float _1912 = trunc(_1878);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    bool _1918 = _1830 != 3;
    bool _1920 = !_1906;
    int _1922 = _1920 ? 0 : (-1);
    bool _1924 = _1918;
    if (!_1664)
    {
        _1610 = _217;
    }
    float _1926 = _1610;
    int _1928 = ~_1794;
    int _1930 = _1928 + _1922;
    int _1932 = _1930 + 1;
    float _1934 = trunc(_1908);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    int _1940 = _1876 * int(_1900);
    int _1942 = _1940 + _1348;
    int _1944 = ~_1910;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    int _1950 = _861 * _1932;
    int _1952 = _1950 + _1574;
    int _1954 = _1948;
    float _1956 = _1926;
    float _1958 = 2.8025969286496341418474591665798e-45;
    if (_1918)
    {
        int _1960 = ~_1910;
        int _1962 = _1960 + 1;
        _1954 = _1962;
    }
    int _1964 = _1954;
    if (_1664)
    {
        bool _1966 = _1842 > 0.5;
        _1924 = _1966;
    }
    bool _1968 = _1924;
    bool _1970 = !_1360;
    int _1972 = _1970 ? _1952 : (-1);
    float _1974 = float(uint(_1942));
    int _1976 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1978 = _1976 != 0;
    if (_1664)
    {
        float _1980 = -_217;
        float _1982 = _1968 ? _1980 : _217;
        _1956 = _1982;
    }
    float _1984 = _1956;
    float _1986 = as_type<float>(_919) * _1974;
    int _1988 = _1972 & 3;
    bool _1990 = _1988 != 0;
    int _1992 = int(_1820) + int(_1938);
    bool _1994 = !_1978;
    float _1996 = _1994 ? _217 : as_type<float>(_1894);
    float _1998 = trunc(_1986);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    int _2004 = int(_1776) + int(_1916);
    bool _2006 = uint(_1988) > 1u;
    int _2008 = ~_917;
    int _2010 = _2008 + 1;
    int _2012 = _1972 & 3;
    bool _2014 = _2012 != 0;
    int _2016 = ~_833;
    int _2018 = _2016 + 1;
    int _2020 = _2010 * _1992;
    int _2022 = _2020 + _1750;
    int _2024 = _2014 ? 0 : 1;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2028 = _2026 != 0;
    int _2030 = _2018 * _2004;
    int _2032 = _2030 + _1334;
    float _2034 = float(uint(_1652));
    bool _2036 = !_2028;
    int _2038 = _2036 ? 0 : 1;
    bool _2040 = uint(_2022) >= uint(_917);
    float _2042 = as_type<float>(_1038) * _2034;
    int _2044 = ~_2024;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    int _2050 = _2048;
    if (!_2006)
    {
        int _2052 = ~_2024;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    float _2058 = trunc(_2042);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    bool _2064 = uint(_2032) >= uint(_833);
    bool _2066 = !_2040;
    int _2068 = _2066 ? 0 : (-1);
    bool _2070 = _1988 != 3;
    bool _2072 = !_2064;
    int _2074 = _2072 ? 0 : (-1);
    bool _2076 = uint(_1988) >= 2u;
    int _2078 = ~_1992;
    int _2080 = _2078 + _2068;
    int _2082 = _2080 + 1;
    int _2084 = ~_861;
    int _2086 = _2084 + 1;
    int _2088 = int(_1900) + int(_2002);
    int _2090 = _917 * _2082;
    int _2092 = _2090 + _1750;
    int _2094 = ~_917;
    int _2096 = _2094 + 1;
    int _2098 = _2076 ? 0 : 1;
    int _2100 = _2086 * _2088;
    int _2102 = _2100 + _1348;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2106 = _2104 != 0;
    int _2108 = ~_2098;
    int _2110 = _2108 + 1;
    int _2112 = _2110 + 1;
    int _2114 = _2112;
    float _2116 = as_type<float>(_2096);
    if (_2070)
    {
        int _2118 = ~_2098;
        int _2120 = _2118 + 1;
        _2114 = _2120;
    }
    int _2122 = _2114;
    int _2124 = _2096 * int(_2062);
    int _2126 = _2124 + _1652;
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2130 = _2128 != 0;
    bool _2132 = !_2106;
    int _2134 = _2132 ? 0 : 1;
    bool _2136 = uint(_2102) >= uint(_861);
    bool _2138 = !_1598;
    int _2140 = _2138 ? _2092 : (-1);
    bool _2142 = !_2130;
    int _2144 = _2142 ? 0 : 1;
    bool _2146 = !_2136;
    int _2148 = _2146 ? 0 : (-1);
    int _2150 = _2140 & 3;
    bool _2152 = _2150 != 0;
    int _2154 = _2140 & 3;
    bool _2156 = _2154 != 0;
    float _2158 = float(uint(_2126));
    int _2160 = _2152 ? 0 : 1;
    bool _2162 = uint(_2154) > 1u;
    float _2164 = as_type<float>(_1038) * _2158;
    int _2166 = ~_2160;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    float _2172 = trunc(_2164);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2184 = _2170;
    if (!_2162)
    {
        int _2186 = ~_2160;
        int _2188 = _2186 + 1;
        _2184 = _2188;
    }
    int _2190 = _2184;
    bool _2192 = uint(_2154) >= 2u;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2196 = ~_917;
    int _2198 = _2196 + 1;
    int _2200 = _2192 ? 0 : 1;
    bool _2202 = _2154 != 3;
    int _2204 = int(_2062) + int(_2176);
    int _2206 = ~_2200;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = _2198 * _2204;
    int _2214 = _2212 + _1652;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2218 = _2210;
    if (_2202)
    {
        int _2220 = ~_2200;
        int _2222 = _2220 + 1;
        _2218 = _2222;
    }
    int _2224 = _2218;
    bool _2226 = uint(_2214) >= uint(_917);
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2230 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2216);
    bool _2232 = !_2226;
    int _2234 = _2232 ? 0 : (-1);
    bool _2236 = _994 > 0.5;
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2242 = -_231;
    int _2244 = _2236 ? as_type<int>(_2242) : as_type<int>(_231);
    bool _2246 = _1004 != 1;
    float _2248 = 1.0 / _2240;
    float _2250 = in.m_46.x;
    float _2252 = in.m_46.y;
    float _2254 = in.m_46.z;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2260 = abs(_2056);
    int _2262 = abs(_2122);
    float _2264 = 1.0 / _2258;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2270 = ~_2004;
    int _2272 = _2270 + _2074;
    int _2274 = _2272 + 1;
    float _2276 = 0.0;
    int _2278 = _2260;
    if (!_2246)
    {
        _2276 = _1002;
    }
    float _2280 = _2276;
    float _2282 = _2280;
    if (_2246)
    {
        _2282 = _994;
    }
    float _2284 = _2282;
    int _2286 = _833 * _2274;
    int _2288 = _2286 + _1334;
    float _2290 = 0.0;
    if (!_2246)
    {
        _2290 = _1002;
    }
    float _2292 = _2290;
    float _2294 = 1.0 / _2268;
    float _2296 = _2292;
    if (!_2246)
    {
        _2116 = _1016;
    }
    float _2298 = _2116;
    float _2300 = 0.0;
    float _2302 = _2298;
    if (!_2246)
    {
        _2300 = _1016;
    }
    float _2304 = _2300;
    float _2306 = _2304;
    if (_2246)
    {
        _2296 = _994;
    }
    float _2308 = _2296;
    if (_2246)
    {
        _2302 = _1002;
    }
    float _2310 = _2302;
    float _2312 = _189 * _2252;
    float _2314 = _195 * _2252;
    float _2316 = _201 * _2252;
    float _2318 = _994 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2320 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2180);
    float _2322 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2324 = -_2178;
    float _2326 = fma(_2318, 2.0, _2324);
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2330 = fma(_2322, -2.0, _2182);
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2334 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2328);
    float _2336 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_2246)
    {
        _2306 = _1002;
    }
    float _2338 = _2306;
    float _2340 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2342 = _1010 != 2;
    float _2344 = fma(_2336, -2.0, _2332);
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2348 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2350 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2346);
    float _2352 = _1230 * _127;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2356 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2360 = -_2354;
    float _2362 = fma(_2340, 2.0, _2360);
    float _2364 = exp2(_2352);
    if (_2342)
    {
        _1612 = _994;
    }
    float _2366 = _1612;
    float _2368 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2358);
    float _2370 = _2366;
    if (_2342)
    {
        _1958 = _1002;
    }
    float _2372 = _1958;
    float _2374 = -_127;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2362);
    float _2378 = _2372;
    if (!_2342)
    {
        _2370 = _1016;
    }
    float _2380 = _2370;
    float _2382 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2320);
    if (!_2342)
    {
        _2378 = _994;
    }
    float _2384 = _2378;
    float _2386 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2334);
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2390 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2392 = _2390 != 0;
    float _2394 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2398 = -_2194;
    float _2400 = fma(_2388, 2.0, _2398);
    bool _2402 = !_2392;
    float _2404 = _2402 ? _231 : as_type<float>(_2244);
    float _2406 = -_2364;
    float _2408 = _2406 + 1.0;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2412 = fma(_2356, -2.0, _2396);
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2418 = -_2410;
    float _2420 = fma(_2348, 2.0, _2418);
    float _2422 = fma(_2394, -2.0, _2228);
    bool _2424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2426 = isnan(0.0);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2432 = _2428 || _2430;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2436 = _2434 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2440 = _2432 ? _2408 : 0.0;
    float _2442 = 1.0 / _2436;
    bool _2444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2446 = isnan(1.0);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2452 = _2448 || _2450;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2458 = 1.0 + _2456;
    float _2460 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2438);
    float _2462 = -_127;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2420);
    float _2466 = -_127;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2326);
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2472 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2454);
    float _2474 = _994 * 2.0;
    float _2476 = 1.0 / _2458;
    float _2478 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2230);
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2472);
    float _2484 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2330);
    float _2486 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2344);
    float _2488 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2480);
    float _2490 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2350);
    float _2492 = floor(_2474);
    float _2494 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2368);
    float _2496 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2488);
    float _2498 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2412);
    float _2500 = -_127;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2400);
    float _2504 = fma(_193, _2250, _2314);
    float _2506 = fma(_199, _2250, _2316);
    float _2508 = 1.0 / _2416;
    float _2510 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2422);
    if (_2452)
    {
        float _2512 = _2440 * _2476;
        _137 = _2512;
    }
    float _2514 = _137;
    float _2516 = _1002 * 2.0;
    float _2518 = fma(_187, _2250, _2312);
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2524 = fma(_203, _2254, _2506);
    float _2526 = fma(_197, _2254, _2504);
    bool _2528 = _2492 >= 0.0;
    bool _2530 = isnan(_2492);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    float _2538 = floor(_2516);
    float _2540 = fma(_191, _2254, _2518);
    float _2542 = _1016 * 2.0;
    int _2544 = _2536 ? 0 : 1;
    float _2546 = -_2470;
    float _2548 = _2546 + 1.0;
    bool _2550 = _2492 > 0.0;
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2552;
    float _2556 = 1.0 / _2522;
    int _2558 = ~_2544;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = -_2494;
    float _2566 = _2564 + 1.0;
    float _2568 = _2554 * _2248;
    float _2570 = -_2482;
    float _2572 = _2570 + 1.0;
    bool _2574 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2576 = isnan(_815);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2582 = _2578 || _2580;
    float _2584 = float(_2582);
    float _2586 = -_2496;
    float _2588 = _2586 + 1.0;
    bool _2590 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2592 = isnan(_815);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2598 = _2594 || _2596;
    float _2600 = float(_2598);
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2602;
    int _2606 = _2562;
    if (!_2550)
    {
        int _2608 = ~_2544;
        int _2610 = _2608 + 1;
        _2606 = _2610;
    }
    int _2612 = _2606;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2618 = _2538 >= 0.0;
    bool _2620 = isnan(_2538);
    bool _2622 = _2618 || _2620;
    bool _2624 = isnan(0.0);
    bool _2626 = _2622 || _2624;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2632 = _2616 * _2556;
    int _2634 = _2626 ? 0 : 1;
    float _2636 = _2630 * _2442;
    bool _2638 = _2538 > 0.0;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2640;
    float _2644 = floor(_2542);
    int _2646 = ~_2088;
    int _2648 = _2646 + _2148;
    int _2650 = _2648 + 1;
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2656 = _2604 * _2508;
    float _2658 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2660 = _815 + _2658;
    int _2662 = _861 * _2650;
    int _2664 = _2662 + _1348;
    int _2666 = ~_2634;
    int _2668 = _2666 + 1;
    int _2670 = _2668 + 1;
    float _2672 = 1.0 / _2654;
    bool _2674 = !_1832;
    int _2676 = _2674 ? 0 : 1;
    float _2678 = fma(_2568, _2660, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2680 = _2670;
    if (!_2638)
    {
        int _2682 = ~_2634;
        int _2684 = _2682 + 1;
        _2680 = _2684;
    }
    int _2686 = _2680;
    float _2688 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2690 = _2688 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2692 = !_1360;
    int _2694 = _2692 ? _2664 : (-1);
    float _2696 = -_2584;
    float _2698 = _2696 + 1.0;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2702 = _2700 != 0;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2706 = _2704 != 0;
    int _2708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2710 = _2708 != 0;
    float _2712 = _2690 * _2264;
    bool _2714 = _2644 >= 0.0;
    bool _2716 = isnan(_2644);
    bool _2718 = _2714 || _2716;
    bool _2720 = isnan(0.0);
    bool _2722 = _2718 || _2720;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2726 = _815 + _2724;
    bool _2728 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2730 = isnan(_815);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2740;
    bool _2744 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2746 = isnan(_815);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2752 = _2748 || _2750;
    float _2754 = float(_2752);
    float _2756 = fma(_2632, _2726, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2758 = _2722 ? 0 : 1;
    float _2760 = _2642 * _2672;
    bool _2762 = _2644 > 0.0;
    float _2764 = _2738 * _2698;
    float _2766 = -_2738;
    float _2768 = _2766 + 1.0;
    bool _2770 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2772 = isnan(_815);
    bool _2774 = _2770 || _2772;
    bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2778 = _2774 || _2776;
    float _2780 = float(_2778);
    float _2782 = -_2754;
    float _2784 = _2782 + 1.0;
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2788 = _815 + _2786;
    float _2790 = _2754 * _2768;
    bool _2792 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2794 = isnan(_815);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2800 = _2796 || _2798;
    float _2802 = float(_2800);
    float _2804 = _2780 * _2784;
    float _2806 = fma(_2656, _2788, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2810 = _815 + _2808;
    float _2812 = in.m_62.w;
    float _2814 = -_2780;
    float _2816 = _2814 + 1.0;
    bool _2818 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2820 = isnan(_815);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = fma(_2636, _2810, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2832 = -_2802;
    float _2834 = _2832 + 1.0;
    int _2836 = _1972 >> 31;
    float _2838 = _2802 * _2816;
    float _2840 = -_2828;
    float _2842 = _2840 + 1.0;
    float _2844 = in.m_64.w;
    float _2846 = _2828 * _2834;
    float _2848 = _2742 * _2294;
    bool _2850 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2852 = isnan(_815);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2864 = _815 + _2862;
    int _2866 = _2836 & 3;
    float _2868 = -_2600;
    float _2870 = _2868 + 1.0;
    float _2872 = _2600 * _2842;
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _815 + _2874;
    float _2878 = fma(_2848, _2864, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2880 = _1972 + _2866;
    float _2882 = _2860 * _2870;
    float _2884 = fma(_2712, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2886 = -_2860;
    float _2888 = _2886 + 1.0;
    int _2890 = _2880 >> 2;
    float _2892 = _2678 * _2882;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2896 = _815 + _2894;
    float _2898 = _1002 + _994;
    int _2900 = _2890 << 4;
    int _2902 = _2900 + 656;
    float _2904 = fma(_2888, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2892);
    float _2906 = fma(_2760, _2896, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2908 = _2526 + _2812;
    float _2910 = _2540 + _1046;
    float _2912 = fma(_2756, _2872, _2904);
    uint _2914 = uint(int(uint(_2902) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2932 = _2908 + _2930;
    float _2934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2936 = _2910 + _2934;
    int _2938 = ~_2758;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = _2524 + _2844;
    float _2946 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2948 = _2942;
    float _2950 = _2790;
    if (!_2762)
    {
        int _2952 = ~_2758;
        int _2954 = _2952 + 1;
        _2948 = _2954;
    }
    int _2956 = _2948;
    float _2958 = fma(_2806, _2846, _2912);
    bool _2960 = !_1990;
    int _2962 = _2960 ? 0 : 1;
    float _2964 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2946);
    bool _2966 = _1988 != 3;
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2970 = _2944 + _2968;
    float _2972 = _994 + _1016;
    float _2974 = _994 + (-0.5);
    bool _2976 = !_2966;
    int _2978 = _2976 ? 0 : (-1);
    float _2980 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2964);
    float _2982 = fma(_2830, _2838, _2958);
    int _2984 = _2902 + 8;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    float _3002 = _2898 + (-1.0);
    bool _3004 = _2980 >= 0.0;
    float _3006 = _1814 + 0.5;
    float _3008 = fma(_2878, _2804, _2982);
    float _3010 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3012 = _1002 + _1016;
    float _3014 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2464);
    float _3016 = _1002 + (-0.5);
    float _3018 = _2404 + 0.5;
    float _3020 = _1984 + (-0.5);
    float _3022 = fma(_2884, _2790, _3008);
    float _3024 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2468);
    float _3026 = -_3020;
    float _3028 = -_2486;
    float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3028);
    int _3032 = ~_2260;
    int _3034 = _3032 + 1;
    int _3036 = _3034 + 1;
    float _3038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3004)
    {
        _2950 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3040 = _2950;
    float _3042 = fma(_2906, _2764, _3022);
    int _3044 = abs(_2962);
    float _3046 = -_2382;
    float _3048 = _3046 + 1.0;
    if (_3004)
    {
        float _3050 = _3040 * 5.0;
        _2278 = as_type<int>(_3050);
    }
    int _3052 = _2278;
    bool _3054 = !_2702;
    int _3056 = _3054 ? 0 : 1;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3060 = -_3048;
    float _3062 = fma(_3060, _1814, _3014);
    float _3064 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_3004)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9506 = as_type<float>(_3052);
        out.gl_Position.z = _9506;
    }
    int _3066 = abs(_3056);
    float _3068 = fma(_2584, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3042);
    int _3070 = _3036 * as_type<int>(_2928);
    float _3072 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3074 = int(_3072);
    float _3076 = -_2386;
    float _3078 = _3076 + 1.0;
    float _3080 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3082 = ~_3044;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = _1996 + (-0.5);
    float _3090 = fma(_3078, _1984, _3030);
    int _3092 = ~_2204;
    int _3094 = _3092 + _2234;
    int _3096 = _3094 + 1;
    float _3098 = _1762 + 0.5;
    int _3100 = _3086 * as_type<int>(_2920);
    int _3102 = _3100 + _3070;
    float _3104 = _2932 * _2932;
    float _3106 = fma(_3080, _3098, _2376);
    int _3108 = ~_2262;
    int _3110 = _3108 + 1;
    int _3112 = _3110 + 1;
    out.m_74.x = _3062;
    out.m_74.y = _3090;
    int _3114 = abs(_2978);
    float _3116 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3118 = abs(_3074);
    int _3120 = _3112 * as_type<int>(_2992);
    int _3122 = _3120 + _3102;
    float _3124 = float(uint(_3074));
    float _3126 = -_3088;
    float _3128 = -_2484;
    float _3130 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3128);
    int _3132 = abs(_2134);
    int _3134 = _917 * _3096;
    int _3136 = _3134 + _1652;
    int _3138 = ~_3114;
    int _3140 = _3138 + 1;
    int _3142 = _3140 + 1;
    float _3144 = fma(_2936, _2936, _3104);
    float _3146 = 1.0 / _3124;
    int _3148 = ~_3132;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = _1516 + (-0.5);
    float _3156 = fma(_2970, _2970, _3144);
    int _3158 = _3142 * as_type<int>(_3000);
    int _3160 = _3158 + _3122;
    int _3162 = _2140 >> 31;
    float _3164 = -_3116;
    float _3166 = -_2498;
    float _3168 = fma(_3164, _3154, _3166);
    float _3170 = float(uint(_3118));
    float _3172 = rsqrt(_3156);
    int _3174 = _3160 * _3152;
    int _3176 = _1788 >> 31;
    out.m_76.x = _3068;
    int _3178 = _3162 & 3;
    int _3180 = _2694 * _3132;
    int _3182 = _3180 + _3174;
    int _3184 = _3176 & 3;
    if (_3004)
    {
        out.m_53.x = 0.0;
    }
    float _3186 = 1.0 / _3170;
    int _3188 = as_type<int>(_3146) + (-2);
    float _3190 = float(uint(_3182));
    int _3192 = _1788 + _3184;
    float _3194 = _3064 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3196 = _2140 + _3178;
    float _3198 = as_type<float>(_3188) * _3190;
    float _3200 = float(_2956);
    float _3202 = _3194 * _3172;
    int _3204 = _3192 >> 2;
    float _3206 = in.m_78.x;
    float _3208 = in.m_78.y;
    float _3210 = in.m_78.z;
    int _3212 = abs(_3182);
    float _3214 = _2932 * _3202;
    float _3216 = trunc(_3198);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    float _3222 = _2936 * _3202;
    int _3224 = as_type<int>(_3186) + (-2);
    float _3226 = -_3214;
    float _3228 = _2932 + _3226;
    int _3230 = _3204 << 4;
    int _3232 = _3230 + 368;
    float _3234 = -_3222;
    float _3236 = _2936 + _3234;
    int _3238 = _3196 >> 2;
    float _3240 = _3228 * _3228;
    uint _3242 = uint(int(uint(_3232) >> uint(2)));
    uint _3244 = uint(int(uint(int(_3242)) >> uint(2)));
    int _3246 = int(_3242) & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    int _3250 = int(_3242) + 1;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    int _3254 = _3250 & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    float _3258 = float(uint(_3212));
    float _3260 = fma(_3236, _3236, _3240);
    int _3262 = ~_3074;
    int _3264 = _3262 + 1;
    float _3266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3268 = _3238 << 4;
    int _3270 = _3268 + 800;
    float _3272 = as_type<float>(_3224) * _3258;
    float _3274 = float(_3066);
    int _3276 = _3264 * int(_3220);
    int _3278 = _3276 + _3182;
    uint _3280 = uint(int(uint(_3270) >> uint(2)));
    uint _3282 = uint(int(uint(int(_3280)) >> uint(2)));
    int _3284 = int(_3280) & 3;
    float _3286 = (*spvDescriptorSet0.vp_c9)._m0[int(_3282)][_3284];
    int _3288 = int(_3280) + 1;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    int _3292 = _3288 & 3;
    float _3294 = (*spvDescriptorSet0.vp_c9)._m0[int(_3290)][_3292];
    int _3296 = abs(_2676);
    float _3298 = _3274 * _3200;
    float _3300 = -_2478;
    float _3302 = _3300 + 1.0;
    float _3304 = float(uint(_3278));
    float _3306 = trunc(_3272);
    float _3308 = precise::max(_3306, 0.0);
    uint _3310 = uint(_3308);
    float _3312 = -_2490;
    float _3314 = _3312 + 1.0;
    float _3316 = fma(_1996, _3302, _3130);
    float _3318 = _2970 * _3202;
    float _3320 = as_type<float>(_3188) * _3304;
    float _3322 = -_2548;
    float _3324 = fma(_2404, _3322, _3024);
    float _3326 = -_3314;
    float _3328 = fma(_1762, _3326, _3106);
    float _3330 = fma(_1516, _2566, _3168);
    float _3332 = _3298 * (-2.0);
    int _3334 = ~_3118;
    int _3336 = _3334 + 1;
    float _3338 = trunc(_3320);
    float _3340 = precise::max(_3338, 0.0);
    uint _3342 = uint(_3340);
    int _3344 = abs(_2038);
    float _3346 = fma(_3332, _3206, _3206);
    out.m_80.x = _3324;
    out.m_80.y = _3316;
    out.m_80.z = _3328;
    out.m_80.w = _3330;
    int _3348 = abs(_2144);
    float _3350 = -_3318;
    float _3352 = _2970 + _3350;
    int _3354 = _3336 * int(_3310);
    int _3356 = _3354 + _3212;
    float _3358 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3346);
    bool _3360 = _833 == 0;
    int _3362 = _3232 + 8;
    uint _3364 = uint(int(uint(_3362) >> uint(2)));
    uint _3366 = uint(int(uint(int(_3364)) >> uint(2)));
    int _3368 = int(_3364) & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    int _3372 = int(_3364) + 1;
    uint _3374 = uint(int(uint(_3372) >> uint(2)));
    int _3376 = _3372 & 3;
    float _3378 = (*spvDescriptorSet0.vp_c9)._m0[int(_3374)][_3376];
    float _3380 = float(_2612);
    float _3382 = fma(_3010, _3332, _3010);
    bool _3384 = !_3360;
    int _3386 = _3384 ? _2288 : (-1);
    float _3388 = fma(_3352, _3352, _3260);
    float _3390 = fma(_3382, _2514, _3358);
    int _3392 = int(_3220) + int(_3342);
    int _3394 = _3270 + 8;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c9)._m0[int(_3406)][_3408];
    float _3412 = float(uint(_3356));
    int _3414 = abs(_1886);
    int _3416 = abs(_2190);
    float _3418 = as_type<float>(_3224) * _3412;
    int _3420 = ~_3074;
    int _3422 = _3420 + 1;
    int _3424 = ~_3414;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    float _3430 = trunc(_3418);
    float _3432 = precise::max(_3430, 0.0);
    uint _3434 = uint(_3432);
    bool _3436 = !_2156;
    int _3438 = _3436 ? 0 : 1;
    int _3440 = _3422 * _3392;
    int _3442 = _3440 + _3182;
    bool _3444 = _1830 != 3;
    int _3446 = _3428 * as_type<int>(_3256);
    int _3448 = ~_3416;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    bool _3454 = !_3444;
    int _3456 = _3454 ? 0 : (-1);
    bool _3458 = uint(_3442) >= uint(_3074);
    int _3460 = _3452 * as_type<int>(_3294);
    int _3462 = abs(_3438);
    int _3464 = ~_3118;
    int _3466 = _3464 + 1;
    int _3468 = int(_3310) + int(_3434);
    int _3470 = ~_3296;
    int _3472 = _3470 + 1;
    int _3474 = _3472 + 1;
    bool _3476 = !_3458;
    int _3478 = _3476 ? 0 : (-1);
    int _3480 = _3466 * _3468;
    int _3482 = _3480 + _3212;
    bool _3484 = _2154 != 3;
    int _3486 = _3474 * as_type<int>(_3248);
    int _3488 = _3486 + _3446;
    int _3490 = ~_3392;
    int _3492 = _3490 + _3478;
    int _3494 = _3492 + 1;
    int _3496 = ~_3462;
    int _3498 = _3496 + 1;
    int _3500 = _3498 + 1;
    int _3502 = abs(_2224);
    int _3504 = _3074 * _3494;
    int _3506 = _3504 + _3182;
    bool _3508 = !_3484;
    int _3510 = _3508 ? 0 : (-1);
    int _3512 = _3500 * as_type<int>(_3286);
    int _3514 = _3512 + _3460;
    int _3516 = abs(_1964);
    float _3518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3520 = uint(_3482) >= uint(_3118);
    int _3522 = ~_3502;
    int _3524 = _3522 + 1;
    int _3526 = _3524 + 1;
    int _3528 = _3182 ^ _3074;
    int _3530 = ~_3516;
    int _3532 = _3530 + 1;
    int _3534 = _3532 + 1;
    int _3536 = _3526 * as_type<int>(_3402);
    int _3538 = _3536 + _3514;
    bool _3540 = !_3520;
    int _3542 = _3540 ? 0 : (-1);
    int _3544 = abs(_3456);
    int _3546 = _3534 * as_type<int>(_3370);
    int _3548 = _3546 + _3488;
    uint _3550 = uint(int(uint(_3528) >> uint(31)));
    int _3552 = abs(_3510);
    int _3554 = ~_3542;
    int _3556 = _3468 + _3554;
    int _3558 = _3556 + 1;
    int _3560 = ~_3544;
    int _3562 = _3560 + 1;
    int _3564 = _3562 + 1;
    int _3566 = ~int(_3550);
    int _3568 = _3566 + 1;
    int _3570 = _3564 * as_type<int>(_3378);
    int _3572 = _3570 + _3548;
    int _3574 = ~_3552;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    bool _3580 = _3074 == 0;
    int _3582 = _3558 ^ _3568;
    int _3584 = _3578 * as_type<int>(_3410);
    int _3586 = _3584 + _3538;
    int _3588 = ~_3344;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = _3518 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3596 = ~_3348;
    int _3598 = _3596 + 1;
    int _3600 = _3598 + 1;
    bool _3602 = !_3580;
    int _3604 = _3602 ? _3506 : (-1);
    int _3606 = _3572 * _3592;
    bool _3608 = _3074 == 0;
    int _3610 = _3586 * _3600;
    int _3612 = ~_3568;
    int _3614 = _3612 + _3582;
    int _3616 = _3614 + 1;
    int _3618 = _3386 * _3344;
    int _3620 = _3618 + _3606;
    float _3622 = float(_3604);
    float _3624 = _1168 + (-0.5);
    bool _3626 = !_3608;
    int _3628 = _3626 ? _3616 : (-1);
    bool _3630 = !_2706;
    int _3632 = _3630 ? 0 : 1;
    float _3634 = fma(_3594, _3622, _2502);
    float _3636 = float(_3628);
    float _3638 = _3266 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3640 = !_1598;
    int _3642 = _3640 ? _3136 : (-1);
    int _3644 = abs(_3632);
    float _3646 = -_2510;
    float _3648 = fma(_3638, _3636, _3646);
    float _3650 = _1184 + 0.5;
    int _3652 = _3642 * _3348;
    int _3654 = _3652 + _3610;
    float _3656 = float(_3620);
    float _3658 = -_3638;
    float _3660 = fma(_3658, _3624, _3648);
    float _3662 = fma(_3594, _3650, _3634);
    float _3664 = float(_3654);
    float _3666 = -_2572;
    float _3668 = fma(_1184, _3666, _3662);
    float _3670 = fma(_1168, _2588, _3660);
    float _3672 = float(_3644);
    out.m_82.x = _3656;
    out.m_82.w = _3664;
    float _3674 = _3672 * _3380;
    bool _3676 = !_2710;
    int _3678 = _3676 ? 0 : 1;
    out.m_84.x = _3668;
    out.m_84.y = _3670;
    float _3680 = _3210;
    if (_3004)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3682 = -_3214;
    float _3684 = _2908 + _3682;
    float _3686 = -_3222;
    float _3688 = _2910 + _3686;
    float _3690 = -_3318;
    float _3692 = _2944 + _3690;
    int _3694 = abs(_3678);
    float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3698 = _3684 + _3696;
    float _3700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3702 = _3688 + _3700;
    float _3704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3706 = _3692 + _3704;
    float _3708 = _3012 + (-1.0);
    float _3710 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3712 = float(_2686);
    float _3714 = _2972 + (-1.0);
    float _3716 = fma(_3708, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3718 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3710);
    float _3720 = float(_3694);
    float _3722 = _3674 * (-2.0);
    float _3724 = _3390 * 0.15915493667125701904296875;
    float _3726 = fma(_3706, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3718);
    float _3728 = sqrt(_3388);
    float _3730 = fma(_3722, _3208, _3208);
    float _3732 = fma(_3716, _3722, _3716);
    float _3734 = _3720 * _3712;
    bool _3736 = _3726 >= 0.0;
    float _3738 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3730);
    float _3740 = _3734 * (-2.0);
    float _3742 = _3724 * 6.283185482025146484375;
    float _3744 = sin(_3742);
    float _3746 = fma(_3732, _2514, _3738);
    float _3748 = _1016 + (-0.5);
    float _3750 = fma(_3714, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3752 = fma(_3740, _3210, _3210);
    float _3754 = _3746 * 0.15915493667125701904296875;
    float _3756 = fma(_3750, _3740, _3750);
    float _3758 = _3724 * 6.283185482025146484375;
    float _3760 = cos(_3758);
    float _3762 = _3706;
    float _3764 = _3688;
    if (_3736)
    {
        _3680 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3766 = _3680;
    float _3768 = fma(_3748, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3752);
    int _3770 = as_type<int>(_3766);
    if (_3736)
    {
        out.m_53.x = 0.0;
    }
    if (_3736)
    {
        float _3772 = _3766 * 5.0;
        _3770 = as_type<int>(_3772);
    }
    int _3774 = _3770;
    float _3776 = fma(_3756, _2514, _3768);
    float _3778 = _3754 * 6.283185482025146484375;
    float _3780 = sin(_3778);
    if (_3736)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10536 = as_type<float>(_3774);
        out.gl_Position.z = _10536;
    }
    float _3782 = _3776 * 0.15915493667125701904296875;
    float _3784 = _3754 * 6.283185482025146484375;
    float _3786 = cos(_3784);
    if (_3736)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3788 = _3782 * 6.283185482025146484375;
    float _3790 = cos(_3788);
    float _3792 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3794 = _3172 * _3728;
    float _3796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3798 = _3760 * _3786;
    float _3800 = _3744 * _3786;
    float _3802 = _3794 * _3792;
    float _3804 = _3064 * _3794;
    float _3806 = _3782 * 6.283185482025146484375;
    float _3808 = sin(_3806);
    float _3810 = _3760 * _3780;
    float _3812 = _3796 * _3802;
    float _3814 = _3744 * _3780;
    float _3816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _3818 = _3760 * _3790;
    float _3820 = _3744 * _3790;
    float _3822 = _3816 * _3804;
    float _3824 = _3786 * _3790;
    float _3826 = _3818 * _3812;
    float _3828 = _3780 * _3790;
    float _3830 = _3794 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3832 = _3830 * 0.5;
    float _3834 = fma(_3808, _3798, _3814);
    float _3836 = -_3800;
    float _3838 = fma(_3808, _3810, _3836);
    float _3840 = -_3812;
    float _3842 = _3808 * _3840;
    float _3844 = -_3810;
    float _3846 = fma(_3808, _3800, _3844);
    float _3848 = fma(_3834, _3822, _3826);
    float _3850 = _3820 * _3812;
    float _3852 = fma(_3824, _3822, _3842);
    float _3854 = fma(_3808, _3814, _3798);
    float _3856 = fma(_3838, _3832, _3848);
    float _3858 = fma(_3846, _3822, _3850);
    float _3860 = fma(_3828, _3832, _3852);
    float _3862 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3864 = fma(_3854, _3832, _3858);
    float _3866 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3868 = _3856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3870 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3862);
    float _3872 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3866);
    float _3874 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3868);
    float _3876 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3870);
    float _3878 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3872);
    float _3880 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3874);
    float _3882 = _3876 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3884 = _3878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3886 = _3684 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3888 = _2944 + _3882;
    float _3890 = _2910 + _3884;
    float _3892 = fma(_3688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3886);
    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3896 = _3888 + _3894;
    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3900 = _3890 + _3898;
    float _3902 = fma(_3692, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3892);
    float _3904 = _3896 * _3896;
    float _3906 = fma(_3900, _3900, _3904);
    float _3908 = _3880 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3910 = sqrt(_3906);
    float _3912 = _2908 + _3908;
    bool _3914 = _3910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3916 = _3892;
    float _3918 = _3880;
    float _3920 = _3908;
    if (!_3914)
    {
        _3916 = _3890;
    }
    float _3922 = _3916;
    float _3924 = _3922;
    if (!_3914)
    {
        _3918 = _3888;
    }
    float _3926 = _3918;
    float _3928 = _3926;
    if (!_3914)
    {
        _3920 = _3912;
    }
    float _3930 = _3920;
    bool _3932 = !_3914;
    float _3934 = _3930;
    if (!_3932)
    {
        float _3936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3940 = _3910 + _3938;
        float _3942 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3944 = rsqrt(_3906);
        float _3946 = _3940 * _3936;
        float _3948 = _3946 * 0.15915493667125701904296875;
        float _3950 = _3948 * 6.283185482025146484375;
        float _3952 = cos(_3950);
        float _3954 = _3948 * 6.283185482025146484375;
        float _3956 = sin(_3954);
        float _3958 = _3952 + (-1.0);
        float _3960 = fma(_3956, _3942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3962 = _3958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3964 = _3944 * _3960;
        float _3966 = fma(_3912, _3952, _3962);
        float _3968 = fma(_3900, _3964, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3970 = fma(_3896, _3964, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3934 = _3966;
        _3924 = _3968;
        _3928 = _3970;
    }
    float _3972 = _3934;
    float _3974 = _3924;
    float _3976 = _3928;
    float _3978 = -_2908;
    float _3980 = _3978 + _3972;
    float _3982 = -_2910;
    float _3984 = _3982 + _3974;
    float _3986 = -_2944;
    float _3988 = _3986 + _3976;
    float _3990 = _3902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3992 = _3980 * _3980;
    float _3994 = _3684 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3996 = 1.0 / _3990;
    float _3998 = fma(_3984, _3984, _3992);
    bool _4000 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4002 = isnan(0.5);
    bool _4004 = _4000 || _4002;
    bool _4006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4008 = _4004 || _4006;
    bool _4010 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4012 = isnan(0.5);
    bool _4014 = _4010 || _4012;
    bool _4016 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4018 = _4014 || _4016;
    float _4020 = fma(_3988, _3988, _3998);
    float _4022 = fma(_3688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3994);
    float _4024 = sqrt(_4020);
    float _4026 = fma(_3692, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4022);
    float _4028 = _4026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4030 = _4028 + _3990;
    float _4032 = _4030 * _3996;
    float _4034 = _4032 * 0.5;
    bool _4036 = _4024 > 0.0;
    float _4038 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4040 = fma(_4034, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4038);
    float _4042 = 1.0 / _4040;
    bool _4044 = !_4036;
    float _4046 = _3974;
    float _4048 = _3972;
    float _4050 = _3976;
    float _4052 = _3984;
    float _4054 = _3990;
    if (!_4044)
    {
        float _4056 = _237 * _237;
        float _4058 = rsqrt(_4020);
        float _4060 = fma(_235, _235, _4056);
        float _4062 = fma(_239, _239, _4060);
        float _4064 = sqrt(_4062);
        float _4066 = _3984 * _4058;
        float _4068 = _3980 * _4058;
        float _4070 = _3988 * _4058;
        bool _4072 = _4064 > 0.0;
        bool _4074 = !_4072;
        _4054 = _4064;
        if (!_4074)
        {
            float _4076 = rsqrt(_4062);
            float _4078 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4080 = _237 * _4076;
            float _4082 = _235 * _4076;
            float _4084 = _4068 * _4080;
            float _4086 = _239 * _4076;
            float _4088 = fma(_4066, _4082, _4084);
            float _4090 = _4078 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4092 = fma(_4070, _4086, _4088);
            float _4094 = _4092 * _4090;
            float _4096 = fma(_235, _4094, _3974);
            float _4098 = fma(_237, _4094, _3972);
            float _4100 = fma(_239, _4094, _3976);
            _4046 = _4096;
            _4048 = _4098;
            _4050 = _4100;
            _4052 = _4094;
            _4054 = _4086;
        }
    }
    float _4102 = _4046;
    float _4104 = _4048;
    float _4106 = _4050;
    float _4108 = _4052;
    float _4110 = _4054;
    float _4112 = -_3222;
    float _4114 = _4112 + _4102;
    float _4116 = -_3214;
    float _4118 = _4116 + _4104;
    float _4120 = -_3318;
    float _4122 = _4120 + _4106;
    float _4124 = _4110;
    float _4126 = _4118;
    float _4128 = _4114;
    float _4130 = _4122;
    float _4132 = _4108;
    if (_4018)
    {
        _4124 = 1.0;
    }
    float _4134 = _4124;
    float _4136 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4138 = _4042 * _4136;
    float _4140 = _4134;
    if (!_4008)
    {
        float _4142 = _3698 * _3698;
        float _4144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4146 = -_2944;
        float _4148 = _4146 + _4106;
        float _4150 = -_2908;
        float _4152 = _4150 + _4104;
        float _4154 = fma(_3702, _3702, _4142);
        float _4156 = -_2910;
        float _4158 = _4156 + _4102;
        float _4160 = fma(_3706, _3706, _4154);
        float _4162 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4164 = sqrt(_4160);
        float _4166 = 1.0 / _3794;
        float _4168 = _4162 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4170 = precise::min(_4164, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4172 = _4170 * _4144;
        float _4174 = _4172 * _4166;
        float _4176 = _4168 * _4174;
        float _4178 = _4148 * _4174;
        float _4180 = fma(_4152, _4176, _3684);
        float _4182 = fma(_4158, _4176, _3688);
        float _4184 = fma(_4168, _4178, _3692);
        _4126 = _4180;
        _4128 = _4182;
        _4130 = _4184;
        _3762 = _4176;
    }
    float _4186 = _4126;
    float _4188 = _4128;
    float _4190 = _4130;
    float _4192 = _3762;
    float _4194 = _4192;
    if (!_4018)
    {
        float _4196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4198 = _4196 * 0.15915493667125701904296875;
        float _4200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4202 = _4198 * 6.283185482025146484375;
        float _4204 = cos(_4202);
        float _4206 = _4200 * 0.15915493667125701904296875;
        float _4208 = _4198 * 6.283185482025146484375;
        float _4210 = sin(_4208);
        float _4212 = 1.0 / _4204;
        float _4214 = _4206 * 6.283185482025146484375;
        float _4216 = cos(_4214);
        float _4218 = _4210 * _4212;
        float _4220 = _4206 * 6.283185482025146484375;
        float _4222 = sin(_4220);
        float _4224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4226 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4224;
        float _4228 = _4216 * _4218;
        float _4230 = 1.0 / _4226;
        float _4232 = 1.0 / _4228;
        float _4234 = _4222 * _4232;
        float _4236 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4238 = fma(_4138, _4234, _4236);
        float _4240 = _4238 * _4230;
        float _4242 = precise::clamp(_4240, 0.0, 1.0);
        _4194 = _4198;
        _4140 = _4242;
    }
    float _4244 = _4194;
    float _4246 = _4140;
    float _4248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4250 = _4186 + _4248;
    float _4252 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4254 = _4188 + _4252;
    float _4256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4258 = _4190 + _4256;
    float _4260 = _4250 * _4250;
    float _4262 = fma(_4254, _4254, _4260);
    float _4264 = fma(_4258, _4258, _4262);
    float _4266 = rsqrt(_4264);
    float _4268 = sqrt(_4264);
    float _4270 = _4266 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4272 = _4254 * _4270;
    float _4274 = _4258 * _4270;
    float _4276 = _4272 * _4272;
    float _4278 = _4274 * _4274;
    float _4280 = _4276 + _4278;
    float _4282 = sqrt(_4280);
    bool _4284 = _4282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4286 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4288 = _4282 + _4286;
    float _4290 = _4258;
    float _4292 = _4280;
    float _4294 = _4288;
    float _4296 = _4244;
    if (_4284)
    {
        float _4298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4290 = _4298;
    }
    float _4300 = _4290;
    if (_4284)
    {
        float _4302 = rsqrt(_4280);
        _4292 = _4302;
    }
    float _4304 = _4292;
    float _4306 = _4304;
    if (_4284)
    {
        float _4308 = _4288 * _4300;
        _4294 = _4308;
    }
    float _4310 = _4294;
    if (_4284)
    {
        float _4312 = _4310 * 0.15915493667125701904296875;
        _4296 = _4312;
    }
    float _4314 = _4296;
    float _4316 = _4300;
    float _4318 = _4314;
    if (_4284)
    {
        float _4320 = _4314 * 6.283185482025146484375;
        float _4322 = sin(_4320);
        _4316 = _4322;
    }
    float _4324 = _4316;
    float _4326 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4328 = precise::max(0.0, _4326);
    float _4330 = _4260;
    float _4332 = _4328;
    if (_4284)
    {
        float _4334 = _4314 * 6.283185482025146484375;
        float _4336 = cos(_4334);
        _4330 = _4336;
    }
    float _4338 = _4330;
    float _4340 = -_4270;
    float _4342 = -_4328;
    float _4344 = fma(_4250, _4340, _4342);
    float _4346 = _4344;
    if (_4284)
    {
        float _4348 = _4344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4332 = _4348;
    }
    float _4350 = _4332;
    float _4352 = fma(_3688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4354 = _4350;
    if (!_4284)
    {
        _3764 = _4278;
    }
    float _4356 = _3764;
    float _4358 = _4324;
    float _4360 = _4356;
    if (_4284)
    {
        float _4362 = fma(_4324, _4350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4358 = _4362;
    }
    float _4364 = _4358;
    float _4366 = floor(_4352);
    float _4368 = _4364;
    if (_4284)
    {
        float _4370 = _4338 + (-1.0);
        _4354 = _4370;
    }
    float _4372 = _4354;
    float _4374 = _4372;
    if (_4284)
    {
        float _4376 = _4304 * _4364;
        _4132 = _4376;
    }
    float _4378 = _4132;
    if (!_4284)
    {
        _4368 = _4272;
    }
    float _4380 = _4368;
    float _4382 = _4380;
    if (_4284)
    {
        float _4384 = _4372 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4318 = _4384;
    }
    float _4386 = _4318;
    if (_4284)
    {
        float _4388 = _4272 * _4378;
        _4382 = _4388;
    }
    float _4390 = _4382;
    if (!_4284)
    {
        _4374 = _4274;
    }
    float _4392 = _4374;
    float _4394 = _4392;
    if (_4284)
    {
        float _4396 = _4274 * _4378;
        _4394 = _4396;
    }
    float _4398 = _4394;
    if (!_4284)
    {
        _4306 = _4276;
    }
    float _4400 = _4306;
    float _4402 = _4400;
    if (_4284)
    {
        float _4404 = fma(_4344, _4338, _4386);
        _4346 = _4404;
    }
    float _4406 = _4346;
    if (_4284)
    {
        float _4408 = _4390 * _4390;
        _4402 = _4408;
    }
    float _4410 = _4402;
    if (_4284)
    {
        float _4412 = _4398 * _4398;
        _4360 = _4412;
    }
    float _4414 = _4360;
    float _4416 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4418 = fma(_4406, _4406, _4410);
    float _4420 = _4418 + _4414;
    float _4422 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4416);
    float _4424 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4426 = fma(_4268, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4424);
    float _4428 = precise::clamp(_4426, 0.0, 1.0);
    float _4430 = rsqrt(_4420);
    float _4432 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4422);
    float _4434 = -_4428;
    float _4436 = _4434 + 1.0;
    float _4438 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4440 = _4432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4442 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4444 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4446 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4448 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4450 = abs(_4436);
    float _4452 = log2(_4450);
    float _4454 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4444);
    float _4456 = -_4446;
    float _4458 = fma(_4456, _4438, 1.0);
    float _4460 = _4186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4462 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4448);
    float _4464 = _4430 * _4398;
    float _4466 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4454);
    float _4468 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4460);
    float _4470 = _4430 * _4390;
    float _4472 = _4430 * _4406;
    float _4474 = _4466 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4476 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4468);
    float _4478 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4480 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4462);
    float _4482 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4484 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4486 = -_4478;
    float _4488 = fma(_4472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4486);
    float _4490 = floor(_4442);
    float _4492 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4494 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4482);
    float _4496 = -_4464;
    float _4498 = fma(_4496, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4488);
    float _4500 = _4480 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4502 = _4472 + 1.0;
    float _4504 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4494);
    float _4506 = fma(_4498, -0.5, 0.5);
    float _4508 = log2(_4458);
    float _4510 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4512 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4504);
    float _4514 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4510);
    float _4516 = 1.0 / _4512;
    float _4518 = -_4366;
    float _4520 = _4352 + _4518;
    float _4522 = fma(_4498, 0.5, 0.5);
    float _4524 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4526 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4514);
    float _4528 = -_4490;
    float _4530 = _4442 + _4528;
    float _4532 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4524);
    float _4534 = exp2(_4492);
    float _4536 = fma(_4522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4538 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4526);
    float _4540 = sqrt(_4506);
    float _4542 = fma(_4522, _4536, -0.212114393711090087890625);
    float2 _11745 = float2(_4520, _4530);
    float _4544 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11745, float2(0.0), isnan(_11745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11745, float2(0.0), isnan(_11745)), level(0.0)).x;
    float _4546 = fma(_4522, _4542, 1.570728778839111328125);
    float _4548 = -_4472;
    float _4550 = fma(_4534, _4502, _4548);
    float _4552 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4532);
    float _4554 = _4538 * _4516;
    float _4556 = fma(_4550, 0.5, 0.5);
    float _4558 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4552);
    float _4560 = _4508 * 0.693147182464599609375;
    float _4562 = fma(_4554, 0.5, 0.5);
    float _4564 = _4540 * 0.636619746685028076171875;
    float _4566 = _4558 * _4516;
    float _4568 = _4560 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4570 = -_4546;
    float _4572 = fma(_4564, _4570, 1.0);
    float _4574 = fma(_4566, -0.5, 0.5);
    float3 _11803 = float3(_4562, _4574, _4568);
    float _4576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11803, float3(0.0), isnan(_11803)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11803, float3(0.0), isnan(_11803)), level(0.0)).x;
    float3 _11814 = float3(_4562, _4574, _4568);
    float4 _4579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11814, float3(0.0), isnan(_11814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11814, float3(0.0), isnan(_11814)), level(0.0)).xyzw;
    float _4581 = _4579.x;
    float _4583 = _4579.y;
    float _4585 = _4579.z;
    float _4587 = _4579.w;
    float2 _11830 = float2(_4572, _4556);
    float3 _4591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11830, float2(0.0), isnan(_11830)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11830, float2(0.0), isnan(_11830)), level(0.0)).xyz;
    float _4593 = _4591.x;
    float _4595 = _4591.y;
    float _4597 = _4591.z;
    float _4599 = abs(_4138);
    float _4601 = log2(_4599);
    float _4603 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4605 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4607 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4609 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4611 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4603);
    float _4613 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4605);
    float _4615 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4607);
    float _4617 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4619 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4621 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4623 = _3818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4625 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4627 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4629 = -_3808;
    float _4631 = fma(_4629, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4609);
    float _4633 = -_3808;
    float _4635 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4623);
    float _4637 = _4601 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4639 = -_3808;
    float _4641 = fma(_4639, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4617);
    float _4643 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4619);
    float _4645 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4621);
    float _4647 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4625);
    float _4649 = fma(_4627, _4627, 1.0);
    float _4651 = exp2(_4637);
    float _4653 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4641);
    float _4655 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4631);
    float _4657 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4635);
    float _4659 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4611);
    float _4661 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4613);
    float _4663 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4615);
    float _4665 = rsqrt(_4649);
    float _4667 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4669 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4671 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4643);
    float _4673 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4645);
    float _4675 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4647);
    float _4677 = _4627 * _4655;
    out.m_86.x = _4659;
    out.m_86.y = _4661;
    out.m_86.z = _4663;
    float _4679 = fma(_4651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4681 = precise::clamp(_4679, 0.0, 1.0);
    float _4683 = _4474 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4685 = exp2(_4669);
    float _4687 = fma(_4667, _4659, _4677);
    bool _4689 = _4138 <= 8000.0;
    bool _4691 = isnan(_4138);
    bool _4693 = _4689 || _4691;
    bool _4695 = isnan(8000.0);
    bool _4697 = _4693 || _4695;
    float _4699 = float(_4697);
    float _4701 = fma(_4681, -2.0, 3.0);
    float _4703 = _4681 * _4681;
    float _4705 = _4627 * _4665;
    float _4707 = fma(_4484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4683);
    bool _4709 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4711 = isnan(_4268);
    bool _4713 = _4709 || _4711;
    bool _4715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4717 = _4713 || _4715;
    float _4719 = _4703 * _4701;
    float _4721 = _4627 * _4657;
    float _4723 = _4627 * _4653;
    float _4725 = -_4671;
    float _4727 = _4705 * _4725;
    float _4729 = -_4719;
    float _4731 = _4729 + 1.0;
    float _4733 = fma(_4667, _4661, _4721);
    float _4735 = -_4675;
    float _4737 = _4705 * _4735;
    float _4739 = fma(_4731, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4719);
    float _4741 = -_4673;
    float _4743 = _4705 * _4741;
    float _4745 = fma(_4665, _4653, _4737);
    float _4747 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4707);
    float _4749 = in.m_88.x;
    float _4751 = fma(_4665, _4655, _4727);
    float _4753 = _4699 * _4739;
    float _4755 = fma(_4665, _4657, _4743);
    float _4757 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4747);
    float _4759 = _4512 * 0.5;
    float _4761 = -_4685;
    float _4763 = _4761 + 1.0;
    float _4765 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4767 = _4757 + _4512;
    float _4769 = _4538 + _4512;
    float _4771 = fma(_4558, -0.5, _4759);
    float _4773 = _4763 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4775 = _4767 * 0.5;
    float _4777 = _4769 * 0.5;
    out.gl_Position.x = _4538;
    out.gl_Position.y = _4558;
    out.gl_Position.z = _4757;
    out.gl_Position.w = _4512;
    float _4779 = fma(_4667, _4663, _4723);
    float _4781 = _4671 + _4687;
    float _4783 = _4673 + _4733;
    out.m_90.x = _4777;
    out.m_90.y = _4771;
    out.m_90.z = _4775;
    out.m_90.w = _4512;
    float _4785 = _4675 + _4779;
    out.m_92.x = _4751;
    out.m_92.y = _4755;
    out.m_92.z = _4745;
    out.m_94.x = _4781;
    out.m_94.y = _4783;
    out.m_94.z = _4785;
    float _4787 = -_4773;
    float _4789 = _4787 + 1.0;
    float _4791 = _4512;
    float _4793 = _4757;
    float _4795 = _4558;
    float _4797 = _4789;
    if (!_4717)
    {
        _4791 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4799 = _4791;
    float _4801 = _4799;
    float _4803 = _4799;
    if (!_4717)
    {
        _4793 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4805 = _4793;
    float _4807 = _4805;
    float _4809 = _4805;
    if (!_4717)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4811 = _4795;
    float _4813 = -_4544;
    float _4815 = _4813 + 1.0;
    float _4817 = _4815 * _4765;
    float _4819 = precise::clamp(_4817, 0.0, 1.0);
    float _4821 = -_4819;
    float _4823 = fma(_4821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4825 = _4823 * _4749;
    float _4827 = _4825 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4827;
    float _4829 = _4773 * _4576;
    float _4831 = _4587 * _4789;
    float _4833 = _4583;
    float _4835 = _4581;
    float _4837 = _4811;
    float _4839 = _4811;
    if (!_4717)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4841 = _4797;
    float _4843 = _4587 * _4829;
    float _4845 = _4597 * _4829;
    float _4847 = fma(_4593, _4843, _4581);
    float _4849 = fma(_4595, _4843, _4583);
    float _4851 = fma(_4587, _4845, _4585);
    float _4853 = _4246 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4855 = _4841;
    float _4857 = _4841;
    if (!_4717)
    {
        _4833 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4859 = _4833;
    float _4861 = _4859;
    float _4863 = _4859;
    if (!_4717)
    {
        _4835 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4865 = _4835;
    out.m_98.x = _4847;
    out.m_98.y = _4849;
    out.m_98.z = _4851;
    out.m_98.w = _4831;
    bool _4867 = !_4717;
    float _4869 = _4865;
    float _4871 = _4865;
    if (!_4867)
    {
        bool _4873 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4875 = isnan(_4268);
        bool _4877 = _4873 || _4875;
        bool _4879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4881 = _4877 || _4879;
        if (!_4881)
        {
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4885 = _4268 + _4883;
            float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4889 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4887;
            float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4895 = 1.0 / _4889;
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4903 = _4901 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4905 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4907 = _4905 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4909 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4913 = _4885 * _4895;
            float _4915 = precise::clamp(_4913, 0.0, 1.0);
            float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4919 = _4917 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4921 = fma(_4915, _4893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4923 = fma(_4915, _4919, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4925 = fma(_4915, _4899, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4927 = fma(_4915, _4903, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4929 = fma(_4915, _4907, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4931 = fma(_4915, _4911, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4871 = _4925;
            _4839 = _4929;
            _4863 = _4921;
            _4809 = _4927;
            _4803 = _4923;
            _4857 = _4931;
            _4933 = true;
        }
        else
        {
            bool _4935 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4937 = isnan(_4268);
            bool _4939 = _4935 || _4937;
            bool _4941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4943 = _4939 || _4941;
            if (!_4943)
            {
                _4861 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4945 = _4861;
            _4863 = _4945;
            if (!_4943)
            {
                _4869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4947 = _4869;
            _4871 = _4947;
            if (!_4943)
            {
                _4801 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4949 = _4801;
            _4803 = _4949;
            if (!_4943)
            {
                _4807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4951 = _4807;
            _4809 = _4951;
            if (!_4943)
            {
                _4837 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4953 = _4837;
            _4839 = _4953;
            if (!_4943)
            {
                _4855 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4955 = _4855;
            bool _4957 = !_4943;
            _4857 = _4955;
            if (!_4957)
            {
                bool _4959 = _4268 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4961 = isnan(_4268);
                bool _4963 = _4959 || _4961;
                bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4967 = _4963 || _4965;
                if (!_4967)
                {
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4971 = _4268 + _4969;
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4975 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4973;
                    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4981 = 1.0 / _4975;
                    float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4991 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4999 = _4971 * _4981;
                    float _5001 = precise::clamp(_4999, 0.0, 1.0);
                    float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5005 = _5003 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5007 = fma(_5001, _4979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5009 = fma(_5001, _5005, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5011 = fma(_5001, _4985, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5013 = fma(_5001, _4989, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5015 = fma(_5001, _4993, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5017 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4871 = _5011;
                    _4839 = _5015;
                    _4863 = _5007;
                    _4809 = _5013;
                    _4803 = _5009;
                    _4857 = _5017;
                    _4933 = true;
                }
                else
                {
                    _4871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4839 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4863 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4803 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4857 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4933 = false;
    float _5019 = _4871;
    float _5021 = _4839;
    float _5023 = _4863;
    float _5025 = _4809;
    float _5027 = _4803;
    float _5029 = _4857;
    float _5031 = _4853 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5033 = fma(_4783, -0.5, 0.5);
    float _5035 = precise::clamp(_5033, 0.0, 1.0);
    float _5037 = -_5019;
    float _5039 = _5037 + _5021;
    float _5041 = -_5023;
    float _5043 = _5041 + _5025;
    out.m_100.x = 0.0;
    float _5045 = fma(_5035, _5039, _5019);
    float _5047 = -_5027;
    float _5049 = _5047 + _5029;
    float _5051 = fma(_5035, _5043, _5023);
    float _5053 = _5045 * 0.586610972881317138671875;
    bool _5055 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5057 = fma(_5035, _5049, _5027);
    out.m_53.x = _5031;
    float _5059 = fma(_5051, 0.298911988735198974609375, _5053);
    bool _5061 = _4246 > 0.0;
    bool _5063 = isnan(_4246);
    bool _5065 = _5061 || _5063;
    bool _5067 = isnan(0.0);
    bool _5069 = _5065 || _5067;
    float _5071 = fma(_5057, 0.114477999508380889892578125, _5059);
    float _5073 = -_5071;
    float _5075 = _5051 + _5073;
    float _5077 = -_5071;
    float _5079 = _5045 + _5077;
    float _5081 = -_5071;
    float _5083 = _5057 + _5081;
    float _5085 = fma(_5075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    float _5087 = fma(_5079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    float _5089 = fma(_5083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5071);
    bool _5091 = !_5055;
    if (!_5091)
    {
        float _5093 = -_4186;
        float _5095 = _5093 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5097 = -_4188;
        float _5099 = _5097 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5101 = -_4190;
        float _5103 = _5101 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5105 = _5095 * _5095;
        float _5107 = fma(_5099, _5099, _5105);
        float _5109 = fma(_5103, _5103, _5107);
        float _5111 = sqrt(_5109);
        float _5113 = rsqrt(_5109);
        float _5115 = -_5111;
        float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5119 = _5117 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5121 = precise::clamp(_5119, 0.0, 1.0);
        float _5123 = _5099 * _5113;
        float _5125 = _5095 * _5113;
        float _5127 = abs(_5121);
        float _5129 = log2(_5127);
        float _5131 = _5103 * _5113;
        float _5133 = _5123 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5135 = _4783 * _5125;
        float _5137 = -_5125;
        float _5139 = -_5133;
        float _5141 = fma(_5137, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5139);
        float _5143 = fma(_4781, _5123, _5135);
        float _5145 = -_5131;
        float _5147 = fma(_5145, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5141);
        float _5149 = fma(_4785, _5131, _5143);
        float _5151 = precise::clamp(_5149, 0.0, 1.0);
        float _5153 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5155 = _5147 + _5153;
        float _5157 = _5129 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5159 = _5155 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5161 = precise::clamp(_5159, 0.0, 1.0);
        float _5163 = exp2(_5157);
        float _5165 = _5163 * _5161;
        float _5167 = _5151 * _5165;
        float _5169 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5171 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5173 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5169;
        out.m_100.y = _5171;
        out.m_100.z = _5173;
    }
    out.m_102.x = _5085;
    out.m_102.y = _5087;
    out.m_102.z = _5089;
    if (_5069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5175 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5175;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

