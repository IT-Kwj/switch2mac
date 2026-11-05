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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_102 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 m_88 [[user(locn15)]];
    float4 m_100 [[user(locn16)]];
    float4 m_94 [[user(locn17)]];
    float4 m_96 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad7 [[user(locn7)]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_62 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad7 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3677 = false;
    bool _1119 = false;
    bool _985 = false;
    bool _825 = false;
    bool _615 = false;
    bool _447 = false;
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
    float _135 = as_type<float>(_123);
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_131)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3987 = as_type<float>(_143);
        out.gl_Position.z = _3987;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_155;
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
    if (_165)
    {
        float _171 = _169 * 5.0;
        _145 = as_type<int>(_171);
    }
    int _173 = _145;
    float _175 = _127 * _167;
    out.m_57.x = _157;
    float _177 = _175;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4052 = as_type<float>(_173);
        out.gl_Position.z = _4052;
    }
    out.m_51.x = _175;
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = _183 * _189;
    float _217 = _183 * _195;
    float _219 = fma(_181, _187, _215);
    float _221 = _183 * _201;
    float _223 = fma(_181, _193, _217);
    float _225 = fma(_185, _191, _219);
    float _227 = fma(_181, _199, _221);
    float _229 = fma(_185, _197, _223);
    float _231 = fma(_185, _203, _227);
    bool _233 = !_207;
    float _235 = _233 ? (-0.5) : 0.5;
    bool _237 = !_211;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_213;
    float _243 = _229;
    float _259;
    if (!_241)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _259 = _175;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = 1.0 / _279;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = 1.0 / _287;
    bool _295 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_263);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _283;
    float _309 = _267 * _289;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_305;
    float _325 = _323 + 1.0;
    float _327 = _271 * _293;
    bool _329 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _331 = isnan(_263);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_263);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _339 * _325;
    float _355 = -_339;
    float _357 = _355 + 1.0;
    float _359 = _275 * _307;
    float _361 = -_321;
    float _363 = _361 + 1.0;
    float _365 = _351 * _357;
    float _367 = -_351;
    float _369 = _367 + 1.0;
    float _371 = _305 * _363;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_375, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_383, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = fma(_387, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _389 * _365;
    float _399 = _391 * _365;
    float _401 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _413 = fma(_393, _353, _401);
    float _415 = fma(_405, _327, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _327, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_395, _353, _411);
    float _421 = fma(_415, _371, _413);
    float _423 = fma(_417, _371, _419);
    float _425 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].x, _421);
    float _427 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].y, _423);
    bool _429 = !_291;
    float _445;
    if (!_429)
    {
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _433 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        _445 = _175;
    }
    _447 = false;
    float _449 = _445;
    float _451 = in.m_70.x;
    float _453 = in.m_70.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _449 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _471 = 1.0 / _465;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _475 = 1.0 / _469;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = _427 * _453;
    bool _483 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _485 = isnan(_449);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _457 * _471;
    bool _497 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_449);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    bool _513 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _515 = isnan(_449);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_493;
    float _527 = _525 + 1.0;
    float _529 = fma(_479, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _531 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _425 * _451;
    float _535 = _523 * _527;
    float _537 = -_523;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _541;
    float _545 = _461 * _475;
    float _547 = _507 * _539;
    float _549 = fma(_543, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _551 = -_507;
    float _553 = _551 + 1.0;
    float _555 = _529 * _547;
    float _557 = _549 * _547;
    float _559 = _531 * _547;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].x, _557);
    float _575 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].y, _555);
    float _577 = fma(_563, _545, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _579 = fma(_567, _545, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _581 = fma(_571, _545, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _583 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].z, _559);
    float _585 = fma(_577, _535, _573);
    float _587 = fma(_579, _535, _575);
    float _589 = fma(_581, _535, _583);
    float _591 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].x, _585);
    float _593 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].y, _587);
    float _595 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].z, _589);
    bool _597 = !_473;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        _613 = _175;
    }
    _615 = false;
    float _617 = _613;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _617 + _619;
    float _623 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _637 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = isnan(_617);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _627;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_617);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _673 = 1.0 / _635;
    float _675 = _631 * _649;
    bool _677 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_617);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _653;
    float _691 = -_647;
    float _693 = _691 + 1.0;
    float _695 = fma(_675, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _701 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_617);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_687;
    float _715 = _713 + 1.0;
    float _717 = _687 * _693;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = 1.0 / _699;
    float _725 = -_711;
    float _727 = _725 + 1.0;
    float _729 = _665 * _715;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _731;
    float _735 = _721 * _673;
    float _737 = _647 * _727;
    float _739 = _695 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _617 + _741;
    float _745 = -_665;
    float _747 = _745 + 1.0;
    bool _749 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = isnan(_617);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _689;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _769 = _617 + _767;
    float _771 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _739);
    float _775 = -_759;
    float _777 = _775 + 1.0;
    float _779 = _765 * _723;
    float _781 = fma(_761, _769, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _785 = _617 + _783;
    float _787 = fma(_771, _717, _773);
    float _789 = _711 * _777;
    float _791 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = fma(_779, _785, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _795 = fma(_781, _737, _787);
    float _797 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = fma(_793, _789, _795);
    float _801 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[119].x, _799);
    float _803 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _791;
    out.m_72.y = _797;
    out.m_72.z = _803;
    out.m_72.w = _805;
    bool _807 = !_671;
    float _823;
    if (!_807)
    {
        float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _811 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _815 = _813 * _809;
        float _817 = floor(_815);
        float _819 = -_817;
        float _821 = _815 + _819;
        _823 = _821;
        _825 = true;
    }
    else
    {
        _823 = _175;
    }
    _825 = false;
    float _827 = _823;
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
    float _881 = 1.0 / _863;
    float _883 = -_879;
    float _885 = _883 + 1.0;
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = _859 * _885;
    float _891 = -_859;
    float _893 = _891 + 1.0;
    float _895 = 1.0 / _867;
    float _897 = _831 * _881;
    float _899 = -_843;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _903;
    float _907 = _879 * _901;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = fma(_905, _897, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _919 = _847 * _895;
    float _921 = fma(_911, _897, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _923 = fma(_915, _897, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _925 = _917 * _889;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _931 = _921 * _889;
    float _933 = _923 * _889;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _943 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].x, _931);
    float _945 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].y, _925);
    float _947 = fma(_937, _919, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _949 = fma(_929, _919, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _951 = fma(_941, _919, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _953 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].z, _933);
    float _955 = fma(_947, _907, _943);
    float _957 = fma(_949, _907, _945);
    float _959 = fma(_951, _907, _953);
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].x, _955);
    float _963 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].y, _957);
    float _965 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].z, _959);
    bool _967 = !_887;
    float _983;
    if (!_967)
    {
        float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _971 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _975 = _973 * _969;
        float _977 = floor(_975);
        float _979 = -_977;
        float _981 = _975 + _979;
        _983 = _981;
        _985 = true;
    }
    else
    {
        _983 = _175;
    }
    _985 = false;
    float _987 = _983;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _995 = isnan(_987);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1009 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1011 = isnan(_987);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _991;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1023;
    float _1027 = -_1003;
    float _1029 = _1027 + 1.0;
    bool _1031 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1033 = isnan(_987);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    bool _1043 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1045 = 1.0 / _1007;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1051 = _1025 * _1021;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1055 = _987 + _1053;
    float _1057 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1059 = fma(_1051, _1055, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1061 = _1019 * _1029;
    float _1063 = -_1019;
    float _1065 = _1063 + 1.0;
    float _1067 = _1049 * _1045;
    float _1069 = -_1041;
    float _1071 = _1069 + 1.0;
    float _1073 = _1059 * _1061;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1077 = _987 + _1075;
    float _1079 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1003 * _1071;
    float _1083 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1073);
    float _1085 = fma(_1067, _1077, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1087 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1089 = fma(_1085, _1081, _1083);
    float _1091 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1093 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1089);
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _1079;
    out.m_74.y = _1097;
    out.m_74.z = _1093;
    out.m_74.w = _1099;
    bool _1101 = !_1043;
    float _1117;
    if (!_1101)
    {
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1105 = _157 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _1109 = _1107 * _1103;
        float _1111 = floor(_1109);
        float _1113 = -_1111;
        float _1115 = _1109 + _1113;
        _1117 = _1115;
        _1119 = true;
    }
    else
    {
        _1117 = _175;
    }
    _1119 = false;
    float _1121 = _1117;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1125 = _1121 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1143 = 1.0 / _1129;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1153 = 1.0 / _1133;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1157 = _1121 + _1155;
    bool _1159 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1161 = isnan(_1121);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    bool _1171 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1173 = isnan(_1121);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    bool _1183 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1185 = isnan(_1121);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = -_1169;
    float _1197 = _1195 + 1.0;
    float _1199 = 1.0 / _1137;
    float _1201 = _1157 * _1143;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1203;
    bool _1207 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1209 = isnan(_1121);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1221 = _1121 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1225 = _1121 + _1223;
    float _1227 = 1.0 / _1147;
    float _1229 = _1125 * _1153;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1233 = _1121 + _1231;
    float _1235 = -_1217;
    float _1237 = _1235 + 1.0;
    bool _1239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1241 = 1.0 / _1151;
    float _1243 = _1233 * _1199;
    bool _1245 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1247 = isnan(_1121);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = 1.0 / _1141;
    float _1259 = _1221 * _1227;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1263 = _1121 + _1261;
    bool _1265 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1267 = isnan(_1121);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1205;
    float _1279 = _1263 * _1241;
    bool _1281 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1283 = isnan(_1121);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = _1225 * _1257;
    float _1295 = _1255 * _1237;
    float _1297 = -_1255;
    float _1299 = _1297 + 1.0;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1303 = _1121 + _1301;
    float _1305 = _1275 * _1299;
    float _1307 = -_1275;
    float _1309 = _1307 + 1.0;
    float _1311 = _1303 * _1277;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1313;
    float _1317 = _1291 * _1309;
    float _1319 = -_1291;
    float _1321 = _1319 + 1.0;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1323;
    float _1327 = fma(_1315, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1329 = _1169 * _1321;
    float _1331 = fma(_1325, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1333 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1335 = isnan(_1121);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1341 = _1337 || _1339;
    float _1343 = float(_1341);
    float _1345 = -_1181;
    float _1347 = _1345 + 1.0;
    float _1349 = _1181 * _1197;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1359 = _1343 * _1347;
    float _1361 = -_1343;
    float _1363 = _1361 + 1.0;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1369;
    float _1373 = _1193 * _1363;
    float _1375 = -_1193;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1353, _1229, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1381 = fma(_1357, _1229, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1383 = _1331 * _1373;
    float _1385 = _1327 * _1373;
    float _1387 = fma(_1367, _1243, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1389 = fma(_1371, _1243, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1399 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1383);
    float _1401 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1385);
    float _1403 = fma(_1393, _1293, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1405 = fma(_1397, _1293, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1407;
    float _1411 = fma(_1379, _1359, _1399);
    float _1413 = fma(_1381, _1359, _1401);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1415;
    float _1419 = fma(_1409, _1259, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1421 = fma(_1387, _1349, _1411);
    float _1423 = fma(_1389, _1349, _1413);
    float _1425 = fma(_1417, _1259, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1435 = fma(_1403, _1329, _1421);
    float _1437 = fma(_1405, _1329, _1423);
    float _1439 = fma(_1429, _1279, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1441;
    float _1445 = fma(_1433, _1279, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1447;
    float _1451 = fma(_1419, _1317, _1435);
    float _1453 = fma(_1425, _1317, _1437);
    float _1455 = fma(_1443, _1311, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1457 = fma(_1449, _1311, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1459 = fma(_1439, _1305, _1451);
    float _1461 = fma(_1445, _1305, _1453);
    float _1463 = fma(_1455, _1295, _1459);
    float _1465 = fma(_1457, _1295, _1461);
    float _1467 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1463);
    float _1469 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1465);
    out.m_76.x = _1467;
    out.m_76.z = _1469;
    bool _1471 = !_1239;
    if (!_1471)
    {
        float _1473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1475 = _157 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[14].y, _127);
        float _1479 = _1477 * _1473;
        float _1481 = floor(_1479);
        float _1483 = -_1481;
        float _1485 = _1479 + _1483;
        _177 = _1485;
    }
    float _1487 = _177;
    float _1489 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1491 = int(_1489);
    float _1493 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1495 = in.m_68.w;
    float _1497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1499 = int(_1497);
    float _1501 = in.m_66.w;
    float _1503 = in.m_64.w;
    float _1505 = float(_1491);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1511 = 1.0 / _1505;
    float _1513 = float(uint(_1499));
    int _1515 = ~_1499;
    int _1517 = _1515 + 1;
    int _1519 = ~_1499;
    int _1521 = _1519 + 1;
    float _1523 = 1.0 / _1513;
    int _1525 = ~_1499;
    int _1527 = _1525 + 1;
    float _1529 = _127 * _1511;
    float _1531 = trunc(_1529);
    int _1533 = int(_1531);
    int _1535 = as_type<int>(_1523) + (-2);
    float _1537 = float(uint(_1533));
    float _1539 = float(_1533);
    float _1541 = as_type<float>(_1535) * _1537;
    float _1543 = trunc(_1541);
    float _1545 = precise::max(_1543, 0.0);
    uint _1548 = uint(_1545);
    int _1550 = _1517 * int(_1548);
    int _1552 = _1550 + _1533;
    float _1554 = float(uint(_1552));
    float _1556 = as_type<float>(_1535) * _1554;
    float _1558 = trunc(_1556);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    bool _1568 = !_1566;
    float _1570 = _1568 ? 7.345489978790283203125 : 1.0;
    float _1572 = float(_1499);
    float _1574 = _1570 * _157;
    bool _1576 = _1539 >= _1572;
    bool _1578 = isnan(_1539);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(_1572);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    int _1588 = int(_1548) + int(_1562);
    float _1590 = trunc(_1586);
    int _1592 = int(_1590);
    int _1594 = _1521 * _1588;
    int _1596 = _1594 + _1533;
    float _1598 = floor(_1574);
    bool _1600 = uint(_1596) >= uint(_1499);
    bool _1602 = !_1600;
    int _1604 = _1602 ? 0 : (-1);
    bool _1606 = _1499 == 0;
    int _1608 = ~_1588;
    int _1610 = _1608 + _1604;
    int _1612 = _1610 + 1;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1628 = _1626 != 0;
    int _1630 = _1499 * _1612;
    int _1632 = _1630 + _1533;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1636 = _1634 != 0;
    float _1638 = -_1598;
    float _1640 = _1574 + _1638;
    int _1642 = _1499 + (-1);
    bool _1644 = !_1606;
    int _1646 = _1644 ? _1632 : (-1);
    float _1648 = _1640 * _1572;
    float _1650 = _127 * _1572;
    int _1652 = ~_1592;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = !_1628;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = _1650 * _167;
    float _1664 = trunc(_1648);
    int _1666 = int(_1664);
    int _1668 = _1646 * _1656;
    bool _1670 = !_1620;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1660);
    int _1676 = _1592 * _1642;
    int _1678 = _1676 + _1668;
    int _1680 = abs(_1672);
    float _1682 = trunc(_1662);
    int _1684 = int(_1682);
    bool _1686 = !_1616;
    int _1688 = _1686 ? 0 : 1;
    bool _1690 = !_1624;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = abs(_1688);
    int _1696 = abs(_1692);
    int _1698 = _1678 * _1680;
    bool _1700 = !_1636;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _1666 * _1674;
    int _1706 = _1704 + _1533;
    float _1708 = in.m_55.y;
    int _1710 = abs(_1702);
    bool _1712 = _157 > 0.5;
    int _1714 = _1684 * _1694;
    int _1716 = _1714 + _1698;
    int _1718 = ~_1499;
    int _1720 = _1718 + 1;
    float _1722 = in.m_55.w;
    int _1724 = ~_1499;
    int _1726 = _1724 + 1;
    int _1728 = _1706 * _1696;
    int _1730 = _1728 + _1716;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1734 = _1732 != 0;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1738 = _1736 != 0;
    int _1740 = _1666 * _1710;
    int _1742 = _1740 + _1730;
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1746 = _1744 != 0;
    float _1748 = float(uint(_1742));
    float _1750 = as_type<float>(_1535) * _1748;
    float _1752 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1754 = trunc(_1750);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1752);
    float _1762 = -_1760;
    float _1764 = _1762 + 1.0;
    int _1766 = _1720 * int(_1758);
    int _1768 = _1766 + _1742;
    float _1770 = float(uint(_1768));
    float _1772 = as_type<float>(_1535) * _1770;
    float _1774 = trunc(_1772);
    float _1776 = precise::max(_1774, 0.0);
    uint _1778 = uint(_1776);
    float _1780 = -_235;
    int _1782 = _1712 ? as_type<int>(_1780) : as_type<int>(_235);
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1786 = _1784 != 0;
    bool _1788 = !_1734;
    float _1790 = _1788 ? _235 : as_type<float>(_1782);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1794 = _1792 != 0;
    int _1796 = int(_1758) + int(_1778);
    float _1798 = _1790 + 0.5;
    float _1800 = in.m_46.x;
    float _1802 = in.m_46.y;
    float _1804 = in.m_46.z;
    int _1806 = _1726 * _1796;
    int _1808 = _1806 + _1742;
    bool _1810 = uint(_1808) >= uint(_1499);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1814 = _1812 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1816 = !_1810;
    int _1818 = _1816 ? 0 : (-1);
    bool _1820 = _1708 > 0.5;
    float _1822 = 1.0 / _1814;
    int _1824 = ~_1796;
    int _1826 = _1824 + _1818;
    int _1828 = _1826 + 1;
    float _1830 = -_239;
    int _1832 = _1820 ? as_type<int>(_1830) : as_type<int>(_239);
    bool _1834 = _1722 > 0.5;
    int _1836 = _1499 * _1828;
    int _1838 = _1836 + _1742;
    float _1840 = _189 * _1802;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1846 = _195 * _1802;
    float _1848 = _201 * _1802;
    float _1850 = fma(_187, _1800, _1840);
    float _1852 = 1.0 / _1844;
    float _1854 = fma(_193, _1800, _1846);
    float _1856 = fma(_199, _1800, _1848);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1868 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1870 = -_1862;
    float _1872 = fma(_1493, 2.0, _1870);
    float _1874 = 1.0 / _1860;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1878 = fma(_191, _1804, _1850);
    float _1880 = fma(_1868, -2.0, _1876);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1886 = fma(_197, _1804, _1854);
    float _1888 = 1.0 / _1866;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1890;
    float _1894 = fma(_203, _1804, _1856);
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1900 = _1892 * _1822;
    float _1902 = in.m_55.z;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1908 = 1.0 / _1884;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1910;
    float _1914 = _1906 * _1852;
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1918 = _1916 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1920 = _1912 * _1874;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1922;
    float _1926 = 1.0 / _1898;
    float _1928 = _1918 * _1888;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1938 = _1487 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1946 = _1934;
    if (!_1566)
    {
        _1944 = _1708;
    }
    float _1948 = _1944;
    float _1950 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1934);
    float _1952 = _1948;
    if (_1566)
    {
        _1952 = _157;
    }
    float _1954 = _1952;
    float _1956 = 1.0 / _1942;
    bool _1958 = !_1746;
    float _1960 = _1958 ? _239 : as_type<float>(_1832);
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1964 = _1487 + _1962;
    float _1966 = fma(_1900, _1938, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1970 = _1487 + _1968;
    float _1972 = _1924 * _1908;
    float _1974 = _1932 * _1926;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1978 = _1487 + _1976;
    float _1980 = fma(_1920, _1964, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1982 = fma(_1928, _1970, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1986 = _1487 + _1984;
    float _1988 = fma(_1914, _1978, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1990;
    bool _1994 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1996 = isnan(_1487);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2002 = _1998 || _2000;
    float _2004 = float(_2002);
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2008 = _1487 + _2006;
    bool _2010 = _1902 > 0.5;
    float _2012 = _1992 * _1956;
    float _2014 = _1902;
    if (!_1566)
    {
        _1946 = _1902;
    }
    float _2016 = _1946;
    float _2018 = -_2004;
    float _2020 = _2018 + 1.0;
    float _2022 = _2016;
    if (_1566)
    {
        _2022 = _1708;
    }
    float _2024 = _2022;
    float _2026 = -_127;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1872);
    if (_1566)
    {
        _2014 = _1708;
    }
    float _2030 = _2014;
    float _2032 = fma(_1972, _1986, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _2034 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2036 = isnan(_1487);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2042 = _2038 || _2040;
    float _2044 = float(_2042);
    float _2046 = fma(_1974, _2008, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _2048 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2050 = isnan(_1487);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1880);
    bool _2062 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2064 = isnan(_1487);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = _2044 * _2020;
    float _2076 = -_2044;
    float _2078 = _2076 + 1.0;
    bool _2080 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2082 = isnan(_1487);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2058;
    float _2094 = _2092 + 1.0;
    bool _2096 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2098 = isnan(_1487);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2104 = _2100 || _2102;
    float _2106 = float(_2104);
    float _2108 = _2058 * _2078;
    float _2110 = _1894 + _1495;
    float _2112 = _2090 * _2094;
    float _2114 = -_2090;
    float _2116 = _2114 + 1.0;
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    float _2122 = _1886 + _1501;
    float _2124 = _2072 * _2116;
    float _2126 = -_2072;
    float _2128 = _2126 + 1.0;
    float _2130 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2028);
    bool _2132 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2134 = isnan(_1487);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2146 = _2106 * _2128;
    float _2148 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1509);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2152 = _1487 + _2150;
    bool _2154 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2156 = isnan(_1487);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2162 = _2158 || _2160;
    float _2164 = float(_2162);
    float _2166 = _1960 + (-0.5);
    float _2168 = -_2142;
    float _2170 = _2168 + 1.0;
    float _2172 = fma(_2012, _2152, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2174 = !_1606;
    int _2176 = _2174 ? _1838 : (-1);
    float _2178 = -_2166;
    float _2180 = -_2060;
    float _2182 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2180);
    float _2184 = _2142 * _2120;
    float _2186 = float(uint(_1706));
    float _2188 = _2164 * _2170;
    int _2190 = _2176 >> 31;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2196 = as_type<float>(_1535) * _2186;
    int _2198 = _2190 & 3;
    float _2200 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2192);
    float _2202 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2204 = _1966 * _2188;
    int _2206 = _2176 + _2198;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2210 = trunc(_2196);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = -_2144;
    float _2218 = fma(_2202, 2.0, _2216);
    int _2220 = _2206 >> 2;
    float _2222 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2224 = -_2164;
    float _2226 = _2224 + 1.0;
    float _2228 = -_235;
    int _2230 = _2010 ? as_type<int>(_2228) : as_type<int>(_235);
    float _2232 = _1878 + _1503;
    int _2234 = _2220 << 4;
    int _2236 = _2234 + 368;
    float _2238 = fma(_2222, -2.0, _2208);
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2204);
    bool _2242 = !_1786;
    float _2244 = _2242 ? _235 : as_type<float>(_2230);
    float _2246 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2200);
    int _2248 = ~_1499;
    int _2250 = _2248 + 1;
    uint _2252 = uint(int(uint(_2236) >> uint(2)));
    uint _2254 = uint(int(uint(int(_2252)) >> uint(2)));
    int _2256 = int(_2252) & 3;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[int(_2254)][_2256];
    int _2260 = int(_2252) + 1;
    uint _2262 = uint(int(uint(_2260) >> uint(2)));
    int _2264 = _2260 & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    float _2268 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2148);
    float _2270 = _2244 + 0.5;
    float _2272 = -_127;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2218);
    float _2276 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2278 = _2250 * int(_2214);
    int _2280 = _2278 + _1706;
    float _2282 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1950);
    float _2284 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2238);
    float _2286 = fma(_1988, _2184, _2240);
    float _2288 = fma(_2276, _2270, _2274);
    int _2290 = _2176 & 3;
    bool _2292 = _2290 != 0;
    int _2294 = _2236 + 8;
    uint _2296 = uint(int(uint(_2294) >> uint(2)));
    uint _2298 = uint(int(uint(int(_2296)) >> uint(2)));
    int _2300 = int(_2296) & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    int _2304 = int(_2296) + 1;
    uint _2306 = uint(int(uint(_2304) >> uint(2)));
    int _2308 = _2304 & 3;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[int(_2306)][_2308];
    float _2312 = float(uint(_2280));
    float _2314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2316 = uint(_2290) > 1u;
    float _2318 = fma(_1980, _2146, _2286);
    int _2320 = _2176 & 3;
    bool _2322 = _2320 != 0;
    float _2324 = as_type<float>(_1535) * _2312;
    float _2326 = -_239;
    int _2328 = _1834 ? as_type<int>(_2326) : as_type<int>(_239);
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2332 = _2122 + _2330;
    int _2334 = _2322 ? 0 : 1;
    float _2336 = trunc(_2324);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    bool _2342 = !_1794;
    float _2344 = _2342 ? _239 : as_type<float>(_2328);
    float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2348 = _2232 + _2346;
    bool _2350 = uint(_2290) >= 2u;
    float _2352 = _2332 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2354 = fma(_1982, _2124, _2318);
    float _2356 = _2344 + (-0.5);
    int _2358 = _2350 ? 0 : 1;
    float _2360 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2362 = ~_2334;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2352);
    int _2370 = _2366;
    float _2372 = _2110;
    if (!_2316)
    {
        int _2374 = ~_2334;
        int _2376 = _2374 + 1;
        _2370 = _2376;
    }
    int _2378 = _2370;
    float _2380 = -_2360;
    float _2382 = -_2284;
    float _2384 = fma(_2380, _2356, _2382);
    bool _2386 = _2290 != 3;
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2390 = _2110 + _2388;
    int _2392 = abs(_2378);
    float _2394 = fma(_2032, _2112, _2354);
    int _2396 = int(_2214) + int(_2340);
    float _2398 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2368);
    float _2400 = fma(_2046, _2108, _2394);
    bool _2402 = !_2292;
    int _2404 = _2402 ? 0 : 1;
    float _2406 = fma(_1960, _1764, _2182);
    int _2408 = ~_2358;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    int _2414 = _1527 * _2396;
    int _2416 = _2414 + _1706;
    bool _2418 = _2290 != 3;
    float _2420 = fma(_2172, _2074, _2400);
    int _2422 = _2412;
    if (_2386)
    {
        int _2424 = ~_2358;
        int _2426 = _2424 + 1;
        _2422 = _2426;
    }
    int _2428 = _2422;
    int _2430 = ~_2392;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2420);
    int _2438 = abs(_2404);
    bool _2440 = !_2418;
    int _2442 = _2440 ? 0 : (-1);
    int _2444 = _2434 * as_type<int>(_2266);
    int _2446 = abs(_2428);
    out.m_78.x = _2436;
    bool _2448 = uint(_2416) >= uint(_1499);
    bool _2450 = !_1738;
    int _2452 = _2450 ? 0 : 1;
    int _2454 = abs(_2442);
    int _2456 = ~_2438;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    bool _2462 = _2398 >= 0.0;
    int _2464 = _2460 * as_type<int>(_2258);
    int _2466 = _2464 + _2444;
    bool _2468 = !_2448;
    int _2470 = _2468 ? 0 : (-1);
    int _2472 = abs(_2452);
    int _2474 = ~_2446;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    int _2480 = ~_2396;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    int _2486 = _2478 * as_type<int>(_2302);
    int _2488 = _2486 + _2466;
    int _2490 = ~_2454;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _1499 * _2484;
    int _2498 = _2496 + _1706;
    int _2500 = ~_2472;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    float _2506 = -_2282;
    float _2508 = _2506 + 1.0;
    float _2510 = -_2246;
    float _2512 = _2510 + 1.0;
    int _2514 = _2494 * as_type<int>(_2310);
    int _2516 = _2514 + _2488;
    float _2518 = _2332 * _2332;
    bool _2520 = !_1606;
    int _2522 = _2520 ? _2498 : (-1);
    float _2524 = -_2508;
    float _2526 = fma(_1790, _2524, _2130);
    int _2528 = _2516 * _2504;
    float _2530 = fma(_2348, _2348, _2518);
    float _2532 = -_2268;
    float _2534 = _2532 + 1.0;
    float _2536 = -_2512;
    float _2538 = fma(_2244, _2536, _2288);
    int _2540 = _2522 * _2472;
    int _2542 = _2540 + _2528;
    float _2544 = fma(_2390, _2390, _2530);
    float _2546 = as_type<float>(_2472);
    if (_2462)
    {
        _2546 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2548 = _2546;
    float _2550 = fma(_2344, _2534, _2384);
    float _2552 = rsqrt(_2544);
    float _2554 = float(_2542);
    int _2556 = as_type<int>(_2548);
    if (_2462)
    {
        float _2558 = _2548 * 5.0;
        _2556 = as_type<int>(_2558);
    }
    int _2560 = _2556;
    out.m_80.x = _2526;
    out.m_80.y = _2406;
    out.m_80.z = _2538;
    out.m_80.w = _2550;
    float _2562 = as_type<float>(_2560);
    if (_2462)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7797 = as_type<float>(_2560);
        out.gl_Position.z = _7797;
    }
    out.m_82.x = _2554;
    if (_2462)
    {
        out.m_53.x = 0.0;
    }
    float _2564 = _2332 * _2552;
    float _2566 = _2348 * _2552;
    if (_2462)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2568 = -_2564;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2122);
    float _2572 = _2390 * _2552;
    float _2574 = -_2566;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2578 = -_2564;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2332);
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2584 = _2570 + _2582;
    float _2586 = -_2572;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2110);
    float _2590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2592 = _2576 + _2590;
    float _2594 = -_2566;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2348);
    float _2598 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2588 + _2600;
    float _2604 = _2580 * _2580;
    float _2606 = -_2572;
    float _2608 = fma(_2606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2390);
    float _2610 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2598);
    float _2612 = fma(_2596, _2596, _2604);
    float _2614 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2610);
    float _2616 = fma(_2608, _2608, _2612);
    bool _2618 = _2614 >= 0.0;
    float _2620 = sqrt(_2616);
    float _2622 = _2584;
    if (_2618)
    {
        _2562 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2624 = _2562;
    int _2626 = as_type<int>(_2624);
    if (_2618)
    {
        out.m_53.x = 0.0;
    }
    float _2628 = _2552 * _2620;
    if (_2618)
    {
        float _2630 = _2624 * 5.0;
        _2626 = as_type<int>(_2630);
    }
    int _2632 = _2626;
    if (_2618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7937 = as_type<float>(_2632);
        out.gl_Position.z = _7937;
    }
    if (_2618)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2634 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2636 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _239);
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _235);
    float _2642 = _2628 * _2634;
    float _2644 = _2628 * _2636;
    float _2646 = _2638 * _2642;
    float _2648 = _2640 * _2644;
    float _2650 = _2628 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2652 = _2650 * 0.5;
    float _2654 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2656 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2658 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2660 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2654);
    float _2662 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2656);
    float _2664 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2658);
    float _2666 = _2570 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2668 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2660);
    float _2670 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2662);
    float _2672 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    float _2674 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2678 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2680 = _2110 + _2674;
    float _2682 = _2232 + _2676;
    float _2684 = _2122 + _2678;
    float _2686 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2666);
    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2694 = _2682 + _2692;
    float _2696 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2686);
    float _2698 = _2690 * _2690;
    float _2700 = fma(_2694, _2694, _2698);
    float _2702 = sqrt(_2700);
    bool _2704 = _2702 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2706 = _2666;
    float _2708 = _2652;
    float _2710 = _2698;
    if (!_2704)
    {
        _2706 = _2682;
    }
    float _2712 = _2706;
    float _2714 = _2712;
    if (!_2704)
    {
        _2708 = _2680;
    }
    float _2716 = _2708;
    float _2718 = _2716;
    if (!_2704)
    {
        _2710 = _2684;
    }
    float _2720 = _2710;
    bool _2722 = !_2704;
    float _2724 = _2720;
    if (!_2722)
    {
        float _2726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2730 = _2702 + _2728;
        float _2732 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2734 = _2730 * _2726;
        float _2736 = rsqrt(_2700);
        float _2738 = _2734 * 0.15915493667125701904296875;
        float _2740 = _2738 * 6.283185482025146484375;
        float _2742 = cos(_2740);
        float _2744 = _2738 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2742 + (-1.0);
        float _2750 = fma(_2746, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2752 = _2748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2754 = _2736 * _2750;
        float _2756 = fma(_2684, _2742, _2752);
        float _2758 = fma(_2694, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2760 = fma(_2690, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2724 = _2756;
        _2714 = _2758;
        _2718 = _2760;
    }
    float _2762 = _2724;
    float _2764 = _2714;
    float _2766 = _2718;
    float _2768 = -_2122;
    float _2770 = _2768 + _2762;
    float _2772 = -_2232;
    float _2774 = _2772 + _2764;
    float _2776 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2778 = _2570 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2780 = _2770 * _2770;
    float _2782 = -_2110;
    float _2784 = _2782 + _2766;
    float _2786 = 1.0 / _2776;
    float _2788 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2778);
    float _2790 = fma(_2774, _2774, _2780);
    float _2792 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2788);
    float _2794 = fma(_2784, _2784, _2790);
    bool _2796 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2798 = isnan(0.5);
    bool _2800 = _2796 || _2798;
    bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2804 = _2800 || _2802;
    float _2806 = _2792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2808 = sqrt(_2794);
    bool _2810 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2812 = isnan(0.5);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2818 = _2814 || _2816;
    float _2820 = _2806 + _2776;
    float _2822 = _2820 * _2786;
    float _2824 = _2822 * 0.5;
    float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2828 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2826);
    float _2830 = 1.0 / _2828;
    bool _2832 = _2808 > 0.0;
    float _2834 = _2776;
    float _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2838 = _2762;
    if (!_2832)
    {
        _2834 = _2764;
    }
    float _2840 = _2834;
    float _2842 = _2840;
    float _2844 = _2840;
    if (!_2832)
    {
        _2836 = _2766;
    }
    float _2846 = _2836;
    bool _2848 = !_2832;
    float _2850 = _2846;
    if (!_2848)
    {
        float _2852 = _229 * _229;
        float _2854 = rsqrt(_2794);
        float _2856 = fma(_225, _225, _2852);
        float _2858 = fma(_231, _231, _2856);
        float _2860 = sqrt(_2858);
        float _2862 = _2774 * _2854;
        float _2864 = _2770 * _2854;
        float _2866 = _2784 * _2854;
        bool _2868 = _2860 > 0.0;
        float _2870 = _2860;
        if (!_2868)
        {
            _2842 = _2764;
        }
        float _2872 = _2842;
        _2844 = _2872;
        if (!_2868)
        {
            _2870 = _2766;
        }
        float _2874 = _2870;
        bool _2876 = !_2868;
        _2850 = _2874;
        if (!_2876)
        {
            float _2878 = rsqrt(_2858);
            float _2880 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2882 = _229 * _2878;
            float _2884 = _225 * _2878;
            float _2886 = _231 * _2878;
            float _2888 = _2864 * _2882;
            float _2890 = fma(_2862, _2884, _2888);
            float _2892 = _2880 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2894 = fma(_2866, _2886, _2890);
            float _2896 = _2894 * _2892;
            float _2898 = fma(_225, _2896, _2764);
            float _2900 = fma(_229, _2896, _2762);
            float _2902 = fma(_231, _2896, _2766);
            _2838 = _2900;
            _2844 = _2898;
            _2850 = _2902;
        }
    }
    float _2904 = _2838;
    float _2906 = _2844;
    float _2908 = _2850;
    float _2910 = -_2564;
    float _2912 = fma(_2910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _2914 = -_2566;
    float _2916 = fma(_2914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2918 = -_2572;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    float _2922 = _2912;
    float _2924 = _2916;
    float _2926 = _2920;
    if (_2818)
    {
        _243 = 1.0;
    }
    float _2928 = _243;
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2932 = _2830 * _2930;
    float _2934 = _2928;
    if (!_2804)
    {
        float _2936 = _2584 * _2584;
        float _2938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2940 = -_2110;
        float _2942 = _2940 + _2908;
        float _2944 = -_2122;
        float _2946 = _2944 + _2904;
        float _2948 = fma(_2592, _2592, _2936);
        float _2950 = -_2232;
        float _2952 = _2950 + _2906;
        float _2954 = fma(_2602, _2602, _2948);
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2958 = sqrt(_2954);
        float _2960 = 1.0 / _2628;
        float _2962 = precise::min(_2958, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2964 = _2962 * _2938;
        float _2966 = _2956 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2968 = _2964 * _2960;
        float _2970 = _2966 * _2968;
        float _2972 = _2942 * _2968;
        float _2974 = fma(_2946, _2970, _2570);
        float _2976 = fma(_2952, _2970, _2576);
        float _2978 = fma(_2966, _2972, _2588);
        _2922 = _2974;
        _2924 = _2976;
        _2926 = _2978;
        _2622 = _2936;
        _2372 = _2972;
    }
    float _2980 = _2922;
    float _2982 = _2924;
    float _2984 = _2926;
    float _2986 = _2622;
    float _2988 = _2372;
    float _2990 = _2988;
    float _2992 = _2986;
    if (!_2818)
    {
        float _2994 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2996 = _2994 * 0.15915493667125701904296875;
        float _2998 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3000 = _2996 * 6.283185482025146484375;
        float _3002 = cos(_3000);
        float _3004 = _2998 * 0.15915493667125701904296875;
        float _3006 = _2996 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        float _3010 = 1.0 / _3002;
        float _3012 = _3004 * 6.283185482025146484375;
        float _3014 = cos(_3012);
        float _3016 = _3008 * _3010;
        float _3018 = _3004 * 6.283185482025146484375;
        float _3020 = sin(_3018);
        float _3022 = _3014 * _3016;
        float _3024 = 1.0 / _3022;
        float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3028 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3026;
        float _3030 = 1.0 / _3028;
        float _3032 = _3020 * _3024;
        float _3034 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3036 = fma(_2932, _3032, _3034);
        float _3038 = _3036 * _3030;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        _2990 = _3030;
        _2934 = _3040;
    }
    float _3042 = _2990;
    float _3044 = _2934;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3048 = _2980 + _3046;
    float _3050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3052 = _2982 + _3050;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3056 = _2984 + _3054;
    float _3058 = _3048 * _3048;
    float _3060 = fma(_3052, _3052, _3058);
    float _3062 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3064 = fma(_3056, _3056, _3060);
    float _3066 = rsqrt(_3064);
    float _3068 = sqrt(_3064);
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3072 = _3052 * _3070;
    float _3074 = _3056 * _3070;
    float _3076 = _3072 * _3072;
    float _3078 = _3074 * _3074;
    float _3080 = _3076 + _3078;
    float _3082 = sqrt(_3080);
    bool _3084 = _3082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3088 = _3082 + _3086;
    float _3090 = _3066;
    float _3092 = _3088;
    float _3094 = _3048;
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _3098 = _3080;
    if (_3084)
    {
        float _3100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3090 = _3100;
    }
    float _3102 = _3090;
    float _3104 = _3102;
    if (_3084)
    {
        float _3106 = _3088 * _3102;
        _3092 = _3106;
    }
    float _3108 = _3092;
    if (_3084)
    {
        float _3110 = rsqrt(_3080);
        _3104 = _3110;
    }
    float _3112 = _3104;
    float _3114 = _3112;
    if (_3084)
    {
        float _3116 = _3108 * 0.15915493667125701904296875;
        _2992 = _3116;
    }
    float _3118 = _2992;
    float _3120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3122 = _3056;
    if (_3084)
    {
        float _3124 = _3118 * 6.283185482025146484375;
        float _3126 = sin(_3124);
        _3122 = _3126;
    }
    float _3128 = _3122;
    float _3130 = precise::max(0.0, _3120);
    float _3132 = _3042;
    float _3134 = _3130;
    if (_3084)
    {
        float _3136 = _3118 * 6.283185482025146484375;
        float _3138 = cos(_3136);
        _3132 = _3138;
    }
    float _3140 = _3132;
    float _3142 = -_3070;
    float _3144 = -_3130;
    float _3146 = fma(_3048, _3142, _3144);
    if (_3084)
    {
        float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3148;
    }
    float _3150 = _3094;
    float _3152 = _3128;
    float _3154 = _3150;
    if (_3084)
    {
        float _3156 = fma(_3128, _3150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3156;
    }
    float _3158 = _3152;
    float _3160 = _3158;
    if (!_3084)
    {
        _3154 = _3076;
    }
    float _3162 = _3154;
    float _3164 = _3162;
    if (_3084)
    {
        float _3166 = _3112 * _3158;
        _3096 = _3166;
    }
    float _3168 = _3096;
    if (!_3084)
    {
        _3114 = _3072;
    }
    float _3170 = _3114;
    float _3172 = _3170;
    float _3174 = _3140;
    if (_3084)
    {
        float _3176 = _3140 + (-1.0);
        _3134 = _3176;
    }
    float _3178 = _3134;
    float _3180 = _3178;
    if (_3084)
    {
        float _3182 = _3072 * _3168;
        _3172 = _3182;
    }
    float _3184 = _3172;
    if (!_3084)
    {
        _3160 = _3146;
    }
    float _3186 = _3160;
    float _3188 = fma(_2588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3190 = _3186;
    if (_3084)
    {
        float _3192 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3098 = _3192;
    }
    float _3194 = _3098;
    if (!_3084)
    {
        _3180 = _3074;
    }
    float _3196 = _3180;
    float _3198 = _3196;
    if (_3084)
    {
        float _3200 = _3074 * _3168;
        _3198 = _3200;
    }
    float _3202 = _3198;
    if (_3084)
    {
        float _3204 = _3184 * _3184;
        _3164 = _3204;
    }
    float _3206 = _3164;
    if (_3084)
    {
        float _3208 = fma(_3146, _3140, _3194);
        _3190 = _3208;
    }
    float _3210 = _3190;
    if (!_3084)
    {
        _3174 = _3078;
    }
    float _3212 = _3174;
    float _3214 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3216 = _3212;
    if (_3084)
    {
        float _3218 = _3202 * _3202;
        _3216 = _3218;
    }
    float _3220 = _3216;
    float _3222 = fma(_3210, _3210, _3206);
    float _3224 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3214);
    float _3226 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3228 = _3222 + _3220;
    float _3230 = floor(_3062);
    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3234 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3232);
    float _3236 = precise::clamp(_3234, 0.0, 1.0);
    float _3238 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3224);
    float _3240 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3226);
    float _3242 = -_3236;
    float _3244 = _3242 + 1.0;
    float _3246 = _3238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3248 = rsqrt(_3228);
    float _3250 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3252 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3254 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3240);
    float _3256 = -_3252;
    float _3258 = fma(_3256, _3250, 1.0);
    float _3260 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3262 = abs(_3244);
    float _3264 = log2(_3262);
    float _3266 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3268 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3270 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3260);
    float _3272 = -_3230;
    float _3274 = _3062 + _3272;
    float _3276 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3266);
    float _3278 = _3248 * _3184;
    float _3280 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3276);
    float _3282 = _3248 * _3210;
    float _3284 = _3248 * _3202;
    float _3286 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3288 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3270);
    float _3290 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3292 = floor(_3188);
    float _3294 = -_3286;
    float _3296 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3294);
    float _3298 = _3288 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3302 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3304 = -_3284;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3296);
    float _3308 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3310 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3300);
    float _3312 = exp2(_3302);
    float _3314 = fma(_3306, -0.5, 0.5);
    float _3316 = fma(_3306, 0.5, 0.5);
    float _3318 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3310);
    float _3320 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3308);
    float _3322 = fma(_3316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3324 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3318);
    float _3326 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3328 = log2(_3258);
    float _3330 = -_3292;
    float _3332 = _3188 + _3330;
    float _3334 = _3282 + 1.0;
    float _3336 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3326);
    float _3338 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3320);
    float _3340 = fma(_3316, _3322, -0.212114393711090087890625);
    float _3342 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3336);
    float _3344 = 1.0 / _3324;
    float _3346 = -_3282;
    float _3348 = fma(_3312, _3334, _3346);
    float _3350 = fma(_3316, _3340, 1.570728778839111328125);
    float _3352 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3342);
    float _3354 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3338);
    float _3356 = sqrt(_3314);
    float _3358 = _3328 * 0.693147182464599609375;
    float2 _9120 = float2(_3274, _3332);
    float _3360 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9120, float2(0.0), isnan(_9120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9120, float2(0.0), isnan(_9120)), level(0.0)).x;
    float _3362 = fma(_3348, 0.5, 0.5);
    float _3364 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3366 = _3352 * _3344;
    float _3368 = _3354 * _3344;
    float _3370 = fma(_3366, 0.5, 0.5);
    float _3372 = fma(_3368, -0.5, 0.5);
    float _3374 = _3356 * 0.636619746685028076171875;
    float3 _9150 = float3(_3370, _3372, _3364);
    float _3376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9150, float3(0.0), isnan(_9150)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9150, float3(0.0), isnan(_9150)), level(0.0)).x;
    float _3378 = -_3350;
    float _3380 = fma(_3374, _3378, 1.0);
    float3 _9166 = float3(_3370, _3372, _3364);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9166, float3(0.0), isnan(_9166)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9166, float3(0.0), isnan(_9166)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float2 _9182 = float2(_3380, _3362);
    float3 _3395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9182, float2(0.0), isnan(_9182)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9182, float2(0.0), isnan(_9182)), level(0.0)).xyz;
    float _3397 = _3395.x;
    float _3399 = _3395.y;
    float _3401 = _3395.z;
    float _3403 = abs(_2932);
    float _3405 = log2(_3403);
    float _3407 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = in.m_84.x;
    float _3411 = _235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3413 = _3324 * 0.5;
    float _3415 = fma(_3407, _3407, 1.0);
    out.m_86.x = _2982;
    out.m_86.y = _2980;
    out.m_86.z = _2984;
    bool _3417 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3419 = isnan(_3068);
    bool _3421 = _3417 || _3419;
    bool _3423 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3425 = _3421 || _3423;
    float _3427 = rsqrt(_3415);
    float _3429 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3431 = exp2(_3429);
    float _3433 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3435 = precise::clamp(_3433, 0.0, 1.0);
    float _3437 = fma(_3435, -2.0, 3.0);
    float _3439 = _3435 * _3435;
    float _3441 = _3439 * _3437;
    float _3443 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3445 = _3407 * _3427;
    float _3447 = -_3441;
    float _3449 = _3447 + 1.0;
    float _3451 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3443);
    float _3453 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3455 = _3445 * _3453;
    float _3457 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3459 = _3445 * _3457;
    float _3461 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3441);
    float _3463 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3465 = _3445 * _3463;
    float _3467 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3451);
    float _3469 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3455);
    float _3471 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3465);
    float _3473 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3475 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3459);
    float _3477 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3467);
    out.m_88.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_88.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_88.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3479 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3481 = fma(_3354, -0.5, _3413);
    float _3483 = exp2(_3473);
    out.m_90.x = _3469;
    out.m_90.y = _3471;
    out.m_90.z = _3475;
    float _3485 = _3477 + _3324;
    float _3487 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3479);
    out.gl_Position.x = _3352;
    out.gl_Position.y = _3354;
    out.gl_Position.z = _3477;
    out.gl_Position.w = _3324;
    float _3489 = _3485 * 0.5;
    float _3491 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3493 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3495 = _2932 <= 8000.0;
    bool _3497 = isnan(_2932);
    bool _3499 = _3495 || _3497;
    bool _3501 = isnan(8000.0);
    bool _3503 = _3499 || _3501;
    float _3505 = float(_3503);
    float _3507 = _3352 + _3324;
    float _3509 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3491);
    float _3511 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3493);
    float _3513 = _3044 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3515 = -_3483;
    float _3517 = _3515 + 1.0;
    float _3519 = _3505 * _3461;
    float _3521 = _3507 * 0.5;
    float _3523 = _3511 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3525 = _3517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3527 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3529 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_92.x = _3521;
    out.m_92.y = _3481;
    out.m_92.z = _3489;
    out.m_92.w = _3324;
    float _3531 = -_3525;
    float _3533 = _3531 + 1.0;
    float _3535 = _3471;
    float _3537 = _3511;
    float _3539 = _3509;
    if (!_3425)
    {
        _3535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3541 = _3535;
    float _3543 = _3541;
    float _3545 = _3541;
    if (!_3425)
    {
        _3537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3547 = _3537;
    float _3549 = -_3360;
    float _3551 = _3549 + 1.0;
    float _3553 = _3551 * _3529;
    float _3555 = precise::clamp(_3553, 0.0, 1.0);
    float _3557 = -_3555;
    float _3559 = fma(_3557, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3561 = _3559 * _3409;
    float _3563 = _3525 * _3376;
    float _3565 = _3561 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3567 = _3561;
    float _3569 = _3565;
    float _3571 = _3547;
    float _3573 = _3547;
    if (!_3425)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3575 = _3567;
    float _3577 = _3391 * _3563;
    out.m_94.x = _3565;
    float _3579 = _3401 * _3563;
    float _3581 = fma(_3399, _3577, _3387);
    float _3583 = fma(_3397, _3577, _3385);
    float _3585 = _3391 * _3533;
    float _3587 = fma(_3391, _3579, _3389);
    float _3589 = _3509 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3591 = _3577;
    float _3593 = _3575;
    float _3595 = _3575;
    if (!_3425)
    {
        _3591 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3597 = _3591;
    float _3599 = _3597;
    float _3601 = _3597;
    if (!_3425)
    {
        _3539 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3603 = _3539;
    out.m_96.x = _3583;
    out.m_96.y = _3581;
    out.m_96.z = _3587;
    out.m_96.w = _3585;
    float _3605 = _3603;
    float _3607 = _3603;
    if (!_3425)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3609 = _3569;
    out.m_98.x = _3589;
    out.m_98.y = _3523;
    out.m_98.z = _3527;
    bool _3611 = !_3425;
    float _3613 = _3609;
    float _3615 = _3609;
    if (!_3611)
    {
        bool _3617 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3619 = isnan(_3068);
        bool _3621 = _3617 || _3619;
        bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3625 = _3621 || _3623;
        if (!_3625)
        {
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = _3068 + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3633 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3631;
            float _3635 = 1.0 / _3633;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3657 = _3629 * _3635;
            float _3659 = precise::clamp(_3657, 0.0, 1.0);
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3665 = fma(_3659, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3667 = fma(_3659, _3663, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3669 = fma(_3659, _3643, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3671 = fma(_3659, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3673 = fma(_3659, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3675 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3545 = _3667;
            _3607 = _3673;
            _3601 = _3665;
            _3595 = _3671;
            _3573 = _3669;
            _3615 = _3675;
            _3677 = true;
        }
        else
        {
            bool _3679 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3681 = isnan(_3068);
            bool _3683 = _3679 || _3681;
            bool _3685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3687 = _3683 || _3685;
            if (!_3687)
            {
                _3599 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3689 = _3599;
            _3601 = _3689;
            if (!_3687)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3691 = _3543;
            _3545 = _3691;
            if (!_3687)
            {
                _3571 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3693 = _3571;
            _3573 = _3693;
            if (!_3687)
            {
                _3593 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3695 = _3593;
            _3595 = _3695;
            if (!_3687)
            {
                _3605 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3697 = _3605;
            _3607 = _3697;
            if (!_3687)
            {
                _3613 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3699 = _3613;
            bool _3701 = !_3687;
            _3615 = _3699;
            if (!_3701)
            {
                bool _3703 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3705 = isnan(_3068);
                bool _3707 = _3703 || _3705;
                bool _3709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3711 = _3707 || _3709;
                if (!_3711)
                {
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = _3068 + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3719 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3717;
                    float _3721 = 1.0 / _3719;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3743 = _3715 * _3721;
                    float _3745 = precise::clamp(_3743, 0.0, 1.0);
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3751 = fma(_3745, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3753 = fma(_3745, _3749, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3755 = fma(_3745, _3729, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3757 = fma(_3745, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3759 = fma(_3745, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3761 = fma(_3745, _3741, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3545 = _3753;
                    _3607 = _3759;
                    _3601 = _3751;
                    _3595 = _3757;
                    _3573 = _3755;
                    _3615 = _3761;
                    _3677 = true;
                }
                else
                {
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3607 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3601 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3595 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3573 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3615 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3677 = false;
    float _3763 = _3545;
    float _3765 = _3607;
    float _3767 = _3601;
    float _3769 = _3595;
    float _3771 = _3573;
    float _3773 = _3615;
    float _3775 = fma(_3523, -0.5, 0.5);
    float _3777 = precise::clamp(_3775, 0.0, 1.0);
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = _3513 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3785 = -_3767;
    float _3787 = _3785 + _3769;
    out.m_100.x = 0.0;
    float _3789 = fma(_3777, _3781, _3763);
    float _3791 = fma(_3777, _3787, _3767);
    out.m_53.x = _3783;
    float _3793 = -_3771;
    float _3795 = _3793 + _3773;
    float _3797 = _3789 * 0.586610972881317138671875;
    bool _3799 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3801 = fma(_3777, _3795, _3771);
    float _3803 = fma(_3791, 0.298911988735198974609375, _3797);
    bool _3805 = _3044 > 0.0;
    bool _3807 = isnan(_3044);
    bool _3809 = _3805 || _3807;
    bool _3811 = isnan(0.0);
    bool _3813 = _3809 || _3811;
    float _3815 = fma(_3801, 0.114477999508380889892578125, _3803);
    float _3817 = -_3815;
    float _3819 = _3791 + _3817;
    float _3821 = -_3815;
    float _3823 = _3789 + _3821;
    float _3825 = -_3815;
    float _3827 = _3801 + _3825;
    float _3829 = fma(_3819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    float _3831 = fma(_3823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    float _3833 = fma(_3827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    bool _3835 = !_3799;
    if (!_3835)
    {
        float _3837 = -_2980;
        float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3841 = -_2982;
        float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3845 = -_2984;
        float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3849 = _3839 * _3839;
        float _3851 = fma(_3843, _3843, _3849);
        float _3853 = fma(_3847, _3847, _3851);
        float _3855 = sqrt(_3853);
        float _3857 = rsqrt(_3853);
        float _3859 = -_3855;
        float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3863 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3865 = precise::clamp(_3863, 0.0, 1.0);
        float _3867 = _3843 * _3857;
        float _3869 = _3839 * _3857;
        float _3871 = abs(_3865);
        float _3873 = log2(_3871);
        float _3875 = _3847 * _3857;
        float _3877 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3879 = _3523 * _3869;
        float _3881 = -_3869;
        float _3883 = -_3877;
        float _3885 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3883);
        float _3887 = fma(_3589, _3867, _3879);
        float _3889 = -_3875;
        float _3891 = fma(_3889, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3885);
        float _3893 = fma(_3527, _3875, _3887);
        float _3895 = precise::clamp(_3893, 0.0, 1.0);
        float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3899 = _3891 + _3897;
        float _3901 = _3873 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3903 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3905 = precise::clamp(_3903, 0.0, 1.0);
        float _3907 = exp2(_3901);
        float _3909 = _3907 * _3905;
        float _3911 = _3895 * _3909;
        float _3913 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3915 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3917 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3913;
        out.m_100.y = _3915;
        out.m_100.z = _3917;
    }
    out.m_102.x = _3829;
    out.m_102.y = _3831;
    out.m_102.z = _3833;
    if (_3813)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3919 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3919;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad7 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3677 = false;
    bool _1119 = false;
    bool _985 = false;
    bool _825 = false;
    bool _615 = false;
    bool _447 = false;
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
    float _135 = as_type<float>(_123);
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_131)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3987 = as_type<float>(_143);
        out.gl_Position.z = _3987;
    }
    if (!_131)
    {
        return out;
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_155;
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
    if (_165)
    {
        float _171 = _169 * 5.0;
        _145 = as_type<int>(_171);
    }
    int _173 = _145;
    float _175 = _127 * _167;
    out.m_57.x = _157;
    float _177 = _175;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4052 = as_type<float>(_173);
        out.gl_Position.z = _4052;
    }
    out.m_51.x = _175;
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = _183 * _189;
    float _217 = _183 * _195;
    float _219 = fma(_181, _187, _215);
    float _221 = _183 * _201;
    float _223 = fma(_181, _193, _217);
    float _225 = fma(_185, _191, _219);
    float _227 = fma(_181, _199, _221);
    float _229 = fma(_185, _197, _223);
    float _231 = fma(_185, _203, _227);
    bool _233 = !_207;
    float _235 = _233 ? (-0.5) : 0.5;
    bool _237 = !_211;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_213;
    float _243 = _229;
    float _259;
    if (!_241)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _259 = _175;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = 1.0 / _279;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = 1.0 / _287;
    bool _295 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_263);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _283;
    float _309 = _267 * _289;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_305;
    float _325 = _323 + 1.0;
    float _327 = _271 * _293;
    bool _329 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _331 = isnan(_263);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_263);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _339 * _325;
    float _355 = -_339;
    float _357 = _355 + 1.0;
    float _359 = _275 * _307;
    float _361 = -_321;
    float _363 = _361 + 1.0;
    float _365 = _351 * _357;
    float _367 = -_351;
    float _369 = _367 + 1.0;
    float _371 = _305 * _363;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_375, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_383, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = fma(_387, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _389 * _365;
    float _399 = _391 * _365;
    float _401 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _413 = fma(_393, _353, _401);
    float _415 = fma(_405, _327, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _327, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_395, _353, _411);
    float _421 = fma(_415, _371, _413);
    float _423 = fma(_417, _371, _419);
    float _425 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].x, _421);
    float _427 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].y, _423);
    bool _429 = !_291;
    float _445;
    if (!_429)
    {
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _433 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        _445 = _175;
    }
    _447 = false;
    float _449 = _445;
    float _451 = in.m_70.x;
    float _453 = in.m_70.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _449 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _471 = 1.0 / _465;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _475 = 1.0 / _469;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = _427 * _453;
    bool _483 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _485 = isnan(_449);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _457 * _471;
    bool _497 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_449);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    bool _513 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _515 = isnan(_449);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_493;
    float _527 = _525 + 1.0;
    float _529 = fma(_479, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _531 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _425 * _451;
    float _535 = _523 * _527;
    float _537 = -_523;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _541;
    float _545 = _461 * _475;
    float _547 = _507 * _539;
    float _549 = fma(_543, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _551 = -_507;
    float _553 = _551 + 1.0;
    float _555 = _529 * _547;
    float _557 = _549 * _547;
    float _559 = _531 * _547;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].x, _557);
    float _575 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].y, _555);
    float _577 = fma(_563, _545, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _579 = fma(_567, _545, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _581 = fma(_571, _545, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _583 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].z, _559);
    float _585 = fma(_577, _535, _573);
    float _587 = fma(_579, _535, _575);
    float _589 = fma(_581, _535, _583);
    float _591 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].x, _585);
    float _593 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].y, _587);
    float _595 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].z, _589);
    bool _597 = !_473;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        _613 = _175;
    }
    _615 = false;
    float _617 = _613;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _617 + _619;
    float _623 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _637 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = isnan(_617);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _627;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_617);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _673 = 1.0 / _635;
    float _675 = _631 * _649;
    bool _677 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_617);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _653;
    float _691 = -_647;
    float _693 = _691 + 1.0;
    float _695 = fma(_675, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _701 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_617);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_687;
    float _715 = _713 + 1.0;
    float _717 = _687 * _693;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = 1.0 / _699;
    float _725 = -_711;
    float _727 = _725 + 1.0;
    float _729 = _665 * _715;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _731;
    float _735 = _721 * _673;
    float _737 = _647 * _727;
    float _739 = _695 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _617 + _741;
    float _745 = -_665;
    float _747 = _745 + 1.0;
    bool _749 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = isnan(_617);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _689;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _769 = _617 + _767;
    float _771 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _739);
    float _775 = -_759;
    float _777 = _775 + 1.0;
    float _779 = _765 * _723;
    float _781 = fma(_761, _769, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _785 = _617 + _783;
    float _787 = fma(_771, _717, _773);
    float _789 = _711 * _777;
    float _791 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = fma(_779, _785, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _795 = fma(_781, _737, _787);
    float _797 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = fma(_793, _789, _795);
    float _801 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[119].x, _799);
    float _803 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _791;
    out.m_72.y = _797;
    out.m_72.z = _803;
    out.m_72.w = _805;
    bool _807 = !_671;
    float _823;
    if (!_807)
    {
        float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _811 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _815 = _813 * _809;
        float _817 = floor(_815);
        float _819 = -_817;
        float _821 = _815 + _819;
        _823 = _821;
        _825 = true;
    }
    else
    {
        _823 = _175;
    }
    _825 = false;
    float _827 = _823;
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
    float _881 = 1.0 / _863;
    float _883 = -_879;
    float _885 = _883 + 1.0;
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = _859 * _885;
    float _891 = -_859;
    float _893 = _891 + 1.0;
    float _895 = 1.0 / _867;
    float _897 = _831 * _881;
    float _899 = -_843;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _903;
    float _907 = _879 * _901;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = fma(_905, _897, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _919 = _847 * _895;
    float _921 = fma(_911, _897, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _923 = fma(_915, _897, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _925 = _917 * _889;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _931 = _921 * _889;
    float _933 = _923 * _889;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _943 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].x, _931);
    float _945 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].y, _925);
    float _947 = fma(_937, _919, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _949 = fma(_929, _919, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _951 = fma(_941, _919, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _953 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].z, _933);
    float _955 = fma(_947, _907, _943);
    float _957 = fma(_949, _907, _945);
    float _959 = fma(_951, _907, _953);
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].x, _955);
    float _963 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].y, _957);
    float _965 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].z, _959);
    bool _967 = !_887;
    float _983;
    if (!_967)
    {
        float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _971 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _975 = _973 * _969;
        float _977 = floor(_975);
        float _979 = -_977;
        float _981 = _975 + _979;
        _983 = _981;
        _985 = true;
    }
    else
    {
        _983 = _175;
    }
    _985 = false;
    float _987 = _983;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _995 = isnan(_987);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1009 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1011 = isnan(_987);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _991;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1023;
    float _1027 = -_1003;
    float _1029 = _1027 + 1.0;
    bool _1031 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1033 = isnan(_987);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    bool _1043 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1045 = 1.0 / _1007;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1051 = _1025 * _1021;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1055 = _987 + _1053;
    float _1057 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1059 = fma(_1051, _1055, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1061 = _1019 * _1029;
    float _1063 = -_1019;
    float _1065 = _1063 + 1.0;
    float _1067 = _1049 * _1045;
    float _1069 = -_1041;
    float _1071 = _1069 + 1.0;
    float _1073 = _1059 * _1061;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1077 = _987 + _1075;
    float _1079 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1003 * _1071;
    float _1083 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1073);
    float _1085 = fma(_1067, _1077, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1087 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1089 = fma(_1085, _1081, _1083);
    float _1091 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1093 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1089);
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _1079;
    out.m_74.y = _1097;
    out.m_74.z = _1093;
    out.m_74.w = _1099;
    bool _1101 = !_1043;
    float _1117;
    if (!_1101)
    {
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1105 = _157 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _1109 = _1107 * _1103;
        float _1111 = floor(_1109);
        float _1113 = -_1111;
        float _1115 = _1109 + _1113;
        _1117 = _1115;
        _1119 = true;
    }
    else
    {
        _1117 = _175;
    }
    _1119 = false;
    float _1121 = _1117;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1125 = _1121 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1143 = 1.0 / _1129;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1153 = 1.0 / _1133;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1157 = _1121 + _1155;
    bool _1159 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1161 = isnan(_1121);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    bool _1171 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1173 = isnan(_1121);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    bool _1183 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1185 = isnan(_1121);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = -_1169;
    float _1197 = _1195 + 1.0;
    float _1199 = 1.0 / _1137;
    float _1201 = _1157 * _1143;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1203;
    bool _1207 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1209 = isnan(_1121);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1221 = _1121 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1225 = _1121 + _1223;
    float _1227 = 1.0 / _1147;
    float _1229 = _1125 * _1153;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1233 = _1121 + _1231;
    float _1235 = -_1217;
    float _1237 = _1235 + 1.0;
    bool _1239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1241 = 1.0 / _1151;
    float _1243 = _1233 * _1199;
    bool _1245 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1247 = isnan(_1121);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = 1.0 / _1141;
    float _1259 = _1221 * _1227;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1263 = _1121 + _1261;
    bool _1265 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1267 = isnan(_1121);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1205;
    float _1279 = _1263 * _1241;
    bool _1281 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1283 = isnan(_1121);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = _1225 * _1257;
    float _1295 = _1255 * _1237;
    float _1297 = -_1255;
    float _1299 = _1297 + 1.0;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1303 = _1121 + _1301;
    float _1305 = _1275 * _1299;
    float _1307 = -_1275;
    float _1309 = _1307 + 1.0;
    float _1311 = _1303 * _1277;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1313;
    float _1317 = _1291 * _1309;
    float _1319 = -_1291;
    float _1321 = _1319 + 1.0;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1323;
    float _1327 = fma(_1315, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1329 = _1169 * _1321;
    float _1331 = fma(_1325, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1333 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1335 = isnan(_1121);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1341 = _1337 || _1339;
    float _1343 = float(_1341);
    float _1345 = -_1181;
    float _1347 = _1345 + 1.0;
    float _1349 = _1181 * _1197;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1359 = _1343 * _1347;
    float _1361 = -_1343;
    float _1363 = _1361 + 1.0;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1369;
    float _1373 = _1193 * _1363;
    float _1375 = -_1193;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1353, _1229, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1381 = fma(_1357, _1229, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1383 = _1331 * _1373;
    float _1385 = _1327 * _1373;
    float _1387 = fma(_1367, _1243, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1389 = fma(_1371, _1243, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1399 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1383);
    float _1401 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1385);
    float _1403 = fma(_1393, _1293, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1405 = fma(_1397, _1293, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1407;
    float _1411 = fma(_1379, _1359, _1399);
    float _1413 = fma(_1381, _1359, _1401);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1415;
    float _1419 = fma(_1409, _1259, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1421 = fma(_1387, _1349, _1411);
    float _1423 = fma(_1389, _1349, _1413);
    float _1425 = fma(_1417, _1259, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1435 = fma(_1403, _1329, _1421);
    float _1437 = fma(_1405, _1329, _1423);
    float _1439 = fma(_1429, _1279, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1441;
    float _1445 = fma(_1433, _1279, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1447;
    float _1451 = fma(_1419, _1317, _1435);
    float _1453 = fma(_1425, _1317, _1437);
    float _1455 = fma(_1443, _1311, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1457 = fma(_1449, _1311, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1459 = fma(_1439, _1305, _1451);
    float _1461 = fma(_1445, _1305, _1453);
    float _1463 = fma(_1455, _1295, _1459);
    float _1465 = fma(_1457, _1295, _1461);
    float _1467 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1463);
    float _1469 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1465);
    out.m_76.x = _1467;
    out.m_76.z = _1469;
    bool _1471 = !_1239;
    if (!_1471)
    {
        float _1473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1475 = _157 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[14].y, _127);
        float _1479 = _1477 * _1473;
        float _1481 = floor(_1479);
        float _1483 = -_1481;
        float _1485 = _1479 + _1483;
        _177 = _1485;
    }
    float _1487 = _177;
    float _1489 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1491 = int(_1489);
    float _1493 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1495 = in.m_68.w;
    float _1497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1499 = int(_1497);
    float _1501 = in.m_66.w;
    float _1503 = in.m_64.w;
    float _1505 = float(_1491);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1511 = 1.0 / _1505;
    float _1513 = float(uint(_1499));
    int _1515 = ~_1499;
    int _1517 = _1515 + 1;
    int _1519 = ~_1499;
    int _1521 = _1519 + 1;
    float _1523 = 1.0 / _1513;
    int _1525 = ~_1499;
    int _1527 = _1525 + 1;
    float _1529 = _127 * _1511;
    float _1531 = trunc(_1529);
    int _1533 = int(_1531);
    int _1535 = as_type<int>(_1523) + (-2);
    float _1537 = float(uint(_1533));
    float _1539 = float(_1533);
    float _1541 = as_type<float>(_1535) * _1537;
    float _1543 = trunc(_1541);
    float _1545 = precise::max(_1543, 0.0);
    uint _1548 = uint(_1545);
    int _1550 = _1517 * int(_1548);
    int _1552 = _1550 + _1533;
    float _1554 = float(uint(_1552));
    float _1556 = as_type<float>(_1535) * _1554;
    float _1558 = trunc(_1556);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    bool _1568 = !_1566;
    float _1570 = _1568 ? 7.345489978790283203125 : 1.0;
    float _1572 = float(_1499);
    float _1574 = _1570 * _157;
    bool _1576 = _1539 >= _1572;
    bool _1578 = isnan(_1539);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(_1572);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    int _1588 = int(_1548) + int(_1562);
    float _1590 = trunc(_1586);
    int _1592 = int(_1590);
    int _1594 = _1521 * _1588;
    int _1596 = _1594 + _1533;
    float _1598 = floor(_1574);
    bool _1600 = uint(_1596) >= uint(_1499);
    bool _1602 = !_1600;
    int _1604 = _1602 ? 0 : (-1);
    bool _1606 = _1499 == 0;
    int _1608 = ~_1588;
    int _1610 = _1608 + _1604;
    int _1612 = _1610 + 1;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1628 = _1626 != 0;
    int _1630 = _1499 * _1612;
    int _1632 = _1630 + _1533;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1636 = _1634 != 0;
    float _1638 = -_1598;
    float _1640 = _1574 + _1638;
    int _1642 = _1499 + (-1);
    bool _1644 = !_1606;
    int _1646 = _1644 ? _1632 : (-1);
    float _1648 = _1640 * _1572;
    float _1650 = _127 * _1572;
    int _1652 = ~_1592;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = !_1628;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = _1650 * _167;
    float _1664 = trunc(_1648);
    int _1666 = int(_1664);
    int _1668 = _1646 * _1656;
    bool _1670 = !_1620;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1660);
    int _1676 = _1592 * _1642;
    int _1678 = _1676 + _1668;
    int _1680 = abs(_1672);
    float _1682 = trunc(_1662);
    int _1684 = int(_1682);
    bool _1686 = !_1616;
    int _1688 = _1686 ? 0 : 1;
    bool _1690 = !_1624;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = abs(_1688);
    int _1696 = abs(_1692);
    int _1698 = _1678 * _1680;
    bool _1700 = !_1636;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _1666 * _1674;
    int _1706 = _1704 + _1533;
    float _1708 = in.m_55.y;
    int _1710 = abs(_1702);
    bool _1712 = _157 > 0.5;
    int _1714 = _1684 * _1694;
    int _1716 = _1714 + _1698;
    int _1718 = ~_1499;
    int _1720 = _1718 + 1;
    float _1722 = in.m_55.w;
    int _1724 = ~_1499;
    int _1726 = _1724 + 1;
    int _1728 = _1706 * _1696;
    int _1730 = _1728 + _1716;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1734 = _1732 != 0;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1738 = _1736 != 0;
    int _1740 = _1666 * _1710;
    int _1742 = _1740 + _1730;
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1746 = _1744 != 0;
    float _1748 = float(uint(_1742));
    float _1750 = as_type<float>(_1535) * _1748;
    float _1752 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1754 = trunc(_1750);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1752);
    float _1762 = -_1760;
    float _1764 = _1762 + 1.0;
    int _1766 = _1720 * int(_1758);
    int _1768 = _1766 + _1742;
    float _1770 = float(uint(_1768));
    float _1772 = as_type<float>(_1535) * _1770;
    float _1774 = trunc(_1772);
    float _1776 = precise::max(_1774, 0.0);
    uint _1778 = uint(_1776);
    float _1780 = -_235;
    int _1782 = _1712 ? as_type<int>(_1780) : as_type<int>(_235);
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1786 = _1784 != 0;
    bool _1788 = !_1734;
    float _1790 = _1788 ? _235 : as_type<float>(_1782);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1794 = _1792 != 0;
    int _1796 = int(_1758) + int(_1778);
    float _1798 = _1790 + 0.5;
    float _1800 = in.m_46.x;
    float _1802 = in.m_46.y;
    float _1804 = in.m_46.z;
    int _1806 = _1726 * _1796;
    int _1808 = _1806 + _1742;
    bool _1810 = uint(_1808) >= uint(_1499);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1814 = _1812 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1816 = !_1810;
    int _1818 = _1816 ? 0 : (-1);
    bool _1820 = _1708 > 0.5;
    float _1822 = 1.0 / _1814;
    int _1824 = ~_1796;
    int _1826 = _1824 + _1818;
    int _1828 = _1826 + 1;
    float _1830 = -_239;
    int _1832 = _1820 ? as_type<int>(_1830) : as_type<int>(_239);
    bool _1834 = _1722 > 0.5;
    int _1836 = _1499 * _1828;
    int _1838 = _1836 + _1742;
    float _1840 = _189 * _1802;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1846 = _195 * _1802;
    float _1848 = _201 * _1802;
    float _1850 = fma(_187, _1800, _1840);
    float _1852 = 1.0 / _1844;
    float _1854 = fma(_193, _1800, _1846);
    float _1856 = fma(_199, _1800, _1848);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1868 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1870 = -_1862;
    float _1872 = fma(_1493, 2.0, _1870);
    float _1874 = 1.0 / _1860;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1878 = fma(_191, _1804, _1850);
    float _1880 = fma(_1868, -2.0, _1876);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1886 = fma(_197, _1804, _1854);
    float _1888 = 1.0 / _1866;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1890;
    float _1894 = fma(_203, _1804, _1856);
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1900 = _1892 * _1822;
    float _1902 = in.m_55.z;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1908 = 1.0 / _1884;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1910;
    float _1914 = _1906 * _1852;
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1918 = _1916 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1920 = _1912 * _1874;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1922;
    float _1926 = 1.0 / _1898;
    float _1928 = _1918 * _1888;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1938 = _1487 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1946 = _1934;
    if (!_1566)
    {
        _1944 = _1708;
    }
    float _1948 = _1944;
    float _1950 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1934);
    float _1952 = _1948;
    if (_1566)
    {
        _1952 = _157;
    }
    float _1954 = _1952;
    float _1956 = 1.0 / _1942;
    bool _1958 = !_1746;
    float _1960 = _1958 ? _239 : as_type<float>(_1832);
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1964 = _1487 + _1962;
    float _1966 = fma(_1900, _1938, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1970 = _1487 + _1968;
    float _1972 = _1924 * _1908;
    float _1974 = _1932 * _1926;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1978 = _1487 + _1976;
    float _1980 = fma(_1920, _1964, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1982 = fma(_1928, _1970, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1986 = _1487 + _1984;
    float _1988 = fma(_1914, _1978, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1990;
    bool _1994 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1996 = isnan(_1487);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2002 = _1998 || _2000;
    float _2004 = float(_2002);
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2008 = _1487 + _2006;
    bool _2010 = _1902 > 0.5;
    float _2012 = _1992 * _1956;
    float _2014 = _1902;
    if (!_1566)
    {
        _1946 = _1902;
    }
    float _2016 = _1946;
    float _2018 = -_2004;
    float _2020 = _2018 + 1.0;
    float _2022 = _2016;
    if (_1566)
    {
        _2022 = _1708;
    }
    float _2024 = _2022;
    float _2026 = -_127;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1872);
    if (_1566)
    {
        _2014 = _1708;
    }
    float _2030 = _2014;
    float _2032 = fma(_1972, _1986, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _2034 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2036 = isnan(_1487);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2042 = _2038 || _2040;
    float _2044 = float(_2042);
    float _2046 = fma(_1974, _2008, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _2048 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2050 = isnan(_1487);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1880);
    bool _2062 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2064 = isnan(_1487);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = _2044 * _2020;
    float _2076 = -_2044;
    float _2078 = _2076 + 1.0;
    bool _2080 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2082 = isnan(_1487);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2058;
    float _2094 = _2092 + 1.0;
    bool _2096 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2098 = isnan(_1487);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2104 = _2100 || _2102;
    float _2106 = float(_2104);
    float _2108 = _2058 * _2078;
    float _2110 = _1894 + _1495;
    float _2112 = _2090 * _2094;
    float _2114 = -_2090;
    float _2116 = _2114 + 1.0;
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    float _2122 = _1886 + _1501;
    float _2124 = _2072 * _2116;
    float _2126 = -_2072;
    float _2128 = _2126 + 1.0;
    float _2130 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2028);
    bool _2132 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2134 = isnan(_1487);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2146 = _2106 * _2128;
    float _2148 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1509);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2152 = _1487 + _2150;
    bool _2154 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2156 = isnan(_1487);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2162 = _2158 || _2160;
    float _2164 = float(_2162);
    float _2166 = _1960 + (-0.5);
    float _2168 = -_2142;
    float _2170 = _2168 + 1.0;
    float _2172 = fma(_2012, _2152, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2174 = !_1606;
    int _2176 = _2174 ? _1838 : (-1);
    float _2178 = -_2166;
    float _2180 = -_2060;
    float _2182 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2180);
    float _2184 = _2142 * _2120;
    float _2186 = float(uint(_1706));
    float _2188 = _2164 * _2170;
    int _2190 = _2176 >> 31;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2196 = as_type<float>(_1535) * _2186;
    int _2198 = _2190 & 3;
    float _2200 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2192);
    float _2202 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2204 = _1966 * _2188;
    int _2206 = _2176 + _2198;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2210 = trunc(_2196);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = -_2144;
    float _2218 = fma(_2202, 2.0, _2216);
    int _2220 = _2206 >> 2;
    float _2222 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2224 = -_2164;
    float _2226 = _2224 + 1.0;
    float _2228 = -_235;
    int _2230 = _2010 ? as_type<int>(_2228) : as_type<int>(_235);
    float _2232 = _1878 + _1503;
    int _2234 = _2220 << 4;
    int _2236 = _2234 + 368;
    float _2238 = fma(_2222, -2.0, _2208);
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2204);
    bool _2242 = !_1786;
    float _2244 = _2242 ? _235 : as_type<float>(_2230);
    float _2246 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2200);
    int _2248 = ~_1499;
    int _2250 = _2248 + 1;
    uint _2252 = uint(int(uint(_2236) >> uint(2)));
    uint _2254 = uint(int(uint(int(_2252)) >> uint(2)));
    int _2256 = int(_2252) & 3;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[int(_2254)][_2256];
    int _2260 = int(_2252) + 1;
    uint _2262 = uint(int(uint(_2260) >> uint(2)));
    int _2264 = _2260 & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    float _2268 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2148);
    float _2270 = _2244 + 0.5;
    float _2272 = -_127;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2218);
    float _2276 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2278 = _2250 * int(_2214);
    int _2280 = _2278 + _1706;
    float _2282 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1950);
    float _2284 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2238);
    float _2286 = fma(_1988, _2184, _2240);
    float _2288 = fma(_2276, _2270, _2274);
    int _2290 = _2176 & 3;
    bool _2292 = _2290 != 0;
    int _2294 = _2236 + 8;
    uint _2296 = uint(int(uint(_2294) >> uint(2)));
    uint _2298 = uint(int(uint(int(_2296)) >> uint(2)));
    int _2300 = int(_2296) & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    int _2304 = int(_2296) + 1;
    uint _2306 = uint(int(uint(_2304) >> uint(2)));
    int _2308 = _2304 & 3;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[int(_2306)][_2308];
    float _2312 = float(uint(_2280));
    float _2314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2316 = uint(_2290) > 1u;
    float _2318 = fma(_1980, _2146, _2286);
    int _2320 = _2176 & 3;
    bool _2322 = _2320 != 0;
    float _2324 = as_type<float>(_1535) * _2312;
    float _2326 = -_239;
    int _2328 = _1834 ? as_type<int>(_2326) : as_type<int>(_239);
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2332 = _2122 + _2330;
    int _2334 = _2322 ? 0 : 1;
    float _2336 = trunc(_2324);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    bool _2342 = !_1794;
    float _2344 = _2342 ? _239 : as_type<float>(_2328);
    float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2348 = _2232 + _2346;
    bool _2350 = uint(_2290) >= 2u;
    float _2352 = _2332 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2354 = fma(_1982, _2124, _2318);
    float _2356 = _2344 + (-0.5);
    int _2358 = _2350 ? 0 : 1;
    float _2360 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2362 = ~_2334;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2352);
    int _2370 = _2366;
    float _2372 = _2110;
    if (!_2316)
    {
        int _2374 = ~_2334;
        int _2376 = _2374 + 1;
        _2370 = _2376;
    }
    int _2378 = _2370;
    float _2380 = -_2360;
    float _2382 = -_2284;
    float _2384 = fma(_2380, _2356, _2382);
    bool _2386 = _2290 != 3;
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2390 = _2110 + _2388;
    int _2392 = abs(_2378);
    float _2394 = fma(_2032, _2112, _2354);
    int _2396 = int(_2214) + int(_2340);
    float _2398 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2368);
    float _2400 = fma(_2046, _2108, _2394);
    bool _2402 = !_2292;
    int _2404 = _2402 ? 0 : 1;
    float _2406 = fma(_1960, _1764, _2182);
    int _2408 = ~_2358;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    int _2414 = _1527 * _2396;
    int _2416 = _2414 + _1706;
    bool _2418 = _2290 != 3;
    float _2420 = fma(_2172, _2074, _2400);
    int _2422 = _2412;
    if (_2386)
    {
        int _2424 = ~_2358;
        int _2426 = _2424 + 1;
        _2422 = _2426;
    }
    int _2428 = _2422;
    int _2430 = ~_2392;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2420);
    int _2438 = abs(_2404);
    bool _2440 = !_2418;
    int _2442 = _2440 ? 0 : (-1);
    int _2444 = _2434 * as_type<int>(_2266);
    int _2446 = abs(_2428);
    out.m_78.x = _2436;
    bool _2448 = uint(_2416) >= uint(_1499);
    bool _2450 = !_1738;
    int _2452 = _2450 ? 0 : 1;
    int _2454 = abs(_2442);
    int _2456 = ~_2438;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    bool _2462 = _2398 >= 0.0;
    int _2464 = _2460 * as_type<int>(_2258);
    int _2466 = _2464 + _2444;
    bool _2468 = !_2448;
    int _2470 = _2468 ? 0 : (-1);
    int _2472 = abs(_2452);
    int _2474 = ~_2446;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    int _2480 = ~_2396;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    int _2486 = _2478 * as_type<int>(_2302);
    int _2488 = _2486 + _2466;
    int _2490 = ~_2454;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _1499 * _2484;
    int _2498 = _2496 + _1706;
    int _2500 = ~_2472;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    float _2506 = -_2282;
    float _2508 = _2506 + 1.0;
    float _2510 = -_2246;
    float _2512 = _2510 + 1.0;
    int _2514 = _2494 * as_type<int>(_2310);
    int _2516 = _2514 + _2488;
    float _2518 = _2332 * _2332;
    bool _2520 = !_1606;
    int _2522 = _2520 ? _2498 : (-1);
    float _2524 = -_2508;
    float _2526 = fma(_1790, _2524, _2130);
    int _2528 = _2516 * _2504;
    float _2530 = fma(_2348, _2348, _2518);
    float _2532 = -_2268;
    float _2534 = _2532 + 1.0;
    float _2536 = -_2512;
    float _2538 = fma(_2244, _2536, _2288);
    int _2540 = _2522 * _2472;
    int _2542 = _2540 + _2528;
    float _2544 = fma(_2390, _2390, _2530);
    float _2546 = as_type<float>(_2472);
    if (_2462)
    {
        _2546 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2548 = _2546;
    float _2550 = fma(_2344, _2534, _2384);
    float _2552 = rsqrt(_2544);
    float _2554 = float(_2542);
    int _2556 = as_type<int>(_2548);
    if (_2462)
    {
        float _2558 = _2548 * 5.0;
        _2556 = as_type<int>(_2558);
    }
    int _2560 = _2556;
    out.m_80.x = _2526;
    out.m_80.y = _2406;
    out.m_80.z = _2538;
    out.m_80.w = _2550;
    float _2562 = as_type<float>(_2560);
    if (_2462)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7797 = as_type<float>(_2560);
        out.gl_Position.z = _7797;
    }
    out.m_82.x = _2554;
    if (_2462)
    {
        out.m_53.x = 0.0;
    }
    float _2564 = _2332 * _2552;
    float _2566 = _2348 * _2552;
    if (_2462)
    {
        return out;
    }
    float _2568 = -_2564;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2122);
    float _2572 = _2390 * _2552;
    float _2574 = -_2566;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2578 = -_2564;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2332);
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2584 = _2570 + _2582;
    float _2586 = -_2572;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2110);
    float _2590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2592 = _2576 + _2590;
    float _2594 = -_2566;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2348);
    float _2598 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2588 + _2600;
    float _2604 = _2580 * _2580;
    float _2606 = -_2572;
    float _2608 = fma(_2606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2390);
    float _2610 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2598);
    float _2612 = fma(_2596, _2596, _2604);
    float _2614 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2610);
    float _2616 = fma(_2608, _2608, _2612);
    bool _2618 = _2614 >= 0.0;
    float _2620 = sqrt(_2616);
    float _2622 = _2584;
    if (_2618)
    {
        _2562 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2624 = _2562;
    int _2626 = as_type<int>(_2624);
    if (_2618)
    {
        out.m_53.x = 0.0;
    }
    float _2628 = _2552 * _2620;
    if (_2618)
    {
        float _2630 = _2624 * 5.0;
        _2626 = as_type<int>(_2630);
    }
    int _2632 = _2626;
    if (_2618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7937 = as_type<float>(_2632);
        out.gl_Position.z = _7937;
    }
    if (_2618)
    {
        return out;
    }
    float _2634 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2636 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _239);
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _235);
    float _2642 = _2628 * _2634;
    float _2644 = _2628 * _2636;
    float _2646 = _2638 * _2642;
    float _2648 = _2640 * _2644;
    float _2650 = _2628 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2652 = _2650 * 0.5;
    float _2654 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2656 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2658 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2660 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2654);
    float _2662 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2656);
    float _2664 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2658);
    float _2666 = _2570 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2668 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2660);
    float _2670 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2662);
    float _2672 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    float _2674 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2678 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2680 = _2110 + _2674;
    float _2682 = _2232 + _2676;
    float _2684 = _2122 + _2678;
    float _2686 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2666);
    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2694 = _2682 + _2692;
    float _2696 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2686);
    float _2698 = _2690 * _2690;
    float _2700 = fma(_2694, _2694, _2698);
    float _2702 = sqrt(_2700);
    bool _2704 = _2702 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2706 = _2666;
    float _2708 = _2652;
    float _2710 = _2698;
    if (!_2704)
    {
        _2706 = _2682;
    }
    float _2712 = _2706;
    float _2714 = _2712;
    if (!_2704)
    {
        _2708 = _2680;
    }
    float _2716 = _2708;
    float _2718 = _2716;
    if (!_2704)
    {
        _2710 = _2684;
    }
    float _2720 = _2710;
    bool _2722 = !_2704;
    float _2724 = _2720;
    if (!_2722)
    {
        float _2726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2730 = _2702 + _2728;
        float _2732 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2734 = _2730 * _2726;
        float _2736 = rsqrt(_2700);
        float _2738 = _2734 * 0.15915493667125701904296875;
        float _2740 = _2738 * 6.283185482025146484375;
        float _2742 = cos(_2740);
        float _2744 = _2738 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2742 + (-1.0);
        float _2750 = fma(_2746, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2752 = _2748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2754 = _2736 * _2750;
        float _2756 = fma(_2684, _2742, _2752);
        float _2758 = fma(_2694, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2760 = fma(_2690, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2724 = _2756;
        _2714 = _2758;
        _2718 = _2760;
    }
    float _2762 = _2724;
    float _2764 = _2714;
    float _2766 = _2718;
    float _2768 = -_2122;
    float _2770 = _2768 + _2762;
    float _2772 = -_2232;
    float _2774 = _2772 + _2764;
    float _2776 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2778 = _2570 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2780 = _2770 * _2770;
    float _2782 = -_2110;
    float _2784 = _2782 + _2766;
    float _2786 = 1.0 / _2776;
    float _2788 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2778);
    float _2790 = fma(_2774, _2774, _2780);
    float _2792 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2788);
    float _2794 = fma(_2784, _2784, _2790);
    bool _2796 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2798 = isnan(0.5);
    bool _2800 = _2796 || _2798;
    bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2804 = _2800 || _2802;
    float _2806 = _2792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2808 = sqrt(_2794);
    bool _2810 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2812 = isnan(0.5);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2818 = _2814 || _2816;
    float _2820 = _2806 + _2776;
    float _2822 = _2820 * _2786;
    float _2824 = _2822 * 0.5;
    float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2828 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2826);
    float _2830 = 1.0 / _2828;
    bool _2832 = _2808 > 0.0;
    float _2834 = _2776;
    float _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2838 = _2762;
    if (!_2832)
    {
        _2834 = _2764;
    }
    float _2840 = _2834;
    float _2842 = _2840;
    float _2844 = _2840;
    if (!_2832)
    {
        _2836 = _2766;
    }
    float _2846 = _2836;
    bool _2848 = !_2832;
    float _2850 = _2846;
    if (!_2848)
    {
        float _2852 = _229 * _229;
        float _2854 = rsqrt(_2794);
        float _2856 = fma(_225, _225, _2852);
        float _2858 = fma(_231, _231, _2856);
        float _2860 = sqrt(_2858);
        float _2862 = _2774 * _2854;
        float _2864 = _2770 * _2854;
        float _2866 = _2784 * _2854;
        bool _2868 = _2860 > 0.0;
        float _2870 = _2860;
        if (!_2868)
        {
            _2842 = _2764;
        }
        float _2872 = _2842;
        _2844 = _2872;
        if (!_2868)
        {
            _2870 = _2766;
        }
        float _2874 = _2870;
        bool _2876 = !_2868;
        _2850 = _2874;
        if (!_2876)
        {
            float _2878 = rsqrt(_2858);
            float _2880 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2882 = _229 * _2878;
            float _2884 = _225 * _2878;
            float _2886 = _231 * _2878;
            float _2888 = _2864 * _2882;
            float _2890 = fma(_2862, _2884, _2888);
            float _2892 = _2880 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2894 = fma(_2866, _2886, _2890);
            float _2896 = _2894 * _2892;
            float _2898 = fma(_225, _2896, _2764);
            float _2900 = fma(_229, _2896, _2762);
            float _2902 = fma(_231, _2896, _2766);
            _2838 = _2900;
            _2844 = _2898;
            _2850 = _2902;
        }
    }
    float _2904 = _2838;
    float _2906 = _2844;
    float _2908 = _2850;
    float _2910 = -_2564;
    float _2912 = fma(_2910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _2914 = -_2566;
    float _2916 = fma(_2914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2918 = -_2572;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    float _2922 = _2912;
    float _2924 = _2916;
    float _2926 = _2920;
    if (_2818)
    {
        _243 = 1.0;
    }
    float _2928 = _243;
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2932 = _2830 * _2930;
    float _2934 = _2928;
    if (!_2804)
    {
        float _2936 = _2584 * _2584;
        float _2938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2940 = -_2110;
        float _2942 = _2940 + _2908;
        float _2944 = -_2122;
        float _2946 = _2944 + _2904;
        float _2948 = fma(_2592, _2592, _2936);
        float _2950 = -_2232;
        float _2952 = _2950 + _2906;
        float _2954 = fma(_2602, _2602, _2948);
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2958 = sqrt(_2954);
        float _2960 = 1.0 / _2628;
        float _2962 = precise::min(_2958, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2964 = _2962 * _2938;
        float _2966 = _2956 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2968 = _2964 * _2960;
        float _2970 = _2966 * _2968;
        float _2972 = _2942 * _2968;
        float _2974 = fma(_2946, _2970, _2570);
        float _2976 = fma(_2952, _2970, _2576);
        float _2978 = fma(_2966, _2972, _2588);
        _2922 = _2974;
        _2924 = _2976;
        _2926 = _2978;
        _2622 = _2936;
        _2372 = _2972;
    }
    float _2980 = _2922;
    float _2982 = _2924;
    float _2984 = _2926;
    float _2986 = _2622;
    float _2988 = _2372;
    float _2990 = _2988;
    float _2992 = _2986;
    if (!_2818)
    {
        float _2994 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2996 = _2994 * 0.15915493667125701904296875;
        float _2998 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3000 = _2996 * 6.283185482025146484375;
        float _3002 = cos(_3000);
        float _3004 = _2998 * 0.15915493667125701904296875;
        float _3006 = _2996 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        float _3010 = 1.0 / _3002;
        float _3012 = _3004 * 6.283185482025146484375;
        float _3014 = cos(_3012);
        float _3016 = _3008 * _3010;
        float _3018 = _3004 * 6.283185482025146484375;
        float _3020 = sin(_3018);
        float _3022 = _3014 * _3016;
        float _3024 = 1.0 / _3022;
        float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3028 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3026;
        float _3030 = 1.0 / _3028;
        float _3032 = _3020 * _3024;
        float _3034 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3036 = fma(_2932, _3032, _3034);
        float _3038 = _3036 * _3030;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        _2990 = _3030;
        _2934 = _3040;
    }
    float _3042 = _2990;
    float _3044 = _2934;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3048 = _2980 + _3046;
    float _3050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3052 = _2982 + _3050;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3056 = _2984 + _3054;
    float _3058 = _3048 * _3048;
    float _3060 = fma(_3052, _3052, _3058);
    float _3062 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3064 = fma(_3056, _3056, _3060);
    float _3066 = rsqrt(_3064);
    float _3068 = sqrt(_3064);
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3072 = _3052 * _3070;
    float _3074 = _3056 * _3070;
    float _3076 = _3072 * _3072;
    float _3078 = _3074 * _3074;
    float _3080 = _3076 + _3078;
    float _3082 = sqrt(_3080);
    bool _3084 = _3082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3088 = _3082 + _3086;
    float _3090 = _3066;
    float _3092 = _3088;
    float _3094 = _3048;
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _3098 = _3080;
    if (_3084)
    {
        float _3100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3090 = _3100;
    }
    float _3102 = _3090;
    float _3104 = _3102;
    if (_3084)
    {
        float _3106 = _3088 * _3102;
        _3092 = _3106;
    }
    float _3108 = _3092;
    if (_3084)
    {
        float _3110 = rsqrt(_3080);
        _3104 = _3110;
    }
    float _3112 = _3104;
    float _3114 = _3112;
    if (_3084)
    {
        float _3116 = _3108 * 0.15915493667125701904296875;
        _2992 = _3116;
    }
    float _3118 = _2992;
    float _3120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3122 = _3056;
    if (_3084)
    {
        float _3124 = _3118 * 6.283185482025146484375;
        float _3126 = sin(_3124);
        _3122 = _3126;
    }
    float _3128 = _3122;
    float _3130 = precise::max(0.0, _3120);
    float _3132 = _3042;
    float _3134 = _3130;
    if (_3084)
    {
        float _3136 = _3118 * 6.283185482025146484375;
        float _3138 = cos(_3136);
        _3132 = _3138;
    }
    float _3140 = _3132;
    float _3142 = -_3070;
    float _3144 = -_3130;
    float _3146 = fma(_3048, _3142, _3144);
    if (_3084)
    {
        float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3148;
    }
    float _3150 = _3094;
    float _3152 = _3128;
    float _3154 = _3150;
    if (_3084)
    {
        float _3156 = fma(_3128, _3150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3156;
    }
    float _3158 = _3152;
    float _3160 = _3158;
    if (!_3084)
    {
        _3154 = _3076;
    }
    float _3162 = _3154;
    float _3164 = _3162;
    if (_3084)
    {
        float _3166 = _3112 * _3158;
        _3096 = _3166;
    }
    float _3168 = _3096;
    if (!_3084)
    {
        _3114 = _3072;
    }
    float _3170 = _3114;
    float _3172 = _3170;
    float _3174 = _3140;
    if (_3084)
    {
        float _3176 = _3140 + (-1.0);
        _3134 = _3176;
    }
    float _3178 = _3134;
    float _3180 = _3178;
    if (_3084)
    {
        float _3182 = _3072 * _3168;
        _3172 = _3182;
    }
    float _3184 = _3172;
    if (!_3084)
    {
        _3160 = _3146;
    }
    float _3186 = _3160;
    float _3188 = fma(_2588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3190 = _3186;
    if (_3084)
    {
        float _3192 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3098 = _3192;
    }
    float _3194 = _3098;
    if (!_3084)
    {
        _3180 = _3074;
    }
    float _3196 = _3180;
    float _3198 = _3196;
    if (_3084)
    {
        float _3200 = _3074 * _3168;
        _3198 = _3200;
    }
    float _3202 = _3198;
    if (_3084)
    {
        float _3204 = _3184 * _3184;
        _3164 = _3204;
    }
    float _3206 = _3164;
    if (_3084)
    {
        float _3208 = fma(_3146, _3140, _3194);
        _3190 = _3208;
    }
    float _3210 = _3190;
    if (!_3084)
    {
        _3174 = _3078;
    }
    float _3212 = _3174;
    float _3214 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3216 = _3212;
    if (_3084)
    {
        float _3218 = _3202 * _3202;
        _3216 = _3218;
    }
    float _3220 = _3216;
    float _3222 = fma(_3210, _3210, _3206);
    float _3224 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3214);
    float _3226 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3228 = _3222 + _3220;
    float _3230 = floor(_3062);
    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3234 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3232);
    float _3236 = precise::clamp(_3234, 0.0, 1.0);
    float _3238 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3224);
    float _3240 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3226);
    float _3242 = -_3236;
    float _3244 = _3242 + 1.0;
    float _3246 = _3238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3248 = rsqrt(_3228);
    float _3250 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3252 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3254 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3240);
    float _3256 = -_3252;
    float _3258 = fma(_3256, _3250, 1.0);
    float _3260 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3262 = abs(_3244);
    float _3264 = log2(_3262);
    float _3266 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3268 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3270 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3260);
    float _3272 = -_3230;
    float _3274 = _3062 + _3272;
    float _3276 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3266);
    float _3278 = _3248 * _3184;
    float _3280 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3276);
    float _3282 = _3248 * _3210;
    float _3284 = _3248 * _3202;
    float _3286 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3288 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3270);
    float _3290 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3292 = floor(_3188);
    float _3294 = -_3286;
    float _3296 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3294);
    float _3298 = _3288 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3302 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3304 = -_3284;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3296);
    float _3308 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3310 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3300);
    float _3312 = exp2(_3302);
    float _3314 = fma(_3306, -0.5, 0.5);
    float _3316 = fma(_3306, 0.5, 0.5);
    float _3318 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3310);
    float _3320 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3308);
    float _3322 = fma(_3316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3324 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3318);
    float _3326 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3328 = log2(_3258);
    float _3330 = -_3292;
    float _3332 = _3188 + _3330;
    float _3334 = _3282 + 1.0;
    float _3336 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3326);
    float _3338 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3320);
    float _3340 = fma(_3316, _3322, -0.212114393711090087890625);
    float _3342 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3336);
    float _3344 = 1.0 / _3324;
    float _3346 = -_3282;
    float _3348 = fma(_3312, _3334, _3346);
    float _3350 = fma(_3316, _3340, 1.570728778839111328125);
    float _3352 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3342);
    float _3354 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3338);
    float _3356 = sqrt(_3314);
    float _3358 = _3328 * 0.693147182464599609375;
    float2 _9120 = float2(_3274, _3332);
    float _3360 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9120, float2(0.0), isnan(_9120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9120, float2(0.0), isnan(_9120)), level(0.0)).x;
    float _3362 = fma(_3348, 0.5, 0.5);
    float _3364 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3366 = _3352 * _3344;
    float _3368 = _3354 * _3344;
    float _3370 = fma(_3366, 0.5, 0.5);
    float _3372 = fma(_3368, -0.5, 0.5);
    float _3374 = _3356 * 0.636619746685028076171875;
    float3 _9150 = float3(_3370, _3372, _3364);
    float _3376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9150, float3(0.0), isnan(_9150)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9150, float3(0.0), isnan(_9150)), level(0.0)).x;
    float _3378 = -_3350;
    float _3380 = fma(_3374, _3378, 1.0);
    float3 _9166 = float3(_3370, _3372, _3364);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9166, float3(0.0), isnan(_9166)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9166, float3(0.0), isnan(_9166)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float2 _9182 = float2(_3380, _3362);
    float3 _3395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9182, float2(0.0), isnan(_9182)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9182, float2(0.0), isnan(_9182)), level(0.0)).xyz;
    float _3397 = _3395.x;
    float _3399 = _3395.y;
    float _3401 = _3395.z;
    float _3403 = abs(_2932);
    float _3405 = log2(_3403);
    float _3407 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = in.m_84.x;
    float _3411 = _235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3413 = _3324 * 0.5;
    float _3415 = fma(_3407, _3407, 1.0);
    out.m_86.x = _2982;
    out.m_86.y = _2980;
    out.m_86.z = _2984;
    bool _3417 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3419 = isnan(_3068);
    bool _3421 = _3417 || _3419;
    bool _3423 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3425 = _3421 || _3423;
    float _3427 = rsqrt(_3415);
    float _3429 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3431 = exp2(_3429);
    float _3433 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3435 = precise::clamp(_3433, 0.0, 1.0);
    float _3437 = fma(_3435, -2.0, 3.0);
    float _3439 = _3435 * _3435;
    float _3441 = _3439 * _3437;
    float _3443 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3445 = _3407 * _3427;
    float _3447 = -_3441;
    float _3449 = _3447 + 1.0;
    float _3451 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3443);
    float _3453 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3455 = _3445 * _3453;
    float _3457 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3459 = _3445 * _3457;
    float _3461 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3441);
    float _3463 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3465 = _3445 * _3463;
    float _3467 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3451);
    float _3469 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3455);
    float _3471 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3465);
    float _3473 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3475 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3459);
    float _3477 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3467);
    out.m_88.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_88.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_88.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3479 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3481 = fma(_3354, -0.5, _3413);
    float _3483 = exp2(_3473);
    out.m_90.x = _3469;
    out.m_90.y = _3471;
    out.m_90.z = _3475;
    float _3485 = _3477 + _3324;
    float _3487 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3479);
    out.gl_Position.x = _3352;
    out.gl_Position.y = _3354;
    out.gl_Position.z = _3477;
    out.gl_Position.w = _3324;
    float _3489 = _3485 * 0.5;
    float _3491 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3493 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3495 = _2932 <= 8000.0;
    bool _3497 = isnan(_2932);
    bool _3499 = _3495 || _3497;
    bool _3501 = isnan(8000.0);
    bool _3503 = _3499 || _3501;
    float _3505 = float(_3503);
    float _3507 = _3352 + _3324;
    float _3509 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3491);
    float _3511 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3493);
    float _3513 = _3044 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3515 = -_3483;
    float _3517 = _3515 + 1.0;
    float _3519 = _3505 * _3461;
    float _3521 = _3507 * 0.5;
    float _3523 = _3511 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3525 = _3517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3527 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3529 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_92.x = _3521;
    out.m_92.y = _3481;
    out.m_92.z = _3489;
    out.m_92.w = _3324;
    float _3531 = -_3525;
    float _3533 = _3531 + 1.0;
    float _3535 = _3471;
    float _3537 = _3511;
    float _3539 = _3509;
    if (!_3425)
    {
        _3535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3541 = _3535;
    float _3543 = _3541;
    float _3545 = _3541;
    if (!_3425)
    {
        _3537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3547 = _3537;
    float _3549 = -_3360;
    float _3551 = _3549 + 1.0;
    float _3553 = _3551 * _3529;
    float _3555 = precise::clamp(_3553, 0.0, 1.0);
    float _3557 = -_3555;
    float _3559 = fma(_3557, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3561 = _3559 * _3409;
    float _3563 = _3525 * _3376;
    float _3565 = _3561 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3567 = _3561;
    float _3569 = _3565;
    float _3571 = _3547;
    float _3573 = _3547;
    if (!_3425)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3575 = _3567;
    float _3577 = _3391 * _3563;
    out.m_94.x = _3565;
    float _3579 = _3401 * _3563;
    float _3581 = fma(_3399, _3577, _3387);
    float _3583 = fma(_3397, _3577, _3385);
    float _3585 = _3391 * _3533;
    float _3587 = fma(_3391, _3579, _3389);
    float _3589 = _3509 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3591 = _3577;
    float _3593 = _3575;
    float _3595 = _3575;
    if (!_3425)
    {
        _3591 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3597 = _3591;
    float _3599 = _3597;
    float _3601 = _3597;
    if (!_3425)
    {
        _3539 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3603 = _3539;
    out.m_96.x = _3583;
    out.m_96.y = _3581;
    out.m_96.z = _3587;
    out.m_96.w = _3585;
    float _3605 = _3603;
    float _3607 = _3603;
    if (!_3425)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3609 = _3569;
    out.m_98.x = _3589;
    out.m_98.y = _3523;
    out.m_98.z = _3527;
    bool _3611 = !_3425;
    float _3613 = _3609;
    float _3615 = _3609;
    if (!_3611)
    {
        bool _3617 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3619 = isnan(_3068);
        bool _3621 = _3617 || _3619;
        bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3625 = _3621 || _3623;
        if (!_3625)
        {
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = _3068 + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3633 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3631;
            float _3635 = 1.0 / _3633;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3657 = _3629 * _3635;
            float _3659 = precise::clamp(_3657, 0.0, 1.0);
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3665 = fma(_3659, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3667 = fma(_3659, _3663, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3669 = fma(_3659, _3643, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3671 = fma(_3659, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3673 = fma(_3659, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3675 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3545 = _3667;
            _3607 = _3673;
            _3601 = _3665;
            _3595 = _3671;
            _3573 = _3669;
            _3615 = _3675;
            _3677 = true;
        }
        else
        {
            bool _3679 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3681 = isnan(_3068);
            bool _3683 = _3679 || _3681;
            bool _3685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3687 = _3683 || _3685;
            if (!_3687)
            {
                _3599 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3689 = _3599;
            _3601 = _3689;
            if (!_3687)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3691 = _3543;
            _3545 = _3691;
            if (!_3687)
            {
                _3571 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3693 = _3571;
            _3573 = _3693;
            if (!_3687)
            {
                _3593 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3695 = _3593;
            _3595 = _3695;
            if (!_3687)
            {
                _3605 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3697 = _3605;
            _3607 = _3697;
            if (!_3687)
            {
                _3613 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3699 = _3613;
            bool _3701 = !_3687;
            _3615 = _3699;
            if (!_3701)
            {
                bool _3703 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3705 = isnan(_3068);
                bool _3707 = _3703 || _3705;
                bool _3709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3711 = _3707 || _3709;
                if (!_3711)
                {
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = _3068 + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3719 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3717;
                    float _3721 = 1.0 / _3719;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3743 = _3715 * _3721;
                    float _3745 = precise::clamp(_3743, 0.0, 1.0);
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3751 = fma(_3745, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3753 = fma(_3745, _3749, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3755 = fma(_3745, _3729, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3757 = fma(_3745, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3759 = fma(_3745, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3761 = fma(_3745, _3741, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3545 = _3753;
                    _3607 = _3759;
                    _3601 = _3751;
                    _3595 = _3757;
                    _3573 = _3755;
                    _3615 = _3761;
                    _3677 = true;
                }
                else
                {
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3607 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3601 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3595 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3573 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3615 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3677 = false;
    float _3763 = _3545;
    float _3765 = _3607;
    float _3767 = _3601;
    float _3769 = _3595;
    float _3771 = _3573;
    float _3773 = _3615;
    float _3775 = fma(_3523, -0.5, 0.5);
    float _3777 = precise::clamp(_3775, 0.0, 1.0);
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = _3513 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3785 = -_3767;
    float _3787 = _3785 + _3769;
    out.m_100.x = 0.0;
    float _3789 = fma(_3777, _3781, _3763);
    float _3791 = fma(_3777, _3787, _3767);
    out.m_53.x = _3783;
    float _3793 = -_3771;
    float _3795 = _3793 + _3773;
    float _3797 = _3789 * 0.586610972881317138671875;
    bool _3799 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3801 = fma(_3777, _3795, _3771);
    float _3803 = fma(_3791, 0.298911988735198974609375, _3797);
    bool _3805 = _3044 > 0.0;
    bool _3807 = isnan(_3044);
    bool _3809 = _3805 || _3807;
    bool _3811 = isnan(0.0);
    bool _3813 = _3809 || _3811;
    float _3815 = fma(_3801, 0.114477999508380889892578125, _3803);
    float _3817 = -_3815;
    float _3819 = _3791 + _3817;
    float _3821 = -_3815;
    float _3823 = _3789 + _3821;
    float _3825 = -_3815;
    float _3827 = _3801 + _3825;
    float _3829 = fma(_3819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    float _3831 = fma(_3823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    float _3833 = fma(_3827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    bool _3835 = !_3799;
    if (!_3835)
    {
        float _3837 = -_2980;
        float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3841 = -_2982;
        float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3845 = -_2984;
        float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3849 = _3839 * _3839;
        float _3851 = fma(_3843, _3843, _3849);
        float _3853 = fma(_3847, _3847, _3851);
        float _3855 = sqrt(_3853);
        float _3857 = rsqrt(_3853);
        float _3859 = -_3855;
        float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3863 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3865 = precise::clamp(_3863, 0.0, 1.0);
        float _3867 = _3843 * _3857;
        float _3869 = _3839 * _3857;
        float _3871 = abs(_3865);
        float _3873 = log2(_3871);
        float _3875 = _3847 * _3857;
        float _3877 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3879 = _3523 * _3869;
        float _3881 = -_3869;
        float _3883 = -_3877;
        float _3885 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3883);
        float _3887 = fma(_3589, _3867, _3879);
        float _3889 = -_3875;
        float _3891 = fma(_3889, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3885);
        float _3893 = fma(_3527, _3875, _3887);
        float _3895 = precise::clamp(_3893, 0.0, 1.0);
        float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3899 = _3891 + _3897;
        float _3901 = _3873 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3903 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3905 = precise::clamp(_3903, 0.0, 1.0);
        float _3907 = exp2(_3901);
        float _3909 = _3907 * _3905;
        float _3911 = _3895 * _3909;
        float _3913 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3915 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3917 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3913;
        out.m_100.y = _3915;
        out.m_100.z = _3917;
    }
    out.m_102.x = _3829;
    out.m_102.y = _3831;
    out.m_102.z = _3833;
    if (_3813)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3919 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3919;
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
    out.dm_pad7 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3677 = false;
    bool _1119 = false;
    bool _985 = false;
    bool _825 = false;
    bool _615 = false;
    bool _447 = false;
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
    float _135 = as_type<float>(_123);
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_131)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3987 = as_type<float>(_143);
        out.gl_Position.z = _3987;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.dm_pad7.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.dm_pad7.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.dm_pad7.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.dm_pad7.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_155;
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
    if (_165)
    {
        float _171 = _169 * 5.0;
        _145 = as_type<int>(_171);
    }
    int _173 = _145;
    float _175 = _127 * _167;
    out.m_57.x = _157;
    float _177 = _175;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4052 = as_type<float>(_173);
        out.gl_Position.z = _4052;
    }
    out.m_51.x = _175;
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.dm_pad7.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.dm_pad7.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.dm_pad7.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.dm_pad7.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = _183 * _189;
    float _217 = _183 * _195;
    float _219 = fma(_181, _187, _215);
    float _221 = _183 * _201;
    float _223 = fma(_181, _193, _217);
    float _225 = fma(_185, _191, _219);
    float _227 = fma(_181, _199, _221);
    float _229 = fma(_185, _197, _223);
    float _231 = fma(_185, _203, _227);
    bool _233 = !_207;
    float _235 = _233 ? (-0.5) : 0.5;
    bool _237 = !_211;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_213;
    float _243 = _229;
    float _259;
    if (!_241)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _259 = _175;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = 1.0 / _279;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = 1.0 / _287;
    bool _295 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_263);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _283;
    float _309 = _267 * _289;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_305;
    float _325 = _323 + 1.0;
    float _327 = _271 * _293;
    bool _329 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _331 = isnan(_263);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_263);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _339 * _325;
    float _355 = -_339;
    float _357 = _355 + 1.0;
    float _359 = _275 * _307;
    float _361 = -_321;
    float _363 = _361 + 1.0;
    float _365 = _351 * _357;
    float _367 = -_351;
    float _369 = _367 + 1.0;
    float _371 = _305 * _363;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_375, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_383, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = fma(_387, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _389 * _365;
    float _399 = _391 * _365;
    float _401 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _413 = fma(_393, _353, _401);
    float _415 = fma(_405, _327, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _327, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_395, _353, _411);
    float _421 = fma(_415, _371, _413);
    float _423 = fma(_417, _371, _419);
    float _425 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].x, _421);
    float _427 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].y, _423);
    bool _429 = !_291;
    float _445;
    if (!_429)
    {
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _433 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        _445 = _175;
    }
    _447 = false;
    float _449 = _445;
    float _451 = in.m_70.x;
    float _453 = in.m_70.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _449 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _471 = 1.0 / _465;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _475 = 1.0 / _469;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = _427 * _453;
    bool _483 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _485 = isnan(_449);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _457 * _471;
    bool _497 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_449);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _509;
    bool _513 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _515 = isnan(_449);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_493;
    float _527 = _525 + 1.0;
    float _529 = fma(_479, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _531 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _425 * _451;
    float _535 = _523 * _527;
    float _537 = -_523;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _541;
    float _545 = _461 * _475;
    float _547 = _507 * _539;
    float _549 = fma(_543, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _551 = -_507;
    float _553 = _551 + 1.0;
    float _555 = _529 * _547;
    float _557 = _549 * _547;
    float _559 = _531 * _547;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].x, _557);
    float _575 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].y, _555);
    float _577 = fma(_563, _545, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _579 = fma(_567, _545, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _581 = fma(_571, _545, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _583 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[107].z, _559);
    float _585 = fma(_577, _535, _573);
    float _587 = fma(_579, _535, _575);
    float _589 = fma(_581, _535, _583);
    float _591 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].x, _585);
    float _593 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].y, _587);
    float _595 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[109].z, _589);
    bool _597 = !_473;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _601 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        _613 = _175;
    }
    _615 = false;
    float _617 = _613;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _617 + _619;
    float _623 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _637 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = isnan(_617);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _627;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_617);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _673 = 1.0 / _635;
    float _675 = _631 * _649;
    bool _677 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_617);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _653;
    float _691 = -_647;
    float _693 = _691 + 1.0;
    float _695 = fma(_675, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _701 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_617);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_687;
    float _715 = _713 + 1.0;
    float _717 = _687 * _693;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = 1.0 / _699;
    float _725 = -_711;
    float _727 = _725 + 1.0;
    float _729 = _665 * _715;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _731;
    float _735 = _721 * _673;
    float _737 = _647 * _727;
    float _739 = _695 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _617 + _741;
    float _745 = -_665;
    float _747 = _745 + 1.0;
    bool _749 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = isnan(_617);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _689;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _769 = _617 + _767;
    float _771 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _739);
    float _775 = -_759;
    float _777 = _775 + 1.0;
    float _779 = _765 * _723;
    float _781 = fma(_761, _769, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _785 = _617 + _783;
    float _787 = fma(_771, _717, _773);
    float _789 = _711 * _777;
    float _791 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = fma(_779, _785, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _795 = fma(_781, _737, _787);
    float _797 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = fma(_793, _789, _795);
    float _801 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[119].x, _799);
    float _803 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _791;
    out.m_72.y = _797;
    out.m_72.z = _803;
    out.m_72.w = _805;
    bool _807 = !_671;
    float _823;
    if (!_807)
    {
        float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _811 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _815 = _813 * _809;
        float _817 = floor(_815);
        float _819 = -_817;
        float _821 = _815 + _819;
        _823 = _821;
        _825 = true;
    }
    else
    {
        _823 = _175;
    }
    _825 = false;
    float _827 = _823;
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
    float _881 = 1.0 / _863;
    float _883 = -_879;
    float _885 = _883 + 1.0;
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = _859 * _885;
    float _891 = -_859;
    float _893 = _891 + 1.0;
    float _895 = 1.0 / _867;
    float _897 = _831 * _881;
    float _899 = -_843;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _903;
    float _907 = _879 * _901;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _913;
    float _917 = fma(_905, _897, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _919 = _847 * _895;
    float _921 = fma(_911, _897, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _923 = fma(_915, _897, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _925 = _917 * _889;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _931 = _921 * _889;
    float _933 = _923 * _889;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _943 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].x, _931);
    float _945 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].y, _925);
    float _947 = fma(_937, _919, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _949 = fma(_929, _919, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _951 = fma(_941, _919, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _953 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[123].z, _933);
    float _955 = fma(_947, _907, _943);
    float _957 = fma(_949, _907, _945);
    float _959 = fma(_951, _907, _953);
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].x, _955);
    float _963 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].y, _957);
    float _965 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[125].z, _959);
    bool _967 = !_887;
    float _983;
    if (!_967)
    {
        float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _971 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _975 = _973 * _969;
        float _977 = floor(_975);
        float _979 = -_977;
        float _981 = _975 + _979;
        _983 = _981;
        _985 = true;
    }
    else
    {
        _983 = _175;
    }
    _985 = false;
    float _987 = _983;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _993 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _995 = isnan(_987);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1009 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1011 = isnan(_987);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _991;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1023;
    float _1027 = -_1003;
    float _1029 = _1027 + 1.0;
    bool _1031 = _987 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1033 = isnan(_987);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    bool _1043 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1045 = 1.0 / _1007;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1051 = _1025 * _1021;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1055 = _987 + _1053;
    float _1057 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1059 = fma(_1051, _1055, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1061 = _1019 * _1029;
    float _1063 = -_1019;
    float _1065 = _1063 + 1.0;
    float _1067 = _1049 * _1045;
    float _1069 = -_1041;
    float _1071 = _1069 + 1.0;
    float _1073 = _1059 * _1061;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1077 = _987 + _1075;
    float _1079 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1003 * _1071;
    float _1083 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1073);
    float _1085 = fma(_1067, _1077, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1087 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1089 = fma(_1085, _1081, _1083);
    float _1091 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1093 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1089);
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _1079;
    out.m_74.y = _1097;
    out.m_74.z = _1093;
    out.m_74.w = _1099;
    bool _1101 = !_1043;
    float _1117;
    if (!_1101)
    {
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1105 = _157 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _1109 = _1107 * _1103;
        float _1111 = floor(_1109);
        float _1113 = -_1111;
        float _1115 = _1109 + _1113;
        _1117 = _1115;
        _1119 = true;
    }
    else
    {
        _1117 = _175;
    }
    _1119 = false;
    float _1121 = _1117;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1125 = _1121 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1143 = 1.0 / _1129;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1153 = 1.0 / _1133;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1157 = _1121 + _1155;
    bool _1159 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1161 = isnan(_1121);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    bool _1171 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1173 = isnan(_1121);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    bool _1183 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1185 = isnan(_1121);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = -_1169;
    float _1197 = _1195 + 1.0;
    float _1199 = 1.0 / _1137;
    float _1201 = _1157 * _1143;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1203;
    bool _1207 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1209 = isnan(_1121);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1221 = _1121 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1225 = _1121 + _1223;
    float _1227 = 1.0 / _1147;
    float _1229 = _1125 * _1153;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1233 = _1121 + _1231;
    float _1235 = -_1217;
    float _1237 = _1235 + 1.0;
    bool _1239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1241 = 1.0 / _1151;
    float _1243 = _1233 * _1199;
    bool _1245 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1247 = isnan(_1121);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = 1.0 / _1141;
    float _1259 = _1221 * _1227;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1263 = _1121 + _1261;
    bool _1265 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1267 = isnan(_1121);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1205;
    float _1279 = _1263 * _1241;
    bool _1281 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1283 = isnan(_1121);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = _1225 * _1257;
    float _1295 = _1255 * _1237;
    float _1297 = -_1255;
    float _1299 = _1297 + 1.0;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1303 = _1121 + _1301;
    float _1305 = _1275 * _1299;
    float _1307 = -_1275;
    float _1309 = _1307 + 1.0;
    float _1311 = _1303 * _1277;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1313;
    float _1317 = _1291 * _1309;
    float _1319 = -_1291;
    float _1321 = _1319 + 1.0;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1323;
    float _1327 = fma(_1315, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1329 = _1169 * _1321;
    float _1331 = fma(_1325, _1201, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1333 = _1121 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1335 = isnan(_1121);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1341 = _1337 || _1339;
    float _1343 = float(_1341);
    float _1345 = -_1181;
    float _1347 = _1345 + 1.0;
    float _1349 = _1181 * _1197;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1359 = _1343 * _1347;
    float _1361 = -_1343;
    float _1363 = _1361 + 1.0;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1369;
    float _1373 = _1193 * _1363;
    float _1375 = -_1193;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1353, _1229, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1381 = fma(_1357, _1229, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1383 = _1331 * _1373;
    float _1385 = _1327 * _1373;
    float _1387 = fma(_1367, _1243, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1389 = fma(_1371, _1243, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1399 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1383);
    float _1401 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1385);
    float _1403 = fma(_1393, _1293, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1405 = fma(_1397, _1293, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1407;
    float _1411 = fma(_1379, _1359, _1399);
    float _1413 = fma(_1381, _1359, _1401);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1415;
    float _1419 = fma(_1409, _1259, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1421 = fma(_1387, _1349, _1411);
    float _1423 = fma(_1389, _1349, _1413);
    float _1425 = fma(_1417, _1259, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1435 = fma(_1403, _1329, _1421);
    float _1437 = fma(_1405, _1329, _1423);
    float _1439 = fma(_1429, _1279, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1441;
    float _1445 = fma(_1433, _1279, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1447;
    float _1451 = fma(_1419, _1317, _1435);
    float _1453 = fma(_1425, _1317, _1437);
    float _1455 = fma(_1443, _1311, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1457 = fma(_1449, _1311, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1459 = fma(_1439, _1305, _1451);
    float _1461 = fma(_1445, _1305, _1453);
    float _1463 = fma(_1455, _1295, _1459);
    float _1465 = fma(_1457, _1295, _1461);
    float _1467 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1463);
    float _1469 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1465);
    out.m_76.x = _1467;
    out.m_76.z = _1469;
    bool _1471 = !_1239;
    if (!_1471)
    {
        float _1473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1475 = _157 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[14].y, _127);
        float _1479 = _1477 * _1473;
        float _1481 = floor(_1479);
        float _1483 = -_1481;
        float _1485 = _1479 + _1483;
        _177 = _1485;
    }
    float _1487 = _177;
    float _1489 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1491 = int(_1489);
    float _1493 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1495 = in.m_68.w;
    float _1497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1499 = int(_1497);
    float _1501 = in.m_66.w;
    float _1503 = in.m_64.w;
    float _1505 = float(_1491);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1511 = 1.0 / _1505;
    float _1513 = float(uint(_1499));
    int _1515 = ~_1499;
    int _1517 = _1515 + 1;
    int _1519 = ~_1499;
    int _1521 = _1519 + 1;
    float _1523 = 1.0 / _1513;
    int _1525 = ~_1499;
    int _1527 = _1525 + 1;
    float _1529 = _127 * _1511;
    float _1531 = trunc(_1529);
    int _1533 = int(_1531);
    int _1535 = as_type<int>(_1523) + (-2);
    float _1537 = float(uint(_1533));
    float _1539 = float(_1533);
    float _1541 = as_type<float>(_1535) * _1537;
    float _1543 = trunc(_1541);
    float _1545 = precise::max(_1543, 0.0);
    uint _1548 = uint(_1545);
    int _1550 = _1517 * int(_1548);
    int _1552 = _1550 + _1533;
    float _1554 = float(uint(_1552));
    float _1556 = as_type<float>(_1535) * _1554;
    float _1558 = trunc(_1556);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    bool _1568 = !_1566;
    float _1570 = _1568 ? 7.345489978790283203125 : 1.0;
    float _1572 = float(_1499);
    float _1574 = _1570 * _157;
    bool _1576 = _1539 >= _1572;
    bool _1578 = isnan(_1539);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(_1572);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    int _1588 = int(_1548) + int(_1562);
    float _1590 = trunc(_1586);
    int _1592 = int(_1590);
    int _1594 = _1521 * _1588;
    int _1596 = _1594 + _1533;
    float _1598 = floor(_1574);
    bool _1600 = uint(_1596) >= uint(_1499);
    bool _1602 = !_1600;
    int _1604 = _1602 ? 0 : (-1);
    bool _1606 = _1499 == 0;
    int _1608 = ~_1588;
    int _1610 = _1608 + _1604;
    int _1612 = _1610 + 1;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1628 = _1626 != 0;
    int _1630 = _1499 * _1612;
    int _1632 = _1630 + _1533;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1636 = _1634 != 0;
    float _1638 = -_1598;
    float _1640 = _1574 + _1638;
    int _1642 = _1499 + (-1);
    bool _1644 = !_1606;
    int _1646 = _1644 ? _1632 : (-1);
    float _1648 = _1640 * _1572;
    float _1650 = _127 * _1572;
    int _1652 = ~_1592;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = !_1628;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = _1650 * _167;
    float _1664 = trunc(_1648);
    int _1666 = int(_1664);
    int _1668 = _1646 * _1656;
    bool _1670 = !_1620;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1660);
    int _1676 = _1592 * _1642;
    int _1678 = _1676 + _1668;
    int _1680 = abs(_1672);
    float _1682 = trunc(_1662);
    int _1684 = int(_1682);
    bool _1686 = !_1616;
    int _1688 = _1686 ? 0 : 1;
    bool _1690 = !_1624;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = abs(_1688);
    int _1696 = abs(_1692);
    int _1698 = _1678 * _1680;
    bool _1700 = !_1636;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _1666 * _1674;
    int _1706 = _1704 + _1533;
    float _1708 = in.m_55.y;
    int _1710 = abs(_1702);
    bool _1712 = _157 > 0.5;
    int _1714 = _1684 * _1694;
    int _1716 = _1714 + _1698;
    int _1718 = ~_1499;
    int _1720 = _1718 + 1;
    float _1722 = in.m_55.w;
    int _1724 = ~_1499;
    int _1726 = _1724 + 1;
    int _1728 = _1706 * _1696;
    int _1730 = _1728 + _1716;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1734 = _1732 != 0;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1738 = _1736 != 0;
    int _1740 = _1666 * _1710;
    int _1742 = _1740 + _1730;
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1746 = _1744 != 0;
    float _1748 = float(uint(_1742));
    float _1750 = as_type<float>(_1535) * _1748;
    float _1752 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1754 = trunc(_1750);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1752);
    float _1762 = -_1760;
    float _1764 = _1762 + 1.0;
    int _1766 = _1720 * int(_1758);
    int _1768 = _1766 + _1742;
    float _1770 = float(uint(_1768));
    float _1772 = as_type<float>(_1535) * _1770;
    float _1774 = trunc(_1772);
    float _1776 = precise::max(_1774, 0.0);
    uint _1778 = uint(_1776);
    float _1780 = -_235;
    int _1782 = _1712 ? as_type<int>(_1780) : as_type<int>(_235);
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1786 = _1784 != 0;
    bool _1788 = !_1734;
    float _1790 = _1788 ? _235 : as_type<float>(_1782);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1794 = _1792 != 0;
    int _1796 = int(_1758) + int(_1778);
    float _1798 = _1790 + 0.5;
    float _1800 = in.m_46.x;
    float _1802 = in.m_46.y;
    float _1804 = in.m_46.z;
    int _1806 = _1726 * _1796;
    int _1808 = _1806 + _1742;
    bool _1810 = uint(_1808) >= uint(_1499);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1814 = _1812 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1816 = !_1810;
    int _1818 = _1816 ? 0 : (-1);
    bool _1820 = _1708 > 0.5;
    float _1822 = 1.0 / _1814;
    int _1824 = ~_1796;
    int _1826 = _1824 + _1818;
    int _1828 = _1826 + 1;
    float _1830 = -_239;
    int _1832 = _1820 ? as_type<int>(_1830) : as_type<int>(_239);
    bool _1834 = _1722 > 0.5;
    int _1836 = _1499 * _1828;
    int _1838 = _1836 + _1742;
    float _1840 = _189 * _1802;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1846 = _195 * _1802;
    float _1848 = _201 * _1802;
    float _1850 = fma(_187, _1800, _1840);
    float _1852 = 1.0 / _1844;
    float _1854 = fma(_193, _1800, _1846);
    float _1856 = fma(_199, _1800, _1848);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1868 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1870 = -_1862;
    float _1872 = fma(_1493, 2.0, _1870);
    float _1874 = 1.0 / _1860;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1878 = fma(_191, _1804, _1850);
    float _1880 = fma(_1868, -2.0, _1876);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1886 = fma(_197, _1804, _1854);
    float _1888 = 1.0 / _1866;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1890;
    float _1894 = fma(_203, _1804, _1856);
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1900 = _1892 * _1822;
    float _1902 = in.m_55.z;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1908 = 1.0 / _1884;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1910;
    float _1914 = _1906 * _1852;
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1918 = _1916 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1920 = _1912 * _1874;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1922;
    float _1926 = 1.0 / _1898;
    float _1928 = _1918 * _1888;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1938 = _1487 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1946 = _1934;
    if (!_1566)
    {
        _1944 = _1708;
    }
    float _1948 = _1944;
    float _1950 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1934);
    float _1952 = _1948;
    if (_1566)
    {
        _1952 = _157;
    }
    float _1954 = _1952;
    float _1956 = 1.0 / _1942;
    bool _1958 = !_1746;
    float _1960 = _1958 ? _239 : as_type<float>(_1832);
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1964 = _1487 + _1962;
    float _1966 = fma(_1900, _1938, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1970 = _1487 + _1968;
    float _1972 = _1924 * _1908;
    float _1974 = _1932 * _1926;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1978 = _1487 + _1976;
    float _1980 = fma(_1920, _1964, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1982 = fma(_1928, _1970, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1986 = _1487 + _1984;
    float _1988 = fma(_1914, _1978, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1990;
    bool _1994 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1996 = isnan(_1487);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2002 = _1998 || _2000;
    float _2004 = float(_2002);
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2008 = _1487 + _2006;
    bool _2010 = _1902 > 0.5;
    float _2012 = _1992 * _1956;
    float _2014 = _1902;
    if (!_1566)
    {
        _1946 = _1902;
    }
    float _2016 = _1946;
    float _2018 = -_2004;
    float _2020 = _2018 + 1.0;
    float _2022 = _2016;
    if (_1566)
    {
        _2022 = _1708;
    }
    float _2024 = _2022;
    float _2026 = -_127;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1872);
    if (_1566)
    {
        _2014 = _1708;
    }
    float _2030 = _2014;
    float _2032 = fma(_1972, _1986, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _2034 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2036 = isnan(_1487);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2042 = _2038 || _2040;
    float _2044 = float(_2042);
    float _2046 = fma(_1974, _2008, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _2048 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2050 = isnan(_1487);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1880);
    bool _2062 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2064 = isnan(_1487);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = _2044 * _2020;
    float _2076 = -_2044;
    float _2078 = _2076 + 1.0;
    bool _2080 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2082 = isnan(_1487);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2058;
    float _2094 = _2092 + 1.0;
    bool _2096 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2098 = isnan(_1487);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2104 = _2100 || _2102;
    float _2106 = float(_2104);
    float _2108 = _2058 * _2078;
    float _2110 = _1894 + _1495;
    float _2112 = _2090 * _2094;
    float _2114 = -_2090;
    float _2116 = _2114 + 1.0;
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    float _2122 = _1886 + _1501;
    float _2124 = _2072 * _2116;
    float _2126 = -_2072;
    float _2128 = _2126 + 1.0;
    float _2130 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2028);
    bool _2132 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2134 = isnan(_1487);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2146 = _2106 * _2128;
    float _2148 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1509);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2152 = _1487 + _2150;
    bool _2154 = _1487 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2156 = isnan(_1487);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2162 = _2158 || _2160;
    float _2164 = float(_2162);
    float _2166 = _1960 + (-0.5);
    float _2168 = -_2142;
    float _2170 = _2168 + 1.0;
    float _2172 = fma(_2012, _2152, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2174 = !_1606;
    int _2176 = _2174 ? _1838 : (-1);
    float _2178 = -_2166;
    float _2180 = -_2060;
    float _2182 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2180);
    float _2184 = _2142 * _2120;
    float _2186 = float(uint(_1706));
    float _2188 = _2164 * _2170;
    int _2190 = _2176 >> 31;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2196 = as_type<float>(_1535) * _2186;
    int _2198 = _2190 & 3;
    float _2200 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2192);
    float _2202 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2204 = _1966 * _2188;
    int _2206 = _2176 + _2198;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2210 = trunc(_2196);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = -_2144;
    float _2218 = fma(_2202, 2.0, _2216);
    int _2220 = _2206 >> 2;
    float _2222 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2224 = -_2164;
    float _2226 = _2224 + 1.0;
    float _2228 = -_235;
    int _2230 = _2010 ? as_type<int>(_2228) : as_type<int>(_235);
    float _2232 = _1878 + _1503;
    int _2234 = _2220 << 4;
    int _2236 = _2234 + 368;
    float _2238 = fma(_2222, -2.0, _2208);
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2204);
    bool _2242 = !_1786;
    float _2244 = _2242 ? _235 : as_type<float>(_2230);
    float _2246 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2200);
    int _2248 = ~_1499;
    int _2250 = _2248 + 1;
    uint _2252 = uint(int(uint(_2236) >> uint(2)));
    uint _2254 = uint(int(uint(int(_2252)) >> uint(2)));
    int _2256 = int(_2252) & 3;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[int(_2254)][_2256];
    int _2260 = int(_2252) + 1;
    uint _2262 = uint(int(uint(_2260) >> uint(2)));
    int _2264 = _2260 & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    float _2268 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2148);
    float _2270 = _2244 + 0.5;
    float _2272 = -_127;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2218);
    float _2276 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2278 = _2250 * int(_2214);
    int _2280 = _2278 + _1706;
    float _2282 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1950);
    float _2284 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2238);
    float _2286 = fma(_1988, _2184, _2240);
    float _2288 = fma(_2276, _2270, _2274);
    int _2290 = _2176 & 3;
    bool _2292 = _2290 != 0;
    int _2294 = _2236 + 8;
    uint _2296 = uint(int(uint(_2294) >> uint(2)));
    uint _2298 = uint(int(uint(int(_2296)) >> uint(2)));
    int _2300 = int(_2296) & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    int _2304 = int(_2296) + 1;
    uint _2306 = uint(int(uint(_2304) >> uint(2)));
    int _2308 = _2304 & 3;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[int(_2306)][_2308];
    float _2312 = float(uint(_2280));
    float _2314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2316 = uint(_2290) > 1u;
    float _2318 = fma(_1980, _2146, _2286);
    int _2320 = _2176 & 3;
    bool _2322 = _2320 != 0;
    float _2324 = as_type<float>(_1535) * _2312;
    float _2326 = -_239;
    int _2328 = _1834 ? as_type<int>(_2326) : as_type<int>(_239);
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2332 = _2122 + _2330;
    int _2334 = _2322 ? 0 : 1;
    float _2336 = trunc(_2324);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    bool _2342 = !_1794;
    float _2344 = _2342 ? _239 : as_type<float>(_2328);
    float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2348 = _2232 + _2346;
    bool _2350 = uint(_2290) >= 2u;
    float _2352 = _2332 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2354 = fma(_1982, _2124, _2318);
    float _2356 = _2344 + (-0.5);
    int _2358 = _2350 ? 0 : 1;
    float _2360 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2362 = ~_2334;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2352);
    int _2370 = _2366;
    float _2372 = _2110;
    if (!_2316)
    {
        int _2374 = ~_2334;
        int _2376 = _2374 + 1;
        _2370 = _2376;
    }
    int _2378 = _2370;
    float _2380 = -_2360;
    float _2382 = -_2284;
    float _2384 = fma(_2380, _2356, _2382);
    bool _2386 = _2290 != 3;
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2390 = _2110 + _2388;
    int _2392 = abs(_2378);
    float _2394 = fma(_2032, _2112, _2354);
    int _2396 = int(_2214) + int(_2340);
    float _2398 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2368);
    float _2400 = fma(_2046, _2108, _2394);
    bool _2402 = !_2292;
    int _2404 = _2402 ? 0 : 1;
    float _2406 = fma(_1960, _1764, _2182);
    int _2408 = ~_2358;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    int _2414 = _1527 * _2396;
    int _2416 = _2414 + _1706;
    bool _2418 = _2290 != 3;
    float _2420 = fma(_2172, _2074, _2400);
    int _2422 = _2412;
    if (_2386)
    {
        int _2424 = ~_2358;
        int _2426 = _2424 + 1;
        _2422 = _2426;
    }
    int _2428 = _2422;
    int _2430 = ~_2392;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2420);
    int _2438 = abs(_2404);
    bool _2440 = !_2418;
    int _2442 = _2440 ? 0 : (-1);
    int _2444 = _2434 * as_type<int>(_2266);
    int _2446 = abs(_2428);
    out.m_78.x = _2436;
    bool _2448 = uint(_2416) >= uint(_1499);
    bool _2450 = !_1738;
    int _2452 = _2450 ? 0 : 1;
    int _2454 = abs(_2442);
    int _2456 = ~_2438;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    bool _2462 = _2398 >= 0.0;
    int _2464 = _2460 * as_type<int>(_2258);
    int _2466 = _2464 + _2444;
    bool _2468 = !_2448;
    int _2470 = _2468 ? 0 : (-1);
    int _2472 = abs(_2452);
    int _2474 = ~_2446;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    int _2480 = ~_2396;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    int _2486 = _2478 * as_type<int>(_2302);
    int _2488 = _2486 + _2466;
    int _2490 = ~_2454;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _1499 * _2484;
    int _2498 = _2496 + _1706;
    int _2500 = ~_2472;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    float _2506 = -_2282;
    float _2508 = _2506 + 1.0;
    float _2510 = -_2246;
    float _2512 = _2510 + 1.0;
    int _2514 = _2494 * as_type<int>(_2310);
    int _2516 = _2514 + _2488;
    float _2518 = _2332 * _2332;
    bool _2520 = !_1606;
    int _2522 = _2520 ? _2498 : (-1);
    float _2524 = -_2508;
    float _2526 = fma(_1790, _2524, _2130);
    int _2528 = _2516 * _2504;
    float _2530 = fma(_2348, _2348, _2518);
    float _2532 = -_2268;
    float _2534 = _2532 + 1.0;
    float _2536 = -_2512;
    float _2538 = fma(_2244, _2536, _2288);
    int _2540 = _2522 * _2472;
    int _2542 = _2540 + _2528;
    float _2544 = fma(_2390, _2390, _2530);
    float _2546 = as_type<float>(_2472);
    if (_2462)
    {
        _2546 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2548 = _2546;
    float _2550 = fma(_2344, _2534, _2384);
    float _2552 = rsqrt(_2544);
    float _2554 = float(_2542);
    int _2556 = as_type<int>(_2548);
    if (_2462)
    {
        float _2558 = _2548 * 5.0;
        _2556 = as_type<int>(_2558);
    }
    int _2560 = _2556;
    out.m_80.x = _2526;
    out.m_80.y = _2406;
    out.m_80.z = _2538;
    out.m_80.w = _2550;
    float _2562 = as_type<float>(_2560);
    if (_2462)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7797 = as_type<float>(_2560);
        out.gl_Position.z = _7797;
    }
    out.m_82.x = _2554;
    if (_2462)
    {
        out.m_53.x = 0.0;
    }
    float _2564 = _2332 * _2552;
    float _2566 = _2348 * _2552;
    if (_2462)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.dm_pad7.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.dm_pad7.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.dm_pad7.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.dm_pad7.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2568 = -_2564;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2122);
    float _2572 = _2390 * _2552;
    float _2574 = -_2566;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2578 = -_2564;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2332);
    float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2584 = _2570 + _2582;
    float _2586 = -_2572;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2110);
    float _2590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2592 = _2576 + _2590;
    float _2594 = -_2566;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2348);
    float _2598 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2588 + _2600;
    float _2604 = _2580 * _2580;
    float _2606 = -_2572;
    float _2608 = fma(_2606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2390);
    float _2610 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2598);
    float _2612 = fma(_2596, _2596, _2604);
    float _2614 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2610);
    float _2616 = fma(_2608, _2608, _2612);
    bool _2618 = _2614 >= 0.0;
    float _2620 = sqrt(_2616);
    float _2622 = _2584;
    if (_2618)
    {
        _2562 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2624 = _2562;
    int _2626 = as_type<int>(_2624);
    if (_2618)
    {
        out.m_53.x = 0.0;
    }
    float _2628 = _2552 * _2620;
    if (_2618)
    {
        float _2630 = _2624 * 5.0;
        _2626 = as_type<int>(_2630);
    }
    int _2632 = _2626;
    if (_2618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7937 = as_type<float>(_2632);
        out.gl_Position.z = _7937;
    }
    if (_2618)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.dm_pad7.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.dm_pad7.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.dm_pad7.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.dm_pad7.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2634 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2636 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _239);
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _235);
    float _2642 = _2628 * _2634;
    float _2644 = _2628 * _2636;
    float _2646 = _2638 * _2642;
    float _2648 = _2640 * _2644;
    float _2650 = _2628 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2652 = _2650 * 0.5;
    float _2654 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2656 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2658 = _2646 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2660 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2654);
    float _2662 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2656);
    float _2664 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2658);
    float _2666 = _2570 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2668 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2660);
    float _2670 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2662);
    float _2672 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    float _2674 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2678 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2680 = _2110 + _2674;
    float _2682 = _2232 + _2676;
    float _2684 = _2122 + _2678;
    float _2686 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2666);
    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2694 = _2682 + _2692;
    float _2696 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2686);
    float _2698 = _2690 * _2690;
    float _2700 = fma(_2694, _2694, _2698);
    float _2702 = sqrt(_2700);
    bool _2704 = _2702 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2706 = _2666;
    float _2708 = _2652;
    float _2710 = _2698;
    if (!_2704)
    {
        _2706 = _2682;
    }
    float _2712 = _2706;
    float _2714 = _2712;
    if (!_2704)
    {
        _2708 = _2680;
    }
    float _2716 = _2708;
    float _2718 = _2716;
    if (!_2704)
    {
        _2710 = _2684;
    }
    float _2720 = _2710;
    bool _2722 = !_2704;
    float _2724 = _2720;
    if (!_2722)
    {
        float _2726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2730 = _2702 + _2728;
        float _2732 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2734 = _2730 * _2726;
        float _2736 = rsqrt(_2700);
        float _2738 = _2734 * 0.15915493667125701904296875;
        float _2740 = _2738 * 6.283185482025146484375;
        float _2742 = cos(_2740);
        float _2744 = _2738 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2742 + (-1.0);
        float _2750 = fma(_2746, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2752 = _2748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2754 = _2736 * _2750;
        float _2756 = fma(_2684, _2742, _2752);
        float _2758 = fma(_2694, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2760 = fma(_2690, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2724 = _2756;
        _2714 = _2758;
        _2718 = _2760;
    }
    float _2762 = _2724;
    float _2764 = _2714;
    float _2766 = _2718;
    float _2768 = -_2122;
    float _2770 = _2768 + _2762;
    float _2772 = -_2232;
    float _2774 = _2772 + _2764;
    float _2776 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2778 = _2570 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2780 = _2770 * _2770;
    float _2782 = -_2110;
    float _2784 = _2782 + _2766;
    float _2786 = 1.0 / _2776;
    float _2788 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2778);
    float _2790 = fma(_2774, _2774, _2780);
    float _2792 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2788);
    float _2794 = fma(_2784, _2784, _2790);
    bool _2796 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2798 = isnan(0.5);
    bool _2800 = _2796 || _2798;
    bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2804 = _2800 || _2802;
    float _2806 = _2792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2808 = sqrt(_2794);
    bool _2810 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2812 = isnan(0.5);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2818 = _2814 || _2816;
    float _2820 = _2806 + _2776;
    float _2822 = _2820 * _2786;
    float _2824 = _2822 * 0.5;
    float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2828 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2826);
    float _2830 = 1.0 / _2828;
    bool _2832 = _2808 > 0.0;
    float _2834 = _2776;
    float _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2838 = _2762;
    if (!_2832)
    {
        _2834 = _2764;
    }
    float _2840 = _2834;
    float _2842 = _2840;
    float _2844 = _2840;
    if (!_2832)
    {
        _2836 = _2766;
    }
    float _2846 = _2836;
    bool _2848 = !_2832;
    float _2850 = _2846;
    if (!_2848)
    {
        float _2852 = _229 * _229;
        float _2854 = rsqrt(_2794);
        float _2856 = fma(_225, _225, _2852);
        float _2858 = fma(_231, _231, _2856);
        float _2860 = sqrt(_2858);
        float _2862 = _2774 * _2854;
        float _2864 = _2770 * _2854;
        float _2866 = _2784 * _2854;
        bool _2868 = _2860 > 0.0;
        float _2870 = _2860;
        if (!_2868)
        {
            _2842 = _2764;
        }
        float _2872 = _2842;
        _2844 = _2872;
        if (!_2868)
        {
            _2870 = _2766;
        }
        float _2874 = _2870;
        bool _2876 = !_2868;
        _2850 = _2874;
        if (!_2876)
        {
            float _2878 = rsqrt(_2858);
            float _2880 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2882 = _229 * _2878;
            float _2884 = _225 * _2878;
            float _2886 = _231 * _2878;
            float _2888 = _2864 * _2882;
            float _2890 = fma(_2862, _2884, _2888);
            float _2892 = _2880 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2894 = fma(_2866, _2886, _2890);
            float _2896 = _2894 * _2892;
            float _2898 = fma(_225, _2896, _2764);
            float _2900 = fma(_229, _2896, _2762);
            float _2902 = fma(_231, _2896, _2766);
            _2838 = _2900;
            _2844 = _2898;
            _2850 = _2902;
        }
    }
    float _2904 = _2838;
    float _2906 = _2844;
    float _2908 = _2850;
    float _2910 = -_2564;
    float _2912 = fma(_2910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _2914 = -_2566;
    float _2916 = fma(_2914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2918 = -_2572;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    float _2922 = _2912;
    float _2924 = _2916;
    float _2926 = _2920;
    if (_2818)
    {
        _243 = 1.0;
    }
    float _2928 = _243;
    float _2930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2932 = _2830 * _2930;
    float _2934 = _2928;
    if (!_2804)
    {
        float _2936 = _2584 * _2584;
        float _2938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2940 = -_2110;
        float _2942 = _2940 + _2908;
        float _2944 = -_2122;
        float _2946 = _2944 + _2904;
        float _2948 = fma(_2592, _2592, _2936);
        float _2950 = -_2232;
        float _2952 = _2950 + _2906;
        float _2954 = fma(_2602, _2602, _2948);
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2958 = sqrt(_2954);
        float _2960 = 1.0 / _2628;
        float _2962 = precise::min(_2958, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2964 = _2962 * _2938;
        float _2966 = _2956 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2968 = _2964 * _2960;
        float _2970 = _2966 * _2968;
        float _2972 = _2942 * _2968;
        float _2974 = fma(_2946, _2970, _2570);
        float _2976 = fma(_2952, _2970, _2576);
        float _2978 = fma(_2966, _2972, _2588);
        _2922 = _2974;
        _2924 = _2976;
        _2926 = _2978;
        _2622 = _2936;
        _2372 = _2972;
    }
    float _2980 = _2922;
    float _2982 = _2924;
    float _2984 = _2926;
    float _2986 = _2622;
    float _2988 = _2372;
    float _2990 = _2988;
    float _2992 = _2986;
    if (!_2818)
    {
        float _2994 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2996 = _2994 * 0.15915493667125701904296875;
        float _2998 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3000 = _2996 * 6.283185482025146484375;
        float _3002 = cos(_3000);
        float _3004 = _2998 * 0.15915493667125701904296875;
        float _3006 = _2996 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        float _3010 = 1.0 / _3002;
        float _3012 = _3004 * 6.283185482025146484375;
        float _3014 = cos(_3012);
        float _3016 = _3008 * _3010;
        float _3018 = _3004 * 6.283185482025146484375;
        float _3020 = sin(_3018);
        float _3022 = _3014 * _3016;
        float _3024 = 1.0 / _3022;
        float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3028 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3026;
        float _3030 = 1.0 / _3028;
        float _3032 = _3020 * _3024;
        float _3034 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3036 = fma(_2932, _3032, _3034);
        float _3038 = _3036 * _3030;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        _2990 = _3030;
        _2934 = _3040;
    }
    float _3042 = _2990;
    float _3044 = _2934;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3048 = _2980 + _3046;
    float _3050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3052 = _2982 + _3050;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3056 = _2984 + _3054;
    float _3058 = _3048 * _3048;
    float _3060 = fma(_3052, _3052, _3058);
    float _3062 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3064 = fma(_3056, _3056, _3060);
    float _3066 = rsqrt(_3064);
    float _3068 = sqrt(_3064);
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3072 = _3052 * _3070;
    float _3074 = _3056 * _3070;
    float _3076 = _3072 * _3072;
    float _3078 = _3074 * _3074;
    float _3080 = _3076 + _3078;
    float _3082 = sqrt(_3080);
    bool _3084 = _3082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3088 = _3082 + _3086;
    float _3090 = _3066;
    float _3092 = _3088;
    float _3094 = _3048;
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _3098 = _3080;
    if (_3084)
    {
        float _3100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3090 = _3100;
    }
    float _3102 = _3090;
    float _3104 = _3102;
    if (_3084)
    {
        float _3106 = _3088 * _3102;
        _3092 = _3106;
    }
    float _3108 = _3092;
    if (_3084)
    {
        float _3110 = rsqrt(_3080);
        _3104 = _3110;
    }
    float _3112 = _3104;
    float _3114 = _3112;
    if (_3084)
    {
        float _3116 = _3108 * 0.15915493667125701904296875;
        _2992 = _3116;
    }
    float _3118 = _2992;
    float _3120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3122 = _3056;
    if (_3084)
    {
        float _3124 = _3118 * 6.283185482025146484375;
        float _3126 = sin(_3124);
        _3122 = _3126;
    }
    float _3128 = _3122;
    float _3130 = precise::max(0.0, _3120);
    float _3132 = _3042;
    float _3134 = _3130;
    if (_3084)
    {
        float _3136 = _3118 * 6.283185482025146484375;
        float _3138 = cos(_3136);
        _3132 = _3138;
    }
    float _3140 = _3132;
    float _3142 = -_3070;
    float _3144 = -_3130;
    float _3146 = fma(_3048, _3142, _3144);
    if (_3084)
    {
        float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3148;
    }
    float _3150 = _3094;
    float _3152 = _3128;
    float _3154 = _3150;
    if (_3084)
    {
        float _3156 = fma(_3128, _3150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3156;
    }
    float _3158 = _3152;
    float _3160 = _3158;
    if (!_3084)
    {
        _3154 = _3076;
    }
    float _3162 = _3154;
    float _3164 = _3162;
    if (_3084)
    {
        float _3166 = _3112 * _3158;
        _3096 = _3166;
    }
    float _3168 = _3096;
    if (!_3084)
    {
        _3114 = _3072;
    }
    float _3170 = _3114;
    float _3172 = _3170;
    float _3174 = _3140;
    if (_3084)
    {
        float _3176 = _3140 + (-1.0);
        _3134 = _3176;
    }
    float _3178 = _3134;
    float _3180 = _3178;
    if (_3084)
    {
        float _3182 = _3072 * _3168;
        _3172 = _3182;
    }
    float _3184 = _3172;
    if (!_3084)
    {
        _3160 = _3146;
    }
    float _3186 = _3160;
    float _3188 = fma(_2588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3190 = _3186;
    if (_3084)
    {
        float _3192 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3098 = _3192;
    }
    float _3194 = _3098;
    if (!_3084)
    {
        _3180 = _3074;
    }
    float _3196 = _3180;
    float _3198 = _3196;
    if (_3084)
    {
        float _3200 = _3074 * _3168;
        _3198 = _3200;
    }
    float _3202 = _3198;
    if (_3084)
    {
        float _3204 = _3184 * _3184;
        _3164 = _3204;
    }
    float _3206 = _3164;
    if (_3084)
    {
        float _3208 = fma(_3146, _3140, _3194);
        _3190 = _3208;
    }
    float _3210 = _3190;
    if (!_3084)
    {
        _3174 = _3078;
    }
    float _3212 = _3174;
    float _3214 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3216 = _3212;
    if (_3084)
    {
        float _3218 = _3202 * _3202;
        _3216 = _3218;
    }
    float _3220 = _3216;
    float _3222 = fma(_3210, _3210, _3206);
    float _3224 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3214);
    float _3226 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3228 = _3222 + _3220;
    float _3230 = floor(_3062);
    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3234 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3232);
    float _3236 = precise::clamp(_3234, 0.0, 1.0);
    float _3238 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3224);
    float _3240 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3226);
    float _3242 = -_3236;
    float _3244 = _3242 + 1.0;
    float _3246 = _3238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3248 = rsqrt(_3228);
    float _3250 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3252 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3254 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3240);
    float _3256 = -_3252;
    float _3258 = fma(_3256, _3250, 1.0);
    float _3260 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3262 = abs(_3244);
    float _3264 = log2(_3262);
    float _3266 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3268 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3270 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3260);
    float _3272 = -_3230;
    float _3274 = _3062 + _3272;
    float _3276 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3266);
    float _3278 = _3248 * _3184;
    float _3280 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3276);
    float _3282 = _3248 * _3210;
    float _3284 = _3248 * _3202;
    float _3286 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3288 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3270);
    float _3290 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3292 = floor(_3188);
    float _3294 = -_3286;
    float _3296 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3294);
    float _3298 = _3288 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3302 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3304 = -_3284;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3296);
    float _3308 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3310 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3300);
    float _3312 = exp2(_3302);
    float _3314 = fma(_3306, -0.5, 0.5);
    float _3316 = fma(_3306, 0.5, 0.5);
    float _3318 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3310);
    float _3320 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3308);
    float _3322 = fma(_3316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3324 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3318);
    float _3326 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3328 = log2(_3258);
    float _3330 = -_3292;
    float _3332 = _3188 + _3330;
    float _3334 = _3282 + 1.0;
    float _3336 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3326);
    float _3338 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3320);
    float _3340 = fma(_3316, _3322, -0.212114393711090087890625);
    float _3342 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3336);
    float _3344 = 1.0 / _3324;
    float _3346 = -_3282;
    float _3348 = fma(_3312, _3334, _3346);
    float _3350 = fma(_3316, _3340, 1.570728778839111328125);
    float _3352 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3342);
    float _3354 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3338);
    float _3356 = sqrt(_3314);
    float _3358 = _3328 * 0.693147182464599609375;
    float2 _9120 = float2(_3274, _3332);
    float _3360 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9120, float2(0.0), isnan(_9120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9120, float2(0.0), isnan(_9120)), level(0.0)).x;
    float _3362 = fma(_3348, 0.5, 0.5);
    float _3364 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3366 = _3352 * _3344;
    float _3368 = _3354 * _3344;
    float _3370 = fma(_3366, 0.5, 0.5);
    float _3372 = fma(_3368, -0.5, 0.5);
    float _3374 = _3356 * 0.636619746685028076171875;
    float3 _9150 = float3(_3370, _3372, _3364);
    float _3376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9150, float3(0.0), isnan(_9150)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9150, float3(0.0), isnan(_9150)), level(0.0)).x;
    float _3378 = -_3350;
    float _3380 = fma(_3374, _3378, 1.0);
    float3 _9166 = float3(_3370, _3372, _3364);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9166, float3(0.0), isnan(_9166)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9166, float3(0.0), isnan(_9166)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float2 _9182 = float2(_3380, _3362);
    float3 _3395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9182, float2(0.0), isnan(_9182)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9182, float2(0.0), isnan(_9182)), level(0.0)).xyz;
    float _3397 = _3395.x;
    float _3399 = _3395.y;
    float _3401 = _3395.z;
    float _3403 = abs(_2932);
    float _3405 = log2(_3403);
    float _3407 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = in.m_84.x;
    float _3411 = _235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3413 = _3324 * 0.5;
    float _3415 = fma(_3407, _3407, 1.0);
    out.m_86.x = _2982;
    out.m_86.y = _2980;
    out.m_86.z = _2984;
    bool _3417 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3419 = isnan(_3068);
    bool _3421 = _3417 || _3419;
    bool _3423 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3425 = _3421 || _3423;
    float _3427 = rsqrt(_3415);
    float _3429 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3431 = exp2(_3429);
    float _3433 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3435 = precise::clamp(_3433, 0.0, 1.0);
    float _3437 = fma(_3435, -2.0, 3.0);
    float _3439 = _3435 * _3435;
    float _3441 = _3439 * _3437;
    float _3443 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3445 = _3407 * _3427;
    float _3447 = -_3441;
    float _3449 = _3447 + 1.0;
    float _3451 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3443);
    float _3453 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3455 = _3445 * _3453;
    float _3457 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3459 = _3445 * _3457;
    float _3461 = fma(_3449, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3441);
    float _3463 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3465 = _3445 * _3463;
    float _3467 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3451);
    float _3469 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3455);
    float _3471 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3465);
    float _3473 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3475 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3459);
    float _3477 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3467);
    out.m_88.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_88.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_88.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3479 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3481 = fma(_3354, -0.5, _3413);
    float _3483 = exp2(_3473);
    out.m_90.x = _3469;
    out.m_90.y = _3471;
    out.m_90.z = _3475;
    float _3485 = _3477 + _3324;
    float _3487 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3479);
    out.gl_Position.x = _3352;
    out.gl_Position.y = _3354;
    out.gl_Position.z = _3477;
    out.gl_Position.w = _3324;
    float _3489 = _3485 * 0.5;
    float _3491 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3493 = _3407 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3495 = _2932 <= 8000.0;
    bool _3497 = isnan(_2932);
    bool _3499 = _3495 || _3497;
    bool _3501 = isnan(8000.0);
    bool _3503 = _3499 || _3501;
    float _3505 = float(_3503);
    float _3507 = _3352 + _3324;
    float _3509 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3491);
    float _3511 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3493);
    float _3513 = _3044 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3515 = -_3483;
    float _3517 = _3515 + 1.0;
    float _3519 = _3505 * _3461;
    float _3521 = _3507 * 0.5;
    float _3523 = _3511 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3525 = _3517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3527 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3529 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_92.x = _3521;
    out.m_92.y = _3481;
    out.m_92.z = _3489;
    out.m_92.w = _3324;
    float _3531 = -_3525;
    float _3533 = _3531 + 1.0;
    float _3535 = _3471;
    float _3537 = _3511;
    float _3539 = _3509;
    if (!_3425)
    {
        _3535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3541 = _3535;
    float _3543 = _3541;
    float _3545 = _3541;
    if (!_3425)
    {
        _3537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3547 = _3537;
    float _3549 = -_3360;
    float _3551 = _3549 + 1.0;
    float _3553 = _3551 * _3529;
    float _3555 = precise::clamp(_3553, 0.0, 1.0);
    float _3557 = -_3555;
    float _3559 = fma(_3557, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3561 = _3559 * _3409;
    float _3563 = _3525 * _3376;
    float _3565 = _3561 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3567 = _3561;
    float _3569 = _3565;
    float _3571 = _3547;
    float _3573 = _3547;
    if (!_3425)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3575 = _3567;
    float _3577 = _3391 * _3563;
    out.m_94.x = _3565;
    float _3579 = _3401 * _3563;
    float _3581 = fma(_3399, _3577, _3387);
    float _3583 = fma(_3397, _3577, _3385);
    float _3585 = _3391 * _3533;
    float _3587 = fma(_3391, _3579, _3389);
    float _3589 = _3509 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3591 = _3577;
    float _3593 = _3575;
    float _3595 = _3575;
    if (!_3425)
    {
        _3591 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3597 = _3591;
    float _3599 = _3597;
    float _3601 = _3597;
    if (!_3425)
    {
        _3539 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3603 = _3539;
    out.m_96.x = _3583;
    out.m_96.y = _3581;
    out.m_96.z = _3587;
    out.m_96.w = _3585;
    float _3605 = _3603;
    float _3607 = _3603;
    if (!_3425)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3609 = _3569;
    out.m_98.x = _3589;
    out.m_98.y = _3523;
    out.m_98.z = _3527;
    bool _3611 = !_3425;
    float _3613 = _3609;
    float _3615 = _3609;
    if (!_3611)
    {
        bool _3617 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3619 = isnan(_3068);
        bool _3621 = _3617 || _3619;
        bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3625 = _3621 || _3623;
        if (!_3625)
        {
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = _3068 + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3633 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3631;
            float _3635 = 1.0 / _3633;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3657 = _3629 * _3635;
            float _3659 = precise::clamp(_3657, 0.0, 1.0);
            float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3665 = fma(_3659, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3667 = fma(_3659, _3663, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3669 = fma(_3659, _3643, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3671 = fma(_3659, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3673 = fma(_3659, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3675 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3545 = _3667;
            _3607 = _3673;
            _3601 = _3665;
            _3595 = _3671;
            _3573 = _3669;
            _3615 = _3675;
            _3677 = true;
        }
        else
        {
            bool _3679 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3681 = isnan(_3068);
            bool _3683 = _3679 || _3681;
            bool _3685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3687 = _3683 || _3685;
            if (!_3687)
            {
                _3599 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3689 = _3599;
            _3601 = _3689;
            if (!_3687)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3691 = _3543;
            _3545 = _3691;
            if (!_3687)
            {
                _3571 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3693 = _3571;
            _3573 = _3693;
            if (!_3687)
            {
                _3593 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3695 = _3593;
            _3595 = _3695;
            if (!_3687)
            {
                _3605 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3697 = _3605;
            _3607 = _3697;
            if (!_3687)
            {
                _3613 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3699 = _3613;
            bool _3701 = !_3687;
            _3615 = _3699;
            if (!_3701)
            {
                bool _3703 = _3068 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3705 = isnan(_3068);
                bool _3707 = _3703 || _3705;
                bool _3709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3711 = _3707 || _3709;
                if (!_3711)
                {
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = _3068 + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3719 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3717;
                    float _3721 = 1.0 / _3719;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3741 = _3739 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3743 = _3715 * _3721;
                    float _3745 = precise::clamp(_3743, 0.0, 1.0);
                    float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3751 = fma(_3745, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3753 = fma(_3745, _3749, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3755 = fma(_3745, _3729, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3757 = fma(_3745, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3759 = fma(_3745, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3761 = fma(_3745, _3741, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3545 = _3753;
                    _3607 = _3759;
                    _3601 = _3751;
                    _3595 = _3757;
                    _3573 = _3755;
                    _3615 = _3761;
                    _3677 = true;
                }
                else
                {
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3607 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3601 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3595 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3573 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3615 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3677 = false;
    float _3763 = _3545;
    float _3765 = _3607;
    float _3767 = _3601;
    float _3769 = _3595;
    float _3771 = _3573;
    float _3773 = _3615;
    float _3775 = fma(_3523, -0.5, 0.5);
    float _3777 = precise::clamp(_3775, 0.0, 1.0);
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = _3513 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3785 = -_3767;
    float _3787 = _3785 + _3769;
    out.m_100.x = 0.0;
    float _3789 = fma(_3777, _3781, _3763);
    float _3791 = fma(_3777, _3787, _3767);
    out.m_53.x = _3783;
    float _3793 = -_3771;
    float _3795 = _3793 + _3773;
    float _3797 = _3789 * 0.586610972881317138671875;
    bool _3799 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3801 = fma(_3777, _3795, _3771);
    float _3803 = fma(_3791, 0.298911988735198974609375, _3797);
    bool _3805 = _3044 > 0.0;
    bool _3807 = isnan(_3044);
    bool _3809 = _3805 || _3807;
    bool _3811 = isnan(0.0);
    bool _3813 = _3809 || _3811;
    float _3815 = fma(_3801, 0.114477999508380889892578125, _3803);
    float _3817 = -_3815;
    float _3819 = _3791 + _3817;
    float _3821 = -_3815;
    float _3823 = _3789 + _3821;
    float _3825 = -_3815;
    float _3827 = _3801 + _3825;
    float _3829 = fma(_3819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    float _3831 = fma(_3823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    float _3833 = fma(_3827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3815);
    bool _3835 = !_3799;
    if (!_3835)
    {
        float _3837 = -_2980;
        float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3841 = -_2982;
        float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3845 = -_2984;
        float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3849 = _3839 * _3839;
        float _3851 = fma(_3843, _3843, _3849);
        float _3853 = fma(_3847, _3847, _3851);
        float _3855 = sqrt(_3853);
        float _3857 = rsqrt(_3853);
        float _3859 = -_3855;
        float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3863 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3865 = precise::clamp(_3863, 0.0, 1.0);
        float _3867 = _3843 * _3857;
        float _3869 = _3839 * _3857;
        float _3871 = abs(_3865);
        float _3873 = log2(_3871);
        float _3875 = _3847 * _3857;
        float _3877 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3879 = _3523 * _3869;
        float _3881 = -_3869;
        float _3883 = -_3877;
        float _3885 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3883);
        float _3887 = fma(_3589, _3867, _3879);
        float _3889 = -_3875;
        float _3891 = fma(_3889, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3885);
        float _3893 = fma(_3527, _3875, _3887);
        float _3895 = precise::clamp(_3893, 0.0, 1.0);
        float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3899 = _3891 + _3897;
        float _3901 = _3873 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3903 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3905 = precise::clamp(_3903, 0.0, 1.0);
        float _3907 = exp2(_3901);
        float _3909 = _3907 * _3905;
        float _3911 = _3895 * _3909;
        float _3913 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3915 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3917 = _3911 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3913;
        out.m_100.y = _3915;
        out.m_100.z = _3917;
    }
    out.m_102.x = _3829;
    out.m_102.y = _3831;
    out.m_102.z = _3833;
    if (_3813)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.dm_pad7.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.dm_pad7.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.dm_pad7.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.dm_pad7.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3919 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3919;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.dm_pad7.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.dm_pad7.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.dm_pad7.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.dm_pad7.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

