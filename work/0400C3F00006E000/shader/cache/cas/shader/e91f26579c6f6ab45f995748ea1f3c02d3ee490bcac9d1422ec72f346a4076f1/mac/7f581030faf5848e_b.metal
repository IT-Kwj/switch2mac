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
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_104 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_59 [[user(locn13)]];
    float4 m_94 [[user(locn14)]];
    float4 m_86 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 m_92 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_96 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_72 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3217 = false;
    bool _519 = false;
    bool _413 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_48.w;
    float _122 = in.m_50.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_55.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3533 = as_type<float>(_149);
        out.gl_Position.z = _3533;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_57.x;
    float _165 = float(_127);
    bool _167 = _131 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _139;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _131 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _151 = as_type<int>(_181);
    }
    int _183 = _151;
    out.m_59.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3598 = as_type<float>(_183);
        out.gl_Position.z = _3598;
    }
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    float _205 = in.m_70.x;
    float _207 = in.m_70.y;
    float _209 = in.m_70.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _189 * _195;
    float _223 = _189 * _201;
    float _225 = fma(_187, _193, _221);
    float _227 = _189 * _207;
    float _229 = fma(_187, _199, _223);
    float _231 = fma(_191, _197, _225);
    bool _233 = !_217;
    float _235 = _233 ? (-0.5) : 0.5;
    float _237 = fma(_187, _205, _227);
    float _239 = fma(_191, _203, _229);
    bool _241 = !_213;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = fma(_191, _209, _237);
    bool _247 = !_219;
    float _263;
    if (!_247)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        _263 = _177;
    }
    _265 = false;
    float _267 = _263;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _267 + _285;
    bool _289 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_267);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_283;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _329;
    float _333 = -_299;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _339 = 1.0 / _303;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _287 * _313;
    float _347 = _325 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = -_325;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_351, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _271 * _339;
    float _365 = fma(_359, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = in.m_72.x;
    float _369 = in.m_72.y;
    float _371 = fma(_331, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_343, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _371 * _347;
    float _377 = _373 * _347;
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _381 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _383 = fma(_361, _327, _379);
    float _385 = fma(_365, _327, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    float _391 = _387 * _367;
    float _393 = _389 * _369;
    bool _395 = !_337;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        _411 = _177;
    }
    _413 = false;
    float _415 = _411;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = _415 + _417;
    bool _421 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _423 = isnan(_415);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _433;
    bool _437 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _439 = isnan(_415);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -_431;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _453;
    float _457 = 1.0 / _435;
    bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _461 = _419 * _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _463;
    float _467 = _447 * _451;
    float _469 = fma(_455, _461, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _471 = -_447;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = fma(_465, _461, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _481 = _469 * _467;
    float _483 = fma(_477, _461, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _485 = _479 * _467;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _489 = _483 * _467;
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _493 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].x, _487);
    float _495 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].z, _491);
    float _499 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    bool _501 = !_459;
    float _517;
    if (!_501)
    {
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _505 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _177;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _537 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = isnan(_521);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _549;
    float _553 = 1.0 / _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = isnan(_521);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _577 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _579 = isnan(_521);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _591 = 1.0 / _535;
    float _593 = -_569;
    float _595 = _593 + 1.0;
    bool _597 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _599 = _547 * _595;
    float _601 = _551 * _553;
    bool _603 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_521);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_547;
    float _617 = _615 + 1.0;
    float _619 = 1.0 / _557;
    float _621 = fma(_601, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _623;
    float _627 = _613 * _617;
    float _629 = -_613;
    float _631 = _629 + 1.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = 1.0 / _575;
    float _639 = _587 * _631;
    float _641 = _635 * _591;
    float _643 = -_587;
    float _645 = _643 + 1.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = _521 + _647;
    float _651 = _621 * _639;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = _521 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _661 = _625 * _619;
    bool _663 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _665 = isnan(_521);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_641, _655, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _677 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[115].x, _651);
    float _679 = fma(_661, _649, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _521 + _681;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = fma(_675, _627, _677);
    float _691 = _659 * _637;
    float _693 = _569 * _687;
    float _695 = fma(_679, _599, _689);
    float _697 = fma(_691, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = fma(_697, _693, _695);
    float _703 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[119].x, _701);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _713 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _717 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _717;
    out.m_74.y = _719;
    out.m_74.z = _721;
    out.m_74.w = _715;
    out.m_76.x = _713;
    out.m_76.y = _703;
    out.m_76.z = _707;
    out.m_76.w = _723;
    bool _725 = !_597;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _179 = _739;
    }
    float _741 = _179;
    float _743 = in.m_48.x;
    float _745 = in.m_48.y;
    float _747 = in.m_48.z;
    float _749 = _163 * 2.0;
    float _751 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _753 = log2(_751);
    float _755 = in.m_57.y;
    float _757 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _761 = in.m_57.z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _765 = floor(_749);
    float _767 = in.m_68.w;
    float _769 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _771 = in.m_70.w;
    float _773 = _753 * _131;
    float _775 = _207 * _745;
    float _777 = _195 * _745;
    float _779 = _201 * _745;
    bool _781 = _765 > 0.0;
    float _783 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _785 = fma(_193, _743, _777);
    bool _787 = _765 >= 0.0;
    bool _789 = isnan(_765);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = fma(_199, _743, _779);
    float _799 = fma(_783, -2.0, _759);
    float _801 = _761 * 2.0;
    float _803 = fma(_205, _743, _775);
    float _805 = in.m_66.w;
    float _807 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _809 = _755 * 2.0;
    float _811 = exp2(_773);
    float _813 = fma(_197, _747, _785);
    float _815 = -_763;
    float _817 = fma(_807, 2.0, _815);
    float _819 = _163 + _755;
    float _821 = fma(_203, _747, _797);
    float _823 = _755 + _761;
    float _825 = _819 + (-1.0);
    float _827 = floor(_801);
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _839 = _837 != 0;
    float _841 = _821 + _767;
    int _843 = _795 ? 0 : 1;
    float _845 = fma(_209, _747, _803);
    float _847 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _849 = _823 + (-1.0);
    float _851 = floor(_809);
    float _853 = -_811;
    float _855 = _853 + 1.0;
    bool _857 = !_831;
    int _859 = _857 ? 0 : 1;
    float _861 = _845 + _771;
    bool _863 = !_835;
    int _865 = _863 ? 0 : 1;
    float _867 = _813 + _805;
    bool _869 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    bool _883 = _827 > 0.0;
    float _885 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _887 = _827 >= 0.0;
    bool _889 = isnan(_827);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _901 = _841 + _899;
    int _903 = _895 ? 0 : 1;
    float _905 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _897);
    bool _907 = _851 > 0.0;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _911 = _851 >= 0.0;
    bool _913 = isnan(_851);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    float _921 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _905);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _925 = int(_923);
    bool _927 = !_839;
    int _929 = _927 ? 0 : 1;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _867 + _931;
    int _935 = ~_903;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    float _941 = _901 * _901;
    float _943 = _877 ? _855 : 0.0;
    float _945 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _909);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _961 = _861 + _959;
    int _963 = _939;
    if (!_883)
    {
        int _965 = ~_903;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_933, _933, _941);
    bool _973 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(1.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _985 = 1.0 + _983;
    float _987 = float(_881);
    float _989 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _945);
    bool _991 = !_949;
    int _993 = _991 ? 0 : 1;
    float _995 = fma(_961, _961, _971);
    float _997 = 1.0 / _987;
    bool _999 = !_953;
    int _1001 = _999 ? 0 : 1;
    float _1003 = -_131;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[76].x, _817);
    int _1007 = abs(_993);
    float _1009 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _799);
    int _1011 = abs(_1001);
    float _1013 = float(_1007);
    float _1015 = 1.0 / _985;
    float _1017 = in.m_78.x;
    float _1019 = in.m_78.y;
    float _1021 = in.m_78.z;
    float _1023 = float(_925);
    float _1025 = float(_969);
    int _1027 = ~_843;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = _1023 * _131;
    float _1035 = sqrt(_995);
    float _1037 = _997 * _131;
    float _1039 = _1013 * _1025;
    int _1041 = _919 ? 0 : 1;
    int _1043 = _1031;
    if (!_781)
    {
        int _1045 = ~_843;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    float _1051 = _1039 * (-2.0);
    int _1053 = ~_1041;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    int _1059 = _1057;
    if (_981)
    {
        float _1061 = _943 * _1015;
        _141 = _1061;
    }
    float _1063 = _141;
    float _1065 = rsqrt(_995);
    float _1067 = float(_1049);
    float _1069 = _757 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1071 = float(_1011);
    float _1073 = fma(_847, _1051, _847);
    if (!_907)
    {
        int _1075 = ~_1041;
        int _1077 = _1075 + 1;
        _1059 = _1077;
    }
    int _1079 = _1059;
    float _1081 = _1035 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1083 = fma(_1051, _1017, _1017);
    float _1085 = _1071 * _1067;
    float _1087 = _163 + (-0.5);
    float _1089 = float(_1079);
    float _1091 = precise::min(_1069, _1081);
    float _1093 = _1085 * (-2.0);
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1083);
    bool _1097 = !_957;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = _1065 * _1091;
    float _1103 = fma(_1093, _1019, _1019);
    float _1105 = fma(_885, _1093, _885);
    int _1107 = abs(_1099);
    float _1109 = _901 * _1101;
    float _1111 = fma(_1073, _1063, _1095);
    float _1113 = _755 + (-0.5);
    float _1115 = float(_1107);
    float _1117 = _933 * _1101;
    float _1119 = -_1109;
    float _1121 = _901 + _1119;
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1103);
    float _1125 = _1111 * 0.15915493667125701904296875;
    float _1127 = -_1117;
    float _1129 = _933 + _1127;
    float _1131 = _1121 * _1121;
    float _1133 = _1115 * _1089;
    float _1135 = _163 + _761;
    float _1137 = _961 * _1101;
    float _1139 = fma(_1129, _1129, _1131);
    float _1141 = _1135 + (-1.0);
    float _1143 = _1133 * (-2.0);
    float _1145 = -_1137;
    float _1147 = _961 + _1145;
    float _1149 = _761 + (-0.5);
    float _1151 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1153 = fma(_1143, _1021, _1021);
    float _1155 = fma(_1147, _1147, _1139);
    float _1157 = fma(_1105, _1063, _1123);
    float _1159 = fma(_1151, _1143, _1151);
    float _1161 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1153);
    float _1163 = _1125 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = _1157 * 0.15915493667125701904296875;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _235);
    float _1171 = fma(_1159, _1063, _1161);
    float _1173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    float _1175 = _1171 * 0.15915493667125701904296875;
    float _1177 = sqrt(_1155);
    float _1179 = _1167 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1167 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = _1065 * _1177;
    float _1189 = _769 * _1187;
    float _1191 = _1125 * 6.283185482025146484375;
    float _1193 = sin(_1191);
    float _1195 = _1189 * _1169;
    float _1197 = _1165 * _1181;
    float _1199 = _1175 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = _1165 * _1185;
    float _1205 = _757 * _1187;
    float _1207 = _1175 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1193 * _1181;
    float _1213 = _1193 * _1185;
    float _1215 = _1165 * _1201;
    float _1217 = _1193 * _1201;
    float _1219 = _1185 * _1201;
    float _1221 = _1181 * _1201;
    float _1223 = _1205 * _1173;
    float _1225 = _1215 * _1195;
    float _1227 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1229 = _1227 * 0.5;
    float _1231 = fma(_1209, _1203, _1211);
    float _1233 = -_1213;
    float _1235 = fma(_1209, _1197, _1233);
    float _1237 = -_1195;
    float _1239 = _1209 * _1237;
    float _1241 = -_1197;
    float _1243 = fma(_1209, _1213, _1241);
    float _1245 = fma(_1231, _1223, _1225);
    float _1247 = _1217 * _1195;
    float _1249 = fma(_1219, _1223, _1239);
    float _1251 = fma(_1209, _1211, _1203);
    float _1253 = fma(_1235, _1229, _1245);
    float _1255 = fma(_1243, _1223, _1247);
    float _1257 = fma(_1221, _1229, _1249);
    float _1259 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1261 = fma(_1251, _1229, _1255);
    float _1263 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1265 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1259);
    float _1267 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1263);
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1265);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1267);
    float _1273 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1275 = -_1137;
    float _1277 = _861 + _1275;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1281 = _861 + _1273;
    float _1283 = _867 + _1279;
    float _1285 = -_1109;
    float _1287 = _841 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1291 = _1281 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1295 = _1283 + _1293;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1299 = _1291 * _1291;
    float _1301 = fma(_1295, _1295, _1299);
    float _1303 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1305 = sqrt(_1301);
    float _1307 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1303);
    float _1309 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1307);
    float _1311 = -_1117;
    float _1313 = _867 + _1311;
    float _1315 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1317 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1297);
    float _1319 = _841 + _1315;
    float _1321 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1317);
    bool _1323 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1309;
    float _1327 = _1317;
    float _1329 = _1315;
    float _1331 = _1319;
    if (!_1323)
    {
        _1325 = _1283;
    }
    float _1333 = _1325;
    float _1335 = _1333;
    if (!_1323)
    {
        _1327 = _1281;
    }
    float _1337 = _1327;
    float _1339 = _1337;
    if (!_1323)
    {
        _1329 = _1319;
    }
    float _1341 = _1329;
    bool _1343 = !_1323;
    float _1345 = _1341;
    if (!_1343)
    {
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1351 = _1305 + _1349;
        float _1353 = rsqrt(_1301);
        float _1355 = _1351 * _1347;
        float _1357 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = _1355 * 0.15915493667125701904296875;
        float _1361 = _1359 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = _1359 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1363 + (-1.0);
        float _1371 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1373 = fma(_1367, _1357, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1375 = fma(_1319, _1363, _1371);
        float _1377 = _1353 * _1373;
        float _1379 = fma(_1295, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1381 = fma(_1291, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1345 = _1375;
        _1335 = _1379;
        _1339 = _1381;
    }
    float _1383 = _1345;
    float _1385 = _1335;
    float _1387 = _1339;
    float _1389 = -_841;
    float _1391 = _1389 + _1383;
    float _1393 = -_867;
    float _1395 = _1393 + _1385;
    float _1397 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1399 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = _1391 * _1391;
    float _1403 = -_861;
    float _1405 = _1403 + _1387;
    float _1407 = 1.0 / _1397;
    float _1409 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1411 = fma(_1395, _1395, _1401);
    float _1413 = -_1109;
    float _1415 = _1413 + _1383;
    float _1417 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1419 = fma(_1405, _1405, _1411);
    float _1421 = -_1137;
    float _1423 = _1421 + _1387;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1427 = sqrt(_1419);
    bool _1429 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1431 = isnan(0.5);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1437 = _1433 || _1435;
    float _1439 = _1425 + _1397;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1449 = _1445 || _1447;
    float _1451 = _1439 * _1407;
    float _1453 = _1451 * 0.5;
    float _1455 = -_1117;
    float _1457 = _1455 + _1385;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1461 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1459);
    bool _1463 = _1427 > 0.0;
    float _1465 = 1.0 / _1461;
    float _1467 = _1427;
    float _1469 = _1453;
    float _1471 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1473 = _1391;
    float _1475 = _1395;
    if (!_1463)
    {
        _1467 = _1457;
    }
    float _1477 = _1467;
    float _1479 = _1477;
    if (!_1463)
    {
        _1469 = _1415;
    }
    float _1481 = _1469;
    float _1483 = _1481;
    if (!_1463)
    {
        _1471 = _1423;
    }
    float _1485 = _1471;
    bool _1487 = !_1463;
    float _1489 = _1485;
    float _1491 = _1485;
    if (!_1487)
    {
        float _1493 = _239 * _239;
        float _1495 = fma(_231, _231, _1493);
        float _1497 = rsqrt(_1419);
        float _1499 = fma(_245, _245, _1495);
        float _1501 = sqrt(_1499);
        float _1503 = _1395 * _1497;
        float _1505 = _1391 * _1497;
        float _1507 = _1405 * _1497;
        bool _1509 = _1501 > 0.0;
        float _1511 = _1497;
        float _1513 = _1501;
        if (!_1509)
        {
            _1511 = _1457;
        }
        float _1515 = _1511;
        _1479 = _1515;
        if (!_1509)
        {
            _1513 = _1415;
        }
        float _1517 = _1513;
        _1483 = _1517;
        if (!_1509)
        {
            _1489 = _1423;
        }
        float _1519 = _1489;
        bool _1521 = !_1509;
        _1491 = _1519;
        if (!_1521)
        {
            float _1523 = rsqrt(_1499);
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1527 = _239 * _1523;
            float _1529 = _231 * _1523;
            float _1531 = _1505 * _1527;
            float _1533 = _245 * _1523;
            float _1535 = fma(_1503, _1529, _1531);
            float _1537 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1539 = fma(_1507, _1533, _1535);
            float _1541 = _1539 * _1537;
            float _1543 = fma(_231, _1541, _1457);
            float _1545 = fma(_239, _1541, _1415);
            float _1547 = fma(_245, _1541, _1423);
            _1479 = _1543;
            _1483 = _1545;
            _1491 = _1547;
        }
    }
    float _1549 = _1479;
    float _1551 = _1483;
    float _1553 = _1491;
    float _1555 = _1551;
    float _1557 = _1549;
    float _1559 = _1553;
    if (_1449)
    {
        _1473 = 1.0;
    }
    float _1561 = _1473;
    float _1563 = _1561;
    if (!_1437)
    {
        float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1567 = _1287 + _1565;
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1571 = _1313 + _1569;
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1575 = _1567 * _1567;
        float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1579 = _1277 + _1577;
        float _1581 = fma(_1571, _1571, _1575);
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1585 = fma(_1579, _1579, _1581);
        float _1587 = sqrt(_1585);
        float _1589 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1591 = precise::min(_1587, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1593 = _1591 * _1583;
        float _1595 = -_1313;
        float _1597 = _1595 + _1549;
        float _1599 = _1589 * _1593;
        float _1601 = -_1287;
        float _1603 = _1601 + _1551;
        float _1605 = -_1277;
        float _1607 = _1605 + _1553;
        float _1609 = fma(_1597, _1599, _1313);
        float _1611 = fma(_1603, _1599, _1287);
        float _1613 = fma(_1607, _1599, _1277);
        _1555 = _1611;
        _1557 = _1609;
        _1559 = _1613;
    }
    float _1615 = _1555;
    float _1617 = _1557;
    float _1619 = _1559;
    if (_1449)
    {
        _1331 = 1.0;
    }
    float _1621 = _1331;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1625 = _1465 * _1623;
    float _1627 = _1621;
    if (!_1449)
    {
        float _1629 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1631 = _1629 * 0.15915493667125701904296875;
        float _1633 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1635 = _1631 * 6.283185482025146484375;
        float _1637 = cos(_1635);
        float _1639 = _1633 * 0.15915493667125701904296875;
        float _1641 = _1631 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = 1.0 / _1637;
        float _1647 = _1639 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = _1639 * 6.283185482025146484375;
        float _1655 = sin(_1653);
        float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1659 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1657;
        float _1661 = _1649 * _1651;
        float _1663 = 1.0 / _1659;
        float _1665 = 1.0 / _1661;
        float _1667 = _1655 * _1665;
        float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1671 = fma(_1625, _1667, _1669);
        float _1673 = _1671 * _1663;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        _1563 = _1675;
    }
    float _1677 = _1563;
    if (!_1449)
    {
        float _1679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = _1679 * 0.15915493667125701904296875;
        float _1683 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1685 = _1681 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1683 * 0.15915493667125701904296875;
        float _1691 = _1681 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = 1.0 / _1687;
        float _1697 = _1689 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = _1689 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = 1.0 / _1707;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1713 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1711;
        float _1715 = 1.0 / _1713;
        float _1717 = _1705 * _1709;
        float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1721 = fma(_1625, _1717, _1719);
        float _1723 = _1721 * _1715;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        float _1727 = -_1725;
        float _1729 = _1727 + 1.0;
        _1627 = _1729;
    }
    float _1731 = _1627;
    float _1733 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1735 = _1615 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1739 = _1617 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1743 = _1619 + _1741;
    float _1745 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1747 = _1735 * _1735;
    float _1749 = fma(_1387, 6.2500002968590706586837768554688e-05, 0.5);
    float _1751 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1745);
    float _1753 = fma(_1739, _1739, _1747);
    float _1755 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1751);
    float _1757 = fma(_1743, _1743, _1753);
    float _1759 = rsqrt(_1757);
    float _1761 = sqrt(_1757);
    float _1763 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1765 = _1739 * _1763;
    float _1767 = _1743 * _1763;
    float _1769 = _1765 * _1765;
    float _1771 = _1767 * _1767;
    float _1773 = _1769 + _1771;
    float _1775 = sqrt(_1773);
    bool _1777 = _1775 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1781 = _1775 + _1779;
    float _1783 = _1743;
    float _1785 = _1773;
    float _1787 = _1781;
    float _1789 = _1747;
    float _1791 = _1735;
    if (_1777)
    {
        float _1793 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1783 = _1793;
    }
    float _1795 = _1783;
    if (_1777)
    {
        float _1797 = rsqrt(_1773);
        _1785 = _1797;
    }
    float _1799 = _1785;
    float _1801 = _1799;
    if (_1777)
    {
        float _1803 = _1781 * _1795;
        _1787 = _1803;
    }
    float _1805 = _1787;
    if (_1777)
    {
        float _1807 = _1805 * 0.15915493667125701904296875;
        _1789 = _1807;
    }
    float _1809 = _1789;
    float _1811 = _1795;
    float _1813 = _1809;
    if (_1777)
    {
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = precise::max(0.0, _1821);
    float _1825 = _1759;
    float _1827 = _1823;
    if (_1777)
    {
        float _1829 = _1809 * 6.283185482025146484375;
        float _1831 = cos(_1829);
        _1825 = _1831;
    }
    float _1833 = _1825;
    float _1835 = -_1763;
    float _1837 = -_1823;
    float _1839 = fma(_1735, _1835, _1837);
    float _1841 = _1839;
    if (_1777)
    {
        float _1843 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1843;
    }
    float _1845 = _1827;
    if (!_1777)
    {
        _1813 = _1769;
    }
    float _1847 = _1813;
    float _1849 = _1819;
    float _1851 = _1847;
    if (_1777)
    {
        float _1853 = fma(_1819, _1845, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1853;
    }
    float _1855 = _1849;
    float _1857 = _1855;
    float _1859 = _1833;
    if (_1777)
    {
        float _1861 = _1833 + (-1.0);
        _1791 = _1861;
    }
    float _1863 = _1791;
    float _1865 = _1863;
    if (_1777)
    {
        float _1867 = _1799 * _1855;
        _1475 = _1867;
    }
    float _1869 = _1475;
    if (!_1777)
    {
        _1857 = _1765;
    }
    float _1871 = _1857;
    float _1873 = _1871;
    if (_1777)
    {
        float _1875 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1777)
    {
        float _1879 = _1765 * _1869;
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1777)
    {
        _1801 = _1767;
    }
    float _1883 = _1801;
    float _1885 = _1883;
    if (_1777)
    {
        float _1887 = _1767 * _1869;
        _1885 = _1887;
    }
    float _1889 = _1885;
    if (_1777)
    {
        float _1891 = fma(_1839, _1833, _1877);
        _1841 = _1891;
    }
    float _1893 = _1841;
    if (_1777)
    {
        float _1895 = _1881 * _1881;
        _1851 = _1895;
    }
    float _1897 = _1851;
    if (!_1777)
    {
        _1859 = _1771;
    }
    float _1899 = _1859;
    float _1901 = _1899;
    if (_1777)
    {
        float _1903 = _1889 * _1889;
        _1901 = _1903;
    }
    float _1905 = _1901;
    float _1907 = fma(_1893, _1893, _1897);
    float _1909 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1911 = _1907 + _1905;
    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1915 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1913);
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1909);
    float _1921 = rsqrt(_1911);
    float _1923 = -_1917;
    float _1925 = _1923 + 1.0;
    float _1927 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1919);
    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1935 = fma(_1313, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1937 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1929);
    float _1939 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1943 = abs(_1925);
    float _1945 = log2(_1943);
    float _1947 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1937);
    float _1949 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1939);
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1953 = _1921 * _1881;
    float _1955 = _1921 * _1893;
    float _1957 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1949);
    float _1959 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1963 = -_1951;
    float _1965 = fma(_1963, _1933, 1.0);
    float _1967 = floor(_1935);
    float _1969 = _1921 * _1889;
    float _1971 = -_1961;
    float _1973 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1971);
    float _1975 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1977 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1979 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1981 = -_1969;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1973);
    float _1985 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1987 = floor(_1927);
    float _1989 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1977);
    float _1991 = fma(_1983, -0.5, 0.5);
    float _1993 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _1995 = exp2(_1979);
    float _1997 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1993);
    float _1999 = -_1967;
    float _2001 = _1935 + _1999;
    float _2003 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2005 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2003);
    float _2007 = log2(_1965);
    float _2009 = -_1987;
    float _2011 = _1927 + _2009;
    float _2013 = _1955 + 1.0;
    float _2015 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2017 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2015);
    float _2019 = sqrt(_1991);
    float _2021 = fma(_1983, 0.5, 0.5);
    float _2023 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2025 = -_1955;
    float _2027 = fma(_1995, _2013, _2025);
    float _2029 = fma(_2021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2031 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2023);
    float _2033 = fma(_2027, 0.5, 0.5);
    float _2035 = 1.0 / _1997;
    float _2037 = fma(_2021, _2029, -0.212114393711090087890625);
    float _2039 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2031);
    float _2041 = _2007 * 0.693147182464599609375;
    float _2043 = fma(_2021, _2037, 1.570728778839111328125);
    float _2045 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2039);
    float _2047 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2049 = _2019 * 0.636619746685028076171875;
    float _2051 = fma(_1385, 6.2500002968590706586837768554688e-05, 0.5);
    float _2053 = -_2043;
    float _2055 = fma(_2049, _2053, 1.0);
    float _2057 = _2017 * _2035;
    float _2059 = _2045 * _2035;
    float _2061 = fma(_2057, 0.5, 0.5);
    float _2063 = fma(_2059, -0.5, 0.5);
    float2 _6536 = float2(_2001, _2011);
    float _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6536, float2(0.0), isnan(_6536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6536, float2(0.0), isnan(_6536)), level(0.0)).x;
    float3 _6547 = float3(_2061, _2063, _2047);
    float _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6547, float3(0.0), isnan(_6547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6547, float3(0.0), isnan(_6547)), level(0.0)).x;
    float3 _6558 = float3(_2061, _2063, _2047);
    float4 _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6558, float3(0.0), isnan(_6558)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6558, float3(0.0), isnan(_6558)), level(0.0)).xyzw;
    float _2072 = _2070.x;
    float _2074 = _2070.y;
    float _2076 = _2070.z;
    float _2078 = _2070.w;
    float2 _6574 = float2(_2055, _2033);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6574, float2(0.0), isnan(_6574)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6574, float2(0.0), isnan(_6574)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float2 _6588 = float2(_2051, _1749);
    float3 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = float(uint(_925));
    float _2100 = trunc(_1037);
    int _2102 = int(_2100);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2106 = _2104 != 0;
    float _2108 = _1033 * _173;
    bool _2110 = _163 > 0.5;
    float _2112 = -_989;
    float _2114 = _2112 + 1.0;
    bool _2116 = _755 > 0.5;
    float _2118 = -_921;
    float _2120 = _2118 + 1.0;
    int _2122 = abs(_859);
    float _2124 = 1.0 / _2098;
    out.m_80.x = _1313;
    out.m_80.y = _1287;
    out.m_80.z = _1277;
    int _2126 = ~_925;
    int _2128 = _2126 + 1;
    float _2130 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2136 = trunc(_2108);
    int _2138 = int(_2136);
    float _2140 = float(uint(_2102));
    out.m_82.w = _1091;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2144 = _2142 != 0;
    float _2146 = float(_2102);
    float _2148 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = 1.0 / _2134;
    int _2152 = as_type<int>(_2124) + (-2);
    float _2154 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    bool _2156 = _2146 >= _1023;
    bool _2158 = isnan(_2146);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(_1023);
    bool _2164 = _2160 || _2162;
    float _2166 = float(_2164);
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2170 = _2168 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2172 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2174 = isnan(_741);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    float _2184 = as_type<float>(_2152) * _2140;
    bool _2186 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2188 = isnan(_741);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2194 = _2190 || _2192;
    float _2196 = float(_2194);
    float _2198 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2200 = trunc(_2166);
    int _2202 = int(_2200);
    out.m_84.x = _1205;
    out.m_86.x = _1617;
    out.m_86.y = _1615;
    out.m_86.z = _1619;
    float _2204 = trunc(_2184);
    float _2206 = precise::max(_2204, 0.0);
    uint _2209 = uint(_2206);
    float _2211 = 1.0 / _2170;
    int _2213 = ~_925;
    int _2215 = _2213 + 1;
    int _2217 = ~_2202;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    int _2223 = _2128 * int(_2209);
    int _2225 = _2223 + _2102;
    float _2227 = exp2(_2130);
    float _2229 = float(uint(_2225));
    float _2231 = as_type<float>(_2152) * _2229;
    bool _2233 = !_2144;
    float _2235 = _2233 ? 7.345489978790283203125 : 1.0;
    float _2237 = trunc(_2231);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = -_2227;
    float _2245 = _2243 + 1.0;
    float _2247 = _2235 * _163;
    float _2249 = floor(_2247);
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2257 = _2255 != 0;
    int _2259 = int(_2209) + int(_2241);
    float _2261 = 1.0 / _2253;
    int _2263 = _2215 * _2259;
    int _2265 = _2263 + _2102;
    float _2267 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2271 = -_2249;
    float _2273 = _2247 + _2271;
    bool _2275 = !_2257;
    int _2277 = _2275 ? 0 : 1;
    bool _2279 = uint(_2265) >= uint(_925);
    float _2281 = _2273 * _1023;
    float _2283 = 1.0 / _2269;
    bool _2285 = !_2279;
    int _2287 = _2285 ? 0 : (-1);
    bool _2289 = _925 == 0;
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2291;
    int _2295 = ~_2259;
    int _2297 = _2295 + _2287;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2277);
    float _2303 = trunc(_2281);
    int _2305 = int(_2303);
    float _2307 = _2293 * _2211;
    int _2309 = _925 * _2299;
    int _2311 = _2309 + _2102;
    int _2313 = _925 + (-1);
    bool _2315 = !_2289;
    int _2317 = _2315 ? _2311 : (-1);
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2321 = _2319 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2325 = _2323 != 0;
    int _2327 = _2317 * _2221;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2333 = 1.0 / _2321;
    int _2335 = _2202 * _2313;
    int _2337 = _2335 + _2327;
    float _2339 = _2331 * _2261;
    int _2341 = abs(_865);
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2345 = _2343 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2347 = _2305 * _2301;
    int _2349 = _2347 + _2102;
    int _2351 = _2337 * _2341;
    int _2353 = abs(_929);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2361 = _741 + _2359;
    int _2363 = _2138 * _2122;
    int _2365 = _2363 + _2351;
    bool _2367 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2369 = isnan(_741);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = _2357 * _2333;
    bool _2381 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2383 = isnan(_741);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2389 = _2385 || _2387;
    float _2391 = float(_2389);
    int _2393 = _2349 * _2353;
    int _2395 = _2393 + _2365;
    bool _2397 = !_2106;
    int _2399 = _2397 ? 0 : 1;
    float _2401 = -_2377;
    float _2403 = _2401 + 1.0;
    float _2405 = fma(_2307, _2361, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2407 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2409 = isnan(_741);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2415 = _2411 || _2413;
    float _2417 = float(_2415);
    float _2419 = 1.0 / _2345;
    int _2421 = abs(_2399);
    float _2423 = _2391 * _2403;
    float _2425 = -_2391;
    float _2427 = _2425 + 1.0;
    bool _2429 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2431 = isnan(_741);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = -_2417;
    float _2443 = _2441 + 1.0;
    float _2445 = _2417 * _2427;
    bool _2447 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2449 = isnan(_741);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2465 = _2463 != 0;
    int _2467 = _2305 * _2421;
    int _2469 = _2467 + _2395;
    float _2471 = _2439 * _2443;
    float _2473 = -_2439;
    float _2475 = _2473 + 1.0;
    bool _2477 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2479 = isnan(_741);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2485 = _2481 || _2483;
    float _2487 = float(_2485);
    float _2489 = float(uint(_2469));
    float _2491 = _2457 * _2475;
    float _2493 = -_2457;
    float _2495 = _2493 + 1.0;
    float _2497 = -_2487;
    float _2499 = _2497 + 1.0;
    float _2501 = as_type<float>(_2152) * _2489;
    float _2503 = _2487 * _2495;
    float _2505 = _2182 * _2499;
    float _2507 = -_2182;
    float _2509 = _2507 + 1.0;
    float _2511 = trunc(_2501);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    int _2517 = ~_925;
    int _2519 = _2517 + 1;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2521;
    float _2525 = _2461 * _2419;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2531 = _2523 * _2150;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2535 = _741 + _2533;
    float _2537 = float(uint(_2349));
    float _2539 = _2196 * _2509;
    float _2541 = -_2196;
    float _2543 = _2541 + 1.0;
    float _2545 = fma(_2339, _2535, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2547 = _2529 * _2283;
    float _2549 = _2405 * _2539;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2553 = _741 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2559 = _2519 * int(_2515);
    int _2561 = _2559 + _2469;
    float _2563 = fma(_2543, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2549);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2567 = _741 + _2565;
    float _2569 = fma(_2547, _2553, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2571 = float(uint(_2561));
    float _2573 = fma(_2379, _2567, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2575 = fma(_2545, _2505, _2563);
    float _2577 = as_type<float>(_2152) * _2537;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2581 = _741 + _2579;
    float _2583 = as_type<float>(_2152) * _2571;
    float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2587 = _741 + _2585;
    float _2589 = fma(_2573, _2503, _2575);
    float _2591 = -_235;
    int _2593 = _2116 ? as_type<int>(_2591) : as_type<int>(_235);
    float _2595 = trunc(_2577);
    float _2597 = precise::max(_2595, 0.0);
    uint _2599 = uint(_2597);
    float _2601 = fma(_2525, _2587, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2605 = _741 + _2603;
    float _2607 = -_243;
    int _2609 = _2110 ? as_type<int>(_2607) : as_type<int>(_243);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2611;
    int _2615 = ~_925;
    int _2617 = _2615 + 1;
    float _2619 = fma(_2601, _2491, _2589);
    float _2621 = fma(_2531, _2605, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2623 = trunc(_2583);
    float _2625 = precise::max(_2623, 0.0);
    uint _2627 = uint(_2625);
    int _2629 = ~_925;
    int _2631 = _2629 + 1;
    float _2633 = fma(_2621, _2471, _2619);
    float _2635 = fma(_2569, _2445, _2633);
    float _2637 = 1.0 / _2557;
    int _2639 = int(_2515) + int(_2627);
    bool _2641 = !_2465;
    float _2643 = _2641 ? _243 : as_type<float>(_2609);
    bool _2645 = !_2325;
    float _2647 = _2645 ? _235 : as_type<float>(_2593);
    float _2649 = _235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2651 = _2643 + 0.5;
    int _2653 = _2631 * int(_2599);
    int _2655 = _2653 + _2349;
    float _2657 = _2613 * _2637;
    float _2659 = _2647 + (-0.5);
    int _2661 = _2617 * _2639;
    int _2663 = _2661 + _2469;
    float _2665 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1005);
    float _2667 = float(uint(_2655));
    float _2669 = fma(_2657, _2581, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2671 = -_2659;
    float _2673 = -_1009;
    float _2675 = fma(_2671, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2673);
    bool _2677 = uint(_2663) >= uint(_925);
    float _2679 = -_2114;
    float _2681 = fma(_2643, _2679, _2665);
    float _2683 = as_type<float>(_2152) * _2667;
    float _2685 = fma(_2669, _2423, _2635);
    bool _2687 = !_2677;
    int _2689 = _2687 ? 0 : (-1);
    float _2691 = fma(_2647, _2120, _2675);
    float _2693 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2695 = ~_925;
    int _2697 = _2695 + 1;
    float _2699 = trunc(_2683);
    float _2701 = precise::max(_2699, 0.0);
    uint _2703 = uint(_2701);
    int _2705 = ~_2639;
    int _2707 = _2705 + _2689;
    int _2709 = _2707 + 1;
    out.m_88.x = _2681;
    out.m_88.y = _2691;
    float _2711 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2713 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2715 = fma(_2377, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2685);
    int _2717 = _925 * _2709;
    int _2719 = _2717 + _2469;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2723 = _2721 != 0;
    out.m_90.x = _2715;
    bool _2725 = !_2289;
    int _2727 = _2725 ? _2719 : (-1);
    float _2729 = -_1209;
    float _2731 = fma(_2729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2711);
    int _2733 = _2727 >> 31;
    int _2735 = int(_2599) + int(_2703);
    int _2737 = _2733 & 3;
    float _2739 = -_1209;
    float _2741 = fma(_2739, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2693);
    float _2743 = -_1209;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2713);
    int _2747 = _2697 * _2735;
    int _2749 = _2747 + _2349;
    int _2751 = _2727 + _2737;
    float _2753 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2755 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2741);
    float _2757 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2745);
    int _2759 = _2751 >> 2;
    float _2761 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    bool _2763 = uint(_2749) >= uint(_925);
    float _2765 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2731);
    int _2767 = _2759 << 4;
    int _2769 = _2767 + 368;
    float _2771 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2753);
    float _2773 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2775 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2777 = uint(int(uint(_2769) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    float _2793 = _2649 * _2755;
    int _2795 = _2727 & 3;
    bool _2797 = _2795 != 0;
    float _2799 = _2649 * _2765;
    int _2801 = _2727 & 3;
    bool _2803 = _2801 != 0;
    float _2805 = _2649 * _2757;
    float _2807 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2154);
    float _2809 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2811 = _2769 + 8;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    bool _2829 = uint(_2795) > 1u;
    float _2831 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2773);
    float _2833 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2809);
    float _2835 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2837 = abs(_1625);
    float _2839 = log2(_2837);
    int _2841 = _2803 ? 0 : 1;
    float _2843 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2771);
    bool _2845 = !_2763;
    int _2847 = _2845 ? 0 : (-1);
    float _2849 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    int _2851 = ~_2841;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    float _2857 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2831);
    bool _2859 = uint(_2795) >= 2u;
    float _2861 = fma(_2835, _2849, _2805);
    int _2863 = _2855;
    float _2865 = _2017;
    if (!_2829)
    {
        int _2867 = ~_2841;
        int _2869 = _2867 + 1;
        _2863 = _2869;
    }
    int _2871 = _2863;
    float _2873 = fma(_2835, _2807, _2793);
    bool _2875 = _2795 != 3;
    float _2877 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2761);
    int _2879 = ~_2735;
    int _2881 = _2879 + _2847;
    int _2883 = _2881 + 1;
    float _2885 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2775);
    int _2887 = _2859 ? 0 : 1;
    float _2889 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2891 = abs(_2871);
    int _2893 = _925 * _2883;
    int _2895 = _2893 + _2349;
    float _2897 = fma(_2835, _2843, _2799);
    bool _2899 = !_2797;
    int _2901 = _2899 ? 0 : 1;
    float _2903 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2885);
    int _2905 = ~_2887;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = exp2(_2889);
    bool _2913 = _2795 != 3;
    float _2915 = _2877 + _2897;
    int _2917 = _2909;
    if (_2875)
    {
        int _2919 = ~_2887;
        int _2921 = _2919 + 1;
        _2917 = _2921;
    }
    int _2923 = _2917;
    float _2925 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2927 = ~_2891;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    float _2933 = _2857 + _2873;
    int _2935 = abs(_2901);
    float _2937 = _2903 + _2861;
    bool _2939 = !_2913;
    int _2941 = _2939 ? 0 : (-1);
    float _2943 = -_2065;
    float _2945 = _2943 + 1.0;
    int _2947 = abs(_2923);
    int _2949 = _2931 * as_type<int>(_2791);
    int _2951 = ~_2935;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    out.m_92.x = _2092;
    out.m_92.y = _2094;
    out.m_92.z = _2096;
    bool _2957 = !_2723;
    int _2959 = _2957 ? 0 : 1;
    int _2961 = abs(_2941);
    int _2963 = _2955 * as_type<int>(_2783);
    int _2965 = _2963 + _2949;
    out.m_94.x = _2933;
    out.m_94.y = _2915;
    out.m_94.z = _2937;
    int _2967 = abs(_2959);
    int _2969 = ~_2947;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    float _2975 = fma(_2911, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2981 = ~_2961;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2973 * as_type<int>(_2819);
    int _2989 = _2987 + _2965;
    int _2991 = ~_2967;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    float _2997 = fma(_2977, -2.0, 3.0);
    float _2999 = _2977 * _2977;
    int _3001 = _2985 * as_type<int>(_2827);
    int _3003 = _3001 + _2989;
    float _3005 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2979);
    bool _3007 = !_2289;
    int _3009 = _3007 ? _2895 : (-1);
    float _3011 = _2999 * _2997;
    int _3013 = _3003 * _2995;
    float _3015 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3005);
    float _3017 = in.m_96.x;
    float _3019 = -_3011;
    float _3021 = _3019 + 1.0;
    int _3023 = _3009 * _2967;
    int _3025 = _3023 + _3013;
    float _3027 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3015);
    bool _3029 = _1625 <= 8000.0;
    bool _3031 = isnan(_1625);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan(8000.0);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = fma(_3021, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3011);
    float _3043 = _1997 * 0.5;
    float _3045 = float(_3025);
    float _3047 = _3027 + _1997;
    float _3049 = _2017 + _1997;
    float _3051 = fma(_2045, -0.5, _3043);
    float _3053 = _3047 * 0.5;
    float _3055 = _3049 * 0.5;
    float _3057 = _3039 * _3041;
    out.m_98.x = _3045;
    float _3059 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_100.x = _3055;
    out.m_100.y = _3051;
    out.m_100.z = _3053;
    out.m_100.w = _1997;
    bool _3061 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3063 = isnan(_1761);
    bool _3065 = _3061 || _3063;
    bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3069 = _3065 || _3067;
    float _3071 = _2945 * _3059;
    float _3073 = precise::clamp(_3071, 0.0, 1.0);
    float _3075 = in.m_96.z;
    float _3077 = -_3073;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _2017;
    out.gl_Position.y = _2045;
    out.gl_Position.z = _3027;
    out.gl_Position.w = _1997;
    float _3081 = _3079 * _3017;
    float _3083 = _2925 * _2067;
    float _3085 = -_2925;
    float _3087 = _3085 + 1.0;
    float _3089 = _3053;
    float _3091 = _3081;
    if (!_3069)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _3089;
    float _3095 = _2078 * _3083;
    float _3097 = _2088 * _3083;
    float _3099 = _2078 * _3087;
    float _3101 = _1677 * _1731;
    float _3103 = fma(_2084, _3095, _2072);
    float _3105 = fma(_2086, _3095, _2074);
    float _3107 = fma(_2078, _3097, _2076);
    float _3109 = _3081 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3111 = _3101 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3113 = _3111;
    float _3115 = _3109;
    float _3117 = _3093;
    float _3119 = _3093;
    if (!_3069)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3121 = _3091;
    out.m_102.x = _3103;
    out.m_102.y = _3105;
    out.m_102.z = _3107;
    out.m_102.w = _3099;
    float _3123 = _3111 * _3075;
    float _3125 = _3075;
    float _3127 = _3121;
    float _3129 = _3121;
    if (!_3069)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3131 = _2865;
    out.m_104.x = _3109;
    float _3133 = _3131;
    float _3135 = _3131;
    if (!_3069)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3137 = _3125;
    float _3139 = _3137;
    float _3141 = _3137;
    if (!_3069)
    {
        _3113 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3143 = _3113;
    float _3145 = _3143;
    float _3147 = _3143;
    if (!_3069)
    {
        _3115 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3149 = _3115;
    bool _3151 = !_3069;
    float _3153 = _3149;
    float _3155 = _3149;
    if (!_3151)
    {
        bool _3157 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3159 = isnan(_1761);
        bool _3161 = _3157 || _3159;
        bool _3163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3165 = _3161 || _3163;
        if (!_3165)
        {
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3169 = _1761 + _3167;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3173 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3171;
            float _3175 = 1.0 / _3173;
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3197 = _3169 * _3175;
            float _3199 = precise::clamp(_3197, 0.0, 1.0);
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3205 = fma(_3199, _3179, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3207 = fma(_3199, _3203, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3209 = fma(_3199, _3183, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3211 = fma(_3199, _3187, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3213 = fma(_3199, _3191, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3215 = fma(_3199, _3195, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3135 = _3207;
            _3155 = _3213;
            _3129 = _3205;
            _3119 = _3211;
            _3141 = _3209;
            _3147 = _3215;
            _3217 = true;
        }
        else
        {
            bool _3219 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3221 = isnan(_1761);
            bool _3223 = _3219 || _3221;
            bool _3225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3227 = _3223 || _3225;
            if (!_3227)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3229 = _3127;
            _3129 = _3229;
            if (!_3227)
            {
                _3133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3231 = _3133;
            _3135 = _3231;
            if (!_3227)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3233 = _3139;
            _3141 = _3233;
            if (!_3227)
            {
                _3117 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3235 = _3117;
            _3119 = _3235;
            if (!_3227)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3237 = _3153;
            _3155 = _3237;
            if (!_3227)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3239 = _3145;
            bool _3241 = !_3227;
            _3147 = _3239;
            if (!_3241)
            {
                bool _3243 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3245 = isnan(_1761);
                bool _3247 = _3243 || _3245;
                bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3251 = _3247 || _3249;
                if (!_3251)
                {
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3255 = _1761 + _3253;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3259 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3257;
                    float _3261 = 1.0 / _3259;
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3283 = _3255 * _3261;
                    float _3285 = precise::clamp(_3283, 0.0, 1.0);
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3291 = fma(_3285, _3265, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3293 = fma(_3285, _3289, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3295 = fma(_3285, _3269, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3297 = fma(_3285, _3273, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3299 = fma(_3285, _3277, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3301 = fma(_3285, _3281, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3135 = _3293;
                    _3155 = _3299;
                    _3129 = _3291;
                    _3119 = _3297;
                    _3141 = _3295;
                    _3147 = _3301;
                    _3217 = true;
                }
                else
                {
                    _3135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3119 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3217 = false;
    float _3303 = _3135;
    float _3305 = _3155;
    float _3307 = _3129;
    float _3309 = _3119;
    float _3311 = _3141;
    float _3313 = _3147;
    float _3315 = fma(_2915, -0.5, 0.5);
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = -_3303;
    float _3321 = _3319 + _3305;
    float _3323 = _3123 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3325 = -_3307;
    float _3327 = _3325 + _3309;
    float _3329 = fma(_3317, _3321, _3303);
    out.m_106.x = 0.0;
    float _3331 = -_3311;
    float _3333 = _3331 + _3313;
    float _3335 = fma(_3317, _3327, _3307);
    float _3337 = _3329 * 0.586610972881317138671875;
    out.m_55.x = _3323;
    bool _3339 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3341 = fma(_3317, _3333, _3311);
    float _3343 = fma(_3335, 0.298911988735198974609375, _3337);
    bool _3345 = _1677 > 0.0;
    bool _3347 = isnan(_1677);
    bool _3349 = _3345 || _3347;
    bool _3351 = isnan(0.0);
    bool _3353 = _3349 || _3351;
    float _3355 = fma(_3341, 0.114477999508380889892578125, _3343);
    bool _3357 = _1731 <= 0.0;
    bool _3359 = !_3353;
    bool _3361 = _3357 || _3359;
    float _3363 = -_3355;
    float _3365 = _3335 + _3363;
    float _3367 = -_3355;
    float _3369 = _3329 + _3367;
    float _3371 = -_3355;
    float _3373 = _3341 + _3371;
    float _3375 = fma(_3365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    float _3377 = fma(_3369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    float _3379 = fma(_3373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    bool _3381 = !_3339;
    if (!_3381)
    {
        float _3383 = -_1615;
        float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3387 = -_1617;
        float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3391 = -_1619;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3395 = _3385 * _3385;
        float _3397 = fma(_3389, _3389, _3395);
        float _3399 = fma(_3393, _3393, _3397);
        float _3401 = sqrt(_3399);
        float _3403 = rsqrt(_3399);
        float _3405 = -_3401;
        float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3409 = _3407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = _3389 * _3403;
        float _3415 = _3385 * _3403;
        float _3417 = abs(_3411);
        float _3419 = log2(_3417);
        float _3421 = _3393 * _3403;
        float _3423 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3425 = _2915 * _3415;
        float _3427 = -_3415;
        float _3429 = -_3423;
        float _3431 = fma(_3427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3429);
        float _3433 = fma(_2933, _3413, _3425);
        float _3435 = -_3421;
        float _3437 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3431);
        float _3439 = fma(_2937, _3421, _3433);
        float _3441 = precise::clamp(_3439, 0.0, 1.0);
        float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3445 = _3437 + _3443;
        float _3447 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3449 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3451 = precise::clamp(_3449, 0.0, 1.0);
        float _3453 = exp2(_3447);
        float _3455 = _3453 * _3451;
        float _3457 = _3441 * _3455;
        float _3459 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3461 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3463 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3459;
        out.m_106.y = _3461;
        out.m_106.z = _3463;
    }
    out.m_82.x = _3375;
    out.m_82.y = _3377;
    out.m_82.z = _3379;
    if (!_3361)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3465;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3217 = false;
    bool _519 = false;
    bool _413 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_48.w;
    float _122 = in.m_50.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_55.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3533 = as_type<float>(_149);
        out.gl_Position.z = _3533;
    }
    if (!_135)
    {
        return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_57.x;
    float _165 = float(_127);
    bool _167 = _131 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _139;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _131 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _151 = as_type<int>(_181);
    }
    int _183 = _151;
    out.m_59.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3598 = as_type<float>(_183);
        out.gl_Position.z = _3598;
    }
    out.m_53.x = _177;
    if (_171)
    {
        return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    float _205 = in.m_70.x;
    float _207 = in.m_70.y;
    float _209 = in.m_70.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _189 * _195;
    float _223 = _189 * _201;
    float _225 = fma(_187, _193, _221);
    float _227 = _189 * _207;
    float _229 = fma(_187, _199, _223);
    float _231 = fma(_191, _197, _225);
    bool _233 = !_217;
    float _235 = _233 ? (-0.5) : 0.5;
    float _237 = fma(_187, _205, _227);
    float _239 = fma(_191, _203, _229);
    bool _241 = !_213;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = fma(_191, _209, _237);
    bool _247 = !_219;
    float _263;
    if (!_247)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        _263 = _177;
    }
    _265 = false;
    float _267 = _263;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _267 + _285;
    bool _289 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_267);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_283;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _329;
    float _333 = -_299;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _339 = 1.0 / _303;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _287 * _313;
    float _347 = _325 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = -_325;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_351, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _271 * _339;
    float _365 = fma(_359, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = in.m_72.x;
    float _369 = in.m_72.y;
    float _371 = fma(_331, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_343, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _371 * _347;
    float _377 = _373 * _347;
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _381 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _383 = fma(_361, _327, _379);
    float _385 = fma(_365, _327, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    float _391 = _387 * _367;
    float _393 = _389 * _369;
    bool _395 = !_337;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        _411 = _177;
    }
    _413 = false;
    float _415 = _411;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = _415 + _417;
    bool _421 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _423 = isnan(_415);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _433;
    bool _437 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _439 = isnan(_415);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -_431;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _453;
    float _457 = 1.0 / _435;
    bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _461 = _419 * _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _463;
    float _467 = _447 * _451;
    float _469 = fma(_455, _461, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _471 = -_447;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = fma(_465, _461, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _481 = _469 * _467;
    float _483 = fma(_477, _461, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _485 = _479 * _467;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _489 = _483 * _467;
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _493 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].x, _487);
    float _495 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].z, _491);
    float _499 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    bool _501 = !_459;
    float _517;
    if (!_501)
    {
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _505 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _177;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _537 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = isnan(_521);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _549;
    float _553 = 1.0 / _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = isnan(_521);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _577 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _579 = isnan(_521);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _591 = 1.0 / _535;
    float _593 = -_569;
    float _595 = _593 + 1.0;
    bool _597 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _599 = _547 * _595;
    float _601 = _551 * _553;
    bool _603 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_521);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_547;
    float _617 = _615 + 1.0;
    float _619 = 1.0 / _557;
    float _621 = fma(_601, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _623;
    float _627 = _613 * _617;
    float _629 = -_613;
    float _631 = _629 + 1.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = 1.0 / _575;
    float _639 = _587 * _631;
    float _641 = _635 * _591;
    float _643 = -_587;
    float _645 = _643 + 1.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = _521 + _647;
    float _651 = _621 * _639;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = _521 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _661 = _625 * _619;
    bool _663 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _665 = isnan(_521);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_641, _655, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _677 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[115].x, _651);
    float _679 = fma(_661, _649, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _521 + _681;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = fma(_675, _627, _677);
    float _691 = _659 * _637;
    float _693 = _569 * _687;
    float _695 = fma(_679, _599, _689);
    float _697 = fma(_691, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = fma(_697, _693, _695);
    float _703 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[119].x, _701);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _713 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _717 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _717;
    out.m_74.y = _719;
    out.m_74.z = _721;
    out.m_74.w = _715;
    out.m_76.x = _713;
    out.m_76.y = _703;
    out.m_76.z = _707;
    out.m_76.w = _723;
    bool _725 = !_597;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _179 = _739;
    }
    float _741 = _179;
    float _743 = in.m_48.x;
    float _745 = in.m_48.y;
    float _747 = in.m_48.z;
    float _749 = _163 * 2.0;
    float _751 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _753 = log2(_751);
    float _755 = in.m_57.y;
    float _757 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _761 = in.m_57.z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _765 = floor(_749);
    float _767 = in.m_68.w;
    float _769 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _771 = in.m_70.w;
    float _773 = _753 * _131;
    float _775 = _207 * _745;
    float _777 = _195 * _745;
    float _779 = _201 * _745;
    bool _781 = _765 > 0.0;
    float _783 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _785 = fma(_193, _743, _777);
    bool _787 = _765 >= 0.0;
    bool _789 = isnan(_765);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = fma(_199, _743, _779);
    float _799 = fma(_783, -2.0, _759);
    float _801 = _761 * 2.0;
    float _803 = fma(_205, _743, _775);
    float _805 = in.m_66.w;
    float _807 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _809 = _755 * 2.0;
    float _811 = exp2(_773);
    float _813 = fma(_197, _747, _785);
    float _815 = -_763;
    float _817 = fma(_807, 2.0, _815);
    float _819 = _163 + _755;
    float _821 = fma(_203, _747, _797);
    float _823 = _755 + _761;
    float _825 = _819 + (-1.0);
    float _827 = floor(_801);
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _839 = _837 != 0;
    float _841 = _821 + _767;
    int _843 = _795 ? 0 : 1;
    float _845 = fma(_209, _747, _803);
    float _847 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _849 = _823 + (-1.0);
    float _851 = floor(_809);
    float _853 = -_811;
    float _855 = _853 + 1.0;
    bool _857 = !_831;
    int _859 = _857 ? 0 : 1;
    float _861 = _845 + _771;
    bool _863 = !_835;
    int _865 = _863 ? 0 : 1;
    float _867 = _813 + _805;
    bool _869 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    bool _883 = _827 > 0.0;
    float _885 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _887 = _827 >= 0.0;
    bool _889 = isnan(_827);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _901 = _841 + _899;
    int _903 = _895 ? 0 : 1;
    float _905 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _897);
    bool _907 = _851 > 0.0;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _911 = _851 >= 0.0;
    bool _913 = isnan(_851);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    float _921 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _905);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _925 = int(_923);
    bool _927 = !_839;
    int _929 = _927 ? 0 : 1;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _867 + _931;
    int _935 = ~_903;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    float _941 = _901 * _901;
    float _943 = _877 ? _855 : 0.0;
    float _945 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _909);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _961 = _861 + _959;
    int _963 = _939;
    if (!_883)
    {
        int _965 = ~_903;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_933, _933, _941);
    bool _973 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(1.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _985 = 1.0 + _983;
    float _987 = float(_881);
    float _989 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _945);
    bool _991 = !_949;
    int _993 = _991 ? 0 : 1;
    float _995 = fma(_961, _961, _971);
    float _997 = 1.0 / _987;
    bool _999 = !_953;
    int _1001 = _999 ? 0 : 1;
    float _1003 = -_131;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[76].x, _817);
    int _1007 = abs(_993);
    float _1009 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _799);
    int _1011 = abs(_1001);
    float _1013 = float(_1007);
    float _1015 = 1.0 / _985;
    float _1017 = in.m_78.x;
    float _1019 = in.m_78.y;
    float _1021 = in.m_78.z;
    float _1023 = float(_925);
    float _1025 = float(_969);
    int _1027 = ~_843;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = _1023 * _131;
    float _1035 = sqrt(_995);
    float _1037 = _997 * _131;
    float _1039 = _1013 * _1025;
    int _1041 = _919 ? 0 : 1;
    int _1043 = _1031;
    if (!_781)
    {
        int _1045 = ~_843;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    float _1051 = _1039 * (-2.0);
    int _1053 = ~_1041;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    int _1059 = _1057;
    if (_981)
    {
        float _1061 = _943 * _1015;
        _141 = _1061;
    }
    float _1063 = _141;
    float _1065 = rsqrt(_995);
    float _1067 = float(_1049);
    float _1069 = _757 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1071 = float(_1011);
    float _1073 = fma(_847, _1051, _847);
    if (!_907)
    {
        int _1075 = ~_1041;
        int _1077 = _1075 + 1;
        _1059 = _1077;
    }
    int _1079 = _1059;
    float _1081 = _1035 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1083 = fma(_1051, _1017, _1017);
    float _1085 = _1071 * _1067;
    float _1087 = _163 + (-0.5);
    float _1089 = float(_1079);
    float _1091 = precise::min(_1069, _1081);
    float _1093 = _1085 * (-2.0);
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1083);
    bool _1097 = !_957;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = _1065 * _1091;
    float _1103 = fma(_1093, _1019, _1019);
    float _1105 = fma(_885, _1093, _885);
    int _1107 = abs(_1099);
    float _1109 = _901 * _1101;
    float _1111 = fma(_1073, _1063, _1095);
    float _1113 = _755 + (-0.5);
    float _1115 = float(_1107);
    float _1117 = _933 * _1101;
    float _1119 = -_1109;
    float _1121 = _901 + _1119;
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1103);
    float _1125 = _1111 * 0.15915493667125701904296875;
    float _1127 = -_1117;
    float _1129 = _933 + _1127;
    float _1131 = _1121 * _1121;
    float _1133 = _1115 * _1089;
    float _1135 = _163 + _761;
    float _1137 = _961 * _1101;
    float _1139 = fma(_1129, _1129, _1131);
    float _1141 = _1135 + (-1.0);
    float _1143 = _1133 * (-2.0);
    float _1145 = -_1137;
    float _1147 = _961 + _1145;
    float _1149 = _761 + (-0.5);
    float _1151 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1153 = fma(_1143, _1021, _1021);
    float _1155 = fma(_1147, _1147, _1139);
    float _1157 = fma(_1105, _1063, _1123);
    float _1159 = fma(_1151, _1143, _1151);
    float _1161 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1153);
    float _1163 = _1125 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = _1157 * 0.15915493667125701904296875;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _235);
    float _1171 = fma(_1159, _1063, _1161);
    float _1173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    float _1175 = _1171 * 0.15915493667125701904296875;
    float _1177 = sqrt(_1155);
    float _1179 = _1167 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1167 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = _1065 * _1177;
    float _1189 = _769 * _1187;
    float _1191 = _1125 * 6.283185482025146484375;
    float _1193 = sin(_1191);
    float _1195 = _1189 * _1169;
    float _1197 = _1165 * _1181;
    float _1199 = _1175 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = _1165 * _1185;
    float _1205 = _757 * _1187;
    float _1207 = _1175 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1193 * _1181;
    float _1213 = _1193 * _1185;
    float _1215 = _1165 * _1201;
    float _1217 = _1193 * _1201;
    float _1219 = _1185 * _1201;
    float _1221 = _1181 * _1201;
    float _1223 = _1205 * _1173;
    float _1225 = _1215 * _1195;
    float _1227 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1229 = _1227 * 0.5;
    float _1231 = fma(_1209, _1203, _1211);
    float _1233 = -_1213;
    float _1235 = fma(_1209, _1197, _1233);
    float _1237 = -_1195;
    float _1239 = _1209 * _1237;
    float _1241 = -_1197;
    float _1243 = fma(_1209, _1213, _1241);
    float _1245 = fma(_1231, _1223, _1225);
    float _1247 = _1217 * _1195;
    float _1249 = fma(_1219, _1223, _1239);
    float _1251 = fma(_1209, _1211, _1203);
    float _1253 = fma(_1235, _1229, _1245);
    float _1255 = fma(_1243, _1223, _1247);
    float _1257 = fma(_1221, _1229, _1249);
    float _1259 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1261 = fma(_1251, _1229, _1255);
    float _1263 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1265 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1259);
    float _1267 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1263);
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1265);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1267);
    float _1273 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1275 = -_1137;
    float _1277 = _861 + _1275;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1281 = _861 + _1273;
    float _1283 = _867 + _1279;
    float _1285 = -_1109;
    float _1287 = _841 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1291 = _1281 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1295 = _1283 + _1293;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1299 = _1291 * _1291;
    float _1301 = fma(_1295, _1295, _1299);
    float _1303 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1305 = sqrt(_1301);
    float _1307 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1303);
    float _1309 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1307);
    float _1311 = -_1117;
    float _1313 = _867 + _1311;
    float _1315 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1317 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1297);
    float _1319 = _841 + _1315;
    float _1321 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1317);
    bool _1323 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1309;
    float _1327 = _1317;
    float _1329 = _1315;
    float _1331 = _1319;
    if (!_1323)
    {
        _1325 = _1283;
    }
    float _1333 = _1325;
    float _1335 = _1333;
    if (!_1323)
    {
        _1327 = _1281;
    }
    float _1337 = _1327;
    float _1339 = _1337;
    if (!_1323)
    {
        _1329 = _1319;
    }
    float _1341 = _1329;
    bool _1343 = !_1323;
    float _1345 = _1341;
    if (!_1343)
    {
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1351 = _1305 + _1349;
        float _1353 = rsqrt(_1301);
        float _1355 = _1351 * _1347;
        float _1357 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = _1355 * 0.15915493667125701904296875;
        float _1361 = _1359 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = _1359 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1363 + (-1.0);
        float _1371 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1373 = fma(_1367, _1357, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1375 = fma(_1319, _1363, _1371);
        float _1377 = _1353 * _1373;
        float _1379 = fma(_1295, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1381 = fma(_1291, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1345 = _1375;
        _1335 = _1379;
        _1339 = _1381;
    }
    float _1383 = _1345;
    float _1385 = _1335;
    float _1387 = _1339;
    float _1389 = -_841;
    float _1391 = _1389 + _1383;
    float _1393 = -_867;
    float _1395 = _1393 + _1385;
    float _1397 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1399 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = _1391 * _1391;
    float _1403 = -_861;
    float _1405 = _1403 + _1387;
    float _1407 = 1.0 / _1397;
    float _1409 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1411 = fma(_1395, _1395, _1401);
    float _1413 = -_1109;
    float _1415 = _1413 + _1383;
    float _1417 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1419 = fma(_1405, _1405, _1411);
    float _1421 = -_1137;
    float _1423 = _1421 + _1387;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1427 = sqrt(_1419);
    bool _1429 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1431 = isnan(0.5);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1437 = _1433 || _1435;
    float _1439 = _1425 + _1397;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1449 = _1445 || _1447;
    float _1451 = _1439 * _1407;
    float _1453 = _1451 * 0.5;
    float _1455 = -_1117;
    float _1457 = _1455 + _1385;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1461 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1459);
    bool _1463 = _1427 > 0.0;
    float _1465 = 1.0 / _1461;
    float _1467 = _1427;
    float _1469 = _1453;
    float _1471 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1473 = _1391;
    float _1475 = _1395;
    if (!_1463)
    {
        _1467 = _1457;
    }
    float _1477 = _1467;
    float _1479 = _1477;
    if (!_1463)
    {
        _1469 = _1415;
    }
    float _1481 = _1469;
    float _1483 = _1481;
    if (!_1463)
    {
        _1471 = _1423;
    }
    float _1485 = _1471;
    bool _1487 = !_1463;
    float _1489 = _1485;
    float _1491 = _1485;
    if (!_1487)
    {
        float _1493 = _239 * _239;
        float _1495 = fma(_231, _231, _1493);
        float _1497 = rsqrt(_1419);
        float _1499 = fma(_245, _245, _1495);
        float _1501 = sqrt(_1499);
        float _1503 = _1395 * _1497;
        float _1505 = _1391 * _1497;
        float _1507 = _1405 * _1497;
        bool _1509 = _1501 > 0.0;
        float _1511 = _1497;
        float _1513 = _1501;
        if (!_1509)
        {
            _1511 = _1457;
        }
        float _1515 = _1511;
        _1479 = _1515;
        if (!_1509)
        {
            _1513 = _1415;
        }
        float _1517 = _1513;
        _1483 = _1517;
        if (!_1509)
        {
            _1489 = _1423;
        }
        float _1519 = _1489;
        bool _1521 = !_1509;
        _1491 = _1519;
        if (!_1521)
        {
            float _1523 = rsqrt(_1499);
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1527 = _239 * _1523;
            float _1529 = _231 * _1523;
            float _1531 = _1505 * _1527;
            float _1533 = _245 * _1523;
            float _1535 = fma(_1503, _1529, _1531);
            float _1537 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1539 = fma(_1507, _1533, _1535);
            float _1541 = _1539 * _1537;
            float _1543 = fma(_231, _1541, _1457);
            float _1545 = fma(_239, _1541, _1415);
            float _1547 = fma(_245, _1541, _1423);
            _1479 = _1543;
            _1483 = _1545;
            _1491 = _1547;
        }
    }
    float _1549 = _1479;
    float _1551 = _1483;
    float _1553 = _1491;
    float _1555 = _1551;
    float _1557 = _1549;
    float _1559 = _1553;
    if (_1449)
    {
        _1473 = 1.0;
    }
    float _1561 = _1473;
    float _1563 = _1561;
    if (!_1437)
    {
        float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1567 = _1287 + _1565;
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1571 = _1313 + _1569;
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1575 = _1567 * _1567;
        float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1579 = _1277 + _1577;
        float _1581 = fma(_1571, _1571, _1575);
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1585 = fma(_1579, _1579, _1581);
        float _1587 = sqrt(_1585);
        float _1589 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1591 = precise::min(_1587, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1593 = _1591 * _1583;
        float _1595 = -_1313;
        float _1597 = _1595 + _1549;
        float _1599 = _1589 * _1593;
        float _1601 = -_1287;
        float _1603 = _1601 + _1551;
        float _1605 = -_1277;
        float _1607 = _1605 + _1553;
        float _1609 = fma(_1597, _1599, _1313);
        float _1611 = fma(_1603, _1599, _1287);
        float _1613 = fma(_1607, _1599, _1277);
        _1555 = _1611;
        _1557 = _1609;
        _1559 = _1613;
    }
    float _1615 = _1555;
    float _1617 = _1557;
    float _1619 = _1559;
    if (_1449)
    {
        _1331 = 1.0;
    }
    float _1621 = _1331;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1625 = _1465 * _1623;
    float _1627 = _1621;
    if (!_1449)
    {
        float _1629 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1631 = _1629 * 0.15915493667125701904296875;
        float _1633 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1635 = _1631 * 6.283185482025146484375;
        float _1637 = cos(_1635);
        float _1639 = _1633 * 0.15915493667125701904296875;
        float _1641 = _1631 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = 1.0 / _1637;
        float _1647 = _1639 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = _1639 * 6.283185482025146484375;
        float _1655 = sin(_1653);
        float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1659 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1657;
        float _1661 = _1649 * _1651;
        float _1663 = 1.0 / _1659;
        float _1665 = 1.0 / _1661;
        float _1667 = _1655 * _1665;
        float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1671 = fma(_1625, _1667, _1669);
        float _1673 = _1671 * _1663;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        _1563 = _1675;
    }
    float _1677 = _1563;
    if (!_1449)
    {
        float _1679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = _1679 * 0.15915493667125701904296875;
        float _1683 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1685 = _1681 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1683 * 0.15915493667125701904296875;
        float _1691 = _1681 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = 1.0 / _1687;
        float _1697 = _1689 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = _1689 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = 1.0 / _1707;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1713 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1711;
        float _1715 = 1.0 / _1713;
        float _1717 = _1705 * _1709;
        float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1721 = fma(_1625, _1717, _1719);
        float _1723 = _1721 * _1715;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        float _1727 = -_1725;
        float _1729 = _1727 + 1.0;
        _1627 = _1729;
    }
    float _1731 = _1627;
    float _1733 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1735 = _1615 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1739 = _1617 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1743 = _1619 + _1741;
    float _1745 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1747 = _1735 * _1735;
    float _1749 = fma(_1387, 6.2500002968590706586837768554688e-05, 0.5);
    float _1751 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1745);
    float _1753 = fma(_1739, _1739, _1747);
    float _1755 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1751);
    float _1757 = fma(_1743, _1743, _1753);
    float _1759 = rsqrt(_1757);
    float _1761 = sqrt(_1757);
    float _1763 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1765 = _1739 * _1763;
    float _1767 = _1743 * _1763;
    float _1769 = _1765 * _1765;
    float _1771 = _1767 * _1767;
    float _1773 = _1769 + _1771;
    float _1775 = sqrt(_1773);
    bool _1777 = _1775 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1781 = _1775 + _1779;
    float _1783 = _1743;
    float _1785 = _1773;
    float _1787 = _1781;
    float _1789 = _1747;
    float _1791 = _1735;
    if (_1777)
    {
        float _1793 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1783 = _1793;
    }
    float _1795 = _1783;
    if (_1777)
    {
        float _1797 = rsqrt(_1773);
        _1785 = _1797;
    }
    float _1799 = _1785;
    float _1801 = _1799;
    if (_1777)
    {
        float _1803 = _1781 * _1795;
        _1787 = _1803;
    }
    float _1805 = _1787;
    if (_1777)
    {
        float _1807 = _1805 * 0.15915493667125701904296875;
        _1789 = _1807;
    }
    float _1809 = _1789;
    float _1811 = _1795;
    float _1813 = _1809;
    if (_1777)
    {
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = precise::max(0.0, _1821);
    float _1825 = _1759;
    float _1827 = _1823;
    if (_1777)
    {
        float _1829 = _1809 * 6.283185482025146484375;
        float _1831 = cos(_1829);
        _1825 = _1831;
    }
    float _1833 = _1825;
    float _1835 = -_1763;
    float _1837 = -_1823;
    float _1839 = fma(_1735, _1835, _1837);
    float _1841 = _1839;
    if (_1777)
    {
        float _1843 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1843;
    }
    float _1845 = _1827;
    if (!_1777)
    {
        _1813 = _1769;
    }
    float _1847 = _1813;
    float _1849 = _1819;
    float _1851 = _1847;
    if (_1777)
    {
        float _1853 = fma(_1819, _1845, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1853;
    }
    float _1855 = _1849;
    float _1857 = _1855;
    float _1859 = _1833;
    if (_1777)
    {
        float _1861 = _1833 + (-1.0);
        _1791 = _1861;
    }
    float _1863 = _1791;
    float _1865 = _1863;
    if (_1777)
    {
        float _1867 = _1799 * _1855;
        _1475 = _1867;
    }
    float _1869 = _1475;
    if (!_1777)
    {
        _1857 = _1765;
    }
    float _1871 = _1857;
    float _1873 = _1871;
    if (_1777)
    {
        float _1875 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1777)
    {
        float _1879 = _1765 * _1869;
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1777)
    {
        _1801 = _1767;
    }
    float _1883 = _1801;
    float _1885 = _1883;
    if (_1777)
    {
        float _1887 = _1767 * _1869;
        _1885 = _1887;
    }
    float _1889 = _1885;
    if (_1777)
    {
        float _1891 = fma(_1839, _1833, _1877);
        _1841 = _1891;
    }
    float _1893 = _1841;
    if (_1777)
    {
        float _1895 = _1881 * _1881;
        _1851 = _1895;
    }
    float _1897 = _1851;
    if (!_1777)
    {
        _1859 = _1771;
    }
    float _1899 = _1859;
    float _1901 = _1899;
    if (_1777)
    {
        float _1903 = _1889 * _1889;
        _1901 = _1903;
    }
    float _1905 = _1901;
    float _1907 = fma(_1893, _1893, _1897);
    float _1909 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1911 = _1907 + _1905;
    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1915 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1913);
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1909);
    float _1921 = rsqrt(_1911);
    float _1923 = -_1917;
    float _1925 = _1923 + 1.0;
    float _1927 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1919);
    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1935 = fma(_1313, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1937 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1929);
    float _1939 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1943 = abs(_1925);
    float _1945 = log2(_1943);
    float _1947 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1937);
    float _1949 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1939);
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1953 = _1921 * _1881;
    float _1955 = _1921 * _1893;
    float _1957 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1949);
    float _1959 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1963 = -_1951;
    float _1965 = fma(_1963, _1933, 1.0);
    float _1967 = floor(_1935);
    float _1969 = _1921 * _1889;
    float _1971 = -_1961;
    float _1973 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1971);
    float _1975 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1977 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1979 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1981 = -_1969;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1973);
    float _1985 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1987 = floor(_1927);
    float _1989 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1977);
    float _1991 = fma(_1983, -0.5, 0.5);
    float _1993 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _1995 = exp2(_1979);
    float _1997 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1993);
    float _1999 = -_1967;
    float _2001 = _1935 + _1999;
    float _2003 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2005 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2003);
    float _2007 = log2(_1965);
    float _2009 = -_1987;
    float _2011 = _1927 + _2009;
    float _2013 = _1955 + 1.0;
    float _2015 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2017 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2015);
    float _2019 = sqrt(_1991);
    float _2021 = fma(_1983, 0.5, 0.5);
    float _2023 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2025 = -_1955;
    float _2027 = fma(_1995, _2013, _2025);
    float _2029 = fma(_2021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2031 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2023);
    float _2033 = fma(_2027, 0.5, 0.5);
    float _2035 = 1.0 / _1997;
    float _2037 = fma(_2021, _2029, -0.212114393711090087890625);
    float _2039 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2031);
    float _2041 = _2007 * 0.693147182464599609375;
    float _2043 = fma(_2021, _2037, 1.570728778839111328125);
    float _2045 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2039);
    float _2047 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2049 = _2019 * 0.636619746685028076171875;
    float _2051 = fma(_1385, 6.2500002968590706586837768554688e-05, 0.5);
    float _2053 = -_2043;
    float _2055 = fma(_2049, _2053, 1.0);
    float _2057 = _2017 * _2035;
    float _2059 = _2045 * _2035;
    float _2061 = fma(_2057, 0.5, 0.5);
    float _2063 = fma(_2059, -0.5, 0.5);
    float2 _6536 = float2(_2001, _2011);
    float _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6536, float2(0.0), isnan(_6536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6536, float2(0.0), isnan(_6536)), level(0.0)).x;
    float3 _6547 = float3(_2061, _2063, _2047);
    float _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6547, float3(0.0), isnan(_6547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6547, float3(0.0), isnan(_6547)), level(0.0)).x;
    float3 _6558 = float3(_2061, _2063, _2047);
    float4 _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6558, float3(0.0), isnan(_6558)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6558, float3(0.0), isnan(_6558)), level(0.0)).xyzw;
    float _2072 = _2070.x;
    float _2074 = _2070.y;
    float _2076 = _2070.z;
    float _2078 = _2070.w;
    float2 _6574 = float2(_2055, _2033);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6574, float2(0.0), isnan(_6574)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6574, float2(0.0), isnan(_6574)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float2 _6588 = float2(_2051, _1749);
    float3 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = float(uint(_925));
    float _2100 = trunc(_1037);
    int _2102 = int(_2100);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2106 = _2104 != 0;
    float _2108 = _1033 * _173;
    bool _2110 = _163 > 0.5;
    float _2112 = -_989;
    float _2114 = _2112 + 1.0;
    bool _2116 = _755 > 0.5;
    float _2118 = -_921;
    float _2120 = _2118 + 1.0;
    int _2122 = abs(_859);
    float _2124 = 1.0 / _2098;
    out.m_80.x = _1313;
    out.m_80.y = _1287;
    out.m_80.z = _1277;
    int _2126 = ~_925;
    int _2128 = _2126 + 1;
    float _2130 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2136 = trunc(_2108);
    int _2138 = int(_2136);
    float _2140 = float(uint(_2102));
    out.m_82.w = _1091;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2144 = _2142 != 0;
    float _2146 = float(_2102);
    float _2148 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = 1.0 / _2134;
    int _2152 = as_type<int>(_2124) + (-2);
    float _2154 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    bool _2156 = _2146 >= _1023;
    bool _2158 = isnan(_2146);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(_1023);
    bool _2164 = _2160 || _2162;
    float _2166 = float(_2164);
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2170 = _2168 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2172 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2174 = isnan(_741);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    float _2184 = as_type<float>(_2152) * _2140;
    bool _2186 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2188 = isnan(_741);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2194 = _2190 || _2192;
    float _2196 = float(_2194);
    float _2198 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2200 = trunc(_2166);
    int _2202 = int(_2200);
    out.m_84.x = _1205;
    out.m_86.x = _1617;
    out.m_86.y = _1615;
    out.m_86.z = _1619;
    float _2204 = trunc(_2184);
    float _2206 = precise::max(_2204, 0.0);
    uint _2209 = uint(_2206);
    float _2211 = 1.0 / _2170;
    int _2213 = ~_925;
    int _2215 = _2213 + 1;
    int _2217 = ~_2202;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    int _2223 = _2128 * int(_2209);
    int _2225 = _2223 + _2102;
    float _2227 = exp2(_2130);
    float _2229 = float(uint(_2225));
    float _2231 = as_type<float>(_2152) * _2229;
    bool _2233 = !_2144;
    float _2235 = _2233 ? 7.345489978790283203125 : 1.0;
    float _2237 = trunc(_2231);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = -_2227;
    float _2245 = _2243 + 1.0;
    float _2247 = _2235 * _163;
    float _2249 = floor(_2247);
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2257 = _2255 != 0;
    int _2259 = int(_2209) + int(_2241);
    float _2261 = 1.0 / _2253;
    int _2263 = _2215 * _2259;
    int _2265 = _2263 + _2102;
    float _2267 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2271 = -_2249;
    float _2273 = _2247 + _2271;
    bool _2275 = !_2257;
    int _2277 = _2275 ? 0 : 1;
    bool _2279 = uint(_2265) >= uint(_925);
    float _2281 = _2273 * _1023;
    float _2283 = 1.0 / _2269;
    bool _2285 = !_2279;
    int _2287 = _2285 ? 0 : (-1);
    bool _2289 = _925 == 0;
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2291;
    int _2295 = ~_2259;
    int _2297 = _2295 + _2287;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2277);
    float _2303 = trunc(_2281);
    int _2305 = int(_2303);
    float _2307 = _2293 * _2211;
    int _2309 = _925 * _2299;
    int _2311 = _2309 + _2102;
    int _2313 = _925 + (-1);
    bool _2315 = !_2289;
    int _2317 = _2315 ? _2311 : (-1);
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2321 = _2319 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2325 = _2323 != 0;
    int _2327 = _2317 * _2221;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2333 = 1.0 / _2321;
    int _2335 = _2202 * _2313;
    int _2337 = _2335 + _2327;
    float _2339 = _2331 * _2261;
    int _2341 = abs(_865);
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2345 = _2343 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2347 = _2305 * _2301;
    int _2349 = _2347 + _2102;
    int _2351 = _2337 * _2341;
    int _2353 = abs(_929);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2361 = _741 + _2359;
    int _2363 = _2138 * _2122;
    int _2365 = _2363 + _2351;
    bool _2367 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2369 = isnan(_741);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = _2357 * _2333;
    bool _2381 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2383 = isnan(_741);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2389 = _2385 || _2387;
    float _2391 = float(_2389);
    int _2393 = _2349 * _2353;
    int _2395 = _2393 + _2365;
    bool _2397 = !_2106;
    int _2399 = _2397 ? 0 : 1;
    float _2401 = -_2377;
    float _2403 = _2401 + 1.0;
    float _2405 = fma(_2307, _2361, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2407 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2409 = isnan(_741);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2415 = _2411 || _2413;
    float _2417 = float(_2415);
    float _2419 = 1.0 / _2345;
    int _2421 = abs(_2399);
    float _2423 = _2391 * _2403;
    float _2425 = -_2391;
    float _2427 = _2425 + 1.0;
    bool _2429 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2431 = isnan(_741);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = -_2417;
    float _2443 = _2441 + 1.0;
    float _2445 = _2417 * _2427;
    bool _2447 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2449 = isnan(_741);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2465 = _2463 != 0;
    int _2467 = _2305 * _2421;
    int _2469 = _2467 + _2395;
    float _2471 = _2439 * _2443;
    float _2473 = -_2439;
    float _2475 = _2473 + 1.0;
    bool _2477 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2479 = isnan(_741);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2485 = _2481 || _2483;
    float _2487 = float(_2485);
    float _2489 = float(uint(_2469));
    float _2491 = _2457 * _2475;
    float _2493 = -_2457;
    float _2495 = _2493 + 1.0;
    float _2497 = -_2487;
    float _2499 = _2497 + 1.0;
    float _2501 = as_type<float>(_2152) * _2489;
    float _2503 = _2487 * _2495;
    float _2505 = _2182 * _2499;
    float _2507 = -_2182;
    float _2509 = _2507 + 1.0;
    float _2511 = trunc(_2501);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    int _2517 = ~_925;
    int _2519 = _2517 + 1;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2521;
    float _2525 = _2461 * _2419;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2531 = _2523 * _2150;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2535 = _741 + _2533;
    float _2537 = float(uint(_2349));
    float _2539 = _2196 * _2509;
    float _2541 = -_2196;
    float _2543 = _2541 + 1.0;
    float _2545 = fma(_2339, _2535, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2547 = _2529 * _2283;
    float _2549 = _2405 * _2539;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2553 = _741 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2559 = _2519 * int(_2515);
    int _2561 = _2559 + _2469;
    float _2563 = fma(_2543, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2549);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2567 = _741 + _2565;
    float _2569 = fma(_2547, _2553, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2571 = float(uint(_2561));
    float _2573 = fma(_2379, _2567, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2575 = fma(_2545, _2505, _2563);
    float _2577 = as_type<float>(_2152) * _2537;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2581 = _741 + _2579;
    float _2583 = as_type<float>(_2152) * _2571;
    float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2587 = _741 + _2585;
    float _2589 = fma(_2573, _2503, _2575);
    float _2591 = -_235;
    int _2593 = _2116 ? as_type<int>(_2591) : as_type<int>(_235);
    float _2595 = trunc(_2577);
    float _2597 = precise::max(_2595, 0.0);
    uint _2599 = uint(_2597);
    float _2601 = fma(_2525, _2587, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2605 = _741 + _2603;
    float _2607 = -_243;
    int _2609 = _2110 ? as_type<int>(_2607) : as_type<int>(_243);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2611;
    int _2615 = ~_925;
    int _2617 = _2615 + 1;
    float _2619 = fma(_2601, _2491, _2589);
    float _2621 = fma(_2531, _2605, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2623 = trunc(_2583);
    float _2625 = precise::max(_2623, 0.0);
    uint _2627 = uint(_2625);
    int _2629 = ~_925;
    int _2631 = _2629 + 1;
    float _2633 = fma(_2621, _2471, _2619);
    float _2635 = fma(_2569, _2445, _2633);
    float _2637 = 1.0 / _2557;
    int _2639 = int(_2515) + int(_2627);
    bool _2641 = !_2465;
    float _2643 = _2641 ? _243 : as_type<float>(_2609);
    bool _2645 = !_2325;
    float _2647 = _2645 ? _235 : as_type<float>(_2593);
    float _2649 = _235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2651 = _2643 + 0.5;
    int _2653 = _2631 * int(_2599);
    int _2655 = _2653 + _2349;
    float _2657 = _2613 * _2637;
    float _2659 = _2647 + (-0.5);
    int _2661 = _2617 * _2639;
    int _2663 = _2661 + _2469;
    float _2665 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1005);
    float _2667 = float(uint(_2655));
    float _2669 = fma(_2657, _2581, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2671 = -_2659;
    float _2673 = -_1009;
    float _2675 = fma(_2671, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2673);
    bool _2677 = uint(_2663) >= uint(_925);
    float _2679 = -_2114;
    float _2681 = fma(_2643, _2679, _2665);
    float _2683 = as_type<float>(_2152) * _2667;
    float _2685 = fma(_2669, _2423, _2635);
    bool _2687 = !_2677;
    int _2689 = _2687 ? 0 : (-1);
    float _2691 = fma(_2647, _2120, _2675);
    float _2693 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2695 = ~_925;
    int _2697 = _2695 + 1;
    float _2699 = trunc(_2683);
    float _2701 = precise::max(_2699, 0.0);
    uint _2703 = uint(_2701);
    int _2705 = ~_2639;
    int _2707 = _2705 + _2689;
    int _2709 = _2707 + 1;
    out.m_88.x = _2681;
    out.m_88.y = _2691;
    float _2711 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2713 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2715 = fma(_2377, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2685);
    int _2717 = _925 * _2709;
    int _2719 = _2717 + _2469;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2723 = _2721 != 0;
    out.m_90.x = _2715;
    bool _2725 = !_2289;
    int _2727 = _2725 ? _2719 : (-1);
    float _2729 = -_1209;
    float _2731 = fma(_2729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2711);
    int _2733 = _2727 >> 31;
    int _2735 = int(_2599) + int(_2703);
    int _2737 = _2733 & 3;
    float _2739 = -_1209;
    float _2741 = fma(_2739, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2693);
    float _2743 = -_1209;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2713);
    int _2747 = _2697 * _2735;
    int _2749 = _2747 + _2349;
    int _2751 = _2727 + _2737;
    float _2753 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2755 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2741);
    float _2757 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2745);
    int _2759 = _2751 >> 2;
    float _2761 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    bool _2763 = uint(_2749) >= uint(_925);
    float _2765 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2731);
    int _2767 = _2759 << 4;
    int _2769 = _2767 + 368;
    float _2771 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2753);
    float _2773 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2775 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2777 = uint(int(uint(_2769) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    float _2793 = _2649 * _2755;
    int _2795 = _2727 & 3;
    bool _2797 = _2795 != 0;
    float _2799 = _2649 * _2765;
    int _2801 = _2727 & 3;
    bool _2803 = _2801 != 0;
    float _2805 = _2649 * _2757;
    float _2807 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2154);
    float _2809 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2811 = _2769 + 8;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    bool _2829 = uint(_2795) > 1u;
    float _2831 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2773);
    float _2833 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2809);
    float _2835 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2837 = abs(_1625);
    float _2839 = log2(_2837);
    int _2841 = _2803 ? 0 : 1;
    float _2843 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2771);
    bool _2845 = !_2763;
    int _2847 = _2845 ? 0 : (-1);
    float _2849 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    int _2851 = ~_2841;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    float _2857 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2831);
    bool _2859 = uint(_2795) >= 2u;
    float _2861 = fma(_2835, _2849, _2805);
    int _2863 = _2855;
    float _2865 = _2017;
    if (!_2829)
    {
        int _2867 = ~_2841;
        int _2869 = _2867 + 1;
        _2863 = _2869;
    }
    int _2871 = _2863;
    float _2873 = fma(_2835, _2807, _2793);
    bool _2875 = _2795 != 3;
    float _2877 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2761);
    int _2879 = ~_2735;
    int _2881 = _2879 + _2847;
    int _2883 = _2881 + 1;
    float _2885 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2775);
    int _2887 = _2859 ? 0 : 1;
    float _2889 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2891 = abs(_2871);
    int _2893 = _925 * _2883;
    int _2895 = _2893 + _2349;
    float _2897 = fma(_2835, _2843, _2799);
    bool _2899 = !_2797;
    int _2901 = _2899 ? 0 : 1;
    float _2903 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2885);
    int _2905 = ~_2887;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = exp2(_2889);
    bool _2913 = _2795 != 3;
    float _2915 = _2877 + _2897;
    int _2917 = _2909;
    if (_2875)
    {
        int _2919 = ~_2887;
        int _2921 = _2919 + 1;
        _2917 = _2921;
    }
    int _2923 = _2917;
    float _2925 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2927 = ~_2891;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    float _2933 = _2857 + _2873;
    int _2935 = abs(_2901);
    float _2937 = _2903 + _2861;
    bool _2939 = !_2913;
    int _2941 = _2939 ? 0 : (-1);
    float _2943 = -_2065;
    float _2945 = _2943 + 1.0;
    int _2947 = abs(_2923);
    int _2949 = _2931 * as_type<int>(_2791);
    int _2951 = ~_2935;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    out.m_92.x = _2092;
    out.m_92.y = _2094;
    out.m_92.z = _2096;
    bool _2957 = !_2723;
    int _2959 = _2957 ? 0 : 1;
    int _2961 = abs(_2941);
    int _2963 = _2955 * as_type<int>(_2783);
    int _2965 = _2963 + _2949;
    out.m_94.x = _2933;
    out.m_94.y = _2915;
    out.m_94.z = _2937;
    int _2967 = abs(_2959);
    int _2969 = ~_2947;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    float _2975 = fma(_2911, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2981 = ~_2961;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2973 * as_type<int>(_2819);
    int _2989 = _2987 + _2965;
    int _2991 = ~_2967;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    float _2997 = fma(_2977, -2.0, 3.0);
    float _2999 = _2977 * _2977;
    int _3001 = _2985 * as_type<int>(_2827);
    int _3003 = _3001 + _2989;
    float _3005 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2979);
    bool _3007 = !_2289;
    int _3009 = _3007 ? _2895 : (-1);
    float _3011 = _2999 * _2997;
    int _3013 = _3003 * _2995;
    float _3015 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3005);
    float _3017 = in.m_96.x;
    float _3019 = -_3011;
    float _3021 = _3019 + 1.0;
    int _3023 = _3009 * _2967;
    int _3025 = _3023 + _3013;
    float _3027 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3015);
    bool _3029 = _1625 <= 8000.0;
    bool _3031 = isnan(_1625);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan(8000.0);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = fma(_3021, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3011);
    float _3043 = _1997 * 0.5;
    float _3045 = float(_3025);
    float _3047 = _3027 + _1997;
    float _3049 = _2017 + _1997;
    float _3051 = fma(_2045, -0.5, _3043);
    float _3053 = _3047 * 0.5;
    float _3055 = _3049 * 0.5;
    float _3057 = _3039 * _3041;
    out.m_98.x = _3045;
    float _3059 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_100.x = _3055;
    out.m_100.y = _3051;
    out.m_100.z = _3053;
    out.m_100.w = _1997;
    bool _3061 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3063 = isnan(_1761);
    bool _3065 = _3061 || _3063;
    bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3069 = _3065 || _3067;
    float _3071 = _2945 * _3059;
    float _3073 = precise::clamp(_3071, 0.0, 1.0);
    float _3075 = in.m_96.z;
    float _3077 = -_3073;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _2017;
    out.gl_Position.y = _2045;
    out.gl_Position.z = _3027;
    out.gl_Position.w = _1997;
    float _3081 = _3079 * _3017;
    float _3083 = _2925 * _2067;
    float _3085 = -_2925;
    float _3087 = _3085 + 1.0;
    float _3089 = _3053;
    float _3091 = _3081;
    if (!_3069)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _3089;
    float _3095 = _2078 * _3083;
    float _3097 = _2088 * _3083;
    float _3099 = _2078 * _3087;
    float _3101 = _1677 * _1731;
    float _3103 = fma(_2084, _3095, _2072);
    float _3105 = fma(_2086, _3095, _2074);
    float _3107 = fma(_2078, _3097, _2076);
    float _3109 = _3081 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3111 = _3101 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3113 = _3111;
    float _3115 = _3109;
    float _3117 = _3093;
    float _3119 = _3093;
    if (!_3069)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3121 = _3091;
    out.m_102.x = _3103;
    out.m_102.y = _3105;
    out.m_102.z = _3107;
    out.m_102.w = _3099;
    float _3123 = _3111 * _3075;
    float _3125 = _3075;
    float _3127 = _3121;
    float _3129 = _3121;
    if (!_3069)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3131 = _2865;
    out.m_104.x = _3109;
    float _3133 = _3131;
    float _3135 = _3131;
    if (!_3069)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3137 = _3125;
    float _3139 = _3137;
    float _3141 = _3137;
    if (!_3069)
    {
        _3113 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3143 = _3113;
    float _3145 = _3143;
    float _3147 = _3143;
    if (!_3069)
    {
        _3115 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3149 = _3115;
    bool _3151 = !_3069;
    float _3153 = _3149;
    float _3155 = _3149;
    if (!_3151)
    {
        bool _3157 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3159 = isnan(_1761);
        bool _3161 = _3157 || _3159;
        bool _3163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3165 = _3161 || _3163;
        if (!_3165)
        {
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3169 = _1761 + _3167;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3173 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3171;
            float _3175 = 1.0 / _3173;
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3197 = _3169 * _3175;
            float _3199 = precise::clamp(_3197, 0.0, 1.0);
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3205 = fma(_3199, _3179, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3207 = fma(_3199, _3203, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3209 = fma(_3199, _3183, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3211 = fma(_3199, _3187, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3213 = fma(_3199, _3191, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3215 = fma(_3199, _3195, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3135 = _3207;
            _3155 = _3213;
            _3129 = _3205;
            _3119 = _3211;
            _3141 = _3209;
            _3147 = _3215;
            _3217 = true;
        }
        else
        {
            bool _3219 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3221 = isnan(_1761);
            bool _3223 = _3219 || _3221;
            bool _3225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3227 = _3223 || _3225;
            if (!_3227)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3229 = _3127;
            _3129 = _3229;
            if (!_3227)
            {
                _3133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3231 = _3133;
            _3135 = _3231;
            if (!_3227)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3233 = _3139;
            _3141 = _3233;
            if (!_3227)
            {
                _3117 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3235 = _3117;
            _3119 = _3235;
            if (!_3227)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3237 = _3153;
            _3155 = _3237;
            if (!_3227)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3239 = _3145;
            bool _3241 = !_3227;
            _3147 = _3239;
            if (!_3241)
            {
                bool _3243 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3245 = isnan(_1761);
                bool _3247 = _3243 || _3245;
                bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3251 = _3247 || _3249;
                if (!_3251)
                {
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3255 = _1761 + _3253;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3259 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3257;
                    float _3261 = 1.0 / _3259;
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3283 = _3255 * _3261;
                    float _3285 = precise::clamp(_3283, 0.0, 1.0);
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3291 = fma(_3285, _3265, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3293 = fma(_3285, _3289, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3295 = fma(_3285, _3269, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3297 = fma(_3285, _3273, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3299 = fma(_3285, _3277, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3301 = fma(_3285, _3281, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3135 = _3293;
                    _3155 = _3299;
                    _3129 = _3291;
                    _3119 = _3297;
                    _3141 = _3295;
                    _3147 = _3301;
                    _3217 = true;
                }
                else
                {
                    _3135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3119 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3217 = false;
    float _3303 = _3135;
    float _3305 = _3155;
    float _3307 = _3129;
    float _3309 = _3119;
    float _3311 = _3141;
    float _3313 = _3147;
    float _3315 = fma(_2915, -0.5, 0.5);
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = -_3303;
    float _3321 = _3319 + _3305;
    float _3323 = _3123 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3325 = -_3307;
    float _3327 = _3325 + _3309;
    float _3329 = fma(_3317, _3321, _3303);
    out.m_106.x = 0.0;
    float _3331 = -_3311;
    float _3333 = _3331 + _3313;
    float _3335 = fma(_3317, _3327, _3307);
    float _3337 = _3329 * 0.586610972881317138671875;
    out.m_55.x = _3323;
    bool _3339 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3341 = fma(_3317, _3333, _3311);
    float _3343 = fma(_3335, 0.298911988735198974609375, _3337);
    bool _3345 = _1677 > 0.0;
    bool _3347 = isnan(_1677);
    bool _3349 = _3345 || _3347;
    bool _3351 = isnan(0.0);
    bool _3353 = _3349 || _3351;
    float _3355 = fma(_3341, 0.114477999508380889892578125, _3343);
    bool _3357 = _1731 <= 0.0;
    bool _3359 = !_3353;
    bool _3361 = _3357 || _3359;
    float _3363 = -_3355;
    float _3365 = _3335 + _3363;
    float _3367 = -_3355;
    float _3369 = _3329 + _3367;
    float _3371 = -_3355;
    float _3373 = _3341 + _3371;
    float _3375 = fma(_3365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    float _3377 = fma(_3369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    float _3379 = fma(_3373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    bool _3381 = !_3339;
    if (!_3381)
    {
        float _3383 = -_1615;
        float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3387 = -_1617;
        float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3391 = -_1619;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3395 = _3385 * _3385;
        float _3397 = fma(_3389, _3389, _3395);
        float _3399 = fma(_3393, _3393, _3397);
        float _3401 = sqrt(_3399);
        float _3403 = rsqrt(_3399);
        float _3405 = -_3401;
        float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3409 = _3407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = _3389 * _3403;
        float _3415 = _3385 * _3403;
        float _3417 = abs(_3411);
        float _3419 = log2(_3417);
        float _3421 = _3393 * _3403;
        float _3423 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3425 = _2915 * _3415;
        float _3427 = -_3415;
        float _3429 = -_3423;
        float _3431 = fma(_3427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3429);
        float _3433 = fma(_2933, _3413, _3425);
        float _3435 = -_3421;
        float _3437 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3431);
        float _3439 = fma(_2937, _3421, _3433);
        float _3441 = precise::clamp(_3439, 0.0, 1.0);
        float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3445 = _3437 + _3443;
        float _3447 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3449 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3451 = precise::clamp(_3449, 0.0, 1.0);
        float _3453 = exp2(_3447);
        float _3455 = _3453 * _3451;
        float _3457 = _3441 * _3455;
        float _3459 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3461 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3463 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3459;
        out.m_106.y = _3461;
        out.m_106.z = _3463;
    }
    out.m_82.x = _3375;
    out.m_82.y = _3377;
    out.m_82.z = _3379;
    if (!_3361)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3465;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3217 = false;
    bool _519 = false;
    bool _413 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_48.w;
    float _122 = in.m_50.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_55.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3533 = as_type<float>(_149);
        out.gl_Position.z = _3533;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_57.x;
    float _165 = float(_127);
    bool _167 = _131 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _139;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _131 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _151 = as_type<int>(_181);
    }
    int _183 = _151;
    out.m_59.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3598 = as_type<float>(_183);
        out.gl_Position.z = _3598;
    }
    out.m_53.x = _177;
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    float _205 = in.m_70.x;
    float _207 = in.m_70.y;
    float _209 = in.m_70.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _189 * _195;
    float _223 = _189 * _201;
    float _225 = fma(_187, _193, _221);
    float _227 = _189 * _207;
    float _229 = fma(_187, _199, _223);
    float _231 = fma(_191, _197, _225);
    bool _233 = !_217;
    float _235 = _233 ? (-0.5) : 0.5;
    float _237 = fma(_187, _205, _227);
    float _239 = fma(_191, _203, _229);
    bool _241 = !_213;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = fma(_191, _209, _237);
    bool _247 = !_219;
    float _263;
    if (!_247)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        _263 = _177;
    }
    _265 = false;
    float _267 = _263;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _267 + _285;
    bool _289 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_267);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_283;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _329;
    float _333 = -_299;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _339 = 1.0 / _303;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _287 * _313;
    float _347 = _325 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = -_325;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_351, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _271 * _339;
    float _365 = fma(_359, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = in.m_72.x;
    float _369 = in.m_72.y;
    float _371 = fma(_331, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_343, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _371 * _347;
    float _377 = _373 * _347;
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _381 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _383 = fma(_361, _327, _379);
    float _385 = fma(_365, _327, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    float _391 = _387 * _367;
    float _393 = _389 * _369;
    bool _395 = !_337;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        _411 = _177;
    }
    _413 = false;
    float _415 = _411;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = _415 + _417;
    bool _421 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _423 = isnan(_415);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _433;
    bool _437 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _439 = isnan(_415);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -_431;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _453;
    float _457 = 1.0 / _435;
    bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _461 = _419 * _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _463;
    float _467 = _447 * _451;
    float _469 = fma(_455, _461, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _471 = -_447;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = fma(_465, _461, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _481 = _469 * _467;
    float _483 = fma(_477, _461, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _485 = _479 * _467;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _489 = _483 * _467;
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _493 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].x, _487);
    float _495 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].z, _491);
    float _499 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    bool _501 = !_459;
    float _517;
    if (!_501)
    {
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _505 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _177;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _537 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = isnan(_521);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _549;
    float _553 = 1.0 / _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = isnan(_521);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _577 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _579 = isnan(_521);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _591 = 1.0 / _535;
    float _593 = -_569;
    float _595 = _593 + 1.0;
    bool _597 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _599 = _547 * _595;
    float _601 = _551 * _553;
    bool _603 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_521);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_547;
    float _617 = _615 + 1.0;
    float _619 = 1.0 / _557;
    float _621 = fma(_601, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _623;
    float _627 = _613 * _617;
    float _629 = -_613;
    float _631 = _629 + 1.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = 1.0 / _575;
    float _639 = _587 * _631;
    float _641 = _635 * _591;
    float _643 = -_587;
    float _645 = _643 + 1.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = _521 + _647;
    float _651 = _621 * _639;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = _521 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _661 = _625 * _619;
    bool _663 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _665 = isnan(_521);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_641, _655, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _677 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[115].x, _651);
    float _679 = fma(_661, _649, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _521 + _681;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = fma(_675, _627, _677);
    float _691 = _659 * _637;
    float _693 = _569 * _687;
    float _695 = fma(_679, _599, _689);
    float _697 = fma(_691, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = fma(_697, _693, _695);
    float _703 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[119].x, _701);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _713 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _717 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _717;
    out.m_74.y = _719;
    out.m_74.z = _721;
    out.m_74.w = _715;
    out.m_76.x = _713;
    out.m_76.y = _703;
    out.m_76.z = _707;
    out.m_76.w = _723;
    bool _725 = !_597;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _179 = _739;
    }
    float _741 = _179;
    float _743 = in.m_48.x;
    float _745 = in.m_48.y;
    float _747 = in.m_48.z;
    float _749 = _163 * 2.0;
    float _751 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _753 = log2(_751);
    float _755 = in.m_57.y;
    float _757 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _761 = in.m_57.z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _765 = floor(_749);
    float _767 = in.m_68.w;
    float _769 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _771 = in.m_70.w;
    float _773 = _753 * _131;
    float _775 = _207 * _745;
    float _777 = _195 * _745;
    float _779 = _201 * _745;
    bool _781 = _765 > 0.0;
    float _783 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _785 = fma(_193, _743, _777);
    bool _787 = _765 >= 0.0;
    bool _789 = isnan(_765);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = fma(_199, _743, _779);
    float _799 = fma(_783, -2.0, _759);
    float _801 = _761 * 2.0;
    float _803 = fma(_205, _743, _775);
    float _805 = in.m_66.w;
    float _807 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _809 = _755 * 2.0;
    float _811 = exp2(_773);
    float _813 = fma(_197, _747, _785);
    float _815 = -_763;
    float _817 = fma(_807, 2.0, _815);
    float _819 = _163 + _755;
    float _821 = fma(_203, _747, _797);
    float _823 = _755 + _761;
    float _825 = _819 + (-1.0);
    float _827 = floor(_801);
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _839 = _837 != 0;
    float _841 = _821 + _767;
    int _843 = _795 ? 0 : 1;
    float _845 = fma(_209, _747, _803);
    float _847 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _849 = _823 + (-1.0);
    float _851 = floor(_809);
    float _853 = -_811;
    float _855 = _853 + 1.0;
    bool _857 = !_831;
    int _859 = _857 ? 0 : 1;
    float _861 = _845 + _771;
    bool _863 = !_835;
    int _865 = _863 ? 0 : 1;
    float _867 = _813 + _805;
    bool _869 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    bool _883 = _827 > 0.0;
    float _885 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _887 = _827 >= 0.0;
    bool _889 = isnan(_827);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _901 = _841 + _899;
    int _903 = _895 ? 0 : 1;
    float _905 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _897);
    bool _907 = _851 > 0.0;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _911 = _851 >= 0.0;
    bool _913 = isnan(_851);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    float _921 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _905);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _925 = int(_923);
    bool _927 = !_839;
    int _929 = _927 ? 0 : 1;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _867 + _931;
    int _935 = ~_903;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    float _941 = _901 * _901;
    float _943 = _877 ? _855 : 0.0;
    float _945 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _909);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _961 = _861 + _959;
    int _963 = _939;
    if (!_883)
    {
        int _965 = ~_903;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_933, _933, _941);
    bool _973 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(1.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _985 = 1.0 + _983;
    float _987 = float(_881);
    float _989 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _945);
    bool _991 = !_949;
    int _993 = _991 ? 0 : 1;
    float _995 = fma(_961, _961, _971);
    float _997 = 1.0 / _987;
    bool _999 = !_953;
    int _1001 = _999 ? 0 : 1;
    float _1003 = -_131;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[76].x, _817);
    int _1007 = abs(_993);
    float _1009 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _799);
    int _1011 = abs(_1001);
    float _1013 = float(_1007);
    float _1015 = 1.0 / _985;
    float _1017 = in.m_78.x;
    float _1019 = in.m_78.y;
    float _1021 = in.m_78.z;
    float _1023 = float(_925);
    float _1025 = float(_969);
    int _1027 = ~_843;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = _1023 * _131;
    float _1035 = sqrt(_995);
    float _1037 = _997 * _131;
    float _1039 = _1013 * _1025;
    int _1041 = _919 ? 0 : 1;
    int _1043 = _1031;
    if (!_781)
    {
        int _1045 = ~_843;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    float _1051 = _1039 * (-2.0);
    int _1053 = ~_1041;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    int _1059 = _1057;
    if (_981)
    {
        float _1061 = _943 * _1015;
        _141 = _1061;
    }
    float _1063 = _141;
    float _1065 = rsqrt(_995);
    float _1067 = float(_1049);
    float _1069 = _757 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1071 = float(_1011);
    float _1073 = fma(_847, _1051, _847);
    if (!_907)
    {
        int _1075 = ~_1041;
        int _1077 = _1075 + 1;
        _1059 = _1077;
    }
    int _1079 = _1059;
    float _1081 = _1035 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1083 = fma(_1051, _1017, _1017);
    float _1085 = _1071 * _1067;
    float _1087 = _163 + (-0.5);
    float _1089 = float(_1079);
    float _1091 = precise::min(_1069, _1081);
    float _1093 = _1085 * (-2.0);
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1083);
    bool _1097 = !_957;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = _1065 * _1091;
    float _1103 = fma(_1093, _1019, _1019);
    float _1105 = fma(_885, _1093, _885);
    int _1107 = abs(_1099);
    float _1109 = _901 * _1101;
    float _1111 = fma(_1073, _1063, _1095);
    float _1113 = _755 + (-0.5);
    float _1115 = float(_1107);
    float _1117 = _933 * _1101;
    float _1119 = -_1109;
    float _1121 = _901 + _1119;
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1103);
    float _1125 = _1111 * 0.15915493667125701904296875;
    float _1127 = -_1117;
    float _1129 = _933 + _1127;
    float _1131 = _1121 * _1121;
    float _1133 = _1115 * _1089;
    float _1135 = _163 + _761;
    float _1137 = _961 * _1101;
    float _1139 = fma(_1129, _1129, _1131);
    float _1141 = _1135 + (-1.0);
    float _1143 = _1133 * (-2.0);
    float _1145 = -_1137;
    float _1147 = _961 + _1145;
    float _1149 = _761 + (-0.5);
    float _1151 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1153 = fma(_1143, _1021, _1021);
    float _1155 = fma(_1147, _1147, _1139);
    float _1157 = fma(_1105, _1063, _1123);
    float _1159 = fma(_1151, _1143, _1151);
    float _1161 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1153);
    float _1163 = _1125 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = _1157 * 0.15915493667125701904296875;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _235);
    float _1171 = fma(_1159, _1063, _1161);
    float _1173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    float _1175 = _1171 * 0.15915493667125701904296875;
    float _1177 = sqrt(_1155);
    float _1179 = _1167 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1167 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = _1065 * _1177;
    float _1189 = _769 * _1187;
    float _1191 = _1125 * 6.283185482025146484375;
    float _1193 = sin(_1191);
    float _1195 = _1189 * _1169;
    float _1197 = _1165 * _1181;
    float _1199 = _1175 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = _1165 * _1185;
    float _1205 = _757 * _1187;
    float _1207 = _1175 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1193 * _1181;
    float _1213 = _1193 * _1185;
    float _1215 = _1165 * _1201;
    float _1217 = _1193 * _1201;
    float _1219 = _1185 * _1201;
    float _1221 = _1181 * _1201;
    float _1223 = _1205 * _1173;
    float _1225 = _1215 * _1195;
    float _1227 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1229 = _1227 * 0.5;
    float _1231 = fma(_1209, _1203, _1211);
    float _1233 = -_1213;
    float _1235 = fma(_1209, _1197, _1233);
    float _1237 = -_1195;
    float _1239 = _1209 * _1237;
    float _1241 = -_1197;
    float _1243 = fma(_1209, _1213, _1241);
    float _1245 = fma(_1231, _1223, _1225);
    float _1247 = _1217 * _1195;
    float _1249 = fma(_1219, _1223, _1239);
    float _1251 = fma(_1209, _1211, _1203);
    float _1253 = fma(_1235, _1229, _1245);
    float _1255 = fma(_1243, _1223, _1247);
    float _1257 = fma(_1221, _1229, _1249);
    float _1259 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1261 = fma(_1251, _1229, _1255);
    float _1263 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1265 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1259);
    float _1267 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1263);
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1265);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1267);
    float _1273 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1275 = -_1137;
    float _1277 = _861 + _1275;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1281 = _861 + _1273;
    float _1283 = _867 + _1279;
    float _1285 = -_1109;
    float _1287 = _841 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1291 = _1281 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1295 = _1283 + _1293;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1299 = _1291 * _1291;
    float _1301 = fma(_1295, _1295, _1299);
    float _1303 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1305 = sqrt(_1301);
    float _1307 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1303);
    float _1309 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1307);
    float _1311 = -_1117;
    float _1313 = _867 + _1311;
    float _1315 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1317 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1297);
    float _1319 = _841 + _1315;
    float _1321 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1317);
    bool _1323 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1309;
    float _1327 = _1317;
    float _1329 = _1315;
    float _1331 = _1319;
    if (!_1323)
    {
        _1325 = _1283;
    }
    float _1333 = _1325;
    float _1335 = _1333;
    if (!_1323)
    {
        _1327 = _1281;
    }
    float _1337 = _1327;
    float _1339 = _1337;
    if (!_1323)
    {
        _1329 = _1319;
    }
    float _1341 = _1329;
    bool _1343 = !_1323;
    float _1345 = _1341;
    if (!_1343)
    {
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1351 = _1305 + _1349;
        float _1353 = rsqrt(_1301);
        float _1355 = _1351 * _1347;
        float _1357 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = _1355 * 0.15915493667125701904296875;
        float _1361 = _1359 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = _1359 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1363 + (-1.0);
        float _1371 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1373 = fma(_1367, _1357, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1375 = fma(_1319, _1363, _1371);
        float _1377 = _1353 * _1373;
        float _1379 = fma(_1295, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1381 = fma(_1291, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1345 = _1375;
        _1335 = _1379;
        _1339 = _1381;
    }
    float _1383 = _1345;
    float _1385 = _1335;
    float _1387 = _1339;
    float _1389 = -_841;
    float _1391 = _1389 + _1383;
    float _1393 = -_867;
    float _1395 = _1393 + _1385;
    float _1397 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1399 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = _1391 * _1391;
    float _1403 = -_861;
    float _1405 = _1403 + _1387;
    float _1407 = 1.0 / _1397;
    float _1409 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1411 = fma(_1395, _1395, _1401);
    float _1413 = -_1109;
    float _1415 = _1413 + _1383;
    float _1417 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1419 = fma(_1405, _1405, _1411);
    float _1421 = -_1137;
    float _1423 = _1421 + _1387;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1427 = sqrt(_1419);
    bool _1429 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1431 = isnan(0.5);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1437 = _1433 || _1435;
    float _1439 = _1425 + _1397;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1449 = _1445 || _1447;
    float _1451 = _1439 * _1407;
    float _1453 = _1451 * 0.5;
    float _1455 = -_1117;
    float _1457 = _1455 + _1385;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1461 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1459);
    bool _1463 = _1427 > 0.0;
    float _1465 = 1.0 / _1461;
    float _1467 = _1427;
    float _1469 = _1453;
    float _1471 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1473 = _1391;
    float _1475 = _1395;
    if (!_1463)
    {
        _1467 = _1457;
    }
    float _1477 = _1467;
    float _1479 = _1477;
    if (!_1463)
    {
        _1469 = _1415;
    }
    float _1481 = _1469;
    float _1483 = _1481;
    if (!_1463)
    {
        _1471 = _1423;
    }
    float _1485 = _1471;
    bool _1487 = !_1463;
    float _1489 = _1485;
    float _1491 = _1485;
    if (!_1487)
    {
        float _1493 = _239 * _239;
        float _1495 = fma(_231, _231, _1493);
        float _1497 = rsqrt(_1419);
        float _1499 = fma(_245, _245, _1495);
        float _1501 = sqrt(_1499);
        float _1503 = _1395 * _1497;
        float _1505 = _1391 * _1497;
        float _1507 = _1405 * _1497;
        bool _1509 = _1501 > 0.0;
        float _1511 = _1497;
        float _1513 = _1501;
        if (!_1509)
        {
            _1511 = _1457;
        }
        float _1515 = _1511;
        _1479 = _1515;
        if (!_1509)
        {
            _1513 = _1415;
        }
        float _1517 = _1513;
        _1483 = _1517;
        if (!_1509)
        {
            _1489 = _1423;
        }
        float _1519 = _1489;
        bool _1521 = !_1509;
        _1491 = _1519;
        if (!_1521)
        {
            float _1523 = rsqrt(_1499);
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1527 = _239 * _1523;
            float _1529 = _231 * _1523;
            float _1531 = _1505 * _1527;
            float _1533 = _245 * _1523;
            float _1535 = fma(_1503, _1529, _1531);
            float _1537 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1539 = fma(_1507, _1533, _1535);
            float _1541 = _1539 * _1537;
            float _1543 = fma(_231, _1541, _1457);
            float _1545 = fma(_239, _1541, _1415);
            float _1547 = fma(_245, _1541, _1423);
            _1479 = _1543;
            _1483 = _1545;
            _1491 = _1547;
        }
    }
    float _1549 = _1479;
    float _1551 = _1483;
    float _1553 = _1491;
    float _1555 = _1551;
    float _1557 = _1549;
    float _1559 = _1553;
    if (_1449)
    {
        _1473 = 1.0;
    }
    float _1561 = _1473;
    float _1563 = _1561;
    if (!_1437)
    {
        float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1567 = _1287 + _1565;
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1571 = _1313 + _1569;
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1575 = _1567 * _1567;
        float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1579 = _1277 + _1577;
        float _1581 = fma(_1571, _1571, _1575);
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1585 = fma(_1579, _1579, _1581);
        float _1587 = sqrt(_1585);
        float _1589 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1591 = precise::min(_1587, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1593 = _1591 * _1583;
        float _1595 = -_1313;
        float _1597 = _1595 + _1549;
        float _1599 = _1589 * _1593;
        float _1601 = -_1287;
        float _1603 = _1601 + _1551;
        float _1605 = -_1277;
        float _1607 = _1605 + _1553;
        float _1609 = fma(_1597, _1599, _1313);
        float _1611 = fma(_1603, _1599, _1287);
        float _1613 = fma(_1607, _1599, _1277);
        _1555 = _1611;
        _1557 = _1609;
        _1559 = _1613;
    }
    float _1615 = _1555;
    float _1617 = _1557;
    float _1619 = _1559;
    if (_1449)
    {
        _1331 = 1.0;
    }
    float _1621 = _1331;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1625 = _1465 * _1623;
    float _1627 = _1621;
    if (!_1449)
    {
        float _1629 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1631 = _1629 * 0.15915493667125701904296875;
        float _1633 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1635 = _1631 * 6.283185482025146484375;
        float _1637 = cos(_1635);
        float _1639 = _1633 * 0.15915493667125701904296875;
        float _1641 = _1631 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = 1.0 / _1637;
        float _1647 = _1639 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = _1639 * 6.283185482025146484375;
        float _1655 = sin(_1653);
        float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1659 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1657;
        float _1661 = _1649 * _1651;
        float _1663 = 1.0 / _1659;
        float _1665 = 1.0 / _1661;
        float _1667 = _1655 * _1665;
        float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1671 = fma(_1625, _1667, _1669);
        float _1673 = _1671 * _1663;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        _1563 = _1675;
    }
    float _1677 = _1563;
    if (!_1449)
    {
        float _1679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = _1679 * 0.15915493667125701904296875;
        float _1683 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1685 = _1681 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1683 * 0.15915493667125701904296875;
        float _1691 = _1681 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = 1.0 / _1687;
        float _1697 = _1689 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = _1689 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = 1.0 / _1707;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1713 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1711;
        float _1715 = 1.0 / _1713;
        float _1717 = _1705 * _1709;
        float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1721 = fma(_1625, _1717, _1719);
        float _1723 = _1721 * _1715;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        float _1727 = -_1725;
        float _1729 = _1727 + 1.0;
        _1627 = _1729;
    }
    float _1731 = _1627;
    float _1733 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1735 = _1615 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1739 = _1617 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1743 = _1619 + _1741;
    float _1745 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1747 = _1735 * _1735;
    float _1749 = fma(_1387, 6.2500002968590706586837768554688e-05, 0.5);
    float _1751 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1745);
    float _1753 = fma(_1739, _1739, _1747);
    float _1755 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1751);
    float _1757 = fma(_1743, _1743, _1753);
    float _1759 = rsqrt(_1757);
    float _1761 = sqrt(_1757);
    float _1763 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1765 = _1739 * _1763;
    float _1767 = _1743 * _1763;
    float _1769 = _1765 * _1765;
    float _1771 = _1767 * _1767;
    float _1773 = _1769 + _1771;
    float _1775 = sqrt(_1773);
    bool _1777 = _1775 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1781 = _1775 + _1779;
    float _1783 = _1743;
    float _1785 = _1773;
    float _1787 = _1781;
    float _1789 = _1747;
    float _1791 = _1735;
    if (_1777)
    {
        float _1793 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1783 = _1793;
    }
    float _1795 = _1783;
    if (_1777)
    {
        float _1797 = rsqrt(_1773);
        _1785 = _1797;
    }
    float _1799 = _1785;
    float _1801 = _1799;
    if (_1777)
    {
        float _1803 = _1781 * _1795;
        _1787 = _1803;
    }
    float _1805 = _1787;
    if (_1777)
    {
        float _1807 = _1805 * 0.15915493667125701904296875;
        _1789 = _1807;
    }
    float _1809 = _1789;
    float _1811 = _1795;
    float _1813 = _1809;
    if (_1777)
    {
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = precise::max(0.0, _1821);
    float _1825 = _1759;
    float _1827 = _1823;
    if (_1777)
    {
        float _1829 = _1809 * 6.283185482025146484375;
        float _1831 = cos(_1829);
        _1825 = _1831;
    }
    float _1833 = _1825;
    float _1835 = -_1763;
    float _1837 = -_1823;
    float _1839 = fma(_1735, _1835, _1837);
    float _1841 = _1839;
    if (_1777)
    {
        float _1843 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1843;
    }
    float _1845 = _1827;
    if (!_1777)
    {
        _1813 = _1769;
    }
    float _1847 = _1813;
    float _1849 = _1819;
    float _1851 = _1847;
    if (_1777)
    {
        float _1853 = fma(_1819, _1845, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1853;
    }
    float _1855 = _1849;
    float _1857 = _1855;
    float _1859 = _1833;
    if (_1777)
    {
        float _1861 = _1833 + (-1.0);
        _1791 = _1861;
    }
    float _1863 = _1791;
    float _1865 = _1863;
    if (_1777)
    {
        float _1867 = _1799 * _1855;
        _1475 = _1867;
    }
    float _1869 = _1475;
    if (!_1777)
    {
        _1857 = _1765;
    }
    float _1871 = _1857;
    float _1873 = _1871;
    if (_1777)
    {
        float _1875 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1777)
    {
        float _1879 = _1765 * _1869;
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1777)
    {
        _1801 = _1767;
    }
    float _1883 = _1801;
    float _1885 = _1883;
    if (_1777)
    {
        float _1887 = _1767 * _1869;
        _1885 = _1887;
    }
    float _1889 = _1885;
    if (_1777)
    {
        float _1891 = fma(_1839, _1833, _1877);
        _1841 = _1891;
    }
    float _1893 = _1841;
    if (_1777)
    {
        float _1895 = _1881 * _1881;
        _1851 = _1895;
    }
    float _1897 = _1851;
    if (!_1777)
    {
        _1859 = _1771;
    }
    float _1899 = _1859;
    float _1901 = _1899;
    if (_1777)
    {
        float _1903 = _1889 * _1889;
        _1901 = _1903;
    }
    float _1905 = _1901;
    float _1907 = fma(_1893, _1893, _1897);
    float _1909 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1911 = _1907 + _1905;
    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1915 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1913);
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1909);
    float _1921 = rsqrt(_1911);
    float _1923 = -_1917;
    float _1925 = _1923 + 1.0;
    float _1927 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1919);
    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1935 = fma(_1313, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1937 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1929);
    float _1939 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1943 = abs(_1925);
    float _1945 = log2(_1943);
    float _1947 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1937);
    float _1949 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1939);
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1953 = _1921 * _1881;
    float _1955 = _1921 * _1893;
    float _1957 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1949);
    float _1959 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1963 = -_1951;
    float _1965 = fma(_1963, _1933, 1.0);
    float _1967 = floor(_1935);
    float _1969 = _1921 * _1889;
    float _1971 = -_1961;
    float _1973 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1971);
    float _1975 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1977 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1979 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1981 = -_1969;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1973);
    float _1985 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1987 = floor(_1927);
    float _1989 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1977);
    float _1991 = fma(_1983, -0.5, 0.5);
    float _1993 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _1995 = exp2(_1979);
    float _1997 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1993);
    float _1999 = -_1967;
    float _2001 = _1935 + _1999;
    float _2003 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2005 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2003);
    float _2007 = log2(_1965);
    float _2009 = -_1987;
    float _2011 = _1927 + _2009;
    float _2013 = _1955 + 1.0;
    float _2015 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2017 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2015);
    float _2019 = sqrt(_1991);
    float _2021 = fma(_1983, 0.5, 0.5);
    float _2023 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2025 = -_1955;
    float _2027 = fma(_1995, _2013, _2025);
    float _2029 = fma(_2021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2031 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2023);
    float _2033 = fma(_2027, 0.5, 0.5);
    float _2035 = 1.0 / _1997;
    float _2037 = fma(_2021, _2029, -0.212114393711090087890625);
    float _2039 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2031);
    float _2041 = _2007 * 0.693147182464599609375;
    float _2043 = fma(_2021, _2037, 1.570728778839111328125);
    float _2045 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2039);
    float _2047 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2049 = _2019 * 0.636619746685028076171875;
    float _2051 = fma(_1385, 6.2500002968590706586837768554688e-05, 0.5);
    float _2053 = -_2043;
    float _2055 = fma(_2049, _2053, 1.0);
    float _2057 = _2017 * _2035;
    float _2059 = _2045 * _2035;
    float _2061 = fma(_2057, 0.5, 0.5);
    float _2063 = fma(_2059, -0.5, 0.5);
    float2 _6536 = float2(_2001, _2011);
    float _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6536, float2(0.0), isnan(_6536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6536, float2(0.0), isnan(_6536)), level(0.0)).x;
    float3 _6547 = float3(_2061, _2063, _2047);
    float _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6547, float3(0.0), isnan(_6547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6547, float3(0.0), isnan(_6547)), level(0.0)).x;
    float3 _6558 = float3(_2061, _2063, _2047);
    float4 _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6558, float3(0.0), isnan(_6558)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6558, float3(0.0), isnan(_6558)), level(0.0)).xyzw;
    float _2072 = _2070.x;
    float _2074 = _2070.y;
    float _2076 = _2070.z;
    float _2078 = _2070.w;
    float2 _6574 = float2(_2055, _2033);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6574, float2(0.0), isnan(_6574)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6574, float2(0.0), isnan(_6574)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float2 _6588 = float2(_2051, _1749);
    float3 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = float(uint(_925));
    float _2100 = trunc(_1037);
    int _2102 = int(_2100);
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2106 = _2104 != 0;
    float _2108 = _1033 * _173;
    bool _2110 = _163 > 0.5;
    float _2112 = -_989;
    float _2114 = _2112 + 1.0;
    bool _2116 = _755 > 0.5;
    float _2118 = -_921;
    float _2120 = _2118 + 1.0;
    int _2122 = abs(_859);
    float _2124 = 1.0 / _2098;
    out.m_80.x = _1313;
    out.m_80.y = _1287;
    out.m_80.z = _1277;
    int _2126 = ~_925;
    int _2128 = _2126 + 1;
    float _2130 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2136 = trunc(_2108);
    int _2138 = int(_2136);
    float _2140 = float(uint(_2102));
    out.m_82.w = _1091;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2144 = _2142 != 0;
    float _2146 = float(_2102);
    float _2148 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = 1.0 / _2134;
    int _2152 = as_type<int>(_2124) + (-2);
    float _2154 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    bool _2156 = _2146 >= _1023;
    bool _2158 = isnan(_2146);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(_1023);
    bool _2164 = _2160 || _2162;
    float _2166 = float(_2164);
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2170 = _2168 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2172 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2174 = isnan(_741);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    float _2184 = as_type<float>(_2152) * _2140;
    bool _2186 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2188 = isnan(_741);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2194 = _2190 || _2192;
    float _2196 = float(_2194);
    float _2198 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2200 = trunc(_2166);
    int _2202 = int(_2200);
    out.m_84.x = _1205;
    out.m_86.x = _1617;
    out.m_86.y = _1615;
    out.m_86.z = _1619;
    float _2204 = trunc(_2184);
    float _2206 = precise::max(_2204, 0.0);
    uint _2209 = uint(_2206);
    float _2211 = 1.0 / _2170;
    int _2213 = ~_925;
    int _2215 = _2213 + 1;
    int _2217 = ~_2202;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    int _2223 = _2128 * int(_2209);
    int _2225 = _2223 + _2102;
    float _2227 = exp2(_2130);
    float _2229 = float(uint(_2225));
    float _2231 = as_type<float>(_2152) * _2229;
    bool _2233 = !_2144;
    float _2235 = _2233 ? 7.345489978790283203125 : 1.0;
    float _2237 = trunc(_2231);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = -_2227;
    float _2245 = _2243 + 1.0;
    float _2247 = _2235 * _163;
    float _2249 = floor(_2247);
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2257 = _2255 != 0;
    int _2259 = int(_2209) + int(_2241);
    float _2261 = 1.0 / _2253;
    int _2263 = _2215 * _2259;
    int _2265 = _2263 + _2102;
    float _2267 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2271 = -_2249;
    float _2273 = _2247 + _2271;
    bool _2275 = !_2257;
    int _2277 = _2275 ? 0 : 1;
    bool _2279 = uint(_2265) >= uint(_925);
    float _2281 = _2273 * _1023;
    float _2283 = 1.0 / _2269;
    bool _2285 = !_2279;
    int _2287 = _2285 ? 0 : (-1);
    bool _2289 = _925 == 0;
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2291;
    int _2295 = ~_2259;
    int _2297 = _2295 + _2287;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2277);
    float _2303 = trunc(_2281);
    int _2305 = int(_2303);
    float _2307 = _2293 * _2211;
    int _2309 = _925 * _2299;
    int _2311 = _2309 + _2102;
    int _2313 = _925 + (-1);
    bool _2315 = !_2289;
    int _2317 = _2315 ? _2311 : (-1);
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2321 = _2319 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2325 = _2323 != 0;
    int _2327 = _2317 * _2221;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2333 = 1.0 / _2321;
    int _2335 = _2202 * _2313;
    int _2337 = _2335 + _2327;
    float _2339 = _2331 * _2261;
    int _2341 = abs(_865);
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2345 = _2343 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2347 = _2305 * _2301;
    int _2349 = _2347 + _2102;
    int _2351 = _2337 * _2341;
    int _2353 = abs(_929);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2361 = _741 + _2359;
    int _2363 = _2138 * _2122;
    int _2365 = _2363 + _2351;
    bool _2367 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2369 = isnan(_741);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = _2357 * _2333;
    bool _2381 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2383 = isnan(_741);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2389 = _2385 || _2387;
    float _2391 = float(_2389);
    int _2393 = _2349 * _2353;
    int _2395 = _2393 + _2365;
    bool _2397 = !_2106;
    int _2399 = _2397 ? 0 : 1;
    float _2401 = -_2377;
    float _2403 = _2401 + 1.0;
    float _2405 = fma(_2307, _2361, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2407 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2409 = isnan(_741);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2415 = _2411 || _2413;
    float _2417 = float(_2415);
    float _2419 = 1.0 / _2345;
    int _2421 = abs(_2399);
    float _2423 = _2391 * _2403;
    float _2425 = -_2391;
    float _2427 = _2425 + 1.0;
    bool _2429 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2431 = isnan(_741);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = -_2417;
    float _2443 = _2441 + 1.0;
    float _2445 = _2417 * _2427;
    bool _2447 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2449 = isnan(_741);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2465 = _2463 != 0;
    int _2467 = _2305 * _2421;
    int _2469 = _2467 + _2395;
    float _2471 = _2439 * _2443;
    float _2473 = -_2439;
    float _2475 = _2473 + 1.0;
    bool _2477 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2479 = isnan(_741);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2485 = _2481 || _2483;
    float _2487 = float(_2485);
    float _2489 = float(uint(_2469));
    float _2491 = _2457 * _2475;
    float _2493 = -_2457;
    float _2495 = _2493 + 1.0;
    float _2497 = -_2487;
    float _2499 = _2497 + 1.0;
    float _2501 = as_type<float>(_2152) * _2489;
    float _2503 = _2487 * _2495;
    float _2505 = _2182 * _2499;
    float _2507 = -_2182;
    float _2509 = _2507 + 1.0;
    float _2511 = trunc(_2501);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    int _2517 = ~_925;
    int _2519 = _2517 + 1;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2521;
    float _2525 = _2461 * _2419;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2531 = _2523 * _2150;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2535 = _741 + _2533;
    float _2537 = float(uint(_2349));
    float _2539 = _2196 * _2509;
    float _2541 = -_2196;
    float _2543 = _2541 + 1.0;
    float _2545 = fma(_2339, _2535, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2547 = _2529 * _2283;
    float _2549 = _2405 * _2539;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2553 = _741 + _2551;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2559 = _2519 * int(_2515);
    int _2561 = _2559 + _2469;
    float _2563 = fma(_2543, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2549);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2567 = _741 + _2565;
    float _2569 = fma(_2547, _2553, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2571 = float(uint(_2561));
    float _2573 = fma(_2379, _2567, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2575 = fma(_2545, _2505, _2563);
    float _2577 = as_type<float>(_2152) * _2537;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2581 = _741 + _2579;
    float _2583 = as_type<float>(_2152) * _2571;
    float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2587 = _741 + _2585;
    float _2589 = fma(_2573, _2503, _2575);
    float _2591 = -_235;
    int _2593 = _2116 ? as_type<int>(_2591) : as_type<int>(_235);
    float _2595 = trunc(_2577);
    float _2597 = precise::max(_2595, 0.0);
    uint _2599 = uint(_2597);
    float _2601 = fma(_2525, _2587, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2605 = _741 + _2603;
    float _2607 = -_243;
    int _2609 = _2110 ? as_type<int>(_2607) : as_type<int>(_243);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2611;
    int _2615 = ~_925;
    int _2617 = _2615 + 1;
    float _2619 = fma(_2601, _2491, _2589);
    float _2621 = fma(_2531, _2605, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2623 = trunc(_2583);
    float _2625 = precise::max(_2623, 0.0);
    uint _2627 = uint(_2625);
    int _2629 = ~_925;
    int _2631 = _2629 + 1;
    float _2633 = fma(_2621, _2471, _2619);
    float _2635 = fma(_2569, _2445, _2633);
    float _2637 = 1.0 / _2557;
    int _2639 = int(_2515) + int(_2627);
    bool _2641 = !_2465;
    float _2643 = _2641 ? _243 : as_type<float>(_2609);
    bool _2645 = !_2325;
    float _2647 = _2645 ? _235 : as_type<float>(_2593);
    float _2649 = _235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2651 = _2643 + 0.5;
    int _2653 = _2631 * int(_2599);
    int _2655 = _2653 + _2349;
    float _2657 = _2613 * _2637;
    float _2659 = _2647 + (-0.5);
    int _2661 = _2617 * _2639;
    int _2663 = _2661 + _2469;
    float _2665 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1005);
    float _2667 = float(uint(_2655));
    float _2669 = fma(_2657, _2581, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2671 = -_2659;
    float _2673 = -_1009;
    float _2675 = fma(_2671, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2673);
    bool _2677 = uint(_2663) >= uint(_925);
    float _2679 = -_2114;
    float _2681 = fma(_2643, _2679, _2665);
    float _2683 = as_type<float>(_2152) * _2667;
    float _2685 = fma(_2669, _2423, _2635);
    bool _2687 = !_2677;
    int _2689 = _2687 ? 0 : (-1);
    float _2691 = fma(_2647, _2120, _2675);
    float _2693 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2695 = ~_925;
    int _2697 = _2695 + 1;
    float _2699 = trunc(_2683);
    float _2701 = precise::max(_2699, 0.0);
    uint _2703 = uint(_2701);
    int _2705 = ~_2639;
    int _2707 = _2705 + _2689;
    int _2709 = _2707 + 1;
    out.m_88.x = _2681;
    out.m_88.y = _2691;
    float _2711 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2713 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2715 = fma(_2377, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2685);
    int _2717 = _925 * _2709;
    int _2719 = _2717 + _2469;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2723 = _2721 != 0;
    out.m_90.x = _2715;
    bool _2725 = !_2289;
    int _2727 = _2725 ? _2719 : (-1);
    float _2729 = -_1209;
    float _2731 = fma(_2729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2711);
    int _2733 = _2727 >> 31;
    int _2735 = int(_2599) + int(_2703);
    int _2737 = _2733 & 3;
    float _2739 = -_1209;
    float _2741 = fma(_2739, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2693);
    float _2743 = -_1209;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2713);
    int _2747 = _2697 * _2735;
    int _2749 = _2747 + _2349;
    int _2751 = _2727 + _2737;
    float _2753 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2755 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2741);
    float _2757 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2745);
    int _2759 = _2751 >> 2;
    float _2761 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    bool _2763 = uint(_2749) >= uint(_925);
    float _2765 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2731);
    int _2767 = _2759 << 4;
    int _2769 = _2767 + 368;
    float _2771 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2753);
    float _2773 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2775 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2777 = uint(int(uint(_2769) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    float _2793 = _2649 * _2755;
    int _2795 = _2727 & 3;
    bool _2797 = _2795 != 0;
    float _2799 = _2649 * _2765;
    int _2801 = _2727 & 3;
    bool _2803 = _2801 != 0;
    float _2805 = _2649 * _2757;
    float _2807 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2154);
    float _2809 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2811 = _2769 + 8;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    bool _2829 = uint(_2795) > 1u;
    float _2831 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2773);
    float _2833 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2809);
    float _2835 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2837 = abs(_1625);
    float _2839 = log2(_2837);
    int _2841 = _2803 ? 0 : 1;
    float _2843 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2771);
    bool _2845 = !_2763;
    int _2847 = _2845 ? 0 : (-1);
    float _2849 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    int _2851 = ~_2841;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    float _2857 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2831);
    bool _2859 = uint(_2795) >= 2u;
    float _2861 = fma(_2835, _2849, _2805);
    int _2863 = _2855;
    float _2865 = _2017;
    if (!_2829)
    {
        int _2867 = ~_2841;
        int _2869 = _2867 + 1;
        _2863 = _2869;
    }
    int _2871 = _2863;
    float _2873 = fma(_2835, _2807, _2793);
    bool _2875 = _2795 != 3;
    float _2877 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2761);
    int _2879 = ~_2735;
    int _2881 = _2879 + _2847;
    int _2883 = _2881 + 1;
    float _2885 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2775);
    int _2887 = _2859 ? 0 : 1;
    float _2889 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2891 = abs(_2871);
    int _2893 = _925 * _2883;
    int _2895 = _2893 + _2349;
    float _2897 = fma(_2835, _2843, _2799);
    bool _2899 = !_2797;
    int _2901 = _2899 ? 0 : 1;
    float _2903 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2885);
    int _2905 = ~_2887;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = exp2(_2889);
    bool _2913 = _2795 != 3;
    float _2915 = _2877 + _2897;
    int _2917 = _2909;
    if (_2875)
    {
        int _2919 = ~_2887;
        int _2921 = _2919 + 1;
        _2917 = _2921;
    }
    int _2923 = _2917;
    float _2925 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2927 = ~_2891;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    float _2933 = _2857 + _2873;
    int _2935 = abs(_2901);
    float _2937 = _2903 + _2861;
    bool _2939 = !_2913;
    int _2941 = _2939 ? 0 : (-1);
    float _2943 = -_2065;
    float _2945 = _2943 + 1.0;
    int _2947 = abs(_2923);
    int _2949 = _2931 * as_type<int>(_2791);
    int _2951 = ~_2935;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    out.m_92.x = _2092;
    out.m_92.y = _2094;
    out.m_92.z = _2096;
    bool _2957 = !_2723;
    int _2959 = _2957 ? 0 : 1;
    int _2961 = abs(_2941);
    int _2963 = _2955 * as_type<int>(_2783);
    int _2965 = _2963 + _2949;
    out.m_94.x = _2933;
    out.m_94.y = _2915;
    out.m_94.z = _2937;
    int _2967 = abs(_2959);
    int _2969 = ~_2947;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    float _2975 = fma(_2911, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2977 = precise::clamp(_2975, 0.0, 1.0);
    float _2979 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2981 = ~_2961;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2973 * as_type<int>(_2819);
    int _2989 = _2987 + _2965;
    int _2991 = ~_2967;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    float _2997 = fma(_2977, -2.0, 3.0);
    float _2999 = _2977 * _2977;
    int _3001 = _2985 * as_type<int>(_2827);
    int _3003 = _3001 + _2989;
    float _3005 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2979);
    bool _3007 = !_2289;
    int _3009 = _3007 ? _2895 : (-1);
    float _3011 = _2999 * _2997;
    int _3013 = _3003 * _2995;
    float _3015 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3005);
    float _3017 = in.m_96.x;
    float _3019 = -_3011;
    float _3021 = _3019 + 1.0;
    int _3023 = _3009 * _2967;
    int _3025 = _3023 + _3013;
    float _3027 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3015);
    bool _3029 = _1625 <= 8000.0;
    bool _3031 = isnan(_1625);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan(8000.0);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = fma(_3021, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3011);
    float _3043 = _1997 * 0.5;
    float _3045 = float(_3025);
    float _3047 = _3027 + _1997;
    float _3049 = _2017 + _1997;
    float _3051 = fma(_2045, -0.5, _3043);
    float _3053 = _3047 * 0.5;
    float _3055 = _3049 * 0.5;
    float _3057 = _3039 * _3041;
    out.m_98.x = _3045;
    float _3059 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_100.x = _3055;
    out.m_100.y = _3051;
    out.m_100.z = _3053;
    out.m_100.w = _1997;
    bool _3061 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3063 = isnan(_1761);
    bool _3065 = _3061 || _3063;
    bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3069 = _3065 || _3067;
    float _3071 = _2945 * _3059;
    float _3073 = precise::clamp(_3071, 0.0, 1.0);
    float _3075 = in.m_96.z;
    float _3077 = -_3073;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _2017;
    out.gl_Position.y = _2045;
    out.gl_Position.z = _3027;
    out.gl_Position.w = _1997;
    float _3081 = _3079 * _3017;
    float _3083 = _2925 * _2067;
    float _3085 = -_2925;
    float _3087 = _3085 + 1.0;
    float _3089 = _3053;
    float _3091 = _3081;
    if (!_3069)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _3089;
    float _3095 = _2078 * _3083;
    float _3097 = _2088 * _3083;
    float _3099 = _2078 * _3087;
    float _3101 = _1677 * _1731;
    float _3103 = fma(_2084, _3095, _2072);
    float _3105 = fma(_2086, _3095, _2074);
    float _3107 = fma(_2078, _3097, _2076);
    float _3109 = _3081 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3111 = _3101 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3113 = _3111;
    float _3115 = _3109;
    float _3117 = _3093;
    float _3119 = _3093;
    if (!_3069)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3121 = _3091;
    out.m_102.x = _3103;
    out.m_102.y = _3105;
    out.m_102.z = _3107;
    out.m_102.w = _3099;
    float _3123 = _3111 * _3075;
    float _3125 = _3075;
    float _3127 = _3121;
    float _3129 = _3121;
    if (!_3069)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3131 = _2865;
    out.m_104.x = _3109;
    float _3133 = _3131;
    float _3135 = _3131;
    if (!_3069)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3137 = _3125;
    float _3139 = _3137;
    float _3141 = _3137;
    if (!_3069)
    {
        _3113 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3143 = _3113;
    float _3145 = _3143;
    float _3147 = _3143;
    if (!_3069)
    {
        _3115 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3149 = _3115;
    bool _3151 = !_3069;
    float _3153 = _3149;
    float _3155 = _3149;
    if (!_3151)
    {
        bool _3157 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3159 = isnan(_1761);
        bool _3161 = _3157 || _3159;
        bool _3163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3165 = _3161 || _3163;
        if (!_3165)
        {
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3169 = _1761 + _3167;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3173 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3171;
            float _3175 = 1.0 / _3173;
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3197 = _3169 * _3175;
            float _3199 = precise::clamp(_3197, 0.0, 1.0);
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3205 = fma(_3199, _3179, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3207 = fma(_3199, _3203, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3209 = fma(_3199, _3183, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3211 = fma(_3199, _3187, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3213 = fma(_3199, _3191, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3215 = fma(_3199, _3195, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3135 = _3207;
            _3155 = _3213;
            _3129 = _3205;
            _3119 = _3211;
            _3141 = _3209;
            _3147 = _3215;
            _3217 = true;
        }
        else
        {
            bool _3219 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3221 = isnan(_1761);
            bool _3223 = _3219 || _3221;
            bool _3225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3227 = _3223 || _3225;
            if (!_3227)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3229 = _3127;
            _3129 = _3229;
            if (!_3227)
            {
                _3133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3231 = _3133;
            _3135 = _3231;
            if (!_3227)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3233 = _3139;
            _3141 = _3233;
            if (!_3227)
            {
                _3117 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3235 = _3117;
            _3119 = _3235;
            if (!_3227)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3237 = _3153;
            _3155 = _3237;
            if (!_3227)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3239 = _3145;
            bool _3241 = !_3227;
            _3147 = _3239;
            if (!_3241)
            {
                bool _3243 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3245 = isnan(_1761);
                bool _3247 = _3243 || _3245;
                bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3251 = _3247 || _3249;
                if (!_3251)
                {
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3255 = _1761 + _3253;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3259 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3257;
                    float _3261 = 1.0 / _3259;
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3283 = _3255 * _3261;
                    float _3285 = precise::clamp(_3283, 0.0, 1.0);
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3289 = _3287 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3291 = fma(_3285, _3265, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3293 = fma(_3285, _3289, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3295 = fma(_3285, _3269, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3297 = fma(_3285, _3273, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3299 = fma(_3285, _3277, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3301 = fma(_3285, _3281, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3135 = _3293;
                    _3155 = _3299;
                    _3129 = _3291;
                    _3119 = _3297;
                    _3141 = _3295;
                    _3147 = _3301;
                    _3217 = true;
                }
                else
                {
                    _3135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3119 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3217 = false;
    float _3303 = _3135;
    float _3305 = _3155;
    float _3307 = _3129;
    float _3309 = _3119;
    float _3311 = _3141;
    float _3313 = _3147;
    float _3315 = fma(_2915, -0.5, 0.5);
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = -_3303;
    float _3321 = _3319 + _3305;
    float _3323 = _3123 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3325 = -_3307;
    float _3327 = _3325 + _3309;
    float _3329 = fma(_3317, _3321, _3303);
    out.m_106.x = 0.0;
    float _3331 = -_3311;
    float _3333 = _3331 + _3313;
    float _3335 = fma(_3317, _3327, _3307);
    float _3337 = _3329 * 0.586610972881317138671875;
    out.m_55.x = _3323;
    bool _3339 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3341 = fma(_3317, _3333, _3311);
    float _3343 = fma(_3335, 0.298911988735198974609375, _3337);
    bool _3345 = _1677 > 0.0;
    bool _3347 = isnan(_1677);
    bool _3349 = _3345 || _3347;
    bool _3351 = isnan(0.0);
    bool _3353 = _3349 || _3351;
    float _3355 = fma(_3341, 0.114477999508380889892578125, _3343);
    bool _3357 = _1731 <= 0.0;
    bool _3359 = !_3353;
    bool _3361 = _3357 || _3359;
    float _3363 = -_3355;
    float _3365 = _3335 + _3363;
    float _3367 = -_3355;
    float _3369 = _3329 + _3367;
    float _3371 = -_3355;
    float _3373 = _3341 + _3371;
    float _3375 = fma(_3365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    float _3377 = fma(_3369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    float _3379 = fma(_3373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3355);
    bool _3381 = !_3339;
    if (!_3381)
    {
        float _3383 = -_1615;
        float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3387 = -_1617;
        float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3391 = -_1619;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3395 = _3385 * _3385;
        float _3397 = fma(_3389, _3389, _3395);
        float _3399 = fma(_3393, _3393, _3397);
        float _3401 = sqrt(_3399);
        float _3403 = rsqrt(_3399);
        float _3405 = -_3401;
        float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3409 = _3407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = _3389 * _3403;
        float _3415 = _3385 * _3403;
        float _3417 = abs(_3411);
        float _3419 = log2(_3417);
        float _3421 = _3393 * _3403;
        float _3423 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3425 = _2915 * _3415;
        float _3427 = -_3415;
        float _3429 = -_3423;
        float _3431 = fma(_3427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3429);
        float _3433 = fma(_2933, _3413, _3425);
        float _3435 = -_3421;
        float _3437 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3431);
        float _3439 = fma(_2937, _3421, _3433);
        float _3441 = precise::clamp(_3439, 0.0, 1.0);
        float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3445 = _3437 + _3443;
        float _3447 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3449 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3451 = precise::clamp(_3449, 0.0, 1.0);
        float _3453 = exp2(_3447);
        float _3455 = _3453 * _3451;
        float _3457 = _3441 * _3455;
        float _3459 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3461 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3463 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3459;
        out.m_106.y = _3461;
        out.m_106.z = _3463;
    }
    out.m_82.x = _3375;
    out.m_82.y = _3377;
    out.m_82.z = _3379;
    if (!_3361)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3465;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

